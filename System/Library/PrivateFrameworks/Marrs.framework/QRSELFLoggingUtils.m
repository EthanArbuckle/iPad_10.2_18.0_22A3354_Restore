@implementation QRSELFLoggingUtils

+ (void)emitEvent:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "hasEventMetadata")
    && (objc_msgSend(v3, "eventMetadata"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "hasNlId"),
        v4,
        (v5 & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emitMessage:", v3);

    QRLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "eventMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nlId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "toNSUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = 136315394;
      v13 = "+[QRSELFLoggingUtils emitEvent:]";
      v14 = 2080;
      v15 = objc_msgSend(v11, "UTF8String");
      _os_log_debug_impl(&dword_1C281A000, v7, OS_LOG_TYPE_DEBUG, "%s Emitted event with NL ID: %s", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    QRLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315138;
      v13 = "+[QRSELFLoggingUtils emitEvent:]";
      _os_log_debug_impl(&dword_1C281A000, v7, OS_LOG_TYPE_DEBUG, "%s Due to NL ID being Nil, this event won't be emitted.", (uint8_t *)&v12, 0xCu);
    }
  }

}

+ (id)createEventMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithRequestId:(id)a5 andWithResultCandidateId:(id)a6 andWithRequester:(int)a7
{
  uint64_t v7;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v7 = *(_QWORD *)&a7;
  v22 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  QRLoggerForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v18 = 136315394;
    v19 = "+[QRSELFLoggingUtils createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:]";
    v20 = 1024;
    v21 = v7;
    _os_log_debug_impl(&dword_1C281A000, v15, OS_LOG_TYPE_DEBUG, "%s Emitted event with requester type: %d", (uint8_t *)&v18, 0x12u);
  }

  +[NLXMetadataGenerator createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:](NLXMetadataGenerator, "createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:", v11, v12, v13, v14, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)createCCQRContextEventWrapper:(id)a3 withMetaData:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v7, "setMarrsQueryRewriteContext:", v5);
  objc_msgSend(v7, "setEventMetadata:", v6);

  return v7;
}

+ (id)createRDContextEventWrapper:(id)a3 withMetaData:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v7, "setMarrsRepetitionDetectionContext:", v5);
  objc_msgSend(v7, "setEventMetadata:", v6);

  return v7;
}

+ (id)createCCQRContextEvaluatedEvent:(QRResponse *)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3->var0.var1 != a3->var0.var0)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      v13 = objc_alloc_init(MEMORY[0x1E0D99DC8]);
      objc_msgSend(v13, "setConfidence:", *(double *)&a3->var0.var0->var1.var0.var1.var0[v11]);
      objc_msgSend(v13, "setRewriteType:", objc_msgSend(a1, "convertRewriteType:", LODWORD(a3->var0.var0->var1.var0.var1.var0[v11 + 1])));
      objc_msgSend(v10, "addObject:", v13);

      ++v12;
      v11 += 7;
    }
    while (v12 < 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
  }
  v14 = objc_alloc_init(MEMORY[0x1E0D99DB0]);
  objc_msgSend(v14, "setQueryRewriteHypotheses:", v10);
  objc_msgSend(v14, "setLinkId:", v9);
  v15 = objc_alloc_init(MEMORY[0x1E0D99DA8]);
  objc_msgSend(v15, "setEnded:", v14);
  objc_msgSend(a1, "createCCQRContextEventWrapper:withMetaData:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)createRDContextEvaluatedEvent:(QRResponse *)a3 withNLXMetadata:(id)a4
{
  id v6;
  id v7;
  double var2;
  double var3;
  double var4;
  id v11;
  void *v12;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D99DE0]);
  objc_msgSend(v7, "setRepetitionType:", objc_msgSend(a1, "convertRepetitionType:", a3->var1));
  var2 = a3->var2;
  *(float *)&var2 = var2;
  objc_msgSend(v7, "setFullRepetitionConfidence:", var2);
  var3 = a3->var3;
  *(float *)&var3 = var3;
  objc_msgSend(v7, "setPartialRepetitionConfidence:", var3);
  var4 = a3->var4;
  *(float *)&var4 = var4;
  objc_msgSend(v7, "setNoRepetitionConfidence:", var4);
  v11 = objc_alloc_init(MEMORY[0x1E0D99DD8]);
  objc_msgSend(v11, "setEnded:", v7);
  objc_msgSend(a1, "createRDContextEventWrapper:withMetaData:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)createCCQRContextEvaluatedTier1Event:(QRResponse *)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7;
  id v8;
  id v9;
  QRHypothesis *var0;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  id v17;
  id v18;
  std::string __p;

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  var0 = a3->var0.var0;
  if (a3->var0.var1 != a3->var0.var0)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      v13 = (char *)var0 + v11;
      v14 = (uint64_t)&var0->var1 + v11;
      if (v13[39] < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v14, *((_QWORD *)v13 + 3));
      }
      else
      {
        v15 = *(_OWORD *)v14;
        __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v14 + 16);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v15;
      }
      +[MarrsSiriNLUTypesConverter stdString2NSString:](MarrsSiriNLUTypesConverter, "stdString2NSString:", &__p);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v16);

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      ++v12;
      var0 = a3->var0.var0;
      v11 += 56;
    }
    while (v12 < 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
  }
  v17 = objc_alloc_init(MEMORY[0x1E0D99DB8]);
  objc_msgSend(v17, "setRewrittenUserUtterances:", v9);
  objc_msgSend(v17, "setLinkId:", v8);
  v18 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v18, "setEventMetadata:", v7);
  objc_msgSend(v18, "setMarrsQueryRewriteEvaluatedTier1:", v17);

  return v18;
}

+ (BOOL)emitQueryRewriteStartedEventWithMetadata:(id)a3 byPredictorType:(int)a4
{
  id v6;
  char v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    v7 = objc_msgSend(a1, "emitRDStartedEventWithMetadata:", v6);
    goto LABEL_5;
  }
  if (a4 == 4)
  {
    v7 = objc_msgSend(a1, "emitCCQRStartedEventWithMetadata:", v6);
LABEL_5:
    v8 = v7;
    goto LABEL_9;
  }
  QRLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315138;
    v12 = "+[QRSELFLoggingUtils emitQueryRewriteStartedEventWithMetadata:byPredictorType:]";
    _os_log_debug_impl(&dword_1C281A000, v9, OS_LOG_TYPE_DEBUG, "%s Query rewrite SELF logging event with NoLogging type.", (uint8_t *)&v11, 0xCu);
  }

  v8 = 1;
LABEL_9:

  return v8;
}

+ (BOOL)emitCCQRStartedEventWithMetadata:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D99DD0]);
  objc_msgSend(v5, "setExists:", 1);
  v6 = objc_alloc_init(MEMORY[0x1E0D99DA8]);
  objc_msgSend(v6, "setStartedOrChanged:", v5);
  objc_msgSend(a1, "createCCQRContextEventWrapper:withMetaData:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "emitEvent:", v7);

  return 1;
}

+ (BOOL)emitRDStartedEventWithMetadata:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D99DF0]);
  objc_msgSend(v5, "setExists:", 1);
  v6 = objc_alloc_init(MEMORY[0x1E0D99DD8]);
  objc_msgSend(v6, "setStartedOrChanged:", v5);
  objc_msgSend(a1, "createRDContextEventWrapper:withMetaData:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "emitEvent:", v7);

  return 1;
}

+ (BOOL)emitQueryRewriteEvaluatedEventWithResponse:(QRResponse *)a3 andNLXMetadata:(id)a4 byPredictorType:(int)a5
{
  id v8;
  _QWORD *v9;
  char v10;
  BOOL v11;
  NSObject *v12;
  _QWORD v14[3];
  __int128 v15;
  __int128 v16;
  int var5;
  _QWORD v18[3];
  __int128 v19;
  __int128 v20;
  int v21;
  _BYTE buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!a5)
  {
    memset(v14, 0, sizeof(v14));
    std::vector<marrs::qr::orchestration::QRHypothesis>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRHypothesis*,marrs::qr::orchestration::QRHypothesis*>((uint64_t)v14, (__int128 *)a3->var0.var0, (__int128 *)a3->var0.var1, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
    v15 = *(_OWORD *)&a3->var1;
    v16 = *(_OWORD *)&a3->var3;
    var5 = a3->var5;
    v9 = v14;
    v10 = objc_msgSend(a1, "emitRDEvaluatedEventWithResponse:andNLXMetadata:", v14, v8);
    goto LABEL_5;
  }
  if (a5 == 4)
  {
    memset(v18, 0, sizeof(v18));
    std::vector<marrs::qr::orchestration::QRHypothesis>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRHypothesis*,marrs::qr::orchestration::QRHypothesis*>((uint64_t)v18, (__int128 *)a3->var0.var0, (__int128 *)a3->var0.var1, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
    v19 = *(_OWORD *)&a3->var1;
    v20 = *(_OWORD *)&a3->var3;
    v21 = a3->var5;
    v9 = v18;
    v10 = objc_msgSend(a1, "emitCCQREvaluatedEventWithResponse:andNLXMetadata:", v18, v8);
LABEL_5:
    v11 = v10;
    *(_QWORD *)buf = v9;
    std::vector<marrs::qr::orchestration::QRHypothesis>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    goto LABEL_9;
  }
  QRLoggerForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "+[QRSELFLoggingUtils emitQueryRewriteEvaluatedEventWithResponse:andNLXMetadata:byPredictorType:]";
    _os_log_debug_impl(&dword_1C281A000, v12, OS_LOG_TYPE_DEBUG, "%s Query rewrite SELF logging event with NoLogging type.", buf, 0xCu);
  }

  v11 = 1;
LABEL_9:

  return v11;
}

+ (BOOL)emitCCQREvaluatedEventWithResponse:(QRResponse *)a3 andNLXMetadata:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  __int128 v10;
  void *v11;
  __int128 v12;
  void *v13;
  _QWORD v15[3];
  __int128 v16;
  __int128 v17;
  int v18;
  _QWORD v19[3];
  __int128 v20;
  __int128 v21;
  int var5;
  void **v23;

  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0D9A500]);
  v8 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v9 = (void *)objc_msgSend(v7, "initWithNSUUID:", v8);

  memset(v19, 0, sizeof(v19));
  std::vector<marrs::qr::orchestration::QRHypothesis>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRHypothesis*,marrs::qr::orchestration::QRHypothesis*>((uint64_t)v19, (__int128 *)a3->var0.var0, (__int128 *)a3->var0.var1, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
  v10 = *(_OWORD *)&a3->var3;
  v20 = *(_OWORD *)&a3->var1;
  v21 = v10;
  var5 = a3->var5;
  objc_msgSend(a1, "createCCQRContextEvaluatedEvent:withNLXMetadata:andLinkId:", v19, v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void **)v19;
  std::vector<marrs::qr::orchestration::QRHypothesis>::__destroy_vector::operator()[abi:ne180100](&v23);
  memset(v15, 0, sizeof(v15));
  std::vector<marrs::qr::orchestration::QRHypothesis>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRHypothesis*,marrs::qr::orchestration::QRHypothesis*>((uint64_t)v15, (__int128 *)a3->var0.var0, (__int128 *)a3->var0.var1, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
  v12 = *(_OWORD *)&a3->var3;
  v16 = *(_OWORD *)&a3->var1;
  v17 = v12;
  v18 = a3->var5;
  objc_msgSend(a1, "createCCQRContextEvaluatedTier1Event:withNLXMetadata:andLinkId:", v15, v6, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void **)v15;
  std::vector<marrs::qr::orchestration::QRHypothesis>::__destroy_vector::operator()[abi:ne180100](&v23);
  objc_msgSend(a1, "emitEvent:", v11);
  objc_msgSend(a1, "emitEvent:", v13);

  return 1;
}

+ (BOOL)emitRDEvaluatedEventWithResponse:(QRResponse *)a3 andNLXMetadata:(id)a4
{
  id v6;
  __int128 v7;
  void *v8;
  _QWORD v10[3];
  __int128 v11;
  __int128 v12;
  int var5;
  void **v14;

  v6 = a4;
  memset(v10, 0, sizeof(v10));
  std::vector<marrs::qr::orchestration::QRHypothesis>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRHypothesis*,marrs::qr::orchestration::QRHypothesis*>((uint64_t)v10, (__int128 *)a3->var0.var0, (__int128 *)a3->var0.var1, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
  v7 = *(_OWORD *)&a3->var3;
  v11 = *(_OWORD *)&a3->var1;
  v12 = v7;
  var5 = a3->var5;
  objc_msgSend(a1, "createRDContextEvaluatedEvent:withNLXMetadata:", v10, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void **)v10;
  std::vector<marrs::qr::orchestration::QRHypothesis>::__destroy_vector::operator()[abi:ne180100](&v14);
  objc_msgSend(a1, "emitEvent:", v8);

  return 1;
}

+ (BOOL)emitQueryRewriteFailedEventWithMetadata:(id)a3 andErrorCode:(int64_t)a4 byPredictorType:(int)a5
{
  id v8;
  char v9;
  BOOL v10;
  NSObject *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!a5)
  {
    v9 = objc_msgSend(a1, "emitRDFailedEventWithMetadata:andErrorCode:", v8, a4);
    goto LABEL_5;
  }
  if (a5 == 4)
  {
    v9 = objc_msgSend(a1, "emitCCQRFailedEventWithMetadata:andErrorCode:", v8, a4);
LABEL_5:
    v10 = v9;
    goto LABEL_9;
  }
  QRLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "+[QRSELFLoggingUtils emitQueryRewriteFailedEventWithMetadata:andErrorCode:byPredictorType:]";
    _os_log_debug_impl(&dword_1C281A000, v11, OS_LOG_TYPE_DEBUG, "%s Query rewrite SELF logging event with NoLogging type.", (uint8_t *)&v13, 0xCu);
  }

  v10 = 1;
LABEL_9:

  return v10;
}

+ (BOOL)emitCCQRFailedEventWithMetadata:(id)a3 andErrorCode:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D99DC0]);
  objc_msgSend(v7, "setReason:", objc_msgSend(a1, "convertMarrsErrorCode:", a4));
  v8 = objc_alloc_init(MEMORY[0x1E0D99DA8]);
  objc_msgSend(v8, "setFailed:", v7);
  objc_msgSend(a1, "createCCQRContextEventWrapper:withMetaData:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "emitEvent:", v9);

  return 1;
}

+ (BOOL)emitRDFailedEventWithMetadata:(id)a3 andErrorCode:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D99DE8]);
  objc_msgSend(v7, "setReason:", objc_msgSend(a1, "convertMarrsErrorCode:", a4));
  v8 = objc_alloc_init(MEMORY[0x1E0D99DD8]);
  objc_msgSend(v8, "setFailed:", v7);
  objc_msgSend(a1, "createRDContextEventWrapper:withMetaData:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "emitEvent:", v9);

  return 1;
}

+ (int)convertMarrsErrorCode:(int64_t)a3
{
  if (a3 == 129)
    return 1;
  else
    return 2 * (a3 == 137);
}

+ (int)convertRepetitionType:(int)a3
{
  if ((a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (int)convertRewriteType:(int)a3
{
  if (a3 == 2)
    return 1;
  else
    return 2 * (a3 == 1);
}

+ (id)convertUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8[1] = objc_msgSend(v3, "highInt", objc_msgSend(v3, "lowInt"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v8);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
