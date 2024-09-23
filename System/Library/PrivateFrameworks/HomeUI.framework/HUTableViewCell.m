@implementation HUTableViewCell

- (HUTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUTableViewCell *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUTableViewCell;
  result = -[HUTableViewCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (result)
  {
    result->_titleColorFollowsTintColor = 0;
    result->_valueColorFollowsTintColor = 0;
  }
  return result;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUTableViewCell;
  -[HUTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUTableViewCell setItem:](self, "setItem:", 0);
  -[HUTableViewCell setDisabled:](self, "setDisabled:", 0);
  -[HUTableViewCell setTitleColorFollowsTintColor:](self, "setTitleColorFollowsTintColor:", 0);
  -[HUTableViewCell setValueColorFollowsTintColor:](self, "setValueColorFollowsTintColor:", 0);
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  -[HUTableViewCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTableViewCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  v8 = *MEMORY[0x1E0D30BF8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v21[0] = *MEMORY[0x1E0CEA098];
    -[HUTableViewCell detailTextLabel](self, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    v21[1] = *MEMORY[0x1E0CEA0A0];
    -[HUTableViewCell detailTextLabel](self, "detailTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "prefersDynamicString"))
    {
      -[HUTableViewCell detailTextLabel](self, "detailTextLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bounds");
      objc_msgSend(v15, "dynamicStringForSize:attributes:", v14, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTableViewCell detailTextLabel](self, "detailTextLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAttributedText:", v19);

    }
    else
    {
      objc_msgSend(v15, "stringWithAttributes:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTableViewCell detailTextLabel](self, "detailTextLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAttributedText:", v16);
    }

  }
  -[HUTableViewCell _updateTitle](self, "_updateTitle");
  -[HUTableViewCell _updateDetailTextLabel](self, "_updateDetailTextLabel");

}

- (void)setTitleColorFollowsTintColor:(BOOL)a3
{
  if (self->_titleColorFollowsTintColor != a3)
  {
    self->_titleColorFollowsTintColor = a3;
    -[HUTableViewCell _updateTitle](self, "_updateTitle");
  }
}

- (void)setValueColorFollowsTintColor:(BOOL)a3
{
  if (self->_valueColorFollowsTintColor != a3)
  {
    self->_valueColorFollowsTintColor = a3;
    -[HUTableViewCell _updateDetailTextLabel](self, "_updateDetailTextLabel");
  }
}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__HUTableViewCell__updateTitle__block_invoke;
  v5[3] = &unk_1E6F57358;
  v5[4] = self;
  __31__HUTableViewCell__updateTitle__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTableViewCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

}

id __31__HUTableViewCell__updateTitle__block_invoke(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "titleColorFollowsTintColor"))
      objc_msgSend(*(id *)(a1 + 32), "tintColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_updateDetailTextLabel
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__HUTableViewCell__updateDetailTextLabel__block_invoke;
  v5[3] = &unk_1E6F57358;
  v5[4] = self;
  __41__HUTableViewCell__updateDetailTextLabel__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTableViewCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

}

id __41__HUTableViewCell__updateDetailTextLabel__block_invoke(uint64_t a1)
{
  void *v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDisabled") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "valueColorFollowsTintColor") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "tintColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
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

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)titleColorFollowsTintColor
{
  return self->_titleColorFollowsTintColor;
}

- (BOOL)valueColorFollowsTintColor
{
  return self->_valueColorFollowsTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
