@implementation NSArray(KeyPathLookup)

- (id)hmf_firstObjectWithValue:()KeyPathLookup forKeyPath:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
    _HMFPreconditionFailure(CFSTR("keyPath"));
  v8 = v7;
  if (v6)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = a1;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v13, "valueForKeyPath:", v8, (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v6);

          if ((v15 & 1) != 0)
          {
            v16 = v13;

            goto LABEL_14;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (uint64_t)hmf_firstObjectWithInstanceID:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, CFSTR("instanceID"));
}

- (uint64_t)hmf_firstObjectWithUUID:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, CFSTR("uuid"));
}

- (uint64_t)hmf_firstObjectWithName:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, CFSTR("name"));
}

- (uint64_t)hmf_firstObjectWithZoneID:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, CFSTR("zoneID"));
}

- (uint64_t)hmf_firstObjectWithUniqueIdentifier:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, CFSTR("uniqueIdentifier"));
}

- (uint64_t)hmf_firstObjectWithSPIUniqueIdentifier:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, CFSTR("contextSPIUniqueIdentifier"));
}

- (uint64_t)hmf_firstObjectWithCharacteristicType:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, CFSTR("characteristicType"));
}

@end
