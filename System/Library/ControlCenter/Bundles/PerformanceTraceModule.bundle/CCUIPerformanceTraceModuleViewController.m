@implementation CCUIPerformanceTraceModuleViewController

- (CCUIPerformanceTraceModuleViewController)init
{
  CCUIPerformanceTraceModuleViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIPerformanceTraceModuleViewController;
  result = -[CCUIPerformanceTraceModuleViewController init](&v3, sel_init);
  if (result)
    result->state = 0;
  return result;
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIPerformanceTraceModuleViewController;
  -[CCUIButtonModuleViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("waveform.path.ecg"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setGlyphImage:](self, "setGlyphImage:", v3);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setSelectedGlyphColor:](self, "setSelectedGlyphColor:", v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)preferredExpandedContentHeight
{
  return 0.0;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return 0;
}

- (void)artraceSession:(id)a3 didReceiveOutput:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = *MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_231014000, v5, OS_LOG_TYPE_DEFAULT, "Performance Trace: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)performanceTraceDidStart:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CCUIPerformanceTraceModuleViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_231015F40;
  v6[3] = &unk_24FFE1808;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)performanceTraceDidComplete:(id)a3 withToken:(id)a4 withError:(id)a5
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_231015FF8;
  block[3] = &unk_24FFE1830;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)artraceSessionDidComplete:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  TCArtraceSession *traceSession;
  _QWORD v9[4];
  id v10;
  CCUIPerformanceTraceModuleViewController *v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (self->_traceSession)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_231016138;
    block[3] = &unk_24FFE1808;
    block[4] = self;
    v13 = v5;
    v7 = v5;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
    traceSession = self->_traceSession;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = sub_2310161CC;
    v9[3] = &unk_24FFE1808;
    v10 = v4;
    v11 = self;
    -[TCArtraceSession displayTraceCompletedAlertWithSessionInfo:completion:](traceSession, "displayTraceCompletedAlertWithSessionInfo:completion:", v7, v9);

  }
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  id v6;
  unint64_t state;
  id v8;

  v8 = a3;
  v6 = a4;
  state = self->state;
  if (state == 2)
  {
    -[CCUIPerformanceTraceModuleViewController _stopRecording](self, "_stopRecording");
  }
  else if (!state)
  {
    -[CCUIPerformanceTraceModuleViewController _startRecording](self, "_startRecording");
  }

}

- (id)_getFGSceneIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BE38438];
  objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "monitorWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "elements", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isUIApplicationElement"))
        {
          objc_msgSend(v12, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "invalidate");
  return v2;
}

- (void)_startRecording
{
  NSArray *v3;
  NSArray *traceStartScenes;
  TCArtraceSession *v5;
  TCArtraceSession *traceSession;
  _QWORD block[5];

  if (CCSIsInternalInstall())
  {
    -[CCUIPerformanceTraceModuleViewController _getFGSceneIdentifiers](self, "_getFGSceneIdentifiers");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    traceStartScenes = self->_traceStartScenes;
    self->_traceStartScenes = v3;

    if (qword_255EB2418 != -1)
      dispatch_once(&qword_255EB2418, &unk_24FFE1898);
    v5 = (TCArtraceSession *)objc_msgSend(objc_alloc((Class)objc_retainAutorelease((id)qword_255EB2410)), "initWithTraceOptions:", &unk_24FFE2430);
    traceSession = self->_traceSession;
    self->_traceSession = v5;

    -[TCArtraceSession setDelegate:](self->_traceSession, "setDelegate:", self);
    -[TCArtraceSession startTrace](self->_traceSession, "startTrace");
    -[CCUIPerformanceTraceModuleViewController _updateState:](self, "_updateState:", 2);
  }
  else
  {
    -[CCUIPerformanceTraceModuleViewController _updateState:](self, "_updateState:", 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_231016594;
    block[3] = &unk_24FFE1830;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

- (void)_stopRecording
{
  if (CCSIsInternalInstall())
  {
    if (self->_traceSession)
    {
      -[CCUIPerformanceTraceModuleViewController _updateState:](self, "_updateState:", 3);
      MEMORY[0x24BEDD108](self->_traceSession, sel_stopTrace);
    }
  }
  else if (self->_performanceTraceSession)
  {
    -[CCUIPerformanceTraceModuleViewController _updateState:](self, "_updateState:", 3);
    MEMORY[0x24BEDD108](self->_performanceTraceSession, sel_stopPerformanceTrace);
  }
}

- (void)_updateState:(int)a3
{
  BSDispatchMain();
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_performanceTraceSession, 0);
  objc_storeStrong((id *)&self->_traceStartScenes, 0);
  objc_storeStrong((id *)&self->_traceSession, 0);
}

@end
