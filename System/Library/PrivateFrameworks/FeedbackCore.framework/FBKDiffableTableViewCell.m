@implementation FBKDiffableTableViewCell

- (void)configureForTeam:(id)a3 disclosesMoreTeams:(BOOL)a4
{
  _BOOL4 v4;
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
  _BOOL8 v18;
  uint64_t v19;
  void *v20;
  id v21;

  v4 = a4;
  v21 = a3;
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDiffableTableViewCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDiffableTableViewCell detailTextLabel](self, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  if (v21)
  {
    objc_msgSend(v21, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDiffableTableViewCell textLabel](self, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    objc_msgSend(v21, "typeString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDiffableTableViewCell detailTextLabel](self, "detailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("LOADING_ELLIPSES"), &stru_24E15EAF8, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDiffableTableViewCell textLabel](self, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

    -[FBKDiffableTableViewCell detailTextLabel](self, "detailTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", 0);

    -[FBKDiffableTableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
  }
  v18 = v4;
  if (v4)
    v19 = 3;
  else
    v19 = 0;
  -[FBKDiffableTableViewCell setAccessoryType:](self, "setAccessoryType:", v18);
  -[FBKDiffableTableViewCell setSelectionStyle:](self, "setSelectionStyle:", v19);
  -[FBKDiffableTableViewCell textLabel](self, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@"), v20);

}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->itemIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end
