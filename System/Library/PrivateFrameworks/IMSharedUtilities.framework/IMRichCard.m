@implementation IMRichCard

- (IMRichCardLayout)layout
{
  return (IMRichCardLayout *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___IMRichCard_layout));
}

- (IMRichCardMedia)media
{
  return (IMRichCardMedia *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___IMRichCard_media));
}

- (NSString)title
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMRichCard_title);
}

- (NSString)cardDescription
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMRichCard_cardDescription);
}

- (IMChipList)chipList
{
  return (IMChipList *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___IMRichCard_chipList));
}

- (IMUrlToTransferMap)urlToTransferMap
{
  return (IMUrlToTransferMap *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___IMRichCard_urlToTransferMap));
}

- (void)setUrlToTransferMap:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCard_urlToTransferMap);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCard_urlToTransferMap) = (Class)a3;
  v3 = a3;

}

- (IMRichCard)initWithLayout:(id)a3 media:(id)a4 title:(id)a5 cardDescription:(id)a6 chipList:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  id v19;
  id v20;
  id v21;
  objc_super v23;

  if (!a5)
  {
    v12 = 0;
    v14 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v15 = 0;
    v16 = 0;
    goto LABEL_6;
  }
  v12 = sub_19E36F888();
  v14 = v13;
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v15 = sub_19E36F888();
LABEL_6:
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCard_urlToTransferMap) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCard_layout) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCard_media) = (Class)a4;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCard_title);
  *v17 = v12;
  v17[1] = v14;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCard_cardDescription);
  *v18 = v15;
  v18[1] = v16;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCard_chipList) = (Class)a7;
  v23.receiver = self;
  v23.super_class = (Class)IMRichCard;
  v19 = a3;
  v20 = a4;
  v21 = a7;
  return -[IMRichCard init](&v23, sel_init);
}

- (IMRichCard)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMRichCard *)IMRichCard.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMRichCard *v2;
  void *v3;

  v2 = self;
  sub_19E32E900();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)updateUrlToTransferMap:(id)a3
{
  IMUrlToTransferMap *v4;
  IMRichCard *v5;

  v4 = (IMUrlToTransferMap *)a3;
  v5 = self;
  IMRichCard.update(urlToTransferMap:)(v4);

}

- (id)copyWithZone:(void *)a3
{
  IMRichCard *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_19E32F010(v6);

  sub_19E323360(v6, v6[3]);
  v4 = (void *)sub_19E36FE04();
  sub_19E323384((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  IMRichCard *v4;
  IMRichCard *v5;
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
  v6 = IMRichCard.isEqual(_:)((uint64_t)v8);

  sub_19E322284((uint64_t)v8);
  return v6 & 1;
}

- (IMRichCard)init
{
  IMRichCard *result;

  result = (IMRichCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
