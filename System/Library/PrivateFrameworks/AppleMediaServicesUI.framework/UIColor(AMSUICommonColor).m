@implementation UIColor(AMSUICommonColor)

+ (id)ams_colorFromHexString:()AMSUICommonColor
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  unint64_t v20;
  int v22;
  int v23;
  int v24;
  int v25;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("#")))
  {
    objc_msgSend(v3, "substringFromIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((unint64_t)objc_msgSend(v4, "length") >= 6)
  {
    v25 = 256;
    objc_msgSend(v4, "substringWithRange:", 0, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "scanHexInt:", &v25))
    {
      v5 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v24 = 256;
    objc_msgSend(v4, "substringWithRange:", 2, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v9, "scanHexInt:", &v24))
    {
      v5 = 0;
LABEL_19:

      v7 = v9;
      goto LABEL_20;
    }
    v23 = 256;
    objc_msgSend(v4, "substringWithRange:", 4, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "scanHexInt:", &v23))
    {
      v5 = 0;
LABEL_18:

      v9 = v11;
      goto LABEL_19;
    }
    v22 = 256;
    v12 = objc_msgSend(v4, "length");
    v16 = 1.0;
    if (v12 < 8)
    {
      v18 = v11;
    }
    else
    {
      objc_msgSend(v4, "substringWithRange:", 6, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v18, "scanHexInt:", &v22);
      if (!v19)
      {
        v5 = 0;
        goto LABEL_17;
      }
      LODWORD(v20) = v22;
      v13 = (double)v20;
      HIDWORD(v14) = 1064304640;
      v16 = v13 * 0.00390625;
    }
    LODWORD(v14) = v24;
    LODWORD(v13) = v25;
    LODWORD(v15) = v23;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", (double)*(unint64_t *)&v13 * 0.00390625, (double)v14 * 0.00390625, (double)v15 * 0.00390625, v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
    v11 = v18;
    goto LABEL_18;
  }
  v5 = 0;
LABEL_21:

  return v5;
}

+ (uint64_t)ams_dynamicColorWithLightColor:()AMSUICommonColor darkColor:
{
  return objc_msgSend(a1, "ams_dynamicColorWithLightColor:darkColor:lightHighContrastColor:darkHighContrastColor:", a3, a4, a3, a4);
}

+ (uint64_t)ams_dynamicColorWithLightColor:()AMSUICommonColor darkColor:lightHighContrastColor:
{
  return objc_msgSend(a1, "ams_dynamicColorWithLightColor:darkColor:lightHighContrastColor:darkHighContrastColor:", a3, a4, a5, a4);
}

+ (uint64_t)ams_dynamicColorWithLightColor:()AMSUICommonColor darkColor:darkHighContrastColor:
{
  return objc_msgSend(a1, "ams_dynamicColorWithLightColor:darkColor:lightHighContrastColor:darkHighContrastColor:", a3, a4, a3, a5);
}

+ (AMSUICommonDynamicColor)ams_dynamicColorWithLightColor:()AMSUICommonColor darkColor:lightHighContrastColor:darkHighContrastColor:
{
  return +[AMSUICommonDynamicColor dynamicColorWithLightColor:darkColor:lightHighContrastColor:darkHighContrastColor:](AMSUICommonDynamicColor, "dynamicColorWithLightColor:darkColor:lightHighContrastColor:darkHighContrastColor:");
}

+ (id)ams_colorFromDictionary:()AMSUICommonColor
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    if (objc_msgSend(v7, "isEqualToString:", CFSTR("named")))
    {
      objc_msgSend(a1, "ams_namedColorFromDictionary:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("dynamic")))
        objc_msgSend(a1, "ams_dynamicColorFromDictionary:", v5);
      else
        objc_msgSend(a1, "ams_rgbColorFromDictionary:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v9;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)ams_rgbColorFromDictionary:()AMSUICommonColor
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("red"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("green"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("blue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  v10 = 0;
  if (v5 && v7 && v9)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("alpha"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    v13 = &unk_24CB8C898;
    if (v12)
      v13 = v12;
    v14 = v13;

    v15 = (void *)MEMORY[0x24BEBD4B8];
    objc_msgSend(v5, "doubleValue");
    v17 = v16;
    objc_msgSend(v7, "doubleValue");
    v19 = v18;
    objc_msgSend(v9, "doubleValue");
    v21 = v20;
    objc_msgSend(v14, "doubleValue");
    v23 = v22;

    objc_msgSend(v15, "colorWithRed:green:blue:alpha:", v17, v19, v21, v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)ams_namedColorFromDictionary:()AMSUICommonColor
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(a1, "_colorIdentifierDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)ams_dynamicColorFromDictionary:()AMSUICommonColor
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lightColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("darkColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromDictionary:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_msgSend(v6, "isEqual:", v10) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "ams_dynamicColorWithLightColor:darkColor:", v6, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v6;
    }
    v9 = v11;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)ams_isDark
{
  double v1;

  objc_msgSend(a1, "ams_luminance");
  return v1 < 0.5;
}

- (BOOL)ams_isLight
{
  double v1;

  objc_msgSend(a1, "ams_luminance");
  return v1 >= 0.5;
}

+ (id)_colorIdentifierDictionary
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  id v13;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[34];
  _QWORD v39[36];

  v39[34] = *MEMORY[0x24BDAC8D0];
  v38[0] = CFSTR("black");
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v37;
  v38[1] = CFSTR("blue");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v36;
  v38[2] = CFSTR("brown");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBrownColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v35;
  v38[3] = CFSTR("clear");
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v34;
  v38[4] = CFSTR("cyan");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemCyanColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v33;
  v38[5] = CFSTR("gray");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v32;
  v38[6] = CFSTR("green");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v31;
  v38[7] = CFSTR("indigo");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemIndigoColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v30;
  v38[8] = CFSTR("mint");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemMintColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[8] = v29;
  v38[9] = CFSTR("orange");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[9] = v28;
  v38[10] = CFSTR("pink");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[10] = v27;
  v38[11] = CFSTR("purple");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemPurpleColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[11] = v26;
  v38[12] = CFSTR("red");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[12] = v25;
  v38[13] = CFSTR("teal");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemTealColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[13] = v24;
  v38[14] = CFSTR("white");
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39[14] = v23;
  v38[15] = CFSTR("yellow");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemYellowColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[15] = v22;
  v38[16] = CFSTR("appTint");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_appTint");
  v0 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v0;
  if (!v0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v39[16] = v0;
  v38[17] = CFSTR("defaultPlatformBackground");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_defaultPlatformBackgroundColor", v0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[17] = v20;
  v38[18] = CFSTR("primaryBackground");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_primaryBackground");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[18] = v19;
  v38[19] = CFSTR("primaryGroupedBackground");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_primaryGroupedBackground");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[19] = v18;
  v38[20] = CFSTR("secondaryBackground");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_secondaryBackground");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[20] = v17;
  v38[21] = CFSTR("secondaryGroupedBackground");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_secondaryGroupedBackground");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39[21] = v16;
  v38[22] = CFSTR("componentBackground");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_componentBackground");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39[22] = v15;
  v38[23] = CFSTR("placeholderBackground");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_placeholderBackground");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[23] = v14;
  v38[24] = CFSTR("tertiarySystemFillColor");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_tertiarySystemFillColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v39[24] = v1;
  v38[25] = CFSTR("defaultLine");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_defaultLine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v39[25] = v2;
  v38[26] = CFSTR("primaryText");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_primaryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v39[26] = v3;
  v38[27] = CFSTR("secondaryText");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_secondaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39[27] = v4;
  v38[28] = CFSTR("tertiaryText");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_tertiaryText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39[28] = v5;
  v38[29] = CFSTR("quaternaryText");
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_quaternaryText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39[29] = v6;
  v38[30] = CFSTR("primaryFill");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemFillColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[30] = v7;
  v38[31] = CFSTR("secondaryFill");
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemFillColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[31] = v8;
  v38[32] = CFSTR("tertiaryFill");
  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[32] = v9;
  v38[33] = CFSTR("quaternaryFill");
  objc_msgSend(MEMORY[0x24BEBD4B8], "quaternarySystemFillColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[33] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 34);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v21)
  return v13;
}

@end
