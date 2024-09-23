@implementation SSSScreenshot

- (SSSScreenshot)initWithEnvironmentDescription:(id)a3
{
  SSEnvironmentDescription *v4;
  SSSScreenshot *v5;
  SSEnvironmentDescription *environmentDescription;
  SSEnvironmentDescription *v7;
  void *v8;
  uint64_t v9;
  UIImage *backingImage;
  SSSScreenshotModificationInfo *v11;
  SSSScreenshotModificationInfo *modelModificationInfo;
  SSSScreenshotMutableModificationInfo *v13;
  SSSScreenshotMutableModificationInfo *viewModificationInfo;
  void *v15;
  SSSScreenshotItemProviderImage *v16;
  SSSScreenshotItemProviderImage *itemProviderImage;
  SSSScreenshotItemProviderPDF *v18;
  SSSScreenshotItemProviderPDF *itemProviderPDF;
  SSSScreenshotItemProviderPDFAsImage *v20;
  SSSScreenshotItemProviderPDFAsImage *itemProviderPDFAsImage;
  SSSScreenshotImageProvider *v22;
  SSSScreenshotImageProvider *imageProvider;
  NSUndoManager *v24;
  NSUndoManager *imageUndoManager;
  NSUndoManager *v26;
  NSUndoManager *v27;
  NSUndoManager *pdfUndoManager;
  NSUndoManager *v29;
  NSMutableDictionary *v30;
  NSMutableDictionary *elementPDFValidationDictionary;
  dispatch_queue_attr_t v32;
  NSObject *v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *pdfSavingQueue;
  uint64_t v36;
  uint64_t CTGreenTeaOsLogHandle;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  __int16 v48[8];
  objc_super v49;

  v4 = (SSEnvironmentDescription *)a3;
  v49.receiver = self;
  v49.super_class = (Class)SSSScreenshot;
  v5 = -[SSSScreenshot init](&v49, "init");
  environmentDescription = v5->_environmentDescription;
  v5->_environmentDescription = v4;
  v7 = v4;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSEnvironmentDescription imageSurface](v7, "imageSurface"));
  v9 = objc_claimAutoreleasedReturnValue(+[UIImage ss_imageFromImageSurface:](UIImage, "ss_imageFromImageSurface:", v8));
  backingImage = v5->_backingImage;
  v5->_backingImage = (UIImage *)v9;

  v11 = -[SSSScreenshotModificationInfo initForScreenshotWithEnvironmentDescription:]([SSSScreenshotModificationInfo alloc], "initForScreenshotWithEnvironmentDescription:", v7);
  modelModificationInfo = v5->_modelModificationInfo;
  v5->_modelModificationInfo = v11;

  v13 = -[SSSScreenshotModificationInfo initForScreenshotWithEnvironmentDescription:]([SSSScreenshotMutableModificationInfo alloc], "initForScreenshotWithEnvironmentDescription:", v7);
  viewModificationInfo = v5->_viewModificationInfo;
  v5->_viewModificationInfo = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot viewModificationInfo](v5, "viewModificationInfo"));
  objc_msgSend(v15, "setChangeObserver:", v5);

  v16 = -[SSSScreenshotItemProvider initWithScreenshot:]([SSSScreenshotItemProviderImage alloc], "initWithScreenshot:", v5);
  itemProviderImage = v5->_itemProviderImage;
  v5->_itemProviderImage = v16;

  v18 = -[SSSScreenshotItemProvider initWithScreenshot:]([SSSScreenshotItemProviderPDF alloc], "initWithScreenshot:", v5);
  itemProviderPDF = v5->_itemProviderPDF;
  v5->_itemProviderPDF = v18;

  v20 = -[SSSScreenshotItemProviderPDFAsImage initWithScreenshot:]([SSSScreenshotItemProviderPDFAsImage alloc], "initWithScreenshot:", v5);
  itemProviderPDFAsImage = v5->_itemProviderPDFAsImage;
  v5->_itemProviderPDFAsImage = v20;

  v22 = -[SSSScreenshotImageProvider initWithScreenshot:]([SSSScreenshotImageProvider alloc], "initWithScreenshot:", v5);
  imageProvider = v5->_imageProvider;
  v5->_imageProvider = v22;

  -[SSSScreenshot _harvestPDFIfNecessary](v5, "_harvestPDFIfNecessary");
  v24 = (NSUndoManager *)objc_alloc_init((Class)NSUndoManager);
  -[NSUndoManager setGroupsByEvent:](v24, "setGroupsByEvent:", 1);
  imageUndoManager = v5->_imageUndoManager;
  v5->_imageUndoManager = v24;
  v26 = v24;

  v27 = (NSUndoManager *)objc_alloc_init((Class)NSUndoManager);
  -[NSUndoManager setGroupsByEvent:](v27, "setGroupsByEvent:", 1);
  pdfUndoManager = v5->_pdfUndoManager;
  v5->_pdfUndoManager = v27;
  v29 = v27;

  v5->_lastViewEditMode = 0;
  v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  elementPDFValidationDictionary = v5->_elementPDFValidationDictionary;
  v5->_elementPDFValidationDictionary = v30;

  v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  v34 = dispatch_queue_create("com.apple.screenshotservices.pdfSavingQueue", v33);
  pdfSavingQueue = v5->_pdfSavingQueue;
  v5->_pdfSavingQueue = (OS_dispatch_queue *)v34;

  v36 = ct_green_tea_logger_create_static("screenshots");
  switch(-[SSSScreenshot saveLocation](v5, "saveLocation"))
  {
    case 0uLL:
      CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle(v36);
      v38 = objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
      v39 = v38;
      if (!v38 || !os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        goto LABEL_15;
      v48[0] = 0;
      v40 = "Received screen image";
      break;
    case 1uLL:
      v41 = getCTGreenTeaOsLogHandle(v36);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      v39 = v42;
      if (!v42 || !os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        goto LABEL_15;
      v48[0] = 0;
      v40 = "Received AR image";
      break;
    case 2uLL:
      v43 = getCTGreenTeaOsLogHandle(v36);
      v44 = objc_claimAutoreleasedReturnValue(v43);
      v39 = v44;
      if (!v44 || !os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        goto LABEL_15;
      v48[0] = 0;
      v40 = "Received game highlights image";
      break;
    case 3uLL:
      v45 = getCTGreenTeaOsLogHandle(v36);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      v39 = v46;
      if (!v46 || !os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        goto LABEL_15;
      v48[0] = 0;
      v40 = "Received request to save screenshot to quick note";
      break;
    default:
      return v5;
  }
  _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, v40, (uint8_t *)v48, 2u);
LABEL_15:

  return v5;
}

- (void)dealloc
{
  CGRect *savedCropBoxes;
  void *v4;
  objc_super v5;

  savedCropBoxes = self->_savedCropBoxes;
  if (savedCropBoxes)
    free(savedCropBoxes);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SSSScreenshot;
  -[SSSScreenshot dealloc](&v5, "dealloc");
}

- (void)setBackingImage:(id)a3
{
  objc_storeStrong((id *)&self->_backingImage, a3);
}

- (UIImage)backingImage
{
  return self->_backingImage;
}

- (void)setViewModificationInfo:(id)a3 forState:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v8;

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3;
  objc_msgSend(v8, "setChangeObserver:", 0);
  if (var0)
    -[NSMutableArray setObject:atIndexedSubscript:](self->_pdfViewModificationInfos, "setObject:atIndexedSubscript:", v8, var1);
  else
    objc_storeStrong((id *)&self->_viewModificationInfo, a3);
  objc_msgSend(v8, "setChangeObserver:", self);

}

- (void)setModelModificationInfo:(id)a3 forState:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v8;
  id v9;

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3;
  v9 = v8;
  if (var0)
    -[NSMutableArray setObject:atIndexedSubscript:](self->_pdfModelModificationInfos, "setObject:atIndexedSubscript:", v8, var1);
  else
    objc_storeStrong((id *)&self->_modelModificationInfo, a3);

}

- (id)viewModificationInfoForState:(id)a3
{
  NSMutableArray *pdfViewModificationInfos;
  int64_t var1;
  SSSScreenshotMutableModificationInfo *v6;

  if (a3.var0
    && (pdfViewModificationInfos = self->_pdfViewModificationInfos) != 0
    && (var1 = a3.var1, (unint64_t)-[NSMutableArray count](pdfViewModificationInfos, "count") > a3.var1))
  {
    v6 = (SSSScreenshotMutableModificationInfo *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_pdfViewModificationInfos, "objectAtIndexedSubscript:", var1));
  }
  else
  {
    v6 = self->_viewModificationInfo;
  }
  return v6;
}

- (id)modelModificationInfoForState:(id)a3
{
  NSMutableArray *pdfModelModificationInfos;
  int64_t var1;
  SSSScreenshotModificationInfo *v6;

  if (a3.var0
    && (pdfModelModificationInfos = self->_pdfModelModificationInfos) != 0
    && (var1 = a3.var1, (unint64_t)-[NSMutableArray count](pdfModelModificationInfos, "count") > a3.var1))
  {
    v6 = (SSSScreenshotModificationInfo *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_pdfModelModificationInfos, "objectAtIndexedSubscript:", var1));
  }
  else
  {
    v6 = self->_modelModificationInfo;
  }
  return v6;
}

- (void)promoteViewValueToModelValueForKey:(unint64_t)a3 forState:(id)a4
{
  -[SSSScreenshot promoteViewValueToModelValueForKey:forState:createUndoCommand:](self, "promoteViewValueToModelValueForKey:forState:createUndoCommand:", a3, a4.var0, a4.var1, 1);
}

- (void)promoteViewValueToModelValueForKey:(unint64_t)a3 forState:(id)a4 createUndoCommand:(BOOL)a5
{
  _BOOL8 v5;
  int64_t var1;
  int64_t var0;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[2];

  v5 = a5;
  var1 = a4.var1;
  var0 = a4.var0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot modelModificationInfoForState:](self, "modelModificationInfoForState:", a4.var0, a4.var1));
  v11 = objc_msgSend(v10, "copy");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot modelModificationInfoForState:](self, "modelModificationInfoForState:", var0, var1));
  v13 = objc_msgSend(v12, "mutableCopy");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot viewModificationInfoForState:](self, "viewModificationInfoForState:", var0, var1));
  objc_msgSend(v13, "takeValueFromModificationInfo:forKey:", v14, a3);

  if ((objc_msgSend(v13, "isEqual:", v11) & 1) == 0)
  {
    if (var0)
    {
      v17[0] = CFSTR("modelModificationInfo");
      v17[1] = CFSTR("previousModificationInfo");
      v18[0] = v13;
      v18[1] = v11;
      v17[2] = CFSTR("page");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", var1));
      v18[2] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));

    }
    else
    {
      v19[0] = CFSTR("modelModificationInfo");
      v19[1] = CFSTR("previousModificationInfo");
      v20[0] = v13;
      v20[1] = v11;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
    }
    -[SSSScreenshot _setModelModificationDictionary:createUndoCommand:](self, "_setModelModificationDictionary:createUndoCommand:", v16, v5);

  }
}

- (void)_setModelModificationDictionary:(id)a3
{
  -[SSSScreenshot _setModelModificationDictionary:createUndoCommand:](self, "_setModelModificationDictionary:createUndoCommand:", a3, 1);
}

- (void)_setModelModificationDictionary:(id)a3 createUndoCommand:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];
  _QWORD v20[3];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modelModificationInfo")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("previousModificationInfo")));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("page")));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("page")));
    v9 = (int)objc_msgSend(v10, "intValue");

    v19[0] = CFSTR("modelModificationInfo");
    v19[1] = CFSTR("previousModificationInfo");
    v20[0] = v8;
    v20[1] = v7;
    v19[2] = CFSTR("page");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9));
    v20[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 3));

    v13 = 1;
  }
  else
  {
    v17[0] = CFSTR("modelModificationInfo");
    v17[1] = CFSTR("previousModificationInfo");
    v18[0] = v8;
    v18[1] = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
    v13 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot undoManagerForEditMode:](self, "undoManagerForEditMode:", v13));
  if (v4)
  {
    -[SSSScreenshot _undoableModelChangePrequel:](self, "_undoableModelChangePrequel:", v14);
    objc_msgSend(v14, "registerUndoWithTarget:selector:object:", self, "_setModelModificationDictionary:", v12);
    -[SSSScreenshot setModelModificationInfo:forState:](self, "setModelModificationInfo:forState:", v7, v13, v9);
    v15 = objc_msgSend(v7, "mutableCopy");
    -[SSSScreenshot setViewModificationInfo:forState:](self, "setViewModificationInfo:forState:", v15, v13, v9);

    -[SSSScreenshot _undoableModelChangeSequel:](self, "_undoableModelChangeSequel:", v14);
    -[SSSScreenshot _markAsBeingEditedForMode:](self, "_markAsBeingEditedForMode:", v13);
LABEL_8:
    -[SSSScreenshot _informRepresentationOfUndoStackChange](self, "_informRepresentationOfUndoStackChange");
    goto LABEL_9;
  }
  -[SSSScreenshot setModelModificationInfo:forState:](self, "setModelModificationInfo:forState:", v7, v13, v9);
  v16 = objc_msgSend(v7, "mutableCopy");
  -[SSSScreenshot setViewModificationInfo:forState:](self, "setViewModificationInfo:forState:", v16, v13, v9);

  -[SSSScreenshot _markAsBeingEditedForMode:](self, "_markAsBeingEditedForMode:", v13);
  if ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs") & 1) != 0
    || _os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages"))
  {
    goto LABEL_8;
  }
LABEL_9:

}

- (void)screenshotMutableModificationInfo:(id)a3 valueChangedForKey:(unint64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshot representation](self, "representation", a3, a4));
  objc_msgSend(v5, "screenshotDidHaveViewModificationInfoChanged:", self);

}

- (NSData)imageModificationData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot modelModificationInfo](self, "modelModificationInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 0, 0));

  return (NSData *)v3;
}

- (unint64_t)saveLocation
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot environmentDescription](self, "environmentDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serviceOptions"));
  v4 = objc_msgSend(v3, "saveLocation");

  return (unint64_t)v4;
}

- (int64_t)_elementIndexForDocument
{
  void *v3;
  id v4;
  unint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int64_t v16;
  void *v17;
  id v18;

  if (!-[SSSScreenshot _screenshotWasTakenFromScreenshots](self, "_screenshotWasTakenFromScreenshots"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSEnvironmentDescription elements](self->_environmentDescription, "elements"));
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v5 = 0;
      v6 = 0.0;
      v7 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSEnvironmentDescription elements](self->_environmentDescription, "elements"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v5));

        if (self->_didFinishReceivingDocumentUpdates)
        {
          if (!-[SSSScreenshot _elementHasValidPDFData:](self, "_elementHasValidPDFData:", v9))
            goto LABEL_14;
        }
        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadata"));
          v11 = objc_msgSend(v10, "canGenerateDocument");

          if ((v11 & 1) == 0)
            goto LABEL_14;
        }
        objc_msgSend(v9, "rect");
        v13 = v12;
        objc_msgSend(v9, "rect");
        v15 = v14;
        v16 = v5;
        if (v13 <= v6)
        {
          if (v14 == v6)
          {
            if (objc_msgSend(v9, "hasKeyboardFocus"))
              v16 = v5;
            else
              v16 = v7;
            v15 = v6;
            goto LABEL_15;
          }
LABEL_14:
          v15 = v6;
          v16 = v7;
        }
LABEL_15:

        ++v5;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSEnvironmentDescription elements](self->_environmentDescription, "elements"));
        v18 = objc_msgSend(v17, "count");

        v7 = v16;
        v6 = v15;
        if (v5 >= (unint64_t)v18)
          return v16;
      }
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_elementHasValidPDFData:(id)a3
{
  id v4;
  SSSScreenshot *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  NSMutableDictionary *elementPDFValidationDictionary;
  void *v24;
  CGRect v26;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "document"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "PDFData"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5->_elementPDFValidationDictionary, "allKeys"));
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if (v9)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_elementPDFValidationDictionary, "objectForKeyedSubscript:", v4));
      LOBYTE(v7) = objc_msgSend(v10, "BOOLValue");
    }
    else
    {
      v11 = objc_alloc((Class)PDFDocument);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "document"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "PDFData"));
      v10 = objc_msgSend(v11, "initWithData:", v13);

      if (objc_msgSend(v10, "pageCount"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pageAtIndex:", 0));
        objc_msgSend(v14, "boundsForBox:", 1);
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;

        v26.origin.x = v16;
        v26.origin.y = v18;
        v26.size.width = v20;
        v26.size.height = v22;
        v7 = !CGRectIsEmpty(v26);
      }
      else
      {
        v7 = 0;
      }
      elementPDFValidationDictionary = v5->_elementPDFValidationDictionary;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
      -[NSMutableDictionary setObject:forKey:](elementPDFValidationDictionary, "setObject:forKey:", v24, v4);

    }
  }
  objc_sync_exit(v5);

  return v7;
}

- (id)_elementDocument
{
  int64_t v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = -[SSSScreenshot _elementIndexForDocument](self, "_elementIndexForDocument");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    v5 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSEnvironmentDescription elements](self->_environmentDescription, "elements"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v5));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "document"));

  }
  return v4;
}

- (BOOL)_hasGeneratedPDF
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot _elementDocument](self, "_elementDocument"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_canProvidePDF
{
  return -[SSSScreenshot _elementIndexForDocument](self, "_elementIndexForDocument") != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isWaitingForPDF
{
  unsigned int v3;
  void *v4;
  void *v5;
  BOOL v6;
  BOOL result;

  v3 = -[SSSScreenshot _canProvidePDF](self, "_canProvidePDF");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSEnvironmentDescription elements](self->_environmentDescription, "elements"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot _elementDocument](self, "_elementDocument"));
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  result = 0;
  if (v3)
  {
    if (!v6)
      return self->_isPDFRequested;
  }
  return result;
}

- (void)didProcessDocumentUpdate
{
  uint64_t *p_documentUpdateCount;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  p_documentUpdateCount = &self->_documentUpdateCount;
  ++self->_documentUpdateCount;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSEnvironmentDescription elements](self->_environmentDescription, "elements", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "metadata"));
        v11 = objc_msgSend(v10, "canGenerateDocument");

        v7 += v11;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  if (*p_documentUpdateCount == v7)
  {
    self->_didFinishReceivingDocumentUpdates = 1;
  }
  else if (*p_documentUpdateCount > v7)
  {
    self->_didFinishReceivingDocumentUpdates = 1;
    v12 = os_log_create("com.apple.screenshotservices", "PDF");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      sub_100057970(p_documentUpdateCount, v7, v12);

  }
}

- (NSData)pdfData
{
  void *v3;
  void *v4;

  if (-[SSSScreenshot _hasGeneratedPDF](self, "_hasGeneratedPDF"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot _elementDocument](self, "_elementDocument"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "PDFData"));

  }
  else
  {
    v4 = 0;
  }
  return (NSData *)v4;
}

- (int64_t)visiblePDFPageWhenScreenshotted
{
  void *v3;
  id v4;

  if (!-[SSSScreenshot _hasGeneratedPDF](self, "_hasGeneratedPDF"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot _elementDocument](self, "_elementDocument"));
  v4 = objc_msgSend(v3, "PDFPage");

  return (int64_t)v4;
}

- (CGRect)visiblePDFRectWhenScreenshotted
{
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  if (-[SSSScreenshot _hasGeneratedPDF](self, "_hasGeneratedPDF"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot _elementDocument](self, "_elementDocument"));
    objc_msgSend(v3, "PDFVisibleRect");
    x = v4;
    y = v6;
    width = v8;
    height = v10;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)_screenshotWasTakenFromScreenshots
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSEnvironmentDescription elements](self->_environmentDescription, "elements", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
        if (!v7 && !objc_msgSend(v6, "isAppLauncher"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (void)_markImageAsBeingEdited
{
  self->_imageHasEverBeenEdited = 1;
  self->_imageHasUnsavedEdits = 1;
}

- (void)_markPDFAsBeingEdited
{
  self->_pdfHasEverBeenEdited = 1;
  self->_pdfHasUnsavedEdits = 1;
}

- (void)_markAsBeingEditedForMode:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  SSSScreenshot *v8;

  if (a3)
  {
    -[SSSScreenshot _markPDFAsBeingEdited](self, "_markPDFAsBeingEdited");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserActivity _currentUserActivityUUID](NSUserActivity, "_currentUserActivityUUID"));
    v5 = v4;
    if (v4 && !self->_imageHasEverBeenEdited)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10001A5B8;
      v6[3] = &unk_100091D98;
      v7 = v4;
      v8 = self;
      +[NSUserActivity _fetchUserActivityWithUUID:completionHandler:](NSUserActivity, "_fetchUserActivityWithUUID:completionHandler:", v7, v6);

    }
    else
    {
      -[SSSScreenshot _markImageAsBeingEdited](self, "_markImageAsBeingEdited");
    }

  }
}

- (BOOL)hasUnsavedImageEdits
{
  return self->_imageHasUnsavedEdits;
}

- (BOOL)hasUnsavedPDFEdits
{
  return self->_pdfHasUnsavedEdits;
}

- (BOOL)hasEverBeenEditedForMode:(int64_t)a3
{
  uint64_t v3;

  v3 = 42;
  if (a3)
    v3 = 43;
  return *((_BYTE *)&self->super.isa + v3);
}

- (BOOL)isSavingForMode:(int64_t)a3
{
  uint64_t v3;

  v3 = 44;
  if (a3)
    v3 = 45;
  return *((_BYTE *)&self->super.isa + v3);
}

- (void)wasJustSavedForMode:(int64_t)a3
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 41;
  *((_BYTE *)&self->super.isa + v3) = 0;
}

- (void)_informRepresentationOfUndoStackChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshot representation](self, "representation"));
  objc_msgSend(v3, "screenshotDidHaveUndoStackChanged:", self);

}

- (BOOL)canUndoForViewState:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot undoManagerForEditMode:](self, "undoManagerForEditMode:", a3.var0, a3.var1));
  v4 = objc_msgSend(v3, "canUndo");

  return v4;
}

- (BOOL)canRedoForViewState:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot undoManagerForEditMode:](self, "undoManagerForEditMode:", a3.var0, a3.var1));
  v4 = objc_msgSend(v3, "canRedo");

  return v4;
}

- (void)undoForViewState:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot undoManagerForEditMode:](self, "undoManagerForEditMode:", a3.var0, a3.var1));
  objc_msgSend(v4, "undo");

  -[SSSScreenshot _informRepresentationOfUndoStackChange](self, "_informRepresentationOfUndoStackChange");
}

- (void)revertForViewState:(id)a3
{
  int64_t var1;
  int64_t var0;
  SSSScreenshotModificationInfo *v6;
  void *v7;
  id v8;
  SSSScreenshotMutableModificationInfo *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = [SSSScreenshotModificationInfo alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot environmentDescription](self, "environmentDescription"));
  v8 = -[SSSScreenshotModificationInfo initForScreenshotWithEnvironmentDescription:](v6, "initForScreenshotWithEnvironmentDescription:", v7);
  -[SSSScreenshot setModelModificationInfo:forState:](self, "setModelModificationInfo:forState:", v8, var0, var1);

  v9 = [SSSScreenshotMutableModificationInfo alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot environmentDescription](self, "environmentDescription"));
  v11 = -[SSSScreenshotModificationInfo initForScreenshotWithEnvironmentDescription:](v9, "initForScreenshotWithEnvironmentDescription:", v10);
  -[SSSScreenshot setViewModificationInfo:forState:](self, "setViewModificationInfo:forState:", v11, var0, var1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot undoManagerForEditMode:](self, "undoManagerForEditMode:", var0));
  objc_msgSend(v12, "removeAllActions");

  v13 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshot representation](self, "representation"));
  objc_msgSend(v13, "screenshotDidRevert:", self);

}

- (void)redoForViewState:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot undoManagerForEditMode:](self, "undoManagerForEditMode:", a3.var0, a3.var1));
  objc_msgSend(v4, "redo");

  -[SSSScreenshot _informRepresentationOfUndoStackChange](self, "_informRepresentationOfUndoStackChange");
}

- (id)undoManagerForEditMode:(int64_t)a3
{
  uint64_t v3;

  v3 = 56;
  if (!a3)
    v3 = 48;
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)requestImageInTransition:(BOOL)a3 withBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  self->_imageIsSaving = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot imageProvider](self, "imageProvider"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001A9CC;
  v9[3] = &unk_100091DC0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "requestOutputImageInTransition:forSaving:", v4, v9);

}

- (SSScreenshotAssetManagerRegistrationOptions)registrationOptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init((Class)SSScreenshotAssetManagerRegistrationOptions);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot environmentDescription](self, "environmentDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceOptions"));
  objc_msgSend(v3, "setSaveLocation:", objc_msgSend(v5, "saveLocation"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot environmentDescription](self, "environmentDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetMetadata"));
  objc_msgSend(v3, "setAssetMetadata:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot environmentDescription](self, "environmentDescription"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "harvestedMetadata"));
  objc_msgSend(v3, "setHarvestedMetadata:", v10);

  return (SSScreenshotAssetManagerRegistrationOptions *)v3;
}

- (NSString)imageDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot modelModificationInfo](self, "modelModificationInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageDescription"));

  return (NSString *)v3;
}

+ (id)nameForScreenshot:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  void *v22;

  v3 = a3;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("yyyy-MM-dd"), 0, 0));
  v21 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v21, "setDateFormat:", v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environmentDescription"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringFromDate:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v5, 0, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SCREENSHOT_SAVE_FILE_NAME"), CFSTR("Screenshot"), 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SCREENSHOT_SAVE_FILE_DATE_DELIMITER"), CFSTR("-"), 0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SCREENSHOT_SAVE_FILE_TIME_DELIMITER"), CFSTR("."), 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SCREENSHOT_SAVE_FILE_FORMAT"), CFSTR("%@ %@ at %@"), 0));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v9, v6, v7));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-")));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), v11));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), v13));

  return v19;
}

- (NSString)filename
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = objc_claimAutoreleasedReturnValue(-[SSSScreenshot userActivityTitle](self, "userActivityTitle"));
  if (!v3)
    goto LABEL_5;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshot _sanitizedFilenameString:](SSSScreenshot, "_sanitizedFilenameString:", v3));

  if (!objc_msgSend(v5, "length")
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5)),
        v6,
        !v6))
  {

LABEL_5:
    v5 = 0;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot environmentDescription](self, "environmentDescription", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "elements"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12), "bundleIdentifier"));
        v14 = objc_msgSend(v13, "isEqual:", CFSTR("com.apple.MobileSMS"));

        if (v14)
        {

          goto LABEL_17;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (v5)
    v15 = v5;
  else
LABEL_17:
    v15 = (id)objc_claimAutoreleasedReturnValue(+[SSSScreenshot nameForScreenshot:](SSSScreenshot, "nameForScreenshot:", self));
  v16 = v15;

  return (NSString *)v16;
}

+ (id)_sanitizedFilenameString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _BYTE *v8;
  uint64_t v9;
  id v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "length"))
  {
    v5 = v3;
    if ((unint64_t)objc_msgSend(v3, "length") >= 0x81)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", 128));

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("///\\?%*|\"<>:")));
    v7 = v5;
    v8 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v6);
    if (v8 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0;
    }
    else
    {
      v11 = v8;
      v12 = v9;
      v10 = 0;
      do
      {
        if (!v10)
          v10 = objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v10, "replaceCharactersInRange:withString:", v11, v12, &stru_1000937C8);
        v11 = objc_msgSend(v10, "rangeOfCharacterFromSet:options:range:", v6, 2, v11, (_BYTE *)objc_msgSend(v10, "length") - v11);
        v12 = v13;
      }
      while (v11 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL);
    }
    if (v10)
      v14 = v10;
    else
      v14 = v7;
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(".")));
    v17 = objc_msgSend(v16, "mutableCopy");

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    objc_msgSend(v17, "formUnionWithCharacterSet:", v18);

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v17));
  }

  return v4;
}

- (NSString)userActivityTitle
{
  void *v3;
  void *v4;
  int64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot environmentDescription](self, "environmentDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "elements"));

  v5 = -[SSSScreenshot _elementIndexForDocument](self, "_elementIndexForDocument");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "metadata", (_QWORD)v15));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userActivityTitle"));

        if (v12)
          break;
        if (v8 == (id)++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v12 = 0;
    }
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v5));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userActivityTitle"));

  }
  return (NSString *)v12;
}

- (NSArray)snapUnitRects
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  double v31;
  double v32;
  void *v33;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[6];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot environmentDescription](self, "environmentDescription"));
  objc_msgSend(v4, "imagePointSize");
  v6 = v5;
  v8 = v7;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot environmentDescription](self, "environmentDescription"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "elements"));

  obj = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v11)
  {
    v12 = v11;
    v36 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v36)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "rect");
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_10001B62C;
        v41[3] = &unk_100091DE0;
        v41[4] = v6;
        v41[5] = v8;
        v23 = objc_retainBlock(v41);
        ((void (*)(double, double, double, double))v23[2])(v16, v18, v20, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
        objc_msgSend(v3, "addObject:", v24);

        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metadata"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contentRects"));

        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v28; j = (char *)j + 1)
            {
              if (*(_QWORD *)v38 != v29)
                objc_enumerationMutation(v26);
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j), "CGRectValue");
              ((void (*)(_QWORD *, double, double))v23[2])(v23, v16 + v31, v18 + v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
              objc_msgSend(v3, "addObject:", v33);

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          }
          while (v28);
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v12);
  }

  return (NSArray *)v3;
}

- (PDFDocument)PDFDocument
{
  void *v3;
  void *v4;
  void *v5;
  PDFDocument *v6;
  PDFDocument *pdfDocument;
  id v8;
  void *v9;
  PDFDocument *v10;
  PDFDocument *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot documentGenerator](self, "documentGenerator"));

  if (!v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot documentGenerator](self, "documentGenerator")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot pdfData](self, "pdfData")),
        v6 = (PDFDocument *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "documentFromPDFData:", v5)),
        v5,
        v4,
        !v6))
  {
    pdfDocument = self->_pdfDocument;
    if (!pdfDocument)
    {
      v8 = objc_alloc((Class)PDFDocument);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot pdfData](self, "pdfData"));
      v10 = (PDFDocument *)objc_msgSend(v8, "initWithData:", v9);

      -[PDFDocument setDelegate:](v10, "setDelegate:", self);
      v11 = self->_pdfDocument;
      self->_pdfDocument = v10;

      pdfDocument = self->_pdfDocument;
    }
    v6 = pdfDocument;
  }
  return v6;
}

- (void)_harvestPDFIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *pdfViewModificationInfos;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  void *v16;
  id v17;
  NSMutableArray *v18;
  NSMutableArray *pdfModelModificationInfos;
  NSMutableArray *v20;
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSEnvironmentDescription elements](self->_environmentDescription, "elements"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v17 = -[SSSScreenshotModificationInfo initForScreenshotWithEnvironmentDescription:]([SSSScreenshotModificationInfo alloc], "initForScreenshotWithEnvironmentDescription:", self->_environmentDescription);
    v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v17));
    pdfModelModificationInfos = self->_pdfModelModificationInfos;
    self->_pdfModelModificationInfos = v18;

    v21 = -[SSSScreenshotModificationInfo initForScreenshotWithEnvironmentDescription:]([SSSScreenshotMutableModificationInfo alloc], "initForScreenshotWithEnvironmentDescription:", self->_environmentDescription);
    v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:"));
    pdfViewModificationInfos = self->_pdfViewModificationInfos;
    self->_pdfViewModificationInfos = v20;
LABEL_8:

    v5 = v21;
    goto LABEL_9;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot pdfData](self, "pdfData"));
  if (v5)
  {
    v21 = v5;
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pdfViewModificationInfos = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));
    v9 = (uint64_t)-[NSMutableArray pageCount](pdfViewModificationInfos, "pageCount");
    if (v9 >= 1)
    {
      v10 = v9;
      do
      {
        v11 = -[SSSScreenshotModificationInfo initForScreenshotWithEnvironmentDescription:]([SSSScreenshotModificationInfo alloc], "initForScreenshotWithEnvironmentDescription:", self->_environmentDescription);
        v12 = -[SSSScreenshotModificationInfo initForScreenshotWithEnvironmentDescription:]([SSSScreenshotMutableModificationInfo alloc], "initForScreenshotWithEnvironmentDescription:", self->_environmentDescription);
        objc_msgSend(v12, "setChangeObserver:", self);
        -[NSMutableArray addObject:](v6, "addObject:", v11);
        -[NSMutableArray addObject:](v7, "addObject:", v12);

        --v10;
      }
      while (v10);
    }
    v13 = self->_pdfModelModificationInfos;
    self->_pdfModelModificationInfos = v6;
    v14 = v6;

    v15 = self->_pdfViewModificationInfos;
    self->_pdfViewModificationInfos = v7;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot representation](self, "representation"));
    objc_msgSend(v16, "screenshotDidReceivePDFData");

    goto LABEL_8;
  }
LABEL_9:

}

- (void)removePDF
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFURL](self, "PDFURL"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFURL](self, "PDFURL"));
    -[SSSScreenshot _removeSecurityScopedURL:](self, "_removeSecurityScopedURL:", v4);

    -[SSSScreenshot setPDFURL:](self, "setPDFURL:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot temporaryPDFURL](self, "temporaryPDFURL"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot temporaryPDFURL](self, "temporaryPDFURL"));
    -[SSSScreenshot _removeURL:](self, "_removeURL:", v6);

    -[SSSScreenshot setTemporaryPDFURL:](self, "setTemporaryPDFURL:", 0);
  }
}

- (void)_removeURL:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  NSErrorDomain v8;
  NSErrorDomain v9;
  id v10;
  NSObject *v11;
  id v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v12 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v12);
  v6 = v12;
  v7 = v6;
  if (v6 || (v5 & 1) == 0)
  {
    v8 = (NSErrorDomain)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v9 = v8;
    if (v8 == NSCocoaErrorDomain)
    {
      v10 = objc_msgSend(v7, "code");

      if (v10 == (id)4)
      {
        v11 = os_log_create("com.apple.screenshotservices", "PDF");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          sub_100057A70();
        goto LABEL_10;
      }
    }
    else
    {

    }
    v11 = os_log_create("com.apple.screenshotservices", "PDF");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100057AD4();
LABEL_10:

  }
}

- (void)_removeSecurityScopedURL:(id)a3
{
  unsigned int v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "startAccessingSecurityScopedResource");
  -[SSSScreenshot _removeURL:](self, "_removeURL:", v5);
  if (v4)
    objc_msgSend(v5, "stopAccessingSecurityScopedResource");

}

- (void)savePDFWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  NSObject *pdfSavingQueue;
  _QWORD block[4];
  void (**v10)(_QWORD);
  id v11;
  id location;

  v4 = (void (**)(_QWORD))a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));
  if (v5 && (v6 = (void *)v5, v7 = -[SSSScreenshot isDeleted](self, "isDeleted"), v6, (v7 & 1) == 0))
  {
    self->_pdfIsSaving = 1;
    objc_initWeak(&location, self);
    pdfSavingQueue = self->_pdfSavingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BC1C;
    block[3] = &unk_100091E08;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    dispatch_async(pdfSavingQueue, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    v4[2](v4);
  }

}

- (id)editedPDFDataForShareSheet
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));

  if (v3)
  {
    -[SSSScreenshot _setDocumentIsSaving:](self, "_setDocumentIsSaving:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataRepresentation"));

    -[SSSScreenshot _setDocumentIsSaving:](self, "_setDocumentIsSaving:", 0);
  }
  return v3;
}

- (id)temporaryPDFFile
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot editedPDFDataForShareSheet](self, "editedPDFDataForShareSheet"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot _savePDFToTemporaryPathWithData:](self, "_savePDFToTemporaryPathWithData:", v3));
    -[SSSScreenshot setTemporaryPDFURL:](self, "setTemporaryPDFURL:", v4);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_savePDFToTemporaryPathWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  const __CFString *v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot filename](self, "filename"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("pdf")));

  if (!v6)
  {
    v7 = os_log_create("com.apple.screenshotservices", "Saving");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_100057B50(self, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshot nameForScreenshot:](SSSScreenshot, "nameForScreenshot:", self));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("pdf")));

  }
  v9 = NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", v6));

  v20 = 0;
  v13 = objc_msgSend(v4, "writeToURL:options:error:", v12, 1, &v20);

  v14 = v20;
  v15 = os_log_create("com.apple.screenshotservices", "PDF");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v19 = CFSTR("Could not save");
    *(_DWORD *)buf = 138412802;
    if (v13)
      v19 = CFSTR("Saved");
    v22 = v19;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@ PDF to %@ (%@)", buf, 0x20u);
  }

  if (v13)
    v16 = v12;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (void)q_saveEditedPDF
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  id location;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[5];
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C38C;
    block[3] = &unk_100091920;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataRepresentation"));

    v6 = os_log_create("com.apple.screenshotservices", "PDF");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_100057C44(v5, v6);

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10001C398;
    v37[3] = &unk_100091920;
    v37[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v37);

    if (v5)
    {
      v33 = 0;
      v34 = &v33;
      v35 = 0x2020000000;
      v36 = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFURL](self, "PDFURL"));
      v8 = v7;
      if (v7)
      {
        v9 = objc_msgSend(v7, "startAccessingSecurityScopedResource");
        v10 = objc_msgSend(objc_alloc((Class)NSFileCoordinator), "initWithFilePresenter:", 0);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10001C3A4;
        v29[3] = &unk_100091E30;
        v31 = &v33;
        v32 = 0;
        v30 = v5;
        objc_msgSend(v10, "coordinateWritingItemAtURL:options:error:byAccessor:", v8, 0, &v32, v29);
        v11 = v32;
        if (v9)
          objc_msgSend(v8, "stopAccessingSecurityScopedResource");
        v12 = os_log_create("com.apple.screenshotservices", "PDF");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          sub_100057BE0();

      }
      if (*((_BYTE *)v34 + 24))
      {
        v13 = v8;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot _savePDFToTemporaryPathWithData:](self, "_savePDFToTemporaryPathWithData:", v5));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v28 = 0;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_doc_importItemAtURL:toDestination:error:", v13, 1, &v28));
          v16 = v28;

          objc_initWeak(&location, self);
          v20 = _NSConcreteStackBlock;
          v21 = 3221225472;
          v22 = sub_10001C4D8;
          v23 = &unk_100091E58;
          objc_copyWeak(&v26, &location);
          v17 = v15;
          v24 = v17;
          v18 = v16;
          v25 = v18;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v20);

          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", v20, v21, v22, v23));
          objc_msgSend(v19, "removeItemAtURL:error:", v13, 0);

          objc_destroyWeak(&v26);
          objc_destroyWeak(&location);

        }
      }

      _Block_object_dispose(&v33, 8);
    }

  }
}

- (void)_setDocumentIsSaving:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  CGRect *savedCropBoxes;
  _QWORD *p_x;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  void *v33;
  id v34;
  CGRect *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CGRect v42;

  v3 = a3;
  if ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));

    if (v5)
    {
      if (v3 && !self->_savedCropBoxes)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));
        self->_savedCropBoxes = (CGRect *)malloc_type_calloc((size_t)objc_msgSend(v6, "pageCount"), 0x20uLL, 0x1000040E0EAB150uLL);

      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));
      v8 = objc_msgSend(v7, "pageCount");

      if (v8)
      {
        v9 = 0;
        v10 = 0;
        do
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument", v36, v37, v38, v39));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pageAtIndex:", v10));

          v13 = v12;
          if ((objc_opt_respondsToSelector(v13, "setIsSaving:") & 1) != 0)
            objc_msgSend(v13, "setIsSaving:", v3);
          savedCropBoxes = self->_savedCropBoxes;
          if (v3)
          {
            objc_msgSend(v13, "boundsForBox:", 1);
            p_x = (_QWORD *)&savedCropBoxes[v9].origin.x;
            *p_x = v16;
            p_x[1] = v17;
            p_x[2] = v18;
            p_x[3] = v19;
            objc_msgSend(v13, "boundsForBox:", 0);
            v21 = v20;
            v23 = v22;
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_pdfModelModificationInfos, "objectAtIndexedSubscript:", v10));
            v25 = v24;
            if (v24)
            {
              objc_msgSend(v24, "cropInfo");
              v27 = *((double *)&v40 + 1);
              v26 = *(double *)&v40;
              v28 = *((double *)&v41 + 1);
              v29 = *(double *)&v41;
              objc_msgSend(v25, "cropInfo");
              v30 = *((double *)&v36 + 1);
              v31 = *(double *)&v36;
            }
            else
            {
              v40 = 0u;
              v41 = 0u;
              v30 = 0.0;
              v38 = 0u;
              v39 = 0u;
              v31 = 0.0;
              v28 = 0.0;
              v29 = 0.0;
              v36 = 0u;
              v37 = 0u;
              v27 = 0.0;
              v26 = 0.0;
            }
            v42.origin.y = v23 * v27 / v30;
            v32 = v23 * v28 / v30;
            v42.origin.x = v21 * v26 / v31;
            v42.size.width = v21 * v29 / v31;
            v42.size.height = v32;
            objc_msgSend(v13, "setBounds:forBox:", 1, v42.origin.x, v23 - CGRectGetMaxY(v42), v42.size.width, v32);

          }
          else
          {
            objc_msgSend(v13, "setBounds:forBox:", 1, savedCropBoxes[v9].origin.x, savedCropBoxes[v9].origin.y, savedCropBoxes[v9].size.width, savedCropBoxes[v9].size.height);
          }

          ++v10;
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));
          v34 = objc_msgSend(v33, "pageCount");

          ++v9;
        }
        while ((unint64_t)v34 > v10);
      }
      if (!v3)
      {
        v35 = self->_savedCropBoxes;
        if (v35)
        {
          free(v35);
          self->_savedCropBoxes = 0;
        }
      }
    }
  }
}

- (BOOL)canAutosaveToFiles
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot environmentDescription](self, "environmentDescription"));
  v3 = objc_msgSend(v2, "canAutosaveToFiles");

  return v3;
}

- (BOOL)pdfCanBeConvertedToImage
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  os_log_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  NSObject *v22;
  int v24;
  int v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  uint64_t v33;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "pageCount");
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = 0.0;
      v8 = 0.0;
      while (1)
      {
        v9 = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pageAtIndex:", v6));
        -[NSObject boundsForBox:](v9, "boundsForBox:", 1);
        v11 = v10;
        v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v14, "scale");
        v16 = v11 * v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v17, "scale");
        v19 = v13 * v18;

        v7 = v7 + v19;
        v8 = fmax(v8, v16);
        v20 = v8 * v7;
        if (v8 * v7 > 50000000.0)
          break;

        if (v5 == (id)++v6)
          goto LABEL_9;
      }
      v22 = os_log_create("com.apple.screenshotservices", "Screenshot");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v24 = 67110144;
        v25 = 0;
        v26 = 2048;
        v27 = v7;
        v28 = 2048;
        v29 = v8;
        v30 = 2048;
        v31 = v8 * v7;
        v32 = 2048;
        v33 = 0x4187D78400000000;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "PDF to Image: canBeConverted: %u, partialHeight: %f, maxWidth: %f, size: %f, limit: %f", (uint8_t *)&v24, 0x30u);
      }

      v21 = 0;
    }
    else
    {
      v20 = 0.0;
      v8 = 0.0;
      v7 = 0.0;
LABEL_9:
      v9 = os_log_create("com.apple.screenshotservices", "Screenshot");
      v21 = 1;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v24 = 67110144;
        v25 = 1;
        v26 = 2048;
        v27 = v7;
        v28 = 2048;
        v29 = v8;
        v30 = 2048;
        v31 = v20;
        v32 = 2048;
        v33 = 0x4187D78400000000;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "PDF to Image: canBeConverted: %u, totalHeight: %f, maxWidth: %f, size: %f, limit: %f", (uint8_t *)&v24, 0x30u);
      }
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)pdfAsImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asImage"));

  return v3;
}

- (Class)classForPage
{
  return (Class)objc_opt_class(SSSPDFPage, a2);
}

- (void)deletePDFPage:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot representation](self, "representation"));
    v6 = objc_msgSend(v5, "screenshotPDFPageIndex:", v9);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot modelModificationInfoForState:](self, "modelModificationInfoForState:", 1, v6));
    v8 = +[SSSPDFPageUndoObject newPageUndoObjectWithPDFPage:index:modificationInfo:](SSSPDFPageUndoObject, "newPageUndoObjectWithPDFPage:index:modificationInfo:", v9, v6, v7);
    -[SSSScreenshot _deletePageInPDF:](self, "_deletePageInPDF:", v8);

  }
}

- (id)_actionNameForDeletePDFPage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DELETE_PDF_PAGE"), CFSTR("Delete Page"), 0));

  return v3;
}

- (void)_deletePageInPDF:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "index");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot representation](self, "representation"));
  objc_msgSend(v6, "screenshotDeletePDFPage:", v5);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshot undoManagerForEditMode:](self, "undoManagerForEditMode:", 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot _actionNameForDeletePDFPage](self, "_actionNameForDeletePDFPage"));
  objc_msgSend(v10, "setActionName:", v7);

  objc_msgSend(v10, "registerUndoWithTarget:selector:object:", self, "_addPageInPDF:", v4);
  -[NSMutableArray removeObjectAtIndex:](self->_pdfModelModificationInfos, "removeObjectAtIndex:", v5);
  -[NSMutableArray removeObjectAtIndex:](self->_pdfViewModificationInfos, "removeObjectAtIndex:", v5);
  if (v5)
    v8 = v5 - 1;
  else
    v8 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot representation](self, "representation"));
  objc_msgSend(v9, "screenshotShouldJumpToPDFPageIndex:", v8);

}

- (void)_addPageInPDF:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *pdfViewModificationInfos;
  id v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "index");
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modificationInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot representation](self, "representation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "page"));
  objc_msgSend(v6, "screenshotInsertPDFPage:pageIndex:", v7, objc_msgSend(v4, "index"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot undoManagerForEditMode:](self, "undoManagerForEditMode:", 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot _actionNameForDeletePDFPage](self, "_actionNameForDeletePDFPage"));
  objc_msgSend(v8, "setActionName:", v9);

  objc_msgSend(v8, "registerUndoWithTarget:selector:object:", self, "_deletePageInPDF:", v4);
  -[NSMutableArray insertObject:atIndex:](self->_pdfModelModificationInfos, "insertObject:atIndex:", v13, v5);
  pdfViewModificationInfos = self->_pdfViewModificationInfos;
  v11 = objc_msgSend(v13, "mutableCopy");
  -[NSMutableArray insertObject:atIndex:](pdfViewModificationInfos, "insertObject:atIndex:", v11, v5);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot representation](self, "representation"));
  objc_msgSend(v12, "screenshotShouldJumpToPDFPageIndex:", v5);

}

- (id)itemProviderForDragItems
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v13;
  double v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v3 = objc_alloc_init((Class)NSItemProvider);
  if (-[SSSScreenshot lastViewEditMode](self, "lastViewEditMode"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePDF, "identifier"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001D014;
    v15[3] = &unk_100091EA8;
    v15[4] = self;
    objc_msgSend(v3, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v5, 0, v15);

  }
  else
  {
    objc_opt_class(UIImage, v4);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001CF70;
    v16[3] = &unk_100091E80;
    v16[4] = self;
    objc_msgSend(v3, "registerObjectOfClass:visibility:loadHandler:", v6, 0, v16);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot filename](self, "filename"));
  objc_msgSend(v3, "setSuggestedName:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot modelModificationInfo](self, "modelModificationInfo"));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "cropInfo");
    v10 = v14;
    v11 = v13;
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
  }

  objc_msgSend(v3, "setPreferredPresentationSize:", v11, v10);
  return v3;
}

- (id)loggableDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot modelModificationInfo](self, "modelModificationInfo"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "cropInfo");
    v7 = v25;
    v6 = v24;
    v9 = v27;
    v8 = v26;
  }
  else
  {
    v9 = 0;
    v8 = 0;
    v7 = 0;
    v6 = 0;
  }
  v10 = NSStringFromCGRect(*(CGRect *)&v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("image crop: %@ "), v11));
  objc_msgSend(v3, "appendString:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot modelModificationInfo](self, "modelModificationInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "annotations"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("image # of annotations: %lu "), objc_msgSend(v14, "count")));
  objc_msgSend(v3, "appendString:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot modelModificationInfo](self, "modelModificationInfo"));
  objc_msgSend(v16, "vellumOpacity");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("image vellum opacity: %f "), v17));
  objc_msgSend(v3, "appendString:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot pdfData](self, "pdfData"));
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshot PDFDocument](self, "PDFDocument"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PDF %@ available with %lu pages"), v20, objc_msgSend(v21, "pageCount")));
    objc_msgSend(v3, "appendString:", v22);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("No PDFData available"));
  }
  return v3;
}

- (void)insertIntoQuickNoteWithCompletion:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  SYLinkContextClient *v7;
  SYLinkContextClient *linkContextClient;
  NSObject *pdfSavingQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id location[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  if (!self->_linkContextClient)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v5 = (void *)qword_1000AD740;
    v18 = qword_1000AD740;
    if (!qword_1000AD740)
    {
      location[0] = _NSConcreteStackBlock;
      location[1] = (id)3221225472;
      location[2] = sub_10001D838;
      location[3] = &unk_100091848;
      location[4] = &v15;
      sub_10001D838((uint64_t)location);
      v5 = (void *)v16[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v15, 8);
    v7 = (SYLinkContextClient *)objc_alloc_init(v6);
    linkContextClient = self->_linkContextClient;
    self->_linkContextClient = v7;

  }
  objc_initWeak(location, self);
  pdfSavingQueue = self->_pdfSavingQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001D3D0;
  v11[3] = &unk_100091AF8;
  objc_copyWeak(&v13, location);
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(pdfSavingQueue, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(location);
}

- (SSSScreenshotRepresentation)representation
{
  return (SSSScreenshotRepresentation *)objc_loadWeakRetained((id *)&self->_representation);
}

- (void)setRepresentation:(id)a3
{
  objc_storeWeak((id *)&self->_representation, a3);
}

- (SSSScreenshotImageGenerator)imageGenerator
{
  return (SSSScreenshotImageGenerator *)objc_loadWeakRetained((id *)&self->_imageGenerator);
}

- (void)setImageGenerator:(id)a3
{
  objc_storeWeak((id *)&self->_imageGenerator, a3);
}

- (SSSScreenshotPDFDocumentGenerator)documentGenerator
{
  return (SSSScreenshotPDFDocumentGenerator *)objc_loadWeakRetained((id *)&self->_documentGenerator);
}

- (void)setDocumentGenerator:(id)a3
{
  objc_storeWeak((id *)&self->_documentGenerator, a3);
}

- (SSEnvironmentDescription)environmentDescription
{
  return self->_environmentDescription;
}

- (SSSScreenshotModificationInfo)modelModificationInfo
{
  return self->_modelModificationInfo;
}

- (SSSScreenshotMutableModificationInfo)viewModificationInfo
{
  return self->_viewModificationInfo;
}

- (SSSScreenshotImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (SSSScreenshotItemProviderImage)itemProviderImage
{
  return self->_itemProviderImage;
}

- (SSSScreenshotItemProviderPDF)itemProviderPDF
{
  return self->_itemProviderPDF;
}

- (SSSScreenshotItemProviderPDFAsImage)itemProviderPDFAsImage
{
  return self->_itemProviderPDFAsImage;
}

- (BOOL)isPDFRequested
{
  return self->_isPDFRequested;
}

- (void)setIsPDFRequested:(BOOL)a3
{
  self->_isPDFRequested = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (int64_t)lastViewEditMode
{
  return self->_lastViewEditMode;
}

- (void)setLastViewEditMode:(int64_t)a3
{
  self->_lastViewEditMode = a3;
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_isDeleted = a3;
}

- (NSMutableArray)pdfModelModificationInfos
{
  return self->_pdfModelModificationInfos;
}

- (NSMutableArray)pdfViewModificationInfos
{
  return self->_pdfViewModificationInfos;
}

- (NSURL)PDFURL
{
  return self->_PDFURL;
}

- (void)setPDFURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSURL)temporaryPDFURL
{
  return self->_temporaryPDFURL;
}

- (void)setTemporaryPDFURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSMutableDictionary)elementPDFValidationDictionary
{
  return self->_elementPDFValidationDictionary;
}

- (void)setElementPDFValidationDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_elementPDFValidationDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementPDFValidationDictionary, 0);
  objc_storeStrong((id *)&self->_temporaryPDFURL, 0);
  objc_storeStrong((id *)&self->_PDFURL, 0);
  objc_storeStrong((id *)&self->_pdfViewModificationInfos, 0);
  objc_storeStrong((id *)&self->_pdfModelModificationInfos, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_viewModificationInfo, 0);
  objc_storeStrong((id *)&self->_modelModificationInfo, 0);
  objc_storeStrong((id *)&self->_environmentDescription, 0);
  objc_destroyWeak((id *)&self->_documentGenerator);
  objc_destroyWeak((id *)&self->_imageGenerator);
  objc_destroyWeak((id *)&self->_representation);
  objc_storeStrong((id *)&self->_linkContextClient, 0);
  objc_storeStrong((id *)&self->_pdfSavingQueue, 0);
  objc_storeStrong((id *)&self->_pdfDocument, 0);
  objc_storeStrong((id *)&self->_pdfUndoManager, 0);
  objc_storeStrong((id *)&self->_imageUndoManager, 0);
  objc_storeStrong((id *)&self->_itemProviderPDFAsImage, 0);
  objc_storeStrong((id *)&self->_itemProviderPDF, 0);
  objc_storeStrong((id *)&self->_itemProviderImage, 0);
  objc_storeStrong((id *)&self->_backingImage, 0);
}

@end
