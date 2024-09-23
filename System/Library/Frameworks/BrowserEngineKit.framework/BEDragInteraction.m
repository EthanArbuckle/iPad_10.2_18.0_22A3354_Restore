@implementation BEDragInteraction

- (BEDragInteraction)initWithDelegate:(id)a3
{
  id v4;
  BEDragInteraction *v5;
  char v6;
  char delegateImplements;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BEDragInteraction;
  v5 = -[UIDragInteraction initWithDelegate:](&v10, sel_initWithDelegate_, v4);
  if (v5)
  {
    *(_BYTE *)&v5->_delegateImplements = *(_BYTE *)&v5->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
    v6 = objc_opt_respondsToSelector();
    delegateImplements = (char)v5->_delegateImplements;
    if ((v6 & 1) != 0)
      v8 = 2;
    else
      v8 = 0;
    *(_BYTE *)&v5->_delegateImplements = delegateImplements & 0xFD | v8;
    if ((delegateImplements & 1) != 0)
    {
      -[UIDragInteraction _setLiftDelay:](v5, "_setLiftDelay:", 0.65);
      -[UIDragInteraction _setAllowsPointerDragBeforeLiftDelay:](v5, "_setAllowsPointerDragBeforeLiftDelay:", 0);
    }
  }

  return v5;
}

- (void)_prepareForSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BEBurnableBlock *v9;
  uint64_t v10;
  _BEBurnableBlock *v11;
  void *v12;
  _BEBurnableBlock *v13;
  objc_super v14;
  _QWORD v15[4];
  _BEBurnableBlock *v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  if ((*(_BYTE *)&self->_delegateImplements & 1) != 0)
  {
    v8 = a3;
    v9 = [_BEBurnableBlock alloc];
    v10 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __51__BEDragInteraction__prepareForSession_completion___block_invoke;
    v17[3] = &unk_250449560;
    v18 = v6;
    v11 = -[_BEBurnableBlock initWithTimeout:block:defaultInputProvider:](v9, "initWithTimeout:block:defaultInputProvider:", v17, &__block_literal_global, 0.5);
    -[UIDragInteraction delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __51__BEDragInteraction__prepareForSession_completion___block_invoke_3;
    v15[3] = &unk_2504495A8;
    v16 = v11;
    v13 = v11;
    objc_msgSend(v12, "dragInteraction:prepareDragSession:completion:", self, v8, v15);

    v7 = v18;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BEDragInteraction;
    v7 = a3;
    -[UIDragInteraction _prepareForSession:completion:](&v14, sel__prepareForSession_completion_, v7, v6);
  }

}

uint64_t __51__BEDragInteraction__prepareForSession_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "BOOLValue");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__BEDragInteraction__prepareForSession_completion___block_invoke_2()
{
  return MEMORY[0x24BDBD1C0];
}

uint64_t __51__BEDragInteraction__prepareForSession_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithInput:", MEMORY[0x24BDBD1C8]);
}

- (BOOL)_itemsForAddingToSession:(id)a3 atPoint:(CAPoint3D)a4 completion:(id)a5
{
  double var2;
  double var1;
  double var0;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  _BEBurnableBlock *v14;
  uint64_t v15;
  _BEBurnableBlock *v16;
  void *v17;
  _BEBurnableBlock *v18;
  objc_super v20;
  _QWORD v21[4];
  _BEBurnableBlock *v22;
  _QWORD v23[4];
  id v24;

  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v10 = a5;
  if ((*(_BYTE *)&self->_delegateImplements & 2) != 0)
  {
    v13 = a3;
    v14 = [_BEBurnableBlock alloc];
    v15 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __65__BEDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke;
    v23[3] = &unk_2504495D0;
    v24 = v10;
    v16 = -[_BEBurnableBlock initWithTimeout:block:defaultInputProvider:](v14, "initWithTimeout:block:defaultInputProvider:", v23, &__block_literal_global_11, 0.5);
    -[UIDragInteraction delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __65__BEDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke_3;
    v21[3] = &unk_250449638;
    v22 = v16;
    v18 = v16;
    objc_msgSend(v17, "dragInteraction:itemsForAddingToSession:forTouchAtPoint:completion:", self, v13, v21, var0, var1);

    v12 = 1;
    v11 = v24;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)BEDragInteraction;
    v11 = a3;
    v12 = -[UIDragInteraction _itemsForAddingToSession:atPoint:completion:](&v20, sel__itemsForAddingToSession_atPoint_completion_, v11, v10, var0, var1, var2);
  }

  return v12;
}

uint64_t __65__BEDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__BEDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke_2()
{
  return MEMORY[0x24BDBD1A8];
}

uint64_t __65__BEDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithInput:", a2);
}

- (BOOL)_supportsAddingItemsAsynchronously
{
  return (*(_BYTE *)&self->_delegateImplements >> 1) & 1;
}

@end
