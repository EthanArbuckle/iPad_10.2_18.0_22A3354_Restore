@implementation FCFeedPrewarmRequest

- (NSCopying)requestKey
{
  return self->_requestKey;
}

- (FCFeedPrewarmRequest)initWithRequestKey:(id)a3 feedRequests:(id)a4 options:(int64_t)a5 edgeCacheHint:(id)a6
{
  id v11;
  id v12;
  id v13;
  FCFeedPrewarmRequest *v14;
  FCFeedPrewarmRequest *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)FCFeedPrewarmRequest;
  v14 = -[FCFeedPrewarmRequest init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requestKey, a3);
    objc_storeStrong((id *)&v15->_feedRequests, a4);
    v15->_options = a5;
    objc_storeStrong((id *)&v15->_edgeCacheHint, a6);
  }

  return v15;
}

- (int64_t)options
{
  return self->_options;
}

- (NSArray)feedRequests
{
  return self->_feedRequests;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    -[FCFeedPrewarmRequest requestKey](self, "requestKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FCFeedPrewarmRequest requestKey](self, "requestKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  FCDescription *v3;
  void *v4;
  void *v5;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  -[FCFeedPrewarmRequest requestKey](self, "requestKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("requestKey"), v4);

  -[FCDescription descriptionString](v3, "descriptionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (FCEdgeCacheHint)edgeCacheHint
{
  return self->_edgeCacheHint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_feedRequests, 0);
  objc_storeStrong((id *)&self->_requestKey, 0);
}

@end
