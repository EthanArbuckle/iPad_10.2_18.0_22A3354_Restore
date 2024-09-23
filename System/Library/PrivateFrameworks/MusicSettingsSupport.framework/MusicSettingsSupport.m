id _MSS_valueForRequirementKey_specifier(void *a1, void *a2, void *a3)
{
  id v5;
  NSString *v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;
  SEL v12;
  void *v13;
  void *v14;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v5, "valueForMusicCapability:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v5, "allSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "specifierForID:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11
      || (objc_msgSend(v11, "music_getValue"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v11, !v8))
    {
      v12 = NSSelectorFromString(v6);
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (MusicSettingsPerformSelector2((uint64_t)v12, v5, v7, 0),
            (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id _MSS_valueForRequirementKey_specifier(__strong id<MusicSettingsSupportController>, NSString *__strong, PSSpecifier *__strong)");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("MusicSettingsSupportController.m"), 291, CFSTR("No matching capability: %@"), v6);

        v8 = 0;
      }
    }
  }

  return v8;
}

id _MSS_resolvedSpecifiers(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int hasMusicRequiredCapabilities_specifier;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id obj;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  void *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _QWORD v93[11];

  v93[9] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v1, "allSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend(v1, "allSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v84;
    v63 = *MEMORY[0x24BE75C30];
    v50 = *MEMORY[0x24BE75D90];
    v51 = *MEMORY[0x24BE75D88];
    v48 = v5;
    v49 = v4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v84 != v54)
          objc_enumerationMutation(v5);
        v56 = v6;
        v7 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v6);
        objc_msgSend(v7, "properties");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        hasMusicRequiredCapabilities_specifier = _MSS_hasMusicRequiredCapabilities_specifier(v1, v8, v7);

        if (hasMusicRequiredCapabilities_specifier)
        {
          objc_msgSend(v7, "music_copy");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          v93[0] = CFSTR("musicDynamicFooterText");
          v93[1] = CFSTR("musicDynamicIconImage");
          v93[2] = CFSTR("musicDynamicLabel");
          v93[3] = CFSTR("musicDynamicFooterHyperlinkViewText");
          v93[4] = CFSTR("musicDynamicFooterHyperlinkViewLinkAction");
          v93[5] = CFSTR("musicDynamicFooterHyperlinkViewLinkText");
          v93[6] = CFSTR("musicDynamicEnabled");
          v93[7] = CFSTR("musicFooterHyperlinkViewText");
          v93[8] = CFSTR("musicFooterHyperlinkViewLinkText");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v80;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v80 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
                objc_msgSend(v10, "objectForKeyedSubscript:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17)
                  _MSS_setValue_forSpecifier_key(v1, v17, v10, v16);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
            }
            while (v13);
          }

          objc_msgSend(v10, "propertyForKey:", CFSTR("musicOverrides"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            if (_NSIsNSDictionary())
            {
              v76[0] = MEMORY[0x24BDAC760];
              v76[1] = 3221225472;
              v76[2] = ___MSS_resolvedSpecifiers_block_invoke;
              v76[3] = &unk_24F133B20;
              v77 = v1;
              v78 = v10;
              objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v76);

              v19 = v77;
              goto LABEL_44;
            }
            if (_NSIsNSArray())
            {
              v74 = 0u;
              v75 = 0u;
              v72 = 0u;
              v73 = 0u;
              obj = v18;
              v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
              if (!v59)
                goto LABEL_43;
              v52 = v18;
              v58 = *(_QWORD *)v73;
              while (1)
              {
                v20 = 0;
                do
                {
                  if (*(_QWORD *)v73 != v58)
                    objc_enumerationMutation(obj);
                  v61 = v20;
                  v21 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v20);
                  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("property"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("values"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v23)
                  {
                    v89 = v21;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v70 = 0u;
                  v71 = 0u;
                  v68 = 0u;
                  v69 = 0u;
                  v24 = v23;
                  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v88, 16);
                  if (v25)
                  {
                    v26 = v25;
                    v27 = *(_QWORD *)v69;
                    do
                    {
                      for (j = 0; j != v26; ++j)
                      {
                        if (*(_QWORD *)v69 != v27)
                          objc_enumerationMutation(v24);
                        v29 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
                        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("value"));
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("requirements"));
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v31, "objectForKeyedSubscript:", v63);
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        v33 = _MSS_hasMusicRequiredCapabilities_specifier(v1, v31, v10);
                        if (!v32)
                        {
                          if (!v33)
                            goto LABEL_38;
LABEL_37:
                          _MSS_setValue_forSpecifier_key(v1, v30, v10, v22);
                          goto LABEL_38;
                        }
                        if (v33 && (SystemHasCapabilities() & 1) != 0)
                          goto LABEL_37;
LABEL_38:

                      }
                      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v88, 16);
                    }
                    while (v26);
                  }

                  v20 = v61 + 1;
                }
                while (v61 + 1 != v59);
                v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
                if (!v59)
                {
                  v5 = v48;
                  v4 = v49;
                  v18 = v52;
LABEL_43:
                  v19 = obj;
LABEL_44:

                  break;
                }
              }
            }
            objc_msgSend(v10, "propertyForKey:", v51);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "propertyForKey:", v50);
            v35 = objc_claimAutoreleasedReturnValue();
            v36 = (void *)v35;
            if (v34 && v35)
            {
              v60 = (void *)v35;
              v53 = v18;
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v34, "count"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = 0u;
              v65 = 0u;
              v66 = 0u;
              v67 = 0u;
              v62 = v34;
              v38 = v34;
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v64, v87, 16);
              if (v39)
              {
                v40 = v39;
                v41 = *(_QWORD *)v65;
                do
                {
                  for (k = 0; k != v40; ++k)
                  {
                    if (*(_QWORD *)v65 != v41)
                      objc_enumerationMutation(v38);
                    v43 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k);
                    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v1, "stringsTable");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "localizedStringForKey:value:table:", v43, &stru_24F133EF0, v45);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "addObject:", v46);

                  }
                  v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v64, v87, 16);
                }
                while (v40);
              }

              v36 = v60;
              objc_msgSend(v10, "setValues:titles:", v60, v37);

              v5 = v48;
              v4 = v49;
              v18 = v53;
              v34 = v62;
            }

          }
        }
        v6 = v56 + 1;
      }
      while (v56 + 1 != v55);
      v55 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
    }
    while (v55);
  }

  return v4;
}

void sub_2287A1404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _MSS_setValue_forSpecifier_key(void *a1, void *a2, void *a3, void *a4)
{
  NSString *v7;
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  SEL v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  SEL v23;
  SEL v24;
  SEL v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  SEL v30;
  void *v31;
  void *v32;
  void *v33;
  SEL v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  SEL v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  NSRange v44;

  v43 = a1;
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE75D50]))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringsTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", v7, &stru_24F133EF0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setName:", v12);
    goto LABEL_3;
  }
  v13 = *MEMORY[0x24BE75A68];
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE75A68]))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringsTable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", v7, &stru_24F133EF0, v15);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v16 = v10;
LABEL_12:
    if (!-[__CFString length](v16, "length"))
    {

      v10 = CFSTR(" ");
    }
    v20 = v8;
    v21 = v10;
    v22 = v13;
    goto LABEL_15;
  }
  v17 = *MEMORY[0x24BE75A18];
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE75A18]))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("musicDynamicFooterText")))
    {
      v19 = NSSelectorFromString(v7);
      MusicSettingsPerformSelector2((uint64_t)v19, v43, v8, 0);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = v16;
      goto LABEL_12;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("musicDynamicIconImage")))
    {
      v23 = NSSelectorFromString(v7);
      MusicSettingsPerformSelector2((uint64_t)v23, v43, v8, 0);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x24BE75AC8];
      if (v10)
      {
        v20 = v8;
        v21 = v10;
LABEL_15:
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, v22);
        goto LABEL_16;
      }
      goto LABEL_26;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("musicDynamicLabel")))
    {
      v24 = NSSelectorFromString(v7);
      MusicSettingsPerformSelector2((uint64_t)v24, v43, v8, 0);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setName:", v10);
      goto LABEL_16;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("musicDynamicFooterHyperlinkViewText")))
    {
      v25 = NSSelectorFromString(v7);
      MusicSettingsPerformSelector2((uint64_t)v25, v43, v8, 0);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x24BE75A58];
      if (!v10)
      {
LABEL_26:
        v26 = v8;
        goto LABEL_27;
      }
      v26 = v8;
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("musicFooterHyperlinkViewText")))
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("musicDynamicFooterHyperlinkViewLinkText")))
        {
          v30 = NSSelectorFromString(v7);
          MusicSettingsPerformSelector2((uint64_t)v30, v43, v8, 0);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("musicFooterHyperlinkViewLinkText")))
          {
            if (!objc_msgSend(v9, "isEqualToString:", CFSTR("musicDynamicFooterHyperlinkViewLinkAction")))
            {
              if (objc_msgSend(v9, "isEqualToString:", CFSTR("musicDynamicEnabled")))
              {
                v39 = NSSelectorFromString(v7);
                MusicSettingsPerformSelector2((uint64_t)v39, v43, v8, 0);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v18, "BOOLValue"));
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v40, v17);
              }
              else
              {
                v41 = *MEMORY[0x24BE75CD0];
                if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE75CD0]))
                {
                  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);
                  goto LABEL_17;
                }
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "stringsTable");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "localizedStringForKey:value:table:", v7, &stru_24F133EF0, v40);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v42, v41);

              }
              goto LABEL_9;
            }
            v34 = NSSelectorFromString(v7);
            MusicSettingsPerformSelector2((uint64_t)v34, v43, v8, 0);
            v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v10 = v35;
            if (v35)
            {
              v36 = (void *)MEMORY[0x24BDD1968];
              -[__CFString target](v35, "target");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "valueWithNonretainedObject:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v38, *MEMORY[0x24BE75A50]);

              -[__CFString selectorString](v10, "selectorString");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75A38]);
              goto LABEL_4;
            }
            objc_msgSend(v8, "removePropertyForKey:", *MEMORY[0x24BE75A50]);
            v27 = *MEMORY[0x24BE75A38];
            v26 = v8;
LABEL_28:
            objc_msgSend(v26, "removePropertyForKey:", v27);
            goto LABEL_16;
          }
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringsTable");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "localizedStringForKey:value:table:", v7, &stru_24F133EF0, v32);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE75A58]);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v33;
        if (!v10 || !v33)
        {
          objc_msgSend(v8, "removePropertyForKey:", *MEMORY[0x24BE75A40]);
          goto LABEL_4;
        }
        v44.location = objc_msgSend(v33, "rangeOfString:", v10);
        NSStringFromRange(v44);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75A40]);
LABEL_3:

LABEL_4:
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringsTable");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", v7, &stru_24F133EF0, v29);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v22 = *MEMORY[0x24BE75A58];
      v26 = v8;
      if (!v10)
      {
LABEL_27:
        v27 = v22;
        goto LABEL_28;
      }
    }
    objc_msgSend(v26, "setProperty:forKey:", v10, v22);
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NSString BOOLValue](v7, "BOOLValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v17);
LABEL_9:

LABEL_17:
}

id MusicSettingsPerformSelector2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (*v10)(id, uint64_t, id);
  id v11;
  int v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v7)
  {
    v14 = 0;
    goto LABEL_20;
  }
  v10 = (void (*)(id, uint64_t, id))objc_msgSend(v7, "methodForSelector:", a1);
  objc_msgSend(v7, "methodSignatureForSelector:", a1);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = *(unsigned __int8 *)objc_msgSend(v11, "methodReturnType");

  if (!v9)
  {
    if (v8)
    {
      if (v12 == 64)
      {
        v10(v7, a1, v8);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      v10(v7, a1, v8);
    }
    else
    {
      if (v12 == 64)
      {
        ((void (*)(id, uint64_t))v10)(v7, a1);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      ((void (*)(id, uint64_t))v10)(v7, a1);
    }
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  if (v12 != 64)
  {
    ((void (*)(id, uint64_t, id, id))v10)(v7, a1, v8, v9);
    goto LABEL_15;
  }
  ((void (*)(id, uint64_t, id, id))v10)(v7, a1, v8, v9);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v15 = (void *)v13;
LABEL_16:
  if (v12 == 64)
    v16 = v15;
  else
    v16 = 0;
  v14 = v16;

LABEL_20:
  return v14;
}

id MusicSettingsPerformSelector(uint64_t a1, void *a2, void *a3)
{
  return MusicSettingsPerformSelector2(a1, a2, a3, 0);
}

uint64_t _MSS_hasMusicRequiredCapabilities_specifier(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _BOOL4 hasMusicRequiredCapabilities_specifier;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t j;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("musicRequiredCapabilities"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    hasMusicRequiredCapabilities_specifier = _MSS__hasMusicRequiredCapabilities_specifier(v5, v8, v7);
  else
    hasMusicRequiredCapabilities_specifier = 1;
  objc_msgSend(v6, "objectForKey:", CFSTR("musicRequiredCapabilitiesNot"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = 0;
  else
    v12 = hasMusicRequiredCapabilities_specifier;
  if (v10 && hasMusicRequiredCapabilities_specifier)
    v12 = !_MSS__hasMusicRequiredCapabilities_specifier(v5, v10, v7);
  objc_msgSend(v6, "objectForKey:", CFSTR("musicRequiredCapabilitiesOr"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v29 = v11;
  if (v13)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v15)
    {
      v16 = v15;
      LOBYTE(v17) = 0;
      v18 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v14);
          v17 = v17 || _MSS__hasMusicRequiredCapabilities_specifier(v5, *(void **)(*((_QWORD *)&v34 + 1) + 8 * i), v7);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v16);
    }
    else
    {
      v17 = 0;
    }
    v12 = v12 & v17;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("musicRequiredCapabilitiesNotOr"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v28 = v8;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v22)
    {
      v23 = v22;
      LOBYTE(v24) = 0;
      v25 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v21);
          v24 = v24 || _MSS__hasMusicRequiredCapabilities_specifier(v5, *(void **)(*((_QWORD *)&v30 + 1) + 8 * j), v7);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v23);
    }
    else
    {
      v24 = 0;
    }
    v12 = v12 & !v24;
    v8 = v28;
  }

  return v12;
}

void sub_2287A38C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

BOOL _MSS__hasMusicRequiredCapabilities_specifier(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t *v12;
  char hasMusicRequiredCapabilities_specifier;
  void *v14;
  uint64_t *v15;
  char v16;
  _BOOL8 v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v8);
          v12 = v28;
          if (*((_BYTE *)v28 + 24))
          {
            hasMusicRequiredCapabilities_specifier = _MSS__hasMusicRequiredCapabilities_specifier(v5, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v7);
            v12 = v28;
          }
          else
          {
            hasMusicRequiredCapabilities_specifier = 0;
          }
          *((_BYTE *)v12 + 24) = hasMusicRequiredCapabilities_specifier;
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v9);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = ___MSS__hasMusicRequiredCapabilities_specifier_block_invoke;
      v19[3] = &unk_24F133BB0;
      v20 = v5;
      v21 = v7;
      v22 = &v27;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v19);

      v8 = v20;
    }
    else
    {
      _MSS_valueForRequirementKey_specifier(v5, v6, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      v15 = v28;
      if (*((_BYTE *)v28 + 24))
      {
        v16 = objc_msgSend(v14, "isEqual:", MEMORY[0x24BDBD1C8]);
        v15 = v28;
      }
      else
      {
        v16 = 0;
      }
      *((_BYTE *)v15 + 24) = v16;
    }
  }

  v17 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);

  return v17;
}

void sub_2287A3C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t SystemHasCapabilities()
{
  return MEMORY[0x24BE75E00]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x24BDBD150]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x24BDBD168]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

