@implementation FCCKOrderFeedResponse

- (id)description
{
  void *v3;
  void *v4;
  NSArray *feedItemAndArticleRecords;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

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
    if (self->_reachedMinOrder)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    objc_msgSend(v4, "addField:value:", CFSTR("reachedMinOrder"), v7);
    if (self->_wasDropped)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
  }
  else
  {
    v8 = CFSTR("NO");
    objc_msgSend(v4, "addField:value:", CFSTR("reachedEnd"), CFSTR("NO"));
    objc_msgSend(v4, "addField:value:", CFSTR("reachedMinOrder"), CFSTR("NO"));
  }
  objc_msgSend(v4, "addField:value:", CFSTR("wasDropped"), v8);
  objc_msgSend(v4, "descriptionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedItemAndArticleRecords, 0);
  objc_storeStrong((id *)&self->_feedID, 0);
}

@end
