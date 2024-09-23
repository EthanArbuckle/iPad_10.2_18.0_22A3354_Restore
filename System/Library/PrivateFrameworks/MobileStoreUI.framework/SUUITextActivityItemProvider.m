@implementation SUUITextActivityItemProvider

+ (id)placeholderItem
{
  return &stru_2511FF0C8;
}

- (id)item
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[UIActivityItemProvider activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7480]);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[SUUIDeferredActivityItemProvider productPageItem](self, "productPageItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIDeferredActivityItemProvider productPageItem](self, "productPageItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "artistName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length") && objc_msgSend(v9, "length"))
    {
      -[SUUIDeferredActivityItemProvider clientContext](self, "clientContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        objc_msgSend(v10, "localizedStringForKey:", CFSTR("SHARE_SHEET_ITEM_TITLE_FORMAT"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SHARE_SHEET_ITEM_TITLE_FORMAT"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@%@"), 0, v7, v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

@end
