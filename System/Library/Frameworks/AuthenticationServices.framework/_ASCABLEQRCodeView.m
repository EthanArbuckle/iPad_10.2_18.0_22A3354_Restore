@implementation _ASCABLEQRCodeView

- (_ASCABLEQRCodeView)initWithMessage:(id)a3
{
  id v4;
  _ASCABLEQRCodeView *v5;
  uint64_t v6;
  NSString *message;
  UIView *v8;
  UIView *platterView;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _ASCABLEQRCodeImageView *v14;
  _ASCABLEQRCodeImageView *imageView;
  _ASCABLEQRCodeBadgeView *v16;
  _ASCABLEQRCodeBadgeView *badgeView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _ASCABLEQRCodeView *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  objc_super v62;
  _QWORD v63[15];

  v63[13] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)_ASCABLEQRCodeView;
  v5 = -[_ASCABLEQRCodeView initWithFrame:](&v62, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    message = v5->_message;
    v5->_message = (NSString *)v6;

    v8 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    platterView = v5->_platterView;
    v5->_platterView = v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_platterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5->_platterView, "setBackgroundColor:", v10);

    -[UIView layer](v5->_platterView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 8.0);

    v12 = *MEMORY[0x24BDE58E8];
    -[UIView layer](v5->_platterView, "layer");
    v61 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerCurve:", v12);

    -[_ASCABLEQRCodeView addSubview:](v5, "addSubview:", v5->_platterView);
    v14 = objc_alloc_init(_ASCABLEQRCodeImageView);
    imageView = v5->_imageView;
    v5->_imageView = v14;

    -[_ASCABLEQRCodeImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_ASCABLEQRCodeView addSubview:](v5, "addSubview:", v5->_imageView);
    v16 = objc_alloc_init(_ASCABLEQRCodeBadgeView);
    badgeView = v5->_badgeView;
    v5->_badgeView = v16;

    -[_ASCABLEQRCodeBadgeView setTranslatesAutoresizingMaskIntoConstraints:](v5->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_ASCABLEQRCodeView addSubview:](v5, "addSubview:", v5->_badgeView);
    v45 = (void *)MEMORY[0x24BDD1628];
    -[UIView leadingAnchor](v5->_platterView, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeView leadingAnchor](v5, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v58;
    -[UIView trailingAnchor](v5->_platterView, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeView trailingAnchor](v5, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v55;
    -[UIView topAnchor](v5->_platterView, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeView topAnchor](v5, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v63[2] = v52;
    -[UIView bottomAnchor](v5->_platterView, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeView bottomAnchor](v5, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v63[3] = v49;
    -[_ASCABLEQRCodeImageView leadingAnchor](v5->_imageView, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v5->_platterView, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 10.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v63[4] = v46;
    -[UIView trailingAnchor](v5->_platterView, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeImageView trailingAnchor](v5->_imageView, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 10.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v63[5] = v42;
    -[_ASCABLEQRCodeImageView topAnchor](v5->_imageView, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v5->_platterView, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 10.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v63[6] = v39;
    -[UIView bottomAnchor](v5->_platterView, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeImageView bottomAnchor](v5->_imageView, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 10.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v63[7] = v36;
    -[_ASCABLEQRCodeBadgeView widthAnchor](v5->_badgeView, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeImageView widthAnchor](v5->_imageView, "widthAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:multiplier:", v34, 0.3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v63[8] = v33;
    -[_ASCABLEQRCodeBadgeView heightAnchor](v5->_badgeView, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeImageView heightAnchor](v5->_imageView, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:multiplier:", v31, 0.3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v63[9] = v30;
    -[_ASCABLEQRCodeBadgeView centerXAnchor](v5->_badgeView, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeImageView centerXAnchor](v5->_imageView, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v63[10] = v19;
    -[_ASCABLEQRCodeBadgeView centerYAnchor](v5->_badgeView, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeImageView centerYAnchor](v5->_imageView, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v63[11] = v22;
    -[_ASCABLEQRCodeView widthAnchor](v5, "widthAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeView heightAnchor](v5, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v63[12] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "activateConstraints:", v26);

    v4 = v61;
    -[_ASCABLEQRCodeView _updatePlatterBorderStyle](v5, "_updatePlatterBorderStyle");
    -[_ASCABLEQRCodeView _updateQRCodeImage](v5, "_updateQRCodeImage");
    v27 = v5;
  }

  return v5;
}

- (CGSize)intrinsicContentSize
{
  int v2;
  double v3;
  double v4;
  CGSize result;

  v2 = objc_msgSend(MEMORY[0x24BE0B290], "isPad");
  v3 = 220.0;
  if (v2)
    v3 = 250.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_ASCABLEQRCodeView;
  -[_ASCABLEQRCodeView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[_ASCABLEQRCodeView _updatePlatterBorderStyle](self, "_updatePlatterBorderStyle");
  -[_ASCABLEQRCodeView _updateQRCodeImage](self, "_updateQRCodeImage");
}

- (id)_qrCodeASImage
{
  void *v2;
  double x;
  double y;
  double width;
  double height;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  CGRect v12;
  CGRect v13;

  -[_ASCABLEQRCodeView _qrCodeCIImage](self, "_qrCodeCIImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extent");
  v13 = CGRectInset(v12, 1.0, 1.0);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  objc_msgSend(MEMORY[0x24BDBF648], "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "createCGImage:fromRect:", v2, x, y, width, height);

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BE82DE0]);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __36___ASCABLEQRCodeView__qrCodeASImage__block_invoke;
    v11[3] = &__block_descriptor_40_e5_v8__0l;
    v11[4] = v8;
    objc_msgSend(v9, "setHandler:", v11);
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:", v8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_qrCodeCIImage
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x24BDBF658], "QRCodeGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString dataUsingEncoding:](self->_message, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessage:", v4);

  objc_msgSend(v3, "outputImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(MEMORY[0x24BDBF658], "blendWithMaskFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDBF660];
  -[_ASCABLEQRCodeView _qrCodeColor](self, "_qrCodeColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageWithColor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundImage:", v17);

  v18 = (void *)MEMORY[0x24BDBF660];
  objc_msgSend(MEMORY[0x24BDBF638], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageWithColor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInputImage:", v20);

  objc_msgSend(v14, "setMaskImage:", v5);
  objc_msgSend(v14, "outputImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageByCroppingToRect:", v7, v9, v11, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)_updateQRCodeImage
{
  id v3;

  -[_ASCABLEQRCodeView _qrCodeASImage](self, "_qrCodeASImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_ASCABLEQRCodeImageView setImage:](self->_imageView, "setImage:", v3);

}

- (void)_updatePlatterBorderStyle
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[_ASCABLEQRCodeView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = 1.0 / v4;
  -[UIView layer](self->_platterView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderWidth:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v9, "CGColor");
  -[UIView layer](self->_platterView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderColor:", v7);

}

- (id)_qrCodeColor
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBF638];
  qrCodeContentsColor();
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "CGColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
