@implementation CPSDashboardPrimaryManeuverView

+ (id)instructionsForManeuver:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  BOOL v7;
  objc_super v8;
  int v9;
  id location[2];
  id v11;
  id v12;

  v11 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(location[0], "dashboardAttributedInstructionVariants");
  v7 = objc_msgSend(v6, "count") == 0;

  if (v7)
  {
    v4 = (id)objc_msgSend(location[0], "dashboardInstructionVariants");
    v5 = objc_msgSend(v4, "count") == 0;

    if (v5)
    {
      v8.receiver = v11;
      v8.super_class = (Class)&OBJC_METACLASS___CPSDashboardPrimaryManeuverView;
      v12 = objc_msgSendSuper2(&v8, sel_instructionsForManeuver_, location[0]);
    }
    else
    {
      v12 = (id)objc_msgSend(location[0], "dashboardInstructionVariants");
    }
    v9 = 1;
  }
  else
  {
    v12 = (id)objc_msgSend(location[0], "attributedInstructionVariants");
    v9 = 1;
  }
  objc_storeStrong(location, 0);
  return v12;
}

+ (id)symbolImageForManeuver:(id)a3
{
  id v4;
  objc_super v5;
  int v6;
  id location[2];
  id v8;
  id v9;

  v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)objc_msgSend(location[0], "dashboardSymbolImage");

  if (v4)
  {
    v9 = (id)objc_msgSend(location[0], "dashboardSymbolImage");
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)&OBJC_METACLASS___CPSDashboardPrimaryManeuverView;
    v9 = objc_msgSendSuper2(&v5, sel_symbolImageForManeuver_, location[0]);
  }
  v6 = 1;
  objc_storeStrong(location, 0);
  return v9;
}

+ (id)junctionImageForManeuver:(id)a3
{
  id v4;
  objc_super v5;
  int v6;
  id location[2];
  id v8;
  id v9;

  v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)objc_msgSend(location[0], "dashboardJunctionImage");

  if (v4)
  {
    v9 = (id)objc_msgSend(location[0], "dashboardJunctionImage");
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)&OBJC_METACLASS___CPSDashboardPrimaryManeuverView;
    v9 = objc_msgSendSuper2(&v5, sel_junctionImageForManeuver_, location[0]);
  }
  v6 = 1;
  objc_storeStrong(location, 0);
  return v9;
}

- (BOOL)centersManeuverInView
{
  return 1;
}

- (double)symbolImageHeight
{
  return 40.0;
}

- (BOOL)hasJunctionImageBackground
{
  return 1;
}

- (id)junctionBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemQuaternaryColor", a2, self);
}

- (BOOL)fitJunctionViewToHeight
{
  return 1;
}

@end
