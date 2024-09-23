@implementation FMFindingLocalizer.DelegateTrampoline

- (_TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&self->owner[OBJC_IVAR____TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline_updateRangeEstimateWatchdogWorkItem) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMFindingLocalizer.DelegateTrampoline();
  return -[FMFindingLocalizer.DelegateTrampoline init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_23A972074((uint64_t)self+ OBJC_IVAR____TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline_delegate);
  swift_release();
}

- (void)didStartRangingOn:(id)a3 withError:(id)a4
{
  sub_23A975A04((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, "🧭 FMFindingLocalizer: Did start ranging on: %s");
}

- (void)didStopRangingOn:(id)a3 withError:(id)a4
{
  sub_23A975A04((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, "🧭 FMFindingLocalizer: Did stop ranging on: %s");
}

- (void)willIntegrateBTRSSI:(id)a3
{
  id v4;
  _TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline *v5;

  v4 = a3;
  v5 = self;
  sub_23A980688(v4);

}

- (void)didUpdateBTProximity:(id)a3
{
  id v4;
  _TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline *v5;

  v4 = a3;
  v5 = self;
  sub_23A975ADC(v4);

}

- (void)didFindItem:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline *v8;
  uint64_t v9;

  v4 = sub_23AA32E1C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23AA32E04();
  v8 = self;
  sub_23A976028((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)didFailWithError:(id)a3 onItem:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline *v11;
  uint64_t v12;

  v6 = sub_23AA32E1C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23AA32E04();
  v10 = a3;
  v11 = self;
  sub_23A97639C(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)invalidPoseDetected
{
  uint64_t v2;
  _TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline *v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *oslog;

  v2 = qword_2569D4AC0;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_23AA32EA0();
  sub_23A9620E8(v4, (uint64_t)qword_2569E0040);
  oslog = sub_23AA32E88();
  v5 = sub_23AA33218();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_23A95E000, oslog, v5, "🧭 FMFindingLocalizer: Invalid pose detected", v6, 2u);
    MEMORY[0x23B85DB24](v6, -1, -1);
  }

}

@end
