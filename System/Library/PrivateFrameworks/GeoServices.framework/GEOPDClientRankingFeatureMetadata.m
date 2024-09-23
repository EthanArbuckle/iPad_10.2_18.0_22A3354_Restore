@implementation GEOPDClientRankingFeatureMetadata

- (GEOPDClientRankingFeatureMetadata)init
{
  GEOPDClientRankingFeatureMetadata *v2;
  GEOPDClientRankingFeatureMetadata *v3;
  GEOPDClientRankingFeatureMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDClientRankingFeatureMetadata;
  v2 = -[GEOPDClientRankingFeatureMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDClientRankingFeatureMetadata)initWithData:(id)a3
{
  GEOPDClientRankingFeatureMetadata *v3;
  GEOPDClientRankingFeatureMetadata *v4;
  GEOPDClientRankingFeatureMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDClientRankingFeatureMetadata;
  v3 = -[GEOPDClientRankingFeatureMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)featureType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 84);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 76);
    else
      return 0;
  }
  return result;
}

- (void)_readFeatureTypeSource
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureTypeSource_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)featureTypeSource
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDClientRankingFeatureMetadata _readFeatureTypeSource]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readFeatureTypeResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureTypeResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)featureTypeResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDClientRankingFeatureMetadata _readFeatureTypeResult]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (uint64_t)functionType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 84);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if ((v2 & 2) != 0)
      return *(unsigned int *)(v1 + 80);
    else
      return 0;
  }
  return result;
}

- (void)_readFunctionTypeLinear
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFunctionTypeLinear_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)functionTypeLinear
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDClientRankingFeatureMetadata _readFunctionTypeLinear]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)_readFunctionTypeDiscrete
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFunctionTypeDiscrete_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)functionTypeDiscrete
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDClientRankingFeatureMetadata _readFunctionTypeDiscrete]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readFeatureTypeComposite
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureTypeComposite_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)featureTypeComposite
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDClientRankingFeatureMetadata _readFeatureTypeComposite]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDClientRankingFeatureMetadata;
  -[GEOPDClientRankingFeatureMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDClientRankingFeatureMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDClientRankingFeatureMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  id v39;

  if (!a1)
    return 0;
  -[GEOPDClientRankingFeatureMetadata readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 84) & 1) != 0)
  {
    v5 = *(int *)(a1 + 76);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C05910[v5];
    }
    if (a2)
      v7 = CFSTR("featureType");
    else
      v7 = CFSTR("feature_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  -[GEOPDClientRankingFeatureMetadata featureTypeSource]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("featureTypeSource");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("feature_type_source");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  -[GEOPDClientRankingFeatureMetadata featureTypeResult]((id *)a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("featureTypeResult");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("feature_type_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  if ((*(_WORD *)(a1 + 84) & 2) != 0)
  {
    v16 = *(int *)(a1 + 80);
    if (v16 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 80));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E1C05930[v16];
    }
    if (a2)
      v18 = CFSTR("functionType");
    else
      v18 = CFSTR("function_type");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  -[GEOPDClientRankingFeatureMetadata functionTypeLinear]((id *)a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("functionTypeLinear");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("function_type_linear");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  -[GEOPDClientRankingFeatureMetadata functionTypeDiscrete]((id *)a1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("functionTypeDiscrete");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("function_type_discrete");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  -[GEOPDClientRankingFeatureMetadata featureTypeComposite]((id *)a1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("featureTypeComposite");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("feature_type_composite");
    }
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  v31 = *(void **)(a1 + 16);
  if (v31)
  {
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __63__GEOPDClientRankingFeatureMetadata__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E1C00600;
      v35 = v34;
      v39 = v35;
      objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v38);
      v36 = v35;

      v33 = v36;
    }
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDClientRankingFeatureMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_806_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_807_0;
      GEOPDClientRankingFeatureMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __63__GEOPDClientRankingFeatureMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  const __CFString *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  GEOPDClientRankingFeatureTypeSource *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  GEOPDClientRankingFeatureTypeResult *v16;
  void *v17;
  id v18;
  const __CFString *v19;
  void *v20;
  id v21;
  int v22;
  const __CFString *v23;
  void *v24;
  GEOPDClientRankingFeatureFunctionTypeLinear *v25;
  void *v26;
  id v27;
  const __CFString *v28;
  void *v29;
  GEOPDClientRankingFeatureFunctionTypeDiscrete *v30;
  void *v31;
  id v32;
  const __CFString *v33;
  void *v34;
  GEOPDClientRankingFeatureTypeComposite *v35;
  GEOPDClientRankingFeatureTypeComposite *v36;
  id v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  GEOPDVariableExponentPair *v47;
  GEOPDVariableExponentPair *v48;
  id v49;
  uint64_t v50;
  void *v51;
  GEOPDClientRankingFeatureUnit *v52;
  id v53;
  void *v54;
  id v55;
  int v56;
  void *v57;
  GEOPDClientRankingFeatureTypeSource *v58;
  void *v59;
  id v60;
  void *v61;
  GEOPDClientRankingFeatureTypeResult *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  int v67;
  void *v68;
  GEOPDClientRankingFeatureFunctionTypeLinear *v69;
  void *v70;
  id v71;
  void *v72;
  GEOPDClientRankingFeatureFunctionTypeDiscrete *v73;
  void *v74;
  id v75;
  GEOPDClientRankingFeatureUnit *v76;
  void *v77;
  int v78;
  uint64_t v79;
  const __CFString *v80;
  void *v81;
  int v82;
  id v83;
  void *v85;
  id v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  const __CFString *v94;
  const __CFString *v95;
  const __CFString *v96;
  id v97;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v88 = a2;
  if (!a1 || (v89 = objc_msgSend(a1, "init")) == 0)
  {
    v89 = 0;
    v8 = v88;
    goto LABEL_153;
  }
  if (a3)
    v4 = CFSTR("featureType");
  else
    v4 = CFSTR("feature_type");
  v96 = v4;
  objc_msgSend(v88, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("FEATURE_TYPE_UNKNOWN")) & 1) != 0)
    {
      v7 = 0;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("FEATURE_TYPE_SOURCE")) & 1) != 0)
    {
      v7 = 1;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("FEATURE_TYPE_RESULT")) & 1) != 0)
    {
      v7 = 2;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("FEATURE_TYPE_COMPOSITE")))
    {
      v7 = 3;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    v7 = objc_msgSend(v5, "intValue");
  }
  *(_WORD *)(v89 + 84) |= 0x100u;
  *(_WORD *)(v89 + 84) |= 1u;
  *(_DWORD *)(v89 + 76) = v7;
LABEL_21:

  if (a3)
    v9 = CFSTR("featureTypeSource");
  else
    v9 = CFSTR("feature_type_source");
  v8 = v88;
  v95 = v9;
  objc_msgSend(v88, "objectForKeyedSubscript:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEOPDClientRankingFeatureTypeSource alloc];
    if (v11)
      v12 = (void *)-[GEOPDClientRankingFeatureTypeSource _initWithDictionary:isJSON:](v11, v10, a3);
    else
      v12 = 0;
    v13 = v12;
    *(_WORD *)(v89 + 84) |= 0x20u;
    *(_WORD *)(v89 + 84) |= 0x100u;
    objc_storeStrong((id *)(v89 + 40), v12);

  }
  if (a3)
    v14 = CFSTR("featureTypeResult");
  else
    v14 = CFSTR("feature_type_result");
  v94 = v14;
  objc_msgSend(v88, "objectForKeyedSubscript:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = [GEOPDClientRankingFeatureTypeResult alloc];
    if (v16)
      v17 = (void *)-[GEOPDClientRankingFeatureTypeResult _initWithDictionary:isJSON:](v16, v15, a3);
    else
      v17 = 0;
    v18 = v17;
    *(_WORD *)(v89 + 84) |= 0x10u;
    *(_WORD *)(v89 + 84) |= 0x100u;
    objc_storeStrong((id *)(v89 + 32), v17);

  }
  if (a3)
    v19 = CFSTR("functionType");
  else
    v19 = CFSTR("function_type");
  v93 = v19;
  objc_msgSend(v88, "objectForKeyedSubscript:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v20;
    if ((objc_msgSend(v21, "isEqualToString:", CFSTR("FUNCTION_TYPE_UNKNOWN")) & 1) != 0)
    {
      v22 = 0;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("FUNCTION_TYPE_LINEAR")) & 1) != 0)
    {
      v22 = 1;
    }
    else if (objc_msgSend(v21, "isEqualToString:", CFSTR("FUNCTION_TYPE_DISCRETE")))
    {
      v22 = 2;
    }
    else
    {
      v22 = 0;
    }

    goto LABEL_49;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = objc_msgSend(v20, "intValue");
LABEL_49:
    *(_WORD *)(v89 + 84) |= 0x100u;
    *(_WORD *)(v89 + 84) |= 2u;
    *(_DWORD *)(v89 + 80) = v22;
  }

  if (a3)
    v23 = CFSTR("functionTypeLinear");
  else
    v23 = CFSTR("function_type_linear");
  v92 = v23;
  objc_msgSend(v88, "objectForKeyedSubscript:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = [GEOPDClientRankingFeatureFunctionTypeLinear alloc];
    if (v25)
      v26 = (void *)-[GEOPDClientRankingFeatureFunctionTypeLinear _initWithDictionary:isJSON:](v25, v24, a3);
    else
      v26 = 0;
    v27 = v26;
    *(_WORD *)(v89 + 84) |= 0x80u;
    *(_WORD *)(v89 + 84) |= 0x100u;
    objc_storeStrong((id *)(v89 + 56), v26);

  }
  if (a3)
    v28 = CFSTR("functionTypeDiscrete");
  else
    v28 = CFSTR("function_type_discrete");
  v91 = v28;
  objc_msgSend(v88, "objectForKeyedSubscript:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = [GEOPDClientRankingFeatureFunctionTypeDiscrete alloc];
    if (v30)
      v31 = (void *)-[GEOPDClientRankingFeatureFunctionTypeDiscrete _initWithDictionary:isJSON:](v30, v29, a3);
    else
      v31 = 0;
    v32 = v31;
    *(_WORD *)(v89 + 84) |= 0x40u;
    *(_WORD *)(v89 + 84) |= 0x100u;
    objc_storeStrong((id *)(v89 + 48), v31);

  }
  if (a3)
    v33 = CFSTR("featureTypeComposite");
  else
    v33 = CFSTR("feature_type_composite");
  objc_msgSend(v88, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = [GEOPDClientRankingFeatureTypeComposite alloc];
    if (v35)
    {
      v36 = v35;
      v37 = v34;
      v38 = -[GEOPDClientRankingFeatureTypeComposite init](v36, "init");
      if (v38)
      {
        if (a3)
          v39 = CFSTR("variableExponentPair");
        else
          v39 = CFSTR("variable_exponent_pair");
        objc_msgSend(v37, "objectForKeyedSubscript:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v86 = v37;
          v87 = v34;
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v85 = v40;
          v41 = v40;
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v100, v104, 16);
          if (!v42)
            goto LABEL_143;
          v43 = v42;
          v44 = *(_QWORD *)v101;
          v90 = v38;
          v97 = v41;
          v99 = *(_QWORD *)v101;
          while (1)
          {
            v45 = 0;
            do
            {
              if (*(_QWORD *)v101 != v44)
                objc_enumerationMutation(v41);
              v46 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v45);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v47 = [GEOPDVariableExponentPair alloc];
                if (v47)
                {
                  v48 = v47;
                  v49 = v46;
                  v50 = -[GEOPDVariableExponentPair init](v48, "init");
                  if (v50)
                  {
                    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("variable"));
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v52 = [GEOPDClientRankingFeatureUnit alloc];
                      if (v52)
                      {
                        v53 = v51;
                        v52 = -[GEOPDClientRankingFeatureUnit init](v52, "init");
                        if (v52)
                        {
                          objc_msgSend(v53, "objectForKeyedSubscript:", v96);
                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v55 = v54;
                            if ((objc_msgSend(v55, "isEqualToString:", CFSTR("FEATURE_TYPE_UNKNOWN")) & 1) != 0)
                            {
                              v56 = 0;
                            }
                            else if ((objc_msgSend(v55, "isEqualToString:", CFSTR("FEATURE_TYPE_SOURCE")) & 1) != 0)
                            {
                              v56 = 1;
                            }
                            else if ((objc_msgSend(v55, "isEqualToString:", CFSTR("FEATURE_TYPE_RESULT")) & 1) != 0)
                            {
                              v56 = 2;
                            }
                            else if (objc_msgSend(v55, "isEqualToString:", CFSTR("FEATURE_TYPE_COMPOSITE")))
                            {
                              v56 = 3;
                            }
                            else
                            {
                              v56 = 0;
                            }

LABEL_98:
                            *(_BYTE *)&v52->_flags |= 0x80u;
                            *(_BYTE *)&v52->_flags |= 1u;
                            v52->_featureType = v56;
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v56 = objc_msgSend(v54, "intValue");
                              goto LABEL_98;
                            }
                          }

                          objc_msgSend(v53, "objectForKeyedSubscript:", v95);
                          v57 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v58 = [GEOPDClientRankingFeatureTypeSource alloc];
                            if (v58)
                              v59 = (void *)-[GEOPDClientRankingFeatureTypeSource _initWithDictionary:isJSON:](v58, v57, a3);
                            else
                              v59 = 0;
                            v60 = v59;
                            *(_BYTE *)&v52->_flags |= 0x10u;
                            *(_BYTE *)&v52->_flags |= 0x80u;
                            objc_storeStrong((id *)&v52->_featureTypeSource, v59);

                          }
                          objc_msgSend(v53, "objectForKeyedSubscript:", v94);
                          v61 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v62 = [GEOPDClientRankingFeatureTypeResult alloc];
                            if (v62)
                              v63 = (void *)-[GEOPDClientRankingFeatureTypeResult _initWithDictionary:isJSON:](v62, v61, a3);
                            else
                              v63 = 0;
                            v64 = v63;
                            *(_BYTE *)&v52->_flags |= 8u;
                            *(_BYTE *)&v52->_flags |= 0x80u;
                            objc_storeStrong((id *)&v52->_featureTypeResult, v63);

                          }
                          objc_msgSend(v53, "objectForKeyedSubscript:", v93);
                          v65 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v66 = v65;
                            if ((objc_msgSend(v66, "isEqualToString:", CFSTR("FUNCTION_TYPE_UNKNOWN")) & 1) != 0)
                            {
                              v67 = 0;
                            }
                            else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("FUNCTION_TYPE_LINEAR")) & 1) != 0)
                            {
                              v67 = 1;
                            }
                            else if (objc_msgSend(v66, "isEqualToString:", CFSTR("FUNCTION_TYPE_DISCRETE")))
                            {
                              v67 = 2;
                            }
                            else
                            {
                              v67 = 0;
                            }

LABEL_118:
                            *(_BYTE *)&v52->_flags |= 0x80u;
                            *(_BYTE *)&v52->_flags |= 2u;
                            v52->_functionType = v67;
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v67 = objc_msgSend(v65, "intValue");
                              goto LABEL_118;
                            }
                          }

                          objc_msgSend(v53, "objectForKeyedSubscript:", v92);
                          v68 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v69 = [GEOPDClientRankingFeatureFunctionTypeLinear alloc];
                            if (v69)
                              v70 = (void *)-[GEOPDClientRankingFeatureFunctionTypeLinear _initWithDictionary:isJSON:](v69, v68, a3);
                            else
                              v70 = 0;
                            v71 = v70;
                            *(_BYTE *)&v52->_flags |= 0x40u;
                            *(_BYTE *)&v52->_flags |= 0x80u;
                            objc_storeStrong((id *)&v52->_functionTypeLinear, v70);

                          }
                          objc_msgSend(v53, "objectForKeyedSubscript:", v91);
                          v72 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v73 = [GEOPDClientRankingFeatureFunctionTypeDiscrete alloc];
                            if (v73)
                              v74 = (void *)-[GEOPDClientRankingFeatureFunctionTypeDiscrete _initWithDictionary:isJSON:](v73, v72, a3);
                            else
                              v74 = 0;
                            v75 = v74;
                            *(_BYTE *)&v52->_flags |= 0x20u;
                            *(_BYTE *)&v52->_flags |= 0x80u;
                            objc_storeStrong((id *)&v52->_functionTypeDiscrete, v74);

                          }
                          v38 = v90;
                        }

                      }
                      v76 = v52;
                      objc_storeStrong((id *)(v50 + 16), v52);

                      v41 = v97;
                    }

                    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("exponent"));
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v78 = objc_msgSend(v77, "unsignedIntValue");
                      *(_BYTE *)(v50 + 28) |= 1u;
                      *(_DWORD *)(v50 + 24) = v78;
                    }

                    v44 = v99;
                  }

                }
                else
                {
                  v50 = 0;
                }
                -[GEOPDClientRankingFeatureTypeComposite addVariableExponentPair:](v38, (void *)v50);

              }
              ++v45;
            }
            while (v43 != v45);
            v79 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v100, v104, 16);
            v43 = v79;
            if (!v79)
            {
LABEL_143:

              v37 = v86;
              v34 = v87;
              v40 = v85;
              break;
            }
          }
        }

        if (a3)
          v80 = CFSTR("featureWeight");
        else
          v80 = CFSTR("feature_weight");
        objc_msgSend(v37, "objectForKeyedSubscript:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v81, "floatValue");
          *(_BYTE *)(v38 + 28) |= 1u;
          *(_DWORD *)(v38 + 24) = v82;
        }

      }
    }
    else
    {
      v38 = 0;
    }
    v83 = (id)v38;
    *(_WORD *)(v89 + 84) |= 8u;
    *(_WORD *)(v89 + 84) |= 0x100u;
    objc_storeStrong((id *)(v89 + 24), (id)v38);

    v8 = v88;
  }

LABEL_153:
  return v89;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDClientRankingFeatureMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F8) == 0))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDClientRankingFeatureMetadata readAll:]((uint64_t)self, 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_featureTypeSource)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_featureTypeResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_functionTypeLinear)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_functionTypeDiscrete)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_featureTypeComposite)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  PBUnknownFields *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDClientRankingFeatureMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDClientRankingFeatureMetadata readAll:]((uint64_t)self, 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_featureType;
    *(_WORD *)(v5 + 84) |= 1u;
  }
  v9 = -[GEOPDClientRankingFeatureTypeSource copyWithZone:](self->_featureTypeSource, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[GEOPDClientRankingFeatureTypeResult copyWithZone:](self->_featureTypeResult, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_functionType;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  v13 = -[GEOPDClientRankingFeatureFunctionTypeLinear copyWithZone:](self->_functionTypeLinear, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  v15 = -[GEOPDClientRankingFeatureFunctionTypeDiscrete copyWithZone:](self->_functionTypeDiscrete, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v17 = -[GEOPDClientRankingFeatureTypeComposite copyWithZone:](self->_featureTypeComposite, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v17;

  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  GEOPDClientRankingFeatureTypeSource *featureTypeSource;
  GEOPDClientRankingFeatureTypeResult *featureTypeResult;
  __int16 v8;
  GEOPDClientRankingFeatureFunctionTypeLinear *functionTypeLinear;
  GEOPDClientRankingFeatureFunctionTypeDiscrete *functionTypeDiscrete;
  GEOPDClientRankingFeatureTypeComposite *featureTypeComposite;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOPDClientRankingFeatureMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDClientRankingFeatureMetadata readAll:]((uint64_t)v4, 1);
  v5 = *((_WORD *)v4 + 42);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_featureType != *((_DWORD *)v4 + 19))
      goto LABEL_22;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  featureTypeSource = self->_featureTypeSource;
  if ((unint64_t)featureTypeSource | *((_QWORD *)v4 + 5)
    && !-[GEOPDClientRankingFeatureTypeSource isEqual:](featureTypeSource, "isEqual:"))
  {
    goto LABEL_22;
  }
  featureTypeResult = self->_featureTypeResult;
  if ((unint64_t)featureTypeResult | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDClientRankingFeatureTypeResult isEqual:](featureTypeResult, "isEqual:"))
      goto LABEL_22;
  }
  v8 = *((_WORD *)v4 + 42);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_functionType != *((_DWORD *)v4 + 20))
      goto LABEL_22;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_22;
  }
  functionTypeLinear = self->_functionTypeLinear;
  if ((unint64_t)functionTypeLinear | *((_QWORD *)v4 + 7)
    && !-[GEOPDClientRankingFeatureFunctionTypeLinear isEqual:](functionTypeLinear, "isEqual:"))
  {
    goto LABEL_22;
  }
  functionTypeDiscrete = self->_functionTypeDiscrete;
  if ((unint64_t)functionTypeDiscrete | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDClientRankingFeatureFunctionTypeDiscrete isEqual:](functionTypeDiscrete, "isEqual:"))
      goto LABEL_22;
  }
  featureTypeComposite = self->_featureTypeComposite;
  if ((unint64_t)featureTypeComposite | *((_QWORD *)v4 + 3))
    v12 = -[GEOPDClientRankingFeatureTypeComposite isEqual:](featureTypeComposite, "isEqual:");
  else
    v12 = 1;
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  -[GEOPDClientRankingFeatureMetadata readAll:]((uint64_t)self, 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_featureType;
  else
    v3 = 0;
  v4 = -[GEOPDClientRankingFeatureTypeSource hash](self->_featureTypeSource, "hash");
  v5 = -[GEOPDClientRankingFeatureTypeResult hash](self->_featureTypeResult, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_functionType;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[GEOPDClientRankingFeatureFunctionTypeLinear hash](self->_functionTypeLinear, "hash");
  v9 = v8 ^ -[GEOPDClientRankingFeatureFunctionTypeDiscrete hash](self->_functionTypeDiscrete, "hash");
  return v7 ^ v9 ^ -[GEOPDClientRankingFeatureTypeComposite hash](self->_featureTypeComposite, "hash");
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 4u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDClientRankingFeatureMetadata readAll:](a1, 0);
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
      {
        v6 = *(void **)(v5 + 8);
        *(_QWORD *)(v5 + 8) = 0;

      }
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
      {
        v8 = *(void **)(v7 + 8);
        *(_QWORD *)(v7 + 8) = 0;

      }
      v9 = *(_QWORD *)(a1 + 56);
      if (v9)
      {
        v10 = *(void **)(v9 + 8);
        *(_QWORD *)(v9 + 8) = 0;

      }
      v11 = *(_QWORD *)(a1 + 48);
      if (v11)
      {
        v12 = *(void **)(v11 + 8);
        *(_QWORD *)(v11 + 8) = 0;

      }
      -[GEOPDClientRankingFeatureTypeComposite clearUnknownFields:](*(_QWORD *)(a1 + 24), 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionTypeLinear, 0);
  objc_storeStrong((id *)&self->_functionTypeDiscrete, 0);
  objc_storeStrong((id *)&self->_featureTypeSource, 0);
  objc_storeStrong((id *)&self->_featureTypeResult, 0);
  objc_storeStrong((id *)&self->_featureTypeComposite, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
