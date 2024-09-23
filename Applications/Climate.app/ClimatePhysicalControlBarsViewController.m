@implementation ClimatePhysicalControlBarsViewController

- (_TtC7Climate40ClimatePhysicalControlBarsViewController)initWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  _TtC7Climate40ClimatePhysicalControlBarsViewController *result;

  v4 = a3;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
  {
    v5 = (objc_class *)sub_100018798((uint64_t)_swiftEmptyArrayStorage);
  }
  else
  {
    v5 = (objc_class *)&_swiftEmptySetSingleton;
  }
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Climate40ClimatePhysicalControlBarsViewController_cancellables) = v5;

  result = (_TtC7Climate40ClimatePhysicalControlBarsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010008BA30, "Climate/ClimatePhysicalControlBarsViewController.swift", 54, 2, 38, 0);
  __break(1u);
  return result;
}

- (_TtC7Climate40ClimatePhysicalControlBarsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7Climate40ClimatePhysicalControlBarsViewController *result;

  v4 = a4;
  result = (_TtC7Climate40ClimatePhysicalControlBarsViewController *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimatePhysicalControlBarsViewController", 48, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate40ClimatePhysicalControlBarsViewController_cancellables));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate40ClimatePhysicalControlBarsViewController_physicalControls));
}

@end
