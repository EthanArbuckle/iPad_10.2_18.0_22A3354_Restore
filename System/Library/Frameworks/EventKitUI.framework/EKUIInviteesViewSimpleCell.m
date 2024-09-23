@implementation EKUIInviteesViewSimpleCell

- (EKUIInviteesViewSimpleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIInviteesViewSimpleCell *v4;
  EKUIInviteesViewSimpleCell *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)EKUIInviteesViewSimpleCell;
  v4 = -[EKUIInviteesViewSimpleCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[EKUIInviteesViewSimpleCell setAccessoryType:](v4, "setAccessoryType:", 1);
    v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)objc_opt_class(), "_simpleTextLabelFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[EKUIInviteesViewSimpleCell textLabel](v5, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v9);

    objc_msgSend(v6, "setNumberOfLines:", 0);
    objc_msgSend((id)objc_opt_class(), "labelText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v10);

    -[EKUIInviteesViewSimpleCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v6);

    -[EKUIInviteesViewSimpleCell setSimpleTextLabel:](v5, "setSimpleTextLabel:", v6);
    -[EKUIInviteesViewSimpleCell setSeparatorInset:](v5, "setSeparatorInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[EKUIInviteesViewSimpleCell setNeedsUpdateConstraints](v5, "setNeedsUpdateConstraints");

  }
  return v5;
}

- (void)updateConstraints
{
  void *v3;
  id v4;
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
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  -[EKUIInviteesViewSimpleCell persistentConstraints](self, "persistentConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[EKUIInviteesViewSimpleCell isCentered](self, "isCentered"))
    {
      v5 = (void *)MEMORY[0x1E0CB3718];
      -[EKUIInviteesViewSimpleCell simpleTextLabel](self, "simpleTextLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIInviteesViewSimpleCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 9, 0, v7, 9, 1.0, 0.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
    v9 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewSimpleCell simpleTextLabel](self, "simpleTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewSimpleCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 5, 0, v11, 17, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    v13 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewSimpleCell simpleTextLabel](self, "simpleTextLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewSimpleCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 6, 0, v15, 6, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

    v17 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewSimpleCell simpleTextLabel](self, "simpleTextLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewSimpleCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_simpleTextLabelFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_scaledValueForValue:", 28.0);
    objc_msgSend(v17, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 12, 0, v19, 3, 1.0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v22);

    v23 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewSimpleCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewSimpleCell simpleTextLabel](self, "simpleTextLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_simpleTextLabelFont");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_scaledValueForValue:", 16.0);
    objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 4, 0, v25, 11, 1.0, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v28);

    v29 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewSimpleCell contentView](self, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v30, 8, 1, 0, 0, 1.0, 44.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v31);

    -[EKUIInviteesViewSimpleCell contentView](self, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addConstraints:", v4);

    -[EKUIInviteesViewSimpleCell setPersistentConstraints:](self, "setPersistentConstraints:", v4);
  }
  v33.receiver = self;
  v33.super_class = (Class)EKUIInviteesViewSimpleCell;
  -[EKUIInviteesViewSimpleCell updateConstraints](&v33, sel_updateConstraints);
}

+ (id)_simpleTextLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (id)labelText
{
  return CFSTR("Implement in Subclass");
}

+ (int64_t)accessoryType
{
  return 0;
}

- (BOOL)isCentered
{
  return 0;
}

- (UILabel)simpleTextLabel
{
  return self->_simpleTextLabel;
}

- (void)setSimpleTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_simpleTextLabel, a3);
}

- (NSArray)persistentConstraints
{
  return self->_persistentConstraints;
}

- (void)setPersistentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_persistentConstraints, a3);
}

- (NSString)simpleText
{
  return self->_simpleText;
}

- (void)setSimpleText:(id)a3
{
  objc_storeStrong((id *)&self->_simpleText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simpleText, 0);
  objc_storeStrong((id *)&self->_persistentConstraints, 0);
  objc_storeStrong((id *)&self->_simpleTextLabel, 0);
}

@end
