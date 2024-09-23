@implementation IMRichCardStyle

- (BOOL)bold
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMRichCardStyle_bold);
}

- (BOOL)italics
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMRichCardStyle_italics);
}

- (BOOL)underline
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMRichCardStyle_underline);
}

- (IMRichCardStyle)initWithBold:(BOOL)a3 italics:(BOOL)a4 underline:(BOOL)a5
{
  objc_super v6;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___IMRichCardStyle_bold) = a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___IMRichCardStyle_italics) = a4;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___IMRichCardStyle_underline) = a5;
  v6.receiver = self;
  v6.super_class = (Class)IMRichCardStyle;
  return -[IMRichCardStyle init](&v6, sel_init);
}

- (IMRichCardStyle)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMRichCardStyle *)IMRichCardStyle.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMRichCardStyle *v2;
  void *v3;

  v2 = self;
  sub_19E330258();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

- (IMRichCardStyle)init
{
  IMRichCardStyle *result;

  result = (IMRichCardStyle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
