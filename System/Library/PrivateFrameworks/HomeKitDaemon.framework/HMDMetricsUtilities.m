@implementation HMDMetricsUtilities

+ (id)primaryServiceTypeForHAPAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __CFString *v13;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "primaryService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "primaryService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
LABEL_15:
    objc_msgSend(v5, "type");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "bridge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else
    {
      objc_msgSend(v3, "identifiersForBridgedAccessories");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16)
      {
        v13 = CFSTR("Bridge");
        goto LABEL_16;
      }
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "services", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isPrimary") & 1) != 0)
          {
            v5 = v12;
            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
    }

    v13 = 0;
  }
LABEL_16:

  return v13;
}

+ (id)stringForSource:(unint64_t)a3
{
  if (a3 < 0xA)
    return off_24E787EE8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected source value: %lu"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
