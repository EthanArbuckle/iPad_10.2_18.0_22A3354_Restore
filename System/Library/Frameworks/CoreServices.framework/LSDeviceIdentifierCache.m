@implementation LSDeviceIdentifierCache

void __94___LSDeviceIdentifierCache_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    v9 = 0;
    goto LABEL_41;
  }
  v2 = (uint64_t *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "identifiersOfTypeNotDispatched:", *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *v2;
  if (*v2 != 1)
    goto LABEL_7;
  +[LSApplicationRestrictionsManager sharedInstance]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[LSApplicationRestrictionsManager isAdTrackingEnabled](v5) & 1) == 0)
  {

    goto LABEL_13;
  }
  v6 = objc_msgSend(*(id *)(a1 + 48), "deviceUnlockedSinceBoot");

  if ((v6 & 1) == 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3A28], "_LS_nullUUID");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v4 = *(_QWORD *)(a1 + 64);
LABEL_7:
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      v7 = *(id *)(*(_QWORD *)(a1 + 48) + 16);
      if (v7)
      {
LABEL_38:
        objc_msgSend(*(id *)(a1 + 48), "applyPerUserEntropyNotDispatched:type:", v7, *(_QWORD *)(a1 + 64));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 16), v8);
      objc_msgSend(*(id *)(a1 + 48), "save");
      goto LABEL_37;
    }
    if (!v3)
      goto LABEL_39;
    if (+[LSHRNSupport deviceConfiguredForHRN](LSHRNSupport, "deviceConfiguredForHRN"))
    {
      v29[0] = 0;
      v29[1] = 0;
      objc_msgSend(*(id *)(a1 + 48), "deviceIdentifierVendorSeed");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getUUIDBytes:", v29);

      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v29, 16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[LSHRNSupport vendorIDFromVendorName:seedData:error:](LSHRNSupport, "vendorIDFromVendorName:seedData:error:", v12, v13, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_40;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("LSVendorIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("LSApplications"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 && objc_msgSend(v17, "containsObject:", *(_QWORD *)(a1 + 40)))
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v15);

        if (v8)
        {
LABEL_36:

LABEL_37:
          v7 = v8;
          if (v8)
            goto LABEL_38;
LABEL_39:
          v9 = 0;
          goto LABEL_40;
        }
      }
      else
      {

      }
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("LSVendorIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v21);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("LSVendorIdentifier"));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("LSApplications"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v26 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("LSApplications"));

      v25 = (void *)v26;
    }
    if ((objc_msgSend(v25, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
      objc_msgSend(v25, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "save");

    goto LABEL_36;
  }
  if (!+[LSHRNSupport deviceConfiguredForHRN](LSHRNSupport, "deviceConfiguredForHRN"))
    goto LABEL_39;
  objc_msgSend(*(id *)(a1 + 48), "deviceIdentifierVendorSeed");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_16:
  v9 = (void *)v10;
LABEL_40:

LABEL_41:
  v28 = *(_QWORD *)(a1 + 56);
  if (v28)
    (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v9);

}

void __93___LSDeviceIdentifierCache_clearIdentifiersForUninstallationWithVendorName_bundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    for (i = 0; i != 3; ++i)
    {
      objc_msgSend(*(id *)(a1 + 48), "identifiersOfTypeNotDispatched:", _LSAllDeviceIdentifierTypes[i]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (v5)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LSApplications"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 40));
          if (!objc_msgSend(v7, "count"))
            objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 48), "save");

        }
      }

    }
  }
}

void __54___LSDeviceIdentifierCache_clearAllIdentifiersOfType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  if (!objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode"))
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9 == 2)
    {
      v12 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v12 + 24);
      *(_QWORD *)(v12 + 24) = 0;
    }
    else
    {
      if (v9 != 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "identifiersOfTypeNotDispatched:");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13 && objc_msgSend(v13, "count"))
        {
          objc_msgSend(v13, "removeAllObjects");
          objc_msgSend(*(id *)(a1 + 32), "save");
        }
        goto LABEL_13;
      }
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 16);
      *(_QWORD *)(v10 + 16) = 0;
    }

    objc_msgSend(*(id *)(a1 + 32), "save");
    return;
  }
  v13 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "mutableCopy");
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "generateSomePerUserEntropyNotDispatched");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, v5);

      v6 = objc_msgSend(v13, "copy");
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 48);
      *(_QWORD *)(v7 + 48) = v6;

      objc_msgSend(*(id *)(a1 + 32), "save");
    }
  }
LABEL_13:

}

void __32___LSDeviceIdentifierCache_save__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allIdentifiersNotDispatched");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
    if (!v3)
    {
      _LSDefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get identifiers file URL.", buf, 2u);
      }
      goto LABEL_22;
    }
    _LSDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject path](v3, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Writing identifiers file to %@", buf, 0xCu);

    }
    v6 = objc_msgSend(v2, "mutableCopy");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    if (v8)
    {
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, CFSTR("LSAdvertiserIdentifier"));

      v7 = *(_QWORD *)(a1 + 32);
    }
    v10 = *(void **)(v7 + 24);
    if (v10)
    {
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v11, CFSTR("LSVendorSeed"));

    }
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;
    v14 = v13;
    if (v12)
    {
      v20 = v13;
      v15 = objc_msgSend(v12, "writeToURL:options:error:", v3, 1073741825, &v20);
      v16 = v20;

      if ((v15 & 1) != 0)
      {
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      _LSDefaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v16;
        _os_log_impl(&dword_182882000, v17, OS_LOG_TYPE_DEFAULT, "Failed to write plist data for identifiers: %@", buf, 0xCu);
      }
    }
    else
    {
      _LSDefaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_impl(&dword_182882000, v17, OS_LOG_TYPE_DEFAULT, "Failed to create plist data for identifiers: %@", buf, 0xCu);
      }
      v16 = v14;
    }

    goto LABEL_21;
  }
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "Failed to get identifiers.", buf, 2u);
  }
LABEL_23:

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48)
    && objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode"))
  {
    _LSPerUserEntropyURL();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "writeToURL:options:error:", v18, 1073741825, 0);

    }
  }

}

@end
