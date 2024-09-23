@implementation BarContainerView

- (BarContainerView)initWithFrame:(CGRect)a3
{
  BarContainerView *v3;
  uint64_t v4;
  NSMutableSet *barViews;
  BarContainerView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BarContainerView;
  v3 = -[BarContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    barViews = v3->_barViews;
    v3->_barViews = (NSMutableSet *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)registerBarView:(id)a3
{
  -[NSMutableSet addObject:](self->_barViews, "addObject:", a3);
}

- (void)didMoveToSuperview
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BarContainerView;
  -[BarContainerView didMoveToSuperview](&v2, sel_didMoveToSuperview);
}

- (void)unregisterBarView:(id)a3
{
  -[NSMutableSet removeObject:](self->_barViews, "removeObject:", a3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
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
  uint64_t v26;
  void *v27;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  v35 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = self->_barViews;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v12);
        -[BarContainerView bounds](self, "bounds");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        objc_msgSend(v13, "bounds");
        -[BarContainerView convertRect:fromView:](self, "convertRect:fromView:", v13);
        v38.origin.x = v22;
        v38.origin.y = v23;
        v38.size.width = v24;
        v38.size.height = v25;
        v36.origin.x = v15;
        v36.origin.y = v17;
        v36.size.width = v19;
        v36.size.height = v21;
        v37 = CGRectIntersection(v36, v38);
        if (!CGRectIsEmpty(v37))
        {
          -[BarContainerView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
          objc_msgSend(v13, "hitTest:withEvent:", v7);
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (void *)v26;

            goto LABEL_12;
          }
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v10)
        continue;
      break;
    }
  }

  v29.receiver = self;
  v29.super_class = (Class)BarContainerView;
  -[BarContainerView hitTest:withEvent:](&v29, sel_hitTest_withEvent_, v7, x, y);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v27;
}

- (NSSet)barViews
{
  return &self->_barViews->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barViews, 0);
}

@end
