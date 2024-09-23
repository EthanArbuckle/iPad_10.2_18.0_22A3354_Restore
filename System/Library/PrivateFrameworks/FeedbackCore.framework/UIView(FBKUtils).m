@implementation UIView(FBKUtils)

- (id)superviewWithClass:()FBKUtils
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "superview");
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)v1;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v2, "superview");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v3;
      if (!v3)
      {
        v4 = 0;
        goto LABEL_8;
      }
    }
    v4 = v2;
    v3 = v4;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
LABEL_8:

  return v4;
}

@end
