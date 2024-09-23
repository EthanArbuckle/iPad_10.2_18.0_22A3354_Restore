@implementation PKProofreadingView

- (PKProofreadingView)initWithProofreadingItem:(id)a3 inDrawing:(id)a4
{
  PKProofreadingItem *v6;
  id v7;
  PKProofreadingView *v8;
  PKProofreadingItem *proofreadingItem;
  PKProofreadingItem *v10;
  objc_super v12;

  v6 = (PKProofreadingItem *)a3;
  v12.receiver = self;
  v12.super_class = (Class)PKProofreadingView;
  v7 = a4;
  v8 = -[PKDetectionView init](&v12, sel_init);
  proofreadingItem = v8->_proofreadingItem;
  v8->_proofreadingItem = v6;
  v10 = v6;

  -[PKDetectionItem setDrawing:](v8->_proofreadingItem, "setDrawing:", v7, v12.receiver, v12.super_class);
  return v8;
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  NSTimer *v5;
  NSTimer *visibilityTimer;
  _QWORD v7[4];
  id v8;
  id location;

  -[PKProofreadingView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKProofreadingView setHidden:](self, "setHidden:", 0);
    -[NSTimer invalidate](self->_visibilityTimer, "invalidate");
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0C99E88];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__PKProofreadingView_didMoveToSuperview__block_invoke;
    v7[3] = &unk_1E777BA38;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 30.0);
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    visibilityTimer = self->_visibilityTimer;
    self->_visibilityTimer = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __40__PKProofreadingView_didMoveToSuperview__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHidden:", 1);

}

- (id)item
{
  return self->_proofreadingItem;
}

- (id)_underlineColor
{
  void *v2;
  void *v3;

  -[PKProofreadingView item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "strokeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)_underlineThickness
{
  return 3.0;
}

- (void)_setLineDashFor:(id)a3
{
  __int128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = xmmword_1BE4FF370;
  objc_msgSend(a3, "setLineDash:count:phase:", &v3, 2, 0.0);
}

- (id)accessibilityIdentifier
{
  return CFSTR("com.apple.pencilkit.proofreadingView");
}

- (id)accessibilityValue
{
  return 0;
}

- (void)tapHandler:(id)a3
{
  UIEditMenuInteraction *v4;
  UIEditMenuInteraction *editMenuInteraction;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  id v11;
  CGRect v12;
  CGRect v13;

  objc_msgSend(a3, "locationInView:", self);
  if (-[PKDetectionView hitTest:](self, "hitTest:"))
  {
    if (!self->_editMenuInteraction)
    {
      v4 = (UIEditMenuInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC37A0]), "initWithDelegate:", self);
      editMenuInteraction = self->_editMenuInteraction;
      self->_editMenuInteraction = v4;

      -[PKProofreadingView addInteraction:](self, "addInteraction:", self->_editMenuInteraction);
    }
    -[PKProofreadingView bounds](self, "bounds");
    x = v12.origin.x;
    y = v12.origin.y;
    width = v12.size.width;
    height = v12.size.height;
    MidX = CGRectGetMidX(v12);
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    objc_msgSend(MEMORY[0x1E0DC3798], "configurationWithIdentifier:sourcePoint:", CFSTR("proofreadingView"), MidX, CGRectGetMinY(v13) + 20.0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_editMenuInteraction, "presentEditMenuWithConfiguration:", v11);

  }
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  PKProofreadingView *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[PKProofreadingView proofreadingItem](self, "proofreadingItem", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replacementStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1E0DC3428];
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __80__PKProofreadingView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
        v19[3] = &unk_1E777DE48;
        v20 = v6;
        v21 = v13;
        v22 = self;
        objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v13, 0, 0, v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __80__PKProofreadingView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.pencilkit", "Proofreading");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412547;
    v8 = v5;
    v9 = 2117;
    v10 = v6;
    _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "Activated menu for proofreading item: %@, string: %{sensitive}@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proofreadingView:didReplaceWithString:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 48), "setNeedsDisplay");
}

- (PKProofreadingItem)proofreadingItem
{
  return self->_proofreadingItem;
}

- (PKProofreadingViewDelegate)delegate
{
  return (PKProofreadingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->_editMenuInteraction;
}

- (void)setEditMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_editMenuInteraction, a3);
}

- (NSTimer)visibilityTimer
{
  return self->_visibilityTimer;
}

- (void)setVisibilityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_visibilityTimer, a3);
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
  objc_storeStrong((id *)&self->_visibilityTimer, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proofreadingItem, 0);
}

@end
