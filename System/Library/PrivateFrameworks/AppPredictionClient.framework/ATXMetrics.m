@implementation ATXMetrics

+ (void)logError:(int64_t)a3 inContext:(int64_t)a4
{
  id v6;

  objc_msgSend(a1, "_sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_logError:inContext:", a3, a4);

}

+ (void)logActionViewForType:(int64_t)a3 inContext:(int64_t)a4
{
  id v6;

  objc_msgSend(a1, "_sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_logActionViewForType:inContext:", a3, a4);

}

+ (void)logActionExecuteForType:(int64_t)a3 inContext:(int64_t)a4
{
  id v6;

  objc_msgSend(a1, "_sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_logActionExecuteForType:inContext:", a3, a4);

}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1)
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_89);
  return (id)_sharedInstance_sSharedInstance;
}

void __29__ATXMetrics__sharedInstance__block_invoke()
{
  ATXMetrics *v0;
  void *v1;

  v0 = objc_alloc_init(ATXMetrics);
  v1 = (void *)_sharedInstance_sSharedInstance;
  _sharedInstance_sSharedInstance = (uint64_t)v0;

}

- (ATXMetrics)init
{
  ATXMetrics *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *loggingQueue;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PETScalarEventTracker *viewTracker;
  uint64_t v18;
  PETScalarEventTracker *executeTracker;
  uint64_t v20;
  PETScalarEventTracker *errorTracker;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[2];
  _QWORD v27[15];
  _QWORD v28[15];
  _QWORD v29[2];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[6];
  _QWORD v33[8];

  v33[6] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)ATXMetrics;
  v2 = -[ATXMetrics init](&v25, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(v5, v7);
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v8;

    v32[0] = &unk_1E4DC1A58;
    v32[1] = &unk_1E4DC1A70;
    v33[0] = CFSTR("unknown");
    v33[1] = CFSTR("atxnsua");
    v32[2] = &unk_1E4DC1A88;
    v32[3] = &unk_1E4DC1AA0;
    v33[2] = CFSTR("atxintent");
    v33[3] = CFSTR("nsua");
    v32[4] = &unk_1E4DC1AB8;
    v32[5] = &unk_1E4DC1AD0;
    v33[4] = CFSTR("intent");
    v33[5] = CFSTR("vs");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:enumMapping:", CFSTR("type"), v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = &unk_1E4DC1A58;
    v30[1] = &unk_1E4DC1A88;
    v31[0] = CFSTR("unknown");
    v31[1] = CFSTR("search");
    v30[2] = &unk_1E4DC1A70;
    v31[2] = CFSTR("notif");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:enumMapping:", CFSTR("ctx"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    v29[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = &unk_1E4DC1A58;
    v27[1] = &unk_1E4DC1A88;
    v28[0] = CFSTR("unknown");
    v28[1] = CFSTR("other");
    v27[2] = &unk_1E4DC1A70;
    v27[3] = &unk_1E4DC1AB8;
    v28[2] = CFSTR("dump");
    v28[3] = CFSTR("cia");
    v27[4] = &unk_1E4DC1AA0;
    v27[5] = &unk_1E4DC1AD0;
    v28[4] = CFSTR("exttimeout");
    v28[5] = CFSTR("extint");
    v27[6] = &unk_1E4DC1AE8;
    v27[7] = &unk_1E4DC1B00;
    v28[6] = CFSTR("proxyop");
    v28[7] = CFSTR("wfstop");
    v27[8] = &unk_1E4DC1B18;
    v27[9] = &unk_1E4DC1B30;
    v28[8] = CFSTR("cardcom");
    v28[9] = CFSTR("cardreq");
    v27[10] = &unk_1E4DC1B48;
    v27[11] = &unk_1E4DC1B60;
    v28[10] = CFSTR("infail");
    v28[11] = CFSTR("nilapp");
    v27[12] = &unk_1E4DC1B78;
    v27[13] = &unk_1E4DC1B90;
    v28[12] = CFSTR("deser");
    v28[13] = CFSTR("feedbk");
    v27[14] = &unk_1E4DC1BA8;
    v28[14] = CFSTR("noappname");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:enumMapping:", CFSTR("err"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictionUI"), CFSTR("View"), v12);
    viewTracker = v2->_viewTracker;
    v2->_viewTracker = (PETScalarEventTracker *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictionUI"), CFSTR("Execute"), v12);
    executeTracker = v2->_executeTracker;
    v2->_executeTracker = (PETScalarEventTracker *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictionUI"), CFSTR("Error"), v15);
    errorTracker = v2->_errorTracker;
    v2->_errorTracker = (PETScalarEventTracker *)v20;

  }
  return v2;
}

- (void)_logError:(int64_t)a3 inContext:(int64_t)a4
{
  NSObject *loggingQueue;
  _QWORD block[7];

  loggingQueue = self->_loggingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ATXMetrics__logError_inContext___block_invoke;
  block[3] = &unk_1E4D57710;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(loggingQueue, block);
}

void __34__ATXMetrics__logError_inContext___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackEventWithPropertyValues:", v5);

}

- (void)_logActionViewForType:(int64_t)a3 inContext:(int64_t)a4
{
  NSObject *loggingQueue;
  _QWORD block[7];

  loggingQueue = self->_loggingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ATXMetrics__logActionViewForType_inContext___block_invoke;
  block[3] = &unk_1E4D57710;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(loggingQueue, block);
}

void __46__ATXMetrics__logActionViewForType_inContext___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1[4] + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackEventWithPropertyValues:", v5);

}

- (void)_logActionExecuteForType:(int64_t)a3 inContext:(int64_t)a4
{
  NSObject *loggingQueue;
  _QWORD block[7];

  loggingQueue = self->_loggingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ATXMetrics__logActionExecuteForType_inContext___block_invoke;
  block[3] = &unk_1E4D57710;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(loggingQueue, block);
}

void __49__ATXMetrics__logActionExecuteForType_inContext___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1[4] + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackEventWithPropertyValues:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorTracker, 0);
  objc_storeStrong((id *)&self->_executeTracker, 0);
  objc_storeStrong((id *)&self->_viewTracker, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
}

@end
