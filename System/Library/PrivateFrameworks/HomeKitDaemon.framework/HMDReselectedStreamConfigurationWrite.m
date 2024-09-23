@implementation HMDReselectedStreamConfigurationWrite

- (HMDReselectedStreamConfigurationWrite)initWithSessionControl:(id)a3 videoParameters:(id)a4
{
  id v7;
  id v8;
  HMDReselectedStreamConfigurationWrite *v9;
  HMDReselectedStreamConfigurationWrite *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDReselectedStreamConfigurationWrite;
  v9 = -[HMDReselectedStreamConfigurationWrite init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionControl, a3);
    objc_storeStrong((id *)&v10->_videoParameters, a4);
  }

  return v10;
}

- (HMDReselectedStreamConfigurationWrite)initWithSessionControl:(id)a3
{
  id v5;
  HMDReselectedStreamConfigurationWrite *v6;
  HMDReselectedStreamConfigurationWrite *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDReselectedStreamConfigurationWrite;
  v6 = -[HMDReselectedStreamConfigurationWrite init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sessionControl, a3);

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

  objc_msgSend(MEMORY[0x24BE1BC10], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDReselectedStreamConfigurationWrite sessionControl](self, "sessionControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tlvData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 1, v5);
  -[HMDReselectedStreamConfigurationWrite videoParameters](self, "videoParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tlvData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 2, v7);
  objc_msgSend(v3, "serialize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v8;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  HMDSessionControl *v8;
  void *v9;
  HMDSessionControl *v10;
  HMDSessionControl *sessionControl;
  HMDReselectedVideoParameters *v12;
  void *v13;
  HMDReselectedVideoParameters *v14;
  HMDReselectedVideoParameters *videoParameters;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BAC8], "wrappertlv:name:", 1, CFSTR("kSelectedStreamConfigurationWrite__SessionControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BAC8], "wrappertlv:name:", 2, CFSTR("kSelectedStreamConfigurationWrite__SelectedVideoParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPTLVBase _parseMandatory:optional:](self, "_parseMandatory:optional:", v5, v6);

  if (v7)
  {
    v8 = [HMDSessionControl alloc];
    objc_msgSend(v3, "field");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HAPTLVBase initWithTLVData:](v8, "initWithTLVData:", v9);
    sessionControl = self->_sessionControl;
    self->_sessionControl = v10;

    v12 = [HMDReselectedVideoParameters alloc];
    objc_msgSend(v4, "field");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HAPTLVBase initWithTLVData:](v12, "initWithTLVData:", v13);
    videoParameters = self->_videoParameters;
    self->_videoParameters = v14;

    v23 = checkForParseResult(2, v16, v17, v18, v19, v20, v21, v22, (uint64_t)self->_sessionControl, (uint64_t)self->_videoParameters);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[HMDReselectedStreamConfigurationWrite sessionControl](self, "sessionControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptionWithIndent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ sessionControl = %@ "), v6, v9);

  -[HMDReselectedStreamConfigurationWrite videoParameters](self, "videoParameters");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptionWithIndent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ videoParameters = %@ "), v6, v10);

}

- (HMDReselectedStreamConfigurationWrite)initWithCoder:(id)a3
{
  id v4;
  HMDReselectedStreamConfigurationWrite *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMDSessionControl *sessionControl;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDReselectedVideoParameters *videoParameters;
  objc_super v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDReselectedStreamConfigurationWrite;
  v5 = -[HMDReselectedStreamConfigurationWrite init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kSelectedStreamConfigurationWrite__SessionControl"));
    v9 = objc_claimAutoreleasedReturnValue();
    sessionControl = v5->_sessionControl;
    v5->_sessionControl = (HMDSessionControl *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kSelectedStreamConfigurationWrite__SelectedVideoParameters"));
    v14 = objc_claimAutoreleasedReturnValue();
    videoParameters = v5->_videoParameters;
    v5->_videoParameters = (HMDReselectedVideoParameters *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDReselectedStreamConfigurationWrite sessionControl](self, "sessionControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSelectedStreamConfigurationWrite__SessionControl"));

  -[HMDReselectedStreamConfigurationWrite videoParameters](self, "videoParameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kSelectedStreamConfigurationWrite__SelectedVideoParameters"));

}

- (HMDSessionControl)sessionControl
{
  return self->_sessionControl;
}

- (HMDReselectedVideoParameters)videoParameters
{
  return self->_videoParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoParameters, 0);
  objc_storeStrong((id *)&self->_sessionControl, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
