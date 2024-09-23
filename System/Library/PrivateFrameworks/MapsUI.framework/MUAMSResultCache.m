@implementation MUAMSResultCache

- (MUAMSResultCache)initWithAppAdamIdCacheCount:(unint64_t)a3 appAdamIdTimeToLive:(unint64_t)a4 bundleIdCacheCount:(unint64_t)a5 bundleIdTimeToLive:(unint64_t)a6
{
  MUAMSResultCache *v10;
  MUTimeExpirableLRUCache *v11;
  MUTimeExpirableLRUCache *amsResultsByAdamIds;
  MUTimeExpirableLRUCache *v13;
  MUTimeExpirableLRUCache *amsResultsByBundleIds;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MUAMSResultCache;
  v10 = -[MUAMSResultCache init](&v16, sel_init);
  if (v10)
  {
    v11 = -[MUTimeExpirableLRUCache initWithMaxSize:timeToLive:]([MUTimeExpirableLRUCache alloc], "initWithMaxSize:timeToLive:", a3, (double)a4);
    amsResultsByAdamIds = v10->_amsResultsByAdamIds;
    v10->_amsResultsByAdamIds = v11;

    v13 = -[MUTimeExpirableLRUCache initWithMaxSize:timeToLive:]([MUTimeExpirableLRUCache alloc], "initWithMaxSize:timeToLive:", a5, (double)a6);
    amsResultsByBundleIds = v10->_amsResultsByBundleIds;
    v10->_amsResultsByBundleIds = v13;

  }
  return v10;
}

- (id)amsResultForAdamId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[MUTimeExpirableLRUCache objectForKeyedSubscript:](self->_amsResultsByAdamIds, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setAMSResult:(id)a3 forAdamId:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
    -[MUTimeExpirableLRUCache setObject:forKey:](self->_amsResultsByAdamIds, "setObject:forKey:", v7, v6);

}

- (id)amsResultForBundleId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[MUTimeExpirableLRUCache objectForKeyedSubscript:](self->_amsResultsByBundleIds, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setAMSResult:(id)a3 forBundleId:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
    -[MUTimeExpirableLRUCache setObject:forKey:](self->_amsResultsByBundleIds, "setObject:forKey:", v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsResultsByBundleIds, 0);
  objc_storeStrong((id *)&self->_amsResultsByAdamIds, 0);
}

@end
