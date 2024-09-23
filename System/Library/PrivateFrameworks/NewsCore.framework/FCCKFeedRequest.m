@implementation FCCKFeedRequest

- (FCCKFeedRequest)init
{
  FCCKFeedRequest *result;
  __int128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FCCKFeedRequest;
  result = -[FCCKFeedRequest init](&v4, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_startOrder = xmmword_1A1E822D0;
    *(_QWORD *)&v3 = 0xFFFFLL;
    *((_QWORD *)&v3 + 1) = 0xFFFFLL;
    *(_OWORD *)&result->_softResultsLimit = v3;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  NSData *startCursor;
  uint64_t v6;
  const __CFString *v7;
  unint64_t hardResultsLimit;
  void *v9;

  +[FCDescription descriptionWithObject:](FCDescription, "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    objc_msgSend(v3, "addField:value:", CFSTR("feedID"), self->_feedID);
    startCursor = self->_startCursor;
  }
  else
  {
    objc_msgSend(v3, "addField:value:", CFSTR("feedID"), 0);
    startCursor = 0;
  }
  v6 = -[NSData length](startCursor, "length");
  v7 = CFSTR("non-empty");
  if (!v6)
    v7 = CFSTR("empty");
  objc_msgSend(v4, "addField:format:", CFSTR("startCursor"), CFSTR("%@"), v7);
  if (self)
  {
    objc_msgSend(v4, "addField:format:", CFSTR("startOrder"), CFSTR("%llu"), self->_startOrder);
    objc_msgSend(v4, "addField:format:", CFSTR("orderLimit"), CFSTR("%llu"), self->_orderLimit);
    objc_msgSend(v4, "addField:format:", CFSTR("softResultsLimit"), CFSTR("%llu"), self->_softResultsLimit);
    hardResultsLimit = self->_hardResultsLimit;
  }
  else
  {
    objc_msgSend(v4, "addField:format:", CFSTR("startOrder"), CFSTR("%llu"), 0);
    objc_msgSend(v4, "addField:format:", CFSTR("orderLimit"), CFSTR("%llu"), 0);
    objc_msgSend(v4, "addField:format:", CFSTR("softResultsLimit"), CFSTR("%llu"), 0);
    hardResultsLimit = 0;
  }
  objc_msgSend(v4, "addField:format:", CFSTR("hardResultsLimit"), CFSTR("%llu"), hardResultsLimit);
  objc_msgSend(v4, "descriptionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startCursor, 0);
  objc_storeStrong((id *)&self->_feedID, 0);
}

@end
