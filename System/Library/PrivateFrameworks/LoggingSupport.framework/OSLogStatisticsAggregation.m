@implementation OSLogStatisticsAggregation

- (unsigned)_childTier
{
  return self->_tier + 1;
}

- (NSString)tierString
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "_stringForTier:", self->_tier);
}

- (OSLogStatisticsAggregation)initWithLabel:(id)a3 tier:(unsigned __int8)a4
{
  id v7;
  OSLogStatisticsAggregation *v8;
  OSLogStatisticsAggregation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OSLogStatisticsAggregation;
  v8 = -[OSLogStatisticsAggregation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_label, a3);
    v9->_tier = a4;
  }

  return v9;
}

- (OSLogStatisticsAggregation)initWithOSLogProxy:(id)a3 tier:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  OSLogStatisticsAggregation *v8;
  void *v9;
  uint64_t v10;
  NSUUID *v11;
  uint64_t v12;
  NSNumber *senderOffset;
  void *v14;
  uint64_t v15;
  NSUUID *senderUUID;
  void *v17;
  uint64_t v18;

  v4 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_labelFromProxy:forTier:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[OSLogStatisticsAggregation initWithLabel:tier:](self, "initWithLabel:tier:", v7, v4);
  if (!v8)
    goto LABEL_10;
  switch((_DWORD)v4)
  {
    case 3:
      objc_msgSend(v6, "processImageUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v14 = v17;
      v18 = objc_msgSend(v17, "copy");
      senderUUID = v8->_senderUUID;
      v8->_senderUUID = (NSUUID *)v18;
      goto LABEL_9;
    case 4:
      objc_msgSend(v6, "senderImageUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 8:
      objc_msgSend(v6, "senderImageUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      v11 = v8->_senderUUID;
      v8->_senderUUID = (NSUUID *)v10;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "senderImageOffset"));
      v12 = objc_claimAutoreleasedReturnValue();
      senderOffset = v8->_senderOffset;
      v8->_senderOffset = (NSNumber *)v12;

      objc_msgSend(v6, "formatString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      senderUUID = (NSUUID *)v8->_formatString;
      v8->_formatString = (NSString *)v15;
LABEL_9:

      break;
  }
LABEL_10:

  return v8;
}

- (void)_addToChildren:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *labelToChildTiers;
  void *v9;
  OSLogStatisticsAggregation *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = -[OSLogStatisticsAggregation _childTier](self, "_childTier");
  objc_msgSend((id)objc_opt_class(), "_labelFromProxy:forTier:", v12, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogStatisticsAggregation labelToChildTiers](self, "labelToChildTiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    labelToChildTiers = self->_labelToChildTiers;
    self->_labelToChildTiers = v7;

  }
  -[OSLogStatisticsAggregation labelToChildTiers](self, "labelToChildTiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v5);
  v10 = (OSLogStatisticsAggregation *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v10 = -[OSLogStatisticsAggregation initWithOSLogProxy:tier:]([OSLogStatisticsAggregation alloc], "initWithOSLogProxy:tier:", v12, v4);
    -[OSLogStatisticsAggregation labelToChildTiers](self, "labelToChildTiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v5);

  }
  -[OSLogStatisticsAggregation _addTraceEvent:](v10, "_addTraceEvent:", v12);

}

- (void)_addTraceEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (-[OSLogStatisticsAggregation tier](self, "tier") >= 9)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  else
  {
    -[OSLogStatisticsAggregation setEventCount:](self, "setEventCount:", -[OSLogStatisticsAggregation eventCount](self, "eventCount") + 1);
    -[OSLogStatisticsAggregation setEventBytes:](self, "setEventBytes:", -[OSLogStatisticsAggregation eventBytes](self, "eventBytes") + objc_msgSend(v4, "size"));
    if (-[OSLogStatisticsAggregation tier](self, "tier") != 8)
      -[OSLogStatisticsAggregation _addToChildren:](self, "_addToChildren:", v4);

  }
}

- (id)_descendingChildren
{
  void *v2;
  void *v3;
  void *v4;

  -[OSLogStatisticsAggregation labelToChildTiers](self, "labelToChildTiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_1911);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_dictRepresentation:(unsigned __int8)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[4];
  _QWORD v33[5];

  v3 = a3;
  v33[4] = *MEMORY[0x1E0C80C00];
  if (-[OSLogStatisticsAggregation tier](self, "tier") > a3)
    return 0;
  v32[0] = CFSTR("eventCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSLogStatisticsAggregation eventCount](self, "eventCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v6;
  v32[1] = CFSTR("eventBytes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSLogStatisticsAggregation eventBytes](self, "eventBytes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v7;
  v32[2] = CFSTR("tier");
  -[OSLogStatisticsAggregation tierString](self, "tierString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v8;
  v32[3] = CFSTR("label");
  -[OSLogStatisticsAggregation label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[OSLogStatisticsAggregation senderUUID](self, "senderUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[OSLogStatisticsAggregation senderUUID](self, "senderUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("senderUUID"));

    -[OSLogStatisticsAggregation senderOffset](self, "senderOffset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("senderOffset"));

  }
  -[OSLogStatisticsAggregation formatString](self, "formatString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[OSLogStatisticsAggregation formatString](self, "formatString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("formatString"));

  }
  if (-[OSLogStatisticsAggregation _childTier](self, "_childTier") <= v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSLogStatisticsAggregation _descendingChildren](self, "_descendingChildren");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v23), "_dictRepresentation:", v3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            objc_msgSend(v18, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v21);
    }
    v25 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("childAggregations"));

  }
  v26 = (void *)objc_msgSend(v11, "copy");

  return v26;
}

- (id)jsonDescription:(unint64_t)a3 tierCap:(unsigned __int8)a4
{
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v9;

  -[OSLogStatisticsAggregation _dictRepresentation:](self, "_dictRepresentation:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, a3, &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
    else
      v7 = &stru_1E4158990;

  }
  else
  {
    v7 = &stru_1E4158990;
  }

  return v7;
}

- (id)jsonDescription:(unint64_t)a3
{
  return -[OSLogStatisticsAggregation jsonDescription:tierCap:](self, "jsonDescription:tierCap:", a3, 8);
}

- (id)_tracePointSizeString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[OSLogStatisticsAggregation eventBytes](self, "eventBytes"), 0);
}

- (id)_descriptionTierCap:(unsigned __int8)a3 withDepth:(unint64_t)a4
{
  uint64_t v5;
  __CFString *v7;
  unsigned int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = &stru_1E4158990;
  if (-[OSLogStatisticsAggregation tier](self, "tier") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v8 = 1;
      do
      {
        -[__CFString appendString:](v7, "appendString:", CFSTR("  "));
        v9 = v8++;
      }
      while (v9 < a4);
    }
    -[OSLogStatisticsAggregation label](self, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSLogStatisticsAggregation _tracePointSizeString](self, "_tracePointSizeString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[OSLogStatisticsAggregation eventCount](self, "eventCount");
    v13 = -[OSLogStatisticsAggregation eventCount](self, "eventCount");
    v14 = CFSTR("s");
    if (v13 <= 1)
      v14 = &stru_1E4158990;
    -[__CFString appendFormat:](v7, "appendFormat:", CFSTR("%@: %@ (%llu event%@)\n"), v10, v11, v12, v14);

    if (-[OSLogStatisticsAggregation _childTier](self, "_childTier") <= v5)
    {
      -[OSLogStatisticsAggregation _descendingChildren](self, "_descendingChildren");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v24;
        v19 = a4 + 1;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v24 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "_descriptionTierCap:withDepth:", v5, v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](v7, "appendString:", v21);

            ++v20;
          }
          while (v17 != v20);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v17);
      }

    }
  }
  return v7;
}

- (id)descriptionWithTierCap:(unsigned __int8)a3
{
  return -[OSLogStatisticsAggregation _descriptionTierCap:withDepth:](self, "_descriptionTierCap:withDepth:", a3, 0);
}

- (id)aggregationsForTier:(unsigned __int8)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v3 = a3;
  v20[1] = *MEMORY[0x1E0C80C00];
  if (-[OSLogStatisticsAggregation tier](self, "tier") > a3)
    return 0;
  if (-[OSLogStatisticsAggregation tier](self, "tier") == (_DWORD)v3)
  {
    v20[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[OSLogStatisticsAggregation labelToChildTiers](self, "labelToChildTiers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "aggregationsForTier:", v3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v6, "addObjectsFromArray:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    v14 = (void *)objc_msgSend(v6, "copy");
    return v14;
  }
}

- (id)aggregationForTier:(unsigned __int8)a3 withLabel:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[OSLogStatisticsAggregation aggregationsForTier:](self, "aggregationsForTier:", v4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "label", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v6);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (NSMutableDictionary)labelToChildTiers
{
  return self->_labelToChildTiers;
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (void)setEventCount:(unint64_t)a3
{
  self->_eventCount = a3;
}

- (unint64_t)eventBytes
{
  return self->_eventBytes;
}

- (void)setEventBytes:(unint64_t)a3
{
  self->_eventBytes = a3;
}

- (unsigned)tier
{
  return self->_tier;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (NSString)label
{
  return self->_label;
}

- (NSUUID)senderUUID
{
  return self->_senderUUID;
}

- (NSNumber)senderOffset
{
  return self->_senderOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderOffset, 0);
  objc_storeStrong((id *)&self->_senderUUID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
  objc_storeStrong((id *)&self->_labelToChildTiers, 0);
}

uint64_t __49__OSLogStatisticsAggregation__descendingChildren__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "eventBytes");
  if (v6 <= objc_msgSend(v5, "eventBytes"))
  {
    v8 = objc_msgSend(v4, "eventBytes");
    v7 = v8 != objc_msgSend(v5, "eventBytes");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

+ (id)_stringForTier:(unsigned __int8)a3
{
  if (a3 > 8u)
    return CFSTR("Unexpected");
  else
    return (id)*((_QWORD *)&off_1E41577A0 + a3);
}

+ (id)_labelFromProxy:(id)a3 forTier:(unsigned __int8)a4
{
  int v4;
  id v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  v7 = 0;
  switch(v4)
  {
    case 0:
      goto LABEL_14;
    case 1:
      v7 = CFSTR("All");
      goto LABEL_14;
    case 2:
      if (objc_msgSend(v5, "type") == 1536)
      {
        v7 = CFSTR("os_signpost");
      }
      else if (objc_msgSend(v6, "type") == 1024)
      {
        v7 = CFSTR("os_log");
      }
      else
      {
        v7 = CFSTR("Unexpected");
      }
      goto LABEL_14;
    case 3:
      objc_msgSend(v5, "process");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4:
      objc_msgSend(v5, "sender");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5:
      objc_msgSend(v5, "subsystem");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6:
      objc_msgSend(v5, "category");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v9 = (void *)v8;
      v10 = CFSTR("Unknown");
      if (v8)
        v10 = (__CFString *)v8;
      v7 = v10;
      goto LABEL_13;
    case 7:
      if (objc_msgSend(v5, "type") == 1536)
      {
        v12 = objc_msgSend(v6, "signpostType");
        if (v12 <= 2)
        {
          v7 = (__CFString *)*((_QWORD *)&off_1E41577E8 + v12);
          goto LABEL_14;
        }
        goto LABEL_33;
      }
      if (objc_msgSend(v6, "type") != 1024)
      {
LABEL_33:
        v7 = CFSTR("Unexpected");
        goto LABEL_14;
      }
      v18 = objc_msgSend(v6, "logType");
      if (v18 <= 1)
      {
        if (v18)
        {
          if (v18 == 1)
          {
            v7 = CFSTR("Info");
            goto LABEL_14;
          }
          goto LABEL_33;
        }
        v7 = CFSTR("Default");
      }
      else
      {
        switch(v18)
        {
          case 2:
            v7 = CFSTR("Debug");
            break;
          case 16:
            v7 = CFSTR("Error");
            break;
          case 17:
            v7 = CFSTR("Fault");
            break;
          default:
            goto LABEL_33;
        }
      }
LABEL_14:

      return v7;
    case 8:
      objc_msgSend(v5, "senderImageUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v13, "copy");

      if (v9)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v6, "senderImageOffset");
        objc_msgSend(v6, "formatString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ + %llu : %@"), v15, v16, v17);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = CFSTR("<Unknown>");
      }
LABEL_13:

      goto LABEL_14;
    default:
      v7 = &stru_1E4158990;
      goto LABEL_14;
  }
}

@end
