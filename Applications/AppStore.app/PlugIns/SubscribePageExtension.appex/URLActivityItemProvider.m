@implementation URLActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v7;
  _TtC22SubscribePageExtension23URLActivityItemProvider *v8;
  id v9;
  id v10;
  _TtC22SubscribePageExtension23URLActivityItemProvider *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  char *v17;
  void *v18;
  __int128 v20;
  __int128 v21;

  if (a4)
  {
    v7 = a3;
    v8 = self;
    v9 = a4;
    if ((sub_100246AF8() & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;

      goto LABEL_6;
    }
  }
  else
  {
    v10 = a3;
    v11 = self;
  }
  *((_QWORD *)&v21 + 1) = type metadata accessor for URL(0);
  sub_1000117C0(&v20);
  ShareSheetData.url.getter();

LABEL_6:
  v12 = *((_QWORD *)&v21 + 1);
  if (!*((_QWORD *)&v21 + 1))
    return 0;
  v13 = sub_100011064(&v20, *((uint64_t *)&v21 + 1));
  v14 = *(_QWORD *)(v12 - 8);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v14 + 16))(v17, v15);
  v18 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v17, v12);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v12);
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(&v20);
  return v18;
}

- (id)item
{
  _TtC22SubscribePageExtension23URLActivityItemProvider *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  _QWORD v7[3];
  uint64_t v8;

  v2 = self;
  sub_100483CD4(v7);

  v3 = v8;
  v4 = sub_100011064(v7, v8);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v7);
  return v5;
}

- (_TtC22SubscribePageExtension23URLActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  _TtC22SubscribePageExtension23URLActivityItemProvider *result;
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  result = (_TtC22SubscribePageExtension23URLActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.URLActivityItemProvider", 46, "init(placeholderItem:)", 22, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension23URLActivityItemProvider_artworkLoader));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension23URLActivityItemProvider_shareSheetData));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension23URLActivityItemProvider_excludedActivityTypes));
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension23URLActivityItemProvider *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10048425C();

  return v6;
}

- (id)activityViewControllerSubject:(id)a3
{
  _TtC22SubscribePageExtension23URLActivityItemProvider *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v4 = self;
  v5 = a3;
  sub_100484F38();
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
