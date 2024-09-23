@implementation PARRequest

- (void)beginNWActivity
{
  PARRequest *v2;

  v2 = self;
  PARRequest.beginNWActivity()();

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unsigned __int8 uu[8];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_queryId, CFSTR("queryId"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("scale"), self->_scale);
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryItems, CFSTR("queryItems"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_headerItems, CFSTR("headerItems"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_verboseReply, CFSTR("verboseReply"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_triggerEvent, CFSTR("triggerEvent"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_pretend, CFSTR("_pretend"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardInputMode, CFSTR("_keyboardInputMode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_experimentNamespaceId, CFSTR("experimentNamespaceId"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isClientOnlyExperiment, CFSTR("isClientOnlyExperiment"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isInReservedAllocationForExperiment, CFSTR("isInReservedAllocationForExperiment"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_experimentId, CFSTR("experimentId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_treatmentId, CFSTR("treatmentId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryCommand, CFSTR("queryCommand"));
  if (self->_nwActivity)
  {
    *(_QWORD *)uu = 0;
    v6 = 0;
    nw_activity_get_token();
    if (!uuid_is_null(uu))
      objc_msgSend(v4, "encodeBytes:length:forKey:", uu, 16, CFSTR("_nwActivityToken"));
  }

}

- (PARRequest)initWithCoder:(id)a3
{
  id v4;
  PARRequest *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *queryItems;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *headerItems;
  uint64_t v17;
  NSString *keyboardInputMode;
  uint64_t v19;
  NSString *experimentNamespaceId;
  uint64_t v21;
  NSString *experimentId;
  uint64_t v23;
  NSString *treatmentId;
  uint64_t v25;
  SFCommand *queryCommand;
  uint64_t v27;
  OS_nw_activity *nwActivity;
  uint64_t v30;
  objc_super v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PARRequest;
  v5 = -[PARRequest init](&v31, sel_init);
  if (v5)
  {
    v5->_queryId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("queryId"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scale"));
    v5->_scale = v6;
    v7 = (void *)MEMORY[0x1E0C99E60];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("queryItems"));
    v10 = objc_claimAutoreleasedReturnValue();
    queryItems = v5->_queryItems;
    v5->_queryItems = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("headerItems"));
    v15 = objc_claimAutoreleasedReturnValue();
    headerItems = v5->_headerItems;
    v5->_headerItems = (NSDictionary *)v15;

    v5->_verboseReply = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("verboseReply"));
    v5->_triggerEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("triggerEvent"));
    v5->_pretend = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_pretend"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_keyboardInputMode"));
    v17 = objc_claimAutoreleasedReturnValue();
    keyboardInputMode = v5->_keyboardInputMode;
    v5->_keyboardInputMode = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experimentNamespaceId"));
    v19 = objc_claimAutoreleasedReturnValue();
    experimentNamespaceId = v5->_experimentNamespaceId;
    v5->_experimentNamespaceId = (NSString *)v19;

    v5->_isClientOnlyExperiment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isClientOnlyExperiment"));
    v5->_isInReservedAllocationForExperiment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInReservedAllocationForExperiment"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experimentId"));
    v21 = objc_claimAutoreleasedReturnValue();
    experimentId = v5->_experimentId;
    v5->_experimentId = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("treatmentId"));
    v23 = objc_claimAutoreleasedReturnValue();
    treatmentId = v5->_treatmentId;
    v5->_treatmentId = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryCommand"));
    v25 = objc_claimAutoreleasedReturnValue();
    queryCommand = v5->_queryCommand;
    v5->_queryCommand = (SFCommand *)v25;

    v30 = 0;
    objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("_nwActivityToken"), &v30);
    if (v30 == 16)
    {
      v27 = nw_activity_create_from_token();
      nwActivity = v5->_nwActivity;
      v5->_nwActivity = (OS_nw_activity *)v27;

    }
  }

  return v5;
}

- (unint64_t)clientQueryId
{
  return self->_queryId;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (unsigned)nwActivityLabel
{
  return 0;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (NSString)keyboardInputMode
{
  return self->_keyboardInputMode;
}

- (void)setKeyboardInputMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)experimentNamespaceId
{
  return self->_experimentNamespaceId;
}

- (void)setExperimentNamespaceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isClientOnlyExperiment
{
  return self->_isClientOnlyExperiment;
}

- (void)setIsClientOnlyExperiment:(BOOL)a3
{
  self->_isClientOnlyExperiment = a3;
}

- (BOOL)isInReservedAllocationForExperiment
{
  return self->_isInReservedAllocationForExperiment;
}

- (void)setIsInReservedAllocationForExperiment:(BOOL)a3
{
  self->_isInReservedAllocationForExperiment = a3;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)clientShortName
{
  return self->_clientShortName;
}

- (void)setClientShortName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)verboseReply
{
  return self->_verboseReply;
}

- (void)setVerboseReply:(BOOL)a3
{
  self->_verboseReply = a3;
}

- (BOOL)pretend
{
  return self->_pretend;
}

- (void)setPretend:(BOOL)a3
{
  self->_pretend = a3;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (NSArray)queryItems
{
  return self->_queryItems;
}

- (void)setQueryItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)headerItems
{
  return self->_headerItems;
}

- (void)setHeaderItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (SFCommand)queryCommand
{
  return self->_queryCommand;
}

- (void)setQueryCommand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (OS_nw_activity)nwActivity
{
  return self->_nwActivity;
}

- (void)setNwActivity:(id)a3
{
  objc_storeStrong((id *)&self->_nwActivity, a3);
}

- (char)nwActivityToken
{
  return self->_nwActivityToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwActivity, 0);
  objc_storeStrong((id *)&self->_queryCommand, 0);
  objc_storeStrong((id *)&self->_headerItems, 0);
  objc_storeStrong((id *)&self->_queryItems, 0);
  objc_storeStrong((id *)&self->_clientShortName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_experimentNamespaceId, 0);
  objc_storeStrong((id *)&self->_keyboardInputMode, 0);
}

+ (id)searchRequestWithString:(id)a3 triggerEvent:(unint64_t)a4
{
  id v5;
  PARSearchRequest *v6;
  PARSearchRequest *v7;

  v5 = a3;
  v6 = objc_alloc_init(PARSearchRequest);
  v7 = v6;
  if (v6)
  {
    -[PARSearchRequest setQueryString:](v6, "setQueryString:", v5);
    -[PARRequest setTriggerEvent:](v7, "setTriggerEvent:", a4);
  }

  return v7;
}

+ (id)searchRequestWithString:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "searchRequestWithString:triggerEvent:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "setQueryId:", a5);
  return v7;
}

+ (id)searchRequestWithEngagedSuggestion:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  objc_msgSend(v8, "suggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "searchRequestWithString:triggerEvent:queryId:", v9, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setEngagedSuggestion:", v8);
  return v10;
}

+ (id)searchRequestWithCommand:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "searchRequestWithCommand:triggerEvent:queryId:queryString:", a3, a4, a5, &stru_1E39232C8);
}

+ (id)searchRequestWithCommand:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5 queryString:(id)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a3;
  objc_msgSend(a1, "searchRequestWithString:triggerEvent:queryId:", a6, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "setQueryCommand:", v10);

  return v12;
}

+ (id)searchReplayRequestWithString:(id)a3
{
  id v3;
  PARSearchReplayRequest *v4;
  PARSearchReplayRequest *v5;

  v3 = a3;
  v4 = objc_alloc_init(PARSearchReplayRequest);
  v5 = v4;
  if (v4)
    -[PARSearchRequest setQueryString:](v4, "setQueryString:", v3);

  return v5;
}

+ (id)moreResultsRequestWithURL:(id)a3
{
  id v3;
  PARMoreResultsRequest *v4;
  PARMoreResultsRequest *v5;

  v3 = a3;
  v4 = objc_alloc_init(PARMoreResultsRequest);
  v5 = v4;
  if (v4)
  {
    -[PARMoreResultsRequest setMoreResultsURL:](v4, "setMoreResultsURL:", v3);
    -[PARRequest setTriggerEvent:](v5, "setTriggerEvent:", 13);
  }

  return v5;
}

+ (id)moreResultsRequestWithURL:(id)a3 queryId:(unint64_t)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "moreResultsRequestWithURL:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setQueryId:", a4);
  return v6;
}

+ (id)cardRequestWithURL:(id)a3
{
  id v3;
  PARCardRequest *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(PARCardRequest);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PARCardRequest setCardURL:](v4, "setCardURL:", v5);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[PARCardRequest setCardURL:](v4, "setCardURL:", v3);
    }
    -[PARRequest setTriggerEvent:](v4, "setTriggerEvent:", 14);
  }

  return v4;
}

+ (id)cardRequestWithURL:(id)a3 queryId:(unint64_t)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "cardRequestWithURL:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setQueryId:", a4);
  return v6;
}

+ (id)zeroKeywordRequest
{
  PARZeroKeywordRequest *v2;

  v2 = objc_alloc_init(PARZeroKeywordRequest);
  -[PARRequest setTriggerEvent:](v2, "setTriggerEvent:", 9);
  return v2;
}

+ (id)zeroKeywordRequest:(unint64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "zeroKeywordRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setQueryId:", a3);
  return v5;
}

+ (PARRequest)requestWithTopics:(id)a3 triggerEvent:(unint64_t)a4
{
  return (PARRequest *)objc_msgSend(a1, "requestWithTopics:triggerEvent:queryId:", a3, a4, 0);
}

+ (PARRequest)requestWithTopics:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5
{
  return (PARRequest *)objc_msgSend(a1, "requestWithTopics:triggerEvent:timeout:queryId:", a3, a4, a5, 0.0);
}

+ (PARRequest)requestWithTopics:(id)a3 triggerEvent:(unint64_t)a4 timeout:(double)a5 queryId:(unint64_t)a6
{
  id v9;
  PARTopicRequest *v10;

  v9 = a3;
  v10 = objc_alloc_init(PARTopicRequest);
  -[PARRequest setTriggerEvent:](v10, "setTriggerEvent:", a4);
  -[PARTopicRequest setTopics:](v10, "setTopics:", v9);

  -[PARRequest setQueryId:](v10, "setQueryId:", a6);
  -[PARTopicRequest setTimeoutIntervalForRequest:](v10, "setTimeoutIntervalForRequest:", a5);
  return (PARRequest *)v10;
}

+ (id)lookupRequestWithString:(id)a3 queryContext:(id)a4 domain:(id)a5 lookupSelectionType:(int64_t)a6 appBundleId:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  PARLookupRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = objc_alloc_init(PARLookupRequest);
  if (v15)
  {
    v16 = (void *)objc_msgSend(v11, "copy");
    -[PARLookupRequest setQueryString:](v15, "setQueryString:", v16);

    v17 = (void *)objc_msgSend(v12, "copy");
    -[PARLookupRequest setQueryContext:](v15, "setQueryContext:", v17);

    v18 = (void *)objc_msgSend(v13, "copy");
    -[PARLookupRequest setDomain:](v15, "setDomain:", v18);

    -[PARLookupRequest setLookupSelectionType:](v15, "setLookupSelectionType:", a6);
    v19 = (void *)objc_msgSend(v14, "copy");
    -[PARLookupRequest setAppBundleId:](v15, "setAppBundleId:", v19);

    -[PARRequest setTriggerEvent:](v15, "setTriggerEvent:", 11);
  }

  return v15;
}

+ (id)lookupRequestWithString:(id)a3 queryContext:(id)a4 domain:(id)a5 lookupSelectionType:(int64_t)a6 appBundleId:(id)a7 queryId:(unint64_t)a8
{
  void *v9;
  void *v10;

  objc_msgSend(a1, "lookupRequestWithString:queryContext:domain:lookupSelectionType:appBundleId:", a3, a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "setQueryId:", a8);
  return v10;
}

+ (id)flightRequestForQuery:(id)a3 date:(id)a4 appBundleId:(id)a5
{
  id v7;
  id v8;
  id v9;
  PARFlightSearchRequest *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(PARFlightSearchRequest);
  if (v10)
  {
    v11 = (void *)objc_msgSend(v7, "copy");
    -[PARFlightSearchRequest setFlightQuery:](v10, "setFlightQuery:", v11);

    v12 = (void *)objc_msgSend(v8, "copy");
    -[PARFlightSearchRequest setDate:](v10, "setDate:", v12);

    v13 = (void *)objc_msgSend(v9, "copy");
    -[PARFlightSearchRequest setAppBundleId:](v10, "setAppBundleId:", v13);

    -[PARRequest setTriggerEvent:](v10, "setTriggerEvent:", 0);
  }

  return v10;
}

+ (id)prefetchRequestForUrls:(id)a3 locale:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PARRequest prefetchRequestForUrl:locale:](PARRequest, "prefetchRequestForUrl:locale:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)prefetchRequestForUrl:(id)a3 locale:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PARRequest prefetchRequestForUrl:](PARRequest, "prefetchRequestForUrl:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "setLocaleString:", v5);

  return v7;
}

+ (id)prefetchRequestForUrl:(id)a3
{
  id v3;
  PARSafariSummarizationPrefetchRequest *v4;
  PARSafariSummarizationPrefetchRequest *v5;

  v3 = a3;
  v4 = objc_alloc_init(PARSafariSummarizationPrefetchRequest);
  v5 = v4;
  if (v4)
    -[PARSafariSummarizationPrefetchRequest setUrlString:](v4, "setUrlString:", v3);

  return v5;
}

+ (id)summarizeRequestForUrl:(id)a3 locale:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PARRequest summarizeRequestForUrl:](PARRequest, "summarizeRequestForUrl:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "setLocaleString:", v5);

  return v7;
}

+ (id)summarizeRequestForUrl:(id)a3
{
  id v3;
  PARSafariSummarizationSummarizeRequest *v4;
  PARSafariSummarizationSummarizeRequest *v5;

  v3 = a3;
  v4 = objc_alloc_init(PARSafariSummarizationSummarizeRequest);
  v5 = v4;
  if (v4)
    -[PARSafariSummarizationSummarizeRequest setUrlString:](v4, "setUrlString:", v3);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
