@implementation ATXRootOfAppDataWithDictionary

- (ATXRootOfAppDataWithDictionary)init
{
  ATXRootOfAppDataWithDictionary *v2;
  uint64_t v3;
  NSMutableDictionary *sessionCounts;
  uint64_t v5;
  NSMutableDictionary *firstUA;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXRootOfAppDataWithDictionary;
  v2 = -[ATXRootOfAppData initInternal](&v8, sel_initInternal);
  if (v2)
  {
    v3 = objc_opt_new();
    sessionCounts = v2->_sessionCounts;
    v2->_sessionCounts = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    firstUA = v2->_firstUA;
    v2->_firstUA = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (unint64_t)sessionCountForBundleId:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionCounts, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unint64_t)sessionCountForBundleId:(id)a3 firstAction:(id)a4
{
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_firstUA, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (void)recordSessionWithBundleId:(id)a3 firstAction:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = (void *)MEMORY[0x1E0D81638];
  v7 = a3;
  objc_msgSend(v6, "tupleWithFirst:second:", v7, a4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_firstUA, "objectForKeyedSubscript:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_firstUA, "setObject:forKeyedSubscript:", v10, v14);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionCounts, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "unsignedIntegerValue") + 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionCounts, "setObject:forKeyedSubscript:", v13, v7);

}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ session counts: %@ first UA: %@"), v5, self->_sessionCounts, self->_firstUA);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstUA, 0);
  objc_storeStrong((id *)&self->_sessionCounts, 0);
}

@end
