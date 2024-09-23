@implementation MTRAccessControlClusterAccessControlTargetStruct

- (MTRAccessControlClusterAccessControlTargetStruct)init
{
  MTRAccessControlClusterAccessControlTargetStruct *v2;
  MTRAccessControlClusterAccessControlTargetStruct *v3;
  NSNumber *cluster;
  NSNumber *endpoint;
  NSNumber *deviceType;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRAccessControlClusterAccessControlTargetStruct;
  v2 = -[MTRAccessControlClusterAccessControlTargetStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    cluster = v2->_cluster;
    v2->_cluster = 0;

    endpoint = v3->_endpoint;
    v3->_endpoint = 0;

    deviceType = v3->_deviceType;
    v3->_deviceType = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRAccessControlClusterAccessControlTargetStruct *v4;
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

  v4 = objc_alloc_init(MTRAccessControlClusterAccessControlTargetStruct);
  objc_msgSend_cluster(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCluster_(v4, v8, (uint64_t)v7);

  objc_msgSend_endpoint(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndpoint_(v4, v12, (uint64_t)v11);

  objc_msgSend_deviceType(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeviceType_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: cluster:%@; endpoint:%@; deviceType:%@; >"),
    v5,
    self->_cluster,
    self->_endpoint,
    self->_deviceType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)cluster
{
  return self->_cluster;
}

- (void)setCluster:(NSNumber *)cluster
{
  objc_setProperty_nonatomic_copy(self, a2, cluster, 8);
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(NSNumber *)endpoint
{
  objc_setProperty_nonatomic_copy(self, a2, endpoint, 16);
}

- (NSNumber)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(NSNumber *)deviceType
{
  objc_setProperty_nonatomic_copy(self, a2, deviceType, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_cluster, 0);
}

@end
