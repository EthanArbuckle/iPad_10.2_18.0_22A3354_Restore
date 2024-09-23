@implementation SFSquareRichLinkCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("SquareRichLinkCell");
}

- (SFSquareRichLinkCell)initWithFrame:(CGRect)a3
{
  SFSquareRichLinkCell *v3;
  id v4;
  void *v5;
  LPLinkView *v6;
  LPLinkView *dummyLinkView;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SFSquareRichLinkCell *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  objc_super v38;
  _QWORD v39[9];

  v39[7] = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)SFSquareRichLinkCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
    objc_msgSend(v4, "setTitle:", CFSTR("Aa Bb Cc Dd Ee Ff Gg Hh Ii Jj Kk Ll Mm Nn Oo Pp Qq Rr Ss Tt Uu Vv Ww Xx Yy Zz"));
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("apple.com"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOriginalURL:", v5);

    v6 = (LPLinkView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC11C8]), "initWithMetadata:", v4);
    configureLinkView(v6);

    dummyLinkView = v3->_dummyLinkView;
    v3->_dummyLinkView = v6;

    -[LPLinkView setHidden:](v3->_dummyLinkView, "setHidden:", 1);
    -[SFSquareRichLinkCell addSubview:](v3, "addSubview:", v3->_dummyLinkView);
    v37 = objc_alloc_init(MEMORY[0x1E0CC11C8]);
    v8 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
    objc_msgSend(v37, "setMetadata:", v8);

    configureLinkView(v37);
    -[SFSquareRichLinkCell addSubview:](v3, "addSubview:", v37);
    -[SFSquareRichLinkCell setLinkView:](v3, "setLinkView:", v37);
    v27 = (void *)MEMORY[0x1E0CB3718];
    -[LPLinkView topAnchor](v3->_dummyLinkView, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSquareRichLinkCell topAnchor](v3, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 15.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v34;
    -[LPLinkView leadingAnchor](v3->_dummyLinkView, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSquareRichLinkCell leadingAnchor](v3, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 15.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v31;
    -[LPLinkView trailingAnchor](v3->_dummyLinkView, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSquareRichLinkCell trailingAnchor](v3, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, -15.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v28;
    -[LPLinkView bottomAnchor](v3->_dummyLinkView, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSquareRichLinkCell bottomAnchor](v3, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v24;
    -[SFSquareRichLinkCell linkView](v3, "linkView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkView topAnchor](v3->_dummyLinkView, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v20;
    -[SFSquareRichLinkCell linkView](v3, "linkView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkView leadingAnchor](v3->_dummyLinkView, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[5] = v12;
    -[SFSquareRichLinkCell linkView](v3, "linkView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkView trailingAnchor](v3->_dummyLinkView, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39[6] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v17);

    v18 = v3;
  }

  return v3;
}

- (SFSquareRichLinkCell)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSquareRichLinkCell;
  return -[SFSquareRichLinkCell initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)setMetadata:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_metadata, a3);
  v5 = a3;
  -[SFSquareRichLinkCell linkView](self, "linkView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMetadata:", v5);

}

- (void)setIcon:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_icon, a3);
  -[SFSquareRichLinkCell linkView](self, "linkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v9);
    -[SFSquareRichLinkCell linkView](self, "linkView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setMediaOverlayIcon:", v7);

  }
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (UIImage)icon
{
  return self->_icon;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
  objc_storeStrong((id *)&self->_linkView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_dummyLinkView, 0);
}

@end
