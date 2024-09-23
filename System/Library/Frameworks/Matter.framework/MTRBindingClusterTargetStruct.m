@implementation MTRBindingClusterTargetStruct

- (MTRBindingClusterTargetStruct)init
{
  MTRBindingClusterTargetStruct *v2;
  MTRBindingClusterTargetStruct *v3;
  NSNumber *node;
  NSNumber *group;
  NSNumber *endpoint;
  NSNumber *cluster;
  NSNumber *fabricIndex;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRBindingClusterTargetStruct;
  v2 = -[MTRBindingClusterTargetStruct init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    node = v2->_node;
    v2->_node = 0;

    group = v3->_group;
    v3->_group = 0;

    endpoint = v3->_endpoint;
    v3->_endpoint = 0;

    cluster = v3->_cluster;
    v3->_cluster = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRBindingClusterTargetStruct *v4;
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

  v4 = objc_alloc_init(MTRBindingClusterTargetStruct);
  objc_msgSend_node(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNode_(v4, v8, (uint64_t)v7);

  objc_msgSend_group(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroup_(v4, v12, (uint64_t)v11);

  objc_msgSend_endpoint(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndpoint_(v4, v16, (uint64_t)v15);

  objc_msgSend_cluster(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCluster_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: node:%@; group:%@; endpoint:%@; cluster:%@; fabricIndex:%@; >"),
    v5,
    self->_node,
    self->_group,
    self->_endpoint,
    self->_cluster,
    self->_fabricIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)node
{
  return self->_node;
}

- (void)setNode:(NSNumber *)node
{
  objc_setProperty_nonatomic_copy(self, a2, node, 8);
}

- (NSNumber)group
{
  return self->_group;
}

- (void)setGroup:(NSNumber *)group
{
  objc_setProperty_nonatomic_copy(self, a2, group, 16);
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(NSNumber *)endpoint
{
  objc_setProperty_nonatomic_copy(self, a2, endpoint, 24);
}

- (NSNumber)cluster
{
  return self->_cluster;
}

- (void)setCluster:(NSNumber *)cluster
{
  objc_setProperty_nonatomic_copy(self, a2, cluster, 32);
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
  objc_storeStrong((id *)&self->_cluster, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

@end
