@implementation MTRTargetNavigatorClusterTargetInfoStruct

- (MTRTargetNavigatorClusterTargetInfoStruct)init
{
  MTRTargetNavigatorClusterTargetInfoStruct *v2;
  MTRTargetNavigatorClusterTargetInfoStruct *v3;
  NSNumber *identifier;
  NSString *name;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRTargetNavigatorClusterTargetInfoStruct;
  v2 = -[MTRTargetNavigatorClusterTargetInfoStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSNumber *)&unk_250591B18;

    name = v3->_name;
    v3->_name = (NSString *)&stru_2505249E8;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRTargetNavigatorClusterTargetInfoStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRTargetNavigatorClusterTargetInfoStruct);
  objc_msgSend_identifier(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentifier_(v4, v8, (uint64_t)v7);

  objc_msgSend_name(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: identifier:%@; name:%@; >"),
    v5,
    self->_identifier,
    self->_name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(NSNumber *)identifier
{
  objc_setProperty_nonatomic_copy(self, a2, identifier, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
