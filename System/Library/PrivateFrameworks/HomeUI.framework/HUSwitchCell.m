@implementation HUSwitchCell

- (HUSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUSwitchCell *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUSwitchCell;
  v4 = -[HUSwitchCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CEAA38]);
    -[HUSwitchCell setAccessoryView:](v4, "setAccessoryView:", v5);

    -[HUSwitchCell _switch](v4, "_switch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", v4, sel__toggleOn_, 4096);

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUSwitchCell;
  -[HUSwitchCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUSwitchCell setDisabled:](self, "setDisabled:", 0);
  -[HUSwitchCell setSelectionStyle:](self, "setSelectionStyle:", 0);
}

- (BOOL)isOn
{
  void *v2;
  char v3;

  -[HUSwitchCell _switch](self, "_switch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOn");

  return v3;
}

- (void)setOn:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[HUSwitchCell isOn](self, "isOn") != a3)
  {
    -[HUSwitchCell _switch](self, "_switch");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOn:", v3);

  }
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  if (-[HUSwitchCell isOn](self, "isOn") != a3)
  {
    -[HUSwitchCell _switch](self, "_switch");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOn:animated:", v5, v4);

  }
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[HUSwitchCell updateUIWithAnimation:](self, "updateUIWithAnimation:", 0);
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
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
  uint64_t v18;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;

  v3 = a3;
  -[HUSwitchCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSwitchCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  if (-[HUSwitchCell isDisabled](self, "isDisabled"))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSwitchCell textLabel](self, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  -[HUSwitchCell textLabel](self, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 0);

  if (-[HUSwitchCell isDisabled](self, "isDisabled"))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSwitchCell setTextColor:](self, "setTextColor:", v12);

  -[HUSwitchCell item](self, "item");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "latestResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSwitchCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v15);

  -[HUSwitchCell item](self, "item");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "latestResults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0D30BF8];
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[HUSwitchCell item](self, "item");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "latestResults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSwitchCell detailTextLabel](self, "detailTextLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setText:", v22);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSwitchCell detailTextLabel](self, "detailTextLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTextColor:", v24);

    -[HUSwitchCell detailTextLabel](self, "detailTextLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNumberOfLines:", 0);
  }
  else
  {
    -[HUSwitchCell detailTextLabel](self, "detailTextLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", 0);
  }

  -[HUSwitchCell item](self, "item");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "latestResults");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
  v35 = (id)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v29 = objc_msgSend(v35, "integerValue");
    if (v29 == 2)
    {
      v30 = 1;
      goto LABEL_15;
    }
    if (v29 == 1)
    {
      v30 = 0;
LABEL_15:
      -[HUSwitchCell setOn:animated:](self, "setOn:animated:", v30, v3);
    }
  }
  v31 = -[HUSwitchCell isDisabled](self, "isDisabled") ^ 1;
  -[HUSwitchCell _switch](self, "_switch");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setUserInteractionEnabled:", v31);

  v33 = -[HUSwitchCell isDisabled](self, "isDisabled") ^ 1;
  -[HUSwitchCell _switch](self, "_switch");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setEnabled:", v33);

  -[HUSwitchCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", -[HUSwitchCell isDisabled](self, "isDisabled") ^ 1);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSwitchCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("text"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)_toggleOn:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  int v8;
  HUSwitchCell *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[HUSwitchCell isOn](self, "isOn");
    v6 = CFSTR("off");
    if (v5)
      v6 = CFSTR("on");
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "User tapped switch cell: %@ to turn %@", (uint8_t *)&v8, 0x16u);
  }

  -[HUSwitchCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "switchCell:didTurnOn:", self, -[HUSwitchCell isOn](self, "isOn"));

}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (HUSwitchCellDelegate)delegate
{
  return (HUSwitchCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
