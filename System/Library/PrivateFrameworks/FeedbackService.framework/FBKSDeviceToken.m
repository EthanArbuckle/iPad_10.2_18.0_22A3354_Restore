@implementation FBKSDeviceToken

+ (void)clearAllDeviceTokens
{
  SecItemDelete((CFDictionaryRef)objc_msgSend(a1, "_basicParameterWithoutLabel"));
}

+ (id)fetchDeviceTokenForParticipantID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OSStatus v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  CFTypeRef result;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_queryForParticipantID:isForWriting:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDE94C8]);
  result = 0;
  v7 = SecItemCopyMatching((CFDictionaryRef)v6, &result);
  if (v7 == -25300)
  {
    Log_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v4, "unsignedLongValue");
      *(_DWORD *)buf = 134217984;
      v15 = v11;
      _os_log_impl(&dword_23B433000, v9, OS_LOG_TYPE_DEFAULT, "Could not find device token for participant [%lu]", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (v7)
  {
    Log_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[FBKSDeviceToken fetchDeviceTokenForParticipantID:].cold.1();
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v8 = objc_alloc(MEMORY[0x24BDD17C8]);
  v9 = result;
  v10 = (void *)objc_msgSend(v8, "initWithData:encoding:", result, 4);
LABEL_9:

  return v10;
}

+ (void)setDeviceToken:(id)a3 forParticipantID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  OSStatus v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t v19[8];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_queryForParticipantID:isForWriting:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const __CFDictionary *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(a1, "_queryForParticipantID:isForWriting:", v6, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v20 = *MEMORY[0x24BDE9550];
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addEntriesFromDictionary:", v13);
  v14 = SecItemCopyMatching(v9, 0);
  if (v14 == -25300)
  {
    Log_0();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_23B433000, v18, OS_LOG_TYPE_DEFAULT, "Creating new token", v19, 2u);
    }

    if (SecItemAdd((CFDictionaryRef)v11, 0))
    {
      Log_0();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[FBKSDeviceToken setDeviceToken:forParticipantID:].cold.4();
      goto LABEL_19;
    }
  }
  else
  {
    if (v14)
    {
      Log_0();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[FBKSDeviceToken setDeviceToken:forParticipantID:].cold.1();
      goto LABEL_19;
    }
    Log_0();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_23B433000, v15, OS_LOG_TYPE_DEFAULT, "Updating existing token", v19, 2u);
    }

    if (SecItemDelete(v9))
    {
      Log_0();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[FBKSDeviceToken setDeviceToken:forParticipantID:].cold.3();

    }
    if (SecItemAdd((CFDictionaryRef)v11, 0))
    {
      Log_0();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[FBKSDeviceToken setDeviceToken:forParticipantID:].cold.2();
LABEL_19:

    }
  }

}

+ (void)clearDeviceTokenForParticipantID:(id)a3
{
  SecItemDelete((CFDictionaryRef)objc_msgSend(a1, "_queryForParticipantID:isForWriting:", a3, 0));
}

+ (id)_basicParametersForWriting
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDE9220];
  v14[0] = *MEMORY[0x24BDE9230];
  v3 = *MEMORY[0x24BDE9128];
  v13[0] = v2;
  v13[1] = v3;
  +[FBKSSharedConstants appleSeedURL](FBKSSharedConstants, "appleSeedURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDE90A0];
  v14[1] = v6;
  v14[2] = CFSTR("Feedback Assistant");
  v8 = *MEMORY[0x24BDE8F60];
  v13[2] = v7;
  v13[3] = v8;
  v9 = *MEMORY[0x24BDE8F50];
  v14[3] = *MEMORY[0x24BDE8F70];
  v14[4] = CFSTR("group.com.apple.feedback");
  v10 = *MEMORY[0x24BDE9528];
  v13[4] = v9;
  v13[5] = v10;
  v14[5] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_basicParameterWithoutLabel
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDE9220];
  v12[0] = *MEMORY[0x24BDE9230];
  v3 = *MEMORY[0x24BDE9128];
  v11[0] = v2;
  v11[1] = v3;
  +[FBKSSharedConstants appleSeedURL](FBKSSharedConstants, "appleSeedURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDE8F50];
  v12[1] = v6;
  v12[2] = CFSTR("group.com.apple.feedback");
  v8 = *MEMORY[0x24BDE9528];
  v11[2] = v7;
  v11[3] = v8;
  v12[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_queryForParticipantID:(id)a3 isForWriting:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v4 = a4;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BDBCED8];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v7, *MEMORY[0x24BDE8FA8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithDictionary:", v10);

  if (v4)
    objc_msgSend(a1, "_basicParametersForWriting");
  else
    objc_msgSend(a1, "_basicParameterWithoutLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  return v13;
}

+ (void)fetchDeviceTokenForParticipantID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_23B433000, v0, v1, "Failed to fetch device token with error [%i]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)setDeviceToken:forParticipantID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_23B433000, v0, v1, "SecItemCopyMatching failed: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)setDeviceToken:forParticipantID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_23B433000, v0, v1, "Device token update failed: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)setDeviceToken:forParticipantID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_23B433000, v0, v1, "Failed to delete existing token for update with error [%i]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)setDeviceToken:forParticipantID:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_23B433000, v0, v1, "Device token add failed: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
