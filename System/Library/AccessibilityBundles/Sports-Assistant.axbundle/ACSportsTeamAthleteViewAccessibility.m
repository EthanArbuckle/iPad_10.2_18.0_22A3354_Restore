@implementation ACSportsTeamAthleteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSportsTeamAthleteView");
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  uint64_t v33;
  void *v34;

  -[ACSportsTeamAthleteViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("entity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSportsTeamAthleteViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_numberLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("athlete.number"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[ACSportsTeamAthleteViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nameLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("position"));
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("injured"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  -[ACSportsTeamAthleteViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_heightLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("-"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v3;
  v16 = (void *)v10;
  v17 = (void *)v8;
  if (objc_msgSend(v15, "count") == 2)
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("athlete.height.imperial"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  v23 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("athlete.weight.imperial"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSportsTeamAthleteViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_weightLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "accessibilityLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v12 & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("athlete.injured"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v33;
    v29 = v17;
    __UIAXStringForVariables();
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = (void *)v33;
    v29 = v17;
    __UIAXStringForVariables();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v30;
}

@end
