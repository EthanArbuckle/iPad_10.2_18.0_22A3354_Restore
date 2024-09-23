@implementation PDFCoachMarkManager

- (PDFCoachMarkManager)initWithPDFRenderingProperties:(id)a3
{
  id v4;
  PDFCoachMarkManager *v5;
  PDFCoachMarkManagerPrivate *v6;
  PDFCoachMarkManagerPrivate *v7;
  NSMutableDictionary *v8;
  PDFCoachMarkManagerPrivate *v9;
  NSMutableDictionary *coachMarks;
  PDFTimer *v11;
  PDFCoachMarkManagerPrivate *v12;
  PDFTimer *timer;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDFCoachMarkManager;
  v5 = -[PDFCoachMarkManager init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(PDFCoachMarkManagerPrivate);
    v7 = v5->_private;
    v5->_private = v6;

    objc_storeWeak((id *)&v5->_private->renderingProperties, v4);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v9 = v5->_private;
    coachMarks = v9->coachMarks;
    v9->coachMarks = v8;

    v11 = -[PDFTimer initWithThrottleDelay:forSelector:forTarget:]([PDFTimer alloc], "initWithThrottleDelay:forSelector:forTarget:", sel__cleanCoachMarks, v5, 1.7);
    v12 = v5->_private;
    timer = v12->timer;
    v12->timer = v11;

  }
  return v5;
}

- (void)createCoachMarkForPage:(id)a3 atFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  PDFCoachMark *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *coachMarks;
  void *v14;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (!CGRectIsNull(v16))
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    if (!CGRectIsInfinite(v17))
    {
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      if (!CGRectIsEmpty(v18) && PDFRectValid(x, y, width, height))
      {
        v9 = -[PDFCoachMark initWithFrame:]([PDFCoachMark alloc], "initWithFrame:", x, y, width, height);
        -[PDFTimer update](self->_private->timer, "update");
        -[PDFCoachMarkManager _pageLayerForPage:](self, "_pageLayerForPage:", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[PDFCoachMark playEffect:](v9, "playEffect:", v10);
        }
        else
        {
          objc_msgSend(v15, "document");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "indexForPage:", v15);

          coachMarks = self->_private->coachMarks;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](coachMarks, "setObject:forKey:", v9, v14);

        }
      }
    }
  }

}

- (void)pageLayerDidAppear:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *coachMarks;
  void *v9;
  void *v10;
  double v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "page");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexForPage:", v5);

    coachMarks = self->_private->coachMarks;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](coachMarks, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "effectTimeLeft");
      if (v11 >= 0.0)
        objc_msgSend(v10, "playEffect:", v14);
      v12 = self->_private->coachMarks;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

    }
  }

}

- (void)pageLayerWillRemove:(id)a3
{
  void *v4;
  uint64_t v5;
  NSMutableDictionary *coachMarks;
  void *v7;
  id v8;

  objc_msgSend(a3, "page");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexForPage:", v8);

  coachMarks = self->_private->coachMarks;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](coachMarks, "removeObjectForKey:", v7);

}

- (void)_cleanCoachMarks
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_private->coachMarks;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_private->coachMarks, "objectForKey:", v9, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "effectTimeLeft");
        if (v11 < 0.0)
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->_private->coachMarks, "removeObjectsForKeys:", v3);
}

- (id)_pageLayerForPage:(id)a3
{
  PDFRenderingProperties **p_renderingProperties;
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  p_renderingProperties = &self->_private->renderingProperties;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_renderingProperties);
  objc_msgSend(v4, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexForPage:", v4);

  objc_msgSend(WeakRetained, "pdfView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "pageViewForPageAtIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pageLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
