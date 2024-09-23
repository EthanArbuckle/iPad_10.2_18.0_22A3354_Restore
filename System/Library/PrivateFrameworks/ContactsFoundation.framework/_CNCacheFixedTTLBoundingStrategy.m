@implementation _CNCacheFixedTTLBoundingStrategy

- (void)willAccessKey:(id)a3
{
  if ((self->_renewalOptions & 2) != 0)
    -[_CNCacheFixedTTLBoundingStrategy updateTimestampForKey:](self, "updateTimestampForKey:", a3);
}

- (void)willUpdateCacheBy:(unint64_t)a3 forKey:(id)a4 keysToEvict:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];

  v14 = a4;
  -[_CNCacheFixedTTLBoundingStrategy timestamps](self, "timestamps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73___CNCacheFixedTTLBoundingStrategy_willUpdateCacheBy_forKey_keysToEvict___block_invoke;
  v15[3] = &unk_1E29B9248;
  v15[4] = self;
  objc_msgSend(v9, "_cn_filter:", v15);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  -[_CNCacheFixedTTLBoundingStrategy timestamps](self, "timestamps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!a3)
  {
    objc_msgSend(v10, "removeObjectForKey:", v14);

    goto LABEL_6;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || (v13 = v14, (self->_renewalOptions & 1) != 0))
  {
    -[_CNCacheFixedTTLBoundingStrategy updateTimestampForKey:](self, "updateTimestampForKey:", v14);
LABEL_6:
    v13 = v14;
  }

}

- (void)updateTimestampForKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  -[_CNCacheFixedTTLBoundingStrategy timeProvider](self, "timeProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNCacheFixedTTLBoundingStrategy timestamps](self, "timestamps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v5);

}

- (BOOL)shouldEvictKey:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  -[_CNCacheFixedTTLBoundingStrategy timeProvider](self, "timeProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v7 = v6;
  -[_CNCacheFixedTTLBoundingStrategy timestamps](self, "timestamps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_cn_timeIntervalValue");
  v11 = v7 - v10;

  -[_CNCacheFixedTTLBoundingStrategy ttl](self, "ttl");
  return v11 > v12;
}

- (NSMutableDictionary)timestamps
{
  return self->_timestamps;
}

- (CNTimeProvider)timeProvider
{
  return self->_timeProvider;
}

- (double)ttl
{
  return self->_ttl;
}

- (_CNCacheFixedTTLBoundingStrategy)initWithTTL:(double)a3 renewalOptions:(unint64_t)a4 timeProvider:(id)a5
{
  id v9;
  _CNCacheFixedTTLBoundingStrategy *v10;
  _CNCacheFixedTTLBoundingStrategy *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *timestamps;
  _CNCacheFixedTTLBoundingStrategy *v14;
  objc_super v16;

  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_CNCacheFixedTTLBoundingStrategy;
  v10 = -[_CNCacheFixedTTLBoundingStrategy init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_ttl = a3;
    v10->_renewalOptions = a4;
    objc_storeStrong((id *)&v10->_timeProvider, a5);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    timestamps = v11->_timestamps;
    v11->_timestamps = v12;

    v14 = v11;
  }

  return v11;
}

- (_CNCacheFixedTTLBoundingStrategy)init
{
  id v2;

  CNInitializerUnavailableException(self, a2, sel_initWithTTL_);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (_CNCacheFixedTTLBoundingStrategy)initWithTTL:(double)a3
{
  void *v5;
  _CNCacheFixedTTLBoundingStrategy *v6;

  +[CNTimeProvider defaultProvider](CNTimeProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CNCacheFixedTTLBoundingStrategy initWithTTL:renewalOptions:timeProvider:](self, "initWithTTL:renewalOptions:timeProvider:", 3, v5, a3);

  return v6;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:timeInterval:", CFSTR("ttl"), self->_ttl);
  v5 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("renewalOptions"), self->_renewalOptions);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)renewalOptions
{
  return self->_renewalOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
}

@end
