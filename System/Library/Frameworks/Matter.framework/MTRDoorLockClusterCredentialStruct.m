@implementation MTRDoorLockClusterCredentialStruct

- (MTRDoorLockClusterCredentialStruct)init
{
  MTRDoorLockClusterCredentialStruct *v2;
  MTRDoorLockClusterCredentialStruct *v3;
  NSNumber *credentialType;
  NSNumber *credentialIndex;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRDoorLockClusterCredentialStruct;
  v2 = -[MTRDoorLockClusterCredentialStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    credentialType = v2->_credentialType;
    v2->_credentialType = (NSNumber *)&unk_250591B18;

    credentialIndex = v3->_credentialIndex;
    v3->_credentialIndex = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDoorLockClusterCredentialStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRDoorLockClusterCredentialStruct);
  objc_msgSend_credentialType(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCredentialType_(v4, v8, (uint64_t)v7);

  objc_msgSend_credentialIndex(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCredentialIndex_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: credentialType:%@; credentialIndex:%@; >"),
    v5,
    self->_credentialType,
    self->_credentialIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(NSNumber *)credentialType
{
  objc_setProperty_nonatomic_copy(self, a2, credentialType, 8);
}

- (NSNumber)credentialIndex
{
  return self->_credentialIndex;
}

- (void)setCredentialIndex:(NSNumber *)credentialIndex
{
  objc_setProperty_nonatomic_copy(self, a2, credentialIndex, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialIndex, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);
}

@end
