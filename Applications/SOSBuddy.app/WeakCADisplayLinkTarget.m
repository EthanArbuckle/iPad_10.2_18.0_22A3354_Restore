@implementation WeakCADisplayLinkTarget

- (void)updateFrom:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(id, uint64_t, uint64_t);
  id v11;
  _TtC8SOSBuddy23WeakCADisplayLinkTarget *v12;

  v5 = (char *)self + OBJC_IVAR____TtC8SOSBuddy23WeakCADisplayLinkTarget__target;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8SOSBuddy23WeakCADisplayLinkTarget__target);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v10 = *(void (**)(id, uint64_t, uint64_t))(v8 + 8);
    v11 = a3;
    v12 = self;
    v10(v11, ObjectType, v8);

    swift_unknownObjectRelease(v7);
  }
}

- (_TtC8SOSBuddy23WeakCADisplayLinkTarget)init
{
  _TtC8SOSBuddy23WeakCADisplayLinkTarget *result;

  result = (_TtC8SOSBuddy23WeakCADisplayLinkTarget *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.WeakCADisplayLinkTarget", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100025CF8((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy23WeakCADisplayLinkTarget__target);
}

@end
