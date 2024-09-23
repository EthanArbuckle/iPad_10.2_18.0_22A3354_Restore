@implementation IMAVInterface

+ (id)sharedInstance
{
  if (qword_253DE94D0 != -1)
    dispatch_once(&qword_253DE94D0, &unk_24DA573E8);
  return (id)qword_253DE9500;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak(&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)IMAVInterface;
  -[IMAVInterface dealloc](&v3, sel_dealloc);
}

- (unsigned)overallChatState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend__callState(v5, v6, v7, v8, v9);

  return v10;
}

- (void)chatStateUpdated
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateOverallChatState(v9, v5, v6, v7, v8);

}

- (BOOL)isAVInterfaceReady
{
  return 1;
}

- (void)unsetDelegate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  IMAVInterface *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_delegate(self, v5, v6, v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    sub_2190076D0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134218242;
      v15 = v4;
      v16 = 2112;
      v17 = self;
      _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "Unsetting %p as the delegate on %@", (uint8_t *)&v14, 0x16u);
    }

    objc_msgSend_setDelegate_(self, v11, 0, v12, v13);
  }

}

- (BOOL)systemCanVideoChat
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((unint64_t)objc_msgSend_capabilities(self, a2, v2, v3, v4) >> 18) & 1;
}

- (BOOL)systemCanAudioChat
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((unint64_t)objc_msgSend_capabilities(self, a2, v2, v3, v4) >> 19) & 1;
}

- (BOOL)systemSupportsFrontFacingCamera
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  objc_msgSend_sharedInstance(MEMORY[0x24BE30338], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_supportsFrontFacingCamera(v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)systemSupportsBackFacingCamera
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  objc_msgSend_sharedInstance(MEMORY[0x24BE30338], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_supportsBackFacingCamera(v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)isMuteForAVChat:(id)a3
{
  return 0;
}

- (BOOL)isPausedForAVChat:(id)a3
{
  return 0;
}

- (BOOL)isRemoteMuteForAVChat:(id)a3
{
  return 0;
}

- (BOOL)isSendingAudioForAVChat:(id)a3
{
  return 1;
}

- (BOOL)isSendingVideoForAVChat:(id)a3
{
  return 1;
}

- (unint64_t)capabilities
{
  return 0;
}

- (BOOL)startPreviewWithError:(id *)a3
{
  if (a3)
    *a3 = 0;
  return 1;
}

- (BOOL)stopPreview
{
  return 1;
}

- (int)endConferenceForAVChat:(id)a3
{
  return -1;
}

- (int)avChat:(id)a3 endConferenceForUserID:(id)a4
{
  return -1;
}

- (BOOL)avChat:(id)a3 generateCallInfoForID:(id)a4 service:(id)a5 usingRelay:(BOOL)a6 callInfo:(id)a7
{
  return 0;
}

- (id)getNatIPFromICEData:(id)a3
{
  return 0;
}

- (id)natTypeForAVChat:(id)a3
{
  return 0;
}

- (id)avChat:(id)a3 IPAndPortDataWithCallerIPAndPortData:(id)a4 shouldFindExternalIP:(BOOL)a5
{
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDBCE50], sel_data, a3, a4, a5);
}

- (id)avChat:(id)a3 IPAndPortDataWithCallerIP:(id)a4 callerSIPPort:(unsigned int)a5 shouldFindExternalIP:(BOOL)a6
{
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDBCE50], sel_data, a3, a4, *(_QWORD *)&a5);
}

- (BOOL)supportsLayers
{
  return 0;
}

- (void)localVideoLayer
{
  return 0;
}

- (void)localVideoBackLayer
{
  return 0;
}

- (unsigned)maxBitrate
{
  return 0;
}

- (BOOL)supportsRelay
{
  return 0;
}

- (id)controller
{
  return 0;
}

- (id)_controller
{
  return (id)((uint64_t (*)(IMAVInterface *, char *))MEMORY[0x24BEDD108])(self, sel_controller);
}

- (BOOL)shouldKeepCameraRunning
{
  return 1;
}

- (BOOL)_submitLoggingInformation:(id)a3 forChat:(id)a4
{
  return 1;
}

- (BOOL)_submitEndCallMetric:(id)a3 forCallID:(int64_t)a4
{
  return 1;
}

- (int64_t)_checkNetworkForChat:(id)a3 requiresWifi:(BOOL)a4
{
  return -1;
}

- (int64_t)_runPingTestForChat:(id)a3
{
  return -1;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
}

@end
