@implementation MTUIChevronTableViewCell

- (MTUIChevronTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTUIChevronTableViewCell *v4;
  MTUIChevronTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTUIChevronTableViewCell;
  v4 = -[MTUIBaseTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[MTUIChevronTableViewCell setAccessoryType:](v4, "setAccessoryType:", 1);
  return v5;
}

@end
