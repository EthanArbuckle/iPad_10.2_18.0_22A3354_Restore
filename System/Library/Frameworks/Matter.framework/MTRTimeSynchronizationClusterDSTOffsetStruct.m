@implementation MTRTimeSynchronizationClusterDSTOffsetStruct

- (MTRTimeSynchronizationClusterDSTOffsetStruct)init
{
  MTRTimeSynchronizationClusterDSTOffsetStruct *v2;
  MTRTimeSynchronizationClusterDSTOffsetStruct *v3;
  NSNumber *offset;
  NSNumber *validStarting;
  NSNumber *validUntil;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRTimeSynchronizationClusterDSTOffsetStruct;
  v2 = -[MTRTimeSynchronizationClusterDSTOffsetStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    offset = v2->_offset;
    v2->_offset = (NSNumber *)&unk_250591B18;

    validStarting = v3->_validStarting;
    v3->_validStarting = (NSNumber *)&unk_250591B18;

    validUntil = v3->_validUntil;
    v3->_validUntil = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRTimeSynchronizationClusterDSTOffsetStruct *v4;
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

  v4 = objc_alloc_init(MTRTimeSynchronizationClusterDSTOffsetStruct);
  objc_msgSend_offset(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOffset_(v4, v8, (uint64_t)v7);

  objc_msgSend_validStarting(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValidStarting_(v4, v12, (uint64_t)v11);

  objc_msgSend_validUntil(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValidUntil_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: offset:%@; validStarting:%@; validUntil:%@; >"),
    v5,
    self->_offset,
    self->_validStarting,
    self->_validUntil);
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

- (NSNumber)validStarting
{
  return self->_validStarting;
}

- (void)setValidStarting:(NSNumber *)validStarting
{
  objc_setProperty_nonatomic_copy(self, a2, validStarting, 16);
}

- (NSNumber)validUntil
{
  return self->_validUntil;
}

- (void)setValidUntil:(NSNumber *)validUntil
{
  objc_setProperty_nonatomic_copy(self, a2, validUntil, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_validStarting, 0);
  objc_storeStrong((id *)&self->_offset, 0);
}

@end
