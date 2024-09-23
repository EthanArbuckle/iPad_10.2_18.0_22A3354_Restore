@implementation MCUISpecifierCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MCUISpecifierCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v12, sel_refreshCellContentsWithSpecifier_, v4);
  -[MCUISpecifierCell textLabel](self, "textLabel", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E0D80978]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  -[MCUISpecifierCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E0D80950]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  objc_msgSend(v4, "propertyForKey:", CFSTR("MCUIPSExpiredKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCUISpecifierCell textLabel](self, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v10);

  }
}

- (id)_scriptingInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCUISpecifierCell;
  -[MCUISpecifierCell _scriptingInfo](&v9, sel__scriptingInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUISpecifierCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCUISpecifierCell textLabel](self, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("ID"));

  }
  return v3;
}

@end
