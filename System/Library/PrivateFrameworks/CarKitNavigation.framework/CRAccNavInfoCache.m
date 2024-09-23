@implementation CRAccNavInfoCache

- (CRAccNavInfoCache)initWithCountLimit:(unint64_t)a3
{
  CRAccNavInfoCache *v4;
  CRAccNavInfoCache *v5;
  unint64_t v6;
  uint64_t v7;
  NSMutableDictionary *accNavInfo;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRAccNavInfoCache;
  v4 = -[CRAccNavInfoCache init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = 999;
    if (a3)
      v6 = a3;
    v4->_countLimit = v6;
    v7 = objc_opt_new();
    accNavInfo = v5->_accNavInfo;
    v5->_accNavInfo = (NSMutableDictionary *)v7;

  }
  return v5;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[CRAccNavInfoCache accNavInfo](self, "accNavInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)indexes
{
  void *v2;
  void *v3;
  void *v4;

  -[CRAccNavInfoCache accNavInfo](self, "accNavInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRAccNavInfoCache accNavInfo](self, "accNavInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[CRAccNavInfoCache accNavInfo](self, "accNavInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v6);

  while (1)
  {
    -[CRAccNavInfoCache accNavInfo](self, "accNavInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    v10 = -[CRAccNavInfoCache countLimit](self, "countLimit");

    if (v9 <= v10)
      break;
    -[CRAccNavInfoCache indexes](self, "indexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRAccNavInfoCache accNavInfo](self, "accNavInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v12);

  }
}

- (void)removeAllObjects
{
  id v2;

  -[CRAccNavInfoCache accNavInfo](self, "accNavInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[CRAccNavInfoCache countLimit](self, "countLimit");
  v6 = -[CRAccNavInfoCache count](self, "count");
  -[CRAccNavInfoCache indexes](self, "indexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p countLimit=%lu count=%lu indexes=[%@]>"), v4, self, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  void *v9;
  unint64_t v10;

  -[CRAccNavInfoCache accNavInfo](self, "accNavInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v10;
}

- (unint64_t)countLimit
{
  return self->_countLimit;
}

- (NSMutableDictionary)accNavInfo
{
  return self->_accNavInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accNavInfo, 0);
}

@end
