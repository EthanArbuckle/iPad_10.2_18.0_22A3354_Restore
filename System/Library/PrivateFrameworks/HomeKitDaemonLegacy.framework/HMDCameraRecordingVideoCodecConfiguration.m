@implementation HMDCameraRecordingVideoCodecConfiguration

- (HMDCameraRecordingVideoCodecConfiguration)initWithCodec:(id)a3 codecParameters:(id)a4 videoAttributes:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDCameraRecordingVideoCodecConfiguration *v12;
  HMDCameraRecordingVideoCodecConfiguration *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraRecordingVideoCodecConfiguration;
  v12 = -[HMDCameraRecordingVideoCodecConfiguration init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_codec, a3);
    objc_storeStrong((id *)&v13->_parameters, a4);
    objc_storeStrong((id *)&v13->_videoAttributes, a5);
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
  HMDCameraRecordingVideoCodec *v8;
  void *v9;
  HMDCameraRecordingVideoCodec *v10;
  HMDCameraRecordingVideoCodec *codec;
  HMDCameraRecordingVideoCodecParameters *v12;
  void *v13;
  HMDCameraRecordingVideoCodecParameters *v14;
  HMDCameraRecordingVideoCodecParameters *parameters;
  NSArray *v16;
  NSArray *videoAttributes;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 1, CFSTR("VideoCodecConfigurationCodec"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 2, CFSTR("VideoCodecConfigurationCodecParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16400], "wrappertlv:name:objectCreator:", 3, CFSTR("VideoCodecConfigurationAttributes"), &__block_literal_global_231_132157);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v19[1] = v4;
  v19[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPTLVBase _parse:](self, "_parse:", v6);
  if (v7)
  {
    v8 = [HMDCameraRecordingVideoCodec alloc];
    objc_msgSend(v3, "field");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDCameraRecordingVideoCodec initWithCodec:](v8, "initWithCodec:", objc_msgSend(v9, "integerValue"));
    codec = self->_codec;
    self->_codec = v10;

    v12 = [HMDCameraRecordingVideoCodecParameters alloc];
    objc_msgSend(v4, "field");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HAPTLVBase initWithTLVData:](v12, "initWithTLVData:", v13);
    parameters = self->_parameters;
    self->_parameters = v14;

    objc_msgSend(v5, "field");
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    videoAttributes = self->_videoAttributes;
    self->_videoAttributes = v16;

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
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraRecordingVideoCodecConfiguration codec](self, "codec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 1, 1, v6);

  -[HMDCameraRecordingVideoCodecConfiguration parameters](self, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tlvData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 2, v8);
  -[HMDCameraRecordingVideoCodecConfiguration videoAttributes](self, "videoAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tlvData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 3, v11);
  objc_msgSend(v3, "serialize");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v12;
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
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@tlvDatablob = %@ "), v6, v8);

  -[HMDCameraRecordingVideoCodecConfiguration codec](self, "codec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptionWithIndent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@codec = %@ "), v6, v10);

  -[HMDCameraRecordingVideoCodecConfiguration parameters](self, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptionWithIndent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@parameters = %@ "), v6, v12);

  -[HMDCameraRecordingVideoCodecConfiguration videoAttributes](self, "videoAttributes");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indentationByLevels:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HAPTLVCreateParseArrayToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@attributes = %@ "), v6, v14);

}

- (HMDCameraRecordingVideoCodecConfiguration)initWithCoder:(id)a3
{
  id v4;
  HMDCameraRecordingVideoCodecConfiguration *v5;
  uint64_t v6;
  HMDCameraRecordingVideoCodec *codec;
  uint64_t v8;
  HMDCameraRecordingVideoCodecParameters *parameters;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *videoAttributes;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMDCameraRecordingVideoCodecConfiguration;
  v5 = -[HMDCameraRecordingVideoCodecConfiguration init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VideoCodecConfigurationCodec"));
    v6 = objc_claimAutoreleasedReturnValue();
    codec = v5->_codec;
    v5->_codec = (HMDCameraRecordingVideoCodec *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VideoCodecConfigurationCodecParameters"));
    v8 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (HMDCameraRecordingVideoCodecParameters *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("VideoCodecConfigurationAttributes"));
    v13 = objc_claimAutoreleasedReturnValue();
    videoAttributes = v5->_videoAttributes;
    v5->_videoAttributes = (NSArray *)v13;

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
  -[HMDCameraRecordingVideoCodecConfiguration codec](self, "codec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("VideoCodecConfigurationCodec"));

  -[HMDCameraRecordingVideoCodecConfiguration parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("VideoCodecConfigurationCodecParameters"));

  -[HMDCameraRecordingVideoCodecConfiguration videoAttributes](self, "videoAttributes");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("VideoCodecConfigurationAttributes"));

}

- (HMDCameraRecordingVideoCodec)codec
{
  return self->_codec;
}

- (HMDCameraRecordingVideoCodecParameters)parameters
{
  return self->_parameters;
}

- (NSArray)videoAttributes
{
  return self->_videoAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAttributes, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_codec, 0);
}

HMDCameraRecordingVideoAttributes *__62__HMDCameraRecordingVideoCodecConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDCameraRecordingVideoAttributes *v3;

  v2 = a2;
  v3 = -[HAPTLVBase initWithTLVData:]([HMDCameraRecordingVideoAttributes alloc], "initWithTLVData:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
