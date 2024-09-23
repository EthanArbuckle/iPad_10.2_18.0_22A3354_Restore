@implementation LPComponentView

- (LPComponentView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (LPComponentView)initWithCoder:(id)a3
{

  return 0;
}

- (LPComponentView)init
{

  return 0;
}

- (LPComponentView)initWithHost:(id)a3
{
  id v4;
  LPComponentView *v5;
  LPComponentView *v6;
  LPComponentView *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPComponentView;
  v5 = -[LPComponentView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_host, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)isFlipped
{
  return 1;
}

- (void)layoutSubviews
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__LPComponentView_layoutSubviews__block_invoke;
  v2[3] = &unk_1E44A7CE8;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

uint64_t __33__LPComponentView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)LPComponentView;
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  return objc_msgSend(*(id *)(a1 + 32), "layoutComponentView");
}

- (BOOL)shouldAllowHighlightToRecognizeSimultaneouslyWithGesture:(id)a3
{
  return 1;
}

- (id)layoutExclusionsForView:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (LPComponentViewHost)host
{
  return (LPComponentViewHost *)objc_loadWeakRetained((id *)&self->_host);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
}

@end
