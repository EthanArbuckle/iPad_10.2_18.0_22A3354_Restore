@implementation HSPCNameServiceRow

+ (id)_reuseIdentifier
{
  return CFSTR("HSPCNameServiceRow");
}

- (HSPCNameServiceRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HSPCNameServiceRow *v4;
  HSPCNameServiceRow *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HSPCNameServiceRow;
  v4 = -[HSPCRow initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](v4, "textField"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textColor"));
    objc_storeWeak((id *)&v5->_defaultTextColor, v7);

    v8 = objc_msgSend(objc_alloc((Class)HUIconView), "initWithFrame:contentMode:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v8, "setIconSize:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServiceRow contentView](v5, "contentView"));
    objc_msgSend(v9, "addSubview:", v8);

    -[HSPCRow setLeftView:](v5, "setLeftView:", v8);
  }
  return v5;
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
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServiceRow contentView](self, "contentView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
    +[HSPCRow horizontalLeadingMargin](HSPCRow, "horizontalLeadingMargin");
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v37));
    v47[0] = v35;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerYAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServiceRow contentView](self, "contentView"));
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
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServiceRow contentView](self, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v28));
    v46[1] = v27;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServiceRow contentView](self, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
    +[HSPCRow horizontalTrailingMargin](HSPCRow, "horizontalTrailingMargin");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v16, -v17));
    v46[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServiceRow contentView](self, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
    v46[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    -[HSPCRow setConstraintsSet:](self, "setConstraintsSet:", 1);
  }
  v45.receiver = self;
  v45.super_class = (Class)HSPCNameServiceRow;
  -[HSPCNameServiceRow updateConstraints](&v45, "updateConstraints");
}

- (void)updateUIWithService:(id)a3 suggestedName:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v6 = a4;
  -[HSPCNameServiceRow setService:](self, "setService:", v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "accessory"));
  v8 = objc_msgSend(v7, "hf_isTelevision");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "hf_effectiveServiceType"));
  if ((v8 & 1) != 0)
    v10 = 0;
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[HFServiceIconFactory defaultIconDescriptorForServiceType:serviceSubtype:](HFServiceIconFactory, "defaultIconDescriptorForServiceType:serviceSubtype:", v9, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
  objc_msgSend(v11, "setText:", v6);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
  objc_msgSend(v12, "setPlaceholder:", v6);

  v14 = objc_opt_class(HUIconView, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
  if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v10 && v17)
    objc_msgSend(v17, "updateWithIconDescriptor:displayStyle:animated:", v10, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "serviceType"));
  v19 = objc_msgSend(v18, "isEqualToString:", HMServiceTypeInputSource);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "hf_characteristicOfType:", HMCharacteristicTypeConfiguredName));
  v21 = objc_msgSend(v20, "hf_isWritable");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
  v23 = v22;
  if (!v19 || (v21 & 1) != 0)
  {
    objc_msgSend(v22, "setEnabled:", 1);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServiceRow defaultTextColor](self, "defaultTextColor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    objc_msgSend(v30, "setTextColor:", v29);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v27 = v26;
    v28 = 3;
  }
  else
  {
    objc_msgSend(v22, "setEnabled:", 0);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    objc_msgSend(v25, "setTextColor:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v27 = v26;
    v28 = 0;
  }
  objc_msgSend(v26, "setClearButtonMode:", v28);

  -[HSPCNameServiceRow setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (HMService)service
{
  return (HMService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (UIColor)defaultTextColor
{
  return (UIColor *)objc_loadWeakRetained((id *)&self->_defaultTextColor);
}

- (void)setDefaultTextColor:(id)a3
{
  objc_storeWeak((id *)&self->_defaultTextColor, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_defaultTextColor);
  objc_destroyWeak((id *)&self->_service);
}

@end
