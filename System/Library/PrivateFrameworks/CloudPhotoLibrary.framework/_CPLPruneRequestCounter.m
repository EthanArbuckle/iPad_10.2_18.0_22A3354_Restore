@implementation _CPLPruneRequestCounter

- (_CPLPruneRequestCounter)initWithTitle:(id)a3 statusKey:(id)a4
{
  id v6;
  id v7;
  _CPLPruneRequestCounter *v8;
  NSCountedSet *v9;
  NSCountedSet *successStatsPerResourceType;
  NSCountedSet *v11;
  NSCountedSet *failedStatsPerResourceType;
  uint64_t v13;
  NSString *title;
  uint64_t v15;
  NSString *statusKey;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_CPLPruneRequestCounter;
  v8 = -[_CPLPruneRequestCounter init](&v18, sel_init);
  if (v8)
  {
    v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    successStatsPerResourceType = v8->_successStatsPerResourceType;
    v8->_successStatsPerResourceType = v9;

    v11 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    failedStatsPerResourceType = v8->_failedStatsPerResourceType;
    v8->_failedStatsPerResourceType = v11;

    v13 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v13;

    v15 = objc_msgSend(v7, "copy");
    statusKey = v8->_statusKey;
    v8->_statusKey = (NSString *)v15;

  }
  return v8;
}

- (void)noteRequestForResource:(id)a3 successful:(BOOL)a4 prunedSize:(unint64_t)a5
{
  _BOOL4 v6;
  double v8;
  NSCountedSet *successStatsPerResourceType;
  void *v11;
  NSCountedSet *failedStatsPerResourceType;
  void *v13;
  NSDate *v14;
  NSDate *lastRequestDate;
  id v16;

  v6 = a4;
  v16 = a3;
  -[NSDate timeIntervalSinceNow](self->_lastRequestDate, "timeIntervalSinceNow");
  if (self->_lastRequestDate)
  {
    if (v8 > 0.0 || v8 < -60.0)
    {
      -[NSCountedSet removeAllObjects](self->_successStatsPerResourceType, "removeAllObjects");
      -[NSCountedSet removeAllObjects](self->_failedStatsPerResourceType, "removeAllObjects");
      self->_successSize = 0;
    }
  }
  if (v6)
  {
    successStatsPerResourceType = self->_successStatsPerResourceType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "resourceType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCountedSet addObject:](successStatsPerResourceType, "addObject:", v11);

    self->_successSize += a5;
  }
  else
  {
    failedStatsPerResourceType = self->_failedStatsPerResourceType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "resourceType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCountedSet addObject:](failedStatsPerResourceType, "addObject:", v13);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastRequestDate = self->_lastRequestDate;
  self->_lastRequestDate = v14;

}

- (NSString)status
{
  _CPLPruneRequestCounter *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[4];
  _QWORD v16[5];
  id v17;

  if (!self->_lastRequestDate)
    goto LABEL_5;
  v2 = self;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", +[CPLResource countOfResourceTypes](CPLResource, "countOfResourceTypes") / 3 + 1);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__0;
  v16[4] = __Block_byref_object_dispose__0;
  v17 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33___CPLPruneRequestCounter_status__block_invoke;
  v11[3] = &unk_1E60D7578;
  v11[4] = v2;
  v13 = v16;
  v14 = v15;
  v4 = v3;
  v12 = v4;
  +[CPLResource enumerateResourceTypesWithBlock:](CPLResource, "enumerateResourceTypesWithBlock:", v11);
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v2->_successSize, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v2->_lastRequestDate, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n\t"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (_CPLPruneRequestCounter *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@, %@\n\t%@"), v7, v8, v9);

  }
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v16, 8);

  if (!v5)
LABEL_5:
    v2 = 0;
  return (NSString *)v2;
}

- (NSDictionary)statusDictionary
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  _CPLPruneRequestCounter *v12;
  id v13;

  if (self->_lastRequestDate)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", +[CPLResource countOfResourceTypes](CPLResource, "countOfResourceTypes"));
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __43___CPLPruneRequestCounter_statusDictionary__block_invoke;
    v11 = &unk_1E60D75A0;
    v12 = self;
    v5 = v4;
    v13 = v5;
    +[CPLResource enumerateResourceTypesWithBlock:](CPLResource, "enumerateResourceTypesWithBlock:", &v8);
    if (self->_successSize)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8, v9, v10, v11, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("size"));

    }
    if (objc_msgSend(v5, "count", v8, v9, v10, v11, v12))
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("requests"));

  }
  else
  {
    v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)statusKey
{
  return self->_statusKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_failedStatsPerResourceType, 0);
  objc_storeStrong((id *)&self->_successStatsPerResourceType, 0);
}

@end
