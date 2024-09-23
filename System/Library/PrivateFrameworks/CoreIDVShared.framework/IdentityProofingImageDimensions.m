@implementation IdentityProofingImageDimensions

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EFBBFA90;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EFBBFA90 = a3;
}

- (_TtC13CoreIDVShared31IdentityProofingImageDimensions)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC13CoreIDVShared31IdentityProofingImageDimensions *v7;
  _TtC13CoreIDVShared31IdentityProofingImageDimensions *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for IdentityImageDimension();
  v6 = a3;
  v7 = self;
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC13CoreIDVShared31IdentityProofingImageDimensions_idFront) = (Class)sub_1CFB02118();
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC13CoreIDVShared31IdentityProofingImageDimensions_idBack) = (Class)sub_1CFB02118();
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC13CoreIDVShared31IdentityProofingImageDimensions_selfie) = (Class)sub_1CFB02118();

  v10.receiver = v7;
  v10.super_class = ObjectType;
  v8 = -[IdentityProofingImageDimensions init](&v10, sel_init);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared31IdentityProofingImageDimensions *v5;

  v4 = a3;
  v5 = self;
  IdentityProofingImageDimensions.encode(with:)((NSCoder)v4);

}

- (NSString)debugDescription
{
  return (NSString *)sub_1CF98A92C(self, (uint64_t)a2, (void (*)(void))IdentityProofingImageDimensions.debugDescription.getter);
}

- (_TtC13CoreIDVShared31IdentityProofingImageDimensions)init
{
  _TtC13CoreIDVShared31IdentityProofingImageDimensions *result;

  result = (_TtC13CoreIDVShared31IdentityProofingImageDimensions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared31IdentityProofingImageDimensions_idFront));

}

@end
