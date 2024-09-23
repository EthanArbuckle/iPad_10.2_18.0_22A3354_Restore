@implementation HKDisplayType(WDDataProviders)

- (id)wd_listViewControllerDataProviderWithProfile:()WDDataProviders unitController:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "presentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wd_listViewControllerDataProviderWithProfile:unitController:isHierarchical:", v7, v6, objc_msgSend(v8, "showAllDataHierarchically"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)wd_listViewControllerDataProviderWithProfile:()WDDataProviders unitController:isHierarchical:
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a1;
  v5 = a3;
  v6 = objc_msgSend(v4, "displayTypeIdentifier");
  if (v6 > 188)
  {
    if (v6 > 248)
    {
      if (v6 > 286)
      {
        if (v6 > 297)
        {
          if (v6 == 298 || v6 == 304)
            goto LABEL_62;
        }
        else if (v6 == 287 || v6 == 288)
        {
          goto LABEL_62;
        }
      }
      else if (v6 > 274)
      {
        if (v6 == 275 || v6 == 284)
          goto LABEL_62;
      }
      else if (v6 == 249 || v6 == 256)
      {
        goto LABEL_62;
      }
    }
    else
    {
      if (v6 <= 235)
      {
        switch(v6)
        {
          case 189:
          case 191:
          case 192:
          case 193:
          case 198:
          case 199:
            goto LABEL_62;
          default:
            goto LABEL_61;
        }
        goto LABEL_62;
      }
      if (v6 == 236 || v6 == 237 || v6 == 248)
      {
LABEL_62:
        objc_opt_class();
        v7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_63;
      }
    }
LABEL_61:
    objc_msgSend(v4, "sampleType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_opt_isKindOfClass();

    goto LABEL_62;
  }
  if (v6 > 118)
  {
    if (v6 > 138)
    {
      switch(v6)
      {
        case 139:
          goto LABEL_58;
        case 140:
        case 144:
        case 145:
        case 147:
          goto LABEL_62;
        case 141:
        case 142:
        case 143:
        case 146:
          goto LABEL_61;
        default:
          if (v6 == 156 || v6 == 178)
            goto LABEL_62;
          goto LABEL_61;
      }
    }
    if (v6 == 119 || v6 == 125)
      goto LABEL_62;
    goto LABEL_61;
  }
  if (v6 > 79)
  {
    if (v6 <= 98)
    {
      if (v6 == 80 || v6 == 97)
        goto LABEL_62;
    }
    else if (v6 == 99 || v6 == 102 || v6 == 107)
    {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
  if (v6 > 69)
  {
    if (v6 != 70)
    {
      if (v6 == 79)
        goto LABEL_62;
      goto LABEL_61;
    }
LABEL_58:
    v7 = (id)objc_opt_class();
  }
  else
  {
    if (v6 != 14)
    {
      if (v6 == 63)
        goto LABEL_62;
      goto LABEL_61;
    }
    +[HBXHealthAppPluginFactory makeDataListDataProviderClassFromPluginName:displayType:](HBXHealthAppPluginFactory, "makeDataListDataProviderClassFromPluginName:displayType:", CFSTR("RespiratoryHealthAppPlugin.healthplugin"), v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_63:
  v9 = v7;

  v10 = (void *)objc_msgSend(objc_alloc((Class)v9), "initWithDisplayType:profile:", v4, v5);
  return v10;
}

- (WDDataListViewController)wd_dataListViewControllerWithProfile:()WDDataProviders unitController:
{
  id v6;
  void *v7;
  WDDataListViewController *v8;

  v6 = a3;
  objc_msgSend(a1, "wd_listViewControllerDataProviderWithProfile:unitController:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WDDataListViewController initWithDisplayType:profile:dataProvider:usingInsetStyling:]([WDDataListViewController alloc], "initWithDisplayType:profile:dataProvider:usingInsetStyling:", a1, v6, v7, 1);

  return v8;
}

@end
