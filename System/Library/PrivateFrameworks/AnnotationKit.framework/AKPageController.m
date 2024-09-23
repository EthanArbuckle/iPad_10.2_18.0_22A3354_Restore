@implementation AKPageController

+ (AKPageController)pageControllerWithController:(id)a3 andPageModelController:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithController:andPageModelController:", v7, v6);

  return (AKPageController *)v8;
}

- (id)_initWithController:(id)a3 andPageModelController:(id)a4
{
  id v6;
  id v7;
  AKPageController *v8;
  AKPageController *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AKPageController;
  v8 = -[AKPageController init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AKPageController setController:](v8, "setController:", v6);
    -[AKPageController setPageModelController:](v9, "setPageModelController:", v7);
    objc_msgSend(v6, "statisticsLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStatisticsLogger:", v10);

    -[AKPageController setPageIndex:](v9, "setPageIndex:", 0x7FFFFFFFFFFFFFFFLL);
    v11 = (void *)objc_opt_new();
    -[AKPageController setNoteEditors:](v9, "setNoteEditors:", v11);

    v12 = +[AKInkPageOverlayController newInkOverlayDrawingUndoTargetWithPageController:](AKInkPageOverlayController, "newInkOverlayDrawingUndoTargetWithPageController:", v9);
    -[AKPageController setInkOverlayDrawingUndoTarget:](v9, "setInkOverlayDrawingUndoTarget:", v12);

    -[AKPageController setGeometryHelper:](v9, "setGeometryHelper:", 0);
    -[AKPageController setLayerPresentationManager:](v9, "setLayerPresentationManager:", 0);
    -[AKPageController setInkPageOverlayController:](v9, "setInkPageOverlayController:", 0);
    -[AKPageController setOverlayView:](v9, "setOverlayView:", 0);
  }

  return v9;
}

- (id)initForTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKPageController;
  return -[AKPageController init](&v3, sel_init);
}

- (void)unregisterFromUndoManager:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AKPageController inkOverlayDrawingUndoTarget](self, "inkOverlayDrawingUndoTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKPageController inkOverlayDrawingUndoTarget](self, "inkOverlayDrawingUndoTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllActionsWithTarget:", v5);

  }
}

- (void)teardown
{
  -[AKPageController setNoteEditors:](self, "setNoteEditors:", 0);
  -[AKPageController setPageModelController:](self, "setPageModelController:", 0);
}

- (void)setupRelinquishables
{
  void *v3;
  AKGeometryHelper *v4;
  AKLayerPresentationManager *v5;
  _BOOL8 v6;
  void *v7;
  AKOverlayView *v8;
  AKInkPageOverlayController *v9;

  -[AKPageController geometryHelper](self, "geometryHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[AKGeometryHelper initWithPageController:]([AKGeometryHelper alloc], "initWithPageController:", self);
    -[AKPageController setGeometryHelper:](self, "setGeometryHelper:", v4);

    -[AKPageController setSuperviewDependentThingsWereSetUp:](self, "setSuperviewDependentThingsWereSetUp:", 0);
    v5 = -[AKLayerPresentationManager initWithPageController:]([AKLayerPresentationManager alloc], "initWithPageController:", self);
    -[AKPageController setLayerPresentationManager:](self, "setLayerPresentationManager:", v5);

    v6 = -[AKPageController shouldPixelate](self, "shouldPixelate");
    -[AKPageController layerPresentationManager](self, "layerPresentationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldPixelate:", v6);

    v8 = -[AKOverlayView initWithPageController:]([AKOverlayView alloc], "initWithPageController:", self);
    -[AKPageController setOverlayView:](self, "setOverlayView:", v8);

    v9 = -[AKInkPageOverlayController initWithPageController:]([AKInkPageOverlayController alloc], "initWithPageController:", self);
    -[AKPageController setInkPageOverlayController:](self, "setInkPageOverlayController:", v9);

  }
}

- (void)releaseRelinquishables
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[AKPageController controller](self, "controller");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textEditorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "annotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKPageController pageModelController](self, "pageModelController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "annotations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if (v7)
    {
      objc_msgSend(v11, "textEditorController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endEditing");

    }
  }
  if (-[AKPageController superviewDependentThingsWereSetUp](self, "superviewDependentThingsWereSetUp"))
  {
    -[AKPageController layerPresentationManager](self, "layerPresentationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "teardown");

    -[AKPageController inkPageOverlayController](self, "inkPageOverlayController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "teardown");

    -[AKPageController setSuperviewDependentThingsWereSetUp:](self, "setSuperviewDependentThingsWereSetUp:", 0);
  }
  -[AKPageController setOverlayView:](self, "setOverlayView:", 0);
  -[AKPageController setInkPageOverlayController:](self, "setInkPageOverlayController:", 0);
  -[AKPageController setLayerPresentationManager:](self, "setLayerPresentationManager:", 0);
  -[AKPageController setGeometryHelper:](self, "setGeometryHelper:", 0);

}

- (BOOL)relinquishablesAreLoaded
{
  void *v2;
  BOOL v3;

  -[AKPageController overlayView](self, "overlayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)overlayWasAddedToSuperview
{
  void *v3;
  void *v4;

  if (!-[AKPageController superviewDependentThingsWereSetUp](self, "superviewDependentThingsWereSetUp"))
  {
    -[AKPageController layerPresentationManager](self, "layerPresentationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setup");

    -[AKPageController inkPageOverlayController](self, "inkPageOverlayController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setup");

    -[AKPageController setSuperviewDependentThingsWereSetUp:](self, "setSuperviewDependentThingsWereSetUp:", 1);
  }
}

- (void)updateOverlayViewLayers
{
  id v2;

  -[AKPageController overlayView](self, "overlayView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateLayers");

}

- (void)updateScaleFactor:(double)a3 isLiveUpdate:(BOOL)a4 forceUpdate:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;

  v5 = a5;
  v6 = a4;
  -[AKPageController layerPresentationManager](self, "layerPresentationManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateScaleFactor:isLiveUpdate:forceUpdate:", v6, v5, a3);

}

- (int64_t)currentModelToScreenExifOrientation
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int64_t v7;
  _QWORD v9[5];
  id v10;

  -[AKPageController overlayView](self, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKPageController overlayView](self, "overlayView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_22903341C;
    v9[3] = &unk_24F1A7EB8;
    v9[4] = self;
    v10 = v5;
    v6 = v5;
    v7 = +[AKGeometryHelper exifOrientationWithConversionBlock:](AKGeometryHelper, "exifOrientationWithConversionBlock:", v9);

  }
  else
  {
    v6 = os_log_create("com.apple.annotationkit", "Page Controller");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_22907F9F0(self);

    v7 = 1;
  }

  return v7;
}

- (double)currentModelToScreenScaleFactor
{
  void *v3;
  void *v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double Width;
  double Height;
  double v37;
  CGRect v39;
  CGRect v40;

  -[AKPageController overlayView](self, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = os_log_create("com.apple.annotationkit", "Page Controller");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_22907FA68(self);

  }
  -[AKPageController convertRectFromModelToOverlay:](self, "convertRectFromModelToOverlay:", 0.0, 0.0, 1.0, 1.0);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[AKPageController overlayView](self, "overlayView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:toView:", v15, v7, v9, v11, v13);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v15, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "screen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "coordinateSpace");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertRect:toCoordinateSpace:", v26, v17, v19, v21, v23);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v39.origin.x = v28;
  v39.origin.y = v30;
  v39.size.width = v32;
  v39.size.height = v34;
  Width = CGRectGetWidth(v39);
  v40.origin.x = v28;
  v40.origin.y = v30;
  v40.size.width = v32;
  v40.size.height = v34;
  Height = CGRectGetHeight(v40);
  if (Width >= Height)
    v37 = Width;
  else
    v37 = Height;

  return v37;
}

- (AKControllerDelegateProtocol)delegate
{
  void *v2;
  void *v3;

  -[AKPageController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AKControllerDelegateProtocol *)v3;
}

- (CGPoint)convertPointFromOverlayToModel:(CGPoint)a3
{
  double y;
  double x;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  double v13;
  double v14;
  uint8_t v15[16];
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = -[AKPageController pageIndex](self, "pageIndex");
  -[AKPageController controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "convertPoint:fromOverlayToModelWithPageIndex:forAnnotationController:", v6, v7, x, y);
    x = v10;
    y = v11;
  }
  else
  {
    v12 = os_log_create("com.apple.annotationkit", "Page Controller");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_228FC0000, v12, OS_LOG_TYPE_INFO, "AKController instance did not have a delegate.", v15, 2u);
    }

  }
  v13 = x;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)convertPointFromModelToOverlay:(CGPoint)a3
{
  double y;
  double x;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  double v13;
  double v14;
  uint8_t v15[16];
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = -[AKPageController pageIndex](self, "pageIndex");
  -[AKPageController controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:", v6, v7, x, y);
    x = v10;
    y = v11;
  }
  else
  {
    v12 = os_log_create("com.apple.annotationkit", "Page Controller");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_228FC0000, v12, OS_LOG_TYPE_INFO, "AKController instance did not have a delegate.", v15, 2u);
    }

  }
  v13 = x;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGRect)convertRectFromOverlayToModel:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unint64_t v8;
  void *v9;
  void *v10;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint8_t v26[16];
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[AKPageController pageIndex](self, "pageIndex");
  -[AKPageController controller](self, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    MinX = CGRectGetMinX(v27);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    MinY = CGRectGetMinY(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    MaxX = CGRectGetMaxX(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    MaxY = CGRectGetMaxY(v30);
    objc_msgSend(v10, "convertPoint:fromOverlayToModelWithPageIndex:forAnnotationController:", v8, v9, MinX, MinY);
    v16 = v15;
    v18 = v17;
    objc_msgSend(v10, "convertPoint:fromOverlayToModelWithPageIndex:forAnnotationController:", v8, v9, MaxX, MaxY);
    v31.size.width = v19 - v16;
    v31.size.height = v20 - v18;
    v31.origin.x = v16;
    v31.origin.y = v18;
    v32 = CGRectStandardize(v31);
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;
  }
  else
  {
    v21 = os_log_create("com.apple.annotationkit", "Page Controller");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_228FC0000, v21, OS_LOG_TYPE_INFO, "AKController instance did not have a delegate.", v26, 2u);
    }

  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)convertRectFromModelToOverlay:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unint64_t v8;
  void *v9;
  void *v10;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint8_t v26[16];
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[AKPageController pageIndex](self, "pageIndex");
  -[AKPageController controller](self, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    MinX = CGRectGetMinX(v27);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    MinY = CGRectGetMinY(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    MaxX = CGRectGetMaxX(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    MaxY = CGRectGetMaxY(v30);
    objc_msgSend(v10, "convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:", v8, v9, MinX, MinY);
    v16 = v15;
    v18 = v17;
    objc_msgSend(v10, "convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:", v8, v9, MaxX, MaxY);
    v31.size.width = v19 - v16;
    v31.size.height = v20 - v18;
    v31.origin.x = v16;
    v31.origin.y = v18;
    v32 = CGRectStandardize(v31);
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;
  }
  else
  {
    v21 = os_log_create("com.apple.annotationkit", "Page Controller");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_228FC0000, v21, OS_LOG_TYPE_INFO, "AKController instance did not have a delegate.", v26, 2u);
    }

  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)maxPageRect
{
  void *v3;
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
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[AKPageController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxPageRectWithPageIndex:forAnnotationController:", -[AKPageController pageIndex](self, "pageIndex"), v3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)newContentSnapshotPDFDataAtScale:(double)a3 inRect:(CGRect)a4 forLoupeAnnotation:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFData *Mutable;
  __CFData *v17;
  CGDataConsumerRef v18;
  CGDataConsumer *v19;
  CGDataProvider *v20;
  CGPDFDocument *v21;
  CGPDFPage *Page;
  CGPDFPage *v23;
  char v24;
  NSObject *v25;
  CGContext *v26;
  CGContext *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  CGFloat v40;
  CGFloat v41;
  __CFData *v42;
  void *v44;
  void *v45;
  id v46;
  CGPDFDocument *document;
  CGDataConsumer *consumer;
  CGDataProvider *provider;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CGRect mediaBox;
  _BYTE v55[128];
  uint64_t v56;
  CGRect v57;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v56 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  -[AKPageController controller](self, "controller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "newContentSnapshotPDFDataIncludingAdornments:atScale:inRect:onOverlayAtPageIndex:forAnnotationController:", 1, -[AKPageController pageIndex](self, "pageIndex"), v12, a3, x, y, width, height);
  -[AKPageController annotationsBeneathLoupe:](self, "annotationsBeneathLoupe:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {
    v17 = v14;
    goto LABEL_30;
  }
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v17 = Mutable;
  if (Mutable)
  {
    v18 = CGDataConsumerCreateWithCFData(Mutable);
    if (v18)
    {
      v19 = v18;
      memset(&mediaBox, 0, sizeof(mediaBox));
      v20 = CGDataProviderCreateWithCFData((CFDataRef)v14);
      provider = v20;
      if (v20 && (v21 = CGPDFDocumentCreateWithProvider(v20)) != 0)
      {
        document = v21;
        Page = CGPDFDocumentGetPage(v21, 1uLL);
        if (Page)
        {
          v23 = Page;
          v24 = 0;
          mediaBox = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
LABEL_13:
          consumer = v19;
          v26 = CGPDFContextCreate(v19, &mediaBox, 0);
          if (v26)
          {
            v27 = v26;
            v44 = v14;
            v45 = v13;
            v46 = v11;
            CGPDFContextBeginPage(v26, 0);
            CGContextSaveGState(v27);
            if ((v24 & 1) == 0)
              CGContextDrawPDFPage(v27, v23);
            CGContextTranslateCTM(v27, mediaBox.origin.x, mediaBox.origin.y);
            CGContextScaleCTM(v27, mediaBox.size.width, mediaBox.size.height);
            -[AKPageController convertRectFromOverlayToModel:](self, "convertRectFromOverlayToModel:", x, y, width, height);
            v29 = v28;
            v31 = v30;
            CGContextScaleCTM(v27, 1.0 / v32, 1.0 / v33);
            CGContextTranslateCTM(v27, -v29, -v31);
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v34 = v15;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v51;
              do
              {
                for (i = 0; i != v36; ++i)
                {
                  if (*(_QWORD *)v51 != v37)
                    objc_enumerationMutation(v34);
                  v39 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                  CGContextSaveGState(v27);
                  objc_msgSend(v39, "integralDrawingBounds");
                  v40 = v57.origin.x;
                  v41 = v57.origin.y;
                  if (!CGRectIsInfinite(v57))
                    CGContextTranslateCTM(v27, v40, v41);
                  +[AKController renderAnnotation:inContext:](AKController, "renderAnnotation:inContext:", v39, v27, v44, v45, v46);
                  CGContextRestoreGState(v27);
                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
              }
              while (v36);
            }

            CGContextRestoreGState(v27);
            CGPDFContextEndPage(v27);
            CGPDFContextClose(v27);
            CGContextRelease(v27);
            v13 = v45;
            v11 = v46;
            v14 = v44;
          }
          CGDataConsumerRelease(consumer);
          if (document)
            CGPDFDocumentRelease(document);
          if (provider)
            CGDataProviderRelease(provider);
          goto LABEL_30;
        }
      }
      else
      {
        document = 0;
      }
      mediaBox.origin.x = 0.0;
      mediaBox.origin.y = 0.0;
      mediaBox.size.width = width;
      mediaBox.size.height = height;
      v25 = os_log_create("com.apple.annotationkit", "Page Controller");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        sub_22907FAE0(v25);

      v23 = 0;
      v24 = 1;
      goto LABEL_13;
    }
  }
LABEL_30:
  v42 = v17;

  return v42;
}

- (id)annotationsBeneathLoupe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPageController pageModelController](self, "pageModelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "annotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(v8);
      v13 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * v12);
      if (v13 == v4)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v13, "drawingBounds", (_QWORD)v27);
          v15 = v14;
          v17 = v16;
          v19 = v18;
          v21 = v20;
          objc_msgSend(v4, "drawingBounds");
          v34.origin.x = v22;
          v34.origin.y = v23;
          v34.size.width = v24;
          v34.size.height = v25;
          v33.origin.x = v15;
          v33.origin.y = v17;
          v33.size.width = v19;
          v33.size.height = v21;
          if (CGRectIntersectsRect(v33, v34))
            objc_msgSend(v5, "addObject:", v13);
        }
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  return v5;
}

- (double)modelBaseScaleFactor
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = -[AKPageController pageIndex](self, "pageIndex");
  -[AKPageController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "modelBaseScaleFactorOfPageAtIndex:forAnnotationController:", v3, v4);
    v6 = v7;
  }

  return v6;
}

- (CGRect)visibleRectOfOverlay
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat x;
  double v16;
  CGFloat y;
  double v18;
  CGFloat width;
  double v20;
  CGFloat height;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect result;
  CGRect v41;

  -[AKPageController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPageController overlayView](self, "overlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "akVisibleRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[AKPageController convertRectFromOverlayToModel:](self, "convertRectFromOverlayToModel:", v7, v9, v11, v13);
  x = v14;
  y = v16;
  width = v18;
  height = v20;
  if (+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
  {
    -[AKPageController maxPageRect](self, "maxPageRect");
    x = v22;
    y = v23;
    width = v24;
    height = v25;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "visibleRectOfOverlayAtPageIndex:forAnnotationController:", -[AKPageController pageIndex](self, "pageIndex"), v3);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
    {
      v38.origin.x = v27;
      v38.origin.y = v29;
      v38.size.width = v31;
      v38.size.height = v33;
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = width;
      v41.size.height = height;
      v39 = CGRectIntersection(v38, v41);
      x = v39.origin.x;
      y = v39.origin.y;
      width = v39.size.width;
      height = v39.size.height;
    }
  }

  v34 = x;
  v35 = y;
  v36 = width;
  v37 = height;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (void)openPopoverForHighlightAnnotation:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  AKHighlightColorEditorController *v28;
  id v29;

  v4 = a3;
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[AKHighlightAppearanceHelper attributeTagForHighlightOfColor:](AKHighlightAppearanceHelper, "attributeTagForHighlightOfColor:", v5);

  v7 = +[AKHighlightAppearanceHelper annotationStyleForHighlightAttributeWithTag:](AKHighlightAppearanceHelper, "annotationStyleForHighlightAttributeWithTag:", v6);
  if (v7)
    v8 = v7;
  else
    v8 = 3;
  +[AKAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AKAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", v8, 0, objc_msgSend(v4, "style") == 2);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[AKPageController _popoverPresentingViewController](self, "_popoverPresentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "integralDrawingBounds");
  -[AKPageController convertRectFromModelToOverlay:](self, "convertRectFromModelToOverlay:");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[AKPageController overlayView](self, "overlayView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertRect:toView:", v10, v12, v14, v16, v18);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = -[AKHighlightColorEditorController initWithNibName:bundle:]([AKHighlightColorEditorController alloc], "initWithNibName:bundle:", 0, 0);
  -[AKHighlightColorEditorController setDelegate:](v28, "setDelegate:", self);
  -[AKAnnotationPopoverViewController setAnnotationTheme:](v28, "setAnnotationTheme:", v29);
  -[AKHighlightColorEditorController setPageTheme:](v28, "setPageTheme:", 0);
  -[AKAnnotationPopoverViewController setAnnotation:](v28, "setAnnotation:", v4);

  -[AKAnnotationPopoverViewController setAnnotationPageController:](v28, "setAnnotationPageController:", self);
  -[AKHighlightColorEditorController presentFromRect:view:](v28, "presentFromRect:view:", v10, v21, v23, v25, v27);

}

- (void)editorController:(id)a3 editNote:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  objc_msgSend(v5, "childAnnotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[AKPageController addPopupToAnnotation:openPopup:](self, "addPopupToAnnotation:openPopup:", v5, 0);
    objc_msgSend(v5, "childAnnotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2290346A4;
  v8[3] = &unk_24F1A76F8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

- (void)editorController:(id)a3 setTheme:(id)a4 forAnnotation:(id)a5
{
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  AKMinimalUserInterfaceItem *v19;
  void *v20;
  id v21;

  v6 = 765200;
  v21 = a4;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = 765201;
LABEL_12:
    v19 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalUserInterfaceItem alloc], "initWithTag:", v6);
    -[AKPageController controller](self, "controller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "performActionForSender:", v19);

    goto LABEL_13;
  }
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_isKindOfClass();

  if ((v10 & 1) != 0)
  {
    v6 = 765202;
    goto LABEL_12;
  }
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0)
    goto LABEL_12;
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) != 0)
  {
    v6 = 765203;
    goto LABEL_12;
  }
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_isKindOfClass();

  if ((v16 & 1) != 0)
  {
    v6 = 765204;
    goto LABEL_12;
  }
  objc_opt_self();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) != 0)
  {
    v6 = 765206;
    goto LABEL_12;
  }
LABEL_13:

}

- (void)editorController:(id)a3 deleteAnnotation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[AKPageController pageModelController](self, "pageModelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutableArrayValueForKey:", CFSTR("annotations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v9);

  if (objc_msgSend(v9, "conformsToAKParentAnnotationProtocol"))
  {
    objc_msgSend(v9, "childAnnotation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "mutableArrayValueForKey:", CFSTR("annotations"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v7);

    }
  }

}

- (BOOL)editorController:(id)a3 isRightArrowEnabledForAnnotation:(id)a4
{
  return 0;
}

- (void)addPopupToAnnotation:(id)a3 openPopup:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a4;
  v6 = a3;
  v7 = +[AKNoteAnnotationHelper newPopupAnnotationWithParent:onPageController:](AKNoteAnnotationHelper, "newPopupAnnotationWithParent:onPageController:", v6, self);
  if (v7)
  {
    -[AKPageController controller](self, "controller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toolController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addNewAnnotation:onPageController:shouldSelect:shouldCascade:", v7, self, 0, 0);

    objc_msgSend(v7, "setParentAnnotation:", v6);
    objc_msgSend(v6, "setChildAnnotation:", v7);
    if (v4)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = sub_229034A1C;
      v10[3] = &unk_24F1A76F8;
      v10[4] = self;
      v11 = v7;
      dispatch_async(MEMORY[0x24BDAC9B8], v10);

    }
  }

}

- (void)removeNoteFromAnnotation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "childAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AKPageController pageModelController](self, "pageModelController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mutableArrayValueForKey:", CFSTR("annotations"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v4);

    objc_msgSend(v7, "setChildAnnotation:", 0);
  }

}

- (void)openPopupAnnotation:(id)a3
{
  void *v4;
  void *v5;
  AKNoteEditorController *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AKPageController noteEditors](self, "noteEditors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (AKNoteEditorController *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = objc_alloc_init(AKNoteEditorController);
    -[AKPageController noteEditors](self, "noteEditors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);

    -[AKNoteEditorController setAnnotation:](v6, "setAnnotation:", v9);
    -[AKNoteEditorController setDelegate:](v6, "setDelegate:", self);
  }
  -[AKNoteEditorController show:](v6, "show:", 1);
  -[AKNoteEditorController beginEditing:](v6, "beginEditing:", 1);

}

- (void)noteEditorDidFinishEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "annotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "editedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContents:", v5);

  objc_msgSend(v4, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    objc_msgSend(v4, "parentAnnotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKPageController removeNoteFromAnnotation:](self, "removeNoteFromAnnotation:", v8);

  }
  -[AKPageController noteEditors](self, "noteEditors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v10);

  objc_msgSend(v11, "hide");
}

- (unint64_t)edgeForNoteEditor:(id)a3
{
  return 1;
}

- (id)stickyContainerForNoteEditor:(id)a3
{
  void *v3;
  void *v4;

  -[AKPageController _popoverPresentingViewController](self, "_popoverPresentingViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)stickyViewFrameForNoteEditor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  double v10;
  double v11;
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
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentAnnotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "visualStyle"))
  {
    v7 = v5;
  }
  else
  {
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v10 = *MEMORY[0x24BDBF090];
      v11 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
      goto LABEL_7;
    }
    v7 = v6;
  }
  objc_msgSend(v7, "rectangle");
LABEL_7:
  -[AKPageController convertRectFromModelToOverlay:](self, "convertRectFromModelToOverlay:", v10, v11, v12, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[AKPageController overlayView](self, "overlayView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPageController stickyContainerForNoteEditor:](self, "stickyContainerForNoteEditor:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "convertRect:toView:", v23, v15, v17, v19, v21);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = v25;
  v33 = v27;
  v34 = v29;
  v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (void)noteEditorWillPresentFullScreen:(id)a3
{
  void *v3;
  id v4;

  -[AKPageController controller](self, "controller", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "controllerWillShowSignatureCaptureView:", v4);

}

- (void)noteEditorWillDismissFromFullScreen:(id)a3
{
  void *v3;
  id v4;

  -[AKPageController controller](self, "controller", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "controllerWillDismissSignatureCaptureView:", v4);

}

- (BOOL)handleEditAnnotation:(id)a3
{
  return 0;
}

- (void)_updateOverlayVisibilityWithToolPicker:(id)a3 visible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  _BOOL4 v32;
  _BYTE v33[128];
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPageController overlayView](self, "overlayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AKPageController overlayView](self, "overlayView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  -[AKPageController inkPageOverlayController](self, "inkPageOverlayController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inkOverlayView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AKPageController inkPageOverlayController](self, "inkPageOverlayController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inkOverlayView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v24;
    *(_QWORD *)&v16 = 138412802;
    v22 = v16;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v6, "setVisible:forFirstResponder:", v4, v20, v22, (_QWORD)v23);
        v21 = os_log_create("com.apple.annotationkit", "AKPageController");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v22;
          v28 = v20;
          v29 = 2112;
          v30 = v6;
          v31 = 1024;
          v32 = v4;
          _os_log_impl(&dword_228FC0000, v21, OS_LOG_TYPE_DEFAULT, "Updated visibility for overlay: %@, with toolpicker: %@, to visible: %d", buf, 0x1Cu);
        }

      }
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v17);
  }

}

- (id)_popoverPresentingViewController
{
  void *v2;
  void *v3;
  void *v4;

  -[AKPageController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popoverPresentingViewControllerForAnnotationController:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (AKPageModelController)pageModelController
{
  return (AKPageModelController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPageModelController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndex = a3;
}

- (BOOL)shouldPixelate
{
  return self->_shouldPixelate;
}

- (void)setShouldPixelate:(BOOL)a3
{
  self->_shouldPixelate = a3;
}

- (AKGeometryHelper)geometryHelper
{
  return self->_geometryHelper;
}

- (void)setGeometryHelper:(id)a3
{
  objc_storeStrong((id *)&self->_geometryHelper, a3);
}

- (AKLayerPresentationManager)layerPresentationManager
{
  return self->_layerPresentationManager;
}

- (void)setLayerPresentationManager:(id)a3
{
  objc_storeStrong((id *)&self->_layerPresentationManager, a3);
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (AKInkPageOverlayController)inkPageOverlayController
{
  return self->_inkPageOverlayController;
}

- (void)setInkPageOverlayController:(id)a3
{
  objc_storeStrong((id *)&self->_inkPageOverlayController, a3);
}

- (id)inkOverlayDrawingUndoTarget
{
  return self->_inkOverlayDrawingUndoTarget;
}

- (void)setInkOverlayDrawingUndoTarget:(id)a3
{
  objc_storeStrong(&self->_inkOverlayDrawingUndoTarget, a3);
}

- (AKHighlightColorEditorController)highlightColorEditorController
{
  return self->_highlightColorEditorController;
}

- (BOOL)superviewDependentThingsWereSetUp
{
  return self->_superviewDependentThingsWereSetUp;
}

- (void)setSuperviewDependentThingsWereSetUp:(BOOL)a3
{
  self->_superviewDependentThingsWereSetUp = a3;
}

- (NSMutableDictionary)noteEditors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNoteEditors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteEditors, 0);
  objc_storeStrong((id *)&self->_highlightColorEditorController, 0);
  objc_storeStrong(&self->_inkOverlayDrawingUndoTarget, 0);
  objc_storeStrong((id *)&self->_inkPageOverlayController, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_layerPresentationManager, 0);
  objc_storeStrong((id *)&self->_geometryHelper, 0);
  objc_storeStrong((id *)&self->_pageModelController, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end
