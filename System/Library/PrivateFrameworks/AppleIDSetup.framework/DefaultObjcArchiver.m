@implementation DefaultObjcArchiver

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  _TtC12AppleIDSetup19DefaultObjcArchiver *v7;
  id v8;
  _TtC12AppleIDSetup19DefaultObjcArchiver *v9;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_2365B04C4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a4;
    v9 = self;
  }
  sub_2365B005C();

  sub_2365AE214((uint64_t)v10);
  swift_bridgeObjectRelease();
  sub_236465998((uint64_t)v10, (uint64_t *)&unk_2542A8320);
}

- (id)initRequiringSecureCoding:(BOOL)a3
{
  id result;

  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12AppleIDSetup19DefaultObjcArchiver)init
{
  _TtC12AppleIDSetup19DefaultObjcArchiver *result;

  result = (_TtC12AppleIDSetup19DefaultObjcArchiver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initForWritingWithMutableData:(id)a3
{
  id v3;
  id result;

  v3 = a3;
  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12AppleIDSetup19DefaultObjcArchiver_encoder);
}

@end
