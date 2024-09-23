@implementation EDAMUserUrls

+ (id)structName
{
  return CFSTR("UserUrls");
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
  v2 = (void *)structFields_structFields_59;
  if (!structFields_structFields_59)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("noteStoreUrl"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("webApiUrlPrefix"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("userStoreUrl"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("utilityUrl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("messageStoreUrl"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("userWebSocketUrl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[5] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 11, 1, CFSTR("communicationEngineUrl"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[6] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)structFields_structFields_59;
    structFields_structFields_59 = v10;

    v2 = (void *)structFields_structFields_59;
  }
  return v2;
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

- (NSString)userStoreUrl
{
  return self->_userStoreUrl;
}

- (void)setUserStoreUrl:(id)a3
{
  objc_storeStrong((id *)&self->_userStoreUrl, a3);
}

- (NSString)utilityUrl
{
  return self->_utilityUrl;
}

- (void)setUtilityUrl:(id)a3
{
  objc_storeStrong((id *)&self->_utilityUrl, a3);
}

- (NSString)messageStoreUrl
{
  return self->_messageStoreUrl;
}

- (void)setMessageStoreUrl:(id)a3
{
  objc_storeStrong((id *)&self->_messageStoreUrl, a3);
}

- (NSString)userWebSocketUrl
{
  return self->_userWebSocketUrl;
}

- (void)setUserWebSocketUrl:(id)a3
{
  objc_storeStrong((id *)&self->_userWebSocketUrl, a3);
}

- (NSString)communicationEngineUrl
{
  return self->_communicationEngineUrl;
}

- (void)setCommunicationEngineUrl:(id)a3
{
  objc_storeStrong((id *)&self->_communicationEngineUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationEngineUrl, 0);
  objc_storeStrong((id *)&self->_userWebSocketUrl, 0);
  objc_storeStrong((id *)&self->_messageStoreUrl, 0);
  objc_storeStrong((id *)&self->_utilityUrl, 0);
  objc_storeStrong((id *)&self->_userStoreUrl, 0);
  objc_storeStrong((id *)&self->_webApiUrlPrefix, 0);
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
}

@end
