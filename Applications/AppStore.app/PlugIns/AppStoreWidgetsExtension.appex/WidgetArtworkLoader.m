@implementation WidgetArtworkLoader

- (_TtC24AppStoreWidgetsExtension19WidgetArtworkLoader)init
{
  uint64_t v3;
  uint64_t v4;
  _TtC24AppStoreWidgetsExtension19WidgetArtworkLoader *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC24AppStoreWidgetsExtension19WidgetArtworkLoader_cache;
  v4 = sub_100004380(&qword_100062C18);
  swift_allocObject(v4, 32, 7);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_100042824();
  *(Class *)((char *)&v5->super.isa
           + OBJC_IVAR____TtC24AppStoreWidgetsExtension19WidgetArtworkLoader____lazy_storage___session) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for WidgetArtworkLoader();
  return -[WidgetArtworkLoader init](&v7, "init");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC24AppStoreWidgetsExtension19WidgetArtworkLoader_cache));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24AppStoreWidgetsExtension19WidgetArtworkLoader____lazy_storage___session));
}

@end
