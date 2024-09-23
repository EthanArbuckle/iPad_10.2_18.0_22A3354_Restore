@implementation HMAccessoryDiagnosticsOptions

- (HMAccessoryDiagnosticsOptions)initWithLogSizeBytes:(id)a3 delaySeconds:(id)a4 snapshotType:(int64_t)a5 recordAudio:(BOOL)a6 enableAudioClips:(BOOL)a7 cloudkitMetadataRequired:(BOOL)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v15;
  id v16;
  HMAccessoryDiagnosticsOptions *v17;
  HMAccessoryDiagnosticsOptions *v18;
  objc_super v20;

  v9 = a7;
  v10 = a6;
  v15 = a3;
  v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMAccessoryDiagnosticsOptions;
  v17 = -[HMAccessoryDiagnosticsOptions init](&v20, sel_init);
  if (!v17)
    goto LABEL_11;
  if ((!v15 || objc_msgSend(v15, "integerValue") <= 0x40000000 && objc_msgSend(v15, "integerValue") >= 5242880)
    && (objc_msgSend(v16, "integerValue") & 0x8000000000000000) == 0
    && objc_msgSend(v16, "integerValue") <= 3600
    && (a5 != 1 || !v10 && !v9))
  {
    objc_storeStrong((id *)&v17->_logSize, a3);
    objc_storeStrong((id *)&v17->_delay, a4);
    v17->_snapshotType = a5;
    v17->_recordAudio = v10;
    v17->_enableAudioClips = v9;
    v17->_metadataRequired = a8;
LABEL_11:
    v18 = v17;
    goto LABEL_12;
  }
  v18 = 0;
LABEL_12:

  return v18;
}

- (id)payloadMetadata
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[HMAccessoryDiagnosticsOptions logSize](self, "logSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMAccessoryDiagnosticsOptions logSize](self, "logSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("maxLogSize"));

  }
  -[HMAccessoryDiagnosticsOptions delay](self, "delay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMAccessoryDiagnosticsOptions delay](self, "delay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("delay"));

  }
  if (-[HMAccessoryDiagnosticsOptions recordAudio](self, "recordAudio"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMAccessoryDiagnosticsOptions recordAudio](self, "recordAudio"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("recordAudio"));

  }
  if (-[HMAccessoryDiagnosticsOptions enableAudioClips](self, "enableAudioClips"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMAccessoryDiagnosticsOptions enableAudioClips](self, "enableAudioClips"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("audioClips"));

  }
  if (-[HMAccessoryDiagnosticsOptions snapshotType](self, "snapshotType") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMAccessoryDiagnosticsOptions snapshotType](self, "snapshotType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("snapshotType"));

  }
  -[HMAccessoryDiagnosticsOptions matterLogType](self, "matterLogType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("LogType"));

  return v3;
}

- (HMAccessoryDiagnosticsOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HMAccessoryDiagnosticsOptions *v11;
  uint64_t v12;
  NSNumber *matterLogType;
  uint64_t v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.ls"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.d"));
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.st"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.ra"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.ec"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.mr"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "integerValue") > 2 || objc_msgSend(v5, "integerValue") <= 0)
  {

    v5 = &unk_1E3B2E4A0;
  }
  v9 = objc_msgSend(v5, "integerValue", v15);
  v10 = v6;
  v11 = -[HMAccessoryDiagnosticsOptions initWithLogSizeBytes:delaySeconds:snapshotType:recordAudio:enableAudioClips:cloudkitMetadataRequired:](self, "initWithLogSizeBytes:delaySeconds:snapshotType:recordAudio:enableAudioClips:cloudkitMetadataRequired:", v17, v16, v9, objc_msgSend(v6, "BOOLValue"), objc_msgSend(v7, "BOOLValue"), objc_msgSend(v8, "BOOLValue"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LogType"));
  v12 = objc_claimAutoreleasedReturnValue();
  matterLogType = v11->_matterLogType;
  v11->_matterLogType = (NSNumber *)v12;

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *logSize;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  logSize = self->_logSize;
  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", logSize, CFSTR("HMA.diagnostics.ck.ls"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_delay, CFSTR("HMA.diagnostics.ck.d"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_snapshotType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("HMA.diagnostics.ck.st"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_recordAudio);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("HMA.diagnostics.ck.ra"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableAudioClips);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("HMA.diagnostics.ck.ec"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_metadataRequired);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("HMA.diagnostics.ck.mr"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_matterLogType, CFSTR("LogType"));
}

- (NSNumber)matterLogType
{
  return self->_matterLogType;
}

- (void)setMatterLogType:(id)a3
{
  objc_storeStrong((id *)&self->_matterLogType, a3);
}

- (BOOL)metadataRequired
{
  return self->_metadataRequired;
}

- (NSNumber)logSize
{
  return self->_logSize;
}

- (BOOL)recordAudio
{
  return self->_recordAudio;
}

- (BOOL)enableAudioClips
{
  return self->_enableAudioClips;
}

- (NSNumber)delay
{
  return self->_delay;
}

- (int64_t)snapshotType
{
  return self->_snapshotType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delay, 0);
  objc_storeStrong((id *)&self->_logSize, 0);
  objc_storeStrong((id *)&self->_matterLogType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
