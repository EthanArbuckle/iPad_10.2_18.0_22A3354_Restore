@implementation CPSDashboardSecondaryManeuverView

- (CPSDashboardSecondaryManeuverView)initWithManeuver:(id)a3
{
  CPSDashboardSecondaryManeuverView *v3;
  CPSDashboardSecondaryManeuverView *v5;
  CPSDashboardSecondaryManeuverView *v6;
  id v7;
  objc_super v8;
  id location[2];
  CPSDashboardSecondaryManeuverView *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0;
  v8.receiver = v3;
  v8.super_class = (Class)CPSDashboardSecondaryManeuverView;
  v10 = -[CPSSecondaryManeuverView initWithManeuver:](&v8, sel_initWithManeuver_, location[0]);
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v6 = v10;
    v7 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemQuaternaryColor");
    -[CPSDashboardSecondaryManeuverView setBackgroundColor:](v6, "setBackgroundColor:");

  }
  v5 = v10;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v5;
}

- (double)horizontalInset
{
  return 13.0;
}

@end
