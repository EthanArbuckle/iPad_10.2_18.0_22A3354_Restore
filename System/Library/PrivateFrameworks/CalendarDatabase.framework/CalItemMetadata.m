@implementation CalItemMetadata

+ (BOOL)isRecognizedProperty:(id)a3 inComponent:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  if (isRecognizedProperty_inComponent__onceToken_0 != -1)
    dispatch_once(&isRecognizedProperty_inComponent__onceToken_0, &__block_literal_global_22);
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("VTODO"))
    && (objc_msgSend((id)isRecognizedProperty_inComponent__savedPropertiesForTodosOnly, "containsObject:", v5) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend((id)isRecognizedProperty_inComponent__sSavedProps, "containsObject:", v5);
  }

  return v7;
}

void __52__CalItemMetadata_isRecognizedProperty_inComponent___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v0 = objc_msgSend(v5, "initWithObjects:", *MEMORY[0x1E0DDBA20], *MEMORY[0x1E0DDBA28], *MEMORY[0x1E0DDBA30], *MEMORY[0x1E0DDBA58], *MEMORY[0x1E0DDBA50], *MEMORY[0x1E0DDBA68], *MEMORY[0x1E0DDBA70], *MEMORY[0x1E0DDBA78], *MEMORY[0x1E0DDBA80], *MEMORY[0x1E0DDBA90], *MEMORY[0x1E0DDBAA8], *MEMORY[0x1E0DDBAB0], *MEMORY[0x1E0DDBAC8], *MEMORY[0x1E0DDBAD0], *MEMORY[0x1E0DDBAE8], *MEMORY[0x1E0DDBAF8], *MEMORY[0x1E0DDBB10],
         *MEMORY[0x1E0DDBB18],
         *MEMORY[0x1E0DDBB20],
         *MEMORY[0x1E0DDBB38],
         *MEMORY[0x1E0DDBB60],
         *MEMORY[0x1E0DDBB70],
         *MEMORY[0x1E0DDBB78],
         *MEMORY[0x1E0DDBB80],
         *MEMORY[0x1E0DDBBA8],
         *MEMORY[0x1E0DDBBB0],
         *MEMORY[0x1E0DDBAF0],
         *MEMORY[0x1E0DDB9E8],
         *MEMORY[0x1E0DDB9C8],
         *MEMORY[0x1E0DDB9C0],
         *MEMORY[0x1E0DDB968],
         *MEMORY[0x1E0DDB8E8],
         *MEMORY[0x1E0DDB930],
         *MEMORY[0x1E0DDBAC0],
         *MEMORY[0x1E0DDB938],
         *MEMORY[0x1E0DDB8E0],
         *MEMORY[0x1E0DDB998],
         *MEMORY[0x1E0DDB9A8],
         *MEMORY[0x1E0DDB9B0],
         *MEMORY[0x1E0DDB9A0],
         *MEMORY[0x1E0DDB9B8],
         *MEMORY[0x1E0DDB8D0],
         *MEMORY[0x1E0DDB8D8],
         *MEMORY[0x1E0DDB8F0],
         *MEMORY[0x1E0DDB8F8],
         *MEMORY[0x1E0DDB900],
         *MEMORY[0x1E0DDB908],
         *MEMORY[0x1E0DDB918],
         *MEMORY[0x1E0DDB960],
         *MEMORY[0x1E0DDB970],
         *MEMORY[0x1E0DDB978],
         *MEMORY[0x1E0DDB980],
         *MEMORY[0x1E0DDB988],
         *MEMORY[0x1E0DDB990],
         *MEMORY[0x1E0DDB8B8],
         *MEMORY[0x1E0DDB948],
         *MEMORY[0x1E0DDB8C0],
         *MEMORY[0x1E0DDB8C8],
         0);
  v1 = (void *)isRecognizedProperty_inComponent__sSavedProps;
  isRecognizedProperty_inComponent__sSavedProps = v0;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E0DDBB08], *MEMORY[0x1E0DDBA88], *MEMORY[0x1E0DDBA48], *MEMORY[0x1E0DDB940], *MEMORY[0x1E0DDB8A0], 0);
  v4 = (void *)isRecognizedProperty_inComponent__savedPropertiesForTodosOnly;
  isRecognizedProperty_inComponent__savedPropertiesForTodosOnly = v3;

}

+ (BOOL)isRecognizedParameter:(id)a3 forProperty:(id)a4 inComponent:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  char v10;

  v6 = isRecognizedParameter_forProperty_inComponent__onceToken_0;
  v7 = a4;
  v8 = a3;
  if (v6 != -1)
    dispatch_once(&isRecognizedParameter_forProperty_inComponent__onceToken_0, &__block_literal_global_2);
  objc_msgSend((id)isRecognizedParameter_forProperty_inComponent__recognizedParametersByPropertyName_0, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "containsObject:", v8);
  return v10;
}

void __65__CalItemMetadata_isRecognizedParameter_forProperty_inComponent___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[9];
  _QWORD v16[10];

  v16[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DDBA00], *MEMORY[0x1E0DDB9F8], *MEMORY[0x1E0DDB928], 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = *MEMORY[0x1E0DDBA70];
  v1 = *MEMORY[0x1E0DDBB90];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DDBB90], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v15[1] = *MEMORY[0x1E0DDBA80];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  v15[2] = *MEMORY[0x1E0DDBAA8];
  v4 = *MEMORY[0x1E0DDBBB8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DDBBB8], v1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  v15[3] = *MEMORY[0x1E0DDBB18];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v4, v1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  v15[4] = *MEMORY[0x1E0DDBB20];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DDBB28], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DDB968];
  v16[4] = v7;
  v16[5] = v0;
  v9 = *MEMORY[0x1E0DDB8E0];
  v15[5] = v8;
  v15[6] = v9;
  v10 = *MEMORY[0x1E0DDB9B0];
  v16[6] = v0;
  v16[7] = v0;
  v11 = *MEMORY[0x1E0DDB9C8];
  v15[7] = v10;
  v15[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DDB9D8], *MEMORY[0x1E0DDB9D0], 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 9);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)isRecognizedParameter_forProperty_inComponent__recognizedParametersByPropertyName_0;
  isRecognizedParameter_forProperty_inComponent__recognizedParametersByPropertyName_0 = v13;

}

+ (BOOL)shouldSkipSavingUnrecognizedParametersForProperty:(id)a3 inComponent:(id)a4
{
  uint64_t v4;
  id v5;
  char v6;

  v4 = shouldSkipSavingUnrecognizedParametersForProperty_inComponent__onceToken_0;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&shouldSkipSavingUnrecognizedParametersForProperty_inComponent__onceToken_0, &__block_literal_global_4);
  v6 = objc_msgSend((id)shouldSkipSavingUnrecognizedParametersForProperty_inComponent__propertiesToSkipSavingUnrecognizedParameters_0, "containsObject:", v5);

  return v6;
}

void __81__CalItemMetadata_shouldSkipSavingUnrecognizedParametersForProperty_inComponent___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0DDBA20], *MEMORY[0x1E0DDBA28], *MEMORY[0x1E0DDBAF8], *MEMORY[0x1E0DDBAB0], 0);
  v2 = (void *)shouldSkipSavingUnrecognizedParametersForProperty_inComponent__propertiesToSkipSavingUnrecognizedParameters_0;
  shouldSkipSavingUnrecognizedParametersForProperty_inComponent__propertiesToSkipSavingUnrecognizedParameters_0 = v1;

}

- (CalItemMetadata)initWithICSComponent:(id)a3
{
  id v4;
  CalItemMetadata *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSDictionary *unrecognizedProperties;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSDictionary *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)CalItemMetadata;
  v5 = -[CalItemMetadata init](&v60, sel_init);
  if (v5)
  {
    v6 = CDBiCalendarConversionHandle;
    if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5CCB000, v6, OS_LOG_TYPE_DEBUG, "Initializing calItem metadata", buf, 2u);
    }
    objc_msgSend((id)objc_opt_class(), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v4, "unrecognizedComponentName");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    v47 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v37 = v4;
    objc_msgSend(v4, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v57;
      v38 = *(_QWORD *)v57;
      v39 = v11;
      do
      {
        v15 = 0;
        v41 = v13;
        do
        {
          if (*(_QWORD *)v57 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v15);
          objc_msgSend(v16, "uppercaseString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend((id)objc_opt_class(), "isRecognizedProperty:inComponent:", v17, v10) & 1) != 0)
          {
            if ((objc_msgSend((id)objc_opt_class(), "shouldSkipSavingUnrecognizedParametersForProperty:inComponent:", v17, v10) & 1) == 0)
            {
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              v19 = v18;
              v42 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
              if (v42)
              {
                v20 = *(_QWORD *)v53;
                v45 = v18;
                v46 = v17;
                v44 = v19;
                v40 = *(_QWORD *)v53;
                do
                {
                  v21 = 0;
                  do
                  {
                    if (*(_QWORD *)v53 != v20)
                    {
                      v22 = v21;
                      objc_enumerationMutation(v19);
                      v21 = v22;
                    }
                    v43 = v21;
                    v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v21);
                    v48 = 0u;
                    v49 = 0u;
                    v50 = 0u;
                    v51 = 0u;
                    objc_msgSend(v23, "allParameters");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
                    if (v25)
                    {
                      v26 = v25;
                      v27 = *(_QWORD *)v49;
                      while (2)
                      {
                        for (i = 0; i != v26; ++i)
                        {
                          if (*(_QWORD *)v49 != v27)
                            objc_enumerationMutation(v24);
                          v29 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                          v30 = objc_opt_class();
                          objc_msgSend(v29, "uppercaseString");
                          v31 = (void *)objc_claimAutoreleasedReturnValue();
                          LOBYTE(v30) = objc_msgSend((id)v30, "isRecognizedParameter:forProperty:inComponent:", v31, v16, v10);

                          if ((v30 & 1) == 0)
                          {

                            -[NSDictionary setObject:forKey:](v47, "setObject:forKey:", v44, v16);
                            v14 = v38;
                            v11 = v39;
                            v13 = v41;
                            v18 = v45;
                            v17 = v46;
                            goto LABEL_34;
                          }
                        }
                        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
                        if (v26)
                          continue;
                        break;
                      }
                    }

                    v21 = v43 + 1;
                    v14 = v38;
                    v11 = v39;
                    v20 = v40;
                    v13 = v41;
                    v18 = v45;
                    v17 = v46;
                    v19 = v44;
                  }
                  while (v43 + 1 != v42);
                  v32 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
                  v20 = v40;
                  v42 = v32;
                }
                while (v32);
              }

            }
          }
          else
          {
            v33 = v18;
            v34 = CDBiCalendarConversionHandle;
            if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v64 = v16;
              _os_log_impl(&dword_1A5CCB000, v34, OS_LOG_TYPE_DEBUG, "Found an unrecognized property: %@", buf, 0xCu);
            }
            v18 = v33;
            -[NSDictionary setObject:forKey:](v47, "setObject:forKey:", v33, v16);
          }
LABEL_34:

          ++v15;
        }
        while (v15 != v13);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v13);
    }
    unrecognizedProperties = v5->_unrecognizedProperties;
    v5->_unrecognizedProperties = v47;

    v4 = v37;
  }

  return v5;
}

- (CalItemMetadata)init
{
  return -[CalItemMetadata initWithICSComponent:](self, "initWithICSComponent:", 0);
}

- (id)propertyValueForComparison:(id)a3 propertyKey:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "values");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count") == 1)
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    else
      objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5;
  }
  else
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)applyToComponent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  NSDictionary *obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "unrecognizedComponentName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v53 = v6;

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = self->_unrecognizedProperties;
  v43 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v69;
    *(_QWORD *)&v7 = 138543362;
    v40 = v7;
    v45 = v3;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v69 != v42)
        {
          v9 = v8;
          objc_enumerationMutation(obj);
          v8 = v9;
        }
        v44 = v8;
        v10 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v8);
        objc_msgSend(v10, "uppercaseString", v40);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend((id)objc_opt_class(), "isRecognizedProperty:inComponent:", v54, v53) & 1) == 0)
        {
          objc_msgSend(v3, "propertiesForName:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {
            -[NSDictionary objectForKey:](self->_unrecognizedProperties, "objectForKey:", v10);
            v46 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setProperties:forName:");
            goto LABEL_53;
          }
          v12 = CDBiCalendarConversionHandle;
          if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v40;
            v73 = v10;
            _os_log_impl(&dword_1A5CCB000, v12, OS_LOG_TYPE_FAULT, "We have a value for %{public}@, but the item already has properties with that name! _isSavedProp may be out of date.", buf, 0xCu);
          }
        }
        objc_msgSend(v3, "propertiesForName:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v46 = v13;
        v49 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
        if (v49)
        {
          v51 = 0;
          v48 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v49; ++i)
            {
              if (*(_QWORD *)v65 != v48)
                objc_enumerationMutation(v46);
              v15 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
              -[CalItemMetadata propertyValueForComparison:propertyKey:](self, "propertyValueForComparison:propertyKey:", v15, v10);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = 0u;
              v61 = 0u;
              v62 = 0u;
              v63 = 0u;
              -[NSDictionary objectForKeyedSubscript:](self->_unrecognizedProperties, "objectForKeyedSubscript:", v10);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
              if (v17)
              {
                v18 = v17;
                v50 = i;
                v19 = *(_QWORD *)v61;
LABEL_20:
                v20 = 0;
                while (1)
                {
                  if (*(_QWORD *)v61 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v20);
                  v22 = v10;
                  -[CalItemMetadata propertyValueForComparison:propertyKey:](self, "propertyValueForComparison:propertyKey:", v21, v10);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v23, "isEqual:", v52))
                  {
                    if (!objc_msgSend(v51, "containsObject:", v21))
                      break;
                  }

                  ++v20;
                  v10 = v22;
                  if (v18 == v20)
                  {
                    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
                    if (v18)
                      goto LABEL_20;
                    i = v50;
                    goto LABEL_46;
                  }
                }
                v24 = v21;

                if (!v24)
                {
                  v10 = v22;
                  i = v50;
                  goto LABEL_48;
                }
                v25 = v51;
                if (!v51)
                  v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                v51 = v25;
                objc_msgSend(v25, "addObject:", v24);
                objc_msgSend(v15, "allParameters");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v24;
                objc_msgSend(v24, "allParameters");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = 0u;
                v57 = 0u;
                v58 = 0u;
                v59 = 0u;
                v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
                if (v28)
                {
                  v29 = v28;
                  v30 = *(_QWORD *)v57;
                  do
                  {
                    for (j = 0; j != v29; ++j)
                    {
                      if (*(_QWORD *)v57 != v30)
                        objc_enumerationMutation(v27);
                      v32 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
                      objc_msgSend(v26, "objectForKey:", v32);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v33)
                      {

                      }
                      else
                      {
                        v34 = objc_opt_class();
                        objc_msgSend(v32, "uppercaseString");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        LOBYTE(v34) = objc_msgSend((id)v34, "isRecognizedParameter:forProperty:inComponent:", v35, v54, v53);

                        if ((v34 & 1) == 0)
                        {
                          objc_msgSend(v15, "parameterValueForName:", v32);
                          v36 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v36)
                          {
                            v37 = CDBiCalendarConversionHandle;
                            if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_FAULT))
                            {
                              *(_DWORD *)buf = 138543618;
                              v73 = v32;
                              v74 = 2114;
                              v75 = v22;
                              _os_log_impl(&dword_1A5CCB000, v37, OS_LOG_TYPE_FAULT, "We have a value for parameter %{public}@ on %{public}@, but the property already has a parameter with that name! -isRecognizedParameter:forProperty:inComponent: may be out of date.", buf, 0x16u);
                            }
                          }
                          else
                          {
                            objc_msgSend(v27, "objectForKey:", v32);
                            v38 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v15, "setParameterValue:forName:", v38, v32);

                          }
                        }
                      }
                    }
                    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
                  }
                  while (v29);
                }

                v3 = v45;
                v10 = v22;
                i = v50;
                v16 = v47;
              }
LABEL_46:

LABEL_48:
            }
            v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
          }
          while (v49);
        }
        else
        {
          v51 = 0;
        }

LABEL_53:
        v8 = v44 + 1;
      }
      while (v44 + 1 != v43);
      v39 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      v43 = v39;
    }
    while (v39);
  }

}

+ (id)_whitelistedClassesForSecureCoding
{
  if (_whitelistedClassesForSecureCoding_onceToken != -1)
    dispatch_once(&_whitelistedClassesForSecureCoding_onceToken, &__block_literal_global_10);
  return (id)_whitelistedClassesForSecureCoding_whitelistedClasses;
}

void __53__CalItemMetadata__whitelistedClassesForSecureCoding__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_whitelistedClassesForSecureCoding_whitelistedClasses;
  _whitelistedClassesForSecureCoding_whitelistedClasses = v2;

}

- (id)dataRepresentationWithExistingMetaData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_12;
  v5 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend((id)objc_opt_class(), "_whitelistedClassesForSecureCoding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (id)objc_msgSend(v7, "mutableCopy");

      if (v9)
        goto LABEL_13;
      goto LABEL_12;
    }
    v10 = CDBiCalendarConversionHandle;
    if (!os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
    *(_DWORD *)buf = 138412290;
    v23 = v7;
    v11 = "Unknown object in external data for item.  Dropping it.  object is %@";
    goto LABEL_10;
  }
  v10 = CDBiCalendarConversionHandle;
  if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v8;
    v11 = "Failed to unarchive external data for item. Error = %@";
LABEL_10:
    _os_log_impl(&dword_1A5CCB000, v10, OS_LOG_TYPE_DEBUG, v11, buf, 0xCu);
  }
LABEL_11:

LABEL_12:
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
LABEL_13:
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;
  if (v12)
  {
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("iCalExtraProperties"));
  }
  else
  {
    v14 = CDBiCalendarConversionHandle;
    if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      _os_log_impl(&dword_1A5CCB000, v14, OS_LOG_TYPE_ERROR, "Error archiving item metadata: %@", buf, 0xCu);
    }
  }

  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19;
  if (!v15)
  {
    v17 = CDBiCalendarConversionHandle;
    if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_1A5CCB000, v17, OS_LOG_TYPE_ERROR, "Error archiving external representation dictionary: %@", buf, 0xCu);
    }
  }

  return v15;
}

+ (id)metadataWithICSComponent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithICSComponent:", v4);

  return v5;
}

+ (id)metadataWithData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
LABEL_12:
    v9 = 0;
    goto LABEL_15;
  }
  v4 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend((id)objc_opt_class(), "_whitelistedClassesForSecureCoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v5, v3, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;

  if (!v6)
  {
    v12 = CDBiCalendarConversionHandle;
    if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1A5CCB000, v12, OS_LOG_TYPE_DEBUG, "Failed to unarchive external data to fetch item metadata. Error = %@", buf, 0xCu);
    }

    goto LABEL_12;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("iCalExtraProperties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v14 = v7;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    if (!v9)
    {
      v11 = CDBiCalendarConversionHandle;
      if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl(&dword_1A5CCB000, v11, OS_LOG_TYPE_DEBUG, "Failed to unarchive extra properties from external data. Error = %@", buf, 0xCu);
      }
      v9 = 0;
    }
    v7 = v10;
  }
  else
  {
    v9 = 0;
  }

LABEL_15:
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_unrecognizedProperties, CFSTR("CalXProps"));
}

- (CalItemMetadata)initWithCoder:(id)a3
{
  id v4;
  CalItemMetadata *v5;
  uint64_t v6;
  NSDictionary *unrecognizedProperties;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  uint64_t v13;
  NSDictionary *v14;
  void *v15;
  NSDictionary *v16;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CalItemMetadata;
  v5 = -[CalItemMetadata init](&v18, sel_init);
  if (v5)
  {
    if (initWithCoder__onceToken_0 != -1)
      dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_23);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__xPropsClasses, CFSTR("CalXProps"));
    v6 = objc_claimAutoreleasedReturnValue();
    unrecognizedProperties = v5->_unrecognizedProperties;
    v5->_unrecognizedProperties = (NSDictionary *)v6;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CalClassification")))
    {
      v8 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("CalClassification"));
      v9 = objc_alloc(MEMORY[0x1E0DDB848]);
      objc_msgSend(MEMORY[0x1E0DDB7E0], "numberWithLong:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithValue:type:", v10, 5005);

      v12 = v5->_unrecognizedProperties;
      if (v12)
        v13 = -[NSDictionary mutableCopy](v12, "mutableCopy");
      else
        v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      v14 = (NSDictionary *)v13;
      v19[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0DDBA38]);

      v16 = v5->_unrecognizedProperties;
      v5->_unrecognizedProperties = v14;

    }
    if (!v5->_unrecognizedProperties)
    {
      v5->_unrecognizedProperties = (NSDictionary *)MEMORY[0x1E0C9AA70];

    }
  }

  return v5;
}

void __33__CalItemMetadata_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__xPropsClasses;
  initWithCoder__xPropsClasses = v2;

}

- (NSDictionary)unrecognizedProperties
{
  return self->_unrecognizedProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unrecognizedProperties, 0);
}

- (void)dataRepresentationWithExistingMetaData:(void *)a1 .cold.1(void *a1)
{
  id v1;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = objc_begin_catch(a1);
  v2 = CDBiCalendarConversionHandle;
  if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG))
  {
    v3 = 138412290;
    v4 = v1;
    _os_log_impl(&dword_1A5CCB000, v2, OS_LOG_TYPE_DEBUG, "exception %@ while trying to unarchive external data for item", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

@end
