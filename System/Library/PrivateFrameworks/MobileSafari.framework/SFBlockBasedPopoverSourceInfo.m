@implementation SFBlockBasedPopoverSourceInfo

- (SFBlockBasedPopoverSourceInfo)initWithSourceInfoProvider:(id)a3
{
  id v4;
  SFBlockBasedPopoverSourceInfo *v5;
  void *v6;
  id sourceInfoProvider;
  SFBlockBasedPopoverSourceInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFBlockBasedPopoverSourceInfo;
  v5 = -[SFBlockBasedPopoverSourceInfo init](&v10, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    sourceInfoProvider = v5->_sourceInfoProvider;
    v5->_sourceInfoProvider = v6;

    v8 = v5;
  }

  return v5;
}

- (UIBarButtonItem)barButtonItem
{
  void *v2;
  void *v3;

  (*((void (**)(void))self->_sourceInfoProvider + 2))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "barButtonItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (UIBarButtonItem *)v3;
}

- (UIView)popoverSourceView
{
  void *v2;
  void *v3;

  (*((void (**)(void))self->_sourceInfoProvider + 2))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "popoverSourceView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (UIView *)v3;
}

- (CGRect)popoverSourceRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  (*((void (**)(void))self->_sourceInfoProvider + 2))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "popoverSourceRect");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D628];
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)shouldPassthroughSuperview
{
  void *v2;
  char v3;

  (*((void (**)(void))self->_sourceInfoProvider + 2))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldPassthroughSuperview");
  else
    v3 = 0;

  return v3;
}

- (BOOL)shouldHideArrow
{
  void *v2;
  char v3;

  (*((void (**)(void))self->_sourceInfoProvider + 2))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldHideArrow");
  else
    v3 = 0;

  return v3;
}

- (unint64_t)permittedArrowDirections
{
  void *v2;
  unint64_t v3;

  (*((void (**)(void))self->_sourceInfoProvider + 2))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "permittedArrowDirections");
  else
    v3 = 15;

  return v3;
}

- (int64_t)provenance
{
  void *v2;
  int64_t v3;

  (*((void (**)(void))self->_sourceInfoProvider + 2))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "provenance");
  else
    v3 = 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sourceInfoProvider, 0);
}

@end
