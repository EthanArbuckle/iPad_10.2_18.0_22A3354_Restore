@implementation HDOntologyLocalizedStringProvider

+ (id)localizedOntologyPreferredNamesForConcept:(id)a3 withUserDomainConceptPropertyType:(int64_t)a4
{
  return (id)objc_msgSend(a1, "localizedOntologyPreferredNamesForConcept:version:withUserDomainConceptPropertyType:", a3, 0, a4);
}

+ (id)localizedOntologyPreferredNamesForConcept:(id)a3 version:(id)a4 withUserDomainConceptPropertyType:(int64_t)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v21;
  id v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v21 = v6;
  objc_msgSend(v6, "attributes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    v11 = (void *)*MEMORY[0x1E0CB6080];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v13, "type") == 1012)
        {
          v14 = v11;
          if (!v11)
            continue;
          v15 = v14;
        }
        else
        {
          v15 = CFSTR("en_US");
          if (objc_msgSend(v13, "type") != 960)
          {
            v15 = CFSTR("en_GB");
            if (objc_msgSend(v13, "type") != 961)
            {
              v15 = CFSTR("en_CA");
              if (objc_msgSend(v13, "type") != 962)
                continue;
            }
          }
        }
        if ((objc_msgSend(v13, "isDeleted") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB6D08], "nullPropertyWithType:locale:version:", a5, v15, objc_msgSend(v13, "version"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = objc_alloc(MEMORY[0x1E0CB6D08]);
          objc_msgSend(v13, "stringValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            v19 = objc_msgSend(v22, "integerValue");
          else
            v19 = objc_msgSend(v13, "version");
          v16 = (void *)objc_msgSend(v17, "initWithType:stringValue:locale:version:", a5, v18, v15, v19);

        }
        objc_msgSend(v7, "addObject:", v16);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  return v7;
}

+ (id)nullLocalizedOntologyPreferredNamesWithVersion:(int64_t)a3 withUserDomainConceptPropertyType:(int64_t)a4
{
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0CB6080];
  v10[1] = CFSTR("en_US");
  v10[2] = CFSTR("en_GB");
  v10[3] = CFSTR("en_CA");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nullLocalizedOntologyStringsWithVersion:localesToDelete:propertyType:", a3, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)nullLocalizedOntologyLoggingUnitsWithVersion:(int64_t)a3 withUserDomainConceptPropertyType:(int64_t)a4
{
  return (id)objc_msgSend(a1, "_nullLocalizedOntologyStringsWithVersion:localesToDelete:propertyType:", a3, &unk_1E6DF8FC0, a4);
}

+ (id)_nullLocalizedOntologyStringsWithVersion:(int64_t)a3 localesToDelete:(id)a4 propertyType:(int64_t)a5
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __107__HDOntologyLocalizedStringProvider__nullLocalizedOntologyStringsWithVersion_localesToDelete_propertyType___block_invoke;
  v6[3] = &__block_descriptor_48_e54___HKUserDomainConceptLocalizedString_16__0__NSString_8l;
  v6[4] = a5;
  v6[5] = a3;
  objc_msgSend(a4, "hk_map:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __107__HDOntologyLocalizedStringProvider__nullLocalizedOntologyStringsWithVersion_localesToDelete_propertyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB6D08], "nullPropertyWithType:locale:version:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

+ (id)localizedLoggingUnitsForConcept:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "attributes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "type");
        switch(v14)
        {
          case 795:
            v18 = v13;
            v16 = v8;
            v8 = v18;
            break;
          case 796:
            v17 = v13;
            v16 = v9;
            v9 = v17;
            break;
          case 802:
            objc_msgSend(v13, "stringValue");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = v10;
            v10 = (void *)v15;
            break;
          default:
            continue;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (!v7)
      {

        if (v10)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (v8)
          {
            objc_msgSend(a1, "_localizedLoggingUnitForAttribute:locale:propertyType:", v8, v10, 160018);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v20);

          }
          if (v9)
          {
            objc_msgSend(a1, "_localizedLoggingUnitForAttribute:locale:propertyType:", v9, v10, 160017);
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v5);
            goto LABEL_21;
          }
        }
        else
        {
          v19 = (id)MEMORY[0x1E0C9AA60];
        }
        goto LABEL_23;
      }
    }
  }
  v10 = 0;
  v9 = 0;
  v8 = 0;
  v19 = (id)MEMORY[0x1E0C9AA60];
LABEL_21:

LABEL_23:
  return v19;
}

+ (id)_localizedLoggingUnitForAttribute:(id)a3 locale:(id)a4 propertyType:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "isDeleted") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB6D08], "nullPropertyWithType:locale:version:", a5, v8, objc_msgSend(v7, "version"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0CB6D08]);
    objc_msgSend(v7, "stringValue");
    v11 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "initWithType:stringValue:locale:version:", a5, v11, v8, objc_msgSend(v7, "version"));

    v8 = (id)v11;
  }

  return v9;
}

+ (id)localizedUserDomainConceptPropertyStringForConceptAttribute:(id)a3 locale:(id)a4 propertyType:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isDeleted"))
  {
    objc_msgSend(MEMORY[0x1E0CB6D08], "nullPropertyWithType:locale:version:", a5, v8, objc_msgSend(v7, "version"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0CB6D08]);
    objc_msgSend(v7, "stringValue");
    v11 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "initWithType:stringValue:locale:version:", a5, v11, v8, objc_msgSend(v7, "version"));

    v8 = (id)v11;
  }

  return v9;
}

@end
