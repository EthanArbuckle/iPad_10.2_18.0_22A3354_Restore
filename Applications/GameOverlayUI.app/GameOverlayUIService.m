@implementation GameOverlayUIService

- (void)setUpAccessPointWithLocation:(id)a3 useCase:(id)a4 gameInternal:(id)a5 didReturnToForeground:(id)a6 newToGameCenter:(id)a7 sceneIdentifier:(id)a8
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _TtC13GameOverlayUI20GameOverlayUIService *v29;
  uint64_t v30;

  v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = v17;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v29 = self;
  v22 = a8;
  v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v25 = v24;

  if (v22)
  {
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    v28 = v27;

  }
  else
  {
    v26 = 0;
    v28 = 0;
  }
  sub_10004F2B4(v30, v15, v16, v18, v23, v25, v20, v21, v26, v28);
  swift_bridgeObjectRelease(v28);
  sub_100038198(v23, v25);

  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v18);
}

- (void)tearDownAccessPointWithSceneIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _TtC13GameOverlayUI20GameOverlayUIService *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = sub_100003304(&qword_10010EB20);
  __chkstk_darwin(v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v8;
  }
  v9 = self;
  v10 = sub_100072058(0);
  if (v11)
  {
    v12 = v10;
    v13 = v11;
    v14 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v7, 1, 1, v14);
    v15 = (_QWORD *)swift_allocObject(&unk_1000FE870, 48, 7);
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = v12;
    v15[5] = v13;
    v16 = sub_100028240((uint64_t)v7, (uint64_t)&unk_10010E428, (uint64_t)v15);

    swift_release(v16);
  }
  else
  {

  }
  swift_bridgeObjectRelease(a3);
}

- (void)showAccessPointWithSceneIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC13GameOverlayUI20GameOverlayUIService *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  v7 = sub_100072058(0);
  if (v8)
  {
    v9 = v8;
    sub_10004F420(v7, v8, 0);

    swift_bridgeObjectRelease(v9);
  }
  else
  {

  }
  swift_bridgeObjectRelease(v5);
}

- (void)hideAccessPointWithSceneIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC13GameOverlayUI20GameOverlayUIService *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  v7 = sub_100072058(0);
  if (v8)
  {
    v9 = v8;
    sub_10004F420(v7, v8, 1);

    swift_bridgeObjectRelease(v9);
  }
  else
  {

  }
  swift_bridgeObjectRelease(v5);
}

- (void)updateAccessPointWithLocation:(id)a3 gameInternal:(id)a4 sceneIdentifier:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC13GameOverlayUI20GameOverlayUIService *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = a4;
  v12 = self;
  v13 = a5;
  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v15;

  if (v13)
  {
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    v19 = v18;

  }
  else
  {
    v17 = 0;
    v19 = 0;
  }
  sub_10004C4D4(v8, v10, v14, v16, v17, v19);
  swift_bridgeObjectRelease(v19);
  sub_100038198(v14, v16);

  swift_bridgeObjectRelease(v10);
}

- (void)showInGameBannerWithUseCase:(id)a3 title:(id)a4 message:(id)a5 image:(id)a6 identifier:(id)a7 gameInternal:(id)a8 sceneIdentifier:(id)a9
{
  _TtC13GameOverlayUI20GameOverlayUIService *v15;
  _TtC13GameOverlayUI20GameOverlayUIService *v16;
  _TtC13GameOverlayUI20GameOverlayUIService *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _TtC13GameOverlayUI20GameOverlayUIService *v27;
  _TtC13GameOverlayUI20GameOverlayUIService *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _TtC13GameOverlayUI20GameOverlayUIService *v33;
  _TtC13GameOverlayUI20GameOverlayUIService *v34;
  SEL v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  SEL v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  SEL v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  SEL v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  SEL v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  _TtC13GameOverlayUI20GameOverlayUIService *v76;
  uint64_t v77;
  _TtC13GameOverlayUI20GameOverlayUIService *v78;
  _TtC13GameOverlayUI20GameOverlayUIService *v79;
  _TtC13GameOverlayUI20GameOverlayUIService *v80;

  v77 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v80 = v15;
  v74 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v79 = v16;
  if (a5)
  {
    v75 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v78 = v17;
  }
  else
  {
    v75 = 0;
    v78 = 0;
  }
  v76 = self;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = v20;
  if (a6)
  {
    v22 = a6;
    v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a6);
    v25 = v24;

    if (v21)
      goto LABEL_6;
  }
  else
  {
    v23 = 0;
    v25 = 0xF000000000000000;
    if (v20)
    {
LABEL_6:
      v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
      v28 = v27;

      if (v19)
        goto LABEL_7;
LABEL_11:
      v29 = 0;
      v31 = 0xF000000000000000;
      if (v18)
        goto LABEL_8;
LABEL_12:
      v32 = 0;
      v34 = 0;
      goto LABEL_13;
    }
  }
  v26 = 0;
  v28 = 0;
  if (!v19)
    goto LABEL_11;
LABEL_7:
  v29 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a8);
  v31 = v30;

  if (!v18)
    goto LABEL_12;
LABEL_8:
  v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(a9);
  v34 = v33;

LABEL_13:
  sub_10004CFDC(v77, v80, v74, (uint64_t)v79, v75, (uint64_t)v78, v23, v25, v26, (uint64_t)v28, v29, v31, v32, (uint64_t)v34);
  swift_bridgeObjectRelease(v34, v35, v36, v37, v38, v39, v40, v41, v70);
  sub_100038E18(v29, v31);
  swift_bridgeObjectRelease(v28, v42, v43, v44, v45, v46, v47, v48, v71);
  sub_100038E18(v23, v25);

  swift_bridgeObjectRelease(v80, v49, v50, v51, v52, v53, v54, v55, v72);
  swift_bridgeObjectRelease(v79, v56, v57, v58, v59, v60, v61, v62, v73);
  swift_bridgeObjectRelease(v78, v63, v64, v65, v66, v67, v68, v69, a9);
}

- (void)showDashboardWithInitialState:(id)a3 canDismissWithGesture:(id)a4 sceneIdentifier:(id)a5
{
  id v9;
  id *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _TtC13GameOverlayUI20GameOverlayUIService *v16;
  _TtC13GameOverlayUI20GameOverlayUIService *v17;
  SEL v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _TtC13GameOverlayUI20GameOverlayUIService *v25;

  v9 = a3;
  v10 = (id *)a4;
  v25 = self;
  v11 = a5;
  v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = v13;

  if (v11)
  {
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    v17 = v16;

  }
  else
  {
    v15 = 0;
    v17 = 0;
  }
  sub_10004F7AC(v12, v14, v10, v15, (uint64_t)v17);
  swift_bridgeObjectRelease(v17, v18, v19, v20, v21, v22, v23, v24);
  sub_100038198(v12, v14);

}

- (void)showGameModeBannerWithBundleIdentifier:(id)a3 available:(id)a4 required:(id)a5 enabled:(id)a6 showText:(id)a7
{
  uint64_t v12;
  _TtC13GameOverlayUI20GameOverlayUIService *v13;
  _TtC13GameOverlayUI20GameOverlayUIService *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _TtC13GameOverlayUI20GameOverlayUIService *v19;
  SEL v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = v13;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = self;
  sub_10005023C(v12, (uint64_t)v14, v15, v16, v17);

  swift_bridgeObjectRelease(v14, v20, v21, v22, v23, v24, v25, v26);
}

- (_TtC13GameOverlayUI20GameOverlayUIService)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13GameOverlayUI20GameOverlayUIService_listener) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[GameOverlayUIService init](&v5, "init");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  uint64_t v9;
  _TtC13GameOverlayUI20GameOverlayUIService *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v8 = a4;
  swift_unknownObjectRetain(a5, v9);
  v10 = self;
  sub_1000724DC(v8, v11);

  swift_unknownObjectRelease(a5);
}

- (void)dealloc
{
  _TtC13GameOverlayUI20GameOverlayUIService *v2;
  uint64_t v3;

  v2 = self;
  sub_100071F8C((uint64_t)v2, v3);
}

- (void).cxx_destruct
{

}

- (void)presentOnboardingFlowWithGameBundleID:(id)a3 sceneIdentifier:(id)a4
{
  sub_10009AC94(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, sub_10009AD20);
}

- (void)presentActivitySharingRepromptWithRecipientName:(id)a3 sceneIdentifier:(id)a4
{
  sub_10009AC94(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10009AF60);
}

- (void)showMultiplayerUI
{
  sub_1000A88CC(self, (uint64_t)a2, 3);
}

- (void)showTurnBasedMultiplayerUI
{
  sub_1000A88CC(self, (uint64_t)a2, 4);
}

@end
