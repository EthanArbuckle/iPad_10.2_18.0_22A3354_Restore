@implementation IMSpotlightClientState

+ (int64_t)_latestIndexRevision
{
  return 37;
}

+ (int64_t)_latestIndexVersion
{
  return 3;
}

- (IMSpotlightClientState)initWithMaxRowID:(unint64_t)a3 totalMessages:(unint64_t)a4
{
  IMSpotlightClientState *v6;
  IMSpotlightClientState *v7;
  int64_t v8;
  uint64_t v9;
  NSDate *indexBeginDate;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IMSpotlightClientState;
  v6 = -[IMSpotlightClientState init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lastIndexedRowID = a3 + 1;
    v6->_initialReindexRowID = a3 + 1;
    v6->_indexRevision = +[IMSpotlightClientState _latestIndexRevision](IMSpotlightClientState, "_latestIndexRevision");
    v8 = +[IMSpotlightClientState _latestIndexVersion](IMSpotlightClientState, "_latestIndexVersion");
    v7->_processedMessageRecords = 0;
    v7->_initialTotalMessages = a4;
    v7->_indexVersion = v8;
    v7->_initialIndexedMessages = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = objc_claimAutoreleasedReturnValue();
    indexBeginDate = v7->_indexBeginDate;
    v7->_indexBeginDate = (NSDate *)v9;

  }
  return v7;
}

- (id)_initWithLastIndexedRowID:(unint64_t)a3 initialReindexRowID:(unint64_t)a4 indexRevision:(int64_t)a5 indexVersion:(int64_t)a6 initialIndexedMessages:(int64_t)a7 initialTotalMessages:(int64_t)a8 processedMessageRecords:(unint64_t)a9 indexingBeganDate:(id)a10
{
  id v17;
  IMSpotlightClientState *v18;
  IMSpotlightClientState *v19;
  objc_super v21;

  v17 = a10;
  v21.receiver = self;
  v21.super_class = (Class)IMSpotlightClientState;
  v18 = -[IMSpotlightClientState init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_lastIndexedRowID = a3;
    v18->_initialReindexRowID = a4;
    v18->_indexRevision = a5;
    v18->_indexVersion = a6;
    v18->_processedMessageRecords = a9;
    v18->_initialTotalMessages = a8;
    v18->_initialIndexedMessages = a7;
    objc_storeStrong((id *)&v18->_indexBeginDate, a10);
  }

  return v19;
}

- (BOOL)needsReindex
{
  int64_t v2;

  v2 = -[IMSpotlightClientState indexRevision](self, "indexRevision");
  return v2 < +[IMSpotlightClientState _latestIndexRevision](IMSpotlightClientState, "_latestIndexRevision");
}

- (BOOL)needsIndexDrop
{
  int64_t v2;

  v2 = -[IMSpotlightClientState indexVersion](self, "indexVersion");
  return v2 < +[IMSpotlightClientState _latestIndexVersion](IMSpotlightClientState, "_latestIndexVersion");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMSpotlightClientState)initWithCoder:(id)a3
{
  id v4;
  IMSpotlightClientState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDate *indexBeginDate;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IMSpotlightClientState;
  v5 = -[IMSpotlightClientState init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastIndexedRowID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lastIndexedRowID = objc_msgSend(v6, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialMaxRowID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_initialReindexRowID = objc_msgSend(v7, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("indexRevision"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_indexRevision = objc_msgSend(v8, "longLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("indexVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_indexVersion = objc_msgSend(v9, "longLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialIndexedMessages"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_initialIndexedMessages = objc_msgSend(v10, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialTotalMessages"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_initialTotalMessages = objc_msgSend(v11, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processedMessageRecords"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_processedMessageRecords = objc_msgSend(v12, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("indexingBeganDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    indexBeginDate = v5->_indexBeginDate;
    v5->_indexBeginDate = (NSDate *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t lastIndexedRowID;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  lastIndexedRowID = self->_lastIndexedRowID;
  v13 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", lastIndexedRowID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("lastIndexedRowID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_initialReindexRowID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("initialMaxRowID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_indexRevision);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("indexRevision"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_indexVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("indexVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_initialIndexedMessages);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("initialIndexedMessages"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_initialTotalMessages);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("initialTotalMessages"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_processedMessageRecords);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("processedMessageRecords"));

  objc_msgSend(v13, "encodeObject:forKey:", self->_indexBeginDate, CFSTR("indexingBeganDate"));
}

- (IMSpotlightClientState)initWithData:(id)a3 error:(id *)a4
{
  uint64_t v6;
  id v7;
  IMSpotlightClientState *v8;

  v6 = qword_1EE503A28;
  v7 = a3;
  if (v6 != -1)
    dispatch_once(&qword_1EE503A28, &unk_1E3FB39C8);
  objc_msgSend(MEMORY[0x1E0CB3710], "_strictlyUnarchivedObjectOfClasses:fromData:error:", qword_1EE503A48, v7, a4);
  v8 = (IMSpotlightClientState *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p lastIndexedRow=%llu initialReindexRowID=%llu indexRevision=%lld indexVersion=%lld initialIndexedMessages=%lld initialTotalMessages=%lld processedMessageRecords=%lld indexBeginDate=%@>"), v5, self, self->_lastIndexedRowID, self->_initialReindexRowID, self->_indexRevision, self->_indexVersion, self->_initialIndexedMessages, self->_initialTotalMessages, self->_processedMessageRecords, self->_indexBeginDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IMSpotlightClientState *v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;

  v4 = [IMSpotlightClientState alloc];
  v5 = -[IMSpotlightClientState lastIndexedRowID](self, "lastIndexedRowID");
  v6 = -[IMSpotlightClientState initialReindexRowID](self, "initialReindexRowID");
  v7 = -[IMSpotlightClientState indexRevision](self, "indexRevision");
  v8 = -[IMSpotlightClientState indexVersion](self, "indexVersion");
  v9 = -[IMSpotlightClientState initialIndexedMessages](self, "initialIndexedMessages");
  v10 = -[IMSpotlightClientState initialTotalMessages](self, "initialTotalMessages");
  v11 = -[IMSpotlightClientState processedMessageRecords](self, "processedMessageRecords");
  -[IMSpotlightClientState indexBeginDate](self, "indexBeginDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IMSpotlightClientState _initWithLastIndexedRowID:initialReindexRowID:indexRevision:indexVersion:initialIndexedMessages:initialTotalMessages:processedMessageRecords:indexingBeganDate:](v4, "_initWithLastIndexedRowID:initialReindexRowID:indexRevision:indexVersion:initialIndexedMessages:initialTotalMessages:processedMessageRecords:indexingBeganDate:", v5, v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (unint64_t)lastIndexedRowID
{
  return self->_lastIndexedRowID;
}

- (void)setLastIndexedRowID:(unint64_t)a3
{
  self->_lastIndexedRowID = a3;
}

- (unint64_t)initialReindexRowID
{
  return self->_initialReindexRowID;
}

- (void)setInitialReindexRowID:(unint64_t)a3
{
  self->_initialReindexRowID = a3;
}

- (int64_t)indexRevision
{
  return self->_indexRevision;
}

- (void)setIndexRevision:(int64_t)a3
{
  self->_indexRevision = a3;
}

- (int64_t)indexVersion
{
  return self->_indexVersion;
}

- (void)setIndexVersion:(int64_t)a3
{
  self->_indexVersion = a3;
}

- (unint64_t)initialIndexedMessages
{
  return self->_initialIndexedMessages;
}

- (void)setInitialIndexedMessages:(unint64_t)a3
{
  self->_initialIndexedMessages = a3;
}

- (unint64_t)processedMessageRecords
{
  return self->_processedMessageRecords;
}

- (void)setProcessedMessageRecords:(unint64_t)a3
{
  self->_processedMessageRecords = a3;
}

- (unint64_t)initialTotalMessages
{
  return self->_initialTotalMessages;
}

- (void)setInitialTotalMessages:(unint64_t)a3
{
  self->_initialTotalMessages = a3;
}

- (NSDate)indexBeginDate
{
  return self->_indexBeginDate;
}

- (void)setIndexBeginDate:(id)a3
{
  objc_storeStrong((id *)&self->_indexBeginDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexBeginDate, 0);
}

@end
