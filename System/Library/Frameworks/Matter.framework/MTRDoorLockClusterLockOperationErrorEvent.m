@implementation MTRDoorLockClusterLockOperationErrorEvent

- (MTRDoorLockClusterLockOperationErrorEvent)init
{
  MTRDoorLockClusterLockOperationErrorEvent *v2;
  MTRDoorLockClusterLockOperationErrorEvent *v3;
  NSNumber *lockOperationType;
  NSNumber *operationSource;
  NSNumber *operationError;
  NSNumber *userIndex;
  NSNumber *fabricIndex;
  NSNumber *sourceNode;
  NSArray *credentials;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRDoorLockClusterLockOperationErrorEvent;
  v2 = -[MTRDoorLockClusterLockOperationErrorEvent init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    lockOperationType = v2->_lockOperationType;
    v2->_lockOperationType = (NSNumber *)&unk_250591B18;

    operationSource = v3->_operationSource;
    v3->_operationSource = (NSNumber *)&unk_250591B18;

    operationError = v3->_operationError;
    v3->_operationError = (NSNumber *)&unk_250591B18;

    userIndex = v3->_userIndex;
    v3->_userIndex = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = 0;

    sourceNode = v3->_sourceNode;
    v3->_sourceNode = 0;

    credentials = v3->_credentials;
    v3->_credentials = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDoorLockClusterLockOperationErrorEvent *v4;
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
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;

  v4 = objc_alloc_init(MTRDoorLockClusterLockOperationErrorEvent);
  objc_msgSend_lockOperationType(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLockOperationType_(v4, v8, (uint64_t)v7);

  objc_msgSend_operationSource(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationSource_(v4, v12, (uint64_t)v11);

  objc_msgSend_operationError(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationError_(v4, v16, (uint64_t)v15);

  objc_msgSend_userIndex(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIndex_(v4, v20, (uint64_t)v19);

  objc_msgSend_fabricIndex(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v24, (uint64_t)v23);

  objc_msgSend_sourceNode(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSourceNode_(v4, v28, (uint64_t)v27);

  objc_msgSend_credentials(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCredentials_(v4, v32, (uint64_t)v31);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: lockOperationType:%@; operationSource:%@; operationError:%@; userIndex:%@; fabricIndex:%@; sourceNode:%@; credentials:%@; >"),
    v5,
    self->_lockOperationType,
    self->_operationSource,
    self->_operationError,
    self->_userIndex,
    self->_fabricIndex,
    self->_sourceNode,
    self->_credentials);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)lockOperationType
{
  return self->_lockOperationType;
}

- (void)setLockOperationType:(NSNumber *)lockOperationType
{
  objc_setProperty_nonatomic_copy(self, a2, lockOperationType, 8);
}

- (NSNumber)operationSource
{
  return self->_operationSource;
}

- (void)setOperationSource:(NSNumber *)operationSource
{
  objc_setProperty_nonatomic_copy(self, a2, operationSource, 16);
}

- (NSNumber)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(NSNumber *)operationError
{
  objc_setProperty_nonatomic_copy(self, a2, operationError, 24);
}

- (NSNumber)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(NSNumber *)userIndex
{
  objc_setProperty_nonatomic_copy(self, a2, userIndex, 32);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, fabricIndex, 40);
}

- (NSNumber)sourceNode
{
  return self->_sourceNode;
}

- (void)setSourceNode:(NSNumber *)sourceNode
{
  objc_setProperty_nonatomic_copy(self, a2, sourceNode, 48);
}

- (NSArray)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(NSArray *)credentials
{
  objc_setProperty_nonatomic_copy(self, a2, credentials, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
  objc_storeStrong((id *)&self->_operationSource, 0);
  objc_storeStrong((id *)&self->_lockOperationType, 0);
}

@end
