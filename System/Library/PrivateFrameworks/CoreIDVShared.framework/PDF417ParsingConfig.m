@implementation PDF417ParsingConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared19PDF417ParsingConfig)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC13CoreIDVShared19PDF417ParsingConfig *v7;
  _TtC13CoreIDVShared19PDF417ParsingConfig *result;
  _TtC13CoreIDVShared19PDF417ParsingConfig *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  _TtC13CoreIDVShared19PDF417ParsingConfig *v14;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1CF9775E8(0, (unint64_t *)&qword_1ED903980);
  v6 = a3;
  v7 = self;
  result = (_TtC13CoreIDVShared19PDF417ParsingConfig *)sub_1CFB02118();
  if (result)
  {
    v9 = result;
    v10 = sub_1CFB01A28();
    v12 = v11;

    v13 = (uint64_t *)((char *)v7 + OBJC_IVAR____TtC13CoreIDVShared19PDF417ParsingConfig_aamvaHeader);
    *v13 = v10;
    v13[1] = v12;

    v15.receiver = v7;
    v15.super_class = ObjectType;
    v14 = -[PDF417ParsingConfig init](&v15, sel_init);

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared19PDF417ParsingConfig *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1CFB01A04();
  v7 = (id)sub_1CFB01A04();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

}

- (_TtC13CoreIDVShared19PDF417ParsingConfig)init
{
  _TtC13CoreIDVShared19PDF417ParsingConfig *result;

  result = (_TtC13CoreIDVShared19PDF417ParsingConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
