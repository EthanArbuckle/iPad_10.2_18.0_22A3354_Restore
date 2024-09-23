@implementation TrapOverlayView

- (TrapOverlayView)initWithFrame:(CGRect)a3
{
  TrapOverlayView *v3;
  void *v4;
  id v5;
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
  objc_super v19;
  UIFontDescriptorTraitKey v20;
  _UNKNOWN **v21;
  UIFontDescriptorAttributeName v22;
  void *v23;

  v19.receiver = self;
  v19.super_class = (Class)TrapOverlayView;
  v3 = -[TrapOverlayView initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[TrapOverlayView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[TrapOverlayView setLabel:](v3, "setLabel:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView label](v3, "label"));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView label](v3, "label"));
    objc_msgSend(v8, "setTextColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleFootnote));
    v22 = UIFontDescriptorTraitsAttribute;
    v20 = UIFontSymbolicTrait;
    v21 = &off_10000C728;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v23 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fontDescriptorByAddingAttributes:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v12, 0.0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView label](v3, "label"));
    objc_msgSend(v14, "setFont:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView label](v3, "label"));
    objc_msgSend(v15, "setNumberOfLines:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView label](v3, "label"));
    objc_msgSend(v16, "setTextAlignment:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView label](v3, "label"));
    -[TrapOverlayView addSubview:](v3, "addSubview:", v17);

  }
  return v3;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[4];

  v27.receiver = self;
  v27.super_class = (Class)TrapOverlayView;
  -[TrapOverlayView updateConstraints](&v27, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView constraints](self, "constraints"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView constraints](self, "constraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v4);

    -[TrapOverlayView setConstraints:](self, "setConstraints:", 0);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView label](self, "label"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "widthAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "widthAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:multiplier:constant:", v23, 1.0, -20.0));
  v28[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView label](self, "label"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "heightAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "heightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:multiplier:constant:", v18, 1.0, -20.0));
  v28[1] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView label](self, "label"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v6));
  v28[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView label](self, "label"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerYAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -10.0));
  v28[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
  -[TrapOverlayView setConstraints:](self, "setConstraints:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView constraints](self, "constraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSArray)constraints
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
