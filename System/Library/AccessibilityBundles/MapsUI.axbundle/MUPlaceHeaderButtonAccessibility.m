@implementation MUPlaceHeaderButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUPlaceHeaderButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("MUPlaceHeaderButton"), CFSTR("UIButton"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  char v19;

  v19 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

      goto LABEL_4;
    }
    objc_msgSend(v5, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
LABEL_4:
      objc_msgSend(v5, "image");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v8, "containsString:", CFSTR("menu")))
      {
        if ((objc_msgSend(v8, "containsString:", CFSTR("car")) & 1) != 0)
        {
          v9 = CFSTR("travel.time.driving");
        }
        else if ((objc_msgSend(v8, "containsString:", CFSTR("walk")) & 1) != 0)
        {
          v9 = CFSTR("travel.time.walking");
        }
        else if ((objc_msgSend(v8, "containsString:", CFSTR("tram")) & 1) != 0)
        {
          v9 = CFSTR("travel.time.transit");
        }
        else if ((objc_msgSend(v8, "containsString:", CFSTR("bicycle")) & 1) != 0)
        {
          v9 = CFSTR("travel.time.bike");
        }
        else
        {
          if (objc_msgSend(v8, "containsString:", CFSTR("ellipsis")))
          {
            accessibilityLocalizedString(CFSTR("MORE"));
            v13 = objc_claimAutoreleasedReturnValue();
LABEL_22:
            v12 = (void *)v13;
LABEL_24:

            goto LABEL_25;
          }
          v9 = &stru_25026A470;
        }
        if (!-[__CFString isEqualToString:](v9, "isEqualToString:", &stru_25026A470))
        {
          v14 = (void *)MEMORY[0x24BDD17C8];
          accessibilityLocalizedString(v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "title");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedStringWithFormat:", v15, v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_24;
        }
      }
      objc_msgSend(v5, "title");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    objc_msgSend(v5, "title");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)MUPlaceHeaderButtonAccessibility;
    -[MUPlaceHeaderButtonAccessibility accessibilityLabel](&v18, sel_accessibilityLabel);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;
LABEL_25:

  return v12;
}

@end
