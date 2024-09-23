@implementation MTUIBaseTableViewCell

- (MTUIBaseTableViewCell)init
{
  return -[MTUIBaseTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 3, CFSTR("kMTUIBaseTableViewCellIdentifier"));
}

- (MTUIBaseTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTUIBaseTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTUIBaseTableViewCell;
  v4 = -[MTUIBaseTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "mtui_backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUIBaseTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x24BDF6950], "mtui_cellHighlightColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell setSelectedBackgroundColor:](v4, "setSelectedBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "mtui_primaryTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUIBaseTableViewCell textLabel](v4, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    objc_msgSend(MEMORY[0x24BDF6950], "mtui_secondaryColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUIBaseTableViewCell detailTextLabel](v4, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

  }
  return v4;
}

- (double)preferredHeight
{
  return *MEMORY[0x24BDF7DE0];
}

- (void)didMoveToSuperview
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTUIBaseTableViewCell;
  -[MTUIBaseTableViewCell didMoveToSuperview](&v10, sel_didMoveToSuperview);
  v3 = (void *)MEMORY[0x24BDF6A70];
  v4 = *MEMORY[0x24BDF77B0];
  v5 = *MEMORY[0x24BDF7658];
  -[MTUIBaseTableViewCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTUIBaseTableViewCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[MTUIBaseTableViewCell detailTextLabel](self, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v7);

}

@end
