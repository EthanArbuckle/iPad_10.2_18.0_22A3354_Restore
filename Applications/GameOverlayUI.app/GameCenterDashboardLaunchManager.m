@implementation GameCenterDashboardLaunchManager

- (void)donePressed:(id)a3
{
  _TtC13GameOverlayUI32GameCenterDashboardLaunchManager *v5;
  uint64_t v6;
  _TtC13GameOverlayUI32GameCenterDashboardLaunchManager *v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3, v6);
    _bridgeAnyObjectToAny(_:)(v11);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v7 = self;
  }
  v8 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13GameOverlayUI32GameCenterDashboardLaunchManager_dismissHandler);
  if (v8)
  {
    v9 = *(_QWORD *)&self->dismissHandler[OBJC_IVAR____TtC13GameOverlayUI32GameCenterDashboardLaunchManager_dismissHandler];
    v10 = swift_retain(v9);
    v8(v10);
    sub_100050580((uint64_t)v8, v9);
  }

  sub_100010ED0((uint64_t)v11, &qword_10010EB30);
}

+ (id)viewControllerWithRequest:(id)a3 game:(id)a4 dismissHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_100100A50, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1000954E4;
  }
  else
  {
    v9 = 0;
  }
  swift_getObjCClassMetadata(a1);
  v10 = a3;
  v11 = a4;
  v12 = sub_100094960(a3, (uint64_t)v8, v9);
  sub_100050580((uint64_t)v8, v9);

  return v12;
}

- (_TtC13GameOverlayUI32GameCenterDashboardLaunchManager)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC13GameOverlayUI32GameCenterDashboardLaunchManager_dismissHandler);
  v4 = (objc_class *)type metadata accessor for GameCenterDashboardLaunchManager();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[GameCenterDashboardLaunchManager init](&v6, "init");
}

- (void).cxx_destruct
{
  sub_100050580(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC13GameOverlayUI32GameCenterDashboardLaunchManager_dismissHandler), *(_QWORD *)&self->dismissHandler[OBJC_IVAR____TtC13GameOverlayUI32GameCenterDashboardLaunchManager_dismissHandler]);
}

@end
