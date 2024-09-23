@implementation ShockwaveEffectViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (_TtC9AirDropUI29ShockwaveEffectViewController)init
{
  _TtC9AirDropUI29ShockwaveEffectViewController *result;

  sub_1000414EC((uint64_t)self, (uint64_t)a2);
  return result;
}

- (_TtC9AirDropUI29ShockwaveEffectViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _TtC9AirDropUI29ShockwaveEffectViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_hasSetInitialState) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_effectState;
  v6 = type metadata accessor for ShockwaveEffectState(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_assetState);
  *v7 = 0;
  v7[1] = 0;
  v8 = a3;

  result = (_TtC9AirDropUI29ShockwaveEffectViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000F05A0, "AirDropUI/ShockwaveEffectView.swift", 35, 2, 55, 0);
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9AirDropUI29ShockwaveEffectViewController *v3;

  if ((*((_BYTE *)&self->super.super.super.isa
        + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_hasSetInitialState) & 1) == 0)
  {
    *((_BYTE *)&self->super.super.super.isa
    + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_hasSetInitialState) = 1;
    v3 = self;
    sub_100041BEC(1);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _TtC9AirDropUI29ShockwaveEffectViewController *v9;

  v3 = qword_10013AD60;
  v9 = self;
  if (v3 != -1)
    swift_once(&qword_10013AD60, sub_100092254);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100009558(v4, (uint64_t)qword_100148040);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Cleaning up haptics after ShockwaveEffectViewController disappeared", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  if (qword_10013AD90 != -1)
    swift_once(&qword_10013AD90, sub_1000CDCC8);
  sub_1000CE3CC();

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC9AirDropUI29ShockwaveEffectViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9AirDropUI29ShockwaveEffectViewController *result;

  v4 = a4;
  result = (_TtC9AirDropUI29ShockwaveEffectViewController *)_swift_stdlib_reportUnimplementedInitializer("AirDropUI.ShockwaveEffectViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_effectAssetView));
  sub_10000CC5C((uint64_t)self + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_effectState, &qword_10013CDF0);
  swift_bridgeObjectRelease(*(_TtC9AirDropUI33AirDropTransferSessionsController **)&self->effectAssetView[OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_assetState], v3, v4, v5, v6, v7, v8, v9);
}

@end
