@implementation TipsManager

- (TVRUITipSourceViewProvider)presentingViewController
{
  return (TVRUITipSourceViewProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController));
}

- (void)setPresentingViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController) = (Class)a3;
  v3 = a3;

}

- (UIViewController)tipsViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController));
}

- (void)setTipsViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController) = (Class)a3;
  v3 = a3;

}

- (BOOL)isPresentingTip
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController) != 0;
}

+ (_TtC17TVRemoteUIService11TipsManager)shared
{
  if (one-time initialization token for shared != -1)
    swift_once(&one-time initialization token for shared, one-time initialization function for shared);
  return (_TtC17TVRemoteUIService11TipsManager *)(id)static TipsManager.shared;
}

- (void)invalidate
{
  _TtC17TVRemoteUIService11TipsManager *v2;

  v2 = self;
  TipsManager.invalidate()();

}

- (void)presentTip
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _TtC17TVRemoteUIService11TipsManager *v7;

  v2 = one-time initialization token for log;
  v7 = self;
  if (v2 != -1)
    swift_once(&one-time initialization token for log, one-time initialization function for log);
  v3 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v3, (uint64_t)log);
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Present find my tip", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  TipsManager.setupTipsObserver()();
}

- (void)showTip
{
  _TtC17TVRemoteUIService11TipsManager *v2;

  v2 = self;
  TipsManager.showTip()();

}

- (void)hideTipWithAnimated:(BOOL)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  _TtC17TVRemoteUIService11TipsManager *v8;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100014F98, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ();
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  TipsManager.hideTip(animated:completion:)(a3, v6, v7);
  outlined consume of (@escaping @callee_guaranteed () -> ())?((uint64_t)v6, v7);

}

- (void)updatePresentingViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController) = (Class)a3;
  v3 = a3;

}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  _TtC17TVRemoteUIService11TipsManager *v5;
  uint64_t v6;
  objc_super v7;

  v3 = OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation;
  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation);
  v5 = self;
  if (v4)
  {
    swift_retain(v4);
    Task.cancel()();
    swift_release(v4);
    v6 = *(uint64_t *)((char *)&self->super.isa + v3);
  }
  else
  {
    v6 = 0;
  }
  *(Class *)((char *)&self->super.isa + v3) = 0;
  swift_release(v6);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TipsManager();
  -[TipsManager dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager____lazy_storage___popoverPresentationConductor));
}

- (_TtC17TVRemoteUIService11TipsManager)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tip) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager____lazy_storage___popoverPresentationConductor) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TipsManager();
  return -[TipsManager init](&v3, "init");
}

@end
