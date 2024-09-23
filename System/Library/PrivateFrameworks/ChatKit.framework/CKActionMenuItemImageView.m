@implementation CKActionMenuItemImageView

- (CKActionMenuItemImageView)initWithImage:(id)a3 tintColor:(id)a4 highlightedTintColor:(id)a5
{
  id v9;
  id v10;
  CKActionMenuItemImageView *v11;
  CKActionMenuItemImageView *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKActionMenuItemImageView;
  v11 = -[CKActionMenuItemImageView initWithImage:](&v14, sel_initWithImage_, a3);
  v12 = v11;
  if (v11)
  {
    v11->_enabled = 1;
    objc_storeStrong((id *)&v11->_unhighlightedTintColor, a4);
    objc_storeStrong((id *)&v12->_highlightedTintColor, a5);
    -[CKActionMenuItemImageView updateTintColor](v12, "updateTintColor");
  }

  return v12;
}

- (void)setHighlighted:(BOOL)a3
{
  -[CKActionMenuItemImageView setHighlighted:animated:](self, "setHighlighted:animated:", a3, 0);
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  if (self->_enabled != a3)
  {
    v4 = a4;
    self->_enabled = a3;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__CKActionMenuItemImageView_setEnabled_animated___block_invoke;
    aBlock[3] = &unk_1E274A208;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    v6 = v5;
    if (v4)
      +[CKActionMenuItem animate:completion:](CKActionMenuItem, "animate:completion:", v5, 0);
    else
      (*((void (**)(void *))v5 + 2))(v5);

  }
}

uint64_t __49__CKActionMenuItemImageView_setEnabled_animated___block_invoke(uint64_t a1)
{
  _BYTE *v1;
  double v2;

  v1 = *(_BYTE **)(a1 + 32);
  v2 = 0.4;
  if (v1[528])
    v2 = 1.0;
  return objc_msgSend(v1, "setAlpha:", v2);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  _QWORD aBlock[5];
  objc_super v10;

  v4 = a4;
  v5 = a3;
  if (-[CKActionMenuItemImageView isHighlighted](self, "isHighlighted") != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)CKActionMenuItemImageView;
    -[CKActionMenuItemImageView setHighlighted:](&v10, sel_setHighlighted_, v5);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__CKActionMenuItemImageView_setHighlighted_animated___block_invoke;
    aBlock[3] = &unk_1E274A208;
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    v8 = v7;
    if (v4)
      +[CKActionMenuItem animate:completion:](CKActionMenuItem, "animate:completion:", v7, 0);
    else
      (*((void (**)(void *))v7 + 2))(v7);

  }
}

uint64_t __53__CKActionMenuItemImageView_setHighlighted_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateTintColor");
}

- (void)updateTintColor
{
  int v3;
  int *v4;

  v3 = -[CKActionMenuItemImageView isHighlighted](self, "isHighlighted");
  v4 = &OBJC_IVAR___CKActionMenuItemImageView__unhighlightedTintColor;
  if (v3)
    v4 = &OBJC_IVAR___CKActionMenuItemImageView__highlightedTintColor;
  -[CKActionMenuItemImageView setTintColor:](self, "setTintColor:", *(Class *)((char *)&self->super.super.super.super.isa + *v4));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedTintColor, 0);
  objc_storeStrong((id *)&self->_unhighlightedTintColor, 0);
}

@end
