@implementation EDAMPublicUserInfo

+ (id)structName
{
  return CFSTR("PublicUserInfo");
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
  uint64_t v10;
  void *v11;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_21656;
  if (!structFields_structFields_21656)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 0, CFSTR("userId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("shardId"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("privilege"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 8, 1, CFSTR("serviceLevel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("username"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("noteStoreUrl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[5] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("webApiUrlPrefix"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[6] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)structFields_structFields_21656;
    structFields_structFields_21656 = v10;

    v2 = (void *)structFields_structFields_21656;
  }
  return v2;
}

- (NSNumber)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (NSString)shardId
{
  return self->_shardId;
}

- (void)setShardId:(id)a3
{
  objc_storeStrong((id *)&self->_shardId, a3);
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setPrivilege:(id)a3
{
  objc_storeStrong((id *)&self->_privilege, a3);
}

- (NSNumber)serviceLevel
{
  return self->_serviceLevel;
}

- (void)setServiceLevel:(id)a3
{
  objc_storeStrong((id *)&self->_serviceLevel, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)noteStoreUrl
{
  return self->_noteStoreUrl;
}

- (void)setNoteStoreUrl:(id)a3
{
  objc_storeStrong((id *)&self->_noteStoreUrl, a3);
}

- (NSString)webApiUrlPrefix
{
  return self->_webApiUrlPrefix;
}

- (void)setWebApiUrlPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_webApiUrlPrefix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webApiUrlPrefix, 0);
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_serviceLevel, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_shardId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
}

@end
