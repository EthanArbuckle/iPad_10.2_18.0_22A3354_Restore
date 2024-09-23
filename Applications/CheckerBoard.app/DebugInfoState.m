@implementation DebugInfoState

- (_TtC12CheckerBoard14DebugInfoState)init
{
  return (_TtC12CheckerBoard14DebugInfoState *)sub_100040C68();
}

- (void)dealloc
{
  uint64_t KeyPath;
  uint64_t v4;
  _TtC12CheckerBoard14DebugInfoState *v5;
  objc_super v6;
  _TtC12CheckerBoard14DebugInfoState *v7;

  KeyPath = swift_getKeyPath(&unk_1000560F0);
  v7 = self;
  v4 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  v5 = self;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v7, KeyPath, v4);
  swift_release(KeyPath);
  objc_msgSend(*(id *)((char *)&v5->super.isa + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer), "invalidate");
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for DebugInfoState(0);
  -[DebugInfoState dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->_currentWiFiNetwork[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__currentWiFiNetwork]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->_currentWiFiNetwork[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->_currentWiFiNetwork[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveName]);

  v3 = (char *)self + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState___observationRegistrar;
  v4 = type metadata accessor for ObservationRegistrar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)initialPopulateComplete
{
  _TtC12CheckerBoard14DebugInfoState *v2;

  v2 = self;
  sub_10004240C();

}

- (void)disksAppeared:(id)a3
{
  sub_100042574(self, (uint64_t)a2, (uint64_t)a3, "New disks available from StorageManager. Re-evaluating available external storage", 81);
}

- (void)disksChanged:(id)a3
{
  sub_100042574(self, (uint64_t)a2, (uint64_t)a3, "Disks available from StorageManager have changed. Re-evaluating available external storage", 90);
}

- (void)disksDisappeared:(id)a3
{
  sub_100042574(self, (uint64_t)a2, (uint64_t)a3, "Disks disappeared from StorageManager. Re-evaluating available external storage", 79);
}

@end
