@implementation PDFViewLayout

- (PDFViewLayout)init
{
  PDFViewLayout *v2;
  PDFViewLayoutPrivate *v3;
  PDFViewLayoutPrivate *v4;
  NSLock *v5;
  PDFViewLayoutPrivate *v6;
  NSLock *pageLayoutLock;
  CGSize v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PDFViewLayout;
  v2 = -[PDFViewLayout init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PDFViewLayoutPrivate);
    v4 = v2->_private;
    v2->_private = v3;

    objc_storeWeak(&v2->_private->delegate, 0);
    v2->_private->delegateKnowsMargins = 0;
    v2->_private->delegateKnowsDisplayMode = 0;
    v2->_private->delegateKnowsDisplayAsBook = 0;
    v2->_private->delegateKnowsDisplayBox = 0;
    v2->_private->delegateKnowsDisplayRTL = 0;
    v2->_private->delegateKnowsDisplaysDirection = 0;
    v2->_private->delegateKnowsDocumentMargins = 0;
    v2->_private->delegateKnowsIsUsingPageViewController = 0;
    objc_storeWeak((id *)&v2->_private->document, 0);
    v2->_private->pageCount = 0;
    v5 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    v6 = v2->_private;
    pageLayoutLock = v6->pageLayoutLock;
    v6->pageLayoutLock = v5;

    v2->_private->pageLayoutBounds = 0;
    v8 = (CGSize)*MEMORY[0x24BDBF148];
    v2->_private->singlePageContinuousSize = (CGSize)*MEMORY[0x24BDBF148];
    v2->_private->twoUpContinousSize = v8;
    v2->_private->cachedContinuousSizeDisplayDirection = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_private->pageLayoutBounds);
  v3.receiver = self;
  v3.super_class = (Class)PDFViewLayout;
  -[PDFViewLayout dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained(&self->_private->delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak(&self->_private->delegate, obj);
    self->_private->delegateKnowsMargins = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsDisplayMode = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsDisplayAsBook = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsDisplayBox = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsDisplayRTL = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsDisplaysDirection = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsDocumentMargins = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsIsUsingPageViewController = objc_opt_respondsToSelector() & 1;
    -[PDFViewLayout invalidateInternalDocumentGeometry](self, "invalidateInternalDocumentGeometry");
  }

}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_private->delegate);
}

- (void)setDocument:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_private->document, obj);
    self->_private->pageCount = objc_msgSend(obj, "pageCount");
    -[PDFViewLayout invalidateInternalDocumentGeometry](self, "invalidateInternalDocumentGeometry");
  }

}

- (PDFDocument)document
{
  return (PDFDocument *)objc_loadWeakRetained((id *)&self->_private->document);
}

- (CGSize)contentSizeWithCurrentPage:(id)a3
{
  id v4;
  double v5;
  double v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PDFViewLayoutPrivate *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int64_t v26;
  PDFViewLayoutPrivate *v27;
  unint64_t pageCount;
  void *v29;
  uint64_t v30;
  PDFViewLayoutPrivate *v31;
  int64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect *v37;
  double x;
  double y;
  double width;
  double height;
  CGRect *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  CGRect *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  PDFViewLayoutPrivate *v56;
  PDFViewLayoutPrivate *v57;
  double v58;
  PDFViewLayoutPrivate *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  uint64_t v71;
  unint64_t v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  double v76;
  PDFViewLayoutPrivate *v77;
  double v78;
  double v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  double v83;
  CGSize result;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  v4 = a3;
  v5 = *MEMORY[0x24BDBF148];
  v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  v8 = WeakRetained;
  if (v4 && WeakRetained)
  {
    v9 = objc_loadWeakRetained(&self->_private->delegate);
    v10 = v9;
    v11 = *MEMORY[0x24BDF7718];
    v12 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v13 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v14 = *(double *)(MEMORY[0x24BDF7718] + 24);
    v15 = self->_private;
    if (v15->delegateKnowsMargins)
    {
      objc_msgSend(v9, "pageBreakMargins");
      v80 = v16;
      v82 = v17;
      v19 = v18;
      v21 = v20;
      v15 = self->_private;
    }
    else
    {
      v21 = *(double *)(MEMORY[0x24BDF7718] + 24);
      v80 = *MEMORY[0x24BDF7718];
      v82 = *(_QWORD *)(MEMORY[0x24BDF7718] + 16);
      v19 = *(double *)(MEMORY[0x24BDF7718] + 8);
    }
    if (v15->delegateKnowsDocumentMargins)
    {
      objc_msgSend(v10, "documentMargins");
      v11 = v22;
      v12 = v23;
      v13 = v24;
      v14 = v25;
      v15 = self->_private;
    }
    if (v15->delegateKnowsDisplaysDirection)
    {
      v26 = objc_msgSend(v10, "displayDirection");
      v15 = self->_private;
    }
    else
    {
      v26 = 0;
    }
    -[NSLock lock](v15->pageLayoutLock, "lock", v80, v82);
    v27 = self->_private;
    if (!v27->pageLayoutBounds || (pageCount = v27->pageCount, pageCount != objc_msgSend(v8, "pageCount")))
      -[PDFViewLayout generateInternalDocumentGeometry](self, "generateInternalDocumentGeometry");
    objc_msgSend(v4, "document");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "indexForPage:", v4);

    v31 = self->_private;
    if (v30 != 0x7FFFFFFFFFFFFFFFLL && v31->pageCount)
    {
      v32 = -[PDFViewLayout functionalDisplayMode](self, "functionalDisplayMode");
      v33 = v21 + v19;
      v34 = v21;
      v35 = v33 + v14 + v12;
      v36 = v83 + v81 + v13 + v11;
      switch(v32)
      {
        case 0:
          v37 = &self->_private->pageLayoutBounds[v30];
          x = v37->origin.x;
          y = v37->origin.y;
          width = v37->size.width;
          height = v37->size.height;
          v5 = v35 + PDFRectGetMaxX(v37->origin.x, y, width);
          v6 = v36 + PDFRectGetMaxY(x, y, width, height);
          break;
        case 1:
          v57 = self->_private;
          v5 = v57->singlePageContinuousSize.width;
          if (v5 <= 0.0 || v57->cachedContinuousSizeDisplayDirection != v26)
          {
            v63 = PDFRectToCGRect(v32);
            v66 = v65;
            v68 = v67;
            if (self->_private->pageCount >= 2)
            {
              v69 = v63;
              v70 = v64;
              v71 = 0;
              v72 = 1;
              do
              {
                v87.origin.x = PDFRectToCGRect(v62);
                v87.origin.y = v73;
                v87.size.width = v74;
                v87.size.height = v75;
                v85.origin.x = v69;
                v85.origin.y = v70;
                v85.size.width = v66;
                v85.size.height = v68;
                v86 = CGRectUnion(v85, v87);
                v69 = v86.origin.x;
                v70 = v86.origin.y;
                v66 = v86.size.width;
                v68 = v86.size.height;
                ++v72;
                v71 += 32;
              }
              while (self->_private->pageCount > v72);
            }
            v5 = PDFSizeFromCGSize(v35 + v66, v36 + v68);
            v6 = v76;
            v77 = self->_private;
            v77->singlePageContinuousSize.width = v5;
            v77->singlePageContinuousSize.height = v76;
            goto LABEL_35;
          }
          v6 = v57->singlePageContinuousSize.height;
          break;
        case 2:
          v42 = &self->_private->pageLayoutBounds[v30];
          v43 = v42->origin.x;
          v44 = v42->origin.y;
          v45 = v42->size.width;
          v46 = v42->size.height;
          v5 = v35 + PDFRectGetMaxX(v42->origin.x, v44, v45);
          v6 = v36 + PDFRectGetMaxY(v43, v44, v45, v46);
          -[PDFViewLayout facingPageForPage:](self, "facingPageForPage:", v4);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v47)
          {
            objc_msgSend(v47, "document");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "indexForPage:", v48);

            v51 = &self->_private->pageLayoutBounds[v50];
            v52 = v51->origin.x;
            v53 = v51->origin.y;
            v54 = v51->size.width;
            v55 = v51->size.height;
            v5 = fmax(v5, v35 + PDFRectGetMaxX(v51->origin.x, v53, v54));
            v6 = fmax(v6, v36 + PDFRectGetMaxY(v52, v53, v54, v55));
          }

          break;
        case 3:
          v56 = self->_private;
          v5 = v56->twoUpContinousSize.width;
          if (v5 > 0.0 && v56->cachedContinuousSizeDisplayDirection == v26)
          {
            v6 = v56->twoUpContinousSize.height;
          }
          else
          {
            v58 = v36
                + PDFRectGetMaxY(v56->pageLayoutBounds->origin.x, v56->pageLayoutBounds->origin.y, v56->pageLayoutBounds->size.width, v56->pageLayoutBounds->size.height);
            v6 = fmax(v58, v36+ PDFRectGetMaxY(self->_private->pageLayoutBounds[1].origin.x, self->_private->pageLayoutBounds[1].origin.y, self->_private->pageLayoutBounds[1].size.width, self->_private->pageLayoutBounds[1].size.height));
            v5 = v34
               + PDFRectGetMaxX(self->_private->pageLayoutBounds->origin.x, self->_private->pageLayoutBounds->origin.y, self->_private->pageLayoutBounds->size.width);
            v59 = self->_private;
            if (v59->pageCount >= 2)
            {
              v60 = 0;
              v61 = 1;
              do
              {
                v5 = fmax(v5, v34+ PDFRectGetMaxX(v59->pageLayoutBounds[v60 + 1].origin.x, v59->pageLayoutBounds[v60 + 1].origin.y, v59->pageLayoutBounds[v60 + 1].size.width));
                ++v61;
                v59 = self->_private;
                ++v60;
              }
              while (v59->pageCount > v61);
            }
            v59->twoUpContinousSize.width = v5;
            v59->twoUpContinousSize.height = v6;
LABEL_35:
            self->_private->cachedContinuousSizeDisplayDirection = v26;
          }
          break;
        default:
          break;
      }
      v5 = ceil(v5);
      v6 = ceil(v6);
      v31 = self->_private;
    }
    -[NSLock unlock](v31->pageLayoutLock, "unlock");

  }
  v78 = v5;
  v79 = v6;
  result.height = v79;
  result.width = v78;
  return result;
}

- (_NSRange)visiblePageRangeInBounds:(CGRect)a3 currentPage:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id WeakRetained;
  NSUInteger v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double MaxY;
  void *v16;
  double MinY;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  unint64_t v22;
  double v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  NSUInteger v29;
  BOOL v30;
  NSUInteger v31;
  NSUInteger v32;
  _NSRange result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  v11 = 0;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9 && self->_private->pageCount)
  {
    switch(-[PDFViewLayout functionalDisplayMode](self, "functionalDisplayMode"))
    {
      case 0:
        v13 = objc_msgSend(WeakRetained, "indexForPage:", v9);
        v14 = v13;
        goto LABEL_16;
      case 1:
        MaxY = PDFRectGetMaxY(x, y, width, height);
        -[PDFViewLayout pageNearestPoint:currentPage:](self, "pageNearestPoint:currentPage:", v9, PDFPointMake(0.0, MaxY));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(WeakRetained, "indexForPage:", v16);

        MinY = PDFRectGetMinY(x, y, width, height);
        -[PDFViewLayout pageNearestPoint:currentPage:](self, "pageNearestPoint:currentPage:", v9, PDFPointMake(0.0, MinY));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 2:
        v14 = objc_msgSend(WeakRetained, "indexForPage:", v9);
        -[PDFViewLayout facingPageForPage:](self, "facingPageForPage:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v14;
        if (v18)
LABEL_8:
          v13 = objc_msgSend(WeakRetained, "indexForPage:", v18);
        goto LABEL_15;
      case 3:
        v19 = PDFRectGetMaxY(x, y, width, height);
        -[PDFViewLayout pageNearestPoint:currentPage:](self, "pageNearestPoint:currentPage:", v9, PDFPointMake(0.0, v19));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(WeakRetained, "indexForPage:", v20);
        -[PDFViewLayout facingPageForPage:](self, "facingPageForPage:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = objc_msgSend(WeakRetained, "indexForPage:", v9);
          if (v22 < v14)
            v14 = v22;
        }
        v23 = PDFRectGetMinY(x, y, width, height);
        -[PDFViewLayout pageNearestPoint:currentPage:](self, "pageNearestPoint:currentPage:", v9, PDFPointMake(0.0, v23));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(WeakRetained, "indexForPage:", v24);
        -[PDFViewLayout facingPageForPage:](self, "facingPageForPage:", v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v25 = objc_msgSend(WeakRetained, "indexForPage:", v18);
          if (v25 > v13)
            v13 = v25;
        }
LABEL_15:

LABEL_16:
        if (v13 <= v14)
          v26 = v14;
        else
          v26 = v13;
        if (v13 >= v14)
          v27 = v14;
        else
          v27 = v13;
        v28 = v26 - v27;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          v29 = 0;
        else
          v29 = v28 + 1;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          v27 = 0x7FFFFFFFFFFFFFFFLL;
        v30 = v14 == 0x7FFFFFFFFFFFFFFFLL;
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          v11 = 0;
        else
          v11 = v29;
        if (v30)
          v12 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v12 = v27;
        break;
      default:
        v11 = 0;
        break;
    }
  }

  v31 = v12;
  v32 = v11;
  result.length = v32;
  result.location = v31;
  return result;
}

- (id)visiblePagesInBounds:(CGRect)a3 currentPage:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id WeakRetained;
  void *v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = -[PDFViewLayout visiblePageRangeInBounds:currentPage:](self, "visiblePageRangeInBounds:currentPage:", v9, x, y, width, height);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v11;
    v14 = v12;
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
    if (v13 < v13 + v14)
    {
      do
      {
        objc_msgSend(WeakRetained, "pageAtIndex:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

        ++v13;
        --v14;
      }
      while (v14);
    }

  }
  return v10;
}

- (CGRect)boundsForPage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  unint64_t pageCount;
  void *v11;
  uint64_t v12;
  PDFViewLayoutPrivate *v13;
  double *p_x;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v4 = a3;
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  if (WeakRetained)
  {
    pageCount = self->_private->pageCount;

    if (pageCount)
    {
      -[NSLock lock](self->_private->pageLayoutLock, "lock");
      if (!self->_private->pageLayoutBounds)
        -[PDFViewLayout generateInternalDocumentGeometry](self, "generateInternalDocumentGeometry");
      objc_msgSend(v4, "document");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "indexForPage:", v4);

      v13 = self->_private;
      if (v4 && v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        p_x = &v13->pageLayoutBounds[v12].origin.x;
        v5 = *p_x;
        v6 = p_x[1];
        v7 = p_x[2];
        v8 = p_x[3];
      }
      -[NSLock unlock](v13->pageLayoutLock, "unlock");
    }
  }

  v15 = v5;
  v16 = v6;
  v17 = v7;
  v18 = v8;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)pageNearestPoint:(CGPoint)a3 currentPage:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  PDFViewLayoutPrivate *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  PDFViewLayoutPrivate *v25;
  int64_t v26;
  int64_t v27;
  PDFViewLayoutPrivate *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  double v32;
  CGRect *v33;
  double v34;
  double v35;
  double width;
  double v37;
  PDFViewLayoutPrivate *v38;
  uint64_t v39;
  unint64_t v40;
  double v41;
  void *v42;
  double v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  CGRect *v48;
  double MaxX;
  CGRect *v50;
  double v51;
  uint64_t v52;
  CGRect *v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  CGRect *v61;
  double v62;
  CGRect *v63;
  double v64;
  CGRect *pageLayoutBounds;
  double v66;
  id v67;
  double v69;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
    v9 = objc_loadWeakRetained(&self->_private->delegate);
    v10 = v9;
    v12 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v11 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v13 = *(double *)(MEMORY[0x24BDF7718] + 24);
    v14 = self->_private;
    if (v14->delegateKnowsMargins)
    {
      objc_msgSend(v9, "pageBreakMargins");
      v16 = v15;
      v18 = v17;
      v69 = v19;
      v14 = self->_private;
    }
    else
    {
      v69 = *(double *)(MEMORY[0x24BDF7718] + 24);
      v18 = *(double *)(MEMORY[0x24BDF7718] + 16);
      v16 = *(double *)(MEMORY[0x24BDF7718] + 8);
    }
    if (v14->delegateKnowsDocumentMargins)
    {
      objc_msgSend(v10, "documentMargins");
      v12 = v21;
      v11 = v22;
      v13 = v23;
      v14 = self->_private;
    }
    if (v14->delegateKnowsDisplaysDirection)
    {
      v24 = objc_msgSend(v10, "displayDirection");
      v14 = self->_private;
    }
    else
    {
      v24 = 0;
    }
    -[NSLock lock](v14->pageLayoutLock, "lock");
    v25 = self->_private;
    if (!v25->pageLayoutBounds)
    {
      -[PDFViewLayout generateInternalDocumentGeometry](self, "generateInternalDocumentGeometry");
      v25 = self->_private;
    }
    if (v25->pageCount)
    {
      v26 = -[PDFViewLayout functionalDisplayMode](self, "functionalDisplayMode");
      if (!v26)
      {
        v20 = v7;
        goto LABEL_57;
      }
      v27 = v26;
      if (v26 != 1)
      {
        v20 = 0;
        goto LABEL_30;
      }
      v28 = self->_private;
      if (v28->pageCount)
      {
        v29 = 0;
        v30 = 0;
        v31 = 0;
        v32 = v16 + v12;
        do
        {
          v33 = &v28->pageLayoutBounds[v29];
          v34 = v33->origin.x;
          v35 = v33->origin.y;
          width = v33->size.width;
          if (v24)
            v37 = PDFRectGetMaxX(v34, v35, width) - v32;
          else
            v37 = PDFRectGetMinY(v34, v35, width, v33->size.height) - (v18 + v11);
          objc_msgSend(WeakRetained, "pageAtIndex:", v30);
          v20 = (id)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            if (v37 > x)
              break;
          }
          else if (v37 < y)
          {
            break;
          }
          ++v30;
          v28 = self->_private;
          ++v29;
          v31 = v20;
        }
        while (v28->pageCount > v30);
LABEL_30:
        if (v27 == 2)
        {
          v44 = v7;

          -[PDFViewLayout facingPageForPage:](self, "facingPageForPage:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            v46 = objc_msgSend(WeakRetained, "indexForPage:", v44);
            v47 = objc_msgSend(WeakRetained, "indexForPage:", v45);
            v48 = &self->_private->pageLayoutBounds[v46];
            MaxX = PDFRectGetMaxX(v48->origin.x, v48->origin.y, v48->size.width);
            v50 = &self->_private->pageLayoutBounds[v47];
            v51 = PDFRectGetMaxX(v50->origin.x, v50->origin.y, v50->size.width);
            if (MaxX >= v51)
              v52 = v47;
            else
              v52 = v46;
            if (MaxX >= v51)
              v54 = v45;
            else
              v54 = v44;
            if (MaxX >= v51)
              v55 = v44;
            else
              v55 = v45;
            v53 = &self->_private->pageLayoutBounds[v52];
            if (x >= v69 + v13 + PDFRectGetMaxX(v53->origin.x, v53->origin.y, v53->size.width))
              v56 = v55;
            else
              v56 = v54;
            v57 = v56;

            v44 = v57;
          }

          v20 = v44;
          goto LABEL_57;
        }
        if (v27 == 3)
        {
          v38 = self->_private;
          if (v38->pageCount)
          {
            v39 = 0;
            v40 = 0;
            v41 = v18 + v11;
            while (1)
            {
              v42 = v20;
              v43 = PDFRectGetMinY(v38->pageLayoutBounds[v39].origin.x, v38->pageLayoutBounds[v39].origin.y, v38->pageLayoutBounds[v39].size.width, v38->pageLayoutBounds[v39].size.height)- v41;
              objc_msgSend(WeakRetained, "pageAtIndex:", v40);
              v20 = (id)objc_claimAutoreleasedReturnValue();

              if (v43 < y)
                break;
              ++v40;
              v38 = self->_private;
              ++v39;
              if (v38->pageCount <= v40)
                goto LABEL_57;
            }
            -[PDFViewLayout facingPageForPage:](self, "facingPageForPage:", v20);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v58)
              goto LABEL_56;
            v59 = objc_msgSend(WeakRetained, "indexForPage:", v20);
            v60 = objc_msgSend(WeakRetained, "indexForPage:", v58);
            v61 = &self->_private->pageLayoutBounds[v59];
            v62 = PDFRectGetMaxX(v61->origin.x, v61->origin.y, v61->size.width);
            v63 = &self->_private->pageLayoutBounds[v60];
            v64 = PDFRectGetMaxX(v63->origin.x, v63->origin.y, v63->size.width);
            pageLayoutBounds = self->_private->pageLayoutBounds;
            v66 = v69 + v13;
            if (v62 >= v64)
            {
              if (x >= v66
                      + PDFRectGetMaxX(pageLayoutBounds[v60].origin.x, pageLayoutBounds[v60].origin.y, pageLayoutBounds[v60].size.width))goto LABEL_56;
            }
            else if (x < v66
                        + PDFRectGetMaxX(pageLayoutBounds[v59].origin.x, pageLayoutBounds[v59].origin.y, pageLayoutBounds[v59].size.width))
            {
LABEL_56:

              goto LABEL_57;
            }
            v67 = v58;

            v20 = v67;
            goto LABEL_56;
          }
        }
LABEL_57:
        -[NSLock unlock](self->_private->pageLayoutLock, "unlock");

        goto LABEL_58;
      }
    }
    v20 = 0;
    goto LABEL_57;
  }
  v20 = 0;
LABEL_58:

  return v20;
}

- (CGPoint)convertPoint:(CGPoint)a3 toPage:(id)a4 forScaleFactor:(double)a5
{
  double y;
  double x;
  id v9;
  PDFViewLayoutPrivate *v10;
  void *v11;
  uint64_t v12;
  PDFViewLayoutPrivate *v13;
  double *p_x;
  double v15;
  double v16;
  double v17;
  double v18;
  id WeakRetained;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  int v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double a;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  if (v9)
  {
    -[NSLock lock](self->_private->pageLayoutLock, "lock");
    v10 = self->_private;
    if (!v10->pageLayoutBounds)
    {
      -[PDFViewLayout generateInternalDocumentGeometry](self, "generateInternalDocumentGeometry");
      v10 = self->_private;
    }
    if (!v10->pageCount)
      goto LABEL_21;
    objc_msgSend(v9, "document");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "indexForPage:", v9);

    v13 = self->_private;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      p_x = (double *)MEMORY[0x24BDBEFB0];
    else
      p_x = &v13->pageLayoutBounds[v12].origin.x;
    v15 = *p_x;
    v16 = p_x[1];
    v17 = x / a5;
    v18 = y / a5;
    if (v13->delegateKnowsDisplayBox)
    {
      WeakRetained = objc_loadWeakRetained(&v13->delegate);
      objc_msgSend(v9, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));
      v54 = v21;
      v55 = v20;
      v51 = v23;
      v53 = v22;

    }
    else
    {
      objc_msgSend(v9, "boundsForBox:", 1);
      v54 = v25;
      v55 = v24;
      v51 = v27;
      v53 = v26;
    }
    x = v17 - v15;
    y = v18 - v16;
    v28 = objc_msgSend(v9, "rotation", v51);
    v30 = *MEMORY[0x24BDBD8B8];
    v29 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
    v32 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
    v31 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
    v34 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
    v33 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
    if (v28 > 179)
    {
      if (v28 == 180)
      {
        v39 = PDFDegToRad(180.0);
        v56.a = v30;
        v56.b = v29;
        v56.c = v32;
        v56.d = v31;
        v56.tx = v34;
        v56.ty = v33;
        CGAffineTransformRotate(&v57, &v56, v39);
        v37 = -v53 - v55;
        v36 = -v52 - v54;
        v56 = v57;
        goto LABEL_20;
      }
      if (v28 == 270)
      {
        v38 = PDFDegToRad(270.0);
        v56.a = v30;
        v56.b = v29;
        v56.c = v32;
        v56.d = v31;
        v56.tx = v34;
        v56.ty = v33;
        CGAffineTransformRotate(&v57, &v56, v38);
        v37 = -v52 - v54;
        v56 = v57;
        v36 = v55;
        goto LABEL_20;
      }
    }
    else
    {
      if (!v28)
      {
        v56.a = *(CGFloat *)MEMORY[0x24BDBD8B8];
        v56.b = v29;
        v56.c = v32;
        v56.d = v31;
        v56.tx = v34;
        v56.ty = v33;
        v36 = v54;
        v37 = v55;
        goto LABEL_20;
      }
      if (v28 == 90)
      {
        v35 = PDFDegToRad(90.0);
        v56.a = v30;
        v56.b = v29;
        v56.c = v32;
        v56.d = v31;
        v56.tx = v34;
        v56.ty = v33;
        CGAffineTransformRotate(&v57, &v56, v35);
        v36 = -v53 - v55;
        v56 = v57;
        v37 = v54;
LABEL_20:
        CGAffineTransformTranslate(&v57, &v56, v37, v36);
        a = v57.a;
        b = v57.b;
        c = v57.c;
        d = v57.d;
        tx = v57.tx;
        ty = v57.ty;
        v46 = PDFPointToCGPoint(x, y);
        x = PDFPointFromCGPoint(tx + c * v47 + a * v46, ty + d * v47 + b * v46);
        y = v48;
      }
    }
LABEL_21:
    -[NSLock unlock](self->_private->pageLayoutLock, "unlock");
  }

  v49 = x;
  v50 = y;
  result.y = v50;
  result.x = v49;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toPage:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[PDFViewLayout convertPoint:toPage:forScaleFactor:](self, "convertPoint:toPage:forScaleFactor:", a4, a3.x, a3.y, 1.0);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromPage:(id)a4 forScaleFactor:(double)a5
{
  double y;
  double x;
  id v9;
  PDFViewLayoutPrivate *v10;
  id WeakRetained;
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
  int v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat tx;
  CGFloat ty;
  double v32;
  double a;
  double c;
  double d;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  unint64_t v55;
  double *p_x;
  double v57;
  double v58;
  __int128 v59;
  __int128 v60;
  double v61;
  double b;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  if (v9)
  {
    -[NSLock lock](self->_private->pageLayoutLock, "lock");
    v10 = self->_private;
    if (!v10->pageLayoutBounds)
    {
      -[PDFViewLayout generateInternalDocumentGeometry](self, "generateInternalDocumentGeometry");
      v10 = self->_private;
    }
    if (!v10->pageCount)
      goto LABEL_23;
    if (v10->delegateKnowsDisplayBox)
    {
      WeakRetained = objc_loadWeakRetained(&v10->delegate);
      objc_msgSend(v9, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;

    }
    else
    {
      objc_msgSend(v9, "boundsForBox:", 1);
      v13 = v20;
      v15 = v21;
      v17 = v22;
      v19 = v23;
    }
    v24 = objc_msgSend(v9, "rotation");
    v25 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
    v27 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
    v26 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
    v29 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
    v28 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
    if (v24 > 179)
    {
      if (v24 == 180)
      {
        v63.a = *(CGFloat *)MEMORY[0x24BDBD8B8];
        v63.b = v25;
        v63.c = v27;
        v63.d = v26;
        v63.tx = v29;
        v63.ty = v28;
        CGAffineTransformTranslate(&v64, &v63, v17 + v13, v19 + v15);
        v60 = *(_OWORD *)&v64.a;
        v59 = *(_OWORD *)&v64.c;
        v61 = a5;
        tx = v64.tx;
        ty = v64.ty;
        v32 = 180.0;
      }
      else
      {
        if (v24 != 270)
          goto LABEL_19;
        v63.a = *(CGFloat *)MEMORY[0x24BDBD8B8];
        v63.b = v25;
        v63.c = v27;
        v63.d = v26;
        v63.tx = v29;
        v63.ty = v28;
        CGAffineTransformTranslate(&v64, &v63, v19 + v15, -v13);
        v60 = *(_OWORD *)&v64.a;
        v59 = *(_OWORD *)&v64.c;
        v61 = a5;
        tx = v64.tx;
        ty = v64.ty;
        v32 = 90.0;
      }
    }
    else
    {
      if (!v24)
      {
        v63.a = *(CGFloat *)MEMORY[0x24BDBD8B8];
        v63.b = v25;
        v63.c = v27;
        v63.d = v26;
        v63.tx = v29;
        v63.ty = v28;
        CGAffineTransformTranslate(&v64, &v63, -v13, -v15);
        a = v64.a;
        b = v64.b;
        c = v64.c;
        d = v64.d;
        v36 = a5;
        v38 = v64.tx;
        v37 = v64.ty;
        v39 = PDFPointToCGPoint(x, y);
        v41 = v38 + c * v40 + a * v39;
        v42 = v37 + d * v40 + b * v39;
        a5 = v36;
LABEL_18:
        x = PDFPointFromCGPoint(v41, v42);
        y = v53;
LABEL_19:
        objc_msgSend(v9, "document", v59, v60);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "indexForPage:", v9);

        v10 = self->_private;
        if (v55 != 0x7FFFFFFFFFFFFFFFLL && v55 < v10->pageCount)
        {
          p_x = &v10->pageLayoutBounds[v55].origin.x;
          x = x + *p_x;
          y = y + p_x[1];
        }
        x = x * a5;
        y = y * a5;
LABEL_23:
        -[NSLock unlock](v10->pageLayoutLock, "unlock");
        goto LABEL_24;
      }
      if (v24 != 90)
        goto LABEL_19;
      v63.a = *(CGFloat *)MEMORY[0x24BDBD8B8];
      v63.b = v25;
      v63.c = v27;
      v63.d = v26;
      v63.tx = v29;
      v63.ty = v28;
      CGAffineTransformTranslate(&v64, &v63, -v15, v17 + v13);
      v60 = *(_OWORD *)&v64.a;
      v59 = *(_OWORD *)&v64.c;
      v61 = a5;
      tx = v64.tx;
      ty = v64.ty;
      v32 = 270.0;
    }
    v43 = PDFDegToRad(v32);
    *(_OWORD *)&v63.a = v60;
    *(_OWORD *)&v63.c = v59;
    v63.tx = tx;
    v63.ty = ty;
    CGAffineTransformRotate(&v64, &v63, v43);
    v44 = v64.a;
    v45 = v64.b;
    v46 = v64.c;
    v47 = v64.d;
    v48 = v64.tx;
    v49 = v64.ty;
    v50 = PDFPointToCGPoint(x, y);
    v52 = v46 * v51 + v44 * v50;
    a5 = v61;
    v41 = v48 + v52;
    v42 = v49 + v47 * v51 + v45 * v50;
    goto LABEL_18;
  }
LABEL_24:

  v57 = x;
  v58 = y;
  result.y = v58;
  result.x = v57;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromPage:(id)a4 forScaleFactor:(double)a5
{
  double y;
  double x;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double MaxY;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = -[PDFViewLayout convertPoint:fromPage:forScaleFactor:](self, "convertPoint:fromPage:forScaleFactor:", v9, x, y, a5);
  v12 = v11;
  v14 = v13;
  v27.origin.x = PDFRectToCGRect(v10);
  v15 = v27.origin.x;
  v16 = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  MaxX = CGRectGetMaxX(v27);
  v28.origin.x = v15;
  v28.origin.y = v16;
  v28.size.width = width;
  v28.size.height = height;
  MaxY = CGRectGetMaxY(v28);
  -[PDFViewLayout convertPoint:fromPage:forScaleFactor:](self, "convertPoint:fromPage:forScaleFactor:", v9, PDFPointMake(MaxX, MaxY));
  v22 = v21;

  v23 = PDFRectFromPDFPoints(v12, v14, v22);
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromPage:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[PDFViewLayout convertPoint:fromPage:forScaleFactor:](self, "convertPoint:fromPage:forScaleFactor:", a4, a3.x, a3.y, 1.0);
  result.y = v5;
  result.x = v4;
  return result;
}

- (int64_t)functionalDisplayMode
{
  id WeakRetained;
  void *v4;
  PDFViewLayoutPrivate *v5;
  int64_t v6;
  id v7;
  PDFViewLayoutPrivate *v8;
  unint64_t pageCount;

  WeakRetained = objc_loadWeakRetained(&self->_private->delegate);
  v4 = WeakRetained;
  v5 = self->_private;
  if (v5->delegateKnowsDisplayMode)
  {
    v6 = objc_msgSend(WeakRetained, "displayMode");
    v5 = self->_private;
  }
  else
  {
    v6 = 1;
  }
  v7 = objc_loadWeakRetained((id *)&v5->document);

  if (!v7)
    goto LABEL_27;
  v8 = self->_private;
  pageCount = v8->pageCount;
  if (pageCount == 1)
  {
    v6 &= 1u;
    goto LABEL_27;
  }
  if (pageCount == 2 && v6 == 2)
  {
    if (v8->delegateKnowsDisplayAsBook)
    {
      if (objc_msgSend(v4, "displaysAsBook"))
        v6 = 0;
      else
        v6 = 2;
      goto LABEL_27;
    }
LABEL_26:
    v6 = 2;
    goto LABEL_27;
  }
  if (pageCount == 2 && v6 == 3)
  {
    if (v8->delegateKnowsDisplayAsBook && (objc_msgSend(v4, "displaysAsBook") & 1) != 0)
    {
      v6 = 1;
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (v8->delegateKnowsIsUsingPageViewController && objc_msgSend(v4, "isUsingPageViewController"))
    v6 = 0;
LABEL_27:

  return v6;
}

- (void)invalidateInternalDocumentGeometry
{
  PDFViewLayoutPrivate *v3;
  CGRect *pageLayoutBounds;
  CGSize v5;

  -[NSLock lock](self->_private->pageLayoutLock, "lock");
  v3 = self->_private;
  pageLayoutBounds = v3->pageLayoutBounds;
  if (pageLayoutBounds)
  {
    free(pageLayoutBounds);
    self->_private->pageLayoutBounds = 0;
    v3 = self->_private;
  }
  v5 = (CGSize)*MEMORY[0x24BDBF148];
  v3->singlePageContinuousSize = (CGSize)*MEMORY[0x24BDBF148];
  self->_private->twoUpContinousSize = v5;
  -[NSLock unlock](self->_private->pageLayoutLock, "unlock");
}

- (id)facingPageForPage:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v9;
  uint64_t v10;
  unint64_t v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  if (v4)
  {
    objc_msgSend(v4, "document");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == WeakRetained
      && (unint64_t)-[PDFViewLayout functionalDisplayMode](self, "functionalDisplayMode") >= 2)
    {
      v9 = objc_loadWeakRetained(&self->_private->delegate);
      v10 = objc_msgSend(WeakRetained, "indexForPage:", v4);
      if (self->_private->delegateKnowsDisplayAsBook && objc_msgSend(v9, "displaysAsBook"))
      {
        if (!v10)
          goto LABEL_16;
        v11 = v10 & 0x8000000000000001;
        if ((v10 & 0x8000000000000001) != 1)
          v11 = -1;
      }
      else
      {
        v11 = -1;
        if ((v10 & 0x8000000000000001) != 1)
          v11 = 1;
      }
      if (v10 + v11 < self->_private->pageCount)
      {
        objc_msgSend(WeakRetained, "pageAtIndex:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

        goto LABEL_5;
      }
LABEL_16:
      v7 = 0;
      goto LABEL_17;
    }
  }
  v7 = 0;
LABEL_5:

  return v7;
}

- (void)generateInternalDocumentGeometry
{
  id WeakRetained;
  size_t v4;
  PDFViewLayoutPrivate *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PDFViewLayoutPrivate *v12;
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
  uint64_t v25;
  int v26;
  int v27;
  int64_t v28;
  double v29;
  double v30;
  double v31;
  PDFViewLayoutPrivate *v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD *p_x;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CGRect *v41;
  PDFViewLayoutPrivate *v42;
  unint64_t pageCount;
  uint64_t v44;
  unint64_t v45;
  double v46;
  double v47;
  uint64_t v48;
  double v49;
  void *v50;
  unint64_t v51;
  unint64_t v52;
  _QWORD *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  CGRect *pageLayoutBounds;
  CGRect *v60;
  CGRect *v61;
  double v62;
  CGRect *p_y;
  PDFViewLayoutPrivate *v64;
  uint64_t v65;
  unint64_t v66;
  _QWORD *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  CGRect *v73;
  BOOL v74;
  CGRect *v75;
  CGFloat v76;
  double v77;
  double width;
  CGRect *v79;
  CGPoint origin;
  CGSize size;
  CGSize v82;
  CGRect *v83;
  PDFViewLayoutPrivate *v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  double v88;
  double v89;
  double v90;
  double v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  CGRect *v100;
  double v101;
  CGRect *v102;
  unint64_t v103;
  BOOL v104;
  char v105;
  BOOL v106;
  CGRect *v107;
  char v108;
  CGRect *v109;
  CGRect *v110;
  double v111;
  CGRect *v112;
  CGRect *v113;
  PDFViewLayoutPrivate *v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  BOOL v118;
  CGRect *v119;
  CGPoint v120;
  CGSize v121;
  CGSize v122;
  CGRect *v123;
  PDFViewLayoutPrivate *v124;
  uint64_t v125;
  unint64_t v126;
  CGRect *v127;
  double v128;
  double *v129;
  void *v130;
  void *v131;
  id v132;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  if (!WeakRetained)
    goto LABEL_98;
  v132 = WeakRetained;
  self->_private->pageCount = objc_msgSend(WeakRetained, "pageCount");
  v4 = 32 * self->_private->pageCount;
  self->_private->pageLayoutBounds = (CGRect *)malloc_type_malloc(v4, 0xB91005F7uLL);
  bzero(self->_private->pageLayoutBounds, v4);
  WeakRetained = v132;
  v5 = self->_private;
  if (!v5->pageCount)
    goto LABEL_98;
  v6 = objc_loadWeakRetained(&v5->delegate);
  v7 = v6;
  v9 = *MEMORY[0x24BDF7718];
  v8 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v10 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v11 = *(double *)(MEMORY[0x24BDF7718] + 24);
  v12 = self->_private;
  if (v12->delegateKnowsMargins)
  {
    objc_msgSend(v6, "pageBreakMargins");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v12 = self->_private;
  }
  else
  {
    v20 = *(double *)(MEMORY[0x24BDF7718] + 24);
    v18 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v16 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v14 = *MEMORY[0x24BDF7718];
  }
  if (v12->delegateKnowsDocumentMargins)
  {
    objc_msgSend(v7, "documentMargins");
    v9 = v21;
    v8 = v22;
    v10 = v23;
    v11 = v24;
    v12 = self->_private;
  }
  if (v12->delegateKnowsDisplaysDirection)
  {
    v25 = objc_msgSend(v7, "displayDirection");
    v12 = self->_private;
  }
  else
  {
    v25 = 0;
  }
  if (v12->delegateKnowsDisplayAsBook)
  {
    v26 = objc_msgSend(v7, "displaysAsBook");
    v12 = self->_private;
  }
  else
  {
    v26 = 0;
  }
  if (v12->delegateKnowsDisplayRTL)
    v27 = objc_msgSend(v7, "displaysRTL");
  else
    v27 = 0;
  v28 = -[PDFViewLayout functionalDisplayMode](self, "functionalDisplayMode");
  v29 = v10 + v9;
  v30 = v20 + v16 + v11 + v8;
  v31 = v18 + v14 + v29;
  switch(v28)
  {
    case 0:
      v32 = self->_private;
      if (v32->pageCount)
      {
        v33 = 0;
        v34 = 0;
        do
        {
          p_x = (_QWORD *)&v32->pageLayoutBounds[v33].origin.x;
          objc_msgSend(v132, "pageAtIndex:", v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFViewLayout normalizedPageBounds:](self, "normalizedPageBounds:", v36);
          *p_x = v37;
          p_x[1] = v38;
          p_x[2] = v39;
          p_x[3] = v40;

          self->_private->pageLayoutBounds[v33].origin.x = v30 + self->_private->pageLayoutBounds[v33].origin.x;
          v41 = &self->_private->pageLayoutBounds[v33];
          v41->origin.y = v31 + v41->origin.y;
          ++v34;
          v32 = self->_private;
          ++v33;
        }
        while (v34 < v32->pageCount);
      }
      goto LABEL_97;
    case 1:
      v130 = v7;
      objc_msgSend(v132, "beginBatchPageChanges");
      v42 = self->_private;
      pageCount = v42->pageCount;
      if (pageCount)
      {
        v44 = 0;
        v45 = 0;
        v46 = v16 + v8;
        v47 = 0.0;
        v48 = -1;
        v49 = 0.0;
        v50 = v132;
        do
        {
          v51 = pageCount + v48;
          if (v25)
            v52 = v45;
          else
            v52 = pageCount + v48;
          v53 = (_QWORD *)&v42->pageLayoutBounds[v52].origin.x;
          objc_msgSend(v50, "pageAtIndex:", v52);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFViewLayout normalizedPageBounds:](self, "normalizedPageBounds:", v54);
          *v53 = v55;
          v53[1] = v56;
          v53[2] = v57;
          v53[3] = v58;

          pageLayoutBounds = self->_private->pageLayoutBounds;
          if (v25)
            v47 = fmax(v47, pageLayoutBounds[v44].size.height);
          else
            v49 = fmax(v49, pageLayoutBounds[v51].size.width);
          pageLayoutBounds[v52].origin.x = v46 + pageLayoutBounds[v52].origin.x;
          v60 = &self->_private->pageLayoutBounds[v52];
          v60->origin.y = v18 + v60->origin.y;
          v61 = self->_private->pageLayoutBounds;
          if (v45)
          {
            if (v25)
            {
              v62 = v16 + PDFRectGetMaxX(v61[v44 - 1].origin.x, v61[v44 - 1].origin.y, v61[v44 - 1].size.width);
              p_y = &self->_private->pageLayoutBounds[v44];
            }
            else
            {
              v62 = v14
                  + PDFRectGetMaxY(v61[pageCount + 1 + v48].origin.x, v61[pageCount + 1 + v48].origin.y, v61[pageCount + 1 + v48].size.width, v61[pageCount + 1 + v48].size.height);
              p_y = (CGRect *)&self->_private->pageLayoutBounds[v51].origin.y;
            }
          }
          else
          {
            p_y = (CGRect *)&v61[v52].origin.y;
            v62 = v10;
          }
          v50 = v132;
          p_y->origin.x = v62 + p_y->origin.x;
          ++v45;
          v42 = self->_private;
          pageCount = v42->pageCount;
          --v48;
          ++v44;
        }
        while (v45 < pageCount);
      }
      else
      {
        v49 = 0.0;
        v47 = 0.0;
        v50 = v132;
      }
      objc_msgSend(v50, "endBatchPageChanges");
      v124 = self->_private;
      v7 = v130;
      if (v124->pageCount)
      {
        v125 = 0;
        v126 = 0;
        do
        {
          v127 = v124->pageLayoutBounds;
          if (v25)
          {
            v128 = floor((v47 - v127[v125].size.height) * 0.5);
            v129 = &v127[v126].origin.y;
          }
          else
          {
            v129 = &v127[v125].origin.x;
            v128 = floor((v49 - v129[2]) * 0.5);
          }
          *v129 = *v129 + v128;
          ++v126;
          v124 = self->_private;
          ++v125;
        }
        while (v126 < v124->pageCount);
      }
      goto LABEL_97;
    case 2:
      v64 = self->_private;
      if (v64->pageCount)
      {
        v65 = 0;
        v66 = 0;
        do
        {
          v67 = (_QWORD *)&v64->pageLayoutBounds[v65].origin.x;
          objc_msgSend(v132, "pageAtIndex:", v66);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFViewLayout normalizedPageBounds:](self, "normalizedPageBounds:", v68);
          *v67 = v69;
          v67[1] = v70;
          v67[2] = v71;
          v67[3] = v72;

          self->_private->pageLayoutBounds[v65].origin.x = v30 + self->_private->pageLayoutBounds[v65].origin.x;
          v73 = &self->_private->pageLayoutBounds[v65];
          v73->origin.y = v31 + v73->origin.y;
          v74 = (v66 & 1) == 0;
          if (v26)
            v74 = v66;
          if (v66 && !v74)
          {
            v75 = &self->_private->pageLayoutBounds[v65];
            v76 = v75->size.height - v75[-1].size.height;
            v77 = v76 * 0.5;
            if (v76 <= 0.0)
              v75->origin.y = v75->origin.y - v77;
            else
              v75[-1].origin.y = v77 + v75[-1].origin.y;
            width = self->_private->pageLayoutBounds[v65 - 1].size.width;
            self->_private->pageLayoutBounds[v65].origin.x = width
                                                           + PDFScreenGetBackingScaleFactor() * -0.5
                                                           + self->_private->pageLayoutBounds[v65].origin.x;
            self->_private->pageLayoutBounds[v65].origin.x = v30 + self->_private->pageLayoutBounds[v65].origin.x;
            if (v27)
            {
              v79 = &self->_private->pageLayoutBounds[v65];
              origin = v79[-1].origin;
              size = v79[-1].size;
              v82 = v79->size;
              v79[-1].origin = v79->origin;
              v79[-1].size = v82;
              v83 = &self->_private->pageLayoutBounds[v65];
              v83->origin = origin;
              v83->size = size;
            }
          }
          ++v66;
          v64 = self->_private;
          ++v65;
        }
        while (v66 < v64->pageCount);
      }
      goto LABEL_97;
    case 3:
      v84 = self->_private;
      v85 = v84->pageCount;
      if (!v85)
        goto LABEL_97;
      v131 = v7;
      v86 = 0;
      v87 = 0;
      v88 = v16 + v8;
      v89 = v18 + v10;
      v90 = 0.0;
      v91 = 0.0;
      break;
    default:
      goto LABEL_97;
  }
  do
  {
    v92 = v85 + v86;
    v93 = v85 + v86 - 1;
    v94 = (_QWORD *)&v84->pageLayoutBounds[v93].origin.x;
    objc_msgSend(v132, "pageAtIndex:", v93);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFViewLayout normalizedPageBounds:](self, "normalizedPageBounds:", v95);
    *v94 = v96;
    v94[1] = v97;
    v94[2] = v98;
    v94[3] = v99;

    v100 = &self->_private->pageLayoutBounds[v93];
    v101 = v100->size.width;
    v100->origin.x = v88 + v100->origin.x;
    v102 = &self->_private->pageLayoutBounds[v93];
    v102->origin.y = v89 + v102->origin.y;
    if (v87)
    {
      v103 = v85 - 1;
      v104 = (v93 & 1) == 0;
      if (v26)
        v104 = v93;
      if (v103 == v87)
        v105 = v26;
      else
        v105 = 0;
      if ((v105 & 1) != 0 || v104)
      {
        if (v90 > 0.0)
        {
          v106 = v103 == v87;
          v107 = &self->_private->pageLayoutBounds[v93];
          v107->origin.y = v90 + v107->origin.y;
          v108 = v106 ? v26 : 0;
          if ((v108 & 1) == 0)
          {
            v109 = &self->_private->pageLayoutBounds[v92];
            v109->origin.y = v90 + v109->origin.y;
          }
        }
        v110 = &self->_private->pageLayoutBounds[v93];
        v111 = v14 + PDFRectGetMaxY(v110->origin.x, v110->origin.y, v110->size.width, v110->size.height);
        v112 = &self->_private->pageLayoutBounds[v92];
        v90 = fmax(v111, v14 + PDFRectGetMaxY(v112->origin.x, v112->origin.y, v112->size.width, v112->size.height));
      }
    }
    else
    {
      v113 = &self->_private->pageLayoutBounds[v93];
      v113->origin.y = v14 + v113->origin.y;
      v114 = self->_private;
      v115 = v114->pageCount;
      if (!v26)
      {
        if ((v115 & 1) == 0)
          goto LABEL_72;
LABEL_71:
        v90 = v14
            + PDFRectGetMaxY(v114->pageLayoutBounds[v93].origin.x, v114->pageLayoutBounds[v93].origin.y, v114->pageLayoutBounds[v93].size.width, v114->pageLayoutBounds[v93].size.height);
        goto LABEL_72;
      }
      if ((v115 & 1) == 0)
        goto LABEL_71;
    }
LABEL_72:
    v91 = fmax(v91, v101);
    ++v87;
    v84 = self->_private;
    v85 = v84->pageCount;
    --v86;
  }
  while (v87 < v85);
  v7 = v131;
  if (v85)
  {
    v116 = 0;
    v117 = 0;
    do
    {
      if (v26)
      {
        if (v117 && (v117 != v85 - 1 || (v85 & 1) != 0))
          goto LABEL_83;
      }
      else if (v117 != v85 - 1 || (v85 & 1) == 0)
      {
LABEL_83:
        v84->pageLayoutBounds[v116].origin.x = v84->pageLayoutBounds[v116].origin.x
                                             + (v91 - v84->pageLayoutBounds[v116].size.width) * 0.5;
        v118 = (v117 & 1) == 0;
        if (!v26)
          v118 = v117;
        if (v118)
        {
          self->_private->pageLayoutBounds[v116].origin.x = v91 + self->_private->pageLayoutBounds[v116].origin.x;
          self->_private->pageLayoutBounds[v116].origin.x = v20 + v16 + self->_private->pageLayoutBounds[v116].origin.x;
          if (v27)
          {
            v119 = &self->_private->pageLayoutBounds[v116];
            v120 = v119[-1].origin;
            v121 = v119[-1].size;
            v122 = v119->size;
            v119[-1].origin = v119->origin;
            v119[-1].size = v122;
            v123 = &self->_private->pageLayoutBounds[v116];
            v123->origin = v120;
            v123->size = v121;
          }
        }
        goto LABEL_88;
      }
      v84->pageLayoutBounds[v116].origin.x = v16
                                           + floor(-(v20+ v16+ v84->pageLayoutBounds[v116].size.width- (v20 + v16 + v91) * 2.0)* 0.5);
LABEL_88:
      ++v117;
      v84 = self->_private;
      v85 = v84->pageCount;
      ++v116;
    }
    while (v117 < v85);
  }
LABEL_97:

  WeakRetained = v132;
LABEL_98:

}

- (CGRect)normalizedPageBounds:(id)a3
{
  id v4;
  void *v5;
  PDFViewLayoutPrivate *v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v4 = a3;
  v5 = v4;
  v6 = self->_private;
  if (v6->delegateKnowsDisplayBox)
  {
    WeakRetained = objc_loadWeakRetained(&v6->delegate);
    objc_msgSend(v5, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));
    v9 = v8;
    v11 = v10;

  }
  else
  {
    objc_msgSend(v4, "boundsForBox:", 1);
    v9 = v12;
    v11 = v13;
  }
  v14 = PDFPointMake(0.0, 0.0);
  v16 = v15;
  v17 = objc_msgSend(v5, "rotation");
  if (v17 == 270 || v17 == 90)
  {
    v18 = v9;
  }
  else
  {
    v18 = v11;
    v11 = v9;
  }

  v19 = v14;
  v20 = v16;
  v21 = v11;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
