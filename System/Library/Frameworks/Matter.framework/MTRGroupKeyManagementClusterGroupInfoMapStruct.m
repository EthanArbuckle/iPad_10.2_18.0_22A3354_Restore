@implementation MTRGroupKeyManagementClusterGroupInfoMapStruct

- (MTRGroupKeyManagementClusterGroupInfoMapStruct)init
{
  MTRGroupKeyManagementClusterGroupInfoMapStruct *v2;
  MTRGroupKeyManagementClusterGroupInfoMapStruct *v3;
  NSNumber *groupId;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *endpoints;
  NSString *groupName;
  NSNumber *fabricIndex;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRGroupKeyManagementClusterGroupInfoMapStruct;
  v2 = -[MTRGroupKeyManagementClusterGroupInfoMapStruct init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    groupId = v2->_groupId;
    v2->_groupId = (NSNumber *)&unk_250591B18;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    endpoints = v3->_endpoints;
    v3->_endpoints = (NSArray *)v7;

    groupName = v3->_groupName;
    v3->_groupName = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRGroupKeyManagementClusterGroupInfoMapStruct *v4;
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

  v4 = objc_alloc_init(MTRGroupKeyManagementClusterGroupInfoMapStruct);
  objc_msgSend_groupId(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupId_(v4, v8, (uint64_t)v7);

  objc_msgSend_endpoints(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndpoints_(v4, v12, (uint64_t)v11);

  objc_msgSend_groupName(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupName_(v4, v16, (uint64_t)v15);

  objc_msgSend_fabricIndex(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: groupId:%@; endpoints:%@; groupName:%@; fabricIndex:%@; >"),
    v5,
    self->_groupId,
    self->_endpoints,
    self->_groupName,
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

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(NSArray *)endpoints
{
  objc_setProperty_nonatomic_copy(self, a2, endpoints, 16);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(NSString *)groupName
{
  objc_setProperty_nonatomic_copy(self, a2, groupName, 24);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, fabricIndex, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
}

@end
