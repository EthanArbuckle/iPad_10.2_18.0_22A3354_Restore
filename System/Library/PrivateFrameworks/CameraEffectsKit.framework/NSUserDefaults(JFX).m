@implementation NSUserDefaults(JFX)

- (uint64_t)jfxBoolForKey:()JFX defaultValue:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

@end
