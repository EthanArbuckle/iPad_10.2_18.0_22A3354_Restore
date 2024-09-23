@implementation DTTransportDaemon

- (void)homeManagerDidUpdateHomes:(id)a3
{
  sub_23A560960((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))DTTransportDaemon.homeManagerDidUpdateHomes(_:));
}

- (void)homeManagerDidUpdateDataSyncInProgress:(id)a3
{
  sub_23A560960((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))DTTransportDaemon.homeManagerDidUpdateDataSync(inProgress:));
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  id v4;

  v4 = a3;
  swift_retain();
  sub_23A560624(v4, "didUpdateStatus: %{public}s", (uint64_t)&unk_250B6C868, (uint64_t)&unk_2569941E8);
  swift_release();

}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  sub_23A560B00((uint64_t)self, (uint64_t)a2, a3, a4, "HomeKit didAddHome: name%s, id=%s", (uint64_t)&unk_250B6C840, (uint64_t)&unk_2569941D0, (uint64_t)&unk_2569941D8);
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  sub_23A560B00((uint64_t)self, (uint64_t)a2, a3, a4, "HomeKit didRemoveHome: name%s, id=%s", (uint64_t)&unk_250B6C818, (uint64_t)&unk_2569941B8, (uint64_t)&unk_2569941C0);
}

- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4
{
  id v5;

  v5 = a3;
  swift_retain();
  sub_23A56B6A4(a4);
  swift_release();

}

- (void)home:(id)a3 didAddMediaSystem:(id)a4
{
  sub_23A5611F8((uint64_t)self, (uint64_t)a2, a3, a4, (void (*)(id, id))DTTransportDaemon.home(_:didAdd:));
}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  sub_23A5611F8((uint64_t)self, (uint64_t)a2, a3, a4, (void (*)(id, id))DTTransportDaemon.home(_:didRemove:));
}

- (void)siriEndpointProfile:(id)a3 didUpdateSessionHubIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;

  v5 = sub_23A59E260();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A59E23C();
  v9 = a3;
  swift_retain();
  DTTransportDaemon.siriEndpointProfile(_:didUpdateSessionHubIdentifier:)(v9);
  swift_release();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC23DistributedTimersDaemon17DTTransportDaemon)init
{
  _TtC23DistributedTimersDaemon17DTTransportDaemon *result;

  result = (_TtC23DistributedTimersDaemon17DTTransportDaemon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
