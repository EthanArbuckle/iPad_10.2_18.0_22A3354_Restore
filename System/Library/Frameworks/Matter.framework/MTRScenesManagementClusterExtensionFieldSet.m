@implementation MTRScenesManagementClusterExtensionFieldSet

- (MTRScenesManagementClusterExtensionFieldSet)init
{
  MTRScenesManagementClusterExtensionFieldSet *v2;
  MTRScenesManagementClusterExtensionFieldSet *v3;
  NSNumber *clusterID;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *attributeValueList;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRScenesManagementClusterExtensionFieldSet;
  v2 = -[MTRScenesManagementClusterExtensionFieldSet init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    clusterID = v2->_clusterID;
    v2->_clusterID = (NSNumber *)&unk_250591B18;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    attributeValueList = v3->_attributeValueList;
    v3->_attributeValueList = (NSArray *)v7;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRScenesManagementClusterExtensionFieldSet *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRScenesManagementClusterExtensionFieldSet);
  objc_msgSend_clusterID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClusterID_(v4, v8, (uint64_t)v7);

  objc_msgSend_attributeValueList(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttributeValueList_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: clusterID:%@; attributeValueList:%@; >"),
    v5,
    self->_clusterID,
    self->_attributeValueList);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)clusterID
{
  return self->_clusterID;
}

- (void)setClusterID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)attributeValueList
{
  return self->_attributeValueList;
}

- (void)setAttributeValueList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeValueList, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
}

@end
