@implementation DASearchQuery

+ (id)searchQueryWithSearchString:(id)a3 consumer:(id)a4
{
  id v5;
  id v6;
  DASearchQuery *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[DASearchQuery initWithSearchString:consumer:]([DASearchQuery alloc], "initWithSearchString:consumer:", v6, v5);

  return v7;
}

- (DASearchQuery)initWithSearchString:(id)a3 consumer:(id)a4
{
  id v6;
  id v7;
  DASearchQuery *v8;
  DASearchQuery *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DASearchQuery;
  v8 = -[DASearchQuery init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[DASearchQuery setSearchString:](v8, "setSearchString:", v6);
    -[DASearchQuery setState:](v9, "setState:", 0);
    -[DASearchQuery setRange:](v9, "setRange:", 0, 25);
    -[DASearchQuery setTimeLimit:](v9, "setTimeLimit:", 0);
    -[DASearchQuery setSearchID:](v9, "setSearchID:", &stru_1E68DC130);
    -[DASearchQuery setConsumer:](v9, "setConsumer:", v7);
  }

  return v9;
}

- (DASearchQuery)initWithSearchString:(id)a3 predicate:(id)a4 consumer:(id)a5
{
  id v8;
  id v9;
  id v10;
  DASearchQuery *v11;
  DASearchQuery *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DASearchQuery;
  v11 = -[DASearchQuery init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[DASearchQuery setSearchString:](v11, "setSearchString:", v8);
    -[DASearchQuery setSearchPredicate:](v12, "setSearchPredicate:", v9);
    -[DASearchQuery setState:](v12, "setState:", 0);
    -[DASearchQuery setRange:](v12, "setRange:", 0, 25);
    -[DASearchQuery setTimeLimit:](v12, "setTimeLimit:", 0);
    -[DASearchQuery setSearchID:](v12, "setSearchID:", &stru_1E68DC130);
    -[DASearchQuery setConsumer:](v12, "setConsumer:", v10);
  }

  return v12;
}

- (id)description
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  DALoggingwithCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
  {
    -[DASearchQuery searchString](self, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[DASearchQuery range](self, "range");
    -[DASearchQuery range](self, "range");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<DASearchQuery %p>: \"%@\" range: {%ld, %ld}, timeLimit: %d"), self, v6, v7, v8, -[DASearchQuery timeLimit](self, "timeLimit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = -[DASearchQuery range](self, "range");
    -[DASearchQuery range](self, "range");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<DASearchQuery %p>: range: {%ld, %ld}, timeLimit: %d"), self, v10, v11, -[DASearchQuery timeLimit](self, "timeLimit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (DASearchQuery)initWithDictionaryRepresentation:(id)a3 consumer:(id)a4
{
  id v6;
  id v7;
  DASearchQuery *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DASearchQuery;
  v8 = -[DASearchQuery init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SearchString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DASearchQuery setSearchString:](v8, "setSearchString:", v9);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RangeLoc"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RangeLength"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DASearchQuery setRange:](v8, "setRange:", v11, objc_msgSend(v12, "unsignedIntValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TimeLimit"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DASearchQuery setTimeLimit:](v8, "setTimeLimit:", objc_msgSend(v13, "intValue"));

    -[DASearchQuery setConsumer:](v8, "setConsumer:", v7);
  }

  return v8;
}

- (BOOL)isQueryRunning
{
  return -[DASearchQuery state](self, "state") == 1;
}

- (void)sendResultsToConsumer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[DASearchQuery state](self, "state") != 2)
  {
    -[DASearchQuery consumer](self, "consumer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchQuery:returnedResults:", self, v5);

  }
}

- (void)sendFinishedToConsumerWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[DASearchQuery state](self, "state") != 2)
  {
    -[DASearchQuery consumer](self, "consumer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchQuery:finishedWithError:", self, v5);

  }
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  -[DASearchQuery searchString](self, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("SearchString"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DASearchQuery range](self, "range"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("RangeLoc"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[DASearchQuery range](self, "range");
  objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("RangeLength"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DASearchQuery timeLimit](self, "timeLimit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("TimeLimit"));

  return v3;
}

- (unsigned)maxResults
{
  unsigned int v2;

  -[DASearchQuery range](self, "range");
  return v2;
}

- (void)setMaxResults:(unsigned int)a3
{
  self->_range.length = a3;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSPredicate)searchPredicate
{
  return self->_searchPredicate;
}

- (void)setSearchPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (int)timeLimit
{
  return self->_timeLimit;
}

- (void)setTimeLimit:(int)a3
{
  self->_timeLimit = a3;
}

- (DASearchQueryConsumer)consumer
{
  return (DASearchQueryConsumer *)objc_loadWeakRetained((id *)&self->_consumer);
}

- (void)setConsumer:(id)a3
{
  objc_storeWeak((id *)&self->_consumer, a3);
}

- (NSString)searchID
{
  return self->_searchID;
}

- (void)setSearchID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchID, 0);
  objc_destroyWeak((id *)&self->_consumer);
  objc_storeStrong((id *)&self->_searchPredicate, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
