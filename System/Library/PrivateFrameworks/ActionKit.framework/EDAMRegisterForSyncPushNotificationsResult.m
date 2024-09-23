@implementation EDAMRegisterForSyncPushNotificationsResult

+ (id)structName
{
  return CFSTR("RegisterForSyncPushNotificationsResult");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_338;
  if (!structFields_structFields_338)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 16, 1, CFSTR("sharedSecret"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)structFields_structFields_338;
    structFields_structFields_338 = v4;

    v2 = (void *)structFields_structFields_338;
  }
  return v2;
}

- (NSData)sharedSecret
{
  return self->_sharedSecret;
}

- (void)setSharedSecret:(id)a3
{
  objc_storeStrong((id *)&self->_sharedSecret, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedSecret, 0);
}

@end
