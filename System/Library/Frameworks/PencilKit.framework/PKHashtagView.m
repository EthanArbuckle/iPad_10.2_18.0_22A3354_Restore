@implementation PKHashtagView

- (PKHashtagView)initWithHashtagItem:(id)a3 inDrawing:(id)a4
{
  PKHashtagItem *v6;
  id v7;
  PKHashtagView *v8;
  PKHashtagItem *hashtagItem;
  PKHashtagItem *v10;
  objc_super v12;

  v6 = (PKHashtagItem *)a3;
  v12.receiver = self;
  v12.super_class = (Class)PKHashtagView;
  v7 = a4;
  v8 = -[PKDetectionView init](&v12, sel_init);
  hashtagItem = v8->_hashtagItem;
  v8->_hashtagItem = v6;
  v10 = v6;

  -[PKDetectionItem setDrawing:](v8->_hashtagItem, "setDrawing:", v7, v12.receiver, v12.super_class);
  return v8;
}

- (id)item
{
  return self->_hashtagItem;
}

- (id)_underlineColor
{
  void *v3;
  void *v4;

  -[PKHashtagView hashtagItem](self, "hashtagItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "active") & 1) != 0)
    -[PKHashtagView tintColor](self, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_underlineThickness
{
  return 1.0;
}

- (void)updateActivationState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[PKHashtagView hashtagItem](self, "hashtagItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hashtagUUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PKHashtagView hashtagItem](self, "hashtagItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateUUID");

  -[PKHashtagView hashtagItem](self, "hashtagItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hashtagUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v6 && (objc_msgSend(v9, "isEqual:", v6) & 1) == 0)
  {
    -[PKHashtagView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      objc_msgSend(v7, "hashtagViewDidActivateHashtag:", self);
    else
      objc_msgSend(v7, "hashtagViewWillDeactivateHashtag:", self);

    -[PKHashtagView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (id)accessibilityIdentifier
{
  return CFSTR("com.apple.pencilkit.hashtagView");
}

- (id)accessibilityValue
{
  return -[PKHashtagItem hashtagResult](self->_hashtagItem, "hashtagResult");
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__PKHashtagView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v5[3] = &unk_1E777AB90;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __71__PKHashtagView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "hashtagItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "active");
  _PencilKitBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
    v6 = CFSTR("Convert to text");
  else
    v6 = CFSTR("Convert to tag");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v6, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(*(id *)(a1 + 32), "hashtagItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "active"))
    v10 = CFSTR("textformat");
  else
    v10 = CFSTR("number");
  objc_msgSend(v8, "systemImageNamed:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3428];
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __71__PKHashtagView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v24 = &unk_1E7778D68;
  v25 = *(_QWORD *)(a1 + 32);
  v26 = v7;
  v13 = v7;
  objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v13, v11, 0, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(*(id *)(a1 + 32), "hashtagItem", v21, v22, v23, v24, v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hashtagResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "menuWithTitle:children:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __71__PKHashtagView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "hashtagItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "active");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hashtagViewWillDeactivateHashtag:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "hashtagItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hashtagItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", objc_msgSend(v6, "active") ^ 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "hashtagItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v7, "active");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)v6)
    objc_msgSend(v8, "hashtagViewDidActivateHashtag:", v10);
  else
    objc_msgSend(v8, "hashtagViewDidDeactivateHashtag:", v10);

  objc_msgSend(v12, "setActionName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hashtagView:registerCommand:", *(_QWORD *)(a1 + 32), v12);

  objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  CGRect v28;
  CGRect v29;

  v6 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowPath:", v8);

  v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[PKHashtagView frame](self, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[PKHashtagView frame](self, "frame");
  v19 = v18 * 0.5;
  v28.origin.x = v11;
  v28.origin.y = v13;
  v28.size.width = v15;
  v28.size.height = v17;
  v29 = CGRectInset(v28, 0.0, v19);
  v20 = (void *)objc_msgSend(v9, "initWithFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  -[PKHashtagView setBlankPreviewView:](self, "setBlankPreviewView:", v20);

  -[PKHashtagView blankPreviewView](self, "blankPreviewView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setOpaque:", 0);

  -[PKHashtagView superview](self, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHashtagView blankPreviewView](self, "blankPreviewView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v23);

  v24 = objc_alloc(MEMORY[0x1E0DC3D90]);
  -[PKHashtagView blankPreviewView](self, "blankPreviewView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithView:parameters:", v25, v6);

  return v26;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__PKHashtagView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v5[3] = &unk_1E7778020;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

uint64_t __73__PKHashtagView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "blankPreviewView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setBlankPreviewView:", 0);
}

- (PKHashtagItem)hashtagItem
{
  return self->_hashtagItem;
}

- (PKHashtagViewDelegate)delegate
{
  return (PKHashtagViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)blankPreviewView
{
  return self->_blankPreviewView;
}

- (void)setBlankPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_blankPreviewView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blankPreviewView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hashtagItem, 0);
}

@end
