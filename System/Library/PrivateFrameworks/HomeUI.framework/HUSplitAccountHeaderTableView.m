@implementation HUSplitAccountHeaderTableView

- (HUSplitAccountHeaderTableView)initWithFrame:(CGRect)a3 mediaAccount:(id)a4 home:(id)a5 delegate:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  HUSplitAccountHeaderTableView *v17;
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
  v25.super_class = (Class)HUSplitAccountHeaderTableView;
  v17 = -[HUSplitAccountHeaderTableView initWithFrame:style:](&v25, sel_initWithFrame_style_, 2, x, y, width, height);
  if (v17)
  {
    v18 = objc_opt_class();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSplitAccountHeaderTableView registerClass:forCellReuseIdentifier:](v17, "registerClass:forCellReuseIdentifier:", v18, v20);

    v21 = objc_opt_class();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSplitAccountHeaderTableView registerClass:forCellReuseIdentifier:](v17, "registerClass:forCellReuseIdentifier:", v21, v23);

    objc_storeStrong((id *)&v17->_mediaAccount, a4);
    objc_storeStrong((id *)&v17->_home, a5);
    objc_storeWeak((id *)&v17->_splitAccountDelegate, v16);
    -[HUSplitAccountHeaderTableView setDataSource:](v17, "setDataSource:", v17);
    -[HUSplitAccountHeaderTableView setDelegate:](v17, "setDelegate:", v17);
    -[HUSplitAccountHeaderTableView setScrollEnabled:](v17, "setScrollEnabled:", 0);
    -[HUSplitAccountHeaderTableView reloadData](v17, "reloadData");
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

  -[HUSplitAccountHeaderTableView _descriptionFont](self, "_descriptionFont");
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

  -[HUSplitAccountHeaderTableView _titleFont](self, "_titleFont");
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

  -[HUSplitAccountHeaderTableView _buttonTitleTextFont](self, "_buttonTitleTextFont");
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
  _HULocalizedStringWithDefaultValue(CFSTR("HUSplitAccount_Title"), CFSTR("HUSplitAccount_Title"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *MEMORY[0x1E0CEA098];
  v6 = v37;
  -[HUSplitAccountHeaderTableView _titleFont](self, "_titleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a3, 3.40282347e38);
  v10 = v9;

  -[HUSplitAccountHeaderTableView _titleFont](self, "_titleFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lineHeight");
  v13 = v12;

  -[HUSplitAccountHeaderTableView _titleHeight](self, "_titleHeight");
  v15 = v14;
  -[HUSplitAccountHeaderTableView mediaAccount](self, "mediaAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "username");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUSplitAccount_Description"), CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v6;
  -[HUSplitAccountHeaderTableView _descriptionFont](self, "_descriptionFont");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "boundingRectWithSize:options:attributes:context:", 1, v26, 0, a3, 3.40282347e38);
  v28 = v27;

  -[HUSplitAccountHeaderTableView _descriptionFont](self, "_descriptionFont");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lineHeight");
  v31 = v30;

  -[HUSplitAccountHeaderTableView _descriptionHeight](self, "_descriptionHeight");
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

  -[HUSplitAccountHeaderTableView _buttonTitleTextHeight](self, "_buttonTitleTextHeight");
  v6 = v5 * 3.0 + 20.0 + 20.0;
  -[HUSplitAccountHeaderTableView _maxTitleAndDescriptionCellHeightForWidth:](self, "_maxTitleAndDescriptionCellHeightForWidth:", a3);
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  v6 = a4;
  v7 = a3;
  if (!objc_msgSend(v6, "row"))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v23, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _HULocalizedStringWithDefaultValue(CFSTR("HUSplitAccount_Title"), CFSTR("HUSplitAccount_Title"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleText:", v24);

    objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB568], 32770);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleFont:", v25);

    objc_msgSend(v10, "setMaxNumberOfTitleLines:", 0);
    -[HUSplitAccountHeaderTableView mediaAccount](self, "mediaAccount");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "username");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUSplitAccount_Description"), CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setDescriptionText:", v20);
    objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB558], 0x8000);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDescriptionFont:", v34);

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
    -[HUSplitAccountHeaderTableView mediaAccount](self, "mediaAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "username");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUSplitAccount_UseMediaAccount_Button_Title"), CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v20);

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
    -[HUSplitAccountHeaderTableView splitAccountDelegate](self, "splitAccountDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSplitAccountHeaderTableView mediaAccount](self, "mediaAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSplitAccountHeaderTableView home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAMSiTunesAccount:forHome:", v8, v9);

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

- (HUMediaAccountDelegate)splitAccountDelegate
{
  return (HUMediaAccountDelegate *)objc_loadWeakRetained((id *)&self->_splitAccountDelegate);
}

- (void)setSplitAccountDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_splitAccountDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_splitAccountDelegate);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_mediaAccount, 0);
}

@end
