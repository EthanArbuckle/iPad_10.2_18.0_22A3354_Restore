@implementation SGStorageEvent

- (id)urlFromTags
{
  NSSet *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_tags;
  v3 = (void *)-[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isUrl", (_QWORD)v10) & 1) != 0)
        {
          v7 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v6, "value");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "URLWithString:", v8);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v3 = (void *)-[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)convertToEventWithOrigin:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *content;
  NSString *title;
  void *v20;
  SGRecordId *recordId;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;

  v26 = a3;
  v24 = v26;
  sgMap();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  recordId = self->_recordId;
  v22 = (id)MEMORY[0x1E0D19800];
  -[SGDuplicateKey serialize](self->_duplicateKey, "serialize");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDuplicateKey entityKey](self->_duplicateKey, "entityKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "serialize");
  v4 = objc_claimAutoreleasedReturnValue();
  title = self->_title;
  v17 = (void *)v4;
  content = self->_content;
  -[SGSimpleTimeRange startDate](self->_when, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSimpleTimeRange startTimeZone](self->_when, "startTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSimpleTimeRange endDate](self->_when, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSimpleTimeRange endTimeZone](self->_when, "endTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SGStorageEvent isAllDay](self, "isAllDay");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", self->_creationTimestamp.secondsFromUnixEpoch);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", self->_lastModifiedTimestamp.secondsFromUnixEpoch);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](self->_tags, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStorageEvent urlFromTags](self, "urlFromTags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = v8;
  objc_msgSend(v22, "eventWithRecordId:origin:uniqueKey:opaqueKey:title:notes:start:startTimeZone:end:endTimeZone:isAllDay:creationDate:lastModifiedDate:locations:tags:URL:", recordId, v24, v20, v17, title, content, v15, v5, v6, v7, v14, v9, v10, v16, v11, v12);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)convertToEvent:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D198C8], "originForDuplicateKey:sourceKey:store:", self->_duplicateKey, self->_sourceKey, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStorageEvent convertToEventWithOrigin:](self, "convertToEventWithOrigin:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SGStorageEvent)initWithRecordId:(id)a3 duplicateKey:(id)a4 sourceKey:(id)a5 content:(id)a6 title:(id)a7 creationTimestamp:(SGUnixTimestamp_)a8 lastModifiedTimestamp:(SGUnixTimestamp_)a9 tags:(id)a10 when:(id)a11 locations:(id)a12 structuredData:(id)a13 state:(unsigned int)a14 curated:(BOOL)a15
{
  id v23;
  id v24;
  id v25;
  SGStorageEvent *v26;
  uint64_t v27;
  SGRecordId *recordId;
  id v29;
  NSArray *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  NSArray *locations;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v43 = a4;
  v42 = a5;
  v41 = a6;
  v40 = a7;
  v39 = a10;
  v38 = a11;
  v24 = a12;
  v25 = a13;
  v44.receiver = self;
  v44.super_class = (Class)SGStorageEvent;
  v26 = -[SGStorageEvent init](&v44, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v23, "copy");
    recordId = v26->_recordId;
    v26->_recordId = (SGRecordId *)v27;

    objc_storeStrong((id *)&v26->_duplicateKey, a4);
    objc_storeStrong((id *)&v26->_sourceKey, a5);
    objc_storeStrong((id *)&v26->_content, a6);
    objc_storeStrong((id *)&v26->_title, a7);
    v26->_creationTimestamp = a8;
    v26->_lastModifiedTimestamp = a9;
    objc_storeStrong((id *)&v26->_tags, a10);
    objc_storeStrong((id *)&v26->_when, a11);
    v29 = v24;
    if (v29)
    {
      v30 = (NSArray *)objc_opt_new();
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v31 = v29;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v46 != v34)
              objc_enumerationMutation(v31);
            -[NSArray addObject:](v30, "addObject:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        }
        while (v33);
      }

      -[NSArray sortUsingComparator:](v30, "sortUsingComparator:", &__block_literal_global_26873);
    }
    else
    {
      v30 = 0;
    }

    locations = v26->_locations;
    v26->_locations = v30;

    objc_storeStrong((id *)&v26->_structuredData, a13);
    v26->_state = a14;
    v26->_curated = a15;
  }

  return v26;
}

- (BOOL)isFromDataDetectors
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_tags;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v7, "isUrl", (_QWORD)v12))
        {
          objc_msgSend(v7, "value");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("message:"));

          if ((v9 & 1) != 0)
          {
            v10 = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)isCancelled
{
  NSSet *tags;
  void *v3;

  tags = self->_tags;
  objc_msgSend(MEMORY[0x1E0D197F0], "extractedEventCancellation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(tags) = -[NSSet containsObject:](tags, "containsObject:", v3);

  return (char)tags;
}

- (BOOL)isAllDay
{
  NSSet *tags;
  void *v3;

  tags = self->_tags;
  objc_msgSend(MEMORY[0x1E0D197F0], "allDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(tags) = -[NSSet containsObject:](tags, "containsObject:", v3);

  return (char)tags;
}

- (NSString)opaqueKey
{
  void *v2;
  void *v3;

  -[SGDuplicateKey pseudoEventKey](self->_duplicateKey, "pseudoEventKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serialize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)extraKeyTag
{
  NSSet *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_tags;
  v3 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isExtraKey", (_QWORD)v8) & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)fieldsToSaveOnConfirmation
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *content;
  SGSimpleTimeRange *when;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", title, CFSTR("summary"));
  content = self->_content;
  if (content)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", content, CFSTR("description"));
  when = self->_when;
  if (when)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", when, CFSTR("when"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SGStorageEvent isCancelled](self, "isCancelled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("cancelled"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SGStorageEvent *v4;
  SGStorageEvent *v5;
  BOOL v6;

  v4 = (SGStorageEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGStorageEvent isEqualToStorageEvent:](self, "isEqualToStorageEvent:", v5);

  return v6;
}

- (BOOL)isEqualToStorageEvent:(id)a3
{
  id *v4;
  SGRecordId *recordId;
  SGRecordId *v6;
  SGRecordId *v7;
  SGRecordId *v8;
  char v9;
  SGDuplicateKey *duplicateKey;
  SGDuplicateKey *v11;
  SGDuplicateKey *v12;
  SGDuplicateKey *v13;
  BOOL v14;
  NSString *sourceKey;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  NSString *content;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  NSString *title;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  char v29;
  SGSimpleTimeRange *when;
  SGSimpleTimeRange *v31;
  SGSimpleTimeRange *v32;
  SGSimpleTimeRange *v33;
  char v34;
  NSArray *locations;
  NSArray *v36;
  NSArray *v37;
  NSArray *v38;
  char v39;
  NSSet *tags;
  NSSet *v41;
  NSSet *v42;
  NSSet *v43;
  char v44;
  NSData *structuredData;
  NSData *v46;
  NSData *v47;
  NSData *v48;
  char v49;
  BOOL v50;

  v4 = (id *)a3;
  recordId = self->_recordId;
  v6 = (SGRecordId *)v4[2];
  if (recordId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = recordId;
    v9 = -[SGRecordId isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_41;
  }
  duplicateKey = self->_duplicateKey;
  v11 = (SGDuplicateKey *)v4[3];
  if (duplicateKey == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = duplicateKey;
    v14 = -[SGDuplicateKey isEqual:](v13, "isEqual:", v12);

    if (!v14)
      goto LABEL_41;
  }
  sourceKey = self->_sourceKey;
  v16 = (NSString *)v4[4];
  if (sourceKey == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = sourceKey;
    v19 = -[NSString isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_41;
  }
  content = self->_content;
  v21 = (NSString *)v4[5];
  if (content == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = content;
    v24 = -[NSString isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_41;
  }
  title = self->_title;
  v26 = (NSString *)v4[6];
  if (title == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = title;
    v29 = -[NSString isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_41;
  }
  if (self->_creationTimestamp.secondsFromUnixEpoch != *((double *)v4 + 7)
    || self->_lastModifiedTimestamp.secondsFromUnixEpoch != *((double *)v4 + 8))
  {
    goto LABEL_41;
  }
  when = self->_when;
  v31 = (SGSimpleTimeRange *)v4[9];
  if (when == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = when;
    v34 = -[SGSimpleTimeRange isEqual:](v33, "isEqual:", v32);

    if ((v34 & 1) == 0)
      goto LABEL_41;
  }
  locations = self->_locations;
  v36 = (NSArray *)v4[10];
  if (locations == v36)
  {

  }
  else
  {
    v37 = v36;
    v38 = locations;
    v39 = -[NSArray isEqual:](v38, "isEqual:", v37);

    if ((v39 & 1) == 0)
      goto LABEL_41;
  }
  tags = self->_tags;
  v41 = (NSSet *)v4[11];
  if (tags == v41)
  {

  }
  else
  {
    v42 = v41;
    v43 = tags;
    v44 = -[NSSet isEqual:](v43, "isEqual:", v42);

    if ((v44 & 1) == 0)
      goto LABEL_41;
  }
  structuredData = self->_structuredData;
  v46 = (NSData *)v4[12];
  if (structuredData == v46)
  {

  }
  else
  {
    v47 = v46;
    v48 = structuredData;
    v49 = -[NSData isEqual:](v48, "isEqual:", v47);

    if ((v49 & 1) == 0)
      goto LABEL_41;
  }
  if (self->_state != *((_DWORD *)v4 + 3))
  {
LABEL_41:
    v50 = 0;
    goto LABEL_42;
  }
  v50 = self->_curated == *((unsigned __int8 *)v4 + 8);
LABEL_42:

  return v50;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = -[SGRecordId hash](self->_recordId, "hash");
  v4 = -[SGDuplicateKey hash](self->_duplicateKey, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_sourceKey, "hash");
  return (unint64_t)self->_creationTimestamp.secondsFromUnixEpoch
       - (v5
        - v4
        + 32 * v4)
       + 32 * (v5 - v4 + 32 * v4);
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGStorageEvent title:%@ dupKey:%@ when:%@>"), self->_title, self->_duplicateKey, self->_when);
}

- (id)geocodeStartDate
{
  void *v2;
  void *v3;

  -[SGStorageEvent when](self, "when");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)geocodeStartTimeZone
{
  void *v2;
  void *v3;

  -[SGStorageEvent when](self, "when");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)geocodeEndDate
{
  void *v2;
  void *v3;

  -[SGStorageEvent when](self, "when");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)geocodeEndTimeZone
{
  void *v2;
  void *v3;

  -[SGStorageEvent when](self, "when");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)geocodedEventWithStartDate:(id)a3 startTimeZone:(id)a4 endDate:(id)a5 endTimeZone:(id)a6 locations:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  SGStorageEvent *v31;
  uint64_t v33;
  void *v34;
  SGStorageEvent *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if ((v13 == 0) != (v15 == 0))
    __assert_rtn("-[SGStorageEvent geocodedEventWithStartDate:startTimeZone:endDate:endTimeZone:locations:]", "SGStorageEvent.m", 238, "!startTimeZone == !endTimeZone");
  v17 = v16;
  v39 = v13;
  v40 = v12;
  v37 = v15;
  v38 = v14;
  if (v13)
    objc_msgSend(MEMORY[0x1E0D19940], "rangeWithStartDate:startTimeZone:endDate:endTimeZone:", v12, v13, v14, v15);
  else
    objc_msgSend(MEMORY[0x1E0D19940], "floatingRangeWithUTCStartDate:endDate:", v12, v14);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = [SGStorageEvent alloc];
  -[SGStorageEvent recordId](self, "recordId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStorageEvent duplicateKey](self, "duplicateKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStorageEvent sourceKey](self, "sourceKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStorageEvent content](self, "content");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStorageEvent title](self, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStorageEvent creationTimestamp](self, "creationTimestamp");
  v24 = v23;
  -[SGStorageEvent lastModifiedTimestamp](self, "lastModifiedTimestamp");
  v26 = v25;
  -[SGStorageEvent tags](self, "tags");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v17;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v17);
  -[SGStorageEvent structuredData](self, "structuredData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[SGStorageEvent state](self, "state");
  BYTE4(v33) = -[SGStorageEvent curated](self, "curated");
  LODWORD(v33) = v30;
  v31 = -[SGStorageEvent initWithRecordId:duplicateKey:sourceKey:content:title:creationTimestamp:lastModifiedTimestamp:tags:when:locations:structuredData:state:curated:](v35, "initWithRecordId:duplicateKey:sourceKey:content:title:creationTimestamp:lastModifiedTimestamp:tags:when:locations:structuredData:state:curated:", v18, v19, v20, v21, v22, v27, v24, v26, v36, v28, v29, v33);

  return v31;
}

- (unint64_t)geocodingMode
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = self->_tags;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D197F0], "geocodingModeAddressOnly", (_QWORD)v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToEntityTag:", v8);

        if ((v9 & 1) != 0)
        {
          v14 = 1;
          goto LABEL_16;
        }
        objc_msgSend(MEMORY[0x1E0D197F0], "geocodingModePOIOnly");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v7, "isEqualToEntityTag:", v10);

        if ((v11 & 1) != 0)
        {
          v14 = 2;
          goto LABEL_16;
        }
        objc_msgSend(MEMORY[0x1E0D197F0], "geocodingModeAddressThenPOI");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v7, "isEqualToEntityTag:", v12);

        if ((v13 & 1) != 0)
        {
          v14 = 3;
          goto LABEL_16;
        }
      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_16:

  return v14;
}

- (id)poiFilters
{
  NSSet *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_tags;
  v3 = (void *)-[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isPOIFilters", (_QWORD)v8) & 1) != 0)
        {
          objc_msgSend(v6, "value");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)-[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)loggingIdentifier
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  if (self->_duplicateKey)
    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tu"), -[SGDuplicateKey hash](self->_duplicateKey, "hash"));
  else
    v2 = &stru_1E7DB83A8;
  if ((unint64_t)-[__CFString length](v2, "length") > 0xC)
  {
    -[__CFString substringWithRange:](v2, "substringWithRange:", 0, 12);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (BOOL)heuristicUpdatingEnabled
{
  void *v3;
  void *v4;
  void *v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1C3BD4F6C](self, a2);
  objc_msgSend(MEMORY[0x1E0D198F0], "disabledEventUpdateCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D197F0], "entityTagToEventCategoryMapping");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_tags;
    v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 && (objc_msgSend(v4, "containsObject:", v11) & 1) != 0)
          {

            v12 = 0;
            goto LABEL_14;
          }

        }
        v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
    v12 = 1;
LABEL_14:

  }
  else
  {
    v12 = 1;
  }

  objc_autoreleasePoolPop(v3);
  return v12;
}

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (SGDuplicateKey)duplicateKey
{
  return self->_duplicateKey;
}

- (NSString)sourceKey
{
  return self->_sourceKey;
}

- (NSString)content
{
  return self->_content;
}

- (NSString)title
{
  return self->_title;
}

- (SGUnixTimestamp_)creationTimestamp
{
  return self->_creationTimestamp;
}

- (SGUnixTimestamp_)lastModifiedTimestamp
{
  return self->_lastModifiedTimestamp;
}

- (SGSimpleTimeRange)when
{
  return self->_when;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSSet)tags
{
  return self->_tags;
}

- (NSData)structuredData
{
  return self->_structuredData;
}

- (unsigned)state
{
  return self->_state;
}

- (BOOL)curated
{
  return self->_curated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structuredData, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_when, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_sourceKey, 0);
  objc_storeStrong((id *)&self->_duplicateKey, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
}

uint64_t __43__SGStorageEvent_convertToEventWithOrigin___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "convertToLocationWithId:origin:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40));
}

+ (id)storageEventFromEntity:(id)a3
{
  id v3;
  SGStorageEvent *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v18;
  SGStorageEvent *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a3;
  v4 = [SGStorageEvent alloc];
  objc_msgSend(v3, "recordId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duplicateKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "creationTimestamp");
  v8 = v7;
  objc_msgSend(v3, "lastModifiedTimestamp");
  v10 = v9;
  objc_msgSend(v3, "tags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "structuredData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "state");
  objc_msgSend(v3, "duplicateKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE4(v18) = objc_msgSend(v16, "entityType") == 1;
  LODWORD(v18) = v15;
  v19 = -[SGStorageEvent initWithRecordId:duplicateKey:sourceKey:content:title:creationTimestamp:lastModifiedTimestamp:tags:when:locations:structuredData:state:curated:](v4, "initWithRecordId:duplicateKey:sourceKey:content:title:creationTimestamp:lastModifiedTimestamp:tags:when:locations:structuredData:state:curated:", v5, v6, v22, v21, v20, v11, v8, v10, v12, v13, v14, v18);

  return v19;
}

@end
