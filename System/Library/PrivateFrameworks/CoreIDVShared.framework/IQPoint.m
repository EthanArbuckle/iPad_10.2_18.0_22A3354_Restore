@implementation IQPoint

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EFBBF821;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EFBBF821 = a3;
}

- (_TtC13CoreIDVShared7IQPoint)initWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared7IQPoint *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  int v11;
  _TtC13CoreIDVShared7IQPoint *v12;
  objc_super v14;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1CFB01A04();
  objc_msgSend(v4, sel_decodeFloatForKey_, v6);
  v8 = v7;

  *(_DWORD *)((char *)&v5->super.isa + OBJC_IVAR____TtC13CoreIDVShared7IQPoint_x) = v8;
  v9 = (void *)sub_1CFB01A04();
  objc_msgSend(v4, sel_decodeFloatForKey_, v9);
  v11 = v10;

  *(_DWORD *)((char *)&v5->super.isa + OBJC_IVAR____TtC13CoreIDVShared7IQPoint_y) = v11;
  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for IQPoint();
  v12 = -[IQPoint init](&v14, sel_init);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int *v5;
  int v6;
  id v7;
  _TtC13CoreIDVShared7IQPoint *v8;
  void *v9;
  double v10;
  int *v11;
  int v12;
  void *v13;
  double v14;

  v5 = (int *)((char *)self + OBJC_IVAR____TtC13CoreIDVShared7IQPoint_x);
  swift_beginAccess();
  v6 = *v5;
  v7 = a3;
  v8 = self;
  v9 = (void *)sub_1CFB01A04();
  LODWORD(v10) = v6;
  objc_msgSend(v7, sel_encodeFloat_forKey_, v9, v10);

  v11 = (int *)((char *)v8 + OBJC_IVAR____TtC13CoreIDVShared7IQPoint_y);
  swift_beginAccess();
  v12 = *v11;
  v13 = (void *)sub_1CFB01A04();
  LODWORD(v14) = v12;
  objc_msgSend(v7, sel_encodeFloat_forKey_, v13, v14);

}

- (NSString)debugDescription
{
  return (NSString *)sub_1CF98A92C(self, (uint64_t)a2, (void (*)(void))sub_1CF989C14);
}

- (_TtC13CoreIDVShared7IQPoint)init
{
  _TtC13CoreIDVShared7IQPoint *result;

  result = (_TtC13CoreIDVShared7IQPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
