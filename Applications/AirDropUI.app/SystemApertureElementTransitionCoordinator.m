@implementation SystemApertureElementTransitionCoordinator

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC9AirDropUI42SystemApertureElementTransitionCoordinator *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_100008C1C();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC9AirDropUI42SystemApertureElementTransitionCoordinator *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100008D14();

  return v6;
}

- (_TtC9AirDropUI42SystemApertureElementTransitionCoordinator)init
{
  return (_TtC9AirDropUI42SystemApertureElementTransitionCoordinator *)sub_100006EE0();
}

- (void).cxx_destruct
{
  sub_100008FC8((uint64_t)self + OBJC_IVAR____TtC9AirDropUI42SystemApertureElementTransitionCoordinator_delegate);
}

@end
