@implementation AppleSilicon

- (BOOL)isSupportEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC19AppStoreKitInternal12AppleSilicon_isSupportEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSupportEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC19AppStoreKitInternal12AppleSilicon_isSupportEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isRosettaAvailable
{
  _TtC19AppStoreKitInternal12AppleSilicon *v2;
  char v3;

  v2 = self;
  v3 = AppleSilicon.isRosettaAvailable.getter();

  return v3 & 1;
}

- (_TtC19AppStoreKitInternal12AppleSilicon)init
{
  _TtC19AppStoreKitInternal12AppleSilicon *result;

  result = (_TtC19AppStoreKitInternal12AppleSilicon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal12AppleSilicon_rosettaAvailabilityConditionLock));
}

@end
