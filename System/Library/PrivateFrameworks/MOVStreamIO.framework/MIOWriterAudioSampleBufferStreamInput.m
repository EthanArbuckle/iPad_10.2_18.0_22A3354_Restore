@implementation MIOWriterAudioSampleBufferStreamInput

- (MIOWriterAudioSampleBufferStreamInput)init
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("❌ ERROR: Do not call -[%@ init]."), v4);

  return 0;
}

- (MIOWriterAudioSampleBufferStreamInput)initWithStreamId:(id)a3 audioFormat:(id)a4 additionalSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  MIOWriterAudioSampleBufferStreamInput *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *config;
  MIOWriterAudioSampleBufferStreamInput *v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "formatDescription");
  if (v11)
  {
    v20.receiver = self;
    v20.super_class = (Class)MIOWriterAudioSampleBufferStreamInput;
    v12 = -[MIOWriterSampleBufferStreamInput initWithStreamId:format:](&v20, sel_initWithStreamId_format_, v8, v11);
    if (v12)
    {
      +[MOVStreamIOUtility audioNoneEncoderConfig](MOVStreamIOUtility, "audioNoneEncoderConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v14, "setObject:forKey:", v9, CFSTR("AudioFormatObject"));
      if (v10)
        objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("AdditionalAudioSettings"));
      v15 = objc_msgSend(v14, "copy");
      config = v12->_config;
      v12->_config = (NSDictionary *)v15;

    }
    self = v12;
    v17 = self;
  }
  else
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v18, OS_LOG_TYPE_ERROR, "Invalid audioFormat, no format description found.", buf, 2u);
    }

    v17 = 0;
  }

  return v17;
}

- (BOOL)applyWriterTimeScaleToSampleInput
{
  return 0;
}

- (id)sampleInputOutputSettings
{
  void *v2;
  void *v3;

  +[MIOOutputSettingsFactory outputSettingsWithConfig:formatDescription:defaultFrameRate:preferEncoderConfig:enableAVEHighPerformanceProfile:](MIOOutputSettingsFactory, "outputSettingsWithConfig:formatDescription:defaultFrameRate:preferEncoderConfig:enableAVEHighPerformanceProfile:", self->_config, -[MIOWriterSampleBufferStreamInput formatDescription](self, "formatDescription"), 0, 0, 30.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)appendAudioBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  void *v7;
  BOOL v8;
  CMTime v10;
  CMTime v11;

  memset(&v11, 0, sizeof(v11));
  CMSampleBufferGetPresentationTimeStamp(&v11, a3);
  v10 = v11;
  objc_msgSend(MEMORY[0x24BDB26C0], "attachmentsMIOTimedMetadataGroupForSampleBuffer:pts:error:", a3, &v10, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a4)
    v8 = 0;
  else
    v8 = -[MIOWriterSampleBufferStreamInput appendSampleBuffer:metadataGroup:error:](self, "appendSampleBuffer:metadataGroup:error:", a3, v7, a4);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

@end
