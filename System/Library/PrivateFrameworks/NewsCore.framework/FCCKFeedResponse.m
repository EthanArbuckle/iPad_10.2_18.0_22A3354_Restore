@implementation FCCKFeedResponse

- (id)description
{
  void *v3;
  void *v4;
  NSArray *feedItemAndArticleRecords;
  const __CFString *v6;
  const __CFString *v7;
  NSData *cursor;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  +[FCDescription descriptionWithObject:](FCDescription, "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    objc_msgSend(v3, "addField:value:", CFSTR("feedID"), self->_feedID);
    feedItemAndArticleRecords = self->_feedItemAndArticleRecords;
  }
  else
  {
    objc_msgSend(v3, "addField:value:", CFSTR("feedID"), 0);
    feedItemAndArticleRecords = 0;
  }
  objc_msgSend(v4, "addField:format:", CFSTR("feedItemAndArticleRecords"), CFSTR("%lu"), -[NSArray count](feedItemAndArticleRecords, "count"));
  if (self)
  {
    if (self->_reachedEnd)
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    objc_msgSend(v4, "addField:value:", CFSTR("reachedEnd"), v6);
    if (self->_reachedOrderLimit)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    objc_msgSend(v4, "addField:value:", CFSTR("reachedOrderLimit"), v7);
    objc_msgSend(v4, "addField:format:", CFSTR("extent"), CFSTR("%llu"), self->_extent);
    cursor = self->_cursor;
  }
  else
  {
    objc_msgSend(v4, "addField:value:", CFSTR("reachedEnd"), CFSTR("NO"));
    objc_msgSend(v4, "addField:value:", CFSTR("reachedOrderLimit"), CFSTR("NO"));
    objc_msgSend(v4, "addField:format:", CFSTR("extent"), CFSTR("%llu"), 0);
    cursor = 0;
  }
  if (cursor)
    v9 = CFSTR("non-nil");
  else
    v9 = CFSTR("nil");
  objc_msgSend(v4, "addField:format:", CFSTR("cursor"), CFSTR("%@"), v9);
  v10 = CFSTR("NO");
  if (self && self->_wasDropped)
    v10 = CFSTR("YES");
  objc_msgSend(v4, "addField:value:", CFSTR("wasDropped"), v10);
  objc_msgSend(v4, "descriptionString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_feedItemAndArticleRecords, 0);
  objc_storeStrong((id *)&self->_feedID, 0);
}

@end
