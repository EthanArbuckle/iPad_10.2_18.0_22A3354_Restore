@implementation FCFeedItemFeature

+ (id)featureForTopicID:(id)a3
{
  id v3;
  FCFeedItemFeature *v4;

  v3 = a3;
  v4 = -[FCFeedItemFeature initWithType:key:]([FCFeedItemFeature alloc], "initWithType:key:", 1, v3);

  return v4;
}

+ (id)featureForAllArticles
{
  if (qword_1ED0F8860 != -1)
    dispatch_once(&qword_1ED0F8860, &__block_literal_global_172);
  return (id)_MergedGlobals_216;
}

void __42__FCFeedItemFeature_featureForAllArticles__block_invoke()
{
  FCFeedItemFeature *v0;
  void *v1;

  v0 = -[FCFeedItemFeature initWithType:key:]([FCFeedItemFeature alloc], "initWithType:key:", 2, CFSTR("allArticles"));
  v1 = (void *)_MergedGlobals_216;
  _MergedGlobals_216 = (uint64_t)v0;

}

- (FCFeedItemFeature)initWithType:(int64_t)a3 key:(id)a4
{
  id v7;
  FCFeedItemFeature *v8;
  FCFeedItemFeature *v9;
  int64_t type;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCFeedItemFeature;
  v8 = -[FCFeedItemFeature init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_key, a4);
    type = v9->_type;
    if (type == 2)
    {
      LOBYTE(type) = 0;
    }
    else if (type != 1)
    {
      goto LABEL_7;
    }
    v9->_queryable = type;
  }
LABEL_7:

  return v9;
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

  -[FCFeedItemFeature key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FCFeedItemFeature key](self, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)queryable
{
  return self->_queryable;
}

- (void)setQueryable:(BOOL)a3
{
  self->_queryable = a3;
}

- (NSString)key
{
  return self->_key;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
