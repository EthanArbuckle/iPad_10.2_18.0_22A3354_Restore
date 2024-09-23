@implementation MTRTimeSynchronizationClusterTimeZoneStruct

- (MTRTimeSynchronizationClusterTimeZoneStruct)init
{
  MTRTimeSynchronizationClusterTimeZoneStruct *v2;
  MTRTimeSynchronizationClusterTimeZoneStruct *v3;
  NSNumber *offset;
  NSNumber *validAt;
  NSString *name;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRTimeSynchronizationClusterTimeZoneStruct;
  v2 = -[MTRTimeSynchronizationClusterTimeZoneStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    offset = v2->_offset;
    v2->_offset = (NSNumber *)&unk_250591B18;

    validAt = v3->_validAt;
    v3->_validAt = (NSNumber *)&unk_250591B18;

    name = v3->_name;
    v3->_name = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRTimeSynchronizationClusterTimeZoneStruct *v4;
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

  v4 = objc_alloc_init(MTRTimeSynchronizationClusterTimeZoneStruct);
  objc_msgSend_offset(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOffset_(v4, v8, (uint64_t)v7);

  objc_msgSend_validAt(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValidAt_(v4, v12, (uint64_t)v11);

  objc_msgSend_name(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: offset:%@; validAt:%@; name:%@; >"),
    v5,
    self->_offset,
    self->_validAt,
    self->_name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)offset
{
  return self->_offset;
}

- (void)setOffset:(NSNumber *)offset
{
  objc_setProperty_nonatomic_copy(self, a2, offset, 8);
}

- (NSNumber)validAt
{
  return self->_validAt;
}

- (void)setValidAt:(NSNumber *)validAt
{
  objc_setProperty_nonatomic_copy(self, a2, validAt, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_validAt, 0);
  objc_storeStrong((id *)&self->_offset, 0);
}

@end
