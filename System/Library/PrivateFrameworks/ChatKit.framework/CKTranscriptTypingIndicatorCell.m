@implementation CKTranscriptTypingIndicatorCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKTranscriptTypingIndicatorCell;
  v12 = a3;
  -[CKTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v15, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "indicatorLayer", v15.receiver, v15.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptTypingIndicatorCell setIndicatorLayer:](self, "setIndicatorLayer:", v13);

  objc_msgSend(v12, "transcriptTraitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptTypingIndicatorCell setTraitCollection:](self, "setTraitCollection:", v14);
  -[CKTranscriptTypingIndicatorCell startPulseAnimation](self, "startPulseAnimation");

}

- (CKTranscriptTypingIndicatorCell)initWithFrame:(CGRect)a3
{
  CKTranscriptTypingIndicatorCell *v3;
  CKTranscriptTypingIndicatorCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptTypingIndicatorCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKTranscriptTypingIndicatorCell layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 1);

    -[CKTranscriptTypingIndicatorCell resetTypingView](v4, "resetTypingView");
  }
  return v4;
}

- (CKTypingView)typingView
{
  CKTypingView *typingView;
  CKTypingView *v4;
  CKTypingView *v5;
  void *v6;
  CKTypingView *v7;

  typingView = self->_typingView;
  if (!typingView)
  {
    v4 = [CKTypingView alloc];
    v5 = -[CKTypingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKTypingView baseLayer](v5, "baseLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCkLayerDelegate:", self);

    v7 = self->_typingView;
    self->_typingView = v5;

    typingView = self->_typingView;
  }
  return typingView;
}

- (void)resetTypingView
{
  CKTypingView *typingView;
  void *v4;
  id v5;

  -[CKTypingView removeFromSuperview](self->_typingView, "removeFromSuperview");
  typingView = self->_typingView;
  self->_typingView = 0;

  -[CKEditableCollectionViewCell contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptTypingIndicatorCell typingView](self, "typingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptTypingIndicatorCell;
  -[CKTranscriptCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKTranscriptTypingIndicatorCell resetTypingView](self, "resetTypingView");
}

- (void)setOrientation:(char)a3
{
  uint64_t v3;
  double v5;
  double v6;
  __int128 v7;
  void *v8;
  void *v9;
  double v10;
  __int128 v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;

  v3 = a3;
  if (-[CKEditableCollectionViewCell orientation](self, "orientation") != a3)
  {
    v16.receiver = self;
    v16.super_class = (Class)CKTranscriptTypingIndicatorCell;
    -[CKEditableCollectionViewCell setOrientation:](&v16, sel_setOrientation_, v3);
    if ((_DWORD)v3 == 2)
    {
      v15 = 0uLL;
      v5 = 1.0;
      v6 = -1.0;
      v14 = 0uLL;
    }
    else
    {
      v6 = *MEMORY[0x1E0C9BAA8];
      v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 8);
      v5 = *(double *)(MEMORY[0x1E0C9BAA8] + 24);
      v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v15 = v7;
    }
    -[CKTranscriptTypingIndicatorCell typingView](self, "typingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    v11 = v15;
    v12 = v5;
    v13 = v14;
    objc_msgSend(v9, "setAffineTransform:", &v10);

    -[CKTranscriptTypingIndicatorCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviewsForAlignmentContents
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptTypingIndicatorCell;
  -[CKEditableCollectionViewCell layoutSubviewsForAlignmentContents](&v20, sel_layoutSubviewsForAlignmentContents);
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKTranscriptTypingIndicatorCell typingView](self, "typingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;

  v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (-[CKEditableCollectionViewCell orientation](self, "orientation"))
  {
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    v4 = CGRectGetMaxX(v21) - v14;
  }
  -[CKTranscriptTypingIndicatorCell typingView](self, "typingView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v4, v17, v14, v16);

}

- (void)performInsertion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKTranscriptTypingIndicatorCell startGrowAnimation](self, "startGrowAnimation");
  v5 = v4;
  im_dispatch_after();

}

uint64_t __52__CKTranscriptTypingIndicatorCell_performInsertion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)performRemoval:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CKTranscriptTypingIndicatorCell stopPulseAnimation](self, "stopPulseAnimation");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    v4 = v5;
  }

}

- (void)ckLayerDidBecomeVisible:(BOOL)a3
{
  if (a3)
    -[CKTranscriptTypingIndicatorCell startPulseAnimation](self, "startPulseAnimation");
  else
    -[CKTranscriptTypingIndicatorCell stopPulseAnimation](self, "stopPulseAnimation");
}

- (void)setIndicatorLayer:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CKTranscriptTypingIndicatorCell typingView](self, "typingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIndicatorLayer:", v4);

  -[CKTranscriptTypingIndicatorCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptTypingIndicatorCell;
  v4 = a3;
  -[CKTranscriptTypingIndicatorCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[CKTranscriptTypingIndicatorCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
  {
    -[CKTranscriptTypingIndicatorCell traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptTypingIndicatorCell setTraitCollectionForIndicatorLayer:](self, "setTraitCollectionForIndicatorLayer:", v7);

  }
}

- (void)setTraitCollectionForIndicatorLayer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CKTranscriptTypingIndicatorCell indicatorLayer](self, "indicatorLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setTraitCollection:", v5);

}

- (CKTypingIndicatorLayerProtocol)indicatorLayer
{
  void *v2;
  void *v3;

  -[CKTranscriptTypingIndicatorCell typingView](self, "typingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indicatorLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKTypingIndicatorLayerProtocol *)v3;
}

- (void)startGrowAnimation
{
  void *v2;
  id v3;

  -[CKTranscriptTypingIndicatorCell typingView](self, "typingView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indicatorLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startGrowAnimation");

}

- (void)startPulseAnimation
{
  void *v2;
  id v3;

  -[CKTranscriptTypingIndicatorCell typingView](self, "typingView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indicatorLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startPulseAnimation");

}

- (void)stopPulseAnimation
{
  void *v2;
  id v3;

  -[CKTranscriptTypingIndicatorCell typingView](self, "typingView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indicatorLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopPulseAnimation");

}

- (void)startShrinkAnimation
{
  void *v2;
  id v3;

  -[CKTranscriptTypingIndicatorCell typingView](self, "typingView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indicatorLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startShrinkAnimationWithCompletionBlock:", 0);

}

- (void)setTypingView:(id)a3
{
  objc_storeStrong((id *)&self->_typingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingView, 0);
}

@end
