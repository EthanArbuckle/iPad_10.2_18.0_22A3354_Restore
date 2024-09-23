@implementation CKAttributionViewAccessoryView

- (CKAttributionViewAccessoryView)initWithFrame:(CGRect)a3 chatItem:(id)a4 layoutBounds:(CGRect)a5 windowSize:(CGSize)a6 saveStickerHandler:(id)a7
{
  CGFloat width;
  CGFloat height;
  double v9;
  CGFloat y;
  CGFloat x;
  double v12;
  double v13;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  CKAttributionViewAccessoryView *v24;
  void *v25;
  id saveStickerHandler;
  _TtC7ChatKit24CKTapbackAttributionView *v27;
  _TtC7ChatKit24CKTapbackAttributionView *attributionView;
  double v30;
  double v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v40;
  double v41;
  CGRect v42;

  width = a6.width;
  height = a5.size.height;
  v9 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v30 = a3.origin.y;
  v31 = a3.size.height;
  v12 = a3.size.width;
  v13 = a3.origin.x;
  v15 = a4;
  v16 = *(id *)&width;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "attributionViewAdditionalTopOffset");
  v19 = v18;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "attributionViewShouldCenterInTranscript");

  v22 = 0.0;
  if (v21 && v41 > 0.0)
  {
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = v9;
    v42.size.height = height;
    v22 = v9 * 0.5 + CGRectGetMinX(v42) - v41 * 0.5;
  }
  v40.receiver = self;
  v40.super_class = (Class)CKAttributionViewAccessoryView;
  v32 = xmmword_18E7CB750;
  v33 = 1;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v37 = v22;
  v38 = v19;
  v39 = 0;
  v23 = v31;
  v24 = -[_UIContextMenuAccessoryView initWithFrame:configuration:](&v40, sel_initWithFrame_configuration_, &v32, v13, v30, v12, v31, *(_QWORD *)&v30, *(_QWORD *)&v31);
  if (v24)
  {
    v25 = _Block_copy(v16);
    saveStickerHandler = v24->_saveStickerHandler;
    v24->_saveStickerHandler = v25;

    v27 = -[CKTapbackAttributionView initWithMessagePartChatItem:]([_TtC7ChatKit24CKTapbackAttributionView alloc], "initWithMessagePartChatItem:", v15);
    -[CKTapbackAttributionView setFrame:](v27, "setFrame:", 0.0, 0.0, v12, v23);
    -[CKTapbackAttributionView setDelegate:](v27, "setDelegate:", v24);
    -[CKAttributionViewAccessoryView addSubview:](v24, "addSubview:", v27);
    attributionView = v24->_attributionView;
    v24->_attributionView = v27;

  }
  return v24;
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  if (-[CKAttributionViewAccessoryView isContentVisible](self, "isContentVisible", a3, a4) != a3)
  {
    -[CKAttributionViewAccessoryView setIsContentVisible:](self, "setIsContentVisible:", v4);
    -[CKAttributionViewAccessoryView attributionView](self, "attributionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
      objc_msgSend(v6, "present");
    else
      objc_msgSend(v6, "dismiss");

  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CKAttributionViewAccessoryView attributionView](self, "attributionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hitTest:withEvent:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)tapbackAttributionView:(id)a3 didTapToSaveSticker:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a4;
  -[CKAttributionViewAccessoryView saveStickerHandler](self, "saveStickerHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKAttributionViewAccessoryView saveStickerHandler](self, "saveStickerHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (_TtC7ChatKit24CKTapbackAttributionView)attributionView
{
  return self->_attributionView;
}

- (id)saveStickerHandler
{
  return self->_saveStickerHandler;
}

- (void)setSaveStickerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (BOOL)isContentVisible
{
  return self->_isContentVisible;
}

- (void)setIsContentVisible:(BOOL)a3
{
  self->_isContentVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveStickerHandler, 0);
  objc_storeStrong((id *)&self->_attributionView, 0);
}

@end
