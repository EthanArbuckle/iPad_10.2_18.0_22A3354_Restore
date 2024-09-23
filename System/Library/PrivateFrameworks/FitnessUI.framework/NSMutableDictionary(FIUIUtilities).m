@implementation NSMutableDictionary(FIUIUtilities)

- (void)fiui_incrementValueForKey:()FIUIUtilities byValue:
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    a2 = v8 + a2;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v9, v6);

}

@end
