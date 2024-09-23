@implementation CSAudioInjectionDevice

- (CSAudioInjectionDevice)initWithDeviceType:(int64_t)a3 deviceName:(id)a4 deviceID:(id)a5 productID:(id)a6
{
  id v10;
  id v11;
  id v12;
  CSAudioInjectionDevice *v13;
  CSAudioInjectionDevice *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *deviceName;
  uint64_t v19;
  NSString *deviceID;
  uint64_t v21;
  NSString *productIdentifier;
  uint64_t v23;
  NSUUID *deviceUID;
  objc_super v26;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CSAudioInjectionDevice;
  v13 = -[CSAudioInjectionDevice init](&v26, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_deviceType = a3;
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@_%@"), v16, CFSTR("injectionDevice"));
    v17 = objc_claimAutoreleasedReturnValue();
    deviceName = v14->_deviceName;
    v14->_deviceName = (NSString *)v17;

    v19 = objc_msgSend(v11, "copy");
    deviceID = v14->_deviceID;
    v14->_deviceID = (NSString *)v19;

    v21 = objc_msgSend(v12, "copy");
    productIdentifier = v14->_productIdentifier;
    v14->_productIdentifier = (NSString *)v21;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v23 = objc_claimAutoreleasedReturnValue();
    deviceUID = v14->_deviceUID;
    v14->_deviceUID = (NSUUID *)v23;

  }
  return v14;
}

- (BOOL)isPluginDevice
{
  return (unint64_t)(self->_deviceType - 5) < 4;
}

- (BOOL)speakAudio:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CSAudioInjectionDevice injectionEngine](self, "injectionEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "injectAudio:", v4);

  return v6;
}

- (BOOL)speakAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  char v15;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[CSAudioInjectionDevice injectionEngine](self, "injectionEngine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = a4;
  v15 = objc_msgSend(v13, "injectAudio:withScaleFactor:playbackStarted:completion:", v12, v11, v10, v14);

  return v15;
}

- (BOOL)speakAudio:(id)a3 withScaleFactor:(float)a4 outASBD:(AudioStreamBasicDescription *)a5 playbackStarted:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  _OWORD v18[2];
  uint64_t v19;

  v12 = a7;
  v13 = a6;
  v14 = a3;
  -[CSAudioInjectionDevice injectionEngine](self, "injectionEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a5->mBytesPerPacket;
  v18[0] = *(_OWORD *)&a5->mSampleRate;
  v18[1] = v16;
  v19 = *(_QWORD *)&a5->mBitsPerChannel;
  LOBYTE(a5) = objc_msgSend(v15, "injectAudio:withScaleFactor:outASBD:playbackStarted:completion:", v14, v18, v13, v12, COERCE_DOUBLE(__PAIR64__(DWORD1(v18[0]), LODWORD(a4))));

  return (char)a5;
}

- (BOOL)speakAudio:(id)a3 withScaleFactor:(float)a4 outASBD:(AudioStreamBasicDescription *)a5 playbackStarted:(id)a6 userIntentOptions:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  _OWORD v22[2];
  uint64_t v23;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a3;
  -[CSAudioInjectionDevice injectionEngine](self, "injectionEngine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUserIntentOptions:", v15);

  -[CSAudioInjectionDevice injectionEngine](self, "injectionEngine");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(_OWORD *)&a5->mBytesPerPacket;
  v22[0] = *(_OWORD *)&a5->mSampleRate;
  v22[1] = v20;
  v23 = *(_QWORD *)&a5->mBitsPerChannel;
  LOBYTE(a5) = objc_msgSend(v19, "injectAudio:withScaleFactor:outASBD:playbackStarted:completion:", v17, v22, v16, v14, COERCE_DOUBLE(__PAIR64__(DWORD1(v22[0]), LODWORD(a4))));

  return (char)a5;
}

- (void)setEnableAlwaysOnVoiceTrigger:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  self->_enableAlwaysOnVoiceTrigger = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_injectionEngine);
  objc_msgSend(WeakRetained, "setAlwaysOnVoiceTriggerEnabled:", v3);

}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSUUID)deviceUID
{
  return self->_deviceUID;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)enableAlwaysOnVoiceTrigger
{
  return self->_enableAlwaysOnVoiceTrigger;
}

- (CSAudioInjectionEngine)injectionEngine
{
  return (CSAudioInjectionEngine *)objc_loadWeakRetained((id *)&self->_injectionEngine);
}

- (void)setInjectionEngine:(id)a3
{
  objc_storeWeak((id *)&self->_injectionEngine, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_injectionEngine);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
