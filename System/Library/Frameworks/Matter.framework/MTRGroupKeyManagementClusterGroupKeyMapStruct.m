@implementation MTRGroupKeyManagementClusterGroupKeyMapStruct

- (MTRGroupKeyManagementClusterGroupKeyMapStruct)init
{
  MTRGroupKeyManagementClusterGroupKeyMapStruct *v2;
  MTRGroupKeyManagementClusterGroupKeyMapStruct *v3;
  NSNumber *groupId;
  NSNumber *groupKeySetID;
  NSNumber *fabricIndex;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRGroupKeyManagementClusterGroupKeyMapStruct;
  v2 = -[MTRGroupKeyManagementClusterGroupKeyMapStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    groupId = v2->_groupId;
    v2->_groupId = (NSNumber *)&unk_250591B18;

    groupKeySetID = v3->_groupKeySetID;
    v3->_groupKeySetID = (NSNumber *)&unk_250591B18;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRGroupKeyManagementClusterGroupKeyMapStruct *v4;
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

  v4 = objc_alloc_init(MTRGroupKeyManagementClusterGroupKeyMapStruct);
  objc_msgSend_groupId(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupId_(v4, v8, (uint64_t)v7);

  objc_msgSend_groupKeySetID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupKeySetID_(v4, v12, (uint64_t)v11);

  objc_msgSend_fabricIndex(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: groupId:%@; groupKeySetID:%@; fabricIndex:%@; >"),
    v5,
    self->_groupId,
    self->_groupKeySetID,
    self->_fabricIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(NSNumber *)groupId
{
  objc_setProperty_nonatomic_copy(self, a2, groupId, 8);
}

- (NSNumber)groupKeySetID
{
  return self->_groupKeySetID;
}

- (void)setGroupKeySetID:(NSNumber *)groupKeySetID
{
  objc_setProperty_nonatomic_copy(self, a2, groupKeySetID, 16);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, fabricIndex, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_groupKeySetID, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
}

@end
