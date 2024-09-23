@implementation ASToastViewController

- (ASToastViewController)initWithTitle:(id)a3 message:(id)a4 duration:(double)a5 image:(id)a6
{
  id v10;
  id v11;
  id v12;
  ASToastViewController *v13;
  id v14;
  double y;
  double width;
  double height;
  UILabel *v18;
  UILabel *primaryLabel;
  UILabel *v20;
  UILabel *secondaryLabel;
  UIImageView *v22;
  UIImageView *imageView;
  void *v24;
  UIVisualEffectView *v25;
  UIVisualEffectView *toastView;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)ASToastViewController;
  v13 = -[ASToastViewController initWithNibName:bundle:](&v28, "initWithNibName:bundle:", 0, 0);
  if (v13)
  {
    v14 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v18 = (UILabel *)objc_msgSend(v14, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    primaryLabel = v13->_primaryLabel;
    v13->_primaryLabel = v18;

    v20 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    secondaryLabel = v13->_secondaryLabel;
    v13->_secondaryLabel = v20;

    v22 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = v13->_imageView;
    v13->_imageView = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 9));
    v25 = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v24);
    -[UIVisualEffectView setClipsToBounds:](v25, "setClipsToBounds:", 1);
    -[UIVisualEffectView _setContinuousCornerRadius:](v25, "_setContinuousCornerRadius:", 9.0);
    toastView = v13->_toastView;
    v13->_toastView = v25;

    -[ASToastViewController setTitle:](v13, "setTitle:", v10);
    -[ASToastViewController setMessage:](v13, "setMessage:", v11);
    -[ASToastViewController setImage:](v13, "setImage:", v12);
    -[ASToastViewController setDuration:](v13, "setDuration:", a5);
    -[ASToastViewController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 6);

  }
  return v13;
}

- (void)viewDidLoad
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
  id v18;
  id v19;
  void *v20;
  id v21;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)ASToastViewController;
  -[ASToastViewController viewDidLoad](&v43, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController presentationController](self, "presentationController"));
  objc_msgSend(v3, "_setContainerIgnoresDirectTouchEvents:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController view](self, "view"));
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController image](self, "image"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController imageView](self, "imageView"));
  objc_msgSend(v6, "setImage:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController imageView](self, "imageView"));
  objc_msgSend(v7, "setAlpha:", 0.64);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController imageView](self, "imageView"));
  objc_msgSend(v9, "setTintColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController imageView](self, "imageView"));
  objc_msgSend(v10, "setContentMode:", 2);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController title](self, "title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController primaryLabel](self, "primaryLabel"));
  objc_msgSend(v12, "setText:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController primaryLabel](self, "primaryLabel"));
  objc_msgSend(v13, "setTextAlignment:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController primaryLabel](self, "primaryLabel"));
  objc_msgSend(v14, "setNumberOfLines:", 2);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController primaryLabel](self, "primaryLabel"));
  objc_msgSend(v16, "setTextColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController primaryLabel](self, "primaryLabel"));
  objc_msgSend(v17, "setLineBreakMode:", 4);

  v18 = (id)objc_claimAutoreleasedReturnValue(-[ASToastViewController message](self, "message"));
  if (v18)
  {
    v19 = objc_alloc((Class)NSMutableAttributedString);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController message](self, "message"));
    v18 = objc_msgSend(v19, "initWithString:", v20);

  }
  v21 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v21, "setLineSpacing:", 2.0);
  objc_msgSend(v18, "addAttribute:value:range:", NSParagraphStyleAttributeName, v21, 0, objc_msgSend(v18, "length"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v22, "setAttributedText:", v18);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v23, "setTextAlignment:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v24, "setNumberOfLines:", 4);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v26, "setTextColor:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v27, "setLineBreakMode:", 4);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController toastView](self, "toastView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "contentView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController imageView](self, "imageView"));
  objc_msgSend(v29, "addSubview:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController toastView](self, "toastView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "contentView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController primaryLabel](self, "primaryLabel"));
  objc_msgSend(v32, "addSubview:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController toastView](self, "toastView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "contentView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v35, "addSubview:", v36);

  CGAffineTransformMakeScale(&v42, 0.88, 0.88);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController toastView](self, "toastView"));
  v41 = v42;
  objc_msgSend(v37, "setTransform:", &v41);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController toastView](self, "toastView"));
  objc_msgSend(v38, "setAlpha:", 0.0);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController view](self, "view"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController toastView](self, "toastView"));
  objc_msgSend(v39, "addSubview:", v40);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASToastViewController;
  -[ASToastViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController presentationController](self, "presentationController"));
  objc_msgSend(v4, "_setContainerIgnoresDirectTouchEvents:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD v4[5];
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASToastViewController;
  -[ASToastViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100084898;
  v5[3] = &unk_100754B58;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100084914;
  v4[3] = &unk_100754B80;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v5, v4, 0.2, 0.0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double *v34;
  _QWORD *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  float v55;
  void *v56;
  id v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  _QWORD v80[7];
  _QWORD v81[4];
  uint64_t v82;
  double *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  double *v87;
  uint64_t v88;
  void *v89;
  __int128 v90;
  __int128 v91;
  objc_super v92;

  v92.receiver = self;
  v92.super_class = (Class)ASToastViewController;
  -[ASToastViewController viewDidLayoutSubviews](&v92, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v77 = v4;
  v78 = v5;
  v79 = v6;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v9, "displayScale");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController toastView](self, "toastView"));
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, 250.0, 450.0);

  v86 = 0;
  v87 = (double *)&v86;
  v88 = 0x4010000000;
  v89 = &unk_1006A0193;
  v90 = 0u;
  v91 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController toastView](self, "toastView"));
  objc_msgSend(v13, "bounds");
  *(double *)&v90 = v14 + 25.0;
  *((double *)&v90 + 1) = v15 + 40.0;
  *(double *)&v91 = v16 + -50.0;
  *((double *)&v91 + 1) = v17 + -65.0;

  v18 = v87[4];
  v19 = v87[5];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController toastView](self, "toastView"));
  v21 = objc_msgSend(v20, "bounds");
  v26 = UIRectCenteredXInRectScale(v21, v18, v19, 90.0, 90.0, v22, v23, v24, v25, v11);
  v28 = v27;
  v30 = v29;
  v32 = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController imageView](self, "imageView"));
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

  v34 = v87;
  v87[5] = v32 + v87[5];
  v34[7] = v34[7] - v32;
  v82 = 0;
  v83 = (double *)&v82;
  v84 = 0x2020000000;
  v85 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  v81[3] = 0;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100084DE4;
  v80[3] = &unk_100754BA8;
  v80[4] = &v86;
  v80[5] = v81;
  v80[6] = &v82;
  v35 = objc_retainBlock(v80);
  v36 = objc_msgSend((id)objc_opt_class(self), "_primaryLabelFont");
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController primaryLabel](self, "primaryLabel"));
  objc_msgSend(v38, "setFont:", v37);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController primaryLabel](self, "primaryLabel"));
  ((void (*)(_QWORD *, void *, _QWORD, double))v35[2])(v35, v39, 0, 18.0);

  v40 = objc_msgSend((id)objc_opt_class(self), "_secondaryLabelFont");
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v42, "setFont:", v41);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController secondaryLabel](self, "secondaryLabel"));
  ((void (*)(_QWORD *, void *, _QWORD, double))v35[2])(v35, v43, 0, 25.5);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController toastView](self, "toastView"));
  objc_msgSend(v44, "bounds");
  v46 = v45;
  v48 = v47;
  v50 = v49;

  v51 = v83[3];
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController toastView](self, "toastView"));
  v53 = v52;
  v54 = fmin(v51 + 25.0, 450.0);
  if (v54 < 250.0)
    v54 = 250.0;
  v55 = v54;
  objc_msgSend(v52, "setBounds:", v46, v48, v50, ceilf(v55));

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController toastView](self, "toastView"));
  v57 = objc_msgSend(v56, "frame");
  v62 = UIRectCenteredXInRectScale(v57, v58, v59, v60, v61, v77, v79, v78, v8, v11);
  v64 = v63;
  v66 = v65;
  v68 = v67;

  v69 = UIRectCenteredYInRectScale(v62, v64, v66, v68, v77, v79, v78, v8, v11);
  v71 = v70;
  v73 = v72;
  v75 = v74;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastViewController toastView](self, "toastView"));
  objc_msgSend(v76, "setFrame:", v69, v71, v73, v75);

  _Block_object_dispose(v81, 8);
  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v86, 8);
}

- (void)present
{
  ASToastPresentationWindow *v3;

  v3 = objc_alloc_init(ASToastPresentationWindow);
  -[ASToastViewController setPresentationWindow:](self, "setPresentationWindow:", v3);
  -[ASToastPresentationWindow setHidden:](v3, "setHidden:", 0);
  -[ASToastPresentationWindow setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  -[ASToastPresentationWindow presentViewController:animated:completion:](v3, "presentViewController:animated:completion:", self, 0, 0);

}

- (void)_dismissAfterDelay:(double)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100085084;
  v4[3] = &unk_100754B58;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100085160;
  v3[3] = &unk_100754B80;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v4, v3, 0.2, a3);
}

+ (id)_primaryLabelFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_100854290;
  if (!qword_100854290)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_fontWithSize:textStyleAttribute:", kCTFontDescriptorTextStyleSemibold, 22.0));
    v4 = (void *)qword_100854290;
    qword_100854290 = v3;

    v2 = (void *)qword_100854290;
  }
  return v2;
}

+ (id)_secondaryLabelFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_100854298;
  if (!qword_100854298)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_fontWithSize:textStyleAttribute:", kCTFontDescriptorTextStyleRegular, 16.0));
    v4 = (void *)qword_100854298;
    qword_100854298 = v3;

    v2 = (void *)qword_100854298;
  }
  return v2;
}

+ (id)_fontWithSize:(double)a3 textStyleAttribute:(__CFString *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIFontDescriptorAttributeName v11;
  __CFString *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptor"));
  v11 = UIFontDescriptorTextStyleAttribute;
  v12 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v8, 0.0));

  return v9;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (ASToastPresentationWindow)presentationWindow
{
  return self->_presentationWindow;
}

- (void)setPresentationWindow:(id)a3
{
  objc_storeStrong((id *)&self->_presentationWindow, a3);
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIVisualEffectView)toastView
{
  return self->_toastView;
}

- (void)setToastView:(id)a3
{
  objc_storeStrong((id *)&self->_toastView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toastView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
