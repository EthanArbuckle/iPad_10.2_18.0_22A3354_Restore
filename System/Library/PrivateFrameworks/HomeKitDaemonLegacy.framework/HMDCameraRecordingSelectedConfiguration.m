@implementation HMDCameraRecordingSelectedConfiguration

- (HMDCameraRecordingSelectedConfiguration)initWithGeneralConfiguration:(id)a3 videoCodecConfiguration:(id)a4 audioCodecConfiguration:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDCameraRecordingSelectedConfiguration *v12;
  HMDCameraRecordingSelectedConfiguration *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraRecordingSelectedConfiguration;
  v12 = -[HMDCameraRecordingSelectedConfiguration init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_generalConfiguration, a3);
    objc_storeStrong((id *)&v13->_videoConfiguration, a4);
    objc_storeStrong((id *)&v13->_audioConfiguration, a5);
  }

  return v13;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  HMDCameraRecordingGeneralConfiguration *v8;
  void *v9;
  HMDCameraRecordingGeneralConfiguration *v10;
  HMDCameraRecordingGeneralConfiguration *generalConfiguration;
  HMDCameraRecordingVideoCodecConfiguration *v12;
  void *v13;
  HMDCameraRecordingVideoCodecConfiguration *v14;
  HMDCameraRecordingVideoCodecConfiguration *videoConfiguration;
  HMDCameraRecordingAudioCodecConfiguration *v16;
  void *v17;
  HMDCameraRecordingAudioCodecConfiguration *v18;
  HMDCameraRecordingAudioCodecConfiguration *audioConfiguration;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 1, CFSTR("kSelectedConfigurationGeneral"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 2, CFSTR("kSelectedConfigurationVideo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 3, CFSTR("kSelectedConfigurationAudio"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v3;
  v21[1] = v4;
  v21[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPTLVBase _parse:](self, "_parse:", v6);
  if (v7)
  {
    v8 = [HMDCameraRecordingGeneralConfiguration alloc];
    objc_msgSend(v3, "field");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HAPTLVBase initWithTLVData:](v8, "initWithTLVData:", v9);
    generalConfiguration = self->_generalConfiguration;
    self->_generalConfiguration = v10;

    v12 = [HMDCameraRecordingVideoCodecConfiguration alloc];
    objc_msgSend(v4, "field");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HAPTLVBase initWithTLVData:](v12, "initWithTLVData:", v13);
    videoConfiguration = self->_videoConfiguration;
    self->_videoConfiguration = v14;

    v16 = [HMDCameraRecordingAudioCodecConfiguration alloc];
    objc_msgSend(v5, "field");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HAPTLVBase initWithTLVData:](v16, "initWithTLVData:", v17);
    audioConfiguration = self->_audioConfiguration;
    self->_audioConfiguration = v18;

  }
  return v7;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSelectedConfiguration generalConfiguration](self, "generalConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tlvData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:data:", 1, v5);

  -[HMDCameraRecordingSelectedConfiguration videoConfiguration](self, "videoConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tlvData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:data:", 2, v7);

  -[HMDCameraRecordingSelectedConfiguration audioConfiguration](self, "audioConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tlvData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:data:", 3, v9);

  objc_msgSend(v3, "serialize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v10;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@tlvDatablob = %@ "), v6, v8);

  -[HMDCameraRecordingSelectedConfiguration generalConfiguration](self, "generalConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptionWithIndent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@generalConfiguration = %@ "), v6, v10);

  -[HMDCameraRecordingSelectedConfiguration videoConfiguration](self, "videoConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptionWithIndent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@videoConfiguration = %@ "), v6, v12);

  -[HMDCameraRecordingSelectedConfiguration audioConfiguration](self, "audioConfiguration");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptionWithIndent:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@audioConfiguration = %@ "), v6, v13);

}

- (HMDCameraRecordingSelectedConfiguration)initWithCoder:(id)a3
{
  id v4;
  HMDCameraRecordingSelectedConfiguration *v5;
  uint64_t v6;
  HMDCameraRecordingGeneralConfiguration *generalConfiguration;
  uint64_t v8;
  HMDCameraRecordingVideoCodecConfiguration *videoConfiguration;
  uint64_t v10;
  HMDCameraRecordingAudioCodecConfiguration *audioConfiguration;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCameraRecordingSelectedConfiguration;
  v5 = -[HMDCameraRecordingSelectedConfiguration init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSelectedConfigurationGeneral"));
    v6 = objc_claimAutoreleasedReturnValue();
    generalConfiguration = v5->_generalConfiguration;
    v5->_generalConfiguration = (HMDCameraRecordingGeneralConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSelectedConfigurationVideo"));
    v8 = objc_claimAutoreleasedReturnValue();
    videoConfiguration = v5->_videoConfiguration;
    v5->_videoConfiguration = (HMDCameraRecordingVideoCodecConfiguration *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSelectedConfigurationAudio"));
    v10 = objc_claimAutoreleasedReturnValue();
    audioConfiguration = v5->_audioConfiguration;
    v5->_audioConfiguration = (HMDCameraRecordingAudioCodecConfiguration *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDCameraRecordingSelectedConfiguration generalConfiguration](self, "generalConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSelectedConfigurationGeneral"));

  -[HMDCameraRecordingSelectedConfiguration videoConfiguration](self, "videoConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kSelectedConfigurationVideo"));

  -[HMDCameraRecordingSelectedConfiguration audioConfiguration](self, "audioConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kSelectedConfigurationAudio"));

}

- (HMDCameraRecordingGeneralConfiguration)generalConfiguration
{
  return self->_generalConfiguration;
}

- (HMDCameraRecordingVideoCodecConfiguration)videoConfiguration
{
  return self->_videoConfiguration;
}

- (HMDCameraRecordingAudioCodecConfiguration)audioConfiguration
{
  return self->_audioConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioConfiguration, 0);
  objc_storeStrong((id *)&self->_videoConfiguration, 0);
  objc_storeStrong((id *)&self->_generalConfiguration, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
