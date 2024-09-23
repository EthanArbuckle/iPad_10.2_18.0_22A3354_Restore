@implementation StickerPackOrganizerDelegate

- (void)openURL:(id)a3 pluginID:(id)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _TtC22StickersUltraExtension28StickerPackOrganizerDelegate *v16;
  uint64_t v17;

  v9 = sub_10000A66C(&qword_10009AFF0);
  __chkstk_darwin(v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v13 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    v14 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v15;
  }
  if (v12)
  {
    v16 = self;
    _Block_release(v12);

  }
  swift_bridgeObjectRelease(a4);
  sub_10000A6AC((uint64_t)v11);
}

- (void)openURL:(id)a3 applicationIdentifier:(id)a4 pluginID:(id)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _TtC22StickersUltraExtension28StickerPackOrganizerDelegate *v19;
  uint64_t v20;

  v11 = sub_10000A66C(&qword_10009AFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v15 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 0, 1, v15);
  }
  else
  {
    v16 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  }
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v17;
  }
  if (a5)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v18;
  }
  v19 = self;
  if (v14)
    _Block_release(v14);
  swift_bridgeObjectRelease(a4);
  swift_bridgeObjectRelease(a5);

  sub_10000A6AC((uint64_t)v13);
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _TtC22StickersUltraExtension28StickerPackOrganizerDelegate *v14;

  v10 = _Block_copy(a6);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v11;
  }
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v12;
  }
  if (a5)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v13;
  }
  v14 = self;
  if (v10)
    _Block_release(v10);
  swift_bridgeObjectRelease(a4);
  swift_bridgeObjectRelease(a5);

  swift_bridgeObjectRelease(a3);
}

- (id)dragControllerTranscriptDelegate
{
  return 0;
}

- (void)dismiss
{
  void (*v2)(void);
  _TtC22StickersUltraExtension28StickerPackOrganizerDelegate *v3;

  v2 = *(void (**)(void))((char *)&self->super.isa
                        + OBJC_IVAR____TtC22StickersUltraExtension28StickerPackOrganizerDelegate_requestDismiss);
  v3 = self;
  v2();

}

- (void)browserAppManagerDidSelectPlugin:(id)a3
{
  id v5;
  _TtC22StickersUltraExtension28StickerPackOrganizerDelegate *v6;

  v5 = a3;
  v6 = self;
  sub_10000A114(a3);

}

- (_TtC22StickersUltraExtension28StickerPackOrganizerDelegate)init
{
  _TtC22StickersUltraExtension28StickerPackOrganizerDelegate *result;

  result = (_TtC22StickersUltraExtension28StickerPackOrganizerDelegate *)_swift_stdlib_reportUnimplementedInitializer("StickersUltraExtension.StickerPackOrganizerDelegate", 51, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_release(*(_QWORD *)&self->requestDismiss[OBJC_IVAR____TtC22StickersUltraExtension28StickerPackOrganizerDelegate_requestDismiss], a2);
  swift_release(*(_QWORD *)&self->requestDismiss[OBJC_IVAR____TtC22StickersUltraExtension28StickerPackOrganizerDelegate_requestPresentPlugin], v3);
}

@end
