@implementation UIAccessibilityElement

- (BOOL)representsSubview
{
  id v1;
  id location;
  id v4;
  BOOL v5;

  v4 = a1;
  if (a1)
  {
    location = (id)objc_msgSend(v4, "_accessibilityValueForKey:", CFSTR("TableViewStorage"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1 = (id)objc_msgSend(location, "objectForKey:", CFSTR("class"));
      v5 = v1 != 0;

    }
    else
    {
      v5 = 0;
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    return 0;
  }
  return v5;
}

- (BOOL)elementMatchesSubview:(void *)a1
{
  CGSize v2;
  double v3;
  double v4;
  NSString *v6;
  BOOL v7;
  id v8;
  int v9;
  id location;
  id v11;
  BOOL v12;

  v11 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v11)
  {
    v8 = (id)objc_msgSend(v11, "_accessibilityValueForKey:", CFSTR("TableViewStorage"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((id)objc_msgSend(v8, "objectForKey:", CFSTR("class")))
      {
        v6 = (NSString *)(id)objc_msgSend(v8, "objectForKey:", CFSTR("size"));
        v2 = CGSizeFromString(v6);

        v7 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(location, "frame");
          v7 = __CGSizeEqualToSize_1(v2.width, v2.height, v3, v4);
        }
        v12 = v7;
        v9 = 1;
      }
      else
      {
        v12 = 0;
        v9 = 1;
      }
    }
    else
    {
      v12 = 0;
      v9 = 1;
    }
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v12 = 0;
    v9 = 1;
  }
  objc_storeStrong(&location, 0);
  return v12;
}

@end
