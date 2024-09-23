@implementation _MKTableViewController

- (double)defaultLeadingSeparatorInset
{
  int IsRightToLeft;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  -[_MKTableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMargins");
  v6 = v5;
  v8 = v7;

  if (IsRightToLeft)
    return v8;
  else
    return v6;
}

- (double)defaultTrailingSeparatorInset
{
  int IsRightToLeft;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  -[_MKTableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMargins");
  v6 = v5;
  v8 = v7;

  if (IsRightToLeft)
    return v6;
  else
    return v8;
}

- (id)separatorColor
{
  void *v2;
  void *v3;

  -[UIViewController mk_theme](self, "mk_theme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "separatorLineColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_viewHostsLayoutEngineAllowsTAMIC_NO
{
  return 1;
}

@end
