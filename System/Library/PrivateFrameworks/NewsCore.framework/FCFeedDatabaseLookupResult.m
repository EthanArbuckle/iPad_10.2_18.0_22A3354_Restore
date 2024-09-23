@implementation FCFeedDatabaseLookupResult

- (id)description
{
  void *v3;
  FCFeedRange *feedRange;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  +[FCDescription descriptionWithObject:](FCDescription, "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    objc_msgSend(v3, "addField:format:", CFSTR("feedItems"), CFSTR("%lu"), -[NSArray count](self->_feedItems, "count"));
    feedRange = self->_feedRange;
  }
  else
  {
    objc_msgSend(v3, "addField:format:", CFSTR("feedItems"), CFSTR("%lu"), objc_msgSend(0, "count"));
    feedRange = 0;
  }
  -[FCFeedRange dateRange](feedRange, "dateRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:format:", CFSTR("feedRange"), CFSTR("%@"), v5);

  if (!self)
  {
    objc_msgSend(v3, "addField:value:", CFSTR("exhaustedRange"), CFSTR("NO"));
    objc_msgSend(v3, "addField:format:", CFSTR("ckFromOrder"), CFSTR("%llu"), 0);
    objc_msgSend(v3, "addField:format:", CFSTR("ckToOrder"), CFSTR("%llu"), 0);
LABEL_11:
    v7 = CFSTR("nil");
    goto LABEL_12;
  }
  if (self->_exhaustedRange)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "addField:value:", CFSTR("exhaustedRange"), v6);
  objc_msgSend(v3, "addField:format:", CFSTR("ckFromOrder"), CFSTR("%llu"), self->_ckFromOrder);
  objc_msgSend(v3, "addField:format:", CFSTR("ckToOrder"), CFSTR("%llu"), self->_ckToOrder);
  if (!self->_ckFromOrder)
    goto LABEL_11;
  v7 = CFSTR("non-nil");
LABEL_12:
  objc_msgSend(v3, "addField:value:", CFSTR("insertionToken"), v7);
  objc_msgSend(v3, "descriptionString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_insertionToken, 0);
  objc_storeStrong((id *)&self->_ckFromCursor, 0);
  objc_storeStrong((id *)&self->_feedRange, 0);
  objc_storeStrong((id *)&self->_feedItems, 0);
}

@end
