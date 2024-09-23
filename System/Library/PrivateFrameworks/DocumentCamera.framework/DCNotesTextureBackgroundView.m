@implementation DCNotesTextureBackgroundView

+ (id)textureImage
{
  return (id)objc_msgSend(MEMORY[0x24BDF6AC8], "kitImageNamed:", CFSTR("UITexturedPaperTile"));
}

+ (id)colorWithPaperTexturePatternImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__DCNotesTextureBackgroundView_colorWithPaperTexturePatternImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (colorWithPaperTexturePatternImage_predicate != -1)
    dispatch_once(&colorWithPaperTexturePatternImage_predicate, block);
  return (id)colorWithPaperTexturePatternImage_patternColor;
}

void __65__DCNotesTextureBackgroundView_colorWithPaperTexturePatternImage__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(*(id *)(a1 + 32), "textureImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithPatternImage:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)colorWithPaperTexturePatternImage_patternColor;
  colorWithPaperTexturePatternImage_patternColor = v2;

}

- (double)heightByCoveringHeight:(double)a3 withImage:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a4;
  objc_msgSend(v5, "size");
  v7 = (double)(int)(ceil(a3 / v6) + 1.0);
  objc_msgSend(v5, "size");
  v9 = v8;

  return v9 * v7;
}

- (DCNotesTextureBackgroundView)initWithFrame:(CGRect)a3 scrollingTextures:(BOOL)a4 hasAlpha:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  DCNotesTextureBackgroundView *v7;
  DCNotesTextureBackgroundView *v8;
  objc_super v10;

  v5 = a5;
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DCNotesTextureBackgroundView;
  v7 = -[DCNotesTextureBackgroundView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
    -[DCNotesTextureBackgroundView commonInitWithScrollingTextures:hasAlpha:](v7, "commonInitWithScrollingTextures:hasAlpha:", v6, v5);
  return v8;
}

- (DCNotesTextureBackgroundView)initWithFrame:(CGRect)a3
{
  return -[DCNotesTextureBackgroundView initWithFrame:scrollingTextures:hasAlpha:](self, "initWithFrame:scrollingTextures:hasAlpha:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (DCNotesTextureBackgroundView)initWithCoder:(id)a3
{
  DCNotesTextureBackgroundView *v3;
  DCNotesTextureBackgroundView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DCNotesTextureBackgroundView;
  v3 = -[DCNotesTextureBackgroundView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[DCNotesTextureBackgroundView commonInitWithScrollingTextures:hasAlpha:](v3, "commonInitWithScrollingTextures:hasAlpha:", 0, 1);
  return v4;
}

- (void)commonInitWithScrollingTextures:(BOOL)a3 hasAlpha:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  DCNotesTextureView *v8;
  DCNotesTextureView *v9;
  DCNotesTextureView *textureView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v4 = a4;
  v21[2] = *MEMORY[0x24BDAC8D0];
  +[DCNotesTextureBackgroundView textureImage](DCNotesTextureBackgroundView, "textureImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_scrollsTexture = a3;
  v8 = [DCNotesTextureView alloc];
  v9 = -[DCNotesTextureView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  textureView = self->_textureView;
  self->_textureView = v9;

  -[DCNotesTextureView setTranslatesAutoresizingMaskIntoConstraints:](self->_textureView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[DCNotesTextureView setImage:](self->_textureView, "setImage:", v7);
  -[DCNotesTextureBackgroundView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_textureView, 0);
  if (v4)
    -[DCNotesTextureBackgroundView setAlpha:](self, "setAlpha:", 0.96);
  -[DCNotesTextureBackgroundView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

  _NSDictionaryOfVariableBindings(CFSTR("_textureView"), self->_textureView, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[_textureView]|"), 0, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCNotesTextureBackgroundView addConstraints:](self, "addConstraints:", v13);

  if (self->_scrollsTexture)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[_textureView]"), 0, 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCNotesTextureBackgroundView setTextureYConstraint:](self, "setTextureYConstraint:", v15);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_textureView(0)]"), 0, 0, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCNotesTextureBackgroundView setTextureHeightConstraint:](self, "setTextureHeightConstraint:", v17);

    -[DCNotesTextureBackgroundView textureYConstraint](self, "textureYConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    -[DCNotesTextureBackgroundView textureHeightConstraint](self, "textureHeightConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCNotesTextureBackgroundView addConstraints:](self, "addConstraints:", v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_textureView]|"), 0, 0, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCNotesTextureBackgroundView addConstraints:](self, "addConstraints:", v18);
  }

  -[DCNotesTextureBackgroundView setClipsToBounds:](self, "setClipsToBounds:", 1);
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  void *v5;
  double v6;
  double v7;
  float v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v15;

  y = a3.y;
  if (-[DCNotesTextureBackgroundView scrollsTexture](self, "scrollsTexture", a3.x))
  {
    -[DCNotesTextureView image](self->_textureView, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
    v7 = v6;

    if (v7 > 0.0)
    {
      -[DCNotesTextureView image](self->_textureView, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "size");
      *(float *)&v10 = v10;
      v8 = y;
      v11 = fmodf(v8, *(float *)&v10);

      v12 = -v11;
      if (y < 0.0)
      {
        -[DCNotesTextureView image](self->_textureView, "image");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "size");
        v12 = v12 - v14;

      }
      -[DCNotesTextureBackgroundView textureYConstraint](self, "textureYConstraint");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setConstant:", v12);

    }
  }
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)DCNotesTextureBackgroundView;
  -[DCNotesTextureBackgroundView setBounds:](&v13, sel_setBounds_);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v8 = CGRectGetHeight(v14);
  -[DCNotesTextureView image](self->_textureView, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCNotesTextureBackgroundView heightByCoveringHeight:withImage:](self, "heightByCoveringHeight:withImage:", v9, v8);
  v11 = v10;

  -[DCNotesTextureBackgroundView textureHeightConstraint](self, "textureHeightConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", v11);

}

- (void)setFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)DCNotesTextureBackgroundView;
  -[DCNotesTextureBackgroundView setFrame:](&v13, sel_setFrame_);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v8 = CGRectGetHeight(v14);
  -[DCNotesTextureView image](self->_textureView, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCNotesTextureBackgroundView heightByCoveringHeight:withImage:](self, "heightByCoveringHeight:withImage:", v9, v8);
  v11 = v10;

  -[DCNotesTextureBackgroundView textureHeightConstraint](self, "textureHeightConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", v11);

}

- (DCNotesTextureView)textureView
{
  return self->_textureView;
}

- (BOOL)scrollsTexture
{
  return self->_scrollsTexture;
}

- (void)setScrollsTexture:(BOOL)a3
{
  self->_scrollsTexture = a3;
}

- (NSLayoutConstraint)textureYConstraint
{
  return self->_textureYConstraint;
}

- (void)setTextureYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textureYConstraint, a3);
}

- (NSLayoutConstraint)textureHeightConstraint
{
  return self->_textureHeightConstraint;
}

- (void)setTextureHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textureHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureHeightConstraint, 0);
  objc_storeStrong((id *)&self->_textureYConstraint, 0);
  objc_storeStrong((id *)&self->_textureView, 0);
}

- (void)setContentOffset:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "Setting content offset of background texture view to NaN", v1, 2u);
}

@end
