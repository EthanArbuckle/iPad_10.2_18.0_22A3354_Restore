@implementation APServer

+ (id)sharedInstance
{
  if (qword_2563D3E40 != -1)
    swift_once();
  return (id)qword_2563D4158;
}

- (_TtC13AppProtection8APServer)init
{
  return (_TtC13AppProtection8APServer *)sub_2362553F8();
}

- (void)runForever
{
  _TtC13AppProtection8APServer *v2;

  v2 = self;
  sub_236256228();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13AppProtection8APServer_policy);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13AppProtection8APServer_firstRunWorkManager);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
