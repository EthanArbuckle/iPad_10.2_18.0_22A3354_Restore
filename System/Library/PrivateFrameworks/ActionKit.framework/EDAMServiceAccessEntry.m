@implementation EDAMServiceAccessEntry

+ (id)structName
{
  return CFSTR("ServiceAccessEntry");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_2401;
  if (!structFields_structFields_2401)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 10, 1, CFSTR("accessTime"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("serviceName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("userId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 8, 1, CFSTR("authenticatedClientUserId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 8, 1, CFSTR("apiKeyId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 1, CFSTR("businessAdmin"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[5] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)structFields_structFields_2401;
    structFields_structFields_2401 = v9;

    v2 = (void *)structFields_structFields_2401;
  }
  return v2;
}

- (NSNumber)accessTime
{
  return self->_accessTime;
}

- (void)setAccessTime:(id)a3
{
  objc_storeStrong((id *)&self->_accessTime, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSNumber)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (NSNumber)authenticatedClientUserId
{
  return self->_authenticatedClientUserId;
}

- (void)setAuthenticatedClientUserId:(id)a3
{
  objc_storeStrong((id *)&self->_authenticatedClientUserId, a3);
}

- (NSNumber)apiKeyId
{
  return self->_apiKeyId;
}

- (void)setApiKeyId:(id)a3
{
  objc_storeStrong((id *)&self->_apiKeyId, a3);
}

- (NSNumber)businessAdmin
{
  return self->_businessAdmin;
}

- (void)setBusinessAdmin:(id)a3
{
  objc_storeStrong((id *)&self->_businessAdmin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessAdmin, 0);
  objc_storeStrong((id *)&self->_apiKeyId, 0);
  objc_storeStrong((id *)&self->_authenticatedClientUserId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_accessTime, 0);
}

@end
