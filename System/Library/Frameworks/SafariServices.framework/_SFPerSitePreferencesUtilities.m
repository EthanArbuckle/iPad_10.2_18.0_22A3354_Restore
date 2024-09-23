@implementation _SFPerSitePreferencesUtilities

+ (id)preferenceValueForPSSpecifierValue:(id)a3 specifier:(id)a4 preference:(id)a5 preferenceManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(a4, "cellType") == 6 && objc_msgSend(v12, "conformsToProtocol:", &unk_1EE738248))
  {
    objc_msgSend(a1, "preferenceValueForBoolValue:preference:preferenceManager:", objc_msgSend(v10, "BOOLValue"), v11, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v12, "valuesForPreference:", v11, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v19, "isEqual:", v10) & 1) != 0)
          {
            v13 = v19;

            goto LABEL_14;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v16)
          continue;
        break;
      }
    }

    v13 = 0;
  }
LABEL_14:

  return v13;
}

+ (id)specifierValueForSpecifier:(id)a3 preferenceValue:(id)a4 preference:(id)a5 preferenceManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(a3, "cellType") == 6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isBinaryPreferenceValueOn:preference:preferenceManager:", v10, v11, v12));
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v10;
  }
  v14 = v13;

  return v14;
}

+ (BOOL)isBinaryPreferenceValueOn:(id)a3 preference:(id)a4 preferenceManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE738248))
  {
    objc_msgSend(v9, "onValueForPreference:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)preferenceValueForBoolValue:(BOOL)a3 preference:(id)a4 preferenceManager:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE738248))
  {
    if (a3)
      objc_msgSend(v8, "onValueForPreference:", v7);
    else
      objc_msgSend(v8, "offValueForPreference:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
