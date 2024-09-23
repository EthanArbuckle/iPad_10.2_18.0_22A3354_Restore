@implementation VNSceneTaxonomyOperationPoints

- (VNSceneTaxonomyOperationPoints)initWithLabelToOperationPointsDataIndexMap:(id)a3 operationPointsDataArray:(id *)a4
{
  id v7;
  VNSceneTaxonomyOperationPoints *v8;
  VNSceneTaxonomyOperationPoints *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNSceneTaxonomyOperationPoints;
  v8 = -[VNSceneTaxonomyOperationPoints init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_labelToOperationPointsDataIndexMap, a3);
    v9->_operationPointsDataArray = a4;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_operationPointsDataArray);
  v3.receiver = self;
  v3.super_class = (Class)VNSceneTaxonomyOperationPoints;
  -[VNSceneTaxonomyOperationPoints dealloc](&v3, sel_dealloc);
}

- (const)_operationPointsDataForClassificationIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSUInteger v7;
  const $05D7413D4E765A41C86B8C1AFAAD232D *v8;
  void *v9;
  void *value;

  v6 = a3;
  value = (void *)-1;
  if (!NSMapMember(self->_labelToOperationPointsDataIndexMap, v6, 0, &value))
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "errorForUnknownClassificationIdentifier:", v6);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v7 = (NSUInteger)value - 1;
  if ((uint64_t)value < 1 || v7 >= NSCountMapTable(self->_labelToOperationPointsDataIndexMap))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("operation point map data for \"%@\" is corrupt"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_9;
  }
  v8 = &self->_operationPointsDataArray[v7];
LABEL_10:

  return v8;
}

- (id)_allClassificationIdentifiers
{
  return NSAllMapTableKeys(self->_labelToOperationPointsDataIndexMap);
}

- (id)_propertyListRepresentation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  const $05D7413D4E765A41C86B8C1AFAAD232D *v7;
  _DWORD *p_var0;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *context;
  id obj;
  id v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[4];
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  -[VNSceneTaxonomyOperationPoints _allClassificationIdentifiers](self, "_allClassificationIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v2, "count"));
  context = (void *)MEMORY[0x1A1B0B060]();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v3)
  {
    v4 = v3;
    v28 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v7 = -[VNSceneTaxonomyOperationPoints _operationPointsDataForClassificationIdentifier:error:](self, "_operationPointsDataForClassificationIdentifier:error:", v6, 0);
        if (v7)
        {
          p_var0 = (_DWORD *)&v7->var0;
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 18);
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 18);
          v12 = 0x3FFFFFFFFFFFFFEELL;
          do
          {
            LODWORD(v11) = p_var0[v12 + 20];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v13);

            LODWORD(v14) = p_var0[v12 + 21];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v15);

            LODWORD(v16) = p_var0[v12 + 38];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v17);

            LODWORD(v18) = p_var0[v12 + 39];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v19);

            v12 += 2;
          }
          while (v12 * 4);
          v35[0] = CFSTR("threshold");
          LODWORD(v11) = *p_var0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v36[0] = v20;
          v35[1] = CFSTR("F2");
          LODWORD(v21) = p_var0[1];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v36[1] = v22;
          v36[2] = v9;
          v35[2] = CFSTR("precision");
          v35[3] = CFSTR("recall");
          v36[3] = v10;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "setObject:forKey:", v23, v6);
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v4);
  }

  objc_autoreleasePoolPop(context);
  return v27;
}

- (BOOL)getDefaultConfidence:(float *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5
{
  const $05D7413D4E765A41C86B8C1AFAAD232D *v7;
  int v9;

  v7 = -[VNSceneTaxonomyOperationPoints _operationPointsDataForClassificationIdentifier:error:](self, "_operationPointsDataForClassificationIdentifier:error:", a4, a5);
  if (v7)
  {
    v9 = 0;
    LODWORD(v7) = _getConfidenceForValue(CFSTR("precision"), (float *)v7->var2, 1, (float *)&v9, a5, v7->var0);
    if (a3)
    {
      if ((_DWORD)v7)
        *(_DWORD *)a3 = v9;
    }
  }
  return (char)v7;
}

- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withPrecision:(float)a5 error:(id *)a6
{
  const $05D7413D4E765A41C86B8C1AFAAD232D *v9;
  int v11;

  v9 = -[VNSceneTaxonomyOperationPoints _operationPointsDataForClassificationIdentifier:error:](self, "_operationPointsDataForClassificationIdentifier:error:", a4, a6);
  if (v9)
  {
    v11 = 0;
    LODWORD(v9) = _getConfidenceForValue(CFSTR("precision"), (float *)v9->var2, 1, (float *)&v11, a6, a5);
    if (a3)
    {
      if ((_DWORD)v9)
        *(_DWORD *)a3 = v11;
    }
  }
  return (char)v9;
}

- (BOOL)getPrecision:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6
{
  const $05D7413D4E765A41C86B8C1AFAAD232D *v9;
  int v11;

  v9 = -[VNSceneTaxonomyOperationPoints _operationPointsDataForClassificationIdentifier:error:](self, "_operationPointsDataForClassificationIdentifier:error:", a4, a6);
  if (v9)
  {
    v11 = 0;
    LODWORD(v9) = _getValueForConfidence(CFSTR("precision"), (float *)v9->var2, 1, (float *)&v11, a6, a5);
    if (a3)
    {
      if ((_DWORD)v9)
        *(_DWORD *)a3 = v11;
    }
  }
  return (char)v9;
}

- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withRecall:(float)a5 error:(id *)a6
{
  const $05D7413D4E765A41C86B8C1AFAAD232D *v9;
  int v11;

  v9 = -[VNSceneTaxonomyOperationPoints _operationPointsDataForClassificationIdentifier:error:](self, "_operationPointsDataForClassificationIdentifier:error:", a4, a6);
  if (v9)
  {
    v11 = 0;
    LODWORD(v9) = _getConfidenceForValue(CFSTR("recall"), (float *)v9->var3, 0, (float *)&v11, a6, a5);
    if (a3)
    {
      if ((_DWORD)v9)
        *(_DWORD *)a3 = v11;
    }
  }
  return (char)v9;
}

- (BOOL)getRecall:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6
{
  const $05D7413D4E765A41C86B8C1AFAAD232D *v9;
  int v11;

  v9 = -[VNSceneTaxonomyOperationPoints _operationPointsDataForClassificationIdentifier:error:](self, "_operationPointsDataForClassificationIdentifier:error:", a4, a6);
  if (v9)
  {
    v11 = 0;
    LODWORD(v9) = _getValueForConfidence(CFSTR("recall"), (float *)v9->var3, 0, (float *)&v11, a6, a5);
    if (a3)
    {
      if ((_DWORD)v9)
        *(_DWORD *)a3 = v11;
    }
  }
  return (char)v9;
}

- (BOOL)getClassificationMetrics:(id *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5
{
  const $05D7413D4E765A41C86B8C1AFAAD232D *v7;
  const $05D7413D4E765A41C86B8C1AFAAD232D *v8;
  int valid;
  id v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  void *v15;
  BOOL v16;
  id v18;
  id v19;

  v7 = -[VNSceneTaxonomyOperationPoints _operationPointsDataForClassificationIdentifier:error:](self, "_operationPointsDataForClassificationIdentifier:error:", a4, 0);
  if (!v7)
  {
    v12 = 0;
    goto LABEL_12;
  }
  v8 = v7;
  v19 = 0;
  valid = _createValueConfidenceCurveForValidPairData((uint64_t)v7->var2, &v19, (uint64_t)a5);
  v10 = v19;
  v11 = v10;
  v12 = 0;
  if (valid)
  {
    if (v10)
    {
      v18 = 0;
      v13 = _createValueConfidenceCurveForValidPairData((uint64_t)v8->var3, &v18, (uint64_t)a5);
      v14 = v18;
      v15 = v14;
      v12 = 0;
      if (v13 && v14)
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C20]), "initWithPrecisionCurve:recallCurve:", v11, v14);

      if ((v13 & 1) == 0)
        goto LABEL_8;
    }
    else
    {
      v12 = 0;
    }

LABEL_12:
    v12 = objc_retainAutorelease(v12);
    *a3 = v12;
    v16 = 1;
    goto LABEL_13;
  }
LABEL_8:

  v16 = 0;
LABEL_13:

  return v16;
}

- (unint64_t)hash
{
  unint64_t cachedHashValue;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const $05D7413D4E765A41C86B8C1AFAAD232D *v13;
  float *p_var0;
  uint64_t v15;
  uint64_t v16;
  float v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  float *v21;
  float v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  cachedHashValue = self->_cachedHashValue;
  if (!cachedHashValue)
  {
    v4 = (void *)MEMORY[0x1A1B0B060]();
    -[VNSceneTaxonomyOperationPoints _allClassificationIdentifiers](self, "_allClassificationIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v8)
    {
      v9 = v8;
      cachedHashValue = 0;
      v10 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v13 = -[VNSceneTaxonomyOperationPoints _operationPointsDataForClassificationIdentifier:error:](self, "_operationPointsDataForClassificationIdentifier:error:", v12, 0, (_QWORD)v33);
          if (v13)
          {
            p_var0 = &v13->var0;
            v15 = objc_msgSend(v12, "hash");
            v16 = 0;
            v17 = p_var0[1];
            v18 = (unint64_t)*(unsigned int *)p_var0 << 13;
            if (*p_var0 == 0.0)
              v18 = 0;
            v19 = LODWORD(v17);
            if (v17 == 0.0)
              v19 = 0;
            v20 = v19 ^ v18;
            do
            {
              v21 = &p_var0[v16];
              v23 = p_var0[v16 + 2];
              v22 = p_var0[v16 + 3];
              v24 = LODWORD(v22);
              if (v22 == 0.0)
                v24 = 0;
              v25 = LODWORD(v23);
              if (v23 == 0.0)
                v25 = 0;
              v27 = v21[20];
              v26 = v21[21];
              v28 = LODWORD(v26);
              v29 = v25 ^ __ROR8__(v24 ^ __ROR8__(v20, 51), 51);
              if (v26 == 0.0)
                v28 = 0;
              v30 = v28 ^ __ROR8__(v29, 51);
              v31 = LODWORD(v27);
              if (v27 == 0.0)
                v31 = 0;
              v20 = v31 ^ __ROR8__(v30, 51);
              v16 += 2;
            }
            while (v16 != 18);
            cachedHashValue = v20 ^ __ROR8__(v15 ^ __ROR8__(cachedHashValue, 51), 51);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v9);
    }
    else
    {
      cachedHashValue = 0;
    }

    objc_autoreleasePoolPop(v4);
    self->_cachedHashValue = cachedHashValue;
  }
  return cachedHashValue;
}

- (BOOL)isEqual:(id)a3
{
  VNSceneTaxonomyOperationPoints *v4;
  VNSceneTaxonomyOperationPoints *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  const $05D7413D4E765A41C86B8C1AFAAD232D *v18;
  float *p_var0;
  float *v20;
  double v21;
  BOOL v22;
  unint64_t v23;
  float *v24;
  _DWORD *v25;
  float v26;
  int v27;
  BOOL v28;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (VNSceneTaxonomyOperationPoints *)a3;
  if (v4 == self)
  {
    v28 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1A1B0B060]();
      v7 = objc_alloc(MEMORY[0x1E0C99E60]);
      -[VNSceneTaxonomyOperationPoints _allClassificationIdentifiers](self, "_allClassificationIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

      v10 = objc_alloc(MEMORY[0x1E0C99E60]);
      -[VNSceneTaxonomyOperationPoints _allClassificationIdentifiers](v5, "_allClassificationIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);

      if (objc_msgSend(v9, "isEqualToSet:", v12))
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        obj = v9;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v33;
          v30 = v6;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v33 != v15)
                objc_enumerationMutation(obj);
              v17 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
              v18 = -[VNSceneTaxonomyOperationPoints _operationPointsDataForClassificationIdentifier:error:](self, "_operationPointsDataForClassificationIdentifier:error:", v17, 0, v30);
              if (!v18)
                goto LABEL_29;
              p_var0 = &v18->var0;
              v20 = -[VNSceneTaxonomyOperationPoints _operationPointsDataForClassificationIdentifier:error:](v5, "_operationPointsDataForClassificationIdentifier:error:", v17, 0);
              if (!v20)
                goto LABEL_29;
              if (p_var0 != v20)
              {
                if (*p_var0 != *v20 || p_var0[1] != v20[1] || p_var0[3] != v20[3] || p_var0[2] != v20[2])
                  goto LABEL_29;
                v22 = 0;
                v23 = 0;
                v24 = v20 + 21;
                v25 = p_var0 + 21;
                do
                {
                  LODWORD(v21) = *v25;
                  if (*(float *)v25 != *v24)
                    break;
                  LODWORD(v21) = *(v25 - 1);
                  if (*(float *)&v21 != *(v24 - 1))
                    break;
                  v22 = v23 > 7;
                  if (v23 == 8)
                    break;
                  LODWORD(v21) = *(v25 - 16);
                  if (*(float *)&v21 != *(v24 - 16))
                    break;
                  LODWORD(v21) = *(v25 - 17);
                  v26 = *(v24 - 17);
                  v24 += 2;
                  v25 += 2;
                  ++v23;
                }
                while (*(float *)&v21 == v26);
                if (!v22)
                {
LABEL_29:
                  v27 = 1;
                  v6 = v30;
                  goto LABEL_31;
                }
              }
            }
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16, v21);
            v27 = 0;
            v6 = v30;
            if (v14)
              continue;
            break;
          }
        }
        else
        {
          v27 = 0;
        }
LABEL_31:

      }
      else
      {
        v27 = 1;
      }

      objc_autoreleasePoolPop(v6);
      v28 = v27 == 0;

    }
    else
    {
      v28 = 0;
    }
  }

  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*(_OWORD *)&self->_frameworkOperationPointsIdentifier == 0)
  {
    -[VNSceneTaxonomyOperationPoints _propertyListRepresentation](self, "_propertyListRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("plist"));

  }
  else
  {
    objc_msgSend(v4, "encodeObject:forKey:");
  }

}

- (VNSceneTaxonomyOperationPoints)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  VNSceneTaxonomyOperationPoints *v6;
  void *v7;
  id v8;
  VNSceneTaxonomyOperationPoints *v9;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  VNSceneTaxonomyOperationPoints *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("Identifier")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend((id)objc_opt_class(), "loadFromIdentifier:error:", v5, &v20);
    v6 = (VNSceneTaxonomyOperationPoints *)objc_claimAutoreleasedReturnValue();
    v7 = v20;
LABEL_5:
    v8 = v7;
    if (v6)
      v9 = v6;
    else
      objc_msgSend(v4, "failWithError:", v8);

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("URL")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend((id)objc_opt_class(), "loadFromURL:error:", v5, &v19);
    v6 = (VNSceneTaxonomyOperationPoints *)objc_claimAutoreleasedReturnValue();
    v7 = v19;
    goto LABEL_5;
  }
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("plist")))
  {
    +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", CFSTR("no data source available"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v17);

    v6 = 0;
    goto LABEL_10;
  }
  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v5 = (void *)objc_msgSend(v11, "initWithObjects:", v12, v13, v14, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("plist"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend((id)objc_opt_class(), "loadFromPropertyList:error:", v8, &v18);
  v6 = (VNSceneTaxonomyOperationPoints *)objc_claimAutoreleasedReturnValue();
  v15 = v18;
  if (v6)
    v16 = v6;
  else
    objc_msgSend(v4, "failWithError:", v15);

LABEL_9:
LABEL_10:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelToOperationPointsDataIndexMap, 0);
  objc_storeStrong((id *)&self->_nonframeworkDataURL, 0);
  objc_storeStrong((id *)&self->_frameworkOperationPointsIdentifier, 0);
}

+ (id)loadFromIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;

  v6 = a3;
  objc_msgSend(a1, "URLForIdentifier:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "loadFromURL:error:", v7, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (_QWORD *)v8;
    if (v8)
    {
      v10 = *(void **)(v8 + 16);
      *(_QWORD *)(v8 + 16) = 0;

      v11 = objc_msgSend(v6, "copy");
      v12 = (void *)v9[1];
      v9[1] = v11;

      v13 = v9;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)URLForIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("VNImageAnalyzerMultiDetectorSceneNetV3R8")))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown operation points identifier \"%@\"), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0DC6CC8], "sceneNetV3AndReturnError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_9;
  v7 = v6;
  objc_msgSend(v6, "sceneOperatingPointsFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("operation points not available for identifier \"%@\"), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      *a4 = v10;

      goto LABEL_9;
    }
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

+ (id)loadFromPropertyList:(id)a3 error:(id *)a4
{
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  char v25;
  int v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char *v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  NSMapTable *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v5 = objc_msgSend(v39, "count");
  v34 = (char *)malloc_type_calloc(v5, 0x98uLL, 0x10000401CC6BE04uLL);
  if (!v34)
  {
    if (a4)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_46:
      v30 = 0;
    }
    goto LABEL_47;
  }
  v38 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 1282, v5);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v39, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v7)
    goto LABEL_38;
  v8 = 0;
  v9 = v34 + 80;
  obj = v6;
  v36 = *(_QWORD *)v41;
  while (2)
  {
    v10 = 0;
    v37 = v8;
    v11 = (uint64_t)&v9[152 * v8];
    do
    {
      if (*(_QWORD *)v41 != v36)
        objc_enumerationMutation(obj);
      v12 = *(const void **)(*((_QWORD *)&v40 + 1) + 8 * v10);
      NSMapInsertKnownAbsent(v38, v12, (const void *)(v37 + v10 + 1));
      objc_msgSend(v39, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("threshold"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing threshold for \"%@\"), v12);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v31);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_45:

        free(v34);
        goto LABEL_46;
      }
      objc_msgSend(v14, "floatValue");
      *(_DWORD *)(v11 - 80) = v16;
      objc_msgSend(v13, "objectForKey:", CFSTR("F2"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "floatValue");
        *(_DWORD *)(v11 - 76) = v19;
        objc_msgSend(v13, "objectForKey:", CFSTR("precision"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          if ((_parseValueConfidenceArrayWithIncreasingConfidences(v20, v11 - 72, 1) & 1) != 0)
          {
            objc_msgSend(v13, "objectForKey:", CFSTR("recall"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v22)
            {
              v24 = _parseValueConfidenceArrayWithIncreasingConfidences(v22, v11, 0);
              if (a4)
                v25 = v24;
              else
                v25 = 1;
              if ((v25 & 1) != 0)
              {
                v26 = v24 ^ 1;
LABEL_33:

                goto LABEL_34;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid recall table for \"%@\"), v12);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (!a4)
              {
                v23 = 0;
                goto LABEL_32;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing recall table for \"%@\"), v12);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
            }
            *a4 = v29;

LABEL_32:
            v26 = 1;
            goto LABEL_33;
          }
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid precision table for \"%@\"), v12);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v23);
            v27 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_23;
          }
        }
        else
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing precision table for \"%@\"), v12);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v23);
            v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
            *a4 = v27;
            goto LABEL_32;
          }
          v21 = 0;
        }
      }
      else
      {
        if (!a4)
        {
          v26 = 1;
          goto LABEL_35;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing F2 for \"%@\"), v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v21);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v26 = 1;
LABEL_34:

LABEL_35:
      if (v26)
        goto LABEL_45;
      ++v10;
      v11 += 152;
    }
    while (v7 != v10);
    v6 = obj;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    v8 = v37 + v10;
    v9 = v34 + 80;
    if (v7)
      continue;
    break;
  }
LABEL_38:

  v30 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabelToOperationPointsDataIndexMap:operationPointsDataArray:", v38, v34);
  if (!v30)
    free(v34);
LABEL_47:

  return v30;
}

+ (id)loadFromURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "open");
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithStream:options:format:error:", v8, 0, 0, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "close");
    if (v9)
    {
      objc_msgSend(a1, "loadFromPropertyList:error:", v9, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (_QWORD *)v10;
      if (v10)
      {
        v12 = *(void **)(v10 + 8);
        *(_QWORD *)(v10 + 8) = 0;

        v13 = objc_msgSend(v6, "copy");
        v14 = (void *)v11[2];
        v11[2] = v13;

        v15 = v11;
      }

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    if (!a4)
    {
      v11 = 0;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to open %@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v9);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
