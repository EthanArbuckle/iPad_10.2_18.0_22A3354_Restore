@implementation CSSelfTriggerController

- (CSSelfTriggerController)initWithTargetQueue:(id)a3 audioTapProvider:(id)a4 avvcRefChannelAvailable:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  CSSelfTriggerController *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  NSMutableArray *enabledStates;
  uint64_t v15;
  CSSelfTriggerDetector *v16;
  CSSelfTriggerDetector *selfTriggerWithAVVCAudioSource;
  CSSelfTriggerDetector *v18;
  CSSelfTriggerDetector *selfTriggerWithTapAudioSource;
  objc_super v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CSSelfTriggerController;
  v10 = -[CSSelfTriggerController init](&v21, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueue:qualityOfService:", CFSTR("CSSelfTriggerController Queue"), 33);
    v11 = objc_claimAutoreleasedReturnValue();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v13 = objc_claimAutoreleasedReturnValue();
    enabledStates = v10->_enabledStates;
    v10->_enabledStates = (NSMutableArray *)v13;

    v15 = MEMORY[0x1E0C9AAA0];
    -[NSMutableArray addObject:](v10->_enabledStates, "addObject:", MEMORY[0x1E0C9AAA0]);
    -[NSMutableArray addObject:](v10->_enabledStates, "addObject:", v15);
    if (v5)
    {
      v16 = -[CSSelfTriggerDetector initWithTargetQueue:audioTapProvider:audioSourceType:]([CSSelfTriggerDetector alloc], "initWithTargetQueue:audioTapProvider:audioSourceType:", v8, 0, 0);
      selfTriggerWithAVVCAudioSource = v10->_selfTriggerWithAVVCAudioSource;
      v10->_selfTriggerWithAVVCAudioSource = v16;

    }
    if (v9)
    {
      v18 = -[CSSelfTriggerDetector initWithTargetQueue:audioTapProvider:audioSourceType:]([CSSelfTriggerDetector alloc], "initWithTargetQueue:audioTapProvider:audioSourceType:", v8, v9, 1);
      selfTriggerWithTapAudioSource = v10->_selfTriggerWithTapAudioSource;
      v10->_selfTriggerWithTapAudioSource = v18;

    }
  }

  return v10;
}

- (void)start
{
  uint64_t v3;
  CSPolicy *v4;
  CSPolicy *enabledPolicyWithAVVCAudioSource;
  CSPolicy *v6;
  CSPolicy *v7;
  CSPolicy *enabledPolicyWithTapAudioSource;
  CSPolicy *v9;
  NSObject *queue;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  -[CSSelfTriggerDetector start](self->_selfTriggerWithAVVCAudioSource, "start");
  -[CSSelfTriggerDetector start](self->_selfTriggerWithTapAudioSource, "start");
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  if (self->_selfTriggerWithAVVCAudioSource)
  {
    +[CSSelfTriggerDetectorEnabledPolicyFactory selfTriggerDetectorEnabledPolicyWithAudioSourceType:](CSSelfTriggerDetectorEnabledPolicyFactory, "selfTriggerDetectorEnabledPolicyWithAudioSourceType:", 0);
    v4 = (CSPolicy *)objc_claimAutoreleasedReturnValue();
    enabledPolicyWithAVVCAudioSource = self->_enabledPolicyWithAVVCAudioSource;
    self->_enabledPolicyWithAVVCAudioSource = v4;

    v6 = self->_enabledPolicyWithAVVCAudioSource;
    v14[0] = v3;
    v14[1] = 3221225472;
    v14[2] = __32__CSSelfTriggerController_start__block_invoke;
    v14[3] = &unk_1E7C26D40;
    objc_copyWeak(&v15, &location);
    -[CSPolicy setCallback:](v6, "setCallback:", v14);
    objc_destroyWeak(&v15);
  }
  if (self->_selfTriggerWithTapAudioSource)
  {
    +[CSSelfTriggerDetectorEnabledPolicyFactory selfTriggerDetectorEnabledPolicyWithAudioSourceType:](CSSelfTriggerDetectorEnabledPolicyFactory, "selfTriggerDetectorEnabledPolicyWithAudioSourceType:", 1);
    v7 = (CSPolicy *)objc_claimAutoreleasedReturnValue();
    enabledPolicyWithTapAudioSource = self->_enabledPolicyWithTapAudioSource;
    self->_enabledPolicyWithTapAudioSource = v7;

    v9 = self->_enabledPolicyWithTapAudioSource;
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __32__CSSelfTriggerController_start__block_invoke_2;
    v12[3] = &unk_1E7C26D40;
    objc_copyWeak(&v13, &location);
    -[CSPolicy setCallback:](v9, "setCallback:", v12);
    objc_destroyWeak(&v13);
  }
  queue = self->_queue;
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __32__CSSelfTriggerController_start__block_invoke_3;
  v11[3] = &unk_1E7C292C8;
  v11[4] = self;
  dispatch_async(queue, v11);
  objc_destroyWeak(&location);
}

- (void)_handleEnabledPolicyEventForAudioSourceType:(unint64_t)a3 enabled:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CSSelfTriggerController__handleEnabledPolicyEventForAudioSourceType_enabled___block_invoke;
  block[3] = &unk_1E7C284A8;
  v6 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (void)_handleEnabledStatesUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *enabledStates;
  void *v7;
  int v8;
  void *v9;
  int v10;
  CSSelfTriggerDetector *selfTriggerWithTapAudioSource;
  uint64_t *v12;
  CSSelfTriggerDetector *selfTriggerWithAVVCAudioSource;
  CSSelfTriggerDetector *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  CSSelfTriggerController *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  CSSelfTriggerController *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  NSMutableArray *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    enabledStates = self->_enabledStates;
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSSelfTriggerController _handleEnabledStatesUpdate:]";
    v27 = 2114;
    v28 = enabledStates;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s enabledStates : %{public}@", buf, 0x16u);
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (!v8)
  {
    selfTriggerWithAVVCAudioSource = self->_selfTriggerWithAVVCAudioSource;
    if (!v10)
    {
      -[CSSelfTriggerDetector stopAnalyzeWithCompletion:](selfTriggerWithAVVCAudioSource, "stopAnalyzeWithCompletion:", 0);
      selfTriggerWithTapAudioSource = self->_selfTriggerWithTapAudioSource;
      v12 = 0;
      goto LABEL_12;
    }
    if (-[CSSelfTriggerDetector currentState](selfTriggerWithAVVCAudioSource, "currentState") == 1
      || -[CSSelfTriggerDetector currentState](self->_selfTriggerWithAVVCAudioSource, "currentState") == 2)
    {
      selfTriggerWithTapAudioSource = self->_selfTriggerWithAVVCAudioSource;
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __54__CSSelfTriggerController__handleEnabledStatesUpdate___block_invoke_2;
      v18 = &unk_1E7C29060;
      v19 = self;
      v12 = &v15;
      goto LABEL_12;
    }
    v14 = self->_selfTriggerWithTapAudioSource;
LABEL_16:
    -[CSSelfTriggerDetector startAnalyze](v14, "startAnalyze");
    goto LABEL_13;
  }
  if (-[CSSelfTriggerDetector currentState](self->_selfTriggerWithTapAudioSource, "currentState") != 1
    && -[CSSelfTriggerDetector currentState](self->_selfTriggerWithTapAudioSource, "currentState") != 2)
  {
    v14 = self->_selfTriggerWithAVVCAudioSource;
    goto LABEL_16;
  }
  selfTriggerWithTapAudioSource = self->_selfTriggerWithTapAudioSource;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __54__CSSelfTriggerController__handleEnabledStatesUpdate___block_invoke;
  v23 = &unk_1E7C29060;
  v24 = self;
  v12 = &v20;
LABEL_12:
  -[CSSelfTriggerDetector stopAnalyzeWithCompletion:](selfTriggerWithTapAudioSource, "stopAnalyzeWithCompletion:", v12, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
LABEL_13:

}

- (void)setAsset:(id)a3
{
  CSSelfTriggerDetector *selfTriggerWithAVVCAudioSource;
  id v5;

  selfTriggerWithAVVCAudioSource = self->_selfTriggerWithAVVCAudioSource;
  v5 = a3;
  -[CSSelfTriggerDetector setAsset:](selfTriggerWithAVVCAudioSource, "setAsset:", v5);
  -[CSSelfTriggerDetector setAsset:](self->_selfTriggerWithTapAudioSource, "setAsset:", v5);

}

- (void)registerObserver:(id)a3
{
  CSSelfTriggerDetector *selfTriggerWithAVVCAudioSource;
  id v5;

  selfTriggerWithAVVCAudioSource = self->_selfTriggerWithAVVCAudioSource;
  v5 = a3;
  -[CSSelfTriggerDetector registerObserver:](selfTriggerWithAVVCAudioSource, "registerObserver:", v5);
  -[CSSelfTriggerDetector registerObserver:](self->_selfTriggerWithTapAudioSource, "registerObserver:", v5);

}

- (void)unregisterObserver:(id)a3
{
  CSSelfTriggerDetector *selfTriggerWithAVVCAudioSource;
  id v5;

  selfTriggerWithAVVCAudioSource = self->_selfTriggerWithAVVCAudioSource;
  v5 = a3;
  -[CSSelfTriggerDetector unregisterObserver:](selfTriggerWithAVVCAudioSource, "unregisterObserver:", v5);
  -[CSSelfTriggerDetector unregisterObserver:](self->_selfTriggerWithTapAudioSource, "unregisterObserver:", v5);

}

- (CSPolicy)enabledPolicyWithAVVCAudioSource
{
  return self->_enabledPolicyWithAVVCAudioSource;
}

- (void)setEnabledPolicyWithAVVCAudioSource:(id)a3
{
  objc_storeStrong((id *)&self->_enabledPolicyWithAVVCAudioSource, a3);
}

- (CSPolicy)enabledPolicyWithTapAudioSource
{
  return self->_enabledPolicyWithTapAudioSource;
}

- (void)setEnabledPolicyWithTapAudioSource:(id)a3
{
  objc_storeStrong((id *)&self->_enabledPolicyWithTapAudioSource, a3);
}

- (CSSelfTriggerDetector)selfTriggerWithAVVCAudioSource
{
  return self->_selfTriggerWithAVVCAudioSource;
}

- (void)setSelfTriggerWithAVVCAudioSource:(id)a3
{
  objc_storeStrong((id *)&self->_selfTriggerWithAVVCAudioSource, a3);
}

- (CSSelfTriggerDetector)selfTriggerWithTapAudioSource
{
  return self->_selfTriggerWithTapAudioSource;
}

- (void)setSelfTriggerWithTapAudioSource:(id)a3
{
  objc_storeStrong((id *)&self->_selfTriggerWithTapAudioSource, a3);
}

- (NSMutableArray)enabledStates
{
  return self->_enabledStates;
}

- (void)setEnabledStates:(id)a3
{
  objc_storeStrong((id *)&self->_enabledStates, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_enabledStates, 0);
  objc_storeStrong((id *)&self->_selfTriggerWithTapAudioSource, 0);
  objc_storeStrong((id *)&self->_selfTriggerWithAVVCAudioSource, 0);
  objc_storeStrong((id *)&self->_enabledPolicyWithTapAudioSource, 0);
  objc_storeStrong((id *)&self->_enabledPolicyWithAVVCAudioSource, 0);
}

uint64_t __54__CSSelfTriggerController__handleEnabledStatesUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "startAnalyze");
}

uint64_t __54__CSSelfTriggerController__handleEnabledStatesUpdate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "startAnalyze");
}

void __79__CSSelfTriggerController__handleEnabledPolicyEventForAudioSourceType_enabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(obj, "addObject:", MEMORY[0x1E0C9AAA0]);
  objc_msgSend(obj, "addObject:", v2);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setObject:atIndexedSubscript:", v8, 0);

    v7 = (void *)MEMORY[0x1E0CB37E8];
    v6 = *(unsigned __int8 *)(a1 + 48);
  }
  else
  {
    if (v3)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setObject:atIndexedSubscript:", v4, 0);

    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEnabled");
    v7 = v5;
  }
  objc_msgSend(v7, "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:atIndexedSubscript:", v9, 1);

LABEL_6:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isEqualToArray:", obj) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), obj);
    objc_msgSend(*(id *)(a1 + 32), "_handleEnabledStatesUpdate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  }

}

void __32__CSSelfTriggerController_start__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleEnabledPolicyEventForAudioSourceType:enabled:", 0, a2);

}

void __32__CSSelfTriggerController_start__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleEnabledPolicyEventForAudioSourceType:enabled:", 1, a2);

}

uint64_t __32__CSSelfTriggerController_start__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:atIndexedSubscript:", v2, 0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:atIndexedSubscript:", v3, 1);

  return objc_msgSend(*(id *)(a1 + 32), "_handleEnabledStatesUpdate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

@end
