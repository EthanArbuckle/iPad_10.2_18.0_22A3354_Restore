@implementation ENExposureDetectionSession

+ (int64_t)authorizationStatus
{
  return +[ENManager authorizationStatus](ENManager, "authorizationStatus");
}

- (ENExposureDetectionSession)init
{
  ENExposureDetectionSession *v2;
  ENExposureConfiguration *v3;
  ENExposureConfiguration *configuration;
  ENExposureDetectionSession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ENExposureDetectionSession;
  v2 = -[ENExposureDetectionSession init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ENExposureConfiguration);
    configuration = v2->_configuration;
    v2->_configuration = v3;

    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v2->_maximumKeyCount = 1000;
    v5 = v2;
  }

  return v2;
}

- (ENExposureDetectionSession)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ENExposureDetectionSession *v7;
  void *v8;
  ENExposureConfiguration *v9;
  ENExposureConfiguration *configuration;
  ENExposureDetectionSession *v11;

  v6 = a3;
  v7 = -[ENExposureDetectionSession init](self, "init");
  if (!v7)
  {
    if (a4)
      goto LABEL_12;
    goto LABEL_13;
  }
  if (MEMORY[0x20BD2F7B8](v6) != MEMORY[0x24BDACFA0])
  {
    if (a4)
    {
LABEL_12:
      ENErrorF(2);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_8;
  }
  xpc_dictionary_get_value(v6, "expC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[ENExposureConfiguration initWithXPCObject:error:]([ENExposureConfiguration alloc], "initWithXPCObject:error:", v8, a4);
    if (!v9)
    {
      v11 = 0;
      goto LABEL_7;
    }
    configuration = v7->_configuration;
    v7->_configuration = v9;

  }
  v11 = v7;
LABEL_7:

LABEL_8:
  return v11;
}

- (void)encodeWithXPCObject:(id)a3
{
  ENExposureConfiguration *configuration;
  ENExposureConfiguration *v5;
  id v6;
  xpc_object_t value;

  configuration = self->_configuration;
  if (configuration)
  {
    v5 = configuration;
    v6 = a3;
    value = xpc_dictionary_create(0, 0, 0);
    -[ENExposureConfiguration encodeWithXPCObject:](v5, "encodeWithXPCObject:", value);

    xpc_dictionary_set_value(v6, "expC", value);
  }
}

- (void)dealloc
{
  ENExposureDetectionSession *v2;
  SEL v3;
  objc_super v4;

  if (self->_activateCalled && !self->_invalidateDone)
  {
    v2 = (ENExposureDetectionSession *)FatalErrorF();
    -[ENExposureDetectionSession description](v2, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ENExposureDetectionSession;
    -[ENExposureDetectionSession dealloc](&v4, sel_dealloc);
  }
}

- (id)description
{
  NSAppendPrintF_safe();
  return 0;
}

- (void)activateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__ENExposureDetectionSession_activateWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __60__ENExposureDetectionSession_activateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v2 + 8) || *(_BYTE *)(v2 + 9)) && (ENErrorF(10), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (id)v3;
    if (gLogCategory__ENExposureDetection <= 90
      && (gLogCategory__ENExposureDetection != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

  }
  else
  {
    if (gLogCategory_ENExposureDetection <= 30
      && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }
}

- (void)_activateWithCompletionHandler:(id)a3
{
  id v4;
  ENManager *v5;
  ENManager *manager;
  ENManager *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];

  v4 = a3;
  v5 = objc_alloc_init(ENManager);
  manager = self->_manager;
  self->_manager = v5;
  v7 = v5;

  -[ENManager setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__ENExposureDetectionSession__activateWithCompletionHandler___block_invoke;
  v12[3] = &unk_24C38AE38;
  v12[4] = self;
  -[ENManager setInvalidationHandler:](v7, "setInvalidationHandler:", v12);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __61__ENExposureDetectionSession__activateWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_24C38AE60;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[ENManager exposureDetectionActivate:completion:](v7, "exposureDetectionActivate:completion:", self, v10);

}

uint64_t __61__ENExposureDetectionSession__activateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __61__ENExposureDetectionSession__activateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    if (gLogCategory__ENExposureDetection <= 90
      && (gLogCategory__ENExposureDetection != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else if (gLogCategory_ENExposureDetection <= 30
         && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__ENExposureDetectionSession_invalidate__block_invoke;
  block[3] = &unk_24C38AE38;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__ENExposureDetectionSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  if (gLogCategory_ENExposureDetection <= 30)
  {
    if (gLogCategory_ENExposureDetection != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF_safe();
  }
  v2 = *(_QWORD *)(v1 + 32);
  if (!*(_BYTE *)(v2 + 9))
  {
    *(_BYTE *)(v2 + 9) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 24), "invalidate");
    return objc_msgSend(*(id *)(v1 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  id invalidationHandler;
  void *v4;
  int v5;
  uint64_t v6;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_manager)
  {
    v6 = MEMORY[0x20BD2F464](self->_invalidationHandler, a2);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    v4 = (void *)v6;
    if (v6)
    {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
      v4 = (void *)v6;
    }
    self->_invalidateDone = 1;
    if (gLogCategory_ENExposureDetection <= 30)
    {
      if (gLogCategory_ENExposureDetection != -1 || (v5 = _LogCategory_Initialize(), v4 = (void *)v6, v5))
      {
        LogPrintF_safe();
        v4 = (void *)v6;
      }
    }

  }
}

- (void)addDiagnosisKeys:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENExposureDetectionSession *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__ENExposureDetectionSession_addDiagnosisKeys_completionHandler___block_invoke;
  block[3] = &unk_24C38AEB0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __65__ENExposureDetectionSession_addDiagnosisKeys_completionHandler___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if ((!*(_BYTE *)(v4 + 8)
     || !*(_QWORD *)(v4 + 24)
     || *(_BYTE *)(v4 + 9)
     || *(_BYTE *)(v4 + 11)
     || v2 > *(_QWORD *)(v4 + 64) - *(_QWORD *)(v4 + 16))
    && (ENErrorF(10), v5 = objc_claimAutoreleasedReturnValue(), (v8 = (id)v5) != 0))
  {
    v14 = (id)v5;
    if (gLogCategory__ENExposureDetection <= 90)
    {
      if (gLogCategory__ENExposureDetection != -1 || (v9 = _LogCategory_Initialize(), v8 = v14, v9))
      {
        CUPrintNSError();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v8 = v14;
      }
    }
    (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v8, v6, v7);

  }
  else
  {
    if (gLogCategory_ENExposureDetection <= 30
      && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) += v3;
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(v10 + 24);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __65__ENExposureDetectionSession_addDiagnosisKeys_completionHandler___block_invoke_2;
    v15[3] = &unk_24C38AE88;
    v15[4] = v10;
    v17 = v3;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v12, "exposureDetectionAddKeys:completion:", v11, v15);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) += v3;

  }
}

uint64_t __65__ENExposureDetectionSession_addDiagnosisKeys_completionHandler___block_invoke_2(_QWORD *a1)
{
  *(_QWORD *)(a1[4] + 16) -= a1[6];
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)finishedDiagnosisKeysWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__ENExposureDetectionSession_finishedDiagnosisKeysWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __73__ENExposureDetectionSession_finishedDiagnosisKeysWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if ((!*(_BYTE *)(v2 + 8) || !*(_QWORD *)(v2 + 24) || *(_BYTE *)(v2 + 9) || *(_BYTE *)(v2 + 11))
    && (ENErrorF(10), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (id)v3;
    if (gLogCategory__ENExposureDetection <= 90
      && (gLogCategory__ENExposureDetection != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

  }
  else
  {
    if (gLogCategory_ENExposureDetection <= 30
      && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "exposureDetectionFinishWithCompletion:", *(_QWORD *)(a1 + 40));
  }
}

- (void)getExposureInfoWithMaximumCount:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__ENExposureDetectionSession_getExposureInfoWithMaximumCount_completionHandler___block_invoke;
  block[3] = &unk_24C38AED8;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __80__ENExposureDetectionSession_getExposureInfoWithMaximumCount_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = a1[4];
  if (!*(_BYTE *)(v2 + 8) || (v3 = *(void **)(v2 + 24)) == 0 || *(_BYTE *)(v2 + 9) || !*(_BYTE *)(v2 + 11))
  {
    ENErrorF(10);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (id)v4;
      (*(void (**)(void))(a1[5] + 16))();

      return;
    }
    v3 = *(void **)(a1[4] + 24);
  }
  objc_msgSend(v3, "exposureDetectionGetExposureInfoWithMaximumCount:completion:", a1[6], a1[5]);
}

- (double)estimateRiskWithExposureInfo:(id)a3 referenceTime:(double)a4 transmissionRiskLevel:(char *)a5 skip:(BOOL *)a6
{
  id v10;
  ENExposureConfiguration *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v10 = a3;
  v11 = self->_configuration;
  if ((-[ENExposureConfiguration flags](v11, "flags") & 2) != 0)
  {
    -[ENExposureDetectionSession scoreWithExposureInfo:skip:](self, "scoreWithExposureInfo:skip:", v10, a6);
    v23 = v22;
  }
  else
  {
    -[ENExposureConfiguration attenuationLevelValueWithAttenuation:](v11, "attenuationLevelValueWithAttenuation:", objc_msgSend(v10, "attenuationValue"));
    v13 = v12;
    objc_msgSend(v10, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "timeIntervalSinceReferenceDate");
      v17 = a4 - v16;
      if (v17 > 9.22337204e18)
        v17 = 9.22337204e18;
      v18 = v17 / 86400.0;
      v19 = v17 < 0.0;
      v20 = 0.0;
      if (!v19)
        v20 = v18;
      v21 = (uint64_t)v20;
    }
    else
    {
      v21 = 0;
    }
    -[ENExposureConfiguration daysSinceLastExposureLevelValueWithDays:](v11, "daysSinceLastExposureLevelValueWithDays:", v21);
    v25 = v24;
    objc_msgSend(v10, "duration");
    -[ENExposureConfiguration durationLevelValueWithDuration:](v11, "durationLevelValueWithDuration:");
    v27 = v26;
    -[ENExposureConfiguration transmissionLevelValueWithTransmissionRiskLevel:](v11, "transmissionLevelValueWithTransmissionRiskLevel:", objc_msgSend(v10, "transmissionRiskLevel"));
    v29 = v28;
    if (a5)
      *a5 = objc_msgSend(v10, "transmissionRiskLevel");
    v23 = v13 * v25 * v27 * v29;
    *a6 = 0;

  }
  return v23;
}

- (double)scoreWithExposureInfo:(id)a3 skip:(BOOL *)a4
{
  id v6;
  ENExposureConfiguration *v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  double v15;
  BOOL v17;

  v6 = a3;
  v7 = self->_configuration;
  v17 = 0;
  -[ENExposureConfiguration infectiousnessWeightWithDaysSinceOnsetOfSymptoms:skip:](v7, "infectiousnessWeightWithDaysSinceOnsetOfSymptoms:skip:", objc_msgSend(v6, "daysSinceOnsetOfSymptoms"), &v17);
  v9 = v17;
  *a4 = v17;
  v10 = 0.0;
  if (!v9)
  {
    v11 = v8;
    -[ENExposureConfiguration reportTypeWeightWithReportType:skip:](v7, "reportTypeWeightWithReportType:skip:", objc_msgSend(v6, "diagnosisReportType"), &v17);
    v13 = v17;
    *a4 = v17;
    if (!v13)
    {
      v14 = v12;
      -[ENExposureConfiguration weightedDurationWithExposureInfo:](v7, "weightedDurationWithExposureInfo:", v6);
      v10 = v14 / 100.0 * (v11 / 100.0 * v15);
    }
  }

  return v10;
}

- (void)updateDaySummary:(id)a3 exposureInfo:(id)a4 score:(double)a5
{
  id v8;
  ENExposureSummaryItem *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  ENExposureSummaryItem *v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a3;
  v8 = a4;
  objc_msgSend(v19, "daySummary");
  v9 = (ENExposureSummaryItem *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = objc_alloc_init(ENExposureSummaryItem);
    objc_msgSend(v19, "setDaySummary:", v9);
  }
  -[ENExposureConfiguration weightedDurationWithExposureInfo:](self->_configuration, "weightedDurationWithExposureInfo:", v8);
  v11 = v10;
  -[ENExposureSummaryItem maximumScore](v9, "maximumScore");
  if (v12 < a5)
    -[ENExposureSummaryItem setMaximumScore:](v9, "setMaximumScore:", a5);
  -[ENExposureSummaryItem scoreSum](v9, "scoreSum");
  -[ENExposureSummaryItem setScoreSum:](v9, "setScoreSum:", v13 + a5);
  -[ENExposureSummaryItem weightedDurationSum](v9, "weightedDurationSum");
  -[ENExposureSummaryItem setWeightedDurationSum:](v9, "setWeightedDurationSum:", v11 + v14);
  switch(-[ENExposureConfiguration mappedDiagnosisReportType:](self->_configuration, "mappedDiagnosisReportType:", objc_msgSend(v8, "diagnosisReportType")))
  {
    case 1u:
      objc_msgSend(v19, "confirmedTestSummary");
      v15 = (ENExposureSummaryItem *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v15 = objc_alloc_init(ENExposureSummaryItem);
        objc_msgSend(v19, "setConfirmedTestSummary:", v15);
      }
      break;
    case 2u:
      objc_msgSend(v19, "confirmedClinicalDiagnosisSummary");
      v15 = (ENExposureSummaryItem *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v15 = objc_alloc_init(ENExposureSummaryItem);
        objc_msgSend(v19, "setConfirmedClinicalDiagnosisSummary:", v15);
      }
      break;
    case 3u:
      objc_msgSend(v19, "selfReportedSummary");
      v15 = (ENExposureSummaryItem *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v15 = objc_alloc_init(ENExposureSummaryItem);
        objc_msgSend(v19, "setSelfReportedSummary:", v15);
      }
      break;
    case 4u:
      objc_msgSend(v19, "recursiveSummary");
      v15 = (ENExposureSummaryItem *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v15 = objc_alloc_init(ENExposureSummaryItem);
        objc_msgSend(v19, "setRecursiveSummary:", v15);
      }
      break;
    default:
      v15 = 0;
      break;
  }
  -[ENExposureSummaryItem maximumScore](v15, "maximumScore");
  if (v16 < a5)
    -[ENExposureSummaryItem setMaximumScore:](v15, "setMaximumScore:", a5);
  -[ENExposureSummaryItem scoreSum](v15, "scoreSum");
  -[ENExposureSummaryItem setScoreSum:](v15, "setScoreSum:", v17 + a5);
  -[ENExposureSummaryItem weightedDurationSum](v15, "weightedDurationSum");
  -[ENExposureSummaryItem setWeightedDurationSum:](v15, "setWeightedDurationSum:", v11 + v18);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ENExposureConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (unint64_t)maximumKeyCount
{
  return self->_maximumKeyCount;
}

- (void)setMaximumKeyCount:(unint64_t)a3
{
  self->_maximumKeyCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
