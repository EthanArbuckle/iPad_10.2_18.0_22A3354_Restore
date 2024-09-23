@implementation IdentityGesture

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EFBC0BA3;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EFBC0BA3 = a3;
}

- (_TtC13CoreIDVShared15IdentityGesture)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared15IdentityGesture *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared15IdentityGesture *)sub_1CF9D37C0(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC13CoreIDVShared15IdentityGesture *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared15IdentityGesture_gesture);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1CFB01A04();
  objc_msgSend(v5, sel_encodeInteger_forKey_, v4, v7);

  v8 = *(uint64_t *)((char *)&v6->super.isa + OBJC_IVAR____TtC13CoreIDVShared15IdentityGesture_type);
  v9 = (id)sub_1CFB01A04();
  objc_msgSend(v5, sel_encodeInteger_forKey_, v8, v9);

}

- (_TtC13CoreIDVShared15IdentityGesture)init
{
  _TtC13CoreIDVShared15IdentityGesture *result;

  result = (_TtC13CoreIDVShared15IdentityGesture *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
