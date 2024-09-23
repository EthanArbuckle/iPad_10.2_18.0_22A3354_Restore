@implementation RTInferredMapItem

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (unint64_t)source
{
  return self->_source;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

- (RTInferredMapItem)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMapItem_confidence_source_);
}

- (RTInferredMapItem)initWithMapItem:(id)a3 confidence:(double)a4 source:(unint64_t)a5
{
  id v9;
  NSObject *v10;
  NSObject *v12;
  RTInferredMapItem *v13;
  RTInferredMapItem *v14;
  RTInferredMapItem *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTInferredMapItem initWithMapItem:confidence:source:]";
      v20 = 1024;
      v21 = 47;
      _os_log_error_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem (in %s:%d)", buf, 0x12u);
    }

  }
  if (a4 < 0.0 || a4 > 1.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTInferredMapItem initWithMapItem:confidence:source:]";
      v20 = 1024;
      v21 = 49;
      _os_log_error_impl(&dword_1A5E26000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: kRTInferredMapItemConfidenceMin <= confidence && confidence <= kRTInferredMapItemConfidenceMax (in %s:%d)", buf, 0x12u);
    }

  }
  v13 = 0;
  if (v9 && a4 >= 0.0 && a4 <= 1.0 && (a5 & 0xFFFFFFFFFFF00020) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTInferredMapItem;
    v14 = -[RTInferredMapItem init](&v17, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_mapItem, a3);
      v15->_confidence = a4;
      v15->_source = a5;
    }
    self = v15;
    v13 = self;
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTInferredMapItem mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTInferredMapItem confidence](self, "confidence");
  v6 = v5;
  +[RTMapItem sourceToString:](RTMapItem, "sourceToString:", -[RTInferredMapItem source](self, "source"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("mapItem, %@, confidence, %.3f, source, %@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)hasKnownTypeItem:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_1) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = 0;

  return v4;
}

uint64_t __38__RTInferredMapItem_hasKnownTypeItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extendedAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMe");

  return v4;
}

+ (double)consolidatedConfidenceFromConfidences:(id)a3
{
  id v3;
  double v4;
  void *v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = 0.0;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doubleValue");
      v4 = v6;

    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = v3;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v22;
        v11 = 1.0;
        v12 = 1.0;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v22 != v10)
              objc_enumerationMutation(v7);
            v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v14, "doubleValue");
            if (v15 < 0.0 || (objc_msgSend(v14, "doubleValue"), v16 > 1.0))
            {
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v26 = v14;
                v27 = 2080;
                v28 = "+[RTInferredMapItem consolidatedConfidenceFromConfidences:]";
                v29 = 1024;
                v30 = 117;
                _os_log_error_impl(&dword_1A5E26000, v17, OS_LOG_TYPE_ERROR, "invalid confidence, %@ (in %s:%d)", buf, 0x1Cu);
              }

            }
            objc_msgSend(v14, "doubleValue");
            v11 = v11 * v18;
            objc_msgSend(v14, "doubleValue");
            v12 = v12 * (1.0 - v19);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
        }
        while (v9);
      }
      else
      {
        v11 = 1.0;
        v12 = 1.0;
      }

      if (v11 + v12 != 0.0)
        v4 = fmax(fmin(v11 / (v11 + v12), 1.0), 0.0);
    }
  }

  return v4;
}

+ (unint64_t)consolidatedSourceFromInferredMapItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "source");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)dedupeInferredMapItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  RTInferredMapItem *v49;
  uint64_t v50;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v4 = (void *)objc_msgSend(v3, "copy");
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v52 = v3;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  v8 = MEMORY[0x1E0C809B0];
  v53 = v6;
  v56 = v7;
  if (!v7)
    goto LABEL_24;
  v9 = *(_QWORD *)v67;
  v54 = v5;
  v55 = *(_QWORD *)v67;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v67 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v10);
      objc_msgSend(v11, "mapItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v8;
      v64[1] = 3221225472;
      v64[2] = __44__RTInferredMapItem_dedupeInferredMapItems___block_invoke;
      v64[3] = &unk_1E4FB13C0;
      v13 = v12;
      v65 = v13;
      v14 = objc_msgSend(v5, "indexOfObjectPassingTest:", v64);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v5, "addObject:", v13);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setObject:forKeyedSubscript:", v15, v16);
      }
      else
      {
        v17 = v14;
        objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v11);

        v20 = objc_msgSend(v15, "source");
        v21 = objc_msgSend(v13, "source") & v20;
        if (v21 == objc_msgSend(v13, "source"))
        {
          v9 = v55;
          goto LABEL_22;
        }
        objc_msgSend(v13, "weight");
        v23 = v22;
        objc_msgSend(v15, "weight");
        if (v23 <= v24)
          v25 = v15;
        else
          v25 = v13;
        v16 = v25;
        if (v16 == v13)
          v26 = v15;
        else
          v26 = v13;
        v27 = v26;
        objc_msgSend(v16, "appendSource:", objc_msgSend(v27, "source"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:atIndexedSubscript:", v28, v17);

        objc_msgSend(v5, "objectAtIndexedSubscript:", v17);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqual:", v31);

        if ((v32 & 1) == 0)
        {
          objc_msgSend(v15, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectForKeyedSubscript:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectAtIndexedSubscript:", v17);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setObject:forKeyedSubscript:", v34, v36);

        }
        v6 = v53;
        v5 = v54;
        v8 = MEMORY[0x1E0C809B0];
        v9 = v55;
      }

LABEL_22:
      ++v10;
    }
    while (v56 != v10);
    v56 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  }
  while (v56);
LABEL_24:

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = v5;
  v4 = (void *)v37;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v39 = v38;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v61 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v44, "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectForKeyedSubscript:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v46, "count") == 1)
        {
          objc_msgSend(v46, "firstObject");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v47);
        }
        else
        {
          objc_msgSend(v46, "valueForKeyPath:", CFSTR("confidence"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "consolidatedConfidenceFromConfidences:", v47);
          v49 = -[RTInferredMapItem initWithMapItem:confidence:source:]([RTInferredMapItem alloc], "initWithMapItem:confidence:source:", v44, objc_msgSend((id)objc_opt_class(), "consolidatedSourceFromInferredMapItems:", v46), v48);
          objc_msgSend(v4, "addObject:", v49);

        }
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v41);
  }

  v50 = objc_msgSend(v53, "count");
  if (v50 != objc_msgSend(v4, "count"))
  {
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __44__RTInferredMapItem_dedupeInferredMapItems___block_invoke_2;
    v58[3] = &unk_1E4FB13E8;
    v59 = v57;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v58);

  }
  v3 = v52;
LABEL_37:

  return v4;
}

uint64_t __44__RTInferredMapItem_dedupeInferredMapItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToMapItem:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

void __44__RTInferredMapItem_dedupeInferredMapItems___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = a3 + 1;
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218498;
    v13 = v7;
    v14 = 2048;
    v15 = objc_msgSend(v11, "count");
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_INFO, "de-duped mapItem %lu (from %lu mapItems), %@", (uint8_t *)&v12, 0x20u);

  }
}

+ (id)heaviestMapItemFrom:(id)a3 closestToLocation:(id)a4 distanceCalculator:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((unint64_t)objc_msgSend(v9, "count") > 1)
  {
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("mapItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMapItem heaviestMapItemFrom:closestToLocation:distanceCalculator:error:](RTMapItem, "heaviestMapItemFrom:closestToLocation:distanceCalculator:error:", v13, v10, v11, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (*a6)
    {
      v12 = 0;
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v15 = v9;
      v12 = (id)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v12)
      {
        v21 = v13;
        v16 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v23 != v16)
              objc_enumerationMutation(v15);
            v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v18, "mapItem");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19 == v14)
            {
              v12 = v18;
              goto LABEL_15;
            }
          }
          v12 = (id)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v12)
            continue;
          break;
        }
LABEL_15:
        v13 = v21;
      }

    }
  }
  else
  {
    objc_msgSend(v9, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMapItem:confidence:source:", self->_mapItem, self->_source, self->_confidence);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  RTMapItem *mapItem;
  id v5;

  mapItem = self->_mapItem;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mapItem, CFSTR("mapItem"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidence"), self->_confidence);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_source, CFSTR("source"));

}

- (RTInferredMapItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  RTInferredMapItem *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
  v7 = v6;
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));

  v9 = -[RTInferredMapItem initWithMapItem:confidence:source:](self, "initWithMapItem:confidence:source:", v5, v8, v7);
  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[RTMapItem hash](self->_mapItem, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_source);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  RTInferredMapItem *v4;
  RTInferredMapItem *v5;
  void *v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;

  v4 = (RTInferredMapItem *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTInferredMapItem mapItem](self, "mapItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTInferredMapItem mapItem](v5, "mapItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      -[RTInferredMapItem confidence](self, "confidence");
      v10 = v9;
      -[RTInferredMapItem confidence](v5, "confidence");
      v12 = v11;
      v13 = -[RTInferredMapItem source](self, "source");
      v14 = -[RTInferredMapItem source](v5, "source");

      if (v10 == v12)
        v15 = v8;
      else
        v15 = 0;
      v16 = v13 == v14 && v15;
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

@end
