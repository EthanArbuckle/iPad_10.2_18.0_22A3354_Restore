@implementation InAppMessagesContextProvider

- (id)contextPropertyWithName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8AppStore28InAppMessagesContextProvider *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD v16[3];
  uint64_t v17;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100268B7C(v4, v6, (uint64_t)v16);

  swift_bridgeObjectRelease(v6);
  v8 = v17;
  if (!v17)
    return 0;
  v9 = sub_100060B40(v16, v17);
  v10 = *(_QWORD *)(v8 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v10 + 16))(v13, v11);
  v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v13, v8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v16);
  return v14;
}

- (id)viewControllerForModalPresentation
{
  id v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore28InAppMessagesContextProvider_rootViewController);
  if (v2)
    v2 = objc_msgSend(v2, "frontmostViewController");
  return v2;
}

- (void)familyInfoDidChange
{
  _TtC8AppStore28InAppMessagesContextProvider *v2;

  v2 = self;
  sub_100269448();

}

- (_TtC8AppStore28InAppMessagesContextProvider)init
{
  _TtC8AppStore28InAppMessagesContextProvider *result;

  result = (_TtC8AppStore28InAppMessagesContextProvider *)_swift_stdlib_reportUnimplementedInitializer("AppStore.InAppMessagesContextProvider", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8AppStore28InAppMessagesContextProvider_arcadeSubscriptionManager));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8AppStore28InAppMessagesContextProvider_rootViewController));
}

@end
