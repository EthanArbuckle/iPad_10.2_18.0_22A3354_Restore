@implementation AvatarGlyphDataSource

- (BOOL)isEnabled
{
  _TtC10StickerKit21AvatarGlyphDataSource *v2;
  char *v3;
  unsigned __int8 *v4;
  unint64_t v5;
  uint64_t v6;

  v2 = self;
  v3 = (char *)sub_23468B210();
  v4 = (unsigned __int8 *)(*(_QWORD *)&v3[OBJC_IVAR____TtC10StickerKit25ImageGlyphUIConfiguration_viewConfiguration]
                         + OBJC_IVAR___STKImageGlyphViewConfiguration_doesSupportImageGlyph);
  swift_beginAccess();
  LODWORD(v4) = *v4;

  if ((_DWORD)v4 == 1)
  {
    v5 = sub_2345E71E4();
    if (v5 >> 62)
      v6 = sub_2347180CC();
    else
      v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);

    swift_bridgeObjectRelease();
    return v6 != 0;
  }
  else
  {

    return 0;
  }
}

- (int64_t)glyphType
{
  return 2;
}

- (NSArray)categories
{
  _TtC10StickerKit21AvatarGlyphDataSource *v2;
  void *v3;

  v2 = self;
  sub_23468B0F0();

  type metadata accessor for ImageGlyphCategory(0);
  v3 = (void *)sub_2347178A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)configureWith:(id)a3
{
  id v5;
  id v6;
  objc_class *v7;
  void *v8;
  _TtC10StickerKit21AvatarGlyphDataSource *v9;

  v5 = objc_allocWithZone((Class)type metadata accessor for ImageGlyphUIConfiguration());
  v6 = a3;
  v9 = self;
  v7 = (objc_class *)sub_2346B4CA4(a3, 2);
  v8 = *(Class *)((char *)&v9->super.super.isa
                + OBJC_IVAR____TtC10StickerKit21AvatarGlyphDataSource____lazy_storage___uiConfig);
  *(Class *)((char *)&v9->super.super.isa
           + OBJC_IVAR____TtC10StickerKit21AvatarGlyphDataSource____lazy_storage___uiConfig) = v7;

  sub_2345E7494((uint64_t)v6);
}

- (id)indexPathForCategory:(id)a3
{
  return sub_2345EA964(self, (uint64_t)a2, a3, (void (*)(id))sub_23468B6DC);
}

- (int64_t)numberOfItemsInCategory:(id)a3
{
  id v4;
  _TtC10StickerKit21AvatarGlyphDataSource *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_23468B8EC(v4);

  return v6;
}

- (id)indexPathForIdentifier:(id)a3 ofType:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC10StickerKit21AvatarGlyphDataSource *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256171710);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_234717754();
  v11 = v10;
  v12 = self;
  sub_23468BA9C(v9, v11, a4, v8);

  swift_bridgeObjectRelease();
  v13 = sub_234715B64();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    v15 = (void *)sub_234715B10();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }
  return v15;
}

- (id)indexPathForItem:(id)a3
{
  return sub_2345EA964(self, (uint64_t)a2, a3, (void (*)(id))sub_23468BEAC);
}

- (_TtC10StickerKit21AvatarGlyphDataSource)initWithDataSources:(id)a3
{
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256174998);
  v3 = sub_2347178BC();
  return (_TtC10StickerKit21AvatarGlyphDataSource *)sub_23468C290(v3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10StickerKit21AvatarGlyphDataSource____lazy_storage___uiConfig));
  swift_bridgeObjectRelease();

}

@end
