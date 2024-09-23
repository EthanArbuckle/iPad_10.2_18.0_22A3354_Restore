@implementation UIViewController(MFMailComposeRemoteService)

- (uint64_t)mf_classesForUICustomization
{
  return 0;
}

- (uint64_t)mf_keyPathsMapForUICustomization
{
  return 0;
}

- (id)mf_dataForUICustomization
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mf_keyPathsMapForUICustomization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v2, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(a1, "valueForKeyPath:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "setObject:forKey:", v9, v8);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "mf_filterUsingMap:inverse:", v2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)mf_setDataForUICustomization:()MFMailComposeRemoteService
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, 0);
  objc_msgSend(a1, "mf_classesForUICustomization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, *MEMORY[0x1E0CB2CD0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "mf_keyPathsMapForUICustomization");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mf_filterUsingMap:inverse:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__UIViewController_MFMailComposeRemoteService__mf_setDataForUICustomization___block_invoke;
    v11[3] = &unk_1E5A659E0;
    v11[4] = a1;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  else
  {
    MFLogGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB96A000, v10, OS_LOG_TYPE_DEFAULT, "#Warning Unexpected format for UI customization data.", buf, 2u);
    }

  }
}

@end
