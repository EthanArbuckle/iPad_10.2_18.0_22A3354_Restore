@implementation BMIntentEvent

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMIntentEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)eventWithDKEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  BMIntentEvent *v30;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  BMIntentEvent *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKIntentMetadataKeyClass(), "serializedInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "metadata");
    v7 = objc_claimAutoreleasedReturnValue();
    v30 = [BMIntentEvent alloc];
    objc_msgSend(v3, "startDate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "timeIntervalSinceReferenceDate");
    v9 = v8;
    objc_msgSend(v3, "source");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bundleID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "sourceID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(get_DKIntentMetadataKeyClass(), "intentClass");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(get_DKIntentMetadataKeyClass(), "intentVerb");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(get_DKIntentMetadataKeyClass(), "intentType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v36, "integerValue");
    objc_msgSend(v3, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(get_DKIntentMetadataKeyClass(), "intentHandlingStatus");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v10;
    objc_msgSend(v10, "objectForKeyedSubscript:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v33, "integerValue");
    objc_msgSend(get_DKIntentMetadataKeyClass(), "serializedInteraction");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "itemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(get_DKIntentMetadataKeyClass(), "donatedBySiri");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v27, "BOOLValue");
    objc_msgSend(get_DKIntentMetadataKeyClass(), "direction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");
    if (v16 >= 4)
    {
      __biome_log_for_category();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        +[BMIntentEvent eventWithDKEvent:].cold.1();

      v17 = 0;
    }
    else
    {
      v17 = qword_18DC0B2C0[v16];
    }
    objc_msgSend(v3, "source");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "groupID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = v13;
    v48 = -[BMIntentEvent initWithAbsoluteTime:bundleId:sourceId:intentClass:intentVerb:intentType:intentHandlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:](v30, "initWithAbsoluteTime:bundleId:sourceId:intentClass:intentVerb:intentType:intentHandlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:", v44, v42, v40, v38, v47, v29, v9, v11, v12, v26, v17, v24);

  }
  else
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "source");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bundleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "source");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sourceID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v19;
      v51 = 2112;
      v52 = v21;
      _os_log_impl(&dword_18D810000, v7, OS_LOG_TYPE_INFO, "nil interaction found on event bundle:%{public}@ source:%{}@", buf, 0x16u);

    }
    v48 = 0;
  }

  return v48;
}

- (BMIntentEvent)initWithAbsoluteTime:(double)a3 bundleId:(id)a4 sourceId:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int64_t)a8 intentHandlingStatus:(int64_t)a9 interaction:(id)a10 itemID:(id)a11 donatedBySiri:(BOOL)a12 interactionDirection:(int64_t)a13 groupIdentifier:(id)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BMIntentEvent *v27;
  BMIntentEvent *v28;
  void *v30;
  objc_super v33;

  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a10;
  v25 = a11;
  v26 = a14;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMIntentStreams.m"), 391, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interaction != nil"));

  }
  v33.receiver = self;
  v33.super_class = (Class)BMIntentEvent;
  v27 = -[BMEventBase init](&v33, sel_init);
  v28 = v27;
  if (v27)
  {
    -[BMIntentEvent setAbsoluteTimestamp:](v27, "setAbsoluteTimestamp:", a3);
    -[BMIntentEvent setBundleID:](v28, "setBundleID:", v20);
    -[BMIntentEvent setSourceId:](v28, "setSourceId:", v21);
    -[BMIntentEvent setIntentClass:](v28, "setIntentClass:", v22);
    -[BMIntentEvent setIntentVerb:](v28, "setIntentVerb:", v23);
    -[BMIntentEvent setIntentType:](v28, "setIntentType:", a8);
    -[BMIntentEvent setIntentHandlingStatus:](v28, "setIntentHandlingStatus:", a9);
    -[BMIntentEvent setInteraction:](v28, "setInteraction:", v24);
    -[BMIntentEvent setItemID:](v28, "setItemID:", v25);
    -[BMIntentEvent setDonatedBySiri:](v28, "setDonatedBySiri:", a12);
    -[BMIntentEvent setInteractionDirection:](v28, "setInteractionDirection:", a13);
    -[BMIntentEvent setGroupIdentifier:](v28, "setGroupIdentifier:", v26);
  }

  return v28;
}

- (void)setSourceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setInteractionDirection:(int64_t)a3
{
  self->_interactionDirection = a3;
}

- (void)setInteraction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setIntentVerb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setIntentType:(int64_t)a3
{
  self->_intentType = a3;
}

- (void)setIntentHandlingStatus:(int64_t)a3
{
  self->_intentHandlingStatus = a3;
}

- (void)setIntentClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setDonatedBySiri:(BOOL)a3
{
  self->_donatedBySiri = a3;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setAbsoluteTimestamp:(double)a3
{
  self->_absoluteTimestamp = a3;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;

  v3 = (void *)objc_opt_new();
  -[BMIntentEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  -[BMIntentEvent bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleID:", v4);

  -[BMIntentEvent sourceId](self, "sourceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceId:", v5);

  -[BMIntentEvent intentClass](self, "intentClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIntentClass:", v6);

  -[BMIntentEvent intentVerb](self, "intentVerb");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIntentVerb:", v7);

  v8 = -[BMIntentEvent intentType](self, "intentType");
  if (v8 >= 4)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[BMIntentEvent proto].cold.3();

    v8 = 0;
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  v11 = 0;
  switch(-[BMIntentEvent intentHandlingStatus](self, "intentHandlingStatus"))
  {
    case 0:
      break;
    case 1:
      v11 = 1;
      break;
    case 2:
      v11 = 2;
      break;
    case 3:
      v11 = 3;
      break;
    case 4:
      v11 = 4;
      break;
    case 5:
      v11 = 5;
      break;
    case 6:
      v11 = 6;
      break;
    default:
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[BMIntentEvent proto].cold.2();

      v11 = 0;
      v9 = 1;
      break;
  }
  v13 = -[BMIntentEvent interactionDirection](self, "interactionDirection");
  if (v13 >= 4)
  {
    __biome_log_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BMIntentEvent proto].cold.1();

    goto LABEL_22;
  }
  if (v9)
  {
LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v3, "setIntentType:", v8);
  objc_msgSend(v3, "setIntentHandlingStatus:", v11);
  -[BMIntentEvent interaction](self, "interaction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInteraction:", v14);

  -[BMIntentEvent itemID](self, "itemID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setItemID:", v15);

  objc_msgSend(v3, "setDonatedBySiri:", -[BMIntentEvent donatedBySiri](self, "donatedBySiri"));
  objc_msgSend(v3, "setInteractionDirection:", v13);
  -[BMIntentEvent groupIdentifier](self, "groupIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGroupIdentifier:", v16);

  v17 = v3;
LABEL_23:

  return v17;
}

- (NSString)sourceId
{
  return self->_sourceId;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (NSData)interaction
{
  return self->_interaction;
}

- (int64_t)interactionDirection
{
  return self->_interactionDirection;
}

- (NSString)intentVerb
{
  return self->_intentVerb;
}

- (int64_t)intentType
{
  return self->_intentType;
}

- (int64_t)intentHandlingStatus
{
  return self->_intentHandlingStatus;
}

- (NSString)intentClass
{
  return self->_intentClass;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (BOOL)donatedBySiri
{
  return self->_donatedBySiri;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (unsigned)dataVersion
{
  return 11;
}

- (BMIntentEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBIntentEvent *v5;
  BMIntentEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBIntentEvent initWithData:]([BMPBIntentEvent alloc], "initWithData:", v4);

    self = -[BMIntentEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BMIntentEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  BMIntentEvent *v7;
  NSObject *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v23 = typeWithBMPBIntentType(-[NSObject intentType](v5, "intentType"));
      v6 = -[NSObject intentHandlingStatus](v5, "intentHandlingStatus");
      if (v6 >= 7)
      {
        __biome_log_for_category();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[BMIntentEvent initWithProto:].cold.1();

        v22 = 0;
      }
      else
      {
        v22 = v6;
      }
      v21 = interactionDirectionWithPB(-[NSObject interactionDirection](v5, "interactionDirection"));
      -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
      v10 = v9;
      -[NSObject bundleID](v5, "bundleID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject sourceId](v5, "sourceId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject intentClass](v5, "intentClass");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject intentVerb](v5, "intentVerb");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject interaction](v5, "interaction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject itemID](v5, "itemID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[NSObject donatedBySiri](v5, "donatedBySiri");
      -[NSObject groupIdentifier](v5, "groupIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v19) = v16;
      self = -[BMIntentEvent initWithAbsoluteTime:bundleId:sourceId:intentClass:intentVerb:intentType:intentHandlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:](self, "initWithAbsoluteTime:bundleId:sourceId:intentClass:intentVerb:intentType:intentHandlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:", v20, v11, v12, v13, v23, v22, v10, v14, v15, v19, v21, v17);

      v7 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMIntentEvent initWithProto:].cold.2();
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_intentVerb, 0);
  objc_storeStrong((id *)&self->_intentClass, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  objc_class *v11;
  NSObject *v12;
  uint64_t v14;

  v6 = a3;
  if (a4 == 12)
  {
    v11 = (objc_class *)BMIntentEvent_v12;
LABEL_10:
    v10 = (id)objc_msgSend([v11 alloc], "initWithProtoData:", v6);
    goto LABEL_16;
  }
  if (a4 == 9)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v14)
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[BMIntentEvent eventWithData:dataVersion:].cold.2();

      v10 = 0;
    }
    else
    {
      v10 = v7;
    }

    goto LABEL_16;
  }
  if ((a4 & 0xFFFFFFFE) == 0xA)
  {
    v11 = (objc_class *)a1;
    goto LABEL_10;
  }
  __biome_log_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    +[BMIntentEvent eventWithData:dataVersion:].cold.1();

  v10 = 0;
LABEL_16:

  return v10;
}

- (BMIntentEvent)initWithAbsoluteTime:(double)a3 bundleId:(id)a4 sourceId:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int64_t)a8 intentHandlingStatus:(int64_t)a9 interaction:(id)a10 itemID:(id)a11
{
  uint64_t v12;

  LOBYTE(v12) = 0;
  return -[BMIntentEvent initWithAbsoluteTime:bundleId:sourceId:intentClass:intentVerb:intentType:intentHandlingStatus:interaction:itemID:donatedBySiri:interactionDirection:](self, "initWithAbsoluteTime:bundleId:sourceId:intentClass:intentVerb:intentType:intentHandlingStatus:interaction:itemID:donatedBySiri:interactionDirection:", a4, a5, a6, a7, a8, a9, a3, a10, a11, v12, 0);
}

- (BMIntentEvent)initWithAbsoluteTime:(double)a3 bundleId:(id)a4 sourceId:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int64_t)a8 intentHandlingStatus:(int64_t)a9 interaction:(id)a10 itemID:(id)a11 donatedBySiri:(BOOL)a12 interactionDirection:(int64_t)a13
{
  uint64_t v14;

  LOBYTE(v14) = a12;
  return -[BMIntentEvent initWithAbsoluteTime:bundleId:sourceId:intentClass:intentVerb:intentType:intentHandlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:](self, "initWithAbsoluteTime:bundleId:sourceId:intentClass:intentVerb:intentType:intentHandlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:", a4, a5, a6, a7, a8, a9, a3, a10, a11, v14, a13, 0);
}

- (BMIntentEvent)initWithAbsoluteTime:(double)a3 bundleId:(id)a4 sourceId:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int64_t)a8 intentHandlingStatus:(int64_t)a9 interaction:(id)a10
{
  return -[BMIntentEvent initWithAbsoluteTime:bundleId:sourceId:intentClass:intentVerb:intentType:intentHandlingStatus:interaction:itemID:](self, "initWithAbsoluteTime:bundleId:sourceId:intentClass:intentVerb:intentType:intentHandlingStatus:interaction:itemID:", a4, a5, a6, a7, a8, a9, a3, a10, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForCFAbsoluteTime:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3 == 0.0)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode key %@"), v11, *MEMORY[0x1E0CB2D50]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v13, a7, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode key %@"), v11, *MEMORY[0x1E0CB2D50]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v13, a7, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForuint32_t:(unsigned int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode key %@"), v11, *MEMORY[0x1E0CB2D50]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v13, a7, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMIntentEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protoData"));

}

- (BMIntentEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BMIntentEvent *v6;
  objc_class *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protoData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[BMIntentEvent initWithProtoData:](self, "initWithProtoData:", v5);
    v6 = self;
  }
  else
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("absoluteTime"));
    v10 = v9;
    if (-[BMIntentEvent checkAndReportDecodingFailureIfNeededForCFAbsoluteTime:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForCFAbsoluteTime:key:coder:errorDomain:errorCode:", CFSTR("absoluteTime"), v4, v8, -1))
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceId"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentClass"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentVerb"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("intentType"));
      v18 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("intentHandlingStatus"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interaction"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v17) = 0;
      self = -[BMIntentEvent initWithAbsoluteTime:bundleId:sourceId:intentClass:intentVerb:intentType:intentHandlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:](self, "initWithAbsoluteTime:bundleId:sourceId:intentClass:intentVerb:intentType:intentHandlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:", v11, v12, v20, v13, v19, v18, v10, v14, v15, v17, 0, 0);

      v6 = self;
    }

  }
  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMIntentEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v26, "hash");
  -[BMIntentEvent bundleID](self, "bundleID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v25, "hash");
  -[BMIntentEvent sourceId](self, "sourceId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v24, "hash");
  -[BMIntentEvent intentClass](self, "intentClass");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 ^ objc_msgSend(v23, "hash");
  -[BMIntentEvent intentVerb](self, "intentVerb");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[BMIntentEvent intentType](self, "intentType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[BMIntentEvent intentHandlingStatus](self, "intentHandlingStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v11 ^ objc_msgSend(v12, "hash");
  -[BMIntentEvent interaction](self, "interaction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMIntentEvent donatedBySiri](self, "donatedBySiri"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[BMIntentEvent interactionDirection](self, "interactionDirection"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13 ^ v17 ^ objc_msgSend(v18, "hash");
  -[BMIntentEvent groupIdentifier](self, "groupIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[BMIntentEvent absoluteTimestamp](self, "absoluteTimestamp");
    v9 = v8;
    objc_msgSend(v7, "absoluteTimestamp");
    if (v9 != v10)
    {
      v14 = 0;
LABEL_44:

      goto LABEL_45;
    }
    -[BMIntentEvent bundleID](self, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v7, "bundleID"), (v60 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[BMIntentEvent bundleID](self, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqual:", v3) & 1) == 0)
      {

        v14 = 0;
LABEL_41:
        if (!v11)

        goto LABEL_44;
      }
      v57 = v12;
      v13 = 1;
    }
    else
    {
      v60 = 0;
      v13 = 0;
    }
    -[BMIntentEvent intentClass](self, "intentClass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 || (objc_msgSend(v7, "intentClass"), (v55 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[BMIntentEvent intentClass](self, "intentClass");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "intentClass");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v16;
      if (!objc_msgSend(v16, "isEqual:", v4))
      {
        v14 = 0;
        goto LABEL_36;
      }
      v56 = 1;
    }
    else
    {
      v55 = 0;
      v56 = 0;
    }
    -[BMIntentEvent intentVerb](self, "intentVerb");
    v58 = objc_claimAutoreleasedReturnValue();
    if (!v58)
    {
      objc_msgSend(v7, "intentVerb");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v50)
      {
        v53 = v4;
        v17 = v13;
        v20 = v60;
        v50 = 0;
        v52 = 0;
LABEL_26:
        v22 = -[BMIntentEvent intentHandlingStatus](self, "intentHandlingStatus");
        v60 = v20;
        if (v22 != objc_msgSend(v7, "intentHandlingStatus"))
        {
          v14 = 0;
          v13 = v17;
          v4 = v53;
          v24 = v51;
          if ((v52 & 1) == 0)
            goto LABEL_33;
          goto LABEL_32;
        }
        -[BMIntentEvent interaction](self, "interaction");
        v48 = objc_claimAutoreleasedReturnValue();
        if (v48 || (objc_msgSend(v7, "interaction"), (v43 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[BMIntentEvent interaction](self, "interaction");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "interaction");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v23;
          v13 = v17;
          if (!objc_msgSend(v23, "isEqual:"))
          {
            v14 = 0;
            v4 = v53;
            v24 = v51;
            v27 = v52;
LABEL_69:

            goto LABEL_70;
          }
          v44 = 1;
        }
        else
        {
          v43 = 0;
          v44 = 0;
          v13 = v17;
        }
        -[BMIntentEvent itemID](self, "itemID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v28;
        if (v28 || (objc_msgSend(v7, "itemID"), (v41 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[BMIntentEvent itemID](self, "itemID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "itemID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v53;
          if ((objc_msgSend(v29, "isEqual:", v28) & 1) == 0)
          {

            v30 = v45;
            if (!v45)
              v30 = v41;

            v14 = 0;
            v24 = v51;
            v27 = v52;
            if ((v44 & 1) != 0)
              goto LABEL_69;
            goto LABEL_70;
          }
          v40 = v29;
          v42 = 1;
        }
        else
        {
          v41 = 0;
          v42 = 0;
          v4 = v53;
        }
        v31 = -[BMIntentEvent donatedBySiri](self, "donatedBySiri");
        if (v31 != objc_msgSend(v7, "donatedBySiri")
          || (v32 = -[BMIntentEvent interactionDirection](self, "interactionDirection"),
              v32 != objc_msgSend(v7, "interactionDirection")))
        {
          v14 = 0;
          if (!v42)
            goto LABEL_66;
          goto LABEL_65;
        }
        -[BMIntentEvent groupIdentifier](self, "groupIdentifier");
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33 || (objc_msgSend(v7, "groupIdentifier"), (v38 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v54 = v28;
          -[BMIntentEvent groupIdentifier](self, "groupIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "groupIdentifier");
          v34 = (void *)v33;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v39, "isEqual:", v35);

          if (v34)
          {

            v28 = v54;
            if ((v42 & 1) == 0)
              goto LABEL_66;
            goto LABEL_65;
          }
          v37 = (void *)v38;
          v28 = v54;
        }
        else
        {
          v37 = 0;
          v14 = 1;
        }

        if ((v42 & 1) == 0)
        {
LABEL_66:
          if (!v45)

          v24 = v51;
          v27 = v52;
          if (v44)
            goto LABEL_69;
LABEL_70:
          v36 = (void *)v48;
          if (!v48)
          {

            v36 = 0;
          }

          if (!v27)
          {
LABEL_33:
            v25 = (void *)v58;
            if (!v58)
            {

              v25 = 0;
            }

            if (!v56)
              goto LABEL_37;
            goto LABEL_36;
          }
LABEL_32:

          goto LABEL_33;
        }
LABEL_65:

        goto LABEL_66;
      }
    }
    v17 = v13;
    -[BMIntentEvent intentVerb](self, "intentVerb");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intentVerb");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqual:", v19) & 1) != 0)
    {
      v51 = v19;
      v49 = v18;
      v53 = v4;
      v20 = v60;
      v52 = 1;
      goto LABEL_26;
    }

    v21 = (void *)v58;
    if (!v58)
      v21 = v50;

    v14 = 0;
    v13 = v17;
    if ((v56 & 1) == 0)
      goto LABEL_37;
LABEL_36:

LABEL_37:
    if (!v15)

    if (v13)
    {

    }
    goto LABEL_41;
  }
  v14 = 0;
LABEL_45:

  return v14;
}

- (NSString)identifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), self->_bundleID, self->_itemID);
}

+ (int64_t)stream
{
  return 2;
}

+ (void)eventWithDKEvent:.cold.1()
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMIntentEvent: unable to convert _CDInteractionDirection enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_0(&dword_18D810000, v0, v1, "Mismatched BMIntentEvent data versions, cannot deserialize", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)eventWithData:dataVersion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_0(&dword_18D810000, v0, v1, "Unable to unarchive BMIntentEvent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMIntentEvent: unable to convert BMPBIntentHandlingStatus enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:.cold.2()
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
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBIntentEvent proto", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)proto
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMIntentEvent: unable to convert BMIntentType enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

@end
