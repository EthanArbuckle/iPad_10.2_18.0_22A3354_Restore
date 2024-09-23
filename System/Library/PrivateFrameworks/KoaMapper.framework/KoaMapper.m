void type metadata accessor for CAFMediaSourceSemanticType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for CAFMediaSourceSemanticType)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for CAFMediaSourceSemanticType);
  }
}

BOOL specialized == infix<A>(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance CAFMediaSourceSemanticType@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = CAFMediaSourceSemanticType.init(rawValue:)(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t CAFMediaSourceSemanticType.init(rawValue:)(uint64_t result)
{
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance CAFMediaSourceSemanticType@<X0>(_BYTE *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;

  result = CAFMediaSourceSemanticType.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CAFMediaSourceSemanticType()
{
  Swift::UInt8 *v0;

  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(Swift::UInt8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CAFMediaSourceSemanticType(int a1)
{
  Swift::UInt8 *v1;

  specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

void specialized RawRepresentable<>.hash(into:)(int a1, Swift::UInt8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CAFMediaSourceSemanticType(uint64_t a1)
{
  Swift::UInt8 *v1;

  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, Swift::UInt8 a2)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a2);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CAFMediaSourceSemanticType(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

unint64_t lazy protocol witness table accessor for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType;
  if (!lazy protocol witness table cache variable for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType)
  {
    type metadata accessor for CAFMediaSourceSemanticType();
    result = MEMORY[0x219A1B070](&protocol conformance descriptor for CAFMediaSourceSemanticType, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType);
  }
  return result;
}

void key path setter for CarPlayConnectionManager.car_queue : CarPlayConnectionManager(id *a1)
{
  CarPlayConnectionManager.car_queue.setter(*a1);
}

id CarPlayConnectionManager.car_queue.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___CarPlayConnectionManager_car_queue);
  OUTLINED_FUNCTION_1();
  return OUTLINED_FUNCTION_0(*v1);
}

void CarPlayConnectionManager.car_queue.setter(void *a1)
{
  CarPlayConnectionManager.car_queue.setter(a1, &OBJC_IVAR___CarPlayConnectionManager_car_queue);
}

void key path setter for CarPlayConnectionManager.carManager : CarPlayConnectionManager(id *a1)
{
  CarPlayConnectionManager.carManager.setter(*a1);
}

id CarPlayConnectionManager.carManager.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___CarPlayConnectionManager_carManager);
  OUTLINED_FUNCTION_1();
  return OUTLINED_FUNCTION_0(*v1);
}

void CarPlayConnectionManager.carManager.setter(void *a1)
{
  CarPlayConnectionManager.car_queue.setter(a1, &OBJC_IVAR___CarPlayConnectionManager_carManager);
}

void key path setter for CarPlayConnectionManager.carManagerObservable : CarPlayConnectionManager(id *a1)
{
  CarPlayConnectionManager.carManagerObservable.setter(*a1);
}

id CarPlayConnectionManager.carManagerObservable.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___CarPlayConnectionManager_carManagerObservable);
  OUTLINED_FUNCTION_1();
  return OUTLINED_FUNCTION_0(*v1);
}

void CarPlayConnectionManager.carManagerObservable.setter(void *a1)
{
  CarPlayConnectionManager.car_queue.setter(a1, &OBJC_IVAR___CarPlayConnectionManager_carManagerObservable);
}

void CarPlayConnectionManager.car_queue.setter(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  OUTLINED_FUNCTION_4();
  v5 = *v4;
  *v4 = a1;

}

id CarPlayConnectionManager.carRadioListener.getter()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v1 = OBJC_IVAR___CarPlayConnectionManager____lazy_storage___carRadioListener;
  v2 = *(void **)((char *)v0 + OBJC_IVAR___CarPlayConnectionManager____lazy_storage___carRadioListener);
  if (v2)
  {
    v3 = *(id *)((char *)v0 + OBJC_IVAR___CarPlayConnectionManager____lazy_storage___carRadioListener);
  }
  else
  {
    v4 = v0;
    v5 = (void *)OUTLINED_FUNCTION_29(*v0);
    v6 = objc_allocWithZone((Class)type metadata accessor for RadioListener());
    v7 = RadioListener.init(serialQueue:)(v5);
    v8 = *(void **)((char *)v4 + v1);
    *(uint64_t *)((char *)v4 + v1) = (uint64_t)v7;
    v3 = v7;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

id CarPlayConnectionManager.__deallocating_deinit()
{
  char *v0;
  id *v1;
  objc_super v3;

  v1 = (id *)&v0[OBJC_IVAR___CarPlayConnectionManager_carManager];
  OUTLINED_FUNCTION_1();
  objc_msgSend(*v1, sel_unregisterObserver_, v0);
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for CarPlayConnectionManager();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for CarPlayConnectionManager()
{
  return objc_opt_self();
}

void CarPlayConnectionManager.__allocating_init(carManager:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  CarPlayConnectionManager.init(carManager:)(a1);
  OUTLINED_FUNCTION_25();
}

char *CarPlayConnectionManager.init(carManager:)(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  char *v9;
  void **v10;
  void *v11;
  char *v12;
  id *v13;
  void (*v14)(void);
  id v15;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v20 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v3 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_5();
  type metadata accessor for OS_dispatch_queue.Attributes();
  v4 = (void (*)(uint64_t))MEMORY[0x24BEE5688];
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_6();
  type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_2();
  v5 = MEMORY[0x24BDAC7A8]();
  v19 = OBJC_IVAR___CarPlayConnectionManager_car_queue;
  OUTLINED_FUNCTION_27(v5, &lazy cache variable for type metadata for OS_dispatch_queue);
  v6 = v1;
  static DispatchQoS.unspecified.getter();
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, v4);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BEE5750], v20);
  *(_QWORD *)(v18 + v19) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter())
    v7 = specialized Set.init(_nonEmptyArrayLiteral:)(MEMORY[0x24BEE4AF8]);
  else
    v7 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v6[OBJC_IVAR___CarPlayConnectionManager_cancellables] = v7;
  *(_QWORD *)&v6[OBJC_IVAR___CarPlayConnectionManager____lazy_storage___carRadioListener] = 0;
  *(_QWORD *)&v6[OBJC_IVAR___CarPlayConnectionManager_carManager] = a1;
  type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for CAFCarManager);
  lazy protocol witness table accessor for type CAFCar and conformance CAFCar(&lazy protocol witness table cache variable for type CAFCarManager and conformance CAFCarManager, (unint64_t *)&lazy cache variable for type metadata for CAFCarManager);
  v8 = a1;
  *(_QWORD *)&v6[OBJC_IVAR___CarPlayConnectionManager_carManagerObservable] = CAFObserved<>.observable.getter();

  v21.receiver = v6;
  v21.super_class = (Class)type metadata accessor for CarPlayConnectionManager();
  v9 = (char *)objc_msgSendSuper2(&v21, sel_init);
  v10 = (void **)&v9[OBJC_IVAR___CarPlayConnectionManager_carManager];
  OUTLINED_FUNCTION_1();
  v11 = *v10;
  v12 = v9;
  objc_msgSend(v11, sel_registerObserver_, v12);
  v13 = (id *)&v12[OBJC_IVAR___CarPlayConnectionManager_carManagerObservable];
  OUTLINED_FUNCTION_1();
  v14 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v12) + 0x110);
  v15 = *v13;
  v14();

  return v12;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A1B058]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A1B064](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void lazy protocol witness table accessor for type CAFCar and conformance CAFCar(_QWORD *a1, unint64_t *a2)
{
  if (!*a1)
  {
    type metadata accessor for OS_dispatch_queue(255, a2);
    OUTLINED_FUNCTION_12();
  }
  OUTLINED_FUNCTION_25();
}

Swift::Void __swiftcall CarPlayConnectionManager.resetListeners()()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;

  v0 = CarPlayConnectionManager.carRadioListener.getter();
  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();

  v2 = CarPlayConnectionManager.carRadioListener.getter();
  (*(void (**)(void))((*v1 & *v2) + 0x150))();
  OUTLINED_FUNCTION_7(v2);
}

void one-time initialization function for shared()
{
  uint64_t v0;

  closure #1 in variable initialization expression of static CarPlayConnectionManager.shared();
  static CarPlayConnectionManager.shared = v0;
}

void closure #1 in variable initialization expression of static CarPlayConnectionManager.shared()
{
  objc_class *v0;
  uint64_t ObjCClassFromMetadata;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  v0 = (objc_class *)type metadata accessor for CarPlayConnectionManager();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = outlined bridged method (mbbnb) of @objc NSBundle.path(forResource:ofType:)(0x5379616C50726143, 0xED0000616D656863, 0x7473696C70, 0xE500000000000000, v2);
  v5 = v4;

  if (v5)
  {
    v6 = objc_allocWithZone(MEMORY[0x24BE14E40]);
    v7 = @nonobjc CAFCarManager.init(registrationFilePath:)(v3, v5);
    v8 = objc_allocWithZone(v0);
    CarPlayConnectionManager.init(carManager:)(v7);
  }
  else
  {
    __break(1u);
  }
}

id static CarPlayConnectionManager.shared.getter()
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return (id)static CarPlayConnectionManager.shared;
}

void CarPlayConnectionManager.registerUpdateHandler(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  v4 = CarPlayConnectionManager.carRadioListener.getter();
  (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v4) + 0x160))(a1, a2);
  OUTLINED_FUNCTION_7(v4);
}

void CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)()
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
  void *v9;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_dispatch_queue.SchedulerOptions?);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_20();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFCar?>.Publisher);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_5();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Publishers.ReceiveOn<Published<CAFCar?>.Publisher, OS_dispatch_queue>);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_6();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.CompactMap<Publishers.ReceiveOn<Published<CAFCar?>.Publisher, OS_dispatch_queue>, CAFCar>);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_11();
  dispatch thunk of CAFCarManagerObservable.$currentCar.getter();
  v6 = OUTLINED_FUNCTION_23(*v0);
  v7 = OUTLINED_FUNCTION_33(v6);
  OUTLINED_FUNCTION_19(v7);
  OUTLINED_FUNCTION_21();
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Published<CAFCar?>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<CAFCar?>.Publisher);
  OUTLINED_FUNCTION_26(lazy protocol witness table cache variable for type OS_dispatch_queue and conformance OS_dispatch_queue);
  OUTLINED_FUNCTION_3();
  outlined destroy of OS_dispatch_queue.SchedulerOptions?(v1);

  v8 = OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_27(v8, &lazy cache variable for type metadata for CAFCar);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.ReceiveOn<Published<CAFCar?>.Publisher, OS_dispatch_queue> and conformance Publishers.ReceiveOn<A, B>, (uint64_t *)&demangling cache variable for type metadata for Publishers.ReceiveOn<Published<CAFCar?>.Publisher, OS_dispatch_queue>);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.CompactMap<Publishers.ReceiveOn<Published<CAFCar?>.Publisher, OS_dispatch_queue>, CAFCar> and conformance Publishers.CompactMap<A, B>, &demangling cache variable for type metadata for Publishers.CompactMap<Publishers.ReceiveOn<Published<CAFCar?>.Publisher, OS_dispatch_queue>, CAFCar>);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  OUTLINED_FUNCTION_9();
}

id closure #1 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  return closure #1 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)(a1, (uint64_t *)&demangling cache variable for type metadata for CAFCar?, "#radio: Connecting to CarPlay — received CAFCar: %s", a2);
}

void closure #2 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x219A1B148](v2);
  if (v3)
  {
    v4 = (void *)v3;
    type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for CAFCar);
    lazy protocol witness table accessor for type CAFCar and conformance CAFCar(lazy protocol witness table cache variable for type CAFCar and conformance CAFCar, &lazy cache variable for type metadata for CAFCar);
    v5 = (void *)CAFObserved<>.observable.getter();
    CarPlayConnectionManager.setupCarMediaConnection(_:)();

  }
}

void CarPlayConnectionManager.setupCarMediaConnection(_:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_dispatch_queue.SchedulerOptions?);
  OUTLINED_FUNCTION_2();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_20();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFMedia?>.Publisher);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_5();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.ReceiveOn<Published<CAFMedia?>.Publisher, OS_dispatch_queue>);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_6();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.CompactMap<Publishers.ReceiveOn<Published<CAFMedia?>.Publisher, OS_dispatch_queue>, CAFMedia>);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_11();
  dispatch thunk of CAFCarObservable.$media.getter();
  v5 = OUTLINED_FUNCTION_23(*v0);
  v6 = OUTLINED_FUNCTION_33(v5);
  OUTLINED_FUNCTION_19(v6);
  OUTLINED_FUNCTION_21();
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Published<CAFMedia?>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<CAFMedia?>.Publisher);
  OUTLINED_FUNCTION_26(lazy protocol witness table cache variable for type OS_dispatch_queue and conformance OS_dispatch_queue);
  OUTLINED_FUNCTION_3();
  outlined destroy of OS_dispatch_queue.SchedulerOptions?(v1);

  v7 = OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_27(v7, &lazy cache variable for type metadata for CAFMedia);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.ReceiveOn<Published<CAFMedia?>.Publisher, OS_dispatch_queue> and conformance Publishers.ReceiveOn<A, B>, &demangling cache variable for type metadata for Publishers.ReceiveOn<Published<CAFMedia?>.Publisher, OS_dispatch_queue>);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.CompactMap<Publishers.ReceiveOn<Published<CAFMedia?>.Publisher, OS_dispatch_queue>, CAFMedia> and conformance Publishers.CompactMap<A, B>, &demangling cache variable for type metadata for Publishers.CompactMap<Publishers.ReceiveOn<Published<CAFMedia?>.Publisher, OS_dispatch_queue>, CAFMedia>);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  OUTLINED_FUNCTION_9();
}

id closure #1 in CarPlayConnectionManager.setupCarMediaConnection(_:)@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  return closure #1 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)(a1, &demangling cache variable for type metadata for CAFMedia?, "#radio: received CAFMedia item from CAFCar %s", a2);
}

id closure #1 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)@<X0>(void **a1@<X0>, uint64_t *a2@<X1>, const char *a3@<X2>, _QWORD *a4@<X8>)
{
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;

  v7 = *a1;
  if (one-time initialization token for Log != -1)
    swift_once();
  v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)Log);
  v52 = v7;
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v49 = (uint64_t)a4;
    v11 = a3;
    v12 = (uint8_t *)OUTLINED_FUNCTION_32();
    v56 = OUTLINED_FUNCTION_32();
    *(_DWORD *)v12 = 136315138;
    __swift_instantiateConcreteTypeFromMangledName(a2);
    v13 = Optional.debugDescription.getter();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v56);
    v15 = UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_22(v15, v16, v17, v18, v19, v20, v21, v22, v49, v52);
    OUTLINED_FUNCTION_22(v23, v24, v25, v26, v27, v28, v29, v30, v50, v53);
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_218838000, v9, v10, v11, v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
  }

  OUTLINED_FUNCTION_22(v31, v32, v33, v34, v35, v36, v37, v38, v48, v52);
  OUTLINED_FUNCTION_22(v39, v40, v41, v42, v43, v44, v45, v46, v51, v54);
  *a4 = v7;
  return v55;
}

void closure #2 in CarPlayConnectionManager.setupCarMediaConnection(_:)(void **a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x219A1B148](v3);
  if (v4)
  {
    v5 = (void *)v4;
    if (one-time initialization token for Log != -1)
      swift_once();
    v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)Log);
    v7 = v2;
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v17 = v11;
      *(_DWORD *)v10 = 136315138;
      v12 = objc_msgSend(v7, sel_debugDescription);
      v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v15 = v14;

      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v15, &v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_218838000, v8, v9, "#radio: Initializing radio listner with CAFMedia: %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1B0DC](v11, -1, -1);
      MEMORY[0x219A1B0DC](v10, -1, -1);

    }
    else
    {

    }
    v16 = CarPlayConnectionManager.carRadioListener.getter();
    (*(void (**)(id))((*MEMORY[0x24BEE4EA0] & *v16) + 0x158))(v7);

  }
}

id CarPlayConnectionManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CarPlayConnectionManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void CarPlayConnectionManager.carManager(_:didUpdateCurrentCar:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  if (!a2)
  {
    v3 = v2;
    if (one-time initialization token for Log != -1)
      swift_once();
    v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)Log);
    v5 = Logger.logObject.getter();
    v6 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_32();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_218838000, v5, v6, "#radio Car disconnected — resetting connection and attempting to await updates", v7, 2u);
      OUTLINED_FUNCTION_17();
    }

    (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v3) + 0xF8))();
  }
}

id @nonobjc CAFCarManager.init(registrationFilePath:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  if (a2)
  {
    v3 = (void *)MEMORY[0x219A1A7A0]();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v2, sel_initWithRegistrationFilePath_, v3);

  return v4;
}

uint64_t specialized Set.init(_nonEmptyArrayLiteral:)(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
    goto LABEL_24;
  if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_25;
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<AnyCancellable>);
  v3 = static _SetStorage.allocate(capacity:)();
  if (v2)
  {
    while (1)
    {
      OUTLINED_FUNCTION_13();
      v2 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v2)
        break;
LABEL_5:
      v4 = 0;
      v5 = v3 + 56;
      v21 = v1;
      v22 = v1 & 0xC000000000000001;
      v19 = v1 & 0xFFFFFFFFFFFFFF8;
      v6 = (void (*)(uint64_t))MEMORY[0x24BDB9B60];
      v20 = v2;
      while (1)
      {
        if (v22)
        {
          v7 = MEMORY[0x219A1A998](v4, v21);
        }
        else
        {
          if (v4 >= *(_QWORD *)(v19 + 16))
            goto LABEL_23;
          v7 = swift_retain();
        }
        v8 = __OFADD__(v4++, 1);
        if (v8)
          break;
        v23 = v7;
        type metadata accessor for AnyCancellable();
        lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(lazy protocol witness table cache variable for type AnyCancellable and conformance AnyCancellable, v6);
        v9 = dispatch thunk of Hashable._rawHashValue(seed:)();
        v10 = -1 << *(_BYTE *)(v3 + 32);
        v1 = v9 & ~v10;
        v11 = v1 >> 6;
        v12 = *(_QWORD *)(v5 + 8 * (v1 >> 6));
        v13 = 1 << v1;
        if (((1 << v1) & v12) != 0)
        {
          v14 = ~v10;
          lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(lazy protocol witness table cache variable for type AnyCancellable and conformance AnyCancellable, v6);
          while ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) == 0)
          {
            v1 = (v1 + 1) & v14;
            v11 = v1 >> 6;
            v12 = *(_QWORD *)(v5 + 8 * (v1 >> 6));
            v13 = 1 << v1;
            if ((v12 & (1 << v1)) == 0)
            {
              v2 = v20;
              goto LABEL_16;
            }
          }
          swift_release();
          v2 = v20;
        }
        else
        {
LABEL_16:
          *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
          *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v1) = v23;
          v15 = *(_QWORD *)(v3 + 16);
          v8 = __OFADD__(v15, 1);
          v16 = v15 + 1;
          if (v8)
            goto LABEL_22;
          *(_QWORD *)(v3 + 16) = v16;
        }
        v6 = (void (*)(uint64_t))MEMORY[0x24BDB9B60];
        if (v4 == v2)
          goto LABEL_27;
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      OUTLINED_FUNCTION_13();
      v17 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v17)
        goto LABEL_3;
LABEL_25:
      v3 = MEMORY[0x24BEE4B08];
      if (!v2)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v2)
      goto LABEL_5;
  }
LABEL_27:
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t outlined destroy of OS_dispatch_queue.SchedulerOptions?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_dispatch_queue.SchedulerOptions?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21883CCD8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void partial apply for closure #2 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)(uint64_t a1)
{
  uint64_t v1;

  closure #2 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)(a1, v1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_21883CD1C()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_24();
  *v0 = OUTLINED_FUNCTION_29(v1);
  OUTLINED_FUNCTION_25();
}

void sub_21883CD4C()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_24();
  *v0 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & v1) + 0x90))();
  OUTLINED_FUNCTION_25();
}

void sub_21883CD84()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_24();
  *v0 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & v1) + 0xA8))();
  OUTLINED_FUNCTION_25();
}

uint64_t method lookup function for CarPlayConnectionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CarPlayConnectionManager.car_queue.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.carManager.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.carManagerObservable.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.__allocating_init(carManager:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.resetListeners()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.radioStore()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.registerUpdateHandler(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t type metadata accessor for OS_dispatch_queue(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void partial apply for closure #2 in CarPlayConnectionManager.setupCarMediaConnection(_:)(void **a1)
{
  uint64_t v1;

  closure #2 in CarPlayConnectionManager.setupCarMediaConnection(_:)(a1, v1);
}

void lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_12();
  }
  OUTLINED_FUNCTION_25();
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_21883CF18()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ()(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t outlined bridged method (mbbnb) of @objc NSBundle.path(forResource:ofType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v8 = (void *)MEMORY[0x219A1A7A0]();
  swift_bridgeObjectRelease();
  v9 = (void *)MEMORY[0x219A1A7A0](a3, a4);
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(a5, sel_pathForResource_ofType_, v8, v9);

  if (!v10)
    return 0;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v11;
}

void lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_12();
  }
  OUTLINED_FUNCTION_25();
}

id OUTLINED_FUNCTION_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_7(id a1)
{

}

uint64_t OUTLINED_FUNCTION_8()
{
  return Publisher.compactMap<A>(_:)();
}

uint64_t OUTLINED_FUNCTION_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 112) + 8))(v1, v0);
}

void OUTLINED_FUNCTION_12()
{
  JUMPOUT(0x219A1B070);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 128) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_unknownObjectWeakInit();
}

void OUTLINED_FUNCTION_17()
{
  JUMPOUT(0x219A1B0DCLL);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t OUTLINED_FUNCTION_19(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_21()
{
  unint64_t *v0;

  return type metadata accessor for OS_dispatch_queue(0, v0);
}

void OUTLINED_FUNCTION_22(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

}

uint64_t OUTLINED_FUNCTION_23@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x78))();
}

void OUTLINED_FUNCTION_26(_QWORD *a1)
{
  unint64_t *v1;

  lazy protocol witness table accessor for type CAFCar and conformance CAFCar(a1, v1);
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1, unint64_t *a2)
{
  return type metadata accessor for OS_dispatch_queue(0, a2);
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_29@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x78))();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_33(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

Swift::String __swiftcall CAFMediaSourceSemanticType.stringValue()()
{
  char v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unsigned int *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  Swift::String result;
  uint64_t v17;

  v1 = v0;
  v2 = type metadata accessor for UsoEntity_common_RadioBand.DefinedValues();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(v1)
  {
    case 1:
      v6 = (unsigned int *)MEMORY[0x24BEA0A60];
      goto LABEL_6;
    case 2:
      v6 = (unsigned int *)MEMORY[0x24BEA0A68];
      goto LABEL_6;
    case 3:
      v6 = (unsigned int *)MEMORY[0x24BEA0A70];
      goto LABEL_6;
    case 6:
    case 8:
      v6 = (unsigned int *)MEMORY[0x24BEA0A78];
LABEL_6:
      (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *v6, v2);
      v7 = UsoEntity_common_RadioBand.DefinedValues.rawValue.getter();
      v9 = v8;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      break;
    default:
      if (one-time initialization token for Log != -1)
        swift_once();
      v12 = type metadata accessor for Logger();
      __swift_project_value_buffer(v12, (uint64_t)Log);
      v13 = Logger.logObject.getter();
      v14 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_218838000, v13, v14, "#radio: Received unsupported semantic type", v15, 2u);
        MEMORY[0x219A1B0DC](v15, -1, -1);
      }

      v7 = 0;
      v9 = 0xE000000000000000;
      break;
  }
  v10 = v7;
  v11 = (void *)v9;
  result._object = v11;
  result._countAndFlagsBits = v10;
  return result;
}

id CAFMediaItem.siriFormattedStringFrequency(semanticType:)(unsigned __int8 a1)
{
  void *v1;
  int v2;
  id result;
  float v4;

  v2 = a1;
  result = objc_msgSend(v1, sel_frequency);
  if (v2 != 2)
    return (id)dispatch thunk of CustomStringConvertible.description.getter();
  v4 = (float)result / 1000.0;
  if (roundf(v4) != v4)
    return (id)Float.description.getter();
  if ((~LODWORD(v4) & 0x7F800000) != 0)
  {
    if (v4 > -9.2234e18)
    {
      if (v4 < 9.2234e18)
        return (id)dispatch thunk of CustomStringConvertible.description.getter();
      goto LABEL_10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

void RadioListener.__allocating_init(serialQueue:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  RadioListener.init(serialQueue:)(a1);
  OUTLINED_FUNCTION_25();
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = (id)MEMORY[0x219A1A7A0]();
  (*(void (**)(uint64_t, id))(a3 + 16))(a3, v4);

}

uint64_t RadioListener.mediaSourceObservers.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR___RadioListener_mediaSourceObservers) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t RadioListener.radioStationSourcesByType.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___RadioListener_radioStationSourcesByType);
  OUTLINED_FUNCTION_4();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t RadioListener.updateHandler.getter()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_3_0();
  v1 = *v0;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(*v0);
  return v1;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed String) -> ()(uint64_t a1)
{
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

void RadioListener.updateHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR___RadioListener_updateHandler);
  OUTLINED_FUNCTION_4();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  outlined consume of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(v6);
  OUTLINED_FUNCTION_22_0();
}

uint64_t key path getter for RadioListener.updateHandler : RadioListener@<X0>(_QWORD **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *);

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x120))();
  if (result)
  {
    v5 = result;
    v6 = v4;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v5;
    *(_QWORD *)(result + 24) = v6;
    v7 = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed String) -> ();
  }
  else
  {
    v7 = 0;
  }
  *a2 = v7;
  a2[1] = result;
  return result;
}

uint64_t key path setter for RadioListener.updateHandler : RadioListener(uint64_t *a1, _QWORD **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t (*v7)(_QWORD, uint64_t);

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed String) -> (@out ());
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(uint64_t (**)(_QWORD, uint64_t))((*MEMORY[0x24BEE4EA0] & **a2) + 0x128);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(v3);
  return v7(v6, v5);
}

void RadioListener.updateHandler.modify()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_25();
}

uint64_t RadioListener.appId.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

id RadioListener.init(serialQueue:)(void *a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  objc_super v9;

  *(_QWORD *)&v1[OBJC_IVAR___RadioListener_mediaSourceObservers] = 0;
  v3 = v1;
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter())
    v4 = specialized Set.init(_nonEmptyArrayLiteral:)(MEMORY[0x24BEE4AF8]);
  else
    v4 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v3[OBJC_IVAR___RadioListener_cancellables] = v4;
  *(_QWORD *)&v3[OBJC_IVAR___RadioListener_allowedMediaSources] = &outlined read-only object #0 of RadioListener.init(serialQueue:);
  v5 = OBJC_IVAR___RadioListener_radioStationSourcesByType;
  OUTLINED_FUNCTION_29_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Set<KVItem>);
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType, (void (*)(uint64_t))type metadata accessor for CAFMediaSourceSemanticType);
  *(_QWORD *)&v3[v5] = Dictionary.init(dictionaryLiteral:)();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[OBJC_IVAR___RadioListener_maxStationListSize] = 1500;
  v6 = &v3[OBJC_IVAR___RadioListener_updateHandler];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  swift_unknownObjectUnownedInit();

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for RadioListener();
  v7 = objc_msgSendSuper2(&v9, sel_init);

  return v7;
}

uint64_t outlined copy of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t type metadata accessor for RadioListener()
{
  return objc_opt_self();
}

void RadioListener.__deallocating_deinit()
{
  char *v0;
  void *v1;
  void *v2;
  objc_super v3;

  v1 = (void *)MEMORY[0x219A1B148](&v0[OBJC_IVAR___RadioListener_media]);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_unregisterObserver_, v0);

  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for RadioListener();
  objc_msgSendSuper2(&v3, sel_dealloc);
  OUTLINED_FUNCTION_36();
}

Swift::Void __swiftcall RadioListener.clearDonatedStations()()
{
  NSObject *v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;

  if (one-time initialization token for Log != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_15_0(v1, (uint64_t)Log);
  v2 = OUTLINED_FUNCTION_17_0();
  if (os_log_type_enabled(v0, v2))
  {
    v3 = (uint8_t *)OUTLINED_FUNCTION_32();
    *(_WORD *)v3 = 0;
    OUTLINED_FUNCTION_37(&dword_218838000, v0, v2, "#radio: Clearing all donated radio stations.", v3);
    OUTLINED_FUNCTION_17();
  }

  OUTLINED_FUNCTION_29_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Set<KVItem>);
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType, (void (*)(uint64_t))type metadata accessor for CAFMediaSourceSemanticType);
  v4 = Dictionary.init(dictionaryLiteral:)();
  RadioListener.radioStationSourcesByType.setter(v4);
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)v0->isa) + 0x198))();
}

Swift::Void __swiftcall RadioListener.teardownPublisherSubscriptions()()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x219A1B148](v0 + OBJC_IVAR___RadioListener_media);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_unregisterObserver_, v0);

  }
  RadioListener.mediaSourceObservers.setter(0);
  OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_34();
  specialized Sequence.forEach(_:)(v3);
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_22_0();
}

uint64_t specialized Sequence.forEach(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  int64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for AnyCancellable();
    lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(lazy protocol witness table cache variable for type AnyCancellable and conformance AnyCancellable, (void (*)(uint64_t))MEMORY[0x24BDB9B60]);
    result = Set.Iterator.init(_cocoa:)();
    v1 = v18;
    v17 = v19;
    v3 = v20;
    v4 = v21;
    v5 = v22;
  }
  else
  {
    v6 = -1 << *(_BYTE *)(a1 + 32);
    v17 = a1 + 56;
    v3 = ~v6;
    v7 = -v6;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v5 = v8 & *(_QWORD *)(a1 + 56);
    result = swift_bridgeObjectRetain();
    v4 = 0;
  }
  v9 = (unint64_t)(v3 + 64) >> 6;
  if (v1 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v5)
    {
      v10 = (v5 - 1) & v5;
      v11 = __clz(__rbit64(v5)) | (v4 << 6);
      v12 = v4;
      goto LABEL_29;
    }
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
      break;
    if (v13 >= v9)
      return outlined consume of Set<KVItem>.Iterator._Variant();
    v14 = *(_QWORD *)(v17 + 8 * v13);
    v12 = v4 + 1;
    if (!v14)
    {
      v12 = v4 + 2;
      if (v4 + 2 >= v9)
        return outlined consume of Set<KVItem>.Iterator._Variant();
      v14 = *(_QWORD *)(v17 + 8 * v12);
      if (!v14)
      {
        v12 = v4 + 3;
        if (v4 + 3 >= v9)
          return outlined consume of Set<KVItem>.Iterator._Variant();
        v14 = *(_QWORD *)(v17 + 8 * v12);
        if (!v14)
        {
          v12 = v4 + 4;
          if (v4 + 4 >= v9)
            return outlined consume of Set<KVItem>.Iterator._Variant();
          v14 = *(_QWORD *)(v17 + 8 * v12);
          if (!v14)
          {
            v12 = v4 + 5;
            if (v4 + 5 >= v9)
              return outlined consume of Set<KVItem>.Iterator._Variant();
            v14 = *(_QWORD *)(v17 + 8 * v12);
            if (!v14)
            {
              v15 = v4 + 6;
              while (v15 < v9)
              {
                v14 = *(_QWORD *)(v17 + 8 * v15++);
                if (v14)
                {
                  v12 = v15 - 1;
                  goto LABEL_28;
                }
              }
              return outlined consume of Set<KVItem>.Iterator._Variant();
            }
          }
        }
      }
    }
LABEL_28:
    v10 = (v14 - 1) & v14;
    v11 = __clz(__rbit64(v14)) + (v12 << 6);
LABEL_29:
    v16 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v11);
    swift_retain();
    if (!v16)
      return outlined consume of Set<KVItem>.Iterator._Variant();
    while (1)
    {
      AnyCancellable.cancel()();
      result = swift_release();
      v4 = v12;
      v5 = v10;
      if ((v1 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      if (__CocoaSet.Iterator.next()())
      {
        type metadata accessor for AnyCancellable();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();
        v12 = v4;
        v10 = v5;
        if (v23)
          continue;
      }
      return outlined consume of Set<KVItem>.Iterator._Variant();
    }
  }
  __break(1u);
  return result;
}

void RadioListener.mediaConnectionEstablished(_:)(NSObject *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  id v9;

  v2 = v1;
  v4 = v2 + OBJC_IVAR___RadioListener_media;
  swift_unknownObjectWeakAssign();
  if (-[NSObject receivedAllValues](a1, sel_receivedAllValues))
  {
    RadioListener.observeMediaSources(from:)(a1);
  }
  else
  {
    if (one-time initialization token for Log != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_15_0(v5, (uint64_t)Log);
    v6 = OUTLINED_FUNCTION_17_0();
    if (os_log_type_enabled(a1, v6))
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_32();
      *(_WORD *)v7 = 0;
      OUTLINED_FUNCTION_37(&dword_218838000, a1, v6, "#radio: Media received but waiting for receivedAllValues", v7);
      OUTLINED_FUNCTION_17();
    }

    v8 = (void *)MEMORY[0x219A1B148](v4);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, sel_registerObserver_, v2);

    }
  }
}

uint64_t RadioListener.registerUpdateHandler(_:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v19;

  swift_getObjectType();
  if (one-time initialization token for Log != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_4_0();
  __swift_project_value_buffer(v5, (uint64_t)Log);
  v6 = v2;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.info.getter();
  v9 = os_log_type_enabled(v7, v8);
  v10 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (v9)
  {
    v11 = OUTLINED_FUNCTION_32();
    v19 = OUTLINED_FUNCTION_32();
    *(_DWORD *)v11 = 136315394;
    v12 = _typeName(_:qualified:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v14 = swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    v15 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v6) + 0x138))(v14);
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_218838000, v7, v8, "#radio: %s listening for %s updates.", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
  }

  v17 = *(uint64_t (**)(uint64_t, uint64_t))((*v10 & *v6) + 0x128);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(a1);
  return v17(a1, a2);
}

uint64_t RadioListener.radioStations()()
{
  uint64_t *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_3_0();
  v3 = specialized Dictionary.subscript.getter(6u, *v0);
  if (v3)
  {
    OUTLINED_FUNCTION_16_0(v3);
    OUTLINED_FUNCTION_9_0();
  }
  v4 = specialized Dictionary.subscript.getter(8u, *v0);
  if (v4)
  {
    OUTLINED_FUNCTION_16_0(v4);
    OUTLINED_FUNCTION_9_0();
  }
  v5 = specialized Dictionary.subscript.getter(2u, *v0);
  if (v5)
  {
    OUTLINED_FUNCTION_16_0(v5);
    OUTLINED_FUNCTION_9_0();
  }
  v6 = specialized Dictionary.subscript.getter(1u, *v0);
  if (v6)
  {
    OUTLINED_FUNCTION_16_0(v6);
    OUTLINED_FUNCTION_9_0();
  }
  v7 = specialized Dictionary.subscript.getter(3u, *v0);
  if (v7)
  {
    OUTLINED_FUNCTION_16_0(v7);
    OUTLINED_FUNCTION_9_0();
  }
  if (one-time initialization token for Log != -1)
    swift_once();
  v8 = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_15_0(v8, (uint64_t)Log);
  v9 = OUTLINED_FUNCTION_17_0();
  if (OUTLINED_FUNCTION_24_0(v9))
  {
    v10 = OUTLINED_FUNCTION_32();
    *(_DWORD *)v10 = 134219008;
    OUTLINED_FUNCTION_8_0();
    *(_WORD *)(v10 + 12) = 2048;
    OUTLINED_FUNCTION_8_0();
    *(_WORD *)(v10 + 22) = 2048;
    OUTLINED_FUNCTION_8_0();
    *(_WORD *)(v10 + 32) = 2048;
    OUTLINED_FUNCTION_8_0();
    *(_WORD *)(v10 + 42) = 2048;
    OUTLINED_FUNCTION_8_0();
    _os_log_impl(&dword_218838000, v1, v2, "#radio Donating Radio KVItems — \n\tDAB: %ld\n\tFMDAB: %ld\n\tFM: %ld\n\tAM: %ld\n\tSiriusXM: %ld", (uint8_t *)v10, 0x34u);
    OUTLINED_FUNCTION_17();
  }

  v11 = OUTLINED_FUNCTION_34();
  v12 = Dictionary<>.allValues.getter(v11);
  OUTLINED_FUNCTION_39();
  return v12;
}

uint64_t specialized Dictionary.subscript.getter(Swift::UInt8 a1, uint64_t a2)
{
  char v2;

  if (*(_QWORD *)(a2 + 16) && (specialized __RawDictionaryStorage.find<A>(_:)(a1), (v2 & 1) != 0))
    return swift_bridgeObjectRetain();
  else
    return 0;
}

uint64_t specialized Set.count.getter(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
    return __CocoaSet.count.getter();
  else
    return *(_QWORD *)(a1 + 16);
}

uint64_t Dictionary<>.allValues.getter(uint64_t a1)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t result;
  int64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];

  v11 = MEMORY[0x24BEE4AF8];
  specialized _NativeDictionary.makeIterator()(a1, v12);
  v1 = v12[1];
  v2 = v12[3];
  v3 = v12[4];
  v4 = (unint64_t)(v12[2] + 64) >> 6;
  result = OUTLINED_FUNCTION_32_0();
  if (!v3)
    goto LABEL_3;
LABEL_2:
  v3 &= v3 - 1;
  while (1)
  {
    v10 = swift_bridgeObjectRetain();
    result = specialized Array.append<A>(contentsOf:)(v10);
    if (v3)
      goto LABEL_2;
LABEL_3:
    v6 = v2 + 1;
    if (__OFADD__(v2, 1))
      break;
    if (v6 >= v4)
      goto LABEL_23;
    v7 = *(_QWORD *)(v1 + 8 * v6);
    v8 = v2 + 1;
    if (!v7)
    {
      v8 = v2 + 2;
      if (v2 + 2 >= v4)
        goto LABEL_23;
      v7 = *(_QWORD *)(v1 + 8 * v8);
      if (!v7)
      {
        v8 = v2 + 3;
        if (v2 + 3 >= v4)
          goto LABEL_23;
        v7 = *(_QWORD *)(v1 + 8 * v8);
        if (!v7)
        {
          v8 = v2 + 4;
          if (v2 + 4 >= v4)
            goto LABEL_23;
          v7 = *(_QWORD *)(v1 + 8 * v8);
          if (!v7)
          {
            v8 = v2 + 5;
            if (v2 + 5 >= v4)
              goto LABEL_23;
            v7 = *(_QWORD *)(v1 + 8 * v8);
            if (!v7)
            {
              v8 = v2 + 6;
              if (v2 + 6 >= v4)
                goto LABEL_23;
              v7 = *(_QWORD *)(v1 + 8 * v8);
              if (!v7)
              {
                v9 = v2 + 7;
                while (v9 < v4)
                {
                  v7 = *(_QWORD *)(v1 + 8 * v9++);
                  if (v7)
                  {
                    v8 = v9 - 1;
                    goto LABEL_20;
                  }
                }
LABEL_23:
                OUTLINED_FUNCTION_39();
                swift_release();
                return v11;
              }
            }
          }
        }
      }
    }
LABEL_20:
    v3 = (v7 - 1) & v7;
    v2 = v8;
  }
  __break(1u);
  return result;
}

void RadioListener.observeMediaSources(from:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  os_log_type_t v26;
  uint8_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
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
  NSObject *v59;
  unint64_t v60;
  void *Strong;
  uint64_t v62;
  _BYTE v63[16];

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_dispatch_queue.SchedulerOptions?);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_0();
  v58 = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>);
  v56 = *(_QWORD *)(v6 - 8);
  v57 = v6;
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2_0();
  v55 = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>);
  v53 = *(_QWORD *)(v9 - 8);
  v54 = v9;
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_2_0();
  v52 = v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.Filter<Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>>);
  v50 = *(_QWORD *)(v12 - 8);
  v51 = v12;
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_2_0();
  v49 = v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.Map<Publishers.Filter<Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>>, (CAFMediaSourceSemanticType, [KVItem])>);
  v47 = *(_QWORD *)(v15 - 8);
  v48 = v15;
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_2_0();
  v46 = v17;
  v18 = outlined bridged method (pb) of @objc CAFMedia.mediaSources.getter(a1);
  if (!v18)
  {
    if (one-time initialization token for Log == -1)
    {
LABEL_12:
      v25 = OUTLINED_FUNCTION_4_0();
      v59 = OUTLINED_FUNCTION_15_0(v25, (uint64_t)Log);
      v26 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v59, v26))
      {
        v27 = (uint8_t *)OUTLINED_FUNCTION_32();
        *(_WORD *)v27 = 0;
        OUTLINED_FUNCTION_37(&dword_218838000, v59, v26, "#radio Error: CAFMedia has no media sources.", v27);
        OUTLINED_FUNCTION_17();
      }

      return;
    }
LABEL_32:
    swift_once();
    goto LABEL_12;
  }
  v19 = v18;
  if (!(v18 >> 62))
  {
    v20 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v20)
      goto LABEL_4;
LABEL_16:
    OUTLINED_FUNCTION_23_0();
    v24 = MEMORY[0x24BEE4AF8];
    goto LABEL_17;
  }
  v20 = _CocoaArrayWrapper.endIndex.getter();
  if (!v20)
    goto LABEL_16;
LABEL_4:
  v62 = MEMORY[0x24BEE4AF8];
  specialized ContiguousArray.reserveCapacity(_:)();
  if (v20 < 0)
  {
    __break(1u);
    goto LABEL_32;
  }
  v21 = 0;
  do
  {
    if ((v19 & 0xC000000000000001) != 0)
      v22 = (id)MEMORY[0x219A1A998](v21, v19);
    else
      v22 = *(id *)(v19 + 8 * v21 + 32);
    v23 = v22;
    ++v21;
    type metadata accessor for KVItem(0, &lazy cache variable for type metadata for CAFMediaSource);
    lazy protocol witness table accessor for type OS_dispatch_queue and conformance OS_dispatch_queue(&lazy protocol witness table cache variable for type CAFMediaSource and conformance CAFMediaSource, &lazy cache variable for type metadata for CAFMediaSource);
    CAFObserved<>.observable.getter();

    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
  }
  while (v20 != v21);
  v24 = v62;
  OUTLINED_FUNCTION_23_0();
LABEL_17:
  RadioListener.mediaSourceObservers.setter(v24);
  v28 = *(_QWORD *)(v2 + OBJC_IVAR___RadioListener_mediaSourceObservers);
  if (!v28)
  {
LABEL_30:
    OUTLINED_FUNCTION_9();
    return;
  }
  swift_unknownObjectWeakInit();
  if (v28 >> 62)
  {
    OUTLINED_FUNCTION_32_0();
    v29 = _CocoaArrayWrapper.endIndex.getter();
    if (v29)
      goto LABEL_20;
LABEL_29:
    swift_bridgeObjectRelease_n();
    swift_unknownObjectWeakDestroy();
    goto LABEL_30;
  }
  v29 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_32_0();
  if (!v29)
    goto LABEL_29;
LABEL_20:
  if (v29 >= 1)
  {
    v60 = v28 & 0xC000000000000001;
    OUTLINED_FUNCTION_4();
    v30 = 0;
    v45 = v28;
    v44 = v29;
    do
    {
      if (v60)
        v31 = (id)MEMORY[0x219A1A998](v30, v28);
      else
        v31 = *(id *)(v28 + 8 * v30 + 32);
      v32 = v31;
      v33 = MEMORY[0x219A1B148](v63);
      if (v33)
      {
        v34 = (void *)v33;
        dispatch thunk of CAFMediaSourceObservable.$mediaItems.getter();
        Strong = (void *)swift_unknownObjectUnownedLoadStrong();
        v35 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
        __swift_storeEnumTagSinglePayload(v58, 1, 1, v35);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AnyPublisher<CAFMediaItems?, Never>);
        type metadata accessor for KVItem(0, &lazy cache variable for type metadata for OS_dispatch_queue);
        lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](lazy protocol witness table cache variable for type AnyPublisher<CAFMediaItems?, Never> and conformance AnyPublisher<A, B>, (uint64_t *)&demangling cache variable for type metadata for AnyPublisher<CAFMediaItems?, Never>);
        lazy protocol witness table accessor for type OS_dispatch_queue and conformance OS_dispatch_queue(lazy protocol witness table cache variable for type OS_dispatch_queue and conformance OS_dispatch_queue, &lazy cache variable for type metadata for OS_dispatch_queue);
        Publisher.receive<A>(on:options:)();
        outlined destroy of OS_dispatch_queue.SchedulerOptions?(v58);

        swift_release();
        *(_QWORD *)(OUTLINED_FUNCTION_30() + 16) = v32;
        v36 = v32;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAFMediaSourceSemanticType, CAFMediaItems));
        lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue> and conformance Publishers.ReceiveOn<A, B>, &demangling cache variable for type metadata for Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>);
        Publisher.compactMap<A>(_:)();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
        v37 = OUTLINED_FUNCTION_30();
        *(_QWORD *)(v37 + 16) = v34;
        v38 = OUTLINED_FUNCTION_40();
        *(_QWORD *)(v38 + 16) = partial apply for closure #2 in closure #2 in RadioListener.observeMediaSources(from:);
        *(_QWORD *)(v38 + 24) = v37;
        lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)> and conformance Publishers.CompactMap<A, B>, &demangling cache variable for type metadata for Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>);
        v39 = v34;
        Publisher.filter(_:)();
        OUTLINED_FUNCTION_35();
        (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v54);
        v40 = OUTLINED_FUNCTION_30();
        *(_QWORD *)(v40 + 16) = v39;
        v41 = OUTLINED_FUNCTION_40();
        *(_QWORD *)(v41 + 16) = partial apply for closure #3 in closure #2 in RadioListener.observeMediaSources(from:);
        *(_QWORD *)(v41 + 24) = v40;
        v42 = v39;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAFMediaSourceSemanticType, [KVItem]));
        lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.Filter<Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>> and conformance Publishers.Filter<A>, &demangling cache variable for type metadata for Publishers.Filter<Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>>);
        Publisher.map<A>(_:)();
        OUTLINED_FUNCTION_35();
        (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v51);
        *(_QWORD *)(OUTLINED_FUNCTION_30() + 16) = v42;
        lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.Map<Publishers.Filter<Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>>, (CAFMediaSourceSemanticType, [KVItem])> and conformance Publishers.Map<A, B>, &demangling cache variable for type metadata for Publishers.Map<Publishers.Filter<Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>>, (CAFMediaSourceSemanticType, [KVItem])>);
        v43 = v42;
        Publisher<>.sink(receiveValue:)();
        OUTLINED_FUNCTION_35();
        (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v48);
        OUTLINED_FUNCTION_4();
        AnyCancellable.store(in:)();
        swift_endAccess();

        v29 = v44;
        v28 = v45;
        swift_release();
      }
      else
      {

      }
      ++v30;
    }
    while (v29 != v30);
    goto LABEL_29;
  }
  __break(1u);
}

uint64_t closure #1 in closure #2 in RadioListener.observeMediaSources(from:)@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  char v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  Swift::String v17;
  uint64_t v18;
  id v19;
  uint64_t result;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v3 = *a1;
  v4 = dispatch thunk of CAFMediaSourceObservable.mediaSourceSemanticType.getter();
  if (one-time initialization token for Log != -1)
    swift_once();
  v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)Log);
  v6 = v3;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v21 = a2;
    v9 = v4;
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v22 = v11;
    *(_DWORD *)v10 = 136315394;
    if (v3)
    {
      v12 = objc_msgSend(v6, sel_mediaItems);
      type metadata accessor for KVItem(0, &lazy cache variable for type metadata for CAFMediaItem);
      v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v13 >> 62)
      {
        swift_bridgeObjectRetain();
        v14 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v14 = 0;
    }
    v23 = v14;
    LOBYTE(v24) = v3 == 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int?);
    v15 = String.init<A>(describing:)();
    v23 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    v17 = CAFMediaSourceSemanticType.stringValue()();
    v23 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17._countAndFlagsBits, (unint64_t)v17._object, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_218838000, v7, v8, "#radio CarPlay has %s mediaItems of semanticType: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A1B0DC](v11, -1, -1);
    v18 = v10;
    v4 = v9;
    MEMORY[0x219A1B0DC](v18, -1, -1);

    a2 = v21;
  }
  else
  {

  }
  LOBYTE(v23) = v4;
  v24 = v3;
  v19 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAFMediaSourceSemanticType, CAFMediaItems?));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAFMediaSourceSemanticType, CAFMediaItems));
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

BOOL closure #2 in closure #2 in RadioListener.observeMediaSources(from:)(_BOOL8 a1, void *a2, uint64_t a3)
{
  BOOL v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  Swift::String v13;
  uint64_t v15;

  v4 = specialized Sequence<>.contains(_:)(a1, *(_QWORD *)(a3 + OBJC_IVAR___RadioListener_allowedMediaSources));
  if (one-time initialization token for Log != -1)
    swift_once();
  v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)Log);
  v6 = a2;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v15 = v10;
    *(_DWORD *)v9 = 134218242;
    v11 = objc_msgSend(v6, sel_mediaItems);
    type metadata accessor for KVItem(0, &lazy cache variable for type metadata for CAFMediaItem);
    v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v12 >> 62)
    {
      swift_bridgeObjectRetain();
      _CocoaArrayWrapper.endIndex.getter();

      swift_bridgeObjectRelease();
    }
    else
    {

    }
    swift_bridgeObjectRelease();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    *(_WORD *)(v9 + 12) = 2080;
    v13 = CAFMediaSourceSemanticType.stringValue()();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13._countAndFlagsBits, (unint64_t)v13._object, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_218838000, v7, v8, "#radio: Received %ld mediaItems for semanticType: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A1B0DC](v10, -1, -1);
    MEMORY[0x219A1B0DC](v9, -1, -1);

  }
  else
  {

  }
  return v4;
}

BOOL specialized Sequence<>.contains(_:)(_BOOL8 result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t i;
  uint64_t v5;
  int v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = result;
  if (*(_BYTE *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 33; ; ++i)
  {
    v5 = i - 31;
    if (__OFADD__(i - 32, 1))
      break;
    v6 = *(unsigned __int8 *)(a2 + i);
    result = v6 == v3;
    if (v6 == v3 || v5 == v2)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t closure #3 in closure #2 in RadioListener.observeMediaSources(from:)(uint64_t a1, id a2, void *a3)
{
  id v5;
  unint64_t v6;

  v5 = objc_msgSend(a2, sel_mediaItems);
  type metadata accessor for KVItem(0, &lazy cache variable for type metadata for CAFMediaItem);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  specialized Sequence.compactMap<A>(_:)(v6, a3, a1);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t closure #4 in closure #2 in RadioListener.observeMediaSources(from:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = RadioListener.saveItemsBy(semanticType:items:)(*(_BYTE *)a1, *(_QWORD *)(a1 + 8));
  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *a2) + 0x198))(v3);
}

uint64_t specialized Sequence.compactMap<A>(_:)(unint64_t a1, void *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v14;

  v14 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_15;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = _CocoaArrayWrapper.endIndex.getter())
  {
    v6 = 4;
    while (1)
    {
      v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x219A1A998](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v10 = RadioListener.itemFrom(semanticType:mediaItem:)(a3, v7);

      if (v10)
      {
        MEMORY[0x219A1A7DC]();
        if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      ++v6;
      if (v9 == v5)
      {
        swift_bridgeObjectRelease();
        v11 = v14;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  v11 = MEMORY[0x24BEE4AF8];
LABEL_17:

  return v11;
}

id RadioListener.itemFrom(semanticType:mediaItem:)(int a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  SEL v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  SEL v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  SEL v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  id v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  id v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90[2];

  v90[1] = *(void **)MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE5E8E8]), sel_init);
  v5 = RadioListener.itemIdFrom(semanticType:mediaItem:)(a1, a2);
  v6 = (void *)MEMORY[0x219A1A7A0](v5);
  OUTLINED_FUNCTION_6_0();
  v90[0] = 0;
  v7 = objc_msgSend(v4, sel_setItemType_itemId_error_, 9, v6, v90);

  if (v7)
  {
    v8 = v90[0];

    v10 = OUTLINED_FUNCTION_41(v9, (SEL *)&selRef_mediaItemName);
    if (v11)
    {
      v12 = (void *)MEMORY[0x219A1A7A0](v10);
      OUTLINED_FUNCTION_11_0();
    }
    else
    {
      v12 = 0;
    }
    v90[0] = 0;
    v14 = (void *)OUTLINED_FUNCTION_21_0();
    v16 = objc_msgSend(v14, v15, 351, v12);

    v17 = v90[0];
    if (v16)
    {
      v18 = v90[0];

      CAFMediaSourceSemanticType.stringValue()();
      OUTLINED_FUNCTION_30_0();
      v23 = OUTLINED_FUNCTION_20_0(355, v19, v20, v21, v22);
      v31 = OUTLINED_FUNCTION_28_0((uint64_t)v23, v24, v25, v26, v27, v28, v29, v30, v82, v84, v86, v88, v90[0]);
      if (!v23)
        goto LABEL_28;

      v33 = OUTLINED_FUNCTION_41(v32, (SEL *)&selRef_mediaItemShortName);
      if (v34)
      {
        v35 = (void *)MEMORY[0x219A1A7A0](v33);
        OUTLINED_FUNCTION_11_0();
      }
      else
      {
        v35 = 0;
      }
      v90[0] = 0;
      v36 = (void *)OUTLINED_FUNCTION_21_0();
      v38 = objc_msgSend(v36, v37, 352, v35);

      v17 = v90[0];
      if (v38)
      {
        v39 = v90[0];

        if (a1 == 8 || a1 == 6)
        {
          v42 = OUTLINED_FUNCTION_41(v40, (SEL *)&selRef_identifier);
          if (v43)
          {
            v44 = (void *)MEMORY[0x219A1A7A0](v42);
            OUTLINED_FUNCTION_6_0();
          }
          else
          {
            v44 = 0;
          }
          v90[0] = 0;
          v59 = (void *)OUTLINED_FUNCTION_21_0();
          v50 = objc_msgSend(v59, v60, 354, v44);

          if (!v50)
          {
            v81 = v90[0];
            v45 = (void *)_convertNSErrorToError(_:)();

            goto LABEL_29;
          }
          v61 = v90[0];
        }
        else
        {
          CAFMediaItem.siriFormattedStringFrequency(semanticType:)(a1);
          OUTLINED_FUNCTION_30_0();
          v50 = OUTLINED_FUNCTION_20_0(353, v46, v47, v48, v49);
          v58 = OUTLINED_FUNCTION_28_0((uint64_t)v50, v51, v52, v53, v54, v55, v56, v57, v83, v85, v87, v89, v90[0]);
          if (!v50)
          {
            v13 = v58;
            goto LABEL_20;
          }
        }

        v90[0] = 0;
        v62 = objc_msgSend(v4, sel_buildItemWithError_, v90);
        v31 = OUTLINED_FUNCTION_28_0((uint64_t)v62, v63, v64, v65, v66, v67, v68, v69, v83, v85, v87, v89, v90[0]);
        if (v62)
        {

          return v62;
        }
LABEL_28:
        v70 = v31;
        v45 = (void *)_convertNSErrorToError(_:)();

        goto LABEL_29;
      }
    }
    v13 = v17;
  }
  else
  {
    v13 = v90[0];
  }
LABEL_20:
  v45 = (void *)_convertNSErrorToError(_:)();

LABEL_29:
  swift_willThrow();

  if (one-time initialization token for Log != -1)
    swift_once();
  v71 = OUTLINED_FUNCTION_4_0();
  __swift_project_value_buffer(v71, (uint64_t)Log);
  v72 = a2;
  v73 = Logger.logObject.getter();
  v74 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v73, v74))
  {
    v75 = (uint8_t *)OUTLINED_FUNCTION_32();
    v90[0] = (void *)OUTLINED_FUNCTION_32();
    *(_DWORD *)v75 = 136315138;
    v76 = objc_msgSend(v72, sel_debugDescription);
    v77 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v79 = v78;

    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v77, v79, (uint64_t *)v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    OUTLINED_FUNCTION_6_0();
    _os_log_impl(&dword_218838000, v73, v74, "#radio: Could not create KVItem from mediaItem: %s", v75, 0xCu);
    OUTLINED_FUNCTION_26_0();
    OUTLINED_FUNCTION_17();
  }

  return 0;
}

uint64_t RadioListener.itemIdFrom(semanticType:mediaItem:)(int a1, id a2)
{
  uint64_t v3;
  Swift::String v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  Swift::String v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  Swift::String v14;

  objc_msgSend(a2, sel_frequency);
  v3 = dispatch thunk of CustomStringConvertible.description.getter();
  v4 = CAFMediaSourceSemanticType.stringValue()();
  OUTLINED_FUNCTION_12_0();
  String.append(_:)(v4);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_11_0();
  v5 = outlined bridged method (pb) of @objc CAFMediaItem.mediaItemName.getter(a2, (SEL *)&selRef_mediaItemName);
  if (v6)
    v7 = v5;
  else
    v7 = 0;
  if (v6)
    v8 = v6;
  else
    v8 = (void *)0xE000000000000000;
  OUTLINED_FUNCTION_33_0();
  v9._countAndFlagsBits = v7;
  v9._object = v8;
  String.append(_:)(v9);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_23_0();
  v10 = outlined bridged method (pb) of @objc CAFMediaItem.mediaItemName.getter(a2, (SEL *)&selRef_mediaItemShortName);
  if (v11)
    v12 = v10;
  else
    v12 = 0;
  if (v11)
    v13 = v11;
  else
    v13 = (void *)0xE000000000000000;
  OUTLINED_FUNCTION_33_0();
  v14._countAndFlagsBits = v12;
  v14._object = v13;
  String.append(_:)(v14);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_23_0();
  return v3;
}

uint64_t RadioListener.saveItemsBy(semanticType:items:)(Swift::UInt8 a1, unint64_t a2)
{
  void *v2;
  os_log_type_t v3;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23[3];

  OUTLINED_FUNCTION_4();
  v6 = swift_bridgeObjectRetain();
  v7 = (void *)Dictionary<>.totalValueCount.getter(v6);
  OUTLINED_FUNCTION_11_0();
  if (a2 >> 62)
  {
    OUTLINED_FUNCTION_12_0();
    v8 = _CocoaArrayWrapper.endIndex.getter();
    OUTLINED_FUNCTION_6_0();
  }
  else
  {
    v8 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (__OFADD__(v7, v8))
  {
    __break(1u);
LABEL_16:
    swift_once();
    goto LABEL_11;
  }
  if ((uint64_t)v7 + v8 >= 1501)
  {
    if (one-time initialization token for Log != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_4_0();
    __swift_project_value_buffer(v9, (uint64_t)Log);
    OUTLINED_FUNCTION_12_0();
    v10 = v2;
    v11 = OUTLINED_FUNCTION_31();
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = OUTLINED_FUNCTION_32();
      *(_DWORD *)v13 = 134218496;
      OUTLINED_FUNCTION_19_0();
      *(_WORD *)(v13 + 12) = 2048;
      OUTLINED_FUNCTION_19_0();

      *(_WORD *)(v13 + 22) = 2048;
      v23[0] = v8;
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_6_0();
      _os_log_impl(&dword_218838000, v11, v12, "#radio: Something is wrong——Radio store will have %ld stations after current update which is more than the currently allowed limit of %ld. Clearing the store and adding %ld new items. ", (uint8_t *)v13, 0x20u);
      OUTLINED_FUNCTION_17();
    }

    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_29_0();
    v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Set<KVItem>);
    lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType, (void (*)(uint64_t))type metadata accessor for CAFMediaSourceSemanticType);
    v14 = Dictionary.init(dictionaryLiteral:)();
    RadioListener.radioStationSourcesByType.setter(v14);
  }
  v15 = OUTLINED_FUNCTION_12_0();
  v7 = (void *)specialized Set.init<A>(_:)(v15);
  if (one-time initialization token for Log != -1)
    goto LABEL_16;
LABEL_11:
  v16 = OUTLINED_FUNCTION_4_0();
  v17 = __swift_project_value_buffer(v16, (uint64_t)Log);
  OUTLINED_FUNCTION_12_0();
  swift_bridgeObjectRetain();
  Logger.logObject.getter();
  v18 = OUTLINED_FUNCTION_17_0();
  if (OUTLINED_FUNCTION_24_0(v18))
  {
    v19 = OUTLINED_FUNCTION_32();
    v23[0] = OUTLINED_FUNCTION_32();
    *(_DWORD *)v19 = 134218498;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_6_0();
    *(_WORD *)(v19 + 12) = 2048;
    specialized Set.count.getter((uint64_t)v7);
    OUTLINED_FUNCTION_13_0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2080;
    v20 = CAFMediaSourceSemanticType.description.getter();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, v23);
    OUTLINED_FUNCTION_13_0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_218838000, v17, v3, "#radio: Total mediaItems: %ld — Donating unique %ld items of semanticType: %s", (uint8_t *)v19, 0x20u);
    OUTLINED_FUNCTION_26_0();
    OUTLINED_FUNCTION_17();
  }

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4();
  specialized Dictionary._Variant.setValue(_:forKey:)((uint64_t)v7, a1);
  return swift_endAccess();
}

uint64_t Dictionary<>.totalValueCount.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  unint64_t v4;
  int64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  BOOL v15;
  _QWORD v16[5];

  specialized _NativeDictionary.makeIterator()(a1, v16);
  v1 = v16[0];
  v2 = v16[1];
  v3 = v16[3];
  v4 = v16[4];
  v5 = (unint64_t)(v16[2] + 64) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v4)
    {
      v8 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      v9 = v8 | (v3 << 6);
      goto LABEL_22;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
      break;
    if (v10 >= v5)
      goto LABEL_28;
    v11 = *(_QWORD *)(v2 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v5)
        goto LABEL_28;
      v11 = *(_QWORD *)(v2 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v5)
          goto LABEL_28;
        v11 = *(_QWORD *)(v2 + 8 * v12);
        if (!v11)
        {
          v12 = v3 + 4;
          if (v3 + 4 >= v5)
            goto LABEL_28;
          v11 = *(_QWORD *)(v2 + 8 * v12);
          if (!v11)
          {
            v12 = v3 + 5;
            if (v3 + 5 >= v5)
              goto LABEL_28;
            v11 = *(_QWORD *)(v2 + 8 * v12);
            if (!v11)
            {
              v12 = v3 + 6;
              if (v3 + 6 >= v5)
                goto LABEL_28;
              v11 = *(_QWORD *)(v2 + 8 * v12);
              if (!v11)
              {
                v13 = v3 + 7;
                while (v13 < v5)
                {
                  v11 = *(_QWORD *)(v2 + 8 * v13++);
                  if (v11)
                  {
                    v12 = v13 - 1;
                    goto LABEL_21;
                  }
                }
                goto LABEL_28;
              }
            }
          }
        }
      }
    }
LABEL_21:
    v4 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
    v3 = v12;
LABEL_22:
    v14 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v9);
    if ((v14 & 0xC000000000000001) != 0)
      result = __CocoaSet.count.getter();
    else
      result = *(_QWORD *)(v14 + 16);
    v15 = __OFADD__(v7, result);
    v7 += result;
    if (v15)
    {
      __break(1u);
LABEL_28:
      swift_release();
      return v7;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized Set.init<A>(_:)(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  id v8;
  uint64_t v9;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for KVItem(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
  lazy protocol witness table accessor for type OS_dispatch_queue and conformance OS_dispatch_queue(&lazy protocol witness table cache variable for type KVItem and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for KVItem);
  result = Set.init(minimumCapacity:)();
  v4 = result;
  v9 = result;
  if (!v2)
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_5;
LABEL_13:
    swift_bridgeObjectRelease();
    return v4;
  }
  swift_bridgeObjectRetain();
  v5 = _CocoaArrayWrapper.endIndex.getter();
  result = swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x219A1A998](i, a1);
      else
        v7 = *(id *)(a1 + 8 * i + 32);
      specialized Set._Variant.insert(_:)(&v8, v7);

    }
    swift_bridgeObjectRelease();
    return v9;
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall RadioListener.donationUpdateTriggered()()
{
  void *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *Strong;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t aBlock[6];

  v2 = type metadata accessor for DispatchWorkItemFlags();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS();
  v24 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2_0();
  v23 = v8;
  if (one-time initialization token for Log != -1)
    swift_once();
  v9 = OUTLINED_FUNCTION_4_0();
  __swift_project_value_buffer(v9, (uint64_t)Log);
  v10 = v0;
  v11 = OUTLINED_FUNCTION_31();
  v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_32();
    v14 = OUTLINED_FUNCTION_32();
    v22[1] = v6;
    aBlock[0] = v14;
    v22[2] = v5;
    *(_DWORD *)v13 = 136315138;
    v15 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x138))();
    v25 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    OUTLINED_FUNCTION_9_0();
    _os_log_impl(&dword_218838000, v11, v12, "#radio triggering donation request for: %s", v13, 0xCu);
    OUTLINED_FUNCTION_26_0();
    OUTLINED_FUNCTION_17();
  }

  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  v18 = OUTLINED_FUNCTION_30();
  *(_QWORD *)(v18 + 16) = v1;
  aBlock[4] = (uint64_t)partial apply for closure #1 in RadioListener.donationUpdateTriggered();
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = (uint64_t)&block_descriptor;
  v19 = _Block_copy(aBlock);
  v20 = v1;
  v21 = v23;
  static DispatchQoS.unspecified.getter();
  v25 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (void (*)(uint64_t))MEMORY[0x24BEE5458]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x219A1A890](0, v21, v5, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v21, v6);
  swift_release();
  OUTLINED_FUNCTION_9();
}

uint64_t closure #1 in RadioListener.donationUpdateTriggered()(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t result;
  void (*v4)(uint64_t);
  uint64_t v5;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *a1) + 0x120))();
  if (result)
  {
    v4 = (void (*)(uint64_t))result;
    v5 = (*(uint64_t (**)(void))((*v2 & *a1) + 0x138))();
    v4(v5);
    outlined consume of (@escaping @callee_guaranteed (@guaranteed String) -> ())?((uint64_t)v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id RadioListener.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void RadioListener.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void RadioListener.accessoryDidUpdate(_:receivedAllValues:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD *v14;

  v2 = v1;
  if (one-time initialization token for Log != -1)
    swift_once();
  v4 = OUTLINED_FUNCTION_4_0();
  v5 = __swift_project_value_buffer(v4, (uint64_t)Log);
  v6 = a1;
  v7 = v5;
  Logger.logObject.getter();
  v8 = OUTLINED_FUNCTION_17_0();
  if (os_log_type_enabled(v5, v8))
  {
    v9 = OUTLINED_FUNCTION_32();
    v14 = (_QWORD *)OUTLINED_FUNCTION_32();
    *(_DWORD *)v9 = 138412546;
    v10 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v14 = v6;

    *(_WORD *)(v9 + 12) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_218838000, v7, v8, "#radio: %@ received all values %{BOOL}d.", (uint8_t *)v9, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NSObject?);
    OUTLINED_FUNCTION_26_0();
    OUTLINED_FUNCTION_17();
  }

  objc_opt_self();
  v11 = swift_dynamicCastObjCClass();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = v6;
    if (objc_msgSend(v12, sel_receivedAllValues))
    {
      RadioListener.observeMediaSources(from:)(v12);
      objc_msgSend(v12, sel_unregisterObserver_, v2);
    }

  }
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    OUTLINED_FUNCTION_33_0();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  Swift::Int v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = String.UTF8View._foreignCount()();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt8 a1)
{
  Swift::Int v2;

  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t result;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  int64_t v30;
  unint64_t v31;
  unint64_t v32;
  id v33;
  int64_t v34;
  int64_t v35;
  unint64_t v36;
  int64_t v37;
  int64_t v38;
  int64_t v39;
  int64_t v40;
  unint64_t v41;
  int64_t v42;
  int64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  unint64_t v49;

  v3 = v1;
  result = specialized Set.count.getter(a1);
  v7 = result;
  if ((unint64_t)*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = _CocoaArrayWrapper.endIndex.getter();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v9 = v8 + v7;
  if (__OFADD__(v8, v7))
  {
    __break(1u);
    goto LABEL_22;
  }
  v10 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v10;
  v12 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject
    && (v10 & 0x8000000000000000) == 0
    && (v10 & 0x4000000000000000) == 0)
  {
    v13 = v10 & 0xFFFFFFFFFFFFFF8;
    if (v9 <= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_14;
    v12 = 1;
  }
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v14 <= v9)
    v14 = v9;
  swift_bridgeObjectRetain();
  v15 = MEMORY[0x219A1A9A4](v12, v14, 1, v10);
  swift_bridgeObjectRelease();
  *v3 = v15;
  v13 = v15 & 0xFFFFFFFFFFFFFF8;
LABEL_14:
  v16 = *(_QWORD *)(v13 + 16);
  v17 = (*(_QWORD *)(v13 + 24) >> 1) - v16;
  result = (uint64_t)specialized Sequence._copySequenceContents(initializing:)(&v45, (_QWORD *)(v13 + 8 * v16 + 32), v17, a1);
  if (result < v7)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (result >= 1)
  {
    v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v19 = __OFADD__(v18, result);
    v20 = v18 + result;
    if (v19)
    {
      __break(1u);
LABEL_30:
      if (!__CocoaSet.Iterator.next()())
        goto LABEL_19;
      type metadata accessor for KVItem(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v24 = v44;
      swift_unknownObjectRelease();
      while (2)
      {
        if (!v24)
          goto LABEL_19;
        while (1)
        {
          v26 = *v3 & 0xFFFFFFFFFFFFFF8;
          if (v2 + 1 > *(_QWORD *)(v26 + 0x18) >> 1)
          {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
            v26 = *v3 & 0xFFFFFFFFFFFFFF8;
          }
          v27 = *(_QWORD *)(v26 + 24);
          if (v2 < (uint64_t)(v27 >> 1))
            break;
LABEL_69:
          *(_QWORD *)(v26 + 16) = v2;
        }
        v28 = v27 >> 1;
        v29 = v26 + 32;
        while (1)
        {
          *(_QWORD *)(v29 + 8 * v2++) = v24;
          v30 = v48;
          if (v45 < 0)
          {
            if (!__CocoaSet.Iterator.next()())
              goto LABEL_70;
            type metadata accessor for KVItem(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            v24 = v44;
            swift_unknownObjectRelease();
            goto LABEL_44;
          }
          if (!v49)
            break;
          v31 = (v49 - 1) & v49;
          v32 = __clz(__rbit64(v49)) | (v48 << 6);
LABEL_40:
          v24 = *(void **)(*(_QWORD *)(v45 + 48) + 8 * v32);
          v33 = v24;
LABEL_41:
          v48 = v30;
          v49 = v31;
LABEL_44:
          if (!v24)
          {
LABEL_70:
            *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v2;
            goto LABEL_19;
          }
          if (v2 >= v28)
          {
            v26 = *v3 & 0xFFFFFFFFFFFFFF8;
            goto LABEL_69;
          }
        }
        v34 = v48 + 1;
        if (__OFADD__(v48, 1))
        {
          __break(1u);
LABEL_94:
          v24 = 0;
          v22 = 0;
          v21 = v6;
LABEL_27:
          v48 = v21;
          v49 = v22;
          continue;
        }
        break;
      }
      v35 = (unint64_t)(v47 + 64) >> 6;
      if (v34 >= v35)
      {
        v24 = 0;
        v31 = 0;
        goto LABEL_41;
      }
      v36 = *(_QWORD *)(v46 + 8 * v34);
      if (!v36)
      {
        v37 = v48 + 2;
        if (v48 + 2 >= v35)
          goto LABEL_66;
        v36 = *(_QWORD *)(v46 + 8 * v37);
        if (!v36)
        {
          v6 = v48 + 3;
          if (v48 + 3 >= v35)
            goto LABEL_67;
          v36 = *(_QWORD *)(v46 + 8 * v6);
          if (v36)
          {
            v34 = v48 + 3;
            goto LABEL_50;
          }
          v37 = v48 + 4;
          if (v48 + 4 >= v35)
          {
            v24 = 0;
            v31 = 0;
            v30 = v48 + 3;
            goto LABEL_41;
          }
          v36 = *(_QWORD *)(v46 + 8 * v37);
          if (!v36)
          {
            v34 = v48 + 5;
            if (v48 + 5 >= v35)
            {
LABEL_67:
              v24 = 0;
              v31 = 0;
              v30 = v37;
              goto LABEL_41;
            }
            v36 = *(_QWORD *)(v46 + 8 * v34);
            if (!v36)
            {
              v34 = v35 - 1;
              v38 = v48 + 6;
              while (v38 < v35)
              {
                v36 = *(_QWORD *)(v46 + 8 * v38++);
                if (v36)
                {
                  v34 = v38 - 1;
                  goto LABEL_50;
                }
              }
LABEL_66:
              v24 = 0;
              v31 = 0;
              v30 = v34;
              goto LABEL_41;
            }
            goto LABEL_50;
          }
        }
        v34 = v37;
      }
LABEL_50:
      v31 = (v36 - 1) & v36;
      v32 = __clz(__rbit64(v36)) + (v34 << 6);
      v30 = v34;
      goto LABEL_40;
    }
    *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v20;
  }
  if (result != v17)
  {
LABEL_19:
    outlined consume of Set<KVItem>.Iterator._Variant();
    return specialized Array._endMutation()();
  }
LABEL_23:
  v2 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v21 = v48;
  if (v45 < 0)
    goto LABEL_30;
  if (v49)
  {
    v22 = (v49 - 1) & v49;
    v23 = __clz(__rbit64(v49)) | (v48 << 6);
LABEL_26:
    v24 = *(void **)(*(_QWORD *)(v45 + 48) + 8 * v23);
    v25 = v24;
    goto LABEL_27;
  }
  v39 = v48 + 1;
  if (!__OFADD__(v48, 1))
  {
    v40 = (unint64_t)(v47 + 64) >> 6;
    if (v39 >= v40)
    {
      v24 = 0;
      v22 = 0;
      goto LABEL_27;
    }
    v41 = *(_QWORD *)(v46 + 8 * v39);
    if (v41)
      goto LABEL_75;
    v42 = v48 + 2;
    if (v48 + 2 >= v40)
    {
LABEL_91:
      v24 = 0;
      v22 = 0;
      v21 = v39;
      goto LABEL_27;
    }
    v41 = *(_QWORD *)(v46 + 8 * v42);
    if (v41)
      goto LABEL_79;
    v6 = v48 + 3;
    if (v48 + 3 < v40)
    {
      v41 = *(_QWORD *)(v46 + 8 * v6);
      if (v41)
      {
        v39 = v48 + 3;
        goto LABEL_75;
      }
      v42 = v48 + 4;
      if (v48 + 4 >= v40)
        goto LABEL_94;
      v41 = *(_QWORD *)(v46 + 8 * v42);
      if (v41)
      {
LABEL_79:
        v39 = v42;
LABEL_75:
        v22 = (v41 - 1) & v41;
        v23 = __clz(__rbit64(v41)) + (v39 << 6);
        v21 = v39;
        goto LABEL_26;
      }
      v39 = v48 + 5;
      if (v48 + 5 < v40)
      {
        v41 = *(_QWORD *)(v46 + 8 * v39);
        if (!v41)
        {
          v39 = v40 - 1;
          v43 = v48 + 6;
          do
          {
            if (v43 >= v40)
              goto LABEL_91;
            v41 = *(_QWORD *)(v46 + 8 * v43++);
          }
          while (!v41);
          v39 = v43 - 1;
        }
        goto LABEL_75;
      }
    }
    v24 = 0;
    v22 = 0;
    v21 = v42;
    goto LABEL_27;
  }
  __break(1u);
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  Swift::Int v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t result;
  Swift::Int v22;
  _QWORD *v23;
  id v24;
  char isUniquelyReferenced_nonNull_native;
  id v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease();

      type metadata accessor for KVItem(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v22 = specialized _NativeSet.init(_:capacity:)(v7, result + 1);
    v28 = (_QWORD *)v22;
    if (*(_QWORD *)(v22 + 24) <= *(_QWORD *)(v22 + 16))
    {
      v26 = v8;
      specialized _NativeSet.resize(capacity:)();
      v23 = v28;
    }
    else
    {
      v23 = (_QWORD *)v22;
      v24 = v8;
    }
    specialized _NativeSet._unsafeInsertNew(_:)((uint64_t)v8, v23);
    *v3 = (uint64_t)v23;
  }
  else
  {
    v10 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain();
    v11 = NSObject._rawHashValue(seed:)(v10);
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      type metadata accessor for KVItem(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = static NSObject.== infix(_:_:)();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v29 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    specialized _NativeSet.insertNew(_:at:isUnique:)((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t specialized Dictionary._Variant.setValue(_:forKey:)(uint64_t a1, Swift::UInt8 a2)
{
  uint64_t *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  *v2 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, isUniquelyReferenced_nonNull_native);
  *v2 = v7;
  return swift_bridgeObjectRelease();
}

unint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, Swift::UInt8 a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  _BOOL8 v12;
  Swift::Int v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  v11 = v8[2];
  v12 = (v10 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_9;
  }
  v14 = v9;
  v15 = v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _NativeDictionary<CAFMediaSourceSemanticType, Set<KVItem>>);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13))
    goto LABEL_5;
  v16 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_9:
    type metadata accessor for CAFMediaSourceSemanticType();
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  v14 = v16;
LABEL_5:
  v18 = *v4;
  if ((v15 & 1) == 0)
    return specialized _NativeDictionary._insert(at:key:value:)(v14, a2, a1, v18);
  v19 = v18[7];
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v19 + 8 * v14) = a1;
  return result;
}

unint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t result, char a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_BYTE *)(a4[6] + result) = a2;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

uint64_t specialized UnsafeMutablePointer.assign(repeating:count:)(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

Swift::Int specialized _NativeSet.init(_:capacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<KVItem>);
  v2 = static _SetStorage.convert(_:capacity:)();
  v14 = v2;
  __CocoaSet.makeIterator()();
  if (!__CocoaSet.Iterator.next()())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  type metadata accessor for KVItem(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
  while (1)
  {
    swift_dynamicCast();
    v2 = v14;
    if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
    {
      specialized _NativeSet.resize(capacity:)();
      v2 = v14;
    }
    result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
    v4 = v2 + 56;
    v5 = -1 << *(_BYTE *)(v2 + 32);
    v6 = result & ~v5;
    v7 = v6 >> 6;
    if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) == 0)
      break;
    v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
    ++*(_QWORD *)(v2 + 16);
    if (!__CocoaSet.Iterator.next()())
      goto LABEL_16;
  }
  v9 = 0;
  v10 = (unint64_t)(63 - v5) >> 6;
  while (++v7 != v10 || (v9 & 1) == 0)
  {
    v11 = v7 == v10;
    if (v7 == v10)
      v7 = 0;
    v9 |= v11;
    v12 = *(_QWORD *)(v4 + 8 * v7);
    if (v12 != -1)
    {
      v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<KVItem>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    if (!v8)
      goto LABEL_7;
LABEL_6:
    v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6))) == 0)
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          v25 = v21 == v24;
          if (v21 == v24)
            v21 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v21);
          if (v26 != -1)
          {
            v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v22) = v18;
      ++*(_QWORD *)(v4 + 16);
      if (v8)
        goto LABEL_6;
LABEL_7:
      v15 = v12 + 1;
      if (__OFADD__(v12, 1))
        goto LABEL_38;
      if (v15 >= v9)
        goto LABEL_32;
      v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        v12 = v15 + 1;
        if (v15 + 1 >= v9)
          goto LABEL_32;
        v16 = v6[v12];
        if (!v16)
        {
          v12 = v15 + 2;
          if (v15 + 2 >= v9)
            goto LABEL_32;
          v16 = v6[v12];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              v1 = v28;
              v27 = 1 << *(_BYTE *)(v2 + 32);
              if (v27 > 63)
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v27 + 63) >> 6, (_QWORD *)(v2 + 56));
              else
                *v6 = -1 << v27;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                v12 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_39;
                if (v12 >= v9)
                  goto LABEL_32;
                v16 = v6[v12];
                ++v17;
                if (v16)
                  goto LABEL_20;
              }
            }
            v12 = v17;
          }
        }
      }
LABEL_20:
      v8 = (v16 - 1) & v16;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t specialized _NativeSet._unsafeInsertNew(_:)(uint64_t a1, _QWORD *a2)
{
  unint64_t result;

  NSObject._rawHashValue(seed:)(a2[5]);
  result = _HashTable.nextHole(atOrAfter:)();
  *(_QWORD *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(_QWORD *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  Swift::Int v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v7 > v6)
    {
      specialized _NativeSet.copy()();
      goto LABEL_14;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v8 = *v3;
  v9 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    type metadata accessor for KVItem(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = static NSObject.== infix(_:_:)();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = static NSObject.== infix(_:_:)();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

id specialized _NativeSet.copy()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  void *v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<KVItem>);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * i) = v20;
    result = v20;
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  Swift::Int v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<KVItem>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v4;
    return result;
  }
  v28 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    v18 = *(_QWORD *)(v4 + 40);
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    result = NSObject._rawHashValue(seed:)(v18);
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v10 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v10 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v23) = v19;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v15 = v12 + 1;
    if (__OFADD__(v12, 1))
      goto LABEL_36;
    if (v15 >= v9)
      goto LABEL_32;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      v12 = v15 + 1;
      if (v15 + 1 >= v9)
        goto LABEL_32;
      v16 = *(_QWORD *)(v6 + 8 * v12);
      if (!v16)
      {
        v12 = v15 + 2;
        if (v15 + 2 >= v9)
          goto LABEL_32;
        v16 = *(_QWORD *)(v6 + 8 * v12);
        if (!v16)
          break;
      }
    }
LABEL_20:
    v8 = (v16 - 1) & v16;
  }
  v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v28;
    goto LABEL_34;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    v12 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v12 >= v9)
      goto LABEL_32;
    v16 = *(_QWORD *)(v6 + 8 * v12);
    ++v17;
    if (v16)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t outlined bridged method (pb) of @objc CAFMedia.mediaSources.getter(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_mediaSources);
  if (!v1)
    return 0;
  v2 = v1;
  type metadata accessor for KVItem(0, &lazy cache variable for type metadata for CAFMediaSource);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

id outlined bridged method (mnbnnn) of @objc KVItemBuilder.addField(type:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;

  v8 = (void *)MEMORY[0x219A1A7A0](a2, a3);
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(a5, sel_addFieldWithType_value_error_, a1, v8, a4);

  return v9;
}

uint64_t outlined bridged method (pb) of @objc CAFMediaItem.mediaItemName.getter(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

_QWORD *specialized Sequence._copySequenceContents(initializing:)(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  unint64_t v31;

  v4 = a4;
  v6 = a2;
  v24 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    __CocoaSet.makeIterator()();
    type metadata accessor for KVItem(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
    lazy protocol witness table accessor for type OS_dispatch_queue and conformance OS_dispatch_queue(&lazy protocol witness table cache variable for type KVItem and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for KVItem);
    result = (_QWORD *)Set.Iterator.init(_cocoa:)();
    v4 = v27;
    v7 = v28;
    v8 = v29;
    v9 = v30;
    v10 = v31;
    if (v6)
      goto LABEL_3;
LABEL_37:
    v11 = 0;
    goto LABEL_39;
  }
  v9 = 0;
  v19 = -1 << *(_BYTE *)(a4 + 32);
  v7 = a4 + 56;
  v8 = ~v19;
  v20 = -v19;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  else
    v21 = -1;
  v10 = v21 & *(_QWORD *)(a4 + 56);
  if (!a2)
    goto LABEL_37;
LABEL_3:
  if (!a3)
  {
    v11 = 0;
LABEL_39:
    v22 = v24;
LABEL_41:
    *v22 = v4;
    v22[1] = v7;
    v22[2] = v8;
    v22[3] = v9;
    v22[4] = v10;
    return (_QWORD *)v11;
  }
  if (a3 < 0)
    goto LABEL_48;
  v11 = 0;
  v25 = (unint64_t)(v8 + 64) >> 6;
  v23 = v8;
  while (1)
  {
    if (v4 < 0)
    {
      if (!__CocoaSet.Iterator.next()())
        goto LABEL_40;
      type metadata accessor for KVItem(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v14 = v26;
      result = (_QWORD *)swift_unknownObjectRelease();
      if (!v26)
        goto LABEL_40;
      goto LABEL_23;
    }
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_22;
    }
    v15 = v9 + 1;
    if (__OFADD__(v9, 1))
      break;
    if (v15 >= v25)
    {
      v10 = 0;
      goto LABEL_40;
    }
    v16 = *(_QWORD *)(v7 + 8 * v15);
    if (v16)
      goto LABEL_21;
    v17 = v9 + 2;
    if (v9 + 2 >= v25)
    {
      v10 = 0;
      ++v9;
      goto LABEL_40;
    }
    v16 = *(_QWORD *)(v7 + 8 * v17);
    if (!v16)
    {
      if (v9 + 3 >= v25)
        goto LABEL_44;
      v16 = *(_QWORD *)(v7 + 8 * (v9 + 3));
      if (v16)
      {
        v15 = v9 + 3;
        goto LABEL_21;
      }
      v17 = v9 + 4;
      if (v9 + 4 >= v25)
      {
        v10 = 0;
        v9 += 3;
        goto LABEL_40;
      }
      v16 = *(_QWORD *)(v7 + 8 * v17);
      if (!v16)
      {
        v15 = v9 + 5;
        if (v9 + 5 >= v25)
        {
LABEL_44:
          v10 = 0;
          v9 = v17;
          goto LABEL_40;
        }
        v16 = *(_QWORD *)(v7 + 8 * v15);
        if (!v16)
        {
          v18 = v9 + 6;
          while (v18 < v25)
          {
            v16 = *(_QWORD *)(v7 + 8 * v18++);
            if (v16)
            {
              v15 = v18 - 1;
              goto LABEL_21;
            }
          }
          v10 = 0;
          v9 = v25 - 1;
          goto LABEL_40;
        }
        goto LABEL_21;
      }
    }
    v15 = v17;
LABEL_21:
    v10 = (v16 - 1) & v16;
    v13 = __clz(__rbit64(v16)) + (v15 << 6);
    v9 = v15;
LABEL_22:
    result = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v13);
    v14 = result;
    if (!result)
      goto LABEL_40;
LABEL_23:
    ++v11;
    *v6++ = v14;
    if (v11 == a3)
    {
      v11 = a3;
LABEL_40:
      v8 = v23;
      v22 = v24;
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary.makeIterator()@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_218842D20()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in RadioListener.donationUpdateTriggered()()
{
  uint64_t v0;

  return closure #1 in RadioListener.donationUpdateTriggered()(*(_QWORD **)(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t method lookup function for RadioListener()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RadioListener.updateHandler.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of RadioListener.updateHandler.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of RadioListener.updateHandler.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of RadioListener.appId.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of RadioListener.__allocating_init(serialQueue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t dispatch thunk of RadioListener.clearDonatedStations()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of RadioListener.teardownPublisherSubscriptions()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of RadioListener.mediaConnectionEstablished(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of RadioListener.registerUpdateHandler(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of RadioListener.radioStations()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of RadioListener.donationUpdateTriggered()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

void lazy protocol witness table accessor for type OS_dispatch_queue and conformance OS_dispatch_queue(_QWORD *a1, unint64_t *a2)
{
  if (!*a1)
  {
    type metadata accessor for KVItem(255, a2);
    OUTLINED_FUNCTION_12();
  }
  OUTLINED_FUNCTION_25();
}

uint64_t sub_218842ECC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_218842EF0()
{
  swift_release();
  return swift_deallocObject();
}

void partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed String) -> (@out ())(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(_QWORD *);
  _QWORD v4[2];

  v3 = *(void (**)(_QWORD *))(v2 + 16);
  v4[0] = a1;
  v4[1] = a2;
  v3(v4);
  OUTLINED_FUNCTION_36();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed String) -> ()(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*a1, a1[1]);
}

uint64_t outlined consume of Set<KVItem>.Iterator._Variant()
{
  return swift_release();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t partial apply for closure #1 in closure #2 in RadioListener.observeMediaSources(from:)@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  return closure #1 in closure #2 in RadioListener.observeMediaSources(from:)(a1, a2);
}

BOOL partial apply for closure #2 in closure #2 in RadioListener.observeMediaSources(from:)(_BOOL8 a1, void *a2)
{
  uint64_t v2;

  return closure #2 in closure #2 in RadioListener.observeMediaSources(from:)(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@unowned CAFMediaSourceSemanticType, @guaranteed CAFMediaItems) -> (@unowned Bool)(unsigned __int8 *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*a1, *((_QWORD *)a1 + 1)) & 1;
}

uint64_t partial apply for closure #3 in closure #2 in RadioListener.observeMediaSources(from:)(uint64_t a1, void *a2)
{
  uint64_t v2;

  return closure #3 in closure #2 in RadioListener.observeMediaSources(from:)(a1, a2, *(void **)(v2 + 16));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@unowned CAFMediaSourceSemanticType, @guaranteed CAFMediaItems) -> (@unowned CAFMediaSourceSemanticType, @owned [KVItem])@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *((_QWORD *)a1 + 1));
  *(_BYTE *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  return result;
}

uint64_t partial apply for closure #4 in closure #2 in RadioListener.observeMediaSources(from:)(uint64_t a1)
{
  uint64_t v1;

  return closure #4 in closure #2 in RadioListener.observeMediaSources(from:)(a1, *(_QWORD **)(v1 + 16));
}

void type metadata accessor for KVItem(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_25();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return type metadata accessor for Logger();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return Logger.logObject.getter();
}

uint64_t OUTLINED_FUNCTION_16_0(uint64_t a1)
{
  return specialized Set.count.getter(a1);
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return static os_log_type_t.info.getter();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

id OUTLINED_FUNCTION_20_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;

  return outlined bridged method (mnbnnn) of @objc KVItemBuilder.addField(type:value:)(a1, a3, a5, a4, v5);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_bridgeObjectRelease();
}

BOOL OUTLINED_FUNCTION_24_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_28_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  return a13;
}

void OUTLINED_FUNCTION_29_0()
{
  type metadata accessor for CAFMediaSourceSemanticType();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return Logger.logObject.getter();
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_release();
}

void OUTLINED_FUNCTION_37(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_39()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_41(uint64_t a1, SEL *a2)
{
  void *v2;

  return outlined bridged method (pb) of @objc CAFMediaItem.mediaItemName.getter(v2, a2);
}

BOOL static ProviderError.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void ProviderError.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ProviderError.hashValue.getter(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ProviderError(char *a1, char *a2)
{
  return static ProviderError.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ProviderError()
{
  unsigned __int8 *v0;

  return ProviderError.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance ProviderError(uint64_t a1)
{
  unsigned __int8 *v1;

  ProviderError.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ProviderError()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t KMFindMySyncDevicesProvider.getSyncDevices()()
{
  char *v0;
  uint64_t v1;
  char *v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  dispatch_semaphore_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  char *v23;
  NSObject *v24;
  char *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  uint64_t v32;
  unsigned __int8 *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  _QWORD v38[5];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD aBlock[7];
  uint64_t v52;

  v2 = v0;
  v49 = type metadata accessor for DispatchTimeInterval();
  v47 = *(_QWORD *)(v49 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_0_0();
  v46 = (_QWORD *)(v5 - v4);
  v52 = type metadata accessor for DispatchTime();
  v48 = *(_QWORD *)(v52 - 8);
  OUTLINED_FUNCTION_2();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v44 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v45 = (char *)v38 - v9;
  v10 = type metadata accessor for DispatchWorkItemFlags();
  v43 = *(_QWORD *)(v10 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_6();
  v12 = type metadata accessor for DispatchQoS();
  v41 = *(_QWORD *)(v12 - 8);
  v42 = v12;
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_0_0();
  v16 = v15 - v14;
  v17 = dispatch_semaphore_create(0);
  v18 = OUTLINED_FUNCTION_3_1();
  *(_QWORD *)(v18 + 16) = MEMORY[0x24BEE4AF8];
  v38[1] = v18 + 16;
  v19 = OUTLINED_FUNCTION_3_1();
  *(_DWORD *)(v19 + 16) = 0;
  (*(void (**)(void))(**(_QWORD **)&v0[OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_syncDeviceProvider]
                    + 136))();
  v20 = OUTLINED_FUNCTION_3_1();
  *(_BYTE *)(v20 + 16) = 3;
  v38[0] = v20 + 16;
  v40 = *(_QWORD *)&v2[OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_queue];
  v21 = (_QWORD *)OUTLINED_FUNCTION_3_1();
  v21[2] = v2;
  v21[3] = v20;
  v21[4] = v19;
  v21[5] = v18;
  v21[6] = v17;
  aBlock[4] = partial apply for closure #1 in KMFindMySyncDevicesProvider.getSyncDevices();
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_0;
  v22 = _Block_copy(aBlock);
  v23 = v2;
  v38[3] = v20;
  swift_retain();
  v38[4] = v19;
  swift_retain();
  v39 = v18;
  swift_retain();
  v24 = v17;
  static DispatchQoS.unspecified.getter();
  v50 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x219A1A890](0, v16, v1, v22);
  _Block_release(v22);
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v1, v10);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v16, v42);
  swift_release();
  v25 = v44;
  static DispatchTime.now()();
  v27 = v46;
  v26 = v47;
  *v46 = 10;
  v28 = v49;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v26 + 104))(v27, *MEMORY[0x24BEE5420], v49);
  v29 = v45;
  MEMORY[0x219A1A770](v25, v27);
  (*(void (**)(_QWORD *, uint64_t))(v26 + 8))(v27, v28);
  v30 = *(void (**)(char *, uint64_t))(v48 + 8);
  v31 = v25;
  v32 = v52;
  v30(v31, v52);
  LOBYTE(v28) = MEMORY[0x219A1A8A8](v29);
  v30(v29, v32);
  if ((v28 & 1) != 0)
  {
    v34 = 1;
    goto LABEL_5;
  }
  v33 = (unsigned __int8 *)v38[0];
  OUTLINED_FUNCTION_1();
  v34 = *v33;
  v35 = v39;
  if ((_DWORD)v34 != 3)
  {
LABEL_5:
    lazy protocol witness table accessor for type ProviderError and conformance ProviderError();
    swift_allocError();
    *v36 = v34;
    swift_willThrow();

    swift_release();
    swift_release();
    swift_release();
    return v34;
  }

  OUTLINED_FUNCTION_1();
  v34 = *(_QWORD *)(v35 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  swift_release();
  return v34;
}

uint64_t sub_2188437A0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2188437C4()
{
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_2188437D0()
{
  return OUTLINED_FUNCTION_1_0();
}

uint64_t closure #1 in KMFindMySyncDevicesProvider.getSyncDevices()(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10;
  _QWORD *v11;
  void (*v12)(uint64_t (*)(uint64_t, uint64_t, uint64_t, char), _QWORD *);
  char *v13;
  id v14;

  v10 = *(_QWORD *)&a1[OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_syncDeviceProvider];
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a2;
  v11[3] = a3;
  v11[4] = a1;
  v11[5] = a4;
  v11[6] = a5;
  v12 = *(void (**)(uint64_t (*)(uint64_t, uint64_t, uint64_t, char), _QWORD *))(*(_QWORD *)v10 + 128);
  swift_retain();
  swift_retain();
  v13 = a1;
  swift_retain();
  v14 = a5;
  v12(partial apply for closure #1 in closure #1 in KMFindMySyncDevicesProvider.getSyncDevices(), v11);
  return swift_release();
}

uint64_t sub_21884388C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in KMFindMySyncDevicesProvider.getSyncDevices()()
{
  uint64_t v0;

  return closure #1 in KMFindMySyncDevicesProvider.getSyncDevices()(*(char **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(void **)(v0 + 48));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t lazy protocol witness table accessor for type ProviderError and conformance ProviderError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ProviderError and conformance ProviderError;
  if (!lazy protocol witness table cache variable for type ProviderError and conformance ProviderError)
  {
    result = MEMORY[0x219A1B070](&protocol conformance descriptor for ProviderError, &type metadata for ProviderError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ProviderError and conformance ProviderError);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ProviderError and conformance ProviderError;
  if (!lazy protocol witness table cache variable for type ProviderError and conformance ProviderError)
  {
    result = MEMORY[0x219A1B070](&protocol conformance descriptor for ProviderError, &type metadata for ProviderError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ProviderError and conformance ProviderError);
  }
  return result;
}

uint64_t closure #1 in closure #1 in KMFindMySyncDevicesProvider.getSyncDevices()(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v8;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21[3];
  __int128 v22;
  uint64_t v23;

  v8 = (_BYTE *)(a5 + 16);
  if ((a4 & 1) != 0)
  {
    swift_beginAccess();
    *v8 = 2;
    return OS_dispatch_semaphore.signal()();
  }
  v10 = *(_QWORD *)(a3 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (!v10)
  {
LABEL_7:
    v18 = (_QWORD *)(a8 + 16);
    swift_beginAccess();
    *v18 = v11;
    swift_bridgeObjectRelease();
    return OS_dispatch_semaphore.signal()();
  }
  v19 = a8;
  v12 = (_DWORD *)(a6 + 16);
  v20 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  specialized ContiguousArray.reserveCapacity(_:)();
  result = swift_beginAccess();
  v14 = a3 + 40;
  while (1)
  {
    v15 = *(_QWORD *)v14;
    v16 = *(_QWORD *)(v14 + 8);
    v17 = *(_QWORD *)(v14 + 32);
    v21[0] = *(_QWORD *)(v14 - 8);
    v21[1] = v15;
    v21[2] = v16;
    v22 = *(_OWORD *)(v14 + 16);
    v23 = v17;
    if (*v12 == -1)
      break;
    ++*v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    KMFindMySyncDevicesProvider.itemFrom(syncDevice:itemCount:)(v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 += 48;
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    result = specialized ContiguousArray._endMutation()();
    if (!--v10)
    {
      v11 = v20;
      swift_bridgeObjectRelease();
      a8 = v19;
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

id KMFindMySyncDevicesProvider.itemFrom(syncDevice:itemCount:)(uint64_t *a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v23;
  _BYTE v24[16];
  _BYTE v25[16];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(v1 + OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_itemBuilder);
  v4 = dispatch thunk of CustomStringConvertible.description.getter();
  v5 = (void *)MEMORY[0x219A1A7A0](v4);
  swift_bridgeObjectRelease();
  v23 = 0;
  v6 = objc_msgSend(v3, sel_setItemType_itemId_error_, 21, v5, &v23);

  if (!v6)
    goto LABEL_5;
  v7 = v23;

  v8 = *a1;
  v9 = a1[1];
  v23 = 0;
  v10 = outlined bridged method (mnbgnnn) of @objc KVItemBuilder.addField(type:value:)(950, v8, v9, (uint64_t)&v23, v3);
  v11 = v23;
  if (!v10)
  {
    v13 = v11;
    goto LABEL_7;
  }

  outlined init with take of String?((uint64_t)(a1 + 2), (uint64_t)v25);
  outlined init with take of String?((uint64_t)v25, (uint64_t)v26);
  if (v26[1])
    v12 = (void *)MEMORY[0x219A1A7A0](v26[0]);
  else
    v12 = 0;
  v23 = 0;
  v14 = objc_msgSend(v3, sel_addFieldWithType_value_error_, 951, v12, &v23);

  v13 = v23;
  if (!v14)
    goto LABEL_16;
  v15 = v23;

  outlined init with take of String?((uint64_t)(a1 + 4), (uint64_t)v24);
  outlined init with take of String?((uint64_t)v24, (uint64_t)v27);
  v16 = v27[1] ? (void *)MEMORY[0x219A1A7A0](v27[0]) : 0;
  v23 = 0;
  v17 = objc_msgSend(v3, sel_addFieldWithType_value_error_, 952, v16, &v23);

  v13 = v23;
  if (!v17)
  {
LABEL_16:
    v21 = v13;
    _convertNSErrorToError(_:)();

    goto LABEL_17;
  }
  v18 = v23;

  v23 = 0;
  v19 = objc_msgSend(v3, sel_buildItemWithError_, &v23);
  if (!v19)
  {
LABEL_5:
    v13 = v23;
LABEL_7:
    _convertNSErrorToError(_:)();

LABEL_17:
    swift_willThrow();
    return v13;
  }
  v13 = v19;
  v20 = v23;
  return v13;
}

id KMFindMySyncDevicesProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id KMFindMySyncDevicesProvider.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;
  uint64_t v16;

  v14 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v1 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_0_0();
  v4 = v3 - v2;
  type metadata accessor for OS_dispatch_queue.Attributes();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0_0();
  type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_6();
  v13 = OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_queue;
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  v8 = v0;
  static DispatchQoS.unspecified.getter();
  v16 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BEE5750], v14);
  *(_QWORD *)(v12 + v13) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v9 = OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_syncDeviceProvider;
  type metadata accessor for CachingSyncDeviceProvider();
  *(_QWORD *)&v8[v9] = CachingSyncDeviceProvider.__allocating_init()();
  v10 = OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_itemBuilder;
  *(_QWORD *)&v8[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE5E8E8]), sel_init);

  v15.receiver = v8;
  v15.super_class = (Class)type metadata accessor for KMFindMySyncDevicesProvider();
  return objc_msgSendSuper2(&v15, sel_init);
}

uint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x219A1B070](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x219A1B070](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for KMFindMySyncDevicesProvider()
{
  return objc_opt_self();
}

id KMFindMySyncDevicesProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KMFindMySyncDevicesProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ProviderError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 2) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ProviderError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2188442AC + 4 * byte_218855855[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2188442E0 + 4 * byte_218855850[v4]))();
}

uint64_t sub_2188442E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2188442E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2188442F0);
  return result;
}

uint64_t sub_2188442FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x218844304);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_218844308(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_218844310(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for ProviderError(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for ProviderError(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ProviderError()
{
  return &type metadata for ProviderError;
}

uint64_t method lookup function for KMFindMySyncDevicesProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of KMFindMySyncDevicesProvider.getSyncDevices()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

id outlined bridged method (mnbgnnn) of @objc KVItemBuilder.addField(type:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;

  v8 = (void *)MEMORY[0x219A1A7A0](a2, a3);
  v9 = objc_msgSend(a5, sel_addFieldWithType_value_error_, a1, v8, a4);

  return v9;
}

uint64_t outlined init with take of String?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_218844470()
{
  uint64_t v0;

  swift_release();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in KMFindMySyncDevicesProvider.getSyncDevices()(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t *v4;

  return closure #1 in closure #1 in KMFindMySyncDevicesProvider.getSyncDevices()(a1, a2, a3, a4 & 1, v4[2], v4[3], v4[4], v4[5]);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return swift_allocObject();
}

uint64_t Log.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for Log != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)Log);
}

Swift::String *kmLoggingSubsystem.unsafeMutableAddressor()
{
  return &kmLoggingSubsystem;
}

void one-time initialization function for kmLoggingCategory()
{
  kmLoggingCategory._countAndFlagsBits = 0x657070614D616F4BLL;
  kmLoggingCategory._object = (void *)0xE900000000000072;
}

Swift::String *kmLoggingCategory.unsafeMutableAddressor()
{
  if (one-time initialization token for kmLoggingCategory != -1)
    swift_once();
  return &kmLoggingCategory;
}

uint64_t one-time initialization function for kmLog()
{
  uint64_t result;

  type metadata accessor for OS_os_log();
  if (one-time initialization token for kmLoggingCategory != -1)
    swift_once();
  swift_bridgeObjectRetain();
  result = OS_os_log.init(subsystem:category:)();
  static OS_os_log.kmLog = result;
  return result;
}

uint64_t *OS_os_log.kmLog.unsafeMutableAddressor()
{
  if (one-time initialization token for kmLog != -1)
    swift_once();
  return &static OS_os_log.kmLog;
}

id static OS_os_log.kmLog.getter()
{
  if (one-time initialization token for kmLog != -1)
    swift_once();
  return (id)static OS_os_log.kmLog;
}

uint64_t one-time initialization function for Log()
{
  uint64_t v0;
  id v1;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, Log);
  __swift_project_value_buffer(v0, (uint64_t)Log);
  if (one-time initialization token for kmLog != -1)
    swift_once();
  v1 = (id)static OS_os_log.kmLog;
  return Logger.init(_:)();
}

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id ___getCustomVocabularyMap_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE81080];
  v4 = a3;
  objc_msgSend(v3, "aceObjectArrayWithDictionaryArray:baseClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void KMLogInit()
{
  if (KMLogInit_onceToken != -1)
    dispatch_once(&KMLogInit_onceToken, &__block_literal_global_130);
}

id _sharedQueue()
{
  if (_sharedQueue_onceToken != -1)
    dispatch_once(&_sharedQueue_onceToken, &__block_literal_global_161);
  return (id)_sharedQueue_sharedQueue;
}

void ___sharedQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("KMProviderHistoryLog", v2);
  v1 = (void *)_sharedQueue_sharedQueue;
  _sharedQueue_sharedQueue = (uint64_t)v0;

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_218846B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__225(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__226(uint64_t a1)
{

}

void sub_218847B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__445(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__446(uint64_t a1)
{

}

uint64_t _isDefaultLabel(void *a1)
{
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  v3 = objc_msgSend(CFSTR("_$!<"), "length");
  if (v2 >= objc_msgSend(CFSTR(">!$_"), "length") + v3 && objc_msgSend(v1, "hasPrefix:", CFSTR("_$!<")))
    v4 = objc_msgSend(v1, "hasSuffix:", CFSTR(">!$_"));
  else
    v4 = 0;

  return v4;
}

void KMMapperSetBuilderError(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BDD1398];
  v8[0] = *MEMORY[0x24BDD0BA0];
  v8[1] = v3;
  v9[0] = CFSTR("Encountered error building item");
  v9[1] = a2;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a2;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.koa.mapper"), 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  KVSetError();
}

void sub_21884A39C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a20, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__858(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__859(uint64_t a1)
{

}

void sub_21884BEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21884C10C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getHMMutableHomeManagerConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HomeKitLibrary();
  result = objc_getClass("HMMutableHomeManagerConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHMMutableHomeManagerConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__getHMHomeManagerClass_block_invoke(v3);
  }
  return result;
}

void __getHMHomeManagerClass_block_invoke(uint64_t a1)
{
  HomeKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HMHomeManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHMHomeManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    HomeKitLibrary();
  }
}

void HomeKitLibrary()
{
  void *v0;

  if (!HomeKitLibraryCore_frameworkLibrary)
  {
    HomeKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!HomeKitLibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

void sub_21884DDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1393(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1394(uint64_t a1)
{

}

void sub_218851C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1662(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1663(uint64_t a1)
{

}

void sub_218852D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1855(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1856(uint64_t a1)
{

}

uint64_t CAFObserved<>.observable.getter()
{
  return MEMORY[0x24BE0FFE8]();
}

uint64_t dispatch thunk of CAFCarObservable.$media.getter()
{
  return MEMORY[0x24BE0FFF0]();
}

uint64_t dispatch thunk of CAFCarManagerObservable.$currentCar.getter()
{
  return MEMORY[0x24BE10048]();
}

uint64_t dispatch thunk of CAFMediaSourceObservable.mediaSourceSemanticType.getter()
{
  return MEMORY[0x24BE10058]();
}

uint64_t dispatch thunk of CAFMediaSourceObservable.$mediaItems.getter()
{
  return MEMORY[0x24BE10060]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t CachingSyncDeviceProvider.__allocating_init()()
{
  return MEMORY[0x24BE92DA8]();
}

uint64_t type metadata accessor for CachingSyncDeviceProvider()
{
  return MEMORY[0x24BE92DB0]();
}

uint64_t UsoEntity_common_RadioBand.DefinedValues.rawValue.getter()
{
  return MEMORY[0x24BEA0A80]();
}

uint64_t type metadata accessor for UsoEntity_common_RadioBand.DefinedValues()
{
  return MEMORY[0x24BEA0A88]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t AnyCancellable.store(in:)()
{
  return MEMORY[0x24BDB9B40]();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
  MEMORY[0x24BDB9B50]();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t Publisher.compactMap<A>(_:)()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t Publisher.map<A>(_:)()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t Publisher.filter(_:)()
{
  return MEMORY[0x24BDBA030]();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE0610]();
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

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t Float.description.getter()
{
  return MEMORY[0x24BEE1488]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return MEMORY[0x24BEE5918]();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t CAFMediaSourceSemanticType.description.getter()
{
  return MEMORY[0x24BE100F8]();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE5BB8](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t Optional.debugDescription.getter()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE24D0]();
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

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x24BEE2E58](isUnique, capacity);
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
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

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x24BEE4300](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x24BE08DA8]();
}

uint64_t AFKeyboardLMLocaleOverride()
{
  return MEMORY[0x24BE08DD0]();
}

uint64_t AFKeyboardResourcesDirectoryPath()
{
  return MEMORY[0x24BE08DD8]();
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x24BDBBA88](bundle, resourceName, resourceType, subDirName, localizationName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t KVAdditionalFieldTypeToNumber()
{
  return MEMORY[0x24BE5E820]();
}

uint64_t KVFieldTypeDescription()
{
  return MEMORY[0x24BE5E828]();
}

uint64_t KVFieldTypeFromNumber()
{
  return MEMORY[0x24BE5E838]();
}

uint64_t KVFieldTypeToNumber()
{
  return MEMORY[0x24BE5E848]();
}

uint64_t KVHash64String()
{
  return MEMORY[0x24BE5E850]();
}

uint64_t KVSetError()
{
  return MEMORY[0x24BE5E8B0]();
}

uint64_t LMLanguageModelCreate()
{
  return MEMORY[0x24BE5EB50]();
}

uint64_t LMLanguageModelCreateStringForTokenID()
{
  return MEMORY[0x24BE5EB60]();
}

uint64_t LMLanguageModelEnumerateDynamicTokensWithBlock()
{
  return MEMORY[0x24BE5EB78]();
}

uint64_t LMLanguageModelGetDynamicTokenIDRange()
{
  return MEMORY[0x24BE5EB90]();
}

uint64_t LMLanguageModelGetUsageCount()
{
  return MEMORY[0x24BE5EBB8]();
}

uint64_t LMLanguageModelRelease()
{
  return MEMORY[0x24BE5EBE8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x24BDBCF80]();
}

uint64_t _CFBundleFlushBundleCaches()
{
  return MEMORY[0x24BDBCF90]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x24BEE4F98]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x24BEE4FA0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x24BEE4FA8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

