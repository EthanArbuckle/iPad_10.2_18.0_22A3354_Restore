@implementation _ACSBatteryServiceBookingCoordinator

- (_ACSBatteryServiceBookingCoordinator)init
{
  uint64_t v2;
  id v3;
  char *v4;
  uint64_t v6[5];

  sub_236372D90((uint64_t)&unk_2563DE338, 0, (uint64_t)sub_236372ACC, 0, v6);
  type metadata accessor for UserDefaultsActor();
  v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v2 + 112) = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BatteryServiceOptions()), sel_init);
  v4 = sub_23636DEB0((uint64_t)v6, (uint64_t)sub_23636699C, 0, v2, v3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_ACSBatteryServiceBookingCoordinator *)v4;
}

- (_ACSBatteryServiceBookingCoordinator)initWithOptions:(id)a3
{
  id v3;
  uint64_t v4;
  char *v5;
  uint64_t v7[5];

  v3 = a3;
  sub_236372D90((uint64_t)&unk_2563DE338, 0, (uint64_t)sub_236372ACC, 0, v7);
  type metadata accessor for UserDefaultsActor();
  v4 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v4 + 112) = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v5 = sub_23636DEB0((uint64_t)v7, (uint64_t)sub_23636699C, 0, v4, v3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_ACSBatteryServiceBookingCoordinator *)v5;
}

- (void)prepareBatteryServiceBookingFlowWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE60);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = sub_23637A910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2563DDEB0;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2563DDEB8;
  v13[5] = v12;
  swift_retain();
  sub_23636CB30((uint64_t)v8, (uint64_t)&unk_2563DDEC0, (uint64_t)v13);
  swift_release();
}

- (void)launchBatteryServiceBookingFlowWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE60);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = sub_23637A910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2563DDE70;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2563DDE80;
  v13[5] = v12;
  swift_retain();
  sub_23636CB30((uint64_t)v8, (uint64_t)&unk_2563DDE90, (uint64_t)v13);
  swift_release();
}

@end
