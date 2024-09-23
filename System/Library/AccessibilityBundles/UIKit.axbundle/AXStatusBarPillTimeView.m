@implementation AXStatusBarPillTimeView

BOOL __AXStatusBarPillTimeView_block_invoke(void *a1, void *a2)
{
  BOOL v3;
  char v4;
  id v5;
  id location[2];
  BOOL v7;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("_UIStatusBarTimeItem"));
  v4 = 0;
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("pillTimeView"));
    v4 = 1;
    v3 = v5 != 0;
  }
  v7 = v3;
  if ((v4 & 1) != 0)

  objc_storeStrong(location, 0);
  return v7;
}

@end
