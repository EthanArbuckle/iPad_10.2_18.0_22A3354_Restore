@implementation LUIImageCache

+ (id)sharedInstance
{
  if (qword_100088D18 != -1)
    dispatch_once(&qword_100088D18, &stru_100068F28);
  return (id)qword_100088D10;
}

- (NSCache)diameterPhotoCache
{
  NSCache *diameterPhotoCache;
  NSCache *v4;
  NSCache *v5;

  diameterPhotoCache = self->_diameterPhotoCache;
  if (!diameterPhotoCache)
  {
    v4 = (NSCache *)objc_alloc_init((Class)NSCache);
    v5 = self->_diameterPhotoCache;
    self->_diameterPhotoCache = v4;

    diameterPhotoCache = self->_diameterPhotoCache;
  }
  return diameterPhotoCache;
}

- (NSCache)diameterMonogramCache
{
  NSCache *diameterMonogramCache;
  NSCache *v4;
  NSCache *v5;

  diameterMonogramCache = self->_diameterMonogramCache;
  if (!diameterMonogramCache)
  {
    v4 = (NSCache *)objc_alloc_init((Class)NSCache);
    v5 = self->_diameterMonogramCache;
    self->_diameterMonogramCache = v4;

    diameterMonogramCache = self->_diameterMonogramCache;
  }
  return diameterMonogramCache;
}

- (NSCache)tintedImageCache
{
  NSCache *tintedImageCache;
  NSCache *v4;
  NSCache *v5;

  tintedImageCache = self->_tintedImageCache;
  if (!tintedImageCache)
  {
    v4 = (NSCache *)objc_alloc_init((Class)NSCache);
    v5 = self->_tintedImageCache;
    self->_tintedImageCache = v4;

    tintedImageCache = self->_tintedImageCache;
  }
  return tintedImageCache;
}

- (id)_cacheForImageType:(unint64_t)a3
{
  const char *v3;

  if (a3 == 1)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[LUIImageCache diameterMonogramCache](self, "diameterMonogramCache"));
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[LUIImageCache diameterPhotoCache](self, "diameterPhotoCache"));
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

- (void)cacheImage:(id)a3 forContact:(id)a4 monogramDiameter:(double)a5 imageType:(unint64_t)a6
{
  id v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  if (a5 > 0.0)
  {
    *(float *)&v11 = a5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
    if (v16 && v10)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIImageCache _cacheForImageType:](self, "_cacheForImageType:", a6));
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v12));
      if (!v14)
      {
        v14 = objc_alloc_init((Class)NSCache);
        objc_msgSend(v13, "setObject:forKey:", v14, v12);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      objc_msgSend(v14, "setObject:forKey:", v16, v15);

    }
  }

}

- (id)imageForContact:(id)a3 forMonogramDiameter:(double)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  *(float *)&v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIImageCache _cacheForImageType:](self, "_cacheForImageType:", v9 == 0));

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v8));
    if (v11)
    {
      v12 = (void *)v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v13));

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)tintedImageFromImage:(id)a3 color:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSCache *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  UIImage *ImageFromCurrentImageContext;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CGSize v33;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIImageCache tintedImageCache](self, "tintedImageCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIImageCache tintedImageCache](self, "tintedImageCache"));
    v11 = objc_opt_new(NSCache);
    objc_msgSend(v10, "setObject:forKey:", v11, v6);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIImageCache tintedImageCache](self, "tintedImageCache"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v7));

  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithRenderingMode:", 2));
    objc_msgSend(v6, "size");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v15, "scale");
    v21 = v20;
    v33.width = v17;
    v33.height = v19;
    UIGraphicsBeginImageContextWithOptions(v33, 0, v21);
    objc_msgSend(v7, "set");
    objc_msgSend(v6, "size");
    v23 = v22;
    objc_msgSend(v15, "size");
    objc_msgSend(v15, "drawInRect:", 0.0, 0.0, v23, v24);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v26 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);

    UIGraphicsEndImageContext();
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[LUIImageCache tintedImageCache](self, "tintedImageCache"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", v6));
    objc_msgSend(v28, "setObject:forKey:", v26, v7);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[LUIImageCache tintedImageCache](self, "tintedImageCache"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", v6));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", v7));

  return v31;
}

- (void)clearAllCaches
{
  NSCache *diameterPhotoCache;
  NSCache *diameterMonogramCache;
  NSCache *tintedImageCache;

  diameterPhotoCache = self->_diameterPhotoCache;
  self->_diameterPhotoCache = 0;

  diameterMonogramCache = self->_diameterMonogramCache;
  self->_diameterMonogramCache = 0;

  tintedImageCache = self->_tintedImageCache;
  self->_tintedImageCache = 0;

}

- (void)setDiameterPhotoCache:(id)a3
{
  objc_storeStrong((id *)&self->_diameterPhotoCache, a3);
}

- (void)setDiameterMonogramCache:(id)a3
{
  objc_storeStrong((id *)&self->_diameterMonogramCache, a3);
}

- (void)setTintedImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_tintedImageCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintedImageCache, 0);
  objc_storeStrong((id *)&self->_diameterMonogramCache, 0);
  objc_storeStrong((id *)&self->_diameterPhotoCache, 0);
}

@end
