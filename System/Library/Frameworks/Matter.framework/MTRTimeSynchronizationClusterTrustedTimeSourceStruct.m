@implementation MTRTimeSynchronizationClusterTrustedTimeSourceStruct

- (MTRTimeSynchronizationClusterTrustedTimeSourceStruct)init
{
  MTRTimeSynchronizationClusterTrustedTimeSourceStruct *v2;
  MTRTimeSynchronizationClusterTrustedTimeSourceStruct *v3;
  NSNumber *fabricIndex;
  NSNumber *nodeID;
  NSNumber *endpoint;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRTimeSynchronizationClusterTrustedTimeSourceStruct;
  v2 = -[MTRTimeSynchronizationClusterTrustedTimeSourceStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    fabricIndex = v2->_fabricIndex;
    v2->_fabricIndex = (NSNumber *)&unk_250591B18;

    nodeID = v3->_nodeID;
    v3->_nodeID = (NSNumber *)&unk_250591B18;

    endpoint = v3->_endpoint;
    v3->_endpoint = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRTimeSynchronizationClusterTrustedTimeSourceStruct *v4;
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

  v4 = objc_alloc_init(MTRTimeSynchronizationClusterTrustedTimeSourceStruct);
  objc_msgSend_fabricIndex(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v8, (uint64_t)v7);

  objc_msgSend_nodeID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNodeID_(v4, v12, (uint64_t)v11);

  objc_msgSend_endpoint(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndpoint_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: fabricIndex:%@; nodeID:%@; endpoint:%@; >"),
    v5,
    self->_fabricIndex,
    self->_nodeID,
    self->_endpoint);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (void)setNodeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_fabricIndex, 0);
}

@end
