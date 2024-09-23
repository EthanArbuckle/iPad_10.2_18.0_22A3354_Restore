@implementation SGEntity

- (SGEntity)init
{
  SGEntity *v2;
  SGEntity *v3;
  SGRecordId *recordId;
  uint64_t v5;
  NSMutableSet *tags;
  uint64_t v7;
  NSMutableSet *locations;
  uint64_t v9;
  SGExtractionInfo *extractionInfo;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SGEntity;
  v2 = -[SGEntity init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    recordId = v2->_recordId;
    v2->_recordId = 0;

    v3->_state = 1;
    v5 = objc_opt_new();
    tags = v3->_tags;
    v3->_tags = (NSMutableSet *)v5;

    v7 = objc_opt_new();
    locations = v3->_locations;
    v3->_locations = (NSMutableSet *)v7;

    v3->_quality = 1.0;
    v3->_contentRangeOfInterest = (_NSRange)xmmword_1C385A570;
    pthread_mutex_init(&v3->_tagsLock, 0);
    objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 0, 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    extractionInfo = v3->_extractionInfo;
    v3->_extractionInfo = (SGExtractionInfo *)v9;

  }
  return v3;
}

- (SGEntity)initWithEntity:(id)a3
{
  id v4;
  SGEntity *v5;
  uint64_t v6;
  SGRecordId *recordId;
  uint64_t v8;
  SGDuplicateKey *duplicateKey;
  uint64_t v10;
  SGExtractionInfo *extractionInfo;
  uint64_t v12;
  NSString *sourceKey;
  uint64_t v14;
  NSString *content;
  NSUInteger v16;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  CSPerson *author;
  double v21;
  double v22;
  uint64_t v23;
  SGSimpleTimeRange *timeRange;
  uint64_t v25;
  NSData *structuredData;
  double v27;
  uint64_t v28;
  NSMutableSet *locations;

  v4 = a3;
  v5 = -[SGEntity init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "recordId");
    v6 = objc_claimAutoreleasedReturnValue();
    recordId = v5->_recordId;
    v5->_recordId = (SGRecordId *)v6;

    objc_msgSend(v4, "duplicateKey");
    v8 = objc_claimAutoreleasedReturnValue();
    duplicateKey = v5->_duplicateKey;
    v5->_duplicateKey = (SGDuplicateKey *)v8;

    objc_msgSend(v4, "extractionInfo");
    v10 = objc_claimAutoreleasedReturnValue();
    extractionInfo = v5->_extractionInfo;
    v5->_extractionInfo = (SGExtractionInfo *)v10;

    objc_msgSend(v4, "sourceKey");
    v12 = objc_claimAutoreleasedReturnValue();
    sourceKey = v5->_sourceKey;
    v5->_sourceKey = (NSString *)v12;

    objc_msgSend(v4, "content");
    v14 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (NSString *)v14;

    v5->_contentRangeOfInterest.location = objc_msgSend(v4, "contentRangeOfInterest");
    v5->_contentRangeOfInterest.length = v16;
    objc_msgSend(v4, "title");
    v17 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v17;

    objc_msgSend(v4, "author");
    v19 = objc_claimAutoreleasedReturnValue();
    author = v5->_author;
    v5->_author = (CSPerson *)v19;

    objc_msgSend(v4, "creationTimestamp");
    v5->_creationTimestamp.secondsFromUnixEpoch = v21;
    objc_msgSend(v4, "lastModifiedTimestamp");
    v5->_lastModifiedTimestamp.secondsFromUnixEpoch = v22;
    objc_msgSend(v4, "timeRange");
    v23 = objc_claimAutoreleasedReturnValue();
    timeRange = v5->_timeRange;
    v5->_timeRange = (SGSimpleTimeRange *)v23;

    objc_msgSend(v4, "structuredData");
    v25 = objc_claimAutoreleasedReturnValue();
    structuredData = v5->_structuredData;
    v5->_structuredData = (NSData *)v25;

    objc_msgSend(v4, "quality");
    v5->_quality = v27;
    objc_msgSend(v4, "locations");
    v28 = objc_claimAutoreleasedReturnValue();
    locations = v5->_locations;
    v5->_locations = (NSMutableSet *)v28;

    v5->_masterEntityId = objc_msgSend(v4, "masterEntityId");
    v5->_groupId = objc_msgSend(v4, "groupId");
    v5->_state = objc_msgSend(v4, "state");
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_tagsLock);
  v3.receiver = self;
  v3.super_class = (Class)SGEntity;
  -[SGEntity dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  SGEntity *v4;
  SGEntity *v5;
  BOOL v6;

  v4 = (SGEntity *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGEntity isEqualToEntity:](self, "isEqualToEntity:", v5);

  return v6;
}

- (BOOL)isEqualToEntity:(id)a3
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
  BOOL v25;
  NSString *title;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  char v30;
  double v31;
  double v32;
  SGSimpleTimeRange *timeRange;
  SGSimpleTimeRange *v34;
  SGSimpleTimeRange *v35;
  SGSimpleTimeRange *v36;
  char v37;
  void *v39;
  void *v40;
  NSData *structuredData;
  NSData *v42;
  NSData *v43;
  NSData *v44;
  char v45;
  double quality;
  double v47;
  NSMutableSet *locations;
  NSMutableSet *v49;
  NSMutableSet *v50;
  NSMutableSet *v51;
  char v52;
  int64_t masterEntityId;
  unsigned int state;

  v4 = (id *)a3;
  recordId = self->_recordId;
  v6 = (SGRecordId *)v4[12];
  if (recordId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = recordId;
    v9 = -[SGRecordId isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_27;
  }
  duplicateKey = self->_duplicateKey;
  v11 = (SGDuplicateKey *)v4[13];
  if (duplicateKey == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = duplicateKey;
    v14 = -[SGDuplicateKey isEqual:](v13, "isEqual:", v12);

    if (!v14)
      goto LABEL_27;
  }
  sourceKey = self->_sourceKey;
  v16 = (NSString *)v4[15];
  if (sourceKey == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = sourceKey;
    v19 = -[NSString isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_27;
  }
  content = self->_content;
  v21 = (NSString *)v4[16];
  if (content == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = content;
    v24 = -[NSString isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_27;
  }
  v25 = 0;
  if ((id)self->_contentRangeOfInterest.location == v4[30] && (id)self->_contentRangeOfInterest.length == v4[31])
  {
    title = self->_title;
    v27 = (NSString *)v4[17];
    if (title == v27)
    {

    }
    else
    {
      v28 = v27;
      v29 = title;
      v30 = -[NSString isEqual:](v29, "isEqual:", v28);

      if ((v30 & 1) == 0)
        goto LABEL_27;
    }
    objc_msgSend(v4, "creationTimestamp");
    if (self->_creationTimestamp.secondsFromUnixEpoch != v31)
      goto LABEL_27;
    objc_msgSend(v4, "lastModifiedTimestamp");
    if (self->_lastModifiedTimestamp.secondsFromUnixEpoch != v32)
      goto LABEL_27;
    timeRange = self->_timeRange;
    v34 = (SGSimpleTimeRange *)v4[23];
    if (timeRange == v34)
    {

    }
    else
    {
      v35 = v34;
      v36 = timeRange;
      v37 = -[SGSimpleTimeRange isEqual:](v36, "isEqual:", v35);

      if ((v37 & 1) == 0)
      {
LABEL_27:
        v25 = 0;
        goto LABEL_28;
      }
    }
    -[SGEntity tags](self, "tags");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tags");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v39, "isEqual:", v40))
      goto LABEL_42;
    structuredData = self->_structuredData;
    v42 = (NSData *)v4[24];
    if (structuredData == v42)
    {

    }
    else
    {
      v43 = v42;
      v44 = structuredData;
      v45 = -[NSData isEqual:](v44, "isEqual:", v43);

      if ((v45 & 1) == 0)
        goto LABEL_42;
    }
    quality = self->_quality;
    objc_msgSend(v4, "quality");
    if (quality == v47)
    {
      locations = self->_locations;
      v49 = (NSMutableSet *)v4[26];
      if (locations == v49)
      {

      }
      else
      {
        v50 = v49;
        v51 = locations;
        v52 = -[NSMutableSet isEqual:](v51, "isEqual:", v50);

        if ((v52 & 1) == 0)
          goto LABEL_42;
      }
      masterEntityId = self->_masterEntityId;
      if (masterEntityId == objc_msgSend(v4, "masterEntityId"))
      {
        state = self->_state;
        v25 = state == objc_msgSend(v4, "state");
LABEL_43:

        goto LABEL_28;
      }
    }
LABEL_42:
    v25 = 0;
    goto LABEL_43;
  }
LABEL_28:

  return v25;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[SGRecordId hash](self->_recordId, "hash");
  v4 = -[SGDuplicateKey hash](self->_duplicateKey, "hash") - v3 + 32 * v3;
  return -[NSString hash](self->_sourceKey, "hash") - v4 + 32 * v4;
}

- (void)validate
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  -[SGEntity duplicateKey](self, "duplicateKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGEntity.m"), 120, CFSTR("entityKey can't be nil."));

  }
  -[SGEntity duplicateKey](self, "duplicateKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "entityType");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGEntity.m"), 121, CFSTR("entityType must not be SGEntityTypeUnknown"));

  }
  -[SGEntity duplicateKey](self, "duplicateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "entityType");

  if (v9 == 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGEntity.m"), 122, CFSTR("entityType must not be SGEntityTypeDetectedEmailAddress"));

  }
}

- (id)loadOrigin:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D198C8], "originForDuplicateKey:sourceKey:store:", self->_duplicateKey, self->_sourceKey, a3);
}

- (BOOL)isNaturalLanguageEvent
{
  void *v2;
  void *v3;
  char v4;

  -[SGEntity tags](self, "tags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "naturalLanguageEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)isCancelled
{
  void *v2;
  void *v3;
  char v4;

  -[SGEntity tags](self, "tags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "extractedEventCancellation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)hasExtractionException
{
  void *v2;
  void *v3;
  char v4;

  -[SGEntity tags](self, "tags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "templateException");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)isFromForwardedMessage
{
  void *v2;
  void *v3;
  char v4;

  -[SGEntity tags](self, "tags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "fromForwardedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)setAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (void)addTag:(id)a3
{
  NSSet *tagsSnapshot;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGEntity.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tag"));

  }
  pthread_mutex_lock(&self->_tagsLock);
  if ((-[NSMutableSet containsObject:](self->_tags, "containsObject:", v7) & 1) == 0)
  {
    tagsSnapshot = self->_tagsSnapshot;
    self->_tagsSnapshot = 0;

    -[NSMutableSet addObject:](self->_tags, "addObject:", v7);
  }
  pthread_mutex_unlock(&self->_tagsLock);

}

- (void)removeTag:(id)a3
{
  NSSet *tagsSnapshot;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGEntity.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tag"));

  }
  pthread_mutex_lock(&self->_tagsLock);
  if (-[NSMutableSet containsObject:](self->_tags, "containsObject:", v7))
  {
    tagsSnapshot = self->_tagsSnapshot;
    self->_tagsSnapshot = 0;

    -[NSMutableSet removeObject:](self->_tags, "removeObject:", v7);
  }
  pthread_mutex_unlock(&self->_tagsLock);

}

- (id)tags
{
  _opaque_pthread_mutex_t *p_tagsLock;
  NSSet *tagsSnapshot;
  NSSet *v5;
  NSSet *v6;
  NSSet *v7;

  p_tagsLock = &self->_tagsLock;
  pthread_mutex_lock(&self->_tagsLock);
  tagsSnapshot = self->_tagsSnapshot;
  if (!tagsSnapshot)
  {
    v5 = (NSSet *)-[NSMutableSet copy](self->_tags, "copy");
    v6 = self->_tagsSnapshot;
    self->_tagsSnapshot = v5;

    tagsSnapshot = self->_tagsSnapshot;
  }
  v7 = tagsSnapshot;
  pthread_mutex_unlock(p_tagsLock);
  return v7;
}

- (BOOL)hasTag:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SGEntity tags](self, "tags", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isEqualToEntityTag:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)extraKeyTag
{
  id v2;
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
  -[SGEntity tags](self, "tags");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        if (objc_msgSend(v6, "isExtraKey", (_QWORD)v8))
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)templateShortName
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SGEntity tags](self, "tags");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isTemplateShortName", (_QWORD)v9))
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v3, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isInhuman
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[SGEntity tags](self, "tags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "inhuman");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "containsObject:", v3))
  {
    objc_msgSend(MEMORY[0x1E0D197F0], "human");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v2, "containsObject:", v4) ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isPartiallyDownloaded
{
  void *v2;
  void *v3;
  char v4;

  -[SGEntity tags](self, "tags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "isPartiallyDownloaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)fieldsToSaveOnConfirmation
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *content;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", title, CFSTR("summary"));
  content = self->_content;
  if (content)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", content, CFSTR("description"));
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGEntity duplicateKey](self, "duplicateKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEntity sourceKey](self, "sourceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEntity title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGEntity:%@,sourceKey=%@,title=%@>"), v4, v5, v6);

  return v7;
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

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (void)setRecordId:(id)a3
{
  objc_storeStrong((id *)&self->_recordId, a3);
}

- (SGDuplicateKey)duplicateKey
{
  return self->_duplicateKey;
}

- (void)setDuplicateKey:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateKey, a3);
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (void)setExtractionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_extractionInfo, a3);
}

- (NSString)sourceKey
{
  return self->_sourceKey;
}

- (void)setSourceKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (_NSRange)contentRangeOfInterest
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_contentRangeOfInterest.length;
  location = self->_contentRangeOfInterest.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setContentRangeOfInterest:(_NSRange)a3
{
  self->_contentRangeOfInterest = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)authorNickname
{
  return self->_authorNickname;
}

- (void)setAuthorNickname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)authorPhotoPath
{
  return self->_authorPhotoPath;
}

- (void)setAuthorPhotoPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (CSPerson)author
{
  return self->_author;
}

- (SGUnixTimestamp_)creationTimestamp
{
  return self->_creationTimestamp;
}

- (void)setCreationTimestamp:(SGUnixTimestamp_)a3
{
  self->_creationTimestamp = a3;
}

- (SGUnixTimestamp_)lastModifiedTimestamp
{
  return self->_lastModifiedTimestamp;
}

- (void)setLastModifiedTimestamp:(SGUnixTimestamp_)a3
{
  self->_lastModifiedTimestamp = a3;
}

- (SGSimpleTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (NSData)structuredData
{
  return self->_structuredData;
}

- (void)setStructuredData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (double)quality
{
  return self->_quality;
}

- (void)setQuality:(double)a3
{
  self->_quality = a3;
}

- (NSMutableSet)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_storeStrong((id *)&self->_locations, a3);
}

- (int64_t)masterEntityId
{
  return self->_masterEntityId;
}

- (void)setMasterEntityId:(int64_t)a3
{
  self->_masterEntityId = a3;
}

- (int64_t)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(int64_t)a3
{
  self->_groupId = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (NSString)operatingSystemVersion
{
  return self->_operatingSystemVersion;
}

- (void)setOperatingSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatingSystemVersion, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_structuredData, 0);
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_authorPhotoPath, 0);
  objc_storeStrong((id *)&self->_authorNickname, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_sourceKey, 0);
  objc_storeStrong((id *)&self->_extractionInfo, 0);
  objc_storeStrong((id *)&self->_duplicateKey, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_tagsSnapshot, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

@end
