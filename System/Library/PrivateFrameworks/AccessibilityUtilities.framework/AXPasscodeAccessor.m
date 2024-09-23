@implementation AXPasscodeAccessor

- (AXPasscodeAccessor)initWithServiceName:(id)a3 accountName:(id)a4 groupName:(id)a5 logFacility:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AXPasscodeAccessor *v15;
  AXPasscodeAccessor *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AXPasscodeAccessor;
  v15 = -[AXPasscodeAccessor init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_serviceName, a3);
    objc_storeStrong((id *)&v16->_accountName, a4);
    objc_storeStrong((id *)&v16->_groupName, a5);
    objc_storeStrong((id *)&v16->_logFacility, a6);
  }

  return v16;
}

- (NSString)passcode
{
  __CFDictionary *v2;
  const __CFDictionary *v3;
  __CFString *v4;
  id v5;
  CFTypeRef result;

  v2 = -[AXPasscodeAccessor _newQuery](self, "_newQuery");
  if (v2)
  {
    v3 = v2;
    CFDictionaryAddValue(v2, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
    result = 0;
    v4 = &stru_1E24CAB08;
    if (!SecItemCopyMatching(v3, &result) && result)
    {
      v5 = objc_alloc(MEMORY[0x1E0CB3940]);
      v4 = (__CFString *)objc_msgSend(v5, "initWithData:encoding:", result, 4);
      CFRelease(result);
    }
    CFRelease(v3);
  }
  else
  {
    v4 = &stru_1E24CAB08;
  }
  return (NSString *)v4;
}

- (BOOL)attemptToSetPasscode:(id)a3
{
  id v4;
  __CFDictionary *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFDictionary *Mutable;
  const __CFDictionary *v10;
  OSStatus v11;
  char v12;
  char v13;
  NSObject *v14;

  v4 = a3;
  v5 = -[AXPasscodeAccessor _newQuery](self, "_newQuery");
  if (v5)
  {
    if (objc_msgSend(v4, "length")
      && (objc_msgSend(v4, "dataUsingEncoding:", 4), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = (void *)v6;
      -[AXPasscodeAccessor passcode](self, "passcode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        if ((objc_msgSend(v8, "isEqualToString:", v4) & 1) != 0
          || (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0)) == 0)
        {
          v11 = 0;
        }
        else
        {
          v10 = Mutable;
          CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], v7);
          v11 = SecItemUpdate(v5, v10);
          CFRelease(v10);
        }
      }
      else
      {
        CFDictionaryAddValue(v5, (const void *)*MEMORY[0x1E0CD70D8], v7);
        v11 = SecItemAdd(v5, 0);
      }

      v12 = 0;
    }
    else
    {
      v11 = SecItemDelete(v5);
      v12 = 1;
    }
    CFRelease(v5);
    if (v11 == -25300)
      v13 = v12;
    else
      v13 = 0;
    if (v11)
      LOBYTE(v5) = v13;
    else
      LOBYTE(v5) = 1;
    if ((v5 & 1) == 0)
    {
      -[AXPasscodeAccessor logFacility](self, "logFacility");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[AXPasscodeAccessor attemptToSetPasscode:].cold.1(v12, v11, v14);

      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (__CFDictionary)_newQuery
{
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  const void *v5;
  void *v6;
  const void *v7;
  void *v8;
  const void *v9;
  void *v10;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  v4 = Mutable;
  if (Mutable)
  {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    CFDictionaryAddValue(v4, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68B8]);
    v5 = (const void *)*MEMORY[0x1E0CD6B58];
    -[AXPasscodeAccessor serviceName](self, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryAddValue(v4, v5, v6);

    v7 = (const void *)*MEMORY[0x1E0CD68F8];
    -[AXPasscodeAccessor accountName](self, "accountName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryAddValue(v4, v7, v8);

    v9 = (const void *)*MEMORY[0x1E0CD6898];
    -[AXPasscodeAccessor groupName](self, "groupName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryAddValue(v4, v9, v10);

  }
  return v4;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)accountName
{
  return self->_accountName;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (OS_os_log)logFacility
{
  return self->_logFacility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logFacility, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)attemptToSetPasscode:(os_log_t)log .cold.1(char a1, int a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("save");
  if ((a1 & 1) != 0)
    v3 = CFSTR("delete");
  v4 = 138543618;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  _os_log_fault_impl(&dword_18C62B000, log, OS_LOG_TYPE_FAULT, "Could not %{public}@ passcode. Error code: %ld", (uint8_t *)&v4, 0x16u);
}

@end
