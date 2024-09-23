uint64_t CAFSeatBeltObservable.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable_cachedDescriptionLock;
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v2);
  v3 = OUTLINED_FUNCTION_27();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable_cachedDescription + 8))
  {
    v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable_cachedDescription);
    v5 = *(os_unfair_lock_s **)(v0 + v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    v4 = CAFSeatBeltObservable._description.getter(v3);
    v7 = v6;
    swift_bridgeObjectRetain();
    CAFSeatBeltObservable.cachedDescription.setter(v4, v7);
    v5 = *(os_unfair_lock_s **)(v0 + v1);
  }
  swift_retain();
  os_unfair_lock_unlock(v5 + 4);
  swift_release();
  return v4;
}

void CAFSeatBeltObservable.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  CAFSeatBeltObservable.init(_:)(a1);
  OUTLINED_FUNCTION_11();
}

id CAFSeatBeltObservable.init(_:)(void *a1)
{
  char *v1;
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  objc_super v21;

  v2 = v1;
  v4 = &v1[OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable_cachedDescription];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable_cachedDescriptionLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)&v2[v5] = v6;
  v7 = OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable__vehicleLayoutKey;
  KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFSeatBeltObservable, String>);
  OUTLINED_FUNCTION_127();
  v9 = v2;
  *(_QWORD *)&v2[v7] = specialized SafePublished.init(observedValuekeypath:)(KeyPath);
  v10 = OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable__seatOccupancy;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFSeatBeltObservable, CAFSeatOccupancy?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v9[v10] = v11;
  v12 = OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable__buckleState;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFSeatBeltObservable, CAFLockState?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v9[v12] = v13;
  v14 = OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable__seatBeltIndicator;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFSeatBeltObservable, CAFSeatBeltIndicator>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v9[v14] = v15;
  v16 = OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable__name;
  swift_getKeyPath();
  swift_allocObject();
  v17 = OUTLINED_FUNCTION_16_1();
  *(_QWORD *)&v9[v16] = specialized SafePublished.init(observedValuekeypath:)(v17);
  *(_QWORD *)&v9[OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable_observed] = a1;
  v18 = a1;

  v21.receiver = v9;
  v21.super_class = (Class)type metadata accessor for CAFSeatBeltObservable();
  v19 = objc_msgSendSuper2(&v21, sel_init);
  objc_msgSend(v18, sel_registerObserver_, v19);

  return v19;
}

uint64_t CAFSeatBeltObservable.resetCachedDescription()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v1);
  specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(v2, partial apply for closure #1 in CAFSeatBeltObservable.resetCachedDescription());
  os_unfair_lock_unlock(v1);
  return OUTLINED_FUNCTION_27();
}

id CAFSeatBeltObservable.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable_observed], sel_unregisterObserver_, v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAFSeatBeltObservable();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id CAFSeatBeltObservable.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CAFSeatBeltObservable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id protocol witness for CAFObservable.observed.getter in conformance CAFSeatBeltObservable@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = CAFSeatBeltObservable.observed.getter();
  *a1 = result;
  return result;
}

void protocol witness for CAFObservable.init(_:) in conformance CAFSeatBeltObservable(void **a1)
{
  CAFSeatBeltObservable.__allocating_init(_:)(*a1);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance CAFSeatBeltObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CAFSeatBeltObservable();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t CAFSeatBeltObservable.seatBeltService(_:didUpdateVehicleLayoutKey:)()
{
  return CAFSeatBeltObservable.seatBeltService(_:didUpdateVehicleLayoutKey:)();
}

{
  OUTLINED_FUNCTION_15_1();
  swift_bridgeObjectRetain();
  specialized SafeReadOnlyPublished.value.setter();
  return swift_release();
}

uint64_t CAFSeatBeltObservable.seatBeltService(_:didUpdateSeatOccupancy:)(uint64_t a1, unsigned __int8 a2)
{
  return CAFUIInputDeviceButtonObservable.uIInputDeviceService(_:didUpdateUiInputDevicePurpose:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable__seatOccupancy, (void (*)(_QWORD))specialized SafeReadOnlyPublished.value.setter);
}

uint64_t CAFSeatBeltObservable.seatBeltService(_:didUpdateBuckleState:)(uint64_t a1, unsigned __int8 a2)
{
  return CAFUIInputDeviceButtonObservable.uIInputDeviceService(_:didUpdateUiInputDevicePurpose:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFSeatBeltObservable__buckleState, (void (*)(_QWORD))specialized SafeReadOnlyPublished.value.setter);
}

uint64_t CAFSeatBeltObservable.seatBeltService(_:didUpdateSeatBeltIndicator:)()
{
  OUTLINED_FUNCTION_15_1();
  specialized SafeReadOnlyPublished.value.setter();
  return swift_release();
}

uint64_t CAFSeatBeltObservable.seatBeltService(_:didUpdateName:)()
{
  return CAFSeatBeltObservable.seatBeltService(_:didUpdateVehicleLayoutKey:)();
}

uint64_t CAFSeatBeltObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  result = CAFSeatBeltObservable.resetCachedDescription()();
  if ((a3 & 1) == 0)
    return specialized CAFObservable.notifyChange()(result);
  return result;
}

uint64_t CAFSeatBeltObservable.serviceDidUpdate(_:receivedAllValues:)(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return specialized CAFObservable.notifyChange()();
  return result;
}

void sub_2374AFC04(id *a1@<X0>, uint64_t *a2@<X8>)
{
  key path getter for CAFTemperature.vehicleLayoutKey : CAFTemperature(a1, (SEL *)&selRef_vehicleLayoutKey, a2);
}

void key path getter for CAFSeatBelt.seatOccupancyBridged : CAFSeatBelt(_BYTE *a1@<X8>)
{
  char v2;
  char v3;

  CAFSeatBelt.seatOccupancyBridged.getter();
  *a1 = v2;
  a1[1] = v3 & 1;
}

void key path getter for CAFSeatBelt.buckleStateBridged : CAFSeatBelt(_BYTE *a1@<X8>)
{
  char v2;
  char v3;

  CAFSeatBelt.buckleStateBridged.getter();
  *a1 = v2;
  a1[1] = v3 & 1;
}

char *keypath_get_selector_seatBeltIndicator()
{
  return sel_seatBeltIndicator;
}

id sub_2374AFC94@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_seatBeltIndicator);
  *a2 = (_BYTE)result;
  return result;
}

void sub_2374AFCC4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  key path getter for CAFTemperature.vehicleLayoutKey : CAFTemperature(a1, (SEL *)&selRef_name, a2);
}

uint64_t type metadata accessor for CAFSeatBeltObservable()
{
  return objc_opt_self();
}

void associated type witness table accessor for CAFObserved.Observable : CAFObservable in CAFSeatBelt(uint64_t a1, uint64_t a2)
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(lazy protocol witness table cache variable for type CAFSeatBeltObservable and conformance CAFSeatBeltObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFSeatBeltObservable, (uint64_t)&protocol conformance descriptor for CAFSeatBeltObservable);
}

void associated type witness table accessor for CAFObservable.Observed : CAFObserved in CAFSeatBeltObservable()
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFSeatBelt and conformance CAFSeatBelt, 255, (uint64_t (*)(uint64_t))type metadata accessor for CAFSeatBelt, (uint64_t)&protocol conformance descriptor for CAFSeatBelt);
}

unint64_t type metadata accessor for CAFSeatBelt()
{
  unint64_t result;

  result = lazy cache variable for type metadata for CAFSeatBelt;
  if (!lazy cache variable for type metadata for CAFSeatBelt)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CAFSeatBelt);
  }
  return result;
}

void instantiation function for generic protocol witness table for CAFSeatBeltObservable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFSeatBeltObservable and conformance CAFSeatBeltObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFSeatBeltObservable, (uint64_t)&protocol conformance descriptor for CAFSeatBeltObservable);
  *(_QWORD *)(a1 + 8) = v3;
}

uint64_t method lookup function for CAFSeatBeltObservable()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CAFSeatBeltObservable.vehicleLayoutKey.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CAFSeatBeltObservable.$vehicleLayoutKey.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CAFSeatBeltObservable.seatOccupancy.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))() & 0x1FF;
}

uint64_t dispatch thunk of CAFSeatBeltObservable.$seatOccupancy.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CAFSeatBeltObservable.buckleState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))() & 0x1FF;
}

uint64_t dispatch thunk of CAFSeatBeltObservable.$buckleState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CAFSeatBeltObservable.seatBeltIndicator.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of CAFSeatBeltObservable.$seatBeltIndicator.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of CAFSeatBeltObservable.name.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CAFSeatBeltObservable.$name.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CAFSeatBeltObservable.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t partial apply for closure #1 in CAFSeatBeltObservable.resetCachedDescription()()
{
  return CAFSeatBeltObservable.cachedDescription.setter(0, 0);
}

void OUTLINED_FUNCTION_2_10(uint64_t a1@<X8>)
{
  Swift::String v1;

  v1._object = (void *)((a1 - 32) | 0x8000000000000000);
  v1._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v1);
}

id CAFBatteryLevelObservable.observed.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_observed);
}

uint64_t CAFBatteryLevelObservable.cachedDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_cachedDescription);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t CAFBatteryLevelObservable.batteryLevel.getter()
{
  return CAFBatteryLevelObservable.batteryLevel.getter();
}

{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_observed);
  OUTLINED_FUNCTION_146();
  swift_retain();
  v1 = v3;
  swift_getAtKeyPath();

  OUTLINED_FUNCTION_37();
  return swift_release();
}

void CAFBatteryLevelObservable.$batteryLevel.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable__batteryLevel, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFBatteryLevelObservable.batteryLevelState.getter()
{
  uint64_t v0;
  id v1;
  void *v3;
  unsigned __int8 v4;

  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v3;
  swift_getAtKeyPath();

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37();
  return v4;
}

void CAFBatteryLevelObservable.$batteryLevelState.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable__batteryLevelState, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFBatteryLevelObservable.batteryLevelMarkerLow.getter()
{
  return CAFBatteryLevelObservable.batteryLevel.getter();
}

void CAFBatteryLevelObservable.$batteryLevelMarkerLow.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable__batteryLevelMarkerLow, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFBatteryLevelObservable.batteryLevelMarkerCriticalLow.getter()
{
  return CAFBatteryLevelObservable.batteryLevel.getter();
}

void CAFBatteryLevelObservable.$batteryLevelMarkerCriticalLow.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable__batteryLevelMarkerCriticalLow, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

void key path getter for CAFBatteryLevelObservable.batteryTargetChargeLevel : CAFBatteryLevelObservable(uint64_t a1@<X8>)
{
  CAFBatteryLevelObservable.batteryTargetChargeLevel.getter(a1);
}

void key path setter for CAFBatteryLevelObservable.batteryTargetChargeLevel : CAFBatteryLevelObservable(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  CAFBatteryLevelObservable.batteryTargetChargeLevel.setter((uint64_t)v4);
}

void CAFBatteryLevelObservable.batteryTargetChargeLevel.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  id v3;
  void (*v4)(uint64_t *, _QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  OUTLINED_FUNCTION_15_0();
  v9 = *(id *)(v1 + OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_observed);
  OUTLINED_FUNCTION_146();
  swift_retain();
  v3 = v9;
  v4 = (void (*)(uint64_t *, _QWORD))swift_readAtKeyPath();
  v6 = v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, v6, v7);
  v4(&v8, 0);
  swift_release();
  OUTLINED_FUNCTION_37();

}

void CAFBatteryLevelObservable.batteryTargetChargeLevel.setter(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_143();
  v7 = v6 - v5;
  swift_getKeyPath();
  swift_getKeyPath();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v7, a1, v3);
  v8 = v1;
  specialized static SafePublished.subscript.setter();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  OUTLINED_FUNCTION_72();
}

void (*CAFBatteryLevelObservable.batteryTargetChargeLevel.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  void *v8;
  id v9;
  void (*v10)(void *, _QWORD);
  void (*v11)(void *);

  v3 = malloc(0x80uLL);
  *a1 = v3;
  *((_QWORD *)v3 + 8) = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
  *((_QWORD *)v3 + 9) = v4;
  v5 = *(_QWORD *)(v4 - 8);
  *((_QWORD *)v3 + 10) = v5;
  v6 = *(_QWORD *)(v5 + 64);
  *((_QWORD *)v3 + 11) = malloc(v6);
  v7 = malloc(v6);
  *((_QWORD *)v3 + 12) = v7;
  *((_QWORD *)v3 + 13) = swift_getKeyPath();
  *((_QWORD *)v3 + 14) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  v8 = *(void **)(v1 + OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_observed);
  *((_QWORD *)v3 + 7) = v8;
  swift_retain();
  swift_retain();
  v9 = v8;
  v10 = (void (*)(void *, _QWORD))swift_readAtKeyPath();
  v11 = *(void (**)(void *))(v5 + 16);
  *((_QWORD *)v3 + 15) = v11;
  v11(v7);
  v10(v3, 0);
  swift_release();
  swift_release();

  return CAFBatteryLevelObservable.batteryTargetChargeLevel.modify;
}

void CAFBatteryLevelObservable.batteryTargetChargeLevel.modify(uint64_t *a1, char a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = *(void **)(v2 + 96);
    v5 = *(_QWORD *)(v2 + 80);
    v4 = *(void **)(v2 + 88);
    v7 = *(void **)(v2 + 64);
    v6 = *(_QWORD *)(v2 + 72);
    (*(void (**)(void *, void *, uint64_t))(v2 + 120))(v4, v3, v6);
    v8 = v7;
    OUTLINED_FUNCTION_24_5();
    (*(void (**)(void *, uint64_t))(v5 + 8))(v3, v6);
  }
  else
  {
    v4 = *(void **)(v2 + 88);
    v3 = *(void **)(v2 + 96);
    v9 = *(id *)(v2 + 64);
    OUTLINED_FUNCTION_24_5();
  }
  free(v3);
  free(v4);
  free((void *)v2);
}

uint64_t CAFBatteryLevelObservable.$batteryTargetChargeLevel.getter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_32();
  specialized SafePublished.projectedValue.getter();
  v1 = v0;
  OUTLINED_FUNCTION_25();
  return v1;
}

uint64_t CAFBatteryLevelObservable._description.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  Swift::String v26;
  Swift::String v27;
  Swift::String v28;
  uint64_t v29;
  Swift::String v30;
  Swift::String v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  Swift::String v36;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<CAFUnitPercent>?);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_2_0();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_143();
  v6 = v5 - v4;
  OUTLINED_FUNCTION_7_3(v7, sel_registeredForBatteryLevel);
  v8 = 0x73696765726E753CLL;
  OUTLINED_FUNCTION_18_4();
  if ((_DWORD)v9)
  {
    CAFBatteryLevelObservable.batteryLevel.getter();
    lazy protocol witness table accessor for type Measurement<CAFUnitPercent> and conformance Measurement<A>();
    v8 = OUTLINED_FUNCTION_12_5();
    v0 = v10;
    v9 = OUTLINED_FUNCTION_16_8(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  }
  v33 = v3;
  v36._object = v0;
  v11 = OUTLINED_FUNCTION_7_3(v9, sel_registeredForBatteryLevelState);
  v12 = 0x73696765726E753CLL;
  v13 = (void *)0xEE003E6465726574;
  if ((_DWORD)v11)
  {
    CAFBatteryLevelObservable.batteryLevelState.getter();
    v11 = (id)NSStringFromBatteryLevelState();
    if (v11)
    {
      v0 = v11;
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v13 = v14;

    }
    else
    {
      v13 = (void *)0xE900000000000029;
      v12 = 0x6E776F6E6B6E7528;
    }
  }
  v36._countAndFlagsBits = v8;
  OUTLINED_FUNCTION_7_3((uint64_t)v11, sel_registeredForBatteryLevelMarkerLow);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_18_4();
  if ((_DWORD)v15)
  {
    CAFBatteryLevelObservable.batteryLevelMarkerLow.getter();
    v15 = OUTLINED_FUNCTION_18_5();
    v16 = v15;
    v0 = v17;
  }
  v35 = v16;
  OUTLINED_FUNCTION_7_3(v15, sel_registeredForBatteryLevelMarkerCriticalLow);
  OUTLINED_FUNCTION_2_4();
  v20 = (void *)0xEE003E6465726574;
  if ((_DWORD)v18)
  {
    CAFBatteryLevelObservable.batteryLevelMarkerCriticalLow.getter();
    v18 = OUTLINED_FUNCTION_18_5();
    v19 = v18;
    v20 = v21;
  }
  v34 = v19;
  v22 = (void *)0xEE003E6465726574;
  v23 = 0x73696765726E753CLL;
  if (OUTLINED_FUNCTION_7_3(v18, sel_registeredForBatteryTargetChargeLevel))
  {
    CAFBatteryLevelObservable.batteryTargetChargeLevel.getter(v6);
    lazy protocol witness table accessor for type Measurement<CAFUnitPercent> and conformance Measurement<A>();
    v23 = OUTLINED_FUNCTION_12_5();
    v22 = v24;
    OUTLINED_FUNCTION_16_8(*(uint64_t (**)(uint64_t, uint64_t))(v33 + 8));
  }
  _StringGuts.grow(_:)(167);
  OUTLINED_FUNCTION_15_6(v25, 0x80000002374E41F0);
  _print_unlocked<A, B>(_:_:)();
  OUTLINED_FUNCTION_128(0xD000000000000011, (uint64_t)" { batteryLevel: ");
  String.append(_:)(v36);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_128(0xD000000000000015, (uint64_t)", batteryLevelState: ");
  v26._countAndFlagsBits = v12;
  v26._object = v13;
  String.append(_:)(v26);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_128(0xD000000000000019, (uint64_t)", batteryLevelMarkerLow: ");
  v27._countAndFlagsBits = v35;
  v27._object = v0;
  String.append(_:)(v27);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_128(0xD000000000000021, (uint64_t)", batteryLevelMarkerCriticalLow: ");
  v28._countAndFlagsBits = v34;
  v28._object = v20;
  String.append(_:)(v28);
  v29 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_6(v29, 0x80000002374E42A0);
  v30._countAndFlagsBits = v23;
  v30._object = v22;
  String.append(_:)(v30);
  swift_bridgeObjectRelease();
  v31._countAndFlagsBits = 4095264;
  v31._object = (void *)0xE300000000000000;
  String.append(_:)(v31);
  return 0;
}

uint64_t CAFBatteryLevelObservable.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_cachedDescriptionLock;
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v2);
  OUTLINED_FUNCTION_27();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_cachedDescription + 8))
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_cachedDescription);
    v4 = *(os_unfair_lock_s **)(v0 + v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    v3 = CAFBatteryLevelObservable._description.getter();
    v6 = v5;
    swift_bridgeObjectRetain();
    CAFBatteryLevelObservable.cachedDescription.setter(v3, v6);
    v4 = *(os_unfair_lock_s **)(v0 + v1);
  }
  OUTLINED_FUNCTION_32();
  os_unfair_lock_unlock(v4 + 4);
  OUTLINED_FUNCTION_25();
  return v3;
}

void CAFBatteryLevelObservable.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  CAFBatteryLevelObservable.init(_:)(a1);
  OUTLINED_FUNCTION_11();
}

id CAFBatteryLevelObservable.init(_:)(void *a1)
{
  char *v1;
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  objc_super v21;

  v2 = v1;
  v4 = &v1[OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_cachedDescription];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_cachedDescriptionLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)&v2[v5] = v6;
  v7 = OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable__batteryLevel;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFBatteryLevelObservable, Measurement<CAFUnitPercent>>);
  OUTLINED_FUNCTION_127();
  v8 = v2;
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v2[v7] = v9;
  v10 = OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable__batteryLevelState;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFBatteryLevelObservable, CAFBatteryLevelState>);
  OUTLINED_FUNCTION_127();
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v8[v10] = v11;
  v12 = OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable__batteryLevelMarkerLow;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFBatteryLevelObservable, Measurement<CAFUnitPercent>?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_13_9();
  *(_QWORD *)&v8[v12] = v13;
  v14 = OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable__batteryLevelMarkerCriticalLow;
  swift_getKeyPath();
  swift_allocObject();
  OUTLINED_FUNCTION_13_9();
  *(_QWORD *)&v8[v14] = v15;
  v16 = OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable__batteryTargetChargeLevel;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SafePublished<CAFBatteryLevelObservable, Measurement<CAFUnitPercent>>);
  OUTLINED_FUNCTION_127();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v8[v16] = v17;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_observed] = a1;
  v18 = a1;

  v21.receiver = v8;
  v21.super_class = (Class)type metadata accessor for CAFBatteryLevelObservable();
  v19 = objc_msgSendSuper2(&v21, sel_init);
  objc_msgSend(v18, sel_registerObserver_, v19);

  return v19;
}

uint64_t CAFBatteryLevelObservable.resetCachedDescription()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v1);
  specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(v2, partial apply for closure #1 in CAFBatteryLevelObservable.resetCachedDescription());
  os_unfair_lock_unlock(v1);
  return OUTLINED_FUNCTION_27();
}

id CAFBatteryLevelObservable.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable_observed], sel_unregisterObserver_, v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAFBatteryLevelObservable();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id CAFBatteryLevelObservable.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CAFBatteryLevelObservable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void protocol witness for CAFObservable.observed.getter in conformance CAFBatteryLevelObservable(id *a1@<X8>)
{
  *a1 = CAFBatteryLevelObservable.observed.getter();
  OUTLINED_FUNCTION_11();
}

void protocol witness for CAFObservable.init(_:) in conformance CAFBatteryLevelObservable(void **a1)
{
  CAFBatteryLevelObservable.__allocating_init(_:)(*a1);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance CAFBatteryLevelObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CAFBatteryLevelObservable();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevel:)(uint64_t a1, uint64_t a2)
{
  return CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevel:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable__batteryLevel, specialized SafeReadOnlyPublished.setValue(_:));
}

uint64_t CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevelState:)()
{
  OUTLINED_FUNCTION_32();
  specialized SafeReadOnlyPublished.value.setter();
  return swift_release();
}

uint64_t CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevelMarkerLow:)(uint64_t a1, uint64_t a2)
{
  return CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevel:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable__batteryLevelMarkerLow, specialized SafeReadOnlyPublished.setValue(_:));
}

uint64_t CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevelMarkerCriticalLow:)(uint64_t a1, uint64_t a2)
{
  return CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevel:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFBatteryLevelObservable__batteryLevelMarkerCriticalLow, specialized SafeReadOnlyPublished.setValue(_:));
}

uint64_t CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevel:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  OUTLINED_FUNCTION_32();
  a4(a2);
  return swift_release();
}

uint64_t @objc CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevelMarkerLow:)(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<CAFUnitPercent>?);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_143();
  v13 = v12 - v11;
  if (a4)
  {
    OUTLINED_FUNCTION_98(v10, &lazy cache variable for type metadata for CAFUnitPercent);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
    v15 = v13;
    v16 = 0;
  }
  else
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
    v15 = v13;
    v16 = 1;
  }
  __swift_storeEnumTagSinglePayload(v15, v16, 1, v14);
  v17 = a3;
  v18 = a1;
  a5();

  return outlined destroy of Measurement<CAFUnitPercent>?(v13);
}

uint64_t CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryTargetChargeLevel:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_32();
  specialized SafePublished.setValue(_:)(a2);
  return OUTLINED_FUNCTION_25();
}

void @objc CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevel:)(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_98(v11, &lazy cache variable for type metadata for CAFUnitPercent);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = a3;
  v13 = a1;
  a5();

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v5, v9);
  OUTLINED_FUNCTION_72();
}

void CAFBatteryLevelObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;

  v4 = CAFBatteryLevelObservable.resetCachedDescription()();
  if ((a3 & 1) != 0)
    OUTLINED_FUNCTION_11();
  else
    specialized CAFObservable.notifyChange()(v4);
}

uint64_t CAFBatteryLevelObservable.serviceDidUpdate(_:receivedAllValues:)(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return specialized CAFObservable.notifyChange()();
  return result;
}

void sub_2374B12A8(uint64_t a1@<X8>)
{
  CAFBatteryLevelObservable.batteryTargetChargeLevel.getter(a1);
  OUTLINED_FUNCTION_11();
}

char *keypath_get_selector_batteryLevel()
{
  return sel_batteryLevel;
}

void sub_2374B12D4(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFBatteryLevel.batteryLevel : CAFBatteryLevel(a1, a2, a3, (SEL *)&selRef_batteryLevel);
}

char *keypath_get_selector_batteryLevelState()
{
  return sel_batteryLevelState;
}

void sub_2374B12FC(id *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = objc_msgSend(*a1, sel_batteryLevelState);
  OUTLINED_FUNCTION_11();
}

char *keypath_get_selector_batteryLevelMarkerLow()
{
  return sel_batteryLevelMarkerLow;
}

uint64_t sub_2374B1334(id *a1, uint64_t a2, uint64_t a3)
{
  return key path getter for CAFBatteryLevel.batteryLevelMarkerLow : CAFBatteryLevel(a1, a2, a3, (SEL *)&selRef_batteryLevelMarkerLow);
}

char *keypath_get_selector_batteryLevelMarkerCriticalLow()
{
  return sel_batteryLevelMarkerCriticalLow;
}

uint64_t key path getter for CAFBatteryLevel.batteryLevelMarkerLow : CAFBatteryLevel(id *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_25_4(a1, a2, a3, a4);
  if (v5)
  {
    v6 = v5;
    OUTLINED_FUNCTION_98((uint64_t)v5, &lazy cache variable for type metadata for CAFUnitPercent);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
  return __swift_storeEnumTagSinglePayload(v4, v7, 1, v8);
}

uint64_t sub_2374B13D8(id *a1, uint64_t a2, uint64_t a3)
{
  return key path getter for CAFBatteryLevel.batteryLevelMarkerLow : CAFBatteryLevel(a1, a2, a3, (SEL *)&selRef_batteryLevelMarkerCriticalLow);
}

char *keypath_get_selector_batteryTargetChargeLevel()
{
  return sel_batteryTargetChargeLevel;
}

void key path getter for CAFBatteryLevel.batteryLevel : CAFBatteryLevel(id *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  id v4;

  v4 = OUTLINED_FUNCTION_25_4(a1, a2, a3, a4);
  OUTLINED_FUNCTION_98((uint64_t)v4, &lazy cache variable for type metadata for CAFUnitPercent);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

}

void sub_2374B1458(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFBatteryLevel.batteryLevel : CAFBatteryLevel(a1, a2, a3, (SEL *)&selRef_batteryTargetChargeLevel);
}

void key path setter for CAFBatteryLevel.batteryTargetChargeLevel : CAFBatteryLevel(uint64_t a1, void **a2)
{
  void *v2;
  Class isa;
  NSMeasurement v4;

  v2 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
  v4 = Measurement._bridgeToObjectiveC()();
  isa = v4.super.isa;
  objc_msgSend(v2, sel_setBatteryTargetChargeLevel_, v4.super.isa, v4._doubleValue);

}

uint64_t type metadata accessor for CAFBatteryLevelObservable()
{
  return objc_opt_self();
}

void associated type witness table accessor for CAFObserved.Observable : CAFObservable in CAFBatteryLevel()
{
  lazy protocol witness table accessor for type CAFBatteryLevelObservable and conformance CAFBatteryLevelObservable(&lazy protocol witness table cache variable for type CAFBatteryLevelObservable and conformance CAFBatteryLevelObservable, (uint64_t)&protocol conformance descriptor for CAFBatteryLevelObservable);
}

unint64_t lazy protocol witness table accessor for type CAFBatteryLevel and conformance CAFBatteryLevel()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type CAFBatteryLevel and conformance CAFBatteryLevel;
  if (!lazy protocol witness table cache variable for type CAFBatteryLevel and conformance CAFBatteryLevel)
  {
    v1 = type metadata accessor for CAFTemperature(255, &lazy cache variable for type metadata for CAFBatteryLevel);
    result = MEMORY[0x23B812308](&protocol conformance descriptor for CAFBatteryLevel, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CAFBatteryLevel and conformance CAFBatteryLevel);
  }
  return result;
}

void instantiation function for generic protocol witness table for CAFBatteryLevelObservable(uint64_t a1)
{
  uint64_t v2;

  lazy protocol witness table accessor for type CAFBatteryLevelObservable and conformance CAFBatteryLevelObservable(&lazy protocol witness table cache variable for type CAFBatteryLevelObservable and conformance CAFBatteryLevelObservable, (uint64_t)&protocol conformance descriptor for CAFBatteryLevelObservable);
  *(_QWORD *)(a1 + 8) = v2;
}

void lazy protocol witness table accessor for type CAFBatteryLevelObservable and conformance CAFBatteryLevelObservable(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = type metadata accessor for CAFBatteryLevelObservable();
    atomic_store(MEMORY[0x23B812308](a2, v4), a1);
  }
  OUTLINED_FUNCTION_11();
}

uint64_t method lookup function for CAFBatteryLevelObservable()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.$batteryLevel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.batteryLevelState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.$batteryLevelState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.batteryLevelMarkerLow.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.$batteryLevelMarkerLow.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.batteryLevelMarkerCriticalLow.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.$batteryLevelMarkerCriticalLow.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.batteryTargetChargeLevel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.batteryTargetChargeLevel.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.batteryTargetChargeLevel.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.$batteryTargetChargeLevel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t outlined destroy of Measurement<CAFUnitPercent>?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<CAFUnitPercent>?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t partial apply for closure #1 in CAFBatteryLevelObservable.resetCachedDescription()()
{
  return CAFBatteryLevelObservable.cachedDescription.setter(0, 0);
}

unint64_t lazy protocol witness table accessor for type Measurement<CAFUnitPercent> and conformance Measurement<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type Measurement<CAFUnitPercent> and conformance Measurement<A>;
  if (!lazy protocol witness table cache variable for type Measurement<CAFUnitPercent> and conformance Measurement<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
    result = MEMORY[0x23B812308](MEMORY[0x24BDCB5E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Measurement<CAFUnitPercent> and conformance Measurement<A>);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

void OUTLINED_FUNCTION_13_9()
{
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
}

void OUTLINED_FUNCTION_15_6(uint64_t a1, uint64_t a2)
{
  unint64_t v2;

  v2 = 0xD00000000000001CLL;
  String.append(_:)(*(Swift::String *)(&a2 - 1));
}

uint64_t OUTLINED_FUNCTION_16_8@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_18_5()
{
  return String.init<A>(describing:)();
}

uint64_t OUTLINED_FUNCTION_24_5()
{
  return specialized static SafePublished.subscript.setter();
}

id CAFTypeTestObservable.observed.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
}

uint64_t CAFTypeTestObservable.cachedDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_cachedDescription);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t key path getter for CAFTypeTestObservable.testBool : CAFTypeTestObservable@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testBool.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testBool : CAFTypeTestObservable(unsigned __int8 *a1)
{
  return CAFTypeTestObservable.testBool.setter(*a1);
}

uint64_t CAFTypeTestObservable.testBool.getter()
{
  uint64_t v0;
  id v1;
  uint64_t (*v2)(uint64_t, _QWORD);
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14[4];
  void *v15;

  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_100_0();
  v15 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v15;
  v2 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_16_0();
  v4 = *v3;
  OUTLINED_FUNCTION_14_0((uint64_t)v14, v2);
  OUTLINED_FUNCTION_37();
  v5 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_129(v5, v6, v7, v8, v9, v10, v11, v12, v14[0], v14[1], v14[2], v14[3], v15);
  return v4;
}

uint64_t CAFTypeTestObservable.testBool.setter(uint64_t a1)
{
  void *v1;
  uint64_t KeyPath;
  uint64_t v4;

  KeyPath = swift_getKeyPath();
  v4 = swift_getKeyPath();
  return specialized static SafePublished.subscript.setter(a1, v1, KeyPath, v4);
}

void CAFTypeTestObservable.testBool.modify()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t (*v4)(uint64_t, _QWORD);
  char *v5;
  char v6;

  v2 = OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_22_1((uint64_t)v2);
  *(_QWORD *)(v0 + 72) = swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_6_1(OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_33_3();
  v3 = v1;
  v4 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_18_1();
  v6 = *v5;
  OUTLINED_FUNCTION_25_5(v4);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_41_2();
  *(_BYTE *)(v0 + 88) = v6;
  OUTLINED_FUNCTION_81();
}

void CAFTypeTestObservable.testBool.modify(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  specialized static SafePublished.subscript.setter(*(unsigned __int8 *)(*(_QWORD *)a1 + 88), *(id *)(*(_QWORD *)a1 + 64), *(_QWORD *)(*(_QWORD *)a1 + 72), *(_QWORD *)(*(_QWORD *)a1 + 80));
  free(v1);
}

uint64_t CAFTypeTestObservable.$testBool.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testBool, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void key path getter for CAFTypeTestObservable.testUInt8 : CAFTypeTestObservable(_BYTE *a1@<X8>)
{
  char v2;
  char v3;

  CAFTypeTestObservable.testUInt8.getter();
  *a1 = v2;
  a1[1] = v3 & 1;
}

void key path setter for CAFTypeTestObservable.testUInt8 : CAFTypeTestObservable(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt8 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(_QWORD))CAFTypeTestObservable.testUInt8.setter);
}

void CAFTypeTestObservable.testUInt8.getter()
{
  CAFTypeTestObservable.testUInt8.getter();
}

{
  uint64_t v0;
  id v1;
  uint64_t (*v2)(uint64_t, _QWORD);
  _BYTE v3[32];
  id v4;

  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_100_0();
  v4 = *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v4;
  v2 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_102_0();
  OUTLINED_FUNCTION_14_0((uint64_t)v3, v2);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_27();

  OUTLINED_FUNCTION_101_0();
}

uint64_t CAFTypeTestObservable.testUInt8.setter()
{
  return CAFTypeTestMultiObservable.testUInt8.setter();
}

void CAFTypeTestObservable.testUInt8.modify()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t (*v4)(uint64_t, _QWORD);
  char *v5;
  char v6;
  char v7;

  v2 = OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_22_1((uint64_t)v2);
  *(_QWORD *)(v0 + 72) = swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_6_1(OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_33_3();
  v3 = v1;
  v4 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_18_1();
  v6 = *v5;
  v7 = v5[1];
  OUTLINED_FUNCTION_25_5(v4);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_41_2();
  *(_BYTE *)(v0 + 88) = v6;
  *(_BYTE *)(v0 + 89) = v7;
  OUTLINED_FUNCTION_81();
}

{
  CAFTypeTestMultiObservable.testUInt8.modify();
}

uint64_t CAFTypeTestObservable.$testUInt8.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testUInt8, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void key path getter for CAFTypeTestObservable.testUInt16 : CAFTypeTestObservable(uint64_t a1@<X8>)
{
  __int16 v2;
  char v3;

  CAFTypeTestObservable.testUInt16.getter();
  *(_WORD *)a1 = v2;
  *(_BYTE *)(a1 + 2) = v3 & 1;
}

void key path setter for CAFTypeTestObservable.testUInt16 : CAFTypeTestObservable(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt16 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(_QWORD))CAFTypeTestObservable.testUInt16.setter);
}

void CAFTypeTestObservable.testUInt16.getter()
{
  CAFTypeTestObservable.testUInt16.getter();
}

{
  uint64_t v0;
  id v1;
  uint64_t (*v2)(uint64_t, _QWORD);
  _BYTE v3[32];
  id v4;

  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_100_0();
  v4 = *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v4;
  v2 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_102_0();
  OUTLINED_FUNCTION_14_0((uint64_t)v3, v2);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_27();

  OUTLINED_FUNCTION_101_0();
}

uint64_t CAFTypeTestObservable.testUInt16.setter()
{
  return CAFTypeTestMultiObservable.testUInt16.setter();
}

void CAFTypeTestObservable.testUInt16.modify()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t (*v4)(uint64_t, _QWORD);
  __int16 *v5;
  __int16 v6;
  char v7;

  v2 = OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_22_1((uint64_t)v2);
  *(_QWORD *)(v0 + 72) = swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_6_1(OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_33_3();
  v3 = v1;
  v4 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_18_1();
  v6 = *v5;
  v7 = *((_BYTE *)v5 + 2);
  OUTLINED_FUNCTION_25_5(v4);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_41_2();
  *(_WORD *)(v0 + 88) = v6;
  *(_BYTE *)(v0 + 90) = v7;
  OUTLINED_FUNCTION_81();
}

{
  CAFTypeTestMultiObservable.testUInt16.modify();
}

uint64_t CAFTypeTestObservable.$testUInt16.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testUInt16, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

unint64_t key path getter for CAFTypeTestObservable.testUInt32 : CAFTypeTestObservable@<X0>(uint64_t a1@<X8>)
{
  unint64_t result;

  result = CAFTypeTestObservable.testUInt32.getter();
  *(_DWORD *)a1 = result;
  *(_BYTE *)(a1 + 4) = BYTE4(result) & 1;
  return result;
}

void key path setter for CAFTypeTestObservable.testUInt32 : CAFTypeTestObservable(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt32 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(unint64_t))CAFTypeTestObservable.testUInt32.setter);
}

unint64_t CAFTypeTestObservable.testUInt32.getter()
{
  return CAFTypeTestObservable.testUInt32.getter();
}

{
  uint64_t v0;
  id v1;
  uint64_t (*v2)(uint64_t, _QWORD);
  unsigned int *v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15[4];
  void *v16;

  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_100_0();
  v16 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v16;
  v2 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_16_0();
  v4 = *v3;
  v5 = *((_BYTE *)v3 + 4);
  OUTLINED_FUNCTION_14_0((uint64_t)v15, v2);
  OUTLINED_FUNCTION_37();
  v6 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_129(v6, v7, v8, v9, v10, v11, v12, v13, v15[0], v15[1], v15[2], v15[3], v16);
  return v4 | ((unint64_t)v5 << 32);
}

uint64_t CAFTypeTestObservable.testUInt32.setter()
{
  return CAFTypeTestMultiObservable.testUInt32.setter();
}

void CAFTypeTestObservable.testUInt32.modify()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t (*v4)(uint64_t, _QWORD);
  int *v5;
  int v6;
  char v7;

  v2 = OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_22_1((uint64_t)v2);
  *(_QWORD *)(v0 + 72) = swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_6_1(OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_33_3();
  v3 = v1;
  v4 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_18_1();
  v6 = *v5;
  v7 = *((_BYTE *)v5 + 4);
  OUTLINED_FUNCTION_25_5(v4);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_41_2();
  *(_DWORD *)(v0 + 88) = v6;
  *(_BYTE *)(v0 + 92) = v7;
  OUTLINED_FUNCTION_81();
}

{
  CAFTypeTestMultiObservable.testUInt32.modify();
}

uint64_t CAFTypeTestObservable.$testUInt32.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testUInt32, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testUInt64 : CAFTypeTestObservable@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = CAFTypeTestObservable.testUInt64.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testUInt64 : CAFTypeTestObservable()
{
  return CAFTypeTestObservable.testUInt64.setter();
}

uint64_t CAFTypeTestObservable.testUInt64.getter()
{
  return CAFTypeTestObservable.testUInt64.getter();
}

{
  uint64_t v0;
  id v1;
  uint64_t (*v2)(uint64_t, _QWORD);
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14[4];
  void *v15;

  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_100_0();
  v15 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v15;
  v2 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_16_0();
  v4 = *v3;
  OUTLINED_FUNCTION_14_0((uint64_t)v14, v2);
  OUTLINED_FUNCTION_37();
  v5 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_129(v5, v6, v7, v8, v9, v10, v11, v12, v14[0], v14[1], v14[2], v14[3], v15);
  return v4;
}

uint64_t CAFTypeTestObservable.testUInt64.setter()
{
  return CAFTypeTestMultiObservable.testUInt64.setter();
}

void CAFTypeTestObservable.testUInt64.modify()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t (*v5)(uint64_t, _QWORD);
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v2 = OUTLINED_FUNCTION_128_0();
  OUTLINED_FUNCTION_127_0((uint64_t)v2);
  *(_QWORD *)(v0 + 88) = swift_getKeyPath();
  *(_QWORD *)(v0 + 96) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_45_1();
  v3 = *(void **)(v1 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  *(_QWORD *)(v0 + 72) = v3;
  OUTLINED_FUNCTION_146();
  OUTLINED_FUNCTION_33_3();
  v4 = v3;
  v5 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_18_1();
  v7 = *v6;
  v8 = *((_BYTE *)v6 + 8);
  OUTLINED_FUNCTION_25_5(v5);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_41_2();
  *(_QWORD *)(v0 + 56) = v7;
  *(_BYTE *)(v0 + 64) = v8;
  OUTLINED_FUNCTION_81();
}

void CAFTypeTestObservable.testUInt64.modify(uint64_t a1, uint64_t a2)
{
  CAFTypeTestMultiObservable.testUInt64.modify(a1, a2, (void (*)(_QWORD, _QWORD, id, _QWORD, _QWORD))specialized static SafePublished.subscript.setter);
}

uint64_t CAFTypeTestObservable.$testUInt64.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testUInt64, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void key path getter for CAFTypeTestObservable.testInt8 : CAFTypeTestObservable(_BYTE *a1@<X8>)
{
  char v2;
  char v3;

  CAFTypeTestObservable.testInt8.getter();
  *a1 = v2;
  a1[1] = v3 & 1;
}

void key path setter for CAFTypeTestObservable.testInt8 : CAFTypeTestObservable(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt8 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(_QWORD))CAFTypeTestObservable.testInt8.setter);
}

void CAFTypeTestObservable.testInt8.getter()
{
  CAFTypeTestObservable.testUInt8.getter();
}

uint64_t CAFTypeTestObservable.testInt8.setter()
{
  return CAFTypeTestMultiObservable.testUInt8.setter();
}

void CAFTypeTestObservable.testInt8.modify()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t (*v4)(uint64_t, _QWORD);
  char *v5;
  char v6;
  char v7;

  v2 = OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_22_1((uint64_t)v2);
  *(_QWORD *)(v0 + 72) = swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_6_1(OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_33_3();
  v3 = v1;
  v4 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_18_1();
  v6 = *v5;
  v7 = v5[1];
  OUTLINED_FUNCTION_25_5(v4);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_41_2();
  *(_BYTE *)(v0 + 88) = v6;
  *(_BYTE *)(v0 + 89) = v7;
  OUTLINED_FUNCTION_81();
}

{
  CAFTypeTestMultiObservable.testUInt8.modify();
}

uint64_t CAFTypeTestObservable.$testInt8.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testInt8, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void key path getter for CAFTypeTestObservable.testInt16 : CAFTypeTestObservable(uint64_t a1@<X8>)
{
  __int16 v2;
  char v3;

  CAFTypeTestObservable.testInt16.getter();
  *(_WORD *)a1 = v2;
  *(_BYTE *)(a1 + 2) = v3 & 1;
}

void key path setter for CAFTypeTestObservable.testInt16 : CAFTypeTestObservable(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt16 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(_QWORD))CAFTypeTestObservable.testInt16.setter);
}

void CAFTypeTestObservable.testInt16.getter()
{
  CAFTypeTestObservable.testUInt16.getter();
}

uint64_t CAFTypeTestObservable.testInt16.setter()
{
  return CAFTypeTestMultiObservable.testUInt16.setter();
}

void CAFTypeTestObservable.testInt16.modify()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t (*v4)(uint64_t, _QWORD);
  __int16 *v5;
  __int16 v6;
  char v7;

  v2 = OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_22_1((uint64_t)v2);
  *(_QWORD *)(v0 + 72) = swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_6_1(OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_33_3();
  v3 = v1;
  v4 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_18_1();
  v6 = *v5;
  v7 = *((_BYTE *)v5 + 2);
  OUTLINED_FUNCTION_25_5(v4);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_41_2();
  *(_WORD *)(v0 + 88) = v6;
  *(_BYTE *)(v0 + 90) = v7;
  OUTLINED_FUNCTION_81();
}

{
  CAFTypeTestMultiObservable.testUInt16.modify();
}

uint64_t CAFTypeTestObservable.$testInt16.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testInt16, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

unint64_t key path getter for CAFTypeTestObservable.testInt32 : CAFTypeTestObservable@<X0>(uint64_t a1@<X8>)
{
  unint64_t result;

  result = CAFTypeTestObservable.testInt32.getter();
  *(_DWORD *)a1 = result;
  *(_BYTE *)(a1 + 4) = BYTE4(result) & 1;
  return result;
}

void key path setter for CAFTypeTestObservable.testInt32 : CAFTypeTestObservable(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt32 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(unint64_t))CAFTypeTestObservable.testInt32.setter);
}

unint64_t CAFTypeTestObservable.testInt32.getter()
{
  return CAFTypeTestObservable.testUInt32.getter();
}

uint64_t CAFTypeTestObservable.testInt32.setter()
{
  return CAFTypeTestMultiObservable.testUInt32.setter();
}

void CAFTypeTestObservable.testInt32.modify()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t (*v4)(uint64_t, _QWORD);
  int *v5;
  int v6;
  char v7;

  v2 = OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_22_1((uint64_t)v2);
  *(_QWORD *)(v0 + 72) = swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_6_1(OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_33_3();
  v3 = v1;
  v4 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_18_1();
  v6 = *v5;
  v7 = *((_BYTE *)v5 + 4);
  OUTLINED_FUNCTION_25_5(v4);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_41_2();
  *(_DWORD *)(v0 + 88) = v6;
  *(_BYTE *)(v0 + 92) = v7;
  OUTLINED_FUNCTION_81();
}

{
  CAFTypeTestMultiObservable.testUInt32.modify();
}

uint64_t CAFTypeTestObservable.$testInt32.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testInt32, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testInt64 : CAFTypeTestObservable@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = CAFTypeTestObservable.testInt64.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testInt64 : CAFTypeTestObservable()
{
  return CAFTypeTestObservable.testInt64.setter();
}

uint64_t CAFTypeTestObservable.testInt64.getter()
{
  return CAFTypeTestObservable.testUInt64.getter();
}

uint64_t CAFTypeTestObservable.testInt64.setter()
{
  return CAFTypeTestMultiObservable.testUInt64.setter();
}

void CAFTypeTestObservable.testInt64.modify()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t (*v5)(uint64_t, _QWORD);
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v2 = OUTLINED_FUNCTION_128_0();
  OUTLINED_FUNCTION_127_0((uint64_t)v2);
  *(_QWORD *)(v0 + 88) = swift_getKeyPath();
  *(_QWORD *)(v0 + 96) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_45_1();
  v3 = *(void **)(v1 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  *(_QWORD *)(v0 + 72) = v3;
  OUTLINED_FUNCTION_146();
  OUTLINED_FUNCTION_33_3();
  v4 = v3;
  v5 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_18_1();
  v7 = *v6;
  v8 = *((_BYTE *)v6 + 8);
  OUTLINED_FUNCTION_25_5(v5);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_41_2();
  *(_QWORD *)(v0 + 56) = v7;
  *(_BYTE *)(v0 + 64) = v8;
  OUTLINED_FUNCTION_81();
}

void CAFTypeTestObservable.testInt64.modify(uint64_t a1, uint64_t a2)
{
  CAFTypeTestMultiObservable.testUInt64.modify(a1, a2, (void (*)(_QWORD, _QWORD, id, _QWORD, _QWORD))specialized static SafePublished.subscript.setter);
}

uint64_t CAFTypeTestObservable.$testInt64.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testInt64, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

unint64_t key path getter for CAFTypeTestObservable.testFloat : CAFTypeTestObservable@<X0>(uint64_t a1@<X8>)
{
  unint64_t result;

  result = CAFTypeTestObservable.testFloat.getter();
  *(_DWORD *)a1 = result;
  *(_BYTE *)(a1 + 4) = BYTE4(result) & 1;
  return result;
}

void key path setter for CAFTypeTestObservable.testFloat : CAFTypeTestObservable(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt32 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(unint64_t))CAFTypeTestObservable.testFloat.setter);
}

unint64_t CAFTypeTestObservable.testFloat.getter()
{
  return CAFTypeTestObservable.testUInt32.getter();
}

uint64_t CAFTypeTestObservable.testFloat.setter()
{
  return CAFTypeTestMultiObservable.testUInt32.setter();
}

void CAFTypeTestObservable.testFloat.modify()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t (*v4)(uint64_t, _QWORD);
  int *v5;
  int v6;
  char v7;

  v2 = OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_22_1((uint64_t)v2);
  *(_QWORD *)(v0 + 72) = swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_6_1(OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_33_3();
  v3 = v1;
  v4 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_18_1();
  v6 = *v5;
  v7 = *((_BYTE *)v5 + 4);
  OUTLINED_FUNCTION_25_5(v4);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_41_2();
  *(_DWORD *)(v0 + 88) = v6;
  *(_BYTE *)(v0 + 92) = v7;
  OUTLINED_FUNCTION_81();
}

{
  CAFTypeTestMultiObservable.testUInt32.modify();
}

uint64_t CAFTypeTestObservable.$testFloat.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testFloat, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void key path getter for CAFTypeTestObservable.testString : CAFTypeTestObservable(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CAFTypeTestObservable.testString.getter();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t key path setter for CAFTypeTestObservable.testString : CAFTypeTestObservable()
{
  swift_bridgeObjectRetain();
  return CAFTypeTestObservable.testString.setter();
}

void CAFTypeTestObservable.testString.getter()
{
  void *v0;

  swift_getKeyPath();
  swift_getKeyPath();
  specialized static SafePublished.subscript.getter(v0);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.testString.setter()
{
  return CAFTypeTestMultiObservable.testString.setter();
}

void CAFTypeTestObservable.testString.modify()
{
  _QWORD *v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_126_0();
  *v0 = v2;
  v2[2] = v1;
  v2[3] = swift_getKeyPath();
  v2[4] = swift_getKeyPath();
  specialized static SafePublished.subscript.getter(v1);
  *v2 = v3;
  v2[1] = v4;
  OUTLINED_FUNCTION_24_1();
}

void CAFTypeTestObservable.testString.modify(uint64_t a1, char a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 16);
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_80_2((uint64_t)v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_80_2((uint64_t)v3);
  }
  OUTLINED_FUNCTION_69_1(v2);
}

uint64_t CAFTypeTestObservable.$testString.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testString, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testData : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CAFTypeTestObservable.testData.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testData : CAFTypeTestObservable(uint64_t a1)
{
  outlined copy of Data?(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return CAFTypeTestObservable.testData.setter();
}

uint64_t CAFTypeTestObservable.testData.getter()
{
  void *v0;
  uint64_t v2;

  swift_getKeyPath();
  swift_getKeyPath();
  specialized static SafePublished.subscript.getter(v0, &v2);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37();
  return v2;
}

uint64_t CAFTypeTestObservable.testData.setter()
{
  return CAFTypeTestMultiObservable.testString.setter();
}

void CAFTypeTestObservable.testData.modify()
{
  uint64_t **v0;
  void *v1;
  uint64_t *v2;

  v2 = (uint64_t *)OUTLINED_FUNCTION_126_0();
  *v0 = v2;
  v2[2] = (uint64_t)v1;
  v2[3] = swift_getKeyPath();
  v2[4] = swift_getKeyPath();
  specialized static SafePublished.subscript.getter(v1, v2);
  OUTLINED_FUNCTION_24_1();
}

void CAFTypeTestObservable.testData.modify(uint64_t **a1, char a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *a1;
  v4 = (*a1)[1];
  v5 = **a1;
  v6 = (id)(*a1)[2];
  if ((a2 & 1) != 0)
  {
    outlined copy of Data?(v5, v4);
    OUTLINED_FUNCTION_82_1();
    outlined consume of Data?(*v3, v3[1]);
  }
  else
  {
    OUTLINED_FUNCTION_82_1();
  }
  free(v3);
}

uint64_t CAFTypeTestObservable.$testData.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testData, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t CAFTypeTestObservable.testRawData.getter()
{
  uint64_t v0;
  id v1;
  void *v3;
  uint64_t v4;

  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v3;
  swift_getAtKeyPath();

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37();
  return v4;
}

void CAFTypeTestObservable.$testRawData.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testRawData, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void key path getter for CAFTypeTestObservable.testEnum : CAFTypeTestObservable(_BYTE *a1@<X8>)
{
  char v2;
  char v3;

  CAFTypeTestObservable.testEnum.getter();
  *a1 = v2;
  a1[1] = v3 & 1;
}

void key path setter for CAFTypeTestObservable.testEnum : CAFTypeTestObservable(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt8 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(_QWORD))CAFTypeTestObservable.testEnum.setter);
}

void CAFTypeTestObservable.testEnum.getter()
{
  CAFTypeTestObservable.testUInt8.getter();
}

uint64_t CAFTypeTestObservable.testEnum.setter()
{
  return CAFTypeTestMultiObservable.testUInt8.setter();
}

void CAFTypeTestObservable.testEnum.modify()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t (*v4)(uint64_t, _QWORD);
  char *v5;
  char v6;
  char v7;

  v2 = OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_22_1((uint64_t)v2);
  *(_QWORD *)(v0 + 72) = swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_6_1(OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_33_3();
  v3 = v1;
  v4 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_18_1();
  v6 = *v5;
  v7 = v5[1];
  OUTLINED_FUNCTION_25_5(v4);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_41_2();
  *(_BYTE *)(v0 + 88) = v6;
  *(_BYTE *)(v0 + 89) = v7;
  OUTLINED_FUNCTION_81();
}

{
  CAFTypeTestMultiObservable.testUInt8.modify();
}

uint64_t CAFTypeTestObservable.$testEnum.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testEnum, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void key path getter for CAFTypeTestObservable.testDimensionUnitRawValue : CAFTypeTestObservable(uint64_t a1@<X8>)
{
  __int16 v2;
  char v3;

  CAFTypeTestObservable.testDimensionUnitRawValue.getter();
  *(_WORD *)a1 = v2;
  *(_BYTE *)(a1 + 2) = v3 & 1;
}

void key path setter for CAFTypeTestObservable.testDimensionUnitRawValue : CAFTypeTestObservable(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt16 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(_QWORD))CAFTypeTestObservable.testDimensionUnitRawValue.setter);
}

void CAFTypeTestObservable.testDimensionUnitRawValue.getter()
{
  CAFTypeTestObservable.testUInt16.getter();
}

uint64_t CAFTypeTestObservable.testDimensionUnitRawValue.setter()
{
  return CAFTypeTestMultiObservable.testUInt16.setter();
}

void CAFTypeTestObservable.testDimensionUnitRawValue.modify()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t (*v4)(uint64_t, _QWORD);
  __int16 *v5;
  __int16 v6;
  char v7;

  v2 = OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_22_1((uint64_t)v2);
  *(_QWORD *)(v0 + 72) = swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_6_1(OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_33_3();
  v3 = v1;
  v4 = (uint64_t (*)(uint64_t, _QWORD))OUTLINED_FUNCTION_18_1();
  v6 = *v5;
  v7 = *((_BYTE *)v5 + 2);
  OUTLINED_FUNCTION_25_5(v4);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_41_2();
  *(_WORD *)(v0 + 88) = v6;
  *(_BYTE *)(v0 + 90) = v7;
  OUTLINED_FUNCTION_81();
}

{
  CAFTypeTestMultiObservable.testUInt16.modify();
}

uint64_t CAFTypeTestObservable.$testDimensionUnitRawValue.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testDimensionUnitRawValue, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testComplexItem : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testComplexItem.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testComplexItem : CAFTypeTestObservable(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  return CAFTypeTestObservable.testComplexItem.setter((uint64_t)v1);
}

uint64_t CAFTypeTestObservable.testComplexItem.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testComplexItem.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5600, (uint64_t)&unk_2374D5628, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testComplexItem.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_94_0(v3);
  *v1 = v4;
  OUTLINED_FUNCTION_24_1();
}

void CAFTypeTestObservable.testComplexItem.modify(uint64_t a1, char a2)
{
  CAFTypeTestMultiObservable.testComplexItem.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testComplexItem.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexItem, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testArrayBool : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testArrayBool.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testArrayBool : CAFTypeTestObservable()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return CAFTypeTestObservable.testArrayBool.setter(v0);
}

uint64_t CAFTypeTestObservable.testArrayBool.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testArrayBool.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5648, (uint64_t)&unk_2374D5670, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testArrayBool.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.testArrayBool.modify(uint64_t a1, char a2)
{
  return CAFTypeTestMultiObservable.testArrayBool.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testArrayBool.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayBool, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testArrayUInt8 : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testArrayUInt8.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testArrayUInt8 : CAFTypeTestObservable()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return CAFTypeTestObservable.testArrayUInt8.setter(v0);
}

uint64_t CAFTypeTestObservable.testArrayUInt8.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testArrayUInt8.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5690, (uint64_t)&unk_2374D56B8, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testArrayUInt8.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.testArrayUInt8.modify(uint64_t a1, char a2)
{
  return CAFTypeTestMultiObservable.testArrayBool.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testArrayUInt8.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayUInt8, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testArrayUInt16 : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testArrayUInt16.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testArrayUInt16 : CAFTypeTestObservable()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return CAFTypeTestObservable.testArrayUInt16.setter(v0);
}

uint64_t CAFTypeTestObservable.testArrayUInt16.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testArrayUInt16.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D56D8, (uint64_t)&unk_2374D5700, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testArrayUInt16.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.testArrayUInt16.modify(uint64_t a1, char a2)
{
  return CAFTypeTestMultiObservable.testArrayBool.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testArrayUInt16.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayUInt16, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testArrayUInt32 : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testArrayUInt32.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testArrayUInt32 : CAFTypeTestObservable()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return CAFTypeTestObservable.testArrayUInt32.setter(v0);
}

uint64_t CAFTypeTestObservable.testArrayUInt32.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testArrayUInt32.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5720, (uint64_t)&unk_2374D5748, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testArrayUInt32.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.testArrayUInt32.modify(uint64_t a1, char a2)
{
  return CAFTypeTestMultiObservable.testArrayBool.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testArrayUInt32.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayUInt32, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testArrayUInt64 : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testArrayUInt64.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testArrayUInt64 : CAFTypeTestObservable()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return CAFTypeTestObservable.testArrayUInt64.setter(v0);
}

uint64_t CAFTypeTestObservable.testArrayUInt64.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testArrayUInt64.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5768, (uint64_t)&unk_2374D5790, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testArrayUInt64.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.testArrayUInt64.modify(uint64_t a1, char a2)
{
  return CAFTypeTestMultiObservable.testArrayBool.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testArrayUInt64.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayUInt64, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testArrayInt8 : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testArrayInt8.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testArrayInt8 : CAFTypeTestObservable()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return CAFTypeTestObservable.testArrayInt8.setter(v0);
}

uint64_t CAFTypeTestObservable.testArrayInt8.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testArrayInt8.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D57B0, (uint64_t)&unk_2374D57D8, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testArrayInt8.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.testArrayInt8.modify(uint64_t a1, char a2)
{
  return CAFTypeTestMultiObservable.testArrayBool.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testArrayInt8.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayInt8, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testArrayInt16 : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testArrayInt16.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testArrayInt16 : CAFTypeTestObservable()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return CAFTypeTestObservable.testArrayInt16.setter(v0);
}

uint64_t CAFTypeTestObservable.testArrayInt16.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testArrayInt16.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D57F8, (uint64_t)&unk_2374D5820, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testArrayInt16.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.testArrayInt16.modify(uint64_t a1, char a2)
{
  return CAFTypeTestMultiObservable.testArrayBool.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testArrayInt16.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayInt16, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testArrayInt32 : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testArrayInt32.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testArrayInt32 : CAFTypeTestObservable()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return CAFTypeTestObservable.testArrayInt32.setter(v0);
}

uint64_t CAFTypeTestObservable.testArrayInt32.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testArrayInt32.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5840, (uint64_t)&unk_2374D5868, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testArrayInt32.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.testArrayInt32.modify(uint64_t a1, char a2)
{
  return CAFTypeTestMultiObservable.testArrayBool.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testArrayInt32.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayInt32, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testArrayInt64 : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testArrayInt64.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testArrayInt64 : CAFTypeTestObservable()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return CAFTypeTestObservable.testArrayInt64.setter(v0);
}

uint64_t CAFTypeTestObservable.testArrayInt64.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testArrayInt64.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5888, (uint64_t)&unk_2374D58B0, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testArrayInt64.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.testArrayInt64.modify(uint64_t a1, char a2)
{
  return CAFTypeTestMultiObservable.testArrayBool.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testArrayInt64.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayInt64, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testArrayFloat : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testArrayFloat.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testArrayFloat : CAFTypeTestObservable()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return CAFTypeTestObservable.testArrayFloat.setter(v0);
}

uint64_t CAFTypeTestObservable.testArrayFloat.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testArrayFloat.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D58D0, (uint64_t)&unk_2374D58F8, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testArrayFloat.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.testArrayFloat.modify(uint64_t a1, char a2)
{
  return CAFTypeTestMultiObservable.testArrayBool.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testArrayFloat.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayFloat, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testArrayString : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testArrayString.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testArrayString : CAFTypeTestObservable()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return CAFTypeTestObservable.testArrayString.setter(v0);
}

uint64_t CAFTypeTestObservable.testArrayString.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testArrayString.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5918, (uint64_t)&unk_2374D5940, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testArrayString.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.testArrayString.modify(uint64_t a1, char a2)
{
  return CAFTypeTestMultiObservable.testArrayBool.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testArrayString.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayString, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testArrayData : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testArrayData.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testArrayData : CAFTypeTestObservable()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return CAFTypeTestObservable.testArrayData.setter(v0);
}

uint64_t CAFTypeTestObservable.testArrayData.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testArrayData.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5960, (uint64_t)&unk_2374D5988, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testArrayData.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.testArrayData.modify(uint64_t a1, char a2)
{
  return CAFTypeTestMultiObservable.testArrayBool.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testArrayData.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayData, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFTypeTestObservable.testArrayRawData.getter()
{
  uint64_t v0;
  id v1;
  void *v2;

  v2 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v2;
  swift_getAtKeyPath();

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_56_0();
}

void CAFTypeTestObservable.$testArrayRawData.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayRawData, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testComplexItems : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testComplexItems.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testComplexItems : CAFTypeTestObservable(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  return CAFTypeTestObservable.testComplexItems.setter((uint64_t)v1);
}

uint64_t CAFTypeTestObservable.testComplexItems.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testComplexItems.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D59A8, (uint64_t)&unk_2374D59D0, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testComplexItems.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_94_0(v3);
  *v1 = v4;
  OUTLINED_FUNCTION_24_1();
}

void CAFTypeTestObservable.testComplexItems.modify(uint64_t a1, char a2)
{
  CAFTypeTestMultiObservable.testComplexItem.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testComplexItems.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexItems, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testComplexItemValue : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testComplexItemValue.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testComplexItemValue : CAFTypeTestObservable(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  return CAFTypeTestObservable.testComplexItemValue.setter((uint64_t)v1);
}

uint64_t CAFTypeTestObservable.testComplexItemValue.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testComplexItemValue.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D59F0, (uint64_t)&unk_2374D5A18, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testComplexItemValue.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_94_0(v3);
  *v1 = v4;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.$testComplexItemValue.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexItemValue, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testComplexItemList : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testComplexItemList.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testComplexItemList : CAFTypeTestObservable(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  return CAFTypeTestObservable.testComplexItemList.setter((uint64_t)v1);
}

uint64_t CAFTypeTestObservable.testComplexItemList.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testComplexItemList.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5A38, (uint64_t)&unk_2374D5A60, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testComplexItemList.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_94_0(v3);
  *v1 = v4;
  OUTLINED_FUNCTION_24_1();
}

uint64_t CAFTypeTestObservable.$testComplexItemList.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexItemList, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testComplexArrayItemValue : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testComplexArrayItemValue.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testComplexArrayItemValue : CAFTypeTestObservable(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  return CAFTypeTestObservable.testComplexArrayItemValue.setter((uint64_t)v1);
}

uint64_t CAFTypeTestObservable.testComplexArrayItemValue.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testComplexArrayItemValue.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5A80, (uint64_t)&unk_2374D5AA8, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testComplexArrayItemValue.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

void CAFTypeTestObservable.testComplexArrayItemValue.modify(uint64_t a1, char a2)
{
  CAFTypeTestMultiObservable.testComplexItem.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testComplexArrayItemValue.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexArrayItemValue, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testComplexNestedItemValue : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testComplexNestedItemValue.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testComplexNestedItemValue : CAFTypeTestObservable(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  return CAFTypeTestObservable.testComplexNestedItemValue.setter((uint64_t)v1);
}

uint64_t CAFTypeTestObservable.testComplexNestedItemValue.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testComplexNestedItemValue.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5AC8, (uint64_t)&unk_2374D5AF0, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testComplexNestedItemValue.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

void CAFTypeTestObservable.testComplexNestedItemValue.modify(uint64_t a1, char a2)
{
  CAFTypeTestMultiObservable.testComplexItem.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testComplexNestedItemValue.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexNestedItemValue, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testComplexNestedItemList : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testComplexNestedItemList.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testComplexNestedItemList : CAFTypeTestObservable(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  return CAFTypeTestObservable.testComplexNestedItemList.setter((uint64_t)v1);
}

uint64_t CAFTypeTestObservable.testComplexNestedItemList.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testComplexNestedItemList.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5B10, (uint64_t)&unk_2374D5B38, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testComplexNestedItemList.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

void CAFTypeTestObservable.testComplexNestedItemList.modify(uint64_t a1, char a2)
{
  CAFTypeTestMultiObservable.testComplexItem.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testComplexNestedItemList.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexNestedItemList, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t key path getter for CAFTypeTestObservable.testComplexNestedListItemValue : CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CAFTypeTestObservable.testComplexNestedListItemValue.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for CAFTypeTestObservable.testComplexNestedListItemValue : CAFTypeTestObservable(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  return CAFTypeTestObservable.testComplexNestedListItemValue.setter((uint64_t)v1);
}

uint64_t CAFTypeTestObservable.testComplexNestedListItemValue.getter()
{
  return CAFTypeTestMultiObservable.testComplexItem.getter();
}

uint64_t CAFTypeTestObservable.testComplexNestedListItemValue.setter(uint64_t a1)
{
  return CAFTypeTestMultiObservable.testComplexItem.setter(a1, (uint64_t)&unk_2374D5B58, (uint64_t)&unk_2374D5B80, (uint64_t (*)(void))specialized static SafePublished.subscript.setter);
}

void CAFTypeTestObservable.testComplexNestedListItemValue.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t KeyPath;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35_3(a1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_36_3(KeyPath);
  v3 = swift_getKeyPath();
  v4 = (void *)OUTLINED_FUNCTION_13_4(v3);
  specialized static SafePublished.subscript.getter(v4);
  *v1 = v5;
  OUTLINED_FUNCTION_24_1();
}

void CAFTypeTestObservable.testComplexNestedListItemValue.modify(uint64_t a1, char a2)
{
  CAFTypeTestMultiObservable.testComplexItem.modify(a1, a2);
}

uint64_t CAFTypeTestObservable.$testComplexNestedListItemValue.getter()
{
  return CAFSeatHeatingCoolingObservable.$on.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexNestedListItemValue, (uint64_t (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t CAFTypeTestObservable._description.getter(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  Swift::String v103;
  uint64_t v104;
  unsigned __int16 v105;
  uint64_t v106;
  unsigned __int16 v107;
  uint64_t v108;
  unsigned __int16 v109;
  uint64_t v110;
  unsigned __int16 v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  Swift::String v119;
  Swift::String v120;
  Swift::String v121;
  Swift::String v122;
  Swift::String v123;
  Swift::String v124;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  Swift::String v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;

  v2 = 0x73696765726E753CLL;
  OUTLINED_FUNCTION_152(a1, sel_registeredForTestBool);
  OUTLINED_FUNCTION_2_4();
  if ((_DWORD)v3)
  {
    CAFTypeTestObservable.testBool.getter();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Bool?);
    v3 = OUTLINED_FUNCTION_19_4();
    v4 = v3;
  }
  v158 = v4;
  OUTLINED_FUNCTION_152(v3, sel_registeredForTestUInt8);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v5)
  {
    CAFTypeTestObservable.testUInt8.getter();
    OUTLINED_FUNCTION_124_0(v7);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UInt8?);
    v5 = OUTLINED_FUNCTION_19_4();
    v6 = v5;
  }
  v157 = v6;
  OUTLINED_FUNCTION_152(v5, sel_registeredForTestUInt16);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v8)
  {
    CAFTypeTestObservable.testUInt16.getter();
    OUTLINED_FUNCTION_122_0(v10);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UInt16?);
    v8 = OUTLINED_FUNCTION_19_4();
    v9 = v8;
  }
  v156 = v9;
  OUTLINED_FUNCTION_152(v8, sel_registeredForTestUInt32);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v11)
  {
    v13 = CAFTypeTestObservable.testUInt32.getter();
    OUTLINED_FUNCTION_119_0(v13);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UInt32?);
    v11 = OUTLINED_FUNCTION_19_4();
    v12 = v11;
  }
  v155 = v12;
  OUTLINED_FUNCTION_152(v11, sel_registeredForTestUInt64);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v14)
  {
    CAFTypeTestObservable.testUInt64.getter();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UInt64?);
    v14 = OUTLINED_FUNCTION_19_4();
    v15 = v14;
  }
  v154 = v15;
  OUTLINED_FUNCTION_152(v14, sel_registeredForTestInt8);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v16)
  {
    CAFTypeTestObservable.testInt8.getter();
    OUTLINED_FUNCTION_124_0(v18);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int8?);
    v16 = OUTLINED_FUNCTION_19_4();
    v17 = v16;
  }
  v153 = v17;
  OUTLINED_FUNCTION_152(v16, sel_registeredForTestInt16);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v19)
  {
    CAFTypeTestObservable.testInt16.getter();
    OUTLINED_FUNCTION_122_0(v21);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Int16?);
    v19 = OUTLINED_FUNCTION_19_4();
    v20 = v19;
  }
  v152 = v20;
  OUTLINED_FUNCTION_152(v19, sel_registeredForTestInt32);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v22)
  {
    v24 = CAFTypeTestObservable.testInt32.getter();
    OUTLINED_FUNCTION_119_0(v24);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int32?);
    v22 = OUTLINED_FUNCTION_19_4();
    v23 = v22;
  }
  v151 = v23;
  OUTLINED_FUNCTION_152(v22, sel_registeredForTestInt64);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v25)
  {
    CAFTypeTestObservable.testInt64.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int64?);
    v25 = OUTLINED_FUNCTION_19_4();
    v26 = v25;
  }
  v150 = v26;
  OUTLINED_FUNCTION_152(v25, sel_registeredForTestFloat);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v27)
  {
    v29 = CAFTypeTestObservable.testFloat.getter();
    OUTLINED_FUNCTION_119_0(v29);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Float?);
    v27 = OUTLINED_FUNCTION_19_4();
    v28 = v27;
  }
  v149 = v28;
  OUTLINED_FUNCTION_152(v27, sel_registeredForTestString);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v30)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v32 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v32);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
    v30 = OUTLINED_FUNCTION_19_4();
    v31 = v30;
  }
  v148 = v31;
  OUTLINED_FUNCTION_152(v30, sel_registeredForTestData);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v33)
  {
    CAFTypeTestObservable.testData.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Data?);
    v33 = OUTLINED_FUNCTION_19_4();
    v34 = v33;
  }
  v147 = v34;
  OUTLINED_FUNCTION_152(v33, sel_registeredForTestRawData);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v35)
  {
    CAFTypeTestObservable.testRawData.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Data?);
    v35 = OUTLINED_FUNCTION_19_4();
    v36 = v35;
  }
  v146 = v36;
  OUTLINED_FUNCTION_152(v35, sel_registeredForTestEnum);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v37)
  {
    CAFTypeTestObservable.testEnum.getter();
    OUTLINED_FUNCTION_124_0(v39);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CAFButtonAction?);
    v37 = OUTLINED_FUNCTION_19_4();
    v38 = v37;
  }
  v145 = v38;
  OUTLINED_FUNCTION_152(v37, sel_registeredForTestDimensionUnit);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v40)
  {
    CAFTypeTestObservable.testDimensionUnitRawValue.getter();
    OUTLINED_FUNCTION_122_0(v42);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CAFUnitType?);
    v40 = OUTLINED_FUNCTION_19_4();
    v41 = v40;
  }
  v144 = v41;
  OUTLINED_FUNCTION_152(v40, sel_registeredForTestComplexItem);
  v43 = 0x73696765726E753CLL;
  OUTLINED_FUNCTION_1_9();
  if ((_DWORD)v44)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    OUTLINED_FUNCTION_89_0();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CAFTestComplexItem?);
    v44 = OUTLINED_FUNCTION_19_4();
    v43 = v44;
  }
  OUTLINED_FUNCTION_152(v44, sel_registeredForTestArrayBool);
  v45 = 0x73696765726E753CLL;
  OUTLINED_FUNCTION_1_9();
  if ((_DWORD)v46)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v47 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v47);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Bool]?);
    v46 = OUTLINED_FUNCTION_19_4();
    v45 = v46;
  }
  OUTLINED_FUNCTION_152(v46, sel_registeredForTestArrayUInt8);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v48)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v50 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v50);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [UInt8]?);
    v48 = OUTLINED_FUNCTION_19_4();
    v49 = v48;
  }
  v143 = v49;
  OUTLINED_FUNCTION_152(v48, sel_registeredForTestArrayUInt16);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v51)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v53 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v53);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt16]?);
    v51 = OUTLINED_FUNCTION_19_4();
    v52 = v51;
  }
  v142 = v52;
  OUTLINED_FUNCTION_152(v51, sel_registeredForTestArrayUInt32);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v54)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v56 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v56);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [UInt32]?);
    v54 = OUTLINED_FUNCTION_19_4();
    v55 = v54;
  }
  v141 = v55;
  OUTLINED_FUNCTION_152(v54, sel_registeredForTestArrayUInt64);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v57)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v59 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v59);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt64]?);
    v57 = OUTLINED_FUNCTION_19_4();
    v58 = v57;
  }
  v140 = v58;
  OUTLINED_FUNCTION_152(v57, sel_registeredForTestArrayInt8);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v60)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v62 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v62);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Int8]?);
    v60 = OUTLINED_FUNCTION_19_4();
    v61 = v60;
  }
  v139 = v61;
  OUTLINED_FUNCTION_152(v60, sel_registeredForTestArrayInt16);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v63)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v65 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v65);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int16]?);
    v63 = OUTLINED_FUNCTION_19_4();
    v64 = v63;
  }
  v138 = v64;
  OUTLINED_FUNCTION_152(v63, sel_registeredForTestArrayInt32);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v66)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v68 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v68);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Int32]?);
    v66 = OUTLINED_FUNCTION_19_4();
    v67 = v66;
  }
  v137 = v67;
  OUTLINED_FUNCTION_152(v66, sel_registeredForTestArrayInt64);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v69)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v71 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v71);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int64]?);
    v69 = OUTLINED_FUNCTION_19_4();
    v70 = v69;
  }
  v136 = v70;
  OUTLINED_FUNCTION_152(v69, sel_registeredForTestArrayFloat);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v72)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v74 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v74);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Float]?);
    v72 = OUTLINED_FUNCTION_19_4();
    v73 = v72;
  }
  v135 = v73;
  OUTLINED_FUNCTION_152(v72, sel_registeredForTestArrayString);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v75)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v77 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v77);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]?);
    v75 = OUTLINED_FUNCTION_19_4();
    v76 = v75;
  }
  v134 = v76;
  OUTLINED_FUNCTION_152(v75, sel_registeredForTestArrayData);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v78)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v80 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v80);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Data]?);
    v78 = OUTLINED_FUNCTION_19_4();
    v79 = v78;
  }
  v133 = v79;
  OUTLINED_FUNCTION_152(v78, sel_registeredForTestArrayRawData);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v81)
  {
    CAFTypeTestObservable.testArrayRawData.getter();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Data]?);
    v81 = OUTLINED_FUNCTION_19_4();
    v83 = v81;
  }
  v132._countAndFlagsBits = v83;
  v132._object = v82;
  OUTLINED_FUNCTION_152(v81, sel_registeredForTestComplexItems);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v84)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    OUTLINED_FUNCTION_89_0();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CAFTestComplexItems?);
    v84 = OUTLINED_FUNCTION_19_4();
    v85 = v84;
  }
  v131 = v85;
  OUTLINED_FUNCTION_152(v84, sel_registeredForTestComplexItemValue);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v86)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    OUTLINED_FUNCTION_89_0();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CAFTestComplexItem?);
    v86 = OUTLINED_FUNCTION_19_4();
    v87 = v86;
  }
  v130 = v87;
  OUTLINED_FUNCTION_152(v86, sel_registeredForTestComplexItemList);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v88)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    OUTLINED_FUNCTION_89_0();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CAFTestComplexItems?);
    v88 = OUTLINED_FUNCTION_19_4();
    v89 = v88;
  }
  v129 = v89;
  OUTLINED_FUNCTION_152(v88, sel_registeredForTestComplexArrayItemValue);
  OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v90)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v92 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v92);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CAFTestComplexArrayItem?);
    v90 = OUTLINED_FUNCTION_19_4();
    v91 = v90;
  }
  v128 = v91;
  OUTLINED_FUNCTION_152(v90, sel_registeredForTestComplexNestedItemValue);
  OUTLINED_FUNCTION_2_4();
  v95 = (void *)0xEE003E6465726574;
  if ((_DWORD)v93)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v96 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v96);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CAFTestComplexNestedItem?);
    v93 = OUTLINED_FUNCTION_19_4();
    v94 = v93;
    v95 = v97;
  }
  v127 = v94;
  OUTLINED_FUNCTION_152(v93, sel_registeredForTestComplexNestedItemList);
  OUTLINED_FUNCTION_2_4();
  v100 = (void *)0xEE003E6465726574;
  if ((_DWORD)v98)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v101 = (void *)OUTLINED_FUNCTION_7_7();
    specialized static SafePublished.subscript.getter(v101);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CAFTestComplexNestedItems?);
    v98 = OUTLINED_FUNCTION_19_4();
    v99 = v98;
    v100 = v102;
  }
  v126 = v99;
  if (OUTLINED_FUNCTION_152(v98, sel_registeredForTestComplexNestedListItemValue))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    specialized static SafePublished.subscript.getter(v1);
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_37();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CAFTestComplexNestedListItem?);
    v2 = OUTLINED_FUNCTION_19_4();
  }
  static String._createEmpty(withInitialCapacity:)(760);
  v103._object = (void *)0x80000002374E43A0;
  v103._countAndFlagsBits = 0xD000000000000018;
  String.append(_:)(v103);
  _print_unlocked<A, B>(_:_:)();
  OUTLINED_FUNCTION_34_1(0x4274736574207B20, 0x3A6C6F6Fu);
  OUTLINED_FUNCTION_133_1(v158);
  OUTLINED_FUNCTION_139_0();
  v104 = OUTLINED_FUNCTION_47_1();
  OUTLINED_FUNCTION_34_1(v104, v105 | 0x3A380000);
  OUTLINED_FUNCTION_28_3(v157);
  OUTLINED_FUNCTION_56();
  v106 = OUTLINED_FUNCTION_47_1();
  OUTLINED_FUNCTION_6_2(v106, v107 | 0x36310000);
  OUTLINED_FUNCTION_28_3(v156);
  OUTLINED_FUNCTION_56();
  v108 = OUTLINED_FUNCTION_47_1();
  OUTLINED_FUNCTION_6_2(v108, v109 | 0x32330000);
  OUTLINED_FUNCTION_28_3(v155);
  OUTLINED_FUNCTION_56();
  v110 = OUTLINED_FUNCTION_47_1();
  OUTLINED_FUNCTION_6_2(v110, v111 | 0x34360000);
  OUTLINED_FUNCTION_28_3(v154);
  OUTLINED_FUNCTION_56();
  v112 = OUTLINED_FUNCTION_59_1();
  OUTLINED_FUNCTION_130_0(v112, 14452);
  OUTLINED_FUNCTION_28_3(v153);
  OUTLINED_FUNCTION_56();
  v113 = OUTLINED_FUNCTION_59_1();
  OUTLINED_FUNCTION_34_1(v113, 0x3A363174u);
  OUTLINED_FUNCTION_28_3(v152);
  OUTLINED_FUNCTION_56();
  v114 = OUTLINED_FUNCTION_59_1();
  OUTLINED_FUNCTION_34_1(v114, 0x3A323374u);
  OUTLINED_FUNCTION_28_3(v151);
  OUTLINED_FUNCTION_56();
  v115 = OUTLINED_FUNCTION_59_1();
  OUTLINED_FUNCTION_34_1(v115, 0x3A343674u);
  OUTLINED_FUNCTION_28_3(v150);
  OUTLINED_FUNCTION_56();
  v116 = OUTLINED_FUNCTION_53_0();
  OUTLINED_FUNCTION_34_1(v116 & 0xFFFFFFFFFFFFLL | 0x6C46000000000000, 0x3A74616Fu);
  OUTLINED_FUNCTION_28_3(v149);
  OUTLINED_FUNCTION_56();
  v117 = OUTLINED_FUNCTION_53_0();
  OUTLINED_FUNCTION_6_2(v117 & 0xFFFFFFFFFFFFLL | 0x7453000000000000, 0x676E6972u);
  OUTLINED_FUNCTION_28_3(v148);
  OUTLINED_FUNCTION_56();
  v118 = OUTLINED_FUNCTION_53_0();
  OUTLINED_FUNCTION_130_0(v118 & 0xFFFFFFFFFFFFLL | 0x6144000000000000, 24948);
  OUTLINED_FUNCTION_22_5(v147);
  OUTLINED_FUNCTION_14_5();
  v119._countAndFlagsBits = OUTLINED_FUNCTION_53_0() & 0xFFFFFFFFFFFFLL | 0x6152000000000000;
  v119._object = (void *)0xEF203A6174614477;
  String.append(_:)(v119);
  OUTLINED_FUNCTION_22_5(v146);
  OUTLINED_FUNCTION_14_5();
  v120._countAndFlagsBits = OUTLINED_FUNCTION_53_0() & 0xFFFFFFFFFFFFLL | 0x6E45000000000000;
  String.append(_:)(v120);
  OUTLINED_FUNCTION_28_3(v145);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_64_2((uint64_t)", testDimensionUnitRawValue: ");
  OUTLINED_FUNCTION_22_5(v144);
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_30_2((uint64_t)", testComplexItem: ");
  OUTLINED_FUNCTION_133_1(v43);
  OUTLINED_FUNCTION_139_0();
  OUTLINED_FUNCTION_66_1((uint64_t)", testArrayBool: ");
  OUTLINED_FUNCTION_52_3(v45);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_10_4((uint64_t)", testArrayUInt8: ");
  OUTLINED_FUNCTION_52_3(v143);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_30_2((uint64_t)", testArrayUInt16: ");
  OUTLINED_FUNCTION_52_3(v142);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_30_2((uint64_t)", testArrayUInt32: ");
  OUTLINED_FUNCTION_52_3(v141);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_30_2((uint64_t)", testArrayUInt64: ");
  OUTLINED_FUNCTION_52_3(v140);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_66_1((uint64_t)", testArrayInt8: ");
  OUTLINED_FUNCTION_52_3(v139);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_10_4((uint64_t)", testArrayInt16: ");
  OUTLINED_FUNCTION_52_3(v138);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_10_4((uint64_t)", testArrayInt32: ");
  OUTLINED_FUNCTION_52_3(v137);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_10_4((uint64_t)", testArrayInt64: ");
  OUTLINED_FUNCTION_52_3(v136);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_10_4((uint64_t)", testArrayFloat: ");
  OUTLINED_FUNCTION_52_3(v135);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_30_2((uint64_t)", testArrayString: ");
  OUTLINED_FUNCTION_22_5(v134);
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_66_1((uint64_t)", testArrayData: ");
  OUTLINED_FUNCTION_22_5(v133);
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_30_2((uint64_t)", testArrayRawData: ");
  String.append(_:)(v132);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_30_2((uint64_t)", testComplexItems: ");
  OUTLINED_FUNCTION_22_5(v131);
  OUTLINED_FUNCTION_14_5();
  v121._object = (void *)0x80000002374E1E60;
  v121._countAndFlagsBits = 0xD000000000000018;
  String.append(_:)(v121);
  OUTLINED_FUNCTION_39_3(v130);
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_128(0xD000000000000017, (uint64_t)", testComplexItemList: ");
  OUTLINED_FUNCTION_39_3(v129);
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_64_2((uint64_t)", testComplexArrayItemValue: ");
  OUTLINED_FUNCTION_39_3(v128);
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_128(0xD00000000000001ELL, (uint64_t)", testComplexNestedItemValue: ");
  v122._countAndFlagsBits = v127;
  v122._object = v95;
  String.append(_:)(v122);
  OUTLINED_FUNCTION_129_0();
  OUTLINED_FUNCTION_64_2((uint64_t)", testComplexNestedItemList: ");
  v123._countAndFlagsBits = v126;
  v123._object = v100;
  String.append(_:)(v123);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_128(0xD000000000000022, (uint64_t)", testComplexNestedListItemValue: ");
  OUTLINED_FUNCTION_133_1(v2);
  OUTLINED_FUNCTION_139_0();
  v124._countAndFlagsBits = 4095264;
  v124._object = (void *)0xE300000000000000;
  String.append(_:)(v124);
  return String.init(stringInterpolation:)();
}

void CAFTypeTestObservable.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_cachedDescriptionLock;
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v2);
  v3 = OUTLINED_FUNCTION_27();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_cachedDescription + 8))
  {
    v4 = *(os_unfair_lock_s **)(v0 + v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    CAFTypeTestObservable._description.getter(v3);
    swift_bridgeObjectRetain();
    v5 = OUTLINED_FUNCTION_31_0();
    CAFTypeTestObservable.cachedDescription.setter(v5, v6);
    v4 = *(os_unfair_lock_s **)(v0 + v1);
  }
  OUTLINED_FUNCTION_32();
  os_unfair_lock_unlock(v4 + 4);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_24_1();
}

void CAFTypeTestObservable.__allocating_init(_:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  CAFTypeTestObservable.init(_:)();
  OUTLINED_FUNCTION_11();
}

id CAFTypeTestObservable.init(_:)()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  void *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t KeyPath;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  id v83;
  objc_super v85;
  uint64_t v86;
  uint64_t v87;

  OUTLINED_FUNCTION_138_0();
  v86 = v1;
  v87 = v2;
  v3 = v0;
  v5 = v4;
  v6 = &v0[OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_cachedDescription];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_cachedDescriptionLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v8 = swift_allocObject();
  *(_DWORD *)(v8 + 16) = 0;
  *(_QWORD *)&v3[v7] = v8;
  v9 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testBool;
  KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, Bool?>);
  OUTLINED_FUNCTION_127();
  v11 = v3;
  *(_QWORD *)&v3[v9] = specialized SafePublished.init(observedValuekeypath:)(KeyPath);
  v12 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testUInt8;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, UInt8?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v12] = v13;
  v14 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testUInt16;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, UInt16?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v14] = v15;
  v16 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testUInt32;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, UInt32?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v16] = v17;
  v18 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testUInt64;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, UInt64?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v18] = v19;
  v20 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testInt8;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, Int8?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v20] = v21;
  v22 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testInt16;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, Int16?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v22] = v23;
  v24 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testInt32;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, Int32?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v24] = v25;
  v26 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testInt64;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, Int64?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v26] = v27;
  v28 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testFloat;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, Float?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v28] = v29;
  v30 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testString;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, String?>);
  OUTLINED_FUNCTION_127();
  v31 = OUTLINED_FUNCTION_16_1();
  *(_QWORD *)&v11[v30] = specialized SafePublished.init(observedValuekeypath:)(v31);
  v32 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testData;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, Data?>);
  OUTLINED_FUNCTION_127();
  v33 = OUTLINED_FUNCTION_16_1();
  *(_QWORD *)&v11[v32] = specialized SafePublished.init(observedValuekeypath:)(v33);
  v34 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testRawData;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFTypeTestObservable, Data?>);
  OUTLINED_FUNCTION_127();
  v35 = OUTLINED_FUNCTION_16_1();
  *(_QWORD *)&v11[v34] = specialized SafePublished.init(observedValuekeypath:)(v35);
  v36 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testEnum;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, CAFButtonAction?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v36] = v37;
  v38 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testDimensionUnitRawValue;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, CAFUnitType?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v38] = v39;
  v40 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexItem;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, CAFTestComplexItem?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_111_0();
  *(_QWORD *)&v11[v40] = v41;
  v42 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayBool;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, [Bool]?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v42] = v43;
  v44 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayUInt8;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, [UInt8]?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v44] = v45;
  v46 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayUInt16;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, [UInt16]?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v46] = v47;
  v48 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayUInt32;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, [UInt32]?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v48] = v49;
  v50 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayUInt64;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, [UInt64]?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v50] = v51;
  v52 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayInt8;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, [Int8]?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v52] = v53;
  v54 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayInt16;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, [Int16]?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v54] = v55;
  v56 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayInt32;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, [Int32]?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v56] = v57;
  v58 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayInt64;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, [Int64]?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v58] = v59;
  v60 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayFloat;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, [Float]?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v60] = v61;
  v62 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayString;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, [String]?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v62] = v63;
  v64 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayData;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, [Data]?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v64] = v65;
  v66 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayRawData;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFTypeTestObservable, [Data]?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v66] = v67;
  v68 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexItems;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, CAFTestComplexItems?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_112_0();
  *(_QWORD *)&v11[v68] = v69;
  v70 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexItemValue;
  swift_getKeyPath();
  swift_allocObject();
  OUTLINED_FUNCTION_111_0();
  *(_QWORD *)&v11[v70] = v71;
  v72 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexItemList;
  swift_getKeyPath();
  swift_allocObject();
  OUTLINED_FUNCTION_112_0();
  *(_QWORD *)&v11[v72] = v73;
  v74 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexArrayItemValue;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, CAFTestComplexArrayItem?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v74] = v75;
  v76 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexNestedItemValue;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, CAFTestComplexNestedItem?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v76] = v77;
  v78 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexNestedItemList;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, CAFTestComplexNestedItems?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v78] = v79;
  v80 = OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexNestedListItemValue;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafePublished<CAFTypeTestObservable, CAFTestComplexNestedListItem?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v11[v80] = v81;
  *(_QWORD *)&v11[OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed] = v5;
  v82 = v5;

  v85.receiver = v11;
  v85.super_class = (Class)type metadata accessor for CAFTypeTestObservable();
  v83 = objc_msgSendSuper2(&v85, sel_init);
  objc_msgSend(v82, sel_registerObserver_, v83);

  return v83;
}

void CAFTypeTestObservable.resetCachedDescription()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v1);
  specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(v2, partial apply for closure #1 in CAFTypeTestObservable.resetCachedDescription());
  os_unfair_lock_unlock(v1);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_33_0();
}

id CAFTypeTestObservable.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable_observed], sel_unregisterObserver_, v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAFTypeTestObservable();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id CAFTypeTestObservable.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CAFTypeTestObservable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void protocol witness for CAFObservable.observed.getter in conformance CAFTypeTestObservable(id *a1@<X8>)
{
  *a1 = CAFTypeTestObservable.observed.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B5EC8()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testBool.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B5EE8(unsigned __int8 *a1)
{
  CAFTypeTestObservable.testBool.setter(*a1);
  OUTLINED_FUNCTION_11();
}

void protocol witness for CAFObservable.init(_:) in conformance CAFTypeTestObservable()
{
  CAFTypeTestObservable.__allocating_init(_:)();
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance CAFTypeTestObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CAFTypeTestObservable();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t CAFTypeTestObservable.typeTestService(_:didUpdateTestBool:)()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_32();
  specialized SafePublished.value.setter();
  return OUTLINED_FUNCTION_25();
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestUInt8:)(uint64_t a1, unsigned __int8 a2)
{
  CAFAutoClimateControlObservable.autoClimateControlService(_:didUpdateLevel:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testUInt8, (void (*)(_QWORD))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestUInt16:)(uint64_t a1, unsigned __int16 a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestUInt16:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testUInt16, (void (*)(_QWORD))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestUInt32:)(uint64_t a1, unsigned int a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestUInt32:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testUInt32, (void (*)(_QWORD))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestUInt64:)(uint64_t a1, uint64_t a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestUInt64:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testUInt64, (void (*)(uint64_t, _QWORD))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestInt8:)(uint64_t a1, unsigned __int8 a2)
{
  CAFAutoClimateControlObservable.autoClimateControlService(_:didUpdateLevel:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testInt8, (void (*)(_QWORD))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestInt16:)(uint64_t a1, unsigned __int16 a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestUInt16:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testInt16, (void (*)(_QWORD))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestInt32:)(uint64_t a1, unsigned int a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestUInt32:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testInt32, (void (*)(_QWORD))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestInt64:)(uint64_t a1, uint64_t a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestUInt64:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testInt64, (void (*)(uint64_t, _QWORD))specialized SafePublished.value.setter);
}

uint64_t CAFTypeTestObservable.typeTestService(_:didUpdateTestFloat:)()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_32();
  specialized SafePublished.value.setter();
  return OUTLINED_FUNCTION_25();
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestString:)()
{
  OUTLINED_FUNCTION_117_0();
  OUTLINED_FUNCTION_15_0();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_31_0();
  specialized SafePublished.value.setter();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_33_0();
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestData:)()
{
  unint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_117_0();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_32();
  outlined copy of Data?(v1, v0);
  OUTLINED_FUNCTION_31_0();
  specialized SafePublished.value.setter();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_33_0();
}

uint64_t CAFTypeTestObservable.typeTestService(_:didUpdateTestRawData:)()
{
  unint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_117_0();
  OUTLINED_FUNCTION_32();
  outlined copy of Data?(v1, v0);
  OUTLINED_FUNCTION_31_0();
  specialized SafeReadOnlyPublished.value.setter();
  return swift_release();
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestEnum:)(uint64_t a1, unsigned __int8 a2)
{
  CAFAutoClimateControlObservable.autoClimateControlService(_:didUpdateLevel:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testEnum, (void (*)(_QWORD))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestDimensionUnitRawValue:)(uint64_t a1, unsigned __int16 a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestUInt16:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testDimensionUnitRawValue, (void (*)(_QWORD))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexItem:)(uint64_t a1, void *a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestComplexItem:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexItem, (void (*)(void *))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayBool:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  char v11;
  _BOOL8 v12;
  int64_t v13;
  char v14;

  OUTLINED_FUNCTION_52_2();
  v2 = v1;
  OUTLINED_FUNCTION_15_0();
  if (!v2)
  {
    OUTLINED_FUNCTION_40();
LABEL_16:
    OUTLINED_FUNCTION_76_0();
    specialized SafePublished.value.setter();
    OUTLINED_FUNCTION_14_5();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_23_1();
    return;
  }
  OUTLINED_FUNCTION_85_0();
  if (!v4)
  {
    v5 = *(_QWORD *)(v3 + 16);
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_64_0();
    if (v5)
      goto LABEL_4;
LABEL_15:
    OUTLINED_FUNCTION_39_2();
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_64_0();
  v5 = OUTLINED_FUNCTION_61_1();
  if (!v5)
    goto LABEL_15;
LABEL_4:
  v6 = (char *)OUTLINED_FUNCTION_32_2();
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v6, v7, v8);
  if ((v5 & 0x8000000000000000) == 0)
  {
    OUTLINED_FUNCTION_46_3();
    do
    {
      if (v0)
        OUTLINED_FUNCTION_51_2();
      objc_msgSend(OUTLINED_FUNCTION_50_1(), sel_BOOLValue);
      OUTLINED_FUNCTION_90_0();
      OUTLINED_FUNCTION_45_2();
      if (v10)
      {
        v12 = OUTLINED_FUNCTION_31_3(v9);
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)v12, v13, v14);
      }
      OUTLINED_FUNCTION_60_0();
    }
    while (!v11);
    goto LABEL_15;
  }
  __break(1u);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayUInt8:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  char v8;

  OUTLINED_FUNCTION_52_2();
  v2 = v1;
  OUTLINED_FUNCTION_15_0();
  if (!v2)
  {
    OUTLINED_FUNCTION_40();
LABEL_16:
    OUTLINED_FUNCTION_76_0();
    specialized SafePublished.value.setter();
    OUTLINED_FUNCTION_14_5();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_23_1();
    return;
  }
  OUTLINED_FUNCTION_85_0();
  if (!v4)
  {
    v5 = *(_QWORD *)(v3 + 16);
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_64_0();
    if (v5)
      goto LABEL_4;
LABEL_15:
    OUTLINED_FUNCTION_39_2();
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_64_0();
  v5 = OUTLINED_FUNCTION_61_1();
  if (!v5)
    goto LABEL_15;
LABEL_4:
  OUTLINED_FUNCTION_32_2();
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  if ((v5 & 0x8000000000000000) == 0)
  {
    OUTLINED_FUNCTION_46_3();
    do
    {
      if (v0)
        OUTLINED_FUNCTION_51_2();
      objc_msgSend(OUTLINED_FUNCTION_50_1(), sel_unsignedCharValue);
      OUTLINED_FUNCTION_90_0();
      OUTLINED_FUNCTION_45_2();
      if (v7)
      {
        OUTLINED_FUNCTION_31_3(v6);
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      OUTLINED_FUNCTION_60_0();
    }
    while (!v8);
    goto LABEL_15;
  }
  __break(1u);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayUInt16:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  char v8;

  OUTLINED_FUNCTION_52_2();
  v2 = v1;
  OUTLINED_FUNCTION_15_0();
  if (!v2)
  {
    OUTLINED_FUNCTION_40();
LABEL_16:
    OUTLINED_FUNCTION_76_0();
    specialized SafePublished.value.setter();
    OUTLINED_FUNCTION_14_5();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_23_1();
    return;
  }
  OUTLINED_FUNCTION_85_0();
  if (!v4)
  {
    v5 = *(_QWORD *)(v3 + 16);
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_64_0();
    if (v5)
      goto LABEL_4;
LABEL_15:
    OUTLINED_FUNCTION_39_2();
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_64_0();
  v5 = OUTLINED_FUNCTION_61_1();
  if (!v5)
    goto LABEL_15;
LABEL_4:
  OUTLINED_FUNCTION_32_2();
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  if ((v5 & 0x8000000000000000) == 0)
  {
    OUTLINED_FUNCTION_46_3();
    do
    {
      if (v0)
        OUTLINED_FUNCTION_51_2();
      objc_msgSend(OUTLINED_FUNCTION_50_1(), sel_unsignedShortValue);
      OUTLINED_FUNCTION_90_0();
      OUTLINED_FUNCTION_45_2();
      if (v7)
      {
        OUTLINED_FUNCTION_31_3(v6);
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      OUTLINED_FUNCTION_105_0();
    }
    while (!v8);
    goto LABEL_15;
  }
  __break(1u);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayUInt32:)(uint64_t a1, unint64_t a2)
{
  CAFTypeTestWithStatesObservable.typeTestWithStatesService(_:didUpdateTestArrayUInt32:)(a1, a2, &OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayUInt32, (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:), (SEL *)&selRef_unsignedIntValue, (void (*)(uint64_t))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayUInt64:)(uint64_t a1, unint64_t a2)
{
  CAFTypeTestWithStatesObservable.typeTestWithStatesService(_:didUpdateTestArrayUInt64:)(a1, a2, &OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayUInt64, (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:), (SEL *)&selRef_unsignedLongLongValue, (void (*)(uint64_t))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayInt8:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  char v8;

  OUTLINED_FUNCTION_52_2();
  v2 = v1;
  OUTLINED_FUNCTION_15_0();
  if (!v2)
  {
    OUTLINED_FUNCTION_40();
LABEL_16:
    OUTLINED_FUNCTION_76_0();
    specialized SafePublished.value.setter();
    OUTLINED_FUNCTION_14_5();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_23_1();
    return;
  }
  OUTLINED_FUNCTION_85_0();
  if (!v4)
  {
    v5 = *(_QWORD *)(v3 + 16);
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_64_0();
    if (v5)
      goto LABEL_4;
LABEL_15:
    OUTLINED_FUNCTION_39_2();
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_64_0();
  v5 = OUTLINED_FUNCTION_61_1();
  if (!v5)
    goto LABEL_15;
LABEL_4:
  OUTLINED_FUNCTION_32_2();
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  if ((v5 & 0x8000000000000000) == 0)
  {
    OUTLINED_FUNCTION_46_3();
    do
    {
      if (v0)
        OUTLINED_FUNCTION_51_2();
      objc_msgSend(OUTLINED_FUNCTION_50_1(), sel_charValue);
      OUTLINED_FUNCTION_90_0();
      OUTLINED_FUNCTION_45_2();
      if (v7)
      {
        OUTLINED_FUNCTION_31_3(v6);
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      OUTLINED_FUNCTION_60_0();
    }
    while (!v8);
    goto LABEL_15;
  }
  __break(1u);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayInt16:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  char v8;

  OUTLINED_FUNCTION_52_2();
  v2 = v1;
  OUTLINED_FUNCTION_15_0();
  if (!v2)
  {
    OUTLINED_FUNCTION_40();
LABEL_16:
    OUTLINED_FUNCTION_76_0();
    specialized SafePublished.value.setter();
    OUTLINED_FUNCTION_14_5();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_23_1();
    return;
  }
  OUTLINED_FUNCTION_85_0();
  if (!v4)
  {
    v5 = *(_QWORD *)(v3 + 16);
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_64_0();
    if (v5)
      goto LABEL_4;
LABEL_15:
    OUTLINED_FUNCTION_39_2();
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_64_0();
  v5 = OUTLINED_FUNCTION_61_1();
  if (!v5)
    goto LABEL_15;
LABEL_4:
  OUTLINED_FUNCTION_32_2();
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  if ((v5 & 0x8000000000000000) == 0)
  {
    OUTLINED_FUNCTION_46_3();
    do
    {
      if (v0)
        OUTLINED_FUNCTION_51_2();
      objc_msgSend(OUTLINED_FUNCTION_50_1(), sel_shortValue);
      OUTLINED_FUNCTION_90_0();
      OUTLINED_FUNCTION_45_2();
      if (v7)
      {
        OUTLINED_FUNCTION_31_3(v6);
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      OUTLINED_FUNCTION_105_0();
    }
    while (!v8);
    goto LABEL_15;
  }
  __break(1u);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayInt32:)(uint64_t a1, unint64_t a2)
{
  CAFTypeTestWithStatesObservable.typeTestWithStatesService(_:didUpdateTestArrayUInt32:)(a1, a2, &OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayInt32, (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:), (SEL *)&selRef_intValue, (void (*)(uint64_t))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayInt64:)(uint64_t a1, unint64_t a2)
{
  CAFTypeTestWithStatesObservable.typeTestWithStatesService(_:didUpdateTestArrayUInt64:)(a1, a2, &OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayInt64, (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:), (SEL *)&selRef_longLongValue, (void (*)(uint64_t))specialized SafePublished.value.setter);
}

char *CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayFloat:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t i;
  id v8;
  int v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_15_0();
  if (!a2)
  {
    OUTLINED_FUNCTION_40();
LABEL_15:
    OUTLINED_FUNCTION_76_0();
    specialized SafePublished.value.setter();
    OUTLINED_FUNCTION_14_5();
    return (char *)OUTLINED_FUNCTION_27();
  }
  OUTLINED_FUNCTION_85_0();
  if (!v4)
  {
    v5 = *(_QWORD *)(v3 + 16);
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_64_0();
    if (v5)
      goto LABEL_4;
LABEL_14:
    OUTLINED_FUNCTION_39_2();
    goto LABEL_15;
  }
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_64_0();
  v5 = OUTLINED_FUNCTION_61_1();
  if (!v5)
    goto LABEL_14;
LABEL_4:
  v13 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    for (i = 0; i != v5; ++i)
    {
      if ((a2 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_51_2();
      v8 = OUTLINED_FUNCTION_50_1();
      objc_msgSend(v8, sel_floatValue);
      v10 = v9;

      v12 = *(_QWORD *)(v13 + 16);
      v11 = *(_QWORD *)(v13 + 24);
      if (v12 >= v11 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      *(_QWORD *)(v13 + 16) = v12 + 1;
      *(_DWORD *)(v13 + 4 * v12 + 32) = v10;
    }
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayString:)(uint64_t a1, uint64_t a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayString:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayString, (void (*)(uint64_t))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayData:)(uint64_t a1, uint64_t a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayString:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testArrayData, (void (*)(uint64_t))specialized SafePublished.value.setter);
}

uint64_t CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayRawData:)()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_32();
  specialized SafeReadOnlyPublished.value.setter();
  return OUTLINED_FUNCTION_0();
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexItems:)(uint64_t a1, void *a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestComplexItem:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexItems, (void (*)(void *))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexItemValue:)(uint64_t a1, void *a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestComplexItem:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexItemValue, (void (*)(void *))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexItemList:)(uint64_t a1, void *a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestComplexItem:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexItemList, (void (*)(void *))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexArrayItemValue:)(uint64_t a1, void *a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestComplexItem:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexArrayItemValue, (void (*)(void *))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexNestedItemValue:)(uint64_t a1, void *a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestComplexItem:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexNestedItemValue, (void (*)(void *))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexNestedItemList:)(uint64_t a1, void *a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestComplexItem:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexNestedItemList, (void (*)(void *))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexNestedListItemValue:)(uint64_t a1, void *a2)
{
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestComplexItem:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine21CAFTypeTestObservable__testComplexNestedListItemValue, (void (*)(void *))specialized SafePublished.value.setter);
}

void CAFTypeTestObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;

  CAFTypeTestObservable.resetCachedDescription()();
  if ((a3 & 1) != 0)
    OUTLINED_FUNCTION_11();
  else
    specialized CAFObservable.notifyChange()(v4);
}

uint64_t CAFTypeTestObservable.serviceDidUpdate(_:receivedAllValues:)(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return specialized CAFObservable.notifyChange()();
  return result;
}

void sub_2374B73E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_20_0();
  CAFTypeTestObservable.testString.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_11();
}

void sub_2374B7408()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testData.getter();
  v0[1] = v1;
  OUTLINED_FUNCTION_11();
}

void sub_2374B743C()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testComplexItem.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B7460()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testArrayBool.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B7484()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testArrayUInt8.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B74A8()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testArrayUInt16.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B74CC()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testArrayUInt32.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B74F0()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testArrayUInt64.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B7514()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testArrayInt8.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B7538()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testArrayInt16.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B755C()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testArrayInt32.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B7580()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testArrayInt64.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B75A4()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testArrayFloat.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B75C8()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testArrayString.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B75EC()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testArrayData.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B7610()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testComplexItems.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B7634()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testComplexItemValue.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B7658()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testComplexItemList.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B767C()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testComplexArrayItemValue.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B76A0()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testComplexNestedItemValue.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B76C4()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testComplexNestedItemList.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B76E8()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestObservable.testComplexNestedListItemValue.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B770C()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestMulti.testBoolBridged.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B772C(char *a1)
{
  CAFTypeTestMulti.testBoolBridged.setter(*a1);
  OUTLINED_FUNCTION_11();
}

void sub_2374B7750(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt8 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(_QWORD))CAFTypeTestMulti.testUInt8Bridged.setter);
}

void sub_2374B7770(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt16 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(_QWORD))CAFTypeTestMulti.testUInt16Bridged.setter);
}

void sub_2374B7790(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt32 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(unint64_t))CAFTypeTestMulti.testUInt32Bridged.setter);
}

void sub_2374B77B8(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt8 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(_QWORD))CAFTypeTestMulti.testInt8Bridged.setter);
}

void sub_2374B77D8(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt16 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(_QWORD))CAFTypeTestMulti.testInt16Bridged.setter);
}

void sub_2374B77F8(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt32 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(unint64_t))CAFTypeTestIndexByUnit.testInt32Bridged.setter);
}

void sub_2374B7820(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt32 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(unint64_t))CAFTypeTestMulti.testFloatBridged.setter);
}

void sub_2374B7844(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFTypeTestMulti.testData : CAFTypeTestMulti(a1, a2, a3, (SEL *)&selRef_testData);
}

void sub_2374B7864(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFTypeTestMulti.testData : CAFTypeTestMulti(a1, a2, a3, (SEL *)&selRef_testRawData);
}

void sub_2374B7884(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt8 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(_QWORD))CAFTypeTestMulti.testEnumBridged.setter);
}

void sub_2374B78A4(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMultiObservable.testUInt16 : CAFTypeTestMultiObservable(a1, a2, a3, a4, (void (*)(_QWORD))CAFTypeTestMulti.testDimensionUnitRawValueBridged.setter);
}

id sub_2374B78C4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTestComplexItem_, *a1);
}

void sub_2374B78D8()
{
  char **v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestMulti.testArrayBoolBridged.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B78FC()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_20_0();
  CAFTypeTestMulti.testArrayUInt8Bridged.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_11();
}

void sub_2374B7920()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_20_0();
  CAFTypeTestMulti.testArrayUInt16Bridged.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_11();
}

void sub_2374B7944()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_20_0();
  CAFTypeTestMulti.testArrayUInt32Bridged.getter(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11);
  *v0 = v9;
  OUTLINED_FUNCTION_11();
}

void sub_2374B7968()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_20_0();
  CAFTypeTestMulti.testArrayUInt64Bridged.getter(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11);
  *v0 = v9;
  OUTLINED_FUNCTION_11();
}

void sub_2374B798C()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_20_0();
  CAFTypeTestMulti.testArrayInt8Bridged.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_11();
}

void sub_2374B79B0()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_20_0();
  CAFTypeTestMulti.testArrayInt16Bridged.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_11();
}

void sub_2374B79D4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_20_0();
  CAFTypeTestMulti.testArrayInt32Bridged.getter(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11);
  *v0 = v9;
  OUTLINED_FUNCTION_11();
}

void sub_2374B79F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_20_0();
  CAFTypeTestMulti.testArrayInt64Bridged.getter(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11);
  *v0 = v9;
  OUTLINED_FUNCTION_11();
}

void sub_2374B7A1C()
{
  char **v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFTypeTestMulti.testArrayFloatBridged.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374B7A40(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFTypeTestMulti.testArrayString : CAFTypeTestMulti(a1, a2, a3, (SEL *)&selRef_testArrayString);
}

void sub_2374B7A64(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMulti.testArrayString : CAFTypeTestMulti(a1, a2, a3, a4, MEMORY[0x24BEE0D00], (SEL *)&selRef_setTestArrayString_);
}

void sub_2374B7A88(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFTypeTestMulti.testArrayString : CAFTypeTestMulti(a1, a2, a3, (SEL *)&selRef_testArrayData);
}

void sub_2374B7AAC(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  key path setter for CAFTypeTestMulti.testArrayString : CAFTypeTestMulti(a1, a2, a3, a4, MEMORY[0x24BDCDDE8], (SEL *)&selRef_setTestArrayData_);
}

void sub_2374B7AD0(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFTypeTestMulti.testArrayString : CAFTypeTestMulti(a1, a2, a3, (SEL *)&selRef_testArrayRawData);
}

id sub_2374B7AF8(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTestComplexItems_, *a1);
}

id sub_2374B7B10(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTestComplexItemValue_, *a1);
}

id sub_2374B7B28(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTestComplexItemList_, *a1);
}

char *keypath_get_selector_testComplexArrayItemValue()
{
  return sel_testComplexArrayItemValue;
}

id key path getter for CAFTypeTest.testComplexArrayItemValue : CAFTypeTest@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_testComplexArrayItemValue);
  *a2 = result;
  return result;
}

id sub_2374B7B84(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTestComplexArrayItemValue_, *a1);
}

char *keypath_get_selector_testComplexNestedItemValue()
{
  return sel_testComplexNestedItemValue;
}

id key path getter for CAFTypeTest.testComplexNestedItemValue : CAFTypeTest@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_testComplexNestedItemValue);
  *a2 = result;
  return result;
}

id sub_2374B7BE0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTestComplexNestedItemValue_, *a1);
}

char *keypath_get_selector_testComplexNestedItemList()
{
  return sel_testComplexNestedItemList;
}

id key path getter for CAFTypeTest.testComplexNestedItemList : CAFTypeTest@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_testComplexNestedItemList);
  *a2 = result;
  return result;
}

id sub_2374B7C3C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTestComplexNestedItemList_, *a1);
}

char *keypath_get_selector_testComplexNestedListItemValue()
{
  return sel_testComplexNestedListItemValue;
}

id key path getter for CAFTypeTest.testComplexNestedListItemValue : CAFTypeTest@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_testComplexNestedListItemValue);
  *a2 = result;
  return result;
}

id sub_2374B7C98(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTestComplexNestedListItemValue_, *a1);
}

uint64_t type metadata accessor for CAFTypeTestObservable()
{
  return objc_opt_self();
}

void associated type witness table accessor for CAFObserved.Observable : CAFObservable in CAFTypeTest()
{
  lazy protocol witness table accessor for type CAFTypeTestObservable and conformance CAFTypeTestObservable(&lazy protocol witness table cache variable for type CAFTypeTestObservable and conformance CAFTypeTestObservable, (uint64_t)&protocol conformance descriptor for CAFTypeTestObservable);
}

unint64_t lazy protocol witness table accessor for type CAFTypeTest and conformance CAFTypeTest()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type CAFTypeTest and conformance CAFTypeTest;
  if (!lazy protocol witness table cache variable for type CAFTypeTest and conformance CAFTypeTest)
  {
    v1 = type metadata accessor for CAFTemperature(255, &lazy cache variable for type metadata for CAFTypeTest);
    result = MEMORY[0x23B812308](&protocol conformance descriptor for CAFTypeTest, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CAFTypeTest and conformance CAFTypeTest);
  }
  return result;
}

void instantiation function for generic protocol witness table for CAFTypeTestObservable(uint64_t a1)
{
  uint64_t v2;

  lazy protocol witness table accessor for type CAFTypeTestObservable and conformance CAFTypeTestObservable(&lazy protocol witness table cache variable for type CAFTypeTestObservable and conformance CAFTypeTestObservable, (uint64_t)&protocol conformance descriptor for CAFTypeTestObservable);
  *(_QWORD *)(a1 + 8) = v2;
}

void lazy protocol witness table accessor for type CAFTypeTestObservable and conformance CAFTypeTestObservable(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = type metadata accessor for CAFTypeTestObservable();
    atomic_store(MEMORY[0x23B812308](a2, v4), a1);
  }
  OUTLINED_FUNCTION_11();
}

uint64_t method lookup function for CAFTypeTestObservable()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testBool.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testBool.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testBool.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testBool.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

void dispatch thunk of CAFTypeTestObservable.testUInt8.getter()
{
  _QWORD *v0;

  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
  OUTLINED_FUNCTION_74_0();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testUInt8.setter(__int16 a1)
{
  _QWORD *v1;

  return OUTLINED_FUNCTION_26_5(a1 & 0x1FF, *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x1E0));
}

uint64_t dispatch thunk of CAFTypeTestObservable.testUInt8.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testUInt8.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

void dispatch thunk of CAFTypeTestObservable.testUInt16.getter()
{
  _QWORD *v0;

  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F8))();
  OUTLINED_FUNCTION_74_0();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testUInt16.setter(int a1)
{
  _QWORD *v1;

  return OUTLINED_FUNCTION_26_5(a1 & 0x1FFFF, *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x200));
}

uint64_t dispatch thunk of CAFTypeTestObservable.testUInt16.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testUInt16.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x210))();
}

void dispatch thunk of CAFTypeTestObservable.testUInt32.getter()
{
  _QWORD *v0;
  unint64_t v1;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x218))();
  OUTLINED_FUNCTION_118_0(v1);
  OUTLINED_FUNCTION_74_0();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testUInt32.setter(unint64_t a1)
{
  _QWORD *v1;

  return OUTLINED_FUNCTION_38_3(a1, *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x220));
}

uint64_t dispatch thunk of CAFTypeTestObservable.testUInt32.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testUInt32.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testUInt64.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x238))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testUInt64.setter(uint64_t a1, char a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v2) + 0x240))(a1, a2 & 1);
}

uint64_t dispatch thunk of CAFTypeTestObservable.testUInt64.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x248))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testUInt64.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x250))();
}

void dispatch thunk of CAFTypeTestObservable.testInt8.getter()
{
  _QWORD *v0;

  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x258))();
  OUTLINED_FUNCTION_74_0();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testInt8.setter(__int16 a1)
{
  _QWORD *v1;

  return OUTLINED_FUNCTION_26_5(a1 & 0x1FF, *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x260));
}

uint64_t dispatch thunk of CAFTypeTestObservable.testInt8.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x268))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testInt8.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x270))();
}

void dispatch thunk of CAFTypeTestObservable.testInt16.getter()
{
  _QWORD *v0;

  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x278))();
  OUTLINED_FUNCTION_74_0();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testInt16.setter(int a1)
{
  _QWORD *v1;

  return OUTLINED_FUNCTION_26_5(a1 & 0x1FFFF, *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x280));
}

uint64_t dispatch thunk of CAFTypeTestObservable.testInt16.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x288))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testInt16.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x290))();
}

void dispatch thunk of CAFTypeTestObservable.testInt32.getter()
{
  _QWORD *v0;
  unint64_t v1;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x298))();
  OUTLINED_FUNCTION_118_0(v1);
  OUTLINED_FUNCTION_74_0();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testInt32.setter(unint64_t a1)
{
  _QWORD *v1;

  return OUTLINED_FUNCTION_38_3(a1, *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x2A0));
}

uint64_t dispatch thunk of CAFTypeTestObservable.testInt32.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testInt32.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testInt64.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testInt64.setter(uint64_t a1, char a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v2) + 0x2C0))(a1, a2 & 1);
}

uint64_t dispatch thunk of CAFTypeTestObservable.testInt64.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testInt64.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2D0))();
}

void dispatch thunk of CAFTypeTestObservable.testFloat.getter()
{
  _QWORD *v0;
  unint64_t v1;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2D8))();
  OUTLINED_FUNCTION_118_0(v1);
  OUTLINED_FUNCTION_74_0();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testFloat.setter(unint64_t a1)
{
  _QWORD *v1;

  return OUTLINED_FUNCTION_38_3(a1, *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x2E0));
}

uint64_t dispatch thunk of CAFTypeTestObservable.testFloat.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testFloat.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testString.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x300))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testString.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x308))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x310))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testData.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x318))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testData.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x320))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testData.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x328))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testData.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x330))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testRawData.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x338))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testRawData.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x340))();
}

void dispatch thunk of CAFTypeTestObservable.testEnum.getter()
{
  _QWORD *v0;

  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x348))();
  OUTLINED_FUNCTION_74_0();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testEnum.setter(__int16 a1)
{
  _QWORD *v1;

  return OUTLINED_FUNCTION_26_5(a1 & 0x1FF, *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x350));
}

uint64_t dispatch thunk of CAFTypeTestObservable.testEnum.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x358))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testEnum.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x360))();
}

void dispatch thunk of CAFTypeTestObservable.testDimensionUnitRawValue.getter()
{
  _QWORD *v0;

  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x368))();
  OUTLINED_FUNCTION_74_0();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testDimensionUnitRawValue.setter(int a1)
{
  _QWORD *v1;

  return OUTLINED_FUNCTION_26_5(a1 & 0x1FFFF, *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x370));
}

uint64_t dispatch thunk of CAFTypeTestObservable.testDimensionUnitRawValue.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x378))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testDimensionUnitRawValue.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x380))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexItem.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x388))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexItem.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x390))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexItem.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x398))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testComplexItem.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3A0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayBool.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3A8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayBool.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3B0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayBool.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3B8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testArrayBool.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayUInt8.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayUInt8.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3D0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayUInt8.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3D8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testArrayUInt8.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3E0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayUInt16.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3E8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayUInt16.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayUInt16.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testArrayUInt16.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x400))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayUInt32.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x408))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayUInt32.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x410))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayUInt32.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x418))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testArrayUInt32.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x420))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayUInt64.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x428))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayUInt64.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x430))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayUInt64.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x438))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testArrayUInt64.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x440))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayInt8.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x448))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayInt8.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x450))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayInt8.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x458))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testArrayInt8.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x460))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayInt16.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x468))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayInt16.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x470))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayInt16.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x478))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testArrayInt16.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x480))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayInt32.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x488))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayInt32.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x490))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayInt32.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x498))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testArrayInt32.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4A0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayInt64.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4A8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayInt64.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4B0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayInt64.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4B8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testArrayInt64.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4C0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayFloat.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4C8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayFloat.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4D0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayFloat.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4D8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testArrayFloat.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4E0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4E8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayString.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4F0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayString.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4F8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testArrayString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x500))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayData.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x508))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayData.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x510))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayData.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x518))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testArrayData.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x520))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testArrayRawData.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x528))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testArrayRawData.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x530))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexItems.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x538))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexItems.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x540))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexItems.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x548))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testComplexItems.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x550))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexItemValue.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x558))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexItemValue.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x560))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexItemValue.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x568))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testComplexItemValue.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x570))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexItemList.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x578))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexItemList.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x580))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexItemList.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x588))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testComplexItemList.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x590))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexArrayItemValue.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x598))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexArrayItemValue.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x5A0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexArrayItemValue.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x5A8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testComplexArrayItemValue.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x5B0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexNestedItemValue.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x5B8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexNestedItemValue.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x5C0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexNestedItemValue.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x5C8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testComplexNestedItemValue.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x5D0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexNestedItemList.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x5D8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexNestedItemList.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x5E0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexNestedItemList.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x5E8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testComplexNestedItemList.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x5F0))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexNestedListItemValue.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x5F8))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexNestedListItemValue.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x600))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.testComplexNestedListItemValue.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x608))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.$testComplexNestedListItemValue.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x610))();
}

uint64_t dispatch thunk of CAFTypeTestObservable.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1568))();
}

uint64_t partial apply for closure #1 in CAFTypeTestObservable.resetCachedDescription()()
{
  return CAFTypeTestObservable.cachedDescription.setter(0, 0);
}

void OUTLINED_FUNCTION_30_2(uint64_t a1@<X8>)
{
  uint64_t v1;
  Swift::String v2;

  v2._object = (void *)((a1 - 32) | 0x8000000000000000);
  v2._countAndFlagsBits = v1;
  String.append(_:)(v2);
}

void OUTLINED_FUNCTION_66_1(uint64_t a1@<X8>)
{
  uint64_t v1;
  Swift::String v2;

  v2._object = (void *)((a1 - 32) | 0x8000000000000000);
  v2._countAndFlagsBits = v1;
  String.append(_:)(v2);
}

uint64_t OUTLINED_FUNCTION_80_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return specialized static SafePublished.subscript.setter(v2, v3, a1, v4, v1);
}

uint64_t OUTLINED_FUNCTION_82_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return specialized static SafePublished.subscript.setter(v0, v1, v3, v4, v2);
}

void OUTLINED_FUNCTION_89_0()
{
  void *v0;

  specialized static SafePublished.subscript.getter(v0);
}

void OUTLINED_FUNCTION_94_0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_QWORD *)(v1 + 24) = a1;
  specialized static SafePublished.subscript.getter(v2);
}

void OUTLINED_FUNCTION_133_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t OUTLINED_FUNCTION_139_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t static CAFPairedDeviceState.allCases.getter()
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  return swift_bridgeObjectRetain();
}

uint64_t static CAFPairedDeviceState.allCases.setter(uint64_t a1)
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  static CAFPairedDeviceState.allCases = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static CAFPairedDeviceState.allCases.modify())()
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  return static CAFLockState.allCases.modify;
}

uint64_t CAFPairedDeviceState.description.getter()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = (id)NSStringFromPairedDeviceState();
  if (!v0)
    return 0x6E776F6E6B6E7528;
  v1 = v0;
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t instantiation function for generic protocol witness table for CAFPairedDeviceState(_QWORD *a1)
{
  uint64_t result;

  a1[1] = lazy protocol witness table accessor for type CAFPairedDeviceState and conformance CAFPairedDeviceState(&lazy protocol witness table cache variable for type CAFPairedDeviceState and conformance CAFPairedDeviceState, (uint64_t)&protocol conformance descriptor for CAFPairedDeviceState);
  a1[2] = lazy protocol witness table accessor for type CAFPairedDeviceState and conformance CAFPairedDeviceState(&lazy protocol witness table cache variable for type CAFPairedDeviceState and conformance CAFPairedDeviceState, (uint64_t)&protocol conformance descriptor for CAFPairedDeviceState);
  result = lazy protocol witness table accessor for type CAFPairedDeviceState and conformance CAFPairedDeviceState(&lazy protocol witness table cache variable for type CAFPairedDeviceState and conformance CAFPairedDeviceState, (uint64_t)&protocol conformance descriptor for CAFPairedDeviceState);
  a1[3] = result;
  return result;
}

uint64_t lazy protocol witness table accessor for type CAFPairedDeviceState and conformance CAFPairedDeviceState(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CAFPairedDeviceState(255);
    result = MEMORY[0x23B812308](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CAFPairedDeviceState()
{
  return CAFPairedDeviceState.description.getter();
}

unint64_t lazy protocol witness table accessor for type [CAFPairedDeviceState] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [CAFPairedDeviceState] and conformance [A];
  if (!lazy protocol witness table cache variable for type [CAFPairedDeviceState] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [CAFPairedDeviceState]);
    result = MEMORY[0x23B812308](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [CAFPairedDeviceState] and conformance [A]);
  }
  return result;
}

uint64_t protocol witness for static CaseIterable.allCases.getter in conformance CAFPairedDeviceState@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static CAFPairedDeviceState.allCases.getter();
  *a1 = result;
  return result;
}

void protocol witness for Identifiable.id.getter in conformance CAFPairedDeviceState(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;

  specialized CAFEnum.id.getter(*v1);
  *a1 = v3;
  a1[1] = v4;
}

uint64_t static CAFPressureState.allCases.getter()
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  return swift_bridgeObjectRetain();
}

uint64_t static CAFPressureState.allCases.setter(uint64_t a1)
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  static CAFPressureState.allCases = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static CAFPressureState.allCases.modify())()
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  return static CAFLockState.allCases.modify;
}

uint64_t CAFPressureState.description.getter()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = (id)NSStringFromPressureState();
  if (!v0)
    return 0x6E776F6E6B6E7528;
  v1 = v0;
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t instantiation function for generic protocol witness table for CAFPressureState(_QWORD *a1)
{
  uint64_t result;

  a1[1] = lazy protocol witness table accessor for type CAFPressureState and conformance CAFPressureState(&lazy protocol witness table cache variable for type CAFPressureState and conformance CAFPressureState, (uint64_t)&protocol conformance descriptor for CAFPressureState);
  a1[2] = lazy protocol witness table accessor for type CAFPressureState and conformance CAFPressureState(&lazy protocol witness table cache variable for type CAFPressureState and conformance CAFPressureState, (uint64_t)&protocol conformance descriptor for CAFPressureState);
  result = lazy protocol witness table accessor for type CAFPressureState and conformance CAFPressureState(&lazy protocol witness table cache variable for type CAFPressureState and conformance CAFPressureState, (uint64_t)&protocol conformance descriptor for CAFPressureState);
  a1[3] = result;
  return result;
}

uint64_t lazy protocol witness table accessor for type CAFPressureState and conformance CAFPressureState(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CAFPressureState(255);
    result = MEMORY[0x23B812308](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CAFPressureState()
{
  return CAFPressureState.description.getter();
}

unint64_t lazy protocol witness table accessor for type [CAFPressureState] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [CAFPressureState] and conformance [A];
  if (!lazy protocol witness table cache variable for type [CAFPressureState] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [CAFPressureState]);
    result = MEMORY[0x23B812308](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [CAFPressureState] and conformance [A]);
  }
  return result;
}

uint64_t protocol witness for static CaseIterable.allCases.getter in conformance CAFPressureState@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static CAFPressureState.allCases.getter();
  *a1 = result;
  return result;
}

void protocol witness for Identifiable.id.getter in conformance CAFPressureState(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;

  specialized CAFEnum.id.getter(*v1);
  *a1 = v3;
  a1[1] = v4;
}

uint64_t static CAFAutoModeIntensity.allCases.getter()
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  return swift_bridgeObjectRetain();
}

uint64_t static CAFAutoModeIntensity.allCases.setter(uint64_t a1)
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  static CAFAutoModeIntensity.allCases = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static CAFAutoModeIntensity.allCases.modify())()
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  return static CAFLockState.allCases.modify;
}

uint64_t CAFAutoModeIntensity.description.getter()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = (id)NSStringFromAutoModeIntensity();
  if (!v0)
    return 0x6E776F6E6B6E7528;
  v1 = v0;
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t instantiation function for generic protocol witness table for CAFAutoModeIntensity(_QWORD *a1)
{
  uint64_t result;

  a1[1] = lazy protocol witness table accessor for type CAFAutoModeIntensity and conformance CAFAutoModeIntensity(&lazy protocol witness table cache variable for type CAFAutoModeIntensity and conformance CAFAutoModeIntensity, (uint64_t)&protocol conformance descriptor for CAFAutoModeIntensity);
  a1[2] = lazy protocol witness table accessor for type CAFAutoModeIntensity and conformance CAFAutoModeIntensity(&lazy protocol witness table cache variable for type CAFAutoModeIntensity and conformance CAFAutoModeIntensity, (uint64_t)&protocol conformance descriptor for CAFAutoModeIntensity);
  result = lazy protocol witness table accessor for type CAFAutoModeIntensity and conformance CAFAutoModeIntensity(&lazy protocol witness table cache variable for type CAFAutoModeIntensity and conformance CAFAutoModeIntensity, (uint64_t)&protocol conformance descriptor for CAFAutoModeIntensity);
  a1[3] = result;
  return result;
}

uint64_t lazy protocol witness table accessor for type CAFAutoModeIntensity and conformance CAFAutoModeIntensity(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CAFAutoModeIntensity(255);
    result = MEMORY[0x23B812308](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CAFAutoModeIntensity()
{
  return CAFAutoModeIntensity.description.getter();
}

unint64_t lazy protocol witness table accessor for type [CAFAutoModeIntensity] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [CAFAutoModeIntensity] and conformance [A];
  if (!lazy protocol witness table cache variable for type [CAFAutoModeIntensity] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [CAFAutoModeIntensity]);
    result = MEMORY[0x23B812308](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [CAFAutoModeIntensity] and conformance [A]);
  }
  return result;
}

uint64_t protocol witness for static CaseIterable.allCases.getter in conformance CAFAutoModeIntensity@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static CAFAutoModeIntensity.allCases.getter();
  *a1 = result;
  return result;
}

void protocol witness for Identifiable.id.getter in conformance CAFAutoModeIntensity(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;

  specialized CAFEnum.id.getter(*v1);
  *a1 = v3;
  a1[1] = v4;
}

id CAFTypeTestIndexByPositionObservable.observed.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_observed);
}

uint64_t CAFTypeTestIndexByPositionObservable.cachedDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_cachedDescription);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t CAFTypeTestIndexByPositionObservable.vehicleLayoutKey.getter()
{
  return CAFTypeTestIndexByPositionObservable.vehicleLayoutKey.getter();
}

{
  uint64_t v0;
  id v1;
  void *v3;
  uint64_t v4;

  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v3;
  swift_getAtKeyPath();

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37();
  return v4;
}

void CAFTypeTestIndexByPositionObservable.$vehicleLayoutKey.getter()
{
  CAFTypeTestIndexByPositionObservable.$vehicleLayoutKey.getter();
}

{
  OUTLINED_FUNCTION_32();
  specialized SafePublished.projectedValue.getter();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_11();
}

unint64_t key path getter for CAFTypeTestIndexByPositionObservable.testInt32 : CAFTypeTestIndexByPositionObservable@<X0>(uint64_t a1@<X8>)
{
  unint64_t result;

  result = CAFTypeTestIndexByPositionObservable.testInt32.getter();
  *(_DWORD *)a1 = result;
  *(_BYTE *)(a1 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t key path setter for CAFTypeTestIndexByPositionObservable.testInt32 : CAFTypeTestIndexByPositionObservable(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CAFTypeTestIndexByUnitObservable.testInt32 : CAFTypeTestIndexByUnitObservable(a1, a2, a3, a4, CAFTypeTestIndexByPositionObservable.testInt32.setter);
}

unint64_t CAFTypeTestIndexByPositionObservable.testInt32.getter()
{
  uint64_t v0;
  id v1;
  void (*v2)(_BYTE *, _QWORD);
  unsigned int *v3;
  uint64_t v4;
  unsigned __int8 v5;
  _BYTE v7[32];
  id v8;

  OUTLINED_FUNCTION_15_0();
  v8 = *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v8;
  v2 = (void (*)(_BYTE *, _QWORD))swift_readAtKeyPath();
  v4 = *v3;
  v5 = *((_BYTE *)v3 + 4);
  v2(v7, 0);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_27();

  return v4 | ((unint64_t)v5 << 32);
}

uint64_t CAFTypeTestIndexByPositionObservable.testInt32.setter(unint64_t a1)
{
  void *v1;
  uint64_t KeyPath;
  uint64_t v4;

  KeyPath = swift_getKeyPath();
  v4 = swift_getKeyPath();
  return specialized static SafePublished.subscript.setter(a1 | ((HIDWORD(a1) & 1) << 32), v1, KeyPath, v4);
}

void (*CAFTypeTestIndexByPositionObservable.testInt32.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  void (*v6)(void *, _QWORD);
  uint64_t v7;
  char v8;

  v3 = malloc(0x60uLL);
  *a1 = v3;
  *((_QWORD *)v3 + 8) = v1;
  *((_QWORD *)v3 + 9) = swift_getKeyPath();
  *((_QWORD *)v3 + 10) = swift_getKeyPath();
  OUTLINED_FUNCTION_15_0();
  v4 = *(void **)(v1 + OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_observed);
  *((_QWORD *)v3 + 7) = v4;
  OUTLINED_FUNCTION_146();
  swift_retain();
  v5 = v4;
  v6 = (void (*)(void *, _QWORD))swift_readAtKeyPath();
  LODWORD(v4) = *(_DWORD *)v7;
  v8 = *(_BYTE *)(v7 + 4);
  v6(v3, 0);
  swift_release();
  OUTLINED_FUNCTION_37();

  *((_DWORD *)v3 + 22) = (_DWORD)v4;
  *((_BYTE *)v3 + 92) = v8;
  return CAFTypeTestIndexByPositionObservable.testInt32.modify;
}

void CAFTypeTestIndexByPositionObservable.testInt32.modify(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)a1;
  specialized static SafePublished.subscript.setter(*(unsigned int *)(*(_QWORD *)a1 + 88) | ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)a1 + 92) << 32), *(id *)(*(_QWORD *)a1 + 64), v1[9], v1[10]);
  free(v1);
}

uint64_t CAFTypeTestIndexByPositionObservable.$testInt32.getter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_32();
  specialized SafePublished.projectedValue.getter();
  v1 = v0;
  OUTLINED_FUNCTION_25();
  return v1;
}

uint64_t CAFTypeTestIndexByPositionObservable.name.getter()
{
  return CAFTypeTestIndexByPositionObservable.vehicleLayoutKey.getter();
}

void CAFTypeTestIndexByPositionObservable.$name.getter()
{
  CAFTypeTestIndexByPositionObservable.$vehicleLayoutKey.getter();
}

uint64_t CAFTypeTestIndexByPositionObservable._description.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_observed);
  v2 = 0x73696765726E753CLL;
  v3 = (void *)0xEE003E6465726574;
  if (objc_msgSend(v1, sel_registeredForVehicleLayoutKey))
  {
    v2 = CAFTypeTestIndexByPositionObservable.vehicleLayoutKey.getter();
    v3 = v4;
  }
  if (objc_msgSend(v1, sel_registeredForTestInt32))
  {
    CAFTypeTestIndexByPositionObservable.testInt32.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int32?);
    String.init<A>(describing:)();
  }
  _StringGuts.grow(_:)(82);
  v5._countAndFlagsBits = 0xD000000000000027;
  v5._object = (void *)0x80000002374E44C0;
  String.append(_:)(v5);
  _print_unlocked<A, B>(_:_:)();
  v6._object = (void *)0x80000002374E4090;
  v6._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v6);
  v7._countAndFlagsBits = v2;
  v7._object = v3;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x6E4974736574202CLL;
  v8._object = (void *)0xED0000203A323374;
  String.append(_:)(v8);
  v9._countAndFlagsBits = OUTLINED_FUNCTION_31_0();
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 4095264;
  v10._object = (void *)0xE300000000000000;
  String.append(_:)(v10);
  return 0;
}

uint64_t CAFTypeTestIndexByPositionObservable.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_cachedDescriptionLock;
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v2);
  OUTLINED_FUNCTION_27();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_cachedDescription + 8))
  {
    v3 = *(os_unfair_lock_s **)(v0 + v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    CAFTypeTestIndexByPositionObservable._description.getter();
    swift_bridgeObjectRetain();
    v4 = OUTLINED_FUNCTION_31_0();
    CAFTypeTestIndexByPositionObservable.cachedDescription.setter(v4, v5);
    v3 = *(os_unfair_lock_s **)(v0 + v1);
  }
  OUTLINED_FUNCTION_32();
  os_unfair_lock_unlock(v3 + 4);
  OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_31_0();
}

void CAFTypeTestIndexByPositionObservable.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  CAFTypeTestIndexByPositionObservable.init(_:)(a1);
  OUTLINED_FUNCTION_11();
}

id CAFTypeTestIndexByPositionObservable.init(_:)(void *a1)
{
  char *v1;
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  objc_super v17;

  v2 = v1;
  v4 = &v1[OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_cachedDescription];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_cachedDescriptionLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)&v2[v5] = v6;
  v7 = OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable__vehicleLayoutKey;
  KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFTypeTestIndexByPositionObservable, String>);
  OUTLINED_FUNCTION_127();
  v9 = v2;
  *(_QWORD *)&v2[v7] = specialized SafePublished.init(observedValuekeypath:)(KeyPath);
  v10 = OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable__testInt32;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SafePublished<CAFTypeTestIndexByPositionObservable, Int32?>);
  OUTLINED_FUNCTION_127();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v9[v10] = v11;
  v12 = OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable__name;
  v13 = swift_getKeyPath();
  swift_allocObject();
  *(_QWORD *)&v9[v12] = specialized SafePublished.init(observedValuekeypath:)(v13);
  *(_QWORD *)&v9[OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_observed] = a1;
  v14 = a1;

  v17.receiver = v9;
  v17.super_class = (Class)type metadata accessor for CAFTypeTestIndexByPositionObservable();
  v15 = objc_msgSendSuper2(&v17, sel_init);
  objc_msgSend(v14, sel_registerObserver_, v15);

  return v15;
}

uint64_t CAFTypeTestIndexByPositionObservable.resetCachedDescription()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v1);
  specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(v2, partial apply for closure #1 in CAFTypeTestIndexByPositionObservable.resetCachedDescription());
  os_unfair_lock_unlock(v1);
  return OUTLINED_FUNCTION_27();
}

id CAFTypeTestIndexByPositionObservable.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC10CAFCombine36CAFTypeTestIndexByPositionObservable_observed], sel_unregisterObserver_, v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAFTypeTestIndexByPositionObservable();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id CAFTypeTestIndexByPositionObservable.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CAFTypeTestIndexByPositionObservable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id protocol witness for CAFObservable.observed.getter in conformance CAFTypeTestIndexByPositionObservable@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = CAFTypeTestIndexByPositionObservable.observed.getter();
  *a1 = result;
  return result;
}

void protocol witness for CAFObservable.init(_:) in conformance CAFTypeTestIndexByPositionObservable(void **a1)
{
  CAFTypeTestIndexByPositionObservable.__allocating_init(_:)(*a1);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance CAFTypeTestIndexByPositionObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CAFTypeTestIndexByPositionObservable();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t CAFTypeTestIndexByPositionObservable.typeTestIndexByPositionService(_:didUpdateVehicleLayoutKey:)()
{
  return CAFTypeTestIndexByPositionObservable.typeTestIndexByPositionService(_:didUpdateVehicleLayoutKey:)();
}

{
  OUTLINED_FUNCTION_32();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31_0();
  specialized SafeReadOnlyPublished.value.setter();
  return swift_release();
}

uint64_t CAFTypeTestIndexByPositionObservable.typeTestIndexByPositionService(_:didUpdateTestInt32:)()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_32();
  specialized SafePublished.value.setter();
  return OUTLINED_FUNCTION_25();
}

uint64_t CAFTypeTestIndexByPositionObservable.typeTestIndexByPositionService(_:didUpdateName:)()
{
  return CAFTypeTestIndexByPositionObservable.typeTestIndexByPositionService(_:didUpdateVehicleLayoutKey:)();
}

uint64_t CAFTypeTestIndexByPositionObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  result = CAFTypeTestIndexByPositionObservable.resetCachedDescription()();
  if ((a3 & 1) == 0)
    return specialized CAFObservable.notifyChange()(result);
  return result;
}

uint64_t CAFTypeTestIndexByPositionObservable.serviceDidUpdate(_:receivedAllValues:)(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return specialized CAFObservable.notifyChange()();
  return result;
}

void sub_2374BA534(id *a1@<X0>, uint64_t *a2@<X8>)
{
  key path getter for CAFTemperature.vehicleLayoutKey : CAFTemperature(a1, (SEL *)&selRef_vehicleLayoutKey, a2);
}

uint64_t sub_2374BA554(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CAFTypeTestIndexByUnitObservable.testInt32 : CAFTypeTestIndexByUnitObservable(a1, a2, a3, a4, (uint64_t (*)(unint64_t))CAFTypeTestIndexByUnit.testInt32Bridged.setter);
}

void sub_2374BA570(id *a1@<X0>, uint64_t *a2@<X8>)
{
  key path getter for CAFTemperature.vehicleLayoutKey : CAFTemperature(a1, (SEL *)&selRef_name, a2);
}

uint64_t type metadata accessor for CAFTypeTestIndexByPositionObservable()
{
  return objc_opt_self();
}

void associated type witness table accessor for CAFObserved.Observable : CAFObservable in CAFTypeTestIndexByPosition(uint64_t a1, uint64_t a2)
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFTypeTestIndexByPositionObservable and conformance CAFTypeTestIndexByPositionObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFTypeTestIndexByPositionObservable, (uint64_t)&protocol conformance descriptor for CAFTypeTestIndexByPositionObservable);
}

void associated type witness table accessor for CAFObservable.Observed : CAFObserved in CAFTypeTestIndexByPositionObservable()
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFTypeTestIndexByPosition and conformance CAFTypeTestIndexByPosition, 255, (uint64_t (*)(uint64_t))type metadata accessor for CAFTypeTestIndexByPosition, (uint64_t)&protocol conformance descriptor for CAFTypeTestIndexByPosition);
}

unint64_t type metadata accessor for CAFTypeTestIndexByPosition()
{
  unint64_t result;

  result = lazy cache variable for type metadata for CAFTypeTestIndexByPosition;
  if (!lazy cache variable for type metadata for CAFTypeTestIndexByPosition)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CAFTypeTestIndexByPosition);
  }
  return result;
}

void instantiation function for generic protocol witness table for CAFTypeTestIndexByPositionObservable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFTypeTestIndexByPositionObservable and conformance CAFTypeTestIndexByPositionObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFTypeTestIndexByPositionObservable, (uint64_t)&protocol conformance descriptor for CAFTypeTestIndexByPositionObservable);
  *(_QWORD *)(a1 + 8) = v3;
}

uint64_t method lookup function for CAFTypeTestIndexByPositionObservable()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CAFTypeTestIndexByPositionObservable.vehicleLayoutKey.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CAFTypeTestIndexByPositionObservable.$vehicleLayoutKey.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of CAFTypeTestIndexByPositionObservable.testInt32.getter()
{
  _QWORD *v0;
  unint64_t v1;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of CAFTypeTestIndexByPositionObservable.testInt32.setter(unint64_t a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(unint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0xC8))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of CAFTypeTestIndexByPositionObservable.testInt32.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CAFTypeTestIndexByPositionObservable.$testInt32.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CAFTypeTestIndexByPositionObservable.name.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of CAFTypeTestIndexByPositionObservable.$name.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CAFTypeTestIndexByPositionObservable.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t partial apply for closure #1 in CAFTypeTestIndexByPositionObservable.resetCachedDescription()()
{
  return CAFTypeTestIndexByPositionObservable.cachedDescription.setter(0, 0);
}

uint64_t static CAFPortSideIndicator.allCases.getter()
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  return swift_bridgeObjectRetain();
}

uint64_t static CAFPortSideIndicator.allCases.setter(uint64_t a1)
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  static CAFPortSideIndicator.allCases = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static CAFPortSideIndicator.allCases.modify())()
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  return static CAFLockState.allCases.modify;
}

uint64_t CAFPortSideIndicator.description.getter()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = (id)NSStringFromPortSideIndicator();
  if (!v0)
    return 0x6E776F6E6B6E7528;
  v1 = v0;
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t instantiation function for generic protocol witness table for CAFPortSideIndicator(_QWORD *a1)
{
  uint64_t result;

  a1[1] = lazy protocol witness table accessor for type CAFPortSideIndicator and conformance CAFPortSideIndicator(&lazy protocol witness table cache variable for type CAFPortSideIndicator and conformance CAFPortSideIndicator, (uint64_t)&protocol conformance descriptor for CAFPortSideIndicator);
  a1[2] = lazy protocol witness table accessor for type CAFPortSideIndicator and conformance CAFPortSideIndicator(&lazy protocol witness table cache variable for type CAFPortSideIndicator and conformance CAFPortSideIndicator, (uint64_t)&protocol conformance descriptor for CAFPortSideIndicator);
  result = lazy protocol witness table accessor for type CAFPortSideIndicator and conformance CAFPortSideIndicator(&lazy protocol witness table cache variable for type CAFPortSideIndicator and conformance CAFPortSideIndicator, (uint64_t)&protocol conformance descriptor for CAFPortSideIndicator);
  a1[3] = result;
  return result;
}

uint64_t lazy protocol witness table accessor for type CAFPortSideIndicator and conformance CAFPortSideIndicator(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CAFPortSideIndicator(255);
    result = MEMORY[0x23B812308](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CAFPortSideIndicator()
{
  return CAFPortSideIndicator.description.getter();
}

unint64_t lazy protocol witness table accessor for type [CAFPortSideIndicator] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [CAFPortSideIndicator] and conformance [A];
  if (!lazy protocol witness table cache variable for type [CAFPortSideIndicator] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [CAFPortSideIndicator]);
    result = MEMORY[0x23B812308](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [CAFPortSideIndicator] and conformance [A]);
  }
  return result;
}

uint64_t protocol witness for static CaseIterable.allCases.getter in conformance CAFPortSideIndicator@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static CAFPortSideIndicator.allCases.getter();
  *a1 = result;
  return result;
}

void protocol witness for Identifiable.id.getter in conformance CAFPortSideIndicator(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;

  specialized CAFEnum.id.getter(*v1);
  *a1 = v3;
  a1[1] = v4;
}

void specialized CAFEnum.id.getter(uint64_t a1)
{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFLockState.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFMediaCategory.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFVentTypes.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFSeatOccupancy.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFFuelLevelState.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFDeviceAction.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFPlaybackState.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFUIInputDeviceButtonEvent.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFButtonAction.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFMediaSourceSemanticType.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFUIInputDevicePurpose.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFCableState.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFChargingState.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFBatteryLevelState.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFEqualizerType.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFSensorState.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFTemperatureState.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFImageColor.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFSeatBeltIndicator.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFTransmissionMode.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFFillLevelLabel.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFUISceneState.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFRotationalSpeedState.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFNotificationSeverity.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFTargetSpeedState.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFSettingProminenceLevel.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFVolumeType.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFDefrostTypes.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFPairedDeviceState.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFPressureState.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFAutoModeIntensity.description.getter);
}

{
  specialized CAFEnum.id.getter(a1, (void (*)(void))CAFPortSideIndicator.description.getter);
}

void specialized CAFEnum.id.getter(uint64_t a1, void (*a2)(void))
{
  Swift::String v4;

  a2();
  OUTLINED_FUNCTION_0_11();
  v4._countAndFlagsBits = ((uint64_t (*)(uint64_t))a2)(a1);
  OUTLINED_FUNCTION_2_11(v4);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_56_0();
}

uint64_t static CAFSettingsCategory.allCases.getter()
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  return swift_bridgeObjectRetain();
}

uint64_t static CAFSettingsCategory.allCases.setter(uint64_t a1)
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  static CAFSettingsCategory.allCases = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static CAFSettingsCategory.allCases.modify())()
{
  if (one-time initialization token for allCases != -1)
    swift_once();
  OUTLINED_FUNCTION_15();
  return static CAFLockState.allCases.modify;
}

uint64_t CAFSettingsCategory.description.getter()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = (id)NSStringFromSettingsCategory();
  if (!v0)
    return 0x6E776F6E6B6E7528;
  v1 = v0;
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t instantiation function for generic protocol witness table for CAFSettingsCategory(_QWORD *a1)
{
  uint64_t result;

  a1[1] = lazy protocol witness table accessor for type CAFSettingsCategory and conformance CAFSettingsCategory(&lazy protocol witness table cache variable for type CAFSettingsCategory and conformance CAFSettingsCategory, (uint64_t)&protocol conformance descriptor for CAFSettingsCategory);
  a1[2] = lazy protocol witness table accessor for type CAFSettingsCategory and conformance CAFSettingsCategory(&lazy protocol witness table cache variable for type CAFSettingsCategory and conformance CAFSettingsCategory, (uint64_t)&protocol conformance descriptor for CAFSettingsCategory);
  result = lazy protocol witness table accessor for type CAFSettingsCategory and conformance CAFSettingsCategory(&lazy protocol witness table cache variable for type CAFSettingsCategory and conformance CAFSettingsCategory, (uint64_t)&protocol conformance descriptor for CAFSettingsCategory);
  a1[3] = result;
  return result;
}

uint64_t lazy protocol witness table accessor for type CAFSettingsCategory and conformance CAFSettingsCategory(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CAFSettingsCategory(255);
    result = MEMORY[0x23B812308](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CAFSettingsCategory()
{
  return CAFSettingsCategory.description.getter();
}

unint64_t lazy protocol witness table accessor for type [CAFSettingsCategory] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [CAFSettingsCategory] and conformance [A];
  if (!lazy protocol witness table cache variable for type [CAFSettingsCategory] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [CAFSettingsCategory]);
    result = MEMORY[0x23B812308](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [CAFSettingsCategory] and conformance [A]);
  }
  return result;
}

uint64_t protocol witness for static CaseIterable.allCases.getter in conformance CAFSettingsCategory@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static CAFSettingsCategory.allCases.getter();
  *a1 = result;
  return result;
}

void protocol witness for Identifiable.id.getter in conformance CAFSettingsCategory(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;

  specialized CAFEnum.id.getter(*v1, (void (*)(void))CAFSettingsCategory.description.getter);
  *a1 = v3;
  a1[1] = v4;
}

void OUTLINED_FUNCTION_0_11()
{
  Swift::String v0;

  v0._countAndFlagsBits = 46;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
}

void OUTLINED_FUNCTION_2_11(Swift::String a1)
{
  String.append(_:)(a1);
}

id CAFTransmissionStatusObservable.observed.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_observed);
}

uint64_t CAFTransmissionStatusObservable.cachedDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_cachedDescription);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

void CAFTransmissionStatusObservable.transmissionMode.getter()
{
  uint64_t v0;
  id v1;
  void *v2;

  v2 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_observed);
  OUTLINED_FUNCTION_40();
  swift_retain();
  v1 = v2;
  OUTLINED_FUNCTION_10_6();

  OUTLINED_FUNCTION_27();
  swift_release();
  OUTLINED_FUNCTION_56_0();
}

void CAFTransmissionStatusObservable.$transmissionMode.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable__transmissionMode, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

void CAFTransmissionStatusObservable.gearPosition.getter()
{
  uint64_t v0;
  id v1;
  void *v2;

  v2 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_observed);
  OUTLINED_FUNCTION_40();
  swift_retain();
  v1 = v2;
  OUTLINED_FUNCTION_10_6();

  OUTLINED_FUNCTION_27();
  swift_release();
  OUTLINED_FUNCTION_56_0();
}

void CAFTransmissionStatusObservable.$gearPosition.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable__gearPosition, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t CAFTransmissionStatusObservable._description.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;

  v1 = (void *)0xEE003E6465726574;
  v2 = 0x73696765726E753CLL;
  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_observed);
  v4 = 0x73696765726E753CLL;
  v5 = (void *)0xEE003E6465726574;
  if (objc_msgSend(v3, sel_registeredForTransmissionMode))
  {
    CAFTransmissionStatusObservable.transmissionMode.getter();
    v6 = (id)NSStringFromTransmissionMode();
    if (v6)
    {
      v7 = v6;
      v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v5 = v8;

    }
    else
    {
      v5 = (void *)0xE900000000000029;
      v4 = 0x6E776F6E6B6E7528;
    }
  }
  if (objc_msgSend(v3, sel_registeredForGearPosition))
  {
    CAFTransmissionStatusObservable.gearPosition.getter();
    v2 = dispatch thunk of CustomStringConvertible.description.getter();
    v1 = v9;
  }
  _StringGuts.grow(_:)(80);
  OUTLINED_FUNCTION_12_0(0xD000000000000022, (uint64_t)"<CAFTransmissionStatusObservable: ");
  _print_unlocked<A, B>(_:_:)();
  OUTLINED_FUNCTION_12_0(0xD000000000000015, (uint64_t)" { transmissionMode: ");
  v10._countAndFlagsBits = v4;
  v10._object = v5;
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  v11._object = (void *)0x80000002374E45D0;
  v11._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v11);
  v12._countAndFlagsBits = v2;
  v12._object = v1;
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 4095264;
  v13._object = (void *)0xE300000000000000;
  String.append(_:)(v13);
  return 0;
}

uint64_t CAFTransmissionStatusObservable.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_cachedDescriptionLock;
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v2);
  OUTLINED_FUNCTION_27();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_cachedDescription + 8))
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_cachedDescription);
    v4 = *(os_unfair_lock_s **)(v0 + v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    v3 = CAFTransmissionStatusObservable._description.getter();
    v6 = v5;
    swift_bridgeObjectRetain();
    CAFTransmissionStatusObservable.cachedDescription.setter(v3, v6);
    v4 = *(os_unfair_lock_s **)(v0 + v1);
  }
  swift_retain();
  os_unfair_lock_unlock(v4 + 4);
  swift_release();
  return v3;
}

void CAFTransmissionStatusObservable.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  CAFTransmissionStatusObservable.init(_:)(a1);
  OUTLINED_FUNCTION_11();
}

id CAFTransmissionStatusObservable.init(_:)(void *a1)
{
  char *v1;
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  objc_super v15;

  v2 = v1;
  v4 = &v1[OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_cachedDescription];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_cachedDescriptionLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)&v2[v5] = v6;
  v7 = OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable__transmissionMode;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFTransmissionStatusObservable, CAFTransmissionMode>);
  OUTLINED_FUNCTION_127();
  v8 = v2;
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v2[v7] = v9;
  v10 = OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable__gearPosition;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFTransmissionStatusObservable, UInt8>);
  OUTLINED_FUNCTION_127();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v8[v10] = v11;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_observed] = a1;
  v12 = a1;

  v15.receiver = v8;
  v15.super_class = (Class)type metadata accessor for CAFTransmissionStatusObservable();
  v13 = objc_msgSendSuper2(&v15, sel_init);
  objc_msgSend(v12, sel_registerObserver_, v13);

  return v13;
}

uint64_t CAFTransmissionStatusObservable.resetCachedDescription()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v1);
  specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(v2, partial apply for closure #1 in CAFTransmissionStatusObservable.resetCachedDescription());
  os_unfair_lock_unlock(v1);
  return OUTLINED_FUNCTION_27();
}

id CAFTransmissionStatusObservable.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable_observed], sel_unregisterObserver_, v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAFTransmissionStatusObservable();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id CAFTransmissionStatusObservable.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CAFTransmissionStatusObservable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id protocol witness for CAFObservable.observed.getter in conformance CAFTransmissionStatusObservable@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = CAFTransmissionStatusObservable.observed.getter();
  *a1 = result;
  return result;
}

void protocol witness for CAFObservable.init(_:) in conformance CAFTransmissionStatusObservable(void **a1)
{
  CAFTransmissionStatusObservable.__allocating_init(_:)(*a1);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance CAFTransmissionStatusObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CAFTransmissionStatusObservable();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t CAFTransmissionStatusObservable.transmissionStatusService(_:didUpdateTransmissionMode:)(uint64_t a1, unsigned __int8 a2)
{
  return CAFUIInputDeviceButtonObservable.uIInputDeviceService(_:didUpdateUiInputDevicePurpose:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable__transmissionMode, (void (*)(_QWORD))specialized SafeReadOnlyPublished.value.setter);
}

uint64_t CAFTransmissionStatusObservable.transmissionStatusService(_:didUpdateGearPosition:)(uint64_t a1, unsigned __int8 a2)
{
  return CAFUIInputDeviceButtonObservable.uIInputDeviceService(_:didUpdateUiInputDevicePurpose:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine31CAFTransmissionStatusObservable__gearPosition, (void (*)(_QWORD))specialized SafeReadOnlyPublished.value.setter);
}

void CAFTransmissionStatusObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;

  v4 = CAFTransmissionStatusObservable.resetCachedDescription()();
  if ((a3 & 1) != 0)
    OUTLINED_FUNCTION_11();
  else
    specialized CAFObservable.notifyChange()(v4);
}

uint64_t CAFTransmissionStatusObservable.serviceDidUpdate(_:receivedAllValues:)(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return specialized CAFObservable.notifyChange()();
  return result;
}

char *keypath_get_selector_transmissionMode()
{
  return sel_transmissionMode;
}

void sub_2374BB980(id *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = objc_msgSend(*a1, sel_transmissionMode);
  OUTLINED_FUNCTION_11();
}

char *keypath_get_selector_gearPosition()
{
  return sel_gearPosition;
}

void sub_2374BB9B8(id *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = objc_msgSend(*a1, sel_gearPosition);
  OUTLINED_FUNCTION_11();
}

uint64_t type metadata accessor for CAFTransmissionStatusObservable()
{
  return objc_opt_self();
}

void associated type witness table accessor for CAFObserved.Observable : CAFObservable in CAFTransmissionStatus(uint64_t a1, uint64_t a2)
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFTransmissionStatusObservable and conformance CAFTransmissionStatusObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFTransmissionStatusObservable, (uint64_t)&protocol conformance descriptor for CAFTransmissionStatusObservable);
}

void associated type witness table accessor for CAFObservable.Observed : CAFObserved in CAFTransmissionStatusObservable()
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFTransmissionStatus and conformance CAFTransmissionStatus, 255, (uint64_t (*)(uint64_t))type metadata accessor for CAFTransmissionStatus, (uint64_t)&protocol conformance descriptor for CAFTransmissionStatus);
}

unint64_t type metadata accessor for CAFTransmissionStatus()
{
  unint64_t result;

  result = lazy cache variable for type metadata for CAFTransmissionStatus;
  if (!lazy cache variable for type metadata for CAFTransmissionStatus)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CAFTransmissionStatus);
  }
  return result;
}

void instantiation function for generic protocol witness table for CAFTransmissionStatusObservable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFTransmissionStatusObservable and conformance CAFTransmissionStatusObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFTransmissionStatusObservable, (uint64_t)&protocol conformance descriptor for CAFTransmissionStatusObservable);
  *(_QWORD *)(a1 + 8) = v3;
}

uint64_t method lookup function for CAFTransmissionStatusObservable()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CAFTransmissionStatusObservable.transmissionMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CAFTransmissionStatusObservable.$transmissionMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CAFTransmissionStatusObservable.gearPosition.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of CAFTransmissionStatusObservable.$gearPosition.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CAFTransmissionStatusObservable.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t partial apply for closure #1 in CAFTransmissionStatusObservable.resetCachedDescription()()
{
  return CAFTransmissionStatusObservable.cachedDescription.setter(0, 0);
}

id CAFVehicleVariantObservable.observed.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable_observed);
}

uint64_t CAFVehicleVariantObservable.cachedDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable_cachedDescription);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

void CAFVehicleVariantObservable.exteriorStyle.getter()
{
  CAFVehicleVariantObservable.exteriorStyle.getter();
}

{
  uint64_t v0;
  id v1;
  void *v2;

  v2 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable_observed);
  OUTLINED_FUNCTION_40();
  swift_retain();
  v1 = v2;
  OUTLINED_FUNCTION_29_0();

  OUTLINED_FUNCTION_27();
  swift_release();
  OUTLINED_FUNCTION_33_0();
}

void CAFVehicleVariantObservable.$exteriorStyle.getter()
{
  CAFVehicleVariantObservable.$exteriorStyle.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable__exteriorStyle, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFVehicleVariantObservable.interiorStyle.getter()
{
  CAFVehicleVariantObservable.exteriorStyle.getter();
}

void CAFVehicleVariantObservable.$interiorStyle.getter()
{
  CAFVehicleVariantObservable.$exteriorStyle.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable__interiorStyle, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFVehicleVariantObservable.vehicleLayout.getter()
{
  CAFVehicleVariantObservable.exteriorStyle.getter();
}

void CAFVehicleVariantObservable.$vehicleLayout.getter()
{
  CAFVehicleVariantObservable.$exteriorStyle.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable__vehicleLayout, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFVehicleVariantObservable.audioLogo.getter()
{
  CAFVehicleVariantObservable.exteriorStyle.getter();
}

void CAFVehicleVariantObservable.$audioLogo.getter()
{
  CAFVehicleVariantObservable.$exteriorStyle.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable__audioLogo, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFVehicleVariantObservable.vehicleLogo.getter()
{
  CAFVehicleVariantObservable.exteriorStyle.getter();
}

void CAFVehicleVariantObservable.$vehicleLogo.getter()
{
  CAFVehicleVariantObservable.$exteriorStyle.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable__vehicleLogo, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFVehicleVariantObservable.$exteriorStyle.getter(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_32();
  a2(v3);
  swift_release();
  OUTLINED_FUNCTION_11();
}

uint64_t CAFVehicleVariantObservable._description.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  Swift::String v24;
  Swift::String v25;
  Swift::String v26;
  Swift::String v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v0 = (void *)0xEE003E6465726574;
  OUTLINED_FUNCTION_2_4();
  v31 = v1;
  OUTLINED_FUNCTION_12_3(v2, sel_registeredForExteriorStyle);
  OUTLINED_FUNCTION_2_4();
  v5 = (void *)0xEE003E6465726574;
  if ((_DWORD)v3)
  {
    CAFVehicleVariantObservable.exteriorStyle.getter();
    v4 = v3;
    v5 = v6;
  }
  v30 = v4;
  OUTLINED_FUNCTION_12_3(v3, sel_registeredForInteriorStyle);
  OUTLINED_FUNCTION_2_4();
  v9 = (void *)0xEE003E6465726574;
  if ((_DWORD)v7)
  {
    CAFVehicleVariantObservable.interiorStyle.getter();
    v8 = v7;
    v9 = v10;
  }
  v29 = v8;
  v11 = (uint64_t)OUTLINED_FUNCTION_12_3(v7, sel_registeredForVehicleLayout);
  v12 = 0x73696765726E753CLL;
  v13 = (void *)0xEE003E6465726574;
  if ((_DWORD)v11)
  {
    CAFVehicleVariantObservable.vehicleLayout.getter();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
    v11 = OUTLINED_FUNCTION_28_1();
    v12 = v11;
    v13 = v14;
  }
  v15 = (uint64_t)OUTLINED_FUNCTION_12_3(v11, sel_registeredForAudioLogo);
  v16 = 0x73696765726E753CLL;
  v17 = (void *)0xEE003E6465726574;
  if ((_DWORD)v15)
  {
    CAFVehicleVariantObservable.audioLogo.getter();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
    v15 = OUTLINED_FUNCTION_28_1();
    v16 = v15;
    v17 = v18;
  }
  if (OUTLINED_FUNCTION_12_3(v15, sel_registeredForVehicleLogo))
  {
    CAFVehicleVariantObservable.vehicleLogo.getter();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
    v31 = OUTLINED_FUNCTION_28_1();
    v0 = v19;
  }
  _StringGuts.grow(_:)(125);
  OUTLINED_FUNCTION_21_2(0xD00000000000001ELL, (uint64_t)"<CAFVehicleVariantObservable: ");
  _print_unlocked<A, B>(_:_:)();
  OUTLINED_FUNCTION_21_2(0xD000000000000012, (uint64_t)" { exteriorStyle: ");
  v20._countAndFlagsBits = v30;
  v20._object = v5;
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_12((uint64_t)", interiorStyle: ");
  v21._countAndFlagsBits = v29;
  v21._object = v9;
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_12((uint64_t)", vehicleLayout: ");
  v22._countAndFlagsBits = v12;
  v22._object = v13;
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  v23._countAndFlagsBits = 0x4C6F69647561202CLL;
  v23._object = (void *)0xED0000203A6F676FLL;
  String.append(_:)(v23);
  v24._countAndFlagsBits = v16;
  v24._object = v17;
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  v25._countAndFlagsBits = 0x6C6369686576202CLL;
  v25._object = (void *)0xEF203A6F676F4C65;
  String.append(_:)(v25);
  v26._countAndFlagsBits = v31;
  v26._object = v0;
  String.append(_:)(v26);
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = 4095264;
  v27._object = (void *)0xE300000000000000;
  String.append(_:)(v27);
  return 0;
}

uint64_t CAFVehicleVariantObservable.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable_cachedDescriptionLock;
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v2);
  OUTLINED_FUNCTION_27();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable_cachedDescription + 8))
  {
    v3 = *(os_unfair_lock_s **)(v0 + v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    CAFVehicleVariantObservable._description.getter();
    swift_bridgeObjectRetain();
    v4 = OUTLINED_FUNCTION_31_0();
    CAFVehicleVariantObservable.cachedDescription.setter(v4, v5);
    v3 = *(os_unfair_lock_s **)(v0 + v1);
  }
  OUTLINED_FUNCTION_32();
  os_unfair_lock_unlock(v3 + 4);
  swift_release();
  return OUTLINED_FUNCTION_31_0();
}

void CAFVehicleVariantObservable.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  CAFVehicleVariantObservable.init(_:)(a1);
  OUTLINED_FUNCTION_11();
}

id CAFVehicleVariantObservable.init(_:)(void *a1)
{
  char *v1;
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  objc_super v18;

  v2 = v1;
  v4 = &v1[OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable_cachedDescription];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable_cachedDescriptionLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)&v2[v5] = v6;
  v7 = OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable__exteriorStyle;
  KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFVehicleVariantObservable, String>);
  OUTLINED_FUNCTION_127();
  v9 = v2;
  *(_QWORD *)&v2[v7] = specialized SafePublished.init(observedValuekeypath:)(KeyPath);
  v10 = OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable__interiorStyle;
  v11 = swift_getKeyPath();
  swift_allocObject();
  *(_QWORD *)&v9[v10] = specialized SafePublished.init(observedValuekeypath:)(v11);
  v12 = OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable__vehicleLayout;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFVehicleVariantObservable, String?>);
  OUTLINED_FUNCTION_127();
  *(_QWORD *)&v9[v12] = OUTLINED_FUNCTION_32_0();
  v13 = OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable__audioLogo;
  swift_getKeyPath();
  OUTLINED_FUNCTION_46_0();
  *(_QWORD *)&v9[v13] = OUTLINED_FUNCTION_32_0();
  v14 = OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable__vehicleLogo;
  swift_getKeyPath();
  OUTLINED_FUNCTION_46_0();
  *(_QWORD *)&v9[v14] = OUTLINED_FUNCTION_32_0();
  *(_QWORD *)&v9[OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable_observed] = a1;
  v15 = a1;

  v18.receiver = v9;
  v18.super_class = (Class)type metadata accessor for CAFVehicleVariantObservable();
  v16 = objc_msgSendSuper2(&v18, sel_init);
  objc_msgSend(v15, sel_registerObserver_, v16);

  return v16;
}

uint64_t CAFVehicleVariantObservable.resetCachedDescription()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v1);
  specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(v2, partial apply for closure #1 in CAFVehicleVariantObservable.resetCachedDescription());
  os_unfair_lock_unlock(v1);
  return OUTLINED_FUNCTION_27();
}

id CAFVehicleVariantObservable.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC10CAFCombine27CAFVehicleVariantObservable_observed], sel_unregisterObserver_, v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAFVehicleVariantObservable();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id CAFVehicleVariantObservable.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CAFVehicleVariantObservable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id protocol witness for CAFObservable.observed.getter in conformance CAFVehicleVariantObservable@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = CAFVehicleVariantObservable.observed.getter();
  *a1 = result;
  return result;
}

void protocol witness for CAFObservable.init(_:) in conformance CAFVehicleVariantObservable(void **a1)
{
  CAFVehicleVariantObservable.__allocating_init(_:)(*a1);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance CAFVehicleVariantObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CAFVehicleVariantObservable();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateExteriorStyle:)()
{
  return CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateExteriorStyle:)();
}

{
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_32();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31_0();
  specialized SafeReadOnlyPublished.value.setter();
  return OUTLINED_FUNCTION_18_0();
}

uint64_t CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateInteriorStyle:)()
{
  return CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateExteriorStyle:)();
}

uint64_t CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateVehicleLayout:)()
{
  return CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateVehicleLayout:)();
}

{
  OUTLINED_FUNCTION_28_2();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_31_0();
  specialized SafeReadOnlyPublished.value.setter();
  return OUTLINED_FUNCTION_18_0();
}

uint64_t CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateAudioLogo:)()
{
  return CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateVehicleLayout:)();
}

uint64_t CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateVehicleLogo:)()
{
  return CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateVehicleLayout:)();
}

uint64_t CAFVehicleVariantObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  result = CAFVehicleVariantObservable.resetCachedDescription()();
  if ((a3 & 1) == 0)
    return specialized CAFObservable.notifyChange()(result);
  return result;
}

uint64_t CAFVehicleVariantObservable.serviceDidUpdate(_:receivedAllValues:)(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return specialized CAFObservable.notifyChange()();
  return result;
}

char *keypath_get_selector_exteriorStyle()
{
  return sel_exteriorStyle;
}

void sub_2374BC748(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFAutomakerSetting.userVisibleLabel : CAFButtonSetting(a1, a2, a3, (SEL *)&selRef_exteriorStyle);
}

char *keypath_get_selector_interiorStyle()
{
  return sel_interiorStyle;
}

void sub_2374BC770(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFAutomakerSetting.userVisibleLabel : CAFButtonSetting(a1, a2, a3, (SEL *)&selRef_interiorStyle);
}

char *keypath_get_selector_vehicleLayout()
{
  return sel_vehicleLayout;
}

void sub_2374BC798(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFAutomakerSetting.sectionIdentifier : CAFButtonSetting(a1, a2, a3, (SEL *)&selRef_vehicleLayout);
}

char *keypath_get_selector_audioLogo()
{
  return sel_audioLogo;
}

void sub_2374BC7C0(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFAutomakerSetting.sectionIdentifier : CAFButtonSetting(a1, a2, a3, (SEL *)&selRef_audioLogo);
}

char *keypath_get_selector_vehicleLogo()
{
  return sel_vehicleLogo;
}

void sub_2374BC7E8(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFAutomakerSetting.sectionIdentifier : CAFButtonSetting(a1, a2, a3, (SEL *)&selRef_vehicleLogo);
}

uint64_t type metadata accessor for CAFVehicleVariantObservable()
{
  return objc_opt_self();
}

void associated type witness table accessor for CAFObserved.Observable : CAFObservable in CAFVehicleVariant(uint64_t a1, uint64_t a2)
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(lazy protocol witness table cache variable for type CAFVehicleVariantObservable and conformance CAFVehicleVariantObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFVehicleVariantObservable, (uint64_t)&protocol conformance descriptor for CAFVehicleVariantObservable);
}

void associated type witness table accessor for CAFObservable.Observed : CAFObserved in CAFVehicleVariantObservable()
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFVehicleVariant and conformance CAFVehicleVariant, 255, (uint64_t (*)(uint64_t))type metadata accessor for CAFVehicleVariant, (uint64_t)&protocol conformance descriptor for CAFVehicleVariant);
}

unint64_t type metadata accessor for CAFVehicleVariant()
{
  unint64_t result;

  result = lazy cache variable for type metadata for CAFVehicleVariant;
  if (!lazy cache variable for type metadata for CAFVehicleVariant)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CAFVehicleVariant);
  }
  return result;
}

void instantiation function for generic protocol witness table for CAFVehicleVariantObservable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFVehicleVariantObservable and conformance CAFVehicleVariantObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFVehicleVariantObservable, (uint64_t)&protocol conformance descriptor for CAFVehicleVariantObservable);
  *(_QWORD *)(a1 + 8) = v3;
}

uint64_t method lookup function for CAFVehicleVariantObservable()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CAFVehicleVariantObservable.exteriorStyle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CAFVehicleVariantObservable.$exteriorStyle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CAFVehicleVariantObservable.interiorStyle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CAFVehicleVariantObservable.$interiorStyle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CAFVehicleVariantObservable.vehicleLayout.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of CAFVehicleVariantObservable.$vehicleLayout.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CAFVehicleVariantObservable.audioLogo.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of CAFVehicleVariantObservable.$audioLogo.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of CAFVehicleVariantObservable.vehicleLogo.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CAFVehicleVariantObservable.$vehicleLogo.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CAFVehicleVariantObservable.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t partial apply for closure #1 in CAFVehicleVariantObservable.resetCachedDescription()()
{
  return CAFVehicleVariantObservable.cachedDescription.setter(0, 0);
}

void OUTLINED_FUNCTION_2_12(uint64_t a1@<X8>)
{
  Swift::String v1;

  v1._object = (void *)((a1 - 32) | 0x8000000000000000);
  v1._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v1);
}

uint64_t CAFDisplayedSpeed.showSecondarySpeedBridged.getter()
{
  void *v0;

  if (objc_msgSend(v0, sel_hasShowSecondarySpeed))
    return (uint64_t)objc_msgSend(v0, sel_showSecondarySpeed);
  else
    return 2;
}

id CAFDisplayedSpeedObservable.observed.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable_observed);
}

uint64_t CAFDisplayedSpeedObservable.cachedDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable_cachedDescription);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t CAFDisplayedSpeedObservable.speed.getter()
{
  return CAFDisplayedSpeedObservable.speed.getter();
}

{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable_observed);
  swift_retain();
  swift_retain();
  v1 = v3;
  swift_getAtKeyPath();

  swift_release();
  return swift_release();
}

void CAFDisplayedSpeedObservable.$speed.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable__speed, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFDisplayedSpeedObservable.speedKMH.getter()
{
  return CAFDisplayedSpeedObservable.speed.getter();
}

void CAFDisplayedSpeedObservable.$speedKMH.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable__speedKMH, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFDisplayedSpeedObservable.speedMPH.getter()
{
  return CAFDisplayedSpeedObservable.speed.getter();
}

void CAFDisplayedSpeedObservable.$speedMPH.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable__speedMPH, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFDisplayedSpeedObservable.speedMaxKMH.getter()
{
  return CAFDisplayedSpeedObservable.speed.getter();
}

void CAFDisplayedSpeedObservable.$speedMaxKMH.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable__speedMaxKMH, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFDisplayedSpeedObservable.speedMaxMPH.getter()
{
  return CAFDisplayedSpeedObservable.speed.getter();
}

void CAFDisplayedSpeedObservable.$speedMaxMPH.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable__speedMaxMPH, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFDisplayedSpeedObservable.showSecondarySpeed.getter()
{
  uint64_t v0;
  id v1;
  void *v3;
  unsigned __int8 v4;

  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable_observed);
  OUTLINED_FUNCTION_40();
  swift_retain();
  v1 = v3;
  swift_getAtKeyPath();

  OUTLINED_FUNCTION_27();
  swift_release();
  return v4;
}

void CAFDisplayedSpeedObservable.$showSecondarySpeed.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable__showSecondarySpeed, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t CAFDisplayedSpeedObservable._description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v2 = (uint64_t)OUTLINED_FUNCTION_7_3(v1, sel_registeredForSpeedMaxKMH);
  v3 = 0x73696765726E753CLL;
  v4 = (void *)0xEE003E6465726574;
  if ((_DWORD)v2)
  {
    CAFDisplayedSpeedObservable.speedMaxKMH.getter();
    lazy protocol witness table accessor for type Measurement<NSUnitSpeed> and conformance Measurement<A>();
    v3 = OUTLINED_FUNCTION_6_4();
    v4 = v5;
    v2 = OUTLINED_FUNCTION_5_9();
  }
  v6 = (uint64_t)OUTLINED_FUNCTION_7_3(v2, sel_registeredForSpeedMaxMPH);
  v7 = 0x73696765726E753CLL;
  v8 = (void *)0xEE003E6465726574;
  if ((_DWORD)v6)
  {
    CAFDisplayedSpeedObservable.speedMaxMPH.getter();
    lazy protocol witness table accessor for type Measurement<NSUnitSpeed> and conformance Measurement<A>();
    v7 = OUTLINED_FUNCTION_6_4();
    v8 = v9;
    v6 = OUTLINED_FUNCTION_5_9();
  }
  v10 = (void *)0xEE003E6465726574;
  v11 = 0x73696765726E753CLL;
  if (OUTLINED_FUNCTION_7_3(v6, sel_registeredForShowSecondarySpeed))
  {
    CAFDisplayedSpeedObservable.showSecondarySpeed.getter();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Bool?);
    v11 = String.init<A>(describing:)();
    v10 = v12;
  }
  _StringGuts.grow(_:)(94);
  OUTLINED_FUNCTION_128(0xD00000000000001ELL, (uint64_t)"<CAFDisplayedSpeedObservable: ");
  _print_unlocked<A, B>(_:_:)();
  v13._object = (void *)0x80000002374E47F0;
  v13._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v13);
  v14._countAndFlagsBits = v3;
  v14._object = v4;
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 0x4D6465657073202CLL;
  v15._object = (void *)0xEF203A48504D7861;
  String.append(_:)(v15);
  v16._countAndFlagsBits = v7;
  v16._object = v8;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_128(0xD000000000000016, (uint64_t)", showSecondarySpeed: ");
  v17._countAndFlagsBits = v11;
  v17._object = v10;
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 4095264;
  v18._object = (void *)0xE300000000000000;
  String.append(_:)(v18);
  return 0;
}

uint64_t CAFDisplayedSpeedObservable.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable_cachedDescriptionLock;
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v2);
  OUTLINED_FUNCTION_27();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable_cachedDescription + 8))
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable_cachedDescription);
    v4 = *(os_unfair_lock_s **)(v0 + v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    v3 = CAFDisplayedSpeedObservable._description.getter();
    v6 = v5;
    swift_bridgeObjectRetain();
    CAFDisplayedSpeedObservable.cachedDescription.setter(v3, v6);
    v4 = *(os_unfair_lock_s **)(v0 + v1);
  }
  swift_retain();
  os_unfair_lock_unlock(v4 + 4);
  swift_release();
  return v3;
}

void CAFDisplayedSpeedObservable.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  CAFDisplayedSpeedObservable.init(_:)(a1);
  OUTLINED_FUNCTION_11();
}

id CAFDisplayedSpeedObservable.init(_:)(void *a1)
{
  char *v1;
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  id v20;
  id v21;
  objc_super v23;

  v2 = v1;
  v4 = &v1[OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable_cachedDescription];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable_cachedDescriptionLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)&v2[v5] = v6;
  v7 = OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable__speed;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFDisplayedSpeedObservable, Measurement<NSUnitSpeed>>);
  OUTLINED_FUNCTION_127();
  v8 = v2;
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v2[v7] = v9;
  v10 = OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable__speedKMH;
  swift_getKeyPath();
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_10_7();
  *(_QWORD *)&v8[v10] = v11;
  v12 = OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable__speedMPH;
  swift_getKeyPath();
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_10_7();
  *(_QWORD *)&v8[v12] = v13;
  v14 = OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable__speedMaxKMH;
  swift_getKeyPath();
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_10_7();
  *(_QWORD *)&v8[v14] = v15;
  v16 = OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable__speedMaxMPH;
  swift_getKeyPath();
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_10_7();
  *(_QWORD *)&v8[v16] = v17;
  v18 = OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable__showSecondarySpeed;
  KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFDisplayedSpeedObservable, Bool?>);
  OUTLINED_FUNCTION_127();
  *(_QWORD *)&v8[v18] = specialized SafePublished.init(observedValuekeypath:)(KeyPath);
  *(_QWORD *)&v8[OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable_observed] = a1;
  v20 = a1;

  v23.receiver = v8;
  v23.super_class = (Class)type metadata accessor for CAFDisplayedSpeedObservable();
  v21 = objc_msgSendSuper2(&v23, sel_init);
  objc_msgSend(v20, sel_registerObserver_, v21);

  return v21;
}

uint64_t CAFDisplayedSpeedObservable.resetCachedDescription()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v1);
  specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(v2, partial apply for closure #1 in CAFDisplayedSpeedObservable.resetCachedDescription());
  os_unfair_lock_unlock(v1);
  return OUTLINED_FUNCTION_27();
}

id CAFDisplayedSpeedObservable.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC10CAFCombine27CAFDisplayedSpeedObservable_observed], sel_unregisterObserver_, v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAFDisplayedSpeedObservable();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id CAFDisplayedSpeedObservable.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CAFDisplayedSpeedObservable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id protocol witness for CAFObservable.observed.getter in conformance CAFDisplayedSpeedObservable@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = CAFDisplayedSpeedObservable.observed.getter();
  *a1 = result;
  return result;
}

void protocol witness for CAFObservable.init(_:) in conformance CAFDisplayedSpeedObservable(void **a1)
{
  CAFDisplayedSpeedObservable.__allocating_init(_:)(*a1);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance CAFDisplayedSpeedObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CAFDisplayedSpeedObservable();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeed:)(uint64_t a1, uint64_t a2)
{
  return CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeed:)(a1, a2);
}

{
  OUTLINED_FUNCTION_15_1();
  specialized SafeReadOnlyPublished.setValue(_:)(a2);
  return OUTLINED_FUNCTION_0();
}

uint64_t CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeedKMH:)(uint64_t a1, uint64_t a2)
{
  return CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeed:)(a1, a2);
}

uint64_t @objc CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeed:)(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for NSUnitSpeed);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = a3;
  v13 = a1;
  a5();

  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeedMPH:)(uint64_t a1, uint64_t a2)
{
  return CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeed:)(a1, a2);
}

uint64_t CAFDisplayedSpeedObservable.displayedSpeedService(_:didUpdateSpeedMaxKMH:)(uint64_t a1, uint64_t a2)
{
  return CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeed:)(a1, a2);
}

uint64_t CAFDisplayedSpeedObservable.displayedSpeedService(_:didUpdateSpeedMaxMPH:)(uint64_t a1, uint64_t a2)
{
  return CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeed:)(a1, a2);
}

uint64_t CAFDisplayedSpeedObservable.displayedSpeedService(_:didUpdateShowSecondarySpeed:)()
{
  OUTLINED_FUNCTION_15_1();
  specialized SafeReadOnlyPublished.value.setter();
  return OUTLINED_FUNCTION_0();
}

uint64_t CAFDisplayedSpeedObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  result = CAFDisplayedSpeedObservable.resetCachedDescription()();
  if ((a3 & 1) == 0)
    return specialized CAFObservable.notifyChange()(result);
  return result;
}

uint64_t CAFDisplayedSpeedObservable.serviceDidUpdate(_:receivedAllValues:)(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return specialized CAFObservable.notifyChange()();
  return result;
}

char *keypath_get_selector_speed()
{
  return sel_speed;
}

void sub_2374BD790(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFTargetSpeed.speedKMH : CAFTargetSpeed(a1, a2, a3, (SEL *)&selRef_speed);
}

void sub_2374BD7AC(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFTargetSpeed.speedKMH : CAFTargetSpeed(a1, a2, a3, (SEL *)&selRef_speedKMH);
}

void sub_2374BD7C8(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFTargetSpeed.speedKMH : CAFTargetSpeed(a1, a2, a3, (SEL *)&selRef_speedMPH);
}

char *keypath_get_selector_speedMaxKMH()
{
  return sel_speedMaxKMH;
}

void sub_2374BD7F0(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFTargetSpeed.speedKMH : CAFTargetSpeed(a1, a2, a3, (SEL *)&selRef_speedMaxKMH);
}

char *keypath_get_selector_speedMaxMPH()
{
  return sel_speedMaxMPH;
}

void sub_2374BD818(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFTargetSpeed.speedKMH : CAFTargetSpeed(a1, a2, a3, (SEL *)&selRef_speedMaxMPH);
}

uint64_t sub_2374BD834@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = CAFDisplayedSpeed.showSecondarySpeedBridged.getter();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for CAFDisplayedSpeedObservable()
{
  return objc_opt_self();
}

void associated type witness table accessor for CAFObserved.Observable : CAFObservable in CAFDisplayedSpeed()
{
  lazy protocol witness table accessor for type CAFDisplayedSpeedObservable and conformance CAFDisplayedSpeedObservable(&lazy protocol witness table cache variable for type CAFDisplayedSpeedObservable and conformance CAFDisplayedSpeedObservable, (uint64_t)&protocol conformance descriptor for CAFDisplayedSpeedObservable);
}

unint64_t lazy protocol witness table accessor for type CAFDisplayedSpeed and conformance CAFDisplayedSpeed()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type CAFDisplayedSpeed and conformance CAFDisplayedSpeed;
  if (!lazy protocol witness table cache variable for type CAFDisplayedSpeed and conformance CAFDisplayedSpeed)
  {
    v1 = type metadata accessor for CAFTemperature(255, &lazy cache variable for type metadata for CAFDisplayedSpeed);
    result = MEMORY[0x23B812308](&protocol conformance descriptor for CAFDisplayedSpeed, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CAFDisplayedSpeed and conformance CAFDisplayedSpeed);
  }
  return result;
}

void instantiation function for generic protocol witness table for CAFDisplayedSpeedObservable(uint64_t a1)
{
  uint64_t v2;

  lazy protocol witness table accessor for type CAFDisplayedSpeedObservable and conformance CAFDisplayedSpeedObservable(&lazy protocol witness table cache variable for type CAFDisplayedSpeedObservable and conformance CAFDisplayedSpeedObservable, (uint64_t)&protocol conformance descriptor for CAFDisplayedSpeedObservable);
  *(_QWORD *)(a1 + 8) = v2;
}

void lazy protocol witness table accessor for type CAFDisplayedSpeedObservable and conformance CAFDisplayedSpeedObservable(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = type metadata accessor for CAFDisplayedSpeedObservable();
    atomic_store(MEMORY[0x23B812308](a2, v4), a1);
  }
  OUTLINED_FUNCTION_11();
}

uint64_t method lookup function for CAFDisplayedSpeedObservable()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CAFDisplayedSpeedObservable.speed.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CAFDisplayedSpeedObservable.$speed.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CAFDisplayedSpeedObservable.speedKMH.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CAFDisplayedSpeedObservable.$speedKMH.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of CAFDisplayedSpeedObservable.speedMPH.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CAFDisplayedSpeedObservable.$speedMPH.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of CAFDisplayedSpeedObservable.speedMaxKMH.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of CAFDisplayedSpeedObservable.$speedMaxKMH.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CAFDisplayedSpeedObservable.speedMaxMPH.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CAFDisplayedSpeedObservable.$speedMaxMPH.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of CAFDisplayedSpeedObservable.showSecondarySpeed.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of CAFDisplayedSpeedObservable.$showSecondarySpeed.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of CAFDisplayedSpeedObservable.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t partial apply for closure #1 in CAFDisplayedSpeedObservable.resetCachedDescription()()
{
  return CAFDisplayedSpeedObservable.cachedDescription.setter(0, 0);
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

void static SafeReadOnlyPublished.subscript.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_9_0();
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_15_7();
  swift_unknownObjectRetain();
  swift_getAtKeyPath();
  swift_unknownObjectRelease();
  SafePublished.observedValuekeypath.getter();
  (*(void (**)(uint64_t, uint64_t))(v2 + 32))(v3, v2);
  swift_getAtKeyPath();
  swift_release();
  OUTLINED_FUNCTION_23_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, AssociatedTypeWitness);
  OUTLINED_FUNCTION_5();
}

void static SafePublished.subscript.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_9_0();
  v6 = v1;
  v2 = v0[12];
  v3 = v0[10];
  v4 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_18_6();
  swift_readAtKeyPath();
  OUTLINED_FUNCTION_16_9();
  OUTLINED_FUNCTION_14_6();
  swift_unknownObjectRelease();
  SafePublished.observedValuekeypath.getter();
  (*(void (**)(uint64_t, uint64_t))(v2 + 32))(v3, v2);
  swift_retain();
  swift_readAtKeyPath();
  (*(void (**)(uint64_t))(*(_QWORD *)(v0[11] - 8) + 16))(v6);
  OUTLINED_FUNCTION_14_6();
  OUTLINED_FUNCTION_23_2();
  swift_release_n();
  OUTLINED_FUNCTION_20_6(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_5();
}

void static SafePublished.subscript.setter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_9_0();
  v23 = v1;
  v24 = v2;
  v25 = v3;
  v4 = v0[11];
  type metadata accessor for Optional();
  OUTLINED_FUNCTION_5_10();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v21 = (uint64_t)&v19 - v7;
  v22 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v0[12];
  v11 = v0[10];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v19 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v20 = AssociatedTypeWitness;
  OUTLINED_FUNCTION_5_10();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v19 - v14;
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_5_10();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_15_7();
  dispatch thunk of ObservableObject.objectWillChange.getter();
  type metadata accessor for ObservableObjectPublisher();
  if ((swift_dynamicCast() & 1) != 0)
  {
    ObservableObjectPublisher.send()();
    swift_release();
  }
  OUTLINED_FUNCTION_18_6();
  swift_retain();
  swift_readAtKeyPath();
  OUTLINED_FUNCTION_16_9();
  OUTLINED_FUNCTION_14_6();
  swift_release();
  swift_unknownObjectRelease();
  SafePublished.observedValuekeypath.getter();
  (*(void (**)(uint64_t, uint64_t))(v10 + 32))(v11, v10);
  v17 = v22;
  OUTLINED_FUNCTION_22_8((uint64_t)v9);
  swift_setAtReferenceWritableKeyPath();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v15, v20);
  v18 = v21;
  OUTLINED_FUNCTION_22_8(v21);
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v4);
  SafePublished.value.setter();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_23_2();
  swift_release();
  OUTLINED_FUNCTION_20_6(*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8));
  OUTLINED_FUNCTION_5();
}

uint64_t SafePublished.observedValuekeypath.getter()
{
  return swift_retain();
}

uint64_t SafePublished.value.getter()
{
  return SafePublished.value.getter();
}

{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  return swift_release();
}

void SafePublished.value.setter()
{
  SafePublished.value.setter();
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_9_0();
  v2 = v1;
  v3 = *v0;
  v4 = *(_QWORD *)(*v0 + 88);
  v5 = type metadata accessor for Optional();
  v6 = *(_QWORD *)(v5 - 8);
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v12 - v8;
  v13 = *(_QWORD *)(v3 + 80);
  v10 = v13;
  v14 = v4;
  v11 = *(_QWORD *)(v3 + 96);
  v15 = v11;
  swift_getKeyPath();
  v12[0] = v10;
  v12[1] = v4;
  v12[2] = v11;
  swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v2, v5);
  swift_retain();
  static Published.subscript.setter();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
  OUTLINED_FUNCTION_5();
}

void key path setter for SafePublished.wrappedValue : <A, B>SafePublished<A, B>(uint64_t a1)
{
  uint64_t v1;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(void))(v1 + 16))();
  SafePublished.wrappedValue.setter();
}

void SafePublished.wrappedValue.getter()
{
  OUTLINED_FUNCTION_2_13();
  __break(1u);
}

void SafePublished.wrappedValue.setter()
{
  OUTLINED_FUNCTION_2_13();
  __break(1u);
}

void SafePublished.wrappedValue.modify()
{
  SafePublished.wrappedValue.getter();
}

void (*SafePublished.objectWillChange.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = SafePublished.objectWillChange.getter();
  return SafePublished.objectWillChange.modify;
}

void SafePublished.objectWillChange.modify(uint64_t *a1, char a2)
{
  SafePublished.objectWillChange.modify(a1, a2, (void (*)(uint64_t))SafePublished.objectWillChange.setter);
}

void (*static SafePublished.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;

  v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  v9[3] = v4;
  *v9 = a2;
  v9[1] = a3;
  v10 = *(_QWORD *)(v4 + 88);
  v9[4] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v9[5] = v11;
  v12 = *(_QWORD *)(v11 + 64);
  v9[6] = malloc(v12);
  v9[7] = malloc(v12);
  static SafePublished.subscript.getter();
  return static SafePublished.subscript.modify;
}

void static SafePublished.subscript.modify()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_9_0();
  v1 = *(_QWORD **)v0;
  v2 = *(void **)(*(_QWORD *)v0 + 48);
  v3 = *(void **)(*(_QWORD *)v0 + 56);
  if ((v4 & 1) != 0)
  {
    v5 = v1[4];
    v6 = v1[5];
    (*(void (**)(_QWORD, void *, uint64_t))(v6 + 16))(*(_QWORD *)(*(_QWORD *)v0 + 48), v3, v5);
    swift_retain();
    swift_retain();
    swift_unknownObjectRetain();
    static SafePublished.subscript.setter();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v3, v5);
  }
  else
  {
    swift_retain();
    swift_retain();
    swift_unknownObjectRetain();
    static SafePublished.subscript.setter();
  }
  free(v3);
  free(v2);
  free(v1);
}

uint64_t SafePublished.projectedValue.getter()
{
  return SafePublished.projectedValue.getter();
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(void);
  void (*v7)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  OUTLINED_FUNCTION_9_0();
  v23 = v2;
  v24 = v3;
  v22 = v4;
  v20[1] = v5;
  v7 = v6;
  v8 = *v0;
  v9 = *(_QWORD *)(*v0 + 88);
  type metadata accessor for Optional();
  v10 = type metadata accessor for Published.Publisher();
  v21 = *(_QWORD *)(v10 - 8);
  OUTLINED_FUNCTION_5_10();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v20 - v12;
  MEMORY[0x23B812308](MEMORY[0x24BDB9EE8], v10);
  v14 = type metadata accessor for Publishers.CompactMap();
  v15 = *(_QWORD *)(v14 - 8);
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_15_7();
  v7();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = *(_QWORD *)(v8 + 80);
  v17[3] = v9;
  v17[4] = *(_QWORD *)(v8 + 96);
  Publisher.compactMap<A>(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v13, v10);
  MEMORY[0x23B812308](MEMORY[0x24BDB94C8], v14);
  v18 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v1, v14);
  return v18;
}

uint64_t SafePublished.setValue(_:)(uint64_t a1)
{
  return SafePublished.setValue(_:)(a1, (uint64_t (*)(char *))SafePublished.value.setter);
}

uint64_t SafePublished.__deallocating_deinit()
{
  return SafePublished.__deallocating_deinit((void (*)(void))SafePublished.deinit);
}

uint64_t partial apply for closure #1 in SafePublished.projectedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return closure #1 in SafePublished.projectedValue.getter(a1, a2);
}

uint64_t SafeReadOnlyPublished.value.getter()
{
  return SafePublished.value.getter();
}

void SafeReadOnlyPublished.value.setter()
{
  SafePublished.value.setter();
}

uint64_t protocol witness for _ObservableObjectProperty.objectWillChange.getter in conformance SafePublished<A, B>()
{
  return SafePublished.objectWillChange.getter();
}

uint64_t protocol witness for _ObservableObjectProperty.objectWillChange.setter in conformance SafePublished<A, B>()
{
  return SafePublished.objectWillChange.setter();
}

uint64_t (*protocol witness for _ObservableObjectProperty.objectWillChange.modify in conformance SafePublished<A, B>(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = SafePublished.objectWillChange.modify(v2);
  return protocol witness for Collection.subscript.read in conformance [A]specialized ;
}

void SafePublished.$value.getter()
{
  OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_8_6();
  Published.projectedValue.getter();
  OUTLINED_FUNCTION_19_5();
  OUTLINED_FUNCTION_33_0();
}

void SafeReadOnlyPublished.wrappedValue.getter()
{
  OUTLINED_FUNCTION_2_13();
  __break(1u);
}

void key path setter for SafePublished.objectWillChange : <A, B>SafePublished<A, B>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v6;

  v6 = swift_retain();
  a5(v6);
  OUTLINED_FUNCTION_11();
}

uint64_t SafePublished.objectWillChange.getter()
{
  uint64_t v0;

  swift_beginAccess();
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_8_6();
  v0 = Published.objectWillChange.getter();
  OUTLINED_FUNCTION_19_5();
  return v0;
}

void SafePublished.objectWillChange.setter()
{
  OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_8_6();
  Published.objectWillChange.setter();
  OUTLINED_FUNCTION_19_5();
  OUTLINED_FUNCTION_33_0();
}

void SafePublished.objectWillChange.modify(uint64_t *a1, char a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  if ((a2 & 1) != 0)
  {
    v4 = swift_retain();
    a3(v4);
    swift_release();
  }
  else
  {
    a3(*a1);
    OUTLINED_FUNCTION_24_1();
  }
}

uint64_t SafeReadOnlyPublished.projectedValue.getter()
{
  return SafePublished.projectedValue.getter();
}

uint64_t closure #1 in SafePublished.projectedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t SafeReadOnlyPublished.setValue(_:)(uint64_t a1)
{
  return SafePublished.setValue(_:)(a1, (uint64_t (*)(char *))SafeReadOnlyPublished.value.setter);
}

uint64_t SafePublished.setValue(_:)(uint64_t a1, uint64_t (*a2)(char *))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = *(_QWORD *)(*(_QWORD *)v2 + 88);
  type metadata accessor for Optional();
  OUTLINED_FUNCTION_5_10();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v10 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))((char *)&v10 - v7, a1, v5);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v5);
  return a2(v8);
}

uint64_t SafePublished.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 112);
  OUTLINED_FUNCTION_13_10();
  v2 = OUTLINED_FUNCTION_8_6();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SafeReadOnlyPublished.__deallocating_deinit()
{
  return SafePublished.__deallocating_deinit((void (*)(void))SafeReadOnlyPublished.deinit);
}

uint64_t SafePublished.__deallocating_deinit(void (*a1)(void))
{
  a1();
  return swift_deallocClassInstance();
}

void sub_2374BE960()
{
  SafePublished.wrappedValue.getter();
}

void sub_2374BE978(_QWORD *a1@<X8>)
{
  *a1 = SafePublished.objectWillChange.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374BE99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for SafePublished.objectWillChange : <A, B>SafePublished<A, B>(a1, a2, a3, a4, (void (*)(uint64_t))SafePublished.objectWillChange.setter);
}

void sub_2374BE9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for SafePublished.objectWillChange : <A, B>SafePublished<A, B>(a1, a2, a3, a4, (void (*)(uint64_t))SafePublished.objectWillChange.setter);
}

uint64_t type metadata accessor for SafePublished(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SafePublished);
}

uint64_t method lookup function for SafePublished()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SafePublished.wrappedValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of SafePublished.wrappedValue.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of SafePublished.objectWillChange.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of SafePublished.objectWillChange.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of SafePublished.projectedValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of SafePublished.setValue(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t type metadata completion function for SafePublished()
{
  uint64_t result;
  unint64_t v1;

  OUTLINED_FUNCTION_13_10();
  result = type metadata accessor for Published();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for SafeReadOnlyPublished(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SafeReadOnlyPublished);
}

uint64_t method lookup function for SafeReadOnlyPublished()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SafeReadOnlyPublished.objectWillChange.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of SafeReadOnlyPublished.objectWillChange.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of SafeReadOnlyPublished.projectedValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

void key path getter for SafePublished.value : <A, B>SafePublished<A, B>()
{
  SafePublished.value.getter();
  OUTLINED_FUNCTION_11();
}

void key path setter for SafePublished.value : <A, B>SafePublished<A, B>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for SafePublished.value : <A, B>SafePublished<A, B>(a1, a2, a3, a4, (void (*)(char *))SafePublished.value.setter);
}

void key path getter for SafeReadOnlyPublished.value : <A, B>SafeReadOnlyPublished<A, B>()
{
  SafeReadOnlyPublished.value.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374BEB64()
{
  SafeReadOnlyPublished.value.getter();
  OUTLINED_FUNCTION_11();
}

void key path setter for SafeReadOnlyPublished.value : <A, B>SafeReadOnlyPublished<A, B>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for SafePublished.value : <A, B>SafePublished<A, B>(a1, a2, a3, a4, (void (*)(char *))SafeReadOnlyPublished.value.setter);
}

void key path setter for SafePublished.value : <A, B>SafePublished<A, B>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *))
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v7 = type metadata accessor for Optional();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v11 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v11 - v8, a1);
  a5(v9);
  OUTLINED_FUNCTION_24_1();
}

void sub_2374BEC0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for SafePublished.value : <A, B>SafePublished<A, B>(a1, a2, a3, a4, (void (*)(char *))SafeReadOnlyPublished.value.setter);
}

void sub_2374BEC30()
{
  SafePublished.value.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374BEC4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for SafePublished.value : <A, B>SafePublished<A, B>(a1, a2, a3, a4, (void (*)(char *))SafePublished.value.setter);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B8122A8](a1, v6, a5);
}

__n128 OUTLINED_FUNCTION_0_12(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_13()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return 24;
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_8_6()
{
  return type metadata accessor for Published();
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_11_7()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t OUTLINED_FUNCTION_12_6()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t OUTLINED_FUNCTION_13_10()
{
  return type metadata accessor for Optional();
}

uint64_t OUTLINED_FUNCTION_14_6()
{
  uint64_t (*v0)(uint64_t, _QWORD);
  uint64_t v1;

  return v0(v1 - 120, 0);
}

uint64_t OUTLINED_FUNCTION_16_9()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_18_6()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = v0;
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_19_5()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_20_6@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_22_8(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  return swift_release();
}

void CAFChargingStatus.cableStateBridged.getter()
{
  CAFSeatBelt.seatOccupancyBridged.getter((SEL *)&selRef_hasCableState, (SEL *)&selRef_cableState);
}

void CAFChargingStatus.portSideIndicatorBridged.getter()
{
  CAFSeatBelt.seatOccupancyBridged.getter((SEL *)&selRef_hasPortSideIndicator, (SEL *)&selRef_portSideIndicator);
}

id CAFChargingStatusObservable.observed.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable_observed);
}

uint64_t CAFChargingStatusObservable.cachedDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable_cachedDescription);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

void CAFChargingStatusObservable.chargingState.getter()
{
  uint64_t v0;
  id v1;
  void *v2;

  v2 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable_observed);
  OUTLINED_FUNCTION_40();
  swift_retain();
  v1 = v2;
  swift_getAtKeyPath();

  OUTLINED_FUNCTION_27();
  swift_release();
  OUTLINED_FUNCTION_56_0();
}

void CAFChargingStatusObservable.$chargingState.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable__chargingState, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFChargingStatusObservable.cableState.getter()
{
  return CAFChargingStatusObservable.cableState.getter();
}

{
  uint64_t v0;
  id v1;
  void *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;

  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable_observed);
  OUTLINED_FUNCTION_40();
  swift_retain();
  v1 = v3;
  swift_getAtKeyPath();

  OUTLINED_FUNCTION_27();
  swift_release();
  return v4 | (v5 << 8);
}

void CAFChargingStatusObservable.$cableState.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable__cableState, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFChargingStatusObservable.portSideIndicator.getter()
{
  return CAFChargingStatusObservable.cableState.getter();
}

void CAFChargingStatusObservable.$portSideIndicator.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable__portSideIndicator, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFChargingStatusObservable._description.getter(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;

  v1 = (void *)0xEE003E6465726574;
  v2 = 0x73696765726E753CLL;
  v3 = OUTLINED_FUNCTION_67(a1, sel_registeredForChargingState);
  v4 = 0x73696765726E753CLL;
  v5 = (void *)0xEE003E6465726574;
  if ((_DWORD)v3)
  {
    CAFChargingStatusObservable.chargingState.getter();
    v3 = (id)NSStringFromChargingState();
    if (v3)
    {
      v6 = v3;
      v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v5 = v7;

    }
    else
    {
      v5 = (void *)0xE900000000000029;
      v4 = 0x6E776F6E6B6E7528;
    }
  }
  v8 = (uint64_t)OUTLINED_FUNCTION_67((uint64_t)v3, sel_registeredForCableState);
  v9 = 0x73696765726E753CLL;
  v10 = (void *)0xEE003E6465726574;
  if ((_DWORD)v8)
  {
    CAFChargingStatusObservable.cableState.getter();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CAFCableState?);
    v8 = OUTLINED_FUNCTION_24_0();
    v9 = v8;
    v10 = v11;
  }
  if (OUTLINED_FUNCTION_67(v8, sel_registeredForPortSideIndicator))
  {
    CAFChargingStatusObservable.portSideIndicator.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CAFPortSideIndicator?);
    v2 = OUTLINED_FUNCTION_24_0();
    v1 = v12;
  }
  _StringGuts.grow(_:)(94);
  OUTLINED_FUNCTION_12_0(0xD00000000000001ELL, (uint64_t)"<CAFChargingStatusObservable: ");
  _print_unlocked<A, B>(_:_:)();
  v13._object = (void *)0x80000002374E4980;
  v13._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v13);
  v14._countAndFlagsBits = v4;
  v14._object = v5;
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 0x53656C626163202CLL;
  v15._object = (void *)0xEE00203A65746174;
  String.append(_:)(v15);
  v16._countAndFlagsBits = v9;
  v16._object = v10;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12_0(0xD000000000000015, (uint64_t)", portSideIndicator: ");
  v17._countAndFlagsBits = v2;
  v17._object = v1;
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 4095264;
  v18._object = (void *)0xE300000000000000;
  String.append(_:)(v18);
  return 0;
}

uint64_t CAFChargingStatusObservable.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable_cachedDescriptionLock;
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v2);
  v3 = OUTLINED_FUNCTION_27();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable_cachedDescription + 8))
  {
    v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable_cachedDescription);
    v5 = *(os_unfair_lock_s **)(v0 + v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    v4 = CAFChargingStatusObservable._description.getter(v3);
    v7 = v6;
    swift_bridgeObjectRetain();
    CAFChargingStatusObservable.cachedDescription.setter(v4, v7);
    v5 = *(os_unfair_lock_s **)(v0 + v1);
  }
  swift_retain();
  os_unfair_lock_unlock(v5 + 4);
  swift_release();
  return v4;
}

void CAFChargingStatusObservable.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  CAFChargingStatusObservable.init(_:)(a1);
  OUTLINED_FUNCTION_11();
}

id CAFChargingStatusObservable.init(_:)(void *a1)
{
  char *v1;
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  objc_super v17;

  v2 = v1;
  v4 = &v1[OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable_cachedDescription];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable_cachedDescriptionLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)&v2[v5] = v6;
  v7 = OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable__chargingState;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFChargingStatusObservable, CAFChargingState>);
  OUTLINED_FUNCTION_127();
  v8 = v2;
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v2[v7] = v9;
  v10 = OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable__cableState;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFChargingStatusObservable, CAFCableState?>);
  OUTLINED_FUNCTION_127();
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v8[v10] = v11;
  v12 = OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable__portSideIndicator;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFChargingStatusObservable, CAFPortSideIndicator?>);
  OUTLINED_FUNCTION_127();
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v8[v12] = v13;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable_observed] = a1;
  v14 = a1;

  v17.receiver = v8;
  v17.super_class = (Class)type metadata accessor for CAFChargingStatusObservable();
  v15 = objc_msgSendSuper2(&v17, sel_init);
  objc_msgSend(v14, sel_registerObserver_, v15);

  return v15;
}

uint64_t CAFChargingStatusObservable.resetCachedDescription()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v1);
  specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(v2, partial apply for closure #1 in CAFChargingStatusObservable.resetCachedDescription());
  os_unfair_lock_unlock(v1);
  return OUTLINED_FUNCTION_27();
}

id CAFChargingStatusObservable.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable_observed], sel_unregisterObserver_, v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAFChargingStatusObservable();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id CAFChargingStatusObservable.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CAFChargingStatusObservable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id protocol witness for CAFObservable.observed.getter in conformance CAFChargingStatusObservable@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = CAFChargingStatusObservable.observed.getter();
  *a1 = result;
  return result;
}

char *keypath_get_selector_chargingState()
{
  return sel_chargingState;
}

void protocol witness for CAFObservable.init(_:) in conformance CAFChargingStatusObservable(void **a1)
{
  CAFChargingStatusObservable.__allocating_init(_:)(*a1);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance CAFChargingStatusObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CAFChargingStatusObservable();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t CAFChargingStatusObservable.chargingStatusService(_:didUpdateChargingState:)()
{
  OUTLINED_FUNCTION_15_1();
  specialized SafeReadOnlyPublished.value.setter();
  return swift_release();
}

uint64_t CAFChargingStatusObservable.chargingStatusService(_:didUpdateCableState:)(uint64_t a1, unsigned __int8 a2)
{
  return CAFUIInputDeviceButtonObservable.uIInputDeviceService(_:didUpdateUiInputDevicePurpose:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable__cableState, (void (*)(_QWORD))specialized SafeReadOnlyPublished.value.setter);
}

uint64_t CAFChargingStatusObservable.chargingStatusService(_:didUpdatePortSideIndicator:)(uint64_t a1, unsigned __int8 a2)
{
  return CAFUIInputDeviceButtonObservable.uIInputDeviceService(_:didUpdateUiInputDevicePurpose:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine27CAFChargingStatusObservable__portSideIndicator, (void (*)(_QWORD))specialized SafeReadOnlyPublished.value.setter);
}

uint64_t CAFChargingStatusObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  result = CAFChargingStatusObservable.resetCachedDescription()();
  if ((a3 & 1) == 0)
    return specialized CAFObservable.notifyChange()(result);
  return result;
}

uint64_t CAFChargingStatusObservable.serviceDidUpdate(_:receivedAllValues:)(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return specialized CAFObservable.notifyChange()();
  return result;
}

id sub_2374BF970@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_chargingState);
  *a2 = (_BYTE)result;
  return result;
}

void key path getter for CAFChargingStatus.cableStateBridged : CAFChargingStatus(_BYTE *a1@<X8>)
{
  char v2;
  char v3;

  CAFChargingStatus.cableStateBridged.getter();
  *a1 = v2;
  a1[1] = v3 & 1;
}

void key path getter for CAFChargingStatus.portSideIndicatorBridged : CAFChargingStatus(_BYTE *a1@<X8>)
{
  char v2;
  char v3;

  CAFChargingStatus.portSideIndicatorBridged.getter();
  *a1 = v2;
  a1[1] = v3 & 1;
}

uint64_t type metadata accessor for CAFChargingStatusObservable()
{
  return objc_opt_self();
}

void associated type witness table accessor for CAFObserved.Observable : CAFObservable in CAFChargingStatus(uint64_t a1, uint64_t a2)
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable((unint64_t *)&lazy protocol witness table cache variable for type CAFChargingStatusObservable and conformance CAFChargingStatusObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFChargingStatusObservable, (uint64_t)&protocol conformance descriptor for CAFChargingStatusObservable);
}

void associated type witness table accessor for CAFObservable.Observed : CAFObserved in CAFChargingStatusObservable()
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFChargingStatus and conformance CAFChargingStatus, 255, (uint64_t (*)(uint64_t))type metadata accessor for CAFChargingStatus, (uint64_t)&protocol conformance descriptor for CAFChargingStatus);
}

unint64_t type metadata accessor for CAFChargingStatus()
{
  unint64_t result;

  result = lazy cache variable for type metadata for CAFChargingStatus;
  if (!lazy cache variable for type metadata for CAFChargingStatus)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CAFChargingStatus);
  }
  return result;
}

void instantiation function for generic protocol witness table for CAFChargingStatusObservable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFChargingStatusObservable and conformance CAFChargingStatusObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFChargingStatusObservable, (uint64_t)&protocol conformance descriptor for CAFChargingStatusObservable);
  *(_QWORD *)(a1 + 8) = v3;
}

uint64_t method lookup function for CAFChargingStatusObservable()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CAFChargingStatusObservable.chargingState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CAFChargingStatusObservable.$chargingState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of CAFChargingStatusObservable.cableState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))() & 0x1FF;
}

uint64_t dispatch thunk of CAFChargingStatusObservable.$cableState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CAFChargingStatusObservable.portSideIndicator.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))() & 0x1FF;
}

uint64_t dispatch thunk of CAFChargingStatusObservable.$portSideIndicator.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CAFChargingStatusObservable.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t partial apply for closure #1 in CAFChargingStatusObservable.resetCachedDescription()()
{
  return CAFChargingStatusObservable.cachedDescription.setter(0, 0);
}

id CAFUIStateObservable.observed.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_observed);
}

uint64_t CAFUIStateObservable.cachedDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_cachedDescription);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t CAFUIStateObservable.uiSceneState.getter()
{
  uint64_t v0;
  id v1;
  void *v3;
  unsigned __int8 v4;

  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_observed);
  OUTLINED_FUNCTION_40();
  swift_retain();
  v1 = v3;
  OUTLINED_FUNCTION_35_1();

  OUTLINED_FUNCTION_27();
  swift_release();
  return v4;
}

void CAFUIStateObservable.$uiSceneState.getter()
{
  CAFVehicleVariantObservable.$exteriorStyle.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable__uiSceneState, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFUIStateObservable.uiSceneOptions.getter()
{
  uint64_t v0;
  id v1;
  void *v3;
  uint64_t v4;

  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_observed);
  OUTLINED_FUNCTION_40();
  swift_retain();
  v1 = v3;
  OUTLINED_FUNCTION_35_1();

  OUTLINED_FUNCTION_27();
  swift_release();
  return v4;
}

void CAFUIStateObservable.$uiSceneOptions.getter()
{
  CAFVehicleVariantObservable.$exteriorStyle.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable__uiSceneOptions, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t CAFUIStateObservable._description.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;

  v1 = (void *)0xEE003E6465726574;
  v2 = 0x73696765726E753CLL;
  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_observed);
  v4 = 0x73696765726E753CLL;
  v5 = (void *)0xEE003E6465726574;
  if (objc_msgSend(v3, sel_registeredForUISceneState))
  {
    CAFUIStateObservable.uiSceneState.getter();
    v6 = (id)NSStringFromUISceneState();
    if (v6)
    {
      v7 = v6;
      v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v5 = v8;

    }
    else
    {
      v5 = (void *)0xE900000000000029;
      v4 = 0x6E776F6E6B6E7528;
    }
  }
  if (objc_msgSend(v3, sel_registeredForUISceneOptions))
  {
    CAFUIStateObservable.uiSceneOptions.getter();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]?);
    v2 = String.init<A>(describing:)();
    v1 = v9;
  }
  _StringGuts.grow(_:)(67);
  OUTLINED_FUNCTION_12_0(0xD000000000000017, (uint64_t)"<CAFUIStateObservable: ");
  _print_unlocked<A, B>(_:_:)();
  v10._object = (void *)0x80000002374E4A60;
  v10._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v10);
  v11._countAndFlagsBits = v4;
  v11._object = v5;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12_0(0xD000000000000012, (uint64_t)", uiSceneOptions: ");
  v12._countAndFlagsBits = v2;
  v12._object = v1;
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 4095264;
  v13._object = (void *)0xE300000000000000;
  String.append(_:)(v13);
  return 0;
}

uint64_t CAFUIStateObservable.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_cachedDescriptionLock;
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v2);
  OUTLINED_FUNCTION_27();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_cachedDescription + 8))
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_cachedDescription);
    v4 = *(os_unfair_lock_s **)(v0 + v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    v3 = CAFUIStateObservable._description.getter();
    v6 = v5;
    swift_bridgeObjectRetain();
    CAFUIStateObservable.cachedDescription.setter(v3, v6);
    v4 = *(os_unfair_lock_s **)(v0 + v1);
  }
  OUTLINED_FUNCTION_32();
  os_unfair_lock_unlock(v4 + 4);
  swift_release();
  return v3;
}

void CAFUIStateObservable.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  CAFUIStateObservable.init(_:)(a1);
  OUTLINED_FUNCTION_11();
}

id CAFUIStateObservable.init(_:)(void *a1)
{
  char *v1;
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  objc_super v15;

  v2 = v1;
  v4 = &v1[OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_cachedDescription];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_cachedDescriptionLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)&v2[v5] = v6;
  v7 = OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable__uiSceneState;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFUIStateObservable, CAFUISceneState>);
  OUTLINED_FUNCTION_127();
  v8 = v2;
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v2[v7] = v9;
  v10 = OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable__uiSceneOptions;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFUIStateObservable, [String]?>);
  OUTLINED_FUNCTION_127();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v8[v10] = v11;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_observed] = a1;
  v12 = a1;

  v15.receiver = v8;
  v15.super_class = (Class)type metadata accessor for CAFUIStateObservable();
  v13 = objc_msgSendSuper2(&v15, sel_init);
  objc_msgSend(v12, sel_registerObserver_, v13);

  return v13;
}

uint64_t CAFUIStateObservable.resetCachedDescription()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v1);
  specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(v2, partial apply for closure #1 in CAFUIStateObservable.resetCachedDescription());
  os_unfair_lock_unlock(v1);
  return OUTLINED_FUNCTION_27();
}

id CAFUIStateObservable.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC10CAFCombine20CAFUIStateObservable_observed], sel_unregisterObserver_, v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAFUIStateObservable();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id CAFUIStateObservable.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CAFUIStateObservable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id protocol witness for CAFObservable.observed.getter in conformance CAFUIStateObservable@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = CAFUIStateObservable.observed.getter();
  *a1 = result;
  return result;
}

char *keypath_get_selector_uiSceneState()
{
  return sel_uiSceneState;
}

void protocol witness for CAFObservable.init(_:) in conformance CAFUIStateObservable(void **a1)
{
  CAFUIStateObservable.__allocating_init(_:)(*a1);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance CAFUIStateObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CAFUIStateObservable();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t CAFUIStateObservable.uiStateService(_:didUpdateUiSceneState:)()
{
  OUTLINED_FUNCTION_32();
  specialized SafeReadOnlyPublished.value.setter();
  return swift_release();
}

uint64_t CAFUIStateObservable.uiStateService(_:didUpdateUiSceneOptions:)()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_32();
  specialized SafeReadOnlyPublished.value.setter();
  return OUTLINED_FUNCTION_0();
}

uint64_t CAFUIStateObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  result = CAFUIStateObservable.resetCachedDescription()();
  if ((a3 & 1) == 0)
    return specialized CAFObservable.notifyChange()(result);
  return result;
}

uint64_t CAFUIStateObservable.serviceDidUpdate(_:receivedAllValues:)(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return specialized CAFObservable.notifyChange()();
  return result;
}

id sub_2374C0664@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_uiSceneState);
  *a2 = (_BYTE)result;
  return result;
}

char *keypath_get_selector_uiSceneOptions()
{
  return sel_uiSceneOptions;
}

void key path getter for CAFUIState.uiSceneOptions : CAFUIState(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_msgSend(*a1, sel_uiSceneOptions);
  if (v3)
  {
    v4 = v3;
    v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  }
  else
  {
    v5 = 0;
  }
  *a2 = v5;
}

uint64_t type metadata accessor for CAFUIStateObservable()
{
  return objc_opt_self();
}

void associated type witness table accessor for CAFObserved.Observable : CAFObservable in CAFUIState(uint64_t a1, uint64_t a2)
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFUIStateObservable and conformance CAFUIStateObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFUIStateObservable, (uint64_t)&protocol conformance descriptor for CAFUIStateObservable);
}

void associated type witness table accessor for CAFObservable.Observed : CAFObserved in CAFUIStateObservable()
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFUIState and conformance CAFUIState, 255, (uint64_t (*)(uint64_t))type metadata accessor for CAFUIState, (uint64_t)&protocol conformance descriptor for CAFUIState);
}

unint64_t type metadata accessor for CAFUIState()
{
  unint64_t result;

  result = lazy cache variable for type metadata for CAFUIState;
  if (!lazy cache variable for type metadata for CAFUIState)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CAFUIState);
  }
  return result;
}

void instantiation function for generic protocol witness table for CAFUIStateObservable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFUIStateObservable and conformance CAFUIStateObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFUIStateObservable, (uint64_t)&protocol conformance descriptor for CAFUIStateObservable);
  *(_QWORD *)(a1 + 8) = v3;
}

uint64_t method lookup function for CAFUIStateObservable()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CAFUIStateObservable.uiSceneState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CAFUIStateObservable.$uiSceneState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CAFUIStateObservable.uiSceneOptions.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of CAFUIStateObservable.$uiSceneOptions.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CAFUIStateObservable.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t partial apply for closure #1 in CAFUIStateObservable.resetCachedDescription()()
{
  return CAFUIStateObservable.cachedDescription.setter(0, 0);
}

id CAFFuelLevelObservable.observed.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable_observed);
}

uint64_t CAFFuelLevelObservable.cachedDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable_cachedDescription);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t CAFFuelLevelObservable.fuelLevel.getter()
{
  return CAFFuelLevelObservable.fuelLevel.getter();
}

{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable_observed);
  swift_retain();
  swift_retain();
  v1 = v3;
  swift_getAtKeyPath();

  swift_release();
  return swift_release();
}

void CAFFuelLevelObservable.$fuelLevel.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__fuelLevel, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFFuelLevelObservable.fuelLevelState.getter()
{
  return CAFFuelLevelObservable.fuelLevelState.getter();
}

{
  uint64_t v0;
  id v1;
  void *v3;
  unsigned __int8 v4;

  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable_observed);
  OUTLINED_FUNCTION_40();
  swift_retain();
  v1 = v3;
  swift_getAtKeyPath();

  OUTLINED_FUNCTION_27();
  swift_release();
  return v4;
}

void CAFFuelLevelObservable.$fuelLevelState.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__fuelLevelState, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFFuelLevelObservable.fuelLevelMarkerLow.getter()
{
  return CAFFuelLevelObservable.fuelLevel.getter();
}

void CAFFuelLevelObservable.$fuelLevelMarkerLow.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__fuelLevelMarkerLow, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFFuelLevelObservable.fillLevelLabel.getter()
{
  return CAFFuelLevelObservable.fuelLevelState.getter();
}

void CAFFuelLevelObservable.$fillLevelLabel.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__fillLevelLabel, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFFuelLevelObservable.portSideIndicator.getter()
{
  return CAFFuelLevelObservable.fuelLevelState.getter();
}

void CAFFuelLevelObservable.$portSideIndicator.getter()
{
  CAFEngineTemperatureObservable.$temperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__portSideIndicator, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

uint64_t CAFFuelLevelObservable._description.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  Swift::String v25;
  Swift::String v26;
  Swift::String v27;
  Swift::String v28;
  Swift::String v29;
  Swift::String v30;
  uint64_t v32;
  Swift::String v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;

  v1 = v0;
  HIBYTE(v33._object) = -18;
  strcpy((char *)&v33, "<unregistered>");
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<CAFUnitPercent>?);
  MEMORY[0x24BDAC7A8](v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = OUTLINED_FUNCTION_152(v5, sel_registeredForFuelLevel);
  v9 = 0x73696765726E753CLL;
  v10 = (void *)0xEE003E6465726574;
  if ((_DWORD)v8)
  {
    CAFFuelLevelObservable.fuelLevel.getter();
    lazy protocol witness table accessor for type Measurement<CAFUnitPercent> and conformance Measurement<A>();
    v9 = dispatch thunk of CustomStringConvertible.description.getter();
    v10 = v11;
    v8 = (id)(*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  v32 = v9;
  v12 = OUTLINED_FUNCTION_152((uint64_t)v8, sel_registeredForFuelLevelState);
  v13 = 0x73696765726E753CLL;
  v14 = (void *)0xEE003E6465726574;
  if ((_DWORD)v12)
  {
    CAFFuelLevelObservable.fuelLevelState.getter();
    v12 = (id)NSStringFromFuelLevelState();
    if (v12)
    {
      v13 = OUTLINED_FUNCTION_13_7();
      v14 = v15;

    }
    else
    {
      v13 = 0x6E776F6E6B6E7528;
      v14 = (void *)0xE900000000000029;
    }
  }
  v16 = (uint64_t)OUTLINED_FUNCTION_152((uint64_t)v12, sel_registeredForFuelLevelMarkerLow);
  v17 = 0x73696765726E753CLL;
  v18 = (void *)0xEE003E6465726574;
  if ((_DWORD)v16)
  {
    CAFFuelLevelObservable.fuelLevelMarkerLow.getter();
    v16 = String.init<A>(describing:)();
    v17 = v16;
    v18 = v19;
  }
  v20 = OUTLINED_FUNCTION_152(v16, sel_registeredForFillLevelLabel);
  v21 = 0x73696765726E753CLL;
  v22 = (void *)0xEE003E6465726574;
  if ((_DWORD)v20)
  {
    CAFFuelLevelObservable.fillLevelLabel.getter();
    v20 = (id)NSStringFromFillLevelLabel();
    if (v20)
    {
      v21 = OUTLINED_FUNCTION_13_7();
      v22 = v23;

    }
    else
    {
      v21 = 0x6E776F6E6B6E7528;
      v22 = (void *)0xE900000000000029;
    }
  }
  if (OUTLINED_FUNCTION_152((uint64_t)v20, sel_registeredForPortSideIndicator))
  {
    CAFFuelLevelObservable.portSideIndicator.getter();
    if ((id)NSStringFromPortSideIndicator())
    {
      v33._countAndFlagsBits = OUTLINED_FUNCTION_13_7();
      v33._object = v24;

    }
    else
    {
      strcpy((char *)&v33, "(unknown)");
      WORD1(v33._object) = 0;
      HIDWORD(v33._object) = -385875968;
    }
  }
  v35 = 0;
  v36 = 0xE000000000000000;
  _StringGuts.grow(_:)(133);
  OUTLINED_FUNCTION_128(0xD000000000000019, (uint64_t)"<CAFFuelLevelObservable: ");
  v34 = v1;
  _print_unlocked<A, B>(_:_:)();
  v25._countAndFlagsBits = 0x4C6C657566207B20;
  v25._object = (void *)0xEE00203A6C657665;
  String.append(_:)(v25);
  v26._countAndFlagsBits = v32;
  v26._object = v10;
  String.append(_:)(v26);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_4((uint64_t)", fuelLevelState: ");
  v27._countAndFlagsBits = v13;
  v27._object = v14;
  String.append(_:)(v27);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_128(0xD000000000000016, (uint64_t)", fuelLevelMarkerLow: ");
  v28._countAndFlagsBits = v17;
  v28._object = v18;
  String.append(_:)(v28);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_4((uint64_t)", fillLevelLabel: ");
  v29._countAndFlagsBits = v21;
  v29._object = v22;
  String.append(_:)(v29);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_128(0xD000000000000015, (uint64_t)", portSideIndicator: ");
  String.append(_:)(v33);
  swift_bridgeObjectRelease();
  v30._countAndFlagsBits = 4095264;
  v30._object = (void *)0xE300000000000000;
  String.append(_:)(v30);
  return v35;
}

uint64_t CAFFuelLevelObservable.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable_cachedDescriptionLock;
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v2);
  OUTLINED_FUNCTION_27();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable_cachedDescription + 8))
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable_cachedDescription);
    v4 = *(os_unfair_lock_s **)(v0 + v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    v3 = CAFFuelLevelObservable._description.getter();
    v6 = v5;
    swift_bridgeObjectRetain();
    CAFFuelLevelObservable.cachedDescription.setter(v3, v6);
    v4 = *(os_unfair_lock_s **)(v0 + v1);
  }
  swift_retain();
  os_unfair_lock_unlock(v4 + 4);
  swift_release();
  return v3;
}

void CAFFuelLevelObservable.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  CAFFuelLevelObservable.init(_:)(a1);
  OUTLINED_FUNCTION_11();
}

id CAFFuelLevelObservable.init(_:)(void *a1)
{
  char *v1;
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  objc_super v21;

  v2 = v1;
  v4 = &v1[OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable_cachedDescription];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable_cachedDescriptionLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)&v2[v5] = v6;
  v7 = OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__fuelLevel;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFFuelLevelObservable, Measurement<CAFUnitPercent>>);
  OUTLINED_FUNCTION_127();
  v8 = v2;
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v2[v7] = v9;
  v10 = OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__fuelLevelState;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFFuelLevelObservable, CAFFuelLevelState>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v8[v10] = v11;
  v12 = OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__fuelLevelMarkerLow;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFFuelLevelObservable, Measurement<CAFUnitPercent>?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v8[v12] = v13;
  v14 = OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__fillLevelLabel;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFFuelLevelObservable, CAFFillLevelLabel>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v8[v14] = v15;
  v16 = OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__portSideIndicator;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFFuelLevelObservable, CAFPortSideIndicator>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v8[v16] = v17;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable_observed] = a1;
  v18 = a1;

  v21.receiver = v8;
  v21.super_class = (Class)type metadata accessor for CAFFuelLevelObservable();
  v19 = objc_msgSendSuper2(&v21, sel_init);
  objc_msgSend(v18, sel_registerObserver_, v19);

  return v19;
}

uint64_t CAFFuelLevelObservable.resetCachedDescription()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v1);
  specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(v2, partial apply for closure #1 in CAFFuelLevelObservable.resetCachedDescription());
  os_unfair_lock_unlock(v1);
  return OUTLINED_FUNCTION_27();
}

id CAFFuelLevelObservable.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable_observed], sel_unregisterObserver_, v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAFFuelLevelObservable();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id CAFFuelLevelObservable.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CAFFuelLevelObservable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id protocol witness for CAFObservable.observed.getter in conformance CAFFuelLevelObservable@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = CAFFuelLevelObservable.observed.getter();
  *a1 = result;
  return result;
}

char *keypath_get_selector_fuelLevel()
{
  return sel_fuelLevel;
}

void protocol witness for CAFObservable.init(_:) in conformance CAFFuelLevelObservable(void **a1)
{
  CAFFuelLevelObservable.__allocating_init(_:)(*a1);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance CAFFuelLevelObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CAFFuelLevelObservable();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t CAFFuelLevelObservable.fuelLevelService(_:didUpdateFuelLevel:)(uint64_t a1, uint64_t a2)
{
  return CAFEngineTemperatureObservable.engineTemperatureService(_:didUpdateTemperature:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__fuelLevel, specialized SafeReadOnlyPublished.setValue(_:));
}

uint64_t CAFFuelLevelObservable.fuelLevelService(_:didUpdateFuelLevelState:)(uint64_t a1, unsigned __int8 a2)
{
  return CAFUIInputDeviceButtonObservable.uIInputDeviceService(_:didUpdateUiInputDevicePurpose:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__fuelLevelState, (void (*)(_QWORD))specialized SafeReadOnlyPublished.value.setter);
}

uint64_t CAFFuelLevelObservable.fuelLevelService(_:didUpdateFuelLevelMarkerLow:)(uint64_t a1, uint64_t a2)
{
  return CAFEngineTemperatureObservable.engineTemperatureService(_:didUpdateTemperature:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__fuelLevelMarkerLow, specialized SafeReadOnlyPublished.setValue(_:));
}

uint64_t CAFFuelLevelObservable.fuelLevelService(_:didUpdateFillLevelLabel:)(uint64_t a1, unsigned __int8 a2)
{
  return CAFUIInputDeviceButtonObservable.uIInputDeviceService(_:didUpdateUiInputDevicePurpose:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__fillLevelLabel, (void (*)(_QWORD))specialized SafeReadOnlyPublished.value.setter);
}

uint64_t CAFFuelLevelObservable.fuelLevelService(_:didUpdatePortSideIndicator:)(uint64_t a1, unsigned __int8 a2)
{
  return CAFUIInputDeviceButtonObservable.uIInputDeviceService(_:didUpdateUiInputDevicePurpose:)(a1, a2, (uint64_t)&OBJC_IVAR____TtC10CAFCombine22CAFFuelLevelObservable__portSideIndicator, (void (*)(_QWORD))specialized SafeReadOnlyPublished.value.setter);
}

void CAFFuelLevelObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;

  v4 = CAFFuelLevelObservable.resetCachedDescription()();
  if ((a3 & 1) != 0)
    OUTLINED_FUNCTION_11();
  else
    specialized CAFObservable.notifyChange()(v4);
}

uint64_t CAFFuelLevelObservable.serviceDidUpdate(_:receivedAllValues:)(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return specialized CAFObservable.notifyChange()();
  return result;
}

void key path getter for CAFFuelLevel.fuelLevel : CAFFuelLevel(id *a1)
{
  id v1;

  v1 = objc_msgSend(*a1, sel_fuelLevel);
  type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for CAFUnitPercent);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

}

char *keypath_get_selector_fuelLevelState()
{
  return sel_fuelLevelState;
}

void sub_2374C18C0(id *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = objc_msgSend(*a1, sel_fuelLevelState);
  OUTLINED_FUNCTION_11();
}

char *keypath_get_selector_fuelLevelMarkerLow()
{
  return sel_fuelLevelMarkerLow;
}

uint64_t key path getter for CAFFuelLevel.fuelLevelMarkerLow : CAFFuelLevel@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*a1, sel_fuelLevelMarkerLow);
  if (v3)
  {
    v4 = v3;
    type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for CAFUnitPercent);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
  return __swift_storeEnumTagSinglePayload(a2, v5, 1, v6);
}

char *keypath_get_selector_fillLevelLabel()
{
  return sel_fillLevelLabel;
}

void sub_2374C1998(id *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = objc_msgSend(*a1, sel_fillLevelLabel);
  OUTLINED_FUNCTION_11();
}

char *keypath_get_selector_portSideIndicator()
{
  return sel_portSideIndicator;
}

void sub_2374C19D0(id *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = objc_msgSend(*a1, sel_portSideIndicator);
  OUTLINED_FUNCTION_11();
}

uint64_t type metadata accessor for CAFFuelLevelObservable()
{
  return objc_opt_self();
}

void associated type witness table accessor for CAFObserved.Observable : CAFObservable in CAFFuelLevel()
{
  lazy protocol witness table accessor for type CAFFuelLevelObservable and conformance CAFFuelLevelObservable(&lazy protocol witness table cache variable for type CAFFuelLevelObservable and conformance CAFFuelLevelObservable, (uint64_t)&protocol conformance descriptor for CAFFuelLevelObservable);
}

unint64_t lazy protocol witness table accessor for type CAFFuelLevel and conformance CAFFuelLevel()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type CAFFuelLevel and conformance CAFFuelLevel;
  if (!lazy protocol witness table cache variable for type CAFFuelLevel and conformance CAFFuelLevel)
  {
    v1 = type metadata accessor for CAFTemperature(255, &lazy cache variable for type metadata for CAFFuelLevel);
    result = MEMORY[0x23B812308](&protocol conformance descriptor for CAFFuelLevel, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CAFFuelLevel and conformance CAFFuelLevel);
  }
  return result;
}

void instantiation function for generic protocol witness table for CAFFuelLevelObservable(uint64_t a1)
{
  uint64_t v2;

  lazy protocol witness table accessor for type CAFFuelLevelObservable and conformance CAFFuelLevelObservable(&lazy protocol witness table cache variable for type CAFFuelLevelObservable and conformance CAFFuelLevelObservable, (uint64_t)&protocol conformance descriptor for CAFFuelLevelObservable);
  *(_QWORD *)(a1 + 8) = v2;
}

void lazy protocol witness table accessor for type CAFFuelLevelObservable and conformance CAFFuelLevelObservable(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = type metadata accessor for CAFFuelLevelObservable();
    atomic_store(MEMORY[0x23B812308](a2, v4), a1);
  }
  OUTLINED_FUNCTION_11();
}

uint64_t method lookup function for CAFFuelLevelObservable()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CAFFuelLevelObservable.fuelLevel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CAFFuelLevelObservable.$fuelLevel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CAFFuelLevelObservable.fuelLevelState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CAFFuelLevelObservable.$fuelLevelState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CAFFuelLevelObservable.fuelLevelMarkerLow.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of CAFFuelLevelObservable.$fuelLevelMarkerLow.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CAFFuelLevelObservable.fillLevelLabel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of CAFFuelLevelObservable.$fillLevelLabel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of CAFFuelLevelObservable.portSideIndicator.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CAFFuelLevelObservable.$portSideIndicator.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CAFFuelLevelObservable.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t partial apply for closure #1 in CAFFuelLevelObservable.resetCachedDescription()()
{
  return CAFFuelLevelObservable.cachedDescription.setter(0, 0);
}

id CAFFloatSettingObservable.observed.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_observed);
}

uint64_t CAFFloatSettingObservable.cachedDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_cachedDescription);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

void CAFFloatSettingObservable.userVisibleLabel.getter()
{
  CAFFloatSettingObservable.sectionIdentifier.getter();
}

void CAFFloatSettingObservable.$userVisibleLabel.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__userVisibleLabel, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFFloatSettingObservable.sectionIdentifier.getter()
{
  CAFFloatSettingObservable.sectionIdentifier.getter();
}

{
  uint64_t v0;
  id v1;
  void *v2;

  OUTLINED_FUNCTION_21_3();
  v2 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v2;
  OUTLINED_FUNCTION_37_1();

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_33_0();
}

void CAFFloatSettingObservable.$sectionIdentifier.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__sectionIdentifier, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t CAFFloatSettingObservable.sortOrder.getter()
{
  uint64_t v0;
  id v1;
  void *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;

  OUTLINED_FUNCTION_21_3();
  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v3;
  OUTLINED_FUNCTION_37_1();

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37();
  return v4 | (v5 << 8);
}

void CAFFloatSettingObservable.$sortOrder.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__sortOrder, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFFloatSettingObservable.category.getter()
{
  uint64_t v0;
  id v1;
  void *v2;

  OUTLINED_FUNCTION_21_3();
  v2 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v2;
  OUTLINED_FUNCTION_37_1();

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_56_0();
}

void CAFFloatSettingObservable.$category.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__category, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

void CAFFloatSettingObservable.identifier.getter()
{
  CAFFloatSettingObservable.sectionIdentifier.getter();
}

void CAFFloatSettingObservable.$identifier.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__identifier, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFFloatSettingObservable.disabled.getter()
{
  CAFFloatSettingObservable.disabled.getter();
}

{
  uint64_t v0;
  id v1;
  void *v2;

  OUTLINED_FUNCTION_21_3();
  v2 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v2;
  OUTLINED_FUNCTION_37_1();

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_56_0();
}

void CAFFloatSettingObservable.$disabled.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__disabled, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFFloatSettingObservable.limitableUIElement.getter()
{
  CAFFloatSettingObservable.disabled.getter();
}

void CAFFloatSettingObservable.$limitableUIElement.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__limitableUIElement, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFFloatSettingObservable.hidden.getter()
{
  CAFFloatSettingObservable.disabled.getter();
}

void CAFFloatSettingObservable.$hidden.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__hidden, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFFloatSettingObservable.showAudioBrandLogo.getter()
{
  CAFFloatSettingObservable.disabled.getter();
}

void CAFFloatSettingObservable.$showAudioBrandLogo.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__showAudioBrandLogo, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFFloatSettingObservable.vehicleLayoutKey.getter()
{
  CAFFloatSettingObservable.sectionIdentifier.getter();
}

void CAFFloatSettingObservable.$vehicleLayoutKey.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__vehicleLayoutKey, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFFloatSettingObservable.symbolName.getter()
{
  CAFFloatSettingObservable.sectionIdentifier.getter();
}

void CAFFloatSettingObservable.$symbolName.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__symbolName, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t CAFFloatSettingObservable.prominenceInfo.getter()
{
  uint64_t v0;
  id v1;
  void *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_21_3();
  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v3;
  OUTLINED_FUNCTION_37_1();

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37();
  return v4;
}

void CAFFloatSettingObservable.$prominenceInfo.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__prominenceInfo, (void (*)(uint64_t))specialized SafeReadOnlyPublished.projectedValue.getter);
}

void key path getter for CAFFloatSettingObservable.value : CAFFloatSettingObservable(float *a1@<X8>)
{
  *a1 = CAFFloatSettingObservable.value.getter();
}

void key path setter for CAFFloatSettingObservable.value : CAFFloatSettingObservable(float *a1)
{
  CAFFloatSettingObservable.value.setter(*a1);
}

float CAFFloatSettingObservable.value.getter()
{
  uint64_t v0;
  id v1;
  void (*v2)(uint64_t *, _QWORD);
  float *v3;
  float v4;
  uint64_t v6;
  id v7;

  OUTLINED_FUNCTION_61_0();
  v7 = *(id *)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_observed);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_146();
  v1 = v7;
  v2 = (void (*)(uint64_t *, _QWORD))swift_readAtKeyPath();
  v4 = *v3;
  v2(&v6, 0);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_27();

  return v4;
}

void CAFFloatSettingObservable.value.setter(float a1)
{
  void *v1;

  swift_getKeyPath();
  swift_getKeyPath();
  specialized static SafePublished.subscript.setter(v1, a1);
}

void (*CAFFloatSettingObservable.value.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  void (*v6)(void *, _QWORD);
  int *v7;
  int v8;

  v3 = malloc(0x60uLL);
  *a1 = v3;
  *((_QWORD *)v3 + 8) = v1;
  *((_QWORD *)v3 + 9) = swift_getKeyPath();
  *((_QWORD *)v3 + 10) = swift_getKeyPath();
  swift_beginAccess();
  v4 = *(void **)(v1 + OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_observed);
  *((_QWORD *)v3 + 7) = v4;
  OUTLINED_FUNCTION_146();
  swift_retain();
  v5 = v4;
  v6 = (void (*)(void *, _QWORD))swift_readAtKeyPath();
  v8 = *v7;
  v6(v3, 0);
  OUTLINED_FUNCTION_37();
  swift_release();

  *((_DWORD *)v3 + 22) = v8;
  return CAFFloatSettingObservable.value.modify;
}

void CAFFloatSettingObservable.value.modify(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  specialized static SafePublished.subscript.setter(*(id *)(*(_QWORD *)a1 + 64), *(float *)(*(_QWORD *)a1 + 88));
  free(v1);
}

uint64_t CAFFloatSettingObservable.$value.getter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_61_0();
  OUTLINED_FUNCTION_32();
  specialized SafePublished.projectedValue.getter();
  v1 = v0;
  OUTLINED_FUNCTION_25();
  return v1;
}

void CAFFloatSettingObservable.maximumSymbolName.getter()
{
  CAFFloatSettingObservable.sectionIdentifier.getter();
}

void CAFFloatSettingObservable.$maximumSymbolName.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__maximumSymbolName, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFFloatSettingObservable.minimumSymbolName.getter()
{
  CAFFloatSettingObservable.sectionIdentifier.getter();
}

void CAFFloatSettingObservable.$minimumSymbolName.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__minimumSymbolName, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

void CAFFloatSettingObservable.name.getter()
{
  CAFFloatSettingObservable.sectionIdentifier.getter();
}

void CAFFloatSettingObservable.$name.getter()
{
  CAFTemperatureObservable.$currentTemperature.getter((uint64_t)&OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__name, (void (*)(uint64_t))specialized SafePublished.projectedValue.getter);
}

uint64_t CAFFloatSettingObservable._description.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Swift::String v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;

  v1 = (uint64_t)OUTLINED_FUNCTION_67(a1, sel_registeredForFloatValue);
  v2 = 0x73696765726E753CLL;
  v3 = (void *)0xEE003E6465726574;
  if ((_DWORD)v1)
  {
    CAFFloatSettingObservable.value.getter();
    v1 = Float.description.getter();
    v2 = v1;
    v3 = v4;
  }
  v5 = (uint64_t)OUTLINED_FUNCTION_67(v1, sel_registeredForMaximumSymbolName);
  v6 = 0x73696765726E753CLL;
  v7 = (void *)0xEE003E6465726574;
  if ((_DWORD)v5)
  {
    CAFFloatSettingObservable.maximumSymbolName.getter();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
    v5 = OUTLINED_FUNCTION_24_0();
    v6 = v5;
    v7 = v8;
  }
  if (OUTLINED_FUNCTION_67(v5, sel_registeredForMinimumSymbolName))
  {
    CAFFloatSettingObservable.minimumSymbolName.getter();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
    OUTLINED_FUNCTION_24_0();
  }
  _StringGuts.grow(_:)(91);
  v9._countAndFlagsBits = 0xD00000000000001CLL;
  v9._object = (void *)0x80000002374E4C40;
  String.append(_:)(v9);
  _print_unlocked<A, B>(_:_:)();
  v10._countAndFlagsBits = 0x65756C6176207B20;
  v10._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v10);
  v11._countAndFlagsBits = v2;
  v11._object = v3;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_10((uint64_t)", maximumSymbolName: ");
  v12._countAndFlagsBits = v6;
  v12._object = v7;
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_10((uint64_t)", minimumSymbolName: ");
  v13._countAndFlagsBits = OUTLINED_FUNCTION_31_0();
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 4095264;
  v14._object = (void *)0xE300000000000000;
  String.append(_:)(v14);
  return 0;
}

uint64_t CAFFloatSettingObservable.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_cachedDescriptionLock;
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_cachedDescriptionLock)
                          + 16);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v2);
  v3 = OUTLINED_FUNCTION_27();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_cachedDescription + 8))
  {
    v4 = *(os_unfair_lock_s **)(v0 + v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    CAFFloatSettingObservable._description.getter(v3);
    swift_bridgeObjectRetain();
    v5 = OUTLINED_FUNCTION_31_0();
    CAFFloatSettingObservable.cachedDescription.setter(v5, v6);
    v4 = *(os_unfair_lock_s **)(v0 + v1);
  }
  OUTLINED_FUNCTION_32();
  os_unfair_lock_unlock(v4 + 4);
  OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_31_0();
}

void CAFFloatSettingObservable.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  CAFFloatSettingObservable.init(_:)(a1);
  OUTLINED_FUNCTION_11();
}

id CAFFloatSettingObservable.init(_:)(void *a1)
{
  char *v1;
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  objc_super v32;

  v2 = v1;
  v4 = &v1[OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_cachedDescription];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_cachedDescriptionLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)&v2[v5] = v6;
  v7 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__userVisibleLabel;
  KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFFloatSettingObservable, String>);
  OUTLINED_FUNCTION_127();
  v9 = v2;
  *(_QWORD *)&v2[v7] = specialized SafePublished.init(observedValuekeypath:)(KeyPath);
  v10 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__sectionIdentifier;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFFloatSettingObservable, String?>);
  OUTLINED_FUNCTION_127();
  *(_QWORD *)&v9[v10] = OUTLINED_FUNCTION_32_0();
  v11 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__sortOrder;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFFloatSettingObservable, UInt8?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v9[v11] = v12;
  v13 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__category;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFFloatSettingObservable, CAFSettingsCategory>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v9[v13] = v14;
  v15 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__identifier;
  swift_getKeyPath();
  OUTLINED_FUNCTION_46_0();
  *(_QWORD *)&v9[v15] = OUTLINED_FUNCTION_19_1();
  v16 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__disabled;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFFloatSettingObservable, Bool?>);
  OUTLINED_FUNCTION_127();
  *(_QWORD *)&v9[v16] = OUTLINED_FUNCTION_17_0();
  v17 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__limitableUIElement;
  swift_getKeyPath();
  OUTLINED_FUNCTION_25_2();
  *(_QWORD *)&v9[v17] = OUTLINED_FUNCTION_17_0();
  v18 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__hidden;
  swift_getKeyPath();
  OUTLINED_FUNCTION_25_2();
  *(_QWORD *)&v9[v18] = OUTLINED_FUNCTION_17_0();
  v19 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__showAudioBrandLogo;
  swift_getKeyPath();
  OUTLINED_FUNCTION_25_2();
  *(_QWORD *)&v9[v19] = OUTLINED_FUNCTION_17_0();
  v20 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__vehicleLayoutKey;
  swift_getKeyPath();
  OUTLINED_FUNCTION_45_0();
  *(_QWORD *)&v9[v20] = OUTLINED_FUNCTION_32_0();
  v21 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__symbolName;
  swift_getKeyPath();
  OUTLINED_FUNCTION_45_0();
  *(_QWORD *)&v9[v21] = OUTLINED_FUNCTION_32_0();
  v22 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__prominenceInfo;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SafeReadOnlyPublished<CAFFloatSettingObservable, CAFProminenceInformation?>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafeReadOnlyPublished.init(observedValuekeypath:)();
  *(_QWORD *)&v9[v22] = v23;
  v24 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__value;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SafePublished<CAFFloatSettingObservable, Float>);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_16_1();
  specialized SafePublished.init(observedValuekeypath:)();
  *(_QWORD *)&v9[v24] = v25;
  v26 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__maximumSymbolName;
  swift_getKeyPath();
  OUTLINED_FUNCTION_45_0();
  *(_QWORD *)&v9[v26] = OUTLINED_FUNCTION_32_0();
  v27 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__minimumSymbolName;
  swift_getKeyPath();
  OUTLINED_FUNCTION_45_0();
  *(_QWORD *)&v9[v27] = OUTLINED_FUNCTION_32_0();
  v28 = OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable__name;
  swift_getKeyPath();
  OUTLINED_FUNCTION_46_0();
  *(_QWORD *)&v9[v28] = OUTLINED_FUNCTION_19_1();
  *(_QWORD *)&v9[OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_observed] = a1;
  v29 = a1;

  v32.receiver = v9;
  v32.super_class = (Class)type metadata accessor for CAFFloatSettingObservable();
  v30 = objc_msgSendSuper2(&v32, sel_init);
  objc_msgSend(v29, sel_registerObserver_, v30);

  return v30;
}

uint64_t CAFFloatSettingObservable.resetCachedDescription()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;

  v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_cachedDescriptionLock);
  OUTLINED_FUNCTION_40();
  os_unfair_lock_lock(v1 + 4);
  CAFFloatSettingObservable.cachedDescription.setter(0, 0);
  os_unfair_lock_unlock(v1 + 4);
  return OUTLINED_FUNCTION_18_0();
}

id CAFFloatSettingObservable.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC10CAFCombine25CAFFloatSettingObservable_observed], sel_unregisterObserver_, v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAFFloatSettingObservable();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id CAFFloatSettingObservable.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CAFFloatSettingObservable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void protocol witness for CAFObservable.observed.getter in conformance CAFFloatSettingObservable(id *a1@<X8>)
{
  *a1 = CAFFloatSettingObservable.observed.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374C2C38()
{
  float *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFFloatSettingObservable.value.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374C2C58(float *a1)
{
  CAFFloatSettingObservable.value.setter(*a1);
  OUTLINED_FUNCTION_11();
}

void protocol witness for CAFObservable.init(_:) in conformance CAFFloatSettingObservable(void **a1)
{
  CAFFloatSettingObservable.__allocating_init(_:)(*a1);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance CAFFloatSettingObservable@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CAFFloatSettingObservable();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t CAFFloatSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)()
{
  return CAFFloatSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)();
}

{
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_32();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31_0();
  specialized SafeReadOnlyPublished.value.setter();
  return OUTLINED_FUNCTION_18_0();
}

uint64_t CAFFloatSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)()
{
  return CAFFloatSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)();
}

{
  OUTLINED_FUNCTION_28_2();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_31_0();
  specialized SafeReadOnlyPublished.value.setter();
  return OUTLINED_FUNCTION_18_0();
}

uint64_t CAFFloatSettingObservable.automakerSettingService(_:didUpdateSortOrder:)()
{
  OUTLINED_FUNCTION_32();
  specialized SafeReadOnlyPublished.value.setter();
  return OUTLINED_FUNCTION_39_0();
}

uint64_t CAFFloatSettingObservable.automakerSettingService(_:didUpdateCategory:)()
{
  OUTLINED_FUNCTION_32();
  specialized SafeReadOnlyPublished.value.setter();
  return OUTLINED_FUNCTION_39_0();
}

uint64_t CAFFloatSettingObservable.automakerSettingService(_:didUpdateIdentifier:)()
{
  return CAFFloatSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)();
}

uint64_t CAFFloatSettingObservable.automakerSettingService(_:didUpdateDisabled:)()
{
  return CAFFloatSettingObservable.automakerSettingService(_:didUpdateDisabled:)();
}

{
  OUTLINED_FUNCTION_32();
  specialized SafeReadOnlyPublished.value.setter();
  return OUTLINED_FUNCTION_0();
}

uint64_t CAFFloatSettingObservable.automakerSettingService(_:didUpdateLimitableUIElement:)()
{
  return CAFFloatSettingObservable.automakerSettingService(_:didUpdateDisabled:)();
}

uint64_t CAFFloatSettingObservable.automakerSettingService(_:didUpdateHidden:)()
{
  return CAFFloatSettingObservable.automakerSettingService(_:didUpdateDisabled:)();
}

uint64_t CAFFloatSettingObservable.automakerSettingService(_:didUpdateShowAudioBrandLogo:)()
{
  return CAFFloatSettingObservable.automakerSettingService(_:didUpdateDisabled:)();
}

uint64_t CAFFloatSettingObservable.automakerSettingService(_:didUpdateVehicleLayoutKey:)()
{
  return CAFFloatSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)();
}

uint64_t CAFFloatSettingObservable.automakerSettingService(_:didUpdateSymbolName:)()
{
  return CAFFloatSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)();
}

uint64_t CAFFloatSettingObservable.automakerSettingService(_:didUpdateProminenceInfo:)(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  OUTLINED_FUNCTION_32();
  specialized SafeReadOnlyPublished.value.setter();
  return OUTLINED_FUNCTION_0();
}

uint64_t CAFFloatSettingObservable.floatSettingService(_:didUpdateValue:)()
{
  OUTLINED_FUNCTION_61_0();
  OUTLINED_FUNCTION_32();
  specialized SafePublished.value.setter();
  return OUTLINED_FUNCTION_25();
}

uint64_t CAFFloatSettingObservable.floatSettingService(_:didUpdateMaximumSymbolName:)()
{
  return CAFFloatSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)();
}

uint64_t CAFFloatSettingObservable.floatSettingService(_:didUpdateMinimumSymbolName:)()
{
  return CAFFloatSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)();
}

uint64_t CAFFloatSettingObservable.floatSettingService(_:didUpdateName:)()
{
  return CAFFloatSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)();
}

void CAFFloatSettingObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;

  v4 = CAFFloatSettingObservable.resetCachedDescription()();
  if ((a3 & 1) != 0)
    OUTLINED_FUNCTION_11();
  else
    specialized CAFObservable.notifyChange()(v4);
}

uint64_t CAFFloatSettingObservable.serviceDidUpdate(_:receivedAllValues:)(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return specialized CAFObservable.notifyChange()();
  return result;
}

void sub_2374C3344(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFAutomakerSetting.userVisibleLabel : CAFButtonSetting(a1, a2, a3, (SEL *)&selRef_userVisibleLabel);
}

void sub_2374C3360(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFAutomakerSetting.sectionIdentifier : CAFButtonSetting(a1, a2, a3, (SEL *)&selRef_sectionIdentifier);
}

void sub_2374C3380(id *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = objc_msgSend(*a1, sel_category);
  OUTLINED_FUNCTION_11();
}

void sub_2374C33AC(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFAutomakerSetting.userVisibleLabel : CAFButtonSetting(a1, a2, a3, (SEL *)&selRef_identifier);
}

void sub_2374C33C8()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFMultipleSelectImageSetting.disabledBridged.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374C33E8()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFMultipleSelectImageSetting.limitableUIElementBridged.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374C3408()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFMultipleSelectImageSetting.hiddenBridged.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374C3428()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_20_0();
  *v0 = CAFMultipleSelectImageSetting.showAudioBrandLogoBridged.getter();
  OUTLINED_FUNCTION_11();
}

void sub_2374C3448(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFAutomakerSetting.sectionIdentifier : CAFButtonSetting(a1, a2, a3, (SEL *)&selRef_vehicleLayoutKey);
}

void sub_2374C3464(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFAutomakerSetting.sectionIdentifier : CAFButtonSetting(a1, a2, a3, (SEL *)&selRef_symbolName);
}

void sub_2374C3484(id *a1@<X0>, _DWORD *a2@<X8>)
{
  int v3;

  objc_msgSend(*a1, sel_value);
  *a2 = v3;
  OUTLINED_FUNCTION_11();
}

id sub_2374C34B0(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setValue_, a3);
}

void sub_2374C34C4(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFAutomakerSetting.sectionIdentifier : CAFButtonSetting(a1, a2, a3, (SEL *)&selRef_maximumSymbolName);
}

void sub_2374C34E0(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFAutomakerSetting.sectionIdentifier : CAFButtonSetting(a1, a2, a3, (SEL *)&selRef_minimumSymbolName);
}

void sub_2374C34FC(id *a1, uint64_t a2, uint64_t a3)
{
  key path getter for CAFAutomakerSetting.userVisibleLabel : CAFButtonSetting(a1, a2, a3, (SEL *)&selRef_name);
}

uint64_t type metadata accessor for CAFFloatSettingObservable()
{
  return objc_opt_self();
}

void associated type witness table accessor for CAFObserved.Observable : CAFObservable in CAFFloatSetting(uint64_t a1, uint64_t a2)
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(lazy protocol witness table cache variable for type CAFFloatSettingObservable and conformance CAFFloatSettingObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFFloatSettingObservable, (uint64_t)&protocol conformance descriptor for CAFFloatSettingObservable);
}

void associated type witness table accessor for CAFObservable.Observed : CAFObserved in CAFFloatSettingObservable()
{
  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFFloatSetting and conformance CAFFloatSetting, 255, (uint64_t (*)(uint64_t))type metadata accessor for CAFFloatSetting, (uint64_t)&protocol conformance descriptor for CAFFloatSetting);
}

unint64_t type metadata accessor for CAFFloatSetting()
{
  unint64_t result;

  result = lazy cache variable for type metadata for CAFFloatSetting;
  if (!lazy cache variable for type metadata for CAFFloatSetting)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CAFFloatSetting);
  }
  return result;
}

void instantiation function for generic protocol witness table for CAFFloatSettingObservable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  lazy protocol witness table accessor for type CAFClimateControlsLockedObservable and conformance CAFClimateControlsLockedObservable(&lazy protocol witness table cache variable for type CAFFloatSettingObservable and conformance CAFFloatSettingObservable, a2, (uint64_t (*)(uint64_t))type metadata accessor for CAFFloatSettingObservable, (uint64_t)&protocol conformance descriptor for CAFFloatSettingObservable);
  *(_QWORD *)(a1 + 8) = v3;
}

uint64_t method lookup function for CAFFloatSettingObservable()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.userVisibleLabel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$userVisibleLabel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.sectionIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$sectionIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.sortOrder.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))() & 0x1FF;
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$sortOrder.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.category.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$category.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.identifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$identifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.disabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$disabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.limitableUIElement.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$limitableUIElement.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.hidden.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$hidden.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.showAudioBrandLogo.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$showAudioBrandLogo.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.vehicleLayoutKey.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$vehicleLayoutKey.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.symbolName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$symbolName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.prominenceInfo.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$prominenceInfo.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.value.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.value.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.value.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$value.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.maximumSymbolName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$maximumSymbolName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.minimumSymbolName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$minimumSymbolName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.name.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.$name.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of CAFFloatSettingObservable.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 560))();
}

uint64_t specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

NSMeasurement __swiftcall Measurement._bridgeToObjectiveC()()
{
  objc_class *v0;
  void *v1;
  double v2;
  NSMeasurement result;

  v0 = (objc_class *)MEMORY[0x24BDCB430]();
  result._doubleValue = v2;
  result._unit = v1;
  result.super.isa = v0;
  return result;
}

uint64_t static Measurement._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCB468]();
}

uint64_t Measurement.value.getter()
{
  return MEMORY[0x24BDCB498]();
}

uint64_t static Measurement<>.+ infix(_:_:)()
{
  return MEMORY[0x24BDCB548]();
}

uint64_t static Measurement<>.- infix(_:_:)()
{
  return MEMORY[0x24BDCB550]();
}

uint64_t Measurement<>.converted(to:)()
{
  return MEMORY[0x24BDCB568]();
}

uint64_t Data.description.getter()
{
  return MEMORY[0x24BDCDBE0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t Locale.decimalSeparator.getter()
{
  return MEMORY[0x24BDCEBF8]();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)MEMORY[0x24BDCEC90]();
}

uint64_t static Locale.autoupdatingCurrent.getter()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t static Locale._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t CAUVehicleLayoutKey.sharedKeys.getter()
{
  return MEMORY[0x24BE15128]();
}

uint64_t CAUVehicleLayoutKey.init(rawValue:)()
{
  return MEMORY[0x24BE15140]();
}

uint64_t CAUVehicleLayoutKey.rawValue.getter()
{
  return MEMORY[0x24BE15148]();
}

uint64_t type metadata accessor for CAUVehicleLayoutKey()
{
  return MEMORY[0x24BE15150]();
}

uint64_t type metadata accessor for Publishers.CompactMap()
{
  return MEMORY[0x24BDB94B8]();
}

uint64_t type metadata accessor for Publishers.Concatenate()
{
  return MEMORY[0x24BDB9520]();
}

uint64_t type metadata accessor for Publishers.Filter()
{
  return MEMORY[0x24BDB97E8]();
}

uint64_t type metadata accessor for Publishers.Sequence()
{
  return MEMORY[0x24BDB9960]();
}

uint64_t type metadata accessor for AnyPublisher()
{
  return MEMORY[0x24BDB9AE0]();
}

uint64_t dispatch thunk of ObservableObject.objectWillChange.getter()
{
  return MEMORY[0x24BDB9C40]();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t PassthroughSubject.send(_:)()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t PassthroughSubject.init()()
{
  return MEMORY[0x24BDB9C90]();
}

Swift::Void __swiftcall ObservableObjectPublisher.send()()
{
  MEMORY[0x24BDB9D68]();
}

uint64_t type metadata accessor for ObservableObjectPublisher()
{
  return MEMORY[0x24BDB9D80]();
}

uint64_t Published.init(initialValue:)()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t Published.projectedValue.getter()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t Published.projectedValue.setter()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t Published.objectWillChange.getter()
{
  return MEMORY[0x24BDB9EB0]();
}

uint64_t Published.objectWillChange.setter()
{
  return MEMORY[0x24BDB9EB8]();
}

uint64_t static Published.subscript.modify()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t static Published.subscript.getter()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t static Published.subscript.setter()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t type metadata accessor for Published.Publisher()
{
  return MEMORY[0x24BDB9ED8]();
}

uint64_t type metadata accessor for Published()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t Publisher.compactMap<A>(_:)()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t Publisher.filter(_:)()
{
  return MEMORY[0x24BDBA030]();
}

uint64_t Publisher.prepend(_:)()
{
  return MEMORY[0x24BDBA080]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

{
  return MEMORY[0x24BEE09F8]();
}

uint64_t String.init(stringInterpolation:)()
{
  return MEMORY[0x24BEE0AE0]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE1110]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t static Array._adoptStorage(_:count:)()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x24BEE1250]();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x24BDCFC58]();
}

uint64_t Double.description.getter()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t Float.description.getter()
{
  return MEMORY[0x24BEE1488]();
}

uint64_t NSDimension.init(forLocale:)()
{
  return MEMORY[0x24BDCFDC8]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t NSMeasurementFormatter.string<A>(from:)()
{
  return MEMORY[0x24BDD00A8]();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t type metadata accessor for _ContiguousArrayStorage()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t NSStringFromAutoModeIntensity()
{
  return MEMORY[0x24BE14CC8]();
}

uint64_t NSStringFromBatteryLevelState()
{
  return MEMORY[0x24BE14CD0]();
}

uint64_t NSStringFromButtonAction()
{
  return MEMORY[0x24BE14CD8]();
}

uint64_t NSStringFromCableState()
{
  return MEMORY[0x24BE14CE0]();
}

uint64_t NSStringFromChargingState()
{
  return MEMORY[0x24BE14CE8]();
}

uint64_t NSStringFromDefrostTypes()
{
  return MEMORY[0x24BE14CF0]();
}

uint64_t NSStringFromDeviceAction()
{
  return MEMORY[0x24BE14CF8]();
}

uint64_t NSStringFromEqualizerType()
{
  return MEMORY[0x24BE14D00]();
}

uint64_t NSStringFromFillLevelLabel()
{
  return MEMORY[0x24BE14D08]();
}

uint64_t NSStringFromFuelLevelState()
{
  return MEMORY[0x24BE14D10]();
}

uint64_t NSStringFromImageColor()
{
  return MEMORY[0x24BE14D18]();
}

uint64_t NSStringFromLockState()
{
  return MEMORY[0x24BE14D20]();
}

uint64_t NSStringFromMediaCategory()
{
  return MEMORY[0x24BE14D28]();
}

uint64_t NSStringFromMediaSourceSemanticType()
{
  return MEMORY[0x24BE14D30]();
}

uint64_t NSStringFromNotificationSeverity()
{
  return MEMORY[0x24BE14D38]();
}

uint64_t NSStringFromPairedDeviceState()
{
  return MEMORY[0x24BE14D40]();
}

uint64_t NSStringFromPlaybackState()
{
  return MEMORY[0x24BE14D48]();
}

uint64_t NSStringFromPortSideIndicator()
{
  return MEMORY[0x24BE14D50]();
}

uint64_t NSStringFromPressureState()
{
  return MEMORY[0x24BE14D58]();
}

uint64_t NSStringFromRotationalSpeedState()
{
  return MEMORY[0x24BE14D60]();
}

uint64_t NSStringFromSeatBeltIndicator()
{
  return MEMORY[0x24BE14D68]();
}

uint64_t NSStringFromSeatOccupancy()
{
  return MEMORY[0x24BE14D70]();
}

uint64_t NSStringFromSensorState()
{
  return MEMORY[0x24BE14D78]();
}

uint64_t NSStringFromSettingProminenceLevel()
{
  return MEMORY[0x24BE14D80]();
}

uint64_t NSStringFromSettingsCategory()
{
  return MEMORY[0x24BE14D88]();
}

uint64_t NSStringFromTargetSpeedState()
{
  return MEMORY[0x24BE14D90]();
}

uint64_t NSStringFromTemperatureState()
{
  return MEMORY[0x24BE14D98]();
}

uint64_t NSStringFromTransmissionMode()
{
  return MEMORY[0x24BE14DA0]();
}

uint64_t NSStringFromUIInputDeviceButtonEvent()
{
  return MEMORY[0x24BE14DA8]();
}

uint64_t NSStringFromUIInputDevicePurpose()
{
  return MEMORY[0x24BE14DB0]();
}

uint64_t NSStringFromUISceneState()
{
  return MEMORY[0x24BE14DB8]();
}

uint64_t NSStringFromVentTypes()
{
  return MEMORY[0x24BE14DC0]();
}

uint64_t NSStringFromVolumeType()
{
  return MEMORY[0x24BE14DC8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x24BEE4ED8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x24BEE4F20]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

