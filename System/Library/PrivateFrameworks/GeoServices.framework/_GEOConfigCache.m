@implementation _GEOConfigCache

- (void)withCache:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync_data();

}

- (id)init:(id)a3
{
  id v5;
  _GEOConfigCache *v6;
  _GEOConfigCache *v7;
  uint64_t v8;
  geo_isolater *isolator;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_GEOConfigCache;
  v6 = -[_GEOConfigCache init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_cache, a3);
    v8 = geo_isolater_create();
    isolator = v7->_isolator;
    v7->_isolator = (geo_isolater *)v8;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolator, 0);
  objc_storeStrong(&self->_cache, 0);
}

@end
