@implementation UIColor

void __66__UIColor_CarPlayUIServices__crsui_dashboardWidgetBackgroundColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.270588235, 0.270588235, 0.28627451, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.168627451, 0.176470588, 0.184313725, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.960784314, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDF6950];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__UIColor_CarPlayUIServices__crsui_dashboardWidgetBackgroundColor__block_invoke_2;
  v9[3] = &unk_24C769748;
  v10 = v2;
  v11 = v1;
  v12 = v0;
  v4 = v0;
  v5 = v1;
  v6 = v2;
  objc_msgSend(v3, "colorWithDynamicProvider:", v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)crsui_dashboardWidgetBackgroundColor_dashboardWidgetBackgroundColor;
  crsui_dashboardWidgetBackgroundColor_dashboardWidgetBackgroundColor = v7;

}

id __66__UIColor_CarPlayUIServices__crsui_dashboardWidgetBackgroundColor__block_invoke_2(id *a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if (objc_msgSend(v3, "userInterfaceStyle") == 1)
  {
    v4 = a1 + 4;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "valueForNSIntegerTrait:", v5);

    v4 = a1 + 6;
    if (v6 == 1)
      v4 = a1 + 5;
  }
  v7 = *v4;

  return v7;
}

@end
