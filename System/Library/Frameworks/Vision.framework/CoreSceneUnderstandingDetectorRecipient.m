@implementation CoreSceneUnderstandingDetectorRecipient

- (void)receiveObservations:(id)a3
{
  uint64_t v4;
  _TtC6Vision39CoreSceneUnderstandingDetectorRecipient *v5;

  if (a3)
  {
    sub_1A1287F40();
    v4 = sub_1A15A8C40();
  }
  else
  {
    v4 = 0;
  }
  v5 = self;
  sub_1A12863B4(v4);

  swift_bridgeObjectRelease();
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return (VNRequestSpecifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC6Vision39CoreSceneUnderstandingDetectorRecipient_originatingRequestSpecifier));
}

- (_TtC6Vision39CoreSceneUnderstandingDetectorRecipient)init
{
  _TtC6Vision39CoreSceneUnderstandingDetectorRecipient *result;

  result = (_TtC6Vision39CoreSceneUnderstandingDetectorRecipient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6Vision39CoreSceneUnderstandingDetectorRecipient_originatingRequestSpecifier));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC6Vision39CoreSceneUnderstandingDetectorRecipient_request);
  swift_bridgeObjectRelease();
}

@end
