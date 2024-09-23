@implementation IdentityDocument

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared16IdentityDocument)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared16IdentityDocument *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared16IdentityDocument *)sub_1CF977DF4();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared16IdentityDocument *v5;

  v4 = a3;
  v5 = self;
  IdentityDocument.encode(with:)((NSCoder)v4);

}

- (_TtC13CoreIDVShared16IdentityDocument)init
{
  _TtC13CoreIDVShared16IdentityDocument *result;

  result = (_TtC13CoreIDVShared16IdentityDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared16IdentityDocument_image), *(_QWORD *)&self->image[OBJC_IVAR____TtC13CoreIDVShared16IdentityDocument_image]);

  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared16IdentityDocument_pdf417Data), *(_QWORD *)&self->image[OBJC_IVAR____TtC13CoreIDVShared16IdentityDocument_pdf417Data]);
}

@end
