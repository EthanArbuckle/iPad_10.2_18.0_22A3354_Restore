@implementation HMActionSet(HFAdditions)

- (uint64_t)hf_isAnonymous
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "actionSetType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB8230]) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hasPrefix:", CFSTR("HFAnonymous ")) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(a1, "actionSetType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB8220]);

    }
  }

  return v3;
}

- (id)hf_affectedProfiles
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "actions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          v9 = v8;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v10 = v9;
          else
            v10 = 0;
          v11 = v10;

          objc_msgSend(v11, "mediaProfiles");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "unionSet:", v12);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_17;
          objc_opt_class();
          v13 = v8;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
          v11 = v14;

          objc_msgSend(v11, "lightProfile");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "na_safeAddObject:", v12);
        }

LABEL_17:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)hf_affectedMediaSessions
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "actions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          v9 = v8;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v10 = v9;
          else
            v10 = 0;
          v11 = v10;

          objc_msgSend(v11, "mediaProfiles");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "unionSet:", v12);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "na_map:", &__block_literal_global_11_8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)hf_affectedCharacteristics
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "actions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "characteristic");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v9, "targetValue");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
              objc_msgSend(v2, "addObject:", v10);
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v2;
}

- (HFImageIconDescriptor)hf_iconDescriptor
{
  void *v2;
  void *v3;
  void *v4;
  HFImageIconDescriptor *v5;

  objc_msgSend(a1, "_hf_iconIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "hf_iconTintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithHierarchicalColor:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", v2, v4);

    }
    else
    {
      v5 = -[HFImageIconDescriptor initWithSystemImageNamed:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:", v2);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)hf_iconTintColor
{
  void *v2;
  void *v3;
  HFColorPaletteColor *v4;
  void *v5;

  objc_msgSend(a1, "applicationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HFAppDataActionSetIconTintColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[HFColorPaletteColor initWithDictionaryRepresentation:]([HFColorPaletteColor alloc], "initWithDictionaryRepresentation:", v3);
    -[HFColorPaletteColor UIColor](v4, "UIColor");
  }
  else
  {
    objc_msgSend(a1, "_hf_iconIdentifier");
    v4 = (HFColorPaletteColor *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hf_standardIconTintColorForIconIdentifier:", v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (__CFString)_hf_iconIdentifier
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "applicationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HFAppDataActionSetIconImageIdentifier_v2"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "applicationData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HFApplicationDataActionSetIconImageIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    v3 = v5;
  if (!-[__CFString hasPrefix:](v3, "hasPrefix:", CFSTR("HFImageIconIdentifier")))
  {
    v6 = v3;
    if (v3)
      goto LABEL_11;
    goto LABEL_9;
  }
  objc_msgSend(a1, "hf_mapOldIconIdentifierToNewSystemIconIdentifier:", v3);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString hasPrefix:](v6, "hasPrefix:", CFSTR("HFImageIconIdentifier")))
    NSLog(CFSTR("Expected icon identifer to be converted to SF Symbol identifier: %@"), v6);
  if (!v6)
  {
LABEL_9:
    v7 = (void *)objc_opt_class();
    objc_msgSend(a1, "actionSetType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_standardSystemIconIdentifierForActionSetType:", v8);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      v6 = CFSTR("house.fill");
  }
LABEL_11:

  return v6;
}

+ (id)hf_standardSystemIconIdentifierForActionSetType:()HFAdditions
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (!v3)
    v3 = (id)*MEMORY[0x1E0CB8238];
  if (_MergedGlobals_266 != -1)
    dispatch_once(&_MergedGlobals_266, &__block_literal_global_31_4);
  v4 = (id)qword_1ED3791D0;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hf_standardIconTintColorForIconIdentifier:()HFAdditions
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (qword_1ED3791E8 != -1)
    dispatch_once(&qword_1ED3791E8, &__block_literal_global_50_3);
  v4 = (id)qword_1ED3791F0;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hf_characteristicWriteActions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "actions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_119);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_affectedServices
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "characteristic");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "service");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "na_safeAddObject:", v10);

          objc_msgSend(v8, "characteristic");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "service");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            HFLogForCategory(0);
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v20 = v8;
              _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "Error: Unexpected nil service for write action: %@", buf, 0xCu);
            }

          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }

  return v2;
}

- (BOOL)hf_affectsServiceWithIdentifier:()HFAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(a1, "hf_affectedServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__HMActionSet_HFAdditions__hf_affectsServiceWithIdentifier___block_invoke;
  v10[3] = &unk_1EA735C50;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "objectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count") != 0;
  return v8;
}

- (id)hf_affectedAccessoryRepresentableObjects
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "actions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "characteristic");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "service");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "na_safeAddObject:", v10);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "mediaProfiles");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "unionSet:", v9);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_13;
            objc_msgSend(v8, "lightProfile");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "na_safeAddObject:", v9);
          }
        }

LABEL_13:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

- (uint64_t)hf_isBuilder
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (uint64_t)hf_requiresDeviceUnlock
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "actions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_16_5);

  return v2;
}

- (float)hf_percentOfAccessoryRepresentableObjectsAssociatedWithGroup:()HFAdditions
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  float v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(a1, "hf_affectedAccessoryRepresentableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __89__HMActionSet_HFAdditions__hf_percentOfAccessoryRepresentableObjectsAssociatedWithGroup___block_invoke;
  v13 = &unk_1EA735CB8;
  v6 = v4;
  v14 = v6;
  v15 = &v16;
  objc_msgSend(v5, "na_each:", &v10);
  if (objc_msgSend(v5, "count", v10, v11, v12, v13))
  {
    v7 = v17[3];
    v8 = (float)v7 / (float)(unint64_t)objc_msgSend(v5, "count");
  }
  else
  {
    v8 = 0.0;
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)hf_setIconIdentifier:()HFAdditions andTintColor:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HFColorPaletteColor *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  objc_msgSend(a1, "actionSetType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_standardSystemIconIdentifierForActionSetType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "applicationData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HFAppDataActionSetIconImageIdentifier_v2"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 || (objc_msgSend(v10, "isEqualToString:", v6) & 1) == 0)
  {
    objc_msgSend(a1, "applicationData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("HFAppDataActionSetIconImageIdentifier_v2"));

  }
  if (v7)
  {
    v14 = -[HFColorPaletteColor initWithUIColor:]([HFColorPaletteColor alloc], "initWithUIColor:", v7);
    -[HFColorPaletteColor dictionaryRepresentationWithPreferredPaletteType:](v14, "dictionaryRepresentationWithPreferredPaletteType:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "applicationData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("HFAppDataActionSetIconTintColor"));

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__HMActionSet_HFAdditions__hf_setIconIdentifier_andTintColor___block_invoke;
  v19[3] = &unk_1EA7268C8;
  v19[4] = a1;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)hf_mapOldIconIdentifierToNewSystemIconIdentifier:()HFAdditions
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (qword_1ED3791D8 != -1)
    dispatch_once(&qword_1ED3791D8, &__block_literal_global_34_4);
  v4 = (id)qword_1ED3791E0;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hf_shortcutAction
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "actions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_firstObjectPassingTest:", &__block_literal_global_51_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)hf_isShortcutOwned
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "hf_shortcutAction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

@end
