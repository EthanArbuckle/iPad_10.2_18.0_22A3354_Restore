@implementation EKCalendar(CUIKColorUtils)

+ (id)displayColorForSymbolicName:()CUIKColorUtils
{
  return CUIKSymbolicColorWithName(a3);
}

- (id)platformColor
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "CGColor");
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (id)displayColor
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sourceType");

  if (v3 == 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "symbolicColorName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "platformColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DDBBD0]) & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "displayColorForSymbolicName:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }

  }
  return v4;
}

@end
