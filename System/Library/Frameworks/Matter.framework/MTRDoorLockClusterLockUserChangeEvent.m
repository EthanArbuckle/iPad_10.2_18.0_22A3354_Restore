@implementation MTRDoorLockClusterLockUserChangeEvent

- (MTRDoorLockClusterLockUserChangeEvent)init
{
  MTRDoorLockClusterLockUserChangeEvent *v2;
  MTRDoorLockClusterLockUserChangeEvent *v3;
  NSNumber *lockDataType;
  NSNumber *dataOperationType;
  NSNumber *operationSource;
  NSNumber *userIndex;
  NSNumber *fabricIndex;
  NSNumber *sourceNode;
  NSNumber *dataIndex;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRDoorLockClusterLockUserChangeEvent;
  v2 = -[MTRDoorLockClusterLockUserChangeEvent init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    lockDataType = v2->_lockDataType;
    v2->_lockDataType = (NSNumber *)&unk_250591B18;

    dataOperationType = v3->_dataOperationType;
    v3->_dataOperationType = (NSNumber *)&unk_250591B18;

    operationSource = v3->_operationSource;
    v3->_operationSource = (NSNumber *)&unk_250591B18;

    userIndex = v3->_userIndex;
    v3->_userIndex = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = 0;

    sourceNode = v3->_sourceNode;
    v3->_sourceNode = 0;

    dataIndex = v3->_dataIndex;
    v3->_dataIndex = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDoorLockClusterLockUserChangeEvent *v4;
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

  v4 = objc_alloc_init(MTRDoorLockClusterLockUserChangeEvent);
  objc_msgSend_lockDataType(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLockDataType_(v4, v8, (uint64_t)v7);

  objc_msgSend_dataOperationType(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDataOperationType_(v4, v12, (uint64_t)v11);

  objc_msgSend_operationSource(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationSource_(v4, v16, (uint64_t)v15);

  objc_msgSend_userIndex(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIndex_(v4, v20, (uint64_t)v19);

  objc_msgSend_fabricIndex(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v24, (uint64_t)v23);

  objc_msgSend_sourceNode(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSourceNode_(v4, v28, (uint64_t)v27);

  objc_msgSend_dataIndex(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDataIndex_(v4, v32, (uint64_t)v31);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: lockDataType:%@; dataOperationType:%@; operationSource:%@; userIndex:%@; fabricIndex:%@; sourceNode:%@; dataIndex:%@; >"),
    v5,
    self->_lockDataType,
    self->_dataOperationType,
    self->_operationSource,
    self->_userIndex,
    self->_fabricIndex,
    self->_sourceNode,
    self->_dataIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)lockDataType
{
  return self->_lockDataType;
}

- (void)setLockDataType:(NSNumber *)lockDataType
{
  objc_setProperty_nonatomic_copy(self, a2, lockDataType, 8);
}

- (NSNumber)dataOperationType
{
  return self->_dataOperationType;
}

- (void)setDataOperationType:(NSNumber *)dataOperationType
{
  objc_setProperty_nonatomic_copy(self, a2, dataOperationType, 16);
}

- (NSNumber)operationSource
{
  return self->_operationSource;
}

- (void)setOperationSource:(NSNumber *)operationSource
{
  objc_setProperty_nonatomic_copy(self, a2, operationSource, 24);
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

- (NSNumber)dataIndex
{
  return self->_dataIndex;
}

- (void)setDataIndex:(NSNumber *)dataIndex
{
  objc_setProperty_nonatomic_copy(self, a2, dataIndex, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataIndex, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);
  objc_storeStrong((id *)&self->_operationSource, 0);
  objc_storeStrong((id *)&self->_dataOperationType, 0);
  objc_storeStrong((id *)&self->_lockDataType, 0);
}

@end
