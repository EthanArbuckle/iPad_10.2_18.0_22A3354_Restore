@implementation PDFPage

+ (OS_dispatch_queue)displayListCreationQueue
{
  if (displayListCreationQueue_onceToken != -1)
    dispatch_once(&displayListCreationQueue_onceToken, &__block_literal_global_17);
  return (OS_dispatch_queue *)(id)displayListCreationQueue_displayListCreationQueue;
}

void __35__PDFPage_displayListCreationQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("PDFKit.PDFPage.displayListCreationQueue", attr);
  v2 = (void *)displayListCreationQueue_displayListCreationQueue;
  displayListCreationQueue_displayListCreationQueue = (uint64_t)v1;

}

+ (BOOL)useLegacyImageHandling
{
  unsigned int v2;

  v2 = NSVersionOfLinkTimeLibrary("PDFKit");
  if (v2 == -1)
    return GetDefaultsWriteValue(CFSTR("PDFKit2_PDFPageUseLegacyImageHandling"), 0);
  else
    return v2 >> 18 < 0x113;
}

- (id)akPageAdaptor
{
  return self->_akPageAdaptor;
}

- (PDFPage)initWithPageRef:(CGPDFPage *)a3
{
  PDFPage *v4;
  PDFPage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDFPage;
  v4 = -[PDFPage init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[PDFPage _commonInit](v4, "_commonInit");
    -[PDFPage setPageRef:](v5, "setPageRef:", a3);
    v5->_pageNumber = CGPDFPageGetPageNumber(a3);
    v5->_isFullyConstructed = 1;
  }
  return v5;
}

- (PDFPage)initWithImageSource:(CGImageSource *)a3
{
  CGImage *ImageAtIndex;
  double v5;
  double v6;
  double v7;
  double v8;
  __n128 v9;
  __n128 v10;
  void *v11;
  void *v12;
  PDFPage *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
  if (ImageAtIndex)
  {
    CGImageGetSizeAfterOrientation();
    v6 = v5;
    v8 = v7;
    v9.n128_u64[0] = 0;
    v10.n128_u64[0] = 0;
    v15 = CFSTR("PDFPageImageInitializationOptionMediaBox");
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", PDFRectMake(v9, v10, v6, v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[PDFPage initWithCGImage:options:](self, "initWithCGImage:options:", ImageAtIndex, v12);
    CGImageRelease(ImageAtIndex);
    self = v13;

    ImageAtIndex = (CGImage *)self;
  }

  return (PDFPage *)ImageAtIndex;
}

- (PDFPage)initWithCGImage:(CGImage *)a3 options:(id)a4
{
  id v6;
  uint64_t v7;
  CGPDFPage *v8;
  PDFPage *v9;
  PDFPage *v10;
  uint64_t v11;
  NSDictionary *pageImageOptions;
  PDFPage *v13;

  v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "_createPageRefFromImage:andOptions:", a3, v6);
  if (v7)
  {
    v8 = (CGPDFPage *)v7;
    v9 = -[PDFPage initWithPageRef:](self, "initWithPageRef:", v7);
    v10 = v9;
    if (v9)
    {
      v9->_candidateForOCR = 1;
      v9->_requestedOCR = objc_msgSend((id)objc_opt_class(), "_getBooleanProperty:forKey:withDefault:", v6, CFSTR("PDFPageImageInitializationOptionPerformOCR"), 0);
      v10->candidateForFormDetection = 1;
      if (objc_msgSend((id)objc_opt_class(), "useLegacyImageHandling"))
      {
        v10->_pageImage = CGImageRetain(a3);
        v11 = objc_msgSend(v6, "copy");
        pageImageOptions = v10->_pageImageOptions;
        v10->_pageImageOptions = (NSDictionary *)v11;

      }
    }
    CGPDFPageRelease(v8);
    self = v10;
    v13 = self;
  }
  else
  {
    NSLog(CFSTR("CGPDFPageCreateWithImage returned NULL for image: %@"), a3);
    v13 = 0;
  }

  return v13;
}

- (PDFPage)initWithPageNumber:(unint64_t)a3 pageRect:(CGRect)a4 rotation:(int64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PDFPage *v11;
  PDFPage *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)PDFPage;
  v11 = -[PDFPage init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[PDFPage _commonInit](v11, "_commonInit");
    v12->_pageNumber = a3;
    v12->_mediaBox.origin.x = x;
    v12->_mediaBox.origin.y = y;
    v12->_mediaBox.size.width = width;
    v12->_mediaBox.size.height = height;
    v12->_rotation = PDFNormalizeRotation(a5);
  }
  return v12;
}

- (void)setupAKPageAdaptorIfNecessary
{
  uint64_t v2;
  void (**v3)(_QWORD);
  _QWORD v4[4];
  void (**v5)(_QWORD);
  _QWORD v6[5];

  if (!self->_akPageAdaptor)
  {
    v2 = MEMORY[0x24BDAC760];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__PDFPage_setupAKPageAdaptorIfNecessary__block_invoke;
    v6[3] = &unk_24C25C350;
    v6[4] = self;
    v3 = (void (**)(_QWORD))MEMORY[0x20BD1AEB4](v6, a2);
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v3[2](v3);
    }
    else
    {
      v4[0] = v2;
      v4[1] = 3221225472;
      v4[2] = __40__PDFPage_setupAKPageAdaptorIfNecessary__block_invoke_2;
      v4[3] = &unk_24C25D4B0;
      v5 = v3;
      dispatch_async(MEMORY[0x24BDAC9B8], v4);

    }
  }
}

void __40__PDFPage_setupAKPageAdaptorIfNecessary__block_invoke(uint64_t a1)
{
  PDFAKPageAdaptor *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = -[PDFAKPageAdaptor initWithPDFPage:]([PDFAKPageAdaptor alloc], "initWithPDFPage:", *(_QWORD *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 360), v2);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 120);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setupAKAnnotationAdaptorIfNecessary", (_QWORD)v9);
        -[PDFAKPageAdaptor pdfPage:didAddAnnotation:](v2, "pdfPage:didAddAnnotation:", *(_QWORD *)(a1 + 32), v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

uint64_t __40__PDFPage_setupAKPageAdaptorIfNecessary__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)akDidSetupRealPageModelController
{
  return self->_akDidSetupRealPageModelController;
}

- (void)setAKDidSetupRealPageModelController:(BOOL)a3
{
  self->_akDidSetupRealPageModelController = a3;
}

- (BOOL)setPageRef:(CGPDFPage *)a3
{
  CGPDFPage *page;
  int64_t rotation;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int RotationAngle;
  double v12;
  BOOL result;
  double v14;
  CGPDFDictionary *Dictionary;
  void *v16;
  void *v17;
  _QWORD block[5];
  CGRect v19;

  if (!a3)
    return 0;
  page = self->_page;
  if (page == a3)
    return 1;
  if (page)
    CGPDFPageRelease(page);
  rotation = self->_rotation;
  x = self->_mediaBox.origin.x;
  y = self->_mediaBox.origin.y;
  width = self->_mediaBox.size.width;
  height = self->_mediaBox.size.height;
  self->_page = CGPDFPageRetain(a3);
  RotationAngle = CGPDFPageGetRotationAngle(a3);
  self->_rotation = PDFNormalizeRotation(RotationAngle);
  -[PDFPage boundsForBox:](self, "boundsForBox:", 0);
  -[PDFPage setBounds:forBox:](self, "setBounds:forBox:", 0);
  -[PDFPage boundsForBox:](self, "boundsForBox:", 1);
  -[PDFPage setBounds:forBox:](self, "setBounds:forBox:", 1);
  -[PDFPage boundsForBox:](self, "boundsForBox:", 2);
  -[PDFPage setBounds:forBox:](self, "setBounds:forBox:", 2);
  -[PDFPage boundsForBox:](self, "boundsForBox:", 3);
  -[PDFPage setBounds:forBox:](self, "setBounds:forBox:", 3);
  -[PDFPage boundsForBox:](self, "boundsForBox:", 4);
  -[PDFPage setBounds:forBox:](self, "setBounds:forBox:", 4);
  self->_didChangeBounds = 0;
  -[PDFPage boundsForBox:](self, "boundsForBox:", 0);
  result = 0;
  if (v14 > 0.0 && v12 > 0.0)
  {
    Dictionary = CGPDFPageGetDictionary(a3);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __22__PDFPage_setPageRef___block_invoke;
    block[3] = &unk_24C25C588;
    block[4] = self;
    CGPDFDictionaryApplyBlock(Dictionary, block, 0);
    -[PDFPage document](self, "document");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      self->_isFullyConstructed = 1;
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:", CFSTR("PDFPagePageRefChanged"), self);

      if (self->_rotation != rotation)
      {
        if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
          -[PDFPage postPageDidRotateNotification](self, "postPageDidRotateNotification");
        else
          -[PDFPage performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_postPageDidRotateNotification, 0, 0);
      }
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      if (!PDFRectEqualToRect(v19, self->_mediaBox))
      {
        if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
          -[PDFPage postPageDidChangeBoundsNotification](self, "postPageDidChangeBoundsNotification");
        else
          -[PDFPage performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_postPageDidChangeBoundsNotification, 0, 0);
      }
    }
    return 1;
  }
  return result;
}

uint64_t __22__PDFPage_setPageRef___block_invoke(uint64_t a1, uint64_t a2, CGPDFObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  CFDataRef v8;
  CGPDFStreamRef value;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("AAPL:")))
  {
    objc_msgSend(v5, "substringFromIndex:", 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    value = 0;
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeStream, &value))
    {
      v7 = *(void **)(a1 + 32);
      v8 = CGPDFStreamCopyData(value, 0);
      objc_msgSend(v7, "setApplicationData:withName:", v8, v6);

    }
  }
  else
  {
    v6 = v5;
  }

  return 1;
}

- (void)setDocument:(id)a3
{
  objc_storeWeak((id *)&self->_document, a3);
}

- (void)purgeAll
{
  NSString *text;
  NSAttributedString *attributedString;

  text = self->_text;
  self->_text = 0;

  attributedString = self->_attributedString;
  self->_attributedString = 0;

  CGPDFLayoutRelease();
  self->_layout = 0;
  -[PDFPage pageRef](self, "pageRef");
  CGPDFPageRemoveLayout();
}

- (void)_drawAnnotationsWithBox:(int64_t)a3 inContext:(CGContext *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[PDFPage lazilyLoadAnnotations](self, "lazilyLoadAnnotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (+[PDFPage isExcludingAKAnnotationRenderingForThisThread](PDFPage, "isExcludingAKAnnotationRenderingForThisThread"))
        {
          objc_msgSend(v11, "akAnnotationAdaptor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "akAnnotation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            continue;
        }
        if (!+[PDFPage shouldHideAnnotationsForThisThread](PDFPage, "shouldHideAnnotationsForThisThread")
          && (self->_displaysMarkups || (objc_msgSend(v11, "isMarkupAnnotation") & 1) == 0)
          && (objc_msgSend(v11, "isHidden") & 1) == 0
          && objc_msgSend(v11, "shouldDisplay"))
        {
          objc_msgSend(v11, "drawWithBox:inContext:", a3, a4);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (int64_t)areaOfInterestAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int64_t v12;
  void *v13;
  int AreaOfInterestAtPoint;

  y = a3.y;
  x = a3.x;
  -[PDFPage annotationsIfAvail](self, "annotationsIfAvail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && ((-[PDFPage annotationAtPoint:](self, "annotationAtPoint:", x, y),
         (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
     || (-[PDFPage scannedAnnotationAtPoint:](self, "scannedAnnotationAtPoint:", x, y),
         (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    objc_msgSend(v7, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForAnnotationKey:", CFSTR("/FT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("/Link"));

    if ((v11 & 1) != 0)
    {
      v12 = 13;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("/Popup")) & 1) != 0)
    {
      v12 = 133;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("/Widget"))
           && objc_msgSend(v9, "isEqualToString:", CFSTR("/Tx"))
           && !objc_msgSend(v7, "isReadOnly"))
    {
      v12 = 37;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("/Widget"))
           && objc_msgSend(v9, "isEqualToString:", CFSTR("/Btn"))
           && !objc_msgSend(v7, "isReadOnly"))
    {
      v12 = 21;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("/Text")))
    {
      v12 = 69;
    }
    else
    {
      v12 = 5;
    }

  }
  else
  {
    v12 = 1;
  }
  -[PDFPage document](self, "document");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isSimpleSelectionEnabled"))
  {
    if (-[PDFPage pageLayoutIfAvail](self, "pageLayoutIfAvail"))
    {
      PDFPointToCGPoint(x, y);
      AreaOfInterestAtPoint = CGPDFPageLayoutGetAreaOfInterestAtPoint();
      v12 |= (AreaOfInterestAtPoint << 7) & 0x100 | (2 * (AreaOfInterestAtPoint & 1u));
    }
  }
  else
  {
    if (-[PDFPage columnAtPointIfAvailable:](self, "columnAtPointIfAvailable:", x, y))
      v12 |= 2uLL;
    if (-[PDFPage pageLayoutIfAvail](self, "pageLayoutIfAvail")
      && CGPDFLayoutGetRootNode()
      && CGPDFNodeGetNodeContainingPoint())
    {
      v12 |= 0x100uLL;
    }
  }

  return v12;
}

- (PDFPage)init
{
  PDFPage *v2;
  PDFPage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDFPage;
  v2 = -[PDFPage init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PDFPage _commonInit](v2, "_commonInit");
    -[PDFPage setBounds:forBox:](v3, "setBounds:forBox:", 0, 0.0, 0.0, 612.0, 792.0);
    v3->_isFullyConstructed = 1;
  }
  return v3;
}

- (PDFPage)initWithImage:(UIImage *)image
{
  UIImage *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __n128 v9;
  __n128 v10;
  void *v11;
  void *v12;
  PDFPage *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = image;
  -[UIImage size](v4, "size");
  v6 = v5;
  v8 = v7;
  v9.n128_u64[0] = 0;
  v10.n128_u64[0] = 0;
  v15 = CFSTR("PDFPageImageInitializationOptionMediaBox");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", PDFRectMake(v9, v10, v6, v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PDFPage initWithImage:options:](self, "initWithImage:options:", v4, v12);
  return v13;
}

- (PDFPage)initWithImage:(UIImage *)image options:(NSDictionary *)options
{
  UIImage *v6;
  NSDictionary *v7;
  UIImage *v8;
  CGImageRef v9;
  const void *v10;
  CGContext *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t NumberOfEntries;
  uint64_t NumberOfEntriesOfType;
  PDFPage *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = image;
  v7 = options;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v8 = objc_retainAutorelease(v6);
  v9 = CGImageRetain(-[UIImage CGImage](v8, "CGImage"));
  v21[3] = (uint64_t)v9;
  if (!v9)
  {
    v10 = (const void *)CGDisplayListCreate();
    if (v10)
    {
      v11 = (CGContext *)CGDisplayListContextCreate();
      if (v11)
      {
        -[UIImage size](v8, "size");
        v13 = v12;
        v15 = v14;
        UIGraphicsPushContext(v11);
        -[UIImage drawInRect:](v8, "drawInRect:", 0.0, 0.0, v13, v15);
        UIGraphicsPopContext();
        NumberOfEntries = CGDisplayListGetNumberOfEntries();
        NumberOfEntriesOfType = CGDisplayListGetNumberOfEntriesOfType();
        if (NumberOfEntries == 1 && NumberOfEntriesOfType == 1)
          CGDisplayListEnumerateEntriesWithOptions();
        CFRelease(v11);
      }
      CFRelease(v10);
    }
  }
  v18 = -[PDFPage initWithCGImage:options:](self, "initWithCGImage:options:", v21[3], v7);
  CGImageRelease((CGImageRef)v21[3]);
  _Block_object_dispose(&v20, 8);

  return v18;
}

CGImageRef __33__PDFPage_initWithImage_options___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  CGImageRef result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CGDisplayListEntryImageGetImage();
  result = CGImageRetain(*(CGImageRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  *a3 = 1;
  return result;
}

- (void)dealloc
{
  PDFAKPageAdaptor *akPageAdaptor;
  PDFAKPageAdaptor *v4;
  CGPDFPage *page;
  CGColor *pageBackgroundColorHint;
  CGDisplayList *displayList;
  objc_super v8;

  akPageAdaptor = self->_akPageAdaptor;
  if (akPageAdaptor)
  {
    -[PDFAKPageAdaptor teardown](akPageAdaptor, "teardown");
    v4 = self->_akPageAdaptor;
    self->_akPageAdaptor = 0;

  }
  if (self->_layout)
  {
    CGPDFLayoutRelease();
    self->_layout = 0;
  }
  CGImageRelease(self->_pageImage);
  page = self->_page;
  if (page)
  {
    CGPDFPageRelease(page);
    self->_page = 0;
  }
  pageBackgroundColorHint = self->_pageBackgroundColorHint;
  if (pageBackgroundColorHint)
  {
    CGColorRelease(pageBackgroundColorHint);
    self->_pageBackgroundColorHint = 0;
  }
  displayList = self->_displayList;
  if (displayList)
    CFRelease(displayList);
  v8.receiver = self;
  v8.super_class = (Class)PDFPage;
  -[PDFPage dealloc](&v8, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  uint64_t Document;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 357) = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_document);
    objc_storeWeak((id *)(v6 + 8), WeakRetained);

    Document = (uint64_t)CGPDFPageGetDocument(self->_page);
    if (Document)
    {
      CGPDFPageGetPageNumber(self->_page);
      Document = CGPDFDocumentCopyPage();
    }
    *(_QWORD *)(v6 + 16) = Document;
    v9 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
    v10 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v9;

    *(_QWORD *)(v6 + 48) = CGImageRetain(self->_pageImage);
    v11 = -[NSDictionary copyWithZone:](self->_pageImageOptions, "copyWithZone:", a3);
    v12 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v11;

    *(_DWORD *)(v6 + 64) = 0;
    *(_QWORD *)(v6 + 72) = 0;
    *(_BYTE *)(v6 + 80) = 0;
    *(_DWORD *)(v6 + 84) = 0;
    *(_BYTE *)(v6 + 88) = 0;
    v13 = *(void **)(v6 + 96);
    *(_QWORD *)(v6 + 96) = 0;

    v14 = *(void **)(v6 + 104);
    *(_QWORD *)(v6 + 104) = 0;

    *(_BYTE *)(v6 + 112) = self->_displaysAnnotations;
    *(_BYTE *)(v6 + 113) = self->_displaysMarkups;
    v15 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v16 = *(void **)(v6 + 136);
    *(_QWORD *)(v6 + 136) = v15;

    v17 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v18 = *(void **)(v6 + 144);
    *(_QWORD *)(v6 + 144) = v17;

    if (self->_annotations)
    {
      v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v20 = *(void **)(v6 + 120);
      *(_QWORD *)(v6 + 120) = v19;

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v21 = self->_annotations;
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v41 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v26, "type");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("Popup"));

            if ((v28 & 1) == 0)
            {
              v29 = (void *)objc_msgSend(v26, "copyWithZone:", a3);
              objc_msgSend(v29, "setPage:", v6);
              objc_msgSend(*(id *)(v6 + 120), "addObject:", v29);
              objc_msgSend(v29, "popup");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v30)
              {
                v31 = *(void **)(v6 + 120);
                objc_msgSend(v29, "popup");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "addObject:", v32);

              }
            }
          }
          v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v23);
      }

    }
    else
    {
      v33 = *(void **)(v6 + 120);
      *(_QWORD *)(v6 + 120) = 0;

    }
    *(_BYTE *)(v6 + 128) = *(_QWORD *)(v6 + 120) != 0;
    v34 = *(void **)(v6 + 152);
    *(_QWORD *)(v6 + 152) = 0;

    *(_QWORD *)(v6 + 160) = self->_rotation;
    objc_msgSend((id)v6, "setRotation:", self->_rotation);
    -[PDFPage boundsForBox:](self, "boundsForBox:", 0);
    objc_msgSend((id)v6, "setBounds:forBox:", 0);
    -[PDFPage boundsForBox:](self, "boundsForBox:", 1);
    objc_msgSend((id)v6, "setBounds:forBox:", 1);
    -[PDFPage boundsForBox:](self, "boundsForBox:", 2);
    objc_msgSend((id)v6, "setBounds:forBox:", 2);
    -[PDFPage boundsForBox:](self, "boundsForBox:", 3);
    objc_msgSend((id)v6, "setBounds:forBox:", 3);
    -[PDFPage boundsForBox:](self, "boundsForBox:", 4);
    objc_msgSend((id)v6, "setBounds:forBox:", 4);
    *(_BYTE *)(v6 + 416) = 0;
    *(_QWORD *)(v6 + 328) = 0;
    *(_BYTE *)(v6 + 336) = 0;
    *(_DWORD *)(v6 + 352) = 0;
    *(_BYTE *)(v6 + 417) = self->_candidateForOCR;
    *(_BYTE *)(v6 + 418) = self->_requestedOCR;
    *(_BYTE *)(v6 + 419) = self->_textFromOCR;
    *(_BYTE *)(v6 + 421) = self->candidateForFormDetection;
    v35 = -[NSMutableArray mutableCopy](self->_formFieldGroups, "mutableCopy");
    v36 = *(void **)(v6 + 440);
    *(_QWORD *)(v6 + 440) = v35;

    v37 = -[NSMutableDictionary mutableCopy](self->_persistentApplicationData, "mutableCopy");
    v38 = *(void **)(v6 + 448);
    *(_QWORD *)(v6 + 448) = v37;

    *(_BYTE *)(v6 + 357) = 1;
  }
  return (id)v6;
}

- (PDFDocument)document
{
  return (PDFDocument *)objc_loadWeakRetained((id *)&self->_document);
}

- (CGPDFPageRef)pageRef
{
  return self->_page;
}

- (NSString)label
{
  NSString *label;
  NSString *v4;
  NSString *v5;

  label = self->_label;
  if (!label)
  {
    v4 = (NSString *)CGPDFPageCopyPageLabel();
    v5 = self->_label;
    self->_label = v4;

    label = self->_label;
  }
  return label;
}

- (CGRect)boundsForBox:(PDFDisplayBox)box
{
  double width;
  CGFloat height;
  double x;
  CGFloat y;
  PDFPage *v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect BoxRect;
  CGRect v31;
  CGRect v32;
  CGRect result;
  CGRect v34;

  if ((unint64_t)box < (kPDFDisplayBoxArtBox|kPDFDisplayBoxCropBox))
  {
    v8 = self;
    v9 = (double *)((char *)self + 32 * box);
    x = v9[21];
    y = v9[22];
    width = v9[23];
    height = v9[24];
    if (width == 0.0)
    {
      self = (PDFPage *)self->_page;
      if (self)
      {
        BoxRect = CGPDFPageGetBoxRect((CGPDFPageRef)self, (CGPDFBox)box);
        x = PDFRectMake((__n128)BoxRect.origin, *(__n128 *)&BoxRect.origin.y, BoxRect.size.width, BoxRect.size.height);
        y = v10;
        width = v11;
        height = v12;
      }
      else
      {
        if ((unint64_t)box >= kPDFDisplayBoxBleedBox)
        {
          x = v8->_cropBox.origin.x;
          y = v8->_cropBox.origin.y;
          width = v8->_cropBox.size.width;
          height = v8->_cropBox.size.height;
        }
        if (width == 0.0)
        {
          x = v8->_mediaBox.origin.x;
          y = v8->_mediaBox.origin.y;
          width = v8->_mediaBox.size.width;
          height = v8->_mediaBox.size.height;
        }
      }
    }
    if (box)
    {
      v13 = PDFRectToCGRect(self);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v34.origin.x = PDFRectToCGRect(-[PDFPage boundsForBox:](v8, "boundsForBox:", 0));
      v34.origin.y = v20;
      v34.size.width = v21;
      v34.size.height = v22;
      v31.origin.x = v13;
      v31.origin.y = v15;
      v31.size.width = v17;
      v31.size.height = v19;
      v32 = CGRectIntersection(v31, v34);
      x = PDFRectFromCGRect(v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
      y = v23;
      width = v24;
      height = v25;
    }
  }
  else
  {
    width = *(double *)(MEMORY[0x24BDBF090] + 16);
    height = *(double *)(MEMORY[0x24BDBF090] + 24);
    x = *MEMORY[0x24BDBF090];
    y = *(double *)(MEMORY[0x24BDBF090] + 8);
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("boundsForBox: box is out of range"));
  }
  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)setBounds:(CGRect)bounds forBox:(PDFDisplayBox)box
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v9;
  void *v10;
  uint64_t v11;
  CGPDFPage *v12;
  CGRect v13;

  if ((unint64_t)box < (kPDFDisplayBoxArtBox|kPDFDisplayBoxCropBox))
  {
    height = bounds.size.height;
    width = bounds.size.width;
    y = bounds.origin.y;
    x = bounds.origin.x;
    if (box || bounds.size.width != 0.0)
    {
      switch(box)
      {
        case kPDFDisplayBoxMediaBox:
          goto LABEL_6;
        case kPDFDisplayBoxCropBox:
          self->_cropBox = bounds;
          break;
        case kPDFDisplayBoxBleedBox:
          self->_bleedBox = bounds;
          break;
        case kPDFDisplayBoxTrimBox:
          self->_trimBox = bounds;
          break;
        case kPDFDisplayBoxArtBox:
          self->_artBox = bounds;
          break;
        default:
          break;
      }
    }
    else
    {
      NSLog(CFSTR("Warning: -[PDFPage setBounds:forBox:] cannot set an empty rect for media box! Defaulting to 612 x 792"), a2);
      y = 0.0;
      width = 612.0;
      height = 792.0;
      x = 0.0;
LABEL_6:
      v13.origin.x = x;
      v13.origin.y = y;
      v13.size.width = width;
      v13.size.height = height;
      if (!PDFRectEqualToRect(v13, self->_mediaBox))
      {
        self->_mediaBox.origin.x = x;
        self->_mediaBox.origin.y = y;
        self->_mediaBox.size.width = width;
        self->_mediaBox.size.height = height;
        if (self->_pageImage)
        {
          if (objc_msgSend((id)objc_opt_class(), "useLegacyImageHandling"))
          {
            v9 = (void *)-[NSDictionary mutableCopy](self->_pageImageOptions, "mutableCopy");
            objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", self->_mediaBox.origin.x, self->_mediaBox.origin.y, self->_mediaBox.size.width, self->_mediaBox.size.height);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("PDFPageImageInitializationOptionMediaBox"));

            objc_storeStrong((id *)&self->_pageImageOptions, v9);
            v11 = objc_msgSend((id)objc_opt_class(), "_createPageRefFromImage:andOptions:", self->_pageImage, self->_pageImageOptions);
            if (v11)
            {
              v12 = (CGPDFPage *)v11;
              CGPDFPageRelease(self->_page);
              self->_page = v12;
            }

          }
        }
      }
    }
    if (self->_mediaBox.size.width == 0.0 && width > 0.0 && !-[PDFPage pageRef](self, "pageRef"))
    {
      self->_mediaBox.origin.x = x;
      self->_mediaBox.origin.y = y;
      self->_mediaBox.size.width = width;
      self->_mediaBox.size.height = height;
    }
    if (self->_isFullyConstructed)
      self->_didChangeBounds = 1;
    -[PDFPage postPageDidChangeBoundsNotification](self, "postPageDidChangeBoundsNotification");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("setBounds:forBox: box is out of range"), bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  }
}

- (void)postPageDidChangeBoundsNotification
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_isFullyConstructed)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("PDFPageChangedBoundsForBox"), self);

    WeakRetained = objc_loadWeakRetained((id *)&self->_document);
    if (WeakRetained)
    {
      v9 = WeakRetained;
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:", CFSTR("PDFPageChangedBoundsForBox"), v9);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", self, CFSTR("page"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("PDFPageDidChangeBounds"), v9, v7);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("PDFPageDidChangeBounds"), self, 0);

      WeakRetained = v9;
    }

  }
}

- (NSInteger)rotation
{
  return PDFNormalizeRotation(self->_rotation);
}

- (void)setRotation:(NSInteger)rotation
{
  id WeakRetained;
  int64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  const __CFString *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v11 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "allowsDocumentAssembly") & 1) == 0)
  {
    v9 = objc_msgSend(v11, "permissionsStatus");
    v10 = CFSTR("user");
    if (v9 == 2)
      v10 = CFSTR("owner");
    NSLog(CFSTR("PDFDocument's setRotation:withPageAtIndex: failed. PDF document's %@ permissions does not allow document assembly."), v10);
  }
  else
  {
    v6 = self->_rotation;
    v7 = PDFNormalizeRotation(rotation);
    if (v6 != v7)
    {
      v8 = v7;
      -[PDFPage pageRef](self, "pageRef");
      CGPDFPageSetRotationAngle();
      self->_rotation = v8;
      -[PDFPage _releaseDisplayList](self, "_releaseDisplayList");
      -[PDFAKPageAdaptor pdfPageWasRotated:](self->_akPageAdaptor, "pdfPageWasRotated:", self);
      -[PDFPage postPageDidRotateNotification](self, "postPageDidRotateNotification");
    }
  }

}

- (void)postPageDidRotateNotification
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  if (WeakRetained && self->_isFullyConstructed)
  {
    v7 = WeakRetained;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", self, CFSTR("page"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PDFPageDidRotate"), v7, v5);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("PDFPageDidRotate"), self, 0);

    WeakRetained = v7;
  }

}

- (id)lazilyLoadAnnotations
{
  NSMutableArray *annotations;
  void *v4;

  -[NSLock lock](self->_lock_getAnnotations, "lock");
  annotations = self->_annotations;
  if (!annotations)
  {
    -[PDFPage getAnnotations](self, "getAnnotations");
    atomic_store(1u, (unsigned __int8 *)&self->_loadedAnnotations);
    annotations = self->_annotations;
  }
  v4 = (void *)-[NSMutableArray copy](annotations, "copy");
  -[NSLock unlock](self->_lock_getAnnotations, "unlock");
  return v4;
}

- (id)annotationsIfAvail
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];

  v3 = atomic_load((unsigned __int8 *)&self->_loadedAnnotations);
  if ((v3 & 1) == 0)
  {
    -[PDFPage document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "textExtractionQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __29__PDFPage_annotationsIfAvail__block_invoke;
      block[3] = &unk_24C25C350;
      block[4] = self;
      dispatch_async(v6, block);

    }
  }
  return self->_annotations;
}

id __29__PDFPage_annotationsIfAvail__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "lazilyLoadAnnotations");
}

- (void)fetchAnnotationsWithCompletion:(id)a3 deliveredOnQueue:(id)a4
{
  void (**v6)(id, NSMutableArray *);
  NSObject *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  void (**v14)(id, NSMutableArray *);
  _QWORD block[5];
  NSObject *v16;
  void (**v17)(id, NSMutableArray *);

  v6 = (void (**)(id, NSMutableArray *))a3;
  v7 = a4;
  v8 = atomic_load((unsigned __int8 *)&self->_loadedAnnotations);
  if ((v8 & 1) != 0)
  {
    v6[2](v6, self->_annotations);
  }
  else
  {
    -[PDFPage document](self, "document");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "textExtractionQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__PDFPage_fetchAnnotationsWithCompletion_deliveredOnQueue___block_invoke;
      block[3] = &unk_24C25D438;
      block[4] = self;
      v16 = v7;
      v17 = v6;
      dispatch_async(v11, block);

      v12 = v16;
    }
    else
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __59__PDFPage_fetchAnnotationsWithCompletion_deliveredOnQueue___block_invoke_3;
      v13[3] = &unk_24C25D4B0;
      v14 = v6;
      dispatch_async(v7, v13);
      v12 = v14;
    }

  }
}

void __59__PDFPage_fetchAnnotationsWithCompletion_deliveredOnQueue___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "lazilyLoadAnnotations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__PDFPage_fetchAnnotationsWithCompletion_deliveredOnQueue___block_invoke_2;
  v6[3] = &unk_24C25CC38;
  v3 = *(NSObject **)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  dispatch_async(v3, v6);

}

uint64_t __59__PDFPage_fetchAnnotationsWithCompletion_deliveredOnQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __59__PDFPage_fetchAnnotationsWithCompletion_deliveredOnQueue___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)displaysAnnotations
{
  return self->_displaysAnnotations;
}

- (void)setDisplaysAnnotations:(BOOL)displaysAnnotations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->_displaysAnnotations != displaysAnnotations)
  {
    self->_displaysAnnotations = displaysAnnotations;
    -[PDFPage annotations](self, "annotations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "updateAnnotationEffect");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)addAnnotation:(PDFAnnotation *)annotation
{
  -[PDFPage addAnnotation:withUndo:](self, "addAnnotation:withUndo:", annotation, 0);
}

- (void)addAnnotation:(id)a3 withUndo:(BOOL)a4
{
  _BOOL4 v4;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  id v19;

  v4 = a4;
  v19 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v7 = WeakRetained;
  if (!WeakRetained || (objc_msgSend(WeakRetained, "allowsCommenting") & 1) != 0)
  {
    -[PDFPage insertAnnotation:atIndex:](self, "insertAnnotation:atIndex:", v19, -1);
    v8 = objc_loadWeakRetained((id *)&self->_view);
    if (!v8 || !v4)
      goto LABEL_9;
    objc_msgSend(v19, "akAnnotationAdaptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if (!objc_msgSend(v8, "allowsUndo"))
      {
LABEL_9:

        goto LABEL_13;
      }
      v10 = (void *)MEMORY[0x24BDD17C8];
      PDFKitLocalizedString(CFSTR("Add %@"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v11, v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "undoManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "prepareWithInvocationTarget:", self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeAnnotation:withUndo:", v19, 1);

      objc_msgSend(v8, "undoManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PDFKitLocalizedString(v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setActionName:", v16);

    }
    goto LABEL_9;
  }
  v17 = objc_msgSend(v7, "permissionsStatus");
  v18 = CFSTR("user");
  if (v17 == 2)
    v18 = CFSTR("owner");
  NSLog(CFSTR("PDFPage's addAnnotation: failed. PDF document's %@ permissions does not allow annotation modifications."), v18);
LABEL_13:

}

- (void)insertAnnotation:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  NSMutableArray *annotations;
  id v10;
  int v11;
  void *v12;
  PDFAnnotationChange *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  NSMutableArray *v27;
  NSMutableArray *v28;
  PDFAnnotationChange *v29;
  const __CFString *v30;
  id v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v8 = WeakRetained;
  if (!WeakRetained || (objc_msgSend(WeakRetained, "allowsCommenting") & 1) != 0)
  {
    if (!v6)
      goto LABEL_32;
    objc_msgSend(v6, "setPage:", self);
    -[NSLock lock](self->_lock_accessAnnotations, "lock");
    annotations = self->_annotations;
    if (annotations
      || (v10 = -[PDFPage annotations](self, "annotations"),
          (annotations = self->_annotations) != 0))
    {
      if (a4 < 0)
        goto LABEL_9;
    }
    else
    {
      v27 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
      v28 = self->_annotations;
      self->_annotations = v27;

      annotations = self->_annotations;
      if (a4 < 0)
        goto LABEL_9;
    }
    if (-[NSMutableArray count](annotations, "count") >= (unint64_t)a4)
    {
LABEL_10:
      if ((-[NSMutableArray containsObject:](self->_annotations, "containsObject:", v6) & 1) == 0)
      {
        -[NSMutableArray insertObject:atIndex:](self->_annotations, "insertObject:atIndex:", v6, a4);
        v29 = -[PDFAnnotationChange initWithAddedAnnotation:]([PDFAnnotationChange alloc], "initWithAddedAnnotation:", v6);
        -[NSMutableArray addObject:](self->_annotationChanges, "addObject:");
        -[NSMutableSet addObject:](self->_changedAnnotations, "addObject:", v6);
        v11 = objc_msgSend(v6, "shouldBurnIn");
        if (v8 && v11)
          objc_msgSend(v8, "setDocumentHasBurnInAnnotations:", 1);
        if (objc_msgSend(v6, "isRedaction"))
          objc_msgSend(v8, "incrementRedactionCount");
        if (self->_akPageAdaptor)
        {
          objc_msgSend(v6, "setupAKAnnotationAdaptorIfNecessary");
          -[PDFAKPageAdaptor pdfPage:didAddAnnotation:](self->_akPageAdaptor, "pdfPage:didAddAnnotation:", self, v6);
        }
        objc_msgSend(v6, "valueForAnnotationKey:", CFSTR("/Popup"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && (-[NSMutableArray containsObject:](self->_annotations, "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(v12, "setPage:", self);
          -[NSMutableArray insertObject:atIndex:](self->_annotations, "insertObject:atIndex:", v12, a4 + 1);
          v13 = -[PDFAnnotationChange initWithAddedAnnotation:]([PDFAnnotationChange alloc], "initWithAddedAnnotation:", v12);
          -[NSMutableArray addObject:](self->_annotationChanges, "addObject:", v13);
          -[NSMutableSet addObject:](self->_changedAnnotations, "addObject:", v12);
          if (self->_akPageAdaptor)
          {
            objc_msgSend(v12, "setupAKAnnotationAdaptorIfNecessary");
            -[PDFAKPageAdaptor pdfPage:didAddAnnotation:](self->_akPageAdaptor, "pdfPage:didAddAnnotation:", self, v12);
          }

        }
        objc_msgSend(v6, "valueForAnnotationKey:", CFSTR("/Subtype"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("/Widget"));

        if (v15)
          -[PDFPage _addWidgetAnnotationToLookupDictionary:](self, "_addWidgetAnnotationToLookupDictionary:", v6);
        objc_msgSend(v6, "addToPageView");
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFPage view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = CFSTR("page");
        v32[1] = CFSTR("annotation");
        v33[0] = self;
        v33[1] = v6;
        v32[2] = CFSTR("changeType");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2] = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("PDFViewAnnotationsDidChange"), v17, v19);

        -[PDFPage view](self, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "allowsMarkupAnnotationEditing");

        if (v21)
        {
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFPage view](self, "view");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = CFSTR("annotation");
          v31 = v6;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("PDFPageAnnotationAddedNotificationNotification"), v23, v24);

        }
      }
      -[NSLock unlock](self->_lock_accessAnnotations, "unlock");
      goto LABEL_32;
    }
    annotations = self->_annotations;
LABEL_9:
    a4 = -[NSMutableArray count](annotations, "count");
    goto LABEL_10;
  }
  v25 = objc_msgSend(v8, "permissionsStatus");
  v26 = CFSTR("user");
  if (v25 == 2)
    v26 = CFSTR("owner");
  NSLog(CFSTR("PDF document's %@ permissions does not allow annotation modifications."), v26);
LABEL_32:

}

- (void)removeAnnotation:(PDFAnnotation *)annotation
{
  -[PDFPage removeAnnotation:withUndo:](self, "removeAnnotation:withUndo:", annotation, 0);
}

- (void)removeAnnotation:(id)a3 withUndo:(BOOL)a4
{
  _BOOL4 v4;
  id WeakRetained;
  void *v7;
  NSMutableArray *annotations;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  id v21;

  v4 = a4;
  v21 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v7 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "allowsCommenting") & 1) == 0)
  {
    v19 = objc_msgSend(v7, "permissionsStatus");
    v20 = CFSTR("user");
    if (v19 == 2)
      v20 = CFSTR("owner");
    NSLog(CFSTR("PDFPage's removeAnnotation: failed. PDF document's %@ permissions does not allow annotation modifications."), v20);
  }
  else
  {
    annotations = self->_annotations;
    if (annotations)
    {
      v9 = -[NSMutableArray indexOfObject:](annotations, "indexOfObject:", v21);
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[PDFPage removeAnnotation:atIndex:](self, "removeAnnotation:atIndex:", v21, v9);
        v10 = objc_loadWeakRetained((id *)&self->_view);
        if (!v10 || !v4)
          goto LABEL_11;
        objc_msgSend(v21, "akAnnotationAdaptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          if (!objc_msgSend(v10, "allowsUndo"))
          {
LABEL_11:

            goto LABEL_15;
          }
          v12 = (void *)MEMORY[0x24BDD17C8];
          PDFKitLocalizedString(CFSTR("Remove %@"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "displayName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", v13, v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "undoManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "prepareWithInvocationTarget:", self);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addAnnotation:withUndo:", v21, 1);

          objc_msgSend(v10, "undoManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          PDFKitLocalizedString(v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setActionName:", v18);

        }
        goto LABEL_11;
      }
    }
  }
LABEL_15:

}

- (void)removeAnnotation:(id)a3 atIndex:(int64_t)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  NSMutableArray *annotations;
  PDFAnnotationChange *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PDFAKPageAdaptor *akPageAdaptor;
  PDFAnnotationChange *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  id v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v7 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "allowsCommenting") & 1) == 0)
  {
    v26 = objc_msgSend(v7, "permissionsStatus");
    v27 = CFSTR("user");
    if (v26 == 2)
      v27 = CFSTR("owner");
    NSLog(CFSTR("PDF document's %@ permissions does not allow annotation modifications."), v27);
  }
  else if (v5)
  {
    -[NSLock lock](self->_lock_accessAnnotations, "lock");
    if (self->_annotations)
    {
      if (objc_msgSend(v5, "isRedaction"))
        objc_msgSend(v7, "decrementRedactionCount");
      objc_msgSend(v5, "valueForAnnotationKey:", CFSTR("/Popup"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        annotations = self->_annotations;
        if (annotations)
        {
          if (-[NSMutableArray containsObject:](annotations, "containsObject:", v8))
          {
            -[NSMutableArray removeObject:](self->_annotations, "removeObject:", v8);
            v10 = -[PDFAnnotationChange initWithRemovedAnnotation:]([PDFAnnotationChange alloc], "initWithRemovedAnnotation:", v8);
            -[NSMutableArray addObject:](self->_annotationChanges, "addObject:", v10);
            -[NSMutableSet addObject:](self->_changedAnnotations, "addObject:", v8);

          }
        }
      }
      v29 = (void *)v8;
      objc_msgSend(v5, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "isEqualToString:", CFSTR("/Widget")))
      {
        objc_msgSend(v5, "valueForAnnotationKey:", CFSTR("/FT"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("/Tx")))
        {
          objc_msgSend(v7, "formData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v5, "fieldName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "removeFormFieldWithFieldName:", v13);

          }
        }
        -[PDFPage _removeWidgetAnnotationFromLookupDictionary:](self, "_removeWidgetAnnotationFromLookupDictionary:", v5);

      }
      -[PDFPage detectedFormFieldForAnnotation:](self, "detectedFormFieldForAnnotation:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
        objc_setAssociatedObject(v14, CFSTR("com.apple.pdfkit.AnnotationAssociatedObjectKey"), 0, 0);
      objc_msgSend(v5, "removeFromPageView");
      akPageAdaptor = self->_akPageAdaptor;
      if (akPageAdaptor)
        -[PDFAKPageAdaptor pdfPage:didRemoveAnnotation:](akPageAdaptor, "pdfPage:didRemoveAnnotation:", self, v5);
      objc_msgSend(v5, "setPage:", 0);
      -[NSMutableArray removeObject:](self->_annotations, "removeObject:", v5);
      v17 = -[PDFAnnotationChange initWithRemovedAnnotation:]([PDFAnnotationChange alloc], "initWithRemovedAnnotation:", v5);
      -[NSMutableArray addObject:](self->_annotationChanges, "addObject:", v17);
      -[NSMutableSet addObject:](self->_changedAnnotations, "addObject:", v5);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFPage view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = CFSTR("page");
      v32[1] = CFSTR("annotation");
      v33[0] = self;
      v33[1] = v5;
      v32[2] = CFSTR("changeType");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("PDFViewAnnotationsDidChange"), v19, v21);

      -[PDFPage view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = objc_msgSend(v22, "allowsMarkupAnnotationEditing");

      if ((_DWORD)v20)
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFPage view](self, "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = CFSTR("annotation");
        v31 = v5;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "postNotificationName:object:userInfo:", CFSTR("PDFPageAnnotationRemovedNotificationNotification"), v24, v25);

      }
      -[NSLock unlock](self->_lock_accessAnnotations, "unlock");

    }
    else
    {
      -[NSLock unlock](self->_lock_accessAnnotations, "unlock");
    }
  }

}

- (void)replaceAnnotation:(id)a3 withAnnotation:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9 && v6)
  {
    if (v9 != v6)
    {
      v7 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_annotations, "indexOfObjectIdenticalTo:", v9);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
      }
      else
      {
        v8 = v7;
        -[PDFPage removeAnnotation:atIndex:](self, "removeAnnotation:atIndex:", v9, v7);
        -[PDFPage insertAnnotation:atIndex:](self, "insertAnnotation:atIndex:", v6, v8);
      }
    }
  }
  else
  {
    NSLog(CFSTR("%s: Invalid nil parameter"), "-[PDFPage replaceAnnotation:withAnnotation:]");
  }

}

- (PDFAnnotation)annotationAtPoint:(CGPoint)point
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[7];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = PDFPointToCGPoint(point.x, point.y);
  v6 = v5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  -[NSLock lock](self->_lock_accessAnnotations, "lock");
  -[PDFPage annotations](self, "annotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __29__PDFPage_annotationAtPoint___block_invoke;
  v12[3] = &unk_24C25DFB0;
  *(double *)&v12[5] = v4;
  v12[6] = v6;
  v12[4] = &v13;
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v12);
  if (!v14[5])
  {
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __29__PDFPage_annotationAtPoint___block_invoke_2;
    v11[3] = &unk_24C25DFB0;
    *(double *)&v11[5] = v4;
    v11[6] = v6;
    v11[4] = &v13;
    objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v11);
  }
  -[NSLock unlock](self->_lock_accessAnnotations, "unlock");
  v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (PDFAnnotation *)v9;
}

void __29__PDFPage_annotationAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("/Popup"));

  if ((v8 & 1) == 0
    && objc_msgSend(v9, "shouldDisplay")
    && ((objc_msgSend(v9, "containsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48)) & 1) != 0
     || objc_msgSend(v9, "noteContainsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48))))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __29__PDFPage_annotationAtPoint___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("/Popup"));

  if ((v8 & 1) == 0
    && objc_msgSend(v9, "shouldDisplay")
    && ((objc_msgSend(v9, "containsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48)) & 1) != 0
     || objc_msgSend(v9, "noteContainsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48))))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)annotationAtRect:(CGRect)a3
{
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  CGRect v18;
  CGRect v19;

  v4 = PDFRectToCGRect(self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NSLock lock](self->_lock_accessAnnotations, "lock");
  -[PDFPage annotations](self, "annotations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    v13 = v12 - 1;
    while (1)
    {
      objc_msgSend(v11, "objectAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("/Popup"));

      if ((v16 & 1) == 0)
      {
        if (objc_msgSend(v14, "shouldDisplay"))
        {
          v18.origin.x = PDFRectToCGRect(objc_msgSend(v14, "bounds"));
          v19.origin.x = v4;
          v19.origin.y = v6;
          v19.size.width = v8;
          v19.size.height = v10;
          if (CGRectContainsRect(v18, v19))
            break;
        }
      }

      if (--v13 == -1)
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v14 = 0;
  }
  -[NSLock unlock](self->_lock_accessAnnotations, "unlock");

  return v14;
}

- (BOOL)hasPopups
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[PDFPage lazilyLoadAnnotations](self, "lazilyLoadAnnotations");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "valueForAnnotationKey:", CFSTR("/Subtype"), (_QWORD)v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("/Popup"));

        if ((v8 & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)drawWithBox:(PDFDisplayBox)box toContext:(CGContextRef)context
{
  -[PDFPage drawWithBox:inContext:isThumbnail:](self, "drawWithBox:inContext:isThumbnail:", box, context, 0);
}

- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4
{
  -[PDFPage drawWithBox:inContext:isThumbnail:](self, "drawWithBox:inContext:isThumbnail:", a3, a4, 0);
}

- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 isThumbnail:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v5 = a5;
  v14[4] = *MEMORY[0x24BDAC8D0];
  v9 = +[PDFPage isNativeRotationDrawingEnabledForThisThread](PDFPage, "isNativeRotationDrawingEnabledForThisThread");
  v13[0] = CFSTR("PDFPageDrawWithBoxOption_WithRotation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", !v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v13[1] = CFSTR("PDFPageDrawWithBoxOption_IsThumbnail");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v11;
  v14[2] = MEMORY[0x24BDBD1C8];
  v13[2] = CFSTR("PDFPageDrawWithBoxOption_DrawAnnotations");
  v13[3] = CFSTR("PDFPageDrawWithBoxOption_DrawBookmark");
  v14[3] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDFPage drawWithBox:inContext:withOptions:](self, "drawWithBox:inContext:withOptions:", a3, a4, v12);
}

- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withOptions:(id)a5
{
  id v8;
  int v9;
  char v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  PDFRenderingProperties *v17;
  BOOL v18;
  unint64_t v19;
  CGInterpolationQuality v20;
  _BOOL4 v21;
  CGAffineTransform transform;
  CGAffineTransform v23;
  CGRect v24;

  v8 = a5;
  v9 = objc_msgSend((id)objc_opt_class(), "_getBooleanProperty:forKey:withDefault:", v8, CFSTR("PDFPageDrawWithBoxOption_WithRotation"), 0);
  v10 = objc_msgSend((id)objc_opt_class(), "_getBooleanProperty:forKey:withDefault:", v8, CFSTR("PDFPageDrawWithBoxOption_IsThumbnail"), 0);
  v11 = objc_msgSend((id)objc_opt_class(), "_getBooleanProperty:forKey:withDefault:", v8, CFSTR("PDFPageDrawWithBoxOption_DrawAnnotations"), 0);
  v12 = objc_msgSend((id)objc_opt_class(), "_getBooleanProperty:forKey:withDefault:", v8, CFSTR("PDFPageDrawWithBoxOption_DrawBookmark"), 0);
  objc_msgSend((id)objc_opt_class(), "_getBooleanProperty:forKey:withDefault:", v8, CFSTR("PDFPageDrawWithBoxOption_RenderExtraContentStream"), 0);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PDFPageDrawWithBoxOption_DrawProgressCallback"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = +[PDFPage isNativeRotationDrawingEnabledForThisThread](PDFPage, "isNativeRotationDrawingEnabledForThisThread");
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", v9 ^ 1u);
  if (self->_page)
  {
    v14 = v12;
    v15 = v11;
    CGContextSaveGState(a4);
    memset(&v23, 0, sizeof(v23));
    -[PDFPage getDrawingTransformForBox:](self, "getDrawingTransformForBox:", a3);
    transform = v23;
    CGContextConcatCTM(a4, &transform);
    -[PDFPage document](self, "document");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "renderingProperties");
    v17 = (PDFRenderingProperties *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      v17 = objc_alloc_init(PDFRenderingProperties);
    v18 = -[PDFRenderingProperties shouldAntiAlias](v17, "shouldAntiAlias");
    CGContextSetAllowsAntialiasing(a4, v18);
    CGContextSetShouldAntialias(a4, v18);
    -[PDFRenderingProperties greekingThreshold](v17, "greekingThreshold");
    CGContextSetTextGreekingThreshold();
    if ((v10 & 1) == 0)
      -[PDFRenderingProperties lineWidthThreshold](v17, "lineWidthThreshold", 0.0);
    CGContextSetLineWidthThreshold();
    v19 = -[PDFRenderingProperties interpolationQuality](v17, "interpolationQuality");
    if (v19 < 3)
      v20 = v19 + 1;
    else
      v20 = kCGInterpolationDefault;
    CGContextSetInterpolationQuality(a4, v20);
    v24.origin.x = PDFRectToCGRect(-[PDFPage boundsForBox:](self, "boundsForBox:", a3));
    CGContextClipToRect(a4, v24);
    v11 = v15;
    if (GetDefaultsWriteDrawInvisibleText())
      CGPDFPageSetProperty();
    v12 = v14;
    if (CGContextGetType() == 1)
      CGPDFPageSetProperty();
    *(_QWORD *)&transform.a = v13;
    transform.b = 0.0;
    CGContextDrawPDFPageWithProgressCallback();
    if (*(_QWORD *)&transform.b >= 0xFBuLL)
      -[PDFPage getDisplayListWithCompletion:onQueue:](self, "getDisplayListWithCompletion:onQueue:", 0, 0);
    if (CGContextGetType() == 1)
      CGPDFPageRemoveProperty();
    if (GetDefaultsWriteDrawInvisibleText())
      CGPDFPageRemoveProperty();
    if (!self->_pageBackgroundColorHint)
      self->_pageBackgroundColorHint = (CGColor *)CGPDFPageCopyBackgroundColorHint();
    CGContextRestoreGState(a4);

  }
  if ((-[PDFPage displaysAnnotations](self, "displaysAnnotations") & v11) == 1)
    -[PDFPage _drawAnnotationsWithBox:inContext:](self, "_drawAnnotationsWithBox:inContext:", a3, a4);
  if (v12)
    -[PDFPage _drawBookmarkInContext:](self, "_drawBookmarkInContext:", a4);
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", v21);

}

- (void)_drawBookmarkInContext:(CGContext *)a3
{
  double Width;
  double Height;
  CGPath *Mutable;
  __int128 v7;
  double v8;
  const CGPath *v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  Width = (double)CGBitmapContextGetWidth(a3);
  Height = (double)CGBitmapContextGetHeight(a3);
  CGContextSetRGBFillColor(a3, 0.92, 0.19, 0.21, 1.0);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, 21.0);
  CGPathAddLineToPoint(Mutable, 0, 6.5, 16.0);
  CGPathAddLineToPoint(Mutable, 0, 13.0, 21.0);
  CGPathAddLineToPoint(Mutable, 0, 13.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, 0.0);
  CGPathCloseSubpath(Mutable);
  v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v12.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v11.a = *(_OWORD *)&v12.a;
  *(_OWORD *)&v11.c = v7;
  *(_OWORD *)&v11.tx = *(_OWORD *)&v12.tx;
  CGAffineTransformTranslate(&v12, &v11, Width + 425.0, Height + 555.0);
  v10 = v12;
  CGAffineTransformTranslate(&v11, &v10, 52.0, 84.0);
  v12 = v11;
  v10 = v11;
  CGAffineTransformScale(&v11, &v10, 8.0, 8.0);
  v12 = v11;
  v8 = PDFDegToRad(180.0);
  v10 = v12;
  CGAffineTransformRotate(&v11, &v10, v8);
  v12 = v11;
  v10 = v11;
  CGAffineTransformTranslate(&v11, &v10, -6.5, -10.5);
  v12 = v11;
  v9 = (const CGPath *)MEMORY[0x20BD1A6D4](Mutable, &v12);
  CGContextAddPath(a3, v9);
  CGContextFillPath(a3);
  CGPathRelease(Mutable);
  CGPathRelease(v9);
}

- (UIImage)thumbnailOfSize:(CGSize)size forBox:(PDFDisplayBox)box
{
  double height;
  double width;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  height = size.height;
  width = size.width;
  v12[3] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("PDFPageImageProperty_DrawBookmark");
  v11[1] = CFSTR("PDFPageImageProperty_DrawAnnotations");
  v12[0] = MEMORY[0x24BDBD1C0];
  v12[1] = MEMORY[0x24BDBD1C8];
  v11[2] = CFSTR("PDFPageImageProperty_WithRotation");
  v12[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFPage imageOfSize:forBox:withOptions:](self, "imageOfSize:forBox:withOptions:", box, v8, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v9;
}

- (id)thumbnailOfSize:(CGSize)a3 forBox:(int64_t)a4 withBookmark:(BOOL)a5
{
  return -[PDFPage thumbnailOfSize:forBox:withBookmark:withAnnotations:](self, "thumbnailOfSize:forBox:withBookmark:withAnnotations:", a4, a5, 1, a3.width, a3.height);
}

- (id)thumbnailOfSize:(CGSize)a3 forBox:(int64_t)a4 withBookmark:(BOOL)a5 withAnnotations:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v6 = a6;
  height = a3.height;
  width = a3.width;
  v17[3] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("PDFPageImageProperty_DrawBookmark");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v16[1] = CFSTR("PDFPageImageProperty_DrawAnnotations");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = CFSTR("PDFPageImageProperty_WithRotation");
  v17[1] = v12;
  v17[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDFPage imageOfSize:forBox:withOptions:](self, "imageOfSize:forBox:withOptions:", a4, v13, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)_getBooleanProperty:(id)a3 forKey:(id)a4 withDefault:(BOOL)a5
{
  void *v6;

  objc_msgSend(a3, "valueForKey:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      a5 = objc_msgSend(v6, "BOOLValue");
  }

  return a5;
}

- (id)imageOfSize:(CGSize)a3 forBox:(int64_t)a4 withOptions:(id)a5
{
  double height;
  double width;
  id v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  uint64_t Thumbnail;
  CGImage *v15;
  int v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGImage *v28;
  uint64_t v30;
  BOOL v31;
  BOOL v32;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v10 = objc_msgSend(v9, "valueForKey:", CFSTR("PDFPageImageProperty_ColorSpace"));
  objc_msgSend(v9, "valueForKey:", CFSTR("PDFPageImageProperty_BackgroundColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = +[PDFPage _getBooleanProperty:forKey:withDefault:](PDFPage, "_getBooleanProperty:forKey:withDefault:", v9, CFSTR("PDFPageImageProperty_DrawBookmark"), 0);
  v31 = +[PDFPage _getBooleanProperty:forKey:withDefault:](PDFPage, "_getBooleanProperty:forKey:withDefault:", v9, CFSTR("PDFPageImageProperty_DrawAnnotations"), 0);
  v12 = +[PDFPage _getBooleanProperty:forKey:withDefault:](PDFPage, "_getBooleanProperty:forKey:withDefault:", v9, CFSTR("PDFPageImageProperty_WithRotation"), 0);
  objc_msgSend(v9, "objectForKey:", CFSTR("PDFPageImageProperty_DrawProgressCallback"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_page
    || (Thumbnail = CGPDFPageGetThumbnail()) == 0
    || ((v15 = (CGImage *)Thumbnail, v16 = CGPDFPageContainsWideGamutContent(), !v10)
      ? (v17 = 0)
      : (CGImageGetColorSpace(v15), v17 = CGColorSpaceEqualToColorSpace() ^ 1),
        v16 != PDFKitCGImageIsWideGamut(v15)
     || (v17 & 1) != 0
     || width >= (double)CGImageGetWidth(v15)
     || height >= (double)CGImageGetHeight(v15)
     || (v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:", v15)) == 0))
  {
    -[PDFPage boundsForBox:](self, "boundsForBox:", a4);
    v22 = v21;
    v24 = v23;
    if (v12)
    {
      PDFRectRotate(-[PDFPage rotation](self, "rotation"), v19, v20);
      v22 = v25;
      v24 = v26;
    }
    v27 = width / v22;
    if (v24 * (width / v22) > height)
      v27 = height / v24;
    BYTE2(v30) = v32;
    BYTE1(v30) = v31;
    LOBYTE(v30) = 1;
    v28 = -[PDFPage _newCGImageWithBox:bitmapSize:scale:offset:colorSpace:backgroundColor:withRotation:withAntialiasing:withAnnotations:withBookmark:withOptions:withDelegate:](self, "_newCGImageWithBox:bitmapSize:scale:offset:colorSpace:backgroundColor:withRotation:withAntialiasing:withAnnotations:withBookmark:withOptions:withDelegate:", a4, vcvtmd_u64_f64(v22 * v27), vcvtmd_u64_f64(v24 * v27), v10, v11, v12, v27, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v30, v9, v13);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:", v28);
    CGImageRelease(v28);
  }

  return v18;
}

- (CGImage)_newCGImageWithBox:(int64_t)a3 bitmapSize:(PDFSizeIntegral)a4 scale:(double)a5 offset:(CGPoint)a6 colorSpace:(CGColorSpace *)a7 backgroundColor:(id)a8 withRotation:(BOOL)a9 withAntialiasing:(BOOL)a10 withAnnotations:(BOOL)a11 withBookmark:(BOOL)a12 withOptions:(id)a13 withDelegate:(id)a14
{
  _BOOL8 v14;
  CGFloat y;
  CGFloat x;
  size_t var1;
  size_t var0;
  id v22;
  id v23;
  id v24;
  CGColorSpace *DeviceRGB;
  uint32_t v26;
  CGContext *v27;
  CGContext *v28;
  id v29;
  CGImage *Image;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  CGRect v38;

  v14 = a9;
  y = a6.y;
  x = a6.x;
  var1 = a4.var1;
  var0 = a4.var0;
  v22 = a8;
  v23 = a13;
  v24 = a14;
  if (a7)
  {
    CFRetain(a7);
  }
  else
  {
    if (CGPDFPageContainsWideGamutContent())
      DeviceRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
    else
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
    a7 = DeviceRGB;
    if (!DeviceRGB)
    {
      Image = 0;
      goto LABEL_22;
    }
  }
  if (CGColorSpaceGetModel(a7))
    v26 = 8194;
  else
    v26 = 0;
  v27 = CGBitmapContextCreate(0, var0, var1, 8uLL, 0, a7, v26);
  if (v27)
  {
    v28 = v27;
    v36 = v24;
    CGContextSaveGState(v27);
    if (v22 && (v29 = objc_retainAutorelease(v22), objc_msgSend(v29, "CGColor")))
      CGContextSetFillColorWithColor(v28, (CGColorRef)objc_msgSend(objc_retainAutorelease(v29), "CGColor"));
    else
      CGContextSetRGBFillColor(v28, 1.0, 1.0, 1.0, 1.0);
    v38.size.width = (double)var0;
    v38.size.height = (double)var1;
    v38.origin.x = 0.0;
    v38.origin.y = 0.0;
    CGContextFillRect(v28, v38);
    CGContextTranslateCTM(v28, x, y);
    CGContextScaleCTM(v28, a5, a5);
    v31 = (void *)objc_msgSend(v23, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("PDFPageDrawWithBoxOption_WithRotation"));

    objc_msgSend(v31, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("PDFPageDrawWithBoxOption_IsThumbnail"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a11);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("PDFPageDrawWithBoxOption_DrawAnnotations"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a12);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v34, CFSTR("PDFPageDrawWithBoxOption_DrawBookmark"));

    -[PDFPage drawWithBox:inContext:withOptions:](self, "drawWithBox:inContext:withOptions:", a3, v28, v31);
    if (GetDefaultsWriteAKEnabled() && -[PDFPage displaysAnnotations](self, "displaysAnnotations") && a11)
      -[PDFPage _drawAnnotationsWithBox:inContext:](self, "_drawAnnotationsWithBox:inContext:", a3, v28);
    CGContextRestoreGState(v28);
    Image = CGBitmapContextCreateImage(v28);
    CGContextRelease(v28);

    v24 = v36;
  }
  else
  {
    Image = 0;
  }
  CGColorSpaceRelease(a7);
LABEL_22:

  return Image;
}

- (id)selectionForCodeRange:(_NSRange)a3
{
  return -[PDFPage selectionForRangeCommon:isCodeRange:](self, "selectionForRangeCommon:isCodeRange:", a3.location, a3.length, 1);
}

- (CGRect)columnFrameAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int v7;
  CGPDFLayout *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  CGRect *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  CGRect result;

  y = a3.y;
  x = a3.x;
  -[PDFPage document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSimpleSelectionEnabled");
  v8 = -[PDFPage pageLayout](self, "pageLayout");
  if (!v7)
  {
    if (v8)
    {
      if (CGPDFLayoutGetRootNode())
      {
        PDFPointToCGPoint(x, y);
        if (CGPDFNodeGetNodeContainingPoint())
        {
          CGPDFNodeGetBounds();
          v12 = PDFRectFromCGRect(v16, v17, v18, v19);
          v13 = v20;
          v14 = v21;
          v15 = v22;
          goto LABEL_12;
        }
      }
    }
LABEL_9:
    v12 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
    goto LABEL_12;
  }
  if (!v8)
    goto LABEL_9;
  v30 = 0;
  v31 = (CGRect *)&v30;
  v32 = 0x4010000000;
  v33 = &unk_209DCC48F;
  v34 = 0u;
  v35 = 0u;
  v9 = dispatch_semaphore_create(0);
  PDFPointToCGPoint(x, y);
  objc_msgSend(v6, "textExtractionQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  CGPDFPageLayoutGetColumnBoundsAtPointWithCompletion();

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (CGRectIsNull(v31[1]))
  {
    v12 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    v12 = PDFRectFromCGRect(v31[1].origin.x, v31[1].origin.y, v31[1].size.width, v31[1].size.height);
    v13 = v23;
    v14 = v24;
    v15 = v25;
  }

  _Block_object_dispose(&v30, 8);
LABEL_12:

  v26 = v12;
  v27 = v13;
  v28 = v14;
  v29 = v15;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

intptr_t __30__PDFPage_columnFrameAtPoint___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double *v5;

  v5 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)transformContext:(CGContextRef)context forBox:(PDFDisplayBox)box
{
  CGContext *CurrentContext;
  __int128 v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  CurrentContext = context;
  v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v9.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v9.c = v7;
  *(_OWORD *)&v9.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  if (context || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
  {
    -[PDFPage getDrawingTransformForBox:](self, "getDrawingTransformForBox:", box);
    v8 = v9;
    CGContextConcatCTM(CurrentContext, &v8);
  }
}

- (NSUInteger)numberOfCharacters
{
  void *v3;
  NSUInteger v4;
  void *v5;
  void *v6;

  -[PDFPage document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isLocked") & 1) != 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "isSimpleSelectionEnabled"))
  {
    -[PDFPage string](self, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v4 = objc_msgSend(v5, "length");
    else
      v4 = 0;

  }
  else
  {
    -[PDFPage pageLayout](self, "pageLayout");
    v4 = -[NSString length](self->_text, "length");
  }

  return v4;
}

- (NSString)string
{
  void *v3;
  NSString *v4;
  NSString *v5;

  -[PDFPage document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isLocked") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    if (objc_msgSend(v3, "isSimpleSelectionEnabled"))
    {
      -[PDFPage pageRef](self, "pageRef");
      v5 = (NSString *)CGPDFPageCopyString();
    }
    else
    {
      -[PDFPage pageLayout](self, "pageLayout");
      v5 = self->_text;
    }
    v4 = v5;
  }

  return v4;
}

- (NSAttributedString)attributedString
{
  void *v3;
  char v4;
  NSAttributedString *v5;
  NSAttributedString *attributedString;
  NSAttributedString *v7;
  NSAttributedString *v8;

  -[PDFPage document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocked");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    attributedString = self->_attributedString;
    if (!attributedString)
    {
      -[PDFPage _createAttributedString](self, "_createAttributedString");
      v7 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_attributedString;
      self->_attributedString = v7;

      attributedString = self->_attributedString;
    }
    v5 = attributedString;
  }
  return v5;
}

- (CGRect)characterBoundsAtIndex:(NSInteger)index
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  _BYTE v24[32];
  CGRect v25;
  CGRect result;

  -[PDFPage document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)v24 = *MEMORY[0x24BDD1408];
  *(_OWORD *)&v24[16] = *(_OWORD *)(MEMORY[0x24BDD1408] + 16);
  if ((objc_msgSend(v4, "isLocked") & 1) != 0)
  {
LABEL_2:
    v6 = *(double *)&v24[8];
    v5 = *(double *)v24;
    v8 = *(double *)&v24[24];
    v7 = *(double *)&v24[16];
    goto LABEL_3;
  }
  if (!objc_msgSend(v4, "isSimpleSelectionEnabled"))
  {
    if (self->_page)
    {
      if (-[PDFPage pageLayout](self, "pageLayout"))
      {
        CGPDFLayoutGetCharacterBounds();
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
      }
      else
      {
        v14 = *MEMORY[0x24BDBF070];
        v16 = *(double *)(MEMORY[0x24BDBF070] + 8);
        v18 = *(double *)(MEMORY[0x24BDBF070] + 16);
        v20 = *(double *)(MEMORY[0x24BDBF070] + 24);
      }
      v25.origin.x = v14;
      v25.origin.y = v16;
      v25.size.width = v18;
      v25.size.height = v20;
      if (!CGRectIsNull(v25))
      {
        *(CGFloat *)v24 = v14;
        *(CGFloat *)&v24[8] = v16;
        *(CGFloat *)&v24[16] = v18;
        *(CGFloat *)&v24[24] = v20;
      }
    }
    goto LABEL_2;
  }
  -[PDFPage pageLayout](self, "pageLayout");
  CGPDFPageLayoutGetCharacterSelectionBoundingBox();
  if (CGRectIsNull(*(CGRect *)v24))
  {
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    v5 = PDFRectFromCGRect(*(double *)v24, *(double *)&v24[8], *(double *)&v24[16], *(double *)&v24[24]);
    v6 = v21;
    v7 = v22;
    v8 = v23;
  }
LABEL_3:

  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (NSInteger)characterIndexAtPoint:(CGPoint)point
{
  double y;
  double x;
  void *v6;
  NSInteger v7;
  uint64_t TextRangeIndexAtPoint;
  uint64_t v10;
  CGPDFLayout *v11;
  CGPoint v12;
  CGRect v13;

  y = point.y;
  x = point.x;
  -[PDFPage document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isLocked") & 1) != 0)
    goto LABEL_2;
  if (objc_msgSend(v6, "isSimpleSelectionEnabled"))
  {
    -[PDFPage pageLayout](self, "pageLayout");
    PDFPointToCGPoint(x, y);
    TextRangeIndexAtPoint = CGPDFPageLayoutGetTextRangeIndexAtPoint();
    if (TextRangeIndexAtPoint == -1)
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v7 = TextRangeIndexAtPoint;
  }
  else
  {
    if (!self->_page)
    {
LABEL_2:
      v7 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
    LODWORD(v10) = -[PDFPage numberOfCharacters](self, "numberOfCharacters");
    v11 = -[PDFPage pageLayout](self, "pageLayout");
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 && (int)v10 >= 1)
    {
      v7 = 0;
      if (v10 <= 1uLL)
        v10 = 1;
      else
        v10 = v10;
      while (1)
      {
        CGPDFLayoutGetCharacterBounds();
        v12.x = x;
        v12.y = y;
        if (CGRectContainsPoint(v13, v12) && (unsigned __int16)(CGPDFLayoutGetCharacterUnicode() + 16) > 0xDu)
          break;
        if (v10 == ++v7)
          goto LABEL_2;
      }
    }
  }
LABEL_7:

  return v7;
}

- (int64_t)characterIndexNearestPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int64_t v7;
  int v8;
  CGPDFLayout *v9;
  uint64_t StringRangeIndexNearestPoint;
  uint64_t StartIndex;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double CenterPoint;
  double v31;
  double v32;
  double v33;
  double v34;

  y = a3.y;
  x = a3.x;
  -[PDFPage document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isLocked") & 1) != 0)
    goto LABEL_2;
  v8 = objc_msgSend(v6, "isSimpleSelectionEnabled");
  v9 = -[PDFPage pageLayout](self, "pageLayout");
  if (v8)
  {
    PDFPointToCGPoint(x, y);
    StringRangeIndexNearestPoint = CGPDFPageLayoutGetStringRangeIndexNearestPoint();
    if (StringRangeIndexNearestPoint == -1)
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v7 = StringRangeIndexNearestPoint;
    goto LABEL_7;
  }
  if (!v9)
  {
LABEL_2:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
  PDFPointToCGPoint(x, y);
  if (CGPDFLayoutCreateSelectionAtPoint())
  {
    StartIndex = CGPDFSelectionGetStartIndex();
    if (StartIndex != -1)
    {
      v7 = StartIndex;
      CGPDFSelectionRelease();
      goto LABEL_7;
    }
    goto LABEL_2;
  }
  -[PDFPage selectionForAll](self, "selectionForAll");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "numberOfTextRangesOnPage:", self);
  if (!v14)
  {

    goto LABEL_2;
  }
  v15 = v14;
  v16 = 0;
  v7 = -1;
  v17 = 1.79769313e308;
  do
  {
    v18 = objc_msgSend(v13, "rangeAtIndex:onPage:", v16, self);
    if (v18 < v18 + v19)
    {
      v20 = v18;
      v21 = v19;
      do
      {
        -[PDFPage selectionForRange:](self, "selectionForRange:", v20, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "boundsForPage:", self);
        v27 = PDFRectFromCGRect(v23, v24, v25, v26);
        CenterPoint = PDFRectGetCenterPoint(v27, v28, v29);
        v32 = PDFPointToCGPoint(CenterPoint, v31);
        v34 = vabdd_f64(v32, x) + vabdd_f64(v33, y);
        if (v34 < v17)
        {
          v17 = v34;
          v7 = v20;
        }

        ++v20;
        --v21;
      }
      while (v21);
    }
    ++v16;
  }
  while (v16 != v15);

  if (v7 < 0)
    goto LABEL_2;
LABEL_7:

  return v7;
}

- (PDFSelection)selectionForRect:(CGRect)rect
{
  PDFSelection *v4;
  void *v5;
  PDFSelection *v6;
  uint64_t v7;

  v4 = [PDFSelection alloc];
  -[PDFPage document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PDFSelection initWithDocument:](v4, "initWithDocument:", v5);

  v7 = CGPDFSelectionCreateInRect();
  if (v7)
  {
    -[PDFSelection addCGSelection:forPage:](v6, "addCGSelection:forPage:", v7, self);
    CGPDFSelectionRelease();
  }
  -[PDFSelection setForceBreaks:](v6, "setForceBreaks:", 1);
  return v6;
}

- (id)selectionForCharacterAtPoint:(CGPoint)a3
{
  uint64_t v4;
  uint64_t v5;
  PDFSelection *v6;
  void *v7;
  PDFSelection *v8;

  PDFPointToCGPoint(a3.x, a3.y);
  v4 = CGPDFSelectionCreateAtPointWithOptions();
  if (v4)
  {
    v5 = v4;
    v6 = [PDFSelection alloc];
    -[PDFPage document](self, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PDFSelection initWithDocument:](v6, "initWithDocument:", v7);

    -[PDFSelection addCGSelection:forPage:](v8, "addCGSelection:forPage:", v5, self);
    CGPDFSelectionRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (PDFSelection)selectionForWordAtPoint:(CGPoint)point
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  y = point.y;
  x = point.x;
  -[PDFPage rvItemAtPoint:](self, "rvItemAtPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "clientHints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("selection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PDFPage selectionFromPoint:toPoint:type:](self, "selectionFromPoint:toPoint:type:", 1, x, y, x, y);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (PDFSelection *)v9;
}

- (PDFSelection)selectionForLineAtPoint:(CGPoint)point
{
  return (PDFSelection *)-[PDFPage selectionFromPoint:toPoint:type:](self, "selectionFromPoint:toPoint:type:", 2, point.x, point.y, point.x, point.y);
}

- (PDFSelection)selectionFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint
{
  return (PDFSelection *)-[PDFPage selectionFromPoint:toPoint:type:](self, "selectionFromPoint:toPoint:type:", 0, startPoint.x, startPoint.y, endPoint.x, endPoint.y);
}

- (PDFSelection)selectionForRange:(NSRange)range
{
  return (PDFSelection *)-[PDFPage selectionForRangeCommon:isCodeRange:](self, "selectionForRangeCommon:isCodeRange:", range.location, range.length, 0);
}

- (NSData)dataRepresentation
{
  __CFData *Mutable;
  __CFData *v4;
  CGDataConsumer *v5;
  BOOL v6;

  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v4 = Mutable;
  if (Mutable)
  {
    v5 = CGDataConsumerCreateWithCFData(Mutable);
    v6 = -[PDFPage _writeToConsumer:](self, "_writeToConsumer:", v5);
    if (v5)
      CGDataConsumerRelease(v5);
    if (!v6)
    {
      CFRelease(v4);
      v4 = 0;
    }
  }
  return (NSData *)v4;
}

- (void)_commonInit
{
  NSString *text;
  NSAttributedString *attributedString;
  NSMutableArray *annotations;
  NSLock *v6;
  NSLock *lock_getAnnotations;
  NSLock *v8;
  NSLock *lock_accessAnnotations;
  NSMutableArray *detectedAnnotations;
  CGPoint v11;
  CGSize v12;
  NSMutableArray *v13;
  NSMutableArray *createDisplayListCompletionBlocks;
  NSMutableArray *v15;
  NSMutableArray *annotationChanges;
  NSMutableSet *v17;
  NSMutableSet *changedAnnotations;
  NSMutableDictionary *v19;
  NSMutableDictionary *widgetAnnotationLookup;
  NSMutableArray *v21;
  NSMutableArray *scannerResults;

  objc_storeWeak((id *)&self->_document, 0);
  self->_page = 0;
  self->_layoutLock._os_unfair_lock_opaque = 0;
  self->_layout = 0;
  self->_builtLayout = 0;
  self->_dataDetectorsLock._os_unfair_lock_opaque = 0;
  self->_ranDataDetectors = 0;
  text = self->_text;
  self->_text = 0;

  attributedString = self->_attributedString;
  self->_attributedString = 0;

  self->_loadedAnnotations = 0;
  annotations = self->_annotations;
  self->_annotations = 0;

  *(_WORD *)&self->_displaysAnnotations = 257;
  v6 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
  lock_getAnnotations = self->_lock_getAnnotations;
  self->_lock_getAnnotations = v6;

  v8 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
  lock_accessAnnotations = self->_lock_accessAnnotations;
  self->_lock_accessAnnotations = v8;

  detectedAnnotations = self->_detectedAnnotations;
  self->_detectedAnnotations = 0;

  self->_rotation = 0;
  v11 = (CGPoint)*MEMORY[0x24BDBF090];
  v12 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->_mediaBox.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->_mediaBox.size = v12;
  self->_cropBox.origin = v11;
  self->_cropBox.size = v12;
  self->_bleedBox.origin = v11;
  self->_bleedBox.size = v12;
  self->_trimBox.origin = v11;
  self->_trimBox.size = v12;
  self->_artBox.origin = v11;
  self->_artBox.size = v12;
  self->_displayList = 0;
  self->_creatingDisplayList = 0;
  v13 = (NSMutableArray *)objc_opt_new();
  createDisplayListCompletionBlocks = self->_createDisplayListCompletionBlocks;
  self->_createDisplayListCompletionBlocks = v13;

  self->_akDidSetupRealPageModelController = 0;
  self->_displayListMutex._os_unfair_lock_opaque = 0;
  *(uint32_t *)((char *)&self->_displayListMutex._os_unfair_lock_opaque + 3) = 0;
  v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  annotationChanges = self->_annotationChanges;
  self->_annotationChanges = v15;

  v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  changedAnnotations = self->_changedAnnotations;
  self->_changedAnnotations = v17;

  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  widgetAnnotationLookup = self->_widgetAnnotationLookup;
  self->_widgetAnnotationLookup = v19;

  self->_widgetAnnotationLookupLock._os_unfair_lock_opaque = 0;
  v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  scannerResults = self->_scannerResults;
  self->_scannerResults = v21;

  self->_candidateForOCR = 2;
  self->candidateForFormDetection = 1;
}

- (id)_createAttributedString
{
  void *v2;
  void *v3;

  -[PDFPage selectionForAll](self, "selectionForAll");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (CGPDFPage)_createPageRefFromImage:(CGImage *)a3 andOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  CGPDFPage *v21;

  v5 = a4;
  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%s: image must not be NULL"), "+[PDFPage _createPageRefFromImage:andOptions:]");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PDFPageImageInitializationOptionRotation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "intValue");
    HIDWORD(v9) = -1527099483 * v8 + 47721858;
    LODWORD(v9) = HIDWORD(v9);
    if ((v9 >> 1) >= 0x2D82D83)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%s: PDFPageImageInitializationOptionRotation must be a multiple of 90"), "+[PDFPage _createPageRefFromImage:andOptions:]");
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PDFPageImageInitializationOptionMediaBox"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "PDFKitPDFRectValue");
  else
    CGImageGetSizeAfterOrientation();
  v12 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PDFPageImageInitializationOptionUpscaleIfSmaller"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_msgSend(v13, "BOOLValue");
    v15 = (_QWORD *)MEMORY[0x24BDBD270];
    if (!v14)
      v15 = (_QWORD *)MEMORY[0x24BDBD268];
    objc_msgSend(v12, "setObject:forKeyedSubscript:", *v15, *MEMORY[0x24BDBF4D8]);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PDFPageImageInitializationOptionCompressionQuality"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "doubleValue");
    v18 = v17;
    if (v17 < 0.0 || v17 > 1.0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%s: PDFPageImageInitializationOptionCompressionQuality must be between 0.0 and 1.0"), "+[PDFPage _createPageRefFromImage:andOptions:]");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDBF460]);

  }
  v20 = v12;

  v21 = (CGPDFPage *)CGPDFPageCreateWithImage();
  if (!v21)
    NSLog(CFSTR("CGPDFPageCreateWithImage returned NULL for image: %@"), a3);

  return v21;
}

- (id)selectionForRangeCommon:(_NSRange)a3 isCodeRange:(BOOL)a4
{
  _BOOL4 v4;
  PDFSelection *v6;
  void *v7;
  PDFSelection *v8;
  uint64_t v9;

  if (a3.length)
  {
    v4 = a4;
    -[PDFPage numberOfCharacters](self, "numberOfCharacters");
    v6 = [PDFSelection alloc];
    -[PDFPage document](self, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PDFSelection initWithDocument:](v6, "initWithDocument:", v7);

    if (v8)
    {
      if (v4)
        v9 = CGPDFSelectionCreateForRange();
      else
        v9 = CGPDFSelectionCreateForStringRange();
      if (v9)
      {
        -[PDFSelection addCGSelection:forPage:](v8, "addCGSelection:forPage:", v9, self);
        CGPDFSelectionRelease();
      }
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)fontWithPDFFont:(CGPDFFont *)a3 size:(float)a4
{
  CGFont *Font;
  CFStringRef v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CTFontDescriptorRef MatchingFontDescriptor;
  void *v12;
  void *v13;
  CTFontDescriptorRef v14;
  const __CFString *v15;
  uint64_t v16;
  char Flags;
  const __CFString *v18;
  double v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  Font = (CGFont *)CGPDFFontGetFont();
  v6 = CGFontCopyPostScriptName(Font);
  if (v6)
  {
    v7 = (__CFString *)v6;
    v8 = *MEMORY[0x24BDC4D70];
    v25 = *MEMORY[0x24BDC4D70];
    v26[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)CTFontDescriptorCreateWithAttributesAndOptions();

    if (!v10
      || (MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor((CTFontDescriptorRef)v10, 0),
          CFRelease(v10),
          MatchingFontDescriptor)
      && (objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", MatchingFontDescriptor, a4),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          MatchingFontDescriptor,
          v10))
    {
      v12 = v7;
LABEL_34:

      return v10;
    }
    if ((unint64_t)-[__CFString length](v7, "length") >= 8
      && -[__CFString characterAtIndex:](v7, "characterAtIndex:", 6) == 43)
    {
      -[__CFString substringFromIndex:](v7, "substringFromIndex:", 7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v8;
      v24 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)CTFontDescriptorCreateWithAttributesAndOptions();

      if (!v10)
        goto LABEL_34;
      v14 = CTFontDescriptorCreateMatchingFontDescriptor((CTFontDescriptorRef)v10, 0);
      CFRelease(v10);
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v14, a4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          goto LABEL_34;
      }
    }
    else
    {
      v12 = v7;
    }
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Arial,Bold")) & 1) != 0)
    {
      v15 = CFSTR("Arial-BoldMT");
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Arial,BoldItalic")) & 1) != 0)
    {
      v15 = CFSTR("Arial-BoldItalicMT");
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Arial,Italic")) & 1) != 0)
    {
      v15 = CFSTR("Arial-ItalicMT");
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Helvetica-Black")) & 1) != 0
           || (objc_msgSend(v12, "isEqualToString:", CFSTR("Helvetica-Narrow-Bold")) & 1) != 0)
    {
      v15 = CFSTR("Helvetica-Bold");
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("HelveticaNeue-Black")) & 1) != 0)
    {
      v15 = CFSTR("HelveticaNeue-Bold");
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("TimesNewRoman")) & 1) != 0)
    {
      v15 = CFSTR("TimesNewRomanPSMT");
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("TimesNewRoman,Bold")) & 1) != 0)
    {
      v15 = CFSTR("TimesNewRomanPS-BoldMT");
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("TimesNewRoman,BoldItalic")) & 1) != 0)
    {
      v15 = CFSTR("TimesNewRomanPS-BoldItalicMT");
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("TimesNewRoman,Italic")) & 1) != 0)
    {
      v15 = CFSTR("TimesNewRomanPS-ItalicMT");
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("ZapfDingbats")))
        goto LABEL_24;
      v15 = CFSTR("ZapfDingbatsITC");
    }
    objc_msgSend(MEMORY[0x24BDF6A70], "fontWithName:size:", v15, a4);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
LABEL_33:
      v10 = (void *)v16;
      goto LABEL_34;
    }
LABEL_24:
    CGPDFFontGetFontDescriptor();
    Flags = CGPDFFontDescriptorGetFlags();
    v18 = CFSTR("Courier");
    v19 = a4;
    if ((Flags & 1) == 0)
      v18 = CFSTR("Times");
    v20 = CFSTR("Helvetica");
    if ((Flags & 1) != 0)
      v20 = CFSTR("Monaco");
    if ((Flags & 2) != 0)
      v21 = v18;
    else
      v21 = v20;
    objc_msgSend(MEMORY[0x24BDF6A70], "fontWithName:size:", v21, v19);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "fontWithName:size:", CFSTR("Times"), v19);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_33;
  }
  v10 = 0;
  return v10;
}

- (id)selectionFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 type:(int)a5
{
  double y;
  double x;
  void *v8;
  PDFSelection *v9;
  uint64_t BetweenPointsWithOptions;
  uint64_t v11;
  double v12;

  y = a4.y;
  x = a4.x;
  PDFPointToCGPoint(a3.x, a3.y);
  PDFPointToCGPoint(x, y);
  -[PDFPage document](self, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "isSimpleSelectionEnabled");
  if (!-[PDFPage pageLayout](self, "pageLayout"))
    goto LABEL_7;
  v9 = -[PDFSelection initWithDocument:]([PDFSelection alloc], "initWithDocument:", v8);
  if (v9)
  {
    BetweenPointsWithOptions = CGPDFSelectionCreateBetweenPointsWithOptions();
    if (BetweenPointsWithOptions)
    {
      v11 = BetweenPointsWithOptions;
      CGPDFSelectionGetBounds();
      if (v12 != 0.0)
      {
        -[PDFSelection addCGSelection:forPage:](v9, "addCGSelection:forPage:", v11, self);
        CGPDFSelectionRelease();
        goto LABEL_8;
      }
      CGPDFSelectionRelease();

LABEL_7:
      v9 = 0;
    }
  }
LABEL_8:

  return v9;
}

- (id)selectionForAll
{
  PDFSelection *v3;
  void *v4;
  PDFSelection *v5;
  uint64_t v6;
  PDFSelection *v7;

  v3 = [PDFSelection alloc];
  -[PDFPage document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PDFSelection initWithDocument:](v3, "initWithDocument:", v4);

  if (v5)
  {
    if (-[PDFPage numberOfCharacters](self, "numberOfCharacters"))
    {
      v6 = CGPDFSelectionCreateForStringRange();
      if (v6)
      {
        -[PDFSelection addCGSelection:forPage:](v5, "addCGSelection:forPage:", v6, self);
        CGPDFSelectionRelease();
      }
    }
    v7 = v5;
  }

  return v5;
}

- (id)selectionFromTopToPoint:(CGPoint)a3 type:(int)a4
{
  uint64_t v4;
  double v6;
  double v7;
  double v8;
  void *v9;
  PDFSelection *v10;
  uint64_t v11;

  v4 = *(_QWORD *)&a4;
  v6 = PDFPointToCGPoint(a3.x, a3.y);
  v8 = v7;
  -[PDFPage document](self, "document");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "isSimpleSelectionEnabled");
  if (-[PDFPage pageLayout](self, "pageLayout"))
  {
    v10 = -[PDFSelection initWithDocument:]([PDFSelection alloc], "initWithDocument:", v9);
    if (v10)
    {
      v11 = MEMORY[0x20BD1A548](self->_page, v4, v6, v8, 20.0);
      if (v11)
      {
        -[PDFSelection addCGSelection:forPage:](v10, "addCGSelection:forPage:", v11, self);
        CGPDFSelectionRelease();
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)selectionFromPointToBottom:(CGPoint)a3 type:(int)a4
{
  uint64_t v4;
  double v6;
  double v7;
  double v8;
  void *v9;
  PDFSelection *v10;
  uint64_t v11;

  v4 = *(_QWORD *)&a4;
  v6 = PDFPointToCGPoint(a3.x, a3.y);
  v8 = v7;
  -[PDFPage document](self, "document");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "isSimpleSelectionEnabled");
  if (-[PDFPage pageLayout](self, "pageLayout"))
  {
    v10 = -[PDFSelection initWithDocument:]([PDFSelection alloc], "initWithDocument:", v9);
    if (v10)
    {
      v11 = MEMORY[0x20BD1A50C](self->_page, v4, v6, v8, 20.0);
      if (v11)
      {
        -[PDFSelection addCGSelection:forPage:](v10, "addCGSelection:forPage:", v11, self);
        CGPDFSelectionRelease();
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_addBox:(int)a3 toDictionary:(__CFDictionary *)a4 offset:(CGPoint)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  const void *v9;
  double y;
  double x;
  double v13;
  double v14;
  double v15;
  double v16;
  CFDataRef v17;
  double v18[12];

  if (a4 && a3 <= 4)
  {
    v18[4] = v8;
    v18[5] = v7;
    v18[10] = v5;
    v18[11] = v6;
    v9 = (const void *)**((_QWORD **)&unk_24C25E110 + a3);
    if (v9)
    {
      y = a5.y;
      x = a5.x;
      v13 = PDFRectToCGRect(-[PDFPage boundsForBox:](self, "boundsForBox:", a3));
      v18[2] = v14;
      v18[3] = v15;
      v18[0] = v13 - x;
      v18[1] = v16 - y;
      v17 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v18, 32);
      CFDictionaryAddValue(a4, v9, v17);
      CFRelease(v17);
    }
  }
}

- (BOOL)hasCropBox
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  NSRect v16;
  NSRect v17;

  -[PDFPage boundsForBox:](self, "boundsForBox:", 1);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PDFPage boundsForBox:](self, "boundsForBox:", 0);
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  if (NSEqualRects(v16, v17))
    return 0;
  if (v10 > 0.0)
    return v8 > 0.0;
  return 0;
}

- (BOOL)hasBleedBox
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  NSRect v16;
  NSRect v17;

  -[PDFPage boundsForBox:](self, "boundsForBox:", 2);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PDFPage boundsForBox:](self, "boundsForBox:", 1);
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  if (NSEqualRects(v16, v17))
    return 0;
  if (v10 > 0.0)
    return v8 > 0.0;
  return 0;
}

- (BOOL)hasTrimBox
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  NSRect v16;
  NSRect v17;

  -[PDFPage boundsForBox:](self, "boundsForBox:", 3);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PDFPage boundsForBox:](self, "boundsForBox:", 1);
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  if (NSEqualRects(v16, v17))
    return 0;
  if (v10 > 0.0)
    return v8 > 0.0;
  return 0;
}

- (BOOL)hasArtBox
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  NSRect v16;
  NSRect v17;

  -[PDFPage boundsForBox:](self, "boundsForBox:", 4);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PDFPage boundsForBox:](self, "boundsForBox:", 1);
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  if (NSEqualRects(v16, v17))
    return 0;
  if (v10 > 0.0)
    return v8 > 0.0;
  return 0;
}

- (CGDisplayList)copyDisplayList
{
  os_unfair_lock_s *p_displayListMutex;
  CGDisplayList *displayList;

  p_displayListMutex = &self->_displayListMutex;
  os_unfair_lock_lock(&self->_displayListMutex);
  displayList = self->_displayList;
  CGDisplayListRetain();
  os_unfair_lock_unlock(p_displayListMutex);
  return displayList;
}

- (CGDisplayList)_createDisplayListTrackingGlyphs:(BOOL)a3
{
  void *v4;
  PDFRenderingProperties *v5;
  CGDisplayList *v6;
  uint64_t v7;
  CGContext *v8;

  if (!self->_page)
    return 0;
  -[PDFPage document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderingProperties");
  v5 = (PDFRenderingProperties *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    v5 = objc_alloc_init(PDFRenderingProperties);
  -[PDFPage boundsForBox:](self, "boundsForBox:", -[PDFRenderingProperties displayBox](v5, "displayBox"));
  -[PDFPage rotation](self, "rotation");
  v6 = (CGDisplayList *)CGDisplayListCreateWithRect();
  if (v6)
  {
    v7 = CGDisplayListContextCreate();
    if (v7)
    {
      v8 = (CGContext *)v7;
      -[PDFPage drawWithBox:inContext:](self, "drawWithBox:inContext:", -[PDFRenderingProperties displayBox](v5, "displayBox"), v7);
      CGContextRelease(v8);
    }
  }

  return v6;
}

- (void)_createRetainedDisplayList
{
  CGDisplayList *v3;
  CGDisplayList *v4;
  id v5;

  if (self->_page)
  {
    v3 = -[PDFPage _createDisplayListTrackingGlyphs:](self, "_createDisplayListTrackingGlyphs:", 0);
    if (v3)
    {
      v4 = v3;
      os_unfair_lock_lock(&self->_displayListMutex);
      self->_displayList = v4;
      self->_creatingDisplayList = 0;
      v5 = (id)-[NSMutableArray copy](self->_createDisplayListCompletionBlocks, "copy");
      -[NSMutableArray removeAllObjects](self->_createDisplayListCompletionBlocks, "removeAllObjects");
      os_unfair_lock_unlock(&self->_displayListMutex);
      objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 0, &__block_literal_global_213);

    }
  }
}

void __37__PDFPage__createRetainedDisplayList__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v5, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "block");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async((dispatch_queue_t)v3, v4);

  }
  else
  {
    objc_msgSend(v5, "block");
    v3 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(v3 + 16))();
  }

}

- (void)_releaseDisplayList
{
  os_unfair_lock_s *p_displayListMutex;
  CGDisplayList *displayList;

  p_displayListMutex = &self->_displayListMutex;
  os_unfair_lock_lock(&self->_displayListMutex);
  displayList = self->_displayList;
  if (displayList)
  {
    CFRelease(displayList);
    self->_displayList = 0;
  }
  os_unfair_lock_unlock(p_displayListMutex);
}

- (void)ensureDisplayList
{
  if (!self->_displayList)
    -[PDFPage _createRetainedDisplayList](self, "_createRetainedDisplayList");
}

- (void)getDisplayListWithCompletion:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  os_unfair_lock_s *p_displayListMutex;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v9 = MEMORY[0x24BDAC9B8];
    v10 = MEMORY[0x24BDAC9B8];
  }
  p_displayListMutex = &self->_displayListMutex;
  os_unfair_lock_lock(&self->_displayListMutex);
  if (!self->_displayList)
  {
    if (v6)
    {
      +[PDFBlockQueuePair blockQueuePairWithBlock:andQueue:](PDFBlockQueuePair, "blockQueuePairWithBlock:andQueue:", v6, v8);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (self->_creatingDisplayList)
      {
        if (v12)
          -[NSMutableArray addObject:](self->_createDisplayListCompletionBlocks, "addObject:", v12);
        goto LABEL_13;
      }
      self->_creatingDisplayList = 1;
      objc_initWeak(&location, self);
      if (v13)
        -[NSMutableArray addObject:](self->_createDisplayListCompletionBlocks, "addObject:", v13);
    }
    else
    {
      if (self->_creatingDisplayList)
      {
        v13 = 0;
LABEL_13:
        os_unfair_lock_unlock(&self->_displayListMutex);
LABEL_18:

        goto LABEL_19;
      }
      self->_creatingDisplayList = 1;
      objc_initWeak(&location, self);
      v13 = 0;
    }
    objc_msgSend((id)objc_opt_class(), "displayListCreationQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __48__PDFPage_getDisplayListWithCompletion_onQueue___block_invoke;
    v15[3] = &unk_24C25D090;
    objc_copyWeak(&v16, &location);
    dispatch_async(v14, v15);

    os_unfair_lock_unlock(p_displayListMutex);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    goto LABEL_18;
  }
  os_unfair_lock_unlock(&self->_displayListMutex);
  if (v6)
    dispatch_async(v9, v6);
LABEL_19:

}

void __48__PDFPage_getDisplayListWithCompletion_onQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createRetainedDisplayList");

}

- (CGDisplayList)createDisplayListForFormDetection
{
  return -[PDFPage _createDisplayListTrackingGlyphs:](self, "_createDisplayListTrackingGlyphs:", 1);
}

- (BOOL)_writeToConsumer:(CGDataConsumer *)a3
{
  _BOOL8 v5;
  CGContext *v6;
  _BOOL8 v7;
  __CFDictionary *v8;
  CFNumberRef v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  double valuePtr;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = +[PDFPage isNativeRotationDrawingEnabledForThisThread](PDFPage, "isNativeRotationDrawingEnabledForThisThread");
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", 1);
  v6 = CGPDFContextCreate(a3, 0, 0);
  if (v6)
  {
    v7 = -[PDFPage displaysAnnotations](self, "displaysAnnotations");
    v8 = -[PDFPage gcCreateBoxDictionary](self, "gcCreateBoxDictionary");
    valuePtr = (double)-[PDFPage rotation](self, "rotation");
    v9 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
    CFDictionaryAddValue(v8, CFSTR("Rotate"), v9);
    CGPDFContextBeginPage(v6, v8);
    -[PDFPage setDisplaysAnnotations:](self, "setDisplaysAnnotations:", 0);
    -[PDFPage drawWithBox:toContext:](self, "drawWithBox:toContext:", 0, v6);
    -[PDFPage setDisplaysAnnotations:](self, "setDisplaysAnnotations:", v7);
    -[NSLock lock](self->_lock_accessAnnotations, "lock");
    -[PDFPage annotations](self, "annotations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "dictionaryRef"))
            CGPDFContextAddAnnotation();
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v12);
    }
    -[NSLock unlock](self->_lock_accessAnnotations, "unlock");
    CGPDFContextEndPage(v6);
    CGPDFContextClose(v6);

    CGContextRelease(v6);
    if (v8)
      CFRelease(v8);
  }
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", v5);
  return v6 != 0;
}

- (__CFDictionary)gcCreateBoxDictionary
{
  const __CFAllocator *v3;
  __CFDictionary *Mutable;
  double v5;
  double v6;
  double v7;
  double v8;
  PDFAKPageAdaptor *v9;
  PDFAKPageAdaptor *v10;
  void *v11;
  void *v12;
  void *v13;
  CGPDFPage *v14;
  CGFloat x;
  CGFloat y;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CFDataRef v29;
  CGFloat height;
  CGFloat width;
  UInt8 bytes[8];
  double v34;
  double v35;
  double v36;
  CGRect BoxRect;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  -[PDFPage boundsForBox:](self, "boundsForBox:", 0);
  v6 = v5;
  v8 = v7;
  -[PDFPage _addBox:toDictionary:offset:](self, "_addBox:toDictionary:offset:", 0, Mutable);
  v9 = self->_akPageAdaptor;
  if (v9)
  {
    v10 = v9;
    -[PDFAKPageAdaptor akPageModelController](v9, "akPageModelController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cropAnnotation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "cropApplied"))
      {
        v14 = -[PDFPage pageRef](self, "pageRef");
        BoxRect = CGPDFPageGetBoxRect(v14, kCGPDFCropBox);
        v38 = CGRectIntegral(BoxRect);
        x = v38.origin.x;
        y = v38.origin.y;
        height = v38.size.height;
        width = v38.size.width;
        objc_msgSend(v13, "rectangle");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v42 = CGPDFPageGetBoxRect(v14, kCGPDFMediaBox);
        v39.origin.x = v18;
        v39.origin.y = v20;
        v39.size.width = v22;
        v39.size.height = v24;
        v40 = CGRectIntersection(v39, v42);
        v41 = CGRectIntegral(v40);
        v25 = v41.origin.x;
        v26 = v41.origin.y;
        v27 = v41.size.width;
        v28 = v41.size.height;
        v41.origin.x = x;
        v41.origin.y = y;
        v41.size.height = height;
        v41.size.width = width;
        v43.origin.x = v25;
        v43.origin.y = v26;
        v43.size.width = v27;
        v43.size.height = v28;
        if (!CGRectEqualToRect(v41, v43) && v27 > 0.0 && v28 > 0.0)
        {
          v35 = v27;
          v36 = v28;
          *(double *)bytes = v25 - v6;
          v34 = v26 - v8;
          v29 = CFDataCreate(v3, bytes, 32);
          CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDBF3F8], v29);
          CFRelease(v29);

          goto LABEL_11;
        }
      }
    }

  }
  if (-[PDFPage hasCropBox](self, "hasCropBox"))
    -[PDFPage _addBox:toDictionary:offset:](self, "_addBox:toDictionary:offset:", 1, Mutable, v6, v8);
LABEL_11:
  if (-[PDFPage hasBleedBox](self, "hasBleedBox"))
    -[PDFPage _addBox:toDictionary:offset:](self, "_addBox:toDictionary:offset:", 2, Mutable, v6, v8);
  if (-[PDFPage hasTrimBox](self, "hasTrimBox"))
    -[PDFPage _addBox:toDictionary:offset:](self, "_addBox:toDictionary:offset:", 3, Mutable, v6, v8);
  if (-[PDFPage hasArtBox](self, "hasArtBox"))
    -[PDFPage _addBox:toDictionary:offset:](self, "_addBox:toDictionary:offset:", 4, Mutable, v6, v8);
  return Mutable;
}

- (void)_buildPageLayout
{
  CGPDFLayout *v3;
  void *v4;
  CGPDFLayout *Layout;
  NSString *String;
  NSString *text;
  id v8;

  if (self->_page && !self->_layout && !self->_ranDataDetectors)
  {
    -[PDFPage document](self, "document");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isSimpleSelectionEnabled"))
    {
      v3 = (CGPDFLayout *)CGPDFPageCopyPageLayout();
      self->_layout = v3;
      if (v3)
        atomic_store(1u, (unsigned __int8 *)&self->_builtLayout);
      -[PDFPage _scanData:](self, "_scanData:", v8);
    }
    else
    {
      v4 = (void *)MEMORY[0x20BD1ACC8]();
      -[PDFPage pageRef](self, "pageRef");
      Layout = (CGPDFLayout *)CGPDFPageGetLayout();
      self->_layout = Layout;
      if (Layout)
      {
        atomic_store(1u, (unsigned __int8 *)&self->_builtLayout);
        CGPDFLayoutRetain();
        String = (NSString *)CGPDFLayoutCreateString();
        text = self->_text;
        self->_text = String;

      }
      -[PDFPage _scanData:](self, "_scanData:", v8);
      objc_autoreleasePoolPop(v4);
    }

  }
}

- (void)purgePageLayout
{
  BOOL *p_builtLayout;
  unsigned __int8 v4;

  if (self->_page)
  {
    p_builtLayout = &self->_builtLayout;
    v4 = atomic_load((unsigned __int8 *)&self->_builtLayout);
    if ((v4 & 1) != 0)
    {
      os_unfair_lock_lock(&self->_layoutLock);
      os_unfair_lock_lock(&self->_dataDetectorsLock);
      CGPDFLayoutRelease();
      self->_layout = 0;
      -[PDFPage pageRef](self, "pageRef");
      CGPDFPageRemoveLayout();
      self->_ranDataDetectors = 0;
      os_unfair_lock_unlock(&self->_dataDetectorsLock);
      os_unfair_lock_unlock(&self->_layoutLock);
      atomic_store(0, (unsigned __int8 *)p_builtLayout);
    }
  }
}

- (void)fetchPageLayoutWithCompletion:(id)a3 deliveredOnQueue:(id)a4
{
  void (**v6)(id, CGPDFLayout *);
  id v7;
  unsigned __int8 v8;
  os_unfair_lock_s *p_layoutLock;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  void (**v14)(id, CGPDFLayout *);
  id v15;
  id location;

  v6 = (void (**)(id, CGPDFLayout *))a3;
  v7 = a4;
  if (self->_page)
  {
    v8 = atomic_load((unsigned __int8 *)&self->_builtLayout);
    if ((v8 & 1) != 0)
    {
      v6[2](v6, self->_layout);
    }
    else
    {
      p_layoutLock = &self->_layoutLock;
      os_unfair_lock_lock(&self->_layoutLock);
      if (!self->_layout)
      {
        objc_initWeak(&location, self);
        -[PDFPage document](self, "document");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textExtractionQueue");
        v11 = objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __58__PDFPage_fetchPageLayoutWithCompletion_deliveredOnQueue___block_invoke;
        v12[3] = &unk_24C25E020;
        objc_copyWeak(&v15, &location);
        v13 = v7;
        v14 = v6;
        dispatch_async(v11, v12);

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
      os_unfair_lock_unlock(p_layoutLock);
    }
  }

}

void __58__PDFPage_fetchPageLayoutWithCompletion_deliveredOnQueue___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[4];
  os_unfair_lock_s *v7;
  id v8;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 16);
    v4 = *(_QWORD *)&v3[18]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v3 + 16);
    if (!v4)
      -[os_unfair_lock_s _buildPageLayout](v3, "_buildPageLayout");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __58__PDFPage_fetchPageLayoutWithCompletion_deliveredOnQueue___block_invoke_2;
    v6[3] = &unk_24C25CC38;
    v5 = *(NSObject **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __58__PDFPage_fetchPageLayoutWithCompletion_deliveredOnQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
}

- (CGPDFLayout)pageLayout
{
  CGPDFLayout *result;

  result = self->_layout;
  if (!result)
  {
    -[PDFPage _buildPageLayout](self, "_buildPageLayout");
    return self->_layout;
  }
  return result;
}

- (CGPDFLayout)pageLayoutIfAvail
{
  CGPDFLayout *result;

  result = self->_layout;
  if (!result)
  {
    -[PDFPage fetchPageLayoutWithCompletion:deliveredOnQueue:](self, "fetchPageLayoutWithCompletion:deliveredOnQueue:", &__block_literal_global_218, MEMORY[0x24BDAC9B8]);
    return self->_layout;
  }
  return result;
}

- (BOOL)isBookmarked
{
  return self->_bookmarked;
}

- (void)setBookmarked:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  id v11;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v11 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "allowsDocumentAssembly") & 1) == 0)
  {
    v9 = objc_msgSend(v11, "permissionsStatus");
    v10 = CFSTR("user");
    if (v9 == 2)
      v10 = CFSTR("owner");
    NSLog(CFSTR("Cannot set bookmark. PDF document's %@ permissions does not allow document assembly."), v10);
  }
  else
  {
    -[PDFPage setBookmarked:updateBookmarks:](self, "setBookmarked:updateBookmarks:", v3, 1);
    v6 = objc_loadWeakRetained((id *)&self->_view);
    if (objc_msgSend(v6, "displaysBookmarksForPages"))
    {
      objc_msgSend(v6, "pageViewForPageAtIndex:", objc_msgSend(v11, "indexForPage:", self));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        if (self->_bookmarked)
          objc_msgSend(v7, "addBookmark");
        else
          objc_msgSend(v7, "removeBookmark");
      }

    }
    if (v11)
      objc_msgSend(v11, "setBookmarked:atPageIndex:", v3, objc_msgSend(v11, "indexForPage:", self));

  }
}

- (void)setBookmarked:(BOOL)a3 updateBookmarks:(BOOL)a4
{
  id WeakRetained;

  self->_bookmarked = a3;
  if (a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_document);
    objc_msgSend(WeakRetained, "updateBookmarksInPDFDocument");

  }
}

- (char)isCandidateForOCR
{
  return self->_candidateForOCR;
}

- (void)setCandidateForOCR:(char)a3
{
  self->_candidateForOCR = a3;
}

- (BOOL)didPerformOCR
{
  return self->_didPerformOCR;
}

- (void)setDidPerformOCR:(BOOL)a3
{
  self->_didPerformOCR = a3;
}

- (char)isCandidateForFormDetection
{
  return self->candidateForFormDetection;
}

- (BOOL)didPerformFormDetection
{
  return self->_didPerformFormDetection;
}

- (void)setDidPerformFormDetection:(BOOL)a3
{
  self->_didPerformFormDetection = a3;
}

- (BOOL)requestedOCR
{
  return self->_requestedOCR;
}

- (BOOL)isTextFromOCR
{
  return self->_textFromOCR;
}

- (BOOL)containsFormFields
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_annotations;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isActivatableTextField", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)containsDetectedFormFields
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = self->_detectedAnnotations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v6)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v7), "valueForAnnotationKey:", CFSTR("/AAPL:SFF"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_18;
      if (v5 == ++v7)
      {
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_annotations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_11:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "valueForAnnotationKey:", CFSTR("/AAPL:SFF"), (_QWORD)v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v10)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_18:
    v14 = 1;
    goto LABEL_19;
  }
LABEL_17:
  v14 = 0;
LABEL_19:

  return v14;
}

- (BOOL)containsFormFieldsWithContentType
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_detectedAnnotations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v6)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7), "autoFillTextContentType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_18;
      if (v5 == ++v7)
      {
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_annotations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
LABEL_11:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "autoFillTextContentType", (_QWORD)v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v9)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v9) = 1;
  }
LABEL_19:

  return v9;
}

- (unint64_t)detectedFormFieldsRecognitionConfidence
{
  return self->_detectedFormFieldsRecognitionConfidence;
}

- (void)setDetectedFormFieldsRecognitionConfidence:(unint64_t)a3
{
  self->_detectedFormFieldsRecognitionConfidence = a3;
}

- (BOOL)colorWidgetBackgrounds
{
  return self->_colorWidgetBackgrounds;
}

- (void)setColorWidgetBackgrounds:(BOOL)a3
{
  self->_colorWidgetBackgrounds = a3;
}

- (void)addRedactionFromRectangularSelectionWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PDFAKPageAdaptor *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  PDFAKPageAdaptor *v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = self->_akPageAdaptor;
  if (v8)
  {
    v16 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_document);
    objc_msgSend(WeakRetained, "akController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(WeakRetained, "indexForPage:", self);
    v12 = objc_alloc_init((Class)AKRedactionRectAnnotationClass());
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "setRectangle:", x, y, width, height);
      objc_msgSend(v13, "setOriginalExifOrientation:", objc_msgSend(v10, "currentExifOrientationForPageAtIndex:", v11));
      objc_msgSend(v10, "currentModelBaseScaleFactorForPageAtIndex:", v11);
      objc_msgSend(v13, "setOriginalModelBaseScaleFactor:");
      -[PDFAKPageAdaptor akPageModelController](v16, "akPageModelController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mutableArrayValueForKey:", CFSTR("annotations"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v13);

    }
    v8 = v16;
  }

}

+ (void)setNativeRotationDrawingEnabledForThisThread:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("PDFKitNativeRotationDrawingEnabledKey"));

}

+ (BOOL)isNativeRotationDrawingEnabledForThisThread
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PDFKitNativeRotationDrawingEnabledKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (void)setShouldHideAnnotationsForThisThread:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("PDFKitShouldDrawAnnotationsKey"));

}

+ (BOOL)shouldHideAnnotationsForThisThread
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PDFKitShouldDrawAnnotationsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (void)setExcludingAKAnnotationRenderingForThisThread:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("PDFKitRenderingForTilesKey"));

}

+ (BOOL)isExcludingAKAnnotationRenderingForThisThread
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PDFKitRenderingForTilesKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)columnAtPointIfAvailable:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  BOOL v7;
  BOOL v8;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  -[PDFPage document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isSimpleSelectionEnabled"))
  {
    -[PDFPage columnFrameAtPoint:](self, "columnFrameAtPoint:", x, y);
    v7 = CGRectEqualToRect(v10, *MEMORY[0x24BDBF090]);
  }
  else
  {
    if (!-[PDFPage pageLayoutIfAvail](self, "pageLayoutIfAvail"))
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = -[PDFPage columnAtPoint:](self, "columnAtPoint:", x, y);
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (BOOL)columnAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  BOOL v7;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[PDFPage document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isSimpleSelectionEnabled"))
  {
    -[PDFPage columnFrameAtPoint:](self, "columnFrameAtPoint:", x, y);
    v7 = CGRectEqualToRect(v9, *MEMORY[0x24BDBF090]);
  }
  else
  {
    v7 = -[PDFPage pageLayout](self, "pageLayout") && CGPDFLayoutGetRootNode() && CGPDFNodeGetNodeContainingPoint() != 0;
  }

  return v7;
}

- (void)setView:(id)a3
{
  id WeakRetained;
  char v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v5 = objc_msgSend(WeakRetained, "isEqual:", obj);

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_view, obj);
    -[PDFPage enableUndoManagerForAK:](self, "enableUndoManagerForAK:", -[PDFPage disableUndoManagerForAK](self, "disableUndoManagerForAK"));
  }

}

- (id)view
{
  return objc_loadWeakRetained((id *)&self->_view);
}

- (CGAffineTransform)getDrawingTransformForBox:(SEL)a3
{
  BOOL v7;
  uint64_t v8;
  __int128 v9;
  CGAffineTransform *result;
  double v11;
  double x;
  double v13;
  double y;
  double v15;
  double width;
  double v17;
  double height;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  __int128 v24;
  __int128 v25;
  double v26;
  CGFloat v27;
  NSRect v28;
  NSRect v29;
  NSRect v30;

  v7 = +[PDFPage isNativeRotationDrawingEnabledForThisThread](PDFPage, "isNativeRotationDrawingEnabledForThisThread");
  v8 = MEMORY[0x24BDBD8B8];
  v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  result = (CGAffineTransform *)-[PDFPage boundsForBox:](self, "boundsForBox:", a4);
  x = v11;
  y = v13;
  width = v15;
  height = v17;
  if (a4)
  {
    -[PDFPage boundsForBox:](self, "boundsForBox:", 0);
    v30.origin.x = v19;
    v30.origin.y = v20;
    v30.size.width = v21;
    v30.size.height = v22;
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v29 = NSIntersectionRect(v28, v30);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
  }
  if (!v7)
  {
    result = -[PDFPage rotation](self, "rotation");
    if (result == (CGAffineTransform *)270)
    {
      v23 = height + y;
      v24 = xmmword_209DC08D0;
      v25 = xmmword_209DC0750;
      v26 = -x;
      goto LABEL_11;
    }
    if (result == (CGAffineTransform *)180)
    {
      v23 = width + x;
      v26 = height + y;
      v27 = -1.0;
      goto LABEL_9;
    }
    if (result == (CGAffineTransform *)90)
    {
      v23 = -y;
      v24 = xmmword_209DC08E0;
      v25 = xmmword_209DC08F0;
      v26 = width + x;
LABEL_11:
      *(_OWORD *)&retstr->a = v24;
      *(_OWORD *)&retstr->c = v25;
      goto LABEL_12;
    }
  }
  v23 = -x;
  v26 = -y;
  v27 = 1.0;
LABEL_9:
  retstr->a = v27;
  retstr->b = 0.0;
  retstr->c = 0.0;
  retstr->d = v27;
LABEL_12:
  retstr->tx = v23;
  retstr->ty = v26;
  return result;
}

- (void)drawAnnotationsWithBox:(int64_t)a3 inContext:(CGContext *)a4 passingTest:(id)a5
{
  unsigned int (**v8)(id, _QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = (unsigned int (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_annotations);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        if ((!v8 || v8[2](v8, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13)))
          && (objc_msgSend(v14, "intersectsWithRedactionPath") & 1) == 0)
        {
          v15 = objc_msgSend(v14, "isTransparent");
          objc_msgSend(v14, "setIsTransparent:", 0);
          objc_msgSend(v14, "drawWithBox:inContext:", a3, a4);
          objc_msgSend(v14, "setIsTransparent:", v15);
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (id)detectedAnnotations
{
  return self->_detectedAnnotations;
}

- (BOOL)disableUndoManagerForAK
{
  void *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  if (GetDefaultsWriteAKEnabled())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    if (!WeakRetained)
    {
      -[PDFPage document](self, "document");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "renderingProperties");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pdfView");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(WeakRetained, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isUndoRegistrationEnabled");
    if (v7)
      objc_msgSend(v6, "disableUndoRegistration");
    if (WeakRetained)
      -[PDFPage setupAKPageAdaptorIfNecessary](self, "setupAKPageAdaptorIfNecessary");

  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)enableUndoManagerForAK:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = a3;
  if (GetDefaultsWriteAKEnabled())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    if (WeakRetained)
    {
      if (!v3)
      {
LABEL_5:

        return;
      }
    }
    else
    {
      -[PDFPage document](self, "document");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "renderingProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pdfView");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      WeakRetained = v10;
      if (!v3)
        goto LABEL_5;
    }
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enableUndoRegistration");

    WeakRetained = v9;
    goto LABEL_5;
  }
}

- (Class)annotationSubclassForSubtype:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[PDFPage document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (v7 = (void *)objc_msgSend(v5, "annotationSubclassForType:", v4)) != 0)
  {
    v8 = v7;
  }
  else
  {
    objc_opt_class();
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return (Class)v9;
}

- (void)getAnnotations
{
  void *v3;
  double MachSeconds;
  void *v5;
  void *v6;
  int v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  id v16;
  id v17;
  NSMutableArray *v18;
  NSMutableArray *annotations;
  void *v20;
  void (**v21)(_QWORD);
  float v22;
  void *v23;
  double v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t, uint64_t);
  void *v36;
  PDFPage *v37;
  id v38;
  id v39;
  char v40;
  char v41;

  if (self->_page)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
    if (v3)
    {
      MachSeconds = GetMachSeconds();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFPage document](self, "document");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasHighLatencyDataProvider");
      v8 = v7;
      if (v7 && objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        _PDFLog(OS_LOG_TYPE_FAULT, (uint64_t)"PDFAnnotation", (uint64_t)"getAnnotations() is being called on main thread", v9, v10, v11, v12, v13, v29);
      }
      else
      {
        v14 = objc_msgSend(v6, "callShouldReadAKInkAnnotations");
        v15 = MEMORY[0x24BDAC760];
        v33 = MEMORY[0x24BDAC760];
        v34 = 3221225472;
        v35 = __25__PDFPage_getAnnotations__block_invoke;
        v36 = &unk_24C25E088;
        v37 = self;
        v40 = v14;
        v16 = v3;
        v38 = v16;
        v17 = v5;
        v39 = v17;
        v41 = v8;
        CGPDFPageEnumerateAnnotations();
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v16);
        v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        annotations = self->_annotations;
        self->_annotations = v18;

        objc_msgSend(v6, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v20, "pdfDocument:loadedAnnotations:forPage:", v6, self->_annotations, self);
        v30[0] = v15;
        v30[1] = 3221225472;
        v30[2] = __25__PDFPage_getAnnotations__block_invoke_3;
        v30[3] = &unk_24C25D110;
        v30[4] = self;
        v31 = v16;
        v32 = v17;
        v21 = (void (**)(_QWORD))MEMORY[0x20BD1AEB4](v30);
        if (self->_akPageAdaptor && !objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
          dispatch_async(MEMORY[0x24BDAC9B8], v21);
        else
          v21[2](v21);
        if (GetDefaultsWriteLogPerfTimes())
        {
          v22 = MachSeconds;
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "timeIntervalSince1970");
          v25 = (unint64_t)(v24 * 1000.0);

          -[PDFPage document](self, "document");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "indexForPage:", self);
          v28 = GetMachSeconds();
          NSLog(CFSTR("PDFKit2_LogPerfTime: PDFPage has loaded all annotations for page %d. Milliseconds since epoch: %llu. Time taken: %0.3f."), v27, v25, v28 - v22);

        }
      }

    }
  }
}

void __25__PDFPage_getAnnotations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CGPDFDictionary *CGPDFDictionary;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void (**v16)(_QWORD);
  _QWORD v17[5];
  id v18;
  char *value;

  CGPDFDictionary = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
  value = 0;
  if (!CGPDFDictionaryGetName(CGPDFDictionary, "Subtype", (const char **)&value)
    || (v6 = *(void **)(a1 + 32),
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", value),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = (objc_class *)objc_msgSend(v6, "annotationSubclassForSubtype:", v7),
        v7,
        !v8))
  {
    v8 = (objc_class *)objc_opt_class();
  }
  if (*(_BYTE *)(a1 + 56))
  {
    +[PDFAKAnnotationSerializationHelper akAnnotationFromCGPDFAnnotation:andDictionary:](PDFAKAnnotationSerializationHelper, "akAnnotationFromCGPDFAnnotation:andDictionary:", a3, CGPDFDictionary);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AKInkAnnotationClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = (objc_class *)(id)objc_opt_self();

  }
  if (v8)
  {
    v10 = (void *)objc_msgSend([v8 alloc], "initWithCGPDFAnnotation:forPage:", a3, *(_QWORD *)(a1 + 32));
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "setIsFullyConstructed:", 0);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
      objc_msgSend(v11, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("/Popup")))
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
      objc_msgSend(v11, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("/Widget"));

      if (v14)
        objc_msgSend(*(id *)(a1 + 32), "_addWidgetAnnotationToLookupDictionary:", v11);
      objc_msgSend(v11, "setCGPDFAnnotation:", a3);
      if (*(_BYTE *)(a1 + 57))
        objc_msgSend(v11, "cacheAppearances");
      v15 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v15 + 360))
      {
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __25__PDFPage_getAnnotations__block_invoke_2;
        v17[3] = &unk_24C25CBE8;
        v17[4] = v15;
        v18 = v11;
        v16 = (void (**)(_QWORD))MEMORY[0x20BD1AEB4](v17);
        if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
          v16[2](v16);
        else
          dispatch_async(MEMORY[0x24BDAC9B8], v16);

      }
      objc_msgSend(v11, "setIsFullyConstructed:", 1);

    }
  }
}

uint64_t __25__PDFPage_getAnnotations__block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "disableUndoManagerForAK");
  objc_msgSend(*(id *)(a1 + 40), "setupAKAnnotationAdaptorIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "pdfPage:didAddAnnotation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "enableUndoManagerForAK:", v2);
}

uint64_t __25__PDFPage_getAnnotations__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t ObjectReference;
  unsigned __int16 v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  unsigned int v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v17 = objc_msgSend(*(id *)(a1 + 32), "disableUndoManagerForAK");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = a1;
  obj = *(id *)(a1 + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v25 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v6, "popupDictionary"))
        {
          ObjectReference = CGPDFDictionaryGetObjectReference();
          if (ObjectReference | v8)
          {
            v9 = ObjectReference;
            v22 = 0u;
            v23 = 0u;
            v20 = 0u;
            v21 = 0u;
            v10 = *(id *)(v18 + 48);
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v21;
              while (2)
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v21 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
                  if (v6 != v15)
                  {
                    objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "sourceDictionary");
                    if (v9 == CGPDFDictionaryGetObjectReference())
                    {
                      objc_msgSend(v6, "setIsFullyConstructed:", 0);
                      objc_msgSend(v15, "setIsFullyConstructed:", 0);
                      objc_msgSend(v6, "setPopupInternal:scanPage:", v15, 0);
                      objc_msgSend(v15, "setIsFullyConstructed:", 1);
                      objc_msgSend(v6, "setIsFullyConstructed:", 1);
                      goto LABEL_19;
                    }
                  }
                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
                if (v12)
                  continue;
                break;
              }
            }
LABEL_19:

          }
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(v18 + 32), "enableUndoManagerForAK:", v17);
}

- (id)annotationWithUUID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_annotations;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "pdfAnnotationUUID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)annotationsForFieldName:(id)a3
{
  os_unfair_lock_s *p_widgetAnnotationLookupLock;
  id v5;
  void *v6;

  if (a3)
  {
    p_widgetAnnotationLookupLock = &self->_widgetAnnotationLookupLock;
    v5 = a3;
    os_unfair_lock_lock(p_widgetAnnotationLookupLock);
    -[NSMutableDictionary objectForKey:](self->_widgetAnnotationLookup, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_widgetAnnotationLookupLock);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_addWidgetAnnotationToLookupDictionary:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "fieldName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    os_unfair_lock_lock(&self->_widgetAnnotationLookupLock);
    -[NSMutableDictionary objectForKey:](self->_widgetAnnotationLookup, "objectForKey:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
      v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v5, "addObject:", v6);
    -[NSMutableDictionary setObject:forKey:](self->_widgetAnnotationLookup, "setObject:forKey:", v5, v4);
    os_unfair_lock_unlock(&self->_widgetAnnotationLookupLock);

  }
}

- (void)_removeWidgetAnnotationFromLookupDictionary:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_widgetAnnotationLookupLock;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "fieldName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    p_widgetAnnotationLookupLock = &self->_widgetAnnotationLookupLock;
    os_unfair_lock_lock(&self->_widgetAnnotationLookupLock);
    -[NSMutableDictionary objectForKey:](self->_widgetAnnotationLookup, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "removeObject:", v8);
    os_unfair_lock_unlock(p_widgetAnnotationLookupLock);

  }
}

- (void)addAnnotationFormField:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  PDFFormField *v16;
  PDFPage *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PDFPage document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "formData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v17 = self;
      v18 = v4;
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v4);
      }
      else
      {
        -[NSLock lock](self->_lock_accessAnnotations, "lock");
        -[PDFPage annotations](self, "annotations");
      }
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v13, "fieldName", v17);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              objc_msgSend(v7, "fieldNamed:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15)
              {
                v16 = -[PDFFormField initWithAnnotation:]([PDFFormField alloc], "initWithAnnotation:", v13);
                objc_msgSend(v7, "addFormField:", v16);

              }
            }

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v10);
      }

      v4 = v18;
      if (!v18)
        -[NSLock unlock](v17->_lock_accessAnnotations, "unlock");
    }
    else
    {
      NSLog(CFSTR("TEMP - [addAnnotationFormField:] no form data."));
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }

}

- (void)setDisplaysMarkupAnnotations:(BOOL)a3
{
  self->_displaysMarkups = a3;
}

- (void)addDetectedAnnotations:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *detectedAnnotations;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[NSLock lock](self->_lock_accessAnnotations, "lock");
    if (!self->_detectedAnnotations)
    {
      v5 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
      detectedAnnotations = self->_detectedAnnotations;
      self->_detectedAnnotations = v5;

    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "setPage:", self, (_QWORD)v14);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    -[NSMutableArray addObjectsFromArray:](self->_detectedAnnotations, "addObjectsFromArray:", v7);
    -[NSLock unlock](self->_lock_accessAnnotations, "unlock");
    WeakRetained = objc_loadWeakRetained((id *)&self->_document);
    objc_msgSend(WeakRetained, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v13, "pdfDocument:detectedAnnotations:forPage:", WeakRetained, self->_detectedAnnotations, self);

  }
}

- (void)removeFromDetectedAnnotations:(id)a3
{
  NSMutableArray *detectedAnnotations;

  detectedAnnotations = self->_detectedAnnotations;
  if (detectedAnnotations)
    -[NSMutableArray removeObjectsInArray:](detectedAnnotations, "removeObjectsInArray:", a3);
}

- (id)scannedAnnotationAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id WeakRetained;
  int v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  NSPoint v22;
  NSRect v23;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v7 = objc_msgSend(WeakRetained, "enableDataDetectors");

  if (v7)
  {
    -[PDFPage _buildPageLayout](self, "_buildPageLayout");
    v8 = self->_detectedAnnotations;
    v9 = v8;
    if (v8 && (v10 = -[NSMutableArray count](v8, "count")) != 0)
    {
      v11 = v10 - 1;
      while (1)
      {
        -[NSMutableArray objectAtIndex:](v9, "objectAtIndex:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bounds");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22.x = x;
        v22.y = y;
        v23.origin.x = v14;
        v23.origin.y = v16;
        v23.size.width = v18;
        v23.size.height = v20;
        if (NSPointInRect(v22, v23))
          break;

        if (--v11 == -1)
          goto LABEL_7;
      }
    }
    else
    {
LABEL_7:
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)changedAnnotation:(id)a3
{
  PDFAnnotationChange *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "isFullyConstructed")
    && -[NSMutableArray containsObject:](self->_annotations, "containsObject:", v5))
  {
    v4 = -[PDFAnnotationChange initWithChangedAnnotation:]([PDFAnnotationChange alloc], "initWithChangedAnnotation:", v5);
    -[NSMutableArray addObject:](self->_annotationChanges, "addObject:", v4);
    -[NSMutableSet addObject:](self->_changedAnnotations, "addObject:", v5);

  }
}

- (id)annotationChanges
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  PDFAnnotationChange *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  PDFAnnotationChange *v21;
  id v22;
  uint64_t v23;
  int v24;
  uint64_t j;
  void *v26;
  PDFAnnotationChange *v27;
  PDFAnnotationChange *v28;
  PDFAnnotationChange *v29;
  PDFAnnotationChange *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v35;
  id obj;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v4 = self->_annotationChanges;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v54 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v9, "annotation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v11 = (void *)objc_opt_new();
          objc_msgSend(v3, "setObject:forKey:", v11, v10);
        }
        objc_msgSend(v11, "addObject:", v9);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v6);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v3, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (!v40)
    goto LABEL_63;
  v39 = *(_QWORD *)v50;
  v37 = v3;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v50 != v39)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v12);
      objc_msgSend(v3, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sortedArrayWithOptions:usingComparator:", 0, &__block_literal_global_249);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v16 = v15;
      v17 = -[PDFAnnotationChange countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      if (!v17)
      {
        v44 = 0;
        v22 = 0;
        v21 = 0;
        v30 = v16;
        goto LABEL_58;
      }
      v18 = v17;
      v38 = v13;
      v41 = v12;
      v42 = v14;
      v19 = 0;
      v20 = 0;
      v43 = 0;
      v21 = 0;
      v22 = 0;
      v44 = 0;
      v23 = *(_QWORD *)v46;
      v24 = 1;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(v16);
          v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          if (objc_msgSend(v26, "changeType"))
          {
            if (objc_msgSend(v26, "changeType") == 2)
            {
              v20 |= v24;
              if ((v24 & 1) != 0)
                v19 = 0;
              else
                --v19;
              if (!v22)
                v22 = v26;
              v24 = 0;
            }
            else if (objc_msgSend(v26, "changeType") == 1)
            {
              if ((v24 & 1) != 0)
                v19 = 1;
              v20 |= v24;
              if (!v44)
                v44 = v26;
              v24 = 0;
              v43 = 1;
            }
            else if (objc_msgSend(v26, "changeType") != 3)
            {
              objc_msgSend(v26, "changeType");
            }
          }
          else
          {
            v20 &= v24 ^ 1;
            if ((v24 & 1) != 0)
              v19 = 1;
            else
              ++v19;
            v27 = v26;

            v24 = 0;
            v21 = v27;
          }
        }
        v18 = -[PDFAnnotationChange countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      }
      while (v18);

      if (v19 >= 2)
      {
        NSLog(CFSTR("%s: Annotation change tracking is messed up. lifeCounter was %ld. All changes:\n%@"), "-[PDFPage annotationChanges]", v19, v16);

        v33 = 0;
        v32 = v35;
        v3 = v37;
        goto LABEL_65;
      }
      v3 = v37;
      if (v19 != 1)
      {
        v12 = v41;
        v14 = v42;
        if ((v20 & 1) == 0)
          goto LABEL_59;
        v29 = (PDFAnnotationChange *)v22;
LABEL_56:
        v30 = v29;
        if (!v29)
          goto LABEL_59;
LABEL_57:
        objc_msgSend(v35, "addObject:", v30);
LABEL_58:

        goto LABEL_59;
      }
      v12 = v41;
      v14 = v42;
      if ((v20 & 1) == 0)
      {
        v29 = v21;
        v21 = v29;
        goto LABEL_56;
      }
      if (v21)
      {
        v28 = [PDFAnnotationChange alloc];
        if ((v43 & 1) != 0)
          v29 = -[PDFAnnotationChange initWithReorderedAndChangedAnnotation:](v28, "initWithReorderedAndChangedAnnotation:", v38);
        else
          v29 = -[PDFAnnotationChange initWithReorderedAnnotation:](v28, "initWithReorderedAnnotation:", v38);
        goto LABEL_56;
      }
      if ((v43 & 1) != 0)
      {
        v30 = (PDFAnnotationChange *)v44;
        v21 = 0;
        if (v30)
          goto LABEL_57;
      }
      else
      {
        v21 = 0;
      }
LABEL_59:

      ++v12;
    }
    while (v12 != v40);
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    v40 = v31;
  }
  while (v31);
LABEL_63:

  objc_msgSend(v3, "removeAllObjects");
  v32 = v35;
  v33 = v35;
LABEL_65:

  return v33;
}

uint64_t __28__PDFPage_annotationChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "changeTimestamp");
  if (v6 == objc_msgSend(v5, "changeTimestamp"))
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "changeTimestamp");
    if (v8 < objc_msgSend(v5, "changeTimestamp"))
      v7 = -1;
    else
      v7 = 1;
  }

  return v7;
}

- (id)lastAnnotationChange
{
  return (id)-[NSMutableArray lastObject](self->_annotationChanges, "lastObject");
}

- (void)clearAnnotationChanges
{
  -[NSMutableArray removeAllObjects](self->_annotationChanges, "removeAllObjects");
}

- (id)changedAnnotations
{
  return (id)-[NSMutableSet copy](self->_changedAnnotations, "copy");
}

- (void)resetChangedAnnotations
{
  NSMutableSet *v3;
  NSMutableSet *changedAnnotations;

  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  changedAnnotations = self->_changedAnnotations;
  self->_changedAnnotations = v3;

}

- (void)printActivePageAnnotations
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v4 = objc_msgSend(WeakRetained, "indexForPage:", self);
  -[PDFPage annotations](self, "annotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Current page index %d has %d annotations."), v4, objc_msgSend(v5, "count"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_annotations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        NSLog(CFSTR("Printing dictionary for annotation index %d:"), v9 + v11);
        objc_msgSend(v12, "printDictionaryKeyValues");
        NSLog(&stru_24C25F170.isa);
        ++v11;
      }
      while (v8 != v11);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v9 = (v9 + v11);
    }
    while (v8);
  }

}

- (BOOL)didChangeBounds
{
  return self->_didChangeBounds;
}

- (CGColor)pageBackgroundColorHint
{
  return self->_pageBackgroundColorHint;
}

- (void)addFormFieldGroup:(id)a3
{
  id v4;
  NSMutableArray *formFieldGroups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  formFieldGroups = self->_formFieldGroups;
  v8 = v4;
  if (!formFieldGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_formFieldGroups;
    self->_formFieldGroups = v6;

    v4 = v8;
    formFieldGroups = self->_formFieldGroups;
  }
  -[NSMutableArray addObject:](formFieldGroups, "addObject:", v4);

}

- (id)formFieldGroupForAnnotation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_formFieldGroups;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "containsObject:", v4, (_QWORD)v11) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setApplicationData:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *persistentApplicationData;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = v13;
  v8 = v6;
  persistentApplicationData = self->_persistentApplicationData;
  if (v13)
  {
    if (!persistentApplicationData)
    {
      v10 = (NSMutableDictionary *)objc_opt_new();
      v11 = self->_persistentApplicationData;
      self->_persistentApplicationData = v10;

      v7 = v13;
      persistentApplicationData = self->_persistentApplicationData;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](persistentApplicationData, "setObject:forKeyedSubscript:", v7, v8);
    -[PDFPage document](self, "document");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHasPageWithApplicationData:", 1);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](persistentApplicationData, "removeObjectForKey:", v8);
  }

}

- (id)applicationDataWithName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_persistentApplicationData, "objectForKeyedSubscript:", a3);
}

- (void)enumerateApplicationDataUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *persistentApplicationData;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  persistentApplicationData = self->_persistentApplicationData;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__PDFPage_enumerateApplicationDataUsingBlock___block_invoke;
  v7[3] = &unk_24C25E0F0;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](persistentApplicationData, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __46__PDFPage_enumerateApplicationDataUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)postAnnotationsChangedNotification
{
  void *v3;

  -[PDFPage view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__postAnnotationsChangedNotificationCoalesced, 0);
    -[PDFPage performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__postAnnotationsChangedNotificationCoalesced, 0, 0.0);
  }
}

- (void)_postAnnotationsChangedNotificationCoalesced
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFPage view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", self, CFSTR("page"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("PDFViewAnnotationsDidChange"), v3, v4);

}

- (void)_scanData:(id)a3
{
  os_unfair_lock_s *p_dataDetectorsLock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  PDFScannerResult *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  os_unfair_lock_s *lock;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  p_dataDetectorsLock = &self->_dataDetectorsLock;
  os_unfair_lock_lock(&self->_dataDetectorsLock);
  if (self->_ranDataDetectors)
  {
    os_unfair_lock_unlock(p_dataDetectorsLock);
  }
  else
  {
    self->_ranDataDetectors = 1;
    -[PDFPage string](self, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "length"))
    {
      lock = p_dataDetectorsLock;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2B378]), "initWithScannerType:passiveIntent:", 0, 1);
      objc_msgSend(v7, "setSpotlightSuggestionsEnabled:", 1);
      v25 = v7;
      v26 = v6;
      objc_msgSend(MEMORY[0x24BE2B370], "scanString:range:configuration:", v6, 0, objc_msgSend(v6, "length"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      obj = v8;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v31 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            v14 = -[PDFScannerResult initWithDDScannerResult:foundOnPage:]([PDFScannerResult alloc], "initWithDDScannerResult:foundOnPage:", v13, self);
            if (v14)
            {
              -[NSMutableArray addObject:](self->_scannerResults, "addObject:", v14);
              objc_msgSend(v13, "url");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                -[PDFScannerResult bounds](v14, "bounds");
                -[PDFPage annotationAtPoint:](self, "annotationAtPoint:", PDFRectGetCenterPoint(v16, v17, v18));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "valueForAnnotationKey:", CFSTR("/Subtype"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("/Link"));

                if ((v21 & 1) == 0)
                {
                  v22 = objc_alloc(-[PDFPage annotationSubclassForSubtype:](self, "annotationSubclassForSubtype:", CFSTR("/Link")));
                  -[PDFScannerResult bounds](v14, "bounds");
                  v23 = (void *)objc_msgSend(v22, "initCommonWithBounds:");
                  objc_msgSend(v23, "setType:", CFSTR("/Link"));
                  objc_msgSend(v23, "setURL:", v15);
                  objc_msgSend(v23, "setForExport:", 0);
                  objc_msgSend(v28, "addObject:", v23);

                }
              }

            }
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v10);
      }

      if (objc_msgSend(v28, "count"))
      {
        -[PDFPage view](self, "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          -[PDFPage addDetectedAnnotations:](self, "addDetectedAnnotations:", v28);
      }
      os_unfair_lock_unlock(lock);

      v6 = v26;
    }
    else
    {
      os_unfair_lock_unlock(p_dataDetectorsLock);
    }

  }
}

- (id)dataDetectorResults
{
  id WeakRetained;
  int v4;
  os_unfair_lock_s *p_dataDetectorsLock;
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v4 = objc_msgSend(WeakRetained, "enableDataDetectors");

  if (v4 && (p_dataDetectorsLock = &self->_dataDetectorsLock, os_unfair_lock_trylock(&self->_dataDetectorsLock)))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_scannerResults;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "ddResult", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    os_unfair_lock_unlock(p_dataDetectorsLock);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)pdfScannerResultAtPoint:(CGPoint)a3
{
  return -[PDFPage pdfScannerResultAtPoint:onPageLayer:](self, "pdfScannerResultAtPoint:onPageLayer:", 0, a3.x, a3.y);
}

- (id)pdfScannerResultAtPoint:(CGPoint)a3 onPageLayer:(id)a4
{
  double y;
  double x;
  id v7;
  os_unfair_lock_s *p_dataDetectorsLock;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  os_unfair_lock_s *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;
  CGPoint v36;
  CGRect v37;

  y = a3.y;
  x = a3.x;
  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  p_dataDetectorsLock = &self->_dataDetectorsLock;
  if (!os_unfair_lock_trylock(&self->_dataDetectorsLock))
  {
    v22 = 0;
    goto LABEL_31;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = self->_scannerResults;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (!v10)
  {
    v22 = 0;
    goto LABEL_30;
  }
  v11 = v10;
  v24 = p_dataDetectorsLock;
  v12 = *(_QWORD *)v30;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v30 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      if ((objc_msgSend(v14, "resultIsPastDate") & 1) != 0)
        continue;
      if (v7)
      {
        if ((objc_msgSend(v14, "containsPoint:onPageLayer:", v7, x, y) & 1) != 0)
          goto LABEL_12;
      }
      else if (objc_msgSend(v14, "containsPoint:", x, y))
      {
LABEL_12:
        v15 = v14;
        if (v15)
        {
          v22 = v15;
          goto LABEL_29;
        }
      }
      objc_msgSend(v14, "rects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v26;
LABEL_15:
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v21), "PDFKitPDFRectValue");
          v36.x = x;
          v36.y = y;
          if (PDFRectContainsPoint(v37, v36))
            break;
          if (v19 == ++v21)
          {
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v19)
              goto LABEL_15;
            goto LABEL_21;
          }
        }
        v22 = v14;

        if (v22)
          goto LABEL_29;
      }
      else
      {
LABEL_21:

      }
    }
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v11)
      continue;
    break;
  }
  v22 = 0;
LABEL_29:
  p_dataDetectorsLock = v24;
LABEL_30:

  os_unfair_lock_unlock(p_dataDetectorsLock);
LABEL_31:

  return v22;
}

- (id)rvItemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  -[PDFPage pdfScannerResultAtPoint:](self, "pdfScannerResultAtPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[PDFPage rvItemWithPDFScannerResult:](self, "rvItemWithPDFScannerResult:", v6);
  else
    -[PDFPage _rvItemAtPoint:](self, "_rvItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)rvItemAtPoint:(CGPoint)a3 onPageLayer:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  -[PDFPage pdfScannerResultAtPoint:onPageLayer:](self, "pdfScannerResultAtPoint:onPageLayer:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[PDFPage rvItemWithPDFScannerResult:](self, "rvItemWithPDFScannerResult:", v7);
  else
    -[PDFPage _rvItemAtPoint:](self, "_rvItemAtPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_rvItemAtPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  -[PDFPage selectionFromPoint:toPoint:type:](self, "selectionFromPoint:toPoint:type:", 1, a3.x, a3.y, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEmpty") & 1) == 0)
  {
    v7 = objc_msgSend(v5, "rangeAtIndex:onPage:", 0, self);
    v8 = objc_alloc((Class)RVItemClass());
    -[PDFPage string](self, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithText:selectedRange:", v9, v7, 0);

    objc_msgSend(v10, "highlightRange");
    if (v11)
    {
      v12 = objc_msgSend(v10, "highlightRange");
      -[PDFPage selectionForRange:](self, "selectionForRange:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("selection");
      v18[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setClientHints:", v15);
      v6 = v10;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)rvItemWithPDFScannerResult:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v4 = a3;
  v5 = objc_alloc((Class)RVItemClass());
  objc_msgSend(v4, "ddResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDDResult:", v6);

  objc_msgSend(v4, "ddResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "urlificationRange");
  -[PDFPage selectionForRange:](self, "selectionForRange:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = CFSTR("selection");
  v15[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClientHints:", v12);

  return v7;
}

- (unint64_t)_documentIndex
{
  id WeakRetained;
  unint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v4 = objc_msgSend(WeakRetained, "indexForPage:", self);

  return v4;
}

- (CGPath)createRedactionPath
{
  CGPath *Mutable;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  const CGPath *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;
  CGRect v18;

  v17 = *MEMORY[0x24BDAC8D0];
  Mutable = CGPathCreateMutable();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_annotations;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isRedaction", (_QWORD)v12))
        {
          v10 = (const CGPath *)objc_msgSend(v9, "quadPointsPath");
          if (v10)
          {
            CGPathAddPath(Mutable, 0, v10);
          }
          else
          {
            objc_msgSend(v9, "bounds");
            CGPathAddRect(Mutable, 0, v18);
          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  if (CGPathIsEmpty(Mutable))
  {
    CGPathRelease(Mutable);
    return 0;
  }
  return Mutable;
}

- (BOOL)rectIntersectsWithRedactionPath:(CGRect)a3
{
  CGPath *v3;
  char v4;

  v3 = -[PDFPage createRedactionPath](self, "createRedactionPath");
  v4 = CGPathIntersectsRect();
  CGPathRelease(v3);
  return v4;
}

- (BOOL)pathIntersectsWithRedactionPath:(CGPath *)a3
{
  CGPath *v4;

  v4 = -[PDFPage createRedactionPath](self, "createRedactionPath");
  LOBYTE(a3) = MEMORY[0x20BD1A6F8](v4, a3, 1);
  CGPathRelease(v4);
  return (char)a3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDFPage;
  -[PDFPage description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFPage document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" page index %ld"), objc_msgSend(v4, "indexForPage:", self));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugQuickLookObject
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = PDFSizeMake(self, 600.0, 600.0);
  v5 = v4;
  v9 = CFSTR("PDFPageImageProperty_WithRotation");
  v10[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFPage imageOfSize:forBox:withOptions:](self, "imageOfSize:forBox:withOptions:", 1, v6, v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setExtraContentStream:(CGPDFStream *)a3 steamDocument:(CGPDFDocument *)a4
{
  -[PDFPage pageRef](self, "pageRef");
  CGPDFPageSetExtraContentStream();
  self->_textFromOCR = a3 != 0;
  -[PDFPage purgePageLayout](self, "purgePageLayout");
  -[PDFPage _releaseDisplayList](self, "_releaseDisplayList");
}

- (PDFDetectedForm)detectedForm
{
  return self->_detectedForm;
}

- (void)setDetectedForm:(id)a3
{
  objc_storeStrong((id *)&self->_detectedForm, a3);
}

- (id)annotationForDetectedFormField:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_getAssociatedObject(a3, CFSTR("com.apple.pdfkit.AnnotationAssociatedObjectKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)detectedFormFieldForAnnotation:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_getAssociatedObject(a3, CFSTR("com.apple.pdfkit.DetectedFormFieldAssociatedObjectKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)addedAnnotation:(id)a3 forFormField:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id value;

  v5 = a4;
  v6 = a3;
  +[PDFWeakWrapper weakWrapperWithObject:](PDFWeakWrapper, "weakWrapperWithObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v6, CFSTR("com.apple.pdfkit.DetectedFormFieldAssociatedObjectKey"), v7, (void *)0x301);

  +[PDFWeakWrapper weakWrapperWithObject:](PDFWeakWrapper, "weakWrapperWithObject:", v6);
  value = (id)objc_claimAutoreleasedReturnValue();

  objc_setAssociatedObject(v5, CFSTR("com.apple.pdfkit.AnnotationAssociatedObjectKey"), value, (void *)0x301);
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentApplicationData, 0);
  objc_storeStrong((id *)&self->_formFieldGroups, 0);
  objc_storeStrong((id *)&self->_detectedForm, 0);
  objc_storeStrong((id *)&self->_scannerResults, 0);
  objc_storeStrong((id *)&self->_widgetAnnotationLookup, 0);
  objc_storeStrong((id *)&self->_changedAnnotations, 0);
  objc_storeStrong((id *)&self->_annotationChanges, 0);
  objc_storeStrong((id *)&self->_akPageAdaptor, 0);
  objc_storeStrong((id *)&self->_createDisplayListCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_detectedAnnotations, 0);
  objc_storeStrong((id *)&self->_lock_accessAnnotations, 0);
  objc_storeStrong((id *)&self->_lock_getAnnotations, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_pageImageOptions, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_document);
}

@end
