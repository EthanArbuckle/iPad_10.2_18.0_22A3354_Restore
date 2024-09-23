@implementation TKTableViewCellSubtitle

- (TKTableViewCellSubtitle)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TKTableViewCellSubtitle *v4;
  TKTableViewCellSubtitle *v6;
  objc_super v7;
  id location[3];
  TKTableViewCellSubtitle *v9;

  v9 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v4 = v9;
  v9 = 0;
  v7.receiver = v4;
  v7.super_class = (Class)TKTableViewCellSubtitle;
  v9 = -[TKTableViewCellSubtitle initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, 3, location[0]);
  objc_storeStrong((id *)&v9, v9);
  v6 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v6;
}

@end
