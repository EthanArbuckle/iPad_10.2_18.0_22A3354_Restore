@implementation HMDFetchedAccessorySettingsControllerMutableKeyPathMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverMapItems, 0);
}

- (id)availableKeyPaths
{
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, a2, 8, 1), "na_flatMap:", &__block_literal_global_101990);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t __75__HMDFetchedAccessorySettingsControllerMutableKeyPathMap_availableKeyPaths__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "keyPaths");
}

- (id)objectForKeyedSubscript:(void *)a1
{
  const char *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (a1)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_getProperty(a1, v3, 8, 1);
    v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "keyPaths", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "containsObject:", v4);

          if ((v11 & 1) != 0)
          {
            objc_msgSend(v9, "driver");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
