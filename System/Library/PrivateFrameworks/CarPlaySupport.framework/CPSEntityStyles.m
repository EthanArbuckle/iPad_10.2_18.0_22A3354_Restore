@implementation CPSEntityStyles

+ (id)actionButtonFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0, a2, a1);
}

+ (id)mapButtonFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77F0], a2, a1);
}

+ (id)pickerTitleFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 14.0, *MEMORY[0x24BDF7868], a2, a1);
}

+ (id)pickerCellPrimaryFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 12.0, *MEMORY[0x24BDF7868], a2, a1);
}

+ (id)pickerCellSecondaryFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 9.0, *MEMORY[0x24BDF7868], a2, a1);
}

+ (id)pickerCellPrimaryFontColor:(BOOL)a3
{
  id v3;
  char v5;
  id v6;
  char v7;
  id v8;
  void *v9;

  v7 = 0;
  v5 = 0;
  if (a3)
  {
    v8 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    v7 = 1;
    v3 = v8;
  }
  else
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v5 = 1;
    v3 = v6;
  }
  v9 = v3;
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  return v9;
}

+ (id)pickerCellSecondaryFontColor:(BOOL)a3
{
  id v3;
  char v5;
  id v6;
  char v7;
  id v8;
  void *v9;

  v7 = 0;
  v5 = 0;
  if (a3)
  {
    v8 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    v7 = 1;
    v3 = v8;
  }
  else
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v5 = 1;
    v3 = v6;
  }
  v9 = v3;
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  return v9;
}

+ (id)pickerInfoPrimaryFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 20.0, a2, a1);
}

+ (id)pickerInfoSecondaryFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 12.0, a2, a1);
}

+ (id)pickerInfoButtonFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 12.0, a2, a1);
}

+ (id)mapButtonBackgroundColor
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&mapButtonBackgroundColor_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_19);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)mapButtonBackgroundColor__mapButtonBackgroundColor;
}

void __43__CPSEntityStyles_mapButtonBackgroundColor__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global_3, a1, a1);
  v2 = (void *)mapButtonBackgroundColor__mapButtonBackgroundColor;
  mapButtonBackgroundColor__mapButtonBackgroundColor = (uint64_t)v1;

}

id __43__CPSEntityStyles_mapButtonBackgroundColor__block_invoke_2(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_msgSend(location[0], "userInterfaceStyle") == 1)
    v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.964705882, 1.0);
  else
    v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)mapButtonDropShadow
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&mapButtonDropShadow_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_4);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)mapButtonDropShadow__mapButtonDropShadow;
}

uint64_t __38__CPSEntityStyles_mapButtonDropShadow__block_invoke()
{
  uint64_t v0;
  void *v1;
  double v2;
  double v3;
  id v5;

  v0 = objc_opt_new();
  v1 = (void *)mapButtonDropShadow__mapButtonDropShadow;
  mapButtonDropShadow__mapButtonDropShadow = v0;

  v5 = (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.200000003);
  objc_msgSend((id)mapButtonDropShadow__mapButtonDropShadow, "setColor:");

  CGSizeMake_17();
  objc_msgSend((id)mapButtonDropShadow__mapButtonDropShadow, "setOffset:", v2, v3);
  objc_msgSend((id)mapButtonDropShadow__mapButtonDropShadow, "setRadius:", 4.0);
  return objc_msgSend((id)mapButtonDropShadow__mapButtonDropShadow, "setOpacity:", 1.0);
}

+ (id)mapAnnotationDropShadow
{
  return (id)objc_msgSend(a1, "mapButtonDropShadow", a2, a1);
}

@end
