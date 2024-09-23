@implementation _DKScreenSharingMonitor

+ (id)eventStream
{
  return CFSTR("ScreenSharing");
}

+ (id)entitlements
{
  return 0;
}

- (_DKScreenSharingMonitor)init
{
  _DKScreenSharingMonitor *v2;
  uint64_t v3;
  AVOutputContext *outputContext;
  BMScreenSharingStream *v5;
  BMScreenSharingStream *screenSharingStream;
  NSObject *v7;
  AVOutputContext *v8;
  BMScreenSharingStream *v9;
  objc_super v11;
  uint8_t buf[4];
  AVOutputContext *v13;
  __int16 v14;
  BMScreenSharingStream *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)_DKScreenSharingMonitor;
  v2 = -[_DKMonitor init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDB25D8], "sharedSystemScreenContext");
    v3 = objc_claimAutoreleasedReturnValue();
    outputContext = v2->_outputContext;
    v2->_outputContext = (AVOutputContext *)v3;

    v5 = (BMScreenSharingStream *)objc_alloc_init(MEMORY[0x24BE0CD00]);
    screenSharingStream = v2->_screenSharingStream;
    v2->_screenSharingStream = v5;

    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v2->_outputContext;
      v9 = v2->_screenSharingStream;
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_219056000, v7, OS_LOG_TYPE_INFO, "Enabling screen mirroring monitor with AVOutputContext: %@, screenSharingStream %@", buf, 0x16u);
    }

  }
  return v2;
}

- (void)start
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKScreenSharingMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v3, sel_instantMonitorNeedsActivation))
    -[_DKScreenSharingMonitor registerForScreenMirroringNotifications](self, "registerForScreenMirroringNotifications");
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKScreenSharingMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKScreenSharingMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  AVOutputContext *outputContext;
  BMScreenSharingStream *screenSharingStream;

  outputContext = self->_outputContext;
  self->_outputContext = 0;

  screenSharingStream = self->_screenSharingStream;
  self->_screenSharingStream = 0;

}

- (void)registerForScreenMirroringNotifications
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDB1F00];
  -[_DKScreenSharingMonitor outputContext](self, "outputContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_mirroringDidChange_, v4, v5);

  -[_DKScreenSharingMonitor outputContext](self, "outputContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKScreenSharingMonitor setCurrentMirroringDeviceCount:](self, "setCurrentMirroringDeviceCount:", objc_msgSend(v7, "count"));

  objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[_DKScreenSharingMonitor currentMirroringDeviceCount](self, "currentMirroringDeviceCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_219056000, v8, OS_LOG_TYPE_INFO, "Registered for screen mirroring notifications with current device count: %@", (uint8_t *)&v10, 0xCu);

  }
}

- (void)mirroringDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[_DKMonitor queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46___DKScreenSharingMonitor_mirroringDidChange___block_invoke;
  block[3] = &unk_24DA66D10;
  block[4] = self;
  dispatch_async(v4, block);

}

- (AVOutputContext)outputContext
{
  return self->_outputContext;
}

- (void)setOutputContext:(id)a3
{
  objc_storeStrong((id *)&self->_outputContext, a3);
}

- (BMScreenSharingStream)screenSharingStream
{
  return self->_screenSharingStream;
}

- (void)setScreenSharingStream:(id)a3
{
  objc_storeStrong((id *)&self->_screenSharingStream, a3);
}

- (int64_t)currentMirroringDeviceCount
{
  return self->_currentMirroringDeviceCount;
}

- (void)setCurrentMirroringDeviceCount:(int64_t)a3
{
  self->_currentMirroringDeviceCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenSharingStream, 0);
  objc_storeStrong((id *)&self->_outputContext, 0);
}

@end
