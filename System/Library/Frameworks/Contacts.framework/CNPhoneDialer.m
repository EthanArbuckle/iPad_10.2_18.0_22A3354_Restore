@implementation CNPhoneDialer

+ (id)dialNumber:(id)a3 displayName:(id)a4 error:(id *)a5
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "URLWithPhoneNumber:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openSensitiveURL:withOptions:", v5, 0);

  return 0;
}

+ (id)URLWithPhoneNumber:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "sanitizePhoneNumber:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tel:%@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sanitizePhoneNumber:(id)a3
{
  return a3;
}

+ (id)sendDialMessage:(id)a3 displayName:(id)a4 error:(id *)a5
{
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  objc_msgSend(a1, "dialMessageWithDataValue:displayName:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend(a1, "sendMessage:error:", v7, &v13);
  v9 = v13;
  v10 = v9;
  if ((v8 & 1) == 0)
    NSLog(CFSTR("Error dialing: %@"), v9);
  if (a5)
    *a5 = objc_retainAutorelease(v10);
  objc_msgSend(v7, "objectForKey:", CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)dialMessageWithDataValue:(id)a3 displayName:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", CFSTR("dial"), CFSTR("command"));
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("TUCallServicesDestinationIDKey"));
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("dataValue"));

  objc_msgSend(v9, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("shouldPrompt"));
  objc_msgSend(v9, "_cn_setNonNilObject:forKey:", v7, CFSTR("displayName"));

  objc_msgSend(v9, "setObject:forKey:", &unk_1E2A40080, CFSTR("ttl"));
  objc_msgSend(a1, "messageWithAdditionalParameters:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)cancelDialMessage:(id)a3 error:(id *)a4
{
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v11;

  objc_msgSend(a1, "cancelMessageWithDialMessageID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(a1, "sendMessage:error:", v6, &v11);
  v8 = v11;
  v9 = v8;
  if ((v7 & 1) == 0)
    NSLog(CFSTR("Error cancelling: %@"), v8);
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v7;
}

+ (id)cancelMessageWithDialMessageID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("command");
  v9[1] = CFSTR("message");
  v10[0] = CFSTR("cancel");
  v10[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "messageWithAdditionalParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)sendMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v6 = a3;
  objc_msgSend(a1, "loadIdentityServices");
  v7 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("IDSService"))), "initWithService:", CFSTR("com.apple.private.alloy.maps"));
  objc_msgSend(v7, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v9, "registeredURIs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  LOBYTE(a4) = objc_msgSend(v7, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v6, v9, v12, 300, 0, &v14, a4);

  return (char)a4;
}

+ (void)loadIdentityServices
{
  if (loadIdentityServices_onceToken != -1)
    dispatch_once(&loadIdentityServices_onceToken, &__block_literal_global_77);
}

void __37__CNPhoneDialer_loadIdentityServices__block_invoke()
{
  dispatch_sync(MEMORY[0x1E0C80D38], &__block_literal_global_42_0);
  if (!NSClassFromString(CFSTR("IDSService")))
    NSLog(CFSTR("Could not load IDS"));
}

void __37__CNPhoneDialer_loadIdentityServices__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/IDS.framework"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "load");

}

+ (id)messageWithAdditionalParameters:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", &unk_1E2A40098, CFSTR("protocolVersion"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("guid"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("timestamp"));

  objc_msgSend(v5, "addEntriesFromDictionary:", v4);
  return v5;
}

@end
