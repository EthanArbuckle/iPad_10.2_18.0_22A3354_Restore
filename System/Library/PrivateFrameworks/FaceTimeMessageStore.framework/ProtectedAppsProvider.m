@implementation ProtectedAppsProvider

- (_TtC20FaceTimeMessageStore21ProtectedAppsProvider)init
{
  _TtC20FaceTimeMessageStore21ProtectedAppsProvider *result;

  sub_23B3C966C();
  return result;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  _TtC20FaceTimeMessageStore21ProtectedAppsProvider *v5;

  sub_23B3D5720();
  sub_23B3D53D8();
  swift_unknownObjectRetain();
  v5 = self;
  sub_23B3C9BAC();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_23B31269C((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore21ProtectedAppsProvider_delegate);
}

@end
