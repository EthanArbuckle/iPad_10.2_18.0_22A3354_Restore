@implementation UIColor(NUAdditions)

+ (id)nu_safeColorForIdentifier:()NUAdditions
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "arrayOfColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hash");

  objc_msgSend(v5, "objectAtIndex:", v6 % objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)arrayOfColors
{
  void *v0;
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
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _QWORD v26[10];

  v26[8] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemPurpleColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0.0;
  v25 = 0.0;
  v22 = 0.0;
  v23 = 0.0;
  objc_msgSend(v17, "getRed:green:blue:alpha:", &v25, &v24, &v23, &v22);
  v20 = 0.0;
  v21 = 0.0;
  v18 = 0.0;
  v19 = 0.0;
  objc_msgSend(v16, "getRed:green:blue:alpha:", &v21, &v20, &v19, &v18);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.678431373, 0.0, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.992156863, 0.466666667, 0.156862745, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v14;
  v0 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.411764706, 0.337254902, 0.701960784, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v25, v24, v23, v22);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "nu_dynamicColor:withDarkStyleVariant:", v13, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v2;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.764705882, 0.384313725, 0.874509804, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v3;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.360784314, 0.752941176, 0.549019608, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v4;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0274509804, 0.709803922, 0.796078431, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v5;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v6;
  v7 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.149019608, 0.28627451, 0.549019608, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v21, v20, v19, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nu_dynamicColor:withDarkStyleVariant:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)nu_dynamicColor:()NUAdditions withDarkStyleVariant:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDF6F30];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "traitCollectionWithUserInterfaceStyle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "_dynamicColorWithColorsByTraitCollection:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
