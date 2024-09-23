@implementation LPBackgroundColorView

- (LPBackgroundColorView)initWithColor:(id)a3
{
  id v5;
  LPBackgroundColorView *v6;
  LPBackgroundColorView *v7;
  LPBackgroundColorView *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPBackgroundColorView;
  v6 = -[LPBackgroundColorView init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_color, a3);
    -[LPBackgroundColorView updateColor](v7, "updateColor");
    v8 = v7;
  }

  return v7;
}

- (void)updateColor
{
  void (**v2)(void);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__LPBackgroundColorView_updateColor__block_invoke;
  aBlock[3] = &unk_1E44A7CE8;
  aBlock[4] = self;
  v2 = (void (**)(void))_Block_copy(aBlock);
  v2[2]();

}

uint64_t __36__LPBackgroundColorView_updateColor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  -[LPBackgroundColorView updateColor](self, "updateColor");
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
