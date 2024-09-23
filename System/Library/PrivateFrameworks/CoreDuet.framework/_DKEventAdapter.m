@implementation _DKEventAdapter

- (id)localCreationDate
{
  return -[_DKObject localCreationDate](self->_dkEvent, "localCreationDate");
}

- (id)creationDate
{
  return -[_DKObject creationDate](self->_dkEvent, "creationDate");
}

- (id)uuid
{
  void *v2;
  void *v3;

  -[_DKObject UUID](self->_dkEvent, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)uuidHash
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[_DKEventAdapter uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "hash"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)source
{
  return -[_DKObject source](self->_dkEvent, "source");
}

- (id)streamName
{
  void *v2;
  void *v3;

  -[_DKEvent stream](self->_dkEvent, "stream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)secondsFromGMT
{
  void *v2;
  int64_t v3;

  -[_DKEvent timeZone](self->_dkEvent, "timeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "secondsFromGMT");

  return v3;
}

- (int64_t)startSecondOfDay
{
  void *v2;
  double v3;
  int64_t v4;

  -[_DKEvent startDate](self->_dkEvent, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = (uint64_t)v3 % 86400;

  return v4;
}

- (int64_t)startDayOfWeek
{
  NSNumber *startDayOfWeek;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  NSNumber *v9;
  NSNumber *v10;

  startDayOfWeek = self->_startDayOfWeek;
  if (startDayOfWeek)
    return -[NSNumber longLongValue](startDayOfWeek, "longLongValue");
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEvent startDate](self->_dkEvent, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 512, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "weekday");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v10 = self->_startDayOfWeek;
  self->_startDayOfWeek = v9;

  return v8;
}

- (int64_t)endSecondOfDay
{
  void *v2;
  double v3;
  int64_t v4;

  -[_DKEvent endDate](self->_dkEvent, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = (uint64_t)v3 % 86400;

  return v4;
}

- (int64_t)endDayOfWeek
{
  NSNumber *endDayOfWeek;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  NSNumber *v9;
  NSNumber *v10;

  endDayOfWeek = self->_endDayOfWeek;
  if (endDayOfWeek)
    return -[NSNumber longLongValue](endDayOfWeek, "longLongValue");
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEvent endDate](self->_dkEvent, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 512, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "weekday");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v10 = self->_endDayOfWeek;
  self->_endDayOfWeek = v9;

  return v8;
}

- (double)valueDouble
{
  void *v2;
  double v3;
  double v4;

  -[_DKEvent value](self->_dkEvent, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (int64_t)valueInteger
{
  void *v2;
  int64_t v3;

  -[_DKEvent value](self->_dkEvent, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)valueString
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[_DKEvent value](self->_dkEvent, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_DKEvent value](self->_dkEvent, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (signed)valueClass
{
  void *v3;
  void *v4;
  void *v6;
  uint64_t isKindOfClass;
  void *v8;
  char v9;
  void *v10;
  char v11;

  -[_DKEvent value](self->_dkEvent, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 0;
  -[_DKEvent value](self->_dkEvent, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 1;
  -[_DKEvent value](self->_dkEvent, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
    return 2;
  -[_DKEvent value](self->_dkEvent, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) != 0)
    return 3;
  else
    return 0;
}

- (int64_t)valueTypeCode
{
  void *v3;
  int64_t v4;

  if (!-[_DKEventAdapter valueClass](self, "valueClass"))
    return 0;
  -[_DKEvent value](self->_dkEvent, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "typeCode");

  return v4;
}

- (id)structuredMetadata
{
  NSDictionary *structuredMetadata;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  NSDictionary *v18;
  NSDictionary *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  structuredMetadata = self->_structuredMetadata;
  if (structuredMetadata)
    return structuredMetadata;
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x193FEE914]();
  -[_DKEvent metadata](self->_dkEvent, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKMetadataPersistenceLookupTable keyToAttribute]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v14, (_QWORD)v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  objc_autoreleasePoolPop(v6);
  v17 = (NSDictionary *)objc_msgSend(v5, "copy");
  v18 = self->_structuredMetadata;
  self->_structuredMetadata = v17;

  v19 = v17;
  return v19;
}

- (id)customMetadata
{
  NSArray *customMetadata;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  const __CFNumber *v19;
  __CFString *v20;
  int IsFloatType;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSArray *v36;
  NSArray *v37;
  NSArray *v38;
  void *context;
  _DKEventAdapter *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[3];
  _QWORD v51[3];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  customMetadata = self->_customMetadata;
  if (customMetadata)
    return customMetadata;
  v5 = (void *)objc_opt_new();
  context = (void *)MEMORY[0x193FEE914]();
  v40 = self;
  -[_DKEvent metadata](self->_dkEvent, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKMetadataPersistenceLookupTable keyToAttribute]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (!v9)
    goto LABEL_35;
  v10 = v9;
  v11 = 0x1E0CB3000uLL;
  v12 = *(_QWORD *)v45;
  v41 = v5;
  v42 = v7;
  v43 = *(_QWORD *)v45;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v45 != v12)
        objc_enumerationMutation(v8);
      v14 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v13);
      objc_msgSend(v8, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = *(void **)(v11 + 2368);
          v18 = v15;
          +[_CDHashUtilities md5ForString:](_CDHashUtilities, "md5ForString:", v18);
          v19 = (const __CFNumber *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@S"), v19);
          goto LABEL_11;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v15;
          IsFloatType = CFNumberIsFloatType(v19);
          v22 = *(void **)(v11 + 2368);
          if (IsFloatType)
          {
            objc_msgSend(v22, "stringWithFormat:", CFSTR("%@D"), v19);
            v23 = objc_claimAutoreleasedReturnValue();
            v20 = (__CFString *)v23;
            if (v19)
            {
              v50[0] = CFSTR("name");
              v50[1] = CFSTR("doubleValue");
              v51[0] = v14;
              v51[1] = v19;
              v50[2] = CFSTR("valueHash");
              v24 = &stru_1E26E9728;
              if (v23)
                v24 = (const __CFString *)v23;
              v51[2] = v24;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "addObject:", v25);

              v5 = v41;
              goto LABEL_28;
            }
LABEL_25:
            v48[0] = CFSTR("name");
            v48[1] = CFSTR("valueHash");
            v32 = &stru_1E26E9728;
            if (v20)
              v32 = v20;
            v49[0] = v14;
            v49[1] = v32;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
            v19 = (const __CFNumber *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v19);
LABEL_28:

            v11 = 0x1E0CB3000;
            v12 = v43;
            goto LABEL_29;
          }
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@I"), v19);
LABEL_23:
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v26 = *(void **)(v11 + 2368);
            v19 = v15;
            -[__CFNumber timeIntervalSinceReferenceDate](v19, "timeIntervalSinceReferenceDate");
            v27 = v26;
            v7 = v42;
            objc_msgSend(v27, "stringWithFormat:", CFSTR("%fT"), v28);
            goto LABEL_23;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = *(void **)(v11 + 2368);
            v30 = v15;
            +[_CDHashUtilities md5ForData:](_CDHashUtilities, "md5ForData:", v30);
            v19 = (const __CFNumber *)objc_claimAutoreleasedReturnValue();
            v31 = v29;
            v7 = v42;
            objc_msgSend(v31, "stringWithFormat:", CFSTR("%@B"), v19);
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v5 = v41;
          }
          else
          {
            if (!objc_msgSend(v15, "conformsToProtocol:", &unk_1EE0D5850))
            {
              v20 = 0;
              goto LABEL_25;
            }
            objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:", v15);
            v19 = (const __CFNumber *)objc_claimAutoreleasedReturnValue();
            v33 = *(void **)(v11 + 2368);
            +[_CDHashUtilities md5ForData:](_CDHashUtilities, "md5ForData:", v19);
            v18 = (id)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            v5 = v41;
            objc_msgSend(v34, "stringWithFormat:", CFSTR("%@O"), v18);
LABEL_11:
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v7 = v42;
          }
        }

        goto LABEL_25;
      }
LABEL_29:

      ++v13;
    }
    while (v10 != v13);
    v35 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    v10 = v35;
  }
  while (v35);
LABEL_35:

  objc_autoreleasePoolPop(context);
  v36 = (NSArray *)objc_msgSend(v5, "copy");
  v37 = v40->_customMetadata;
  v40->_customMetadata = v36;

  v38 = v36;
  return v38;
}

- (id)UUID
{
  return -[_DKObject UUID](self->_dkEvent, "UUID");
}

- (id)stringValue
{
  return -[_DKEvent stringValue](self->_dkEvent, "stringValue");
}

- (BOOL)BOOLValue
{
  return -[_DKEvent BOOLValue](self->_dkEvent, "BOOLValue");
}

- (int64_t)integerValue
{
  return -[_DKEvent integerValue](self->_dkEvent, "integerValue");
}

- (double)doubleValue
{
  double result;

  -[_DKEvent doubleValue](self->_dkEvent, "doubleValue");
  return result;
}

- (id)stream
{
  return -[_DKEvent stream](self->_dkEvent, "stream");
}

- (id)startDate
{
  return -[_DKEvent startDate](self->_dkEvent, "startDate");
}

- (id)endDate
{
  return -[_DKEvent endDate](self->_dkEvent, "endDate");
}

- (id)timeZone
{
  return -[_DKEvent timeZone](self->_dkEvent, "timeZone");
}

- (id)value
{
  return -[_DKEvent value](self->_dkEvent, "value");
}

- (double)confidence
{
  double result;

  -[_DKEvent confidence](self->_dkEvent, "confidence");
  return result;
}

- (int64_t)compatibilityVersion
{
  return -[_DKEvent compatibilityVersion](self->_dkEvent, "compatibilityVersion");
}

- (id)metadata
{
  return -[_DKEvent metadata](self->_dkEvent, "metadata");
}

- (unint64_t)hash
{
  return -[_DKEvent hash](self->_dkEvent, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[_DKEvent isEqual:](self->_dkEvent, "isEqual:", v4[5]);

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  _DKEvent *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = self->_dkEvent;
  else
    v4 = 0;
  return v4;
}

- (_DKEvent)dkEvent
{
  return self->_dkEvent;
}

- (void)setDkEvent:(id)a3
{
  objc_storeStrong((id *)&self->_dkEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dkEvent, 0);
  objc_storeStrong((id *)&self->_endDayOfWeek, 0);
  objc_storeStrong((id *)&self->_startDayOfWeek, 0);
  objc_storeStrong((id *)&self->_customMetadata, 0);
  objc_storeStrong((id *)&self->_structuredMetadata, 0);
}

@end
