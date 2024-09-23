@implementation UITableViewCell(MTUIStyling)

- (void)setSelectedBackgroundColor:()MTUIStyling
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
    v4 = (void *)objc_opt_new();
  else
    v4 = 0;
  objc_msgSend(v4, "setBackgroundColor:", v5);
  objc_msgSend(a1, "setSelectedBackgroundView:", v4);

}

@end
