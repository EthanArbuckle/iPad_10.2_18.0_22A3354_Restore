@implementation MLFeatureProviderConformer

- (id)conformFeatures:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  uint64_t v28;
  MLDictionaryFeatureProvider *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  void *v45;
  MLDictionaryFeatureProvider *v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v50;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  _BOOL4 v64;
  MLFeatureProviderConformer *v66;
  id obj;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  id v86;
  id v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;
  void *v92;
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  id v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v64 = -[MLFeatureProviderConformer usingRank5Mapping](self, "usingRank5Mapping");
  -[MLFeatureProviderConformer featureDescriptions](self, "featureDescriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v5, "count");

  objc_msgSend(v72, "featureNames");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  -[MLFeatureProviderConformer featureDescriptions](self, "featureDescriptions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
  v66 = self;
  if (!v6)
  {
    v70 = 0;
    v7 = 0;
    goto LABEL_36;
  }
  v70 = 0;
  v7 = 0;
  v68 = v6;
  v69 = *(_QWORD *)v82;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v82 != v69)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v8);
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v71, "containsObject:", v10))
      {
        objc_msgSend(v72, "featureValueForName:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      v12 = v9;
      v13 = v11;
      if (!objc_msgSend(v13, "type"))
      {

        goto LABEL_14;
      }
      if (objc_msgSend(v12, "type") != 5)
      {

LABEL_19:
        v18 = v12;
        v19 = v13;
        objc_msgSend(v18, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "type") == 5)
        {
          objc_msgSend(v18, "multiArrayConstraint");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 0;
          v22 = objc_msgSend(v21, "isAllowedValue:isNeuralNetworkInputOrOutput:usingRank5Mapping:featureName:error:", v19, 1, v64, v20, &v87);
          v23 = v87;

          if ((v22 & 1) == 0)
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v23, "localizedDescription");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v94 = v20;
              v95 = 2112;
              v96 = v19;
              v97 = 2112;
              v98 = v59;
              _os_log_error_impl(&dword_19C486000, v48, OS_LOG_TYPE_ERROR, "multiArrayConstraint isAllowedValue: fails for MLFeatureTypeMultiArray feature %@ with featureValue %@. Error description: %@", buf, 0x20u);

            }
            if (a4)
              goto LABEL_80;
LABEL_81:

            goto LABEL_82;
          }
LABEL_28:

LABEL_29:
          ++v70;
          goto LABEL_30;
        }
        if (objc_msgSend(v18, "type") == 8)
        {
          objc_msgSend(v18, "stateConstraint");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = 0;
          v25 = objc_msgSend(v24, "isAllowedValue:error:", v19, &v86);
          v23 = v86;

          if ((v25 & 1) != 0)
            goto LABEL_28;
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v23, "localizedDescription");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v94 = v20;
            v95 = 2112;
            v96 = v19;
            v97 = 2112;
            v98 = v60;
            _os_log_error_impl(&dword_19C486000, v50, OS_LOG_TYPE_ERROR, "stateConstraint 'isAllowedValue:' fails for MLFeatureTypeState feature '%@' with featureValue %@. Error description: %@", buf, 0x20u);

          }
          if (!a4)
            goto LABEL_81;
        }
        else
        {
          if (objc_msgSend(v18, "type") != 4)
          {

            goto LABEL_29;
          }
          if (objc_msgSend(v19, "type") != 4)
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(v18, "type"));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v94 = v20;
              v95 = 2112;
              v96 = v19;
              v97 = 2112;
              v98 = v61;
              _os_log_error_impl(&dword_19C486000, v52, OS_LOG_TYPE_ERROR, "The model expects input feature %@ to be an image, but the input (%@) is of type %@.", buf, 0x20u);

            }
            if (!a4)
            {

              goto LABEL_82;
            }
            v53 = (void *)MEMORY[0x1E0CB35C8];
            v91 = *MEMORY[0x1E0CB2D50];
            v54 = (void *)MEMORY[0x1E0CB3940];
            +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(v18, "type"));
            v23 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "stringWithFormat:", CFSTR("The model expects input feature %@ to be an image, but the input (%@) is of type %@."), v20, v19, v23);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = v55;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v56);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_81;
          }
          objc_msgSend(v18, "imageConstraint");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = 0;
          v27 = objc_msgSend(v26, "isAllowedValue:error:", v19, &v85);
          v23 = v85;

          if ((v27 & 1) != 0)
            goto LABEL_28;
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v23, "localizedDescription");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v94 = v20;
            v95 = 2112;
            v96 = v19;
            v97 = 2112;
            v98 = v62;
            _os_log_error_impl(&dword_19C486000, v57, OS_LOG_TYPE_ERROR, "multiArrayConstraint isAllowedValue: fails for MLFeatureTypeImage feature %@ with featureValue %@. Error description: %@", buf, 0x20u);

          }
          if (!a4)
            goto LABEL_81;
        }
LABEL_80:
        v23 = objc_retainAutorelease(v23);
        *a4 = v23;
        goto LABEL_81;
      }
      objc_msgSend(v13, "multiArrayValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shape");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count") == 0;

      if (!v16)
        goto LABEL_19;
LABEL_14:
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[MLFeatureProviderConformer _fabricateFeatureForDescription:error:](v66, "_fabricateFeatureForDescription:error:", v12, a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v19 = v13;
LABEL_82:

        v29 = 0;
        goto LABEL_83;
      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v10);

LABEL_30:
      ++v8;
    }
    while (v68 != v8);
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
    v68 = v28;
  }
  while (v28);
LABEL_36:

  if (v70 != v63 || v63 != objc_msgSend(v71, "count"))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v70);
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    -[MLFeatureProviderConformer featureDescriptions](v66, "featureDescriptions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v78 != v33)
            objc_enumerationMutation(v31);
          v35 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v35, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37 == 0;

          if (v38)
          {
            objc_msgSend(v35, "name");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v39);

          }
        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      }
      while (v32);
    }

    if (-[MLFeatureProviderConformer passthroughStateFeatures](v66, "passthroughStateFeatures"))
    {
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      objc_msgSend(v72, "featureNames");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v74;
        do
        {
          for (j = 0; j != v41; ++j)
          {
            if (*(_QWORD *)v74 != v42)
              objc_enumerationMutation(v40);
            v44 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j);
            objc_msgSend(v72, "featureValueForName:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v45, "type") == 8)
              objc_msgSend(v30, "addObject:", v44);

          }
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
        }
        while (v41);
      }

    }
    +[MLFeatureProviderUtils providerWithSubsetOfFeaturesNamed:providedBy:](MLFeatureProviderUtils, "providerWithSubsetOfFeaturesNamed:providedBy:", v30, v72);
    v46 = (MLDictionaryFeatureProvider *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v29 = -[MLDictionaryFeatureProvider initWithFeatureValueDictionary:]([MLDictionaryFeatureProvider alloc], "initWithFeatureValueDictionary:", v7);
      if (!v29)
      {
LABEL_64:

        goto LABEL_83;
      }
      +[MLFeatureProviderUtils lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:](MLFeatureProviderUtils, "lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:", v29, v46);
      v47 = objc_claimAutoreleasedReturnValue();

      v46 = (MLDictionaryFeatureProvider *)v47;
    }
    v46 = v46;
    v29 = v46;
    goto LABEL_64;
  }
  v29 = (MLDictionaryFeatureProvider *)v72;
LABEL_83:

  return v29;
}

- (NSArray)featureDescriptions
{
  return self->_featureDescriptions;
}

- (BOOL)usingRank5Mapping
{
  return self->_usingRank5Mapping;
}

- (MLFeatureProviderConformer)initWithFeatureDescriptions:(id)a3 defaultValues:(id)a4 usingRank5Mapping:(BOOL)a5 optionalInputTypes:(id)a6 passthroughStateFeatures:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  MLFeatureProviderConformer *v15;
  uint64_t v16;
  NSArray *featureDescriptions;
  uint64_t v18;
  NSDictionary *defaultValues;
  uint64_t v20;
  NSDictionary *optionalInputTypes;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MLFeatureProviderConformer;
  v15 = -[MLFeatureProviderConformer init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    featureDescriptions = v15->_featureDescriptions;
    v15->_featureDescriptions = (NSArray *)v16;

    v18 = objc_msgSend(v13, "copy");
    defaultValues = v15->_defaultValues;
    v15->_defaultValues = (NSDictionary *)v18;

    v15->_usingRank5Mapping = a5;
    v20 = objc_msgSend(v14, "copy");
    optionalInputTypes = v15->_optionalInputTypes;
    v15->_optionalInputTypes = (NSDictionary *)v20;

    v15->_passthroughStateFeatures = a7;
  }

  return v15;
}

- (id)_fabricateFeatureForDescription:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  MLMultiArray *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  uint64_t v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;
  _QWORD v50[4];

  v50[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isOptional") & 1) != 0)
  {
    if (objc_msgSend(v6, "type") == 5)
    {
      v8 = -[MLFeatureProviderConformer _sequenceConcatConsumesOptionalInputNamed:](self, "_sequenceConcatConsumesOptionalInputNamed:", v7);
      -[MLFeatureProviderConformer defaultValues](self, "defaultValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "multiArrayConstraint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shape");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if (objc_msgSend(v12, "count") == 1)
        {
          if (-[MLFeatureProviderConformer usingRank5Mapping](self, "usingRank5Mapping"))
          {
            v42[0] = &unk_1E3DA1EA0;
            v42[1] = &unk_1E3DA1EB8;
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v42[2] = v13;
            v42[3] = &unk_1E3DA1EB8;
            v42[4] = &unk_1E3DA1EB8;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 5);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v41[0] = &unk_1E3DA1EA0;
            v41[1] = &unk_1E3DA1EB8;
            v41[2] = &unk_1E3DA1EB8;
            v41[3] = &unk_1E3DA1EB8;
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v41[4] = v29;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        else if (objc_msgSend(v12, "count") == 2)
        {
          v40[0] = &unk_1E3DA1EA0;
          v40[1] = &unk_1E3DA1EB8;
          v40[2] = &unk_1E3DA1EB8;
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v40[3] = v27;
          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v40[4] = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else if (objc_msgSend(v12, "count") == 3)
        {
          v39[0] = &unk_1E3DA1EA0;
          v39[1] = &unk_1E3DA1EB8;
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v39[2] = v30;
          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v39[3] = v31;
          objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v39[4] = v32;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else if (objc_msgSend(v12, "count") == 4)
        {
          v38[0] = &unk_1E3DA1EA0;
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v38[1] = v33;
          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v38[2] = v34;
          objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v38[3] = v35;
          objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v38[4] = v36;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:atIndexedSubscript:", &unk_1E3DA1EA0, 0);

        }
      }
      else
      {
        v14 = v12;
      }
      objc_msgSend(v6, "multiArrayConstraint");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "dataType");

      v25 = -[MLMultiArray initWithShape:dataType:error:]([MLMultiArray alloc], "initWithShape:dataType:error:", v14, v24, a4);
      v17 = v25;
      if (v25)
      {
        if (!v10)
          v10 = &unk_1E3DA1EA0;
        -[MLMultiArray fillWithNumber:](v25, "fillWithNumber:", v10);
        +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }

      goto LABEL_23;
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(v6, "type"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v46 = v7;
      v47 = 2112;
      v48 = v37;
      _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "Feature %@ is required but not specified. The feature is %@. An optional feature is allowed only for MultiArray.", buf, 0x16u);

    }
    if (a4)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v43 = *MEMORY[0x1E0CB2D50];
      v21 = (void *)MEMORY[0x1E0CB3940];
      +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(v6, "type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Feature %@ is required but not specified. The feature is %@. An optional feature is allowed only for MultiArray."), v7, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v18 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v7;
      _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "Feature %@ is required but not specified.", buf, 0xCu);
    }

    if (a4)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Feature %@ is required but not specified."), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v17);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_24;
    }
  }
  v18 = 0;
LABEL_24:

  return v18;
}

- (BOOL)_sequenceConcatConsumesOptionalInputNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[MLFeatureProviderConformer optionalInputTypes](self, "optionalInputTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", &unk_1E3DA1EB8);

  return v7;
}

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

- (NSDictionary)optionalInputTypes
{
  return self->_optionalInputTypes;
}

- (BOOL)passthroughStateFeatures
{
  return self->_passthroughStateFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalInputTypes, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_featureDescriptions, 0);
}

@end
