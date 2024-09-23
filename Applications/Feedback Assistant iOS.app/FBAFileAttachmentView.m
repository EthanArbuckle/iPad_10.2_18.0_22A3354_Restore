@implementation FBAFileAttachmentView

- (FBAFileAttachmentView)initWithFileName:(id)a3 requirement:(id)a4 font:(id)a5 textColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FBAFileAttachmentView *v14;
  FBAFileAttachmentView *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)FBAFileAttachmentView;
  v14 = -[FBAFileAttachmentView initWithFrame:](&v17, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v15 = v14;
  if (v14)
  {
    -[FBAFileAttachmentView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FBAFileAttachmentView initializeWithFileName:requirement:font:textColor:](v15, "initializeWithFileName:requirement:font:textColor:", v10, v11, v12, v13);
  }

  return v15;
}

- (void)initializeWithFileName:(id)a3 requirement:(id)a4 font:(id)a5 textColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v14, "setNumberOfLines:", 0);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "setFont:", v12);
  objc_msgSend(v14, "setTextColor:", v13);

  -[FBAFileAttachmentView addSubview:](self, "addSubview:", v14);
  objc_msgSend(v14, "setText:", v10);
  v35 = v11;
  if (v10)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[FBKFileMatcher iconForFileName:](FBKFileMatcher, "iconForFileName:", v10));
  }
  else
  {
    if (!v11)
    {
      v16 = 0;
      goto LABEL_6;
    }
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "iconForRequirement"));
  }
  v16 = (void *)v15;
LABEL_6:
  v17 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v16);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[FBAFileAttachmentView addSubview:](self, "addSubview:", v17);
  v18 = _NSDictionaryOfVariableBindings(CFSTR("answerLabel, icon"), v14, v17, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[icon]-(8)-[answerLabel]|"), 0, 0, v19));
  -[FBAFileAttachmentView addConstraints:](self, "addConstraints:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[answerLabel]|"), 0, 0, v19));
  -[FBAFileAttachmentView addConstraints:](self, "addConstraints:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 10, 0, v17, 10, 1.0, 0.0));
  -[FBAFileAttachmentView addConstraint:](self, "addConstraint:", v22);

  objc_msgSend(v16, "size");
  v24 = v23;
  objc_msgSend(v16, "size");
  v26 = v24 / v25;
  objc_msgSend(v12, "pointSize");
  v28 = v27 * 1.1 * v26;
  v38 = CFSTR("height");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v39 = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[icon(height)]"), 0, v30, v19));
  objc_msgSend(v17, "addConstraints:", v31);

  v36 = CFSTR("width");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28));
  v37 = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[icon(width)]"), 0, v33, v19));
  objc_msgSend(v17, "addConstraints:", v34);

  -[FBAFileAttachmentView setNeedsLayout](self, "setNeedsLayout");
}

@end
