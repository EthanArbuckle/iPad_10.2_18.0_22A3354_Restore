@implementation MTRActionsClusterEndpointListStruct

- (MTRActionsClusterEndpointListStruct)init
{
  MTRActionsClusterEndpointListStruct *v2;
  MTRActionsClusterEndpointListStruct *v3;
  NSNumber *endpointListID;
  NSString *name;
  NSNumber *type;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *endpoints;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRActionsClusterEndpointListStruct;
  v2 = -[MTRActionsClusterEndpointListStruct init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    endpointListID = v2->_endpointListID;
    v2->_endpointListID = (NSNumber *)&unk_250591B18;

    name = v3->_name;
    v3->_name = (NSString *)&stru_2505249E8;

    type = v3->_type;
    v3->_type = (NSNumber *)&unk_250591B18;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    endpoints = v3->_endpoints;
    v3->_endpoints = (NSArray *)v9;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRActionsClusterEndpointListStruct *v4;
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

  v4 = objc_alloc_init(MTRActionsClusterEndpointListStruct);
  objc_msgSend_endpointListID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndpointListID_(v4, v8, (uint64_t)v7);

  objc_msgSend_name(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

  objc_msgSend_type(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setType_(v4, v16, (uint64_t)v15);

  objc_msgSend_endpoints(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndpoints_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: endpointListID:%@; name:%@; type:%@; endpoints:%@; >"),
    v5,
    self->_endpointListID,
    self->_name,
    self->_type,
    self->_endpoints);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)endpointListID
{
  return self->_endpointListID;
}

- (void)setEndpointListID:(NSNumber *)endpointListID
{
  objc_setProperty_nonatomic_copy(self, a2, endpointListID, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 16);
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(NSNumber *)type
{
  objc_setProperty_nonatomic_copy(self, a2, type, 24);
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(NSArray *)endpoints
{
  objc_setProperty_nonatomic_copy(self, a2, endpoints, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_endpointListID, 0);
}

@end
