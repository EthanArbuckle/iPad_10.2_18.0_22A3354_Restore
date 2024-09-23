@implementation _DKEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 identifierStringValue:(id)a7 confidence:(double)a8 metadata:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _DKEvent *v28;
  NSObject *v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  +[_DKAnyStringIdentifier type](_DKAnyStringIdentifier, "type");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventValueType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    goto LABEL_4;
  objc_msgSend(v15, "eventValueType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend((id)objc_msgSend(v23, "objectClass"), "isEqual:", objc_opt_class());

  if (v24)
  {
    objc_msgSend(v15, "eventValueType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKObjectType objectTypeWithTypeCode:](_DKIdentifierType, "objectTypeWithTypeCode:", objc_msgSend(v25, "typeCode"));
    v26 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v26;
LABEL_4:
    +[_DKIdentifier identifierWithString:type:](_DKIdentifier, "identifierWithString:type:", v19, v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[_DKEvent initWithStream:source:startDate:endDate:value:confidence:metadata:]([_DKEvent alloc], "initWithStream:source:startDate:endDate:value:confidence:metadata:", v15, v16, v17, v18, v27, v20, a8);

    goto LABEL_8;
  }
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    +[_DKEvent eventWithStream:source:startDate:endDate:identifierStringValue:confidence:metadata:].cold.1(v15);

  v28 = 0;
LABEL_8:

  return v28;
}

- (id)stringValue
{
  void *v2;
  void *v3;

  -[_DKEvent value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)compareValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_DKEvent value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EE0DC280);

    if (!v7)
    {
LABEL_11:
      v10 = -1;
      goto LABEL_12;
    }
    -[_DKEvent value](self, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compareValue:", v9);

    if (!v10)
    {
      -[_DKEvent metadata](self, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {

        goto LABEL_8;
      }
      objc_msgSend(v5, "metadata");
      v10 = objc_claimAutoreleasedReturnValue();

      if (v10)
      {
LABEL_8:
        -[_DKEvent metadata](self, "metadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v5, "metadata");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            -[_DKEvent metadata](self, "metadata");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "metadata");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isEqualToDictionary:", v15);

            v10 = v16 - 1;
          }
          else
          {
            v10 = 1;
          }
          goto LABEL_12;
        }
        goto LABEL_11;
      }
    }
LABEL_12:

    goto LABEL_13;
  }
  v10 = -1;
LABEL_13:

  return v10;
}

- (_DKObject)value
{
  return (_DKObject *)objc_getProperty(self, a2, 72, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (_DKEvent)initWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 value:(id)a7 confidence:(double)a8 metadata:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  _DKEvent *v27;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  objc_msgSend(v16, "eventValueType");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    v24 = objc_opt_class();
    objc_msgSend(v16, "eventValueType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = objc_msgSend((id)v24, "isEqual:", objc_msgSend(v25, "objectClass"));

    if ((v24 & 1) == 0)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[_DKEvent initWithStream:source:startDate:endDate:value:confidence:metadata:].cold.2(v16, (uint64_t)v20, v26);
      goto LABEL_9;
    }
  }
  if (objc_msgSend(v18, "compare:", v19) == 1)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[_DKEvent initWithStream:source:startDate:endDate:value:confidence:metadata:].cold.1();
LABEL_9:

    v27 = 0;
    goto LABEL_10;
  }
  self = (_DKEvent *)-[_DKEvent _initWithStream:source:startDate:endDate:value:confidence:metadata:](self, "_initWithStream:source:startDate:endDate:value:confidence:metadata:", v16, v17, v18, v19, v20, v21, a8);
  v27 = self;
LABEL_10:

  return v27;
}

- (id)_initWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 value:(id)a7 confidence:(double)a8 metadata:(id)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  _DKEvent *v21;
  _DKEvent *v22;
  void *v23;
  uint64_t v24;
  NSTimeZone *timeZone;
  void *v26;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v17 = a4;
  v28 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v30.receiver = self;
  v30.super_class = (Class)_DKEvent;
  v21 = -[_DKObject init](&v30, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_stream, a3);
    objc_storeStrong((id *)&v22->_startDate, a5);
    objc_storeStrong((id *)&v22->_endDate, a6);
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone", v28, v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    timeZone = v22->_timeZone;
    v22->_timeZone = (NSTimeZone *)v24;

    objc_storeStrong((id *)&v22->_value, a7);
    objc_storeStrong((id *)&v22->_metadata, a9);
    v22->_confidence = a8;
    -[_DKObject setSource:](v22, "setSource:", v17);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKObject setUUID:](v22, "setUUID:", v26);

  }
  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *metadata;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_DKEvent;
  -[_DKObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_stream, CFSTR("stream"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("confidence"), self->_confidence);
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldSync, CFSTR("shouldSync"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_compatibilityVersion, CFSTR("compatibilityVersion"));
  metadata = self->_metadata;
  if (metadata && -[NSDictionary count](metadata, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));

}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (id)toPBCodableUseStructuredMetadata:(BOOL)a3
{
  _DKPREvent *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _DKEvent *v29;
  uint64_t v30;
  _UNKNOWN **v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  _UNKNOWN **v39;
  _DKEvent *v40;
  _DKPREvent *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int *v47;
  id obj;
  void *v49;
  _BOOL4 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[4];
  int v56;
  _BYTE v57[128];
  uint64_t v58;

  v50 = a3;
  v58 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(_DKPREvent);
  -[_DKEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  -[_DKPREvent setStartDate:]((uint64_t)v4, v6);

  -[_DKEvent endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  -[_DKPREvent setEndDate:]((uint64_t)v4, v8);

  -[_DKEvent value](self, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toPBCodable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPREvent setValue:]((uint64_t)v4, v10);

  -[_DKEvent stream](self, "stream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "toPBCodable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPREvent setStream:]((uint64_t)v4, v12);

  -[_DKObject UUID](self, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPREvent setIdentifier:]((uint64_t)v4, v14);

  -[_DKObject source](self, "source");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "toPBCodable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPREvent setSource:]((uint64_t)v4, v16);

  -[_DKObject creationDate](self, "creationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  -[_DKPREvent setCreationDate:]((uint64_t)v4, v18);

  -[_DKEvent timeZone](self, "timeZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[_DKEvent timeZone](self, "timeZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKPREvent setTimeZone:]((uint64_t)v4, objc_msgSend(v20, "secondsFromGMT"));

  }
  if (-[_DKEvent compatibilityVersion](self, "compatibilityVersion"))
    -[_DKPREvent setCompatibilityVersion:]((uint64_t)v4, -[_DKEvent compatibilityVersion](self, "compatibilityVersion"));
  -[_DKEvent confidence](self, "confidence");
  if (v21 != 1.0)
  {
    -[_DKEvent confidence](self, "confidence");
    -[_DKPREvent setConfidence:]((uint64_t)v4, v22);
  }
  -[_DKEvent metadata](self, "metadata");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_DKEvent metadata](self, "metadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      -[_DKEvent metadata](self, "metadata");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      if (v27)
      {
        v28 = v27;
        v29 = self;
        v30 = *(_QWORD *)v52;
        v47 = &v56;
        v31 = &off_1E26E0000;
        do
        {
          v32 = 0;
          do
          {
            if (*(_QWORD *)v52 != v30)
              objc_enumerationMutation(obj);
            v33 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v32);
            -[_DKEvent metadata](v29, "metadata", v47);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectForKeyedSubscript:", v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v36 = objc_alloc_init((Class)v31[414]);
            if (!v50)
              goto LABEL_17;
            +[_DKMetadataPersistenceLookupTable keyToIndex]();
            v49 = v35;
            v37 = v28;
            v38 = v30;
            v39 = v31;
            v40 = v29;
            v41 = v4;
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectForKeyedSubscript:", v33);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            v4 = v41;
            v29 = v40;
            v31 = v39;
            v30 = v38;
            v28 = v37;
            v35 = v49;
            if (v43)
            {
              -[_DKPRMetadataEntry setIndex:]((uint64_t)v36, objc_msgSend(v43, "unsignedIntValue"));
              -[_DKPRMetadataEntry setKey:]((uint64_t)v36, &stru_1E26E9728);

            }
            else
            {
LABEL_17:
              -[_DKPRMetadataEntry setKey:]((uint64_t)v36, v33);
            }
            objc_msgSend(v35, "toPBCodable");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKPRMetadataEntry setValue:]((uint64_t)v36, v44);

            -[_DKPRMetadataEntry value]((uint64_t)v36);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            if (v45)
            {
              -[_DKPREvent addMetadata:]((uint64_t)v4, v36);
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              -[_DKEvent(Protobuf) toPBCodableUseStructuredMetadata:].cold.1(v55, (uint64_t)v33, v47);
            }

            ++v32;
          }
          while (v28 != v32);
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        }
        while (v28);
      }

    }
  }
  return v4;
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 80, 1);
}

- (_DKEventStream)stream
{
  return (_DKEventStream *)objc_getProperty(self, a2, 64, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (double)confidence
{
  return self->_confidence;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (BOOL)shouldSync
{
  return self->_shouldSync;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setShouldSync:(BOOL)a3
{
  self->_shouldSync = a3;
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->_compatibilityVersion = a3;
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 value:(id)a7 confidence:(double)a8 metadata:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _DKEvent *v21;

  v15 = a9;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = -[_DKEvent initWithStream:source:startDate:endDate:value:confidence:metadata:]([_DKEvent alloc], "initWithStream:source:startDate:endDate:value:confidence:metadata:", v20, v19, v18, v17, v16, v15, a8);

  return v21;
}

+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 value:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _DKEvent *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[_DKEvent initWithStream:source:startDate:endDate:value:confidence:metadata:]([_DKEvent alloc], "initWithStream:source:startDate:endDate:value:confidence:metadata:", v12, 0, v11, v10, v9, 0, 1.0);

  return v13;
}

+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 value:(id)a6 metadata:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _DKEvent *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[_DKEvent initWithStream:source:startDate:endDate:value:confidence:metadata:]([_DKEvent alloc], "initWithStream:source:startDate:endDate:value:confidence:metadata:", v15, 0, v14, v13, v12, v11, 1.0);

  return v16;
}

+ (id)entityName
{
  return CFSTR("Event");
}

+ (id)keyPathForMOKeyPath:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    if (objc_msgSend(v2, "hasPrefix:", CFSTR("value")))
    {
      objc_msgSend(v2, "substringFromIndex:", objc_msgSend(CFSTR("value"), "length"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "substringToIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", 0, 1, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("value.%@Value"), v13);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = v2;
    }
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("structuredMetadata"));

    if (v5)
    {
      +[_DKMetadataPersistenceLookupTable attributeToKey]();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("metadata.%@"), v8);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 identifierStringValue:(id)a7 metadata:(id)a8
{
  return (_DKEvent *)objc_msgSend(a1, "eventWithStream:source:startDate:endDate:identifierStringValue:confidence:metadata:", a3, a4, a5, a6, a7, a8, 1.0);
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v36.receiver = self,
        v36.super_class = (Class)_DKEvent,
        -[_DKObject copyToManagedObject:](&v36, sel_copyToManagedObject_, v4)))
  {
    v5 = v4;
    -[_DKEvent stream](self, "stream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStreamName:", v7);

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKEvent timeZone](self, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSecondsFromGMT:", objc_msgSend(v9, "secondsFromGMT"));

    -[_DKEvent startDate](self, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "setStartDate:");

    objc_msgSend(v5, "startDate");
    objc_msgSend(v5, "setStartSecondOfDay:", ((int)(uint64_t)v11 % 86400));
    -[_DKEvent startDate](self, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "components:fromDate:", 512, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStartDayOfWeek:", (__int16)objc_msgSend(v13, "weekday"));

    -[_DKEvent endDate](self, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "setEndDate:");

    objc_msgSend(v5, "endDate");
    objc_msgSend(v5, "setEndSecondOfDay:", ((int)(uint64_t)v15 % 86400));
    -[_DKEvent endDate](self, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "components:fromDate:", 512, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEndDayOfWeek:", (__int16)objc_msgSend((id)v17, "weekday"));

    objc_msgSend(v5, "setShouldSync:", -[_DKEvent shouldSync](self, "shouldSync"));
    -[_DKEvent confidence](self, "confidence");
    objc_msgSend(v5, "setConfidence:");
    objc_msgSend(v5, "setCompatibilityVersion:", -[_DKEvent compatibilityVersion](self, "compatibilityVersion"));
    -[_DKEvent value](self, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValueInteger:", objc_msgSend(v18, "integerValue"));

    -[_DKEvent value](self, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    objc_msgSend(v5, "setValueDouble:");

    -[_DKEvent value](self, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v17) = objc_opt_isKindOfClass();

    if ((v17 & 1) != 0)
    {
      -[_DKEvent value](self, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValueString:", v22);

    }
    v23 = (void *)objc_opt_class();
    -[_DKEvent metadata](self, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "copyMetadata:toManagedObject:", v24, v5);

    -[_DKEvent value](self, "value");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[_DKEvent eventValueClassOf:](self, "eventValueClassOf:", v25);

    objc_msgSend(v5, "setValueClass:", (__int16)v26);
    if (v26)
    {
      -[_DKEvent value](self, "value");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValueTypeCode:", objc_msgSend(v27, "typeCode"));
      v28 = 1;
    }
    else
    {
      objc_msgSend(v5, "setValueClass:", 0);
      v29 = (void *)MEMORY[0x1E0C97B20];
      -[_DKEvent value](self, "value");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "entityName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "managedObjectContext");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "insertNewObjectForEntityForName:inManagedObjectContext:", v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:", v33);

      -[_DKEvent value](self, "value");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "copyToManagedObject:", v34);

    }
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (unint64_t)eventValueClassOf:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = 2;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v5 = 3;
        else
          v5 = 0;
      }
    }
  }

  return v5;
}

+ (BOOL)copyMetadata:(id)a3 toManagedObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _DKStructuredMetadataMO *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _DKStructuredMetadataMO *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  id v46;
  char isKindOfClass;
  id obj;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v54;
  uint8_t v55;
  _BYTE v56[15];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v5 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
    goto LABEL_46;
  v46 = v5;
  v6 = v5;
  +[_DKMetadataPersistenceLookupTable keyToAttribute]();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v52, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  if (!v53)
  {
    v8 = 0;
    goto LABEL_44;
  }
  v8 = 0;
  v50 = *(_QWORD *)v58;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v58 != v50)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v9);
      objc_msgSend(v52, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = (void *)MEMORY[0x1E0CB3940];
          v22 = v11;
          +[_CDHashUtilities md5ForString:](_CDHashUtilities, "md5ForString:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@S"), v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "managedObjectContext");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKEvent fetchCustomMetadataWithName:valueHash:context:](_DKEvent, "fetchCustomMetadataWithName:valueHash:context:", v10, v24, v25);
          v26 = objc_claimAutoreleasedReturnValue();

          -[NSObject setStringValue:](v26, "setStringValue:", v22);
LABEL_25:

          objc_msgSend(v6, "addCustomMetadataObject:", v26);
          objc_msgSend(v6, "setHasCustomMetadata:", 1);
          if ((objc_msgSend(v10, "hasPrefix:", CFSTR("test")) & 1) == 0)
          {
            +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v6, "streamName");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = (objc_class *)objc_opt_class();
              NSStringFromClass(v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v62 = v39;
              v63 = 2112;
              v64 = v10;
              v65 = 2112;
              v66 = v41;
              _os_log_impl(&dword_18DDBE000, v38, OS_LOG_TYPE_DEFAULT, "Using custom metadata path in stream %@ for key '%@'. Value class: %@", buf, 0x20u);

            }
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = v11;
            if (CFNumberIsFloatType((CFNumberRef)v22))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@D"), v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "managedObjectContext");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              +[_DKEvent fetchCustomMetadataWithName:valueHash:context:](_DKEvent, "fetchCustomMetadataWithName:valueHash:context:", v10, v24, v27);
              v26 = objc_claimAutoreleasedReturnValue();

              -[NSObject setDoubleValue:](v26, "setDoubleValue:", v22);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@I"), v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "managedObjectContext");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              +[_DKEvent fetchCustomMetadataWithName:valueHash:context:](_DKEvent, "fetchCustomMetadataWithName:valueHash:context:", v10, v24, v34);
              v26 = objc_claimAutoreleasedReturnValue();

              -[NSObject setIntegerValue:](v26, "setIntegerValue:", v22);
            }
            goto LABEL_25;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = (void *)MEMORY[0x1E0CB3940];
            v22 = v11;
            objc_msgSend(v22, "timeIntervalSinceReferenceDate");
            objc_msgSend(v28, "stringWithFormat:", CFSTR("%fT"), v29);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "managedObjectContext");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            +[_DKEvent fetchCustomMetadataWithName:valueHash:context:](_DKEvent, "fetchCustomMetadataWithName:valueHash:context:", v10, v24, v30);
            v26 = objc_claimAutoreleasedReturnValue();

            -[NSObject setDateValue:](v26, "setDateValue:", v22);
            goto LABEL_25;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v31 = (void *)MEMORY[0x1E0CB3940];
            v22 = v11;
            +[_CDHashUtilities md5ForData:](_CDHashUtilities, "md5ForData:", v22);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "stringWithFormat:", CFSTR("%@B"), v32);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "managedObjectContext");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            +[_DKEvent fetchCustomMetadataWithName:valueHash:context:](_DKEvent, "fetchCustomMetadataWithName:valueHash:context:", v10, v24, v33);
            v26 = objc_claimAutoreleasedReturnValue();

            -[NSObject setBinaryValue:](v26, "setBinaryValue:", v22);
            goto LABEL_25;
          }
          if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EE0D5850))
          {
            objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:", v11);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)MEMORY[0x1E0CB3940];
            +[_CDHashUtilities md5ForData:](_CDHashUtilities, "md5ForData:", v24);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringWithFormat:", CFSTR("%@O"), v36);
            v22 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "managedObjectContext");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            +[_DKEvent fetchCustomMetadataWithName:valueHash:context:](_DKEvent, "fetchCustomMetadataWithName:valueHash:context:", v10, v22, v37);
            v26 = objc_claimAutoreleasedReturnValue();

            -[NSObject setBinaryValue:](v26, "setBinaryValue:", v24);
            goto LABEL_25;
          }
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            +[_DKEvent(MOConversion) copyMetadata:toManagedObject:].cold.2(&v55, v56, v26);
        }

        goto LABEL_30;
      }
      if (!v8)
      {
        v13 = [_DKStructuredMetadataMO alloc];
        +[_DKStructuredMetadataMO entity](_DKStructuredMetadataMO, "entity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "managedObjectContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[_DKStructuredMetadataMO initWithEntity:insertIntoManagedObjectContext:](v13, "initWithEntity:insertIntoManagedObjectContext:", v14, v15);

      }
      -[_DKStructuredMetadataMO entity](v8, "entity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "propertiesByName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "attributeType") == 1000;

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:", v11);
        v20 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v20;
      }
      -[_DKStructuredMetadataMO setValue:forKey:](v8, "setValue:forKey:", v11, v12);
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v11, v10);
LABEL_30:

      ++v9;
    }
    while (v53 != v9);
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    v53 = v42;
  }
  while (v42);

  if (v8)
  {
    v54 = 0;
    +[_CDHashUtilities md5forDictionary:error:](_CDHashUtilities, "md5forDictionary:error:", v49, &v54);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v54;
    if (v43)
    {
      -[_DKStructuredMetadataMO setMetadataHash:](v8, "setMetadataHash:", v43);
      -[_DKStructuredMetadataMO addEventObject:](v8, "addEventObject:", v6);
      objc_msgSend(v6, "setHasStructuredMetadata:", 1);
    }
    else
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        +[_DKEvent(MOConversion) copyMetadata:toManagedObject:].cold.1();

    }
LABEL_44:

  }
  v5 = v46;
LABEL_46:

  return isKindOfClass & 1;
}

- (_DKEvent)initWithCoder:(id)a3
{
  id v4;
  _DKEvent *v5;
  uint64_t v6;
  _DKEventStream *stream;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  NSDate *endDate;
  uint64_t v12;
  NSTimeZone *timeZone;
  double v14;
  uint64_t v15;
  _DKObject *value;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *metadata;
  _DKEvent *v22;
  objc_super v24;
  _QWORD v25[11];

  v25[10] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_DKEvent;
  v5 = -[_DKObject initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stream"));
    v6 = objc_claimAutoreleasedReturnValue();
    stream = v5->_stream;
    v5->_stream = (_DKEventStream *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v12 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v12;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v5->_confidence = v14;
    v5->_shouldSync = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSync"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v15 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (_DKObject *)v15;

    v5->_compatibilityVersion = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("compatibilityVersion"));
    if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v4, "dk_shouldSkipDecodingMetadata") & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1E0C99E60];
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      v25[2] = objc_opt_class();
      v25[3] = objc_opt_class();
      v25[4] = objc_opt_class();
      v25[5] = objc_opt_class();
      v25[6] = objc_opt_class();
      v25[7] = objc_opt_class();
      v25[8] = objc_opt_class();
      v25[9] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("metadata"));
      v20 = objc_claimAutoreleasedReturnValue();
      metadata = v5->_metadata;
      v5->_metadata = (NSDictionary *)v20;

    }
    v22 = v5;
  }

  return v5;
}

+ (id)relatedContactIdentifiersFromIntent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t isKindOfClass;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "_nonNilParameters");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    v8 = 0x1E0C99000uLL;
    do
    {
      v9 = 0;
      v23 = v6;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(v3, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v9), v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
        {
          v12 = v7;
          v13 = v8;
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v14 = v10;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v26;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v26 != v17)
                  objc_enumerationMutation(v14);
                __63___DKEvent_INInteraction__relatedContactIdentifiersFromIntent___block_invoke(v15, v4, *(void **)(*((_QWORD *)&v25 + 1) + 8 * v18++));
              }
              while (v16 != v18);
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              v16 = v15;
            }
            while (v15);
          }

          v8 = v13;
          v7 = v12;
          v6 = v23;
        }
        else
        {
          __63___DKEvent_INInteraction__relatedContactIdentifiersFromIntent___block_invoke(isKindOfClass, v4, v10);
        }

        ++v9;
      }
      while (v9 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v6);
  }
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    +[_DKEvent(INInteraction) relatedContactIdentifiersFromIntent:].cold.1();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(","));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)metadataForInteraction:(id)a3 storeKeyImage:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKIntentMetadataKey serializedInteraction](_DKIntentMetadataKey, "serializedInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v9);

  objc_msgSend(v6, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_className");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKIntentMetadataKey intentClass](_DKIntentMetadataKey, "intentClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "_type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKIntentMetadataKey intentType](_DKIntentMetadataKey, "intentType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

  objc_msgSend(v10, "verb");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKIntentMetadataKey intentVerb](_DKIntentMetadataKey, "intentVerb");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v16);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "_donatedBySiri"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKIntentMetadataKey donatedBySiri](_DKIntentMetadataKey, "donatedBySiri");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "direction"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKIntentMetadataKey direction](_DKIntentMetadataKey, "direction");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v20);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "intentHandlingStatus"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKIntentMetadataKey intentHandlingStatus](_DKIntentMetadataKey, "intentHandlingStatus");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "shortcutAvailability"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKIntentMetadataKey shortcutAvailability](_DKIntentMetadataKey, "shortcutAvailability");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, v24);

  objc_msgSend(v10, "cd_derivedIntentIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKIntentMetadataKey derivedIntentIdentifier](_DKIntentMetadataKey, "derivedIntentIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, v26);

  if (v4)
  {
    objc_msgSend(v10, "_keyImage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "cd_encodedDataImage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKIntentMetadataKey serializedKeyImage](_DKIntentMetadataKey, "serializedKeyImage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, v29);

  }
  objc_msgSend(v6, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKIntentMetadataKey interactionIdentifier](_DKIntentMetadataKey, "interactionIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, v31);

  objc_msgSend(a1, "relatedContactIdentifiersFromIntent:", v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKIntentMetadataKey relatedContactIdentifiers](_DKIntentMetadataKey, "relatedContactIdentifiers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, v33);

  return v7;
}

+ (_DKEvent)eventWithInteraction:(id)a3 bundleIdentifier:(id)a4 storeKeyImage:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "metadataForInteraction:storeKeyImage:", v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  objc_msgSend(v8, "dateInterval");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "endDate");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = v16;
  v21 = v20;

  +[_DKSource sourceForInteraction:bundleID:](_DKSource, "sourceForInteraction:bundleID:", v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "domain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSystemEventStreams appIntentsStream](_DKSystemEventStreams, "appIntentsStream");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEvent eventWithStream:source:startDate:endDate:identifierStringValue:metadata:](_DKEvent, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v24, v22, v16, v21, v23, v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return (_DKEvent *)v25;
}

+ (_DKEvent)eventWithSearchableItem:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  id v6;
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
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
  {
    +[_DKSource sourceForSearchableItem:bundleID:](_DKSource, "sourceForSearchableItem:bundleID:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "attributeSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[_DKSafariHistoryMetadataKey title](_DKSafariHistoryMetadataKey, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v13;
        v21[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
      +[_DKSystemEventStreams safariHistoryStream](_DKSystemEventStreams, "safariHistoryStream");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKEvent eventWithStream:source:startDate:endDate:identifierStringValue:metadata:](_DKEvent, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v16, v7, v17, v18, v10, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return (_DKEvent *)v15;
}

+ (id)allowedWebpageURLSchemes
{
  if (allowedWebpageURLSchemes_once != -1)
    dispatch_once(&allowedWebpageURLSchemes_once, &__block_literal_global_31);
  return (id)allowedWebpageURLSchemes_result;
}

+ (BOOL)isValidURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:resolvingAgainstBaseURL:", v5, 1);

  if (v6
    && (objc_msgSend(v6, "scheme"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "lowercaseString"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = (void *)objc_msgSend(v8, "copy"),
        v8,
        v7,
        v9))
  {
    objc_msgSend(a1, "allowedWebpageURLSchemes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v9);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)eventRepresentingUserActivityWithSearchableItem:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  intptr_t v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[3];
  _QWORD v49[5];

  v49[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
  {
    v19 = 0;
LABEL_23:
    v19 = v19;
    v30 = v19;
    goto LABEL_24;
  }
  +[_DKSource sourceForSearchableItem:bundleID:](_DKSource, "sourceForSearchableItem:bundleID:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v19 = 0;
LABEL_22:

    goto LABEL_23;
  }
  if ((objc_msgSend(a1, "isValidURL:", v10) & 1) == 0)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[_DKEvent(CSSearchableItem) eventRepresentingUserActivityWithSearchableItem:bundleIdentifier:].cold.2((uint64_t)v10, v20);

    v19 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v6, "attributeSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "title");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0CA5920]);
  v13 = (void *)objc_msgSend(v12, "initWithActivityType:", *MEMORY[0x1E0CB3418]);
  objc_msgSend(v13, "setWebpageURL:", v10);
  objc_msgSend(v13, "setTitle:", v38);
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__9;
  v46 = __Block_byref_object_dispose__9;
  v47 = 0;
  v14 = dispatch_semaphore_create(0);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __95___DKEvent_CSSearchableItem__eventRepresentingUserActivityWithSearchableItem_bundleIdentifier___block_invoke;
  v39[3] = &unk_1E26E4730;
  v41 = &v42;
  v15 = v14;
  v40 = v15;
  objc_msgSend(v13, "_createUserActivityStringsWithOptions:completionHandler:", 0, v39);
  v16 = dispatch_time(0, 1000000000);
  v17 = dispatch_semaphore_wait(v15, v16);
  if (v17)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      +[_DKEvent(CSSearchableItem) eventRepresentingUserActivityWithSearchableItem:bundleIdentifier:].cold.1(v18);
    v19 = 0;
LABEL_8:

    goto LABEL_20;
  }
  if (v43[5])
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 == 0;

    if (!v22)
    {
      +[_DKApplicationActivityMetadataKey itemIdentifier](_DKApplicationActivityMetadataKey, "itemIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v35;
      objc_msgSend(v6, "uniqueIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v33;
      +[_DKApplicationActivityMetadataKey userActivityRequiredString](_DKApplicationActivityMetadataKey, "userActivityRequiredString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v32;
      v49[1] = v43[5];
      +[_DKApplicationActivityMetadataKey isEligibleForPrediction](_DKApplicationActivityMetadataKey, "isEligibleForPrediction");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2] = v23;
      v49[2] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v24, "mutableCopy");

      objc_msgSend(v6, "attributeSet");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "contentDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v6, "attributeSet");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "contentDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKApplicationActivityMetadataKey contentDescription](_DKApplicationActivityMetadataKey, "contentDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v27, v28);

      }
      +[_DKSystemEventStreams appActivityStream](_DKSystemEventStreams, "appActivityStream");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKEvent eventWithStream:source:startDate:endDate:identifierStringValue:metadata:](_DKEvent, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v34, v8, v37, v29, v7, v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  v19 = 0;
LABEL_20:

  _Block_object_dispose(&v42, 8);
  if (!v17)
    goto LABEL_22;
LABEL_21:

  v30 = 0;
LABEL_24:

  return v30;
}

+ (_DKEvent)eventWithRelevantShortcut:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  id v36;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47[2];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    INTrimToKeyImage();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = 0;
    INExtractKeyImage();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "watchTemplate");
    v11 = objc_claimAutoreleasedReturnValue();
    v42 = v10;
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v8, "watchTemplate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "image");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
LABEL_10:

        goto LABEL_11;
      }
      v15 = (void *)v14;
      objc_msgSend(v9, "keyImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_11:
        v41 = v7;
        v47[0] = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, v47);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v47[0];
        v24 = v23;
        if (v22)
        {
          v38 = v23;
          +[_DKRelevantShortcutMetadataKey serializedRelevantShortcut](_DKRelevantShortcutMetadataKey, "serializedRelevantShortcut");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v22;
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, v25);

          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v26 = objc_claimAutoreleasedReturnValue();
          +[_DKSystemEventStreams appRelevantShortcutsStream](_DKSystemEventStreams, "appRelevantShortcutsStream");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v6;
          +[_DKBundleIdentifier withBundle:](_DKBundleIdentifier, "withBundle:", v6);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v10, "copy");
          +[_DKEvent eventWithStream:startDate:endDate:value:metadata:](_DKEvent, "eventWithStream:startDate:endDate:value:metadata:", v27, v26, v26, v28, v29);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v5, "relevanceProviders");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v44;
            while (2)
            {
              for (i = 0; i != v32; ++i)
              {
                if (*(_QWORD *)v44 != v33)
                  objc_enumerationMutation(v30);
                v35 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v36 = v35;
                  if (objc_msgSend(v36, "situation") > 5)
                  {
                    objc_msgSend(v19, "setCompatibilityVersion:", 4096);

                    goto LABEL_27;
                  }

                }
              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
              if (v32)
                continue;
              break;
            }
          }
LABEL_27:

          v6 = v40;
          v24 = v38;
          v22 = v39;
        }
        else
        {
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            +[_DKEvent(INRelevantShortcut) eventWithRelevantShortcut:bundleID:].cold.1();
          v19 = 0;
        }

        v7 = v41;
        goto LABEL_29;
      }
    }
    objc_msgSend(v9, "keyImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cd_encodedDataImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "keyImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && !v12)
    {
      v19 = 0;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v9, "proxyIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKRelevantShortcutMetadataKey keyImageProxyIdentifier](_DKRelevantShortcutMetadataKey, "keyImageProxyIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, v21);

    +[_DKRelevantShortcutMetadataKey serializedKeyImage](_DKRelevantShortcutMetadataKey, "serializedKeyImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v13);
    goto LABEL_10;
  }
  v19 = 0;
LABEL_30:

  return (_DKEvent *)v19;
}

- (id)relevantShortcut
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v24;
  id v25;

  -[_DKEvent stream](self, "stream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSystemEventStreams appRelevantShortcutsStream](_DKSystemEventStreams, "appRelevantShortcutsStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    -[_DKEvent metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKRelevantShortcutMetadataKey serializedRelevantShortcut](_DKRelevantShortcutMetadataKey, "serializedRelevantShortcut");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_DKEvent(INRelevantShortcut) relevantShortcut].cold.1(v10);
      v21 = 0;
      goto LABEL_23;
    }
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v25);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v25;
    if (!v9)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_DKEvent(INRelevantShortcut) relevantShortcut].cold.2();
      v21 = 0;
      goto LABEL_22;
    }
    -[_DKEvent metadata](self, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKRelevantShortcutMetadataKey serializedKeyImage](_DKRelevantShortcutMetadataKey, "serializedKeyImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v24 = v10;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, &v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v24;

      if (!v14)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[_DKEvent(INRelevantShortcut) relevantShortcut].cold.3();

        v21 = 0;
        goto LABEL_21;
      }
      v16 = objc_alloc_init(MEMORY[0x1E0CBD9C8]);
      objc_msgSend(v16, "setKeyImage:", v14);
      -[_DKEvent metadata](self, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKRelevantShortcutMetadataKey keyImageProxyIdentifier](_DKRelevantShortcutMetadataKey, "keyImageProxyIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setProxyIdentifier:", v19);

      INInsertKeyImageExtraction();
      v20 = objc_claimAutoreleasedReturnValue();

      v9 = v20;
    }
    else
    {
      v15 = v10;
    }
    v9 = v9;
    v21 = v9;
LABEL_21:

    v10 = v15;
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_DKEvent(INRelevantShortcut) relevantShortcut].cold.4(self, v8);
  v21 = 0;
LABEL_24:

  return v21;
}

- (id)toPBCodable
{
  return -[_DKEvent toPBCodableUseStructuredMetadata:](self, "toPBCodableUseStructuredMetadata:", 0);
}

+ (id)fromPBCodable:(id)a3
{
  return (id)objc_msgSend(a1, "fromPBCodable:skipMetadata:", a3, 0);
}

+ (id)fromPBCodable:(id)a3 skipMetadata:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v40;
  void *v41;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = v5;
    v42 = v5;
    -[_DKPREvent value]((uint64_t)v42);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKObject fromPBCodable:](_DKObject, "fromPBCodable:", v6);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4
      && (-[_DKPREvent metadatas]((uint64_t)v42), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      && (-[_DKPREvent metadatas]((uint64_t)v42),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "count"),
          v8,
          v7,
          v9))
    {
      v10 = (void *)MEMORY[0x1E0C99E08];
      -[_DKPREvent metadatas]((uint64_t)v42);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      -[_DKPREvent metadatas]((uint64_t)v42);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v45 != v14)
              objc_enumerationMutation(v12);
            v16 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            -[_DKPRMetadataEntry key](v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[_DKPRMetadataEntry hasIndex](v16))
            {
              +[_DKMetadataPersistenceLookupTable indexToKey]();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_DKPRMetadataEntry index](v16));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", v19);
              v20 = objc_claimAutoreleasedReturnValue();

              v17 = (void *)v20;
            }
            if (objc_msgSend(v17, "length", v40))
            {
              v21 = (void *)MEMORY[0x1E0DE7910];
              -[_DKPRMetadataEntry value](v16);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "fromPBCodable:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "setObject:forKeyedSubscript:", v23, v17);

            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v13);
      }

    }
    else
    {
      v43 = 0;
    }
    -[_DKPREvent stream]((uint64_t)v42);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKEventStream fromPBCodable:](_DKEventStream, "fromPBCodable:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DKPREvent source]((uint64_t)v42);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSource fromPBCodable:](_DKSource, "fromPBCodable:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[_DKPREvent identifier]((uint64_t)v42);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithUUIDString:", v30);

    v32 = 1.0;
    if (-[_DKPREvent hasConfidence]((uint64_t)v42))
      v32 = -[_DKPREvent confidence]((uint64_t)v42);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", -[_DKPREvent startDate]((uint64_t)v42));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", -[_DKPREvent endDate]((uint64_t)v42));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[_DKEvent _initWithStream:source:startDate:endDate:value:confidence:metadata:]([_DKEvent alloc], "_initWithStream:source:startDate:endDate:value:confidence:metadata:", v26, v28, v33, v34, v41, v43, v32);
    objc_msgSend(v24, "setUUID:", v31);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", -[_DKPREvent creationDate]((uint64_t)v42));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCreationDate:", v35);

    if (-[_DKPREvent hasTimeZone]((uint64_t)v42))
    {
      os_unfair_lock_lock((os_unfair_lock_t)&fromPBCodable_skipMetadata___cacheLock);
      if (!fromPBCodable_skipMetadata___cachedTimeZone
        || (v36 = fromPBCodable_skipMetadata___cachedSecondsSinceGMT, v36 != -[_DKPREvent timeZone]((uint64_t)v42)))
      {
        fromPBCodable_skipMetadata___cachedSecondsSinceGMT = -[_DKPREvent timeZone]((uint64_t)v42);
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", -[_DKPREvent timeZone]((uint64_t)v42));
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = (void *)fromPBCodable_skipMetadata___cachedTimeZone;
        fromPBCodable_skipMetadata___cachedTimeZone = v37;

      }
      objc_msgSend(v24, "setTimeZone:", fromPBCodable_skipMetadata___cachedTimeZone, v40);
      os_unfair_lock_unlock((os_unfair_lock_t)&fromPBCodable_skipMetadata___cacheLock);
    }
    if (-[_DKPREvent hasCompatibilityVersion]((uint64_t)v42))
      objc_msgSend(v24, "setCompatibilityVersion:", -[_DKPREvent compatibilityVersion]((uint64_t)v42));

    v5 = v40;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)interaction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v23;

  -[_DKEvent stream](self, "stream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSystemEventStreams appIntentsStream](_DKSystemEventStreams, "appIntentsStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    -[_DKEvent metadata](self, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKIntentMetadataKey serializedInteraction](_DKIntentMetadataKey, "serializedInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v23 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v23;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[_DKEvent(INInteraction) interaction].cold.2();

      }
    }
    else
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[_DKEvent(INInteraction) interaction].cold.1(v12, v14, v15, v16, v17, v18, v19, v20);
      v11 = 0;
    }

  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_DKEvent(INInteraction) interaction].cold.3(self, v10);
    v11 = 0;
  }

  return v11;
}

- (void)fetchInteractionWithPopulatedKeyImage:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  void (**v28)(id, _QWORD);
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[_DKEvent interaction](self, "interaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_keyImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[_DKObject source](self, "source");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deviceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[_DKEvent metadata](self, "metadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKIntentMetadataKey serializedKeyImage](_DKIntentMetadataKey, "serializedKeyImage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v32 = 0;
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, &v32);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v32;
          v15 = v14;
          if (!v13)
          {
            +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[_DKEvent(INInteraction) fetchInteractionWithPopulatedKeyImage:].cold.2();

            v4[2](v4, 0);
            goto LABEL_17;
          }

LABEL_9:
          v16 = MEMORY[0x1E0C809B0];
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __65___DKEvent_INInteraction__fetchInteractionWithPopulatedKeyImage___block_invoke;
          v29[3] = &unk_1E26E5020;
          v30 = v7;
          v31 = v13;
          v26[0] = v16;
          v26[1] = 3221225472;
          v26[2] = __65___DKEvent_INInteraction__fetchInteractionWithPopulatedKeyImage___block_invoke_2;
          v26[3] = &unk_1E26E5048;
          v27 = v31;
          v28 = v4;
          v12 = v31;
          objc_msgSend(v5, "_injectProxiesForImages:completion:", v29, v26);

LABEL_17:
          goto LABEL_18;
        }
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[_DKEvent(INInteraction) fetchInteractionWithPopulatedKeyImage:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

      }
      else
      {
        objc_msgSend(v7, "cd_dataImage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_9;
      }
      v4[2](v4, 0);
    }
    else
    {
      ((void (**)(id, void *))v4)[2](v4, v5);
    }
LABEL_18:

  }
}

- (id)metadataFromStructuredMetadata:(id)a3 excludedMetadataKeys:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[_DKMetadataPersistenceLookupTable attributeToKey]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v42;
    v31 = v8;
    v32 = v5;
    v30 = *(_QWORD *)v42;
    v38 = v6;
    do
    {
      v13 = 0;
      v39 = v11;
      do
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v9);
        v14 = *(NSString **)(*((_QWORD *)&v41 + 1) + 8 * v13);
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (!v6 || !v15 || (objc_msgSend(v6, "containsObject:", v15) & 1) == 0)
        {
          NSSelectorFromString(v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v5, "valueForKey:", v14);
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = (void *)v17;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v19 = (void *)MEMORY[0x1E0C99E60];
                v37 = objc_opt_class();
                v36 = objc_opt_class();
                v35 = objc_opt_class();
                v34 = objc_opt_class();
                v33 = objc_opt_class();
                v20 = objc_opt_class();
                v21 = objc_opt_class();
                v22 = objc_opt_class();
                v23 = objc_opt_class();
                objc_msgSend(v19, "setWithObjects:", v37, v36, v35, v34, v33, v20, v21, v22, v23, objc_opt_class(), 0);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = 0;
                objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v24, v18, &v40);
                v25 = objc_claimAutoreleasedReturnValue();
                v26 = v40;

                v6 = v38;
                if (v26)
                {
                  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v46 = v26;
                    _os_log_error_impl(&dword_18DDBE000, v27, OS_LOG_TYPE_ERROR, "Error unarchiving object %@", buf, 0xCu);
                  }

                }
                v18 = (void *)v25;
                v8 = v31;
                v5 = v32;
                v12 = v30;
              }
              else
              {
                v6 = v38;
              }
              objc_msgSend(v9, "objectForKeyedSubscript:", v14);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v28);

              v11 = v39;
            }
          }
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)metadataFromStructuredMetadata:(id)a3 excludedMetadataKeys:(id)a4 cache:(id)a5
{
  id v8;
  id v9;
  id *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = (id *)a5;
  if (v10)
  {
    objc_msgSend(v8, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84___DKEvent_MOConversion__metadataFromStructuredMetadata_excludedMetadataKeys_cache___block_invoke;
    v14[3] = &unk_1E26E6560;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v10, v11, CFSTR("metadata"), v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_DKEvent metadataFromStructuredMetadata:excludedMetadataKeys:](self, "metadataFromStructuredMetadata:excludedMetadataKeys:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)metadataFromCustomMetadata:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[4];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing attribute for CustomMetadata: %@"), v10, v29);
LABEL_10:
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[_CDErrorUtilities simulateCrashWithDescription:](_CDErrorUtilities, "simulateCrashWithDescription:", v14);
          goto LABEL_18;
        }
        objc_msgSend(v10, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v10, "stringValue");
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_17:
          v14 = (void *)v13;
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v11);
          goto LABEL_18;
        }
        objc_msgSend(v10, "integerValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v10, "integerValue");
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        objc_msgSend(v10, "doubleValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v10, "doubleValue");
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        objc_msgSend(v10, "dateValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v10, "dateValue");
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        objc_msgSend(v10, "binaryValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid attributeValue for key '%@': %@"), v11, v10);
          goto LABEL_10;
        }
        objc_msgSend(v10, "valueHash");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "hasSuffix:", CFSTR("B"));

        if (v20)
        {
          objc_msgSend(v10, "binaryValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v11);
        }
        else
        {
          v37 = (void *)MEMORY[0x1E0C99E60];
          v36 = objc_opt_class();
          v35 = objc_opt_class();
          v34 = objc_opt_class();
          v33 = objc_opt_class();
          v32 = objc_opt_class();
          v31 = objc_opt_class();
          v30 = objc_opt_class();
          v21 = objc_opt_class();
          v22 = objc_opt_class();
          objc_msgSend(v37, "setWithObjects:", v36, v35, v34, v33, v32, v31, v30, v21, v22, objc_opt_class(), 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x1E0CB3710];
          objc_msgSend(v10, "binaryValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0;
          objc_msgSend(v23, "unarchivedObjectOfClasses:fromData:error:", v14, v24, &v39);
          v38 = objc_claimAutoreleasedReturnValue();
          v25 = v39;

          if (v25)
          {
            v26 = (void *)v38;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[_DKEvent(MOConversion) metadataFromCustomMetadata:].cold.1(v44, (uint64_t)v25, &v45);
          }
          else
          {
            v26 = (void *)v38;
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, v11);
          }

        }
LABEL_18:

        ++v9;
      }
      while (v7 != v9);
      v27 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      v7 = v27;
    }
    while (v27);
  }

  return v4;
}

- (id)metadataFromCustomMetadata:(id)a3 cache:(id)a4
{
  id v6;
  id *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (id *)a4;
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "objectID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "URIRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "absoluteString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    objc_msgSend(v8, "sortUsingSelector:", sel_compare_);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59___DKEvent_MOConversion__metadataFromCustomMetadata_cache___block_invoke;
    v19[3] = &unk_1E26E6588;
    v19[4] = self;
    v20 = v9;
    -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v7, v8, CFSTR("attributeValue"), v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_DKEvent metadataFromCustomMetadata:](self, "metadataFromCustomMetadata:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = (id *)a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v10;
    objc_msgSend(v13, "streamName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v13, "streamName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "eventValueFromManagedObject:streamName:readMetadata:excludedMetadataKeys:cache:", v13, v15, v8, v11, v12);
      v16 = objc_claimAutoreleasedReturnValue();

      v53 = (void *)v16;
      if (v16)
      {
        objc_msgSend(a1, "eventStreamFromManagedObject:forValue:cache:", v13, v16, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = MEMORY[0x1E0C809B0];
          if (v12)
          {
            v19 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v13, "startDate");
            objc_msgSend(v19, "numberWithDouble:");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v59[0] = v18;
            v59[1] = 3221225472;
            v59[2] = __90___DKEvent_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke;
            v59[3] = &unk_1E26E6510;
            v21 = v13;
            v60 = v21;
            -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v12, v20, CFSTR("date"), v59);
            v22 = objc_claimAutoreleasedReturnValue();

            v23 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v21, "endDate");
            objc_msgSend(v23, "numberWithDouble:");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v57[0] = v18;
            v57[1] = 3221225472;
            v57[2] = __90___DKEvent_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke_2;
            v57[3] = &unk_1E26E6510;
            v58 = v21;
            -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v12, v24, CFSTR("date"), v57);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v27 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v13, "startDate");
            objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
            v22 = objc_claimAutoreleasedReturnValue();
            v28 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v13, "endDate");
            objc_msgSend(v28, "dateWithTimeIntervalSinceReferenceDate:");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v51 = (void *)v22;
          v52 = v17;
          +[_DKEvent eventWithStream:startDate:endDate:value:](_DKEvent, "eventWithStream:startDate:endDate:value:", v17, v22, v25, v53);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "confidence");
          objc_msgSend(v29, "setConfidence:");
          if (v12)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "secondsFromGMT"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v55[0] = MEMORY[0x1E0C809B0];
            v55[1] = 3221225472;
            v55[2] = __90___DKEvent_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke_3;
            v55[3] = &unk_1E26E6510;
            v56 = v13;
            -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v12, v30, CFSTR("timeZone"), v55);
            v31 = v25;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setTimeZone:", v32);

            v25 = v31;
            v33 = v56;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", objc_msgSend(v13, "secondsFromGMT"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setTimeZone:", v33);
          }

          if (objc_msgSend(v29, "copyBaseObjectInfoFromManagedObject:cache:", v13, v12))
          {
            if (v8)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v13, "hasCustomMetadata"))
              {
                if (objc_msgSend(v11, "count"))
                {
                  v50 = v25;
                  +[_DKCustomMetadataMO fetchRequest](_DKCustomMetadataMO, "fetchRequest");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = (void *)MEMORY[0x1E0CB3880];
                  objc_msgSend(v13, "objectID");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "predicateWithFormat:", CFSTR("ANY event == %@ && NOT name IN %@"), v37, v11);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "setPredicate:", v38);

                  objc_msgSend(v13, "managedObjectContext");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = 0;
                  objc_msgSend(v39, "executeFetchRequest:error:", v35, &v54);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = v54;

                  if (v41)
                  {
                    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
                    v42 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                      +[_DKEvent(MOConversion) objectFromManagedObject:readMetadata:excludedMetadataKeys:cache:].cold.1(v52, v42);

                  }
                  v25 = v50;
                }
                else
                {
                  objc_msgSend(v13, "customMetadata");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "allObjects");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                }

                objc_msgSend(v29, "metadataFromCustomMetadata:cache:", v40, v12);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "addEntriesFromDictionary:", v43);

              }
              if (objc_msgSend(v13, "hasStructuredMetadata"))
              {
                objc_msgSend(v13, "structuredMetadata");
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                if (v44)
                {
                  objc_msgSend(v13, "structuredMetadata");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "metadataFromStructuredMetadata:excludedMetadataKeys:cache:", v45, v11, v12);
                  v46 = v25;
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "addEntriesFromDictionary:", v47);

                  v25 = v46;
                }
              }
              if (objc_msgSend(v34, "count"))
              {
                if (v11 && objc_msgSend(v11, "count"))
                  objc_msgSend(v34, "removeObjectsForKeys:", v11);
                v48 = (void *)objc_msgSend(v34, "copy");
                objc_msgSend(v29, "setMetadata:", v48);

              }
            }
            objc_msgSend(v29, "setShouldSync:", objc_msgSend(v13, "shouldSync"));
            objc_msgSend(v29, "setCompatibilityVersion:", objc_msgSend(v13, "compatibilityVersion"));
            v26 = v29;
          }
          else
          {
            v26 = 0;
          }

          v17 = v52;
        }
        else
        {
          v26 = 0;
        }

      }
      else
      {
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (id)eventStreamFromManagedObject:(id)a3 forValue:(id)a4 cache:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE0DC360))
  {
    objc_msgSend(v7, "objectType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "streamName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)uncachedEventValueFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v8 = a4;
  v9 = a3;
  v10 = a5;
  v11 = (id *)a6;
  switch(objc_msgSend(v9, "valueClass"))
  {
    case 0u:
      objc_msgSend(v9, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKObject objectFromManagedObject:readMetadata:excludedMetadataKeys:cache:](_DKObject, "objectFromManagedObject:readMetadata:excludedMetadataKeys:cache:", v12, v8, v10, v11);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1u:
      objc_msgSend(v9, "valueString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[_DKObjectFromMOCache deduplicateString:](v11, v12);
        v15 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v15;
      }
      +[_DKObjectType objectTypeWithTypeCode:](_DKIdentifierType, "objectTypeWithTypeCode:", objc_msgSend(v9, "valueTypeCode"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKIdentifier identifierWithString:type:](_DKIdentifier, "identifierWithString:type:", v12, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 2u:
      +[_DKObjectType objectTypeWithTypeCode:](_DKCategoryType, "objectTypeWithTypeCode:", objc_msgSend(v9, "valueTypeCode"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", objc_msgSend(v9, "valueInteger"), v12);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3u:
      +[_DKObjectType objectTypeWithTypeCode:](_DKQuantityType, "objectTypeWithTypeCode:", objc_msgSend(v9, "valueTypeCode"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueDouble");
      +[_DKQuantity quantityWithDouble:type:](_DKQuantity, "quantityWithDouble:type:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v14 = (void *)v13;
LABEL_10:

      break;
    default:
      v14 = 0;
      break;
  }

  return v14;
}

+ (id)eventValueFromManagedObject:(id)a3 streamName:(id)a4 readMetadata:(BOOL)a5 excludedMetadataKeys:(id)a6 cache:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id *v23;
  id v24;
  BOOL v25;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (v15 && objc_msgSend(v12, "valueClass") != 3)
  {
    if (objc_msgSend(v12, "valueClass") == 1)
      objc_msgSend(v12, "valueString");
    else
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "valueInteger"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v13, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __105___DKEvent_MOConversion__eventValueFromManagedObject_streamName_readMetadata_excludedMetadataKeys_cache___block_invoke;
    v20[3] = &unk_1E26E65B0;
    v24 = a1;
    v21 = v12;
    v25 = v9;
    v22 = v14;
    v23 = (id *)v15;
    -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v23, v18, CFSTR("eventValue"), v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "uncachedEventValueFromManagedObject:readMetadata:excludedMetadataKeys:cache:", v12, v9, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (id)fetchCustomMetadataWithName:(id)a3 valueHash:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD *);
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__21;
  v30 = __Block_byref_object_dispose__21;
  v31 = 0;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __72___DKEvent_MOConversion__fetchCustomMetadataWithName_valueHash_context___block_invoke;
  v21 = &unk_1E26E3AC0;
  v10 = v9;
  v22 = v10;
  v11 = v7;
  v23 = v11;
  v12 = v8;
  v24 = v12;
  v25 = &v26;
  objc_msgSend(v10, "performWithOptions:andBlock:", 4, &v18);
  v13 = (void *)v27[5];
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("CustomMetadata"), v10, v18, v19, v20, v21, v22, v23);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v27[5];
    v27[5] = v14;

    objc_msgSend((id)v27[5], "setName:", v11);
    objc_msgSend((id)v27[5], "setValueHash:", v12);
    v13 = (void *)v27[5];
  }
  v16 = v13;

  _Block_object_dispose(&v26, 8);
  return v16;
}

+ (id)moKeyPathForKeyPath:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("metadata"));

  if (v5)
  {
    +[_DKMetadataPersistenceLookupTable keyToAttribute]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("structuredMetadata.%@"), v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("value"));

    if (v11)
    {
      objc_msgSend(v3, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Value"), &stru_1E26E9728);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "substringToIndex:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "capitalizedString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", 0, 1, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("value%@"), v16);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = v2;
    }
  }

  return v9;
}

+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 value:(id)a6 confidence:(double)a7 metadata:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _DKEvent *v18;

  v13 = a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = -[_DKEvent initWithStream:source:startDate:endDate:value:confidence:metadata:]([_DKEvent alloc], "initWithStream:source:startDate:endDate:value:confidence:metadata:", v17, 0, v16, v15, v14, v13, a7);

  return v18;
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 categoryIntegerValue:(int64_t)a7 metadata:(id)a8
{
  return (_DKEvent *)objc_msgSend(a1, "eventWithStream:source:startDate:endDate:categoryIntegerValue:confidence:metadata:", a3, a4, a5, a6, a7, a8, 1.0);
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 categoryIntegerValue:(int64_t)a7 confidence:(double)a8 metadata:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _DKEvent *v27;
  NSObject *v28;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  +[_DKAnyIntegerCategory type](_DKAnyIntegerCategory, "type");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventValueType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    goto LABEL_4;
  objc_msgSend(v15, "eventValueType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend((id)objc_msgSend(v22, "objectClass"), "isEqual:", objc_opt_class());

  if (v23)
  {
    objc_msgSend(v15, "eventValueType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKObjectType objectTypeWithTypeCode:](_DKCategoryType, "objectTypeWithTypeCode:", objc_msgSend(v24, "typeCode"));
    v25 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v25;
LABEL_4:
    +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", a7, v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[_DKEvent initWithStream:source:startDate:endDate:value:confidence:metadata:]([_DKEvent alloc], "initWithStream:source:startDate:endDate:value:confidence:metadata:", v15, v16, v17, v18, v26, v19, a8);

    goto LABEL_8;
  }
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    +[_DKEvent eventWithStream:source:startDate:endDate:categoryIntegerValue:confidence:metadata:].cold.1(v15);

  v27 = 0;
LABEL_8:

  return v27;
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 quantityDoubleValue:(double)a7 metadata:(id)a8
{
  return (_DKEvent *)objc_msgSend(a1, "eventWithStream:source:startDate:endDate:quantityDoubleValue:confidence:metadata:", a3, a4, a5, a6, a8, a7, 1.0);
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 quantityDoubleValue:(double)a7 confidence:(double)a8 metadata:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _DKEvent *v27;
  NSObject *v28;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  +[_DKAnyDoubleQuantity type](_DKAnyDoubleQuantity, "type");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventValueType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    goto LABEL_4;
  objc_msgSend(v15, "eventValueType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend((id)objc_msgSend(v22, "objectClass"), "isEqual:", objc_opt_class());

  if (v23)
  {
    objc_msgSend(v15, "eventValueType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKObjectType objectTypeWithTypeCode:](_DKQuantityType, "objectTypeWithTypeCode:", objc_msgSend(v24, "typeCode"));
    v25 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v25;
LABEL_4:
    +[_DKQuantity quantityWithDouble:type:](_DKQuantity, "quantityWithDouble:type:", v20, a7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[_DKEvent initWithStream:source:startDate:endDate:value:confidence:metadata:]([_DKEvent alloc], "initWithStream:source:startDate:endDate:value:confidence:metadata:", v15, v16, v17, v18, v26, v19, a8);

    goto LABEL_8;
  }
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    +[_DKEvent eventWithStream:source:startDate:endDate:quantityDoubleValue:confidence:metadata:].cold.1(v15);

  v27 = 0;
LABEL_8:

  return v27;
}

+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 categoryIntegerValue:(int64_t)a6 metadata:(id)a7
{
  return (_DKEvent *)objc_msgSend(a1, "eventWithStream:source:startDate:endDate:categoryIntegerValue:confidence:metadata:", a3, 0, a4, a5, a6, a7, 1.0);
}

+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 quantityDoubleValue:(double)a6 metadata:(id)a7
{
  return (_DKEvent *)objc_msgSend(a1, "eventWithStream:source:startDate:endDate:quantityDoubleValue:confidence:metadata:", a3, 0, a4, a5, a7, a6, 1.0);
}

+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 identifierStringValue:(id)a6 metadata:(id)a7
{
  return (_DKEvent *)objc_msgSend(a1, "eventWithStream:source:startDate:endDate:identifierStringValue:confidence:metadata:", a3, 0, a4, a5, a6, a7, 1.0);
}

- (NSString)description
{
  NSDictionary *metadata;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  _DKEventStream *stream;
  NSDate *startDate;
  NSDate *endDate;
  NSInteger v12;
  double confidence;
  _DKObject *value;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  objc_super v21;

  metadata = self->_metadata;
  -[NSDictionary allKeys](metadata, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_66);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary dictionaryWithValuesForKeys:](metadata, "dictionaryWithValuesForKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  stream = self->_stream;
  startDate = self->_startDate;
  endDate = self->_endDate;
  v12 = -[NSTimeZone secondsFromGMT](self->_timeZone, "secondsFromGMT");
  confidence = self->_confidence;
  value = self->_value;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldSync);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_compatibilityVersion);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)_DKEvent;
  -[_DKObject description](&v21, sel_description);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: { stream='%@', start=%@, end=%@, tz=%d, conf=%f, value=%@, metadata=%@, shouldSync=%@, compatibilityVersion=%@, %@}"), v8, stream, startDate, endDate, v12, *(_QWORD *)&confidence, value, v6, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (id)primaryValue
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[_DKEvent value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE0DC2F0);

  if (v4)
  {
    -[_DKEvent value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)BOOLValue
{
  void *v2;
  char v3;

  -[_DKEvent value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (int64_t)integerValue
{
  void *v2;
  int64_t v3;

  -[_DKEvent value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (double)doubleValue
{
  void *v2;
  double v3;
  double v4;

  -[_DKEvent value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _DKEvent *v4;
  _DKEvent *v5;
  _DKEvent *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  BOOL v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;

  v4 = (_DKEvent *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v52.receiver = self;
        v52.super_class = (Class)_DKEvent;
        if (-[_DKObject isEqual:](&v52, sel_isEqual_, v5))
        {
          v6 = v5;
          -[_DKEvent stream](self, "stream");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKEvent stream](v6, "stream");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7 != v8)
          {
            -[_DKEvent stream](self, "stream");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKEvent stream](v6, "stream");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v9, "isEqual:", v10))
            {
              v11 = 0;
              goto LABEL_41;
            }
            v49 = v10;
            v50 = v9;
          }
          -[_DKEvent startDate](self, "startDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKEvent startDate](v6, "startDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 != v13)
          {
            -[_DKEvent startDate](self, "startDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKEvent startDate](v6, "startDate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v14, "isEqual:", v15))
            {
              v11 = 0;
LABEL_39:

LABEL_40:
              v10 = v49;
              v9 = v50;
              if (v7 == v8)
              {
LABEL_42:

                goto LABEL_43;
              }
LABEL_41:

              goto LABEL_42;
            }
            v47 = v15;
            v48 = v14;
          }
          -[_DKEvent endDate](self, "endDate");
          v16 = objc_claimAutoreleasedReturnValue();
          -[_DKEvent endDate](v6, "endDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)v16;
          if ((void *)v16 != v17)
          {
            -[_DKEvent endDate](self, "endDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKEvent endDate](v6, "endDate");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v18;
            if (!objc_msgSend(v18, "isEqual:"))
            {
              v11 = 0;
LABEL_37:

LABEL_38:
              v15 = v47;
              v14 = v48;
              if (v12 == v13)
                goto LABEL_40;
              goto LABEL_39;
            }
          }
          -[_DKEvent timeZone](self, "timeZone");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKEvent timeZone](v6, "timeZone");
          v46 = objc_claimAutoreleasedReturnValue();
          if (v19 != (void *)v46)
          {
            v20 = v19;
            -[_DKEvent timeZone](self, "timeZone");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v43, "secondsFromGMT");
            -[_DKEvent timeZone](v6, "timeZone");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21 != objc_msgSend(v42, "secondsFromGMT"))
            {
              v11 = 0;
              v19 = v20;
              v27 = (void *)v46;
LABEL_35:

LABEL_36:
              if (v51 == v17)
                goto LABEL_38;
              goto LABEL_37;
            }
            v19 = v20;
          }
          -[_DKEvent confidence](self, "confidence");
          v23 = v22;
          -[_DKEvent confidence](v6, "confidence");
          if (v23 != v24
            || (v41 = v19,
                v25 = -[_DKEvent shouldSync](self, "shouldSync"),
                v26 = v25 == -[_DKEvent shouldSync](v6, "shouldSync"),
                v19 = v41,
                !v26))
          {
            v11 = 0;
            goto LABEL_34;
          }
          -[_DKEvent value](self, "value");
          v28 = objc_claimAutoreleasedReturnValue();
          -[_DKEvent value](v6, "value");
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = (void *)v28;
          if (v28 == v39
            || (-[_DKEvent value](self, "value"),
                v29 = (void *)objc_claimAutoreleasedReturnValue(),
                -[_DKEvent value](v6, "value"),
                v37 = (void *)objc_claimAutoreleasedReturnValue(),
                v38 = v29,
                objc_msgSend(v29, "isEqual:")))
          {
            -[_DKEvent metadata](self, "metadata");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKEvent metadata](v6, "metadata");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v31;
            if (v31 == v35)
            {

              v11 = 1;
            }
            else
            {
              -[_DKEvent metadata](self, "metadata");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DKEvent metadata](v6, "metadata");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v32, "isEqual:", v33);

              v19 = v41;
            }
            v30 = (void *)v39;
            if (v40 == (void *)v39)
              goto LABEL_33;
          }
          else
          {
            v11 = 0;
            v30 = (void *)v39;
          }

LABEL_33:
LABEL_34:
          v27 = (void *)v46;
          if (v19 == (void *)v46)
            goto LABEL_36;
          goto LABEL_35;
        }
      }
    }
    v11 = 0;
  }
LABEL_43:

  return v11;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

+ (void)eventWithStream:(void *)a1 source:startDate:endDate:categoryIntegerValue:confidence:metadata:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend(a1, "eventValueType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)OUTLINED_FUNCTION_3_8(v2, v3);
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v6, v7, "_DKEvent stream category type must be _DKCategory. Found %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_7();
}

+ (void)eventWithStream:(void *)a1 source:startDate:endDate:quantityDoubleValue:confidence:metadata:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend(a1, "eventValueType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)OUTLINED_FUNCTION_3_8(v2, v3);
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v6, v7, "_DKEvent stream quantity type must be _DKQuantity. Found %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_7();
}

+ (void)eventWithStream:(void *)a1 source:startDate:endDate:identifierStringValue:confidence:metadata:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend(a1, "eventValueType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)OUTLINED_FUNCTION_3_8(v2, v3);
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v6, v7, "_DKEvent stream identifier type must be _DKIdentifier. Found %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_7();
}

- (void)initWithStream:source:startDate:endDate:value:confidence:metadata:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_10(&dword_18DDBE000, v1, (uint64_t)v1, "_DKEvent endDate (%@) must be at or later than startDate (%@).", v2);
}

- (void)initWithStream:(NSObject *)a3 source:startDate:endDate:value:confidence:metadata:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "eventValueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)objc_msgSend(v4, "objectClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v5;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_10(&dword_18DDBE000, a3, v8, "_DKEvent stream type and value class mismatch. %@ != %@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_7();
}

@end
