@implementation NSDictionary(MCUtilities)

- (uint64_t)MCWriteToBinaryFile:()MCUtilities
{
  id v4;
  MCDictionaryWriter *v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[MCDictionaryWriter initWithDictionary:path:]([MCDictionaryWriter alloc], "initWithDictionary:path:", a1, v4);

  v6 = -[MCDictionaryWriter write](v5, "write");
  return v6;
}

- (uint64_t)MCWriteToBinaryFile:()MCUtilities atomically:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AF0250]();
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a1, 200, 0, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v8)
  {
    v16 = 0;
    v10 = objc_msgSend(v8, "writeToFile:options:error:", v6, a4, &v16);
    v11 = v16;
    if ((v10 & 1) != 0)
    {
      v12 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    v13 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v6;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_19ECC4000, v13, OS_LOG_TYPE_ERROR, "Could not serialize data for %{public}@: %{public}@", buf, 0x16u);
    }
    v11 = 0;
  }
  v14 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v6;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_19ECC4000, v14, OS_LOG_TYPE_ERROR, "Could not write data to path %{public}@: %{public}@", buf, 0x16u);
  }
  v12 = 0;
LABEL_10:

  objc_autoreleasePoolPop(v7);
  return v12;
}

+ (id)MCDictionaryFromFile:()MCUtilities
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (!v5)
  {
    v7 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v11 = v3;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "Failed to make dictionary from file at path: %{public}@ with error: %{public}@", buf, 0x16u);
    }
  }

  return v5;
}

- (void)MCMutableDeepCopyWithZone:()MCUtilities
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a1, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v11 = v10;
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE550E98))
        {
          v11 = (void *)objc_msgSend(v10, "mutableCopyWithZone:", a3);

        }
        objc_msgSend(a1, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = objc_msgSend(v12, "MCMutableDeepCopyWithZone:", a3);
LABEL_13:
          v14 = (void *)v13;
          objc_msgSend(v5, "setObject:forKey:", v13, v11);

          goto LABEL_14;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || objc_msgSend(v12, "conformsToProtocol:", &unk_1EE550E98))
        {
          v13 = objc_msgSend(v12, "mutableCopyWithZone:", a3);
          goto LABEL_13;
        }
        if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EE543EE0))
        {
          v13 = objc_msgSend(v12, "copyWithZone:", a3);
          goto LABEL_13;
        }
        objc_msgSend(v5, "setObject:forKey:", v12, v11);
LABEL_14:

        ++v9;
      }
      while (v7 != v9);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v7 = v15;
    }
    while (v15);
  }

  return v5;
}

- (uint64_t)MCMutableDeepCopy
{
  return objc_msgSend(a1, "MCMutableDeepCopyWithZone:", 0);
}

- (uint64_t)MCDeepCopy
{
  return objc_msgSend(a1, "MCDeepCopyWithZone:", 0);
}

- (id)MCRetainRequiredObjectKey:()MCUtilities type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a9;
  objc_msgSend(a1, "objectForKey:", v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    if (a10)
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(v17, v19, v20, v21, v22, v23, v24, v25, v15);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v35;
      v38 = v16;
      v39 = a6;
LABEL_8:
      objc_msgSend(v37, "MCErrorWithDomain:code:descriptionArray:errorType:", v38, v39, v36, CFSTR("MCFatalError"));
      *a10 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_9:
    v34 = 0;
    goto LABEL_10;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a10)
    {
      v40 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(v18, v27, v28, v29, v30, v31, v32, v33, v15);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v40;
      v38 = v16;
      v39 = a8;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v34 = v26;
LABEL_10:

  return v34;
}

- (_QWORD)MCRetainOptionalObjectKey:()MCUtilities type:errorDomain:invalidDataCode:invalidDataErrorString:outError:
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v13 = a3;
  v14 = a5;
  v15 = a7;
  objc_msgSend(a1, "objectForKey:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a8)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(v15, v17, v18, v19, v20, v21, v22, v23, v13);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "MCErrorWithDomain:code:descriptionArray:errorType:", v14, a6, v25, CFSTR("MCFatalError"));
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      a8 = 0;
    }
  }
  else
  {
    a8 = v16;
  }

  return a8;
}

- (id)MCRetainRequiredNonZeroLengthStringKey:()MCUtilities errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  objc_msgSend(a1, "objectForKey:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a9)
      {
        v35 = (void *)MEMORY[0x1E0CB35C8];
        MCErrorArray(v18, v20, v21, v22, v23, v24, v25, v26, v15);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v35;
        v38 = v16;
        v39 = a7;
LABEL_9:
        objc_msgSend(v37, "MCErrorWithDomain:code:descriptionArray:errorType:", v38, v39, v36, CFSTR("MCFatalError"));
        *a9 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_10:
      v34 = 0;
      goto LABEL_11;
    }
  }
  if (!objc_msgSend(v19, "length"))
  {
    if (a9)
    {
      v40 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(v17, v27, v28, v29, v30, v31, v32, v33, v15);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v40;
      v38 = v16;
      v39 = a5;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v34 = v19;
LABEL_11:

  return v34;
}

- (_QWORD)MCRetainOptionalNonZeroLengthStringKey:()MCUtilities errorDomain:invalidDataCode:invalidDataErrorString:outError:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  objc_msgSend(a1, "objectForKey:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a7)
      goto LABEL_8;
    v23 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(v14, v16, v17, v18, v19, v20, v21, v22, v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "MCErrorWithDomain:code:descriptionArray:errorType:", v13, a5, v24, CFSTR("MCFatalError"));
    *a7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    a7 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v15, "length"))
    goto LABEL_7;
LABEL_4:
  a7 = v15;
LABEL_8:

  return a7;
}

- (id)MCShortenedPlistDescription
{
  void *v1;
  void *v2;

  objc_msgSend((id)objc_opt_class(), "MCShortenedDictionary:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)MCShortenedObject:()MCUtilities
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "MCShortenedArray:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "MCShortenedDictionary:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "MCShortenedData:", v4);
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = v4;
      }
    }
  }
  v6 = v5;

  return v6;
}

+ (id)MCShortenedData:()MCUtilities
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(v3, "length");
    v5 = (void *)MEMORY[0x1E0CB3940];
    if (v4 > 0x10)
    {
      objc_msgSend(v3, "subdataWithRange:", 0, 8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "MCHexString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "subdataWithRange:", objc_msgSend(v3, "length") - 8, 8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "MCHexString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("0x%@ ... 0x%@"), v8, v10);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "MCHexString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("0x%@"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = CFSTR("<empty>");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Data { length = %lu, bytes = %@ }"), objc_msgSend(v3, "length"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)MCShortenedArray:()MCUtilities
{
  id v4;
  void *v5;
  id v6;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
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
        objc_msgSend(a1, "MCShortenedObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
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

+ (id)MCShortenedDictionary:()MCUtilities
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__NSDictionary_MCUtilities__MCShortenedDictionary___block_invoke;
  v9[3] = &unk_1E41E0928;
  v7 = v6;
  v10 = v7;
  v11 = a1;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

- (uint64_t)MCValidateRestrictions
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultRestrictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v39;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(a1, "MCValidateBoolRestriction:inRestrictions:defaultRestrictions:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v8), v4, v3))
        {
          v24 = 0;
          v9 = v4;
          goto LABEL_41;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      if (v6)
        continue;
      break;
    }
  }

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        if (!objc_msgSend(a1, "MCValidateValueRestriction:inRestrictions:defaultRestrictions:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v13), v9, v3))
        {
          v24 = 0;
          v14 = v9;
          goto LABEL_40;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (v11)
        continue;
      break;
    }
  }

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("intersection"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v14);
        if (!objc_msgSend(a1, "MCValidateIntersectionRestriction:inRestrictions:defaultRestrictions:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18), v14, v3))
        {
          v24 = 0;
          v19 = v14;
          goto LABEL_39;
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
      if (v16)
        continue;
      break;
    }
  }

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("union"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
    while (2)
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v19);
        if (!objc_msgSend(a1, "MCValidateUnionRestriction:inRestrictions:defaultRestrictions:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v23), v19, v3, (_QWORD)v26))
        {
          v24 = 0;
          goto LABEL_38;
        }
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
      if (v21)
        continue;
      break;
    }
  }
  v24 = 1;
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
  return v24;
}

- (uint64_t)MCValidateBoolRestriction:()MCUtilities inRestrictions:defaultRestrictions:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("preference"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "objectForKeyedSubscript:", CFSTR("value"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      LOBYTE(v10) = objc_opt_isKindOfClass();

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  return v10 & 1;
}

- (uint64_t)MCValidateValueRestriction:()MCUtilities inRestrictions:defaultRestrictions:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("preferSmallerValues"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "objectForKeyedSubscript:", CFSTR("value"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      LOBYTE(v10) = objc_opt_isKindOfClass();

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  return v10 & 1;
}

- (uint64_t)MCValidateIntersectionRestriction:()MCUtilities inRestrictions:defaultRestrictions:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("intersection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("values"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (uint64_t)MCValidateUnionRestriction:()MCUtilities inRestrictions:defaultRestrictions:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("union"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("values"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)MCDictionaryAdditiveDeltaToCreateDictionary:()MCUtilities
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKeyedSubscript:", v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_11;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_11;
        if ((objc_msgSend(v13, "isEqual:", v12) & 1) != 0)
          goto LABEL_12;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "MCDictionaryAdditiveDeltaToCreateDictionary:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v11);

        }
        else
        {
LABEL_11:
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);
        }
LABEL_12:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)MCDictionarySubtractiveDeltaToCreateDictionary:()MCUtilities
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v13, "isEqual:", v12) & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v12, "MCDictionarySubtractiveDeltaToCreateDictionary:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v14, "count"))
                objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v11);

            }
          }
        }
        else
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)MCRemovedKeysFromDictionary:()MCUtilities
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v18 = a1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v14 = v5;
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "MCRemovedKeysFromDictionary:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v5 = v14;
            if (objc_msgSend(v16, "count"))
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, v11);
            else
              objc_msgSend(v14, "removeObjectForKey:", v11);

            a1 = v18;
          }
          else
          {
            objc_msgSend(v5, "removeObjectForKey:", v11);
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)MCInsertedKeysFromDictionary:()MCUtilities withNewLeafValue:
{
  id v6;
  id v7;
  id v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a1);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v6;
  v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v24)
  {
    v21 = a1;
    v22 = *(_QWORD *)v26;
    v20 = v8;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v8);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v10);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v7)
          v14 = v7;
        else
          v14 = (void *)v12;
        v15 = v14;
        v16 = v13;
        if (v7)
        {
          objc_opt_class();
          v16 = v7;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v13, "MCDictionaryWithLeafValuesSetToValue:", v7);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        if (v11
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "MCInsertedKeysFromDictionary:withNewLeafValue:", v13, v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v8 = v20;
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v18, v10);

          a1 = v21;
        }
        else
        {
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v16, v10);
        }

      }
      v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v24);
  }

  return v23;
}

- (id)MCDictionaryWithLeafValuesSetToValue:()MCUtilities
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "MCDictionaryWithLeafValuesSetToValue:", v4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

        }
        else
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

@end
