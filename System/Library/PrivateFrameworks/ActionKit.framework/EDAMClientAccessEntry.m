@implementation EDAMClientAccessEntry

+ (id)structName
{
  return CFSTR("ClientAccessEntry");
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
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[12];

  v17[11] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_2333;
  if (!structFields_structFields_2333)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 10, 1, CFSTR("accessTime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("appName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v15;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("deviceName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("ipAddress"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("location"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 8, 1, CFSTR("browserType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[5] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 8, 1, CFSTR("apiKeyId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[6] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 10, 1, CFSTR("longSessionCreated"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[7] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 8, 1, CFSTR("userId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[8] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 8, 1, CFSTR("authenticatedClientUserId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[9] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 2, 1, CFSTR("businessAdmin"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[10] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_2333;
    structFields_structFields_2333 = v12;

    v2 = (void *)structFields_structFields_2333;
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

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (void)setIpAddress:(id)a3
{
  objc_storeStrong((id *)&self->_ipAddress, a3);
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSNumber)browserType
{
  return self->_browserType;
}

- (void)setBrowserType:(id)a3
{
  objc_storeStrong((id *)&self->_browserType, a3);
}

- (NSNumber)apiKeyId
{
  return self->_apiKeyId;
}

- (void)setApiKeyId:(id)a3
{
  objc_storeStrong((id *)&self->_apiKeyId, a3);
}

- (NSNumber)longSessionCreated
{
  return self->_longSessionCreated;
}

- (void)setLongSessionCreated:(id)a3
{
  objc_storeStrong((id *)&self->_longSessionCreated, a3);
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
  objc_storeStrong((id *)&self->_authenticatedClientUserId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_longSessionCreated, 0);
  objc_storeStrong((id *)&self->_apiKeyId, 0);
  objc_storeStrong((id *)&self->_browserType, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_accessTime, 0);
}

@end
