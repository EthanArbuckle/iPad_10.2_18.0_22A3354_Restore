@implementation ArtworkActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtC8AppStore27ArtworkActivityItemProvider *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  char *v14;
  void *v15;
  __int128 v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1003CA270(a4, &v17);

  v9 = v18;
  if (!v18)
    return 0;
  v10 = sub_100060B40(&v17, v18);
  v11 = *(_QWORD *)(v9 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v11 + 16))(v14, v12);
  v15 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v14, v9);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(&v17);
  return v15;
}

- (id)item
{
  _TtC8AppStore27ArtworkActivityItemProvider *v2;
  __n128 v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  _QWORD v8[3];
  uint64_t v9;

  v2 = self;
  sub_1003CA4A8(v8, v3);

  v4 = v9;
  v5 = sub_100060B40(v8, v9);
  v6 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v5, v4);
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v8);
  return v6;
}

- (_TtC8AppStore27ArtworkActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  _TtC8AppStore27ArtworkActivityItemProvider *result;
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  result = (_TtC8AppStore27ArtworkActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer("AppStore.ArtworkActivityItemProvider", 36, "init(placeholderItem:)", 22, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore27ArtworkActivityItemProvider_artwork));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore27ArtworkActivityItemProvider_artworkLoader));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore27ArtworkActivityItemProvider_artworkConfig));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore27ArtworkActivityItemProvider_imageBox));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore27ArtworkActivityItemProvider_excludedActivityTypes));
}

@end
