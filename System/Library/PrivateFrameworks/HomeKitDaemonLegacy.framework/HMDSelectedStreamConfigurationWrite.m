@implementation HMDSelectedStreamConfigurationWrite

- (HMDSelectedStreamConfigurationWrite)initWithSessionControl:(id)a3 videoParameters:(id)a4 audioParameters:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDSelectedStreamConfigurationWrite *v12;
  HMDSelectedStreamConfigurationWrite *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDSelectedStreamConfigurationWrite;
  v12 = -[HMDSelectedStreamConfigurationWrite init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionControl, a3);
    objc_storeStrong((id *)&v13->_videoParameters, a4);
    objc_storeStrong((id *)&v13->_audioParameters, a5);
  }

  return v13;
}

- (HMDSelectedStreamConfigurationWrite)initWithSessionControl:(id)a3
{
  id v5;
  HMDSelectedStreamConfigurationWrite *v6;
  HMDSelectedStreamConfigurationWrite *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSelectedStreamConfigurationWrite;
  v6 = -[HMDSelectedStreamConfigurationWrite init](&v9, sel_init);
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
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSelectedStreamConfigurationWrite sessionControl](self, "sessionControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tlvData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 1, v5);
  -[HMDSelectedStreamConfigurationWrite videoParameters](self, "videoParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tlvData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 2, v7);
  -[HMDSelectedStreamConfigurationWrite audioParameters](self, "audioParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tlvData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 3, v9);
  objc_msgSend(v3, "serialize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v10;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  HMDSessionControl *v9;
  void *v10;
  HMDSessionControl *v11;
  HMDSessionControl *sessionControl;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  HMDSelectedVideoParameters *v21;
  void *v22;
  HMDSelectedVideoParameters *v23;
  HMDSelectedVideoParameters *videoParameters;
  HMDSelectedAudioParameters *v25;
  void *v26;
  HMDSelectedAudioParameters *v27;
  HMDSelectedAudioParameters *audioParameters;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  _QWORD v38[2];
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 1, CFSTR("kSelectedStreamConfigurationWrite__SessionControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 2, CFSTR("kSelectedStreamConfigurationWrite__SelectedVideoParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 3, CFSTR("kSelectedStreamConfigurationWrite__SelectedAudioParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v4;
  v38[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HAPTLVBase _parseMandatory:optional:](self, "_parseMandatory:optional:", v6, v7);

  if (v8)
  {
    v9 = [HMDSessionControl alloc];
    objc_msgSend(v3, "field");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HAPTLVBase initWithTLVData:](v9, "initWithTLVData:", v10);
    sessionControl = self->_sessionControl;
    self->_sessionControl = v11;

    v20 = checkForParseResult(1, v13, v14, v15, v16, v17, v18, v19, (uint64_t)self->_sessionControl, v37);
    if (-[HMDSessionControl controlCommand](self->_sessionControl, "controlCommand") == 1)
    {
      v21 = [HMDSelectedVideoParameters alloc];
      objc_msgSend(v4, "field");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HAPTLVBase initWithTLVData:](v21, "initWithTLVData:", v22);
      videoParameters = self->_videoParameters;
      self->_videoParameters = v23;

      v25 = [HMDSelectedAudioParameters alloc];
      objc_msgSend(v5, "field");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[HAPTLVBase initWithTLVData:](v25, "initWithTLVData:", v26);
      audioParameters = self->_audioParameters;
      self->_audioParameters = v27;

      if (v20)
        LOBYTE(v20) = checkForParseResult(2, v29, v30, v31, v32, v33, v34, v35, (uint64_t)self->_videoParameters, (uint64_t)self->_audioParameters);
    }
  }
  else
  {
    LOBYTE(v20) = 0;
  }

  return v20;
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
  id v13;

  v6 = a4;
  v7 = a3;
  -[HMDSelectedStreamConfigurationWrite sessionControl](self, "sessionControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptionWithIndent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ sessionControl = %@ "), v6, v9);

  -[HMDSelectedStreamConfigurationWrite videoParameters](self, "videoParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptionWithIndent:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ videoParameters = %@ "), v6, v11);

  -[HMDSelectedStreamConfigurationWrite audioParameters](self, "audioParameters");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptionWithIndent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ audioParameters = %@ "), v6, v12);

}

- (HMDSelectedStreamConfigurationWrite)initWithCoder:(id)a3
{
  id v4;
  HMDSelectedStreamConfigurationWrite *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMDSessionControl *sessionControl;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDSelectedVideoParameters *videoParameters;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HMDSelectedAudioParameters *audioParameters;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDSelectedStreamConfigurationWrite;
  v5 = -[HMDSelectedStreamConfigurationWrite init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kSelectedStreamConfigurationWrite__SessionControl"));
    v9 = objc_claimAutoreleasedReturnValue();
    sessionControl = v5->_sessionControl;
    v5->_sessionControl = (HMDSessionControl *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kSelectedStreamConfigurationWrite__SelectedVideoParameters"));
    v14 = objc_claimAutoreleasedReturnValue();
    videoParameters = v5->_videoParameters;
    v5->_videoParameters = (HMDSelectedVideoParameters *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kSelectedStreamConfigurationWrite__SelectedAudioParameters"));
    v19 = objc_claimAutoreleasedReturnValue();
    audioParameters = v5->_audioParameters;
    v5->_audioParameters = (HMDSelectedAudioParameters *)v19;

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
  -[HMDSelectedStreamConfigurationWrite sessionControl](self, "sessionControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSelectedStreamConfigurationWrite__SessionControl"));

  -[HMDSelectedStreamConfigurationWrite videoParameters](self, "videoParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kSelectedStreamConfigurationWrite__SelectedVideoParameters"));

  -[HMDSelectedStreamConfigurationWrite audioParameters](self, "audioParameters");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kSelectedStreamConfigurationWrite__SelectedAudioParameters"));

}

- (HMDSessionControl)sessionControl
{
  return self->_sessionControl;
}

- (HMDSelectedVideoParameters)videoParameters
{
  return self->_videoParameters;
}

- (HMDSelectedAudioParameters)audioParameters
{
  return self->_audioParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioParameters, 0);
  objc_storeStrong((id *)&self->_videoParameters, 0);
  objc_storeStrong((id *)&self->_sessionControl, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
