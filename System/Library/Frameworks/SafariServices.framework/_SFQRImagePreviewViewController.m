@implementation _SFQRImagePreviewViewController

- (_SFQRImagePreviewViewController)initWithElementInfo:(id)a3
{
  id v5;
  _SFQRImagePreviewViewController *v6;
  UIImageView *v7;
  UIImageView *imageView;
  void *v9;
  _SFQRImagePreviewViewController *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFQRImagePreviewViewController;
  v6 = -[_SFQRImagePreviewViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  if (v6)
  {
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v6->_imageView;
    v6->_imageView = v7;

    objc_msgSend(v5, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v6->_imageView, "setImage:", v9);

    objc_storeStrong((id *)&v6->_activatedElementInfo, a3);
    v10 = v6;
  }

  return v6;
}

- (BCSAction)action
{
  void *v3;
  void *v4;

  +[_SFQRCodeDetectionController sharedController](_SFQRCodeDetectionController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionForElement:", self->_activatedElementInfo);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (BCSAction *)v4;
}

- (id)_contentViewSubtitleWithAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "urlThatCanBeOpened");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "urlThatCanBeOpened");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_userVisibleString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)loadView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  CGImage *v10;
  double Width;
  size_t Height;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIImageView *imageView;
  id v19;
  void *v20;
  SFQRImageHeaderView *v21;
  SFQRImageHeaderView *v22;
  void *v23;
  SFQRImageHeaderView *v24;
  SFQRImageContentView *v25;
  void *v26;
  void *v27;
  SFQRImageContentView *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UIImageView *v35;
  UIImageView *v36;
  void *v37;
  uint64_t v38;
  double v39;
  SFQRImageContentView *v40;
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
  SFQRImageContentView *v59;
  void *v60;
  void *v61;
  void *v62;
  UIImageView *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  SFQRImageHeaderView *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  objc_super v81;
  _QWORD v82[14];

  v82[12] = *MEMORY[0x1E0C80C00];
  v81.receiver = self;
  v81.super_class = (Class)_SFQRImagePreviewViewController;
  -[_SFQRImagePreviewViewController loadView](&v81, sel_loadView);
  -[_SFQRImagePreviewViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  -[UIImageView image](self->_imageView, "image");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (CGImage *)objc_msgSend(v9, "CGImage");

  Width = (double)CGImageGetWidth(v10);
  Height = CGImageGetHeight(v10);
  v13 = Width / (double)Height;
  v14 = v6 / v8;
  v15 = v8 / (double)Height * Width;
  if (v13 >= v6 / v8)
    v15 = v6;
  if (v13 > v14)
    v16 = v6 / Width * (double)Height;
  else
    v16 = v8;
  if (v13 > v14)
    v17 = v6;
  else
    v17 = v15;
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  imageView = self->_imageView;
  v19 = v3;
  objc_msgSend(v19, "addSubview:", imageView);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v20);

  v21 = [SFQRImageHeaderView alloc];
  v22 = -[SFQRImageHeaderView initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQRImageHeaderView setBackgroundColor:](v22, "setBackgroundColor:", v23);

  -[_SFQRImagePreviewViewController action](self, "action");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQRImageHeaderView setAction:](v22, "setAction:", v80);
  -[SFQRImageHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = v22;
  objc_msgSend(v19, "addSubview:", v22);
  v25 = [SFQRImageContentView alloc];
  objc_msgSend(v80, "localizedDefaultActionDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFQRImagePreviewViewController _contentViewSubtitleWithAction:](self, "_contentViewSubtitleWithAction:", v80);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[SFQRImageContentView initWithTitle:subtitle:](v25, "initWithTitle:subtitle:", v26, v27);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQRImageContentView setBackgroundColor:](v28, "setBackgroundColor:", v29);

  -[_SFQRImagePreviewViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  -[SFQRImageContentView sizeThatFits:](v28, "sizeThatFits:", v31, v32);
  v34 = v33;

  -[SFQRImageContentView setTranslatesAutoresizingMaskIntoConstraints:](v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v19, "addSubview:", v28);
  -[_SFQRImagePreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", fmin(v6, v8), v16 + 56.0 + v34);
  v65 = (void *)MEMORY[0x1E0CB3718];
  v35 = self->_imageView;
  -[SFQRImageHeaderView topAnchor](v24, "topAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v77;
  -[SFQRImageHeaderView heightAnchor](v24, "heightAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToConstant:", 56.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v74;
  v76 = v24;
  -[SFQRImageHeaderView widthAnchor](v24, "widthAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "widthAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v71;
  -[SFQRImageHeaderView bottomAnchor](v24, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  v63 = v35;
  -[UIImageView topAnchor](v35, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v68;
  -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v37;
  -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
  v38 = objc_claimAutoreleasedReturnValue();
  v66 = (void *)v38;
  v39 = v17 / v16;
  if (v16 == 0.0)
    v39 = 1.0;
  objc_msgSend(v37, "constraintEqualToAnchor:multiplier:", v38, v39);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v82[4] = v64;
  -[UIImageView leftAnchor](v36, "leftAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leftAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintGreaterThanOrEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v82[5] = v60;
  -[UIImageView rightAnchor](v36, "rightAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintLessThanOrEqualToAnchor:", v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v82[6] = v56;
  -[UIImageView centerXAnchor](v36, "centerXAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerXAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v82[7] = v53;
  -[UIImageView bottomAnchor](v36, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v28;
  -[SFQRImageContentView topAnchor](v28, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v82[8] = v50;
  -[SFQRImageContentView heightAnchor](v28, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToConstant:", v34);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v82[9] = v42;
  v59 = v28;
  -[SFQRImageContentView widthAnchor](v28, "widthAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "widthAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v82[10] = v45;
  -[SFQRImageContentView bottomAnchor](v40, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v82[11] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 12);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "activateConstraints:", v49);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activatedElementInfo, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
