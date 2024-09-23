@implementation MTRChannelClusterProgramCastStruct

- (MTRChannelClusterProgramCastStruct)init
{
  MTRChannelClusterProgramCastStruct *v2;
  MTRChannelClusterProgramCastStruct *v3;
  NSString *name;
  NSString *role;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRChannelClusterProgramCastStruct;
  v2 = -[MTRChannelClusterProgramCastStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_2505249E8;

    role = v3->_role;
    v3->_role = (NSString *)&stru_2505249E8;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRChannelClusterProgramCastStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRChannelClusterProgramCastStruct);
  objc_msgSend_name(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v8, (uint64_t)v7);

  objc_msgSend_role(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRole_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: name:%@; role:%@; >"), v5, self->_name, self->_role);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
