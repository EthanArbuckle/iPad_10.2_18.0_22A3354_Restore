@implementation MTREnergyEVSEModeClusterModeTagStruct

- (MTREnergyEVSEModeClusterModeTagStruct)init
{
  MTREnergyEVSEModeClusterModeTagStruct *v2;
  MTREnergyEVSEModeClusterModeTagStruct *v3;
  NSNumber *mfgCode;
  NSNumber *value;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTREnergyEVSEModeClusterModeTagStruct;
  v2 = -[MTREnergyEVSEModeClusterModeTagStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    mfgCode = v2->_mfgCode;
    v2->_mfgCode = 0;

    value = v3->_value;
    v3->_value = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTREnergyEVSEModeClusterModeTagStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTREnergyEVSEModeClusterModeTagStruct);
  objc_msgSend_mfgCode(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMfgCode_(v4, v8, (uint64_t)v7);

  objc_msgSend_value(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: mfgCode:%@; value:%@; >"),
    v5,
    self->_mfgCode,
    self->_value);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)mfgCode
{
  return self->_mfgCode;
}

- (void)setMfgCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_mfgCode, 0);
}

@end
