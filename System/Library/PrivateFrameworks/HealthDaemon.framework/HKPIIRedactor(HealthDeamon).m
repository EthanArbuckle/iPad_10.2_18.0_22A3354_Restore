@implementation HKPIIRedactor(HealthDeamon)

+ (id)redactorWithProfile:()HealthDeamon error:
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _QWORD v76[18];

  v76[16] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_opt_self();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C97298], "hd_contactStoreWithHealthAppIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v9 = *MEMORY[0x1E0C966D0];
  v76[0] = *MEMORY[0x1E0C966C0];
  v76[1] = v9;
  v10 = *MEMORY[0x1E0C967D8];
  v76[2] = *MEMORY[0x1E0C967D0];
  v76[3] = v10;
  v11 = *MEMORY[0x1E0C967A0];
  v76[4] = *MEMORY[0x1E0C96820];
  v76[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  objc_msgSend(v8, "_ios_meContactWithKeysToFetch:error:", v12, &v75);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v75;

  if (v13 || !v14)
  {
    if (v13)
    {
      v19 = v7;
      v20 = v13;
      v21 = objc_opt_self();
      objc_msgSend(v20, "familyName");
      v22 = v14;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKPIIRedactor _addName:toArray:](v21, v23, v19);

      objc_msgSend(v20, "givenName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKPIIRedactor _addName:toArray:](v21, v24, v19);

      objc_msgSend(v20, "phoneticFamilyName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKPIIRedactor _addName:toArray:](v21, v25, v19);

      objc_msgSend(v20, "phoneticGivenName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKPIIRedactor _addName:toArray:](v21, v26, v19);

      objc_msgSend(v20, "previousFamilyName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKPIIRedactor _addName:toArray:](v21, v27, v19);

      objc_msgSend(v20, "nickname");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      +[HKPIIRedactor _addName:toArray:](v21, v28, v19);
      v14 = v22;
    }
LABEL_11:
    +[HDKeyValueDomain healthAppUserDefaultsDomainWithProfile:](HDKeyValueDomain, "healthAppUserDefaultsDomainWithProfile:", v5);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0CB7820];
    v74 = 0;
    objc_msgSend(v16, "propertyListValueForKey:error:", v29, &v74);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v74;
    v18 = v31;
    if (!v30 && v31)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 100, CFSTR("Error getting names to redact"), v31);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        if (a4)
        {
          v32 = objc_retainAutorelease(v32);
          v17 = 0;
          *a4 = v32;
          v33 = v32;
LABEL_49:

          goto LABEL_50;
        }
        v33 = v32;
        _HKLogDroppedError();
        v32 = v33;
      }
      else
      {
        v33 = 0;
      }
      v17 = 0;
      goto LABEL_49;
    }
    v65 = v31;
    if (v30)
    {
      objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7808]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKPIIRedactor _addName:toArray:](v6, v34, v7);

      objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7810]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKPIIRedactor _addName:toArray:](v6, v35, v7);

    }
    v64 = v30;
    objc_msgSend(v5, "medicalIDDataManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0;
    objc_msgSend(v36, "fetchMedicalIDIfSetUpWithError:", &v73);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v73;

    v63 = v37;
    if (v37 || !v33)
    {
      v61 = v33;
      v62 = v13;
      if (v37)
      {
        objc_msgSend(v37, "name");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v42 = v14;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsSeparatedByCharactersInSet:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v42;
        +[HKPIIRedactor _addNames:toArray:](v6, v44, v7);

      }
      objc_msgSend(MEMORY[0x1E0CB6258], "accountOwnerType");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      +[HDSampleEntity samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:](HDSampleEntity, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v45, v5, MEMORY[0x1E0C9AA70], 0, 0, 0, &v72);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v72;

      if (v46)
      {
        v58 = v40;
        v59 = v14;
        v60 = v5;
        v66 = a1;
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v39 = v46;
        v47 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v69;
          do
          {
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v69 != v49)
                objc_enumerationMutation(v39);
              objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "name");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "componentsSeparatedByCharactersInSet:", v52);
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              +[HKPIIRedactor _addNames:toArray:](v6, v53, v7);
            }
            v48 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
          }
          while (v48);
        }

        v17 = v7;
        a1 = v66;
        v14 = v59;
        v5 = v60;
        v13 = v62;
        v33 = v61;
        v40 = v58;
        goto LABEL_48;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 100, CFSTR("Error getting names to redact"), v40);
      v54 = (id)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      v13 = v62;
      if (v54)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v54);
        else
          _HKLogDroppedError();
      }

      v39 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 100, CFSTR("Error getting names to redact"), v33);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        if (a4)
        {
          v39 = objc_retainAutorelease(v38);
          v17 = 0;
          *a4 = v39;
        }
        else
        {
          _HKLogDroppedError();
          v17 = 0;
        }
        v40 = v39;
        goto LABEL_48;
      }
      v40 = 0;
    }
    v17 = 0;
LABEL_48:

    v30 = v64;
    v18 = v65;
    v32 = v63;
    goto LABEL_49;
  }
  if (objc_msgSend(v14, "code") == 2 || objc_msgSend(v14, "code") == 200)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 100, CFSTR("Error getting names to redact"), v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if (a4)
    {
      v16 = objc_retainAutorelease(v15);
      v17 = 0;
      *a4 = v16;
    }
    else
    {
      _HKLogDroppedError();
      v17 = 0;
    }
    v18 = v16;
  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
LABEL_50:

  if (v17)
  {
    objc_msgSend(a1, "redactorWithNames:error:", v17, a4);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

@end
