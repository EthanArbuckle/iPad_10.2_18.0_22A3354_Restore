@implementation NTKEnumeratedEditOption

+ (id)legacyOptionWithName:(id)a3 forDevice:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;

  v28 = a3;
  v6 = a4;
  objc_opt_class();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  os_unfair_lock_lock((os_unfair_lock_t)&legacyOptionWithName_forDevice____lock);
  WeakRetained = objc_loadWeakRetained(&legacyOptionWithName_forDevice____cachedDevice);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = objc_loadWeakRetained(&legacyOptionWithName_forDevice____cachedDevice);
    if (v10 == v6)
    {
      v11 = objc_msgSend(v6, "version");
      v12 = legacyOptionWithName_forDevice____previousCLKDeviceVersion;

      if (v11 == v12)
        goto LABEL_6;
    }
    else
    {

    }
  }
  v13 = objc_storeWeak(&legacyOptionWithName_forDevice____cachedDevice, v6);
  legacyOptionWithName_forDevice____previousCLKDeviceVersion = objc_msgSend(v6, "version");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)legacyOptionWithName_forDevice__mappingOptionsByClass;
  legacyOptionWithName_forDevice__mappingOptionsByClass = v14;

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&legacyOptionWithName_forDevice____lock);
  v16 = (void *)legacyOptionWithName_forDevice__mappingOptionsByClass;
  NSStringFromClass((Class)a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(a1, "numberOfOptionsForDevice:", v6);
    if (v19)
    {
      v20 = 0;
      do
      {
        objc_msgSend(a1, "optionAtIndex:forDevice:", v20, v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "conformsToProtocol:", &unk_1F8E91518))
        {
          objc_msgSend(v21, "pigmentEditOption");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "fullname");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, v23);

        }
        ++v20;
      }
      while (v19 != v20);
    }
    v24 = (void *)legacyOptionWithName_forDevice__mappingOptionsByClass;
    NSStringFromClass((Class)a1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v18, v25);

  }
  objc_msgSend(v18, "objectForKeyedSubscript:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v7);
  return v26;
}

+ (id)legacyOptionWithPigmentEditOption:(id)a3 forDevice:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "fullname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "legacyOptionWithName:forDevice:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)domain
{
  return 0;
}

+ (unint64_t)numberOfOptionsForDevice:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a1, "_orderedValuesForDevice:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

+ (id)optionAtIndex:(unint64_t)a3 forDevice:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a1, "_orderedValuesForDevice:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
    a3 = 0;
  objc_msgSend(a1, "_orderedValuesForDevice:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(a1, "_optionWithValue:forDevice:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (unint64_t)indexOfOption:(id)a3 forDevice:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = objc_msgSend(a3, "_value");
  objc_msgSend(a1, "_orderedValuesForDevice:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "indexOfObject:", v9);

  return v10;
}

+ (id)optionsRestrictedByDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "_orderedValuesRestrictedByDevice:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_optionWithValue:forDevice:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "unsignedIntValue"), v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)_valueIsValid:(unint64_t)a3 forDevice:(id)a4
{
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;

  objc_msgSend(a1, "_orderedValuesForDevice:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if ((v8 & 1) == 0)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[NTKEnumeratedEditOption _valueIsValid:forDevice:].cold.1((uint64_t)a1, a3, v9);

  }
  return v8;
}

+ (id)_orderedValuesRestrictedByDevice:(id)a3
{
  return (id)objc_opt_new();
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

+ (void)_valueIsValid:(NSObject *)a3 forDevice:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1B72A3000, a3, OS_LOG_TYPE_ERROR, "%@: invalid value (%@)", (uint8_t *)&v6, 0x16u);

}

@end
