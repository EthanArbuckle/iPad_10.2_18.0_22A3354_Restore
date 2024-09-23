@implementation FAAddPhotoView

- (FAAddPhotoView)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  FAAddPhotoView *v7;
  uint64_t v8;
  UIButton *addPhotoButton;
  UIButton *v10;
  void *v11;
  void *v12;
  UIButton *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FAAddPhotoView;
  v7 = -[FAAddPhotoView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    addPhotoButton = v7->_addPhotoButton;
    v7->_addPhotoButton = (UIButton *)v8;

    v10 = v7->_addPhotoButton;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FAMILY_SETUP_ADD_PROFILE_PICTURE_BUTTON"), &stru_24C8A3000, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v10, "setTitle:forState:", v12, 0);

    v13 = v7->_addPhotoButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v13, "setTintColor:", v14);

    -[UIButton titleLabel](v7->_addPhotoButton, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNumberOfLines:", 0);

    -[UIButton titleLabel](v7->_addPhotoButton, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextAlignment:", 1);

    -[UIButton addTarget:action:forControlEvents:](v7->_addPhotoButton, "addTarget:action:forControlEvents:", v6, a4, 64);
    -[FAAddPhotoView addSubview:](v7, "addSubview:", v7->_addPhotoButton);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAAddPhotoView setBackgroundColor:](v7, "setBackgroundColor:", v17);

  }
  return v7;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  CGContext *CurrentContext;
  id v6;
  id v7;
  objc_super v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)FAAddPhotoView;
  -[FAAddPhotoView drawRect:](&v8, sel_drawRect_, a3.origin.x, a3.origin.y);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v6, "CGColor"));

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v7, "CGColor"));

  v9.origin.x = 1.0;
  v9.origin.y = 1.0;
  v9.size.width = width + -2.0;
  v9.size.height = height + -2.0;
  CGContextStrokeEllipseInRect(CurrentContext, v9);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FAAddPhotoView;
  -[FAAddPhotoView layoutSubviews](&v10, sel_layoutSubviews);
  -[UIButton sizeToFit](self->_addPhotoButton, "sizeToFit");
  -[UIButton frame](self->_addPhotoButton, "frame");
  v4 = v3;
  v6 = v5;
  -[FAAddPhotoView frame](self, "frame");
  v8 = (v7 - v6) * 0.5;
  -[FAAddPhotoView frame](self, "frame");
  -[UIButton setFrame:](self->_addPhotoButton, "setFrame:", (v9 - v4) * 0.5, v8, v4, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addPhotoButton, 0);
}

@end
