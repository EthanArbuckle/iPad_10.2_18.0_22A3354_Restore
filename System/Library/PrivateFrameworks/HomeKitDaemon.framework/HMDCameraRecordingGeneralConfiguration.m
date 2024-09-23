@implementation HMDCameraRecordingGeneralConfiguration

- (HMDCameraRecordingGeneralConfiguration)initWithPrebufferLength:(id)a3 eventTriggerOptions:(unint64_t)a4 mediaContainerConfigurations:(id)a5
{
  id v9;
  id v10;
  HMDCameraRecordingGeneralConfiguration *v11;
  HMDCameraRecordingGeneralConfiguration *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraRecordingGeneralConfiguration;
  v11 = -[HMDCameraRecordingGeneralConfiguration init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_prebufferLength, a3);
    v12->_eventTriggerOptions = a4;
    objc_storeStrong((id *)&v12->_mediaContainerConfigurations, a5);
  }

  return v12;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSNumber *v8;
  NSNumber *prebufferLength;
  void *v10;
  NSArray *v11;
  NSArray *mediaContainerConfigurations;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 1, CFSTR("kGeneralConfigurationPrebufferLength"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 2, CFSTR("kGeneralConfigurationEventTriggerOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B9F0], "wrappertlv:name:objectCreator:", 3, CFSTR("kGeneralConfigurationMediaContainerConfigurations"), &__block_literal_global_123311);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v14[1] = v4;
  v14[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPTLVBase _parse:](self, "_parse:", v6);
  if (v7)
  {
    objc_msgSend(v3, "field");
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    prebufferLength = self->_prebufferLength;
    self->_prebufferLength = v8;

    objc_msgSend(v4, "field");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_eventTriggerOptions = objc_msgSend(v10, "unsignedLongLongValue");

    objc_msgSend(v5, "field");
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    mediaContainerConfigurations = self->_mediaContainerConfigurations;
    self->_mediaContainerConfigurations = v11;

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

  objc_msgSend(MEMORY[0x24BE1BC10], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingGeneralConfiguration prebufferLength](self, "prebufferLength");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 1, 4, v4);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDCameraRecordingGeneralConfiguration eventTriggerOptions](self, "eventTriggerOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 2, 8, v5);

  -[HMDCameraRecordingGeneralConfiguration mediaContainerConfigurations](self, "mediaContainerConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tlvData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 3, v8);
  objc_msgSend(v3, "serialize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v9;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@tlvDatablob = %@ "), v6, v8);

  -[HMDCameraRecordingGeneralConfiguration prebufferLength](self, "prebufferLength");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@prebufferLength = %@ "), v6, v9);

  HMDCameraRecordingEventTriggerOptionsAsString(-[HMDCameraRecordingGeneralConfiguration eventTriggerOptions](self, "eventTriggerOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@eventTriggerOptions = %@ "), v6, v10);

  -[HMDCameraRecordingGeneralConfiguration mediaContainerConfigurations](self, "mediaContainerConfigurations");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  HAPTLVCreateParseArrayToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@containerConfigurations = %@ "), v6, v11);

}

- (HMDCameraRecordingGeneralConfiguration)initWithCoder:(id)a3
{
  id v4;
  HMDCameraRecordingGeneralConfiguration *v5;
  uint64_t v6;
  NSNumber *prebufferLength;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *mediaContainerConfigurations;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraRecordingGeneralConfiguration;
  v5 = -[HMDCameraRecordingGeneralConfiguration init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kGeneralConfigurationPrebufferLength"));
    v6 = objc_claimAutoreleasedReturnValue();
    prebufferLength = v5->_prebufferLength;
    v5->_prebufferLength = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kGeneralConfigurationEventTriggerOptions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_eventTriggerOptions = objc_msgSend(v8, "unsignedLongLongValue");

    v9 = (void *)MEMORY[0x24BDBCF20];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("kGeneralConfigurationMediaContainerConfigurations"));
    v12 = objc_claimAutoreleasedReturnValue();
    mediaContainerConfigurations = v5->_mediaContainerConfigurations;
    v5->_mediaContainerConfigurations = (NSArray *)v12;

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
  -[HMDCameraRecordingGeneralConfiguration prebufferLength](self, "prebufferLength");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kGeneralConfigurationPrebufferLength"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDCameraRecordingGeneralConfiguration eventTriggerOptions](self, "eventTriggerOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kGeneralConfigurationEventTriggerOptions"));

  -[HMDCameraRecordingGeneralConfiguration mediaContainerConfigurations](self, "mediaContainerConfigurations");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kGeneralConfigurationMediaContainerConfigurations"));

}

- (NSNumber)prebufferLength
{
  return self->_prebufferLength;
}

- (unint64_t)eventTriggerOptions
{
  return self->_eventTriggerOptions;
}

- (NSArray)mediaContainerConfigurations
{
  return self->_mediaContainerConfigurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaContainerConfigurations, 0);
  objc_storeStrong((id *)&self->_prebufferLength, 0);
}

HMDCameraRecordingMediaContainerConfiguration *__59__HMDCameraRecordingGeneralConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDCameraRecordingMediaContainerConfiguration *v3;

  v2 = a2;
  v3 = -[HAPTLVBase initWithTLVData:]([HMDCameraRecordingMediaContainerConfiguration alloc], "initWithTLVData:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
