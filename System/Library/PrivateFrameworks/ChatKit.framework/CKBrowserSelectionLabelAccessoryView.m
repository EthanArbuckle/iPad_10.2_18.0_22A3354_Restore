@implementation CKBrowserSelectionLabelAccessoryView

- (CKBrowserSelectionLabelAccessoryView)initWithLabelAccessoryType:(unint64_t)a3
{
  CKBrowserSelectionLabelAccessoryView *v4;
  CKBrowserSelectionLabelAccessoryView *v5;
  void *v6;
  uint64_t *v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKBrowserSelectionLabelAccessoryView;
  v4 = -[CKBrowserSelectionLabelAccessoryView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[CKBrowserSelectionLabelAccessoryView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);

    if (a3 == 2)
    {
      if (initWithLabelAccessoryType__onceToken_26 != -1)
        dispatch_once(&initWithLabelAccessoryType__onceToken_26, &__block_literal_global_27_0);
      v7 = &initWithLabelAccessoryType____plusDImage_25;
      v8 = &initWithLabelAccessoryType____plusLImage_24;
    }
    else
    {
      if (a3 != 1)
      {
        v9 = 0;
        v10 = 0;
        goto LABEL_12;
      }
      if (initWithLabelAccessoryType__onceToken != -1)
        dispatch_once(&initWithLabelAccessoryType__onceToken, &__block_literal_global_262);
      v7 = &initWithLabelAccessoryType____plusDImage;
      v8 = &initWithLabelAccessoryType____plusLImage;
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", *v8);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", *v7);
LABEL_12:
    -[CKBrowserSelectionLabelAccessoryView setPlusLView:](v5, "setPlusLView:", v9);
    -[CKBrowserSelectionLabelAccessoryView setPlusDView:](v5, "setPlusDView:", v10);
    -[CKBrowserSelectionLabelAccessoryView addSubview:](v5, "addSubview:", v9);
    -[CKBrowserSelectionLabelAccessoryView addSubview:](v5, "addSubview:", v10);

  }
  return v5;
}

void __67__CKBrowserSelectionLabelAccessoryView_initWithLabelAccessoryType___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("IconNewDot"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.393, 1.0, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_flatImageWithColor:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)initWithLabelAccessoryType____plusLImage;
  initWithLabelAccessoryType____plusLImage = v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.393, 1.0, 0.100000001);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_flatImageWithColor:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)initWithLabelAccessoryType____plusDImage;
  initWithLabelAccessoryType____plusDImage = v4;

}

void __67__CKBrowserSelectionLabelAccessoryView_initWithLabelAccessoryType___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("IconNewDot"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.992, 0.51, 0.031, 0.62);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_flatImageWithColor:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)initWithLabelAccessoryType____plusLImage_24;
  initWithLabelAccessoryType____plusLImage_24 = v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.992, 0.51, 0.031, 0.398);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_flatImageWithColor:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)initWithLabelAccessoryType____plusDImage_25;
  initWithLabelAccessoryType____plusDImage_25 = v4;

}

- (CKBrowserSelectionLabelAccessoryView)initWithFrame:(CGRect)a3
{
  return -[CKBrowserSelectionLabelAccessoryView initWithLabelAccessoryType:](self, "initWithLabelAccessoryType:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CKBrowserSelectionLabelAccessoryView)initWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This class does not support unarchiving from a nib"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKBrowserSelectionLabelAccessoryView plusLView](self, "plusLView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIImageView)plusLView
{
  return self->_plusLView;
}

- (void)setPlusLView:(id)a3
{
  objc_storeStrong((id *)&self->_plusLView, a3);
}

- (UIImageView)plusDView
{
  return self->_plusDView;
}

- (void)setPlusDView:(id)a3
{
  objc_storeStrong((id *)&self->_plusDView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusDView, 0);
  objc_storeStrong((id *)&self->_plusLView, 0);
}

@end
