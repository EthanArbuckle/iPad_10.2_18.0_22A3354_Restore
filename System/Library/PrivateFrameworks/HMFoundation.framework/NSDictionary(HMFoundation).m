@implementation NSDictionary(HMFoundation)

- (id)hmf_dateForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hmf_stringForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hmf_arrayForKey:()HMFoundation ofClasses:
{
  id v6;
  void *v7;
  void *v8;
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
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "hmf_arrayForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      v21 = v8;
      while (1)
      {
        v13 = 0;
LABEL_5:
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v14 = v6;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (!v15)
          break;
        v16 = v15;
        v17 = *(_QWORD *)v23;
LABEL_9:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          if (v16 == ++v18)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v16)
              goto LABEL_9;
            goto LABEL_19;
          }
        }

        if (++v13 != v11)
          goto LABEL_5;
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        v8 = v21;
        if (!v11)
          goto LABEL_18;
      }
LABEL_19:

      v19 = 0;
      v8 = v21;
    }
    else
    {
LABEL_18:

      v19 = v9;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)hmf_arrayForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hmf_numberForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hmf_dictionaryForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hmf_mutableDictionaryForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hmf_unarchivedObjectForKey:()HMFoundation ofClasses:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hmf_dataForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v9, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v13 = (void *)MEMORY[0x1A1AC355C]();
      v14 = a1;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v20 = v16;
        v21 = 2112;
        v22 = v8;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_19B546000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize object of classes: %@, from data %@, with error: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v13);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)hmf_dataForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hmf_mutableArrayForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)shortDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "secureDescriptionWithIndent:newLine:blacklistedKeys:", 0, 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)hmf_BOOLForKey:()HMFoundation
{
  return objc_msgSend(a1, "hmf_BOOLForKey:isPresent:", a3, 0);
}

- (uint64_t)hmf_BOOLForKey:()HMFoundation isPresent:
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "hmf_numberForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = v5 != 0;
  if (v5)
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = 0;

  return v7;
}

- (id)hmf_UUIDForKey:()HMFoundation
{
  void *v1;
  char isKindOfClass;
  void *v3;
  id v4;
  id v5;
  id v6;
  char v7;
  void *v8;
  id v9;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v3 = v1;
    else
      v3 = 0;
    v4 = v3;
    if ((isKindOfClass & 1) != 0)
    {
      v5 = v1;
    }
    else
    {
      v6 = v1;
      objc_opt_class();
      v7 = objc_opt_isKindOfClass();
      if ((v7 & 1) != 0)
        v8 = v6;
      else
        v8 = 0;
      v9 = v8;

      v5 = 0;
      if ((v7 & 1) != 0)
        v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)hmf_errorForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)privateDescription
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;
        v10 = v9;
        v11 = v10;
        if (v10)
          objc_msgSend(v10, "privateDescription");
        else
          objc_msgSend(v8, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, v7);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  objc_msgSend(v2, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)hmf_setForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

+ (NSString)shortDescription
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (id)hmf_base64EncodedDataForKey:()HMFoundation
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hmf_stringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v1, 1);
  else
    v2 = 0;

  return v2;
}

- (uint64_t)hmf_BOOLForKey:()HMFoundation error:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "BOOLValue");
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)hmf_calendarForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hmf_dateComponentsForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hmf_flowForKey:()HMFoundation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMFMessageFlowKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)hmf_nullForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (uint64_t)hmf_integerForKey:()HMFoundation error:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "integerValue");
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)hmf_mutableSetForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hmf_timeZoneForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hmf_URLForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hmf_valueForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hmf_fileHandleForKey:()HMFoundation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (void)hmf_enumerateKeysAndObjectsWithAutoreleasePoolUsingBlock:()HMFoundation
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__NSDictionary_HMFoundation__hmf_enumerateKeysAndObjectsWithAutoreleasePoolUsingBlock___block_invoke;
  v6[3] = &unk_1E3B38518;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v6);

}

@end
