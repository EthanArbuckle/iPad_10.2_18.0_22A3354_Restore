@implementation PDFScannerResult

- (PDFScannerResult)initWithDDScannerResult:(id)a3 foundOnPage:(id)a4
{
  id v7;
  id v8;
  PDFScannerResult *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  PDFScannerResultPrivate *v16;
  PDFScannerResultPrivate *v17;
  PDFScannerResultPrivate *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  NSArray *v23;
  PDFScannerResultPrivate *v24;
  NSArray *rects;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  PDFScannerResult *v37;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)PDFScannerResult;
  v9 = -[PDFScannerResult init](&v44, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = PDFURLLooksSuspicious(v10);

    if ((v11 & 1) != 0
      || (v12 = objc_msgSend(v7, "urlificationRange"),
          objc_msgSend(v8, "selectionForRange:", v12, v13),
          (v14 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v37 = 0;
      goto LABEL_14;
    }
    v15 = (void *)v14;
    v16 = objc_alloc_init(PDFScannerResultPrivate);
    v17 = v9->_private;
    v9->_private = v16;

    objc_storeStrong((id *)&v9->_private->ddResult, a3);
    objc_storeWeak((id *)&v9->_private->page, v8);
    v18 = v9->_private;
    objc_msgSend(v15, "boundsForPage:", v8);
    v18->bounds.origin.x = v19;
    v18->bounds.origin.y = v20;
    v18->bounds.size.width = v21;
    v18->bounds.size.height = v22;
    v23 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v24 = v9->_private;
    rects = v24->rects;
    v24->rects = v23;

    v39 = v15;
    objc_msgSend(v15, "selectionsByLine");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v41;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v41 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v30), "boundsForPage:", v8);
          v31 = v9->_private->rects;
          objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v31, "addObject:", v32);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v28);
    }
    objc_msgSend(v8, "document");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "documentAttributes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKey:", CFSTR("CreationDate"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[DDScannerResult coreResult](v9->_private->ddResult, "coreResult");
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_private->resultIsPastDate = DDResultIsPastDate() != 0;

    v9->_private->hasRunActionsForResult = 0;
    v9->_private->hasActionsForResult = 0;

  }
  v37 = v9;
LABEL_14:

  return v37;
}

- (id)ddResult
{
  return self->_private->ddResult;
}

- (CGRect)bounds
{
  PDFScannerResultPrivate *v2;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v2 = self->_private;
  x = v2->bounds.origin.x;
  y = v2->bounds.origin.y;
  width = v2->bounds.size.width;
  height = v2->bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)rects
{
  return self->_private->rects;
}

- (BOOL)resultIsPastDate
{
  return self->_private->resultIsPastDate;
}

- (BOOL)hasActionsForResult
{
  PDFScannerResultPrivate *v2;

  v2 = self->_private;
  if (!v2->hasRunActionsForResult)
  {
    v2->hasActionsForResult = 0;
    self->_private->hasRunActionsForResult = 1;
    v2 = self->_private;
  }
  return v2->hasActionsForResult;
}

- (__DDHighlight)highlightRef
{
  return self->_private->highlightRef;
}

- (void)setHighlightRef:(__DDHighlight *)a3
{
  __DDHighlight *highlightRef;

  highlightRef = self->_private->highlightRef;
  if (highlightRef != a3)
  {
    if (highlightRef)
      CFRelease(highlightRef);
    if (a3)
      CFRetain(a3);
    self->_private->highlightRef = a3;
  }
}

- (double)displayScaleOnPageLayer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double BackingScaleFactor;
  __n128 v8;
  __n128 v9;
  double v10;
  double v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "geometryInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "targetBackingScaleFactor");
    BackingScaleFactor = v6;
    v8.n128_u64[0] = 0;
    v9.n128_u64[0] = 0;
    objc_msgSend(v5, "convertRectToRootView:fromPageLayer:", v4, PDFRectMake(v8, v9, 1.0, 1.0));
    v11 = floor(v10 * 0.75);
    if (BackingScaleFactor < v11)
      BackingScaleFactor = v11;

  }
  else
  {
    BackingScaleFactor = PDFScreenGetBackingScaleFactor();
  }

  return BackingScaleFactor;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  v7 = WeakRetained;
  if (self->_private->highlightRef)
    v8 = WeakRetained == 0;
  else
    v8 = 1;
  if (v8)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "document");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pageViewForPageAtIndex:", objc_msgSend(v10, "indexForPage:", v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[PDFScannerResult containsPoint:onPageLayer:](self, "containsPoint:onPageLayer:", v12, x, y);
  }

  return v13;
}

- (BOOL)containsPoint:(CGPoint)a3 onPageLayer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  __n128 v11;
  __n128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double *v18;
  double v19;
  double v20;
  unint64_t v21;
  double v22;
  double *v23;
  double v24;
  CGPoint v26;
  CGRect v27;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v7 && self->_private->highlightRef)
  {
    objc_msgSend(v7, "geometryInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11.n128_u64[0] = 0;
    v12.n128_u64[0] = 0;
    objc_msgSend(v10, "convertRectToRootView:fromPageLayer:", v8, PDFRectMake(v11, v12, 1.0, 1.0));
    v14 = v13;

    v15 = PDFPointScale(x, y, v14);
    v17 = v16;
    v18 = (double *)malloc_type_malloc(32 * -[NSArray count](self->_private->rects, "count"), 0x1000040E0EAB150uLL);
    -[NSArray count](self->_private->rects, "count");
    if (loadReveal_onceToken != -1)
      dispatch_once(&loadReveal_onceToken, &__block_literal_global_10);
    -[PDFScannerResult displayScaleOnPageLayer:](self, "displayScaleOnPageLayer:", v8);
    v20 = v19;
    if (-[NSArray count](self->_private->rects, "count"))
    {
      v21 = 0;
      v22 = v17 / v20;
      v23 = v18 + 2;
      v24 = v15 / v20;
      do
      {
        v27.origin.x = PDFRectFromCGRect(*(v23 - 2), *(v23 - 1), *v23, v23[1]);
        v26.x = v24;
        v26.y = v22;
        v9 = PDFRectContainsPoint(v27, v26);
        if (v9)
          break;
        ++v21;
        v23 += 4;
      }
      while (-[NSArray count](self->_private->rects, "count") > v21);
      goto LABEL_11;
    }
    v9 = 0;
    if (v18)
LABEL_11:
      free(v18);
  }

  return v9;
}

- (BOOL)pointIsOnButton:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  v7 = WeakRetained;
  if (self->_private->highlightRef)
    v8 = WeakRetained == 0;
  else
    v8 = 1;
  if (v8)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "document");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pageViewForPageAtIndex:", objc_msgSend(v10, "indexForPage:", v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[PDFScannerResult pointIsOnButton:onPageLayer:](self, "pointIsOnButton:onPageLayer:", v12, x, y);
  }

  return v13;
}

- (BOOL)pointIsOnButton:(CGPoint)a3 onPageLayer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  __n128 v9;
  __n128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (a4)
  {
    if (self->_private->highlightRef)
    {
      y = a3.y;
      x = a3.x;
      v7 = a4;
      objc_msgSend(v7, "geometryInterface");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9.n128_u64[0] = 0;
      v10.n128_u64[0] = 0;
      objc_msgSend(v8, "convertRectToRootView:fromPageLayer:", v7, PDFRectMake(v9, v10, 1.0, 1.0));
      v12 = v11;

      -[PDFScannerResult displayScaleOnPageLayer:](self, "displayScaleOnPageLayer:", v7);
      v14 = v13;

      v15 = PDFPointScale(x, y, v12 / v14);
      PDFPointToCGPoint(v15, v16);
      if (loadReveal_onceToken != -1)
        dispatch_once(&loadReveal_onceToken, &__block_literal_global_10);
    }
  }
  return 0;
}

- (void)setButtonPressed:(BOOL)a3
{
  if (self->_private->highlightRef)
  {
    if (loadReveal_onceToken != -1)
      dispatch_once(&loadReveal_onceToken, &__block_literal_global_10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
