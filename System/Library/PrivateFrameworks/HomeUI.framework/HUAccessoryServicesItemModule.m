@implementation HUAccessoryServicesItemModule

+ (id)supportedServiceTypes
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_standardServiceTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  BOOL v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUChildServiceEditorItemModule childServiceItemProvider](self, "childServiceItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "intersectsSet:", v4))
  {
    v37 = v4;
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11;
    objc_msgSend(v11, "hf_primaryService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v36 = v7;
    v14 = v7;
    v40 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v40)
    {
      v38 = v14;
      v39 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v42 != v39)
            objc_enumerationMutation(v14);
          v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v16, "service");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uniqueIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "uniqueIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "hmf_isEqualToUUID:", v19);

          v21 = objc_msgSend(v12, "hf_shouldSeparateAccessoryName");
          if (v20)
            v22 = v21 == 0;
          else
            v22 = 0;
          if (!v22)
          {
            objc_msgSend(v16, "service");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "hf_isVisible");

            if (v24)
            {
              v25 = objc_alloc(MEMORY[0x1E0D31570]);
              objc_msgSend(v16, "service");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "uniqueIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "UUIDString");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(CFSTR("HUAccessoryServicesItemSectionIdentifier"), "stringByAppendingString:", v28);
              v29 = v13;
              v30 = v12;
              v31 = v5;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)objc_msgSend(v25, "initWithIdentifier:", v32);

              v45 = v16;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setItems:", v34);

              v5 = v31;
              v12 = v30;
              v13 = v29;
              v14 = v38;
              objc_msgSend(v5, "addObject:", v33);

            }
          }
        }
        v40 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v40);
    }

    v7 = v36;
    v4 = v37;
  }
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_301);

  return v5;
}

uint64_t __65__HUAccessoryServicesItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = a2;
  objc_opt_class();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_opt_class();
  objc_msgSend(v4, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v9, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isPrimaryService") & 1) != 0)
  {
    v16 = 1;
  }
  else if ((objc_msgSend(v15, "isPrimaryService") & 1) != 0)
  {
    v16 = -1;
  }
  else
  {
    objc_msgSend(v14, "serviceType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serviceType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if ((v19 & 1) != 0)
    {
      objc_msgSend(v14, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
    }
    else
    {
      objc_msgSend(v14, "hf_userFriendlyLocalizedLowercaseDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hf_userFriendlyLocalizedLowercaseDescription");
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v20, "localizedStandardCompare:", v21);

  }
  return v16;
}

@end
