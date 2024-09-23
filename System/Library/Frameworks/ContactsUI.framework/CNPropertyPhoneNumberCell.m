@implementation CNPropertyPhoneNumberCell

- (void)setStaticIdentityVerified:(BOOL)a3
{
  if (self->_staticIdentityVerified != a3)
  {
    self->_staticIdentityVerified = a3;
    -[CNPropertyPhoneNumberCell updateStaticIdentityBadge](self, "updateStaticIdentityBadge");
  }
}

- (void)setEmergencyPhoneNumber:(BOOL)a3
{
  if (self->_emergencyPhoneNumber != a3)
  {
    self->_emergencyPhoneNumber = a3;
    -[CNPropertyPhoneNumberCell updateEmergencyBadge](self, "updateEmergencyBadge");
  }
}

- (void)updateTransportButtons
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  objc_super v19;

  if (!-[CNPropertySimpleTransportCell allowsActions](self, "allowsActions")
    || -[CNPropertyCell isSuggested](self, "isSuggested")
    || !-[CNPropertySimpleTransportCell shouldShowTransportButtons](self, "shouldShowTransportButtons"))
  {
    -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTransportType:", 0);

    -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTransportType:", 0);

    -[CNPropertySimpleTransportCell transportIcon3](self, "transportIcon3");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
LABEL_9:
    v15 = 0;
LABEL_10:
    objc_msgSend(v11, "setTransportType:", v15);

    goto LABEL_11;
  }
  -[CNPropertySimpleTransportCell transportIcon3](self, "transportIcon3");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransportType:", 0);

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsPhone");

  if (!v5)
  {
    -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTransportType:", 0);

    -[CNPropertyCell propertyItem](self, "propertyItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "allowsIMessage");

    -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v18)
    {
      v15 = 2;
      goto LABEL_10;
    }
    goto LABEL_16;
  }
  -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTransportType:", 1);

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsTTY");

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "allowsIMessage");

  -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    if (v8)
      goto LABEL_15;
LABEL_16:
    v11 = v12;
    goto LABEL_9;
  }
  objc_msgSend(v11, "setTransportType:", 2);

  if (v8)
  {
    -[CNPropertySimpleTransportCell transportIcon3](self, "transportIcon3");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
LABEL_15:
    v15 = 7;
    goto LABEL_10;
  }
LABEL_11:
  v19.receiver = self;
  v19.super_class = (Class)CNPropertyPhoneNumberCell;
  -[CNPropertySimpleTransportCell updateTransportButtons](&v19, sel_updateTransportButtons);
}

- (CNPropertyPhoneNumberCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPropertyPhoneNumberCell;
  return -[CNPropertySimpleTransportCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, a3, a4);
}

- (void)setProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNPropertyPhoneNumberCell;
  v4 = a3;
  -[CNPropertyCell setProperty:](&v10, sel_setProperty_, v4);
  objc_msgSend(v4, "label", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleCell labelView](self, "labelView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAb_text:", v5);

  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "formattedStringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleCell valueView](self, "valueView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAb_text:", v8);

}

- (void)updateStaticIdentityBadge
{
  void *v3;
  uint64_t v4;
  id v5;

  if (-[CNPropertyPhoneNumberCell isStaticIdentityVerified](self, "isStaticIdentityVerified"))
  {
    -[CNPropertyPhoneNumberCell staticIdentityBadgeView](self, "staticIdentityBadgeView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[CNPropertyPhoneNumberCell addStaticIdentityBadgeView](self, "addStaticIdentityBadgeView");
  }
  v4 = -[CNPropertyPhoneNumberCell isStaticIdentityVerified](self, "isStaticIdentityVerified") ^ 1;
  -[CNPropertyPhoneNumberCell staticIdentityBadgeView](self, "staticIdentityBadgeView");
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
  -[CNPropertyPhoneNumberCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v18.receiver = self;
  v18.super_class = (Class)CNPropertyPhoneNumberCell;
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

  -[CNPropertyPhoneNumberCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addConstraints:", v7);

  -[CNPropertyPhoneNumberCell setStaticIdentityBadgeView:](self, "setStaticIdentityBadgeView:", v3);
}

- (BOOL)shouldShowEmergencyBadge
{
  return !-[CNPropertySimpleTransportCell shouldShowTransportButtons](self, "shouldShowTransportButtons")
      && -[CNPropertyPhoneNumberCell isEmergencyPhoneNumber](self, "isEmergencyPhoneNumber");
}

- (BOOL)shouldPerformDefaultAction
{
  void *v3;
  BOOL v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPropertyPhoneNumberCell;
  if (!-[CNPropertySimpleTransportCell shouldPerformDefaultAction](&v7, sel_shouldPerformDefaultAction))
    return -[CNPropertyCell isSuggested](self, "isSuggested");
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "allowsPhone") & 1) != 0)
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

- (void)updateEmergencyBadge
{
  void *v3;
  uint64_t v4;
  id v5;

  if (-[CNPropertyPhoneNumberCell shouldShowEmergencyBadge](self, "shouldShowEmergencyBadge"))
  {
    -[CNPropertyPhoneNumberCell emergencyImageView](self, "emergencyImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[CNPropertyPhoneNumberCell buildEmergencyImageView](self, "buildEmergencyImageView");
  }
  v4 = -[CNPropertyPhoneNumberCell shouldShowEmergencyBadge](self, "shouldShowEmergencyBadge") ^ 1;
  -[CNPropertyPhoneNumberCell emergencyImageView](self, "emergencyImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

}

- (void)buildEmergencyImageView
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3870];
  +[CNUIColorRepository contactListEmergencyContactGlyphColor](CNUIColorRepository, "contactListEmergencyContactGlyphColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cnui_symbolImageNamed:scale:withColor:useFixedSize:", CFSTR("staroflife.fill"), 3, v4, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v31);
  -[CNPropertyPhoneNumberCell setEmergencyImageView:](self, "setEmergencyImageView:", v5);

  -[CNPropertyPhoneNumberCell emergencyImageView](self, "emergencyImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNPropertyPhoneNumberCell emergencyImageView](self, "emergencyImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1148846080;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v8);

  -[CNPropertyPhoneNumberCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyPhoneNumberCell emergencyImageView](self, "emergencyImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (void *)MEMORY[0x1E0C99DE8];
  v32.receiver = self;
  v32.super_class = (Class)CNPropertyPhoneNumberCell;
  -[CNLabeledCell constantConstraints](&v32, sel_constantConstraints);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithArray:", v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPropertyPhoneNumberCell emergencyImageView](self, "emergencyImageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyPhoneNumberCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v26;
  -[CNPropertyPhoneNumberCell emergencyImageView](self, "emergencyImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyPhoneNumberCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v13, -16.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v14;
  -[CNPropertyPhoneNumberCell emergencyImageView](self, "emergencyImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleCell valueView](self, "valueView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 16.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v20);

  -[CNPropertyPhoneNumberCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addConstraints:", v24);

}

- (void)copy:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[CNPropertyCell propertyItem](self, "propertyItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayValue");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!-[CNPropertyPhoneNumberCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
  {
    objc_msgSend(v7, "_cn_stringBySanitizingPhoneNumber");
    v5 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v5;
  }
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setString:", v7);

}

- (BOOL)isStaticIdentityVerified
{
  return self->_staticIdentityVerified;
}

- (BOOL)isEmergencyPhoneNumber
{
  return self->_emergencyPhoneNumber;
}

- (CNStaticIdentityBadgeView)staticIdentityBadgeView
{
  return self->_staticIdentityBadgeView;
}

- (void)setStaticIdentityBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_staticIdentityBadgeView, a3);
}

- (UIImageView)emergencyImageView
{
  return self->_emergencyImageView;
}

- (void)setEmergencyImageView:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emergencyImageView, 0);
  objc_storeStrong((id *)&self->_staticIdentityBadgeView, 0);
}

@end
