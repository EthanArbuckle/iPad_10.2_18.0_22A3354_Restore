@implementation PRDMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared11PRDMetadata)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared11PRDMetadata *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared11PRDMetadata *)sub_1CFA245AC(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int v4;
  id v5;
  _TtC13CoreIDVShared11PRDMetadata *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v4 = *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared11PRDMetadata_stage2);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1CFB01A04();
  LODWORD(v8) = v4;
  objc_msgSend(v5, sel_encodeFloat_forKey_, v7, v8);

  v9 = (void *)sub_1CFB02AE4();
  v10 = (id)sub_1CFB01A04();
  objc_msgSend(v5, sel_encodeObject_forKey_, v9, v10);

}

- (NSString)debugDescription
{
  return (NSString *)sub_1CF98A92C(self, (uint64_t)a2, (void (*)(void))PRDMetadata.debugDescription.getter);
}

- (_TtC13CoreIDVShared11PRDMetadata)init
{
  _TtC13CoreIDVShared11PRDMetadata *result;

  result = (_TtC13CoreIDVShared11PRDMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
