@implementation BuddyPasscodeFieldDot

- (BuddyPasscodeFieldDot)init
{
  id v2;
  id v3;
  id v4;
  BuddyPasscodeFieldDot *v5;
  objc_super v7;
  SEL v8;
  id location;

  v8 = a2;
  location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyPasscodeFieldDot;
  location = -[BuddyPasscodeFieldDot initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_msgSend(location, "layer");
    objc_msgSend(v2, "setCornerRadius:", 10.0);

    v3 = objc_msgSend(location, "layer");
    objc_msgSend(v3, "setMasksToBounds:", 1);

    v4 = objc_msgSend(location, "layer");
    objc_msgSend(v4, "setBorderWidth:", 2.0);

    objc_msgSend(location, "_updateView");
  }
  v5 = (BuddyPasscodeFieldDot *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)setFilled:(BOOL)a3
{
  if (self->_filled != a3)
  {
    self->_filled = a3;
    -[BuddyPasscodeFieldDot _updateView](self, "_updateView");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_1000A97B8();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  BuddyPasscodeFieldDot *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)BuddyPasscodeFieldDot;
  -[BuddyPasscodeFieldDot traitCollectionDidChange:](&v3, "traitCollectionDidChange:", location[0]);
  -[BuddyPasscodeFieldDot _updateView](v5, "_updateView");
  objc_storeStrong(location, 0);
}

- (void)_updateView
{
  id v2;
  void **v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  BuddyPasscodeFieldDot *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = -[BuddyPasscodeFieldDot traitCollection](self, "traitCollection");
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_1000A990C;
  v7 = &unk_100280730;
  v8[0] = v9;
  objc_msgSend(v2, "performAsCurrentTraitCollection:", &v3);

  objc_storeStrong(v8, 0);
}

- (BOOL)isFilled
{
  return self->_filled;
}

@end
