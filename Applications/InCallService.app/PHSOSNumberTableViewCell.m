@implementation PHSOSNumberTableViewCell

- (PHSOSNumberTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PHSOSNumberTableViewCell *v4;
  PHSOSNumberTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHSOSNumberTableViewCell;
  v4 = -[PHSOSNumberTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", 3, a4);
  v5 = v4;
  if (v4)
    -[PHSOSNumberTableViewCell commonInit](v4, "commonInit");
  return v5;
}

- (void)commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PHSOSNumberTableViewCell setSeparatorInset:](self, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.1));
  -[PHSOSNumberTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumberTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumberTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v7, "setTextColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumberTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v9, "setFont:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumberTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v11, "setFont:", v10);

  -[PHSOSNumberTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  -[PHSOSNumberTableViewCell setAccessoryType:](self, "setAccessoryType:", 1);
}

- (void)populate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sosTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumberTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v6, "setText:", v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sosSubtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumberTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v7, "setText:", v8);

}

@end
