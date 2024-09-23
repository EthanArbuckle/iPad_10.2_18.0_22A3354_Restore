@implementation UIColor(FocusUIAdditions)

+ (id)fcui_colorForActivity:()FocusUIAdditions
{
  NSString *v3;
  SEL v4;
  void *v5;

  objc_msgSend(a3, "activityColorName");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = NSSelectorFromString(v3);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (void *)objc_msgSend(MEMORY[0x24BEBD4B8], "performSelector:", v4);
  else
    v5 = 0;
  return v5;
}

@end
