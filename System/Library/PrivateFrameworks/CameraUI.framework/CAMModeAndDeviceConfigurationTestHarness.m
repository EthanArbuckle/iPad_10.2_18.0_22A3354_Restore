@implementation CAMModeAndDeviceConfigurationTestHarness

- (CAMModeAndDeviceConfigurationTestHarness)initWithTestName:(id)a3
{
  CAMModeAndDeviceConfigurationTestHarness *v3;
  NSMutableArray *v4;
  NSMutableArray *modeChangeListeners;
  CAMModeAndDeviceConfigurationTestHarness *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMModeAndDeviceConfigurationTestHarness;
  v3 = -[CAMPerformanceTestHarness initWithTestName:](&v8, sel_initWithTestName_, a3);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    modeChangeListeners = v3->__modeChangeListeners;
    v3->__modeChangeListeners = v4;

    -[CAMModeAndDeviceConfigurationTestHarness setupListeners](v3, "setupListeners");
    v6 = v3;
  }

  return v3;
}

- (void)setupListeners
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleChangeToMode_, CFSTR("CAMPerformanceDidChangeToModeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleWillCloseViewfinderForReason_, CFSTR("CAMPerformanceWillCloseViewfinderNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleDidCloseViewfinderForReason_, CFSTR("CAMPerformanceDidCloseViewfinderNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleWillOpenViewfinderForReason_, CFSTR("CAMPerformanceWillOpenViewfinderNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleDidOpenViewfinderForReason_, CFSTR("CAMPerformanceDidOpenViewfinderNotification"), 0);

}

- (void)removeListeners
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)startTesting
{
  objc_super v3;

  -[CAMModeAndDeviceConfigurationTestHarness setupListeners](self, "setupListeners");
  v3.receiver = self;
  v3.super_class = (Class)CAMModeAndDeviceConfigurationTestHarness;
  -[CAMPerformanceTestHarness startTesting](&v3, sel_startTesting);
}

- (void)stopTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMModeAndDeviceConfigurationTestHarness;
  -[CAMPerformanceTestHarness stopTesting](&v3, sel_stopTesting);
  -[CAMModeAndDeviceConfigurationTestHarness removeListeners](self, "removeListeners");
}

- (void)_handleChangeToMode:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("mode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(v4, "intValue");

  objc_msgSend(v8, "valueForKey:", CFSTR("device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int)objc_msgSend(v6, "intValue");

  -[CAMModeAndDeviceConfigurationTestHarness handleChangeToMode:device:](self, "handleChangeToMode:device:", v5, v7);
}

- (void)_handleWillCloseViewfinderForReason:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("reason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(v4, "intValue");

  -[CAMModeAndDeviceConfigurationTestHarness handleWillCloseViewfinderForReason:](self, "handleWillCloseViewfinderForReason:", v5);
}

- (void)_handleDidCloseViewfinderForReason:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("reason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(v4, "intValue");

  -[CAMModeAndDeviceConfigurationTestHarness handleDidCloseViewfinderForReason:](self, "handleDidCloseViewfinderForReason:", v5);
}

- (void)_handleWillOpenViewfinderForReason:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("reason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(v4, "intValue");

  -[CAMModeAndDeviceConfigurationTestHarness handleWillOpenViewfinderForReason:](self, "handleWillOpenViewfinderForReason:", v5);
}

- (void)_handleDidOpenViewfinderForReason:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("reason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(v4, "intValue");

  -[CAMModeAndDeviceConfigurationTestHarness handleDidOpenViewfinderForReason:](self, "handleDidOpenViewfinderForReason:", v5);
}

- (void)handleChangeToMode:(int64_t)a3 device:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void (**v20)(void);
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a4 - 1) > 0xA)
    v5 = 0;
  else
    v5 = qword_1DB9A7CF8[a4 - 1];
  -[CAMModeAndDeviceConfigurationTestHarness _modeChangeListeners](self, "_modeChangeListeners");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v13, "desiredMode") == a3 && objc_msgSend(v13, "desiredDevicePosition") == v5)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        objc_msgSend(v19, "handler", (_QWORD)v21);
        v20 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v20[2]();

        objc_msgSend(v8, "removeObject:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

}

- (void)registerHandler:(id)a3 forChangeToMode:(int64_t)a4 devicePosition:(int64_t)a5
{
  id v8;
  void *v9;
  CAMModeAndDeviceConfigurationChangeListener *v10;

  v8 = a3;
  v10 = objc_alloc_init(CAMModeAndDeviceConfigurationChangeListener);
  -[CAMModeAndDeviceConfigurationChangeListener setDesiredMode:](v10, "setDesiredMode:", a4);
  -[CAMModeAndDeviceConfigurationChangeListener setDesiredDevicePosition:](v10, "setDesiredDevicePosition:", a5);
  -[CAMModeAndDeviceConfigurationChangeListener setHandler:](v10, "setHandler:", v8);

  -[CAMModeAndDeviceConfigurationTestHarness _modeChangeListeners](self, "_modeChangeListeners");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

- (NSMutableArray)_modeChangeListeners
{
  return self->__modeChangeListeners;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__modeChangeListeners, 0);
}

@end
