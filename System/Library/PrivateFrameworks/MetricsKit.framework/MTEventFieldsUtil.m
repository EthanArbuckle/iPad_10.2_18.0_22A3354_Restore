@implementation MTEventFieldsUtil

+ (id)mapForSectionName:(id)a3 inFieldsMap:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_msgSend(v6, "valueForKeyPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (!v8)
  {
    objc_msgSend(CFSTR("custom."), "stringByAppendingString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForKeyPath:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)applyFieldsMap:(id)a3 data:(id)a4 sectionName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  uint64_t v55;
  void *v56;
  void *v57;
  NSObject *v58;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "mapForSectionName:inFieldsMap:", v12, v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v62 = v12;
        v63 = v10;
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v61 = v25;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
        if (!v27)
          goto LABEL_44;
        v28 = v27;
        v29 = *(_QWORD *)v76;
        v30 = 0x24BDBC000uLL;
        v65 = v26;
        while (1)
        {
          v31 = 0;
          v66 = v28;
          do
          {
            if (*(_QWORD *)v76 != v29)
              objc_enumerationMutation(v26);
            v32 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v31);
            objc_msgSend(v26, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v83 = v33;
              objc_msgSend(*(id *)(v30 + 3632), "arrayWithObjects:count:", &v83, 1);
              v34 = (id)objc_claimAutoreleasedReturnValue();
              if (!v34)
                goto LABEL_23;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || (v34 = v33) == 0)
              {
LABEL_23:
                v36 = 0;
                goto LABEL_26;
              }
            }
            v35 = v29;
            v73 = 0u;
            v74 = 0u;
            v71 = 0u;
            v72 = 0u;
            v36 = v34;
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v72;
              while (2)
              {
                for (i = 0; i != v38; ++i)
                {
                  if (*(_QWORD *)v72 != v39)
                    objc_enumerationMutation(v36);
                  objc_msgSend(v11, "mt_nullableValueForKeyPathExt:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i));
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (v41)
                  {
                    v42 = (void *)v41;
                    objc_msgSend(v64, "setObject:forKey:", v41, v32);

                    goto LABEL_25;
                  }
                }
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
                if (v38)
                  continue;
                break;
              }
            }
LABEL_25:

            v29 = v35;
            v26 = v65;
            v28 = v66;
            v30 = 0x24BDBC000;
LABEL_26:

            ++v31;
          }
          while (v31 != v28);
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
          if (!v28)
            goto LABEL_44;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v62 = v12;
        v63 = v10;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v61 = v25;
        v50 = v25;
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v68;
          do
          {
            for (j = 0; j != v52; ++j)
            {
              if (*(_QWORD *)v68 != v53)
                objc_enumerationMutation(v50);
              v55 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
              objc_msgSend(v11, "mt_nullableValueForKey:", v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              if (v56)
                objc_msgSend(v64, "setObject:forKey:", v56, v55);

            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
          }
          while (v52);
        }
LABEL_44:
        v25 = v61;

        v57 = v64;
        v12 = v62;
        if (!objc_msgSend(v64, "count"))
        {
          MTMetricsKitOSLog();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v80 = v62;
            _os_log_impl(&dword_20D758000, v58, OS_LOG_TYPE_ERROR, "MetricsKit: No matched fields found in data for fieldsMap section %@", buf, 0xCu);
          }

        }
        v43 = (void *)objc_msgSend(v64, "copy");
        v10 = v63;
      }
      else
      {
        if (a6)
        {
          MTError(106, CFSTR("fieldsMap section %@ in config sources is not valid"), v44, v45, v46, v47, v48, v49, (uint64_t)v12);
          v43 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v43 = 0;
        }
        v57 = v64;
      }

    }
    else if (a6)
    {
      MTError(105, CFSTR("fieldsMap section %@ is not found in config sources"), v19, v20, v21, v22, v23, v24, (uint64_t)v12);
      v43 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = 0;
    }

  }
  else if (a6)
  {
    MTError(104, CFSTR("fieldsMap in config sources is not a dictionary object"), v13, v14, v15, v16, v17, v18, v60);
    v43 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

@end
