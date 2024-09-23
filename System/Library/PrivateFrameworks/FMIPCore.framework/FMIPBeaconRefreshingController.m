@implementation FMIPBeaconRefreshingController

- (void)refreshTimerFired
{
  sub_1CCB48C70((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1CCB4555C);
}

- (void)handleBeaconsChanged
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v2 = qword_1ED8AA630;
  swift_retain();
  if (v2 != -1)
    swift_once();
  v3 = sub_1CCB637FC();
  sub_1CCA16C20(v3, (uint64_t)qword_1ED8AD7F8);
  v4 = sub_1CCB637D8();
  v5 = sub_1CCB63D48();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CC9BF000, v4, v5, "FMIPBeaconRefreshingController: Beacons changed notification received", v6, 2u);
    MEMORY[0x1D17B214C](v6, -1, -1);
  }

  sub_1CCA014E8(0, 0);
  swift_release();
}

- (void)handleUnknownBeaconsChanged
{
  sub_1CCB48C70((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1CCB48930);
}

@end
