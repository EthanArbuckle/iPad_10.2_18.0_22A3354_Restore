@implementation _LSDeviceIdentifierCache

- (void)getIdentifierOfType:(int64_t)a3 vendorName:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  _LSDeviceIdentifierCache *v20;
  id v21;
  int64_t v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94___LSDeviceIdentifierCache_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E10430A8;
  v18 = v10;
  v19 = v11;
  v21 = v12;
  v22 = a3;
  v20 = self;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)identifiersOfTypeNotDispatched:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[_LSDeviceIdentifierCache allIdentifiersNotDispatched](self, "allIdentifiersNotDispatched");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || (unint64_t)(a3 - 1) < 2)
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if (a3)
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = a3;
      _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "Failed to figure out string representation of identifier type %i", (uint8_t *)v9, 8u);
    }

    goto LABEL_8;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LSVendors"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v6;
}

- (id)applyPerUserEntropyNotDispatched:(id)a3 type:(int64_t)a4
{
  id v6;
  NSDictionary *perUserEntropy;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_LSDeviceIdentifierCache generatePerUserEntropyIfNeededNotDispatched](self, "generatePerUserEntropyIfNeededNotDispatched");
  if (v6)
  {
    perUserEntropy = self->_perUserEntropy;
    v8 = v6;
    if (perUserEntropy)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](perUserEntropy, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      v8 = v6;
      if (v11)
      {
        v21[0] = 0;
        v21[1] = 0;
        objc_msgSend(v6, "getUUIDBytes:", v21);
        v12 = (void *)MEMORY[0x1E0C99DF0];
        v13 = self->_perUserEntropy;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dataWithCapacity:", objc_msgSend(v15, "length") + 16);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v6;
        if (v16)
        {
          objc_msgSend(v16, "appendBytes:length:", v21, 16);
          v17 = self->_perUserEntropy;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appendData:", v19);

          objc_msgSend(MEMORY[0x1E0CB3A28], "_LS_UUIDWithData:digestType:", v16, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)generatePerUserEntropyIfNeededNotDispatched
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *perUserEntropy;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *v17;
  NSDictionary *v18;
  NSObject *v19;
  uint8_t buf[8];
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  if (!self->_perUserEntropy && -[_LSDeviceIdentifierCache deviceUnlockedSinceBoot](self, "deviceUnlockedSinceBoot"))
  {
    if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode"))
    {
      _LSPerUserEntropyURL();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v3);
        v4 = objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          v5 = (void *)MEMORY[0x1E0CB3710];
          v6 = (void *)MEMORY[0x1E0C99E60];
          v7 = objc_opt_class();
          v8 = objc_opt_class();
          objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v9, v4, 0);
          v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          perUserEntropy = self->_perUserEntropy;
          self->_perUserEntropy = v10;

        }
        if (!self->_perUserEntropy)
        {
          -[_LSDeviceIdentifierCache generateSomePerUserEntropyNotDispatched](self, "generateSomePerUserEntropyNotDispatched");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[_LSDeviceIdentifierCache generateSomePerUserEntropyNotDispatched](self, "generateSomePerUserEntropyNotDispatched");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[_LSDeviceIdentifierCache generateSomePerUserEntropyNotDispatched](self, "generateSomePerUserEntropyNotDispatched");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          if (v12 && v14)
          {
            v21[0] = &unk_1E10756D8;
            v21[1] = &unk_1E10756F0;
            v22[0] = v12;
            v22[1] = v14;
            v21[2] = &unk_1E1075708;
            v22[2] = v13;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
            v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            v17 = self->_perUserEntropy;
            self->_perUserEntropy = v16;

            -[_LSDeviceIdentifierCache save](self, "save");
          }
          else
          {
            _LSDefaultLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_182882000, v19, OS_LOG_TYPE_DEFAULT, "Failed to get per-user entropy for device identifiers. Will only have per-device identifiers.", buf, 2u);
            }

          }
        }
      }
      else
      {
        _LSDefaultLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get per-user entropy URL for device identifiers. Will only have per-device identifiers.", buf, 2u);
        }
      }

    }
    else
    {
      v18 = self->_perUserEntropy;
      self->_perUserEntropy = (NSDictionary *)MEMORY[0x1E0C9AA70];

    }
  }
}

- (id)allIdentifiersNotDispatched
{
  NSDictionary *v3;
  NSURL *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *identifiers;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSUUID *v11;
  NSUUID *advertiserIdentifier;
  NSUUID *v13;
  NSUUID *vendorIdentifierSeed;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSDictionary *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSDictionary *v27;
  NSDictionary *v28;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!-[_LSDeviceIdentifierCache deviceUnlockedSinceBoot](self, "deviceUnlockedSinceBoot"))
  {
    _LSDefaultLog();
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, &v4->super, OS_LOG_TYPE_DEFAULT, "Identifiers file unavailable (not yet unlocked)", buf, 2u);
    }
    v3 = 0;
    goto LABEL_26;
  }
  v3 = self->_identifiers;
  if (!v3)
  {
    v4 = self->_identifiersFileURL;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
LABEL_5:
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 1, 0, 0);
        v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        identifiers = self->_identifiers;
        self->_identifiers = v6;

        -[NSDictionary objectForKeyedSubscript:](self->_identifiers, "objectForKeyedSubscript:", CFSTR("LSVendors"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8 == 0;

        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](self->_identifiers, "setObject:forKeyedSubscript:", v10, CFSTR("LSVendors"));

          -[_LSDeviceIdentifierCache save](self, "save");
        }
        -[_LSDeviceIdentifierCache extractUUIDForKey:](self, "extractUUIDForKey:", CFSTR("LSAdvertiserIdentifier"));
        v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        advertiserIdentifier = self->_advertiserIdentifier;
        self->_advertiserIdentifier = v11;

        -[_LSDeviceIdentifierCache extractUUIDForKey:](self, "extractUUIDForKey:", CFSTR("LSVendorSeed"));
        v13 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        vendorIdentifierSeed = self->_vendorIdentifierSeed;
        self->_vendorIdentifierSeed = v13;

        goto LABEL_21;
      }
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/var/db/lsd/com.apple.lsdidentifiers.plist"), 0);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "fileExistsAtPath:", v17);

      if ((v18 & 1) != 0)
      {
        _LSDefaultLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v15;
          _os_log_impl(&dword_182882000, v19, OS_LOG_TYPE_DEFAULT, "Identifiers file does not exist, attempting to read file from old location in %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v15);
        v20 = objc_claimAutoreleasedReturnValue();
        v5 = (void *)v20;
        if (!v20)
        {
          _LSDefaultLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v15;
            _os_log_impl(&dword_182882000, v21, OS_LOG_TYPE_DEFAULT, "Invalid data found at %@", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeItemAtURL:error:", v15, 0);

        if (!v20)
          goto LABEL_21;
        goto LABEL_5;
      }

    }
LABEL_21:
    v23 = self->_identifiers;
    if (!v23)
    {
      _LSDefaultLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_182882000, v24, OS_LOG_TYPE_DEFAULT, "Creating identifiers table for the first time.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", CFSTR("LSVendors"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (NSDictionary *)objc_msgSend(v26, "copy");
      v28 = self->_identifiers;
      self->_identifiers = v27;

      -[_LSDeviceIdentifierCache save](self, "save");
      v23 = self->_identifiers;
    }
    v3 = v23;
LABEL_26:

  }
  return v3;
}

- (BOOL)deviceUnlockedSinceBoot
{
  return (int)softLinkMKBDeviceUnlockedSinceBoot() > 0;
}

- (_LSDeviceIdentifierCache)initWithPersona:(id)a3
{
  id v5;
  _LSDeviceIdentifierCache *v6;
  _LSDeviceIdentifierCache *v7;
  NSDictionary *identifiers;
  NSUUID *advertiserIdentifier;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSURL *identifiersFileURL;
  uint64_t v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_LSDeviceIdentifierCache;
  v6 = -[_LSDeviceIdentifierCache init](&v20, sel_init);
  v7 = v6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDeviceIdentifierCache initWithPersona:]");
  if (v6)
  {
    objc_storeStrong((id *)&v6->_personaUniqueString, a3);
    identifiers = v6->_identifiers;
    v6->_identifiers = 0;

    advertiserIdentifier = v6->_advertiserIdentifier;
    v6->_advertiserIdentifier = 0;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.launchservices.deviceidentifiers", v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    if (v5 && objc_msgSend(v5, "length"))
    {
      objc_msgSend((id)__LSDefaultsGetSharedInstance(), "identifiersFileURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLByDeletingPathExtension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.plist"), v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLByAppendingPathExtension:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      identifiersFileURL = v7->_identifiersFileURL;
      v7->_identifiersFileURL = (NSURL *)v16;

    }
    else
    {
      objc_msgSend((id)__LSDefaultsGetSharedInstance(), "identifiersFileURL");
      v18 = objc_claimAutoreleasedReturnValue();
      v13 = v6->_identifiersFileURL;
      v6->_identifiersFileURL = (NSURL *)v18;
    }

  }
  return v7;
}

- (void)clearIdentifiersForUninstallationWithVendorName:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  _LSDeviceIdentifierCache *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93___LSDeviceIdentifierCache_clearIdentifiersForUninstallationWithVendorName_bundleIdentifier___block_invoke;
  block[3] = &unk_1E1042318;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)clearAllIdentifiersOfType:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54___LSDeviceIdentifierCache_clearAllIdentifiersOfType___block_invoke;
  v4[3] = &unk_1E103FAD8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)save
{
  OS_dispatch_queue *queue;
  _QWORD v3[5];

  queue = self->_queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32___LSDeviceIdentifierCache_save__block_invoke;
  v3[3] = &unk_1E10418C8;
  v3[4] = self;
  _LSDispatchCoalescedAfterDelay((unsigned __int8 *)&self->_saveFlag, queue, v3, 3.0);
}

- (NSString)personaUniqueString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_identifiersFileURL, 0);
  objc_storeStrong((id *)&self->_perUserEntropy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_vendorIdentifierSeed, 0);
  objc_storeStrong((id *)&self->_advertiserIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (id)generateSomePerUserEntropyNotDispatched
{
  _BYTE bytes[16];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x10uLL, bytes))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", bytes, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)extractUUIDForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_identifiers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
    -[NSDictionary removeObjectForKey:](self->_identifiers, "removeObjectForKey:", v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)deviceIdentifierVendorSeed
{
  NSUUID *vendorIdentifierSeed;
  NSUUID *v4;
  NSUUID *v5;
  NSObject *v6;
  NSUUID *v7;
  int v9;
  NSUUID *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  vendorIdentifierSeed = self->_vendorIdentifierSeed;
  if (!vendorIdentifierSeed)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_vendorIdentifierSeed;
    self->_vendorIdentifierSeed = v4;

    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = self->_vendorIdentifierSeed;
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_INFO, "Generated vendor seed %@", (uint8_t *)&v9, 0xCu);
    }

    -[_LSDeviceIdentifierCache save](self, "save");
    vendorIdentifierSeed = self->_vendorIdentifierSeed;
  }
  return vendorIdentifierSeed;
}

@end
