@implementation STKStickerSearchQuery

- (NSString)exactQuery
{
  return (NSString *)sub_234686614((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKStickerSearchQuery_exactQuery);
}

- (void)setExactQuery:(id)a3
{
  sub_2346866F0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___STKStickerSearchQuery_exactQuery);
}

- (NSString)autocorrectedQuery
{
  return (NSString *)sub_234686614((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKStickerSearchQuery_autocorrectedQuery);
}

- (void)setAutocorrectedQuery:(id)a3
{
  sub_2346866F0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___STKStickerSearchQuery_autocorrectedQuery);
}

- (NSString)locale
{
  return (NSString *)sub_234686614((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKStickerSearchQuery_locale);
}

- (void)setLocale:(id)a3
{
  sub_2346866F0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___STKStickerSearchQuery_locale);
}

- (NSArray)multilingualSearchLocales
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_multilingualSearchLocales);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_2347178A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setMultilingualSearchLocales:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  if (a3)
    v4 = sub_2347178BC();
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___STKStickerSearchQuery_multilingualSearchLocales);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)supportsImages
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKStickerSearchQuery_supportsImages;
  swift_beginAccess();
  return *v2;
}

- (void)setSupportsImages:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKStickerSearchQuery_supportsImages;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)supportsGenmoji
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKStickerSearchQuery_supportsGenmoji;
  swift_beginAccess();
  return *v2;
}

- (void)setSupportsGenmoji:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKStickerSearchQuery_supportsGenmoji;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)supportsEmoji
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKStickerSearchQuery_supportsEmoji;
  swift_beginAccess();
  return *v2;
}

- (void)setSupportsEmoji:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKStickerSearchQuery_supportsEmoji;
  swift_beginAccess();
  *v4 = a3;
}

- (STKStickerSearchQuery)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_exactQuery);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_autocorrectedQuery);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_locale);
  *v6 = 0;
  v6[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_multilingualSearchLocales) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_supportsImages) = 1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_supportsGenmoji) = 1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_supportsEmoji) = 1;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[STKStickerSearchQuery init](&v8, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
