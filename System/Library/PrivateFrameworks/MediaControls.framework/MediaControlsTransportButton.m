@implementation MediaControlsTransportButton

- (MediaControlsTransportButton)initWithFrame:(CGRect)a3
{
  MediaControlsTransportButton *v3;
  MediaControlsTransportButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MediaControlsTransportButton;
  v3 = -[MPButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MediaControlsTransportButton setPointerInteractionEnabled:](v3, "setPointerInteractionEnabled:", 1);
    -[MediaControlsTransportButton setPointerStyleProvider:](v4, "setPointerStyleProvider:", &__block_literal_global_18);
  }
  return v4;
}

id __46__MediaControlsTransportButton_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGRect v17;
  CGRect v18;

  v2 = a2;
  objc_msgSend(v2, "cursorScale");
  objc_msgSend(v2, "bounds");
  CGRectGetWidth(v17);
  objc_msgSend(v2, "bounds");
  CGRectGetHeight(v18);
  objc_msgSend(v2, "bounds");
  UIRectCenteredRect();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v4, v6, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVisiblePath:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v2, v11);
  objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  MediaControlsTransportButton *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  MediaControlsTransportButton *v16;
  objc_super v17;

  v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MediaControlsTransportButton;
  -[MediaControlsTransportButton setHighlighted:](&v17, sel_setHighlighted_);
  if (v3)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __47__MediaControlsTransportButton_setHighlighted___block_invoke;
    v15 = &unk_1E5818C88;
    v16 = self;
    v5 = 0.2;
    v6 = &v12;
  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __47__MediaControlsTransportButton_setHighlighted___block_invoke_2;
    v10 = &unk_1E5818C88;
    v11 = self;
    v5 = 0.47;
    v6 = &v7;
  }
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, v5, 0.0, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

void __47__MediaControlsTransportButton_setHighlighted___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;

  CGAffineTransformMakeScale(&v4, 0.8, 0.8);
  objc_msgSend(*(id *)(a1 + 32), "_imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

void __47__MediaControlsTransportButton_setHighlighted___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "_imageView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v3[0] = *MEMORY[0x1E0C9BAA8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

- (MPCPlayerCommandRequest)touchUpInsideCommandRequest
{
  return self->_touchUpInsideCommandRequest;
}

- (void)setTouchUpInsideCommandRequest:(id)a3
{
  objc_storeStrong((id *)&self->_touchUpInsideCommandRequest, a3);
}

- (MPCPlayerCommandRequest)holdBeginCommandRequest
{
  return self->_holdBeginCommandRequest;
}

- (void)setHoldBeginCommandRequest:(id)a3
{
  objc_storeStrong((id *)&self->_holdBeginCommandRequest, a3);
}

- (MPCPlayerCommandRequest)holdEndCommandRequest
{
  return self->_holdEndCommandRequest;
}

- (void)setHoldEndCommandRequest:(id)a3
{
  objc_storeStrong((id *)&self->_holdEndCommandRequest, a3);
}

- (BOOL)shouldPresentActionSheet
{
  return self->_shouldPresentActionSheet;
}

- (void)setShouldPresentActionSheet:(BOOL)a3
{
  self->_shouldPresentActionSheet = a3;
}

- (BOOL)isPerformingHighlightAnimation
{
  return self->_performingHighlightAnimation;
}

- (double)cursorScale
{
  return self->_cursorScale;
}

- (void)setCursorScale:(double)a3
{
  self->_cursorScale = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_holdEndCommandRequest, 0);
  objc_storeStrong((id *)&self->_holdBeginCommandRequest, 0);
  objc_storeStrong((id *)&self->_touchUpInsideCommandRequest, 0);
}

@end
