@implementation BMInferredModeEvent

- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeIdentifier:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 uuid:(id)a12 serializedTriggers:(id)a13
{
  uint64_t v14;
  uint64_t v15;

  LOBYTE(v15) = 1;
  LOBYTE(v14) = a10;
  return -[BMInferredModeEvent initWithAbsoluteTimestamp:modeUUID:origin:originBundleId:originAnchorType:isAutomationEnabled:uiLocation:isStart:confidenceScore:suggestionUUID:serializedTriggers:shouldSuggestTriggers:modeType:userModeName:](self, "initWithAbsoluteTimestamp:modeUUID:origin:originBundleId:originAnchorType:isAutomationEnabled:uiLocation:isStart:confidenceScore:suggestionUUID:serializedTriggers:shouldSuggestTriggers:modeType:userModeName:", a4, a5, a6, a7, a8, a9, a3, a11, v14, a12, a13, v15, 0, 0);
}

- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeIdentifier:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 uuid:(id)a12 serializedTriggers:(id)a13 modeType:(unint64_t)a14
{
  uint64_t v15;
  uint64_t v16;

  LOBYTE(v16) = 1;
  LOBYTE(v15) = a10;
  return -[BMInferredModeEvent initWithAbsoluteTimestamp:modeUUID:origin:originBundleId:originAnchorType:isAutomationEnabled:uiLocation:isStart:confidenceScore:suggestionUUID:serializedTriggers:shouldSuggestTriggers:modeType:userModeName:](self, "initWithAbsoluteTimestamp:modeUUID:origin:originBundleId:originAnchorType:isAutomationEnabled:uiLocation:isStart:confidenceScore:suggestionUUID:serializedTriggers:shouldSuggestTriggers:modeType:userModeName:", a4, a5, a6, a7, a8, a9, a3, a11, v15, a12, a13, v16, a14, 0);
}

- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeUUID:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 suggestionUUID:(id)a12 serializedTriggers:(id)a13 modeType:(unint64_t)a14
{
  uint64_t v15;
  uint64_t v16;

  LOBYTE(v16) = 1;
  LOBYTE(v15) = a10;
  return -[BMInferredModeEvent initWithAbsoluteTimestamp:modeUUID:origin:originBundleId:originAnchorType:isAutomationEnabled:uiLocation:isStart:confidenceScore:suggestionUUID:serializedTriggers:shouldSuggestTriggers:modeType:userModeName:](self, "initWithAbsoluteTimestamp:modeUUID:origin:originBundleId:originAnchorType:isAutomationEnabled:uiLocation:isStart:confidenceScore:suggestionUUID:serializedTriggers:shouldSuggestTriggers:modeType:userModeName:", a4, a5, a6, a7, a8, a9, a3, a11, v15, a12, a13, v16, a14, 0);
}

- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeUUID:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 suggestionUUID:(id)a12 serializedTriggers:(id)a13 shouldSuggestTriggers:(BOOL)a14 modeType:(unint64_t)a15
{
  uint64_t v16;
  uint64_t v17;

  LOBYTE(v17) = a14;
  LOBYTE(v16) = a10;
  return -[BMInferredModeEvent initWithAbsoluteTimestamp:modeUUID:origin:originBundleId:originAnchorType:isAutomationEnabled:uiLocation:isStart:confidenceScore:suggestionUUID:serializedTriggers:shouldSuggestTriggers:modeType:userModeName:](self, "initWithAbsoluteTimestamp:modeUUID:origin:originBundleId:originAnchorType:isAutomationEnabled:uiLocation:isStart:confidenceScore:suggestionUUID:serializedTriggers:shouldSuggestTriggers:modeType:userModeName:", a4, a5, a6, a7, a8, a9, a3, a11, v16, a12, a13, v17, a15, 0);
}

- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeUUID:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 suggestionUUID:(id)a12 serializedTriggers:(id)a13 shouldSuggestTriggers:(BOOL)a14 modeType:(unint64_t)a15 userModeName:(id)a16
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BMInferredModeEvent *v29;
  BMInferredModeEvent *v30;
  uint64_t v31;
  NSString *modeUUID;
  uint64_t v33;
  NSString *originBundleId;
  uint64_t v35;
  NSString *originAnchorType;
  uint64_t v37;
  NSString *suggestionUUID;
  uint64_t v39;
  NSArray *serializedTriggers;
  uint64_t v41;
  NSString *userModeName;
  objc_super v45;

  v23 = a4;
  v24 = a6;
  v25 = a7;
  v26 = a12;
  v27 = a13;
  v28 = a16;
  v45.receiver = self;
  v45.super_class = (Class)BMInferredModeEvent;
  v29 = -[BMInferredModeEvent init](&v45, sel_init);
  v30 = v29;
  if (v29)
  {
    v29->_absoluteTimestamp = a3;
    v31 = objc_msgSend(v23, "copy");
    modeUUID = v30->_modeUUID;
    v30->_modeUUID = (NSString *)v31;

    v30->_origin = a5;
    v33 = objc_msgSend(v24, "copy");
    originBundleId = v30->_originBundleId;
    v30->_originBundleId = (NSString *)v33;

    v35 = objc_msgSend(v25, "copy");
    originAnchorType = v30->_originAnchorType;
    v30->_originAnchorType = (NSString *)v35;

    v30->_isAutomationEnabled = a8;
    v30->_uiLocation = a9;
    v30->_isStart = a10;
    v30->_confidenceScore = a11;
    v37 = objc_msgSend(v26, "copy");
    suggestionUUID = v30->_suggestionUUID;
    v30->_suggestionUUID = (NSString *)v37;

    v39 = objc_msgSend(v27, "copy");
    serializedTriggers = v30->_serializedTriggers;
    v30->_serializedTriggers = (NSArray *)v39;

    v30->_shouldSuggestTriggers = a14;
    v30->_modeType = a15;
    v41 = objc_msgSend(v28, "copy");
    userModeName = v30->_userModeName;
    v30->_userModeName = (NSString *)v41;

  }
  return v30;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (objc_class *)a1;
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    v7 = (objc_class *)BMInferredModeEvent_v2;
LABEL_5:
    v8 = (void *)objc_msgSend([v7 alloc], "initWithProtoData:", v6);
    goto LABEL_9;
  }
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[BMInferredModeEvent eventWithData:dataVersion:].cold.1(a4, v9);

  v8 = 0;
LABEL_9:

  return v8;
}

- (NSString)modeIdentifier
{
  return self->_modeUUID;
}

- (NSString)uuid
{
  return self->_suggestionUUID;
}

- (id)jsonDict
{
  uint64_t v3;
  const __CFString *modeUUID;
  uint64_t v5;
  void *v6;
  const __CFString *originBundleId;
  const __CFString *originAnchorType;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *suggestionUUID;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *userModeName;
  void *v19;
  void *v21;
  _QWORD v22[14];
  _QWORD v23[16];

  v23[14] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("absoluteTimeStamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v3 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v3;
  modeUUID = (const __CFString *)self->_modeUUID;
  if (!modeUUID)
    modeUUID = CFSTR("nil");
  v23[0] = v3;
  v23[1] = modeUUID;
  v22[1] = CFSTR("modeUUID");
  v22[2] = CFSTR("origin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_origin);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  originBundleId = (const __CFString *)self->_originBundleId;
  if (!originBundleId)
    originBundleId = CFSTR("nil");
  v23[2] = v5;
  v23[3] = originBundleId;
  v22[3] = CFSTR("originBundleId");
  v22[4] = CFSTR("originAnchorType");
  originAnchorType = (const __CFString *)self->_originAnchorType;
  if (!originAnchorType)
    originAnchorType = CFSTR("nil");
  v23[4] = originAnchorType;
  v22[5] = CFSTR("isAutomationEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAutomationEnabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v9;
  v22[6] = CFSTR("uiLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_uiLocation);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v10;
  v22[7] = CFSTR("isStart");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStart);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v11;
  v22[8] = CFSTR("confidenceScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidenceScore);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  suggestionUUID = self->_suggestionUUID;
  v23[8] = v12;
  v23[9] = suggestionUUID;
  v22[9] = CFSTR("suggestionUUID");
  v22[10] = CFSTR("serializedTriggersCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_serializedTriggers, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[10] = v14;
  v22[11] = CFSTR("shouldSuggestTriggers");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldSuggestTriggers);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[11] = v15;
  v22[12] = CFSTR("modeType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_modeType);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v22[13] = CFSTR("userModeName");
  userModeName = (const __CFString *)self->_userModeName;
  if (!userModeName)
    userModeName = CFSTR("nil");
  v23[12] = v16;
  v23[13] = userModeName;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMInferredModeEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMDeviceMetadataEvent json].cold.1(v6);

  }
  return v4;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMInferredModeEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMInferredModeEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  BMInferredModeEvent *v10;
  NSObject *v11;
  void *v12;
  char v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  void *v30;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
      v7 = v6;
      -[NSObject modeIdentifier](v5, "modeIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSObject origin](v5, "origin") + 1;
      if (v8 >= 0x12)
      {
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[BMInferredModeEvent initWithProto:].cold.2();

        v9 = -1;
      }
      else
      {
        v9 = v8 - 1;
      }
      v28 = v9;
      -[NSObject originBundleId](v5, "originBundleId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject originAnchorType](v5, "originAnchorType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[NSObject isAutomationEnabled](v5, "isAutomationEnabled");
      v26 = -[NSObject uiLocation](v5, "uiLocation");
      v13 = -[NSObject isStart](v5, "isStart");
      -[NSObject confidenceScore](v5, "confidenceScore");
      v15 = v14;
      -[NSObject uuid](v5, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject serializedTriggers](v5, "serializedTriggers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[NSObject shouldSuggestTriggers](v5, "shouldSuggestTriggers");
      v19 = -[NSObject modeType](v5, "modeType");
      if (v19 >= 0x11)
      {
        __biome_log_for_category();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[BMInferredModeEvent initWithProto:].cold.1();

        v20 = 1;
      }
      else
      {
        v20 = v19;
      }
      -[NSObject userModeName](v5, "userModeName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v25) = v18;
      LOBYTE(v24) = v13;
      self = -[BMInferredModeEvent initWithAbsoluteTimestamp:modeUUID:origin:originBundleId:originAnchorType:isAutomationEnabled:uiLocation:isStart:confidenceScore:suggestionUUID:serializedTriggers:shouldSuggestTriggers:modeType:userModeName:](self, "initWithAbsoluteTimestamp:modeUUID:origin:originBundleId:originAnchorType:isAutomationEnabled:uiLocation:isStart:confidenceScore:suggestionUUID:serializedTriggers:shouldSuggestTriggers:modeType:userModeName:", v30, v28, v29, v12, v27, v26, v7, v15, v24, v16, v17, v25, v20, v22);

      v10 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMInferredModeEvent initWithProto:].cold.3();
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BMInferredModeEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBInferredModeEvent *v5;
  BMInferredModeEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBInferredModeEvent initWithData:]([BMPBInferredModeEvent alloc], "initWithData:", v4);

    self = -[BMInferredModeEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  int64_t origin;
  uint64_t v5;
  int v6;
  NSObject *v7;
  unint64_t modeType;
  void *v9;
  id v10;
  NSObject *v11;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAbsoluteTimestamp:", self->_absoluteTimestamp);
  objc_msgSend(v3, "setModeIdentifier:", self->_modeUUID);
  origin = self->_origin;
  v5 = 0xFFFFFFFFLL;
  v6 = 1;
  switch(origin)
  {
    case -1:
      break;
    case 0:
      v5 = 0;
      break;
    case 1:
      v5 = 1;
      break;
    case 2:
      v5 = 2;
      break;
    case 3:
      v5 = 3;
      break;
    case 4:
      v5 = 4;
      break;
    case 5:
      v5 = 5;
      break;
    case 6:
      v5 = 6;
      break;
    case 7:
      v5 = 7;
      break;
    case 8:
      v5 = 8;
      break;
    case 9:
      v5 = 9;
      break;
    case 10:
      v5 = 10;
      break;
    case 11:
      v5 = 11;
      break;
    case 12:
      v5 = 12;
      break;
    case 13:
      v5 = 13;
      break;
    case 14:
      v5 = 14;
      break;
    case 15:
      v5 = 15;
      break;
    case 16:
      v5 = 16;
      break;
    default:
      __biome_log_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[BMInferredModeEvent proto].cold.2(origin);

      v6 = 0;
      v5 = 0xFFFFFFFFLL;
      break;
  }
  modeType = self->_modeType;
  if (modeType >= 0x11)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMInferredModeEvent proto].cold.1(modeType);

    goto LABEL_28;
  }
  if (!v6)
  {
LABEL_28:
    v10 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v3, "setOrigin:", v5);
  objc_msgSend(v3, "setOriginBundleId:", self->_originBundleId);
  objc_msgSend(v3, "setOriginAnchorType:", self->_originAnchorType);
  objc_msgSend(v3, "setIsAutomationEnabled:", self->_isAutomationEnabled);
  objc_msgSend(v3, "setUiLocation:", self->_uiLocation);
  objc_msgSend(v3, "setIsStart:", self->_isStart);
  objc_msgSend(v3, "setConfidenceScore:", self->_confidenceScore);
  objc_msgSend(v3, "setUuid:", self->_suggestionUUID);
  v9 = (void *)-[NSArray mutableCopy](self->_serializedTriggers, "mutableCopy");
  objc_msgSend(v3, "setSerializedTriggers:", v9);

  objc_msgSend(v3, "setShouldSuggestTriggers:", self->_shouldSuggestTriggers);
  objc_msgSend(v3, "setModeType:", modeType);
  objc_msgSend(v3, "setUserModeName:", self->_userModeName);
  v10 = v3;
LABEL_29:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  id v8;
  double absoluteTimestamp;
  double v10;
  NSString *modeUUID;
  NSString *v12;
  int64_t v13;
  int v14;
  BOOL v15;
  int64_t origin;
  uint64_t v17;
  NSString *originBundleId;
  NSString *v19;
  uint64_t v20;
  NSString *originAnchorType;
  NSString *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *v25;
  void *v26;
  int isAutomationEnabled;
  unint64_t uiLocation;
  int isStart;
  double confidenceScore;
  double v31;
  double v32;
  NSString *suggestionUUID;
  uint64_t v34;
  unint64_t v35;
  int v36;
  int shouldSuggestTriggers;
  unint64_t modeType;
  char v40;
  void *v41;
  void *v42;
  NSString *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  int v49;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    absoluteTimestamp = self->_absoluteTimestamp;
    objc_msgSend(v8, "absoluteTimestamp");
    if (vabdd_f64(absoluteTimestamp, v10) >= 0.01)
    {
      v15 = 0;
      goto LABEL_50;
    }
    modeUUID = self->_modeUUID;
    v12 = modeUUID;
    if (!modeUUID)
    {
      objc_msgSend(v8, "modeUUID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        origin = self->_origin;
        v17 = objc_msgSend(v8, "origin");
        v14 = 0;
        v15 = 0;
        if (origin != v17)
        {
LABEL_49:

          goto LABEL_50;
        }
        goto LABEL_14;
      }
      v12 = self->_modeUUID;
    }
    objc_msgSend(v8, "modeUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v12, "isEqualToString:", v4))
    {

      v15 = 0;
      goto LABEL_48;
    }
    v13 = self->_origin;
    if (v13 != objc_msgSend(v8, "origin"))
    {
      v15 = 0;
      goto LABEL_47;
    }
    v14 = 1;
LABEL_14:
    v49 = v14;
    originBundleId = self->_originBundleId;
    v19 = originBundleId;
    if (!originBundleId)
    {
      objc_msgSend(v8, "originBundleId");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v47 = 0;
        v48 = 0;
        goto LABEL_21;
      }
      v47 = (void *)v20;
      v19 = self->_originBundleId;
    }
    objc_msgSend(v8, "originBundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v19, "isEqualToString:", v5))
    {
      v15 = 0;
      goto LABEL_45;
    }
    v48 = 1;
LABEL_21:
    originAnchorType = self->_originAnchorType;
    v22 = originAnchorType;
    if (!originAnchorType)
    {
      objc_msgSend(v8, "originAnchorType");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        v45 = 0;
        v46 = 0;
        goto LABEL_28;
      }
      v45 = (void *)v23;
      v22 = self->_originAnchorType;
    }
    objc_msgSend(v8, "originAnchorType");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v22;
    v26 = (void *)v24;
    if (!-[NSString isEqualToString:](v25, "isEqualToString:", v24))
    {

      v15 = 0;
      goto LABEL_43;
    }
    v44 = v26;
    v46 = 1;
LABEL_28:
    isAutomationEnabled = self->_isAutomationEnabled;
    if (isAutomationEnabled != objc_msgSend(v8, "isAutomationEnabled"))
      goto LABEL_40;
    uiLocation = self->_uiLocation;
    if (uiLocation != objc_msgSend(v8, "uiLocation"))
      goto LABEL_40;
    isStart = self->_isStart;
    if (isStart != objc_msgSend(v8, "isStart"))
      goto LABEL_40;
    confidenceScore = self->_confidenceScore;
    objc_msgSend(v8, "confidenceScore");
    v32 = confidenceScore - v31;
    if (v32 < 0.0)
      v32 = -v32;
    if (v32 >= 2.22044605e-16)
    {
LABEL_40:
      v15 = 0;
      goto LABEL_41;
    }
    suggestionUUID = self->_suggestionUUID;
    v43 = suggestionUUID;
    if (!suggestionUUID)
    {
      objc_msgSend(v8, "suggestionUUID");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        modeType = self->_modeType;
        v40 = 0;
        v41 = 0;
        v15 = 0;
        if (modeType != objc_msgSend(v8, "modeType"))
        {
LABEL_64:

LABEL_41:
          if ((v46 & 1) == 0)
            goto LABEL_43;
          goto LABEL_42;
        }
        goto LABEL_62;
      }
      v41 = (void *)v34;
      suggestionUUID = self->_suggestionUUID;
    }
    objc_msgSend(v8, "suggestionUUID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](suggestionUUID, "isEqualToString:")
      || (v35 = self->_modeType, v35 != objc_msgSend(v8, "modeType")))
    {
      v15 = 0;
      goto LABEL_57;
    }
    v40 = 1;
LABEL_62:
    shouldSuggestTriggers = self->_shouldSuggestTriggers;
    v15 = shouldSuggestTriggers == objc_msgSend(v8, "shouldSuggestTriggers");
    if ((v40 & 1) == 0)
    {
LABEL_58:
      if (v43)
      {
        if (!v46)
        {
LABEL_43:
          if (originAnchorType)
          {
            if (v48)
              goto LABEL_45;
          }
          else
          {

            if ((v48 & 1) != 0)
            {
LABEL_45:
              v36 = v49;

              if (originBundleId)
                goto LABEL_46;
LABEL_54:

              if ((v36 & 1) == 0)
              {
LABEL_48:
                if (!modeUUID)
                  goto LABEL_49;
LABEL_50:

                goto LABEL_51;
              }
LABEL_47:

              goto LABEL_48;
            }
          }
          v36 = v49;
          if (originBundleId)
          {
LABEL_46:
            if (!v36)
              goto LABEL_48;
            goto LABEL_47;
          }
          goto LABEL_54;
        }
LABEL_42:

        goto LABEL_43;
      }
      goto LABEL_64;
    }
LABEL_57:

    goto LABEL_58;
  }
  v15 = 0;
LABEL_51:

  return v15;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (NSString)suggestionUUID
{
  return self->_suggestionUUID;
}

- (int64_t)origin
{
  return self->_origin;
}

- (NSString)originBundleId
{
  return self->_originBundleId;
}

- (BOOL)isAutomationEnabled
{
  return self->_isAutomationEnabled;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (BOOL)shouldSuggestTriggers
{
  return self->_shouldSuggestTriggers;
}

- (unint64_t)uiLocation
{
  return self->_uiLocation;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (NSString)originAnchorType
{
  return self->_originAnchorType;
}

- (NSArray)serializedTriggers
{
  return self->_serializedTriggers;
}

- (unint64_t)modeType
{
  return self->_modeType;
}

- (NSString)userModeName
{
  return self->_userModeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userModeName, 0);
  objc_storeStrong((id *)&self->_serializedTriggers, 0);
  objc_storeStrong((id *)&self->_originAnchorType, 0);
  objc_storeStrong((id *)&self->_originBundleId, 0);
  objc_storeStrong((id *)&self->_suggestionUUID, 0);
  objc_storeStrong((id *)&self->_modeUUID, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMInferredModeEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)initWithProto:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_2();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMInferredModeEvent: unable to convert BMPBInferredModeType enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_2();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMInferredModeEvent: unable to convert BMPBInferredModeOrigin enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:.cold.3()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBInferredModeEvent proto", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)proto
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMInferredModeEvent: unable to convert BMInferredModeOrigin enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
