@implementation FCFeedResponse

- (id)feedResponseByMergingWithResponse:(id)a3
{
  id v4;
  FCFeedResponse *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  v5 = objc_alloc_init(FCFeedResponse);
  -[FCFeedResponse feedID](self, "feedID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedResponse setFeedID:](v5, "setFeedID:", v6);

  -[FCFeedResponse error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedResponse setError:](v5, "setError:", v7);

  -[FCFeedResponse error](self, "error");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v4, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0C99D20];
      -[FCFeedResponse feedItems](self, "feedItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "feedItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fc_arrayByAddingObjectsFromArray:toArray:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCFeedResponse setFeedItems:](v5, "setFeedItems:", v14);

      if (-[FCFeedResponse exhaustedRequestRange](self, "exhaustedRequestRange"))
        v15 = objc_msgSend(v4, "exhaustedRequestRange");
      else
        v15 = 0;
      -[FCFeedResponse setExhaustedRequestRange:](v5, "setExhaustedRequestRange:", v15);
    }
  }

  return v5;
}

- (int64_t)compareFeedItemCount:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  int64_t v9;

  v4 = a3;
  -[FCFeedResponse feedItems](self, "feedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v4, "feedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v6 < v8)
    v9 = -1;
  else
    v9 = v6 > v8;

  return v9;
}

- (FCFeedRange)feedRange
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[FCFeedResponse feedItems](self, "feedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[FCFeedResponse feedItems](self, "feedItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", objc_msgSend(v6, "order"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCFeedResponse feedItems](self, "feedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", objc_msgSend(v9, "order") - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return (FCFeedRange *)v11;
}

- (NSString)feedID
{
  return self->_feedID;
}

- (void)setFeedID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)feedItems
{
  return self->_feedItems;
}

- (void)setFeedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)exhaustedRequestRange
{
  return self->_exhaustedRequestRange;
}

- (void)setExhaustedRequestRange:(BOOL)a3
{
  self->_exhaustedRequestRange = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_feedItems, 0);
  objc_storeStrong((id *)&self->_feedID, 0);
}

@end
