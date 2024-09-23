@implementation PKSqueezePaletteViewTapRulerAction

- (id)initWithRulerTool:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)PKSqueezePaletteViewTapRulerAction;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (void)performAction
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  if (a1)
  {
    objc_initWeak(&location, *(id *)(a1 + 8));
    v2 = *(void **)(a1 + 8);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __51__PKSqueezePaletteViewTapRulerAction_performAction__block_invoke;
    v3[3] = &unk_1E7778C40;
    objc_copyWeak(&v4, &location);
    -[PKSqueezePaletteDrawingTool setSelected:animated:completion:](v2, 1, 1, v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __51__PKSqueezePaletteViewTapRulerAction_performAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKSqueezePaletteDrawingTool setSelected:animated:completion:](WeakRetained, 0, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rulerTool, 0);
}

@end
