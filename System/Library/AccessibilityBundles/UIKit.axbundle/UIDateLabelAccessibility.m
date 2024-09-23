@implementation UIDateLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDateLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  double v2;
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  id v9;
  id v10;
  id v11;
  double v12;
  id v13;
  double v14;
  id v15;
  char v16;
  id v17;
  char v18;
  id v19;
  double v20;
  id v21;
  double v22;
  double v23;
  id v24;
  id v25;
  id v26;
  id location;
  id v28;
  id v29;
  double v30;
  char v31;
  char v32;
  SEL v33;
  UIDateLabelAccessibility *v34;

  v34 = self;
  v33 = a2;
  v15 = (id)-[UIDateLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("use24HourTime"));
  v16 = objc_msgSend(v15, "BOOLValue");

  v32 = v16 & 1;
  v17 = (id)-[UIDateLabelAccessibility safeValueForKey:](v34, "safeValueForKey:", CFSTR("timeDesignatorAppearsBeforeTime"));
  v18 = objc_msgSend(v17, "BOOLValue");

  v31 = v18 & 1;
  v19 = (id)-[UIDateLabelAccessibility safeValueForKey:](v34, "safeValueForKey:", CFSTR("timeInterval"));
  objc_msgSend(v19, "doubleValue");
  v20 = v2;

  v30 = v20;
  v29 = (id)-[UIDateLabelAccessibility safeStringForKey:](v34, "safeStringForKey:", CFSTR("text"));
  v28 = (id)-[UIDateLabelAccessibility safeStringForKey:](v34, "safeStringForKey:", CFSTR("timeDesignator"));
  location = 0;
  if ((v16 & 1) != 0 || !v28)
  {
    objc_storeStrong(&location, v29);
  }
  else if (v29)
  {
    if ((v31 & 1) != 0)
      v3 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v28, v29);
    else
      v3 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v29, v28);
    v4 = location;
    location = v3;

  }
  else
  {
    objc_storeStrong(&location, v28);
  }
  v26 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v25 = (id)objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v10 = (id)objc_msgSend(v25, "timeZone");
  v24 = (id)objc_msgSend(v25, "componentsInTimeZone:fromDate:");

  objc_msgSend(v24, "setHour:");
  objc_msgSend(v24, "setMinute:", 0);
  objc_msgSend(v24, "setSecond:", 0);
  v11 = (id)objc_msgSend(v24, "date");
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v12 = v5;

  v23 = v12;
  objc_msgSend(v24, "setDay:", objc_msgSend(v24, "day") + 1);
  v13 = (id)objc_msgSend(v24, "date");
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v14 = v6;

  v22 = v14;
  v21 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", location);
  v7 = v30;
  if (v30 < v12 || (v7 = v30, v30 >= v22))
    objc_msgSend(v21, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB10], v7);
  else
    objc_msgSend(v21, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB00], v30);
  v9 = v21;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  return v9;
}

@end
