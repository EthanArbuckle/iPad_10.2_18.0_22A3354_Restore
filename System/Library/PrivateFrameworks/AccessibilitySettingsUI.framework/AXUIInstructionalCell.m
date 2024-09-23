@implementation AXUIInstructionalCell

- (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
}

- (id)backgroundConfiguration
{
  return (id)objc_msgSend(MEMORY[0x24BEBD408], "clearConfiguration");
}

- (AXUIInstructionalCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7;
  AXUIInstructionalCell *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AXUIInstructionalCell;
  v7 = a5;
  v8 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v18, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v7);
  -[PSTableCell setSpecifier:](v8, "setSpecifier:", v7, v18.receiver, v18.super_class);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIInstructionalCell setBackgroundColor:](v8, "setBackgroundColor:", v9);

  objc_msgSend(MEMORY[0x24BEBD408], "clearConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIInstructionalCell setBackgroundConfiguration:](v8, "setBackgroundConfiguration:", v10);

  v11 = *MEMORY[0x24BEBE158];
  v12 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v13 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v14 = *(double *)(MEMORY[0x24BEBE158] + 24);
  -[AXUIInstructionalCell setSeparatorInset:](v8, "setSeparatorInset:", *MEMORY[0x24BEBE158], v12, v13, v14);
  -[AXUIInstructionalCell setLayoutMargins:](v8, "setLayoutMargins:", v11, v12, v13, v14);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIInstructionalCell contentView](v8, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  -[AXUIInstructionalCell _updateProperties](v8, "_updateProperties");
  return v8;
}

- (void)_updateProperties
{
  dlerror();
  abort_report_np();
  sub_235DA7C00();
}

- (double)instrinsicContentHeight
{
  void *v2;
  double v3;
  double v4;

  -[UIViewController view](self->_hostingController, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;

  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)AXUIInstructionalCell;
  -[PSTableCell layoutSubviews](&v13, sel_layoutSubviews);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[AXUIInstructionalCell subviews](self, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        NSClassFromString(CFSTR("_UITableViewCellSeparatorView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "setHidden:", 1);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

}

- (UIViewController)hostingController
{
  return self->_hostingController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_backgroundContentView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
