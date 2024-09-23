@implementation CKExpireDurationSelectionList

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  objc_super v14;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)MEMORY[0x24BDBCEB8];
    v14.receiver = self;
    v14.super_class = (Class)CKExpireDurationSelectionList;
    -[PSListItemsController specifiers](&v14, sel_specifiers);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKSettingsMessagesController currentKeepMessages](CKSettingsMessagesController, "currentKeepMessages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "integerValue") == 30)
    {
      v9 = 3;
      v10 = 4;
    }
    else
    {
      if (objc_msgSend(v8, "integerValue") == 365)
        v10 = 4;
      else
        v10 = 3;
      v9 = 2;
    }
    objc_msgSend(v7, "removeObjectAtIndex:", v10);
    objc_msgSend(v7, "removeObjectAtIndex:", v9);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
    v11 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v12 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v11;

    -[CKExpireDurationSelectionList _updateFooterText](self, "_updateFooterText");
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_groupSpecifier
{
  return (id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", 0);
}

- (void)listItemSelected:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKExpireDurationSelectionList;
  -[PSListItemsController listItemSelected:](&v4, sel_listItemSelected_, a3);
  -[CKExpireDurationSelectionList _updateFooterText](self, "_updateFooterText");
}

- (void)_updateFooterText
{
  void *v3;
  id v4;

  -[CKExpireDurationSelectionList expireDescription](self, "expireDescription");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKExpireDurationSelectionList _groupSpecifier](self, "_groupSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v4, *MEMORY[0x24BE75A68]);
  -[CKExpireDurationSelectionList reloadSpecifier:](self, "reloadSpecifier:", v3);

}

- (id)expireDescription
{
  return &stru_24D077260;
}

@end
