@implementation AVVCPrepareRecordSettings

- (AVVCPrepareRecordSettings)initWithStreamID:(unint64_t)a3 settings:(id)a4 bufferDuration:(double)a5
{
  id v8;
  AVVCPrepareRecordSettings *v9;
  AVVCPrepareRecordSettings *v10;
  uint64_t v11;
  NSDictionary *avAudioSettings;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVVCPrepareRecordSettings;
  v9 = -[AVVCPrepareRecordSettings init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_streamID = a3;
    v11 = objc_msgSend(v8, "copy");
    avAudioSettings = v10->_avAudioSettings;
    v10->_avAudioSettings = (NSDictionary *)v11;

    v10->_recordBufferDuration = a5;
    v10->_deviceBufferFrameSize = 0;
  }

  return v10;
}

- (unint64_t)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unint64_t)a3
{
  self->_streamID = a3;
}

- (NSDictionary)avAudioSettings
{
  return self->_avAudioSettings;
}

- (void)setAvAudioSettings:(id)a3
{
  objc_storeStrong((id *)&self->_avAudioSettings, a3);
}

- (double)recordBufferDuration
{
  return self->_recordBufferDuration;
}

- (void)setRecordBufferDuration:(double)a3
{
  self->_recordBufferDuration = a3;
}

- (BOOL)meteringEnabled
{
  return self->_meteringEnabled;
}

- (void)setMeteringEnabled:(BOOL)a3
{
  self->_meteringEnabled = a3;
}

- (unsigned)deviceBufferFrameSize
{
  return self->_deviceBufferFrameSize;
}

- (void)setDeviceBufferFrameSize:(unsigned int)a3
{
  self->_deviceBufferFrameSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avAudioSettings, 0);
}

@end
