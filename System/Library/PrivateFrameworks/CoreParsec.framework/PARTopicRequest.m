@implementation PARTopicRequest

- (unsigned)nwActivityLabel
{
  return 12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PARTopicRequest;
  v4 = a3;
  -[PARRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[PARTopicRequest queryTopicContexts](self, "queryTopicContexts", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("topicContexts"));

  -[PARTopicRequest timeoutIntervalForRequest](self, "timeoutIntervalForRequest");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeoutIntervalForRequest"));

}

- (PARTopicRequest)initWithCoder:(id)a3
{
  id v4;
  PARTopicRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *queryTopicContexts;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PARTopicRequest;
  v5 = -[PARRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("topicContexts"));
    v9 = objc_claimAutoreleasedReturnValue();
    queryTopicContexts = v5->_queryTopicContexts;
    v5->_queryTopicContexts = (NSArray *)v9;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeoutIntervalForRequest"));
    v5->_timeoutIntervalForRequest = v11;
  }

  return v5;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (NSArray)localTopics
{
  NSArray *localTopics;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  NSArray *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  localTopics = self->_localTopics;
  if (!localTopics)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[PARTopicRequest topics](self, "topics", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v4, "addObject:", v10);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v11 = (NSArray *)objc_msgSend(v4, "copy");
    v12 = self->_localTopics;
    self->_localTopics = v11;

    localTopics = self->_localTopics;
  }
  return localTopics;
}

- (NSArray)queryTopicContexts
{
  NSArray *queryTopicContexts;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  PARQueryTopicContext *v10;
  NSArray *v11;
  NSArray *v12;

  queryTopicContexts = self->_queryTopicContexts;
  if (!queryTopicContexts)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PARTopicRequest topics](self, "topics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        -[PARTopicRequest topics](self, "topics");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = -[PARQueryTopicContext initWithTopic:index:]([PARQueryTopicContext alloc], "initWithTopic:index:", v9, i);
          objc_msgSend(v4, "addObject:", v10);

        }
      }
    }
    v11 = (NSArray *)objc_msgSend(v4, "copy");
    v12 = self->_queryTopicContexts;
    self->_queryTopicContexts = v11;

    queryTopicContexts = self->_queryTopicContexts;
  }
  return queryTopicContexts;
}

- (double)timeoutIntervalForRequest
{
  return self->_timeoutIntervalForRequest;
}

- (void)setTimeoutIntervalForRequest:(double)a3
{
  self->_timeoutIntervalForRequest = a3;
}

- (NSArray)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_queryTopicContexts, 0);
  objc_storeStrong((id *)&self->_localTopics, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
