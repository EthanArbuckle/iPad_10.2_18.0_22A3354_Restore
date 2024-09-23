@implementation HUDownloadControlCell

- (HUDownloadControlCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUDownloadControlCell *v4;
  HUDownloadControl *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUDownloadControlCell;
  v4 = -[HUDownloadControlCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    v5 = objc_alloc_init(HUDownloadControl);
    -[HUDownloadControlCell setDownloadControl:](v4, "setDownloadControl:", v5);

    -[HUDownloadControlCell downloadControl](v4, "downloadControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setControlStatus:animated:", 1, 0x3FF0000000000000, 0);

    -[HUDownloadControlCell downloadControl](v4, "downloadControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDownloadControlCell setAccessoryView:](v4, "setAccessoryView:", v7);

  }
  return v4;
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
  uint64_t v11;
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
  int v24;
  void *v25;
  void *v26;
  float v27;
  double v28;
  uint64_t v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;

  v3 = a3;
  -[HUDownloadControlCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v38 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDownloadControlCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDownloadControlCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  -[HUDownloadControlCell textLabel](self, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 0);

  v11 = *MEMORY[0x1E0D30BF8];
  objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDownloadControlCell detailTextLabel](self, "detailTextLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDownloadControlCell detailTextLabel](self, "detailTextLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v15);

    -[HUDownloadControlCell detailTextLabel](self, "detailTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNumberOfLines:", 0);
  }
  else
  {
    -[HUDownloadControlCell detailTextLabel](self, "detailTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", 0);
  }

  -[HUDownloadControlCell downloadControl](self, "downloadControl");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "titleForControlStatusType:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BC0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", v20) & 1) == 0)
  {
    -[HUDownloadControlCell downloadControl](self, "downloadControl");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTitle:forControlStatusType:", v20, 1);

    -[HUDownloadControlCell downloadControl](self, "downloadControl");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sizeToFit");

  }
  objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA8]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  if (v24)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EC0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "floatValue");
      v28 = v27;
      v29 = 4;
    }
    else
    {
      v28 = 1.0;
      v29 = 3;
    }

  }
  else
  {
    v28 = 1.0;
    v29 = 1;
  }
  -[HUDownloadControlCell downloadControl](self, "downloadControl");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setControlStatus:animated:", v29, *(_QWORD *)&v28, v3);

  v31 = v29 == 1;
  -[HUDownloadControlCell downloadControl](self, "downloadControl");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setEnabled:", v31);

  objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = objc_msgSend(v33, "BOOLValue");

  if ((_DWORD)v32)
  {
    -[HUDownloadControlCell downloadControl](self, "downloadControl");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setEnabled:", 0);

  }
  objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BD0]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "BOOLValue");
  -[HUDownloadControlCell downloadControl](self, "downloadControl");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setHidden:", v36);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUDownloadControlCell;
  -[HUDownloadControlCell layoutSubviews](&v14, sel_layoutSubviews);
  -[HUDownloadControlCell downloadControl](self, "downloadControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[HUDownloadControlCell downloadControl](self, "downloadControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intrinsicContentSize");
  v12 = v11;

  -[HUDownloadControlCell downloadControl](self, "downloadControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v12, v9);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDownloadControlCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("text"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (HUDownloadControl)downloadControl
{
  return self->_downloadControl;
}

- (void)setDownloadControl:(id)a3
{
  objc_storeStrong((id *)&self->_downloadControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadControl, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
