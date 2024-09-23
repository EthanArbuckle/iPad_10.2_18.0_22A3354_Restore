@implementation MPUBorderDrawingCache

- (MPUBorderDrawingCache)init
{
  MPUBorderDrawingCache *v2;
  void *v3;
  double v4;
  NSCache *v5;
  NSCache *images;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPUBorderDrawingCache;
  v2 = -[MPUBorderDrawingCache init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v2->_displayScale = v4;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    images = v2->_images;
    v2->_images = v5;

    -[NSCache setTotalCostLimit:](v2->_images, "setTotalCostLimit:", 20971520);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDF7538];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__applicationDidReceiveMemoryWarning_, v8, v9);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDF7538];
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)MPUBorderDrawingCache;
  -[MPUBorderDrawingCache dealloc](&v6, sel_dealloc);
}

- (void)setDisplayScale:(double)a3
{
  double SafeScaleForValue;

  SafeScaleForValue = MPUFloatGetSafeScaleForValue(a3);
  if (!MPUFloatEqualToFloat(self->_displayScale, SafeScaleForValue))
  {
    self->_displayScale = SafeScaleForValue;
    -[MPUBorderDrawingCache _invalidate](self, "_invalidate");
  }
}

- (id)imageForBorderConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  unint64_t v15;
  NSCache *images;
  void *v17;
  CGSize v19;

  v4 = a3;
  v5 = v4;
  if (!v4 || (objc_msgSend(v4, "isFullyTransparent") & 1) != 0)
    goto LABEL_3;
  -[NSCache objectForKey:](self->_images, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_9;
  if (MPUFloatGreaterThanOrEqualToFloat(self->_displayScale, 0.0))
  {
    -[MPUBorderDrawingCache _borderView](self, "_borderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderConfiguration:", v5);
    objc_msgSend(v7, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v9 = v8;
    v11 = v10;
    v12 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    objc_msgSend(v7, "setBounds:", *MEMORY[0x24BDBF090], v13, v8, v10);
    v19.width = v9;
    v19.height = v11;
    UIGraphicsBeginImageContextWithOptions(v19, 0, self->_displayScale);
    objc_msgSend(v7, "drawRect:", v12, v13, v9, v11);
    UIGraphicsGetImageFromCurrentImageContext();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend(v7, "resizableImageCapInsets");
    objc_msgSend(v14, "resizableImageWithCapInsets:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v15 = llround(v9 * self->_displayScale * (v11 * self->_displayScale));
      images = self->_images;
      v17 = (void *)objc_msgSend(v5, "copy");
      -[NSCache setObject:forKey:cost:](images, "setObject:forKey:cost:", v6, v17, v15);

    }
  }
  else
  {
LABEL_3:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (void)_applicationDidReceiveMemoryWarning:(id)a3
{
  MPUBorderView *borderView;

  borderView = self->_borderView;
  self->_borderView = 0;

}

- (id)_borderView
{
  MPUBorderView *borderView;
  MPUBorderView *v4;
  MPUBorderView *v5;

  borderView = self->_borderView;
  if (!borderView)
  {
    v4 = objc_alloc_init(MPUBorderView);
    v5 = self->_borderView;
    self->_borderView = v4;

    borderView = self->_borderView;
  }
  return borderView;
}

- (void)_invalidate
{
  id v3;

  -[NSCache removeAllObjects](self->_images, "removeAllObjects");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MPUBorderDrawingCacheDidInvalidateNotification"), self);

}

- (double)displayScale
{
  return self->_displayScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
}

@end
