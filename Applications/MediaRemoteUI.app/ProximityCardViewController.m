@implementation ProximityCardViewController

- (void)viewDidLoad
{
  _TtC13MediaRemoteUI27ProximityCardViewController *v2;

  v2 = self;
  sub_10000FE88();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC13MediaRemoteUI27ProximityCardViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  objc_super v9;

  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_deviceName];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  *(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_image] = 0;
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_url];
  v7 = type metadata accessor for URL(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ProximityCardViewController(0);
  return -[ProximityCardViewController initWithContentView:](&v9, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->deviceName[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_deviceName]);

  sub_100010D98((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_url]);
}

@end
