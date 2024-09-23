@implementation MLModelDescription

+ (id)metadataWithFormat:(void *)a3
{
  void *v4;
  uint64_t *v5;
  void *v6;
  uint64_t *v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  char v19;
  const __CFString *v20;
  unsigned __int8 *v22[3];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(uint64_t **)(*(_QWORD *)a3 + 48);
  if (*((char *)v5 + 23) < 0)
    v5 = (uint64_t *)*v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("MLModelDescriptionKey"));

  v7 = *(uint64_t **)(*(_QWORD *)a3 + 56);
  if (*((char *)v7 + 23) < 0)
    v7 = (uint64_t *)*v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("MLModelVersionStringKey"));

  v9 = *(uint64_t **)(*(_QWORD *)a3 + 64);
  if (*((char *)v9 + 23) < 0)
    v9 = (uint64_t *)*v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("MLModelAuthorKey"));

  v11 = *(uint64_t **)(*(_QWORD *)a3 + 72);
  if (*((char *)v11 + 23) < 0)
    v11 = (uint64_t *)*v11;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("MLModelLicenseKey"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1A1AD6ED8]();
  google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::begin(v22, *(_QWORD **)(*(_QWORD *)a3 + 40));
  while (v22[0])
  {
    v15 = (uint64_t *)*((_QWORD *)v22[0] + 3);
    if (*((char *)v15 + 23) < 0)
    {
      if (!v15[1])
        goto LABEL_26;
      v16 = *v15;
    }
    else
    {
      v16 = *((_QWORD *)v22[0] + 3);
      if (!*((_BYTE *)v15 + 23))
        goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v15 + 3;
    if (*((char *)v15 + 47) < 0)
    {
      if (!v15[4])
      {
LABEL_22:
        v19 = 1;
        v20 = &stru_1E3D68DC8;
        goto LABEL_23;
      }
      v18 = (_QWORD *)*v18;
    }
    else if (!*((_BYTE *)v15 + 47))
    {
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18);
    a3 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = (const __CFString *)a3;
LABEL_23:
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, v17);
    if ((v19 & 1) == 0)

LABEL_26:
    google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::InnerMap::iterator_base<google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::KeyValuePair const>::operator++(v22);
  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("MLModelCreatorDefinedKey"));

  return v4;
}

- (BOOL)hasRangeShapeInputs
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MLModelDescription inputDescriptionsByName](self, "inputDescriptionsByName", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v4)
    goto LABEL_15;
  v5 = *(_QWORD *)v14;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v14 != v5)
        objc_enumerationMutation(v3);
      v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      if (objc_msgSend(v7, "type") == 5)
      {
        objc_msgSend(v7, "multiArrayConstraint");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shapeConstraint");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v7, "type") != 4)
          continue;
        objc_msgSend(v7, "imageConstraint");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sizeConstraint");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
      v11 = objc_msgSend(v9, "type");

      if (v11 == 3)
      {
        LOBYTE(v4) = 1;
        goto LABEL_15;
      }
    }
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
      continue;
    break;
  }
LABEL_15:

  return v4;
}

- (NSDictionary)outputDescriptionsByName
{
  return self->_outputDescriptionsByName;
}

- (NSDictionary)inputDescriptionsByName
{
  return self->_inputDescriptionsByName;
}

- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 predictedFeatureName:(id)a5 predictedProbabilitiesName:(id)a6 trainingInputDescriptions:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 metadata:(id)a10
{
  return -[MLModelDescription initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", a3, a4, a5, a6, MEMORY[0x1E0C9AA60], 0, a7, 0, a8, a9, a10, 0, 0, 0, 0,
           0);
}

- (void)setModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelURL, a3);
}

- (void)setIsUpdatable:(BOOL)a3
{
  self->_isUpdatable = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (BOOL)hasEnumeratedShapeInputs
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MLModelDescription inputDescriptionsByName](self, "inputDescriptionsByName", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v4)
    goto LABEL_15;
  v5 = *(_QWORD *)v15;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v15 != v5)
        objc_enumerationMutation(v3);
      v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
      if (objc_msgSend(v7, "type") == 5)
      {
        objc_msgSend(v7, "multiArrayConstraint");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shapeConstraint");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "enumeratedShapes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v7, "type") != 4)
          continue;
        objc_msgSend(v7, "imageConstraint");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sizeConstraint");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "enumeratedImageSizes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;
      v12 = objc_msgSend(v10, "count");

      if (v12 > 1)
      {
        LOBYTE(v4) = 1;
        goto LABEL_15;
      }
    }
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
      continue;
    break;
  }
LABEL_15:

  return v4;
}

- (NSOrderedSet)outputFeatureNames
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 136, 1);
}

- (MLFeatureDescription)predictedValueFeatureDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[MLModelDescription predictedFeatureName](self, "predictedFeatureName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MLModelDescription outputDescriptionsByName](self, "outputDescriptionsByName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (MLFeatureDescription *)v5;
}

- (NSString)predictedFeatureName
{
  return self->_predictedFeatureName;
}

- (NSArray)classLabels
{
  return self->_classLabels;
}

- (NSOrderedSet)inputFeatureNames
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 128, 1);
}

- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 stateDescriptions:(id)a5 predictedFeatureName:(id)a6 predictedProbabilitiesName:(id)a7 functionDescriptions:(id)a8 isUpdatable:(BOOL)a9 trainingInputDescriptions:(id)a10 parameterDescriptions:(id)a11 orderedInputFeatureNames:(id)a12 orderedOutputFeatureNames:(id)a13 orderedStateFeatureNames:(id)a14 metadata:(id)a15 defaultFunctionName:(id)a16 functionName:(id)a17 classLabels:(id)a18 modelURL:(id)a19 modelPath:(id)a20
{
  MLModelDescription *v25;
  MLLayerPath *v26;
  id v27;
  id v28;
  uint64_t v29;
  NSDictionary *v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  NSDictionary *inputDescriptionsByName;
  uint64_t v36;
  NSDictionary *stateDescriptionsByName;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  NSOrderedSet *v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  void *v50;
  NSOrderedSet *inputFeatureNames;
  id v52;
  id v53;
  void *v54;
  NSOrderedSet *v55;
  void *v56;
  void *v57;
  NSOrderedSet *outputFeatureNames;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  NSOrderedSet *stateFeatureNames;
  MLLayerPath *modelPath;
  MLLayerPath *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  objc_super v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v89 = a3;
  v85 = a4;
  v92 = a5;
  v73 = a6;
  v74 = a6;
  v72 = a7;
  v75 = a7;
  v71 = a8;
  v76 = a8;
  v77 = a10;
  v78 = a11;
  v88 = a12;
  v87 = a13;
  v86 = a14;
  v90 = a15;
  v79 = a16;
  v80 = a17;
  v81 = a18;
  v82 = a19;
  v91 = a20;
  v93.receiver = self;
  v93.super_class = (Class)MLModelDescription;
  v25 = -[MLModelDescription init](&v93, sel_init);
  if (!v25)
    goto LABEL_47;
  if (v90)
    v84 = v90;
  else
    v84 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  if (v91)
    v26 = (MLLayerPath *)v91;
  else
    v26 = objc_alloc_init(MLLayerPath);
  v70 = v26;
  v27 = v89;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v28 = v27;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
  if (!v29)
  {

LABEL_22:
    v30 = (NSDictionary *)v28;
    goto LABEL_23;
  }
  v30 = 0;
  v31 = *(_QWORD *)v95;
  do
  {
    for (i = 0; i != v29; ++i)
    {
      if (*(_QWORD *)v95 != v31)
        objc_enumerationMutation(v28);
      v33 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * i);
      objc_msgSend(v28, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "type") == 8)
      {
        if (!v30)
          v30 = (NSDictionary *)objc_msgSend(v28, "mutableCopy");
        -[NSDictionary removeObjectForKey:](v30, "removeObjectForKey:", v33);
      }

    }
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
  }
  while (v29);

  if (!v30)
    goto LABEL_22;
LABEL_23:

  inputDescriptionsByName = v25->_inputDescriptionsByName;
  v25->_inputDescriptionsByName = v30;

  objc_storeStrong((id *)&v25->_outputDescriptionsByName, a4);
  conformedStateDescriptions(v28, v92);
  v36 = objc_claimAutoreleasedReturnValue();
  stateDescriptionsByName = v25->_stateDescriptionsByName;
  v25->_stateDescriptionsByName = (NSDictionary *)v36;

  objc_storeStrong((id *)&v25->_predictedFeatureName, v73);
  objc_storeStrong((id *)&v25->_predictedProbabilitiesName, v72);
  v25->_isUpdatable = a9;
  objc_storeStrong((id *)&v25->_trainingInputDescriptionsByName, a10);
  objc_storeStrong((id *)&v25->_parameterDescriptionsByKey, a11);
  objc_storeStrong((id *)&v25->_metadata, v84);
  v38 = v88;
  v39 = v28;
  v40 = v39;
  if (v38)
  {
    v41 = v38;
  }
  else
  {
    v42 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v39, "allKeys");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "orderedSetWithArray:", v43);
    v41 = (id)objc_claimAutoreleasedReturnValue();

  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v44 = v41;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
  if (v45)
  {
    v46 = 0;
    v47 = *(_QWORD *)v95;
    do
    {
      for (j = 0; j != v45; ++j)
      {
        if (*(_QWORD *)v95 != v47)
          objc_enumerationMutation(v44);
        v49 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * j);
        objc_msgSend(v40, "objectForKeyedSubscript:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v50, "type") == 8)
        {
          if (!v46)
            v46 = (NSOrderedSet *)objc_msgSend(v44, "mutableCopy");
          -[NSOrderedSet removeObject:](v46, "removeObject:", v49);
        }

      }
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
    }
    while (v45);

    if (v46)
      goto LABEL_41;
  }
  else
  {

  }
  v46 = (NSOrderedSet *)v44;
LABEL_41:

  inputFeatureNames = v25->_inputFeatureNames;
  v25->_inputFeatureNames = v46;

  v52 = v87;
  v53 = v85;
  v54 = v53;
  if (v52)
  {
    v55 = (NSOrderedSet *)v52;
  }
  else
  {
    v56 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v53, "allKeys");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "orderedSetWithArray:", v57);
    v55 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();

  }
  outputFeatureNames = v25->_outputFeatureNames;
  v25->_outputFeatureNames = v55;

  v59 = v86;
  v60 = v40;
  v61 = v92;
  v62 = v59;
  v63 = (uint64_t)v62;
  if (!v62)
  {
    conformedStateDescriptions(v60, v61);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v64, "allKeys");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "orderedSetWithArray:", v66);
    v63 = objc_claimAutoreleasedReturnValue();

  }
  stateFeatureNames = v25->_stateFeatureNames;
  v25->_stateFeatureNames = (NSOrderedSet *)v63;

  objc_storeStrong((id *)&v25->_functionDescriptions, v71);
  objc_storeStrong((id *)&v25->_defaultFunctionName, a16);
  objc_storeStrong((id *)&v25->_functionName, a17);
  objc_storeStrong((id *)&v25->_classLabels, a18);
  objc_storeStrong((id *)&v25->_modelURL, a19);
  modelPath = v25->_modelPath;
  v25->_modelPath = v70;

LABEL_47:
  return v25;
}

- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 predictedFeatureName:(id)a5 predictedProbabilitiesName:(id)a6 functionDescriptions:(id)a7 isUpdatable:(BOOL)a8 trainingInputDescriptions:(id)a9 parameterDescriptions:(id)a10 orderedInputFeatureNames:(id)a11 orderedOutputFeatureNames:(id)a12 metadata:(id)a13 defaultFunctionName:(id)a14 functionName:(id)a15 classLabels:(id)a16 modelURL:(id)a17 modelPath:(id)a18
{
  uint64_t v19;

  LOBYTE(v19) = a8;
  return -[MLModelDescription initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", a3, a4, 0, a5, a6, a7, v19, a9, a10, a11, a12, 0, a13, a14, a15,
           a16,
           a17,
           a18);
}

- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 stateDescriptions:(id)a5 predictedFeatureName:(id)a6 predictedProbabilitiesName:(id)a7 functionName:(id)a8
{
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  MLModelDescription *v37;
  uint64_t v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id obj;
  void *v48;
  void *v49;
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
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v45 = a4;
  v44 = a5;
  v41 = a6;
  v42 = a7;
  v43 = a8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v13, "count"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v59 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setObject:forKeyedSubscript:", v17, v18);

        objc_msgSend(v17, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addObject:", v19);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v45, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v45, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v46 = v45;
  v22 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v55 != v23)
          objc_enumerationMutation(v46);
        v25 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        objc_msgSend(v25, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, v26);

        objc_msgSend(v25, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v27);

      }
      v22 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v22);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v44, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v30 = v44;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v51 != v32)
          objc_enumerationMutation(v30);
        v34 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
        objc_msgSend(v34, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v34, v35);

        objc_msgSend(v34, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v36);

      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v31);
  }

  LOBYTE(v39) = 0;
  v37 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", v49, v20, v28, v41, v42, MEMORY[0x1E0C9AA60], v39, 0, 0, v48, v21, v29, 0, 0, v43,
          0,
          0,
          0);

  return v37;
}

- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 predictedFeatureName:(id)a5 predictedProbabilitiesName:(id)a6 trainingInputDescriptions:(id)a7 metadata:(id)a8
{
  return -[MLModelDescription initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", a3, a4, a5, a6, MEMORY[0x1E0C9AA60], 0, a7, 0, 0, 0, a8, 0, 0, 0, 0,
           0);
}

- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 predictedFeatureName:(id)a5 predictedProbabilitiesName:(id)a6 metadata:(id)a7
{
  return -[MLModelDescription initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", a3, a4, a5, a6, MEMORY[0x1E0C9AA60], 0, 0, 0, 0, 0, a7, 0, 0, 0, 0,
           0);
}

- (id)initFromSingleFunctionCompiledModelArchive:(_MLModelInputArchiver *)a3 error:(id *)a4
{
  id v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  CoreML::Specification::ModelDescription *v12;
  std::__shared_weak_count *v13;

  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification16ModelDescriptionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v12);
  if (+[MLModelIOUtils deserializeInterfaceFormat:archive:error:](MLModelIOUtils, "deserializeInterfaceFormat:archive:error:", &v12, a3, a4))
  {
    v7 = -[MLModelDescription initFromSingleFunctionModelDescriptionSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelDescriptionSpecification:", &v12);
  }
  else
  {
    v7 = 0;
  }
  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  return v7;
}

- (id)initFromModelDescriptionSpecification:(void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  void *v11;
  const CoreML::Specification::Metadata *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  MLModelDescription *v26;
  void *v27;
  void *v28;
  _BYTE v29[8];
  std::__shared_weak_count *v30;

  +[MLModelIOUtils inputDescriptionFromInterface:](MLModelIOUtils, "inputDescriptionFromInterface:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLModelIOUtils outputDescriptionFromInterface:](MLModelIOUtils, "outputDescriptionFromInterface:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLModelIOUtils stateDescriptionFromInterface:](MLModelIOUtils, "stateDescriptionFromInterface:", a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLModelIOUtils orderedInputFeatureNamesFromInterface:](MLModelIOUtils, "orderedInputFeatureNamesFromInterface:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLModelIOUtils orderedOutputFeatureNamesFromInterface:](MLModelIOUtils, "orderedOutputFeatureNamesFromInterface:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLModelIOUtils orderedStateFeatureNamesFromInterface:](MLModelIOUtils, "orderedStateFeatureNamesFromInterface:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLModelIOUtils trainingInputDescriptionFromInterface:](MLModelIOUtils, "trainingInputDescriptionFromInterface:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(uint64_t **)(*(_QWORD *)a3 + 136);
  if (*((char *)v9 + 23) < 0)
    v9 = (uint64_t *)*v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(uint64_t **)(*(_QWORD *)a3 + 144);
  if (*((char *)v10 + 23) < 0)
    v10 = (uint64_t *)*v10;
  v11 = v28;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v28, "length"))
  {

    v11 = 0;
  }
  if (!objc_msgSend(v27, "length"))
  {

    v27 = 0;
  }
  if (*(uint64_t **)a3 == &CoreML::Specification::_ModelDescription_default_instance_
    || (v12 = *(const CoreML::Specification::Metadata **)(*(_QWORD *)a3 + 160)) == 0)
  {
    v22 = 0;
  }
  else
  {
    _MLModelMetadataSpecification::_MLModelMetadataSpecification((_MLModelMetadataSpecification *)v29, v12);
    objc_msgSend((id)objc_opt_class(), "metadataWithFormat:", v29);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v30;
    if (v30)
    {
      p_shared_owners = (unint64_t *)&v30->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        v17 = v13;
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
        v13 = v17;
      }
    }
    v22 = (void *)v13;
  }
  +[MLModelIOUtils functionDescriptionsFromDescriptionSpecification:](MLModelIOUtils, "functionDescriptionsFromDescriptionSpecification:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLModelIOUtils defaultFunctionNameFromDescriptionSpecification:](MLModelIOUtils, "defaultFunctionNameFromDescriptionSpecification:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = 0;
  v26 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", v4, v24, v23, v11, v27, v18, v21, v8, 0, v5, v6, v7, v22, v19, 0,
          0,
          0,
          0);

  return v26;
}

- (id)initFromSingleFunctionModelSpecification:(void *)a3
{
  const CoreML::Specification::ModelDescription *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint8_t v13[16];
  char v14[8];
  std::__shared_weak_count *v15;

  if (*(_QWORD *)(*(_QWORD *)a3 + 16))
    v4 = *(const CoreML::Specification::ModelDescription **)(*(_QWORD *)a3 + 16);
  else
    v4 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
  _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)v14, v4);
  v5 = -[MLModelDescription initFromModelDescriptionSpecification:](self, "initFromModelDescriptionSpecification:", v14);
  objc_msgSend(v5, "functionDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
    }

  }
  v9 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  return v5;
}

- (id)initFromSingleFunctionModelDescriptionSpecification:(void *)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = -[MLModelDescription initFromModelDescriptionSpecification:](self, "initFromModelDescriptionSpecification:", a3);
  objc_msgSend(v3, "functionDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
    }

  }

  return v3;
}

- (id)modelDescriptionBySettingMetadata:(id)a3
{
  MLModelDescription *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  MLModelDescription *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v4 = [MLModelDescription alloc];
  -[MLModelDescription inputDescriptionsByName](self, "inputDescriptionsByName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription outputDescriptionsByName](self, "outputDescriptionsByName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription stateDescriptionsByName](self, "stateDescriptionsByName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription predictedFeatureName](self, "predictedFeatureName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription functionDescriptions](self, "functionDescriptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MLModelDescription isUpdatable](self, "isUpdatable");
  -[MLModelDescription trainingInputDescriptionsByName](self, "trainingInputDescriptionsByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription parameterDescriptionsByKey](self, "parameterDescriptionsByKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription inputFeatureNames](self, "inputFeatureNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription outputFeatureNames](self, "outputFeatureNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription stateFeatureNames](self, "stateFeatureNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription defaultFunctionName](self, "defaultFunctionName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription functionName](self, "functionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription classLabels](self, "classLabels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription modelURL](self, "modelURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelDescription modelPath](self, "modelPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = v16;
  v12 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](v4, "initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", v24, v23, v21, v20, v19, v18, v11, v5, v22, v6, v7, v17, v25, v15, v8,
          v14,
          v13,
          v9);

  return v12;
}

- (id)functionDescriptions
{
  return self->_functionDescriptions;
}

- (id)defaultFunctionName
{
  return self->_defaultFunctionName;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (id)description
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v67;
  id v68;
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
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  -[MLModelDescription inputDescriptionsByName](self, "inputDescriptionsByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v86;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v86 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v9);
        -[MLModelDescription inputDescriptionsByName](self, "inputDescriptionsByName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
    }
    while (v7);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  -[MLModelDescription outputDescriptionsByName](self, "outputDescriptionsByName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v82;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v82 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v16);
        -[MLModelDescription outputDescriptionsByName](self, "outputDescriptionsByName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addObject:", v19);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
    }
    while (v14);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  -[MLModelDescription stateDescriptionsByName](self, "stateDescriptionsByName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v78;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v78 != v22)
          objc_enumerationMutation(v20);
        v24 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v23);
        -[MLModelDescription stateDescriptionsByName](self, "stateDescriptionsByName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v26);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
    }
    while (v21);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[MLModelDescription trainingInputDescriptionsByName](self, "trainingInputDescriptionsByName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v74;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v74 != v29)
          objc_enumerationMutation(v27);
        v31 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v30);
        -[MLModelDescription trainingInputDescriptionsByName](self, "trainingInputDescriptionsByName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v33);

        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
    }
    while (v28);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[MLModelDescription parameterDescriptionsByKey](self, "parameterDescriptionsByKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v70;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v70 != v36)
          objc_enumerationMutation(v34);
        v38 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v37);
        -[MLModelDescription parameterDescriptionsByKey](self, "parameterDescriptionsByKey");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v40);

        ++v37;
      }
      while (v35 != v37);
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
    }
    while (v35);
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x1E0CB3940];
  -[MLModelDescription functionName](self, "functionName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "stringWithFormat:", CFSTR("\nfunctionName: %@"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendString:", v44);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\ninputs: %@"), v68);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendString:", v45);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\noutputs: %@"), v67);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendString:", v46);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nstates: %@"), v3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendString:", v47);

  v48 = (void *)MEMORY[0x1E0CB3940];
  -[MLModelDescription predictedFeatureName](self, "predictedFeatureName");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "stringWithFormat:", CFSTR("\npredictedFeatureName: %@"), v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendString:", v50);

  v51 = (void *)MEMORY[0x1E0CB3940];
  -[MLModelDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "stringWithFormat:", CFSTR("\npredictedProbabilitiesName: %@"), v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendString:", v53);

  v54 = (void *)MEMORY[0x1E0CB3940];
  -[MLModelDescription classLabels](self, "classLabels");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "stringWithFormat:", CFSTR("\nclassLabels: %@"), v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendString:", v56);

  v57 = (void *)MEMORY[0x1E0CB3940];
  v58 = -[MLModelDescription isUpdatable](self, "isUpdatable");
  v59 = CFSTR("NO");
  if (v58)
    v59 = CFSTR("YES");
  objc_msgSend(v57, "stringWithFormat:", CFSTR("\nupdatable: %@"), v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendString:", v60);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\ntrainingInputs: %@"), v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendString:", v61);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nparameters: %@"), v5);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendString:", v62);

  v63 = (void *)MEMORY[0x1E0CB3940];
  -[MLModelDescription metadata](self, "metadata");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "stringWithFormat:", CFSTR("\nmetadata: %@"), v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendString:", v65);

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  MLModelDescription *v4;
  MLModelDescription *v5;
  BOOL v6;

  v4 = (MLModelDescription *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MLModelDescription isEqualToDescription:](self, "isEqualToDescription:", v5);

  return v6;
}

- (BOOL)isEqualToDescription:(id)a3
{
  MLModelDescription *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (MLModelDescription *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    -[MLModelDescription description](self, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLModelDescription description](v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  return v7;
}

- (BOOL)verifyInput:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[MLModelDescription inputDescriptionsByName](self, "inputDescriptionsByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v4, CFSTR("inputDescriptionsByName"));

  -[MLModelDescription outputDescriptionsByName](self, "outputDescriptionsByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v5, CFSTR("outputDescriptionsByName"));

  -[MLModelDescription stateDescriptionsByName](self, "stateDescriptionsByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("stateDescriptionsByName"));

  -[MLModelDescription predictedFeatureName](self, "predictedFeatureName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("predictedFeatureName"));

  -[MLModelDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("predictedProbabilitiesName"));

  -[MLModelDescription trainingInputDescriptionsByName](self, "trainingInputDescriptionsByName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("trainingInputDescriptionsByName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MLModelDescription isUpdatable](self, "isUpdatable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("isUpdatable"));

  -[MLModelDescription parameterDescriptionsByKey](self, "parameterDescriptionsByKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v11, CFSTR("parameterDescriptionsByKey"));

  -[MLModelDescription modelURL](self, "modelURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("modelURL"));

  -[MLModelDescription metadata](self, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v13, CFSTR("metadata"));

  -[MLModelDescription classLabels](self, "classLabels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("classLabels"));

}

- (MLModelDescription)initWithCoder:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  MLModelDescription *v27;
  uint64_t v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[3];
  _QWORD v47[17];

  v47[15] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v47[0] = objc_opt_class();
  v47[1] = objc_opt_class();
  v47[2] = objc_opt_class();
  v47[3] = objc_opt_class();
  v47[4] = objc_opt_class();
  v47[5] = objc_opt_class();
  v47[6] = objc_opt_class();
  v47[7] = objc_opt_class();
  v47[8] = objc_opt_class();
  v47[9] = objc_opt_class();
  v47[10] = objc_opt_class();
  v47[11] = objc_opt_class();
  v47[12] = objc_opt_class();
  v47[13] = objc_opt_class();
  v47[14] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  objc_msgSend(v3, "allowedClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v6);

  v45 = 0;
  objc_msgSend(v3, "decodeTopLevelObjectOfClasses:forKey:error:", v4, CFSTR("inputDescriptionsByName"), &v45);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v45;
  v44 = v7;
  objc_msgSend(v3, "decodeTopLevelObjectOfClasses:forKey:error:", v4, CFSTR("outputDescriptionsByName"), &v44);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v44;

  v43 = v8;
  objc_msgSend(v3, "decodeTopLevelObjectOfClasses:forKey:error:", v4, CFSTR("stateDescriptionsByName"), &v43);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v43;

  v42 = v9;
  objc_msgSend(v3, "decodeTopLevelObjectOfClasses:forKey:error:", v4, CFSTR("predictedFeatureName"), &v42);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v42;

  v41 = v10;
  objc_msgSend(v3, "decodeTopLevelObjectOfClasses:forKey:error:", v4, CFSTR("predictedProbabilitiesName"), &v41);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v41;

  v40 = v11;
  objc_msgSend(v3, "decodeTopLevelObjectOfClasses:forKey:error:", v4, CFSTR("trainingInputDescriptionsByName"), &v40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v40;

  v39 = v13;
  objc_msgSend(v3, "decodeTopLevelObjectOfClasses:forKey:error:", v4, CFSTR("metadata"), &v39);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v39;

  v16 = (void *)MEMORY[0x1E0C99E60];
  v46[0] = objc_opt_class();
  v46[1] = objc_opt_class();
  v46[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeTopLevelObjectOfClasses:forKey:error:", v18, CFSTR("classLabels"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v15;
  objc_msgSend(v3, "decodeTopLevelObjectOfClasses:forKey:error:", v4, CFSTR("isUpdatable"), &v38);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v38;

  v22 = objc_msgSend(v20, "BOOLValue");
  v37 = v21;
  objc_msgSend(v3, "decodeTopLevelObjectOfClasses:forKey:error:", v4, CFSTR("parameterDescriptionsByKey"), &v37);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v37;

  v36 = v24;
  objc_msgSend(v3, "decodeTopLevelObjectOfClasses:forKey:error:", v4, CFSTR("modelURL"), &v36);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v36;

  LOBYTE(v29) = v22;
  v27 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", v35, v34, v33, v32, v31, MEMORY[0x1E0C9AA60], v29, v12, v23, 0, 0, 0, v14, 0, 0,
          v19,
          v25,
          0);

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MLModelDescription *v5;
  uint64_t v6;
  _BOOL4 isUpdatable;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  MLModelDescription *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v5 = +[MLModelDescription allocWithZone:](MLModelDescription, "allocWithZone:");
  v28 = (void *)-[NSDictionary copyWithZone:](self->_inputDescriptionsByName, "copyWithZone:", a3);
  v27 = (void *)-[NSDictionary copyWithZone:](self->_outputDescriptionsByName, "copyWithZone:", a3);
  v25 = (void *)-[NSDictionary copyWithZone:](self->_stateDescriptionsByName, "copyWithZone:", a3);
  v24 = (void *)-[NSString copyWithZone:](self->_predictedFeatureName, "copyWithZone:", a3);
  v23 = (void *)-[NSString copyWithZone:](self->_predictedProbabilitiesName, "copyWithZone:", a3);
  v6 = -[NSArray copyWithZone:](self->_functionDescriptions, "copyWithZone:", a3);
  isUpdatable = self->_isUpdatable;
  v22 = (void *)v6;
  v8 = (void *)-[NSDictionary copyWithZone:](self->_trainingInputDescriptionsByName, "copyWithZone:", a3);
  v9 = -[NSDictionary copyWithZone:](self->_parameterDescriptionsByKey, "copyWithZone:", a3);
  v10 = (void *)-[NSOrderedSet copyWithZone:](self->_inputFeatureNames, "copyWithZone:", a3);
  v11 = (void *)-[NSOrderedSet copyWithZone:](self->_outputFeatureNames, "copyWithZone:", a3);
  v12 = (void *)-[NSOrderedSet copyWithZone:](self->_stateFeatureNames, "copyWithZone:", a3);
  v21 = (void *)-[NSDictionary copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v20 = (void *)-[NSString copyWithZone:](self->_defaultFunctionName, "copyWithZone:", a3);
  v19 = (void *)-[NSString copyWithZone:](self->_functionName, "copyWithZone:", a3);
  v26 = (void *)v9;
  v18 = (void *)-[NSArray copyWithZone:](self->_classLabels, "copyWithZone:", a3);
  v13 = (void *)-[NSURL copyWithZone:](self->_modelURL, "copyWithZone:", a3);
  v14 = -[MLLayerPath copyWithZone:](self->_modelPath, "copyWithZone:", a3);
  LOBYTE(v16) = isUpdatable;
  v17 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](v5, "initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", v28, v27, v25, v24, v23, v22, v16, v8, v26, v10, v11, v12, v21, v20, v19,
          v18,
          v13,
          v14);

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;
  void *v16;
  void *v17;

  -[MLModelDescription inputDescriptionsByName](self, "inputDescriptionsByName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v17, "hash");
  -[MLModelDescription outputDescriptionsByName](self, "outputDescriptionsByName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v16, "hash");
  -[MLModelDescription predictedFeatureName](self, "predictedFeatureName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[MLModelDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[MLModelDescription trainingInputDescriptionsByName](self, "trainingInputDescriptionsByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[MLModelDescription metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[MLModelDescription modelPath](self, "modelPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v3 ^ v15 ^ v5 ^ v7 ^ v9 ^ v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (MLFeatureDescription)predictedClassFeatureDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[MLModelDescription predictedFeatureName](self, "predictedFeatureName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MLModelDescription outputDescriptionsByName](self, "outputDescriptionsByName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (MLFeatureDescription *)v5;
}

- (MLFeatureDescription)classProbabilityFeatureDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[MLModelDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MLModelDescription outputDescriptionsByName](self, "outputDescriptionsByName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (MLFeatureDescription *)v5;
}

- (BOOL)validateAsClassifierDescriptionAndReturnError:(id *)a3
{
  void *v5;
  BOOL v6;
  void *v7;

  -[MLModelDescription predictedFeatureName](self, "predictedFeatureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

    return 1;
  }
  else
  {
    -[MLModelDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

    if (a3 && !v7)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Classifier must specify predictedFeatureName and/or predictedProbabilitiesName"));
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6;
}

- (BOOL)validateAsRegressorDescriptionAndReturnError:(id *)a3
{
  void *v4;

  -[MLModelDescription predictedFeatureName](self, "predictedFeatureName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && !v4)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Regressor must specify predictedFeatureName."));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4 != 0;
}

- (NSDictionary)stateDescriptionsByName
{
  return self->_stateDescriptionsByName;
}

- (NSString)predictedProbabilitiesName
{
  return self->_predictedProbabilitiesName;
}

- (void)setClassLabels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isUpdatable
{
  return self->_isUpdatable;
}

- (NSDictionary)trainingInputDescriptionsByName
{
  return self->_trainingInputDescriptionsByName;
}

- (void)setTrainingInputDescriptionsByName:(id)a3
{
  objc_storeStrong((id *)&self->_trainingInputDescriptionsByName, a3);
}

- (NSDictionary)parameterDescriptionsByKey
{
  return self->_parameterDescriptionsByKey;
}

- (void)setParameterDescriptionsByKey:(id)a3
{
  objc_storeStrong((id *)&self->_parameterDescriptionsByKey, a3);
}

- (MLLayerPath)modelPath
{
  return self->_modelPath;
}

- (void)setModelPath:(id)a3
{
  objc_storeStrong((id *)&self->_modelPath, a3);
}

- (NSOrderedSet)stateFeatureNames
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 144, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateFeatureNames, 0);
  objc_storeStrong((id *)&self->_outputFeatureNames, 0);
  objc_storeStrong((id *)&self->_inputFeatureNames, 0);
  objc_storeStrong((id *)&self->_modelPath, 0);
  objc_storeStrong((id *)&self->_parameterDescriptionsByKey, 0);
  objc_storeStrong((id *)&self->_trainingInputDescriptionsByName, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_classLabels, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_predictedProbabilitiesName, 0);
  objc_storeStrong((id *)&self->_predictedFeatureName, 0);
  objc_storeStrong((id *)&self->_stateDescriptionsByName, 0);
  objc_storeStrong((id *)&self->_outputDescriptionsByName, 0);
  objc_storeStrong((id *)&self->_inputDescriptionsByName, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_defaultFunctionName, 0);
  objc_storeStrong((id *)&self->_functionDescriptions, 0);
}

+ (id)metadataWithSpecification:(void *)a3
{
  uint64_t *v3;
  const CoreML::Specification::Metadata *v4;
  const CoreML::Specification::Metadata *v5;
  void *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v3 = *(uint64_t **)(*(_QWORD *)a3 + 16);
  if (!v3)
    v3 = &CoreML::Specification::_ModelDescription_default_instance_;
  v4 = (const CoreML::Specification::Metadata *)v3[20];
  if (v4)
    v5 = v4;
  else
    v5 = (const CoreML::Specification::Metadata *)&CoreML::Specification::_Metadata_default_instance_;
  _MLModelMetadataSpecification::_MLModelMetadataSpecification((_MLModelMetadataSpecification *)&v11, v5);
  +[MLModelDescription metadataWithFormat:](MLModelDescription, "metadataWithFormat:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initFromRawCompiledModelArchive:(_MLModelInputArchiver *)a3 error:(id *)a4
{
  MLModelDescription *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  CoreML::Specification::ModelDescription *v12;
  std::__shared_weak_count *v13;

  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification16ModelDescriptionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v12);
  if (+[MLModelIOUtils deserializeInterfaceFormat:archive:error:](MLModelIOUtils, "deserializeInterfaceFormat:archive:error:", &v12, a3, a4))
  {
    self = (MLModelDescription *)-[MLModelDescription initFromRawModelDescriptionSpecification:](self, "initFromRawModelDescriptionSpecification:", &v12);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  return v7;
}

- (id)initFromRawModelSpecification:(void *)a3
{
  const CoreML::Specification::ModelDescription *v4;
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;

  if (*(_QWORD *)(*(_QWORD *)a3 + 16))
    v4 = *(const CoreML::Specification::ModelDescription **)(*(_QWORD *)a3 + 16);
  else
    v4 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
  _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)&v10, v4);
  v5 = -[MLModelDescription initFromModelDescriptionSpecification:](self, "initFromModelDescriptionSpecification:", &v10);
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  return v5;
}

@end
