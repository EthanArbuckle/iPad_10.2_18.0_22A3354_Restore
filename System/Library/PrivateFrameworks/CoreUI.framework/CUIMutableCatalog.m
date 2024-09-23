@implementation CUIMutableCatalog

- (void)insertCGImage:(CGImage *)a3 withName:(id)a4 andDescription:(id)a5
{
  id v10;
  void *v11;
  int v12;
  char v13;
  NSString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v10 = -[CUICatalog _themeStore](self, "_themeStore");
  v11 = v10;
  if ((*((_BYTE *)self + 88) & 1) == 0)
  {
    *((_BYTE *)self + 88) |= 1u;
    v12 = objc_opt_respondsToSelector(v10, a2) & 1;
    v13 = v12 ? 2 : 0;
    *((_BYTE *)self + 88) = *((_BYTE *)self + 88) & 0xFD | v13;
    if (!v12)
    {
      v14 = NSStringFromSelector(a2);
      NSStringFromSelector(a2);
      _CUILog(4, (uint64_t)"-[CUIMutableCatalog %@] themeStore doesn't respond to %@ ", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    }
  }
  if ((*((_BYTE *)self + 88) & 2) != 0)
    objc_msgSend(v11, "insertCGImage:withName:andDescription:", a3, a4, a5);
}

- (CUIMutableCatalog)initWithName:(id)a3
{
  CUIMutableCatalog *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;
  uint64_t v13;

  v12.receiver = self;
  v12.super_class = (Class)CUIMutableCatalog;
  v13 = 0;
  v4 = -[CUIMutableCatalog init](&v12, sel_init);
  -[CUICatalog setStorageRef:](v4, "setStorageRef:", +[CUIThemeFacet themeNamed:forBundleIdentifier:error:](CUIThemeFacet, "themeNamed:forBundleIdentifier:error:", a3, kCUIMutableStructureThemeStoreBundlePrefix, &v13));
  if (!-[CUICatalog storageRef](v4, "storageRef"))
  {
    _CUILog(4, (uint64_t)"-[CUIMutableCatalog init] got error: %@", v5, v6, v7, v8, v9, v10, v13);

    return 0;
  }
  return v4;
}

- (unint64_t)_storageRefForRendition:(id)a3 representsODRContent:(BOOL *)a4
{
  *a4 = 0;
  return -[CUICatalog storageRef](self, "storageRef", a3);
}

- (id)_baseKeyForName:(id)a3
{
  id result;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
    return -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
  return result;
}

- (CUIMutableCatalog)init
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIMutableCatalog.m"), 37, CFSTR("-[CUIMutableCatalog init] shouldn't be called"));
  return 0;
}

- (CUIMutableCatalog)initWithName:(id)a3 fromBundle:(id)a4 error:(id *)a5
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4, a5), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIMutableCatalog.m"), 43, CFSTR("-[CUIMutableCatalog initWithName:fromBundle:error:] shouldn't be called"));
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[CUICatalog clearCachedImageResources](self, "clearCachedImageResources");
  v3.receiver = self;
  v3.super_class = (Class)CUIMutableCatalog;
  -[CUICatalog dealloc](&v3, sel_dealloc);
}

- (void)insertCGImage:(CGImage *)a3 name:(id)a4 scale:(double)a5 idiom:(int64_t)a6 subtype:(int64_t)a7
{
  CUINamedImageDescription *v13;

  v13 = objc_alloc_init(CUINamedImageDescription);
  -[CUINamedImageDescription setScale:](v13, "setScale:", a5);
  -[CUINamedImageDescription setIdiom:](v13, "setIdiom:", a6);
  -[CUINamedImageDescription setSubtype:](v13, "setSubtype:", a7);
  -[CUIMutableCatalog insertCGImage:withName:andDescription:](self, "insertCGImage:withName:andDescription:", a3, a4, v13);

}

- (void)removeImageNamed:(id)a3 scale:(double)a4 idiom:(int64_t)a5 subtype:(int64_t)a6
{
  CUINamedImageDescription *v11;

  v11 = objc_alloc_init(CUINamedImageDescription);
  -[CUINamedImageDescription setScale:](v11, "setScale:", a4);
  -[CUINamedImageDescription setIdiom:](v11, "setIdiom:", a5);
  -[CUINamedImageDescription setSubtype:](v11, "setSubtype:", a6);
  -[CUIMutableCatalog removeImageNamed:withDescription:](self, "removeImageNamed:withDescription:", a3, v11);

}

- (void)removeImageNamed:(id)a3 withDescription:(id)a4
{
  id v8;
  void *v9;
  int v10;
  char v11;
  NSString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v8 = -[CUICatalog _themeStore](self, "_themeStore");
  v9 = v8;
  if ((*((_BYTE *)self + 88) & 1) == 0)
  {
    *((_BYTE *)self + 88) |= 1u;
    v10 = objc_opt_respondsToSelector(v8, a2) & 1;
    v11 = v10 ? 2 : 0;
    *((_BYTE *)self + 88) = *((_BYTE *)self + 88) & 0xFD | v11;
    if (!v10)
    {
      v12 = NSStringFromSelector(a2);
      NSStringFromSelector(a2);
      _CUILog(4, (uint64_t)"-[CUIMutableCatalog %@] themeStore doesn't respond to %@ ", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
    }
  }
  if ((*((_BYTE *)self + 88) & 2) != 0)
    objc_msgSend(v9, "removeImageNamed:withDescription:", a3, a4);
}

- (void)removeImagesNamed:(id)a3
{
  id v6;
  void *v7;
  int v8;
  char v9;
  NSString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = -[CUICatalog _themeStore](self, "_themeStore");
  v7 = v6;
  if ((*((_BYTE *)self + 88) & 1) == 0)
  {
    *((_BYTE *)self + 88) |= 1u;
    v8 = objc_opt_respondsToSelector(v6, a2) & 1;
    v9 = v8 ? 2 : 0;
    *((_BYTE *)self + 88) = *((_BYTE *)self + 88) & 0xFD | v9;
    if (!v8)
    {
      v10 = NSStringFromSelector(a2);
      NSStringFromSelector(a2);
      _CUILog(4, (uint64_t)"-[CUIMutableCatalog %@] themeStore doesn't respond to %@ ", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
    }
  }
  if ((*((_BYTE *)self + 88) & 2) != 0)
    objc_msgSend(v7, "removeImagesNamed:", a3);
}

@end
