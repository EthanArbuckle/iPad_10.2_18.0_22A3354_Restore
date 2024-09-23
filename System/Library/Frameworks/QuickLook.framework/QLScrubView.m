@implementation QLScrubView

- (QLScrubView)init
{
  QLScrubView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *thumbViews;
  uint64_t v14;
  NSMutableArray *visibleThumbIndexes;
  void *v16;
  void *v17;
  void *v18;
  QLScrubView *v19;
  objc_super v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)QLScrubView;
  v2 = -[QLScrubView init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLScrubView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 1200);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v4);
    -[QLScrubView addSubview:](v2, "addSubview:", v5);
    -[QLScrubView sendSubviewToBack:](v2, "sendSubviewToBack:", v5);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)MEMORY[0x24BDD1628];
    v24 = CFSTR("visualEffectView");
    v25[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[visualEffectView]|"), 0, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLScrubView addConstraints:](v2, "addConstraints:", v8);

    v9 = (void *)MEMORY[0x24BDD1628];
    v22 = CFSTR("visualEffectView");
    v23 = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[visualEffectView]|"), 0, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLScrubView addConstraints:](v2, "addConstraints:", v11);

    v12 = objc_opt_new();
    thumbViews = v2->_thumbViews;
    v2->_thumbViews = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    visibleThumbIndexes = v2->_visibleThumbIndexes;
    v2->_visibleThumbIndexes = (NSMutableArray *)v14;

    v2->_selectedPage = -1;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7E0]), "initWithTarget:action:", v2, sel_panReceived_);
    objc_msgSend(v16, "setDelegate:", v2);
    -[QLScrubView addGestureRecognizer:](v2, "addGestureRecognizer:", v16);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v2, sel_tapReceived_);
    objc_msgSend(v17, "setDelegate:", v2);
    -[QLScrubView addGestureRecognizer:](v2, "addGestureRecognizer:", v17);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", v2, sel_longTapReceived_);
    objc_msgSend(v18, "setDelegate:", v2);
    -[QLScrubView addGestureRecognizer:](v2, "addGestureRecognizer:", v18);
    -[QLScrubView setDeliversTouchesForGesturesToSuperview:](v2, "setDeliversTouchesForGesturesToSuperview:", 0);
    v19 = v2;

  }
  return v2;
}

- (void)_removeThumbviews
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_thumbViews;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_thumbViews, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_visibleThumbIndexes, "removeAllObjects");
}

- (void)reloadThumbnails
{
  id WeakRetained;

  -[QLScrubView _removeThumbviews](self, "_removeThumbviews");
  self->_needsThumbLayout = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_pageCount = objc_msgSend(WeakRetained, "numberOfPagesInScrubView:", self);

  -[QLScrubView layoutSubviews](self, "layoutSubviews");
}

- (void)selectPageNumber:(int64_t)a3
{
  if ((a3 & 0x8000000000000000) == 0 && self->_pageCount > a3)
  {
    self->_selectedPage = a3;
    -[QLScrubView _updateSelectedThumbnailView](self, "_updateSelectedThumbnailView");
  }
}

- (void)_notifyPageChanged
{
  QLScrubViewDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "scrubView:didSelectPageAtIndex:", self, self->_selectedPage);

  }
}

- (void)_handleSwipAtLocation:(CGPoint)a3
{
  int64_t pageCount;
  int64_t v5;

  pageCount = self->_pageCount;
  if (pageCount)
  {
    v5 = (uint64_t)((a3.y - self->_thumbOrigin) / ((self->_thumbEnd - self->_thumbOrigin) / (double)pageCount));
    if ((v5 & 0x8000000000000000) == 0 && pageCount > v5 && self->_selectedPage != v5)
    {
      self->_selectedPage = v5;
      objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__notifyPageChanged, 0);
      -[QLScrubView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__notifyPageChanged, 0, 0.2);
      -[QLScrubView _updateSelectedThumbnailView](self, "_updateSelectedThumbnailView");
      -[QLScrubView _updatePageLabelPosition](self, "_updatePageLabelPosition");
    }
  }
}

- (void)panReceived:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
    -[QLScrubView _showPageLabel](self, "_showPageLabel");
  objc_msgSend(v4, "locationInView:", self);
  -[QLScrubView _handleSwipAtLocation:](self, "_handleSwipAtLocation:");
  v5 = objc_msgSend(v4, "state");

  if (v5 == 3)
    -[QLScrubView _hidePageLabel](self, "_hidePageLabel");
}

- (void)tapReceived:(id)a3
{
  objc_msgSend(a3, "locationInView:", self);
  -[QLScrubView _handleSwipAtLocation:](self, "_handleSwipAtLocation:");
}

- (void)longTapReceived:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
    -[QLScrubView _showPageLabel](self, "_showPageLabel");
  objc_msgSend(v4, "locationInView:", self);
  -[QLScrubView _handleSwipAtLocation:](self, "_handleSwipAtLocation:");
  v5 = objc_msgSend(v4, "state");

  if (v5 == 3)
    -[QLScrubView _hidePageLabel](self, "_hidePageLabel");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  QLScrubView *v5;

  objc_msgSend(a4, "view", a3);
  v5 = (QLScrubView *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v5 == self;

  return (char)self;
}

+ (double)defaultWidth
{
  return 61.0;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  self->_needsThumbLayout = 1;
  v3.receiver = self;
  v3.super_class = (Class)QLScrubView;
  -[QLScrubView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)_thumbnailFrameForPageAtIndex:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  double thumbHeight;
  double v11;
  double v12;
  double v13;
  int v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  CGRect result;

  v5 = -[NSMutableArray count](self->_visibleThumbIndexes, "count");
  if (v5 < 1)
  {
LABEL_6:
    v7 = -1;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_visibleThumbIndexes, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "integerValue");

      if (v9 == a3)
        break;
      if (v9 > a3)
      {
        v14 = v7;
        if ((_DWORD)v7)
          v14 = 1;
        v15 = v7 - v14;
        -[NSMutableArray objectAtIndex:](self->_visibleThumbIndexes, "objectAtIndex:", (v7 - v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");

        if (v7 != v15)
        {
          thumbHeight = self->_thumbHeight;
          v11 = self->_thumbOrigin
              + (double)v15 * (thumbHeight + 8.0)
              + floor((self->_thumbOrigin+ (double)v7 * (thumbHeight + 8.0)- (self->_thumbOrigin+ (double)v15 * (thumbHeight + 8.0)))* (double)(a3 - v17)/ (double)(v9 - v17));
          goto LABEL_8;
        }
        break;
      }
      if (v6 == ++v7)
        goto LABEL_6;
    }
  }
  thumbHeight = self->_thumbHeight;
  v11 = self->_thumbOrigin + (double)v7 * (thumbHeight + 8.0);
LABEL_8:
  v12 = 32.0;
  v13 = 17.0;
  result.size.height = thumbHeight;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v13;
  return result;
}

- (void)_showPageLabel
{
  QLPageNumberView *v3;
  QLPageNumberView *pageNumberLabel;

  if (!self->_pageNumberLabel)
  {
    v3 = objc_alloc_init(QLPageNumberView);
    pageNumberLabel = self->_pageNumberLabel;
    self->_pageNumberLabel = v3;

  }
  -[QLScrubView _updatePageLabelPosition](self, "_updatePageLabelPosition");
  -[QLScrubView addSubview:](self, "addSubview:", self->_pageNumberLabel);
  -[QLScrubView bringSubviewToFront:](self, "bringSubviewToFront:", self->_pageNumberLabel);
}

- (void)_updatePageLabelPosition
{
  QLPageNumberView *pageNumberLabel;
  NSMutableDictionary *thumbViews;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  pageNumberLabel = self->_pageNumberLabel;
  if (pageNumberLabel)
  {
    -[QLPageNumberView setPageCount:](pageNumberLabel, "setPageCount:", self->_pageCount);
    -[QLPageNumberView setPageNumber:](self->_pageNumberLabel, "setPageNumber:", self->_selectedPage + 1);
    -[QLPageNumberView sizeToFit](self->_pageNumberLabel, "sizeToFit");
    thumbViews = self->_thumbViews;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_selectedPage);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](thumbViews, "objectForKey:", v5);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[QLPageNumberView frame](self->_pageNumberLabel, "frame");
    -[QLPageNumberView setFrame:](self->_pageNumberLabel, "setFrame:", v7 - v12 + -10.0, v9 + floor((v11 - v13) * 0.5 + 2.0));

  }
}

- (void)_hidePageLabel
{
  -[QLPageNumberView removeFromSuperview](self->_pageNumberLabel, "removeFromSuperview");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int64_t pageCount;
  double v17;
  double v18;
  double v19;
  NSMutableDictionary *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t i;
  void *v29;
  uint64_t j;
  int64_t v31;
  uint64_t v32;
  NSMutableArray *visibleThumbIndexes;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  uint64_t k;
  void *v43;
  uint64_t v44;
  QLThumbnailView *v45;
  void *v46;
  id v47;
  double thumbHeight;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  _QWORD v58[4];
  QLThumbnailView *v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;
  CGRect v73;

  v71 = *MEMORY[0x24BDAC8D0];
  if (self->_needsThumbLayout)
  {
    if (self->_pageCount)
    {
      -[QLScrubView bounds](self, "bounds");
      if (v3 != 0.0)
      {
        self->_needsThumbLayout = 0;
        -[QLScrubView _removeThumbviews](self, "_removeThumbviews");
        -[QLScrubView bounds](self, "bounds");
        v5 = v4;
        -[QLScrubView topOffset](self, "topOffset");
        v7 = v5 - v6;
        WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        objc_msgSend(WeakRetained, "scrubView:pageSizeAtIndex:", self, 0);
        v10 = v9;
        v12 = v11;

        v13 = floor(v12 * 32.0 / v10);
        self->_thumbHeight = v13;
        v14 = v13 + 8.0;
        v15 = (v7 + -36.0) / v14 + 1.0;
        if ((uint64_t)v15)
        {
          if (self->_pageCount >= (uint64_t)v15)
            pageCount = (uint64_t)v15;
          else
            pageCount = self->_pageCount;
          v17 = (double)pageCount * v14 + -8.0;
          -[QLScrubView topOffset](self, "topOffset");
          v19 = v18 + floor((v7 - v17) * 0.5);
          self->_thumbOrigin = v19;
          self->_thumbEnd = v17 + v19;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          v20 = self->_thumbViews;
          v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v66;
            v24 = *MEMORY[0x24BDBF090];
            v25 = *(double *)(MEMORY[0x24BDBF090] + 8);
            v26 = *(double *)(MEMORY[0x24BDBF090] + 16);
            v27 = *(double *)(MEMORY[0x24BDBF090] + 24);
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v66 != v23)
                  objc_enumerationMutation(v20);
                -[NSMutableDictionary objectForKey:](self->_thumbViews, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "setAlwaysVisible:", 0);
                objc_msgSend(v29, "setFrame:", v24, v25, v26, v27);
                objc_msgSend(v29, "setUnselectedFrame:", v24, v25, v26, v27);

              }
              v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
            }
            while (v22);
          }

          -[NSMutableArray removeAllObjects](self->_visibleThumbIndexes, "removeAllObjects");
          if (pageCount >= 1)
          {
            for (j = 0; j != pageCount; ++j)
            {
              v31 = self->_pageCount;
              if (pageCount - 1 == j)
                v32 = v31 - 1;
              else
                v32 = (v31 / pageCount + v31) * j / pageCount;
              visibleThumbIndexes = self->_visibleThumbIndexes;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v32);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](visibleThumbIndexes, "addObject:", v34);

            }
          }
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v35 = self->_visibleThumbIndexes;
          v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v62;
            v39 = *(double *)(MEMORY[0x24BDBF090] + 8);
            v57 = *MEMORY[0x24BDBF090];
            v40 = *(double *)(MEMORY[0x24BDBF090] + 16);
            v41 = *(double *)(MEMORY[0x24BDBF090] + 24);
            do
            {
              for (k = 0; k != v37; ++k)
              {
                if (*(_QWORD *)v62 != v38)
                  objc_enumerationMutation(v35);
                v43 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
                v44 = objc_msgSend(v43, "integerValue");
                -[NSMutableDictionary objectForKey:](self->_thumbViews, "objectForKey:", v43);
                v45 = (QLThumbnailView *)objc_claimAutoreleasedReturnValue();
                if (!v45)
                {
                  v45 = -[QLThumbnailView initWithFrame:]([QLThumbnailView alloc], "initWithFrame:", v57, v39, v40, v41);
                  -[QLThumbnailView setPageNumber:](v45, "setPageNumber:", v44);
                  -[NSMutableDictionary setObject:forKey:](self->_thumbViews, "setObject:forKey:", v45, v43);
                }
                -[QLThumbnailView image](v45, "image");
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v46)
                {
                  v47 = objc_loadWeakRetained((id *)&self->_dataSource);
                  thumbHeight = self->_thumbHeight;
                  v58[0] = MEMORY[0x24BDAC760];
                  v58[1] = 3221225472;
                  v58[2] = __29__QLScrubView_layoutSubviews__block_invoke;
                  v58[3] = &unk_24C725370;
                  v59 = v45;
                  v60 = v44;
                  objc_msgSend(v47, "scrubView:thumbnailForPage:size:withCompletionBlock:", self, v44, v58, 32.0, thumbHeight);

                }
                -[QLScrubView _thumbnailFrameForPageAtIndex:](self, "_thumbnailFrameForPageAtIndex:", v44);
                v50 = v49;
                v52 = v51;
                v54 = v53;
                v56 = v55;
                -[QLThumbnailView setUnselectedFrame:](v45, "setUnselectedFrame:");
                if (v44 == self->_selectedPage)
                {
                  v72.origin.x = v50;
                  v72.origin.y = v52;
                  v72.size.width = v54;
                  v72.size.height = v56;
                  v73 = CGRectInset(v72, -8.0, -8.0);
                  -[QLThumbnailView setFrame:](v45, "setFrame:", v73.origin.x, v73.origin.y, v73.size.width, v73.size.height);
                  objc_storeStrong((id *)&self->_selectedThumbnailView, v45);
                }
                else
                {
                  -[QLThumbnailView setFrame:](v45, "setFrame:", v50, v52, v54, v56);
                }
                -[QLThumbnailView setAlwaysVisible:](v45, "setAlwaysVisible:", 1);
                -[QLScrubView addSubview:](self, "addSubview:", v45);
                -[QLScrubView bringSubviewToFront:](self, "bringSubviewToFront:", v45);

              }
              v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
            }
            while (v37);
          }

          if (self->_selectedThumbnailView)
            -[QLScrubView bringSubviewToFront:](self, "bringSubviewToFront:");
        }
      }
    }
  }
}

void __29__QLScrubView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  QLRunInMainThread();

}

uint64_t __29__QLScrubView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "pageNumber");
  if (result == *(_QWORD *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_updateSelectedThumbnailView
{
  int64_t selectedPage;
  void *v4;
  _BOOL4 v5;
  QLThumbnailView *selectedThumbnailView;
  QLThumbnailView *v7;
  QLThumbnailView *v8;
  QLThumbnailView *v9;
  double x;
  double y;
  double width;
  double height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  QLThumbnailView *v22;
  QLThumbnailView *v23;
  void *v24;
  id WeakRetained;
  int64_t v26;
  double thumbHeight;
  _QWORD v28[5];
  CGRect v29;
  CGRect v30;
  CGRect v31;

  selectedPage = self->_selectedPage;
  if ((selectedPage & 0x8000000000000000) == 0
    && (selectedPage != -[QLThumbnailView pageNumber](self->_selectedThumbnailView, "pageNumber")
     || !self->_selectedThumbnailView))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_selectedPage);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[QLThumbnailView alwaysVisible](self->_selectedThumbnailView, "alwaysVisible");
    selectedThumbnailView = self->_selectedThumbnailView;
    if (v5)
    {
      -[QLThumbnailView unselectedFrame](selectedThumbnailView, "unselectedFrame");
      -[QLThumbnailView setFrame:](self->_selectedThumbnailView, "setFrame:");
    }
    else
    {
      -[QLThumbnailView removeFromSuperview](selectedThumbnailView, "removeFromSuperview");
    }
    -[NSMutableDictionary objectForKey:](self->_thumbViews, "objectForKey:", v4);
    v7 = (QLThumbnailView *)objc_claimAutoreleasedReturnValue();
    v8 = self->_selectedThumbnailView;
    self->_selectedThumbnailView = v7;

    v9 = self->_selectedThumbnailView;
    if (v9)
    {
      -[QLThumbnailView unselectedFrame](v9, "unselectedFrame");
      x = v29.origin.x;
      y = v29.origin.y;
      width = v29.size.width;
      height = v29.size.height;
      if (CGRectEqualToRect(v29, *MEMORY[0x24BDBF090]))
      {
        -[QLScrubView _thumbnailFrameForPageAtIndex:](self, "_thumbnailFrameForPageAtIndex:", self->_selectedPage);
        x = v14;
        y = v15;
        width = v16;
        height = v17;
        -[QLThumbnailView setUnselectedFrame:](self->_selectedThumbnailView, "setUnselectedFrame:");
      }
    }
    else
    {
      -[QLScrubView _thumbnailFrameForPageAtIndex:](self, "_thumbnailFrameForPageAtIndex:", self->_selectedPage);
      x = v18;
      y = v19;
      width = v20;
      height = v21;
      v22 = -[QLThumbnailView initWithFrame:]([QLThumbnailView alloc], "initWithFrame:", v18, v19, v20, v21);
      v23 = self->_selectedThumbnailView;
      self->_selectedThumbnailView = v22;

      -[QLThumbnailView setPageNumber:](self->_selectedThumbnailView, "setPageNumber:", self->_selectedPage);
      -[QLThumbnailView setUnselectedFrame:](self->_selectedThumbnailView, "setUnselectedFrame:", x, y, width, height);
      -[NSMutableDictionary setObject:forKey:](self->_thumbViews, "setObject:forKey:", self->_selectedThumbnailView, v4);
    }
    -[QLThumbnailView image](self->_selectedThumbnailView, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      v26 = self->_selectedPage;
      thumbHeight = self->_thumbHeight;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __43__QLScrubView__updateSelectedThumbnailView__block_invoke;
      v28[3] = &unk_24C725398;
      v28[4] = self;
      objc_msgSend(WeakRetained, "scrubView:thumbnailForPage:size:withCompletionBlock:", self, v26, v28, 32.0, thumbHeight);

    }
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v31 = CGRectInset(v30, -8.0, -8.0);
    -[QLThumbnailView setFrame:](self->_selectedThumbnailView, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
    -[QLScrubView addSubview:](self, "addSubview:", self->_selectedThumbnailView);
    -[QLScrubView bringSubviewToFront:](self, "bringSubviewToFront:", self->_selectedThumbnailView);

  }
}

void __43__QLScrubView__updateSelectedThumbnailView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  QLRunInMainThread();

}

uint64_t __43__QLScrubView__updateSelectedThumbnailView__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "pageNumber");
  v3 = *(_QWORD *)(a1 + 32);
  if (result == *(_QWORD *)(v3 + 456))
    return objc_msgSend(*(id *)(v3 + 480), "setImage:", *(_QWORD *)(a1 + 40));
  return result;
}

- (QLScrubViewDataSource)dataSource
{
  return (QLScrubViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (QLScrubViewDelegate)delegate
{
  return (QLScrubViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)topOffset
{
  return self->_topOffset;
}

- (void)setTopOffset:(double)a3
{
  self->_topOffset = a3;
}

- (double)bottomOffset
{
  return self->_bottomOffset;
}

- (void)setBottomOffset:(double)a3
{
  self->_bottomOffset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_pageNumberLabel, 0);
  objc_storeStrong((id *)&self->_selectedThumbnailView, 0);
  objc_storeStrong((id *)&self->_visibleThumbIndexes, 0);
  objc_storeStrong((id *)&self->_thumbViews, 0);
}

@end
