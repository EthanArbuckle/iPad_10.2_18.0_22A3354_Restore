@implementation MTUIRenderedHandViewFactory

+ (id)keyForBundle:(id)a3 imagePath:(id)a4 offset:(CGPoint)a5 scale:(CGSize)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  CGPoint v22;
  CGSize v23;

  height = a6.height;
  width = a6.width;
  y = a5.y;
  x = a5.x;
  v11 = a4;
  objc_msgSend(a3, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22.x = x;
  v22.y = y;
  NSStringFromCGPoint(v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23.width = width;
  v23.height = height;
  NSStringFromCGSize(v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "length");
  v16 = objc_msgSend(v11, "length") + v15;
  v17 = objc_msgSend(v13, "length");
  v18 = v16 + v17 + objc_msgSend(v14, "length");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", v18);
  objc_msgSend(v19, "appendString:", v12);
  objc_msgSend(v19, "appendString:", v11);

  objc_msgSend(v19, "appendString:", v13);
  objc_msgSend(v19, "appendString:", v14);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v19);

  return v20;
}

+ (id)registerForFactoryWithBundle:(id)a3 imagePath:(id)a4 offset:(CGPoint)a5 scale:(CGSize)a6 allowCaching:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  MTUIRenderedHandViewFactory *v22;

  v7 = a7;
  height = a6.height;
  width = a6.width;
  y = a5.y;
  x = a5.x;
  v14 = a3;
  v15 = a4;
  if (!__factories)
  {
    v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v17 = (void *)__factories;
    __factories = (uint64_t)v16;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x24BDF7538], 0, 0, &__block_literal_global);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)__lowMemoryObserver;
    __lowMemoryObserver = v19;

  }
  objc_msgSend(a1, "keyForBundle:imagePath:offset:scale:", v14, v15, x, y, width, height);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__factories, "objectForKey:", v21);
  v22 = (MTUIRenderedHandViewFactory *)objc_claimAutoreleasedReturnValue();
  if (v22)
    goto LABEL_6;
  v22 = -[MTUIRenderedHandViewFactory initWithBundle:imagePath:offset:scale:allowCaching:]([MTUIRenderedHandViewFactory alloc], "initWithBundle:imagePath:offset:scale:allowCaching:", v14, v15, v7, x, y, width, height);
  if (v22)
  {
    objc_msgSend((id)__factories, "setObject:forKey:", v22, v21);
LABEL_6:
    -[MTUIRenderedHandViewFactory setRegisteredClientsCount:](v22, "setRegisteredClientsCount:", -[MTUIRenderedHandViewFactory registeredClientsCount](v22, "registeredClientsCount") + 1);
  }

  return v22;
}

uint64_t __96__MTUIRenderedHandViewFactory_registerForFactoryWithBundle_imagePath_offset_scale_allowCaching___block_invoke()
{
  __lowMemory = 1;
  return +[MTUIRenderedHandViewFactory flushAllCaches](MTUIRenderedHandViewFactory, "flushAllCaches");
}

+ (void)unregisterForFactory:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setRegisteredClientsCount:", objc_msgSend(v8, "registeredClientsCount") - 1);
  if (!objc_msgSend(v8, "registeredClientsCount"))
  {
    v3 = (void *)__factories;
    objc_msgSend(v8, "key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", v4);

  }
  if (!objc_msgSend((id)__factories, "count"))
  {
    v5 = (void *)__factories;
    __factories = 0;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", __lowMemoryObserver);

    v7 = (void *)__lowMemoryObserver;
    __lowMemoryObserver = 0;

    __lowMemory = 0;
  }

}

+ (void)flushAllCaches
{
  id v2;

  objc_msgSend((id)__factories, "allValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeObjectsPerformSelector:", sel_flushCache);

}

- (MTUIRenderedHandViewFactory)initWithBundle:(id)a3 imagePath:(id)a4 offset:(CGPoint)a5 scale:(CGSize)a6 allowCaching:(BOOL)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v15;
  id v16;
  MTUIRenderedHandViewFactory *v17;
  MTUIRenderedHandViewFactory *v18;
  CGSize *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *angleCache;
  __CFString *v22;
  const __CFURL *v23;
  MTUIRenderedHandViewFactory *v24;
  const __CFURL *v25;
  CGPDFDocument *v26;
  CGPDFDocument *v27;
  CGPDFPage *Page;
  MTUIRenderedHandViewFactory *v29;
  objc_super v31;

  height = a6.height;
  width = a6.width;
  y = a5.y;
  x = a5.x;
  v15 = a3;
  v16 = a4;
  v31.receiver = self;
  v31.super_class = (Class)MTUIRenderedHandViewFactory;
  v17 = -[MTUIRenderedHandViewFactory init](&v31, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_resourcesBundle, a3);
    objc_storeStrong((id *)&v18->_imagePath, a4);
    v18->_offset.x = x;
    v18->_offset.y = y;
    v19 = (CGSize *)MEMORY[0x24BDBF148];
    v18->_scale.width = width;
    v18->_scale.height = height;
    v18->_viewSize = *v19;
    v18->_allowCaching = a7;
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    angleCache = v18->_angleCache;
    v18->_angleCache = v20;

    -[NSBundle pathForResource:ofType:](v18->_resourcesBundle, "pathForResource:ofType:", v18->_imagePath, CFSTR("pdf"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], v22, kCFURLPOSIXPathStyle, 0);
      v24 = v18;
      if (v23)
      {
        v25 = v23;
        v26 = CGPDFDocumentCreateWithURL(v23);
        if (v26)
        {
          v27 = v26;
          Page = CGPDFDocumentGetPage(v26, 1uLL);
          v18->_page = CGPDFPageRetain(Page);
          CFRelease(v27);
        }
        CFRelease(v25);
        v24 = v18;
      }
    }
    else
    {
      v24 = 0;
    }
    v29 = v24;

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void)dealloc
{
  objc_super v3;

  CGPDFPageRelease(self->_page);
  v3.receiver = self;
  v3.super_class = (Class)MTUIRenderedHandViewFactory;
  -[MTUIRenderedHandViewFactory dealloc](&v3, sel_dealloc);
}

- (NSString)key
{
  return (NSString *)+[MTUIRenderedHandViewFactory keyForBundle:imagePath:offset:scale:](MTUIRenderedHandViewFactory, "keyForBundle:imagePath:offset:scale:", self->_resourcesBundle, self->_imagePath, self->_offset.x, self->_offset.y, self->_scale.width, self->_scale.height);
}

- (id)renderImageForAngle:(double)a3 viewSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  CGFloat v10;
  CGContext *CurrentContext;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;
  void *v19;
  CGSize v21;
  CGRect BoxRect;

  height = a4.height;
  width = a4.width;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;
  v21.width = width;
  v21.height = height;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v10);

  CurrentContext = UIGraphicsGetCurrentContext();
  v12 = MTUIRoundToPixel(width * 0.5);
  v13 = MTUIRoundToPixel(height * 0.5);
  CGContextTranslateCTM(CurrentContext, v12, v13);
  CGContextRotateCTM(CurrentContext, a3 + 3.14159265);
  BoxRect = CGPDFPageGetBoxRect(self->_page, kCGPDFMediaBox);
  v14 = BoxRect.size.width;
  v15 = self->_scale.width;
  v16 = self->_scale.height;
  if (v15 != *MEMORY[0x24BDBF148] || v16 != *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v14 = v15 * BoxRect.size.width;
    CGContextScaleCTM(CurrentContext, v15, v16);
  }
  v18 = MTUIRoundToPixel(v14 * -0.5);
  CGContextTranslateCTM(CurrentContext, v18 + self->_offset.x, self->_offset.y);
  CGContextDrawPDFPage(CurrentContext, self->_page);
  UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v19;
}

- (id)imageForAngle:(double)a3 viewSize:(CGSize)a4
{
  double height;
  double width;
  char v8;
  void *v9;
  CGFloat v10;
  double v11;
  void *v14;

  height = a4.height;
  width = a4.width;
  v8 = !self->_allowCaching | __lowMemory;
  if (!self->_allowCaching | __lowMemory & 1)
  {
    v9 = 0;
  }
  else
  {
    v11 = self->_viewSize.width;
    v10 = self->_viewSize.height;
    if (v11 == *MEMORY[0x24BDBF148] && v10 == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      self->_viewSize.width = width;
      self->_viewSize.height = a4.height;
      v10 = a4.height;
      v11 = width;
    }
    if (v11 == width && v10 == a4.height)
    {
      *(float *)&v10 = a3;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_angleCache, "objectForKey:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_18;
    }
    else
    {
      -[MTUIRenderedHandViewFactory flushCache](self, "flushCache", v10);
      v9 = 0;
      self->_allowCaching = 0;
    }
  }
  -[MTUIRenderedHandViewFactory renderImageForAngle:viewSize:](self, "renderImageForAngle:viewSize:", a3, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) == 0)
  {
    -[NSMutableDictionary removeAllObjects](self->_angleCache, "removeAllObjects");
    if (v14)
      -[NSMutableDictionary setObject:forKey:](self->_angleCache, "setObject:forKey:", v14, v9);
  }
LABEL_18:

  return v14;
}

- (void)flushCache
{
  -[NSMutableDictionary removeAllObjects](self->_angleCache, "removeAllObjects");
}

- (BOOL)allowCaching
{
  return self->_allowCaching;
}

- (unint64_t)registeredClientsCount
{
  return self->_registeredClientsCount;
}

- (void)setRegisteredClientsCount:(unint64_t)a3
{
  self->_registeredClientsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_angleCache, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);
  objc_storeStrong((id *)&self->_resourcesBundle, 0);
}

@end
