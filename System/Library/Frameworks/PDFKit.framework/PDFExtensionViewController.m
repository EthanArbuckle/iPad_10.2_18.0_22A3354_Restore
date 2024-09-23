@implementation PDFExtensionViewController

- (PDFExtensionViewController)init
{
  PDFExtensionViewController *v2;
  PDFExtensionViewControllerPrivate *v3;
  PDFExtensionViewControllerPrivate *v4;
  PDFExtensionViewControllerPrivate *v5;
  NSString *searchString;
  PDFExtensionViewControllerPrivate *v7;
  PDFSelection *searchSelection;
  uint64_t v9;
  PDFExtensionViewControllerPrivate *v10;
  NSMutableArray *searchResults;
  CGPoint v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PDFExtensionViewController;
  v2 = -[PDFExtensionViewController init](&v25, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PDFExtensionViewControllerPrivate);
    v4 = v2->_private;
    v2->_private = v3;

    v5 = v2->_private;
    searchString = v5->searchString;
    v5->searchString = 0;

    v7 = v2->_private;
    searchSelection = v7->searchSelection;
    v7->searchSelection = 0;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v2->_private;
    searchResults = v10->searchResults;
    v10->searchResults = (NSMutableArray *)v9;

    v2->_private->didCancelActiveSearch = 0;
    v2->_private->currentGestureState = 3;
    v2->_private->hasSelection = 0;
    v12 = (CGPoint)*MEMORY[0x24BDBEFB0];
    v2->_private->topLeftSelectionPoint = (CGPoint)*MEMORY[0x24BDBEFB0];
    v2->_private->bottomRightSelectionPoint = v12;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel__pageChangedNotification_, CFSTR("PDFViewChangedPage"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__goToPage_, CFSTR("PDFExtensionViewGoToPage"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__goToDestination_, CFSTR("PDFExtensionViewGoToDestination"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, sel__pdfViewZoomToRect_, CFSTR("PDFExtensionViewZoomToRect"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel__selectionChangedNotification_, CFSTR("PDFViewSelectionChanged"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, sel__selectionPointsChangedNotification_, CFSTR("PDFTextSelectionDidChangeTextSelectionPoints"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel__textSelectionShowTextSelectionMenu_, CFSTR("PDFTextSelectionShowTextSelectionMenu"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v2, sel__textSelectionDidCopyStringNotification_, CFSTR("PDFTextSelectionDidCopyString"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v2, sel__textSelectionDidCopyDataNotification_, CFSTR("PDFTextSelectionDidCopyData"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v2, sel__annotationHitNotification_, CFSTR("PDFViewAnnotationHit"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v2, sel__annotationLongPressNotification_, CFSTR("PDFExtensionViewAnnotationLongPress"), 0);

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PDFExtensionViewControllerPrivate *v8;
  PDFHostProtocol *hostProxy;
  PDFView *v10;
  void *v11;
  uint64_t v12;
  PDFExtensionViewControllerPrivate *v13;
  PDFView *pdfView;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PDFExtensionViewController;
  -[PDFExtensionViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[PDFExtensionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PDFExtensionViewController extensionContext](self, "extensionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExtensionViewController:", self);
  objc_msgSend(v5, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = self->_private;
  hostProxy = v8->hostProxy;
  v8->hostProxy = (PDFHostProtocol *)v7;

  v10 = [PDFView alloc];
  -[PDFExtensionViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = -[PDFView initWithFrame:](v10, "initWithFrame:");
  v13 = self->_private;
  pdfView = v13->pdfView;
  v13->pdfView = (PDFView *)v12;

  -[PDFExtensionViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_private->pdfView);

  -[PDFView setDisplayMode:](self->_private->pdfView, "setDisplayMode:", 1);
  -[PDFView setAutoScales:](self->_private->pdfView, "setAutoScales:", 0);
  -[PDFView setScrollViewScrollEnabled:](self->_private->pdfView, "setScrollViewScrollEnabled:", 0);
  -[PDFView setPageBreakMargins:](self->_private->pdfView, "setPageBreakMargins:", 6.0, 4.0, 6.0, 4.0);
  -[PDFView setDocumentMargins:](self->_private->pdfView, "setDocumentMargins:", 6.0, 8.0, 6.0, 8.0);
  -[PDFView setIsUsingPDFExtensionView:](self->_private->pdfView, "setIsUsingPDFExtensionView:", 1);

}

- (void)setupPDFView
{
  PDFExtensionViewControllerPrivate *v3;
  CGFloat v4;
  CGFloat v5;
  __n128 v6;
  __n128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v3 = self->_private;
  -[PDFView pdfDocumentViewSize](v3->pdfView, "pdfDocumentViewSize");
  v3->documentViewSize.width = v4;
  v3->documentViewSize.height = v5;
  v6.n128_u64[0] = 0;
  v7.n128_u64[0] = 0;
  v8 = PDFRectMake(v6, v7, self->_private->documentViewSize.width, self->_private->documentViewSize.height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PDFExtensionViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  -[PDFView setFrame:](self->_private->pdfView, "setFrame:", v8, v10, v12, v14);
  -[PDFExtensionViewController _setupDocumentViewSize](self, "_setupDocumentViewSize");
  -[PDFExtensionViewController _updatePageCount](self, "_updatePageCount");
}

- (void)setDocumentData:(id)a3
{
  id v4;
  PDFDocument *v5;
  void *v6;
  char v7;
  PDFHostProtocol *hostProxy;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[PDFDocument initWithData:]([PDFDocument alloc], "initWithData:", v4);

  if (v5)
  {
    -[PDFDocument setDelegate:](v5, "setDelegate:", self);
    -[PDFView setDocument:](self->_private->pdfView, "setDocument:", v5);
    -[PDFView setMinScaleFactor:](self->_private->pdfView, "setMinScaleFactor:", 1.0);
    -[PDFView setMaxScaleFactor:](self->_private->pdfView, "setMaxScaleFactor:", 5.0);
    -[PDFView document](self->_private->pdfView, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isLocked");

    if ((v7 & 1) != 0)
    {
      hostProxy = self->_private->hostProxy;
      v11[0] = CFSTR("function");
      v11[1] = CFSTR("isLocked");
      v12[0] = CFSTR("documentIsLocked");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v10);

    }
    else
    {
      -[PDFExtensionViewController setupPDFView](self, "setupPDFView");
    }
  }
  else
  {
    -[PDFHostProtocol extensionToHost:](self->_private->hostProxy, "extensionToHost:", &unk_24C27DB40);
  }

}

- (void)findString:(id)a3 withOptions:(unint64_t)a4
{
  PDFExtensionViewControllerPrivate *v7;
  PDFSelection *searchSelection;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "isEqualToString:", self->_private->searchString) & 1) == 0)
  {
    v7 = self->_private;
    searchSelection = v7->searchSelection;
    v7->searchSelection = 0;

    objc_storeStrong((id *)&self->_private->searchString, a3);
    -[PDFExtensionViewController clearSearchHighlights](self, "clearSearchHighlights");
  }
  -[PDFView document](self->_private->pdfView, "document");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginFindString:withOptions:", self->_private->searchString, a4);

}

- (void)cancelFindString
{
  void *v3;

  self->_private->didCancelActiveSearch = 1;
  -[PDFView document](self->_private->pdfView, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelFindString");

  self->_private->didCancelActiveSearch = 0;
  -[PDFExtensionViewController clearSearchHighlights](self, "clearSearchHighlights");
}

- (void)cancelFindStringWithHighlightsCleared:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  self->_private->didCancelActiveSearch = 1;
  -[PDFView document](self->_private->pdfView, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelFindString");

  self->_private->didCancelActiveSearch = 0;
  if (v3)
    -[PDFExtensionViewController clearSearchHighlights](self, "clearSearchHighlights");
}

- (void)focusOnSearchResultAtIndex:(unint64_t)a3
{
  uint64_t v5;
  PDFExtensionViewControllerPrivate *v6;
  PDFSelection *searchSelection;
  PDFExtensionViewControllerPrivate *v8;
  PDFView *pdfView;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PDFHostProtocol *hostProxy;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[4];
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_private->searchResults, "count") > a3)
  {
    -[NSMutableArray objectAtIndex:](self->_private->searchResults, "objectAtIndex:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = self->_private;
    searchSelection = v6->searchSelection;
    v6->searchSelection = (PDFSelection *)v5;

    v8 = self->_private;
    pdfView = v8->pdfView;
    v40[0] = v8->searchSelection;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView setHighlightedSelections:](pdfView, "setHighlightedSelections:", v10);

    -[PDFSelection pages](self->_private->searchSelection, "pages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[PDFSelection boundsForPage:](self->_private->searchSelection, "boundsForPage:", v12);
      -[PDFView convertRect:fromPage:](self->_private->pdfView, "convertRect:fromPage:", v12);
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[PDFExtensionViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "convertRect:fromView:", self->_private->pdfView, v14, v16, v18, v20);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v30;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v31;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2] = v32;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v39[3] = v33;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      hostProxy = self->_private->hostProxy;
      v37[0] = CFSTR("function");
      v37[1] = CFSTR("selectionRect");
      v38[0] = CFSTR("showSelectionRect");
      v38[1] = v34;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v36);

    }
  }
}

- (void)clearSearchHighlights
{
  PDFExtensionViewControllerPrivate *v3;
  PDFSelection *searchSelection;

  v3 = self->_private;
  searchSelection = v3->searchSelection;
  v3->searchSelection = 0;

  -[NSMutableArray removeAllObjects](self->_private->searchResults, "removeAllObjects");
  -[PDFView setHighlightedSelections:](self->_private->pdfView, "setHighlightedSelections:", 0);
}

- (void)goToPageIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[PDFView document](self->_private->pdfView, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageAtIndex:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    -[PDFView goToPage:](self->_private->pdfView, "goToPage:", v7);
    v6 = v7;
  }

}

- (uint64_t)updatePDFViewLayout:(double)a3 scrollViewFrame:(double)a4 safeAreaInsets:(double)a5 zoomScale:(double)a6
{
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  __n128 v30;
  __n128 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  BOOL v44;
  void *v45;
  __n128 v46;
  __n128 v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGRect v65;
  CGRect v66;

  v23 = PDFRectScale(a10, a11, a12, a13, 1.0 / a14);
  v25 = v24;
  v26 = a1[121];
  v28 = v27 + v24 + *(double *)(v26 + 24);
  v30.n128_u64[0] = 0;
  v31.n128_u64[0] = 0;
  v32 = PDFRectMake(v30, v31, v28, v29 + v23 + *(double *)(v26 + 32));
  v34 = v33;
  v36 = v35;
  v38 = v37;
  objc_msgSend(a1, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "frame");
  v66.origin.x = v40;
  v66.origin.y = v41;
  v66.size.width = v42;
  v66.size.height = v43;
  v65.origin.x = v32;
  v65.origin.y = v34;
  v65.size.width = v36;
  v65.size.height = v38;
  v44 = PDFRectEqualToRect(v65, v66);

  if (!v44)
  {
    objc_msgSend(a1, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFrame:", v32, v34, v36, v38);

    objc_msgSend(*(id *)(a1[121] + 8), "extensionToHost:", &unk_24C27DB68);
  }
  objc_msgSend(*(id *)(a1[121] + 16), "frame");
  if (vabdd_f64(v25, v46.n128_f64[0]) > 0.00000011920929
    || (objc_msgSend(*(id *)(a1[121] + 16), "frame"), vabdd_f64(v23, v47.n128_f64[0]) > 0.00000011920929))
  {
    v46.n128_f64[0] = v25;
    v47.n128_f64[0] = v23;
    objc_msgSend(*(id *)(a1[121] + 16), "setFrame:", PDFRectMake(v46, v47, *(double *)(a1[121] + 24), *(double *)(a1[121] + 32)));
  }
  objc_msgSend(a1, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "convertRect:toView:", *(_QWORD *)(a1[121] + 16), a2, a3, a4, a5);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;

  return objc_msgSend(*(id *)(a1[121] + 16), "updatePDFViewLayout:scrollViewFrame:zoomScale:", v50, v52, v54, v56, a6, a7, a8, a9);
}

- (void)setMinimumZoomScale:(double)a3
{
  -[PDFView setMinScaleFactor:](self->_private->pdfView, "setMinScaleFactor:", a3);
}

- (void)setMaximumZoomScale:(double)a3
{
  -[PDFView setMaxScaleFactor:](self->_private->pdfView, "setMaxScaleFactor:", a3);
}

- (void)handleGesture:(unint64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 isIndirectTouch:(BOOL)a7
{
  _BOOL8 v7;
  double y;
  double x;
  double v10;
  double v11;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v7 = a7;
  y = a6.y;
  x = a6.x;
  v10 = a5.y;
  v11 = a5.x;
  self->_private->currentGestureState = a4;
  -[PDFExtensionViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertPoint:toView:", self->_private->pdfView, v11, v10);
  v17 = v16;
  v19 = v18;

  -[PDFExtensionViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "convertPoint:toView:", self->_private->pdfView, x, y);
  v22 = v21;
  v24 = v23;

  -[PDFView handleGesture:state:location:locationOfFirstTouch:isIndirectTouch:](self->_private->pdfView, "handleGesture:state:location:locationOfFirstTouch:isIndirectTouch:", a3, a4, v7, v17, v19, v22, v24);
}

- (void)snapshotViewRect:(CGRect)a3 forWidth:(double)a4 afterScreenUpdates:(BOOL)a5
{
  double width;
  double y;
  double x;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CGColorSpace *v26;
  CGContext *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  _QWORD v31[5];

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v31[4] = *MEMORY[0x24BDAC8D0];
  v10 = a3.size.height / a3.size.width * a4;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "displayGamut");

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");
  v17 = v16;

  if (v17 == 0.0)
    v17 = 1.0;
  v18 = vcvtpd_s64_f64(v10 * v17);
  v30[0] = *MEMORY[0x24BDD8D90];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", vcvtpd_s64_f64(v17 * a4));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v19;
  v30[1] = *MEMORY[0x24BDD8D58];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v20;
  v30[2] = *MEMORY[0x24BDD8D60];
  if (v13 == 1)
    v21 = 1999843442;
  else
    v21 = 1111970369;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = *MEMORY[0x24BDD8D38];
  v31[2] = v22;
  v31[3] = &unk_24C27D8C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD8DE8]), "initWithProperties:", v23);
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "lockWithOptions:seed:", 0, 0);
    if (v13 == 1)
      v26 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF278]);
    else
      v26 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
    v27 = (CGContext *)CGIOSurfaceContextCreate();
    CGColorSpaceRelease(v26);
    if (v27)
    {
      CGContextTranslateCTM(v27, 0.0, (double)v18);
      CGContextScaleCTM(v27, v17, -v17);
      CGContextScaleCTM(v27, a4 / width, a4 / width);
      CGContextTranslateCTM(v27, -x, -y);
      -[PDFExtensionViewController view](self, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "layer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "renderInContext:", v27);

      CGContextFlush(v27);
      objc_msgSend(v25, "unlockWithOptions:seed:", 0, 0);
      -[PDFHostProtocol extensionSnapshotToHost:scale:](self->_private->hostProxy, "extensionSnapshotToHost:scale:", v25, v17);
      CGContextRelease(v27);
    }
  }

}

- (void)copy
{
  -[PDFView copy:](self->_private->pdfView, "copy:", 0);
}

- (void)selectAll
{
  -[PDFView selectAll:](self->_private->pdfView, "selectAll:", 0);
}

- (void)unlockWithPassword:(id)a3
{
  PDFView *pdfView;
  id v5;
  void *v6;

  pdfView = self->_private->pdfView;
  v5 = a3;
  -[PDFView document](pdfView, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlockWithPassword:", v5);

  -[PDFExtensionViewController _updateDocumentIsLocked](self, "_updateDocumentIsLocked");
}

- (void)pointerRegionForLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  PDFHostProtocol *hostProxy;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  _QWORD v29[3];
  _QWORD v30[4];

  y = a3.y;
  x = a3.x;
  v30[3] = *MEMORY[0x24BDAC8D0];
  -[PDFExtensionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", self->_private->pdfView, x, y);
  v8 = v7;
  v10 = v9;

  -[PDFView pointerRegionForLocation:](self->_private->pdfView, "pointerRegionForLocation:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFExtensionViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rect");
  objc_msgSend(v12, "convertRect:fromView:", self->_private->pdfView);
  objc_msgSend(v11, "setRect:");

  hostProxy = self->_private->hostProxy;
  v30[0] = CFSTR("pointerRegionForLocation");
  v29[0] = CFSTR("function");
  v29[1] = CFSTR("regionRect");
  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v11, "rect");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v11, "rect");
  objc_msgSend(v16, "numberWithDouble:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v18;
  v19 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v11, "rect");
  objc_msgSend(v19, "numberWithDouble:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v21;
  v22 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v11, "rect");
  objc_msgSend(v22, "numberWithDouble:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v25;
  v29[2] = CFSTR("regionIdentifier");
  objc_msgSend(v11, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v27);

}

- (void)_setupDocumentViewSize
{
  void *v3;
  void *v4;
  void *v5;
  PDFHostProtocol *hostProxy;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_private->documentViewSize.width);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_private->documentViewSize.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    hostProxy = self->_private->hostProxy;
    v8[0] = CFSTR("function");
    v8[1] = CFSTR("documentViewSize");
    v9[0] = CFSTR("setupDocumentViewSize");
    v9[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v7);

  }
}

- (void)_updateDocumentIsLocked
{
  void *v3;
  uint64_t v4;
  PDFHostProtocol *hostProxy;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  -[PDFView document](self->_private->pdfView, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocked");

  hostProxy = self->_private->hostProxy;
  v8[0] = CFSTR("function");
  v8[1] = CFSTR("isLocked");
  v9[0] = CFSTR("updateDocumentIsLocked");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v7);

  if ((v4 & 1) == 0)
    -[PDFExtensionViewController setupPDFView](self, "setupPDFView");
}

- (void)_zoomToRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PDFHostProtocol *hostProxy;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26[4] = *MEMORY[0x24BDAC8D0];
  -[PDFExtensionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:fromView:", self->_private->pdfView, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v19;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    hostProxy = self->_private->hostProxy;
    v24[0] = CFSTR("function");
    v24[1] = CFSTR("visibleRect");
    v25[0] = CFSTR("zoomToRect");
    v25[1] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v23);

  }
}

- (void)_updatePageCount
{
  void *v3;
  uint64_t v4;
  PDFHostProtocol *hostProxy;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  -[PDFView document](self->_private->pdfView, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pageCount");

  hostProxy = self->_private->hostProxy;
  v8[0] = CFSTR("function");
  v8[1] = CFSTR("pageCount");
  v9[0] = CFSTR("updatePageCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v7);

}

- (void)_updateTextSelectionPoints
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  PDFHostProtocol *hostProxy;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  -[PDFExtensionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertPoint:fromView:", self->_private->pdfView, self->_private->topLeftSelectionPoint.x, self->_private->topLeftSelectionPoint.y);
  v5 = v4;
  v7 = v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDFExtensionViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromView:", self->_private->pdfView, self->_private->bottomRightSelectionPoint.x, self->_private->bottomRightSelectionPoint.y);
  v13 = v12;
  v15 = v14;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  hostProxy = self->_private->hostProxy;
  v21[0] = CFSTR("function");
  v21[1] = CFSTR("topLeftSelectionPoint");
  v22[0] = CFSTR("setTextSelectionPoints");
  v22[1] = v10;
  v21[2] = CFSTR("bottomRightSelectionPoint");
  v22[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v20);

}

- (void)didMatchString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PDFExtensionViewControllerPrivate *v7;
  PDFHostProtocol *hostProxy;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDF6950];
    v5 = a3;
    objc_msgSend(v4, "colorWithRed:green:blue:alpha:", 1.0, 0.89, 0.22, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColor:", v6);

    -[NSMutableArray addObject:](self->_private->searchResults, "addObject:", v5);
  }
  v7 = self->_private;
  hostProxy = v7->hostProxy;
  v15[0] = CFSTR("findStringUpdate");
  v14[0] = CFSTR("function");
  v14[1] = CFSTR("numFound");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMutableArray count](v7->searchResults, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  v14[2] = CFSTR("done");
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[PDFView document](self->_private->pdfView, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "isFinding") ^ 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v13);

}

- (void)documentDidEndDocumentFind:(id)a3
{
  PDFExtensionViewControllerPrivate *v3;
  PDFHostProtocol *hostProxy;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v3 = self->_private;
  if (!v3->didCancelActiveSearch)
  {
    hostProxy = v3->hostProxy;
    v8[0] = CFSTR("findStringUpdate");
    v7[0] = CFSTR("function");
    v7[1] = CFSTR("numFound");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMutableArray count](v3->searchResults, "count", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2] = CFSTR("done");
    v8[1] = v5;
    v8[2] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v6);

  }
}

- (void)_pageChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  PDFHostProtocol *hostProxy;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  -[PDFView document](self->_private->pdfView, "document", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFView currentPage](self->_private->pdfView, "currentPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexForPage:", v5);

  hostProxy = self->_private->hostProxy;
  v10[0] = CFSTR("function");
  v10[1] = CFSTR("pageIndex");
  v11[0] = CFSTR("updateCurrentPageIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v9);

}

- (void)_goToPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PDFHostProtocol *hostProxy;
  void *v33;
  void *v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[5];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("pageIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("pageFrame"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "PDFKitPDFRectValue");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[PDFExtensionViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "convertRect:fromView:", self->_private->pdfView, v11, v13, v15, v17);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v27;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v28;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v29;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  hostProxy = self->_private->hostProxy;
  v36[0] = CFSTR("goToPage");
  v35[0] = CFSTR("function");
  v35[1] = CFSTR("pageIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = CFSTR("pageFrame");
  v36[1] = v33;
  v36[2] = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v34);

}

- (void)_goToDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  PDFHostProtocol *hostProxy;
  void *v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("pageIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("point"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "PDFKitPDFPointValue");
  v11 = v10;
  v13 = v12;

  -[PDFExtensionViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertPoint:fromView:", self->_private->pdfView, v11, v13);
  v16 = v15;
  v18 = v17;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  hostProxy = self->_private->hostProxy;
  v26[0] = CFSTR("goToDestination");
  v25[0] = CFSTR("function");
  v25[1] = CFSTR("pageIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = CFSTR("point");
  v26[1] = v23;
  v26[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v24);

}

- (void)_pdfViewZoomToRect:(id)a3
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
  id v13;

  objc_msgSend(a3, "userInfo");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("rect"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PDFKitPDFRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[PDFExtensionViewController _zoomToRect:](self, "_zoomToRect:", v6, v8, v10, v12);
}

- (void)_selectionChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  PDFExtensionViewControllerPrivate *v7;
  PDFHostProtocol *hostProxy;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  -[PDFView currentSelection](self->_private->pdfView, "currentSelection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "isEmpty") ^ 1;
  else
    v6 = 0;
  v7 = self->_private;
  if (v7->hasSelection != v6)
  {
    v7->hasSelection = v6;
    hostProxy = self->_private->hostProxy;
    v11[0] = CFSTR("function");
    v11[1] = CFSTR("hasSelection");
    v12[0] = CFSTR("setHasSelection");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v10);

  }
}

- (void)_selectionPointsChangedNotification:(id)a3
{
  id v4;
  void *v5;
  PDFExtensionViewControllerPrivate *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  CGFloat v12;
  void *v13;
  void *v14;
  PDFExtensionViewControllerPrivate *v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  float v20;
  CGFloat v21;
  id v22;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("topLeftSelectionPoint"));
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v6 = self->_private;
  objc_msgSend(v22, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;
  objc_msgSend(v22, "objectAtIndex:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v6->topLeftSelectionPoint.x = PDFPointMake(v9, v11);
  v6->topLeftSelectionPoint.y = v12;

  objc_msgSend(v4, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKey:", CFSTR("bottomRightSelectionPoint"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = self->_private;
  objc_msgSend(v14, "objectAtIndex:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17;
  objc_msgSend(v14, "objectAtIndex:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v15->bottomRightSelectionPoint.x = PDFPointMake(v18, v20);
  v15->bottomRightSelectionPoint.y = v21;

  -[PDFExtensionViewController _updateTextSelectionPoints](self, "_updateTextSelectionPoints");
}

- (void)_textSelectionShowTextSelectionMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PDFHostProtocol *hostProxy;
  void *v33;
  void *v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[5];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("visible"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("selectionRect"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "PDFKitPDFRectValue");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[PDFExtensionViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "convertRect:fromView:", self->_private->pdfView, v11, v13, v15, v17);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v27;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v28;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v29;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  hostProxy = self->_private->hostProxy;
  v36[0] = CFSTR("showTextSelectionMenu");
  v35[0] = CFSTR("function");
  v35[1] = CFSTR("visible");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = CFSTR("selectionRect");
  v36[1] = v33;
  v36[2] = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v34);

}

- (void)_textSelectionDidCopyStringNotification:(id)a3
{
  void *v4;
  void *v5;
  PDFHostProtocol *hostProxy;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("plainString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  hostProxy = self->_private->hostProxy;
  v8[0] = CFSTR("function");
  v8[1] = CFSTR("plainString");
  v9[0] = CFSTR("didCopyString");
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v7);

}

- (void)_textSelectionDidCopyDataNotification:(id)a3
{
  void *v4;
  void *v5;
  PDFHostProtocol *hostProxy;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("webArchiveData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  hostProxy = self->_private->hostProxy;
  v8[0] = CFSTR("function");
  v8[1] = CFSTR("webArchiveData");
  v9[0] = CFSTR("didCopyData");
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v7);

}

- (void)_annotationHitNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  PDFHostProtocol *hostProxy;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("PDFAnnotationHit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("location"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v5, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("/Link"));

      if (v9)
      {
        objc_msgSend(v7, "PDFKitPDFPointValue");
        v11 = v10;
        v13 = v12;
        -[PDFExtensionViewController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "convertPoint:fromView:", self->_private->pdfView, v11, v13);
        v16 = v15;
        v18 = v17;

        objc_msgSend(v5, "action");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v19, "URL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "absoluteString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            hostProxy = self->_private->hostProxy;
            v28[0] = CFSTR("function");
            v28[1] = CFSTR("urlString");
            v29[0] = CFSTR("goToURL");
            v29[1] = v21;
            v28[2] = CFSTR("location");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = v23;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v27[1] = v24;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v29[2] = v25;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v26);

          }
        }

      }
    }
  }

}

- (void)_annotationLongPressNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
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
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  PDFHostProtocol *hostProxy;
  PDFHostProtocol *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[4];
  _QWORD v67[2];
  _QWORD v68[4];
  _QWORD v69[4];
  _QWORD v70[4];
  _QWORD v71[2];
  _QWORD v72[4];
  _QWORD v73[6];

  v73[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("annotation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("location"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v5, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("/Link"));

      if (v9)
      {
        objc_msgSend(v7, "PDFKitPDFPointValue");
        v11 = v10;
        v13 = v12;
        -[PDFExtensionViewController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "convertPoint:fromView:", self->_private->pdfView, v11, v13);
        v16 = v15;
        v18 = v17;

        objc_msgSend(v5, "action");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bounds");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        objc_msgSend(v5, "page");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFView convertRect:fromPage:](self->_private->pdfView, "convertRect:fromPage:", v28, v21, v23, v25, v27);
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;
        -[PDFExtensionViewController view](self, "view");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "convertRect:fromView:", self->_private->pdfView, v30, v32, v34, v36);
        v39 = v38;
        v41 = v40;
        v43 = v42;
        v45 = v44;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v19, "URL");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "absoluteString");
          v47 = objc_claimAutoreleasedReturnValue();

          if (!v47)
          {
LABEL_11:

            goto LABEL_12;
          }
          v64 = (void *)v47;
          v65 = v28;
          hostProxy = self->_private->hostProxy;
          v72[0] = CFSTR("function");
          v72[1] = CFSTR("urlString");
          v73[0] = CFSTR("didLongPressLink");
          v73[1] = v47;
          v72[2] = CFSTR("location");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v71[0] = v63;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v71[1] = v62;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v73[2] = v61;
          v72[3] = CFSTR("annotationRect");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v39);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v70[0] = v60;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v41);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v70[1] = v48;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v43);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v70[2] = v49;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v45);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v70[3] = v50;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 4);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v73[3] = v51;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 4);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFHostProtocol extensionToHost:](hostProxy, "extensionToHost:", v52);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_11;
          objc_msgSend(v19, "destination");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "page");
          v54 = objc_claimAutoreleasedReturnValue();

          if (!v54)
            goto LABEL_11;
          v65 = v28;
          -[PDFView document](self->_private->pdfView, "document");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (void *)v54;
          v56 = objc_msgSend(v55, "indexForPage:", v54);

          v59 = self->_private->hostProxy;
          v69[0] = CFSTR("didLongPressLink");
          v68[0] = CFSTR("function");
          v68[1] = CFSTR("pageIndex");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v56);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v69[1] = v63;
          v68[2] = CFSTR("location");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v67[0] = v62;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v67[1] = v61;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 2);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v69[2] = v60;
          v68[3] = CFSTR("annotationRect");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v39);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v66[0] = v48;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v41);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v66[1] = v49;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v43);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v66[2] = v50;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v45);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v66[3] = v51;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 4);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v69[3] = v52;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 4);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFHostProtocol extensionToHost:](v59, "extensionToHost:", v57);

        }
        v28 = v65;
        goto LABEL_11;
      }
    }
  }
LABEL_12:

}

+ (id)_remoteViewControllerInterface
{
  return +[XPCExtensionInterface extensionInterface](XPCExtensionInterface, "extensionInterface");
}

+ (id)_exportedInterface
{
  return +[XPCExtensionInterface hostInterface](XPCExtensionInterface, "hostInterface");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
