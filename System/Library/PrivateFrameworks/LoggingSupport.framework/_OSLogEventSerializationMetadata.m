@implementation _OSLogEventSerializationMetadata

- (_OSLogEventSerializationMetadata)init
{
  _OSLogEventSerializationMetadata *v2;
  uint64_t v3;
  NSMutableDictionary *stringToIndexMapping;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_OSLogEventSerializationMetadata;
  v2 = -[_OSLogEventSerializationMetadata init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    stringToIndexMapping = v2->_stringToIndexMapping;
    v2->_stringToIndexMapping = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (_OSLogEventSerializationMetadata)initWithDataRepresentation:(id)a3
{
  id v4;
  _OSLogEventSerializationMetadata *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  int v12;
  _OSLogEventSerializationMetadata *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  id v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_OSLogEventSerializationMetadata;
  v5 = -[_OSLogEventSerializationMetadata init](&v32, sel_init);
  if (v5)
  {
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v31);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v31;
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 0;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = v6;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Version"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && !objc_msgSend(v11, "unsignedIntValue"))
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Flags"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_flags = (unint64_t)v15;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MaxLogEventBatchSize"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_maxLogEventBatchSize = (unint64_t)v16;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SerializedEventCount"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_serializedEventCount = (unint64_t)v17;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FilterPredicateDescription"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_storeStrong((id *)&v5->_filterPredicateDescription, v18);
        }
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FirstDate"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_storeStrong((id *)&v5->_firstDate, v19);
        }
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LastDate"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_storeStrong((id *)&v5->_lastDate, v20);
        }
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("StringIndex"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = 0;
          v28 = &v27;
          v29 = 0x2020000000;
          v30 = 0;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __63___OSLogEventSerializationMetadata_initWithDataRepresentation___block_invoke;
          v24[3] = &unk_1E4157E48;
          v26 = &v27;
          v23 = v22;
          v25 = v23;
          objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v24);
          if (*((_BYTE *)v28 + 24))
          {
            v12 = 1;
          }
          else
          {
            objc_storeStrong((id *)&v5->_indexToStringMapping, v22);
            v12 = 0;
          }

          _Block_object_dispose(&v27, 8);
        }
        else
        {
          v12 = 1;
        }

      }
      else
      {
        v12 = 1;
      }

      if (!v12)
        goto LABEL_13;
    }
    else
    {

    }
    v13 = 0;
    goto LABEL_16;
  }
LABEL_13:
  v13 = v5;
LABEL_16:

  return v13;
}

- (id)dataRepresentation
{
  void *v3;
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
  void *v15;
  id v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("Version");
  v24[1] = CFSTR("StringIndex");
  v25[0] = &unk_1E41653E0;
  -[_OSLogEventSerializationMetadata stringToIndexMapping](self, "stringToIndexMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[_OSLogEventSerializationMetadata firstDate](self, "firstDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_OSLogEventSerializationMetadata firstDate](self, "firstDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("FirstDate"));

  }
  -[_OSLogEventSerializationMetadata lastDate](self, "lastDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_OSLogEventSerializationMetadata lastDate](self, "lastDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("LastDate"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_OSLogEventSerializationMetadata flags](self, "flags"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("Flags"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_OSLogEventSerializationMetadata maxLogEventBatchSize](self, "maxLogEventBatchSize"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("MaxLogEventBatchSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_OSLogEventSerializationMetadata serializedEventCount](self, "serializedEventCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("SerializedEventCount"));

  -[_OSLogEventSerializationMetadata filterPredicateDescription](self, "filterPredicateDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_OSLogEventSerializationMetadata filterPredicateDescription](self, "filterPredicateDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("FilterPredicateDescription"));

  }
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, &v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v16)
    {
      if (v18)
      {
        objc_msgSend(v16, "localizedDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v19;
        _os_log_error_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Serializing metadata failed with an error: %@", buf, 0xCu);

      }
    }
    else if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Serializing metadata failed without detailed error", buf, 2u);
    }
  }

  return v15;
}

- (id)indexForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[_OSLogEventSerializationMetadata stringToIndexMapping](self, "stringToIndexMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[_OSLogEventSerializationMetadata stringToIndexMapping](self, "stringToIndexMapping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_OSLogEventSerializationMetadata stringToIndexMapping](self, "stringToIndexMapping");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v4);

  }
  return v6;
}

- (id)stringForIndex:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  -[_OSLogEventSerializationMetadata indexToStringMapping](self, "indexToStringMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 178, CFSTR("Invalid index-to-string mapping"));

  }
  return v7;
}

- (NSMutableDictionary)indexToStringMapping
{
  return self->_indexToStringMapping;
}

- (NSMutableDictionary)stringToIndexMapping
{
  return self->_stringToIndexMapping;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSString)filterPredicateDescription
{
  return self->_filterPredicateDescription;
}

- (void)setFilterPredicateDescription:(id)a3
{
  objc_storeStrong((id *)&self->_filterPredicateDescription, a3);
}

- (unint64_t)maxLogEventBatchSize
{
  return self->_maxLogEventBatchSize;
}

- (void)setMaxLogEventBatchSize:(unint64_t)a3
{
  self->_maxLogEventBatchSize = a3;
}

- (unint64_t)serializedEventCount
{
  return self->_serializedEventCount;
}

- (void)setSerializedEventCount:(unint64_t)a3
{
  self->_serializedEventCount = a3;
}

- (NSDate)firstDate
{
  return self->_firstDate;
}

- (void)setFirstDate:(id)a3
{
  objc_storeStrong((id *)&self->_firstDate, a3);
}

- (NSDate)lastDate
{
  return self->_lastDate;
}

- (void)setLastDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDate, 0);
  objc_storeStrong((id *)&self->_firstDate, 0);
  objc_storeStrong((id *)&self->_filterPredicateDescription, 0);
  objc_storeStrong((id *)&self->_stringToIndexMapping, 0);
  objc_storeStrong((id *)&self->_indexToStringMapping, 0);
}

@end
