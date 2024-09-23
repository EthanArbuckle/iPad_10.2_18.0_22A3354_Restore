@implementation CRInsights

+ (id)sharedInsights
{
  _QWORD block[5];

  if (os_variant_has_internal_diagnostics())
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__CRInsights_sharedInsights__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (qword_254994330 != -1)
      dispatch_once(&qword_254994330, block);
  }
  return (id)_MergedGlobals_5;
}

void __28__CRInsights_sharedInsights__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.CoreRecognition.enable_shared_insights"));

  if (v3)
  {
    v4 = objc_alloc_init(*(Class *)(a1 + 32));
    v5 = (void *)_MergedGlobals_5;
    _MergedGlobals_5 = (uint64_t)v4;

  }
}

- (CRInsights)init
{
  CRInsights *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRInsights;
  v2 = -[CRInsights init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRInsights setThreadsToContexts:](v2, "setThreadsToContexts:", v3);

  }
  return v2;
}

- (id)currentContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueWithNonretainedObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRInsights threadsToContexts](self, "threadsToContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  -[CRInsights threadsToContexts](self, "threadsToContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v8;
}

- (id)takeContextSnapshot
{
  void *v2;
  CRInsightsContext *v3;

  -[CRInsights currentContext](self, "currentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[CRInsightsContext initWithContext:]([CRInsightsContext alloc], "initWithContext:", v2);
  else
    v3 = 0;

  return v3;
}

- (void)attachNewContextToCurrentThreadWithCameraReader:(id)a3
{
  id v4;
  CRInsightsContext *v5;

  v4 = a3;
  v5 = objc_alloc_init(CRInsightsContext);
  -[CRInsightsContext setCameraReader:](v5, "setCameraReader:", v4);

  -[CRInsights attachContextToCurrentThread:](self, "attachContextToCurrentThread:", v5);
}

- (void)attachContextToCurrentThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    v5 = (void *)MEMORY[0x24BDD1968];
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueWithNonretainedObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRInsights threadsToContexts](self, "threadsToContexts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v8);
    -[CRInsights threadsToContexts](self, "threadsToContexts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v7);

    objc_sync_exit(v8);
    v4 = v10;
  }

}

- (void)attachContextCopyToCurrentThread:(id)a3
{
  id v4;
  CRInsightsContext *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[CRInsightsContext initWithContext:]([CRInsightsContext alloc], "initWithContext:", v4);

    -[CRInsights attachContextToCurrentThread:](self, "attachContextToCurrentThread:", v5);
  }
}

- (void)resetContextForCurrentThread
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueWithNonretainedObject:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CRInsights threadsToContexts](self, "threadsToContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[CRInsights threadsToContexts](self, "threadsToContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

  objc_sync_exit(v5);
}

- (void)setContextValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRInsights currentContext](self, "currentContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (id)cameraReaderForCurrentThread
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueWithNonretainedObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRInsights threadsToContexts](self, "threadsToContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  -[CRInsights threadsToContexts](self, "threadsToContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cameraReader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v9;
}

- (void)notifySampleBufferProcessingStart:(opaqueCMSampleBuffer *)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  -[CRInsights delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CRInsights cameraReaderForCurrentThread](self, "cameraReaderForCurrentThread");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[CRInsights delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cameraReader:willProcessSampleBuffer:", v8, a3);

    }
  }
}

- (void)notifySampleBufferProcessingEnd:(opaqueCMSampleBuffer *)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[CRInsights delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CRInsights cameraReaderForCurrentThread](self, "cameraReaderForCurrentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CRInsights delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cameraReader:didProcessSampleBuffer:", v7, a3);

    }
  }
  -[CRInsights resetContextForCurrentThread](self, "resetContextForCurrentThread");
}

- (void)provideInsightValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[CRInsights delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRInsights cameraReaderForCurrentThread](self, "cameraReaderForCurrentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[CRInsights delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cameraReader:didProvideInsightValue:forKey:", v9, v11, v6);

    }
  }

}

- (id)enterSection:(id)a3 withDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  CRInsightsCodeSection *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[CRInsights delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CRInsights cameraReaderForCurrentThread](self, "cameraReaderForCurrentThread");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[CRInsightsCodeSection initWithName:andDescription:]([CRInsightsCodeSection alloc], "initWithName:andDescription:", v6, v7);
      -[CRInsights delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cameraReader:willRunSection:", v10, v11);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)leaveSection:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[CRInsights delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CRInsights cameraReaderForCurrentThread](self, "cameraReaderForCurrentThread");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[CRInsights delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "cameraReader:didRunSection:", v6, v8);

      }
    }
  }

}

- (id)allowOverrideWithKey:(id)a3 forResultFromBlock:(id)a4
{
  void (*v6)(id);
  id v7;
  void *v8;
  void *v9;

  v6 = (void (*)(id))*((_QWORD *)a4 + 2);
  v7 = a3;
  v6(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRInsights allowOverrideWithKey:forValue:](self, "allowOverrideWithKey:forValue:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)allowOverrideWithKey:(id)a3 forValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CRInsights delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0)
    goto LABEL_7;
  -[CRInsights cameraReaderForCurrentThread](self, "cameraReaderForCurrentThread");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_6:

LABEL_7:
    v13 = v7;
    goto LABEL_8;
  }
  -[CRInsights delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v12 = objc_msgSend(v11, "cameraReader:willAcceptOverride:forKey:", v10, &v15, v6);
  v13 = v15;

  if ((v12 & 1) == 0)
  {

    goto LABEL_6;
  }

LABEL_8:
  return v13;
}

+ (void)dispatchAsyncOnQueue:(id)a3 block:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  v6 = a3;
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "takeContextSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __41__CRInsights_dispatchAsyncOnQueue_block___block_invoke;
  v11[3] = &unk_24C58B400;
  v12 = v8;
  v13 = v5;
  v9 = v5;
  v10 = v8;
  dispatch_async(v6, v11);

}

uint64_t __41__CRInsights_dispatchAsyncOnQueue_block___block_invoke(uint64_t a1)
{
  void *v2;

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachContextCopyToCurrentThread:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (CRInsightsDelegate)delegate
{
  return (CRInsightsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)threadsToContexts
{
  return self->_threadsToContexts;
}

- (void)setThreadsToContexts:(id)a3
{
  objc_storeStrong((id *)&self->_threadsToContexts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadsToContexts, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
