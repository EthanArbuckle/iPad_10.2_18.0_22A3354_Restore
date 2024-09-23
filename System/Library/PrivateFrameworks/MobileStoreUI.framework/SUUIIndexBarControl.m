@implementation SUUIIndexBarControl

- (SUUIIndexBarControl)initWithCoder:(id)a3
{
  SUUIIndexBarControl *v3;
  SUUIIndexBarControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIIndexBarControl;
  v3 = -[SUUIIndexBarControl initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    _SUUIIndexBarControlInitialization(v3);
  return v4;
}

- (SUUIIndexBarControl)initWithFrame:(CGRect)a3
{
  SUUIIndexBarControl *v3;
  SUUIIndexBarControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIIndexBarControl;
  v3 = -[SUUIIndexBarControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    _SUUIIndexBarControlInitialization(v3);
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  CGFloat width;
  CGFloat height;
  double MinY;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  CGFloat y;
  CGFloat x;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;

  v34 = *MEMORY[0x24BDAC8D0];
  -[SUUIIndexBarControl _displayEntries](self, "_displayEntries", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIIndexBarControl _visibleBounds](self, "_visibleBounds");
  width = v35.size.width;
  height = v35.size.height;
  y = v35.origin.y;
  x = v35.origin.x;
  MinY = CGRectGetMinY(v35);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v13, "size");
        v15 = v14;
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        CGRectGetMinX(v36);
        -[SUUIIndexBarControl traitCollection](self, "traitCollection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "displayScale");
        v26 = v17;
        UIRectCenteredXInRectScale();
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;

        objc_msgSend(v13, "_drawInRect:", v19, v21, v23, v25, v26);
        MinY = MinY + v15 + self->_lineSpacing;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v10);
  }

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[SUUIIndexBarControl bounds](self, "bounds", a4);
  top = self->_hitTestEdgeInsets.top;
  left = self->_hitTestEdgeInsets.left;
  v15.origin.x = v9 + left;
  v15.origin.y = v10 + top;
  v15.size.width = v11 - (left + self->_hitTestEdgeInsets.right);
  v15.size.height = v12 - (top + self->_hitTestEdgeInsets.bottom);
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(v15, v14);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUUIIndexBarControl bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)SUUIIndexBarControl;
  -[SUUIIndexBarControl setBounds:](&v15, sel_setBounds_, x, y, width, height);
  -[SUUIIndexBarControl bounds](self, "bounds");
  if (v9 != v13 || v11 != v12)
    -[SUUIIndexBarControl _invalidateForChangedLayoutProperties](self, "_invalidateForChangedLayoutProperties");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUUIIndexBarControl frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)SUUIIndexBarControl;
  -[SUUIIndexBarControl setFrame:](&v15, sel_setFrame_, x, y, width, height);
  -[SUUIIndexBarControl frame](self, "frame");
  if (v9 != v13 || v11 != v12)
    -[SUUIIndexBarControl _invalidateForChangedLayoutProperties](self, "_invalidateForChangedLayoutProperties");
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  CGAffineTransform v6;
  CGAffineTransform t1;
  objc_super v8;
  CGAffineTransform v9;

  memset(&v9, 0, sizeof(v9));
  -[SUUIIndexBarControl transform](self, "transform");
  v8.receiver = self;
  v8.super_class = (Class)SUUIIndexBarControl;
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  -[SUUIIndexBarControl setTransform:](&v8, sel_setTransform_, &t1);
  -[SUUIIndexBarControl transform](self, "transform");
  t1 = v9;
  if (!CGAffineTransformEqualToTransform(&t1, &v6))
    -[SUUIIndexBarControl _invalidateForChangedLayoutProperties](self, "_invalidateForChangedLayoutProperties");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SUUIIndexBarControl _totalSize](self, "_totalSize");
  if (width < v5)
    v5 = width;
  v7 = round(v5);
  if (height < v6)
    v6 = height;
  v8 = round(v6);
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)SUUIIndexBarControl;
  -[SUUIIndexBarControl tintColorDidChange](&v13, sel_tintColorDidChange);
  -[SUUIIndexBarControl tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMapTable count](self->_indexPathToEntryMapTable, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[NSMapTable objectEnumerator](self->_indexPathToEntryMapTable, "objectEnumerator", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setTintColor:", v3);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
      }
      while (v6);
    }

  }
  -[SUUIIndexBarControl setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIIndexBarControl;
  v4 = a3;
  -[SUUIIndexBarControl traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[SUUIIndexBarControl traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  v9 = v8;

  if (vabdd_f64(v7, v9) > 0.00000011920929)
    -[SUUIIndexBarControl setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIIndexBarControl;
  v6 = a4;
  v7 = a3;
  -[SUUIIndexBarControl beginTrackingWithTouch:withEvent:](&v9, sel_beginTrackingWithTouch_withEvent_, v7, v6);
  -[SUUIIndexBarControl _sendSelectionForTouch:withEvent:](self, "_sendSelectionForTouch:withEvent:", v7, v6, v9.receiver, v9.super_class);

  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIIndexBarControl;
  v6 = a4;
  v7 = a3;
  -[SUUIIndexBarControl continueTrackingWithTouch:withEvent:](&v9, sel_continueTrackingWithTouch_withEvent_, v7, v6);
  -[SUUIIndexBarControl _sendSelectionForTouch:withEvent:](self, "_sendSelectionForTouch:withEvent:", v7, v6, v9.receiver, v9.super_class);

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  NSIndexPath *lastSelectedIndexPath;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIIndexBarControl;
  v6 = a4;
  v7 = a3;
  -[SUUIIndexBarControl endTrackingWithTouch:withEvent:](&v9, sel_endTrackingWithTouch_withEvent_, v7, v6);
  -[SUUIIndexBarControl _sendSelectionForTouch:withEvent:](self, "_sendSelectionForTouch:withEvent:", v7, v6, v9.receiver, v9.super_class);

  lastSelectedIndexPath = self->_lastSelectedIndexPath;
  self->_lastSelectedIndexPath = 0;

  self->_didSendPastBottom = 0;
  self->_didSendPastTop = 0;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  NSIndexPath *lastSelectedIndexPath;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIIndexBarControl;
  -[SUUIIndexBarControl cancelTrackingWithEvent:](&v5, sel_cancelTrackingWithEvent_, a3);
  lastSelectedIndexPath = self->_lastSelectedIndexPath;
  self->_lastSelectedIndexPath = 0;

  self->_didSendPastBottom = 0;
  self->_didSendPastTop = 0;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    self->_hasValidTotalSize = 0;
    -[SUUIIndexBarControl _invalidateDisplayEntries](self, "_invalidateDisplayEntries");
  }
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  char v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_dataSource, obj);
    *(_BYTE *)&self->_dataSourceDelegateFlags = *(_BYTE *)&self->_dataSourceDelegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;

    v6 = objc_loadWeakRetained((id *)&self->_dataSource);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *(_BYTE *)&self->_dataSourceDelegateFlags = *(_BYTE *)&self->_dataSourceDelegateFlags & 0xFD | v7;

    -[SUUIIndexBarControl reloadData](self, "reloadData");
  }

}

- (void)setDefaultTextAttributes:(id)a3
{
  NSDictionary *v5;
  NSDictionary *defaultTextAttributes;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (NSDictionary *)a3;
  defaultTextAttributes = self->_defaultTextAttributes;
  if (defaultTextAttributes != v5
    && !-[NSDictionary isEqualToDictionary:](defaultTextAttributes, "isEqualToDictionary:", v5))
  {
    objc_storeStrong((id *)&self->_defaultTextAttributes, a3);
    if (-[NSMapTable count](self->_indexPathToEntryMapTable, "count"))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      -[NSMapTable objectEnumerator](self->_indexPathToEntryMapTable, "objectEnumerator", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        v11 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v13, "setDefaultTextAttributes:", self->_defaultTextAttributes);
              v10 = 1;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);

        if ((v10 & 1) != 0)
          -[SUUIIndexBarControl setNeedsDisplay](self, "setNeedsDisplay");
      }
      else
      {

      }
    }
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_BYTE *)&self->_dataSourceDelegateFlags = *(_BYTE *)&self->_dataSourceDelegateFlags & 0xFB | v6;

    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_BYTE *)&self->_dataSourceDelegateFlags = *(_BYTE *)&self->_dataSourceDelegateFlags & 0xF7 | v8;

    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 16;
    else
      v10 = 0;
    *(_BYTE *)&self->_dataSourceDelegateFlags = *(_BYTE *)&self->_dataSourceDelegateFlags & 0xEF | v10;

  }
}

- (void)reloadCombinedEntry
{
  SUUIIndexBarEntry *combinedEntry;

  combinedEntry = self->_combinedEntry;
  self->_combinedEntry = 0;

  if (self->_hasValidCombinedEntry)
  {
    self->_hasValidCombinedEntry = 0;
    -[SUUIIndexBarControl _invalidateDisplayEntries](self, "_invalidateDisplayEntries");
  }
}

- (void)reloadData
{
  SUUIIndexBarEntry *combinedEntry;
  NSMapTable *indexPathToEntryMapTable;
  NSMapTable *sectionIndexToNumberOfEntriesMapTable;

  combinedEntry = self->_combinedEntry;
  self->_combinedEntry = 0;

  self->_hasValidCombinedEntry = 0;
  self->_hasValidNumberOfSections = 0;
  self->_hasValidTotalSize = 0;
  indexPathToEntryMapTable = self->_indexPathToEntryMapTable;
  self->_indexPathToEntryMapTable = 0;

  sectionIndexToNumberOfEntriesMapTable = self->_sectionIndexToNumberOfEntriesMapTable;
  self->_sectionIndexToNumberOfEntriesMapTable = 0;

  self->_hasValidTotalEntryCount = 0;
  self->_totalEntryCount = 0;
  -[SUUIIndexBarControl _invalidateDisplayEntries](self, "_invalidateDisplayEntries");
}

- (void)reloadEntryAtIndexPath:(id)a3
{
  NSMapTable *sectionIndexToNumberOfEntriesMapTable;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    sectionIndexToNumberOfEntriesMapTable = self->_sectionIndexToNumberOfEntriesMapTable;
    self->_sectionIndexToNumberOfEntriesMapTable = 0;

    -[NSMapTable objectForKey:](self->_sectionIndexToNumberOfEntriesMapTable, "objectForKey:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NSMapTable removeObjectForKey:](self->_sectionIndexToNumberOfEntriesMapTable, "removeObjectForKey:", v6);
      self->_hasValidTotalSize = 0;
      -[SUUIIndexBarControl _invalidateDisplayEntries](self, "_invalidateDisplayEntries");
    }
  }

}

- (void)reloadSections:(id)a3
{
  id v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__SUUIIndexBarControl_reloadSections___block_invoke;
  v5[3] = &unk_2511F5390;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v5);
  if (*((_BYTE *)v7 + 24))
  {
    self->_hasValidTotalEntryCount = 0;
    self->_totalEntryCount = 0;
    self->_hasValidTotalSize = 0;
    -[SUUIIndexBarControl _invalidateDisplayEntries](self, "_invalidateDisplayEntries");
  }
  _Block_object_dispose(&v6, 8);

}

void __38__SUUIIndexBarControl_reloadSections___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 496);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v10, "section") == a2)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "removeObjectForKey:", v16, (_QWORD)v21);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v13);
  }

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "count"))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 496);
    *(_QWORD *)(v17 + 496) = 0;

  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 528))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    NSMapRemove(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 528), (const void *)(a2 + 1));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "count"))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(v19 + 528);
      *(_QWORD *)(v19 + 528) = 0;

    }
  }

}

- (id)_allEntries
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__104;
  v9 = __Block_byref_object_dispose__104;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__SUUIIndexBarControl__allEntries__block_invoke;
  v4[3] = &unk_2511FE258;
  v4[4] = self;
  v4[5] = &v5;
  -[SUUIIndexBarControl _enumerateEntryIndexPathsUsingBlock:](self, "_enumerateEntryIndexPathsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__SUUIIndexBarControl__allEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = v8;
  }
  objc_msgSend(*(id *)(a1 + 32), "_entryAtIndexPath:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

}

- (id)_allRequiredEntries
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__104;
  v9 = __Block_byref_object_dispose__104;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__SUUIIndexBarControl__allRequiredEntries__block_invoke;
  v4[3] = &unk_2511FE258;
  v4[4] = self;
  v4[5] = &v5;
  -[SUUIIndexBarControl _enumerateEntryIndexPathsUsingBlock:](self, "_enumerateEntryIndexPathsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__SUUIIndexBarControl__allRequiredEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = v9;
  }
  objc_msgSend(*(id *)(a1 + 32), "_entryAtIndexPath:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "visibilityPriority") == 1000)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);

}

- (void)_enumerateEntryIndexPathsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  if (v4)
  {
    v5 = -[SUUIIndexBarControl _numberOfSections](self, "_numberOfSections");
    v13 = 0;
    if (v5 >= 1)
    {
      v6 = v5;
      v7 = 0;
      do
      {
        v8 = -[SUUIIndexBarControl _numberOfEntriesInSection:](self, "_numberOfEntriesInSection:", v7);
        v9 = v13;
        if (v8 >= 1 && !v13)
        {
          v10 = v8;
          v11 = 1;
          do
          {
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v11 - 1, v7);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, v12, &v13);

            v9 = v13;
            if (v11 >= v10)
              break;
            ++v11;
          }
          while (!v13);
        }
        ++v7;
      }
      while (v7 < v6 && !v9);
    }
  }

}

- (int64_t)_numberOfEntriesInSection:(int64_t)a3
{
  const void *v5;
  NSMapTable *sectionIndexToNumberOfEntriesMapTable;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  NSMapTable *v10;
  NSMapTable *v11;
  int64_t v12;

  v5 = (const void *)(a3 + 1);
  sectionIndexToNumberOfEntriesMapTable = self->_sectionIndexToNumberOfEntriesMapTable;
  if (!sectionIndexToNumberOfEntriesMapTable
    || (v7 = NSMapGet(sectionIndexToNumberOfEntriesMapTable, (const void *)(a3 + 1))) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v9 = objc_msgSend(WeakRetained, "indexBarControl:numberOfEntriesInSection:", self, a3);

    if (!self->_sectionIndexToNumberOfEntriesMapTable)
    {
      v10 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, -[SUUIIndexBarControl _numberOfSections](self, "_numberOfSections"));
      v11 = self->_sectionIndexToNumberOfEntriesMapTable;
      self->_sectionIndexToNumberOfEntriesMapTable = v10;

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSMapInsert(self->_sectionIndexToNumberOfEntriesMapTable, v5, v7);
  }
  v12 = objc_msgSend(v7, "integerValue");

  return v12;
}

- (id)_combinedEntry
{
  SUUIIndexBarEntry *v3;
  void *WeakRetained;
  SUUIIndexBarEntry *v5;
  SUUIIndexBarEntry *combinedEntry;

  if (!self->_hasValidCombinedEntry)
  {
    if ((*(_BYTE *)&self->_dataSourceDelegateFlags & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(WeakRetained, "combinedEntryForIndexBarControl:", self);
      v5 = (SUUIIndexBarEntry *)objc_claimAutoreleasedReturnValue();
      combinedEntry = self->_combinedEntry;
      self->_combinedEntry = v5;

    }
    else
    {
      +[SUUIIndexBarEntry systemCombinedEntry](SUUIIndexBarEntry, "systemCombinedEntry");
      v3 = (SUUIIndexBarEntry *)objc_claimAutoreleasedReturnValue();
      WeakRetained = self->_combinedEntry;
      self->_combinedEntry = v3;
    }

    if (self->_combinedEntry)
      -[SUUIIndexBarControl _configureNewEntry:](self, "_configureNewEntry:");
    self->_hasValidCombinedEntry = 1;
  }
  return self->_combinedEntry;
}

- (void)_configureNewEntry:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SUUIIndexBarControl tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v4);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUUIIndexBarControl defaultTextAttributes](self, "defaultTextAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDefaultTextAttributes:", v5);

  }
}

- (id)_displayEntries
{
  NSArray *displayEntries;
  NSArray *v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double top;
  double left;
  double bottom;
  double right;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  id v40;
  id v41;
  id *location;
  id v44;
  void *v45;
  uint64_t v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  SUUIIndexBarControl *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  uint64_t *v57;
  _QWORD *v58;
  _QWORD v59[4];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;
  CGRect v66;
  CGRect v67;

  v65 = *MEMORY[0x24BDAC8D0];
  displayEntries = self->_displayEntries;
  if (self->_hasValidDisplayEntries)
  {
    v3 = displayEntries;
  }
  else
  {
    location = (id *)&self->_displayEntries;
    self->_displayEntries = 0;

    self->_hasValidDisplayEntries = 1;
    -[SUUIIndexBarControl bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    top = self->_contentEdgeInsets.top;
    left = self->_contentEdgeInsets.left;
    bottom = self->_contentEdgeInsets.bottom;
    right = self->_contentEdgeInsets.right;
    v50 = self;
    -[SUUIIndexBarControl _allEntries](self, "_allEntries");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v45;
    if (objc_msgSend(v45, "count"))
    {
      v18 = v6 + left;
      v19 = v8 + top;
      v20 = v10 - (left + right);
      v21 = v12 - (top + bottom);
      -[SUUIIndexBarControl _sizeForEntries:](v50, "_sizeForEntries:", v45);
      v23 = v22;
      v66.origin.x = v18;
      v66.origin.y = v19;
      v66.size.width = v20;
      v66.size.height = v21;
      if (v23 <= CGRectGetHeight(v66))
      {
        objc_storeStrong(location, v45);
      }
      else
      {
        v60 = 0;
        v61 = &v60;
        v62 = 0x2020000000;
        v63 = 0;
        v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v59[0] = 0;
        v59[1] = v59;
        v59[2] = 0x2020000000;
        v59[3] = 0;
        v55[0] = MEMORY[0x24BDAC760];
        v55[1] = 3221225472;
        v55[2] = __38__SUUIIndexBarControl__displayEntries__block_invoke;
        v55[3] = &unk_2511FE280;
        v57 = &v60;
        v58 = v59;
        v44 = v24;
        v56 = v44;
        objc_msgSend(v45, "enumerateObjectsUsingBlock:", v55);
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
        if (v61[3])
        {
          v26 = 1;
          v46 = 2;
          do
          {
            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            obj = v44;
            v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
            if (v27)
            {
              v48 = *(_QWORD *)v52;
              do
              {
                v49 = v27;
                for (i = 0; i != v49; ++i)
                {
                  if (*(_QWORD *)v52 != v48)
                    objc_enumerationMutation(obj);
                  v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
                  objc_msgSend(v29, "firstObject", location);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v30, "visibilityPriority") == 1000)
                  {
                    objc_msgSend(v25, "addObjectsFromArray:", v29);
                  }
                  else
                  {
                    v31 = objc_msgSend(v29, "count");
                    if (v26 >= v31)
                      goto LABEL_20;
                    v32 = 0;
                    v33 = v46;
                    do
                    {
                      -[SUUIIndexBarControl _combinedEntry](v50, "_combinedEntry");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v34)
                        objc_msgSend(v25, "addObject:", v34);
                      objc_msgSend(v29, "objectAtIndex:", v33 - 1);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v25, "addObject:", v35);

                      v32 |= v31 == v33;
                      v33 += v26;
                    }
                    while (v33 - 1 < v31);
                    if ((v32 & 1) == 0)
                    {
LABEL_20:
                      -[SUUIIndexBarControl _combinedEntry](v50, "_combinedEntry");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v36)
                        objc_msgSend(v25, "addObject:", v36);

                    }
                  }

                }
                v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
              }
              while (v27);
            }

            -[SUUIIndexBarControl _sizeForEntries:](v50, "_sizeForEntries:", v25);
            v38 = v37;
            v67.origin.x = v18;
            v67.origin.y = v19;
            v67.size.width = v20;
            v67.size.height = v21;
            if (v38 <= CGRectGetHeight(v67))
              break;
            objc_msgSend(v25, "removeAllObjects");
            ++v46;
          }
          while (v26++ < v61[3]);
        }
        if (objc_msgSend(v25, "count", location))
        {
          v40 = v25;
        }
        else
        {
          -[SUUIIndexBarControl _displayEntriesThatFitInViewForGroupedEntries](v50, "_displayEntriesThatFitInViewForGroupedEntries");
          v40 = (id)objc_claimAutoreleasedReturnValue();
        }
        v41 = *location;
        *location = v40;

        _Block_object_dispose(v59, 8);
        _Block_object_dispose(&v60, 8);
      }
      v17 = v45;
    }
    v3 = (NSArray *)*location;

  }
  return v3;
}

void __38__SUUIIndexBarControl__displayEntries__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = objc_msgSend(v8, "visibilityPriority");
  v6 = v5;
  if (v5)
  {
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (!a3)
    {
LABEL_7:
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
      objc_msgSend(v7, "addObject:", v8);
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
      goto LABEL_8;
    }
  }
  if (v5 != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);
LABEL_8:

}

- (id)_displayEntriesThatFitInViewForGroupedEntries
{
  void *v3;
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double top;
  double left;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  CGRect v27;

  -[SUUIIndexBarControl _allRequiredEntries](self, "_allRequiredEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIIndexBarControl bounds](self, "bounds");
  if (v4 >= 2)
  {
    top = self->_contentEdgeInsets.top;
    left = self->_contentEdgeInsets.left;
    v12 = v9 - (top + self->_contentEdgeInsets.bottom);
    v13 = v8 - (left + self->_contentEdgeInsets.right);
    v14 = v7 + top;
    v15 = v6 + left;
    v16 = 1;
    v17 = 2;
    do
    {
      v18 = 0;
      v19 = v4 + ~v16++;
      do
      {
        objc_msgSend(v3, "objectAtIndex:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v20);

        -[SUUIIndexBarControl _combinedEntry](self, "_combinedEntry");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21 && v18 < v19)
          objc_msgSend(v5, "addObject:", v21);

        v18 += v17;
      }
      while (v18 < v4);
      -[SUUIIndexBarControl _sizeForEntries:](self, "_sizeForEntries:", v5);
      v23 = v22;
      v27.origin.x = v15;
      v27.origin.y = v14;
      v27.size.width = v13;
      v27.size.height = v12;
      if (v23 <= CGRectGetHeight(v27))
        break;
      objc_msgSend(v5, "removeAllObjects");
      ++v17;
    }
    while (v16 != v4);
  }
  if (objc_msgSend(v5, "count"))
    v24 = v5;
  else
    v24 = 0;
  v25 = v24;

  return v25;
}

- (id)_entryAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  id WeakRetained;
  NSMapTable *indexPathToEntryMapTable;
  NSMapTable *v9;
  NSMapTable *v10;
  void *v12;
  id v13;

  v5 = a3;
  -[NSMapTable objectForKey:](self->_indexPathToEntryMapTable, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "indexBarControl:entryAtIndexPath:", self, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUIIndexBarControl.m"), 490, CFSTR("Data source (%@) must return a non-nil entry at index path %@"), v13, v5);

    }
    -[SUUIIndexBarControl _configureNewEntry:](self, "_configureNewEntry:", v6);
    indexPathToEntryMapTable = self->_indexPathToEntryMapTable;
    if (!indexPathToEntryMapTable)
    {
      v9 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
      v10 = self->_indexPathToEntryMapTable;
      self->_indexPathToEntryMapTable = v9;

      indexPathToEntryMapTable = self->_indexPathToEntryMapTable;
    }
    -[NSMapTable setObject:forKey:](indexPathToEntryMapTable, "setObject:forKey:", v6, v5);
  }

  return v6;
}

- (void)_invalidateDisplayEntries
{
  NSArray *displayEntries;

  self->_hasValidDisplayEntries = 0;
  displayEntries = self->_displayEntries;
  self->_displayEntries = 0;

  -[SUUIIndexBarControl setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_invalidateForChangedLayoutProperties
{
  -[SUUIIndexBarControl _invalidateDisplayEntries](self, "_invalidateDisplayEntries");
  -[SUUIIndexBarControl _reloadLineSpacing](self, "_reloadLineSpacing");
}

- (int64_t)_numberOfSections
{
  id WeakRetained;

  if (!self->_hasValidNumberOfSections)
  {
    if ((*(_BYTE *)&self->_dataSourceDelegateFlags & 2) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      self->_numberOfSections = objc_msgSend(WeakRetained, "numberOfSectionsInIndexBarControl:", self);

    }
    else
    {
      self->_numberOfSections = 1;
    }
    self->_hasValidNumberOfSections = 1;
  }
  return self->_numberOfSections;
}

- (BOOL)_reloadLineSpacing
{
  CGFloat Height;
  double v4;
  double v5;
  CGRect v7;

  -[SUUIIndexBarControl bounds](self, "bounds");
  Height = CGRectGetHeight(v7);
  v4 = 4.0;
  if (Height + -768.0 < -0.00000011920929)
    v4 = 1.0;
  v5 = vabdd_f64(self->_lineSpacing, v4);
  if (v5 > 0.00000011920929)
  {
    self->_lineSpacing = v4;
    self->_hasValidTotalSize = 0;
  }
  return v5 > 0.00000011920929;
}

- (void)_sendSelectionForTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  int64_t v18;
  id WeakRetained;
  uint64_t v20;
  id v21;
  NSIndexPath *lastSelectedIndexPath;
  double v23;
  NSIndexPath *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSIndexPath **p_lastSelectedIndexPath;
  NSIndexPath *v29;
  id v30;
  _QWORD v31[7];
  _QWORD v32[4];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "locationInView:", self);
  v9 = v8;
  -[SUUIIndexBarControl _visibleBounds](self, "_visibleBounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = -[SUUIIndexBarControl _totalEntryCount](self, "_totalEntryCount");
  v39.origin.x = v11;
  v39.origin.y = v13;
  v39.size.width = v15;
  v39.size.height = v17;
  if (v9 < CGRectGetMinY(v39))
  {
    if (!self->_didSendPastTop)
    {
      self->_didSendPastTop = 1;
      if ((*(_BYTE *)&self->_dataSourceDelegateFlags & 0x10) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "indexBarControlDidSelectBeyondTop:", self);

      }
    }
    v20 = 472;
LABEL_11:
    *((_BYTE *)&self->super.super.super.super.isa + v20) = 0;
    lastSelectedIndexPath = self->_lastSelectedIndexPath;
    self->_lastSelectedIndexPath = 0;

    goto LABEL_24;
  }
  v40.origin.x = v11;
  v40.origin.y = v13;
  v40.size.width = v15;
  v40.size.height = v17;
  if (v9 > CGRectGetMaxY(v40))
  {
    if (!self->_didSendPastBottom)
    {
      self->_didSendPastBottom = 1;
      if ((*(_BYTE *)&self->_dataSourceDelegateFlags & 8) != 0)
      {
        v21 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v21, "indexBarControlDidSelectBeyondBottom:", self);

      }
    }
    v20 = 473;
    goto LABEL_11;
  }
  v41.origin.x = v11;
  v41.origin.y = v13;
  v41.size.width = v15;
  v41.size.height = v17;
  v23 = v9 - CGRectGetMinY(v41);
  v42.origin.x = v11;
  v42.origin.y = v13;
  v42.size.width = v15;
  v42.size.height = v17;
  v24 = 0;
  v25 = llround(v23 / CGRectGetHeight(v42) * (double)(v18 - 1));
  if (v18 - 1 < v25)
    v25 = v18 - 1;
  v36 = __Block_byref_object_copy__104;
  v37 = __Block_byref_object_dispose__104;
  v33 = 0;
  v34 = &v33;
  v26 = v25 & ~(v25 >> 63);
  v35 = 0x3032000000;
  v38 = 0;
  if (v26 < v18)
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v32[3] = 0;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __56__SUUIIndexBarControl__sendSelectionForTouch_withEvent___block_invoke;
    v31[3] = &unk_2511FE2A8;
    v31[5] = &v33;
    v31[6] = v26;
    v31[4] = v32;
    -[SUUIIndexBarControl _enumerateEntryIndexPathsUsingBlock:](self, "_enumerateEntryIndexPathsUsingBlock:", v31);
    _Block_object_dispose(v32, 8);
    v27 = (void *)v34[5];
    if (v27)
      v24 = v27;
    else
      v24 = 0;
  }
  _Block_object_dispose(&v33, 8);

  p_lastSelectedIndexPath = &self->_lastSelectedIndexPath;
  v29 = self->_lastSelectedIndexPath;
  if (v29 != v24 && (-[NSIndexPath isEqual:](v29, "isEqual:", v24) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastSelectedIndexPath, v24);
    if (*p_lastSelectedIndexPath)
    {
      if ((*(_BYTE *)&self->_dataSourceDelegateFlags & 4) != 0)
      {
        v30 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v30, "indexBarControl:didSelectEntryAtIndexPath:", self, *p_lastSelectedIndexPath);

      }
    }
  }
  self->_didSendPastBottom = 0;
  self->_didSendPastTop = 0;

LABEL_24:
}

void __56__SUUIIndexBarControl__sendSelectionForTouch_withEvent___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = a2;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 == a1[6])
  {
    v9 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    v6 = v9;
    *a3 = 1;
    v7 = *(_QWORD *)(a1[4] + 8);
    v8 = *(_QWORD *)(v7 + 24);
  }
  *(_QWORD *)(v7 + 24) = v8 + 1;

}

- (CGSize)_sizeForEntries:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[7];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  const char *v14;
  __int128 v15;
  CGSize result;

  v4 = a3;
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x3010000000;
  v14 = "";
  v15 = *MEMORY[0x24BDBF148];
  v5 = objc_msgSend(v4, "count");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__SUUIIndexBarControl__sizeForEntries___block_invoke;
  v10[3] = &unk_2511FE2D0;
  v10[5] = &v11;
  v10[6] = v5;
  v10[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
  v6 = v12[4];
  v7 = v12[5];
  _Block_object_dispose(&v11, 8);

  v8 = v6;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

double __39__SUUIIndexBarControl__sizeForEntries___block_invoke(_QWORD *a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double result;
  uint64_t v11;

  objc_msgSend(a2, "size");
  v7 = a1[6];
  v8 = *(_QWORD *)(a1[5] + 8);
  if (*(double *)(v8 + 32) >= v5)
    v5 = *(double *)(v8 + 32);
  *(double *)(v8 + 32) = v5;
  v9 = *(_QWORD *)(a1[5] + 8);
  result = v6 + *(double *)(v9 + 40);
  *(double *)(v9 + 40) = result;
  if (v7 - 1 > a3)
  {
    v11 = *(_QWORD *)(a1[5] + 8);
    result = *(double *)(a1[4] + 512) + *(double *)(v11 + 40);
    *(double *)(v11 + 40) = result;
  }
  return result;
}

- (CGSize)_sizeForEntryAtIndexPath:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SUUIIndexBarControl _entryAtIndexPath:](self, "_entryAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)_totalEntryCount
{
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  if (!self->_hasValidTotalEntryCount)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v8 = 0;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __39__SUUIIndexBarControl__totalEntryCount__block_invoke;
    v4[3] = &unk_2511FE2F8;
    v4[4] = &v5;
    -[SUUIIndexBarControl _enumerateEntryIndexPathsUsingBlock:](self, "_enumerateEntryIndexPathsUsingBlock:", v4);
    self->_totalEntryCount = v6[3];
    _Block_object_dispose(&v5, 8);
  }
  return self->_totalEntryCount;
}

uint64_t __39__SUUIIndexBarControl__totalEntryCount__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (CGSize)_totalSize
{
  CGSize *v3;
  float64x2_t v4;
  int8x16_t v5;
  double width;
  double height;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  CGSize *v14;
  uint64_t v15;
  const char *v16;
  __int128 v17;
  CGSize result;

  if (!self->_hasValidTotalSize)
  {
    v13 = 0;
    v14 = (CGSize *)&v13;
    v15 = 0x3010000000;
    v16 = "";
    v17 = *MEMORY[0x24BDBF148];
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __33__SUUIIndexBarControl__totalSize__block_invoke;
    v8[3] = &unk_2511FE320;
    v8[4] = self;
    v8[5] = &v13;
    v8[6] = &v9;
    -[SUUIIndexBarControl _enumerateEntryIndexPathsUsingBlock:](self, "_enumerateEntryIndexPathsUsingBlock:", v8);
    v3 = v14;
    if (*((_BYTE *)v10 + 24))
    {
      v4.f64[0] = v14[2].height - self->_lineSpacing;
      v14[2].height = v4.f64[0];
    }
    else
    {
      v4.f64[0] = v14[2].height;
    }
    v4.f64[1] = v3[2].width;
    v5 = (int8x16_t)vmaxnmq_f64(vaddq_f64(vaddq_f64(*(float64x2_t *)&self->_contentEdgeInsets.top, *(float64x2_t *)&self->_contentEdgeInsets.bottom), v4), (float64x2_t)0);
    v3[2] = (CGSize)vextq_s8(v5, v5, 8uLL);
    self->_totalSize = v3[2];
    self->_hasValidTotalSize = 1;
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
  }
  width = self->_totalSize.width;
  height = self->_totalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

double __33__SUUIIndexBarControl__totalSize__block_invoke(uint64_t a1, uint64_t a2)
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "_sizeForEntryAtIndexPath:", a2);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(double *)(v5 + 32) >= v3)
    v3 = *(double *)(v5 + 32);
  *(double *)(v5 + 32) = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)(*(_QWORD *)(a1 + 32) + 512) + *(double *)(v6 + 40);
  *(double *)(v6 + 40) = result;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (CGRect)_visibleBounds
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  const char *v33;
  __int128 v34;
  __int128 v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  -[SUUIIndexBarControl _displayEntries](self, "_displayEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIIndexBarControl bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v3, "count");
  v30 = 0;
  v31 = &v30;
  v32 = 0x4010000000;
  v33 = "";
  v34 = 0u;
  v35 = 0u;
  v36.origin.x = v5;
  v36.origin.y = v7;
  v36.size.width = v9;
  v36.size.height = v11;
  v13 = CGRectGetMinX(v36) + self->_contentEdgeInsets.left;
  v37.origin.x = v5;
  v37.origin.y = v7;
  v37.size.width = v9;
  v37.size.height = v11;
  v14 = CGRectGetMinY(v37) + self->_contentEdgeInsets.top;
  *(CGFloat *)&v34 = v13;
  *((CGFloat *)&v34 + 1) = v14;
  v35 = 0uLL;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __37__SUUIIndexBarControl__visibleBounds__block_invoke;
  v29[3] = &unk_2511FE2D0;
  v29[5] = &v30;
  v29[6] = v12;
  v29[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v29);
  -[SUUIIndexBarControl traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");
  UIRectCenteredIntegralRectScale();
  v16 = v31;
  v31[4] = v17;
  v16[5] = v18;
  v16[6] = v19;
  v16[7] = v20;

  v21 = *((double *)v31 + 4);
  v22 = *((double *)v31 + 5);
  v23 = *((double *)v31 + 6);
  v24 = *((double *)v31 + 7);
  _Block_object_dispose(&v30, 8);

  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

void __37__SUUIIndexBarControl__visibleBounds__block_invoke(_QWORD *a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double Width;
  uint64_t v10;

  objc_msgSend(a2, "size");
  v6 = v5;
  v8 = v7;
  Width = CGRectGetWidth(*(CGRect *)(*(_QWORD *)(a1[5] + 8) + 32));
  if (Width < v6)
    Width = v6;
  v10 = a1[6];
  *(double *)(*(_QWORD *)(a1[5] + 8) + 48) = Width;
  *(double *)(*(_QWORD *)(a1[5] + 8) + 56) = v8 + *(double *)(*(_QWORD *)(a1[5] + 8) + 56);
  if (v10 - 1 > a3)
    *(double *)(*(_QWORD *)(a1[5] + 8) + 56) = *(double *)(a1[4] + 512)
                                                 + *(double *)(*(_QWORD *)(a1[5] + 8) + 56);
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)hitTestEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestEdgeInsets.top;
  left = self->_hitTestEdgeInsets.left;
  bottom = self->_hitTestEdgeInsets.bottom;
  right = self->_hitTestEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3
{
  self->_hitTestEdgeInsets = a3;
}

- (SUUIIndexBarControlDataSource)dataSource
{
  return (SUUIIndexBarControlDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (NSDictionary)defaultTextAttributes
{
  return self->_defaultTextAttributes;
}

- (SUUIIndexBarControlDelegate)delegate
{
  return (SUUIIndexBarControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultTextAttributes, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_sectionIndexToNumberOfEntriesMapTable, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_indexPathToEntryMapTable, 0);
  objc_storeStrong((id *)&self->_displayEntries, 0);
  objc_storeStrong((id *)&self->_combinedEntry, 0);
}

@end
