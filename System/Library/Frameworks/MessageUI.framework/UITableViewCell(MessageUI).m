@implementation UITableViewCell(MessageUI)

- (void)mf_updateContentConfigurationWithBlock:()MessageUI
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = a3;
  objc_msgSend(a1, "contentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "defaultContentConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9[2](v9, v8);
  objc_msgSend(a1, "setContentConfiguration:", v8);

}

- (void)_mf_setBackgroundConfigurationColor:()MessageUI
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  objc_msgSend(a1, "backgroundConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v11);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v8, "setBackgroundColor:", v11);
    objc_msgSend(a1, "setBackgroundConfiguration:", v8);
  }

}

- (void)mf_updateBackgroundColorForPopover:()MessageUI
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  if ((a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailPopoverBackgroundCellColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = v5;
  }
  v7 = (id)v4;
  objc_msgSend(a1, "_mf_setBackgroundConfigurationColor:", v4);

}

@end
