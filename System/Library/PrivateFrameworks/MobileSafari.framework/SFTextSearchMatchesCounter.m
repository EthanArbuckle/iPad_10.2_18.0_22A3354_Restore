@implementation SFTextSearchMatchesCounter

- (SFTextSearchMatchesCounter)initWithQueryString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  SFTextSearchMatchesCounter *v8;
  uint64_t v9;
  NSMutableOrderedSet *allFoundRanges;
  void *v11;
  id completionHandler;
  uint64_t v13;
  NSString *queryString;
  SFTextSearchMatchesCounter *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SFTextSearchMatchesCounter;
  v8 = -[SFTextSearchMatchesCounter init](&v17, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v9 = objc_claimAutoreleasedReturnValue();
    allFoundRanges = v8->_allFoundRanges;
    v8->_allFoundRanges = (NSMutableOrderedSet *)v9;

    v11 = _Block_copy(v7);
    completionHandler = v8->_completionHandler;
    v8->_completionHandler = v11;

    v13 = objc_msgSend(v6, "copy");
    queryString = v8->_queryString;
    v8->_queryString = (NSString *)v13;

    v8->_valid = 1;
    v15 = v8;
  }

  return v8;
}

- (BOOL)canSkipCountingMatchesForQueryString:(id)a3 wordMatchMethod:(int64_t)a4
{
  id v6;
  char v7;

  v6 = a3;
  if (a4 == 2 || self->_valid || -[NSMutableOrderedSet count](self->_allFoundRanges, "count"))
    v7 = 0;
  else
    v7 = objc_msgSend(v6, "hasPrefix:", self->_queryString);

  return v7;
}

- (void)invalidate
{
  self->_valid = 0;
}

- (NSOrderedSet)allFoundRanges
{
  return (NSOrderedSet *)(id)-[NSMutableOrderedSet copy](self->_allFoundRanges, "copy");
}

- (void)foundRange:(id)a3 forSearchString:(id)a4 inDocument:(id)a5
{
  if (self->_valid)
    -[NSMutableOrderedSet addObject:](self->_allFoundRanges, "addObject:", a3, a4, a5);
}

- (void)invalidateFoundRange:(id)a3 inDocument:(id)a4
{
  if (self->_valid)
    -[NSMutableOrderedSet removeObject:](self->_allFoundRanges, "removeObject:", a3, a4);
}

- (void)finishedSearching
{
  if (self->_valid)
  {
    (*((void (**)(id, uint64_t))self->_completionHandler + 2))(self->_completionHandler, -[NSMutableOrderedSet count](self->_allFoundRanges, "count"));
    -[SFTextSearchMatchesCounter invalidate](self, "invalidate");
  }
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_allFoundRanges, 0);
}

@end
