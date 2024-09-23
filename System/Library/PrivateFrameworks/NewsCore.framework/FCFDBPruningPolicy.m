@implementation FCFDBPruningPolicy

- (FCFDBPruningPolicy)initWithMaxAgeToPersist:(double)a3
{
  void *v4;
  FCFDBPruningPolicy *v5;

  +[FCFeedCursor cursorForTimeIntervalBeforeNow:](FCFeedCursor, "cursorForTimeIntervalBeforeNow:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCFDBPruningPolicy initWithMaxOrderToPrune:](self, "initWithMaxOrderToPrune:", objc_msgSend(v4, "order"));

  return v5;
}

- (FCFDBPruningPolicy)initWithMaxOrderToPrune:(unint64_t)a3
{
  FCFDBPruningPolicy *v4;
  uint64_t v5;
  FCFeedRange *feedRangeToPrune;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FCFDBPruningPolicy;
  v4 = -[FCFDBPruningPolicy init](&v8, sel_init);
  if (v4)
  {
    +[FCFeedRange feedRangeWithMaxOrder:minOrder:](FCFeedRange, "feedRangeWithMaxOrder:minOrder:", a3, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    feedRangeToPrune = v4->_feedRangeToPrune;
    v4->_feedRangeToPrune = (FCFeedRange *)v5;

  }
  return v4;
}

- (FCFeedRange)feedRangeToPrune
{
  return self->_feedRangeToPrune;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedRangeToPrune, 0);
}

@end
