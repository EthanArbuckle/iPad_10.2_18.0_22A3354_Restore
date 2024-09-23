@implementation MFComposeScrollView

- (MFComposeScrollView)initWithFrame:(CGRect)a3
{
  MFComposeScrollView *v3;
  uint64_t v4;
  NSMutableSet *disabledSubviews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFComposeScrollView;
  v3 = -[MFComposeScrollView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 3);
    disabledSubviews = v3->_disabledSubviews;
    v3->_disabledSubviews = (NSMutableSet *)v4;

    v3->_shouldScrollToFirstResponder = 1;
    -[MFComposeScrollView setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    -[MFComposeScrollView setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
  }
  return v3;
}

- (void)setSubviewsDisabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_subviewsDisabled != a3)
  {
    self->_subviewsDisabled = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[MFComposeScrollView subviews](self, "subviews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
          if (self->_subviewsDisabled)
            -[MFComposeScrollView disableSubview:](self, "disableSubview:", v8);
          else
            -[MFComposeScrollView enableSubview:](self, "enableSubview:", v8);
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (void)disableSubview:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isUserInteractionEnabled"))
  {
    -[NSMutableSet addObject:](self->_disabledSubviews, "addObject:", v4);
    objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  }

}

- (void)enableSubview:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_disabledSubviews, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_disabledSubviews, "removeObject:", v4);
    objc_msgSend(v4, "setUserInteractionEnabled:", 1);
  }

}

- (void)didAddSubview:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeScrollView;
  -[MFComposeScrollView didAddSubview:](&v5, sel_didAddSubview_, v4);
  if (self->_subviewsDisabled)
    -[MFComposeScrollView disableSubview:](self, "disableSubview:", v4);

}

- (void)willRemoveSubview:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeScrollView;
  -[MFComposeScrollView willRemoveSubview:](&v5, sel_willRemoveSubview_, v4);
  if (self->_subviewsDisabled)
    -[MFComposeScrollView enableSubview:](self, "enableSubview:", v4);

}

- (void)beginBlockingScroll
{
  ++self->_scrollBlocked;
}

- (void)endBlockingScroll
{
  --self->_scrollBlocked;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  objc_super v4;

  if (!self->_scrollBlocked)
  {
    v4.receiver = self;
    v4.super_class = (Class)MFComposeScrollView;
    -[MFComposeScrollView setContentOffset:animated:](&v4, sel_setContentOffset_animated_, a4, a3.x, a3.y);
  }
}

- (BOOL)_scrollsToMakeFirstResponderVisible
{
  return self->_shouldScrollToFirstResponder;
}

- (BOOL)subviewsDisabled
{
  return self->_subviewsDisabled;
}

- (BOOL)shouldScrollToFirstResponder
{
  return self->_shouldScrollToFirstResponder;
}

- (void)setShouldScrollToFirstResponder:(BOOL)a3
{
  self->_shouldScrollToFirstResponder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledSubviews, 0);
}

@end
