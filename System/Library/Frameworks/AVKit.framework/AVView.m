@implementation AVView

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVView;
  -[AVView setHidden:](&v4, sel_setHidden_, a3);
  if (-[AVView hasBackdropView](self, "hasBackdropView"))
    -[UIView avkit_needsUpdateBackdropCaptureViewHidden](self, "avkit_needsUpdateBackdropCaptureViewHidden");
}

- (BOOL)hasBackdropView
{
  return self->_hasBackdropView;
}

- (void)setHasBackdropView:(BOOL)a3
{
  self->_hasBackdropView = a3;
}

- (void)setIgnoresTouches:(BOOL)a3
{
  self->_ignoresTouches = a3;
}

- (void)_commonInit
{
  CGSize v2;

  self->_automaticallyUpdatesSubviewContentIntersections = 0;
  v2 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_contentIntersection.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_contentIntersection.size = v2;
}

- (AVView)init
{
  AVView *v2;
  AVView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVView;
  v2 = -[AVView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AVView _commonInit](v2, "_commonInit");
  return v3;
}

- (AVView)initWithCoder:(id)a3
{
  AVView *v3;
  AVView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVView;
  v3 = -[AVView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AVView _commonInit](v3, "_commonInit");
  return v4;
}

- (AVView)initWithFrame:(CGRect)a3
{
  AVView *v3;
  AVView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVView;
  v3 = -[AVView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AVView _commonInit](v3, "_commonInit");
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  AVView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVView;
  -[AVView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (AVView *)objc_claimAutoreleasedReturnValue();
  if (-[AVView ignoresTouches](self, "ignoresTouches") && v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVView;
  -[AVView layoutSubviews](&v3, sel_layoutSubviews);
  -[AVView _updateSubviewContentIntersectionsIfNeeded](self);
}

- (void)setAutomaticallyUpdatesSubviewContentIntersections:(BOOL)a3
{
  if (a3)
  {
    self->_automaticallyUpdatesSubviewContentIntersections = 1;
    -[AVView _updateSubviewContentIntersectionsIfNeeded](self);
  }
}

- (void)setContentIntersection:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentIntersection;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentIntersection = &self->_contentIntersection;
  if (!CGRectEqualToRect(self->_contentIntersection, a3))
  {
    p_contentIntersection->origin.x = x;
    p_contentIntersection->origin.y = y;
    p_contentIntersection->size.width = width;
    p_contentIntersection->size.height = height;
    -[AVView _updateSubviewContentIntersectionsIfNeeded](self);
  }
}

- (void)interruptActiveInteractions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[AVView subviews](self, "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EEC98450))
          objc_msgSend(v7, "interruptActiveInteractions");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)automaticallyUpdatesSubviewContentIntersections
{
  return self->_automaticallyUpdatesSubviewContentIntersections;
}

- (CGRect)contentIntersection
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentIntersection.origin.x;
  y = self->_contentIntersection.origin.y;
  width = self->_contentIntersection.size.width;
  height = self->_contentIntersection.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)ignoresTouches
{
  return self->_ignoresTouches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subviewsNeedingIntersectionUpdate, 0);
}

- (void)_updateSubviewContentIntersectionsIfNeeded
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v26 = *MEMORY[0x1E0C80C00];
  if (a1 && a1[456])
  {
    objc_msgSend(a1, "subviews");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v22 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EEC983D0))
          {
            v8 = v7;
            objc_msgSend(a1, "contentIntersection");
            v10 = v9;
            v12 = v11;
            v14 = v13;
            v16 = v15;
            objc_msgSend(v8, "frame");
            v29.origin.x = v17;
            v29.origin.y = v18;
            v29.size.width = v19;
            v29.size.height = v20;
            v27.origin.x = v10;
            v27.origin.y = v12;
            v27.size.width = v14;
            v27.size.height = v16;
            v28 = CGRectIntersection(v27, v29);
            objc_msgSend(v8, "convertRect:fromView:", a1, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
            objc_msgSend(v8, "setContentIntersection:");

          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v4);
    }

  }
}

@end
