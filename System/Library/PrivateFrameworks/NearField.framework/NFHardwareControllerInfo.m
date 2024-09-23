@implementation NFHardwareControllerInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFHardwareControllerInfo)initWithCoder:(id)a3
{
  id v4;
  NFHardwareControllerInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NFHardwareControllerInfo;
  v5 = -[NFHardwareControllerInfo init](&v7, sel_init);
  if (v5)
  {
    v5->_siliconVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("siliconVersion"));
    v5->_siliconName = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("siliconName"));
    v5->_ROMVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ROMVersion"));
    v5->_firmwareVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("firmwareVersion"));
    v5->_firmwareRevision = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("firmwareRevision"));
    v5->_middlewareVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("middlewareVersion"));
    v5->_hasAntenna = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAntenna"));
    v5->_hasIcfResistor = 0;
    v5->_hasMFW = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasMFW"));
    v5->_hasHLMSupport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasHLMSupport"));
    v5->_hasLPEMSupport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasLPEMSupport"));
    v5->_hasCarKeySupport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCarKeySupport"));
    v5->_hasReaderModeSupport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasReaderModeSupport"));
    v5->_poweredRunDuringSleep = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("poweredRunDuringSleep"));
  }

  return v5;
}

- (BOOL)hasAntenna
{
  return self->_hasAntenna;
}

- (NFHardwareControllerInfo)initWithDictionary:(id)a3
{
  id v4;
  NFHardwareControllerInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NFHardwareControllerInfo;
  v5 = -[NFHardwareControllerInfo init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siliconVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_siliconVersion = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siliconName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_siliconName = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ROMVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ROMVersion = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firmwareVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_firmwareVersion = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firmwareRevision"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_firmwareRevision = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("middlewareVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_middlewareVersion = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasAntenna"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasAntenna = objc_msgSend(v12, "BOOLValue");

    v5->_hasIcfResistor = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasMFW"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasMFW = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasHLMSupport"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasHLMSupport = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasLPEMSupport"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasLPEMSupport = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasCarKeySupport"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasCarKeySupport = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasReaderModeSupport"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasReaderModeSupport = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("poweredRunDuringSleep"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_poweredRunDuringSleep = objc_msgSend(v18, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t siliconVersion;
  id v5;

  siliconVersion = self->_siliconVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", siliconVersion, CFSTR("siliconVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_siliconName, CFSTR("siliconName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ROMVersion, CFSTR("ROMVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_firmwareVersion, CFSTR("firmwareVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_firmwareRevision, CFSTR("firmwareRevision"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_middlewareVersion, CFSTR("middlewareVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasAntenna, CFSTR("hasAntenna"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasMFW, CFSTR("hasMFW"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasHLMSupport, CFSTR("hasHLMSupport"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasLPEMSupport, CFSTR("hasLPEMSupport"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasCarKeySupport, CFSTR("hasCarKeySupport"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasReaderModeSupport, CFSTR("hasReaderModeSupport"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_poweredRunDuringSleep, CFSTR("poweredRunDuringSleep"));

}

- (id)asDictionary
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%04x"), self->_siliconVersion);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("siliconVersion"));

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%04x"), self->_siliconName);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("siliconName"));

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%04x"), self->_ROMVersion);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ROMVersion"));

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%04x"), self->_firmwareVersion);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("firmwareVersion"));

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%04x"), self->_firmwareRevision);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("firmwareRevision"));

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%04x"), self->_middlewareVersion);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("middlewareVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAntenna);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("hasAntenna"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasMFW);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hasMFW"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasHLMSupport);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hasHLMSupport"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasLPEMSupport);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("hasLPEMSupport"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasCarKeySupport);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hasCarKeySupport"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasReaderModeSupport);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hasReaderModeSupport"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_poweredRunDuringSleep);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("poweredRunDuringSleep"));

  return v3;
}

- (unint64_t)siliconVersion
{
  return self->_siliconVersion;
}

- (unint64_t)siliconName
{
  return self->_siliconName;
}

- (unint64_t)ROMVersion
{
  return self->_ROMVersion;
}

- (unint64_t)firmwareVersion
{
  return self->_firmwareVersion;
}

- (unint64_t)firmwareRevision
{
  return self->_firmwareRevision;
}

- (unint64_t)middlewareVersion
{
  return self->_middlewareVersion;
}

- (BOOL)hasIcfResistor
{
  return self->_hasIcfResistor;
}

- (BOOL)hasMFW
{
  return self->_hasMFW;
}

- (BOOL)hasHLMSupport
{
  return self->_hasHLMSupport;
}

- (BOOL)hasLPEMSupport
{
  return self->_hasLPEMSupport;
}

- (BOOL)poweredRunDuringSleep
{
  return self->_poweredRunDuringSleep;
}

- (BOOL)hasCarKeySupport
{
  return self->_hasCarKeySupport;
}

- (BOOL)hasReaderModeSupport
{
  return self->_hasReaderModeSupport;
}

@end
