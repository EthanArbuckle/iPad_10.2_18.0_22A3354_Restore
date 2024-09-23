@implementation MTRAccessControlClusterAccessControlExtensionChangedEvent

- (MTRAccessControlClusterAccessControlExtensionChangedEvent)init
{
  MTRAccessControlClusterAccessControlExtensionChangedEvent *v2;
  MTRAccessControlClusterAccessControlExtensionChangedEvent *v3;
  NSNumber *adminNodeID;
  NSNumber *adminPasscodeID;
  NSNumber *changeType;
  MTRAccessControlClusterAccessControlExtensionStruct *latestValue;
  NSNumber *fabricIndex;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRAccessControlClusterAccessControlExtensionChangedEvent;
  v2 = -[MTRAccessControlClusterAccessControlExtensionChangedEvent init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    adminNodeID = v2->_adminNodeID;
    v2->_adminNodeID = 0;

    adminPasscodeID = v3->_adminPasscodeID;
    v3->_adminPasscodeID = 0;

    changeType = v3->_changeType;
    v3->_changeType = (NSNumber *)&unk_250591B18;

    latestValue = v3->_latestValue;
    v3->_latestValue = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRAccessControlClusterAccessControlExtensionChangedEvent *v4;
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

  v4 = objc_alloc_init(MTRAccessControlClusterAccessControlExtensionChangedEvent);
  objc_msgSend_adminNodeID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdminNodeID_(v4, v8, (uint64_t)v7);

  objc_msgSend_adminPasscodeID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdminPasscodeID_(v4, v12, (uint64_t)v11);

  objc_msgSend_changeType(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChangeType_(v4, v16, (uint64_t)v15);

  objc_msgSend_latestValue(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLatestValue_(v4, v20, (uint64_t)v19);

  objc_msgSend_fabricIndex(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v24, (uint64_t)v23);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: adminNodeID:%@; adminPasscodeID:%@; changeType:%@; latestValue:%@; fabricIndex:%@; >"),
    v5,
    self->_adminNodeID,
    self->_adminPasscodeID,
    self->_changeType,
    self->_latestValue,
    self->_fabricIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)adminNodeID
{
  return self->_adminNodeID;
}

- (void)setAdminNodeID:(NSNumber *)adminNodeID
{
  objc_setProperty_nonatomic_copy(self, a2, adminNodeID, 8);
}

- (NSNumber)adminPasscodeID
{
  return self->_adminPasscodeID;
}

- (void)setAdminPasscodeID:(NSNumber *)adminPasscodeID
{
  objc_setProperty_nonatomic_copy(self, a2, adminPasscodeID, 16);
}

- (NSNumber)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(NSNumber *)changeType
{
  objc_setProperty_nonatomic_copy(self, a2, changeType, 24);
}

- (MTRAccessControlClusterAccessControlExtensionStruct)latestValue
{
  return self->_latestValue;
}

- (void)setLatestValue:(MTRAccessControlClusterAccessControlExtensionStruct *)latestValue
{
  objc_setProperty_nonatomic_copy(self, a2, latestValue, 32);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, fabricIndex, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_latestValue, 0);
  objc_storeStrong((id *)&self->_changeType, 0);
  objc_storeStrong((id *)&self->_adminPasscodeID, 0);
  objc_storeStrong((id *)&self->_adminNodeID, 0);
}

@end
