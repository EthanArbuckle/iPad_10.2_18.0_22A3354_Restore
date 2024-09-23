@implementation CNPropertyEmailAddressCell

- (void)updateValueWithPropertyItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  if (-[CNPropertyEmailAddressCell isEditing](self, "isEditing"))
  {
    v12.receiver = self;
    v12.super_class = (Class)CNPropertyEmailAddressCell;
    -[CNPropertyCell updateValueWithPropertyItem:](&v12, sel_updateValueWithPropertyItem_, v4);
  }
  else
  {
    v5 = *MEMORY[0x1E0D13770];
    -[CNPropertyCell valueString](self, "valueString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNPropertySimpleCell valueView](self, "valueView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ab_text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    if ((v10 & 1) == 0)
    {
      -[CNPropertySimpleCell valueView](self, "valueView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAb_text:", v7);

    }
  }

}

- (void)setVIP:(BOOL)a3
{
  self->_VIP = a3;
  -[CNPropertySimpleTransportCell updateStarIcon](self, "updateStarIcon");
}

- (void)setStaticIdentityVerified:(BOOL)a3
{
  if (self->_staticIdentityVerified != a3)
  {
    self->_staticIdentityVerified = a3;
    -[CNPropertyEmailAddressCell updateStaticIdentityBadge](self, "updateStaticIdentityBadge");
  }
}

- (BOOL)shouldShowStar
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPropertyEmailAddressCell;
  return -[CNPropertySimpleTransportCell shouldShowStar](&v4, sel_shouldShowStar)
      || -[CNPropertyEmailAddressCell isVIP](self, "isVIP");
}

- (BOOL)isVIP
{
  return self->_VIP;
}

- (void)updateTransportButtons
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v18;

  if (!-[CNPropertySimpleTransportCell allowsActions](self, "allowsActions")
    || -[CNPropertyCell isSuggested](self, "isSuggested"))
  {
    -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    goto LABEL_4;
  }
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "allowsEmail") & 1) == 0)
  {

LABEL_12:
    -[CNPropertyCell propertyItem](self, "propertyItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "allowsIMessage");

    -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v17)
    {
      v5 = 2;
      goto LABEL_5;
    }
LABEL_4:
    v5 = 0;
LABEL_5:
    objc_msgSend(v3, "setTransportType:", v5);

    -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
    goto LABEL_6;
  }
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "allowsIMessage");

  if (!v11)
    goto LABEL_12;
  +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasCellularTelephonyCapability");

  -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    objc_msgSend(v14, "setTransportType:", 4);

    -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 2;
  }
  else
  {
    objc_msgSend(v14, "setTransportType:", 2);

    -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 4;
  }
LABEL_6:
  objc_msgSend(v6, "setTransportType:", v8);

  v18.receiver = self;
  v18.super_class = (Class)CNPropertyEmailAddressCell;
  -[CNPropertySimpleTransportCell updateTransportButtons](&v18, sel_updateTransportButtons);
}

- (BOOL)shouldPerformDefaultAction
{
  void *v3;
  BOOL v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPropertyEmailAddressCell;
  if (!-[CNPropertySimpleTransportCell shouldPerformDefaultAction](&v7, sel_shouldPerformDefaultAction))
    return -[CNPropertyCell isSuggested](self, "isSuggested");
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "allowsEmail") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[CNPropertyCell propertyItem](self, "propertyItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_msgSend(v5, "allowsIMessage") & 1) != 0 || -[CNPropertyCell isSuggested](self, "isSuggested");

  }
  return v4;
}

- (void)updateStaticIdentityBadge
{
  void *v3;
  uint64_t v4;
  id v5;

  if (-[CNPropertyEmailAddressCell isStaticIdentityVerified](self, "isStaticIdentityVerified"))
  {
    -[CNPropertyEmailAddressCell staticIdentityBadgeView](self, "staticIdentityBadgeView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[CNPropertyEmailAddressCell addStaticIdentityBadgeView](self, "addStaticIdentityBadgeView");
  }
  v4 = -[CNPropertyEmailAddressCell isStaticIdentityVerified](self, "isStaticIdentityVerified") ^ 1;
  -[CNPropertyEmailAddressCell staticIdentityBadgeView](self, "staticIdentityBadgeView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

}

- (void)addStaticIdentityBadgeView
{
  CNStaticIdentityBadgeView *v3;
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
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(CNStaticIdentityBadgeView);
  -[CNStaticIdentityBadgeView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNPropertyEmailAddressCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v18.receiver = self;
  v18.super_class = (Class)CNPropertyEmailAddressCell;
  -[CNLabeledCell constantConstraints](&v18, sel_constantConstraints);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNStaticIdentityBadgeView centerYAnchor](v3, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleCell labelLabel](self, "labelLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  -[CNStaticIdentityBadgeView trailingAnchor](v3, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleCell valueLabel](self, "valueLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v14);

  -[CNPropertyEmailAddressCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addConstraints:", v7);

  -[CNPropertyEmailAddressCell setStaticIdentityBadgeView:](self, "setStaticIdentityBadgeView:", v3);
}

- (BOOL)isStaticIdentityVerified
{
  return self->_staticIdentityVerified;
}

- (CNStaticIdentityBadgeView)staticIdentityBadgeView
{
  return self->_staticIdentityBadgeView;
}

- (void)setStaticIdentityBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_staticIdentityBadgeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticIdentityBadgeView, 0);
}

@end
