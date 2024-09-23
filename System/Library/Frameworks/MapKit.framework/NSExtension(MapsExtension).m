@implementation NSExtension(MapsExtension)

- (id)_displayName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AAC8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

- (id)_containingAppDisplayName
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0CA5870]);
  objc_msgSend(a1, "_containingAppIdentifer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);
  objc_msgSend(v4, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (id)_containingAppIdentifer
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = objc_alloc(MEMORY[0x1E0CA5848]);
    objc_msgSend(v1, "valueForKey:", CFSTR("uuid"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithUUID:error:", v3, 0);

    objc_msgSend(v4, "containingBundleRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_extensionVendorContextForUUID:()MapsExtension withErrorHandler:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  objc_msgSend(a1, "_extensionContextForUUID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_auxiliaryConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78__NSExtension_MapsExtension___extensionVendorContextForUUID_withErrorHandler___block_invoke;
    v13[3] = &unk_1E20D9AF8;
    v14 = v6;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", 10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v11);

    v10 = 0;
  }

  return v10;
}

- (uint64_t)_mapExtensionType
{
  void *v2;
  char v3;
  void *v5;
  char v6;
  void *v7;
  unsigned int v8;

  objc_msgSend(a1, "extensionPointIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CBD4B8]);

  if ((v3 & 1) != 0)
    return 0;
  objc_msgSend(a1, "extensionPointIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CBD4C0]);

  if ((v6 & 1) != 0)
    return 1;
  objc_msgSend(a1, "extensionPointIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.maps.ui-services"));

  return v8;
}

- (id)_iconWithFormat:()MapsExtension
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_containingAppIdentifer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CEA638];
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screenScale");
    objc_msgSend(v5, "_applicationIconImageForBundleIdentifier:format:scale:", v4, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)_canSupportIntent:()MapsExtension
{
  return objc_msgSend(a1, "_canSupportIntentClass:", objc_opt_class());
}

- (uint64_t)_canSupportIntentClass:()MapsExtension
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  objc_msgSend(a1, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD3F0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NSStringFromClass(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v11, "isEqualToString:", v6, (_QWORD)v13) & 1) != 0)
          {
            v8 = 1;
            goto LABEL_17;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_17:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
