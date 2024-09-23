@implementation FCDeviceIdentifierForVendor

void __FCDeviceIdentifierForVendor_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  NewsCoreSensitiveUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("instance_identifier"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0F85A0;
  qword_1ED0F85A0 = v1;

  if (!qword_1ED0F85A0)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deviceIdentifierForVendor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = (void *)qword_1ED0F85A0;
    qword_1ED0F85A0 = v6;

    if (!qword_1ED0F85A0)
    {
      v8 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "falling back to custom UUID for device identifier", v13, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)qword_1ED0F85A0;
      qword_1ED0F85A0 = v10;

    }
    NewsCoreSensitiveUserDefaults();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", qword_1ED0F85A0, CFSTR("instance_identifier"));

  }
}

@end
