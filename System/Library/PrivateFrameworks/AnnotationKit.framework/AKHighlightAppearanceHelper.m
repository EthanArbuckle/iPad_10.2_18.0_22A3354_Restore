@implementation AKHighlightAppearanceHelper

+ (int)annotationStyleForHighlightAttributeWithTag:(int64_t)a3
{
  if ((unint64_t)(a3 - 765200) > 6)
    return 0;
  else
    return dword_229092E60[a3 - 765200];
}

+ (id)colorForHighlightAttributeWithTag:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  switch(a3)
  {
    case 765200:
      +[AKAnnotationTheme yellowTheme:](AKAnnotationTheme, "yellowTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765201:
      +[AKAnnotationTheme greenTheme:](AKAnnotationTheme, "greenTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765202:
      +[AKAnnotationTheme blueTheme:](AKAnnotationTheme, "blueTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765203:
      +[AKAnnotationTheme pinkTheme:](AKAnnotationTheme, "pinkTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765204:
      +[AKAnnotationTheme purpleTheme:](AKAnnotationTheme, "purpleTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765205:
    case 765206:
      +[AKAnnotationTheme underlineTheme:](AKAnnotationTheme, "underlineTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v5 = v3;
      objc_msgSend(v3, "highlightColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

+ (int64_t)attributeTagForHighlightOfColor:(id)a3
{
  int64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t *v10;
  double v11;
  _QWORD v13[13];

  v13[12] = *MEMORY[0x24BDAC8D0];
  v4 = 763000;
  v5 = a3;
  v6 = 0;
  v13[1] = 0;
  v13[3] = 0;
  v13[5] = 0;
  v13[7] = 0;
  v13[9] = 0;
  v13[0] = 765200;
  v13[2] = 765201;
  v13[4] = 765202;
  v13[6] = 765203;
  v13[8] = 765204;
  v13[10] = 765206;
  v13[11] = 0;
  do
  {
    objc_msgSend(a1, "colorForHighlightAttributeWithTag:", v13[v6]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "akDistanceFromColor:", v7);
    v13[v6 + 1] = v8;

    v6 += 2;
  }
  while (v6 != 12);
  v9 = 0;
  v10 = 0;
  v11 = 1.79769313e308;
  do
  {
    if (*(double *)&v13[v9 + 1] < v11)
    {
      v11 = *(double *)&v13[v9 + 1];
      v10 = &v13[v9];
    }
    v9 += 2;
  }
  while (v9 != 12);
  if (*((double *)v10 + 1) < 28.0)
    v4 = *v10;

  return v4;
}

+ (id)colorForNoteOfHighlightAttributeTag:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  switch(a3)
  {
    case 765200:
      +[AKAnnotationTheme yellowTheme:](AKAnnotationTheme, "yellowTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765201:
      +[AKAnnotationTheme greenTheme:](AKAnnotationTheme, "greenTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765202:
      +[AKAnnotationTheme blueTheme:](AKAnnotationTheme, "blueTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765203:
      +[AKAnnotationTheme pinkTheme:](AKAnnotationTheme, "pinkTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765204:
      +[AKAnnotationTheme purpleTheme:](AKAnnotationTheme, "purpleTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765205:
    case 765206:
      +[AKAnnotationTheme underlineTheme:](AKAnnotationTheme, "underlineTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v5 = v3;
      objc_msgSend(v3, "noteFillColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

+ (int64_t)attributeTagForNoteOfColor:(id)a3
{
  int64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t *v10;
  double v11;
  _QWORD v13[13];

  v13[12] = *MEMORY[0x24BDAC8D0];
  v4 = 763000;
  v5 = a3;
  v6 = 0;
  v13[1] = 0;
  v13[3] = 0;
  v13[5] = 0;
  v13[7] = 0;
  v13[9] = 0;
  v13[0] = 765200;
  v13[2] = 765201;
  v13[4] = 765202;
  v13[6] = 765203;
  v13[8] = 765204;
  v13[10] = 765206;
  v13[11] = 0;
  do
  {
    objc_msgSend(a1, "colorForNoteOfHighlightAttributeTag:", v13[v6]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "akDistanceFromColor:", v7);
    v13[v6 + 1] = v8;

    v6 += 2;
  }
  while (v6 != 12);
  v9 = 0;
  v10 = 0;
  v11 = 1.79769313e308;
  do
  {
    if (*(double *)&v13[v9 + 1] < v11)
    {
      v11 = *(double *)&v13[v9 + 1];
      v10 = &v13[v9];
    }
    v9 += 2;
  }
  while (v9 != 12);
  if (*((double *)v10 + 1) < 28.0)
    v4 = *v10;

  return v4;
}

+ (id)borderColorForNoteOfHighlightAttributeTag:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  switch(a3)
  {
    case 765200:
      +[AKAnnotationTheme yellowTheme:](AKAnnotationTheme, "yellowTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765201:
      +[AKAnnotationTheme greenTheme:](AKAnnotationTheme, "greenTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765202:
      +[AKAnnotationTheme blueTheme:](AKAnnotationTheme, "blueTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765203:
      +[AKAnnotationTheme pinkTheme:](AKAnnotationTheme, "pinkTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765204:
      +[AKAnnotationTheme purpleTheme:](AKAnnotationTheme, "purpleTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 765205:
    case 765206:
      +[AKAnnotationTheme underlineTheme:](AKAnnotationTheme, "underlineTheme:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v5 = v3;
      objc_msgSend(v3, "noteBorderColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

+ (BOOL)highlightColor:(id)a3 isEquivalentToHighlightColor:(id)a4
{
  return MEMORY[0x24BEDD108](a3, sel_akHasHueEqualToColor_withTolerance_);
}

@end
