@implementation SFDismissButton

- (SFDismissButton)init
{
  SFDismissButton *v3;
  void *v4;
  void *v5;
  void *v6;
  SFDismissButton *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFDismissButton;
  objc_msgSend(-[SFDismissButton class](&v9, sel_class), "buttonWithType:", 1);
  v3 = (SFDismissButton *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v3->_style = 0;
    v4 = (void *)MEMORY[0x1E0DC37E8];
    objc_msgSend(MEMORY[0x1E0DC37E8], "labelFontSize");
    objc_msgSend(v4, "systemFontOfSize:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDismissButton titleLabel](v3, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v5);

    -[SFDismissButton _updateButtonStyle]((uint64_t)v3);
    v7 = v3;
  }

  return v3;
}

- (uint64_t)_updateButtonStyle
{
  void *v1;
  void *v2;

  if (result)
  {
    v1 = (void *)result;
    +[SFDismissButton titleForDismissButtonStyle:]((uint64_t)SFDismissButton, *(_QWORD *)(result + 752));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setTitle:forState:", v2, 0);

    return objc_msgSend(v1, "sizeToFit");
  }
  return result;
}

- (uint64_t)setStyle:(uint64_t)result
{
  if (result)
  {
    if (*(_QWORD *)(result + 752) != a2)
    {
      *(_QWORD *)(result + 752) = a2;
      return -[SFDismissButton _updateButtonStyle](result);
    }
  }
  return result;
}

+ (id)titleForDismissButtonStyle:(uint64_t)a1
{
  void *v3;

  v3 = (void *)objc_opt_self();
  if (a2 <= 2)
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setPreferredTraitCollection:(id *)a1
{
  id v4;
  id v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a2;
  if (a1)
  {
    v5 = a1[95];
    if (v5 != v4)
    {
      v12 = v4;
      v6 = objc_msgSend(v5, "isEqual:", v4);
      v4 = v12;
      if ((v6 & 1) == 0)
      {
        objc_storeStrong(a1 + 95, a2);
        objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0DC37E8];
        objc_msgSend(MEMORY[0x1E0DC37E8], "labelFontSize");
        objc_msgSend(v8, "systemFontOfSize:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "scaledFontForFont:compatibleWithTraitCollection:", v9, v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "titleLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFont:", v10);

        objc_msgSend(a1, "sizeToFit");
        v4 = v12;
      }
    }
  }

}

- (uint64_t)style
{
  if (result)
    return *(_QWORD *)(result + 752);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredTraitCollection, 0);
}

@end
