@implementation CKConversationListTypingIndicatorView

- (CKConversationListTypingIndicatorView)init
{
  double v3;
  double v4;
  CKConversationListTypingIndicatorView *v5;
  CKConversationListTypingIndicatorView *v6;
  objc_super v8;

  +[CKTypingIndicatorLayer defaultSize](CKTypingIndicatorLayer, "defaultSize");
  v8.receiver = self;
  v8.super_class = (Class)CKConversationListTypingIndicatorView;
  v5 = -[CKConversationListTypingIndicatorView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, v3, v4);
  v6 = v5;
  if (v5)
  {
    -[CKConversationListTypingIndicatorView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("TypingIndicator"));
    -[CKConversationListTypingIndicatorView setClipsToBounds:](v6, "setClipsToBounds:", 0);
    -[CKConversationListTypingIndicatorView setTypingIndicatorScale:](v6, "setTypingIndicatorScale:", 1.0);
  }
  return v6;
}

- (void)setFlipForRTLLayout:(BOOL)a3
{
  if (self->_flipForRTLLayout != a3)
  {
    self->_flipForRTLLayout = a3;
    -[CKConversationListTypingIndicatorView _updateTypingLayerTransform](self, "_updateTypingLayerTransform");
  }
}

- (void)setTypingLayer:(id)a3
{
  CKConversationListTypingIndicatorLayer *v5;
  CKConversationListTypingIndicatorLayer **p_typingLayer;
  CKConversationListTypingIndicatorLayer *typingLayer;
  void *v8;
  CKConversationListTypingIndicatorLayer *v9;

  v5 = (CKConversationListTypingIndicatorLayer *)a3;
  p_typingLayer = &self->_typingLayer;
  typingLayer = self->_typingLayer;
  v9 = v5;
  if (typingLayer != v5)
  {
    if (typingLayer)
      -[CKConversationListTypingIndicatorLayer removeFromSuperlayer](typingLayer, "removeFromSuperlayer");
    objc_storeStrong((id *)&self->_typingLayer, a3);
    if (*p_typingLayer)
    {
      -[CKConversationListTypingIndicatorView layer](self, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSublayer:", *p_typingLayer);

      -[CKConversationListTypingIndicatorView _updateTypingLayerTransform](self, "_updateTypingLayerTransform");
      -[CKConversationListTypingIndicatorView setNeedsLayout](self, "setNeedsLayout");
      -[CKConversationListTypingIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
    }
  }

}

- (CKConversationListTypingIndicatorLayer)typingLayer
{
  CKConversationListTypingIndicatorLayer *typingLayer;
  id v4;

  typingLayer = self->_typingLayer;
  if (!typingLayer)
  {
    v4 = -[CKTypingIndicatorLayer initHighlighted:]([CKConversationListTypingIndicatorLayer alloc], "initHighlighted:", -[CKConversationListTypingIndicatorView isHighlighted](self, "isHighlighted"));
    -[CKConversationListTypingIndicatorView setTypingLayer:](self, "setTypingLayer:", v4);

    typingLayer = self->_typingLayer;
  }
  return typingLayer;
}

- (void)destroyTypingLayer
{
  -[CKConversationListTypingIndicatorView setTypingLayer:](self, "setTypingLayer:", 0);
}

- (void)startGrowAnimation
{
  void *v3;
  _QWORD v4[5];

  -[CKConversationListTypingIndicatorView typingLayer](self, "typingLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__CKConversationListTypingIndicatorView_startGrowAnimation__block_invoke;
  v4[3] = &unk_1E274A208;
  v4[4] = self;
  objc_msgSend(v3, "startGrowAnimationWithCompletionBlock:", v4);

}

uint64_t __59__CKConversationListTypingIndicatorView_startGrowAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startPulseAnimation");
}

- (void)startPulseAnimation
{
  id v2;

  -[CKConversationListTypingIndicatorView typingLayer](self, "typingLayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startPulseAnimation");

}

- (void)startShrinkAnimationWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  CKConversationListTypingIndicatorLayer *typingLayer;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  typingLayer = self->_typingLayer;
  if (typingLayer)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__CKConversationListTypingIndicatorView_startShrinkAnimationWithCompletionBlock___block_invoke;
    v7[3] = &unk_1E274DA38;
    v7[4] = self;
    v8 = v4;
    -[CKTypingIndicatorLayer startShrinkAnimationWithCompletionBlock:](typingLayer, "startShrinkAnimationWithCompletionBlock:", v7);

  }
}

uint64_t __81__CKConversationListTypingIndicatorView_startShrinkAnimationWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "destroyTypingLayer");
}

- (void)stopAnimation
{
  CKConversationListTypingIndicatorLayer *typingLayer;

  typingLayer = self->_typingLayer;
  if (typingLayer)
  {
    -[CKTypingIndicatorLayer stopAnimation](typingLayer, "stopAnimation");
    -[CKConversationListTypingIndicatorView destroyTypingLayer](self, "destroyTypingLayer");
  }
}

- (void)_updateTypingLayerTransform
{
  CGFloat v3;
  void *v4;
  uint64_t v5;
  CKConversationListTypingIndicatorLayer *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CATransform3D *v11;
  CKConversationListTypingIndicatorLayer *typingLayer;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CATransform3D v28;
  CATransform3D v29;
  CATransform3D v30;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v33;
  CATransform3D v34;

  if (self->_typingLayer)
  {
    -[CKConversationListTypingIndicatorView typingIndicatorScale](self, "typingIndicatorScale");
    if (v3 == 1.0)
    {
      if (!self->_flipForRTLLayout
        || (objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            v5 = objc_msgSend(v4, "userInterfaceLayoutDirection"),
            v4,
            v5 != 1))
      {
        typingLayer = self->_typingLayer;
        v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
        *(_OWORD *)&v33.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
        *(_OWORD *)&v33.m33 = v13;
        v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
        *(_OWORD *)&v33.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
        *(_OWORD *)&v33.m43 = v14;
        v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
        *(_OWORD *)&v33.m11 = *MEMORY[0x1E0CD2610];
        *(_OWORD *)&v33.m13 = v15;
        v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
        *(_OWORD *)&v33.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
        *(_OWORD *)&v33.m23 = v16;
        v11 = &v33;
LABEL_12:
        -[CKConversationListTypingIndicatorLayer setTransform:](typingLayer, "setTransform:", v11, *(_OWORD *)&v28.m11, *(_OWORD *)&v28.m13, *(_OWORD *)&v28.m21, *(_OWORD *)&v28.m23, *(_OWORD *)&v28.m31, *(_OWORD *)&v28.m33, *(_OWORD *)&v28.m41, *(_OWORD *)&v28.m43);
        return;
      }
      v6 = self->_typingLayer;
      v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      *(_OWORD *)&v33.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      *(_OWORD *)&v33.m33 = v7;
      v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      *(_OWORD *)&v33.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      *(_OWORD *)&v33.m43 = v8;
      v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)&v33.m11 = *MEMORY[0x1E0CD2610];
      *(_OWORD *)&v33.m13 = v9;
      v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      *(_OWORD *)&v33.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      *(_OWORD *)&v33.m23 = v10;
      CATransform3DScale(&v34, &v33, -1.0, 1.0, 1.0);
      v11 = &v34;
    }
    else
    {
      v17 = v3;
      memset(&v33, 0, sizeof(v33));
      CATransform3DMakeScale(&a, v3, v3, v3);
      -[CKConversationListTypingIndicatorLayer bounds](self->_typingLayer, "bounds");
      v18 = 1.0 - v17;
      v20 = (1.0 - v17) * v19 * -0.5;
      -[CKConversationListTypingIndicatorLayer bounds](self->_typingLayer, "bounds");
      CATransform3DMakeTranslation(&b, v20, v18 * v21 * -0.5, 0.0);
      CATransform3DConcat(&v33, &a, &b);
      if (!self->_flipForRTLLayout
        || (objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v22, "userInterfaceLayoutDirection"),
            v22,
            v23 != 1))
      {
        typingLayer = self->_typingLayer;
        v28 = v33;
        v11 = &v28;
        goto LABEL_12;
      }
      v6 = self->_typingLayer;
      v24 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      *(_OWORD *)&v28.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      *(_OWORD *)&v28.m33 = v24;
      v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      *(_OWORD *)&v28.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      *(_OWORD *)&v28.m43 = v25;
      v26 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)&v28.m11 = *MEMORY[0x1E0CD2610];
      *(_OWORD *)&v28.m13 = v26;
      v27 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      *(_OWORD *)&v28.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      *(_OWORD *)&v28.m23 = v27;
      CATransform3DScale(&v29, &v28, -1.0, 1.0, 1.0);
      v28 = v33;
      CATransform3DConcat(&v30, &v28, &v29);
      v11 = &v30;
    }
    typingLayer = v6;
    goto LABEL_12;
  }
}

- (void)resetTypingLayer
{
  if (self->_typingLayer)
  {
    -[CKConversationListTypingIndicatorView destroyTypingLayer](self, "destroyTypingLayer");
    -[CKConversationListTypingIndicatorView startPulseAnimation](self, "startPulseAnimation");
  }
}

- (void)setHighlightedState:(BOOL)a3
{
  if (self->_highlightedState != a3)
  {
    self->_highlightedState = a3;
    -[CKConversationListTypingIndicatorView resetTypingLayer](self, "resetTypingLayer");
  }
}

- (double)typingIndicatorScale
{
  return self->_typingIndicatorScale;
}

- (void)setTypingIndicatorScale:(double)a3
{
  self->_typingIndicatorScale = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlightedState;
}

- (BOOL)flipForRTLLayout
{
  return self->_flipForRTLLayout;
}

- (BOOL)isDarkAqua
{
  return self->_isDarkAqua;
}

- (void)setIsDarkAqua:(BOOL)a3
{
  self->_isDarkAqua = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingLayer, 0);
}

@end
