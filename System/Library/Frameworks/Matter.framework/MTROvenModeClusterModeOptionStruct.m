@implementation MTROvenModeClusterModeOptionStruct

- (MTROvenModeClusterModeOptionStruct)init
{
  MTROvenModeClusterModeOptionStruct *v2;
  MTROvenModeClusterModeOptionStruct *v3;
  NSString *label;
  NSNumber *mode;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *modeTags;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTROvenModeClusterModeOptionStruct;
  v2 = -[MTROvenModeClusterModeOptionStruct init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    label = v2->_label;
    v2->_label = (NSString *)&stru_2505249E8;

    mode = v3->_mode;
    v3->_mode = (NSNumber *)&unk_250591B18;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    modeTags = v3->_modeTags;
    v3->_modeTags = (NSArray *)v8;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROvenModeClusterModeOptionStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;

  v4 = objc_alloc_init(MTROvenModeClusterModeOptionStruct);
  objc_msgSend_label(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v4, v8, (uint64_t)v7);

  objc_msgSend_mode(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMode_(v4, v12, (uint64_t)v11);

  objc_msgSend_modeTags(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setModeTags_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: label:%@; mode:%@; modeTags:%@; >"),
    v5,
    self->_label,
    self->_mode,
    self->_modeTags);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)modeTags
{
  return self->_modeTags;
}

- (void)setModeTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeTags, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
