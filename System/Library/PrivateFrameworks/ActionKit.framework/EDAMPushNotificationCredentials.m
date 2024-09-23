@implementation EDAMPushNotificationCredentials

+ (id)structName
{
  return CFSTR("PushNotificationCredentials");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_318;
  if (!structFields_structFields_318)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 16, 0, CFSTR("iosDeviceToken"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("gcmRegistrationId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)structFields_structFields_318;
    structFields_structFields_318 = v5;

    v2 = (void *)structFields_structFields_318;
  }
  return v2;
}

- (NSData)iosDeviceToken
{
  return self->_iosDeviceToken;
}

- (void)setIosDeviceToken:(id)a3
{
  objc_storeStrong((id *)&self->_iosDeviceToken, a3);
}

- (NSString)gcmRegistrationId
{
  return self->_gcmRegistrationId;
}

- (void)setGcmRegistrationId:(id)a3
{
  objc_storeStrong((id *)&self->_gcmRegistrationId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gcmRegistrationId, 0);
  objc_storeStrong((id *)&self->_iosDeviceToken, 0);
}

@end
