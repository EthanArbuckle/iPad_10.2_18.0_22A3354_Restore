@implementation HUMultiUserTokenFixTableView

- (HUMultiUserTokenFixTableView)initWithFrame:(CGRect)a3 mediaAccount:(id)a4 home:(id)a5 delegate:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  HUMultiUserTokenFixTableView *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  objc_super v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HUMultiUserTokenFixTableView;
  v17 = -[HUMultiUserTokenFixTableView initWithFrame:style:](&v25, sel_initWithFrame_style_, 2, x, y, width, height);
  if (v17)
  {
    v18 = objc_opt_class();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMultiUserTokenFixTableView registerClass:forCellReuseIdentifier:](v17, "registerClass:forCellReuseIdentifier:", v18, v20);

    v21 = objc_opt_class();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMultiUserTokenFixTableView registerClass:forCellReuseIdentifier:](v17, "registerClass:forCellReuseIdentifier:", v21, v23);

    objc_storeStrong((id *)&v17->_mediaAccount, a4);
    objc_storeStrong((id *)&v17->_home, a5);
    objc_storeWeak((id *)&v17->_mediaAccountDelegate, v16);
    -[HUMultiUserTokenFixTableView setDataSource:](v17, "setDataSource:", v17);
    -[HUMultiUserTokenFixTableView setDelegate:](v17, "setDelegate:", v17);
    -[HUMultiUserTokenFixTableView setScrollEnabled:](v17, "setScrollEnabled:", 0);
    -[HUMultiUserTokenFixTableView reloadData](v17, "reloadData");
  }

  return v17;
}

- (id)_titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB568], 32770);
}

- (id)_descriptionFont
{
  return (id)objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB558], 0x8000);
}

- (double)_descriptionHeight
{
  void *v2;
  double v3;
  double v4;

  -[HUMultiUserTokenFixTableView _descriptionFont](self, "_descriptionFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 20.0);
  v4 = v3;

  return v4;
}

- (double)_titleHeight
{
  void *v2;
  double v3;
  double v4;

  -[HUMultiUserTokenFixTableView _titleFont](self, "_titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 32.0);
  v4 = v3;

  return v4;
}

- (id)_buttonTitleTextFont
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
}

- (double)_buttonTitleTextHeight
{
  void *v2;
  double v3;
  double v4;

  -[HUMultiUserTokenFixTableView _buttonTitleTextFont](self, "_buttonTitleTextFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 28.0);
  v4 = v3;

  return v4;
}

- (double)_maxTitleAndDescriptionCellHeightForWidth:(double)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  _HULocalizedStringWithDefaultValue(CFSTR("HUMultiUserTokenFix_Title"), CFSTR("HUMultiUserTokenFix_Title"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *MEMORY[0x1E0CEA098];
  v6 = v37;
  -[HUMultiUserTokenFixTableView _titleFont](self, "_titleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a3, 3.40282347e38);
  v10 = v9;

  -[HUMultiUserTokenFixTableView _titleFont](self, "_titleFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lineHeight");
  v13 = v12;

  -[HUMultiUserTokenFixTableView _titleHeight](self, "_titleHeight");
  v15 = v14;
  -[HUMultiUserTokenFixTableView mediaAccount](self, "mediaAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "username");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUMultiUserTokenFix_Description"), CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v6;
  -[HUMultiUserTokenFixTableView _descriptionFont](self, "_descriptionFont");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "boundingRectWithSize:options:attributes:context:", 1, v26, 0, a3, 3.40282347e38);
  v28 = v27;

  -[HUMultiUserTokenFixTableView _descriptionFont](self, "_descriptionFont");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lineHeight");
  v31 = v30;

  -[HUMultiUserTokenFixTableView _descriptionHeight](self, "_descriptionHeight");
  v33 = v32;

  return v15 * (double)(unint64_t)ceil(v10 / v13)
       + 10.0
       + 4.0
       + v33 * (double)(unint64_t)ceil(v28 / v31)
       + 10.0;
}

- (double)tableViewHeightForWidth:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[HUMultiUserTokenFixTableView _buttonTitleTextHeight](self, "_buttonTitleTextHeight");
  v6 = v5 + 20.0 + 20.0;
  -[HUMultiUserTokenFixTableView _maxTitleAndDescriptionCellHeightForWidth:](self, "_maxTitleAndDescriptionCellHeightForWidth:", a3);
  return v7 + 2.0 + v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v6 = a4;
  v7 = a3;
  if (!objc_msgSend(v6, "row"))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v15, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _HULocalizedStringWithDefaultValue(CFSTR("HUMultiUserTokenFix_Title"), CFSTR("HUMultiUserTokenFix_Title"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleText:", v16);

    objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB568], 32770);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleFont:", v17);

    objc_msgSend(v10, "setMaxNumberOfTitleLines:", 0);
    -[HUMultiUserTokenFixTableView mediaAccount](self, "mediaAccount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "username");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUMultiUserTokenFix_Description"), CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setDescriptionText:", v12);
    objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB558], 0x8000);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDescriptionFont:", v26);

    objc_msgSend(v10, "setMaxNumberOfDescriptionLines:", 0);
    objc_msgSend(v10, "setHideIcon:", 1);
    objc_msgSend(v10, "setSelectionStyle:", 0);
    goto LABEL_5;
  }
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "row");
  if (v11 == 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUMultiUserTokenFix_SignIn"), CFSTR("HUMultiUserTokenFix_SignIn"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

LABEL_5:
  }
  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "row") == 1)
  {
    -[HUMultiUserTokenFixTableView mediaAccountDelegate](self, "mediaAccountDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMultiUserTokenFixTableView mediaAccount](self, "mediaAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMultiUserTokenFixTableView home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "signIniTunesAccount:forHome:", v8, v9);

  }
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (ACAccount)mediaAccount
{
  return self->_mediaAccount;
}

- (void)setMediaAccount:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAccount, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HUMediaAccountDelegate)mediaAccountDelegate
{
  return (HUMediaAccountDelegate *)objc_loadWeakRetained((id *)&self->_mediaAccountDelegate);
}

- (void)setMediaAccountDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mediaAccountDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mediaAccountDelegate);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_mediaAccount, 0);
}

@end
