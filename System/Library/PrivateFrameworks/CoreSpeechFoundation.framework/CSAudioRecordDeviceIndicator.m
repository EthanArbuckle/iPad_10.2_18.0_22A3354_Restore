@implementation CSAudioRecordDeviceIndicator

- (CSAudioRecordDeviceIndicator)initWithRecordContext:(id)a3 deviceId:(id)a4 shouldUseRemoteRecorder:(BOOL)a5 streamHandleId:(unint64_t)a6
{
  id v10;
  id v11;
  CSAudioRecordDeviceIndicator *v12;
  uint64_t v13;
  CSAudioRecordContext *recordContext;
  uint64_t v15;
  NSString *deviceId;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSAudioRecordDeviceIndicator;
  v12 = -[CSAudioRecordDeviceIndicator init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    recordContext = v12->_recordContext;
    v12->_recordContext = (CSAudioRecordContext *)v13;

    v15 = objc_msgSend(v11, "copy");
    deviceId = v12->_deviceId;
    v12->_deviceId = (NSString *)v15;

    v12->_shouldUseRemoteRecorder = a5;
    v12->_streamHandleId = a6;
  }

  return v12;
}

- (void)updateWithLatestRecordContext:(id)a3
{
  id v4;
  CSAudioRecordContext *v5;
  CSAudioRecordContext *recordContext;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSString *deviceId;
  NSString *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (CSAudioRecordContext *)objc_msgSend(v4, "copy");
  recordContext = self->_recordContext;
  self->_recordContext = v5;

  objc_msgSend(v4, "deviceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v4, "isBuiltInVoiceTriggered")
      && +[CSUtils hasRemoteBuiltInMic](CSUtils, "hasRemoteBuiltInMic")
      && self->_shouldUseRemoteRecorder)
    {
      v8 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        objc_msgSend(v4, "deviceId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 136315394;
        v14 = "-[CSAudioRecordDeviceIndicator updateWithLatestRecordContext:]";
        v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Replace deviceId(%{public}@) to nil for VoiceTrigger from Gibraltar.", (uint8_t *)&v13, 0x16u);

      }
      deviceId = self->_deviceId;
      self->_deviceId = 0;
    }
    else
    {
      objc_msgSend(v4, "deviceId");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      deviceId = self->_deviceId;
      self->_deviceId = v12;
    }

  }
}

- (void)updateDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceId, a3);
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (BOOL)shouldUseRemoteRecorder
{
  return self->_shouldUseRemoteRecorder;
}

- (unint64_t)streamHandleId
{
  return self->_streamHandleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_recordContext, 0);
}

@end
