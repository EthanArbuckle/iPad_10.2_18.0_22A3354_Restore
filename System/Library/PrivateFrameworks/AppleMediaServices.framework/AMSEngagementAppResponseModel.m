@implementation AMSEngagementAppResponseModel

- (AMSEngagementAppResponseModel)initWithCacheObject:(id)a3
{
  id v4;
  void *v5;
  char v6;
  double v7;
  NSDate *v8;
  NSDate *created;
  void *v10;
  NSDictionary *v11;
  NSDictionary *definition;
  char v13;
  AMSEngagementAppResponseModel *v14;
  objc_super v16;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_9;
  v16.receiver = self;
  v16.super_class = (Class)AMSEngagementAppResponseModel;
  self = -[AMSEngagementAppResponseModel init](&v16, sel_init);
  if (!self)
    goto LABEL_10;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("created"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  v7 = 0.0;
  if ((v6 & 1) != 0)
    objc_msgSend(v5, "doubleValue", 0.0);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7);
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  created = self->_created;
  self->_created = v8;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("definition"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = (objc_opt_isKindOfClass() & 1) != 0 ? (NSDictionary *)v10 : 0;

  definition = self->_definition;
  self->_definition = v11;

  v13 = objc_msgSend((id)objc_opt_class(), "_shouldEvictDefinition:created:", self->_definition, self->_created);
  if ((v13 & 1) != 0)
  {
LABEL_9:
    v14 = 0;
  }
  else
  {
LABEL_10:
    self = self;
    v14 = self;
  }

  return v14;
}

- (AMSEngagementAppResponseModel)initWithData:(id)a3 cacheInfo:(id)a4
{
  id v6;
  id v7;
  AMSEngagementAppResponseModel *v8;
  uint64_t v9;
  NSDate *created;
  id v11;
  id v12;
  uint64_t v13;
  NSDictionary *definition;
  AMSEngagementAppResponseModel *v15;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AMSEngagementAppResponseModel;
  v8 = -[AMSEngagementAppResponseModel init](&v17, sel_init);
  if (v8)
  {
    if (!objc_msgSend(v6, "count") || !objc_msgSend(v7, "count"))
    {
      v15 = 0;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = objc_claimAutoreleasedReturnValue();
    created = v8->_created;
    v8->_created = (NSDate *)v9;

    if (v6)
      v11 = v6;
    else
      v11 = (id)MEMORY[0x1E0C9AA70];
    v18[0] = CFSTR("data");
    v18[1] = CFSTR("cacheInfo");
    if (v7)
      v12 = v7;
    else
      v12 = (id)MEMORY[0x1E0C9AA70];
    v19[0] = v11;
    v19[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v13 = objc_claimAutoreleasedReturnValue();
    definition = v8->_definition;
    v8->_definition = (NSDictionary *)v13;

  }
  v15 = v8;
LABEL_13:

  return v15;
}

- (NSString)cacheKey
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  -[AMSEngagementAppResponseModel definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("cacheInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  v6 = v5;

  if (!v6)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 0;
    goto LABEL_9;
  }
  v7 = v6;
  v8 = v7;
LABEL_9:

  return (NSString *)v8;
}

- (id)exportObject
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("created");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[AMSEngagementAppResponseModel created](self, "created");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("definition");
  v12[0] = v5;
  -[AMSEngagementAppResponseModel definition](self, "definition");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = MEMORY[0x1E0C9AA70];
  if (v6)
    v8 = v6;
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDictionary)responseData
{
  void *v2;
  void *v3;
  id v4;

  -[AMSEngagementAppResponseModel definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSDictionary *)v4;
}

- (BOOL)matchesEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;

  v4 = a3;
  -[AMSEngagementAppResponseModel definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cacheInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("filter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  v10 = +[AMSEngagementAppEventFilterModel matchEvent:toFilter:](AMSEngagementAppEventFilterModel, "matchEvent:toFilter:", v4, v9);
  return v10;
}

+ (BOOL)_shouldEvictDefinition:(id)a3 created:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("cacheInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("duration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();
  v10 = 0.0;
  if ((v9 & 1) != 0)
    objc_msgSend(v8, "doubleValue", 0.0);
  v13 = 1;
  if (v5)
  {
    v11 = fmin(v10, 2592000.0);
    objc_msgSend(v5, "timeIntervalSinceNow");
    if (v11 >= -v12)
      v13 = 0;
  }

  return v13;
}

- (NSDate)created
{
  return self->_created;
}

- (NSDictionary)definition
{
  return self->_definition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_created, 0);
}

@end
