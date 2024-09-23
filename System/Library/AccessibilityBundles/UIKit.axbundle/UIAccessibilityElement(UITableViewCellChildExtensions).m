@implementation UIAccessibilityElement(UITableViewCellChildExtensions)

- (void)setTableCellYOffset:()UITableViewCellChildExtensions
{
  double v3;
  id v4;
  id v5;
  id v6;
  float v7;
  uint64_t v8;
  id v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = (id)objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("TableViewStorage"));
  if (!v6)
  {
    v6 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), "init");

    objc_msgSend(v9, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("TableViewStorage"));
  }
  *(float *)&v3 = v7;
  v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3, v6);
  objc_msgSend(v4, "setObject:forKey:");

  objc_storeStrong(&v6, 0);
}

@end
