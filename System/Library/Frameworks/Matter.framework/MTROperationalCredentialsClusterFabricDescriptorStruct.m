@implementation MTROperationalCredentialsClusterFabricDescriptorStruct

- (MTROperationalCredentialsClusterFabricDescriptorStruct)init
{
  const char *v2;
  uint64_t v3;
  MTROperationalCredentialsClusterFabricDescriptorStruct *v4;
  uint64_t v5;
  NSData *rootPublicKey;
  NSNumber *vendorID;
  NSNumber *fabricID;
  NSNumber *nodeID;
  NSString *label;
  NSNumber *fabricIndex;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTROperationalCredentialsClusterFabricDescriptorStruct;
  v4 = -[MTROperationalCredentialsClusterFabricDescriptorStruct init](&v13, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    rootPublicKey = v4->_rootPublicKey;
    v4->_rootPublicKey = (NSData *)v5;

    vendorID = v4->_vendorID;
    v4->_vendorID = (NSNumber *)&unk_250591B18;

    fabricID = v4->_fabricID;
    v4->_fabricID = (NSNumber *)&unk_250591B18;

    nodeID = v4->_nodeID;
    v4->_nodeID = (NSNumber *)&unk_250591B18;

    label = v4->_label;
    v4->_label = (NSString *)&stru_2505249E8;

    fabricIndex = v4->_fabricIndex;
    v4->_fabricIndex = (NSNumber *)&unk_250591B18;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROperationalCredentialsClusterFabricDescriptorStruct *v4;
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

  v4 = objc_alloc_init(MTROperationalCredentialsClusterFabricDescriptorStruct);
  objc_msgSend_rootPublicKey(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRootPublicKey_(v4, v8, (uint64_t)v7);

  objc_msgSend_vendorID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVendorID_(v4, v12, (uint64_t)v11);

  objc_msgSend_fabricID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricID_(v4, v16, (uint64_t)v15);

  objc_msgSend_nodeID(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNodeID_(v4, v20, (uint64_t)v19);

  objc_msgSend_label(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v4, v24, (uint64_t)v23);

  objc_msgSend_fabricIndex(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_rootPublicKey, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: rootPublicKey:%@; vendorID:%@; fabricID:%@; nodeID:%@; label:%@; fabricIndex:%@; >"),
    v5,
    v7,
    self->_vendorID,
    self->_fabricID,
    self->_nodeID,
    self->_label,
    self->_fabricIndex);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)rootPublicKey
{
  return self->_rootPublicKey;
}

- (void)setRootPublicKey:(NSData *)rootPublicKey
{
  objc_setProperty_nonatomic_copy(self, a2, rootPublicKey, 8);
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(NSNumber *)vendorID
{
  objc_setProperty_nonatomic_copy(self, a2, vendorID, 16);
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (void)setFabricID:(NSNumber *)fabricID
{
  objc_setProperty_nonatomic_copy(self, a2, fabricID, 24);
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (void)setNodeID:(NSNumber *)nodeID
{
  objc_setProperty_nonatomic_copy(self, a2, nodeID, 32);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
  objc_setProperty_nonatomic_copy(self, a2, label, 40);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, fabricIndex, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
}

@end
