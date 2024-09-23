@implementation CNPropertyLabelButton

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNPropertyLabelButton;
  -[CNPropertyLabelButton tintColorDidChange](&v6, sel_tintColorDidChange);
  -[CNPropertyLabelButton titleColorForState:](self, "titleColorForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyLabelButton tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    -[CNPropertyLabelButton tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyLabelButton setTitleColor:forState:](self, "setTitleColor:forState:", v5, 0);

  }
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
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3718];
  -[CNPropertyLabelButton titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 3, 0, self, 3, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x1E0CB3718];
  -[CNPropertyLabelButton titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 4, 0, self, 4, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
  v10.receiver = self;
  v10.super_class = (Class)CNPropertyLabelButton;
  -[CNPropertyLabelButton updateConstraints](&v10, sel_updateConstraints);

}

+ (id)propertyLabelButton
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleColor:forState:", v4, 0);

  objc_msgSend(MEMORY[0x1E0DC3E88], "_currentTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 != 5)
  {
    +[CNUIColorRepository contactStyleDefaultReadOnlyTextColor](CNUIColorRepository, "contactStyleDefaultReadOnlyTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitleColor:forState:", v7, 2);

  }
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
    v8 = 1;
  else
    v8 = 2;
  objc_msgSend(v3, "setContentHorizontalAlignment:", v8);
  return v3;
}

@end
