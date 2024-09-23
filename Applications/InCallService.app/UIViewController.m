@implementation UIViewController

- (BOOL)isChildOf:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v6 = v5;
  if (v5)
  {
    if (v5 == v4)
      v7 = 1;
    else
      v7 = objc_msgSend(v5, "isChildOf:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
