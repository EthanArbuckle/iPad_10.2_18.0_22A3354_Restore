@implementation URLActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  uint64_t v7;
  id v8;
  _TtC8AppStore23URLActivityItemProvider *v9;
  id v10;
  id v11;
  _TtC8AppStore23URLActivityItemProvider *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;
  char *v18;
  void *v19;
  __int128 v21;
  __int128 v22;

  if (a4)
  {
    v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC8AppStore23URLActivityItemProvider_excludedActivityTypes);
    v8 = a3;
    v9 = self;
    v10 = a4;
    if ((sub_10026A964(v10, v7) & 1) != 0)
    {
      v21 = 0u;
      v22 = 0u;

      goto LABEL_6;
    }
  }
  else
  {
    v11 = a3;
    v12 = self;
  }
  *((_QWORD *)&v22 + 1) = type metadata accessor for URL(0);
  sub_100024638(&v21);
  ShareSheetData.url.getter();

LABEL_6:
  v13 = *((_QWORD *)&v22 + 1);
  if (!*((_QWORD *)&v22 + 1))
    return 0;
  v14 = sub_100060B40(&v21, *((uint64_t *)&v22 + 1));
  v15 = *(_QWORD *)(v13 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v15 + 16))(v18, v16);
  v19 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v18, v13);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v13);
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(&v21);
  return v19;
}

- (id)item
{
  _TtC8AppStore23URLActivityItemProvider *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  _QWORD v7[3];
  uint64_t v8;

  v2 = self;
  sub_1005D77F8(v7);

  v3 = v8;
  v4 = sub_100060B40(v7, v8);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v7);
  return v5;
}

- (_TtC8AppStore23URLActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  _TtC8AppStore23URLActivityItemProvider *result;
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  result = (_TtC8AppStore23URLActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer("AppStore.URLActivityItemProvider", 32, "init(placeholderItem:)", 22, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore23URLActivityItemProvider_artworkLoader));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore23URLActivityItemProvider_shareSheetData));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore23URLActivityItemProvider_excludedActivityTypes));
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4;
  _TtC8AppStore23URLActivityItemProvider *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1005D7D80();

  return v6;
}

- (id)activityViewControllerSubject:(id)a3
{
  _TtC8AppStore23URLActivityItemProvider *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v4 = self;
  v5 = a3;
  sub_1005D8A5C();
  v7 = v6;

  if (v7)
  {
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
