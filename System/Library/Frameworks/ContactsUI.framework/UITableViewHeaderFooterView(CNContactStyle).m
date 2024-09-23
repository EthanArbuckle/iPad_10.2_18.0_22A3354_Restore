@implementation UITableViewHeaderFooterView(CNContactStyle)

- (void)_cnui_applyContactStyle
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a1, "_cnui_contactStyle");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionHeaderTextColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v12, "sectionHeaderTextColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "textLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v3);

  }
  v5 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
  objc_msgSend(a1, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", v5);

  objc_msgSend(v12, "sectionBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v12, "sectionBackgroundColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v12, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_9;
    objc_msgSend(v12, "backgroundColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;
  if (v8)
  {
    objc_msgSend(a1, "backgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v10);

  }
LABEL_9:

}

@end
