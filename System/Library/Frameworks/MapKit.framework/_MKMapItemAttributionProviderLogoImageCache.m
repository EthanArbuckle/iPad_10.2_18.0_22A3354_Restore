@implementation _MKMapItemAttributionProviderLogoImageCache

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___MKMapItemAttributionProviderLogoImageCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE2D8E0 != -1)
    dispatch_once(&qword_1ECE2D8E0, block);
  return (id)_MergedGlobals_132;
}

- (_MKMapItemAttributionProviderLogoImageCache)init
{
  _MKMapItemAttributionProviderLogoImageCache *v2;
  NSCache *v3;
  NSCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKMapItemAttributionProviderLogoImageCache;
  v2 = -[_MKMapItemAttributionProviderLogoImageCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v2->_cache;
    v2->_cache = v3;

  }
  return v2;
}

- (id)imageForKey:(id)a3
{
  return -[NSCache objectForKey:](self->_cache, "objectForKey:", a3);
}

- (void)setImage:(id)a3 forKey:(id)a4
{
  if (a3)
    -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
