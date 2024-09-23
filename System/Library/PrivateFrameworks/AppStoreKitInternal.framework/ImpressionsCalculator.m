@implementation ImpressionsCalculator

- (void)applicationDidEnterBackgroundWithNote:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_1D8742728();

  swift_release();
}

- (void)applicationWillEnterForegroundWithNote:(id)a3
{
  id v3;

  if (*((_BYTE *)&self->super.isa
       + OBJC_IVAR____TtC19AppStoreKitInternal21ImpressionsCalculator_wasVisibleBeforeGoingIntoBackground) != 2)
  {
    v3 = a3;
    swift_retain();
    ImpressionsCalculator.isVisible.setter();

    swift_release();
  }
}

@end
