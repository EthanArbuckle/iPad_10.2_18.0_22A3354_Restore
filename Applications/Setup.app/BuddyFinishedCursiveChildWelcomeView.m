@implementation BuddyFinishedCursiveChildWelcomeView

- (BuddyFinishedCursiveChildWelcomeView)initWithFrame:(CGRect)a3
{
  BuddyCursiveTextView *v3;
  void *v4;
  id v5;
  NSArray *v6;
  id v7;
  BuddyFinishedCursiveChildWelcomeView *v8;
  void **v10;
  int v11;
  int v12;
  void (*v13)(id *, void *, void *);
  void *v14;
  id v15;
  objc_super v16;
  SEL v17;
  id location;
  CGRect v19;
  uint64_t v20;

  v19 = a3;
  v17 = a2;
  location = 0;
  v16.receiver = self;
  v16.super_class = (Class)BuddyFinishedCursiveChildWelcomeView;
  location = -[BuddyFinishedCursiveChildWelcomeView initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v3 = objc_alloc_init(BuddyCursiveTextView);
    v4 = (void *)*((_QWORD *)location + 1);
    *((_QWORD *)location + 1) = v3;

    objc_msgSend(location, "_updateFillColor");
    objc_msgSend(*((id *)location + 1), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(location, "addSubview:", *((_QWORD *)location + 1));
    objc_msgSend(*((id *)location + 1), "pinToEdges:", location);
    v5 = location;
    v20 = objc_opt_class(UITraitUserInterfaceStyle);
    v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1);
    v10 = _NSConcreteStackBlock;
    v11 = -1073741824;
    v12 = 0;
    v13 = sub_100113D04;
    v14 = &unk_100283118;
    v15 = location;
    v7 = objc_msgSend(v5, "registerForTraitChanges:withHandler:", v6, &v10);
    objc_msgSend(location, "setTraitChangeRegistration:", v7);

    objc_storeStrong(&v15, 0);
  }
  v8 = (BuddyFinishedCursiveChildWelcomeView *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)startAnimation
{
  NSBundle *v2;
  BuddyCursiveTextView *v3;
  BuddyCursiveTextView *v4;
  id location[2];
  BuddyFinishedCursiveChildWelcomeView *v6;

  v6 = self;
  location[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  location[0] = -[NSBundle URLForResource:withExtension:subdirectory:](v2, "URLForResource:withExtension:subdirectory:", CFSTR("BuddyCursive"), CFSTR("plist"), 0);

  v3 = -[BuddyFinishedCursiveChildWelcomeView cursiveTextView](v6, "cursiveTextView");
  -[BuddyCursiveTextView loadText:pointSize:](v3, "loadText:pointSize:", location[0], 64.0);

  v4 = -[BuddyFinishedCursiveChildWelcomeView cursiveTextView](v6, "cursiveTextView");
  -[BuddyCursiveTextView duration](v4, "duration");
  -[BuddyFinishedCursiveChildWelcomeView setCustomDelayDuration:](v6, "setCustomDelayDuration:");

  -[BuddyFinishedCursiveChildWelcomeView setStartTime:](v6, "setStartTime:", CFAbsoluteTimeGetCurrent());
  -[BuddyFinishedCursiveChildWelcomeView _createDisplayLink](v6, "_createDisplayLink");
  -[BuddyFinishedCursiveChildWelcomeView setNeedsLayout](v6, "setNeedsLayout");
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityLabel:(id)a3
{
  BuddyCursiveTextView *v3;
  objc_super v4;
  id location[2];
  BuddyFinishedCursiveChildWelcomeView *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)BuddyFinishedCursiveChildWelcomeView;
  -[BuddyFinishedCursiveChildWelcomeView setAccessibilityLabel:](&v4, "setAccessibilityLabel:", location[0]);
  v3 = -[BuddyFinishedCursiveChildWelcomeView cursiveTextView](v6, "cursiveTextView");
  -[BuddyCursiveTextView setAccessibilityLabel:](v3, "setAccessibilityLabel:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)_createDisplayLink
{
  CADisplayLink *v2;
  CADisplayLink *v3;
  CADisplayLink *v4;
  NSRunLoop *v5;
  CAFrameRateRange v7;

  if (self->_displayLink)
    -[BuddyFinishedCursiveChildWelcomeView _removeDisplayLink](self, "_removeDisplayLink");
  v2 = +[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", self, "_onDisplayLink:");
  -[BuddyFinishedCursiveChildWelcomeView setDisplayLink:](self, "setDisplayLink:", v2);

  v3 = -[BuddyFinishedCursiveChildWelcomeView displayLink](self, "displayLink");
  v7 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CADisplayLink setPreferredFrameRateRange:](v3, "setPreferredFrameRateRange:", *(double *)&v7.minimum, *(double *)&v7.maximum, *(double *)&v7.preferred);

  v4 = -[BuddyFinishedCursiveChildWelcomeView displayLink](self, "displayLink");
  v5 = +[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop");
  -[CADisplayLink addToRunLoop:forMode:](v4, "addToRunLoop:forMode:", v5, NSRunLoopCommonModes);

}

- (void)_removeDisplayLink
{
  CADisplayLink *v2;

  v2 = -[BuddyFinishedCursiveChildWelcomeView displayLink](self, "displayLink", a2);
  -[CADisplayLink invalidate](v2, "invalidate");

  -[BuddyFinishedCursiveChildWelcomeView setDisplayLink:](self, "setDisplayLink:", 0);
}

- (void)_onDisplayLink:(id)a3
{
  CADisplayLink *v3;
  CADisplayLink *v4;
  id location[2];
  BuddyFinishedCursiveChildWelcomeView *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (CADisplayLink *)location[0];
  v4 = -[BuddyFinishedCursiveChildWelcomeView displayLink](v6, "displayLink");

  if (v3 == v4)
    -[BuddyFinishedCursiveChildWelcomeView _animateCursiveForTimePassed](v6, "_animateCursiveForTimePassed");
  objc_storeStrong(location, 0);
}

- (void)_animateCursiveForTimePassed
{
  double Current;
  double v3;
  BuddyCursiveTextView *v4;
  double v5;
  id v6;
  double v7;
  double v8;

  Current = CFAbsoluteTimeGetCurrent();
  -[BuddyFinishedCursiveChildWelcomeView startTime](self, "startTime");
  v8 = Current - v3;
  v4 = -[BuddyFinishedCursiveChildWelcomeView cursiveTextView](self, "cursiveTextView");
  HIDWORD(v5) = HIDWORD(v8);
  *(float *)&v5 = v8;
  -[BuddyCursiveTextView setTime:](v4, "setTime:", v5);

  v6 = -[BuddyFinishedCursiveChildWelcomeView customDelayDuration](self, "customDelayDuration");
  if ((BSFloatGreaterThanFloat(v6, v8, v7) & 1) != 0)
    -[BuddyFinishedCursiveChildWelcomeView _removeDisplayLink](self, "_removeDisplayLink");
}

- (void)_updateFillColor
{
  id v2;
  id v3;
  BuddyCursiveTextView *v4;
  UIColor *v5;

  v2 = -[BuddyFinishedCursiveChildWelcomeView traitCollection](self, "traitCollection", a2);
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  v4 = -[BuddyFinishedCursiveChildWelcomeView cursiveTextView](self, "cursiveTextView");
  if (v3 == (id)2)
    v5 = +[UIColor whiteColor](UIColor, "whiteColor");
  else
    v5 = +[UIColor blackColor](UIColor, "blackColor");
  -[BuddyCursiveTextView setFillColor:](v4, "setFillColor:", v5);

}

- (BuddyCursiveTextView)cursiveTextView
{
  return self->_cursiveTextView;
}

- (void)setCursiveTextView:(id)a3
{
  objc_storeStrong((id *)&self->_cursiveTextView, a3);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)customDelayDuration
{
  return self->_customDelayDuration;
}

- (void)setCustomDelayDuration:(double)a3
{
  self->_customDelayDuration = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_cursiveTextView, 0);
}

@end
