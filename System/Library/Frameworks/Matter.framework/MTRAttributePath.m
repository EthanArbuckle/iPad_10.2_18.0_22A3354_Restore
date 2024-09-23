@implementation MTRAttributePath

- (MTRAttributePath)initWithPath:(const void *)a3
{
  const char *v4;
  MTRAttributePath *v5;
  uint64_t v6;
  NSNumber *attribute;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRAttributePath;
  v5 = -[MTRClusterPath initWithPath:](&v9, sel_initWithPath_);
  if (v5)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v4, *((unsigned int *)a3 + 2));
    v6 = objc_claimAutoreleasedReturnValue();
    attribute = v5->_attribute;
    v5->_attribute = (NSNumber *)v6;

  }
  return v5;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_endpoint(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_unsignedShortValue(v5, v6, v7);
  objc_msgSend_cluster(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_unsignedLongValue(v11, v12, v13);
  v17 = objc_msgSend_unsignedLongValue(self->_attribute, v15, v16);
  objc_msgSend_stringWithFormat_(v4, v18, (uint64_t)CFSTR("<MTRAttributePath endpoint %u cluster %u attribute %u>"), v8, v14, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (MTRAttributePath)attributePathWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID
{
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  MTRAttributePath *v16;
  const char *v17;
  void *v18;
  __int16 v20;
  char v21;
  int v22;
  int v23;
  __int16 v24;
  char v25;
  char v26;

  v7 = endpointID;
  v8 = clusterID;
  v9 = attributeID;
  v20 = objc_msgSend_unsignedShortValue(v7, v10, v11);
  v22 = objc_msgSend_unsignedLongValue(v8, v12, v13);
  v23 = objc_msgSend_unsignedLongValue(v9, v14, v15);
  v21 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v16 = [MTRAttributePath alloc];
  v18 = (void *)objc_msgSend_initWithPath_(v16, v17, (uint64_t)&v20);

  return (MTRAttributePath *)v18;
}

- (BOOL)isEqualToAttributePath:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  NSNumber *attribute;
  void *v9;
  char v10;

  v4 = a3;
  if (objc_msgSend_isEqualToClusterPath_(self, v5, (uint64_t)v4))
  {
    attribute = self->_attribute;
    objc_msgSend_attribute(v4, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = sub_233BF4AA0(attribute, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  char isEqualToAttributePath;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    isEqualToAttributePath = objc_msgSend_isEqualToAttributePath_(self, v6, (uint64_t)v4);
  else
    isEqualToAttributePath = 0;

  return isEqualToAttributePath;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  unsigned int v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;

  objc_msgSend_endpoint(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_unsignedShortValue(v4, v5, v6);
  objc_msgSend_cluster(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_unsignedLongValue(v10, v11, v12);
  v16 = v13 ^ v7 ^ objc_msgSend_unsignedLongValue(self->_attribute, v14, v15);

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  objc_msgSend_endpoint(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cluster(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v8, (uint64_t)v4, v7, self->_attribute);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ConcreteAttributePath)_asConcretePath
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  unsigned int v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  unsigned int v19;
  unint64_t v20;
  unsigned int v21;
  ConcreteAttributePath result;

  objc_msgSend_endpoint(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_unsignedShortValue(v4, v5, v6);
  objc_msgSend_cluster(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_unsignedLongValue(v10, v11, v12);
  objc_msgSend_attribute(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_unsignedLongValue(v16, v17, v18);

  v20 = v7 | (unint64_t)(v13 << 32);
  v21 = v19;
  result.var0 = v20;
  result.var1 = BYTE2(v20);
  result.var2 = HIDWORD(v20);
  result.var3 = v21;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTRAttributePath)initWithCoder:(id)a3
{
  id v4;
  MTRAttributePath *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSNumber *attribute;
  MTRAttributePath *v10;
  NSObject *v11;
  NSNumber *v12;
  objc_super v14;
  uint8_t buf[4];
  NSNumber *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTRAttributePath;
  v5 = -[MTRClusterPath initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (!v5)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("attributeKey"));
  v8 = objc_claimAutoreleasedReturnValue();
  attribute = v5->_attribute;
  v5->_attribute = (NSNumber *)v8;

  if (v5->_attribute)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      sub_234117B80(0, "NotSpecified");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = v5->_attribute;
        *(_DWORD *)buf = 138412290;
        v16 = v12;
        _os_log_impl(&dword_233BF3000, v11, OS_LOG_TYPE_ERROR, "MTRAttributePath decoded %@ for attribute, not NSNumber.", buf, 0xCu);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      goto LABEL_9;
    }
  }
  v10 = v5;
LABEL_10:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTRAttributePath;
  -[MTRClusterPath encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_attribute, CFSTR("attributeKey"));

}

- (NSNumber)attribute
{
  return self->_attribute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribute, 0);
}

+ (MTRAttributePath)attributePathWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId attributeId:(NSNumber *)attributeId
{
  objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(a1, a2, (uint64_t)endpointId, clusterId, attributeId);
  return (MTRAttributePath *)(id)objc_claimAutoreleasedReturnValue();
}

@end
