@implementation IDSQuickRelayFixedTokenAllocator

- (IDSQuickRelayFixedTokenAllocator)initWithDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  IDSQuickRelayFixedTokenAllocator *v6;
  IDSQuickRelayFixedTokenAllocator *v7;
  objc_super v9;

  v4 = a3;
  if (_IDSRunningInDaemon())
  {
    +[IDSTransportLog QRAllocator](IDSTransportLog, "QRAllocator");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907ECC80();

    goto LABEL_9;
  }
  v9.receiver = self;
  v9.super_class = (Class)IDSQuickRelayFixedTokenAllocator;
  v6 = -[IDSQuickRelayFixedTokenAllocator init](&v9, sel_init);
  self = v6;
  if (v6)
  {
    if (!-[IDSQuickRelayFixedTokenAllocator _isSessionInfoValid:](v6, "_isSessionInfoValid:", v4))
    {
LABEL_9:
      v7 = 0;
      goto LABEL_10;
    }
    -[IDSQuickRelayFixedTokenAllocator _setAllValuesFromDictionary:](self, "_setAllValuesFromDictionary:", v4);
  }
  self = self;
  v7 = self;
LABEL_10:

  return v7;
}

- (IDSQuickRelayFixedTokenAllocator)initWithDefaults
{
  NSObject *v3;
  IDSQuickRelayFixedTokenAllocator *v4;
  IDSQuickRelayFixedTokenAllocator *v5;
  IDSQuickRelayFixedTokenAllocator *v6;
  objc_super v8;

  if (_IDSRunningInDaemon())
  {
    +[IDSTransportLog QRAllocator](IDSTransportLog, "QRAllocator");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1907ECC80();
    v4 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IDSQuickRelayFixedTokenAllocator;
    v5 = -[IDSQuickRelayFixedTokenAllocator init](&v8, sel_init);
    if (!v5)
      return 0;
    v6 = v5;
    -[IDSQuickRelayFixedTokenAllocator _parseQuickRelayDefaults](v5, "_parseQuickRelayDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
    self = -[IDSQuickRelayFixedTokenAllocator initWithDictionary:](v6, "initWithDictionary:", v3);
    v4 = self;
  }

  return v4;
}

- (void)_setAllValuesFromDictionary:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *MEMORY[0x1E0D35100];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSQuickRelayFixedTokenAllocator setRelayIP:](self, "setRelayIP:", v6);

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D35110]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSQuickRelayFixedTokenAllocator setRelayPort:](self, "setRelayPort:", v7);

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D35128]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSQuickRelayFixedTokenAllocator setRelaySessionToken:](self, "setRelaySessionToken:", v8);

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D35120]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSQuickRelayFixedTokenAllocator setRelaySessionKey:](self, "setRelaySessionKey:", v9);

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D35118]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSQuickRelayFixedTokenAllocator setRelaySessionID:](self, "setRelaySessionID:", v10);

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D35108]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSQuickRelayFixedTokenAllocator setRelayCombinedSoftwareID:](self, "setRelayCombinedSoftwareID:", v11);

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D350E8]);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[IDSQuickRelayFixedTokenAllocator setAppleID:](self, "setAppleID:", v12);
}

- (BOOL)_isSessionInfoValid:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[8];

  v20[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = *MEMORY[0x1E0D35110];
    v20[0] = *MEMORY[0x1E0D35100];
    v20[1] = v4;
    v5 = *MEMORY[0x1E0D35120];
    v20[2] = *MEMORY[0x1E0D35128];
    v20[3] = v5;
    v6 = *MEMORY[0x1E0D35108];
    v20[4] = *MEMORY[0x1E0D35118];
    v20[5] = v6;
    v20[6] = *MEMORY[0x1E0D350E8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 7);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            v13 = 0;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_12:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_parseQuickRelayDefaults
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  unsigned __int16 v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  __CFDictionary *Mutable;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  NSObject *v29;
  __int16 v30;
  int v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  MEMORY[0x19400F174](CFSTR("com.apple.ids"), CFSTR("FixedQuickRelayServerAddress"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v32[0] = 0xAAAAAAAAAAAAAAAALL;
    v32[1] = 0xAAAAAAAAAAAAAAAALL;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (inet_pton(2, (const char *)-[NSObject UTF8String](v4, "UTF8String"), (char *)v32 + 4) == 1)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", (char *)v32 + 4, 4);
      objc_msgSend(v3, "objectAtIndex:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "integerValue");

      +[IDSTransportLog QRAllocator](IDSTransportLog, "QRAllocator");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v4;
        v30 = 1024;
        v31 = v7;
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Decoded relay-server-address %@:%u", buf, 0x12u);
      }

      MEMORY[0x19400F174](CFSTR("com.apple.ids"), CFSTR("FixedQuickRelaySessionID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v27, 0));
      v10 = (void *)objc_msgSend(v9, "bytes");
      if (v10)
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v9), "bytes"));
      v25 = v10;
      objc_msgSend(v10, "UUIDString");
      v11 = objc_claimAutoreleasedReturnValue();
      +[IDSTransportLog QRAllocator](IDSTransportLog, "QRAllocator");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v11;
        _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Decoded base64 relay-session-id %@", buf, 0xCu);
      }
      v26 = v9;

      MEMORY[0x19400F174](CFSTR("com.apple.ids"), CFSTR("FixedQuickRelaySessionToken"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v24, 0);
      +[IDSTransportLog QRAllocator](IDSTransportLog, "QRAllocator");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v13;
        _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Decoded base64 relay-session-token %@", buf, 0xCu);
      }

      MEMORY[0x19400F174](CFSTR("com.apple.ids"), CFSTR("FixedQuickRelaySessionKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v15, 0);
      +[IDSTransportLog QRAllocator](IDSTransportLog, "QRAllocator");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v16;
        _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "Decoded base64 relay-session-key %@", buf, 0xCu);
      }

      if (v5 && v7 && v11 && v13 && v16)
      {
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D35100], v5);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D35110], v19);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_1907ECE00();
        }

        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D35118], v11);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D35128], v13);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D35120], v16);
        _IDSQuickRelayProtocolVersionNumber();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D35108], v21);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_1907ECD80();
        }

        v22 = (id)*MEMORY[0x1E0D35130];
        if (v22)
        {
          CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D350E8], v22);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_1907ECD00();
        }

        +[IDSTransportLog QRAllocator](IDSTransportLog, "QRAllocator");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Using preallocated tokens from user defaults", buf, 2u);
        }
      }
      else
      {
        +[IDSTransportLog QRAllocator](IDSTransportLog, "QRAllocator");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Missing a defaults for hardcoded QR session info", buf, 2u);
        }
        Mutable = 0;
      }

    }
    else
    {
      +[IDSTransportLog QRAllocator](IDSTransportLog, "QRAllocator");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Faied to get address in FixedQuickRelayServerAddress defaults", buf, 2u);
      }
      Mutable = 0;
    }

  }
  else
  {
    +[IDSTransportLog QRAllocator](IDSTransportLog, "QRAllocator");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "Faied to get address in FixedQuickRelayServerAddress defaults", buf, 2u);
    }
    Mutable = 0;
  }

  return Mutable;
}

- (NSData)relayIP
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRelayIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSNumber)relayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRelayPort:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSData)relaySessionKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRelaySessionKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSData)relaySessionToken
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRelaySessionToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSData)relaySessionID
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRelaySessionID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSNumber)relayCombinedSoftwareID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRelayCombinedSoftwareID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSData)appleID
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSData)relayIPv6
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRelayIPv6:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayIPv6, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_relayCombinedSoftwareID, 0);
  objc_storeStrong((id *)&self->_relaySessionID, 0);
  objc_storeStrong((id *)&self->_relaySessionKey, 0);
  objc_storeStrong((id *)&self->_relaySessionToken, 0);
  objc_storeStrong((id *)&self->_relayPort, 0);
  objc_storeStrong((id *)&self->_relayIP, 0);
}

@end
