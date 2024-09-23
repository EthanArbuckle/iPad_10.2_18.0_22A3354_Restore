@implementation MTRContentLauncherClusterParameterStruct

- (MTRContentLauncherClusterParameterStruct)init
{
  MTRContentLauncherClusterParameterStruct *v2;
  MTRContentLauncherClusterParameterStruct *v3;
  NSNumber *type;
  NSString *value;
  NSArray *externalIDList;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRContentLauncherClusterParameterStruct;
  v2 = -[MTRContentLauncherClusterParameterStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    type = v2->_type;
    v2->_type = (NSNumber *)&unk_250591B18;

    value = v3->_value;
    v3->_value = (NSString *)&stru_2505249E8;

    externalIDList = v3->_externalIDList;
    v3->_externalIDList = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRContentLauncherClusterParameterStruct *v4;
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

  v4 = objc_alloc_init(MTRContentLauncherClusterParameterStruct);
  objc_msgSend_type(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setType_(v4, v8, (uint64_t)v7);

  objc_msgSend_value(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_(v4, v12, (uint64_t)v11);

  objc_msgSend_externalIDList(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExternalIDList_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: type:%@; value:%@; externalIDList:%@; >"),
    v5,
    self->_type,
    self->_value,
    self->_externalIDList);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(NSNumber *)type
{
  objc_setProperty_nonatomic_copy(self, a2, type, 8);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(NSString *)value
{
  objc_setProperty_nonatomic_copy(self, a2, value, 16);
}

- (NSArray)externalIDList
{
  return self->_externalIDList;
}

- (void)setExternalIDList:(NSArray *)externalIDList
{
  objc_setProperty_nonatomic_copy(self, a2, externalIDList, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIDList, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
