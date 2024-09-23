@implementation FMFCoreHelper

+ (id)displayNameFor:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _BYTE v7[8];

  v3 = qword_254AC7B70;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  sub_2119DF2AC(v4, (uint64_t)v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = (void *)sub_211A478EC();
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC7FMFCore13FMFCoreHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMFCoreHelper();
  return -[FMFCoreHelper init](&v3, sel_init);
}

@end
