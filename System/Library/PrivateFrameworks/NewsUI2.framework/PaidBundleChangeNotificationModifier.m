@implementation PaidBundleChangeNotificationModifier

- (_TtC7NewsUI236PaidBundleChangeNotificationModifier)init
{
  _TtC7NewsUI236PaidBundleChangeNotificationModifier *result;

  result = (_TtC7NewsUI236PaidBundleChangeNotificationModifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI236PaidBundleChangeNotificationModifier_notificationController));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4;
  _TtC7NewsUI236PaidBundleChangeNotificationModifier *v5;

  v4 = a3;
  v5 = self;
  sub_1D69924BC();

}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4;
  _TtC7NewsUI236PaidBundleChangeNotificationModifier *v5;

  v4 = a3;
  v5 = self;
  sub_1D6991CC8(1);

}

@end
