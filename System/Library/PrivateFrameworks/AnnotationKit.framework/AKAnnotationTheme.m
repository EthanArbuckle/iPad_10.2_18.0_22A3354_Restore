@implementation AKAnnotationTheme

+ (id)themeDescriptions
{
  if (qword_255A25F70 != -1)
    dispatch_once(&qword_255A25F70, &unk_24F1A70D8);
  return (id)qword_255A25F78;
}

+ (id)themeItemForAnnotationStyle:(int)a3 propertyName:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = 0;
  if (v6 && a3 <= 6)
  {
    v8 = off_24F1A7488[a3];
    objc_msgSend(a1, "themeDescriptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("themes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)colorForThemeItem:(id)a3 pageTheme:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4 > 4)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectForKey:", off_24F1A74C0[a4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a4 != 4 && !v7)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("default"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "im_colorWithSRGBDescription:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)colorForAnnotationStyle:(int)a3 propertyName:(id)a4 pageTheme:(int)a5
{
  uint64_t v5;
  void *v7;
  void *v8;

  v5 = *(_QWORD *)&a5;
  objc_msgSend(a1, "themeItemForAnnotationStyle:propertyName:", *(_QWORD *)&a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend(a1, "colorForThemeItem:pageTheme:", v7, v5),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (UIColor)noteFillColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

- (UIColor)noteBorderColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

- (UIColor)noteTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

- (UIColor)highlightColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

- (UIColor)noteMarkerFillColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

- (UIColor)noteMarkerBorderColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

- (UIColor)notesSidebarBarColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

- (UIColor)noteMarkerStrikethroughColor
{
  if (qword_255A26D00 != -1)
    dispatch_once(&qword_255A26D00, &unk_24F1A7348);
  return (UIColor *)(id)qword_255A26D08;
}

- (UIColor)notesSidebarTextColor
{
  if (qword_255A26D10 != -1)
    dispatch_once(&qword_255A26D10, &unk_24F1A7368);
  return (UIColor *)(id)qword_255A26D18;
}

+ (id)greenTheme:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[4];
  int v9;
  _QWORD v10[4];
  int v11;
  _QWORD block[4];
  int v13;
  _QWORD v14[4];
  int v15;
  _QWORD v16[4];
  int v17;
  uint64_t v18;
  uint64_t v19;

  v18 = v3;
  v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_228FD7CDC;
      v14[3] = &unk_24F1A7388;
      v15 = 0;
      if (qword_255A26D30 != -1)
        dispatch_once(&qword_255A26D30, v14);
      v5 = &qword_255A26D38;
      goto LABEL_19;
    case 1:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD7D1C;
      block[3] = &unk_24F1A7388;
      v13 = 1;
      if (qword_255A26D40 != -1)
        dispatch_once(&qword_255A26D40, block);
      v5 = &qword_255A26D48;
      goto LABEL_19;
    case 2:
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = sub_228FD7D5C;
      v10[3] = &unk_24F1A7388;
      v11 = 2;
      if (qword_255A26D50 != -1)
        dispatch_once(&qword_255A26D50, v10);
      v5 = &qword_255A26D58;
      goto LABEL_19;
    case 3:
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = sub_228FD7D9C;
      v8[3] = &unk_24F1A7388;
      v9 = 3;
      if (qword_255A26D60 != -1)
        dispatch_once(&qword_255A26D60, v8);
      v5 = &qword_255A26D68;
      goto LABEL_19;
    case 4:
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = sub_228FD7C9C;
      v16[3] = &unk_24F1A7388;
      v17 = 4;
      if (qword_255A26D20 != -1)
        dispatch_once(&qword_255A26D20, v16);
      v5 = &qword_255A26D28;
LABEL_19:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)blueTheme:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[4];
  int v9;
  _QWORD v10[4];
  int v11;
  _QWORD block[4];
  int v13;
  _QWORD v14[4];
  int v15;
  _QWORD v16[4];
  int v17;
  uint64_t v18;
  uint64_t v19;

  v18 = v3;
  v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_228FD8068;
      v14[3] = &unk_24F1A7388;
      v15 = 0;
      if (qword_255A26D80 != -1)
        dispatch_once(&qword_255A26D80, v14);
      v5 = &qword_255A26D88;
      goto LABEL_19;
    case 1:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD80A8;
      block[3] = &unk_24F1A7388;
      v13 = 1;
      if (qword_255A26D90 != -1)
        dispatch_once(&qword_255A26D90, block);
      v5 = &qword_255A26D98;
      goto LABEL_19;
    case 2:
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = sub_228FD80E8;
      v10[3] = &unk_24F1A7388;
      v11 = 2;
      if (qword_255A26DA0 != -1)
        dispatch_once(&qword_255A26DA0, v10);
      v5 = &qword_255A26DA8;
      goto LABEL_19;
    case 3:
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = sub_228FD8128;
      v8[3] = &unk_24F1A7388;
      v9 = 3;
      if (qword_255A26DB0 != -1)
        dispatch_once(&qword_255A26DB0, v8);
      v5 = &qword_255A26DB8;
      goto LABEL_19;
    case 4:
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = sub_228FD8028;
      v16[3] = &unk_24F1A7388;
      v17 = 4;
      if (qword_255A26D70 != -1)
        dispatch_once(&qword_255A26D70, v16);
      v5 = &qword_255A26D78;
LABEL_19:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)yellowTheme:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[4];
  int v9;
  _QWORD v10[4];
  int v11;
  _QWORD block[4];
  int v13;
  _QWORD v14[4];
  int v15;
  _QWORD v16[4];
  int v17;
  uint64_t v18;
  uint64_t v19;

  v18 = v3;
  v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_228FD83F4;
      v14[3] = &unk_24F1A7388;
      v15 = 0;
      if (qword_255A26DD0 != -1)
        dispatch_once(&qword_255A26DD0, v14);
      v5 = &qword_255A26DD8;
      goto LABEL_19;
    case 1:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD8434;
      block[3] = &unk_24F1A7388;
      v13 = 1;
      if (qword_255A26DE0 != -1)
        dispatch_once(&qword_255A26DE0, block);
      v5 = &qword_255A26DE8;
      goto LABEL_19;
    case 2:
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = sub_228FD8474;
      v10[3] = &unk_24F1A7388;
      v11 = 2;
      if (qword_255A26DF0 != -1)
        dispatch_once(&qword_255A26DF0, v10);
      v5 = &qword_255A26DF8;
      goto LABEL_19;
    case 3:
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = sub_228FD84B4;
      v8[3] = &unk_24F1A7388;
      v9 = 3;
      if (qword_255A26E00 != -1)
        dispatch_once(&qword_255A26E00, v8);
      v5 = &qword_255A26E08;
      goto LABEL_19;
    case 4:
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = sub_228FD83B4;
      v16[3] = &unk_24F1A7388;
      v17 = 4;
      if (qword_255A26DC0 != -1)
        dispatch_once(&qword_255A26DC0, v16);
      v5 = &qword_255A26DC8;
LABEL_19:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)pinkTheme:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[4];
  int v9;
  _QWORD v10[4];
  int v11;
  _QWORD block[4];
  int v13;
  _QWORD v14[4];
  int v15;
  _QWORD v16[4];
  int v17;
  uint64_t v18;
  uint64_t v19;

  v18 = v3;
  v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_228FD8780;
      v14[3] = &unk_24F1A7388;
      v15 = 0;
      if (qword_255A26E20 != -1)
        dispatch_once(&qword_255A26E20, v14);
      v5 = &qword_255A26E28;
      goto LABEL_19;
    case 1:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD87C0;
      block[3] = &unk_24F1A7388;
      v13 = 1;
      if (qword_255A26E30 != -1)
        dispatch_once(&qword_255A26E30, block);
      v5 = &qword_255A26E38;
      goto LABEL_19;
    case 2:
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = sub_228FD8800;
      v10[3] = &unk_24F1A7388;
      v11 = 2;
      if (qword_255A26E40 != -1)
        dispatch_once(&qword_255A26E40, v10);
      v5 = &qword_255A26E48;
      goto LABEL_19;
    case 3:
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = sub_228FD8840;
      v8[3] = &unk_24F1A7388;
      v9 = 3;
      if (qword_255A26E50 != -1)
        dispatch_once(&qword_255A26E50, v8);
      v5 = &qword_255A26E58;
      goto LABEL_19;
    case 4:
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = sub_228FD8740;
      v16[3] = &unk_24F1A7388;
      v17 = 4;
      if (qword_255A26E10 != -1)
        dispatch_once(&qword_255A26E10, v16);
      v5 = &qword_255A26E18;
LABEL_19:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)purpleTheme:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[4];
  int v9;
  _QWORD v10[4];
  int v11;
  _QWORD block[4];
  int v13;
  _QWORD v14[4];
  int v15;
  _QWORD v16[4];
  int v17;
  uint64_t v18;
  uint64_t v19;

  v18 = v3;
  v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_228FD8B0C;
      v14[3] = &unk_24F1A7388;
      v15 = 0;
      if (qword_255A26E70 != -1)
        dispatch_once(&qword_255A26E70, v14);
      v5 = &qword_255A26E78;
      goto LABEL_19;
    case 1:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD8B4C;
      block[3] = &unk_24F1A7388;
      v13 = 1;
      if (qword_255A26E80 != -1)
        dispatch_once(&qword_255A26E80, block);
      v5 = &qword_255A26E88;
      goto LABEL_19;
    case 2:
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = sub_228FD8B8C;
      v10[3] = &unk_24F1A7388;
      v11 = 2;
      if (qword_255A26E90 != -1)
        dispatch_once(&qword_255A26E90, v10);
      v5 = &qword_255A26E98;
      goto LABEL_19;
    case 3:
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = sub_228FD8BCC;
      v8[3] = &unk_24F1A7388;
      v9 = 3;
      if (qword_255A26EA0 != -1)
        dispatch_once(&qword_255A26EA0, v8);
      v5 = &qword_255A26EA8;
      goto LABEL_19;
    case 4:
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = sub_228FD8ACC;
      v16[3] = &unk_24F1A7388;
      v17 = 4;
      if (qword_255A26E60 != -1)
        dispatch_once(&qword_255A26E60, v16);
      v5 = &qword_255A26E68;
LABEL_19:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)underlineTheme:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[4];
  int v9;
  _QWORD v10[4];
  int v11;
  _QWORD block[4];
  int v13;
  _QWORD v14[4];
  int v15;
  _QWORD v16[4];
  int v17;
  uint64_t v18;
  uint64_t v19;

  v18 = v3;
  v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_228FD8E98;
      v14[3] = &unk_24F1A7388;
      v15 = 0;
      if (qword_255A26EC0 != -1)
        dispatch_once(&qword_255A26EC0, v14);
      v5 = &qword_255A26EC8;
      goto LABEL_19;
    case 1:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD8ED8;
      block[3] = &unk_24F1A7388;
      v13 = 1;
      if (qword_255A26ED0 != -1)
        dispatch_once(&qword_255A26ED0, block);
      v5 = &qword_255A26ED8;
      goto LABEL_19;
    case 2:
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = sub_228FD8F18;
      v10[3] = &unk_24F1A7388;
      v11 = 2;
      if (qword_255A26EE0 != -1)
        dispatch_once(&qword_255A26EE0, v10);
      v5 = &qword_255A26EE8;
      goto LABEL_19;
    case 3:
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = sub_228FD8F58;
      v8[3] = &unk_24F1A7388;
      v9 = 3;
      if (qword_255A26EF0 != -1)
        dispatch_once(&qword_255A26EF0, v8);
      v5 = &qword_255A26EF8;
      goto LABEL_19;
    case 4:
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = sub_228FD8E58;
      v16[3] = &unk_24F1A7388;
      v17 = 4;
      if (qword_255A26EB0 != -1)
        dispatch_once(&qword_255A26EB0, v16);
      v5 = &qword_255A26EB8;
LABEL_19:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)theme:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setPageTheme:", v3);
  return v4;
}

+ (id)themeForAnnotationStyle:(int)a3 pageTheme:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  switch(a3)
  {
    case 1:
      +[AKAnnotationTheme greenTheme:](AKAnnotationTheme, "greenTheme:", *(_QWORD *)&a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[AKAnnotationTheme blueTheme:](AKAnnotationTheme, "blueTheme:", *(_QWORD *)&a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[AKAnnotationTheme yellowTheme:](AKAnnotationTheme, "yellowTheme:", *(_QWORD *)&a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[AKAnnotationTheme pinkTheme:](AKAnnotationTheme, "pinkTheme:", *(_QWORD *)&a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      +[AKAnnotationTheme purpleTheme:](AKAnnotationTheme, "purpleTheme:", *(_QWORD *)&a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)themeForAnnotationStyle:(int)a3 pageTheme:(int)a4 isUnderline:(BOOL)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = *(_QWORD *)&a4;
  objc_msgSend(a1, "themeForAnnotationStyle:pageTheme:", *(_QWORD *)&a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 || !a5)
  {
    v9 = v7;
  }
  else
  {
    +[AKAnnotationTheme underlineTheme:](AKAnnotationTheme, "underlineTheme:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

+ (id)highlightTextColor:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  int v11;
  _QWORD block[5];
  int v13;
  _QWORD v14[5];
  int v15;
  _QWORD v16[5];
  int v17;
  uint64_t v18;
  uint64_t v19;

  v18 = v3;
  v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_228FD93E8;
      v14[3] = &unk_24F1A73A8;
      v14[4] = a1;
      v15 = 0;
      if (qword_255A26F10 != -1)
        dispatch_once(&qword_255A26F10, v14);
      v5 = &qword_255A26F18;
      goto LABEL_19;
    case 1:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD948C;
      block[3] = &unk_24F1A73A8;
      block[4] = a1;
      v13 = 1;
      if (qword_255A26F20 != -1)
        dispatch_once(&qword_255A26F20, block);
      v5 = &qword_255A26F28;
      goto LABEL_19;
    case 2:
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = sub_228FD9530;
      v10[3] = &unk_24F1A73A8;
      v10[4] = a1;
      v11 = 2;
      if (qword_255A26F30 != -1)
        dispatch_once(&qword_255A26F30, v10);
      v5 = &qword_255A26F38;
      goto LABEL_19;
    case 3:
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = sub_228FD95D4;
      v8[3] = &unk_24F1A73A8;
      v8[4] = a1;
      v9 = 3;
      if (qword_255A26F40 != -1)
        dispatch_once(&qword_255A26F40, v8);
      v5 = &qword_255A26F48;
      goto LABEL_19;
    case 4:
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = sub_228FD9344;
      v16[3] = &unk_24F1A73A8;
      v16[4] = a1;
      v17 = 4;
      if (qword_255A26F00 != -1)
        dispatch_once(&qword_255A26F00, v16);
      v5 = &qword_255A26F08;
LABEL_19:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (double)noteShadowRadius
{
  if (qword_255A26F50 != -1)
    dispatch_once(&qword_255A26F50, &unk_24F1A73C8);
  return *(double *)&qword_255A26F58;
}

- (double)noteShadowOpacity
{
  if (qword_255A26F60 != -1)
    dispatch_once(&qword_255A26F60, &unk_24F1A73E8);
  return *(double *)&qword_255A26F68;
}

- (UIColor)noteShadowColor
{
  if (qword_255A26F70 != -1)
    dispatch_once(&qword_255A26F70, &unk_24F1A7408);
  return (UIColor *)(id)qword_255A26F78;
}

- (CGSize)noteShadowOffset
{
  double v2;
  double v3;
  CGSize result;

  if (qword_255A26F80 != -1)
    dispatch_once(&qword_255A26F80, &unk_24F1A7428);
  v2 = *(double *)&qword_255A26F88;
  v3 = *(double *)&qword_255A26F90;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIFont)noteTextFont
{
  if (qword_255A26F98 != -1)
    dispatch_once(&qword_255A26F98, &unk_24F1A7448);
  return (UIFont *)(id)qword_255A26FA0;
}

- (UIFont)noteTextFontInTable
{
  if (qword_255A26FA8 != -1)
    dispatch_once(&qword_255A26FA8, &unk_24F1A7468);
  return (UIFont *)(id)qword_255A26FB0;
}

- (BOOL)isUnderline
{
  return 0;
}

- (int)annotationStyle
{
  return 1;
}

- (int)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int)a3
{
  self->_pageTheme = a3;
}

@end
