@implementation ABCarouselView

- (id)initWithItems:(void *)a3 selectedIndex:
{
  id v6;
  id *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  unint64_t i;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id location;
  objc_super v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if (a1)
  {
    v31.receiver = a1;
    v31.super_class = (Class)ABCarouselView;
    v7 = (id *)objc_msgSendSuper2(&v31, sel_initWithFrame_, -25.0, -25.0, 50.0, 50.0);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong(v7 + 52, a2);
      v8 = objc_opt_new();
      v9 = a1[53];
      a1[53] = (id)v8;

      a1[55] = a3;
      v10 = objc_opt_new();
      v11 = a1[60];
      a1[60] = (id)v10;

      v12 = objc_opt_new();
      v13 = a1[54];
      a1[54] = (id)v12;

      objc_msgSend(a1, "traitCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "layoutDirection") == 1;

      if (v15)
        v16 = objc_msgSend(a1[52], "count") + ~(unint64_t)a1[55];
      else
        v16 = (uint64_t)a1[55];
      objc_msgSend(a1, "_itemPageWidth");
      objc_msgSend(a1[54], "setValue:", v17 * (double)v16);
      objc_initWeak(&location, a1);
      v18 = (void *)MEMORY[0x24BDF6F90];
      v32[0] = a1[54];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = MEMORY[0x24BDAC760];
      v26 = 3221225472;
      v27 = __46__ABCarouselView_initWithItems_selectedIndex___block_invoke;
      v28 = &unk_25073EE18;
      objc_copyWeak(&v29, &location);
      objc_msgSend(v18, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v19, &v25);

      for (i = 0; i < objc_msgSend(a1[52], "count", v25, v26, v27, v28); ++i)
      {
        objc_msgSend(a1[52], "objectAtIndexedSubscript:", i);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_addItemViewForItem:index:", v21, i);

      }
      v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", a1, sel__handleScrollGesture_);
      v23 = a1[62];
      a1[62] = (id)v22;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void __46__ABCarouselView_initWithItems_selectedIndex___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (id)items
{
  if (a1)
    a1 = (id *)a1[52];
  return a1;
}

- (BOOL)isDragging
{
  if (result)
    return *(_QWORD *)(result + 448) != 0;
  return result;
}

- (id)scrollToItemAtIndex:(int)a3 animated:
{
  id *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;

  if (result)
  {
    v5 = result;
    objc_msgSend(result, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "layoutDirection");

    if (v7 == 1)
      a2 = objc_msgSend(v5[52], "count") + ~a2;
    objc_msgSend(v5, "_itemPageWidth");
    v9 = v8 * (double)a2;
    v10 = v5[54];
    if (a3)
      return (id *)objc_msgSend(v10, "setInput:", v9);
    else
      return (id *)objc_msgSend(v10, "setOutput:", v9);
  }
  return result;
}

- (void)reloadWithItems:(int)a3 animated:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = v6;
  if (a1)
  {
    objc_msgSend(v6, "differenceFromArray:withOptions:", *(_QWORD *)(a1 + 416), 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasChanges"))
    {
      v21 = a3;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v20 = v8;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            v15 = objc_msgSend(v14, "changeType");
            if (v15 == 1)
            {
              if (objc_msgSend(v14, "associatedIndex") == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(*(id *)(a1 + 424), "objectAtIndexedSubscript:", objc_msgSend(v14, "index"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "removeFromSuperview");

                objc_msgSend(*(id *)(a1 + 424), "removeObjectAtIndex:", objc_msgSend(v14, "index"));
              }
            }
            else if (!v15)
            {
              if (objc_msgSend(v14, "associatedIndex") == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v14, "object");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)a1, "_addItemViewForItem:index:", v16, objc_msgSend(v14, "index"));
              }
              else
              {
                objc_msgSend(*(id *)(a1 + 424), "objectAtIndexedSubscript:", objc_msgSend(v14, "associatedIndex"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 424), "removeObjectAtIndex:", objc_msgSend(v14, "associatedIndex"));
                objc_msgSend(*(id *)(a1 + 424), "setObject:atIndexedSubscript:", v16, objc_msgSend(v14, "index"));
              }

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v11);
      }

      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __43__ABCarouselView_reloadWithItems_animated___block_invoke;
      v22[3] = &unk_25073ED10;
      v22[4] = a1;
      v18 = MEMORY[0x23B7E420C](v22);
      v19 = (void *)v18;
      if (!v21 || *(_QWORD *)(a1 + 448) || *(_QWORD *)(a1 + 456))
        (*(void (**)(uint64_t))(v18 + 16))(v18);
      else
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 0, v18, 0, 0.5, 0.15, 0.0, 0.0);
      v8 = v20;
      objc_storeStrong((id *)(a1 + 416), a2);
      objc_msgSend((id)a1, "setNeedsLayout");

    }
  }

}

unint64_t __43__ABCarouselView_reloadWithItems_animated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t result;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutDirection");

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "count");
  if (result)
  {
    v5 = 0;
    v6 = -1;
    do
    {
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "count") + v6;
      if (v3 != 1)
        v7 = v5;
      v8 = (double)v7 * 49.0 + 0.5 + (double)v7 * 50.0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "objectAtIndexedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFrame:", v8, 0.5, 49.0, 49.0);

      ++v5;
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "count");
      --v6;
    }
    while (v5 < result);
  }
  return result;
}

- (void)setZPosition:(double)a3 forItemAtIndex:
{
  void *v4;
  id v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 424), "objectAtIndexedSubscript:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setZPosition:", a3);

  }
}

- (void)applyAlphaBlend:(double)a3 toItemsAtIndexes:
{
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (ABEqualObjects(v6, a1[58]))
    {
      v7 = ABEqualObjects(a1[59], v10);

      if ((v7 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = a1[58];
    a1[58] = (void *)v8;

    objc_storeStrong(a1 + 59, a2);
    objc_msgSend(a1, "setNeedsLayout");
  }
LABEL_7:

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSNumber *decelerationOffset;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  _BYTE *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int64_t v33;
  void *v34;
  char v35;
  void *v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)ABCarouselView;
  -[ABCarouselView layoutSubviews](&v39, sel_layoutSubviews);
  -[ABCarouselView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[ABFloatSpringProperty output](self->_offsetSpring, "output");
  v10 = v9;
  -[NSNumber doubleValue](self->_decelerationOffset, "doubleValue");
  if (v11 == v10)
  {
    decelerationOffset = self->_decelerationOffset;
    self->_decelerationOffset = 0;

  }
  -[ABCarouselView setBounds:](self, "setBounds:", v10, v4, v6, v8);
  -[ABCarouselView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "layoutDirection");

  -[ABFloatSpringProperty output](self->_offsetSpring, "output");
  v16 = v15;
  -[ABCarouselView _itemPageWidth](self, "_itemPageWidth");
  v18 = round(v16 / v17);
  if (v14 == 1)
    v18 = (double)(unint64_t)(-[NSMutableArray count](self->_itemViews, "count") - 1) - v18;
  if (-[NSMutableArray count](self->_itemViews, "count"))
  {
    v19 = 0;
    v20 = (double)(uint64_t)v18;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (double)v19 - v20;
      if (v22 < 0.0)
        v22 = -v22;
      v23 = fmax(v22, 0.0);
      if (v23 > 1.0)
        v23 = 1.0;
      v24 = ABClamp(v23, 0.0, 1.0);
      -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v19);
      v25 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      v26 = 0.2;
      if (v25)
      {
        if (v25[8])
          v26 = 1.0;
        else
          v26 = 0.2;
      }

      objc_msgSend(v21, "setAlpha:", v26 * 0.55 + v24 * (v26 * 0.25 - v26 * 0.55));
      if (self->_alphaBlend && -[NSIndexSet containsIndex:](self->_indexesToApplyAlphaBlend, "containsIndex:", v19))
      {
        -[NSNumber doubleValue](self->_alphaBlend, "doubleValue");
        v28 = v27;
        objc_msgSend(v21, "alpha");
        objc_msgSend(v21, "setAlpha:", v28 * v29);
      }
      CGAffineTransformMakeScale(&v38, v24 * -0.05 + 1.0, v24 * -0.05 + 1.0);
      v37 = v38;
      objc_msgSend(v21, "setTransform:", &v37);

      ++v19;
    }
    while (v19 < (unint64_t)-[NSMutableArray count](self->_itemViews, "count"));
  }
  -[ABFloatSpringProperty input](self->_offsetSpring, "input");
  v31 = v30;
  -[ABCarouselView _itemPageWidth](self, "_itemPageWidth");
  v33 = llround(v31 / v32);
  if (v14 == 1)
    v33 = -[NSMutableArray count](self->_itemViews, "count") + ~v33;
  if (self->_selectedIndex != v33)
  {
    self->_selectedIndex = v33;
    -[UISelectionFeedbackGenerator selectionChanged](self->_feedbackGenerator, "selectionChanged");
    -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_opt_respondsToSelector();

    if ((v35 & 1) != 0)
    {
      -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "carouselView:didSelectItemAtIndex:", self, self->_selectedIndex);

    }
  }
}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 61);
  return WeakRetained;
}

- (void)_handleScrollGesture:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "state") == 1)
  {
    objc_msgSend(v9, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslation:inView:", v4, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

    -[ABCarouselView _beginTracking](self, "_beginTracking");
  }
  else if (objc_msgSend(v9, "state") == 2)
  {
    objc_msgSend(v9, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "translationInView:", v5);
    v7 = v6;

    objc_msgSend(v9, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslation:inView:", v8, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

    -[ABCarouselView _trackDelta:](self, "_trackDelta:", v7);
  }
  else
  {
    -[ABCarouselView _endTracking](self, "_endTracking");
  }

}

- (void)_handleTapGesture:(id)a3
{
  NSMutableArray *itemViews;
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  double v9;

  itemViews = self->_itemViews;
  objc_msgSend(a3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableArray indexOfObject:](itemViews, "indexOfObject:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ABCarouselView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "layoutDirection");

    if (v8 == 1)
      v6 = -[NSArray count](self->_items, "count") + ~v6;
    -[ABCarouselView _itemPageWidth](self, "_itemPageWidth");
    -[ABFloatSpringProperty setInput:](self->_offsetSpring, "setInput:", v9 * (double)v6);
  }
}

- (void)_addItemViewForItem:(id)a3 index:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  ABCarouselItemView *v11;

  v6 = a3;
  v11 = -[ABCarouselItemView initWithItem:]([ABCarouselItemView alloc], "initWithItem:", v6);

  -[ABCarouselView addSubview:](self, "addSubview:", v11);
  -[ABCarouselView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "layoutDirection");

  v9 = -[NSArray count](self->_items, "count") + ~a4;
  if (v8 != 1)
    v9 = a4;
  -[ABCarouselItemView setFrame:](v11, "setFrame:", (double)v9 * 49.0 + 0.5 + (double)v9 * 50.0, 0.5, 49.0, 49.0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__handleTapGesture_);
  -[ABCarouselItemView addGestureRecognizer:](v11, "addGestureRecognizer:", v10);
  -[NSMutableArray insertObject:atIndex:](self->_itemViews, "insertObject:atIndex:", v11, a4);

}

- (double)_minOffset
{
  return 0.0;
}

- (double)_contentWidth
{
  double v3;

  v3 = (double)(-[NSArray count](self->_items, "count") - 1);
  return (double)(-[NSArray count](self->_items, "count") - 1) * 50.0 + v3 * 49.0;
}

- (double)_itemPageWidth
{
  double v3;
  double v4;
  double v5;

  -[ABCarouselView _contentWidth](self, "_contentWidth");
  v4 = v3;
  -[ABCarouselView _minOffset](self, "_minOffset");
  return (v4 - v5) / (double)(-[NSArray count](self->_items, "count") - 1);
}

- (void)_beginTracking
{
  void *v3;
  NSNumber *v4;
  NSNumber *dragInitialOffset;
  void *v6;
  char v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[ABFloatSpringProperty output](self->_offsetSpring, "output");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  dragInitialOffset = self->_dragInitialOffset;
  self->_dragInitialOffset = v4;

  -[UISelectionFeedbackGenerator prepare](self->_feedbackGenerator, "prepare");
  -[ABFloatSpringProperty setTrackingBounce:duration:](self->_offsetSpring, "setTrackingBounce:duration:", 0.0, 0.08);
  -[ABFloatSpringProperty setTracking:](self->_offsetSpring, "setTracking:", 1);
  -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "carouselViewWillStartDragging:", self);

  }
}

- (void)_trackDelta:(double)a3
{
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
  BOOL v16;
  BOOL v17;
  double v18;
  double v19;
  void *v20;
  char v21;
  double v22;
  double v23;
  double v24;
  id v25;

  -[ABFloatSpringProperty input](self->_offsetSpring, "input");
  v6 = v5;
  -[ABCarouselView _minOffset](self, "_minOffset");
  v8 = v7;
  -[ABCarouselView _contentWidth](self, "_contentWidth");
  if (v8 >= v6)
    v10 = v8;
  else
    v10 = v6;
  if (v10 <= v9)
    v11 = v10;
  else
    v11 = v9;
  v12 = 10.0;
  if (v6 >= v8)
    v13 = 10.0;
  else
    v13 = -10.0;
  v14 = -v13;
  if (v6 >= v8)
    v14 = 10.0;
  if (v14 != 0.0)
    v11 = v11 + (-1.0 / ((v6 - v11) / v13 + -1.0) + -1.0) / 0.55 * v13;
  v15 = v11 - a3;
  v16 = v11 - a3 < v8;
  v17 = v11 - a3 <= v8;
  if (v11 - a3 >= v8)
    v18 = 10.0;
  else
    v18 = -10.0;
  if (v17)
    v19 = v8;
  else
    v19 = v15;
  if (v16)
    v12 = -v18;
  if (v19 <= v9)
    v9 = v19;
  if (v12 != 0.0)
    v9 = v9 + (1.0 - 1.0 / ((v15 - v9) / v18 * 0.55 + 1.0)) * v18;
  -[ABFloatSpringProperty setOutput:](self->_offsetSpring, "setOutput:", v9);
  -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[ABFloatSpringProperty output](self->_offsetSpring, "output");
    v23 = v22;
    -[NSNumber doubleValue](self->_dragInitialOffset, "doubleValue");
    objc_msgSend(v25, "carouselView:didDragToOffset:initialOffset:", self, v23, v24);

  }
}

- (void)_endTracking
{
  NSNumber *dragInitialOffset;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  ABFloatSpringProperty *offsetSpring;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  NSNumber *v19;
  NSNumber *decelerationOffset;
  NSNumber *v21;
  void *v22;
  char v23;
  id v24;

  dragInitialOffset = self->_dragInitialOffset;
  self->_dragInitialOffset = 0;

  -[ABFloatSpringProperty setTracking:](self->_offsetSpring, "setTracking:", 0);
  -[UIViewFloatAnimatableProperty velocity](self->_offsetSpring, "velocity");
  v5 = v4;
  -[ABFloatSpringProperty projectForDeceleration:](self->_offsetSpring, "projectForDeceleration:", 0.992);
  v7 = v6;
  -[ABCarouselView _minOffset](self, "_minOffset");
  if (v7 >= v8 && (-[ABCarouselView _contentWidth](self, "_contentWidth"), v7 <= v9))
  {
    offsetSpring = self->_offsetSpring;
    v12 = -v5;
    if (v5 >= 0.0)
      v12 = v5;
    v11 = v12 * 0.05 / 1000.0 + 0.45;
  }
  else
  {
    offsetSpring = self->_offsetSpring;
    v11 = 0.55;
  }
  -[ABFloatSpringProperty setBounce:duration:](offsetSpring, "setBounce:duration:", 0.175, v11);
  -[ABCarouselView _itemPageWidth](self, "_itemPageWidth");
  v14 = v13 * round(v7 / v13);
  -[ABCarouselView _minOffset](self, "_minOffset");
  v16 = v15;
  -[ABCarouselView _contentWidth](self, "_contentWidth");
  -[ABFloatSpringProperty setInput:](self->_offsetSpring, "setInput:", ABClamp(v14, v16, v17));
  v18 = (void *)MEMORY[0x24BDD16E0];
  -[ABFloatSpringProperty input](self->_offsetSpring, "input");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  decelerationOffset = self->_decelerationOffset;
  self->_decelerationOffset = v19;

  v21 = self->_dragInitialOffset;
  self->_dragInitialOffset = 0;

  -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "carouselViewWillEndDragging:", self);

  }
}

- (id)setDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 61, a2);
  return result;
}

- (uint64_t)scrollGestureRecognizer
{
  if (result)
    return *(_QWORD *)(result + 496);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_indexesToApplyAlphaBlend, 0);
  objc_storeStrong((id *)&self->_alphaBlend, 0);
  objc_storeStrong((id *)&self->_decelerationOffset, 0);
  objc_storeStrong((id *)&self->_dragInitialOffset, 0);
  objc_storeStrong((id *)&self->_offsetSpring, 0);
  objc_storeStrong((id *)&self->_itemViews, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
