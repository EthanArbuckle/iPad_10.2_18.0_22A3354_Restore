@implementation FCCKOrderFeedRequest

- (FCCKOrderFeedRequest)init
{
  FCCKOrderFeedRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCCKOrderFeedRequest;
  result = -[FCCKOrderFeedRequest init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_maxOrder = xmmword_1A1E822D0;
    result->_resultsLimit = 0xFFFFLL;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t resultsLimit;
  void *v6;

  +[FCDescription descriptionWithObject:](FCDescription, "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    objc_msgSend(v3, "addField:value:", CFSTR("feedID"), self->_feedID);
    objc_msgSend(v4, "addField:format:", CFSTR("maxOrder"), CFSTR("%llu"), self->_maxOrder);
    objc_msgSend(v4, "addField:format:", CFSTR("minOrder"), CFSTR("%llu"), self->_minOrder);
    resultsLimit = self->_resultsLimit;
  }
  else
  {
    objc_msgSend(v3, "addField:value:", CFSTR("feedID"), 0);
    objc_msgSend(v4, "addField:format:", CFSTR("maxOrder"), CFSTR("%llu"), 0);
    objc_msgSend(v4, "addField:format:", CFSTR("minOrder"), CFSTR("%llu"), 0);
    resultsLimit = 0;
  }
  objc_msgSend(v4, "addField:format:", CFSTR("resultsLimit"), CFSTR("%llu"), resultsLimit);
  objc_msgSend(v4, "descriptionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedID, 0);
}

@end
