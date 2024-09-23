@implementation ATXSpotlightEventMetadata

- (ATXSpotlightEventMetadata)init
{
  return -[ATXSpotlightEventMetadata initWithQueryAtEngagement:engagedAppString:didSearchDuringSession:searchEngagedBundleId:searchEngagedActionType:](self, "initWithQueryAtEngagement:engagedAppString:didSearchDuringSession:searchEngagedBundleId:searchEngagedActionType:", 0, 0, 0, 0, 0);
}

- (ATXSpotlightEventMetadata)initWithQueryAtEngagement:(id)a3 engagedAppString:(id)a4 didSearchDuringSession:(id)a5 searchEngagedBundleId:(id)a6 searchEngagedActionType:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ATXSpotlightEventMetadata *v17;
  ATXSpotlightEventMetadata *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXSpotlightEventMetadata;
  v17 = -[ATXSpotlightEventMetadata init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queryAtEngagement, a3);
    objc_storeStrong((id *)&v18->_engagedAppString, a4);
    objc_storeStrong((id *)&v18->_didSearchDuringSession, a5);
    objc_storeStrong((id *)&v18->_searchEngagedBundleId, a6);
    objc_storeStrong((id *)&v18->_searchEngagedActionType, a7);
  }

  return v18;
}

- (ATXSpotlightEventMetadata)initWithProtoData:(id)a3
{
  id v4;
  ATXPBSpotlightEventMetadata *v5;
  ATXSpotlightEventMetadata *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBSpotlightEventMetadata initWithData:]([ATXPBSpotlightEventMetadata alloc], "initWithData:", v4);

    self = -[ATXSpotlightEventMetadata initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXSpotlightEventMetadata)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  ATXSpotlightEventMetadata *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightEventMetadata initWithProto:].cold.1((uint64_t)self, v7);

    goto LABEL_8;
  }
  v5 = v4;
  if (-[ATXPBSpotlightEventMetadata hasDidSearchDuringSession]((uint64_t)v5))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXPBSpotlightEventMetadata didSearchDuringSession]((_BOOL8)v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[ATXPBSpotlightEventMetadata hasSearchEngagedActionType]((uint64_t)v5))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ATXPBSpotlightEventMetadata searchEngagedActionType]((uint64_t)v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[ATXPBSpotlightEventMetadata queryAtEngagement]((uint64_t)v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSpotlightEventMetadata engagedAppString]((uint64_t)v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSpotlightEventMetadata searchEngagedBundleId]((uint64_t)v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[ATXSpotlightEventMetadata initWithQueryAtEngagement:engagedAppString:didSearchDuringSession:searchEngagedBundleId:searchEngagedActionType:](self, "initWithQueryAtEngagement:engagedAppString:didSearchDuringSession:searchEngagedBundleId:searchEngagedActionType:", v10, v11, v6, v12, v9);

  v8 = self;
LABEL_14:

  return v8;
}

- (id)proto
{
  void *v3;
  NSNumber *didSearchDuringSession;
  NSNumber *searchEngagedActionType;

  v3 = (void *)objc_opt_new();
  -[ATXPBSpotlightEventMetadata setQueryAtEngagement:]((uint64_t)v3, self->_queryAtEngagement);
  -[ATXPBSpotlightEventMetadata setEngagedAppString:]((uint64_t)v3, self->_engagedAppString);
  didSearchDuringSession = self->_didSearchDuringSession;
  if (didSearchDuringSession)
    -[ATXPBSpotlightEventMetadata setDidSearchDuringSession:]((uint64_t)v3, -[NSNumber BOOLValue](didSearchDuringSession, "BOOLValue"));
  -[ATXPBSpotlightEventMetadata setSearchEngagedBundleId:]((uint64_t)v3, self->_searchEngagedBundleId);
  searchEngagedActionType = self->_searchEngagedActionType;
  if (searchEngagedActionType)
    -[ATXPBSpotlightEventMetadata setSearchEngagedActionType:]((uint64_t)v3, -[NSNumber unsignedIntegerValue](searchEngagedActionType, "unsignedIntegerValue"));
  return v3;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXSpotlightEventMetadata proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
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
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

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
  -[ATXSpotlightEventMetadata encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXSpotlightEventMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXSpotlightEventMetadata *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXSpotlightEventMetadata initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ATXSpotlightEventMetadata *v4;
  ATXSpotlightEventMetadata *v5;
  BOOL v6;

  v4 = (ATXSpotlightEventMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXSpotlightEventMetadata isEqualToATXSpotlightEventMetadata:](self, "isEqualToATXSpotlightEventMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToATXSpotlightEventMetadata:(id)a3
{
  id *v4;
  NSString *queryAtEngagement;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *engagedAppString;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSNumber *didSearchDuringSession;
  NSNumber *v16;
  NSNumber *v17;
  NSNumber *v18;
  char v19;
  NSString *searchEngagedBundleId;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  char v25;
  NSNumber *v26;
  NSNumber *v27;

  v4 = (id *)a3;
  queryAtEngagement = self->_queryAtEngagement;
  v6 = (NSString *)v4[1];
  if (queryAtEngagement == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = queryAtEngagement;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_15;
  }
  engagedAppString = self->_engagedAppString;
  v11 = (NSString *)v4[2];
  if (engagedAppString == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = engagedAppString;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_15;
  }
  didSearchDuringSession = self->_didSearchDuringSession;
  v16 = (NSNumber *)v4[3];
  if (didSearchDuringSession == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = didSearchDuringSession;
    v19 = -[NSNumber isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_15;
  }
  searchEngagedBundleId = self->_searchEngagedBundleId;
  v21 = (NSString *)v4[4];
  if (searchEngagedBundleId == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = searchEngagedBundleId;
    v24 = -[NSString isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
    {
LABEL_15:
      v25 = 0;
      goto LABEL_21;
    }
  }
  v26 = self->_searchEngagedActionType;
  v27 = v26;
  if (v26 == v4[5])
    v25 = 1;
  else
    v25 = -[NSNumber isEqual:](v26, "isEqual:");

LABEL_21:
  return v25;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_queryAtEngagement, "hash");
  v4 = -[NSString hash](self->_engagedAppString, "hash") - v3 + 32 * v3;
  v5 = -[NSNumber hash](self->_didSearchDuringSession, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_searchEngagedBundleId, "hash") - v5 + 32 * v5;
  return -[NSNumber hash](self->_searchEngagedActionType, "hash") - v6 + 32 * v6;
}

- (NSString)queryAtEngagement
{
  return self->_queryAtEngagement;
}

- (void)setQueryAtEngagement:(id)a3
{
  objc_storeStrong((id *)&self->_queryAtEngagement, a3);
}

- (NSString)engagedAppString
{
  return self->_engagedAppString;
}

- (void)setEngagedAppString:(id)a3
{
  objc_storeStrong((id *)&self->_engagedAppString, a3);
}

- (NSNumber)didSearchDuringSession
{
  return self->_didSearchDuringSession;
}

- (void)setDidSearchDuringSession:(id)a3
{
  objc_storeStrong((id *)&self->_didSearchDuringSession, a3);
}

- (NSString)searchEngagedBundleId
{
  return self->_searchEngagedBundleId;
}

- (void)setSearchEngagedBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_searchEngagedBundleId, a3);
}

- (NSNumber)searchEngagedActionType
{
  return self->_searchEngagedActionType;
}

- (void)setSearchEngagedActionType:(id)a3
{
  objc_storeStrong((id *)&self->_searchEngagedActionType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchEngagedActionType, 0);
  objc_storeStrong((id *)&self->_searchEngagedBundleId, 0);
  objc_storeStrong((id *)&self->_didSearchDuringSession, 0);
  objc_storeStrong((id *)&self->_engagedAppString, 0);
  objc_storeStrong((id *)&self->_queryAtEngagement, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBSpotlightEventMetadata proto", (uint8_t *)&v5, 0xCu);

}

@end
