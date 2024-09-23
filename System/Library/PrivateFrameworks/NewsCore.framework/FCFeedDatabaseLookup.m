@implementation FCFeedDatabaseLookup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredFeature, 0);
  objc_storeStrong((id *)&self->_feedRange, 0);
  objc_storeStrong((id *)&self->_feedID, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  FCFeedRange *feedRange;
  void *v6;
  const __CFString *v7;
  void *v8;

  +[FCDescription descriptionWithObject:](FCDescription, "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    objc_msgSend(v3, "addField:value:", CFSTR("feedID"), self->_feedID);
    feedRange = self->_feedRange;
  }
  else
  {
    objc_msgSend(v3, "addField:value:", CFSTR("feedID"), 0);
    feedRange = 0;
  }
  -[FCFeedRange dateRange](feedRange, "dateRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addField:format:", CFSTR("feedRange"), CFSTR("%@"), v6);

  if (self)
  {
    objc_msgSend(v4, "addField:format:", CFSTR("maxCount"), CFSTR("%lu"), self->_maxCount);
    if (self->_cachedOnly)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
  }
  else
  {
    objc_msgSend(v4, "addField:format:", CFSTR("maxCount"), CFSTR("%lu"), 0);
    v7 = CFSTR("NO");
  }
  objc_msgSend(v4, "addField:value:", CFSTR("cachedOnly"), v7);
  objc_msgSend(v4, "descriptionString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
