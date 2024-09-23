@implementation HMDCameraRecordingMediaContainerConfiguration

- (HMDCameraRecordingMediaContainerConfiguration)initWithMediaContainer:(id)a3 containerParameters:(id)a4
{
  id v7;
  id v8;
  HMDCameraRecordingMediaContainerConfiguration *v9;
  HMDCameraRecordingMediaContainerConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDCameraRecordingMediaContainerConfiguration;
  v9 = -[HMDCameraRecordingMediaContainerConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_container, a3);
    objc_storeStrong((id *)&v10->_parameters, a4);
  }

  return v10;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  HMDCameraRecordingMediaContainer *v7;
  void *v8;
  HMDCameraRecordingMediaContainer *v9;
  HMDCameraRecordingMediaContainer *container;
  HMDCameraRecordingMediaContainerParameters *v11;
  void *v12;
  HMDCameraRecordingMediaContainerParameters *v13;
  HMDCameraRecordingMediaContainerParameters *parameters;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 1, CFSTR("kMediaContainerConfigurationContainerType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 2, CFSTR("MediaContainerConfigurationContainerParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v16[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPTLVBase _parse:](self, "_parse:", v5);
  if (v6)
  {
    v7 = [HMDCameraRecordingMediaContainer alloc];
    objc_msgSend(v3, "field");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDCameraRecordingMediaContainer initWithContainer:](v7, "initWithContainer:", objc_msgSend(v8, "integerValue"));
    container = self->_container;
    self->_container = v9;

    v11 = [HMDCameraRecordingMediaContainerParameters alloc];
    objc_msgSend(v4, "field");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HAPTLVBase initWithTLVData:](v11, "initWithTLVData:", v12);
    parameters = self->_parameters;
    self->_parameters = v13;

  }
  return v6;
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

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraRecordingMediaContainerConfiguration container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 1, 1, v6);

  -[HMDCameraRecordingMediaContainerConfiguration parameters](self, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tlvData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 2, v8);
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

  -[HMDCameraRecordingMediaContainerConfiguration container](self, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptionWithIndent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@container = %@ "), v6, v10);

  -[HMDCameraRecordingMediaContainerConfiguration parameters](self, "parameters");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptionWithIndent:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@parameters = %@ "), v6, v11);

}

- (HMDCameraRecordingMediaContainerConfiguration)initWithCoder:(id)a3
{
  id v4;
  HMDCameraRecordingMediaContainerConfiguration *v5;
  uint64_t v6;
  HMDCameraRecordingMediaContainer *container;
  uint64_t v8;
  HMDCameraRecordingMediaContainerParameters *parameters;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraRecordingMediaContainerConfiguration;
  v5 = -[HMDCameraRecordingMediaContainerConfiguration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMediaContainerConfigurationContainerType"));
    v6 = objc_claimAutoreleasedReturnValue();
    container = v5->_container;
    v5->_container = (HMDCameraRecordingMediaContainer *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MediaContainerConfigurationContainerParameters"));
    v8 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (HMDCameraRecordingMediaContainerParameters *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDCameraRecordingMediaContainerConfiguration container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kMediaContainerConfigurationContainerType"));

  -[HMDCameraRecordingMediaContainerConfiguration parameters](self, "parameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MediaContainerConfigurationContainerParameters"));

}

- (HMDCameraRecordingMediaContainer)container
{
  return self->_container;
}

- (HMDCameraRecordingMediaContainerParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
