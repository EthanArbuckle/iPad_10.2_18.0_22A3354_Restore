@implementation _MFTableCellAttributesCache

+ (id)sharedInstance
{
  id v2;
  _MFTableCellAttributesCache *v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!sSharedInstance)
  {
    v3 = objc_alloc_init(_MFTableCellAttributesCache);
    v4 = (void *)sSharedInstance;
    sSharedInstance = (uint64_t)v3;

  }
  objc_sync_exit(v2);

  return (id)sSharedInstance;
}

- (_MFTableCellAttributesCache)init
{
  _MFTableCellAttributesCache *v2;
  NSCache *v3;
  NSCache *attributesCache;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MFTableCellAttributesCache;
  v2 = -[_MFTableCellAttributesCache init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    attributesCache = v2->_attributesCache;
    v2->_attributesCache = v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__didReceiveFontSizeChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_MFTableCellAttributesCache;
  -[_MFTableCellAttributesCache dealloc](&v4, sel_dealloc);
}

- (void)_didReceiveFontSizeChangeNotification:(id)a3
{
  -[NSCache removeAllObjects](self->_attributesCache, "removeAllObjects", a3);
}

- (id)cachedAttributesForIdentifier:(id)a3 constructionBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[NSCache objectForKey:](self->_attributesCache, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v7[2](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](self->_attributesCache, "setObject:forKey:", v8, v6);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributesCache, 0);
}

@end
