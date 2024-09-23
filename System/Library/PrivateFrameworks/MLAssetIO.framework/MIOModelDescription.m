@implementation MIOModelDescription

- (MIOModelDescription)initWithSpecification:(const void *)a3 isUpdatable:(BOOL)a4 modelParameters:(id)a5 classLabelsPerFunction:(id)a6 error:(id *)a7
{
  MIOModelDescription *v11;
  MIOModelDescription *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *classLabelsPerFunction;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  unsigned __int8 *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int8 *v37;
  void *v38;
  void *v39;
  void *v40;
  MIOModelDescription *v41;
  void *v42;
  void *v43;
  BOOL v44;
  uint64_t v45;
  NSArray *classLabels;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  uint64_t v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v49 = a5;
  v50 = a6;
  v55.receiver = self;
  v55.super_class = (Class)MIOModelDescription;
  v11 = -[MIOModelDescription init](&v55, sel_init);
  v12 = v11;
  if (!v11)
  {
LABEL_47:
    v41 = v12;
    goto LABEL_48;
  }
  if (*((_DWORD *)a3 + 24))
  {
    if (objc_msgSend(v50, "count") != *((_DWORD *)a3 + 24))
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = objc_msgSend(v50, "count");
    }
  }
  else if (objc_msgSend(v50, "count") != 1)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = objc_msgSend(v50, "count");
  }
  CoreML::Specification::ModelDescription::CopyFrom((CoreML::Specification::ModelDescription *)&v11->_modelDescriptionParams, (const CoreML::Specification::ModelDescription *)a3);
  v11->_updatable = a4;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v18 = v49;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v52 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v22, "key");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, v23);

      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v19);
  }

  objc_storeStrong((id *)&v11->_parameterDescriptionsByKey, v17);
  v24 = objc_msgSend(v50, "copy");
  classLabelsPerFunction = v11->_classLabelsPerFunction;
  v11->_classLabelsPerFunction = (NSArray *)v24;

  v26 = *((int *)a3 + 24);
  if (!(_DWORD)v26)
  {
    v27 = 0;
LABEL_44:
    -[NSArray objectAtIndexedSubscript:](v12->_classLabelsPerFunction, "objectAtIndexedSubscript:", v27);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v42 == v43;

    if (!v44)
    {
      -[NSArray objectAtIndexedSubscript:](v12->_classLabelsPerFunction, "objectAtIndexedSubscript:", v27);
      v45 = objc_claimAutoreleasedReturnValue();
      classLabels = v12->_classLabels;
      v12->_classLabels = (NSArray *)v45;

    }
    goto LABEL_47;
  }
  v27 = 0;
  v28 = (unsigned __int8 *)*((_QWORD *)a3 + 19);
  v29 = *((_QWORD *)a3 + 13);
  if (v29)
    v30 = v29 + 8;
  else
    v30 = 0;
  v31 = v30 + 8 * v26;
  v32 = (char)v28[23];
  if (v32 >= 0)
    v33 = v28[23];
  else
    v33 = *((_QWORD *)v28 + 1);
  do
  {
    v34 = *(unsigned __int8 **)(*(_QWORD *)v30 + 88);
    v35 = v34[23];
    if ((v35 & 0x80u) == 0)
      v36 = v34[23];
    else
      v36 = *((_QWORD *)v34 + 1);
    if (v36 == v33)
    {
      if (v32 >= 0)
        v37 = v28;
      else
        v37 = *(unsigned __int8 **)v28;
      if ((v35 & 0x80) != 0)
      {
        if (!memcmp(*(const void **)v34, v37, *((_QWORD *)v34 + 1)))
          goto LABEL_36;
      }
      else
      {
        if (!v34[23])
          goto LABEL_36;
        while (*v34 == *v37)
        {
          ++v34;
          ++v37;
          if (!--v35)
            goto LABEL_36;
        }
      }
    }
    ++v27;
    v30 += 8;
  }
  while (v30 != v31);
  v27 = ((v26 - 1) & 0x1FFFFFFFFFFFFFFFLL) + 1;
LABEL_36:
  if (v27 != v26 && v27 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_44;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[MIOModelDescription initWithSpecification:isUpdatable:modelParameters:classLabelsPerFunction:error:].cold.1();
  if (a7)
  {
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v56 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The default function was not found."));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mlassetio"), 1, v40);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v41 = 0;
LABEL_48:

  return v41;
}

- (const)modelDescriptionSpecification
{
  return &self->_modelDescriptionParams;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MIOMutableModelDescription *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  MIOMutableModelDescription *v8;

  v4 = [MIOMutableModelDescription alloc];
  v5 = -[MIOModelDescription updatable](self, "updatable");
  -[MIOModelDescription parameterDescriptionsByKey](self, "parameterDescriptionsByKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MIOModelDescription initWithSpecification:isUpdatable:modelParameters:classLabelsPerFunction:error:](v4, "initWithSpecification:isUpdatable:modelParameters:classLabelsPerFunction:error:", &self->_modelDescriptionParams, v5, v7, self->_classLabelsPerFunction, 0);

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  _BOOL4 v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("MIOModelDescription (%p)\n"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOModelDescription inputDescriptions](self, "inputDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n    "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  inputDescriptions:\n    %@\n"), v5);

  -[MIOModelDescription outputDescriptions](self, "outputDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n    "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  outputDescriptions:\n    %@\n"), v7);

  -[MIOModelDescription metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("  metadata:\n"));
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    -[MIOModelDescription metadata](self, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v47;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v47 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v13);
          -[MIOModelDescription metadata](self, "metadata");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("    %@ -> %@\n"), v14, v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v11);
    }

  }
  -[MIOModelDescription predictedFeatureName](self, "predictedFeatureName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (!v18)
  {
    -[MIOModelDescription predictedFeatureName](self, "predictedFeatureName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  predictedFeatureName: %@\n"), v19);

  }
  -[MIOModelDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (!v21)
  {
    -[MIOModelDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  predictedProbabilitiesName: %@\n"), v22);

  }
  v23 = -[MIOModelDescription updatable](self, "updatable");
  v24 = "NO";
  if (v23)
    v24 = "YES";
  objc_msgSend(v3, "appendFormat:", CFSTR("  updatable: %s\n"), v24);
  if (-[MIOModelDescription updatable](self, "updatable"))
  {
    -[MIOModelDescription trainingInputDescriptions](self, "trainingInputDescriptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n    "));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  trainingInputDescriptions:\n    %@\n"), v26);

  }
  -[MIOModelDescription parameterDescriptionsByKey](self, "parameterDescriptionsByKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count") == 0;

  if (!v28)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("  parameterDescriptions:\n"));
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[MIOModelDescription parameterDescriptionsByKey](self, "parameterDescriptionsByKey");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v43;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v43 != v31)
            objc_enumerationMutation(v29);
          v33 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v32);
          -[MIOModelDescription parameterDescriptionsByKey](self, "parameterDescriptionsByKey");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("    %@ -> %@\n"), v33, v35);

          ++v32;
        }
        while (v30 != v32);
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v30);
    }

  }
  -[MIOModelDescription defaultFunctionName](self, "defaultFunctionName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36 == 0;

  if (!v37)
  {
    -[MIOModelDescription defaultFunctionName](self, "defaultFunctionName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  defaultFunctionName: %@\n"), v38);

    -[MIOModelDescription functionDescriptions](self, "functionDescriptions");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n    "));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  functions:\n    %@\n"), v40);

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MIOModelDescription *v4;
  MIOModelDescription *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  _BOOL4 v34;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;

  v4 = (MIOModelDescription *)a3;
  if (self == v4)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIOModelDescription inputDescriptions](self, "inputDescriptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOModelDescription inputDescriptions](v5, "inputDescriptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) == 0)
        goto LABEL_22;
      -[MIOModelDescription outputDescriptions](self, "outputDescriptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOModelDescription outputDescriptions](v5, "outputDescriptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if ((v11 & 1) == 0)
        goto LABEL_22;
      -[MIOModelDescription stateDescriptions](self, "stateDescriptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOModelDescription stateDescriptions](v5, "stateDescriptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if ((v14 & 1) == 0)
        goto LABEL_22;
      -[MIOModelDescription metadata](self, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOModelDescription metadata](v5, "metadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if ((v17 & 1) == 0)
        goto LABEL_22;
      -[MIOModelDescription predictedFeatureName](self, "predictedFeatureName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {

      }
      else
      {
        -[MIOModelDescription predictedFeatureName](v5, "predictedFeatureName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          goto LABEL_13;
      }
      -[MIOModelDescription predictedFeatureName](self, "predictedFeatureName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOModelDescription predictedFeatureName](v5, "predictedFeatureName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      if ((v23 & 1) == 0)
        goto LABEL_22;
LABEL_13:
      -[MIOModelDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {

      }
      else
      {
        -[MIOModelDescription predictedProbabilitiesName](v5, "predictedProbabilitiesName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
          goto LABEL_17;
      }
      -[MIOModelDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOModelDescription predictedProbabilitiesName](v5, "predictedProbabilitiesName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if ((v28 & 1) == 0)
        goto LABEL_22;
LABEL_17:
      -[MIOModelDescription classLabels](self, "classLabels");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {

      }
      else
      {
        -[MIOModelDescription classLabels](v5, "classLabels");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
LABEL_21:
          v34 = -[MIOModelDescription updatable](self, "updatable");
          if (v34 == -[MIOModelDescription updatable](v5, "updatable"))
          {
            if (!-[MIOModelDescription updatable](self, "updatable")
              || (-[MIOModelDescription trainingInputDescriptions](self, "trainingInputDescriptions"),
                  v36 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[MIOModelDescription trainingInputDescriptions](v5, "trainingInputDescriptions"),
                  v37 = (void *)objc_claimAutoreleasedReturnValue(),
                  v38 = objc_msgSend(v36, "isEqual:", v37),
                  v37,
                  v36,
                  (v38 & 1) != 0))
            {
              -[MIOModelDescription parameterDescriptionsByKey](self, "parameterDescriptionsByKey");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[MIOModelDescription parameterDescriptionsByKey](v5, "parameterDescriptionsByKey");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v39, "isEqual:", v40);

              goto LABEL_23;
            }
          }
LABEL_22:
          v19 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      -[MIOModelDescription classLabels](self, "classLabels");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOModelDescription classLabels](v5, "classLabels");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "isEqual:", v32);

      if ((v33 & 1) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
    v19 = 0;
  }
LABEL_24:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  -[MIOModelDescription inputDescriptions](self, "inputDescriptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v18, "hash");
  -[MIOModelDescription outputDescriptions](self, "outputDescriptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v17, "hash");
  -[MIOModelDescription metadata](self, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v16, "hash");
  -[MIOModelDescription predictedFeatureName](self, "predictedFeatureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[MIOModelDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = -[MIOModelDescription updatable](self, "updatable");
  -[MIOModelDescription trainingInputDescriptions](self, "trainingInputDescriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[MIOModelDescription parameterDescriptionsByKey](self, "parameterDescriptionsByKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v3 ^ v15 ^ v4 ^ v6 ^ v8 ^ v9 ^ v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (NSString)defaultFunctionName
{
  void **ptr;
  void *v3;

  if (self->_modelDescriptionParams.functions_.current_size_)
  {
    ptr = (void **)self->_modelDescriptionParams.defaultfunctionname_.ptr_;
    if (*((char *)ptr + 23) < 0)
      ptr = (void **)*ptr;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ptr);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSArray)functionDescriptions
{
  NSArray *v3;
  uint64_t current_size;
  void *v5;
  Rep *rep;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MIOFunctionDescription *v14;

  v3 = self->_classLabelsPerFunction;
  current_size = self->_modelDescriptionParams.functions_.current_size_;
  if ((_DWORD)current_size)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", current_size);
    rep = self->_modelDescriptionParams.functions_.rep_;
    if (rep)
      v7 = (char *)rep + 8;
    else
      v7 = 0;
    v8 = self->_modelDescriptionParams.functions_.current_size_;
    if ((_DWORD)v8)
    {
      v9 = 0;
      v10 = 8 * v8;
      do
      {
        v11 = *(_QWORD *)&v7[8 * v9];
        -[NSArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v13)
        {

          v12 = 0;
        }
        v14 = -[MIOFunctionDescription initWithSpecification:classLabels:]([MIOFunctionDescription alloc], "initWithSpecification:classLabels:", v11, v12);
        objc_msgSend(v5, "addObject:", v14);
        ++v9;

        v10 -= 8;
      }
      while (v10);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v5;
}

- (NSArray)inputDescriptions
{
  uint64_t v2;

  if (!self->_modelDescriptionParams.functions_.current_size_)
    return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)&self->_modelDescriptionParams.input_);
  v2 = defaultFunctionDescriptionSpecification((const CoreML::Specification::ModelDescription *)&self->_modelDescriptionParams)
     + 16;
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications(v2);
}

- (NSArray)outputDescriptions
{
  uint64_t v2;

  if (!self->_modelDescriptionParams.functions_.current_size_)
    return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)&self->_modelDescriptionParams.output_);
  v2 = defaultFunctionDescriptionSpecification((const CoreML::Specification::ModelDescription *)&self->_modelDescriptionParams)
     + 40;
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications(v2);
}

- (NSArray)stateDescriptions
{
  uint64_t v2;

  if (!self->_modelDescriptionParams.functions_.current_size_)
    return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)&self->_modelDescriptionParams.state_);
  v2 = defaultFunctionDescriptionSpecification((const CoreML::Specification::ModelDescription *)&self->_modelDescriptionParams)
     + 64;
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications(v2);
}

- (NSDictionary)metadata
{
  if (self->_modelDescriptionParams.metadata_)
    return (NSDictionary *)NSDictionaryFromModelMetadataSpecification((const CoreML::Specification::Metadata *)self->_modelDescriptionParams.metadata_);
  else
    return (NSDictionary *)NSDictionaryFromModelMetadataSpecification((const CoreML::Specification::Metadata *)&CoreML::Specification::_Metadata_default_instance_);
}

- (NSString)predictedFeatureName
{
  void **ptr;

  ptr = (void **)self->_modelDescriptionParams.predictedfeaturename_.ptr_;
  if (*((char *)ptr + 23) < 0)
    ptr = (void **)*ptr;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ptr);
}

- (NSString)predictedProbabilitiesName
{
  void **ptr;

  ptr = (void **)self->_modelDescriptionParams.predictedprobabilitiesname_.ptr_;
  if (*((char *)ptr + 23) < 0)
    ptr = (void **)*ptr;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ptr);
}

- (NSArray)trainingInputDescriptions
{
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)&self->_modelDescriptionParams.traininginput_);
}

- (void)_setShortDescription:(id)a3 forInputFeatureWithName:(id)a4 functionName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  Rep *rep;
  char *v14;
  uint64_t current_size;
  char *v16;
  unint64_t v17;
  void **v18;
  unsigned __int8 *v19;
  uint64_t v20;
  void *v21;
  void **v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  std::string __p;
  std::string __str;
  void *v28[2];
  unsigned __int8 v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
    std::string::basic_string[abi:ne180100]<0>(v28, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    setShortDescription((uint64_t)&self->_modelDescriptionParams.input_, v28, &__str);
    goto LABEL_30;
  }
  v12 = objc_retainAutorelease(v10);
  std::string::basic_string[abi:ne180100]<0>(v28, (char *)objc_msgSend(v12, "UTF8String"));
  rep = self->_modelDescriptionParams.functions_.rep_;
  if (rep)
    v14 = (char *)rep + 8;
  else
    v14 = 0;
  current_size = self->_modelDescriptionParams.functions_.current_size_;
  v16 = &v14[8 * current_size];
  if ((_DWORD)current_size)
  {
    if ((v29 & 0x80u) == 0)
      v17 = v29;
    else
      v17 = (unint64_t)v28[1];
    if ((v29 & 0x80u) == 0)
      v18 = v28;
    else
      v18 = (void **)v28[0];
    do
    {
      v19 = *(unsigned __int8 **)(*(_QWORD *)v14 + 88);
      v20 = v19[23];
      if ((v20 & 0x80u) == 0)
        v21 = (void *)v19[23];
      else
        v21 = (void *)*((_QWORD *)v19 + 1);
      if (v21 == (void *)v17)
      {
        if ((v20 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v19, v18, *((_QWORD *)v19 + 1)))
            goto LABEL_25;
        }
        else
        {
          if (!v19[23])
            goto LABEL_25;
          v22 = v18;
          while (*v19 == *(unsigned __int8 *)v22)
          {
            ++v19;
            v22 = (void **)((char *)v22 + 1);
            if (!--v20)
              goto LABEL_25;
          }
        }
      }
      v14 += 8;
    }
    while (v14 != v16);
  }
  else
  {
LABEL_25:
    if (v14 != v16)
      goto LABEL_27;
  }
  v23 = (void *)MEMORY[0x1E0C99DA0];
  v24 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  objc_msgSend(v23, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("No input feature named: %s was found."), v24);
  v14 = v16;
LABEL_27:
  v25 = *(_QWORD *)v14;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  setShortDescription(v25 + 16, &__str, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_30:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if ((char)v29 < 0)
    operator delete(v28[0]);

}

- (void)_setShortDescription:(id)a3 forOutputFeatureWithName:(id)a4 functionName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  Rep *rep;
  char *v14;
  uint64_t current_size;
  char *v16;
  unint64_t v17;
  void **v18;
  unsigned __int8 *v19;
  uint64_t v20;
  void *v21;
  void **v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  std::string __p;
  std::string __str;
  void *v28[2];
  unsigned __int8 v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
    std::string::basic_string[abi:ne180100]<0>(v28, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    setShortDescription((uint64_t)&self->_modelDescriptionParams.output_, v28, &__str);
    goto LABEL_30;
  }
  v12 = objc_retainAutorelease(v10);
  std::string::basic_string[abi:ne180100]<0>(v28, (char *)objc_msgSend(v12, "UTF8String"));
  rep = self->_modelDescriptionParams.functions_.rep_;
  if (rep)
    v14 = (char *)rep + 8;
  else
    v14 = 0;
  current_size = self->_modelDescriptionParams.functions_.current_size_;
  v16 = &v14[8 * current_size];
  if ((_DWORD)current_size)
  {
    if ((v29 & 0x80u) == 0)
      v17 = v29;
    else
      v17 = (unint64_t)v28[1];
    if ((v29 & 0x80u) == 0)
      v18 = v28;
    else
      v18 = (void **)v28[0];
    do
    {
      v19 = *(unsigned __int8 **)(*(_QWORD *)v14 + 88);
      v20 = v19[23];
      if ((v20 & 0x80u) == 0)
        v21 = (void *)v19[23];
      else
        v21 = (void *)*((_QWORD *)v19 + 1);
      if (v21 == (void *)v17)
      {
        if ((v20 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v19, v18, *((_QWORD *)v19 + 1)))
            goto LABEL_25;
        }
        else
        {
          if (!v19[23])
            goto LABEL_25;
          v22 = v18;
          while (*v19 == *(unsigned __int8 *)v22)
          {
            ++v19;
            v22 = (void **)((char *)v22 + 1);
            if (!--v20)
              goto LABEL_25;
          }
        }
      }
      v14 += 8;
    }
    while (v14 != v16);
  }
  else
  {
LABEL_25:
    if (v14 != v16)
      goto LABEL_27;
  }
  v23 = (void *)MEMORY[0x1E0C99DA0];
  v24 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  objc_msgSend(v23, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("No output feature named: %s was found."), v24);
  v14 = v16;
LABEL_27:
  v25 = *(_QWORD *)v14;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  setShortDescription(v25 + 40, &__str, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_30:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if ((char)v29 < 0)
    operator delete(v28[0]);

}

- (void)_setShortDescription:(id)a3 forStateFeatureWithName:(id)a4 functionName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  Rep *rep;
  char *v14;
  uint64_t current_size;
  char *v16;
  unint64_t v17;
  void **v18;
  unsigned __int8 *v19;
  uint64_t v20;
  void *v21;
  void **v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  std::string __p;
  std::string __str;
  void *v28[2];
  unsigned __int8 v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
    std::string::basic_string[abi:ne180100]<0>(v28, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    setShortDescription((uint64_t)&self->_modelDescriptionParams.state_, v28, &__str);
    goto LABEL_30;
  }
  v12 = objc_retainAutorelease(v10);
  std::string::basic_string[abi:ne180100]<0>(v28, (char *)objc_msgSend(v12, "UTF8String"));
  rep = self->_modelDescriptionParams.functions_.rep_;
  if (rep)
    v14 = (char *)rep + 8;
  else
    v14 = 0;
  current_size = self->_modelDescriptionParams.functions_.current_size_;
  v16 = &v14[8 * current_size];
  if ((_DWORD)current_size)
  {
    if ((v29 & 0x80u) == 0)
      v17 = v29;
    else
      v17 = (unint64_t)v28[1];
    if ((v29 & 0x80u) == 0)
      v18 = v28;
    else
      v18 = (void **)v28[0];
    do
    {
      v19 = *(unsigned __int8 **)(*(_QWORD *)v14 + 88);
      v20 = v19[23];
      if ((v20 & 0x80u) == 0)
        v21 = (void *)v19[23];
      else
        v21 = (void *)*((_QWORD *)v19 + 1);
      if (v21 == (void *)v17)
      {
        if ((v20 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v19, v18, *((_QWORD *)v19 + 1)))
            goto LABEL_25;
        }
        else
        {
          if (!v19[23])
            goto LABEL_25;
          v22 = v18;
          while (*v19 == *(unsigned __int8 *)v22)
          {
            ++v19;
            v22 = (void **)((char *)v22 + 1);
            if (!--v20)
              goto LABEL_25;
          }
        }
      }
      v14 += 8;
    }
    while (v14 != v16);
  }
  else
  {
LABEL_25:
    if (v14 != v16)
      goto LABEL_27;
  }
  v23 = (void *)MEMORY[0x1E0C99DA0];
  v24 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  objc_msgSend(v23, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("No output feature named: %s was found."), v24);
  v14 = v16;
LABEL_27:
  v25 = *(_QWORD *)v14;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  setShortDescription(v25 + 64, &__str, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_30:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if ((char)v29 < 0)
    operator delete(v28[0]);

}

- (void)_setShortDescription:(id)a3 forTrainingInputFeatureWithName:(id)a4
{
  id v6;
  id v7;
  id v8;
  std::string __p;
  void *v10[2];
  char v11;

  v6 = a3;
  v7 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(v10, (char *)objc_msgSend(v7, "UTF8String"));
  v8 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v8, "UTF8String"));
  setShortDescription((uint64_t)&self->_modelDescriptionParams.traininginput_, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v11 < 0)
    operator delete(v10[0]);

}

- (void)setMetadata:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  uint64_t v24;
  google::protobuf::Arena **v25;
  CoreML::Specification::Metadata *metadata;
  _BYTE v28[24];
  uint64_t v29;
  void *__p[2];
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CoreML::Specification::Metadata::Metadata((CoreML::Specification::Metadata *)v28);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MLModelDescriptionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (!v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MLModelDescriptionKey"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CoreML::Specification::Metadata::set_shortdescription((CoreML::Specification::Metadata *)v28, (char *)objc_msgSend(v6, "UTF8String"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MLModelVersionStringKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (!v8)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MLModelVersionStringKey"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CoreML::Specification::Metadata::set_versionstring((CoreML::Specification::Metadata *)v28, (char *)objc_msgSend(v9, "UTF8String"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MLModelAuthorKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (!v11)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MLModelAuthorKey"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CoreML::Specification::Metadata::set_author((CoreML::Specification::Metadata *)v28, (char *)objc_msgSend(v12, "UTF8String"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MLModelLicenseKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (!v14)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MLModelLicenseKey"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CoreML::Specification::Metadata::set_license((CoreML::Specification::Metadata *)v28, (char *)objc_msgSend(v15, "UTF8String"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v18, "objectForKeyedSubscript:", v22);
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v24 = objc_msgSend(v23, "UTF8String");
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
          v25 = google::protobuf::Map<std::string,std::string>::operator[]((uint64_t)&v29, (uint64_t)__p);
          MEMORY[0x1D82517DC](v25, v24);
          if (v31 < 0)
            operator delete(__p[0]);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v19);
    }

  }
  metadata = (CoreML::Specification::Metadata *)self->_modelDescriptionParams.metadata_;
  if (!metadata)
  {
    metadata = (CoreML::Specification::Metadata *)operator new();
    CoreML::Specification::Metadata::Metadata(metadata);
    self->_modelDescriptionParams.metadata_ = (Metadata *)metadata;
  }
  CoreML::Specification::Metadata::CopyFrom(metadata, (const CoreML::Specification::Metadata *)v28);
  CoreML::Specification::Metadata::~Metadata((CoreML::Specification::Metadata *)v28);

}

- (BOOL)updatable
{
  return self->_updatable;
}

- (NSDictionary)parameterDescriptionsByKey
{
  return self->_parameterDescriptionsByKey;
}

- (NSArray)classLabels
{
  return self->_classLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classLabels, 0);
  objc_storeStrong((id *)&self->_parameterDescriptionsByKey, 0);
  objc_storeStrong((id *)&self->_classLabelsPerFunction, 0);
  CoreML::Specification::ModelDescription::~ModelDescription((CoreML::Specification::ModelDescription *)&self->_modelDescriptionParams);
}

- (id).cxx_construct
{
  CoreML::Specification::ModelDescription::ModelDescription((CoreML::Specification::ModelDescription *)&self->_modelDescriptionParams);
  return self;
}

- (void)initWithSpecification:isUpdatable:modelParameters:classLabelsPerFunction:error:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D3AC6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "The default function was not found.", v0, 2u);
}

@end
