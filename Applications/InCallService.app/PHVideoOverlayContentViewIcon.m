@implementation PHVideoOverlayContentViewIcon

- (PHVideoOverlayContentViewIcon)initWithSymbolType:(int64_t)a3
{
  PHVideoOverlayContentViewIcon *v4;
  PHVideoOverlayContentViewIcon *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHVideoOverlayContentViewIcon;
  v4 = -[PHVideoOverlayContentViewIcon init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_symbolType = a3;
    -[PHVideoOverlayContentViewIcon setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PHVideoOverlayContentViewIcon setupViewWithSymbolType:](v5, "setupViewWithSymbolType:", a3);
  }
  return v5;
}

- (void)setupViewWithSymbolType:(int64_t)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = objc_alloc((Class)UIImageView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", a3, UIFontTextStyleLargeTitle, 3, 1));
  v7 = objc_msgSend(v5, "initWithImage:", v6);
  -[PHVideoOverlayContentViewIcon setIconView:](self, "setIconView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewIcon iconView](self, "iconView"));
  objc_msgSend(v9, "setTintColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewIcon iconView](self, "iconView"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewIcon iconView](self, "iconView"));
  -[PHVideoOverlayContentViewIcon addSubview:](self, "addSubview:", v11);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[4];

  v20.receiver = self;
  v20.super_class = (Class)PHVideoOverlayContentViewIcon;
  -[PHVideoOverlayContentViewIcon updateConstraints](&v20, "updateConstraints");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewIcon iconView](self, "iconView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "centerYAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewIcon centerYAnchor](self, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v21[0] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewIcon iconView](self, "iconView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewIcon centerXAnchor](self, "centerXAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v21[1] = v12;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewIcon iconView](self, "iconView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewIcon leadingAnchor](self, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintGreaterThanOrEqualToAnchor:constant:", v5, 15.0));
  v21[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewIcon iconView](self, "iconView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewIcon trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:constant:", v9, -15.0));
  v21[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
  -[PHVideoOverlayContentViewIcon addConstraints:](self, "addConstraints:", v11);

}

- (void)resetView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHVideoOverlayContentViewIcon;
  -[PHVideoOverlayContentView resetView](&v3, "resetView");
  -[PHVideoOverlayContentViewIcon setupViewWithSymbolType:](self, "setupViewWithSymbolType:", -[PHVideoOverlayContentViewIcon symbolType](self, "symbolType"));
}

- (int64_t)symbolType
{
  return self->_symbolType;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
