@implementation HUHomeHubSimpleTableViewController

- (HUHomeHubSimpleTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4 descriptionStringWithFormatKey:(id)a5
{
  HUHomeHubSimpleTableViewController *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUHomeHubSimpleTableViewController;
  result = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v7, sel_initWithItemManager_tableViewStyle_, a3, a4);
  if (result)
    result->_descriptionStringWithFormatKey = (NSString *)a5;
  return result;
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUHomeHubSimpleTableViewController;
  -[HUHomeHubSimpleTableViewController loadView](&v4, sel_loadView);
  -[HUHomeHubSimpleTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsSelection:", 0);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a4;
  v7 = (void *)MEMORY[0x1E0CEA718];
  v8 = a3;
  objc_msgSend(v7, "cellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v11);

  objc_msgSend(v9, "textProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlignment:", 4);

  objc_msgSend(v30, "latestResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C08]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomeHubSimpleTableViewController descriptionStringWithFormatKey](self, "descriptionStringWithFormatKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[HUHomeHubSimpleTableViewController descriptionStringWithFormatKey](self, "descriptionStringWithFormatKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(v16, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HULocalizedStringWithDefaultValue(v14, v14, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (objc_msgSend(v14, "length"))
    v24 = v23;
  else
    v24 = 0;
  objc_msgSend(v9, "setSecondaryText:", v24);
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "secondaryTextProperties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setColor:", v25);

  objc_msgSend(v30, "latestResults");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C70]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v28);

  objc_msgSend(v8, "setContentConfiguration:", v9);
  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v29);

}

- (NSString)descriptionStringWithFormatKey
{
  return self->_descriptionStringWithFormatKey;
}

- (void)setDescriptionStringWithFormatKey:(id)a3
{
  self->_descriptionStringWithFormatKey = (NSString *)a3;
}

@end
