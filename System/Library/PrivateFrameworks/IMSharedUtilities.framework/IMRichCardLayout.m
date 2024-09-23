@implementation IMRichCardLayout

- (int64_t)orientation
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_orientation);
}

- (int64_t)imageAlignment
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_imageAlignment);
}

- (int64_t)width
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_width);
}

- (IMRichCardStyle)titleStyle
{
  return (IMRichCardStyle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___IMRichCardLayout_titleStyle));
}

- (IMRichCardStyle)descriptionStyle
{
  return (IMRichCardStyle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___IMRichCardLayout_descriptionStyle));
}

- (NSString)cardStyleUrl
{
  void *v2;

  if (*(_QWORD *)&self->orientation[OBJC_IVAR___IMRichCardLayout_cardStyleUrl])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_19E36F864();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (IMRichCardLayout)initWithOrientation:(int64_t)a3 imageAlignment:(int64_t)a4 width:(int64_t)a5 titleStyle:(id)a6 descriptionStyle:(id)a7 cardStyleUrl:(id)a8
{
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  id v17;
  id v18;
  objc_super v20;

  if (a8)
  {
    v14 = sub_19E36F888();
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_orientation) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_imageAlignment) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_width) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_titleStyle) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_descriptionStyle) = (Class)a7;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCardLayout_cardStyleUrl);
  *v16 = v14;
  v16[1] = v15;
  v20.receiver = self;
  v20.super_class = (Class)IMRichCardLayout;
  v17 = a6;
  v18 = a7;
  return -[IMRichCardLayout init](&v20, sel_init);
}

- (IMRichCardLayout)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMRichCardLayout *)IMRichCardLayout.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMRichCardLayout *v2;
  void *v3;

  v2 = self;
  sub_19E34ED54();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  IMRichCardLayout *v4;
  IMRichCardLayout *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19E36FC0C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = IMRichCardLayout.isEqual(_:)((uint64_t)v8);

  sub_19E322284((uint64_t)v8);
  return v6 & 1;
}

- (IMRichCardLayout)init
{
  IMRichCardLayout *result;

  result = (IMRichCardLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
