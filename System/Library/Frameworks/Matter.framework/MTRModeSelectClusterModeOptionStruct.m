@implementation MTRModeSelectClusterModeOptionStruct

- (MTRModeSelectClusterModeOptionStruct)init
{
  MTRModeSelectClusterModeOptionStruct *v2;
  MTRModeSelectClusterModeOptionStruct *v3;
  NSString *label;
  NSNumber *mode;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *semanticTags;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRModeSelectClusterModeOptionStruct;
  v2 = -[MTRModeSelectClusterModeOptionStruct init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    label = v2->_label;
    v2->_label = (NSString *)&stru_2505249E8;

    mode = v3->_mode;
    v3->_mode = (NSNumber *)&unk_250591B18;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    semanticTags = v3->_semanticTags;
    v3->_semanticTags = (NSArray *)v8;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRModeSelectClusterModeOptionStruct *v4;
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

  v4 = objc_alloc_init(MTRModeSelectClusterModeOptionStruct);
  objc_msgSend_label(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v4, v8, (uint64_t)v7);

  objc_msgSend_mode(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMode_(v4, v12, (uint64_t)v11);

  objc_msgSend_semanticTags(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSemanticTags_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: label:%@; mode:%@; semanticTags:%@; >"),
    v5,
    self->_label,
    self->_mode,
    self->_semanticTags);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
  objc_setProperty_nonatomic_copy(self, a2, label, 8);
}

- (NSNumber)mode
{
  return self->_mode;
}

- (void)setMode:(NSNumber *)mode
{
  objc_setProperty_nonatomic_copy(self, a2, mode, 16);
}

- (NSArray)semanticTags
{
  return self->_semanticTags;
}

- (void)setSemanticTags:(NSArray *)semanticTags
{
  objc_setProperty_nonatomic_copy(self, a2, semanticTags, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticTags, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
