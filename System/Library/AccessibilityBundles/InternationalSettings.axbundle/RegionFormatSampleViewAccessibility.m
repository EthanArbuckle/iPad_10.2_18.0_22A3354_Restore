@implementation RegionFormatSampleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RegionFormatSampleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setTextForRegionExample:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)RegionFormatSampleViewAccessibility;
  -[RegionFormatSampleViewAccessibility setTextForRegionExample:](&v20, sel_setTextForRegionExample_, a3);
  -[RegionFormatSampleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityLabels"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDFEA60];
  objc_msgSend(v5, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axAttributedStringWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttribute:forKey:", v9, *MEMORY[0x24BDFEB00]);

  objc_msgSend(v5, "setAccessibilityLabel:", v8);
  objc_msgSend(v4, "objectAtIndex:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDFEA60];
  objc_msgSend(v10, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "axAttributedStringWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAttribute:forKey:", v14, *MEMORY[0x24BDFEB10]);

  objc_msgSend(v10, "setAccessibilityLabel:", v13);
  objc_msgSend(v4, "objectAtIndex:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDFEA60];
  objc_msgSend(v15, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "axAttributedStringWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAttribute:forKey:", v19, *MEMORY[0x24BDFEC08]);

  objc_msgSend(v15, "setAccessibilityLabel:", v18);
}

@end
