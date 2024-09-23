@implementation HSPCAssociatedServiceRow

- (HSPCAssociatedServiceRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HSPCAssociatedServiceRow *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HSPCAssociatedServiceRow;
  v4 = -[HSPCRow initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)HUIconView), "initWithFrame:contentMode:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v5, "setIconSize:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedServiceRow contentView](v4, "contentView"));
    objc_msgSend(v6, "addSubview:", v5);

    -[HSPCRow setLeftView:](v4, "setLeftView:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](v4, "textField"));
    objc_msgSend(v7, "setEnabled:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](v4, "textField"));
    objc_msgSend(v8, "setClearButtonMode:", 0);

  }
  return v4;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;
  _QWORD v46[4];
  _QWORD v47[4];

  if (!-[HSPCRow constraintsSet](self, "constraintsSet"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedServiceRow contentView](self, "contentView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
    +[HSPCRow horizontalLeadingMargin](HSPCRow, "horizontalLeadingMargin");
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v37));
    v47[0] = v35;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerYAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedServiceRow contentView](self, "contentView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "centerYAnchor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v4));
    v47[1] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
    +[HSPCRow leftImageSize](HSPCRow, "leftImageSize");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:", v8));
    v47[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "widthAnchor"));
    +[HSPCRow leftImageSize](HSPCRow, "leftImageSize");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:"));
    v47[3] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
    +[HSPCRow horizontalSpacing](HSPCRow, "horizontalSpacing");
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v38));
    v46[0] = v36;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedServiceRow contentView](self, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v28));
    v46[1] = v27;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedServiceRow contentView](self, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
    +[HSPCRow horizontalTrailingMargin](HSPCRow, "horizontalTrailingMargin");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v16, -v17));
    v46[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedServiceRow contentView](self, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
    v46[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    -[HSPCRow setConstraintsSet:](self, "setConstraintsSet:", 1);
  }
  v45.receiver = self;
  v45.super_class = (Class)HSPCAssociatedServiceRow;
  -[HSPCAssociatedServiceRow updateConstraints](&v45, "updateConstraints");
}

- (void)updateUIWithServiceType:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[HFServiceIconFactory defaultIconDescriptorForServiceType:serviceSubtype:](HFServiceIconFactory, "defaultIconDescriptorForServiceType:serviceSubtype:", v4, 0));
  v6 = objc_opt_class(HUIconView, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "updateWithIconDescriptor:displayStyle:animated:", v12, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HMService hf_userFriendlyLocalizedCapitalizedDescription:](HMService, "hf_userFriendlyLocalizedCapitalizedDescription:", v4));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
  objc_msgSend(v11, "setText:", v10);

  -[HSPCAssociatedServiceRow setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateUIWithTuple:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessory"));
  v13 = (id)objc_claimAutoreleasedReturnValue(+[HFServiceIconFactory iconDescriptorForAccessory:](HFServiceIconFactory, "iconDescriptorForAccessory:", v5));

  v7 = objc_opt_class(HUIconView, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
  if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "updateWithIconDescriptor:displayStyle:animated:", v13, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleForAccessory"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
  objc_msgSend(v12, "setText:", v11);

  -[HSPCAssociatedServiceRow setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

@end
