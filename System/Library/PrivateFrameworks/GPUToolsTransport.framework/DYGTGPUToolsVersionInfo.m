@implementation DYGTGPUToolsVersionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDictionary copyWithZone:](self->_infoPlist, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSDictionary copyWithZone:](self->_versionPlist, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  *(_DWORD *)(v5 + 8) = self->_interposeVersionGL;
  *(_DWORD *)(v5 + 12) = self->_interposeVersionMetal;
  return (id)v5;
}

- (DYGTGPUToolsVersionInfo)initWithCoder:(id)a3
{
  id v4;
  DYGTGPUToolsVersionInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *infoPlist;
  uint64_t v11;
  uint64_t v12;
  NSDictionary *versionPlist;
  objc_super v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DYGTGPUToolsVersionInfo;
  v5 = -[DYGTGPUToolsVersionInfo init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("infoPlist"));
    v9 = objc_claimAutoreleasedReturnValue();
    infoPlist = v5->_infoPlist;
    v5->_infoPlist = (NSDictionary *)v9;

    v11 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v11, objc_opt_class(), CFSTR("versionPlist"));
    v12 = objc_claimAutoreleasedReturnValue();
    versionPlist = v5->_versionPlist;
    v5->_versionPlist = (NSDictionary *)v12;

    v5->_interposeVersionGL = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("interposeVersion"));
    v5->_interposeVersionMetal = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("interposeVersionMetal"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *infoPlist;
  id v5;

  infoPlist = self->_infoPlist;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", infoPlist, CFSTR("infoPlist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_versionPlist, CFSTR("versionPlist"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_interposeVersionGL, CFSTR("interposeVersion"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_interposeVersionMetal, CFSTR("interposeVersionMetal"));

}

- (NSDictionary)infoPlist
{
  return self->_infoPlist;
}

- (void)setInfoPlist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)versionPlist
{
  return self->_versionPlist;
}

- (void)setVersionPlist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)interposeVersionGL
{
  return self->_interposeVersionGL;
}

- (void)setInterposeVersionGL:(unsigned int)a3
{
  self->_interposeVersionGL = a3;
}

- (unsigned)interposeVersionMetal
{
  return self->_interposeVersionMetal;
}

- (void)setInterposeVersionMetal:(unsigned int)a3
{
  self->_interposeVersionMetal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionPlist, 0);
  objc_storeStrong((id *)&self->_infoPlist, 0);
}

@end
