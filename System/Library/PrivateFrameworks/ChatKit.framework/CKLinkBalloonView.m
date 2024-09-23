@implementation CKLinkBalloonView

- (void)setLinkView:(id)a3
{
  LPLinkView *v5;
  LPLinkView **p_linkView;
  void *v7;
  LPLinkView *v8;

  v5 = (LPLinkView *)a3;
  p_linkView = &self->_linkView;
  if (self->_linkView != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_linkView, a3);
    if (v8)
    {
      -[LPLinkView setDelegate:](*p_linkView, "setDelegate:", self);
      -[LPLinkView _setDisableTapGesture:](*p_linkView, "_setDisableTapGesture:", 1);
      -[LPLinkView _setApplyCornerRadius:](*p_linkView, "_setApplyCornerRadius:", 0);
      -[CKLinkBalloonView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_linkView, 0);
    }
    else
    {
      -[CKLinkBalloonView linkView](self, "linkView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

    }
    v5 = v8;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  LPLinkView *linkView;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  uint8_t buf[16];
  CGSize result;

  height = a3.height;
  width = a3.width;
  linkView = self->_linkView;
  if (linkView)
  {
    -[LPLinkView sizeThatFits:](linkView, "sizeThatFits:", a4, a3.width, a3.height);
    v9 = v8;
    v11 = v10;
    if (-[CKBalloonView hasSuggestedActionsMenu](self, "hasSuggestedActionsMenu"))
    {
      -[CKBalloonView suggestedActionsMenuAdditionalHeight](self, "suggestedActionsMenuAdditionalHeight");
      v9 = v9 + v9;
      v11 = v11 + v12;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(47);
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_DEBUG, "Calling sizeThatFits when LPLinkView has not been configured yet.", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
    v19.receiver = self;
    v19.super_class = (Class)CKLinkBalloonView;
    -[CKImageBalloonView sizeThatFits:textAlignmentInsets:](&v19, sel_sizeThatFits_textAlignmentInsets_, a4, width, height);
    v9 = v15;
    v11 = v16;
  }
  v17 = v9;
  v18 = v11;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)prepareForReuse
{
  LPLinkView *linkView;
  LPLinkView *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKLinkBalloonView;
  -[CKImageBalloonView prepareForReuse](&v5, sel_prepareForReuse);
  linkView = self->_linkView;
  if (linkView)
  {
    -[LPLinkView removeFromSuperview](linkView, "removeFromSuperview");
    v4 = self->_linkView;
    self->_linkView = 0;

  }
}

- (void)layoutSubviews
{
  LPLinkView *linkView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKLinkBalloonView;
  -[CKImageBalloonView layoutSubviews](&v4, sel_layoutSubviews);
  linkView = self->_linkView;
  if (linkView)
  {
    -[CKLinkBalloonView bounds](self, "bounds");
    -[LPLinkView setFrame:](linkView, "setFrame:");
  }
}

- (void)prepareForDisplay
{
  _BOOL8 v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKLinkBalloonView;
  -[CKImageBalloonView prepareForDisplay](&v14, sel_prepareForDisplay);
  v3 = -[CKBalloonView orientation](self, "orientation") == 1;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginBalloonInsetsForMessageFromMe:", v3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CKLinkBalloonView linkView](self, "linkView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentInset:", v6, v8, v10, v12);

  -[CKLinkBalloonView sendSubviewToBack:](self, "sendSubviewToBack:", self->_linkView);
  -[LPLinkView setNeedsLayout](self->_linkView, "setNeedsLayout");
}

- (void)linkViewNeedsResize:(id)a3
{
  if (self->_linkView == a3)
  {
    objc_msgSend(a3, "setNeedsLayout");
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)_linkViewMetadataDidBecomeComplete:(id)a3
{
  if (self->_linkView == a3)
  {
    objc_msgSend(a3, "setNeedsLayout");
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (BOOL)isIrisAsset
{
  return self->_isIrisAsset;
}

- (void)setIsIrisAsset:(BOOL)a3
{
  self->_isIrisAsset = a3;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkView, 0);
}

@end
