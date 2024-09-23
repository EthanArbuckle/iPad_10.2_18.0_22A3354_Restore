@implementation MTRClusterPath

- (MTRClusterPath)initWithPath:(const ConcreteClusterPath *)a3
{
  const char *v4;
  MTRClusterPath *v5;
  uint64_t v6;
  NSNumber *endpoint;
  const char *v8;
  uint64_t v9;
  NSNumber *cluster;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRClusterPath;
  v5 = -[MTRClusterPath init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v4, a3->mEndpointId);
    v6 = objc_claimAutoreleasedReturnValue();
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSNumber *)v6;

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v8, a3->mClusterId);
    v9 = objc_claimAutoreleasedReturnValue();
    cluster = v5->_cluster;
    v5->_cluster = (NSNumber *)v9;

  }
  return v5;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  unsigned int v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend_unsignedShortValue(self->_endpoint, a2, v2);
  v8 = objc_msgSend_unsignedLongValue(self->_cluster, v6, v7);
  return (id)objc_msgSend_stringWithFormat_(v4, v9, (uint64_t)CFSTR("<MTRClusterPath endpoint %u cluster %u>"), v5, v8);
}

+ (MTRClusterPath)clusterPathWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID
{
  NSNumber *v5;
  NSNumber *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  MTRClusterPath *v11;
  const char *v12;
  void *v13;
  _WORD v15[2];
  int v16;

  v5 = endpointID;
  v6 = clusterID;
  v15[0] = objc_msgSend_unsignedShortValue(v5, v7, v8);
  v16 = objc_msgSend_unsignedLongValue(v6, v9, v10);
  v11 = [MTRClusterPath alloc];
  v13 = (void *)objc_msgSend_initWithPath_(v11, v12, (uint64_t)v15);

  return (MTRClusterPath *)v13;
}

- (BOOL)isEqualToClusterPath:(id)a3
{
  id v4;
  NSNumber *endpoint;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSNumber *cluster;
  void *v12;
  char v13;

  v4 = a3;
  endpoint = self->_endpoint;
  objc_msgSend_endpoint(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (sub_233BF4AA0(endpoint, v8))
  {
    cluster = self->_cluster;
    objc_msgSend_cluster(v4, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = sub_233BF4AA0(cluster, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  char isEqualToClusterPath;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    isEqualToClusterPath = objc_msgSend_isEqualToClusterPath_(self, v6, (uint64_t)v4);
  else
    isEqualToClusterPath = 0;

  return isEqualToClusterPath;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_unsignedShortValue(self->_endpoint, a2, v2);
  return objc_msgSend_unsignedLongValue(self->_cluster, v5, v6) ^ v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_msgSend_clusterPathWithEndpointID_clusterID_(MTRClusterPath, a2, (uint64_t)self->_endpoint, self->_cluster);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTRClusterPath)initWithCoder:(id)a3
{
  id v4;
  MTRClusterPath *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSNumber *endpoint;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSNumber *cluster;
  MTRClusterPath *v14;
  NSObject *v15;
  NSNumber *v16;
  NSObject *v17;
  NSNumber *v18;
  objc_super v20;
  uint8_t buf[4];
  NSNumber *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTRClusterPath;
  v5 = -[MTRClusterPath init](&v20, sel_init);
  if (!v5)
    goto LABEL_15;
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("endpointKey"));
  v8 = objc_claimAutoreleasedReturnValue();
  endpoint = v5->_endpoint;
  v5->_endpoint = (NSNumber *)v8;

  if (v5->_endpoint)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      sub_234117B80(0, "NotSpecified");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = v5->_endpoint;
        *(_DWORD *)buf = 138412290;
        v22 = v16;
        _os_log_impl(&dword_233BF3000, v15, OS_LOG_TYPE_ERROR, "MTRClusterPath decoded %@ for endpoint, not NSNumber.", buf, 0xCu);
      }

      if (!sub_234114844(1u))
        goto LABEL_15;
LABEL_14:
      sub_2341147D0(0, 1);
LABEL_15:
      v14 = 0;
      goto LABEL_16;
    }
  }
  v10 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("clusterKey"));
  v12 = objc_claimAutoreleasedReturnValue();
  cluster = v5->_cluster;
  v5->_cluster = (NSNumber *)v12;

  if (v5->_cluster)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      sub_234117B80(0, "NotSpecified");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = v5->_cluster;
        *(_DWORD *)buf = 138412290;
        v22 = v18;
        _os_log_impl(&dword_233BF3000, v17, OS_LOG_TYPE_ERROR, "MTRClusterPath decoded %@ for cluster, not NSNumber.", buf, 0xCu);
      }

      if (!sub_234114844(1u))
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  v14 = v5;
LABEL_16:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  const char *v5;
  id v6;

  v6 = a3;
  objc_msgSend_encodeObject_forKey_(v6, v4, (uint64_t)self->_endpoint, CFSTR("endpointKey"));
  objc_msgSend_encodeObject_forKey_(v6, v5, (uint64_t)self->_cluster, CFSTR("clusterKey"));

}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (NSNumber)cluster
{
  return self->_cluster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cluster, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
