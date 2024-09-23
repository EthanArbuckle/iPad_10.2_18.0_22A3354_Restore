uint64_t dispatch thunk of RunningBoardAppVisibilityMonitor._shouldHandleAppVisibilityUpdate(forBundleIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of RunningBoardAppVisibilityMonitor._handleAppVisibilityUpdate(forBundleIdentifier:applicationType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t sub_1ACF23240()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in RunningBoardAppVisibilityMonitor.init(appPolicyManager:applicationController:)(uint64_t a1, uint64_t a2, void *a3)
{
  return closure #1 in closure #1 in RunningBoardAppVisibilityMonitor.init(appPolicyManager:applicationController:)(a1, a2, a3);
}

id static NSBundle.copresenceCore.getter()
{
  uint64_t ObjCClassFromMetadata;

  type metadata accessor for ConversationManagerHost();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  return objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
}

id CPDisplayCloneStateObserver.isCloned.getter()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + OBJC_IVAR____TtC14CopresenceCore27CPDisplayCloneStateObserver_display);
  if (result)
    return objc_msgSend(result, sel_isCloned);
  return result;
}

uint64_t CPDisplayCloneStateObserver.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC14CopresenceCore27CPDisplayCloneStateObserver_delegate;
  swift_beginAccess();
  return MEMORY[0x1AF449918](v1);
}

uint64_t CPDisplayCloneStateObserver.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC14CopresenceCore27CPDisplayCloneStateObserver_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*CPDisplayCloneStateObserver.delegate.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC14CopresenceCore27CPDisplayCloneStateObserver_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1AF449918](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return ActivitySession.sessionManager.modify;
}

id CPDisplayCloneStateObserver.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void *CPDisplayCloneStateObserver.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  char *v8;
  void *v9;
  void *v10;
  char *v11;
  id v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  objc_super v19;

  *(_QWORD *)&v0[OBJC_IVAR____TtC14CopresenceCore27CPDisplayCloneStateObserver_observation] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC14CopresenceCore27CPDisplayCloneStateObserver_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v1 = one-time initialization token for default;
  v2 = v0;
  if (v1 != -1)
    swift_once();
  v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)static Log.default);
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1ACCCC000, v4, v5, "Initializing CPDisplayCloneStateObserver", v6, 2u);
    MEMORY[0x1AF44981C](v6, -1, -1);
  }

  v7 = objc_msgSend((id)objc_opt_self(), sel_mainDisplay);
  *(_QWORD *)&v2[OBJC_IVAR____TtC14CopresenceCore27CPDisplayCloneStateObserver_display] = v7;

  v19.receiver = v2;
  v19.super_class = (Class)type metadata accessor for CPDisplayCloneStateObserver();
  v8 = (char *)objc_msgSendSuper2(&v19, sel_init);
  v9 = v8;
  v10 = *(void **)&v8[OBJC_IVAR____TtC14CopresenceCore27CPDisplayCloneStateObserver_display];
  if (v10)
  {
    swift_getKeyPath();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    v11 = v9;
    v12 = v10;
    v13 = _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();

    swift_release();
    swift_release();

    v14 = *(char **)&v11[OBJC_IVAR____TtC14CopresenceCore27CPDisplayCloneStateObserver_observation];
    *(_QWORD *)&v11[OBJC_IVAR____TtC14CopresenceCore27CPDisplayCloneStateObserver_observation] = v13;
  }
  else
  {
    v14 = v8;
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1ACCCC000, v15, v16, "No display available. isCloned will be false", v17, 2u);
      MEMORY[0x1AF44981C](v17, -1, -1);
    }

  }
  return v9;
}

uint64_t type metadata accessor for CPDisplayCloneStateObserver()
{
  return objc_opt_self();
}

void closure #1 in CPDisplayCloneStateObserver.init()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  _QWORD *v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  char v16;

  v3 = a3 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1AF449918](v3);
  if (v4)
  {
    v5 = (void *)v4;
    if (one-time initialization token for default != -1)
      swift_once();
    v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)static Log.default);
    v7 = v5;
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.default.getter();
    v10 = os_log_type_enabled(v8, v9);
    v11 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    if (v10)
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v12 = 67109120;
      (*(uint64_t (**)(void))((*v11 & (uint64_t)v7->isa) + 0x68))();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl(&dword_1ACCCC000, v8, v9, "Display cloned state changed to: %{BOOL}d", v12, 8u);
      MEMORY[0x1AF44981C](v12, -1, -1);
    }
    else
    {

      v8 = v7;
    }

    if ((*(uint64_t (**)(void))((*v11 & (uint64_t)v7->isa) + 0x88))())
    {
      v14 = v13;
      ObjectType = swift_getObjectType();
      v16 = (*(uint64_t (**)(void))((*v11 & (uint64_t)v7->isa) + 0x68))();
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v14 + 8))(v16 & 1, ObjectType, v14);
      swift_unknownObjectRelease();
    }

  }
}

id CPDisplayCloneStateObserver.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CPDisplayCloneStateObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t protocol witness for CPDisplayCloneStateObserverProtocol.delegate.setter in conformance CPDisplayCloneStateObserver()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

void (*protocol witness for CPDisplayCloneStateObserverProtocol.delegate.modify in conformance CPDisplayCloneStateObserver(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x98))();
  return protocol witness for PresenceDataSource.members.modify in conformance SKPresenceDataSource<A>;
}

char *keypath_get_selector_isCloned()
{
  return sel_isCloned;
}

id sub_1ACF239C4@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isCloned);
  *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_1ACF239F4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void partial apply for closure #1 in CPDisplayCloneStateObserver.init()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  closure #1 in CPDisplayCloneStateObserver.init()(a1, a2, v2);
}

uint64_t sub_1ACF23A20@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x88))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1ACF23A60(uint64_t a1, _QWORD **a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x90);
  v4 = swift_unknownObjectRetain();
  return v3(v4, v2);
}

uint64_t dispatch thunk of CPDisplayCloneStateObserverDelegate.clonedStateChanged(isCloned:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of CPDisplayCloneStateObserverProtocol.isCloned.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CPDisplayCloneStateObserverProtocol.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CPDisplayCloneStateObserverProtocol.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of CPDisplayCloneStateObserverProtocol.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t method lookup function for CPDisplayCloneStateObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CPDisplayCloneStateObserver.isCloned.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CPDisplayCloneStateObserver.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CPDisplayCloneStateObserver.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CPDisplayCloneStateObserver.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

void one-time initialization function for appleTVBundleIDs()
{
  static BundleIdentiferMap.appleTVBundleIDs = (uint64_t)&outlined read-only object #0 of one-time initialization function for appleTVBundleIDs;
}

void one-time initialization function for musicBundleIDs()
{
  static BundleIdentiferMap.musicBundleIDs = (uint64_t)&outlined read-only object #0 of one-time initialization function for musicBundleIDs;
}

void one-time initialization function for notesBundleIDs()
{
  static BundleIdentiferMap.notesBundleIDs = (uint64_t)&outlined read-only object #0 of one-time initialization function for notesBundleIDs;
}

BOOL specialized static BundleIdentiferMap.areEquivalentBundleIDs(bundleID:otherBundleID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL8 result;
  _QWORD *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  const char *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;

  result = (a2 | a4) == 0;
  if (a2 && a4)
  {
    if (a1 == a3 && a2 == a4 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      return 1;
    if (one-time initialization token for appleTVBundleIDs != -1)
      swift_once();
    v9 = (_QWORD *)static BundleIdentiferMap.appleTVBundleIDs;
    if ((specialized Sequence<>.contains(_:)(a1, a2, (_QWORD *)static BundleIdentiferMap.appleTVBundleIDs) & 1) != 0
      && (specialized Sequence<>.contains(_:)(a3, a4, v9) & 1) != 0)
    {
      if (one-time initialization token for default != -1)
        swift_once();
      v10 = type metadata accessor for Logger();
      __swift_project_value_buffer(v10, (uint64_t)static Log.default);
      v11 = Logger.logObject.getter();
      v12 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v11, v12))
        goto LABEL_31;
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      v14 = "Found equivalent apple tv BundleID";
    }
    else
    {
      if (one-time initialization token for musicBundleIDs != -1)
        swift_once();
      v15 = (_QWORD *)static BundleIdentiferMap.musicBundleIDs;
      if ((specialized Sequence<>.contains(_:)(a1, a2, (_QWORD *)static BundleIdentiferMap.musicBundleIDs) & 1) != 0
        && (specialized Sequence<>.contains(_:)(a3, a4, v15) & 1) != 0)
      {
        if (one-time initialization token for default != -1)
          swift_once();
        v16 = type metadata accessor for Logger();
        __swift_project_value_buffer(v16, (uint64_t)static Log.default);
        v11 = Logger.logObject.getter();
        v12 = static os_log_type_t.info.getter();
        if (!os_log_type_enabled(v11, v12))
          goto LABEL_31;
        v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v13 = 0;
        v14 = "Found equivalent music BundleID";
      }
      else
      {
        if (one-time initialization token for notesBundleIDs != -1)
          swift_once();
        v17 = (_QWORD *)static BundleIdentiferMap.notesBundleIDs;
        if ((specialized Sequence<>.contains(_:)(a1, a2, (_QWORD *)static BundleIdentiferMap.notesBundleIDs) & 1) == 0
          || (specialized Sequence<>.contains(_:)(a3, a4, v17) & 1) == 0)
        {
          return 0;
        }
        if (one-time initialization token for default != -1)
          swift_once();
        v18 = type metadata accessor for Logger();
        __swift_project_value_buffer(v18, (uint64_t)static Log.default);
        v11 = Logger.logObject.getter();
        v12 = static os_log_type_t.info.getter();
        if (!os_log_type_enabled(v11, v12))
          goto LABEL_31;
        v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v13 = 0;
        v14 = "Found equivalent notes BundleID";
      }
    }
    _os_log_impl(&dword_1ACCCC000, v11, v12, v14, v13, 2u);
    MEMORY[0x1AF44981C](v13, -1, -1);
LABEL_31:

    return 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for BundleIdentiferMap()
{
  return &type metadata for BundleIdentiferMap;
}

uint64_t PresenceController.__allocating_init(activityID:personalPresenceController:)(char *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = specialized PresenceController.__allocating_init(activityID:personalPresenceController:)(a1, a2);
  swift_release();
  return v2;
}

uint64_t PresenceController.members.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(v0 + 24);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 40))(ObjectType, v1);
}

uint64_t PresenceController.members.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + 24);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, ObjectType, v3);
}

uint64_t (*PresenceController.members.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 24);
  a1[1] = *(_QWORD *)(v1 + 16);
  a1[2] = v3;
  a1[3] = swift_getObjectType();
  *a1 = (*(uint64_t (**)(void))(v3 + 40))();
  return PresenceController.members.modify;
}

uint64_t PresenceController.members.modify(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;

  v2 = a1[2];
  v3 = a1[3];
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if ((a2 & 1) == 0)
    return v4(*a1, v3, v2);
  v5 = swift_bridgeObjectRetain();
  v4(v5, v3, v2);
  return swift_bridgeObjectRelease();
}

uint64_t key path setter for PresenceController.presentDevices : PresenceController()
{
  swift_bridgeObjectRetain();
  swift_retain();
  CurrentValueSubject.send(_:)();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t PresenceController.presentDevices.getter()
{
  uint64_t v1;

  swift_retain();
  CurrentValueSubject.value.getter();
  swift_release();
  return v1;
}

uint64_t PresenceController.$presentDevices.getter()
{
  return swift_retain();
}

uint64_t PresenceController.cancellables.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t PresenceController.cancellables.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 40) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*PresenceController.cancellables.modify())()
{
  swift_beginAccess();
  return ActivitySession.audioSessionID.modify;
}

uint64_t PresenceController.__allocating_init<A>(dataSource:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  PresenceController.init<A>(dataSource:)(a1, a2, a3, a4);
  return v8;
}

_QWORD *PresenceController.init<A>(dataSource:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t ObjectType;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v17 = a3;
  v18 = a4;
  v20 = a3;
  swift_getExtendedExistentialTypeMetadata();
  type metadata accessor for Array();
  v7 = type metadata accessor for AnyPublisher();
  v16[1] = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [PresentDevice]);
  v16[0] = MEMORY[0x1AF44972C](MEMORY[0x1E0C95D90], v7);
  v8 = type metadata accessor for Publishers.Map();
  v19 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v16 - v9;
  v20 = MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CurrentValueSubject<[PresentDevice], Never>);
  swift_allocObject();
  v4[4] = CurrentValueSubject.init(_:)();
  v4[5] = MEMORY[0x1E0DEE9E8];
  ObjectType = swift_getObjectType();
  v4[2] = a1;
  v4[3] = a2;
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 24);
  swift_unknownObjectRetain();
  v20 = v12(ObjectType, a2);
  v13 = swift_allocObject();
  v14 = v18;
  *(_QWORD *)(v13 + 16) = v17;
  *(_QWORD *)(v13 + 24) = v14;
  Publisher.map<A>(_:)();
  swift_release();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  MEMORY[0x1AF44972C](MEMORY[0x1E0C95950], v8);
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v10, v8);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t closure #1 in PresenceController.init<A>(dataSource:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[8];

  v10[7] = *a1;
  v10[2] = a2;
  v10[3] = a3;
  v10[5] = a2;
  swift_getExtendedExistentialTypeMetadata();
  v5 = type metadata accessor for Array();
  v6 = (char *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PresentDevice);
  v7 = MEMORY[0x1AF44972C](MEMORY[0x1E0DEAF50], v5);
  result = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in closure #1 in PresenceController.init<A>(dataSource:), (uint64_t)v10, v5, v6, MEMORY[0x1E0DEDCE8], v7, MEMORY[0x1E0DEDD18], v8);
  *a4 = result;
  return result;
}

uint64_t closure #2 in PresenceController.init<A>(dataSource:)()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    CurrentValueSubject.send(_:)();
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t PresenceController.assertPresence()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  _QWORD *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24);
  ObjectType = swift_getObjectType();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v3;
  *v3 = v0;
  v3[1] = PersonalPresenceDataSource.assertPresence(using:);
  return PresenceDataSource.assertPresence()(ObjectType, v1);
}

uint64_t PresenceController.releasePresence()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24);
  ObjectType = swift_getObjectType();
  v5 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v1 + 72) + *(_QWORD *)(v1 + 72));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v3;
  *v3 = v0;
  v3[1] = PersonalPresenceDataSource.releasePresence();
  return v5(ObjectType, v1);
}

uint64_t PresenceController.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PresenceController.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t specialized PresenceController.__allocating_init(activityID:personalPresenceController:)(char *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t, ValueMetadata *, unint64_t);
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v34 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v30 - v8;
  if (one-time initialization token for service != -1)
    swift_once();
  v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Log.service);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11(v9, (uint64_t)a1, v4);
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v31 = v11;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc();
    v32 = a2;
    v17 = v16;
    v37 = v16;
    v33 = a1;
    *(_DWORD *)v15 = 136315138;
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
    v18 = dispatch thunk of CustomStringConvertible.description.getter();
    v36 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v19, &v37);
    a1 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v20 = *(void (**)(char *, uint64_t))(v5 + 8);
    v20(v9, v4);
    _os_log_impl(&dword_1ACCCC000, v12, v13, "Creating multiplexed presence controller for me-to-me session with identifier: %s", v15, 0xCu);
    swift_arrayDestroy();
    v21 = v17;
    a2 = v32;
    MEMORY[0x1AF44981C](v21, -1, -1);
    v22 = v15;
    v11 = v31;
    MEMORY[0x1AF44981C](v22, -1, -1);
  }
  else
  {
    v20 = *(void (**)(char *, uint64_t))(v5 + 8);
    v20(v9, v4);
  }

  v23 = (uint64_t)v34;
  v11(v34, (uint64_t)a1, v4);
  type metadata accessor for PersonalPresenceDataSource(0);
  swift_allocObject();
  swift_retain();
  v24 = specialized PersonalPresenceDataSource.init(activityID:personalPresenceController:)(v23, a2);
  swift_release();
  v25 = lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type PersonalPresenceDataSource and conformance PersonalPresenceDataSource, type metadata accessor for PersonalPresenceDataSource, (uint64_t)&protocol conformance descriptor for PersonalPresenceDataSource);
  v26 = *(uint64_t (**)(uint64_t, uint64_t, ValueMetadata *, unint64_t))(v35 + 184);
  v27 = lazy protocol witness table accessor for type EmptyPresenceContext and conformance EmptyPresenceContext();
  v28 = v26(v24, v25, &type metadata for EmptyPresenceContext, v27);
  v20(a1, v4);
  return v28;
}

uint64_t sub_1ACF24A38()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in PresenceController.init<A>(dataSource:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return closure #1 in PresenceController.init<A>(dataSource:)(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_1ACF24A50()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1ACF24A74@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 104))();
  *a2 = result;
  return result;
}

uint64_t sub_1ACF24AA4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 112);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_1ACF24AD4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 128))();
  *a2 = result;
  return result;
}

uint64_t sub_1ACF24B08@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 160))();
  *a2 = result;
  return result;
}

uint64_t sub_1ACF24B38(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 168);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t type metadata accessor for PresenceController()
{
  return objc_opt_self();
}

uint64_t method lookup function for PresenceController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PresenceController.members.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of PresenceController.members.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of PresenceController.members.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of PresenceController.presentDevices.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of PresenceController.$presentDevices.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of PresenceController.cancellables.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of PresenceController.cancellables.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of PresenceController.cancellables.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of PresenceController.__allocating_init<A>(dataSource:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of PresenceController.assertPresence()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 192) + *(_QWORD *)(*(_QWORD *)v0 + 192));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = partial apply for closure #1 in closure #1 in AsyncSerialQueue.performAndWaitFor<A>(_:);
  return v4();
}

uint64_t dispatch thunk of PresenceController.releasePresence()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 200) + *(_QWORD *)(*(_QWORD *)v0 + 200));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATQ0_;
  return v4();
}

uint64_t partial apply for closure #1 in closure #1 in PresenceController.init<A>(dataSource:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t *boxed_opaque_existential_1;
  __int128 v7;

  v7 = *(_OWORD *)(a1 + 3);
  v3 = a1[3];
  v4 = __swift_project_boxed_opaque_existential_1(a1, v3);
  *(_OWORD *)(a2 + 24) = v7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a2);
  return (*(uint64_t (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(boxed_opaque_existential_1, v4, v3);
}

void specialized Sequence.compactMap<A>(_:)(uint64_t a1, SEL *a2)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  id v14;
  unint64_t v15;
  int64_t v16;
  id v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;

  v3 = a1;
  v27 = MEMORY[0x1E0DEE9D8];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
    lazy protocol witness table accessor for type TUConversationActivitySession and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type TUConversationMember and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
    Set.Iterator.init(_cocoa:)();
    v3 = v22;
    v20 = v23;
    v4 = v24;
    v5 = v25;
    v6 = v26;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v20 = a1 + 56;
    v4 = ~v7;
    v8 = -v7;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v6 = v9 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v5 = 0;
  }
  v19 = v4;
  v10 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!__CocoaSet.Iterator.next()())
      goto LABEL_36;
    type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v14 = v21;
    swift_unknownObjectRelease();
    v13 = v5;
    v11 = v6;
    if (!v21)
      goto LABEL_36;
LABEL_26:
    v17 = objc_msgSend(v14, *a2, v19);

    v5 = v13;
    v6 = v11;
    if (v17)
    {
      MEMORY[0x1AF448268]();
      if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      v5 = v13;
      v6 = v11;
    }
  }
  if (v6)
  {
    v11 = (v6 - 1) & v6;
    v12 = __clz(__rbit64(v6)) | (v5 << 6);
    v13 = v5;
LABEL_25:
    v14 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v12);
    if (!v14)
      goto LABEL_36;
    goto LABEL_26;
  }
  v13 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v13 >= v10)
      goto LABEL_36;
    v15 = *(_QWORD *)(v20 + 8 * v13);
    if (!v15)
    {
      v16 = v5 + 2;
      if (v5 + 2 >= v10)
        goto LABEL_36;
      v15 = *(_QWORD *)(v20 + 8 * v16);
      if (v15)
        goto LABEL_23;
      v16 = v5 + 3;
      if (v5 + 3 >= v10)
        goto LABEL_36;
      v15 = *(_QWORD *)(v20 + 8 * v16);
      if (v15)
        goto LABEL_23;
      v16 = v5 + 4;
      if (v5 + 4 >= v10)
        goto LABEL_36;
      v15 = *(_QWORD *)(v20 + 8 * v16);
      if (v15)
      {
LABEL_23:
        v13 = v16;
      }
      else
      {
        v13 = v5 + 5;
        if (v5 + 5 >= v10)
          goto LABEL_36;
        v15 = *(_QWORD *)(v20 + 8 * v13);
        if (!v15)
        {
          v18 = v5 + 6;
          while (v10 != v18)
          {
            v15 = *(_QWORD *)(v20 + 8 * v18++);
            if (v15)
            {
              v13 = v18 - 1;
              goto LABEL_24;
            }
          }
LABEL_36:
          outlined consume of [String : ()].Iterator._Variant();
          return;
        }
      }
    }
LABEL_24:
    v11 = (v15 - 1) & v15;
    v12 = __clz(__rbit64(v15)) + (v13 << 6);
    goto LABEL_25;
  }
  __break(1u);
}

void specialized Sequence.contains(where:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  unsigned __int8 v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
    lazy protocol witness table accessor for type TUConversationActivitySession and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type TUConversationMember and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
    Set.Iterator.init(_cocoa:)();
    v1 = v18;
    v17 = v19;
    v2 = v20;
    v3 = v21;
    v4 = v22;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v17 = a1 + 56;
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v3 = 0;
  }
  v16 = (unint64_t)(v2 + 64) >> 6;
  while (1)
  {
    v12 = v3;
    if ((v1 & 0x8000000000000000) == 0)
      break;
    if (!__CocoaSet.Iterator.next()())
      goto LABEL_31;
    type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v10 = v23;
    swift_unknownObjectRelease();
    if (!v23)
      goto LABEL_31;
LABEL_10:
    v11 = objc_msgSend(v10, sel_isValidated);

    if ((v11 & 1) == 0)
      goto LABEL_31;
  }
  if (v4)
  {
    v8 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    v9 = v8 | (v3 << 6);
LABEL_9:
    v10 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v9);
    if (!v10)
      goto LABEL_31;
    goto LABEL_10;
  }
  v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v16)
      goto LABEL_31;
    v14 = *(_QWORD *)(v17 + 8 * v13);
    ++v3;
    if (!v14)
    {
      v3 = v12 + 2;
      if (v12 + 2 >= v16)
        goto LABEL_31;
      v14 = *(_QWORD *)(v17 + 8 * v3);
      if (!v14)
      {
        v3 = v12 + 3;
        if (v12 + 3 >= v16)
          goto LABEL_31;
        v14 = *(_QWORD *)(v17 + 8 * v3);
        if (!v14)
        {
          v3 = v12 + 4;
          if (v12 + 4 >= v16)
            goto LABEL_31;
          v14 = *(_QWORD *)(v17 + 8 * v3);
          if (!v14)
          {
            v3 = v12 + 5;
            if (v12 + 5 >= v16)
              goto LABEL_31;
            v14 = *(_QWORD *)(v17 + 8 * v3);
            if (!v14)
            {
              v15 = v12 + 6;
              while (v16 != v15)
              {
                v14 = *(_QWORD *)(v17 + 8 * v15++);
                if (v14)
                {
                  v3 = v15 - 1;
                  goto LABEL_28;
                }
              }
LABEL_31:
              outlined consume of [String : ()].Iterator._Variant();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v4 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v3 << 6);
    goto LABEL_9;
  }
  __break(1u);
}

double CPApplicationPolicyManager.Config.handleExpiryTimeout.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void CPApplicationPolicyManager.Config.handleExpiryTimeout.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*CPApplicationPolicyManager.Config.handleExpiryTimeout.modify())()
{
  return destructiveProjectEnumData for ActivitySession.Errors;
}

CopresenceCore::CPApplicationPolicyManager::Config __swiftcall CPApplicationPolicyManager.Config.init()()
{
  _QWORD *v0;
  CopresenceCore::CPApplicationPolicyManager::Config result;

  *v0 = 0x4143C68000000000;
  return result;
}

double default argument 0 of CPApplicationPolicyManager.Config.init(handleExpiryTimeout:)()
{
  return 2592000.0;
}

CopresenceCore::CPApplicationPolicyManager::Config __swiftcall CPApplicationPolicyManager.Config.init(handleExpiryTimeout:)(CopresenceCore::CPApplicationPolicyManager::Config handleExpiryTimeout)
{
  CopresenceCore::CPApplicationPolicyManager::Config *v1;

  v1->handleExpiryTimeout = handleExpiryTimeout.handleExpiryTimeout;
  return handleExpiryTimeout;
}

id closure #1 in variable initialization expression of static CPApplicationPolicyManager.shared()
{
  id v0;
  id v1;
  id v2;
  id v3;
  double v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_allocWithZone((Class)CPSharedConversationServerBag), sel_init);
  v5 = (double)(uint64_t)objc_msgSend(v0, sel_backgroundAppPolicyHandleExpiryDays) * 24.0 * 60.0 * 60.0;
  LOBYTE(v6) = 0;
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97298]), sel_init, *(_QWORD *)&v5, v6);
  v2 = objc_allocWithZone((Class)type metadata accessor for CPApplicationPolicyManager());
  v3 = CPApplicationPolicyManager.init(config:contactStore:featureFlags:)((uint64_t)&v5, v1, 0);

  return v3;
}

id CPApplicationPolicyManager.__allocating_init(config:contactStore:featureFlags:)(uint64_t a1, void *a2, void *a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return CPApplicationPolicyManager.init(config:contactStore:featureFlags:)(a1, a2, a3);
}

id static CPApplicationPolicyManager.shared.getter()
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return (id)static CPApplicationPolicyManager.shared;
}

uint64_t CPApplicationPolicyManager.authorizedBundleIdentifiers.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)((char *)v0 + OBJC_IVAR___CPApplicationPolicyManager_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v1 + 16));
  closure #1 in CPApplicationPolicyManager.authorizedBundleIdentifiers.getter(v0, &v3);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + 16));
  return v3;
}

id closure #1 in CPApplicationPolicyManager.authorizedBundleIdentifiers.getter@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id result;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;

  v4 = (_QWORD *)((char *)a1 + OBJC_IVAR___CPApplicationPolicyManager_storage);
  v5 = v4[3];
  v6 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v5);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String : Any]);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v7, v7, v5, v6);
  v9 = specialized Dictionary.compactMapValues<A>(_:)(v8);
  swift_bridgeObjectRelease();
  v10 = specialized _NativeDictionary.mapValues<A>(_:)(v9);
  swift_bridgeObjectRelease();
  result = objc_msgSend(*(id *)((char *)a1 + OBJC_IVAR___CPApplicationPolicyManager_featureFlags), sel_appProtectionEnabled);
  if ((_DWORD)result)
  {
    (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & *a1) + 0xD8))(v23);
    v12 = v24;
    if (v24)
    {
      v13 = v25;
      v14 = __swift_project_boxed_opaque_existential_1(v23, v24);
      v15 = *(_QWORD *)(v12 - 8);
      MEMORY[0x1E0C80A78](v14);
      v17 = (char *)&v23[-1] - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v15 + 16))(v17);
      outlined destroy of UUID?((uint64_t)v23, &demangling cache variable for type metadata for ProtectedAppsObserverProtocol?);
      v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 32))(v12, v13);
      v19 = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v12);
      MEMORY[0x1E0C80A78](v19);
      v21[2] = v18;
      v20 = specialized _NativeDictionary.filter(_:)((uint64_t)v10, (uint64_t)partial apply for closure #1 in closure #1 in closure #2 in closure #1 in CPApplicationPolicyManager.fetchAndProcessContactChangeHistory(), (uint64_t)v21, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t, uint64_t))specialized closure #1 in _NativeDictionary.filter(_:));
      swift_bridgeObjectRelease();
      result = (id)swift_release();
      v10 = (_QWORD *)v20;
    }
    else
    {
      result = (id)outlined destroy of UUID?((uint64_t)v23, &demangling cache variable for type metadata for ProtectedAppsObserverProtocol?);
    }
  }
  *a2 = v10;
  return result;
}

uint64_t closure #2 in closure #1 in CPApplicationPolicyManager.authorizedBundleIdentifiers.getter(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  char v9;
  uint64_t result;
  _QWORD *v11;
  uint64_t i;
  uint64_t v13;
  BOOL v14;

  v4 = a4[2];
  if (!v4)
    return 1;
  if (a4[4] == a1 && a4[5] == a2)
    return 0;
  v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  result = 0;
  if ((v9 & 1) == 0)
  {
    if (v4 == 1)
      return 1;
    v11 = a4 + 7;
    for (i = 1; ; ++i)
    {
      v13 = i + 1;
      if (__OFADD__(i, 1))
        break;
      v14 = *(v11 - 1) == a1 && *v11 == a2;
      if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        return 0;
      v11 += 2;
      result = 1;
      if (v13 == v4)
        return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t CPApplicationPolicyManager.autoSharePlayEnabled.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___CPApplicationPolicyManager_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v1 + 16));
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___CPApplicationPolicyManager_storage + 24);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR___CPApplicationPolicyManager_storage + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR___CPApplicationPolicyManager_storage), v2);
  (*(void (**)(uint64_t *__return_ptr, _QWORD, unint64_t, unint64_t, _QWORD, uint64_t, uint64_t))(v3 + 40))(&v5, MEMORY[0x1E0DEAFA0], 0xD00000000000001FLL, 0x80000001ACF7FE30, MEMORY[0x1E0DEAFA0], v2, v3);
  LOBYTE(v2) = (v5 == 2) | v5;
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + 16));
  return v2 & 1;
}

void CPApplicationPolicyManager.autoSharePlayEnabled.setter(char a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = v1;
  if (one-time initialization token for default != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Log.default);
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v5, v6, "[CPAppPolicyManager] set auto-SharePlay enabled %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v8, -1, -1);
    MEMORY[0x1AF44981C](v7, -1, -1);
  }

  v11 = *(_QWORD *)((char *)v2 + OBJC_IVAR___CPApplicationPolicyManager_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v11 + 16));
  closure #1 in CPApplicationPolicyManager.autoSharePlayEnabled.setter(v2, a1 & 1);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v11 + 16));
}

uint64_t closure #1 in CPApplicationPolicyManager.autoSharePlayEnabled.setter(_QWORD *a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t, uint64_t);
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  _QWORD *v33;
  void (*v34)(void (*)(void *), _QWORD *);
  _QWORD *v35;
  uint64_t v37;
  _BYTE v38[24];
  uint64_t v39;
  int64_t v40;

  v3 = (_QWORD *)((char *)a1 + OBJC_IVAR___CPApplicationPolicyManager_storage);
  v4 = *(_QWORD *)((char *)a1 + OBJC_IVAR___CPApplicationPolicyManager_storage + 24);
  v5 = *(_QWORD *)((char *)a1 + OBJC_IVAR___CPApplicationPolicyManager_storage + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)((char *)a1 + OBJC_IVAR___CPApplicationPolicyManager_storage), v4);
  v39 = MEMORY[0x1E0DEAFA0];
  v38[0] = a2;
  (*(void (**)(_BYTE *, unint64_t, unint64_t, uint64_t, uint64_t))(v5 + 8))(v38, 0xD00000000000001FLL, 0x80000001ACF7FE30, v4, v5);
  result = outlined destroy of UUID?((uint64_t)v38, (uint64_t *)&demangling cache variable for type metadata for Any?);
  if ((a2 & 1) != 0)
    return result;
  if (one-time initialization token for default != -1)
LABEL_33:
    swift_once();
  v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Log.default);
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1ACCCC000, v8, v9, "[CPAppPolicyManager] Disabling auto-SharePlay for all previously allowed apps", v10, 2u);
    MEMORY[0x1AF44981C](v10, -1, -1);
  }

  v11 = v3[3];
  v12 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v11);
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String : Any]);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v13, v13, v11, v12);
  v15 = specialized Dictionary.compactMapValues<A>(_:)(v14);
  result = swift_bridgeObjectRelease();
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 1 << *(_BYTE *)(v15 + 32);
  v20 = -1;
  if (v19 < 64)
    v20 = ~(-1 << v19);
  v37 = v15 + 64;
  v21 = v20 & *(_QWORD *)(v15 + 64);
  v40 = (unint64_t)(v19 + 63) >> 6;
  while (1)
  {
    if (v21)
    {
      v22 = __clz(__rbit64(v21));
      v21 &= v21 - 1;
      v23 = v22 | (v18 << 6);
      goto LABEL_9;
    }
    v29 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v29 >= v40)
    {
LABEL_29:
      result = swift_release();
      if (v17)
      {
        v32 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *a1) + 0xC0))(result);
        v33 = (_QWORD *)swift_allocObject();
        v33[2] = a1;
        v33[3] = v16;
        v33[4] = v17;
        v34 = *(void (**)(void (*)(void *), _QWORD *))(*(_QWORD *)v32 + 152);
        v35 = a1;
        v34(partial apply for closure #1 in closure #1 in CPApplicationPolicyManager.autoSharePlayEnabled.setter, v33);
        swift_release();
        return swift_release();
      }
      return result;
    }
    v30 = *(_QWORD *)(v37 + 8 * v29);
    ++v18;
    if (!v30)
    {
      v18 = v29 + 1;
      if (v29 + 1 >= v40)
        goto LABEL_29;
      v30 = *(_QWORD *)(v37 + 8 * v18);
      if (!v30)
      {
        v18 = v29 + 2;
        if (v29 + 2 >= v40)
          goto LABEL_29;
        v30 = *(_QWORD *)(v37 + 8 * v18);
        if (!v30)
        {
          v18 = v29 + 3;
          if (v29 + 3 >= v40)
            goto LABEL_29;
          v30 = *(_QWORD *)(v37 + 8 * v18);
          if (!v30)
          {
            v18 = v29 + 4;
            if (v29 + 4 >= v40)
              goto LABEL_29;
            v30 = *(_QWORD *)(v37 + 8 * v18);
            if (!v30)
              break;
          }
        }
      }
    }
LABEL_28:
    v21 = (v30 - 1) & v30;
    v23 = __clz(__rbit64(v30)) + (v18 << 6);
LABEL_9:
    v24 = (uint64_t *)(*(_QWORD *)(v15 + 48) + 16 * v23);
    v16 = *v24;
    v25 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v26 = v3[3];
    v27 = v3[4];
    __swift_project_boxed_opaque_existential_1(v3, v26);
    v28 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 24);
    swift_bridgeObjectRetain();
    v28(v16, v25, v26, v27);
    result = swift_bridgeObjectRelease();
    v17 = v25;
  }
  v31 = v29 + 5;
  if (v31 >= v40)
    goto LABEL_29;
  v30 = *(_QWORD *)(v37 + 8 * v31);
  if (v30)
  {
    v18 = v31;
    goto LABEL_28;
  }
  while (1)
  {
    v18 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v18 >= v40)
      goto LABEL_29;
    v30 = *(_QWORD *)(v37 + 8 * v18);
    ++v31;
    if (v30)
      goto LABEL_28;
  }
  __break(1u);
  return result;
}

void (*CPApplicationPolicyManager.autoSharePlayEnabled.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  *(_QWORD *)a1 = v1;
  v3 = *(_QWORD *)(v1 + OBJC_IVAR___CPApplicationPolicyManager_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v3 + 16));
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___CPApplicationPolicyManager_storage + 24);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR___CPApplicationPolicyManager_storage + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR___CPApplicationPolicyManager_storage), v4);
  (*(void (**)(_QWORD, unint64_t, unint64_t, _QWORD, uint64_t, uint64_t))(v5 + 40))(MEMORY[0x1E0DEAFA0], 0xD00000000000001FLL, 0x80000001ACF7FE30, MEMORY[0x1E0DEAFA0], v4, v5);
  v6 = (*(_BYTE *)(a1 + 9) == 2) | *(_BYTE *)(a1 + 9);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v3 + 16));
  *(_BYTE *)(a1 + 8) = v6 & 1;
  return CPApplicationPolicyManager.autoSharePlayEnabled.modify;
}

void CPApplicationPolicyManager.autoSharePlayEnabled.modify(uint64_t a1)
{
  CPApplicationPolicyManager.autoSharePlayEnabled.setter(*(_BYTE *)(a1 + 8));
}

uint64_t static CPApplicationPolicyManager.InputError.== infix(_:_:)()
{
  return 1;
}

void CPApplicationPolicyManager.InputError.hash(into:)()
{
  Hasher._combine(_:)(0);
}

Swift::Int CPApplicationPolicyManager.InputError.hashValue.getter()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t CPApplicationPolicyManager.storage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of UserNotificationCenter(v1 + OBJC_IVAR___CPApplicationPolicyManager_storage, a1);
}

double CPApplicationPolicyManager.config.getter@<D0>(double *a1@<X8>)
{
  uint64_t v1;
  double result;

  result = *(double *)(v1 + OBJC_IVAR___CPApplicationPolicyManager_config);
  *a1 = result;
  return result;
}

uint64_t CPApplicationPolicyManager.lock.getter()
{
  return swift_retain();
}

id CPApplicationPolicyManager.queue.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___CPApplicationPolicyManager_queue);
}

uint64_t CPApplicationPolicyManager.delegates.getter()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t CPApplicationPolicyManager.delegates.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___CPApplicationPolicyManager_delegates);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*CPApplicationPolicyManager.delegates.modify())()
{
  swift_beginAccess();
  return ActivitySession.terminatingHandle.modify;
}

uint64_t CPApplicationPolicyManager.contactStore.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t CPApplicationPolicyManager.featureFlags.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t CPApplicationPolicyManager.protectedAppsObserver.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR___CPApplicationPolicyManager_protectedAppsObserver;
  swift_beginAccess();
  return outlined init with copy of ActivitySession.DomainAssertionWrapper?(v3, a1, &demangling cache variable for type metadata for ProtectedAppsObserverProtocol?);
}

uint64_t CPApplicationPolicyManager.protectedAppsObserver.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR___CPApplicationPolicyManager_protectedAppsObserver;
  swift_beginAccess();
  outlined assign with take of ProtectedAppsObserverProtocol?(a1, v3);
  return swift_endAccess();
}

uint64_t (*CPApplicationPolicyManager.protectedAppsObserver.modify())()
{
  swift_beginAccess();
  return ActivitySession.audioSessionID.modify;
}

id closure #1 in variable initialization expression of CPApplicationPolicyManager.contactsDataSourceCreationBlock(uint64_t a1)
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97298]), sel_initWithConfiguration_, a1);
}

uint64_t key path setter for CPApplicationPolicyManager.contactsDataSourceCreationBlock : CPApplicationPolicyManager(uint64_t *a1, _QWORD **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t (*)(uint64_t), uint64_t);

  v3 = *a1;
  v4 = a1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v3;
  *(_QWORD *)(v5 + 24) = v4;
  v6 = *(uint64_t (**)(uint64_t (*)(uint64_t), uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xF8);
  swift_retain();
  return v6(partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed CNContactStoreConfiguration) -> (@out TUContactsDataSource), v5);
}

uint64_t CPApplicationPolicyManager.contactsDataSourceCreationBlock.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___CPApplicationPolicyManager_contactsDataSourceCreationBlock);
  swift_beginAccess();
  v2 = *v1;
  swift_retain();
  return v2;
}

uint64_t CPApplicationPolicyManager.contactsDataSourceCreationBlock.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR___CPApplicationPolicyManager_contactsDataSourceCreationBlock);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_release();
}

uint64_t (*CPApplicationPolicyManager.contactsDataSourceCreationBlock.modify())()
{
  swift_beginAccess();
  return ActivitySession.terminatingHandle.modify;
}

id CPApplicationPolicyManager.init(config:contactStore:featureFlags:)(uint64_t a1, void *a2, void *a3)
{
  char *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _DWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _DWORD *v20;
  char *v21;
  objc_class *v22;
  id v23;
  id (**v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  objc_class *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(id, _UNKNOWN **, uint64_t, uint64_t);
  id v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  int v54;
  void *v55;
  objc_super v56;
  __int128 v57[2];

  v55 = a3;
  v53 = a2;
  v5 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for OS_dispatch_queue.Attributes();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v8);
  v10 = type metadata accessor for DispatchQoS();
  MEMORY[0x1E0C80A78](v10);
  v11 = *(double *)a1;
  v54 = *(unsigned __int8 *)(a1 + 8);
  v12 = OBJC_IVAR___CPApplicationPolicyManager_lock;
  type metadata accessor for Lock();
  v13 = swift_allocObject();
  v14 = v3;
  v15 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v13 + 16) = v15;
  *v15 = 0;
  *(_QWORD *)&v3[v12] = v13;
  v50 = OBJC_IVAR___CPApplicationPolicyManager_queue;
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  static DispatchQoS.unspecified.getter();
  *(_QWORD *)&v57[0] = MEMORY[0x1E0DEE9D8];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, v9, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes], MEMORY[0x1E0DEAF38]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v51 + 104))(v7, *MEMORY[0x1E0DEF8D0], v52);
  *(_QWORD *)&v14[v50] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v16 = OBJC_IVAR___CPApplicationPolicyManager_delegates;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for DelegatesManager<CPApplicationPolicyManagerDelegate>);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = MEMORY[0x1E0DEE9D8];
  v18 = v53;
  v19 = swift_allocObject();
  v20 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v19 + 16) = v20;
  *v20 = 0;
  *(_QWORD *)(v17 + 24) = v19;
  *(_QWORD *)&v14[v16] = v17;
  v21 = &v14[OBJC_IVAR___CPApplicationPolicyManager_protectedAppsObserver];
  v22 = (objc_class *)type metadata accessor for ProtectedAppsObserver();
  v23 = objc_msgSend(objc_allocWithZone(v22), sel_init);
  *((_QWORD *)v21 + 3) = v22;
  *((_QWORD *)v21 + 4) = &protocol witness table for ProtectedAppsObserver;
  *(_QWORD *)v21 = v23;
  v24 = (id (**)(uint64_t))&v14[OBJC_IVAR___CPApplicationPolicyManager_contactsDataSourceCreationBlock];
  *v24 = closure #1 in variable initialization expression of CPApplicationPolicyManager.contactsDataSourceCreationBlock;
  v24[1] = 0;
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for NSUserDefaults);
  *(_QWORD *)&v57[0] = 0;
  *((_QWORD *)&v57[0] + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(23);
  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v27 = v26;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v57[0] = v25;
  *((_QWORD *)&v57[0] + 1) = v27;
  v28._object = (void *)0x80000001ACF84A30;
  v28._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v28);
  static NSUserDefaults.classProtectedStorage(suiteName:)(*(uint64_t *)&v57[0], *((unint64_t *)&v57[0] + 1), v57);
  swift_bridgeObjectRelease();
  outlined init with take of BackgroundSessionManagerDataSource(v57, (uint64_t)&v14[OBJC_IVAR___CPApplicationPolicyManager_storage]);
  v29 = 2592000.0;
  if (!v54)
    v29 = v11;
  *(double *)&v14[OBJC_IVAR___CPApplicationPolicyManager_config] = v29;
  if (v18)
    v30 = v18;
  else
    v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97298]), sel_init);
  *(_QWORD *)&v14[OBJC_IVAR___CPApplicationPolicyManager_contactStore] = v30;
  v31 = v55;
  if (v55)
  {
    swift_unknownObjectRetain();
    v32 = v31;
  }
  else
  {
    v33 = objc_allocWithZone((Class)CPFeatureFlags);
    swift_unknownObjectRetain();
    v32 = objc_msgSend(v33, sel_init);
  }
  *(_QWORD *)&v14[OBJC_IVAR___CPApplicationPolicyManager_featureFlags] = v32;
  swift_unknownObjectRetain();

  v34 = (objc_class *)type metadata accessor for CPApplicationPolicyManager();
  v56.receiver = v14;
  v56.super_class = v34;
  v35 = objc_msgSendSuper2(&v56, sel_init);
  v36 = (void *)objc_opt_self();
  v37 = v35;
  v38 = objc_msgSend(v36, sel_defaultCenter);
  objc_msgSend(v38, sel_addObserver_selector_name_object_, v37, sel_handleCNContactStoreDidChangeNotification_, *MEMORY[0x1E0C96870], 0);
  if (v31)
  {
    if (objc_msgSend((id)swift_unknownObjectRetain(), sel_appProtectionEnabled))
    {
      v39 = (uint64_t)v37 + OBJC_IVAR___CPApplicationPolicyManager_protectedAppsObserver;
      swift_beginAccess();
      v40 = *(_QWORD *)(v39 + 24);
      if (v40)
      {
        v41 = *(_QWORD *)(v39 + 32);
        __swift_mutable_project_boxed_opaque_existential_1(v39, *(_QWORD *)(v39 + 24));
        v42 = *(void (**)(id, _UNKNOWN **, uint64_t, uint64_t))(v41 + 16);
        v43 = v37;
        v42(v37, &protocol witness table for CPApplicationPolicyManager, v40, v41);
      }
      swift_endAccess();
    }
    swift_unknownObjectRelease();
  }
  if (one-time initialization token for default != -1)
    swift_once();
  v44 = type metadata accessor for Logger();
  __swift_project_value_buffer(v44, (uint64_t)static Log.default);
  v45 = Logger.logObject.getter();
  v46 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v47 = 0;
    _os_log_impl(&dword_1ACCCC000, v45, v46, "[CPAppPolicyManager] Init", v47, 2u);
    MEMORY[0x1AF44981C](v47, -1, -1);
  }

  CPApplicationPolicyManager.fetchAndProcessContactChangeHistory()();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v37;
}

id CPApplicationPolicyManager.__deallocating_deinit()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  objc_super v8;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v2, sel_removeObserver_, v1);

  if (one-time initialization token for default != -1)
    swift_once();
  v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)static Log.default);
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1ACCCC000, v4, v5, "[CPAppPolicyManager] Deinit", v6, 2u);
    MEMORY[0x1AF44981C](v6, -1, -1);
  }

  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for CPApplicationPolicyManager();
  return objc_msgSendSuper2(&v8, sel_dealloc);
}

uint64_t CPApplicationPolicyManager.applicationInfo(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[2];
  uint64_t v17;
  uint64_t v18[5];

  v7 = *(_QWORD *)(v3 + OBJC_IVAR___CPApplicationPolicyManager_storage + 24);
  v8 = *(_QWORD *)(v3 + OBJC_IVAR___CPApplicationPolicyManager_storage + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + OBJC_IVAR___CPApplicationPolicyManager_storage), v7);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String : Any]);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 40))(v18, v9, a1, a2, v9, v7, v8);
  result = v18[0];
  if (v18[0]
    && (specialized CPAppPolicy.AuthorizedBundles.init(dictionary:)(v18[0], (uint64_t *)v16),
        v14 = v16[1],
        v15 = v16[0],
        v11 = v17,
        result = outlined init with take of CPAppPolicy.AuthorizedBundles?((uint64_t)v16, (uint64_t)v18),
        v18[2]))
  {
    v13 = v14;
    v12 = v15;
  }
  else
  {
    v11 = 0;
    v12 = 0uLL;
    v13 = 0uLL;
  }
  *(_OWORD *)a3 = v12;
  *(_OWORD *)(a3 + 16) = v13;
  *(_QWORD *)(a3 + 32) = v11;
  return result;
}

uint64_t CPApplicationPolicyManager.persist(_:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  void (*v12)(void (*)(void *), uint64_t);
  _QWORD *v13;
  _QWORD v15[4];

  v2 = v1;
  v4 = *(_QWORD *)((char *)v1 + OBJC_IVAR___CPApplicationPolicyManager_storage + 24);
  v5 = *(_QWORD *)((char *)v1 + OBJC_IVAR___CPApplicationPolicyManager_storage + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)((char *)v1 + OBJC_IVAR___CPApplicationPolicyManager_storage), v4);
  v6 = CPAppPolicy.AuthorizedBundles.dictionaryRepresentation.getter();
  v15[3] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String : Any]);
  v15[0] = v6;
  (*(void (**)(_QWORD *, _QWORD, _QWORD, uint64_t, uint64_t))(v5 + 8))(v15, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), v4, v5);
  v7 = outlined destroy of UUID?((uint64_t)v15, (uint64_t *)&demangling cache variable for type metadata for Any?);
  v8 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xC0))(v7);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v2;
  v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v9 + 24) = *(_OWORD *)a1;
  *(_OWORD *)(v9 + 40) = v10;
  v11 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v9 + 56) = v11;
  v12 = *(void (**)(void (*)(void *), uint64_t))(*(_QWORD *)v8 + 152);
  v15[0] = v11;
  v13 = v2;
  swift_bridgeObjectRetain();
  outlined retain of [UInt64 : AttachmentLedger_AttachmentEncryption].Values((uint64_t)v15);
  v12(partial apply for closure #1 in CPApplicationPolicyManager.persist(_:), v9);
  swift_release();
  return swift_release();
}

void CPApplicationPolicyManager.updateAllowedHandles(_:for:)(uint64_t a1, uint64_t a2, char *a3)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(_QWORD *__return_ptr, uint64_t, char *);
  uint64_t v18;
  char *v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  unint64_t v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  int v35;
  uint8_t *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  int64_t v50;
  uint64_t v51;
  unint64_t v52;
  int64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  int64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  int64_t v70;
  unint64_t v71;
  int64_t v72;
  int64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  int v81;
  char *v82;
  char v83;
  unint64_t v84;
  uint64_t v85;
  _BOOL8 v86;
  uint64_t v87;
  char v88;
  unint64_t v89;
  char v90;
  _QWORD *v91;
  unint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  BOOL v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  int64_t v105;
  char *v106;
  uint64_t i;
  uint64_t v108;
  int64_t v109;
  uint64_t v110;
  uint64_t v111;
  _QWORD v112[3];
  uint64_t v113;
  _QWORD *v114;
  char v115[16];
  uint64_t v116;
  uint64_t v117[3];
  char v118;
  _QWORD *v119;

  v103 = a1;
  v6 = type metadata accessor for Date();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v106 = (char *)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  v10 = MEMORY[0x1E0C80A78](v9);
  v102 = (char *)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v97 - v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v97 - v15;
  v17 = *(void (**)(_QWORD *__return_ptr, uint64_t, char *))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x110);
  v100 = a2;
  v101 = v3;
  v17(v112, a2, a3);
  v18 = v112[1];
  v99 = v112[0];
  v19 = (char *)v112[2];
  v20 = v113;
  v21 = v114;
  v22 = outlined init with take of CPAppPolicy.AuthorizedBundles?((uint64_t)v112, (uint64_t)v115);
  if (v116)
  {
    if ((v20 & 1) == 0)
    {
      if (one-time initialization token for default != -1)
        swift_once();
      v23 = type metadata accessor for Logger();
      __swift_project_value_buffer(v23, (uint64_t)static Log.default);
      swift_bridgeObjectRetain_n();
      v24 = Logger.logObject.getter();
      v25 = (unint64_t)a3;
      v26 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v24, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc();
        v28 = swift_slowAlloc();
        v117[0] = v28;
        *(_DWORD *)v27 = 136315138;
        swift_bridgeObjectRetain();
        v111 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v100, v25, v117);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1ACCCC000, v24, v26, "[CPAppPolicyManager] Not updating authorized handles list since the application %s isn't authorized", v27, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1AF44981C](v28, -1, -1);
        MEMORY[0x1AF44981C](v27, -1, -1);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      goto LABEL_83;
    }
    a3 = v19;
    v100 = v18;
  }
  else
  {
    v22 = swift_bridgeObjectRetain();
    v99 = 2;
    v21 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  MEMORY[0x1E0C80A78](v22);
  *(&v97 - 2) = (uint64_t)v101;
  swift_bridgeObjectRetain();
  v29 = swift_bridgeObjectRetain();
  v30 = specialized _NativeDictionary.filter(_:)(v29, (uint64_t)partial apply for closure #1 in CPApplicationPolicyManager.expiredHandles(from:), (uint64_t)(&v97 - 4), (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t, uint64_t))specialized closure #1 in _NativeDictionary.filter(_:));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31 = *(_QWORD *)(v30 + 16);
  v108 = v6;
  v110 = v7;
  if (!v31)
    goto LABEL_14;
  if (one-time initialization token for default == -1)
    goto LABEL_11;
  while (2)
  {
    swift_once();
LABEL_11:
    v32 = type metadata accessor for Logger();
    __swift_project_value_buffer(v32, (uint64_t)static Log.default);
    swift_retain_n();
    v33 = Logger.logObject.getter();
    v34 = static os_log_type_t.default.getter();
    v35 = v34;
    if (os_log_type_enabled(v33, v34))
    {
      LODWORD(v109) = v35;
      v36 = (uint8_t *)swift_slowAlloc();
      i = swift_slowAlloc();
      v117[0] = i;
      *(_DWORD *)v36 = 136315138;
      v105 = (int64_t)(v36 + 4);
      swift_retain();
      v37 = Dictionary.description.getter();
      v39 = v38;
      swift_release();
      v111 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, v39, v117);
      v6 = v108;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ACCCC000, v33, (os_log_type_t)v109, "[CPAppPolicyManager] Pruning expired handles:%s", v36, 0xCu);
      v40 = i;
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v40, -1, -1);
      MEMORY[0x1AF44981C](v36, -1, -1);

    }
    else
    {

      swift_release_n();
    }
LABEL_14:
    v98 = (uint64_t)a3;
    v41 = 0;
    a3 = (char *)(v30 + 64);
    v42 = 1 << *(_BYTE *)(v30 + 32);
    v43 = -1;
    if (v42 < 64)
      v43 = ~(-1 << v42);
    v44 = v43 & *(_QWORD *)(v30 + 64);
    v109 = (unint64_t)(v42 + 63) >> 6;
    for (i = (uint64_t)v14; ; v14 = (char *)i)
    {
      if (v44)
      {
        v48 = __clz(__rbit64(v44));
        v44 &= v44 - 1;
        v49 = v48 | (v41 << 6);
        goto LABEL_39;
      }
      v50 = v41 + 1;
      v51 = v110;
      if (__OFADD__(v41, 1))
        goto LABEL_86;
      if (v50 >= v109)
        goto LABEL_43;
      v52 = *(_QWORD *)&a3[8 * v50];
      ++v41;
      if (!v52)
      {
        v41 = v50 + 1;
        if (v50 + 1 >= v109)
          goto LABEL_43;
        v52 = *(_QWORD *)&a3[8 * v41];
        if (!v52)
        {
          v41 = v50 + 2;
          if (v50 + 2 >= v109)
            goto LABEL_43;
          v52 = *(_QWORD *)&a3[8 * v41];
          if (!v52)
          {
            v41 = v50 + 3;
            if (v50 + 3 >= v109)
              goto LABEL_43;
            v52 = *(_QWORD *)&a3[8 * v41];
            if (!v52)
            {
              v41 = v50 + 4;
              if (v50 + 4 >= v109)
                goto LABEL_43;
              v52 = *(_QWORD *)&a3[8 * v41];
              if (!v52)
                break;
            }
          }
        }
      }
LABEL_38:
      v44 = (v52 - 1) & v52;
      v49 = __clz(__rbit64(v52)) + (v41 << 6);
LABEL_39:
      v54 = (uint64_t *)(*(_QWORD *)(v30 + 48) + 16 * v49);
      v55 = *v54;
      v56 = v54[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v57 = specialized __RawDictionaryStorage.find<A>(_:)(v55, v56);
      LOBYTE(v55) = v58;
      swift_bridgeObjectRelease();
      if ((v55 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v117[0] = (uint64_t)v21;
        if (!isUniquelyReferenced_nonNull_native)
        {
          specialized _NativeDictionary.copy()();
          v21 = (_QWORD *)v117[0];
        }
        swift_bridgeObjectRelease();
        v47 = v110;
        v46 = v108;
        (*(void (**)(char *, unint64_t, uint64_t))(v110 + 32))(v16, v21[7] + *(_QWORD *)(v110 + 72) * v57, v108);
        specialized _NativeDictionary._delete(at:)(v57, (uint64_t)v21);
        swift_bridgeObjectRelease();
        v45 = 0;
      }
      else
      {
        v45 = 1;
        v46 = v108;
        v47 = v110;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v47 + 56))(v16, v45, 1, v46);
      outlined destroy of UUID?((uint64_t)v16, (uint64_t *)&demangling cache variable for type metadata for Date?);
      swift_bridgeObjectRelease();
      v6 = v46;
    }
    v53 = v50 + 5;
    if (v53 < v109)
    {
      v52 = *(_QWORD *)&a3[8 * v53];
      if (!v52)
      {
        while (1)
        {
          v41 = v53 + 1;
          if (__OFADD__(v53, 1))
            goto LABEL_90;
          if (v41 >= v109)
            goto LABEL_43;
          v52 = *(_QWORD *)&a3[8 * v41];
          ++v53;
          if (v52)
            goto LABEL_38;
        }
      }
      v41 = v53;
      goto LABEL_38;
    }
LABEL_43:
    swift_release();
    v60 = *(_QWORD *)(v103 + 56);
    v104 = v103 + 56;
    v61 = 1 << *(_BYTE *)(v103 + 32);
    v62 = -1;
    if (v61 < 64)
      v62 = ~(-1 << v61);
    v63 = v62 & v60;
    v105 = (unint64_t)(v61 + 63) >> 6;
    v64 = swift_bridgeObjectRetain();
    v65 = 0;
    v66 = (uint64_t)v102;
    if (!v63)
    {
LABEL_50:
      v70 = v65 + 1;
      if (__OFADD__(v65, 1))
        goto LABEL_87;
      if (v70 < v105)
      {
        v71 = *(_QWORD *)(v104 + 8 * v70);
        v72 = v65 + 1;
        if (v71)
          goto LABEL_63;
        v72 = v65 + 2;
        if (v65 + 2 >= v105)
          goto LABEL_82;
        v71 = *(_QWORD *)(v104 + 8 * v72);
        if (v71)
          goto LABEL_63;
        v72 = v65 + 3;
        if (v65 + 3 >= v105)
          goto LABEL_82;
        v71 = *(_QWORD *)(v104 + 8 * v72);
        if (v71)
        {
LABEL_63:
          v63 = (v71 - 1) & v71;
          v109 = v72;
          v69 = __clz(__rbit64(v71)) + (v72 << 6);
          goto LABEL_64;
        }
        v73 = v65 + 4;
        if (v65 + 4 < v105)
        {
          v71 = *(_QWORD *)(v104 + 8 * v73);
          if (v71)
          {
            v72 = v65 + 4;
            goto LABEL_63;
          }
          while (1)
          {
            v72 = v73 + 1;
            if (__OFADD__(v73, 1))
              break;
            if (v72 >= v105)
              goto LABEL_82;
            v71 = *(_QWORD *)(v104 + 8 * v72);
            ++v73;
            if (v71)
              goto LABEL_63;
          }
LABEL_89:
          __break(1u);
LABEL_90:
          __break(1u);
          continue;
        }
      }
LABEL_82:
      swift_release();
      LOBYTE(v117[0]) = v99;
      v117[1] = v100;
      v117[2] = v98;
      v118 = 1;
      v119 = v21;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      CPApplicationPolicyManager.persist(_:)((uint64_t)v117);
      swift_bridgeObjectRelease_n();
LABEL_83:
      swift_bridgeObjectRelease_n();
      return;
    }
    break;
  }
  while (2)
  {
    while (1)
    {
      v68 = __clz(__rbit64(v63));
      v63 &= v63 - 1;
      v109 = v65;
      v69 = v68 | (v65 << 6);
LABEL_64:
      v74 = (uint64_t *)(*(_QWORD *)(v64 + 48) + 16 * v69);
      a3 = (char *)v64;
      v75 = *v74;
      v16 = (char *)v74[1];
      swift_bridgeObjectRetain();
      Date.init()();
      v30 = *(_QWORD *)(v51 + 56);
      ((void (*)(char *, _QWORD, uint64_t, uint64_t))v30)(v14, 0, 1, v6);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v14, 1, v6) != 1)
        break;
      v76 = (uint64_t)v14;
      v77 = v66;
      a3 = (char *)v76;
      outlined destroy of UUID?(v76, (uint64_t *)&demangling cache variable for type metadata for Date?);
      swift_bridgeObjectRetain();
      v78 = specialized __RawDictionaryStorage.find<A>(_:)(v75, (uint64_t)v16);
      v80 = v79;
      swift_bridgeObjectRelease();
      if ((v80 & 1) != 0)
      {
        v81 = swift_isUniquelyReferenced_nonNull_native();
        v117[0] = (uint64_t)v21;
        if (!v81)
        {
          specialized _NativeDictionary.copy()();
          v21 = (_QWORD *)v117[0];
        }
        swift_bridgeObjectRelease();
        v66 = v77;
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v51 + 32))(v77, v21[7] + *(_QWORD *)(v51 + 72) * v78, v6);
        specialized _NativeDictionary._delete(at:)(v78, (uint64_t)v21);
        swift_bridgeObjectRelease();
        v67 = 0;
      }
      else
      {
        v67 = 1;
        v66 = v77;
      }
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v30)(v66, v67, 1, v6);
      swift_bridgeObjectRelease();
      outlined destroy of UUID?(v66, (uint64_t *)&demangling cache variable for type metadata for Date?);
      v64 = v103;
      v65 = v109;
      v14 = a3;
      if (!v63)
        goto LABEL_50;
    }
    v82 = v14;
    v14 = *(char **)(v51 + 32);
    ((void (*)(char *, char *, uint64_t))v14)(v106, v82, v6);
    v30 = swift_isUniquelyReferenced_nonNull_native();
    v117[0] = (uint64_t)v21;
    v84 = specialized __RawDictionaryStorage.find<A>(_:)(v75, (uint64_t)v16);
    v85 = v21[2];
    v86 = (v83 & 1) == 0;
    v87 = v85 + v86;
    if (__OFADD__(v85, v86))
    {
      __break(1u);
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
      goto LABEL_89;
    }
    v88 = v83;
    if (v21[3] >= v87)
    {
      if ((v30 & 1) != 0)
      {
        v91 = (_QWORD *)v117[0];
        if ((v83 & 1) == 0)
          goto LABEL_78;
      }
      else
      {
        specialized _NativeDictionary.copy()();
        v91 = (_QWORD *)v117[0];
        if ((v88 & 1) == 0)
          goto LABEL_78;
      }
      goto LABEL_76;
    }
    specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v87, v30);
    v89 = specialized __RawDictionaryStorage.find<A>(_:)(v75, (uint64_t)v16);
    if ((v88 & 1) == (v90 & 1))
    {
      v84 = v89;
      v91 = (_QWORD *)v117[0];
      if ((v88 & 1) == 0)
      {
LABEL_78:
        v91[(v84 >> 6) + 8] |= 1 << v84;
        v93 = (uint64_t *)(v91[6] + 16 * v84);
        *v93 = v75;
        v93[1] = (uint64_t)v16;
        v6 = v108;
        ((void (*)(unint64_t, char *, uint64_t))v14)(v91[7] + *(_QWORD *)(v110 + 72) * v84, v106, v108);
        v94 = v91[2];
        v95 = __OFADD__(v94, 1);
        v96 = v94 + 1;
        if (v95)
          goto LABEL_88;
        v91[2] = v96;
        swift_bridgeObjectRetain();
        v51 = v110;
LABEL_80:
        v21 = (_QWORD *)v117[0];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v64 = (uint64_t)a3;
        v66 = (uint64_t)v102;
        v14 = (char *)i;
        v65 = v109;
        if (!v63)
          goto LABEL_50;
        continue;
      }
LABEL_76:
      v92 = v91[7] + *(_QWORD *)(v110 + 72) * v84;
      v51 = v110;
      v6 = v108;
      (*(void (**)(unint64_t, char *, uint64_t))(v110 + 40))(v92, v106, v108);
      goto LABEL_80;
    }
    break;
  }
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
}

BOOL closure #1 in CPApplicationPolicyManager.expiredHandles(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char v16;
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v4 = type metadata accessor for Date();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870];
  v6 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x1E0C80A78](v4);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v19 - v10;
  v12 = type metadata accessor for DateInterval();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v11, a3, v4);
  DateInterval.init(start:duration:)();
  Date.init()();
  DateInterval.end.getter();
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type Date and conformance Date, v5, MEMORY[0x1E0CB08B0]);
  v16 = dispatch thunk of static Comparable.< infix(_:_:)();
  v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  v17(v9, v4);
  v17(v11, v4);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return (v16 & 1) == 0;
}

uint64_t CPApplicationPolicyManager.fetchAndStoreContactIdentifiers(for:)(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  char *v15;
  _QWORD v17[2];
  _QWORD aBlock[6];

  v3 = type metadata accessor for DispatchWorkItemFlags();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = *(_QWORD *)&v1[OBJC_IVAR___CPApplicationPolicyManager_queue];
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = v1;
  aBlock[4] = partial apply for closure #1 in CPApplicationPolicyManager.fetchAndStoreContactIdentifiers(for:);
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_38;
  v13 = _Block_copy(aBlock);
  v14 = a1;
  v15 = v1;
  static DispatchQoS.unspecified.getter();
  v17[1] = MEMORY[0x1E0DEE9D8];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, v4, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags], MEMORY[0x1E0DEAF38]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x1AF448634](0, v11, v7, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

void closure #1 in CPApplicationPolicyManager.fetchAndStoreContactIdentifiers(for:)(void *a1, _QWORD *a2)
{
  uint64_t v4;
  SEL *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t (*v17)(void);
  uint64_t (*v18)(unint64_t);
  void *v19;
  uint64_t v20;
  uint8_t *v21;
  Class isa;
  Class v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  SEL *p_ivars;
  unint64_t v35;
  int64_t v36;
  unint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  char v51;
  id v52;
  SEL *v53;
  id v54;
  uint64_t v55;
  char *v56;
  char v57;
  Class v58;
  _BOOL8 v59;
  uint64_t v60;
  char v61;
  unint64_t v62;
  char v63;
  _QWORD *v64;
  _QWORD *v65;
  unint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  uint8_t *v74;
  id v75;
  id v76;
  int v77;
  id v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  os_log_type_t v83;
  BOOL v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  int64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t i;
  void *v99;
  uint64_t j;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  NSObject *v109;
  os_log_type_t v110;
  uint8_t *v111;
  void *v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  id v117;
  uint64_t v118;
  unint64_t v119;
  void *v120;
  _QWORD v121[2];
  id v122;
  _QWORD *v123;
  uint64_t v124;
  int64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint8_t *v129;
  char *v130;
  int64_t v131;
  _QWORD *v132;
  unint64_t v133;
  SEL *v134;
  id v135;
  unint64_t v136;
  id v137[4];
  uint64_t v138;
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v4 = type metadata accessor for UUID();
  v5 = *(SEL **)(v4 - 8);
  v133 = v4;
  v134 = v5;
  v6 = MEMORY[0x1E0C80A78](v4);
  v132 = (_QWORD *)((char *)v121 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v6);
  v9 = (unint64_t)v121 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v121 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)v121 - v14;
  v16 = (unint64_t)objc_msgSend((id)objc_opt_self(), sel_tu_contactStoreConfigurationForConversation_, a1);
  v17 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *a2) + 0xF0);
  v123 = a2;
  v18 = (uint64_t (*)(unint64_t))v17();
  v19 = (void *)v18(v16);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1ACF59E40;
  *(_QWORD *)(v20 + 32) = a1;
  v137[0] = (id)v20;
  specialized Array._endMutation()();
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversation);
  v21 = a1;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CNKeyDescriptor);
  v23 = Array._bridgeToObjectiveC()().super.isa;
  v126 = 0;
  v137[0] = 0;
  v24 = (uint64_t)objc_msgSend(v19, sel_tu_contactsByRemoteConversationMemberForConversations_keyDescriptors_error_, isa, v23, v137);

  v25 = v137[0];
  if (!v24)
  {
    v130 = v13;
    v131 = (int64_t)v15;
    v26 = v133;
    p_ivars = v134;
    v72 = v137[0];
    v24 = _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_unknownObjectRelease();

    if (one-time initialization token for default != -1)
      goto LABEL_119;
    goto LABEL_54;
  }
  v121[1] = v19;
  v122 = (id)v16;
  v21 = (uint8_t *)0x1E0DBD2A0;
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
  v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [CNContact]);
  lazy protocol witness table accessor for type TUConversationActivitySession and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type TUConversationMember and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
  v27 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v28 = v25;

  v29 = 0;
  v136 = MEMORY[0x1E0DEE9E0];
  v30 = *(_QWORD *)(v27 + 64);
  v124 = v27 + 64;
  v127 = v27;
  v31 = 1 << *(_BYTE *)(v27 + 32);
  v32 = -1;
  if (v31 < 64)
    v32 = ~(-1 << v31);
  v33 = v32 & v30;
  v125 = (unint64_t)(v31 + 63) >> 6;
  p_ivars = (SEL *)&DisplayLayoutAppVisibilityMonitor.ivars;
  while (1)
  {
    if (v33)
    {
      v128 = (void *)((v33 - 1) & v33);
      v35 = __clz(__rbit64(v33)) | (v29 << 6);
      goto LABEL_22;
    }
    v36 = v29 + 1;
    if (__OFADD__(v29, 1))
    {
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
      goto LABEL_117;
    }
    if (v36 >= v125)
      goto LABEL_57;
    v37 = *(_QWORD *)(v124 + 8 * v36);
    ++v29;
    if (!v37)
    {
      v29 = v36 + 1;
      if (v36 + 1 >= v125)
        goto LABEL_57;
      v37 = *(_QWORD *)(v124 + 8 * v29);
      if (!v37)
      {
        v29 = v36 + 2;
        if (v36 + 2 >= v125)
          goto LABEL_57;
        v37 = *(_QWORD *)(v124 + 8 * v29);
        if (!v37)
          break;
      }
    }
LABEL_21:
    v128 = (void *)((v37 - 1) & v37);
    v35 = __clz(__rbit64(v37)) + (v29 << 6);
LABEL_22:
    v39 = 8 * v35;
    v9 = *(_QWORD *)(*(_QWORD *)(v127 + 48) + v39);
    isUniquelyReferenced_nonNull_native = *(_QWORD *)(*(_QWORD *)(v127 + 56) + v39);
    v129 = (uint8_t *)v29;
    if ((unint64_t)isUniquelyReferenced_nonNull_native >> 62)
    {
      if (isUniquelyReferenced_nonNull_native < 0)
        v21 = (uint8_t *)isUniquelyReferenced_nonNull_native;
      else
        v21 = (uint8_t *)(isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain_n();
      v71 = (id)v9;
      v41 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v41)
        goto LABEL_5;
LABEL_24:
      v132 = (_QWORD *)isUniquelyReferenced_nonNull_native;
      v133 = isUniquelyReferenced_nonNull_native & 0xC000000000000001;
      v26 = 4;
      v130 = (char *)v41;
      v131 = v9;
      while (2)
      {
        v44 = (v26 - 4);
        if (v133)
          v45 = (id)MEMORY[0x1AF448904](v26 - 4, isUniquelyReferenced_nonNull_native);
        else
          v45 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v26);
        v24 = (uint64_t)v45;
        if (__OFADD__(v44, 1))
        {
          __break(1u);
LABEL_104:
          __break(1u);
          goto LABEL_105;
        }
        v134 = (SEL *)(v26 - 3);
        v46 = objc_msgSend(v45, p_ivars[202]);
        v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v49 = v48;

        if (*(_QWORD *)(v136 + 16))
        {
          specialized __RawDictionaryStorage.find<A>(_:)(v47, v49);
          v50 = (void *)MEMORY[0x1E0DEE9D8];
          if ((v51 & 1) != 0)
            v50 = (void *)swift_bridgeObjectRetain();
        }
        else
        {
          v50 = (void *)MEMORY[0x1E0DEE9D8];
        }
        v137[0] = v50;
        swift_bridgeObjectRelease();
        v52 = objc_msgSend((id)v9, sel_handle);
        MEMORY[0x1AF448268]();
        v41 = *(_QWORD *)(((unint64_t)v137[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v41 >= *(_QWORD *)(((unint64_t)v137[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        v53 = p_ivars;
        v54 = objc_msgSend((id)v24, p_ivars[202]);
        v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v15 = v56;

        p_ivars = (SEL *)v137[0];
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v44 = v136;
        v138 = v136;
        v136 = 0x8000000000000000;
        v16 = specialized __RawDictionaryStorage.find<A>(_:)(v55, (uint64_t)v15);
        v58 = v44[2].isa;
        v59 = (v57 & 1) == 0;
        v60 = (uint64_t)v58 + v59;
        if (__OFADD__(v58, v59))
          goto LABEL_104;
        v61 = v57;
        if ((uint64_t)v44[3].isa >= v60)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            v64 = (_QWORD *)v138;
            if ((v57 & 1) == 0)
              goto LABEL_44;
          }
          else
          {
            specialized _NativeDictionary.copy()();
            v64 = (_QWORD *)v138;
            if ((v61 & 1) == 0)
              goto LABEL_44;
          }
        }
        else
        {
          specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v60, isUniquelyReferenced_nonNull_native);
          v62 = specialized __RawDictionaryStorage.find<A>(_:)(v55, (uint64_t)v15);
          if ((v61 & 1) != (v63 & 1))
          {
            KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
            __break(1u);
            return;
          }
          v16 = v62;
          v64 = (_QWORD *)v138;
          if ((v61 & 1) == 0)
          {
LABEL_44:
            v65 = &v64[v16 >> 6];
            v66 = v65[8];
            v65[8] = v66 | (1 << v16);
            v67 = (uint64_t *)(v64[6] + 16 * v16);
            *v67 = v55;
            v67[1] = (uint64_t)v15;
            *(_QWORD *)(v64[7] + 8 * v16) = p_ivars;
            v68 = v64[2];
            v69 = __OFADD__(v68, 1);
            v70 = v68 + 1;
            if (v69)
            {
              __break(1u);
              goto LABEL_111;
            }
            v64[2] = v70;
            swift_bridgeObjectRetain();
            goto LABEL_26;
          }
        }
        v43 = v64[7];
        swift_bridgeObjectRelease();
        *(_QWORD *)(v43 + 8 * v16) = p_ivars;
LABEL_26:
        v21 = (uint8_t *)v136;
        v136 = (unint64_t)v64;

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        ++v26;
        v41 = (unint64_t)v130;
        p_ivars = v53;
        v9 = v131;
        isUniquelyReferenced_nonNull_native = (uint64_t)v132;
        if (v134 == (SEL *)v130)
          goto LABEL_5;
        continue;
      }
    }
    v41 = *(_QWORD *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v42 = (id)v9;
    if (v41)
      goto LABEL_24;
LABEL_5:

    swift_bridgeObjectRelease();
    v33 = (unint64_t)v128;
    v29 = (int64_t)v129;
  }
  v38 = v36 + 3;
  if (v38 < v125)
  {
    v37 = *(_QWORD *)(v124 + 8 * v38);
    if (!v37)
    {
      while (1)
      {
        v29 = v38 + 1;
        if (__OFADD__(v38, 1))
          break;
        if (v29 >= v125)
          goto LABEL_57;
        v37 = *(_QWORD *)(v124 + 8 * v29);
        ++v38;
        if (v37)
          goto LABEL_21;
      }
LABEL_117:
      __break(1u);
      goto LABEL_118;
    }
    v29 = v38;
    goto LABEL_21;
  }
LABEL_57:
  swift_release();
  if (one-time initialization token for default != -1)
    swift_once();
  v82 = type metadata accessor for Logger();
  v21 = (uint8_t *)__swift_project_value_buffer(v82, (uint64_t)static Log.default);
  p_ivars = (SEL *)Logger.logObject.getter();
  v83 = static os_log_type_t.default.getter();
  v26 = v83;
  v84 = os_log_type_enabled((os_log_t)p_ivars, v83);
  v129 = v21;
  if (v84)
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v137[0] = (id)v24;
    *(_DWORD *)v21 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [TUHandle]);
    v85 = Dictionary.description.getter();
    v87 = v86;
    swift_bridgeObjectRelease();
    v138 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v85, v87, (uint64_t *)v137);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, (os_log_t)p_ivars, (os_log_type_t)v26, "[CPAppPolicyManager] Updating CPAppPolicy.ContactHandles with %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v24, -1, -1);
    MEMORY[0x1AF44981C](v21, -1, -1);
  }

  swift_beginAccess();
  v88 = *(_QWORD *)(v136 + 64);
  v130 = (char *)(v136 + 64);
  v89 = 1 << *(_BYTE *)(v136 + 32);
  v90 = -1;
  if (v89 < 64)
    v90 = ~(-1 << v89);
  v9 = v90 & v88;
  v133 = OBJC_IVAR___CPApplicationPolicyManager_lock;
  v132 = (_QWORD *)((char *)v123 + OBJC_IVAR___CPApplicationPolicyManager_storage);
  v131 = (unint64_t)(v89 + 63) >> 6;
  v134 = (SEL *)v136;
  swift_bridgeObjectRetain();
  v91 = 0;
  if (!v9)
    goto LABEL_65;
  while (2)
  {
    v92 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v93 = v92 | (v91 << 6);
LABEL_76:
    v96 = (uint64_t *)&v134[6][16 * v93];
    v26 = *v96;
    p_ivars = (SEL *)v96[1];
    v24 = *(_QWORD *)&v134[7][8 * v93];
    if ((unint64_t)v24 >> 62)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v21 = (uint8_t *)_CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      v21 = *(uint8_t **)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
    }
    type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUHandle);
    lazy protocol witness table accessor for type TUConversationActivitySession and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type TUHandle and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for TUHandle);
    v137[0] = (id)Set.init(minimumCapacity:)();
    if ((unint64_t)v24 >> 62)
    {
      if (v24 < 0)
        v21 = (uint8_t *)v24;
      else
        v21 = (uint8_t *)(v24 & 0xFFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain();
      v97 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v97)
        goto LABEL_85;
    }
    else
    {
      v97 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v97)
        goto LABEL_92;
LABEL_85:
      if (v97 < 1)
        goto LABEL_115;
      if ((v24 & 0xC000000000000001) != 0)
      {
        for (i = 0; i != v97; ++i)
        {
          v99 = (void *)MEMORY[0x1AF448904](i, v24);
          specialized Set._Variant.insert(_:)(&v135, v99);

        }
      }
      else
      {
        for (j = 0; j != v97; ++j)
        {
          v101 = *(void **)(v24 + 8 * j + 32);
          specialized Set._Variant.insert(_:)(&v135, v101);

        }
      }
    }
LABEL_92:
    swift_bridgeObjectRelease();
    v102 = v126;
    v103 = specialized CPApplicationPolicyManager.hashedHandles(from:)((uint64_t)v137[0]);
    if (v102)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v109 = Logger.logObject.getter();
      v110 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v109, v110))
      {
        v111 = (uint8_t *)swift_slowAlloc();
        v112 = (void *)swift_slowAlloc();
        v137[0] = v112;
        *(_DWORD *)v111 = 136315138;
        v135 = (id)v24;
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [TUHandle]);
        v113 = String.init<A>(reflecting:)();
        v135 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v113, v114, (uint64_t *)v137);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1ACCCC000, v109, v110, "[CPAppPolicyManager] Error getting normalized handles from %s", v111, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1AF44981C](v112, -1, -1);
        MEMORY[0x1AF44981C](v111, -1, -1);
        swift_release();
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease_n();
      }
      swift_unknownObjectRelease();

      goto LABEL_113;
    }
    v104 = v103;
    v126 = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v105 = specialized _copyCollectionToContiguousArray<A>(_:)(v104);
    swift_bridgeObjectRelease();
    v106 = *(_QWORD *)((char *)v123 + v133);
    os_unfair_lock_lock(*(os_unfair_lock_t *)(v106 + 16));
    v24 = v132[3];
    v107 = v132[4];
    v21 = (uint8_t *)__swift_project_boxed_opaque_existential_1(v132, v24);
    v108 = (void *)CPAppPolicy.ContactHandles.dictionaryRepresentation.getter(v26, (uint64_t)p_ivars, (uint64_t)v105);
    v137[3] = (id)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String : Any]);
    v137[0] = v108;
    (*(void (**)(id *, uint64_t, SEL *, uint64_t, uint64_t))(v107 + 8))(v137, v26, p_ivars, v24, v107);
    outlined destroy of UUID?((uint64_t)v137, (uint64_t *)&demangling cache variable for type metadata for Any?);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v106 + 16));
    swift_release();
    swift_bridgeObjectRelease_n();
    if (v9)
      continue;
    break;
  }
LABEL_65:
  v69 = __OFADD__(v91++, 1);
  if (v69)
    goto LABEL_116;
  if (v91 >= v131)
  {

    goto LABEL_112;
  }
  v94 = *(_QWORD *)&v130[8 * v91];
  v66 = (unint64_t)v122;
  if (v94)
  {
LABEL_75:
    v9 = (v94 - 1) & v94;
    v93 = __clz(__rbit64(v94)) + (v91 << 6);
    goto LABEL_76;
  }
  v95 = v91 + 1;
  if (v91 + 1 >= v131)
    goto LABEL_111;
  v94 = *(_QWORD *)&v130[8 * v95];
  if (v94)
    goto LABEL_74;
  v95 = v91 + 2;
  if (v91 + 2 >= v131)
    goto LABEL_111;
  v94 = *(_QWORD *)&v130[8 * v95];
  if (v94)
    goto LABEL_74;
  v95 = v91 + 3;
  if (v91 + 3 >= v131)
  {
LABEL_111:

LABEL_112:
    swift_release();
    swift_unknownObjectRelease();
LABEL_113:
    swift_bridgeObjectRelease();
    return;
  }
  v94 = *(_QWORD *)&v130[8 * v95];
  if (v94)
  {
LABEL_74:
    v91 = v95;
    goto LABEL_75;
  }
  while (1)
  {
    v91 = v95 + 1;
    if (__OFADD__(v95, 1))
      break;
    if (v91 >= v131)
      goto LABEL_111;
    v94 = *(_QWORD *)&v130[8 * v91];
    ++v95;
    if (v94)
      goto LABEL_75;
  }
LABEL_118:
  __break(1u);
LABEL_119:
  swift_once();
LABEL_54:
  v73 = type metadata accessor for Logger();
  __swift_project_value_buffer(v73, (uint64_t)static Log.default);
  v74 = v21;
  v75 = (id)v24;
  v16 = v74;
  v76 = (id)v24;
  v44 = Logger.logObject.getter();
  v77 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v44, (os_log_type_t)v77))
  {
    v41 = v9;
    LODWORD(v129) = v77;
    isUniquelyReferenced_nonNull_native = swift_slowAlloc();
    v128 = (void *)swift_slowAlloc();
    v137[0] = v128;
    *(_DWORD *)isUniquelyReferenced_nonNull_native = 136315394;
    v78 = objc_msgSend((id)v16, sel_UUID);
    v79 = v131;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))p_ivars[7])(v79, 0, 1, v26);
    v15 = v130;
    outlined init with copy of ActivitySession.DomainAssertionWrapper?(v79, (uint64_t)v130, (uint64_t *)&demangling cache variable for type metadata for UUID?);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))p_ivars[6])(v15, 1, v26) == 1)
    {
      v80 = 0xE300000000000000;
      v81 = 7104878;
    }
    else
    {
LABEL_105:
      ((void (*)(unint64_t, char *, uint64_t))p_ivars[4])(v41, v15, v26);
      ((void (*)(_QWORD *, unint64_t, uint64_t))p_ivars[2])(v132, v41, v26);
      v79 = v131;
      v81 = String.init<A>(reflecting:)();
      v115 = v41;
      v80 = v116;
      ((void (*)(unint64_t, uint64_t))p_ivars[1])(v115, v26);
    }
    outlined destroy of UUID?(v79, (uint64_t *)&demangling cache variable for type metadata for UUID?);
    v138 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v81, v80, (uint64_t *)v137);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(isUniquelyReferenced_nonNull_native + 12) = 2080;
    v138 = v24;
    v117 = (id)v24;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v118 = String.init<A>(reflecting:)();
    v138 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v118, v119, (uint64_t *)v137);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1ACCCC000, v44, (os_log_type_t)v129, "[CPAppPolicyManager] Failed to fetch Contacts for converation with UUID %s, error: %s", (uint8_t *)isUniquelyReferenced_nonNull_native, 0x16u);
    v120 = v128;
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v120, -1, -1);
    MEMORY[0x1AF44981C](isUniquelyReferenced_nonNull_native, -1, -1);

  }
  else
  {

  }
}

uint64_t CPApplicationPolicyManager.fetchAndProcessContactChangeHistory()()
{
  char *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  _QWORD v14[2];
  _QWORD aBlock[6];

  v1 = type metadata accessor for DispatchWorkItemFlags();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = *(_QWORD *)&v0[OBJC_IVAR___CPApplicationPolicyManager_queue];
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v0;
  aBlock[4] = partial apply for closure #1 in CPApplicationPolicyManager.fetchAndProcessContactChangeHistory();
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_24_3;
  v11 = _Block_copy(aBlock);
  v12 = v0;
  static DispatchQoS.unspecified.getter();
  v14[1] = MEMORY[0x1E0DEE9D8];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, v2, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags], MEMORY[0x1E0DEAF38]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x1AF448634](0, v9, v5, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return swift_release();
}

void closure #1 in CPApplicationPolicyManager.fetchAndProcessContactChangeHistory()(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(__int128 *__return_ptr, _QWORD, unint64_t, unint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  unint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  Class isa;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  id v28;
  Class v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  objc_class *v38;
  char *v39;
  void (**v40)(uint64_t, unint64_t);
  char *v41;
  id v42;
  id v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  Class v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(__int128 *, unint64_t, unint64_t, uint64_t, uint64_t);
  id v72;
  id v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  id v82;
  objc_super v83;
  _OWORD v84[2];
  __int128 v85;
  uint64_t v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v2 = type metadata accessor for NSFastEnumerationIterator();
  v75 = *(_QWORD *)(v2 - 8);
  v76 = v2;
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v72 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)&a1[OBJC_IVAR___CPApplicationPolicyManager_lock];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v5 + 16));
  v6 = *(_QWORD *)&a1[OBJC_IVAR___CPApplicationPolicyManager_storage + 24];
  v7 = *(_QWORD *)&a1[OBJC_IVAR___CPApplicationPolicyManager_storage + 32];
  v77 = &a1[OBJC_IVAR___CPApplicationPolicyManager_storage];
  __swift_project_boxed_opaque_existential_1(&a1[OBJC_IVAR___CPApplicationPolicyManager_storage], v6);
  v8 = *(void (**)(__int128 *__return_ptr, _QWORD, unint64_t, unint64_t, _QWORD, uint64_t, uint64_t))(v7 + 40);
  v78 = (unint64_t)"CPAppPolicy.AutoSharePlayToggle";
  v8(&v85, MEMORY[0x1E0CB0338], 0xD000000000000026, 0x80000001ACF7FE50, MEMORY[0x1E0CB0338], v6, v7);
  v79 = v5;
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v5 + 16));
  v10 = *((_QWORD *)&v85 + 1);
  v9 = v85;
  if (one-time initialization token for default != -1)
    swift_once();
  v11 = type metadata accessor for Logger();
  v12 = __swift_project_value_buffer(v11, (uint64_t)static Log.default);
  outlined copy of Data?(v9, v10);
  outlined copy of Data?(v9, v10);
  v80 = v12;
  v13 = Logger.logObject.getter();
  v14 = static os_log_type_t.info.getter();
  v15 = os_log_type_enabled(v13, v14);
  v16 = v10 >> 60;
  v81 = v10;
  if (v15)
  {
    v17 = 7104878;
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    *(_QWORD *)&v84[0] = v19;
    *(_DWORD *)v18 = 136315138;
    v74 = v10 >> 60;
    if (v10 >> 60 == 15
      || (isa = Data._bridgeToObjectiveC()().super.isa,
          v21 = -[objc_class tu_URLSafeBase64EncodedString](isa, sel_tu_URLSafeBase64EncodedString),
          isa,
          !v21))
    {
      v26 = 0xE300000000000000;
    }
    else
    {
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v24 = v23;

      *(_QWORD *)&v85 = v22;
      *((_QWORD *)&v85 + 1) = v24;
      v17 = String.init<A>(reflecting:)();
      v26 = v25;
    }
    *(_QWORD *)&v85 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v26, (uint64_t *)v84);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v10 = v81;
    outlined consume of Data?(v9, v81);
    outlined consume of Data?(v9, v10);
    _os_log_impl(&dword_1ACCCC000, v13, v14, "[CPAppPolicyManager] Read CPAppPolicy.ContactsChangeHistoryToken: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v19, -1, -1);
    MEMORY[0x1AF44981C](v18, -1, -1);

    v16 = v74;
  }
  else
  {
    outlined consume of Data?(v9, v10);
    outlined consume of Data?(v9, v10);

  }
  v27 = *(void **)&a1[OBJC_IVAR___CPApplicationPolicyManager_contactStore];
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C971E8]), sel_init);
  if (v16 <= 0xE)
  {
    outlined copy of Data._Representation(v9, v10);
    v29 = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(v9, v10);
  }
  else
  {
    v29 = 0;
  }
  objc_msgSend(v28, sel_setStartingToken_, v29);

  *(_QWORD *)&v85 = 0;
  v30 = objc_msgSend(v27, sel_tu_enumeratorForChangeHistoryFetchRequest_error_, v28, &v85);
  if (v30)
  {
    v31 = v30;
    v73 = v28;
    v74 = v9;
    v32 = (id)v85;
    v33 = objc_msgSend(v31, sel_currentHistoryToken);
    v34 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v36 = v35;

    v37 = swift_allocObject();
    *(_QWORD *)(v37 + 16) = a1;
    v38 = (objc_class *)type metadata accessor for ChangeHistoryProcessor();
    v39 = (char *)objc_allocWithZone(v38);
    v40 = (void (**)(uint64_t, unint64_t))&v39[OBJC_IVAR____TtC14CopresenceCore22ChangeHistoryProcessor_onContactDeleted];
    *v40 = partial apply for closure #2 in closure #1 in CPApplicationPolicyManager.fetchAndProcessContactChangeHistory();
    v40[1] = (void (*)(uint64_t, unint64_t))v37;
    v83.receiver = v39;
    v83.super_class = v38;
    v41 = a1;
    v42 = objc_msgSendSuper2(&v83, sel_init);
    v72 = v31;
    v43 = objc_msgSend(v31, sel_value);
    NSEnumerator.makeIterator()();

    NSFastEnumerationIterator.next()();
    while (v86)
    {
      outlined init with take of Any(&v85, v84);
      type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for CNChangeHistoryEvent);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v44 = v82;
        objc_msgSend(v82, sel_acceptEventVisitor_, v42);

      }
      NSFastEnumerationIterator.next()();
    }
    (*(void (**)(char *, uint64_t))(v75 + 8))(v4, v76);
    outlined copy of Data._Representation(v34, v36);
    outlined copy of Data._Representation(v34, v36);
    v45 = Logger.logObject.getter();
    v46 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      *(_QWORD *)&v84[0] = v48;
      *(_DWORD *)v47 = 136315138;
      v49 = Data._bridgeToObjectiveC()().super.isa;
      v50 = -[objc_class tu_URLSafeBase64EncodedString](v49, sel_tu_URLSafeBase64EncodedString);

      if (v50)
      {
        v51 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v53 = v52;

        *(_QWORD *)&v85 = v51;
        *((_QWORD *)&v85 + 1) = v53;
        v54 = String.init<A>(reflecting:)();
        v56 = v55;
      }
      else
      {
        v54 = 7104878;
        v56 = 0xE300000000000000;
      }
      *(_QWORD *)&v85 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v54, v56, (uint64_t *)v84);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined consume of Data._Representation(v34, v36);
      outlined consume of Data._Representation(v34, v36);
      _os_log_impl(&dword_1ACCCC000, v45, v46, "[CPAppPolicyManager] Writing CPAppPolicy.ContactsChangeHistoryToken:%s", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v48, -1, -1);
      MEMORY[0x1AF44981C](v47, -1, -1);
    }
    else
    {
      outlined consume of Data._Representation(v34, v36);
      outlined consume of Data._Representation(v34, v36);
    }

    v68 = v79;
    os_unfair_lock_lock(*(os_unfair_lock_t *)(v79 + 16));
    v69 = *((_QWORD *)v77 + 3);
    v70 = *((_QWORD *)v77 + 4);
    __swift_project_boxed_opaque_existential_1(v77, v69);
    v86 = MEMORY[0x1E0CB0338];
    *(_QWORD *)&v85 = v34;
    *((_QWORD *)&v85 + 1) = v36;
    v71 = *(void (**)(__int128 *, unint64_t, unint64_t, uint64_t, uint64_t))(v70 + 8);
    outlined copy of Data._Representation(v34, v36);
    v71(&v85, 0xD000000000000026, v78 | 0x8000000000000000, v69, v70);
    outlined destroy of UUID?((uint64_t)&v85, (uint64_t *)&demangling cache variable for type metadata for Any?);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v68 + 16));
    outlined consume of Data?(v74, v81);

    outlined consume of Data._Representation(v34, v36);
  }
  else
  {
    v57 = (id)v85;
    v58 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    outlined consume of Data?(v9, v10);

    v59 = v58;
    v60 = v58;
    v61 = Logger.logObject.getter();
    v62 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc();
      v64 = swift_slowAlloc();
      *(_QWORD *)&v85 = v64;
      *(_DWORD *)v63 = 136315138;
      *(_QWORD *)&v84[0] = v58;
      v65 = v58;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      v66 = String.init<A>(reflecting:)();
      *(_QWORD *)&v84[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v66, v67, (uint64_t *)&v85);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1ACCCC000, v61, v62, "[CPAppPolicyManager] Failed to fetch contacts error: %s", v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v64, -1, -1);
      MEMORY[0x1AF44981C](v63, -1, -1);

    }
    else
    {

    }
  }
}

void closure #2 in closure #1 in CPApplicationPolicyManager.fetchAndProcessContactChangeHistory()(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (one-time initialization token for default != -1)
    swift_once();
  v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v12 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1ACCCC000, v7, v8, "[CPAppPolicyManager] Received deleted contactIdentifier: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v10, -1, -1);
    MEMORY[0x1AF44981C](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v11 = *(_QWORD *)(a3 + OBJC_IVAR___CPApplicationPolicyManager_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v11 + 16));
  closure #1 in closure #2 in closure #1 in CPApplicationPolicyManager.fetchAndProcessContactChangeHistory()(a3, a1, a2);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v11 + 16));
}

uint64_t closure #1 in closure #2 in closure #1 in CPApplicationPolicyManager.fetchAndProcessContactChangeHistory()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  unsigned __int8 *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  int64_t v46;
  unint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[4];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint8_t *v63;
  _QWORD v64[4];
  uint64_t v65[3];
  char v66;
  uint64_t v67;
  uint64_t v68;

  v4 = v3;
  v7 = (_QWORD *)(a1 + OBJC_IVAR___CPApplicationPolicyManager_storage);
  v8 = v7[3];
  v9 = v7[4];
  v59 = v7;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String : Any]);
  v11 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 40);
  v52 = a2;
  v53 = a3;
  v58 = v10;
  v11(v65, v10, a2, a3, v10, v8, v9);
  result = v65[0];
  if (v65[0])
  {
    result = specialized CPAppPolicy.ContactHandles.init(dictionary:)(v65[0]);
    if (v13)
    {
      v15 = result;
      v16 = v13;
      v17 = v14;
      if (one-time initialization token for default != -1)
LABEL_32:
        swift_once();
      v18 = type metadata accessor for Logger();
      __swift_project_value_buffer(v18, (uint64_t)static Log.default);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v19 = Logger.logObject.getter();
      v20 = static os_log_type_t.default.getter();
      v21 = os_log_type_enabled(v19, v20);
      v57 = v17;
      if (v21)
      {
        v22 = (uint8_t *)swift_slowAlloc();
        v68 = swift_slowAlloc();
        v65[0] = v68;
        *(_DWORD *)v22 = 136315138;
        v63 = v22 + 4;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v23 = CPAppPolicy.ContactHandles.description.getter(v15, (void *)v16, v17);
        v25 = v24;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v64[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v25, v65);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1ACCCC000, v19, v20, "[CPAppPolicyManager] Contact deleted, removing %s and associated handles from AuthorizedBundles", v22, 0xCu);
        v26 = v68;
        swift_arrayDestroy();
        MEMORY[0x1AF44981C](v26, -1, -1);
        MEMORY[0x1AF44981C](v22, -1, -1);
        swift_bridgeObjectRelease();

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      v16 = v59[3];
      v15 = v59[4];
      __swift_project_boxed_opaque_existential_1(v59, v16);
      v27 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v58, v58, v16, v15);
      v28 = specialized Dictionary.compactMapValues<A>(_:)(v27);
      v68 = v4;
      swift_bridgeObjectRelease();
      v29 = 0;
      v30 = *(_QWORD *)(v28 + 64);
      v54 = v28 + 64;
      v31 = 1 << *(_BYTE *)(v28 + 32);
      v32 = -1;
      if (v31 < 64)
        v32 = ~(-1 << v31);
      v33 = v32 & v30;
      v55 = (unint64_t)(v31 + 63) >> 6;
      v56 = v28;
      while (1)
      {
        if (v33)
        {
          v62 = (v33 - 1) & v33;
          v63 = v29;
          v34 = __clz(__rbit64(v33)) | ((_QWORD)v29 << 6);
          v4 = v68;
          v35 = v57;
        }
        else
        {
          v45 = __OFADD__(v29, 1);
          v46 = (int64_t)(v29 + 1);
          v4 = v68;
          if (v45)
          {
            __break(1u);
LABEL_31:
            __break(1u);
            goto LABEL_32;
          }
          v35 = v57;
          if (v46 >= v55)
            goto LABEL_28;
          v47 = *(_QWORD *)(v54 + 8 * v46);
          if (!v47)
          {
            v48 = v46 + 1;
            if (v46 + 1 >= v55)
              goto LABEL_28;
            v47 = *(_QWORD *)(v54 + 8 * v48);
            if (!v47)
            {
              v48 = v46 + 2;
              if (v46 + 2 >= v55)
                goto LABEL_28;
              v47 = *(_QWORD *)(v54 + 8 * v48);
              if (!v47)
              {
                v48 = v46 + 3;
                if (v46 + 3 >= v55)
                {
LABEL_28:
                  swift_bridgeObjectRelease();
                  swift_release();
                  v49 = v59[3];
                  v50 = v59[4];
                  __swift_project_boxed_opaque_existential_1(v59, v49);
                  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 24))(v52, v53, v49, v50);
                }
                v47 = *(_QWORD *)(v54 + 8 * v48);
                if (!v47)
                {
                  while (1)
                  {
                    v46 = v48 + 1;
                    if (__OFADD__(v48, 1))
                      goto LABEL_31;
                    if (v46 >= v55)
                      goto LABEL_28;
                    v47 = *(_QWORD *)(v54 + 8 * v46);
                    ++v48;
                    if (v47)
                      goto LABEL_23;
                  }
                }
              }
            }
            v46 = v48;
          }
LABEL_23:
          v62 = (v47 - 1) & v47;
          v63 = (uint8_t *)v46;
          v34 = __clz(__rbit64(v47)) + (v46 << 6);
        }
        v36 = *(_QWORD *)(v56 + 56);
        v37 = (uint64_t *)(*(_QWORD *)(v56 + 48) + 16 * v34);
        v38 = v37[1];
        v61 = *v37;
        v39 = (unsigned __int8 *)(v36 + 40 * v34);
        v16 = *v39;
        v40 = *((_QWORD *)v39 + 1);
        v15 = *((_QWORD *)v39 + 2);
        v60 = v39[24];
        v51[2] = MEMORY[0x1E0C80A78](v35);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v41 = swift_bridgeObjectRetain();
        v42 = specialized _NativeDictionary.filter(_:)(v41, (uint64_t)partial apply for closure #1 in closure #1 in closure #2 in closure #1 in CPApplicationPolicyManager.fetchAndProcessContactChangeHistory(), (uint64_t)v51, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t, uint64_t))specialized closure #1 in _NativeDictionary.filter(_:));
        v68 = v4;
        swift_bridgeObjectRelease();
        v17 = v59[3];
        v43 = v59[4];
        __swift_project_boxed_opaque_existential_1(v59, v17);
        LOBYTE(v65[0]) = v16;
        v65[1] = v40;
        v65[2] = v15;
        v66 = v60;
        v67 = v42;
        swift_retain();
        v44 = CPAppPolicy.AuthorizedBundles.dictionaryRepresentation.getter();
        swift_release();
        swift_bridgeObjectRelease();
        v64[3] = v58;
        v64[0] = v44;
        (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v43 + 8))(v64, v61, v38, v17, v43);
        swift_bridgeObjectRelease();
        outlined destroy of UUID?((uint64_t)v64, (uint64_t *)&demangling cache variable for type metadata for Any?);
        swift_release();
        v33 = v62;
        v29 = v63;
      }
    }
  }
  return result;
}

id ChangeHistoryProcessor.__allocating_init(onContactDeleted:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  objc_super v8;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = &v5[OBJC_IVAR____TtC14CopresenceCore22ChangeHistoryProcessor_onContactDeleted];
  *(_QWORD *)v6 = a1;
  *((_QWORD *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

Swift::Bool __swiftcall CPApplicationPolicyManager.isAuthorized(_:)(Swift::String a1)
{
  _QWORD *v1;
  void *object;
  uint64_t countAndFlagsBits;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  void *v8;
  id v9;
  char v10;
  NSNumber v11;
  id v12;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v4 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (((*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xA0))() & 1) != 0)
  {
    v5 = (*(uint64_t (**)(void))((*v4 & *v1) + 0x98))();
    if (*(_QWORD *)(v5 + 16))
    {
      swift_bridgeObjectRetain();
      v6 = specialized __RawDictionaryStorage.find<A>(_:)(countAndFlagsBits, (uint64_t)object);
      if ((v7 & 1) != 0)
      {
        v8 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v6);
        v9 = v8;
      }
      else
      {
        v8 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = 0;
    }
    swift_bridgeObjectRelease();
    type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
    v11.super.super.isa = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
    if (v8)
    {
      v12 = v8;
      v10 = static NSObject.== infix(_:_:)();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  return v10 & 1;
}

uint64_t CPApplicationPolicyManager.addDelegate(_:queue:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;

  v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xC0))();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 160))(a1, a2);
  return swift_release();
}

uint64_t CPApplicationPolicyManager.shouldAutoLaunchApp(for:on:)(void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  const char *v27;
  uint64_t v28;
  id v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  const char *v36;
  uint64_t v37;
  uint8_t *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  id v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  unint64_t v55;
  unsigned __int8 v56;
  id v57;
  id v58;
  id v59;
  unint64_t v60;
  unsigned __int8 v61;
  id v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  NSObject *v69;
  os_log_type_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88[3];
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  v3 = v2;
  v6 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (((*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xB8))() & 1) == 0)
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v23 = type metadata accessor for Logger();
    __swift_project_value_buffer(v23, (uint64_t)static Log.default);
    v24 = Logger.logObject.getter();
    v25 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v24, v25))
      goto LABEL_30;
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    v27 = "[CPAppPolicyManager] Not allowing auto-launch for unsupported platform";
LABEL_23:
    _os_log_impl(&dword_1ACCCC000, v24, v25, v27, v26, 2u);
    v38 = v26;
LABEL_29:
    MEMORY[0x1AF44981C](v38, -1, -1);
LABEL_30:

    return 0;
  }
  v7 = objc_msgSend(a1, sel_bundleIdentifier);
  if (!v7)
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v28 = type metadata accessor for Logger();
    __swift_project_value_buffer(v28, (uint64_t)static Log.default);
    v29 = a1;
    v24 = Logger.logObject.getter();
    v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v88[0] = v32;
      *(_DWORD *)v31 = 136315138;
      v91 = (uint64_t)v29;
      type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivity);
      v33 = v29;
      v34 = String.init<A>(reflecting:)();
      v91 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, v35, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      v36 = "[CPAppPolicyManager] Unable to auto-launch app for activity with missing bundle identifier: %s";
LABEL_28:
      _os_log_impl(&dword_1ACCCC000, v24, v30, v36, v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v32, -1, -1);
      v38 = v31;
      goto LABEL_29;
    }
LABEL_32:

    return 0;
  }
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;

  if (((*(uint64_t (**)(void))((*v6 & *v3) + 0xA0))() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for default != -1)
      swift_once();
    v37 = type metadata accessor for Logger();
    __swift_project_value_buffer(v37, (uint64_t)static Log.default);
    v24 = Logger.logObject.getter();
    v25 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v24, v25))
      goto LABEL_30;
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    v27 = "[CPAppPolicyManager] Not allowing auto-launch because auto-SharePlay is disabled";
    goto LABEL_23;
  }
  if ((specialized CPApplicationPolicyManager.doesActivityTypeSupportAutoLaunch(activity:)(a1) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for default != -1)
      swift_once();
    v39 = type metadata accessor for Logger();
    __swift_project_value_buffer(v39, (uint64_t)static Log.default);
    v29 = a1;
    v24 = Logger.logObject.getter();
    v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v88[0] = v32;
      *(_DWORD *)v31 = 136315138;
      v91 = (uint64_t)v29;
      type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivity);
      v40 = v29;
      v41 = String.init<A>(reflecting:)();
      v91 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v42, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      v36 = "[CPAppPolicyManager] Auto-launch not supported for activity: %s";
      goto LABEL_28;
    }
    goto LABEL_32;
  }
  v87 = v9;
  v12 = objc_msgSend(a2, sel_mergedRemoteMembers);
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
  lazy protocol witness table accessor for type TUConversationActivitySession and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type TUConversationMember and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
  v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  specialized Sequence.compactMap<A>(_:)(v13, (SEL *)&selRef_handle);
  v15 = v14;
  swift_bridgeObjectRelease();
  v91 = v15;
  v16 = objc_msgSend(a2, sel_lightweightMembers);
  v17 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  specialized Sequence.contains(where:)(v17);
  LOBYTE(v16) = v18;
  swift_bridgeObjectRelease();
  if ((v16 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for default != -1)
      swift_once();
    v19 = type metadata accessor for Logger();
    __swift_project_value_buffer(v19, (uint64_t)static Log.default);
    v20 = Logger.logObject.getter();
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1ACCCC000, v20, v21, "[CPAppPolicyManager] Conversation contains non-validated lightweight member. Not allowing BG launch", v22, 2u);
      MEMORY[0x1AF44981C](v22, -1, -1);
    }

    goto LABEL_54;
  }
  swift_bridgeObjectRetain();
  v44 = objc_msgSend(a2, sel_lightweightMembers);
  v45 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  specialized Sequence.compactMap<A>(_:)(v45, (SEL *)&selRef_handle);
  v46 = v15;
  v48 = v47;
  swift_bridgeObjectRelease();
  v88[0] = v46;
  specialized Array.append<A>(contentsOf:)(v48);
  v90 = v46;
  v49 = objc_msgSend(a2, sel_localMember);
  if (v49)
  {
    v50 = v49;
    v51 = objc_msgSend(v49, sel_handle);
    MEMORY[0x1AF448268]();
    if (*(_QWORD *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();

  }
  v52 = objc_msgSend(a1, sel_originator, v46);
  if (v52)
  {
    v53 = v52;
    v54 = v52;
    v55 = swift_bridgeObjectRetain();
    v56 = specialized Sequence.contains(where:)(v55, (uint64_t)v54);
    swift_bridgeObjectRelease();

    if ((v56 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      if (one-time initialization token for default != -1)
        swift_once();
      v67 = type metadata accessor for Logger();
      __swift_project_value_buffer(v67, (uint64_t)static Log.default);
      v68 = v54;
      v69 = Logger.logObject.getter();
      v70 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v69, v70))
      {
        v71 = swift_slowAlloc();
        v72 = (_QWORD *)swift_slowAlloc();
        v73 = swift_slowAlloc();
        v89 = v73;
        *(_DWORD *)v71 = 138412546;
        v88[0] = (uint64_t)v68;
        v74 = v68;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *v72 = v53;

        *(_WORD *)(v71 + 12) = 2080;
        swift_beginAccess();
        v75 = type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUHandle);
        v76 = swift_bridgeObjectRetain();
        v77 = MEMORY[0x1AF44828C](v76, v75);
        v79 = v78;
        swift_bridgeObjectRelease();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v77, v79, &v89);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v80 = "[CPAppPolicyManager] Activity originator %@ can't be found in the conversation's members %s. Not allowing BG launch";
LABEL_52:
        _os_log_impl(&dword_1ACCCC000, v69, v70, v80, (uint8_t *)v71, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x1AF44981C](v72, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x1AF44981C](v73, -1, -1);
        MEMORY[0x1AF44981C](v71, -1, -1);

        swift_bridgeObjectRelease();
LABEL_54:
        swift_bridgeObjectRelease();
        return 0;
      }
LABEL_53:

      swift_bridgeObjectRelease();
      goto LABEL_54;
    }

  }
  v57 = objc_msgSend(a1, sel_trustedFromHandle);
  if (v57)
  {
    v58 = v57;
    v59 = v57;
    v60 = swift_bridgeObjectRetain();
    v61 = specialized Sequence.contains(where:)(v60, (uint64_t)v59);
    swift_bridgeObjectRelease();

    if ((v61 & 1) != 0)
    {

      goto LABEL_43;
    }
    swift_bridgeObjectRelease();
    if (one-time initialization token for default != -1)
      swift_once();
    v81 = type metadata accessor for Logger();
    __swift_project_value_buffer(v81, (uint64_t)static Log.default);
    v68 = v59;
    v69 = Logger.logObject.getter();
    v70 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = swift_slowAlloc();
      v72 = (_QWORD *)swift_slowAlloc();
      v73 = swift_slowAlloc();
      v89 = v73;
      *(_DWORD *)v71 = 138412546;
      v88[0] = (uint64_t)v68;
      v74 = v68;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v72 = v58;

      *(_WORD *)(v71 + 12) = 2080;
      swift_beginAccess();
      v82 = type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUHandle);
      v83 = swift_bridgeObjectRetain();
      v84 = MEMORY[0x1AF44828C](v83, v82);
      v86 = v85;
      swift_bridgeObjectRelease();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v84, v86, &v89);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v80 = "[CPAppPolicyManager] Activity's trusted fromHandle %@ can't be found in the conversation's members %s. Not a"
            "llowing BG launch";
      goto LABEL_52;
    }
    goto LABEL_53;
  }
LABEL_43:
  v62 = objc_msgSend(a2, sel_lightweightMembers);
  v63 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  specialized Sequence.compactMap<A>(_:)(v63, (SEL *)&selRef_lightweightPrimary);
  v65 = v64;
  swift_bridgeObjectRelease();
  specialized Array.append<A>(contentsOf:)(v65);
  v66 = *(_QWORD *)((char *)v3 + OBJC_IVAR___CPApplicationPolicyManager_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v66 + 16));
  specialized closure #7 in CPApplicationPolicyManager.shouldAutoLaunchApp(for:on:)(v3, v87, v11, a1, v88);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v66 + 16));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return LOBYTE(v88[0]);
}

void specialized closure #7 in CPApplicationPolicyManager.shouldAutoLaunchApp(for:on:)(_QWORD *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, void *a4@<X4>, _BYTE *a5@<X8>)
{
  void *v5;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  BOOL v33;
  uint8_t *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  os_log_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  NSObject *v44;
  NSObject *v45;
  os_log_type_t v46;
  int v47;
  uint64_t v48;
  NSObject *v49;
  _QWORD *v50;
  _BYTE *v51;
  _QWORD v52[6];
  uint8_t *v53;
  uint64_t v54;
  os_log_t v55;
  int v56;
  _BYTE *v57;
  uint64_t v58;
  __int128 v59;
  NSObject *v60;
  __int128 v61;
  _QWORD v62[5];
  __int128 v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  _BYTE v67[24];
  __int128 v68;
  uint64_t v69;
  _QWORD *v70;

  (*(void (**)(_QWORD *__return_ptr, uint64_t, unint64_t))((*MEMORY[0x1E0DEEDD8] & *a1) + 0x110))(v62, a2, a3);
  outlined init with take of CPAppPolicy.AuthorizedBundles?((uint64_t)v62, (uint64_t)&v63);
  if (!v64)
  {
    *a5 = 0;
    return;
  }
  *(_OWORD *)v67 = v63;
  *(_QWORD *)&v67[16] = v64;
  v11 = v66;
  if ((v65 & 1) != 0)
  {
    swift_beginAccess();
    v18 = swift_bridgeObjectRetain();
    v19 = specialized Set.init<A>(_:)(v18);
    swift_bridgeObjectRelease();
    v20 = specialized CPApplicationPolicyManager.hashedHandles(from:)(v19);
    if (v5)
    {

      swift_bridgeObjectRelease();
      v68 = *(_OWORD *)&v67[8];
      outlined release of String((uint64_t)&v68);
      v69 = v11;
      outlined release of [String : Date]((uint64_t)&v69);
    }
    else
    {
      v26 = v20;
      v27 = swift_bridgeObjectRelease();
      if (*(_QWORD *)(v26 + 16))
      {
        *(_QWORD *)&v68 = v11;
        MEMORY[0x1E0C80A78](v27);
        v52[2] = a1;
        outlined retain of [UInt64 : AttachmentLedger_AttachmentEncryption].Values((uint64_t)&v68);
        v28 = specialized _NativeDictionary.filter(_:)(v11, (uint64_t)closure #1 in CPApplicationPolicyManager.expiredHandles(from:)partial apply, (uint64_t)v52, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t, uint64_t))specialized closure #1 in _NativeDictionary.filter(_:));
        outlined release of [String : Date]((uint64_t)&v68);
        if (one-time initialization token for default != -1)
          swift_once();
        v29 = type metadata accessor for Logger();
        v30 = __swift_project_value_buffer(v29, (uint64_t)static Log.default);
        swift_retain_n();
        v70 = (_QWORD *)v30;
        v31 = Logger.logObject.getter();
        v32 = static os_log_type_t.debug.getter();
        v56 = v32;
        v33 = os_log_type_enabled(v31, v32);
        v57 = a5;
        if (v33)
        {
          v55 = v31;
          v34 = (uint8_t *)swift_slowAlloc();
          v54 = swift_slowAlloc();
          *(_QWORD *)&v59 = v54;
          v53 = v34;
          *(_DWORD *)v34 = 136315138;
          v52[5] = v34 + 4;
          type metadata accessor for Date();
          swift_retain();
          v35 = Dictionary.description.getter();
          v37 = v36;
          swift_release();
          v69 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v37, (uint64_t *)&v59);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release_n();
          swift_bridgeObjectRelease();
          v38 = v55;
          v39 = v53;
          _os_log_impl(&dword_1ACCCC000, v55, (os_log_type_t)v56, "[CPAppPolicyManager] Expired handles: %s", v53, 0xCu);
          v40 = v54;
          swift_arrayDestroy();
          MEMORY[0x1AF44981C](v40, -1, -1);
          MEMORY[0x1AF44981C](v39, -1, -1);

        }
        else
        {

          swift_release_n();
        }
        v41 = swift_bridgeObjectRetain();
        v42 = specialized Set.init<A>(_:)(v41);
        v59 = *(_OWORD *)&v67[8];
        outlined release of String((uint64_t)&v59);
        outlined release of [String : Date]((uint64_t)&v68);
        v69 = v42;
        specialized Set._subtract<A>(_:)(v28);
        swift_release();
        v43 = specialized Set.isSubset(of:)(v69, v26);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v44 = a4;
        v45 = Logger.logObject.getter();
        v46 = static os_log_type_t.default.getter();
        v47 = v46;
        if (os_log_type_enabled(v45, v46))
        {
          v48 = swift_slowAlloc();
          v70 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v48 = 67109378;
          LODWORD(v60) = v43 & 1;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v48 + 8) = 2112;
          v56 = v47;
          v60 = v44;
          v49 = v44;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          v50 = v70;
          *v70 = v44;

          _os_log_impl(&dword_1ACCCC000, v45, (os_log_type_t)v56, "[CPAppPolicyManager] Application allowed to auto-launch: %{BOOL}d for activity: %@", (uint8_t *)v48, 0x12u);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy();
          MEMORY[0x1AF44981C](v50, -1, -1);
          MEMORY[0x1AF44981C](v48, -1, -1);
        }
        else
        {

          v45 = v44;
        }
        v51 = v57;

        *v51 = v43 & 1;
        return;
      }
      v68 = *(_OWORD *)&v67[8];
      outlined release of String((uint64_t)&v68);
      v69 = v11;
      outlined release of [String : Date]((uint64_t)&v69);
      swift_bridgeObjectRelease();
    }
    if (one-time initialization token for default != -1)
      swift_once();
    v21 = type metadata accessor for Logger();
    __swift_project_value_buffer(v21, (uint64_t)static Log.default);
    v13 = Logger.logObject.getter();
    v22 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v13, v22))
      goto LABEL_15;
    v15 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v60 = v23;
    *(_DWORD *)v15 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [TUHandle]);
    v24 = String.init<A>(reflecting:)();
    v58 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, (uint64_t *)&v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v13, v22, "[CPAppPolicyManager] Error getting normalized handles from handles: %s", v15, 0xCu);
    swift_arrayDestroy();
    v17 = v23;
LABEL_14:
    MEMORY[0x1AF44981C](v17, -1, -1);
    MEMORY[0x1AF44981C](v15, -1, -1);
LABEL_15:

    *a5 = 0;
    return;
  }
  v61 = *(_OWORD *)&v67[8];
  outlined release of String((uint64_t)&v61);
  *(_QWORD *)&v59 = v11;
  outlined release of [String : Date]((uint64_t)&v59);
  if (one-time initialization token for default != -1)
    swift_once();
  v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  v13 = Logger.logObject.getter();
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    *(_QWORD *)&v68 = v16;
    v70 = v5;
    *(_DWORD *)v15 = 136315138;
    swift_bridgeObjectRetain();
    v69 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, a3, (uint64_t *)&v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1ACCCC000, v13, v14, "[CPAppPolicyManager] Application %s is not authorized", v15, 0xCu);
    swift_arrayDestroy();
    v17 = v16;
    goto LABEL_14;
  }

  swift_bridgeObjectRelease_n();
  *a5 = 0;
}

uint64_t specialized Set.isSubset(of:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  int64_t i;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  Swift::Int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (*(_QWORD *)(a1 + 16) < *(_QWORD *)(a2 + 16))
    return 0;
  v3 = a2;
  v4 = a1;
  v31 = a2 + 56;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  if (-v5 < 64)
    v6 = ~(-1 << -(char)v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(a2 + 56);
  v30 = (unint64_t)(63 - v5) >> 6;
  v32 = a1 + 56;
  result = swift_bridgeObjectRetain();
  for (i = 0; ; i = v12)
  {
    if (v7)
    {
      v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v11 = v10 | (i << 6);
      v12 = i;
      if (!*(_QWORD *)(v4 + 16))
        goto LABEL_40;
      goto LABEL_25;
    }
    v13 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v13 >= v30)
      goto LABEL_41;
    v14 = *(_QWORD *)(v31 + 8 * v13);
    v12 = i + 1;
    if (!v14)
    {
      v12 = i + 2;
      if (i + 2 >= v30)
        goto LABEL_41;
      v14 = *(_QWORD *)(v31 + 8 * v12);
      if (!v14)
      {
        v12 = i + 3;
        if (i + 3 >= v30)
          goto LABEL_41;
        v14 = *(_QWORD *)(v31 + 8 * v12);
        if (!v14)
          break;
      }
    }
LABEL_24:
    v7 = (v14 - 1) & v14;
    v11 = __clz(__rbit64(v14)) + (v12 << 6);
    if (!*(_QWORD *)(v4 + 16))
    {
LABEL_40:
      v2 = 0;
      goto LABEL_42;
    }
LABEL_25:
    v16 = v3;
    v17 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v11);
    v19 = *v17;
    v18 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    v20 = Hasher._finalize()();
    v21 = v4;
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = v20 & ~v22;
    if (((*(_QWORD *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
      goto LABEL_39;
    v24 = *(_QWORD *)(v21 + 48);
    v25 = (_QWORD *)(v24 + 16 * v23);
    v26 = *v25 == v19 && v25[1] == v18;
    if (!v26 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v27 = ~v22;
      while (1)
      {
        v23 = (v23 + 1) & v27;
        if (((*(_QWORD *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
          break;
        v28 = (_QWORD *)(v24 + 16 * v23);
        v29 = *v28 == v19 && v28[1] == v18;
        if (v29 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          goto LABEL_7;
      }
LABEL_39:
      swift_bridgeObjectRelease();
      v2 = 0;
LABEL_42:
      outlined consume of [String : ()].Iterator._Variant();
      return v2;
    }
LABEL_7:
    result = swift_bridgeObjectRelease();
    v3 = v16;
    v4 = v21;
  }
  v15 = i + 4;
  if (i + 4 >= v30)
  {
LABEL_41:
    v2 = 1;
    goto LABEL_42;
  }
  v14 = *(_QWORD *)(v31 + 8 * v15);
  if (v14)
  {
    v12 = i + 4;
    goto LABEL_24;
  }
  while (1)
  {
    v12 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v12 >= v30)
      goto LABEL_41;
    v14 = *(_QWORD *)(v31 + 8 * v12);
    ++v15;
    if (v14)
      goto LABEL_24;
  }
LABEL_45:
  __break(1u);
  return result;
}

void CPApplicationPolicyManager.updateAllowedHandles(for:)(void *a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;

  v3 = objc_msgSend(a1, sel_activitySessions);
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivitySession);
  lazy protocol witness table accessor for type TUConversationActivitySession and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type TUConversationActivitySession and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivitySession);
  v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  v5 = v1;
  v6 = a1;
  specialized Sequence.forEach(_:)(v4, v5, (uint64_t)v6);
  swift_bridgeObjectRelease();

}

void CPApplicationPolicyManager.updateAllowedHandles(for:on:)(void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v6;
  id v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  os_log_type_t type;
  NSObject *oslog;
  uint64_t v49;

  v3 = v2;
  v6 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (((*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xB8))() & 1) == 0)
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)static Log.default);
    oslog = Logger.logObject.getter();
    v17 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(oslog, v17))
      goto LABEL_24;
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    v19 = "[CPAppPolicyManager] Ignoring update to allowed handles for unsupported platform";
    goto LABEL_23;
  }
  v7 = objc_msgSend(a1, sel_activity);
  v8 = objc_msgSend(v7, sel_bundleIdentifier);

  if (!v8)
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v20 = type metadata accessor for Logger();
    __swift_project_value_buffer(v20, (uint64_t)static Log.default);
    oslog = a1;
    v21 = Logger.logObject.getter();
    v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v49 = v24;
      *(_DWORD *)v23 = 136315138;
      type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivitySession);
      v25 = oslog;
      v26 = String.init<A>(reflecting:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, &v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ACCCC000, v21, v22, "[CPAppPolicyManager] Unable to update allowed handles for activity with missing bundle identifier: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v24, -1, -1);
      MEMORY[0x1AF44981C](v23, -1, -1);

      return;
    }

    goto LABEL_24;
  }
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;

  if (((*(uint64_t (**)(void))((*v6 & *v3) + 0xA0))() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for default != -1)
      swift_once();
    v28 = type metadata accessor for Logger();
    __swift_project_value_buffer(v28, (uint64_t)static Log.default);
    oslog = Logger.logObject.getter();
    v17 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(oslog, v17))
      goto LABEL_24;
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    v19 = "[CPAppPolicyManager] Ignoring update to allowed handles since auto-SharePlay is disabled";
    goto LABEL_23;
  }
  if (!objc_msgSend(a1, sel_isPermittedToJoin))
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for default != -1)
      swift_once();
    v29 = type metadata accessor for Logger();
    __swift_project_value_buffer(v29, (uint64_t)static Log.default);
    oslog = Logger.logObject.getter();
    v17 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(oslog, v17))
      goto LABEL_24;
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    v19 = "[CPAppPolicyManager] Ignoring update to allowed handles since activity session is not permitted to be joined.";
LABEL_23:
    _os_log_impl(&dword_1ACCCC000, oslog, v17, v19, v18, 2u);
    MEMORY[0x1AF44981C](v18, -1, -1);
LABEL_24:

    return;
  }
  v12 = objc_msgSend(a2, sel_mergedRemoteMembers);
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
  lazy protocol witness table accessor for type TUConversationActivitySession and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type TUConversationMember and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
  v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  specialized Sequence.compactMap<A>(_:)(v13, (SEL *)&selRef_handle);
  swift_bridgeObjectRelease();
  v14 = swift_bridgeObjectRetain();
  v15 = specialized Set.init<A>(_:)(v14);
  swift_bridgeObjectRelease();
  v30 = specialized CPApplicationPolicyManager.hashedHandles(from:)(v15);
  swift_bridgeObjectRelease();
  if (one-time initialization token for default != -1)
    swift_once();
  v31 = type metadata accessor for Logger();
  __swift_project_value_buffer(v31, (uint64_t)static Log.default);
  v32 = a1;
  swift_bridgeObjectRetain();
  v33 = v32;
  v34 = Logger.logObject.getter();
  v35 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v34, v35))
  {
    type = v35;
    v36 = swift_slowAlloc();
    v46 = swift_slowAlloc();
    v49 = v46;
    *(_DWORD *)v36 = 136315394;
    type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivitySession);
    v37 = v33;
    v38 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v39, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v36 + 12) = 2080;
    v40 = type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUHandle);
    v41 = swift_bridgeObjectRetain();
    v42 = MEMORY[0x1AF44828C](v41, v40);
    v44 = v43;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v44, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v34, type, "[CPAppPolicyManager] Updating allowed handles for activity: %s with handles: %s", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v46, -1, -1);
    MEMORY[0x1AF44981C](v36, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  CPApplicationPolicyManager.fetchAndStoreContactIdentifiers(for:)(a2);
  v45 = *(_QWORD *)((char *)v3 + OBJC_IVAR___CPApplicationPolicyManager_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v45 + 16));
  CPApplicationPolicyManager.updateAllowedHandles(_:for:)(v30, v9, v11);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v45 + 16));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall CPApplicationPolicyManager.setAuthorization(_:for:)(Swift::Bool _, Swift::String a2)
{
  _QWORD *v2;
  _QWORD *v3;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD v27[5];
  uint64_t v28[5];
  uint64_t v29;
  uint64_t v30;
  void *v31;
  Swift::Bool v32;
  uint64_t v33;

  v3 = v2;
  object = a2._object;
  countAndFlagsBits = a2._countAndFlagsBits;
  if (one-time initialization token for default != -1)
    swift_once();
  v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v29 = v11;
    *(_DWORD *)v10 = 67109378;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v10 + 8) = 2080;
    swift_bridgeObjectRetain();
    v28[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1ACCCC000, v8, v9, "[CPAppPolicyManager] Setting authorization: %{BOOL}d for bundleID: %s", (uint8_t *)v10, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v11, -1, -1);
    MEMORY[0x1AF44981C](v10, -1, -1);

  }
  else
  {

    v12 = swift_bridgeObjectRelease_n();
  }
  v13 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v3) + 0xA0))(v12) & 1) != 0)
  {
    v14 = *(_QWORD *)((char *)v3 + OBJC_IVAR___CPApplicationPolicyManager_lock);
    os_unfair_lock_lock(*(os_unfair_lock_t *)(v14 + 16));
    v15 = countAndFlagsBits;
    (*(void (**)(_QWORD *__return_ptr, uint64_t, void *))((*v13 & *v3) + 0x110))(v27, countAndFlagsBits, object);
    v16 = v27[0];
    v17 = v27[1];
    v18 = (void *)v27[2];
    v19 = v27[4];
    outlined init with take of CPAppPolicy.AuthorizedBundles?((uint64_t)v27, (uint64_t)v28);
    if (v28[2])
    {
      v15 = v17;
      object = v18;
    }
    else
    {
      swift_bridgeObjectRetain();
      v16 = 2;
      v19 = MEMORY[0x1E0DEE9E0];
    }
    LOBYTE(v29) = v16;
    v30 = v15;
    v31 = object;
    v32 = _;
    v33 = v19;
    CPApplicationPolicyManager.persist(_:)((uint64_t)&v29);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v14 + 16));
  }
  else
  {
    swift_bridgeObjectRetain_n();
    v20 = Logger.logObject.getter();
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = countAndFlagsBits;
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v28[0] = v24;
      *(_DWORD *)v23 = 136315138;
      v29 = v22;
      v30 = (uint64_t)object;
      swift_bridgeObjectRetain();
      v25 = String.init<A>(reflecting:)();
      v29 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v26, v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ACCCC000, v20, v21, "[CPAppPolicyManager] Not setting authorization for %s as auto-SharePlay is disabled", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v24, -1, -1);
      MEMORY[0x1AF44981C](v23, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

Swift::Void __swiftcall CPApplicationPolicyManager.removeAuthorization(for:)(Swift::OpaquePointer a1)
{
  uint64_t v1;
  id v3;
  unsigned int v4;
  os_log_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  os_log_t oslog;
  NSObject *osloga;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DBD2F0]), sel_init);
  v4 = objc_msgSend(v3, sel_expanseEnabled);

  if (v4)
  {
    v5 = *(os_log_t *)(v1 + OBJC_IVAR___CPApplicationPolicyManager_lock);
    os_unfair_lock_lock((os_unfair_lock_t)v5[2].isa);
    v6 = *((_QWORD *)a1._rawValue + 2);
    if (v6)
    {
      oslog = v5;
      v7 = (_QWORD *)(v1 + OBJC_IVAR___CPApplicationPolicyManager_storage);
      swift_bridgeObjectRetain();
      v8 = (uint64_t *)((char *)a1._rawValue + 40);
      do
      {
        v9 = *(v8 - 1);
        v10 = *v8;
        v11 = v7[3];
        v12 = v7[4];
        __swift_project_boxed_opaque_existential_1(v7, v11);
        v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 24);
        swift_bridgeObjectRetain();
        v13(v9, v10, v11, v12);
        swift_bridgeObjectRelease();
        v8 += 2;
        --v6;
      }
      while (v6);
      swift_bridgeObjectRelease();
      v5 = oslog;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v5[2].isa);
  }
  else
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Log.default);
    osloga = Logger.logObject.getter();
    v15 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(osloga, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1ACCCC000, osloga, v15, "[CPAppPolicyManager] removeAuthorization called with ff disabled", v16, 2u);
      MEMORY[0x1AF44981C](v16, -1, -1);
    }

  }
}

Swift::Void __swiftcall CPApplicationPolicyManager.handleApplicationUninstalledNotification(_:)(NSNotification a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  objc_class *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23[5];
  __int128 v24;
  __int128 v25;

  v2 = v1;
  if (one-time initialization token for default != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  v5 = __swift_project_value_buffer(v4, (uint64_t)static Log.default);
  v6 = a1.super.isa;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v22 = v5;
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v23[0] = v10;
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)&v24 = v6;
    type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for NSNotification);
    v11 = v6;
    v12 = String.init<A>(reflecting:)();
    *(_QWORD *)&v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v7, v8, "[CPAppPolicyManager] handleApplicationUninstalledNotification %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v10, -1, -1);
    MEMORY[0x1AF44981C](v9, -1, -1);

  }
  else
  {

  }
  v14 = -[objc_class userInfo](v6, sel_userInfo, v22);
  if (!v14)
  {
    v24 = 0u;
    v25 = 0u;
LABEL_15:
    outlined destroy of UUID?((uint64_t)&v24, (uint64_t *)&demangling cache variable for type metadata for Any?);
    goto LABEL_16;
  }
  v15 = v14;
  v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(v16 + 16) && (v17 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v23), (v18 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v16 + 56) + 32 * v17, (uint64_t)&v24);
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v23);
  if (!*((_QWORD *)&v25 + 1))
    goto LABEL_15;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  if ((swift_dynamicCast() & 1) != 0)
  {
    (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x180))(v23[0]);
    swift_bridgeObjectRelease();
    return;
  }
LABEL_16:
  v19 = Logger.logObject.getter();
  v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1ACCCC000, v19, v20, "[CPAppPolicyManager] could not get list of bundleIDs while handing app uninstalled enotification", v21, 2u);
    MEMORY[0x1AF44981C](v21, -1, -1);
  }

}

Swift::Void __swiftcall CPApplicationPolicyManager.handleCNContactStoreDidChangeNotification(_:)(NSNotification a1)
{
  uint64_t v2;
  objc_class *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (one-time initialization token for default != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.default);
  v3 = a1.super.isa;
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v11 = v7;
    *(_DWORD *)v6 = 136315138;
    type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for NSNotification);
    v8 = v3;
    v9 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v4, v5, "[CPAppPolicyManager] handleCNContactStoreDidChangeNotification %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v7, -1, -1);
    MEMORY[0x1AF44981C](v6, -1, -1);

  }
  else
  {

  }
  CPApplicationPolicyManager.fetchAndProcessContactChangeHistory()();
}

void CPApplicationPolicyManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

Swift::Void __swiftcall CPApplicationPolicyManager.appProtectionsChanged(bundleIDs:)(Swift::OpaquePointer bundleIDs)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void (*v5)(_QWORD *__return_ptr, _QWORD);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  void (*v23)(_QWORD *__return_ptr, _QWORD);
  uint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[3];
  uint64_t v29;
  uint64_t v30;

  v2 = *((_QWORD *)bundleIDs._rawValue + 2);
  if (!v2)
    return;
  v3 = v1;
  v4 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v5 = *(void (**)(_QWORD *__return_ptr, _QWORD))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xD8);
  v25 = (char *)bundleIDs._rawValue + 32;
  swift_bridgeObjectRetain();
  v6 = 0;
  v23 = v5;
  v24 = v2;
  while (1)
  {
    v8 = &v25[16 * v6];
    v10 = *(_QWORD *)v8;
    v9 = *((_QWORD *)v8 + 1);
    v11 = swift_bridgeObjectRetain();
    v5(&v26, v11);
    if (!v27)
    {
      outlined destroy of UUID?((uint64_t)&v26, &demangling cache variable for type metadata for ProtectedAppsObserverProtocol?);
LABEL_17:
      (*(void (**)(uint64_t, uint64_t, uint64_t))((*v4 & *v3) + 0x178))(1, v10, v9);
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
    outlined init with take of BackgroundSessionManagerDataSource(&v26, (uint64_t)v28);
    v12 = v29;
    v13 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    v14 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(v13 + 32))(v12, v13);
    v15 = v14;
    v16 = v14[2];
    if (!v16)
    {
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
    v17 = v14[4] == v10 && v14[5] == v9;
    if (!v17 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      if (v16 == 1)
        goto LABEL_13;
      v18 = v15[6] == v10 && v15[7] == v9;
      if (!v18 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        break;
    }
LABEL_3:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1ACF59E20;
    *(_QWORD *)(v7 + 32) = v10;
    *(_QWORD *)(v7 + 40) = v9;
    (*(void (**)(void))((*v4 & *v3) + 0x180))();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
    v5 = v23;
    v2 = v24;
LABEL_4:
    if (++v6 == v2)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  if (v16 == 2)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    v5 = v23;
    v2 = v24;
LABEL_16:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
    goto LABEL_17;
  }
  v19 = v15 + 9;
  v20 = 2;
  while (1)
  {
    v21 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    v22 = *(v19 - 1) == v10 && *v19 == v9;
    if (v22 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      goto LABEL_3;
    v19 += 2;
    ++v20;
    if (v21 == v16)
      goto LABEL_13;
  }
  __break(1u);
}

uint64_t ChangeHistoryProcessor.onContactDeleted.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14CopresenceCore22ChangeHistoryProcessor_onContactDeleted);
  swift_retain();
  return v1;
}

Swift::Void __swiftcall ChangeHistoryProcessor.visit(_:)(CNChangeHistoryDeleteContactEvent a1)
{
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(void (**)(uint64_t, uint64_t))(v1
                                               + OBJC_IVAR____TtC14CopresenceCore22ChangeHistoryProcessor_onContactDeleted);
  v3 = -[objc_class contactIdentifier](a1.super.super.isa, sel_contactIdentifier);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;

  v2(v4, v6);
  swift_bridgeObjectRelease();
}

id ChangeHistoryProcessor.init(onContactDeleted:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_super v5;

  v3 = &v2[OBJC_IVAR____TtC14CopresenceCore22ChangeHistoryProcessor_onContactDeleted];
  *(_QWORD *)v3 = a1;
  *((_QWORD *)v3 + 1) = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for ChangeHistoryProcessor();
  return objc_msgSendSuper2(&v5, sel_init);
}

id ChangeHistoryProcessor.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ChangeHistoryProcessor.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ChangeHistoryProcessor.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChangeHistoryProcessor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall CPApplicationPolicyManager.clearBackgroundAccessForAllApps()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
  v20 = *(_QWORD *)((char *)v0 + OBJC_IVAR___CPApplicationPolicyManager_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v20 + 16));
  v21 = v1 + 64;
  v2 = 1 << *(_BYTE *)(v1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(v1 + 64);
  v5 = (_QWORD *)((char *)v0 + OBJC_IVAR___CPApplicationPolicyManager_storage);
  v22 = (unint64_t)(v2 + 63) >> 6;
  v23 = v1;
  swift_bridgeObjectRetain();
  v6 = 0;
  while (1)
  {
    if (v4)
    {
      v7 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      v8 = v7 | (v6 << 6);
      goto LABEL_5;
    }
    v17 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v17 >= v22)
      goto LABEL_25;
    v18 = *(_QWORD *)(v21 + 8 * v17);
    ++v6;
    if (!v18)
    {
      v6 = v17 + 1;
      if (v17 + 1 >= v22)
        goto LABEL_25;
      v18 = *(_QWORD *)(v21 + 8 * v6);
      if (!v18)
      {
        v6 = v17 + 2;
        if (v17 + 2 >= v22)
          goto LABEL_25;
        v18 = *(_QWORD *)(v21 + 8 * v6);
        if (!v18)
        {
          v6 = v17 + 3;
          if (v17 + 3 >= v22)
            goto LABEL_25;
          v18 = *(_QWORD *)(v21 + 8 * v6);
          if (!v18)
          {
            v6 = v17 + 4;
            if (v17 + 4 >= v22)
              goto LABEL_25;
            v18 = *(_QWORD *)(v21 + 8 * v6);
            if (!v18)
              break;
          }
        }
      }
    }
LABEL_24:
    v4 = (v18 - 1) & v18;
    v8 = __clz(__rbit64(v18)) + (v6 << 6);
LABEL_5:
    v9 = (uint64_t *)(*(_QWORD *)(v23 + 48) + 16 * v8);
    v10 = *v9;
    v11 = v9[1];
    v12 = *(void **)(*(_QWORD *)(v23 + 56) + 8 * v8);
    v13 = v5[3];
    v14 = v5[4];
    __swift_project_boxed_opaque_existential_1(v5, v13);
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 24);
    swift_bridgeObjectRetain();
    v16 = v12;
    v15(v10, v11, v13, v14);

    swift_bridgeObjectRelease();
  }
  v19 = v17 + 5;
  if (v19 >= v22)
  {
LABEL_25:
    swift_release();
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v20 + 16));
    swift_bridgeObjectRelease();
    return;
  }
  v18 = *(_QWORD *)(v21 + 8 * v19);
  if (v18)
  {
    v6 = v19;
    goto LABEL_24;
  }
  while (1)
  {
    v6 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v6 >= v22)
      goto LABEL_25;
    v18 = *(_QWORD *)(v21 + 8 * v6);
    ++v19;
    if (v18)
      goto LABEL_24;
  }
LABEL_27:
  __break(1u);
}

uint64_t type metadata accessor for CPApplicationPolicyManager()
{
  return objc_opt_self();
}

uint64_t (*specialized protocol witness for Collection.subscript.read in conformance [A](uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = specialized Array.subscript.read(v6, a2, a3);
  return protocol witness for PresenceDataSource.members.modify in conformance SKPresenceDataSource<A>;
}

uint64_t (*specialized protocol witness for Collection.subscript.read in conformance [A](void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = specialized Array.subscript.read(v6, a2, a3);
  return protocol witness for PresenceDataSource.members.modify in conformance SKPresenceDataSource<A>;
}

uint64_t (*specialized Array.subscript.read(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x1AF448904](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_unknownObjectRetain();
LABEL_5:
    *v3 = v4;
    return Array.subscript.readspecialized ;
  }
  __break(1u);
  return result;
}

uint64_t Array.subscript.readspecialized ()
{
  return swift_unknownObjectRelease();
}

void (*specialized Array.subscript.read(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x1AF448904](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return destroy for IDSGroupSessionProvider.CurrentSessionInfo;
  }
  __break(1u);
  return result;
}

uint64_t specialized CPApplicationPolicyManager.hashedHandles(from:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  _QWORD v61[3];
  int64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v3 = type metadata accessor for SHA256Digest();
  v70 = *(_QWORD *)(v3 - 8);
  v71 = v3;
  v4 = MEMORY[0x1E0C80A78](v3);
  v65 = (char *)v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v4);
  v69 = (char *)v61 - v7;
  MEMORY[0x1E0C80A78](v6);
  v68 = (char *)v61 - v8;
  v9 = type metadata accessor for SharableObjectIdentifier();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  specialized Sequence.compactMap<A>(_:)(a1);
  v13 = v12;
  if ((a1 & 0xC000000000000001) != 0)
    v14 = __CocoaSet.count.getter();
  else
    v14 = *(_QWORD *)(a1 + 16);
  if (v14 != *(_QWORD *)(v13 + 16))
  {
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type CPApplicationPolicyManager.InputError and conformance CPApplicationPolicyManager.InputError();
    swift_allocError();
    swift_willThrow();
    return v13;
  }
  if (!v14)
  {
    swift_bridgeObjectRelease();
    v46 = MEMORY[0x1E0DEE9D8];
LABEL_36:
    v13 = specialized Set.init<A>(_:)(v46);
    swift_bridgeObjectRelease();
    return v13;
  }
  v61[2] = v1;
  v79 = MEMORY[0x1E0DEE9D8];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14, 0);
  v15 = 0;
  v61[1] = v13;
  v64 = v13 + 32;
  v75 = xmmword_1ACF59E20;
  v62 = v14;
  v63 = v11;
  while (1)
  {
    v67 = v15;
    v16 = (uint64_t *)(v64 + 16 * v15);
    v17 = *v16;
    v18 = v16[1];
    swift_bridgeObjectRetain();
    SHA256.init()();
    specialized SharableObjectIdentifier.update<A>(_:)(v17, v18);
    v19 = v68;
    SHA256.finalize()();
    v20 = v69;
    v21 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
    v22 = v71;
    v21(v69, v19, v71);
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type SHA256Digest and conformance SHA256Digest, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA92F8], MEMORY[0x1E0CA9308]);
    v23 = dispatch thunk of Sequence.underestimatedCount.getter();
    v78 = MEMORY[0x1E0DEE9D8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v23 & ~(v23 >> 63), 0);
    v24 = v78;
    v21(v65, v20, v22);
    result = dispatch thunk of Sequence.makeIterator()();
    if (v23 < 0)
      break;
    v26 = v77;
    v66 = v18;
    if (v23)
    {
      v27 = v76;
      v73 = *(_QWORD *)(v76 + 16);
      if (v77 == v73)
        goto LABEL_44;
      v74 = v76 + 32;
      v28 = v23 - 1;
      v29 = v77;
      v72 = v76;
      while ((v26 & 0x8000000000000000) == 0)
      {
        if (v29 >= *(_QWORD *)(v27 + 16))
          goto LABEL_39;
        v30 = v26;
        v31 = *(_BYTE *)(v74 + v29);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
        v32 = swift_allocObject();
        *(_OWORD *)(v32 + 16) = v75;
        *(_QWORD *)(v32 + 56) = MEMORY[0x1E0DEDE70];
        *(_QWORD *)(v32 + 64) = MEMORY[0x1E0DEDEC8];
        *(_BYTE *)(v32 + 32) = v31;
        result = String.init(format:_:)();
        v33 = result;
        v35 = v34;
        v78 = v24;
        v37 = *(_QWORD *)(v24 + 16);
        v36 = *(_QWORD *)(v24 + 24);
        if (v37 >= v36 >> 1)
        {
          result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v36 > 1, v37 + 1, 1);
          v24 = v78;
        }
        *(_QWORD *)(v24 + 16) = v37 + 1;
        v38 = v24 + 16 * v37;
        *(_QWORD *)(v38 + 32) = v33;
        *(_QWORD *)(v38 + 40) = v35;
        if (!v28)
        {
          v26 = v29 + 1;
          v77 = v29 + 1;
          goto LABEL_19;
        }
        ++v29;
        --v28;
        v27 = v72;
        v26 = v30;
        if (v73 == v29)
          goto LABEL_40;
      }
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
LABEL_19:
    v39 = v76;
    v40 = *(_QWORD *)(v76 + 16);
    v74 = v40;
    if (v26 != v40)
    {
      if (v26 >= v40)
        goto LABEL_45;
      v73 = v76 + 32;
      v51 = v26;
      while ((v26 & 0x8000000000000000) == 0)
      {
        if (v51 >= *(_QWORD *)(v39 + 16))
          goto LABEL_42;
        v52 = v26;
        v53 = *(_BYTE *)(v73 + v51);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
        v54 = swift_allocObject();
        *(_OWORD *)(v54 + 16) = v75;
        *(_QWORD *)(v54 + 56) = MEMORY[0x1E0DEDE70];
        *(_QWORD *)(v54 + 64) = MEMORY[0x1E0DEDEC8];
        *(_BYTE *)(v54 + 32) = v53;
        result = String.init(format:_:)();
        v55 = result;
        v57 = v56;
        v78 = v24;
        v59 = *(_QWORD *)(v24 + 16);
        v58 = *(_QWORD *)(v24 + 24);
        if (v59 >= v58 >> 1)
        {
          result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v58 > 1, v59 + 1, 1);
          v24 = v78;
        }
        ++v51;
        *(_QWORD *)(v24 + 16) = v59 + 1;
        v60 = v24 + 16 * v59;
        *(_QWORD *)(v60 + 32) = v55;
        *(_QWORD *)(v60 + 40) = v57;
        v26 = v52;
        if (v74 == v51)
          goto LABEL_20;
      }
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      break;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    v76 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A], &demangling cache variable for type metadata for [String], MEMORY[0x1E0DEAF20]);
    v41 = BidirectionalCollection<>.joined(separator:)();
    v43 = v42;
    v44 = *(void (**)(char *, uint64_t))(v70 + 8);
    v45 = v71;
    v44(v69, v71);
    swift_bridgeObjectRelease();
    v44(v68, v45);
    outlined destroy of SharableObjectIdentifier((uint64_t)v63);
    swift_bridgeObjectRelease();
    v46 = v79;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v46 + 16) + 1, 1);
      v46 = v79;
    }
    v47 = v67;
    v49 = *(_QWORD *)(v46 + 16);
    v48 = *(_QWORD *)(v46 + 24);
    if (v49 >= v48 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v48 > 1, v49 + 1, 1);
      v46 = v79;
    }
    v15 = v47 + 1;
    *(_QWORD *)(v46 + 16) = v49 + 1;
    v50 = v46 + 16 * v49;
    *(_QWORD *)(v50 + 32) = v41;
    *(_QWORD *)(v50 + 40) = v43;
    if (v15 == v62)
    {
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
  return result;
}

uint64_t outlined init with take of CPAppPolicy.AuthorizedBundles?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CPAppPolicy.AuthorizedBundles?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t specialized closure #1 in _NativeDictionary.filter(_:)(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, char *))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, char *);
  _QWORD *v31;

  v25 = a2;
  v30 = a4;
  v26 = a1;
  v5 = type metadata accessor for Date();
  v6 = *(_QWORD *)(v5 - 8);
  result = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  v31 = (_QWORD *)a3;
  v11 = *(_QWORD *)(a3 + 64);
  v27 = 0;
  v28 = a3 + 64;
  v12 = 1 << *(_BYTE *)(a3 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v29 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_5;
    }
    v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v20 >= v29)
      return specialized _NativeDictionary.extractDictionary(using:count:)(v26, v25, v27, v31);
    v21 = *(_QWORD *)(v28 + 8 * v20);
    ++v10;
    if (!v21)
    {
      v10 = v20 + 1;
      if (v20 + 1 >= v29)
        return specialized _NativeDictionary.extractDictionary(using:count:)(v26, v25, v27, v31);
      v21 = *(_QWORD *)(v28 + 8 * v10);
      if (!v21)
      {
        v10 = v20 + 2;
        if (v20 + 2 >= v29)
          return specialized _NativeDictionary.extractDictionary(using:count:)(v26, v25, v27, v31);
        v21 = *(_QWORD *)(v28 + 8 * v10);
        if (!v21)
          break;
      }
    }
LABEL_20:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_5:
    v17 = (uint64_t *)(v31[6] + 16 * v16);
    v18 = *v17;
    v19 = v17[1];
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v9, v31[7] + *(_QWORD *)(v6 + 72) * v16, v5);
    swift_bridgeObjectRetain();
    LOBYTE(v18) = v30(v18, v19, v9);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    result = swift_bridgeObjectRelease();
    if ((v18 & 1) != 0)
    {
      *(unint64_t *)((char *)v26 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      if (__OFADD__(v27++, 1))
      {
        __break(1u);
        return specialized _NativeDictionary.extractDictionary(using:count:)(v26, v25, v27, v31);
      }
    }
  }
  v22 = v20 + 3;
  if (v22 >= v29)
    return specialized _NativeDictionary.extractDictionary(using:count:)(v26, v25, v27, v31);
  v21 = *(_QWORD *)(v28 + 8 * v22);
  if (v21)
  {
    v10 = v22;
    goto LABEL_20;
  }
  while (1)
  {
    v10 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v10 >= v29)
      return specialized _NativeDictionary.extractDictionary(using:count:)(v26, v25, v27, v31);
    v21 = *(_QWORD *)(v28 + 8 * v10);
    ++v22;
    if (v21)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

void specialized Sequence.forEach(_:)(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;

  v5 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivitySession);
    lazy protocol witness table accessor for type TUConversationActivitySession and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type TUConversationActivitySession and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivitySession);
    Set.Iterator.init(_cocoa:)();
    v5 = v22;
    v21 = v23;
    v6 = v24;
    v7 = v25;
    v8 = v26;
  }
  else
  {
    v9 = -1 << *(_BYTE *)(a1 + 32);
    v21 = a1 + 56;
    v10 = ~v9;
    v11 = -v9;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v8 = v12 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v6 = v10;
    v7 = 0;
  }
  v20 = (unint64_t)(v6 + 64) >> 6;
  if (v5 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v8)
    {
      v13 = (v8 - 1) & v8;
      v14 = __clz(__rbit64(v8)) | (v7 << 6);
      v15 = v7;
      goto LABEL_29;
    }
    v17 = v7 + 1;
    if (__OFADD__(v7, 1))
      break;
    if (v17 >= v20)
      goto LABEL_32;
    v18 = *(_QWORD *)(v21 + 8 * v17);
    v15 = v7 + 1;
    if (!v18)
    {
      v15 = v7 + 2;
      if (v7 + 2 >= v20)
        goto LABEL_32;
      v18 = *(_QWORD *)(v21 + 8 * v15);
      if (!v18)
      {
        v15 = v7 + 3;
        if (v7 + 3 >= v20)
          goto LABEL_32;
        v18 = *(_QWORD *)(v21 + 8 * v15);
        if (!v18)
        {
          v15 = v7 + 4;
          if (v7 + 4 >= v20)
            goto LABEL_32;
          v18 = *(_QWORD *)(v21 + 8 * v15);
          if (!v18)
          {
            v15 = v7 + 5;
            if (v7 + 5 >= v20)
              goto LABEL_32;
            v18 = *(_QWORD *)(v21 + 8 * v15);
            if (!v18)
            {
              v19 = v7 + 6;
              while (v20 != v19)
              {
                v18 = *(_QWORD *)(v21 + 8 * v19++);
                if (v18)
                {
                  v15 = v19 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              outlined consume of [String : ()].Iterator._Variant();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v13 = (v18 - 1) & v18;
    v14 = __clz(__rbit64(v18)) + (v15 << 6);
LABEL_29:
    v16 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * v14);
    if (!v16)
      goto LABEL_32;
    while (1)
    {
      (*(void (**)(id, uint64_t))((*MEMORY[0x1E0DEEDD8] & *a2) + 0x170))(v16, a3);

      v7 = v15;
      v8 = v13;
      if ((v5 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      if (__CocoaSet.Iterator.next()())
      {
        type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivitySession);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v16 = v27;
        swift_unknownObjectRelease();
        v15 = v7;
        v13 = v8;
        if (v27)
          continue;
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

void specialized closure #1 in _NativeDictionary.filter(_:)(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, id))
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;

  v23 = 0;
  v6 = 0;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 64);
  v25 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v10 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v11 = v10 | (v6 << 6);
      goto LABEL_5;
    }
    v17 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v25)
      goto LABEL_24;
    v18 = *(_QWORD *)(v24 + 8 * v17);
    ++v6;
    if (!v18)
    {
      v6 = v17 + 1;
      if (v17 + 1 >= v25)
        goto LABEL_24;
      v18 = *(_QWORD *)(v24 + 8 * v6);
      if (!v18)
      {
        v6 = v17 + 2;
        if (v17 + 2 >= v25)
          goto LABEL_24;
        v18 = *(_QWORD *)(v24 + 8 * v6);
        if (!v18)
          break;
      }
    }
LABEL_20:
    v9 = (v18 - 1) & v18;
    v11 = __clz(__rbit64(v18)) + (v6 << 6);
LABEL_5:
    v12 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v11);
    v13 = *v12;
    v14 = v12[1];
    v15 = *(void **)(*(_QWORD *)(a3 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    v16 = v15;
    LOBYTE(v13) = a4(v13, v14, v16);
    swift_bridgeObjectRelease();

    if ((v13 & 1) != 0)
    {
      *(unint64_t *)((char *)a1 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v23++, 1))
      {
        __break(1u);
LABEL_24:
        specialized _NativeDictionary.extractDictionary(using:count:)(a1, a2, v23, a3);
        return;
      }
    }
  }
  v19 = v17 + 3;
  if (v19 >= v25)
    goto LABEL_24;
  v18 = *(_QWORD *)(v24 + 8 * v19);
  if (v18)
  {
    v6 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v6 >= v25)
      goto LABEL_24;
    v18 = *(_QWORD *)(v24 + 8 * v6);
    ++v19;
    if (v18)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
}

uint64_t specialized _NativeDictionary.filter(_:)(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *, unint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v9;
  char v10;
  unint64_t v11;
  size_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[2];

  v6 = v4;
  v9 = isStackAllocationSafe;
  v16[1] = *MEMORY[0x1E0C80C00];
  v10 = *(_BYTE *)(isStackAllocationSafe + 32);
  v11 = (unint64_t)((1 << v10) + 63) >> 6;
  v12 = 8 * v11;
  if ((v10 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v16 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0), v12);
    v13 = a4((char *)v16 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0), v11, v9, a2, a3);
    if (v4)
      swift_willThrow();
    else
      return v13;
  }
  else
  {
    v14 = (void *)swift_slowAlloc();
    bzero(v14, v12);
    v6 = a4((char *)v14, v11, v9, a2, a3);
    MEMORY[0x1AF44981C](v14, -1, -1);
  }
  return v6;
}

id specialized Sequence.contains(where:)(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  if (a1 >> 62)
    goto LABEL_12;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = _CocoaArrayWrapper.endIndex.getter())
  {
    v5 = 4;
    while (1)
    {
      v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1AF448904](v5 - 4, a1) : *(id *)(a1 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v9 = objc_msgSend(v6, sel_isEquivalentToHandle_, a2);

      if ((v9 & 1) == 0)
      {
        ++v5;
        if (v8 != v4)
          continue;
      }
      goto LABEL_14;
    }
    __break(1u);
LABEL_12:
    swift_bridgeObjectRetain();
  }
  v9 = 0;
LABEL_14:
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t specialized CPApplicationPolicyManager.doesActivityTypeSupportAutoLaunch(activity:)(void *a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v2 = objc_msgSend(a1, sel_metadata);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_context);

    v5 = objc_msgSend(v4, sel_typedIdentifier);
    LOBYTE(v4) = TUConversationActivityContextIdentifier.isMedia.getter();

    return v4 & 1;
  }
  else
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v7 = type metadata accessor for Logger();
    __swift_project_value_buffer(v7, (uint64_t)static Log.default);
    v8 = a1;
    v9 = Logger.logObject.getter();
    v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v16 = v12;
      *(_DWORD *)v11 = 136315138;
      type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivity);
      v13 = v8;
      v14 = String.init<A>(reflecting:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ACCCC000, v9, v10, "[CPAppPolicyManager] Missing activity identifier or invalid activity-type found for %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v12, -1, -1);
      MEMORY[0x1AF44981C](v11, -1, -1);

    }
    else
    {

    }
    return 0;
  }
}

uint64_t type metadata accessor for ChangeHistoryProcessor()
{
  return objc_opt_self();
}

unint64_t lazy protocol witness table accessor for type CPApplicationPolicyManager.InputError and conformance CPApplicationPolicyManager.InputError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CPApplicationPolicyManager.InputError and conformance CPApplicationPolicyManager.InputError;
  if (!lazy protocol witness table cache variable for type CPApplicationPolicyManager.InputError and conformance CPApplicationPolicyManager.InputError)
  {
    result = MEMORY[0x1AF44972C](&protocol conformance descriptor for CPApplicationPolicyManager.InputError, &type metadata for CPApplicationPolicyManager.InputError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CPApplicationPolicyManager.InputError and conformance CPApplicationPolicyManager.InputError);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CPApplicationPolicyManager.InputError and conformance CPApplicationPolicyManager.InputError;
  if (!lazy protocol witness table cache variable for type CPApplicationPolicyManager.InputError and conformance CPApplicationPolicyManager.InputError)
  {
    result = MEMORY[0x1AF44972C](&protocol conformance descriptor for CPApplicationPolicyManager.InputError, &type metadata for CPApplicationPolicyManager.InputError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CPApplicationPolicyManager.InputError and conformance CPApplicationPolicyManager.InputError);
  }
  return result;
}

uint64_t sub_1ACF2F948@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xA0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1ACF2F98C(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xA8))(*a1);
}

uint64_t sub_1ACF2F9C8@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xC0))();
  *a2 = result;
  return result;
}

uint64_t sub_1ACF2FA08(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xC8);
  v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1ACF2FA48(_QWORD **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xD8))();
}

uint64_t sub_1ACF2FA80(uint64_t a1, _QWORD **a2)
{
  _BYTE v4[40];

  outlined init with copy of ActivitySession.DomainAssertionWrapper?(a1, (uint64_t)v4, &demangling cache variable for type metadata for ProtectedAppsObserverProtocol?);
  return (*(uint64_t (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xE0))(v4);
}

uint64_t sub_1ACF2FAD8@<X0>(_QWORD **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xF0))();
  v5 = v4;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v3;
  *(_QWORD *)(result + 24) = v5;
  *a2 = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed CNContactStoreConfiguration) -> (@owned TUContactsDataSource);
  a2[1] = result;
  return result;
}

ValueMetadata *type metadata accessor for CPApplicationPolicyManager.Config()
{
  return &type metadata for CPApplicationPolicyManager.Config;
}

uint64_t method lookup function for CPApplicationPolicyManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.authorizedBundleIdentifiers.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.autoSharePlayEnabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.autoSharePlayEnabled.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.autoSharePlayEnabled.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.autoLaunchEnabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.delegates.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.delegates.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.delegates.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.protectedAppsObserver.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.protectedAppsObserver.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.protectedAppsObserver.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.contactsDataSourceCreationBlock.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.contactsDataSourceCreationBlock.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.contactsDataSourceCreationBlock.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.__allocating_init(config:contactStore:featureFlags:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.applicationInfo(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.isAuthorized(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.addDelegate(_:queue:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.shouldAutoLaunchApp(for:on:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.updateAllowedHandles(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.updateAllowedHandles(for:on:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.setAuthorization(_:for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.removeAuthorization(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.handleApplicationUninstalledNotification(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of CPApplicationPolicyManager.handleCNContactStoreDidChangeNotification(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t storeEnumTagSinglePayload for CPApplicationPolicyManager.InputError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1ACF2FE50 + 4 * byte_1ACF6AD30[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1ACF2FE70 + 4 * byte_1ACF6AD35[v4]))();
}

_BYTE *sub_1ACF2FE50(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1ACF2FE70(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1ACF2FE78(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1ACF2FE80(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1ACF2FE88(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1ACF2FE90(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CPApplicationPolicyManager.InputError()
{
  return &type metadata for CPApplicationPolicyManager.InputError;
}

uint64_t method lookup function for ChangeHistoryProcessor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ChangeHistoryProcessor.visit(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ChangeHistoryProcessor.__allocating_init(onContactDeleted:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_1ACF2FF30()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed CNContactStoreConfiguration) -> (@out TUContactsDataSource)(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t *__return_ptr, uint64_t *))(v1 + 16);
  v5 = a1;
  v2(&v4, &v5);
  return v4;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed CNContactStoreConfiguration) -> (@owned TUContactsDataSource)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(v2 + 16))(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1ACF2FFB8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void partial apply for closure #1 in CPApplicationPolicyManager.persist(_:)(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  id v4;

  v3 = v1[2];
  v4 = (id)MEMORY[0x1AF4480F4](v1[4], v1[5]);
  objc_msgSend(a1, sel_applicationPolicyManager_authorizationChangedForBundleIdentifier_, v3, v4);

}

BOOL partial apply for closure #1 in CPApplicationPolicyManager.expiredHandles(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in CPApplicationPolicyManager.expiredHandles(from:)(a1, a2, a3);
}

uint64_t sub_1ACF3004C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void partial apply for closure #1 in CPApplicationPolicyManager.fetchAndStoreContactIdentifiers(for:)()
{
  uint64_t v0;

  closure #1 in CPApplicationPolicyManager.fetchAndStoreContactIdentifiers(for:)(*(void **)(v0 + 16), *(_QWORD **)(v0 + 24));
}

uint64_t block_destroy_helper_36()
{
  return swift_release();
}

uint64_t outlined release of String(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1ACF3011C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void partial apply for closure #1 in CPApplicationPolicyManager.fetchAndProcessContactChangeHistory()()
{
  uint64_t v0;

  closure #1 in CPApplicationPolicyManager.fetchAndProcessContactChangeHistory()(*(char **)(v0 + 16));
}

void partial apply for closure #2 in closure #1 in CPApplicationPolicyManager.fetchAndProcessContactChangeHistory()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  closure #2 in closure #1 in CPApplicationPolicyManager.fetchAndProcessContactChangeHistory()(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t partial apply for closure #1 in closure #1 in closure #2 in closure #1 in CPApplicationPolicyManager.fetchAndProcessContactChangeHistory()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #2 in closure #1 in CPApplicationPolicyManager.authorizedBundleIdentifiers.getter(a1, a2, a3, *(_QWORD **)(v3 + 16));
}

uint64_t sub_1ACF30158()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in CPApplicationPolicyManager.autoSharePlayEnabled.setter(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  id v4;

  v3 = v1[2];
  v4 = (id)MEMORY[0x1AF4480F4](v1[3], v1[4]);
  objc_msgSend(a1, sel_applicationPolicyManager_authorizationChangedForBundleIdentifier_, v3, v4);

}

uint64_t Lock.__allocating_init()()
{
  uint64_t v0;
  _DWORD *v1;

  v0 = swift_allocObject();
  v1 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = 0;
  return v0;
}

Swift::Void __swiftcall Lock.lock()()
{
  uint64_t v0;

  os_unfair_lock_lock(*(os_unfair_lock_t *)(v0 + 16));
}

Swift::Void __swiftcall Lock.unlock()()
{
  uint64_t v0;

  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + 16));
}

Swift::Void __swiftcall Lock.assertOwned()()
{
  uint64_t v0;

  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(v0 + 16));
}

uint64_t Lock.deinit()
{
  uint64_t v0;

  MEMORY[0x1AF44981C](*(_QWORD *)(v0 + 16), -1, -1);
  return v0;
}

uint64_t Lock.__deallocating_deinit()
{
  uint64_t v0;

  MEMORY[0x1AF44981C](*(_QWORD *)(v0 + 16), -1, -1);
  return swift_deallocClassInstance();
}

Swift::Bool __swiftcall Lock.tryLock()()
{
  uint64_t v0;

  return os_unfair_lock_trylock(*(os_unfair_lock_t *)(v0 + 16));
}

Swift::Void __swiftcall Lock.assertNotOwned()()
{
  uint64_t v0;

  os_unfair_lock_assert_not_owner(*(const os_unfair_lock **)(v0 + 16));
}

uint64_t method lookup function for Lock()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Lock.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t BackgroundApplicationLaunchBehavior.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_allocObject();
  type metadata accessor for BackgroundApplicationLaunchBehavior.AssertionStore();
  v1 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v1 + 112) = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)(v0 + 16) = v1;
  return v0;
}

uint64_t BackgroundApplicationLaunchBehavior.revokeBackgroundAuthorization(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t BackgroundApplicationLaunchBehavior.revokeBackgroundAuthorization(for:)()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = (*(uint64_t (**)(void))(**(_QWORD **)(v0 + 32) + 88))();
  return swift_task_switch();
}

{
  uint64_t v0;

  BackgroundApplicationLaunchBehavior.AssertionStore.revokeBackgroundAuthorization(for:)(*(Swift::String *)(v0 + 16));
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t BackgroundApplicationLaunchBehavior.init()()
{
  uint64_t v0;
  uint64_t v1;

  type metadata accessor for BackgroundApplicationLaunchBehavior.AssertionStore();
  v1 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v1 + 112) = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)(v0 + 16) = v1;
  return v0;
}

uint64_t BackgroundApplicationLaunchBehavior.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t BackgroundApplicationLaunchBehavior.assertionStore.getter()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t BackgroundApplicationLaunchBehavior.assertionStore.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*BackgroundApplicationLaunchBehavior.assertionStore.modify())()
{
  swift_beginAccess();
  return ActivitySession.terminatingHandle.modify;
}

uint64_t BackgroundApplicationLaunchBehavior.shouldThrowOnLaunchTimeout.getter()
{
  return 1;
}

uint64_t BackgroundApplicationLaunchBehavior.launchAndAcquireBackgroundAssertion(for:options:launchProvider:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  return swift_task_switch();
}

uint64_t BackgroundApplicationLaunchBehavior.launchAndAcquireBackgroundAssertion(for:options:launchProvider:)()
{
  uint64_t v0;
  id v1;
  id v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _BYTE *v11;
  uint64_t (*v12)(_QWORD, _QWORD, uint64_t, uint64_t);

  v1 = objc_msgSend(*(id *)(v0 + 32), sel_activity);
  v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    v3 = *(_QWORD **)(v0 + 48);
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
    *(_QWORD *)(v0 + 16) = v4;
    *(_QWORD *)(v0 + 24) = v5;

    *(_QWORD *)(v0 + 64) = v6;
    v7 = v3[3];
    v8 = v3[4];
    __swift_project_boxed_opaque_existential_1(v3, v7);
    v12 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v8 + 8) + *(_QWORD *)(v8 + 8));
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v9;
    *v9 = v0;
    v9[1] = BackgroundApplicationLaunchBehavior.launchAndAcquireBackgroundAssertion(for:options:launchProvider:);
    return v12(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), v7, v8);
  }
  else
  {
    lazy protocol witness table accessor for type ApplicationLauncher.LaunchError and conformance ApplicationLauncher.LaunchError();
    swift_allocError();
    *v11 = 3;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  int *v5;
  _QWORD *v6;
  int *v7;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(int **)(**(_QWORD **)(v2 + 56) + 160);
  v7 = (int *)((char *)v5 + *v5);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 88) = v6;
  *v6 = v2;
  v6[1] = BackgroundApplicationLaunchBehavior.launchAndAcquireBackgroundAssertion(for:options:launchProvider:);
  return ((uint64_t (*)(uint64_t, _QWORD))v7)(v4, *(_QWORD *)(v2 + 64));
}

{
  uint64_t v0;
  _BYTE *v1;

  if ((*(_BYTE *)(v0 + 96) & 1) == 0)
  {
    lazy protocol witness table accessor for type ApplicationLauncher.LaunchError and conformance ApplicationLauncher.LaunchError();
    swift_allocError();
    *v1 = 2;
    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t BackgroundApplicationLaunchBehavior.launchAndAcquireBackgroundAssertion(for:options:launchProvider:)(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

unint64_t BackgroundApplicationLaunchBehavior.createProcessAssertion(bundleIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void *v6;
  void *v7;
  id v8;
  unint64_t result;

  v6 = (void *)objc_opt_self();
  v7 = (void *)MEMORY[0x1AF4480F4](a1, a2);
  v8 = objc_msgSend(v6, sel_processAssertionWithBundleIdentifier_, v7);

  result = type metadata accessor for BKSProcessAssertion();
  a3[3] = result;
  a3[4] = &protocol witness table for BKSProcessAssertion;
  *a3 = v8;
  return result;
}

uint64_t BackgroundApplicationLaunchBehavior.acquireBackgroundAssertion(bundleIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  return swift_task_switch();
}

uint64_t BackgroundApplicationLaunchBehavior.acquireBackgroundAssertion(bundleIdentifier:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v1 = v0[9];
  v2 = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)v1 + 152))(v0[7], v0[8]);
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 88))(v2);
  v0[10] = v3;
  v4 = (_QWORD *)swift_task_alloc();
  v0[11] = v4;
  *v4 = v0;
  v4[1] = BackgroundApplicationLaunchBehavior.acquireBackgroundAssertion(bundleIdentifier:);
  v5 = v0[7];
  v4[12] = v0[8];
  v4[13] = v3;
  v4[10] = v0 + 2;
  v4[11] = v5;
  return swift_task_switch();
}

{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 96));
}

uint64_t BackgroundApplicationLaunchBehavior.acquireBackgroundAssertion(bundleIdentifier:)(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t BackgroundApplicationLaunchBehavior.AssertionStore.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = MEMORY[0x1E0DEE9E0];
  return v0;
}

uint64_t type metadata accessor for BackgroundApplicationLaunchBehavior.AssertionStore()
{
  return objc_opt_self();
}

uint64_t BackgroundApplicationLaunchBehavior.shouldHandleAppLaunch(for:options:)(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t BackgroundApplicationLaunchBehavior.handleAppLaunch(for:options:launchProvider:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 144)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 144));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = partial apply for closure #1 in closure #1 in AsyncSerialQueue.performAndWaitFor<A>(_:);
  return v10(a1, a2, a3);
}

uint64_t BackgroundApplicationLaunchBehavior.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for ApplicationLaunchBehavior.shouldHandleAppLaunch(for:options:) in conformance BackgroundApplicationLaunchBehavior()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t protocol witness for ApplicationLaunchBehavior.handleAppLaunch(for:options:launchProvider:) in conformance BackgroundApplicationLaunchBehavior(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 120)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 120));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATQ0_;
  return v10(a1, a2, a3);
}

uint64_t protocol witness for ApplicationLaunchBehavior.revokeBackgroundAuthorization(for:) in conformance BackgroundApplicationLaunchBehavior(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 128) + *(_QWORD *)(*(_QWORD *)v2 + 128));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATQ0_;
  return v8(a1, a2);
}

uint64_t BackgroundApplicationLaunchBehavior.AssertionStore.assertions.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t BackgroundApplicationLaunchBehavior.AssertionStore.assertions.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 112) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*BackgroundApplicationLaunchBehavior.AssertionStore.assertions.modify())()
{
  swift_beginAccess();
  return ActivitySession.audioSessionID.modify;
}

uint64_t BackgroundApplicationLaunchBehavior.AssertionStore.acquireBackgroundAssertion(_:bundleIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[12] = a3;
  v4[13] = v3;
  v4[10] = a1;
  v4[11] = a2;
  return swift_task_switch();
}

uint64_t BackgroundApplicationLaunchBehavior.AssertionStore.acquireBackgroundAssertion(_:bundleIdentifier:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  unint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  _BOOL4 v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  char v25;
  uint64_t v26;

  v1 = *(_QWORD **)(v0 + 80);
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  if ((v4 & 1) == 0)
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v17 = type metadata accessor for Logger();
    __swift_project_value_buffer(v17, (uint64_t)static Log.default);
    swift_bridgeObjectRetain_n();
    v8 = Logger.logObject.getter();
    v18 = static os_log_type_t.error.getter();
    v19 = os_log_type_enabled(v8, v18);
    v20 = *(_QWORD *)(v0 + 96);
    if (v19)
    {
      v21 = *(_QWORD *)(v0 + 88);
      v13 = (uint8_t *)swift_slowAlloc();
      v25 = v4;
      v22 = swift_slowAlloc();
      v26 = v22;
      *(_DWORD *)v13 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 16) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v20, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1ACCCC000, v8, v18, "Failed to acquire assertion for %s", v13, 0xCu);
      swift_arrayDestroy();
      v16 = v22;
      v4 = v25;
      goto LABEL_10;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    goto LABEL_12;
  }
  v5 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 88);
  outlined init with copy of UserNotificationCenter(*(_QWORD *)(v0 + 80), v0 + 16);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  specialized Dictionary.subscript.setter(v0 + 16, v6, v5);
  swift_endAccess();
  if (one-time initialization token for default != -1)
    swift_once();
  v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.default.getter();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(_QWORD *)(v0 + 96);
  if (!v10)
    goto LABEL_11;
  v24 = v4;
  v12 = *(_QWORD *)(v0 + 88);
  v13 = (uint8_t *)swift_slowAlloc();
  v14 = swift_slowAlloc();
  v26 = v14;
  *(_DWORD *)v13 = 136315138;
  swift_bridgeObjectRetain();
  v15 = v12;
  v4 = v24;
  *(_QWORD *)(v0 + 16) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v11, &v26);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_1ACCCC000, v8, v9, "Acquired assertion for %s", v13, 0xCu);
  swift_arrayDestroy();
  v16 = v14;
LABEL_10:
  MEMORY[0x1AF44981C](v16, -1, -1);
  MEMORY[0x1AF44981C](v13, -1, -1);
LABEL_12:

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v4 & 1);
}

Swift::Void __swiftcall BackgroundApplicationLaunchBehavior.AssertionStore.revokeBackgroundAuthorization(for:)(Swift::String a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22[3];
  uint64_t v23;
  uint64_t v24;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 112);
  if (*(_QWORD *)(v4 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v5 = specialized __RawDictionaryStorage.find<A>(_:)(countAndFlagsBits, (uint64_t)object);
    if ((v6 & 1) != 0)
    {
      outlined init with copy of UserNotificationCenter(*(_QWORD *)(v4 + 56) + 40 * v5, (uint64_t)&v19);
    }
    else
    {
      v21 = 0;
      v19 = 0u;
      v20 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v20 + 1))
    {
      outlined init with take of BackgroundSessionManagerDataSource(&v19, (uint64_t)v22);
      v7 = v23;
      v8 = v24;
      __swift_project_boxed_opaque_existential_1(v22, v23);
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v7, v8);
      v21 = 0;
      v19 = 0u;
      v20 = 0u;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      specialized Dictionary.subscript.setter((uint64_t)&v19, countAndFlagsBits, (uint64_t)object);
      swift_endAccess();
      if (one-time initialization token for default != -1)
        swift_once();
      v9 = type metadata accessor for Logger();
      __swift_project_value_buffer(v9, (uint64_t)static Log.default);
      swift_bridgeObjectRetain_n();
      v10 = Logger.logObject.getter();
      v11 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = (uint8_t *)swift_slowAlloc();
        v13 = swift_slowAlloc();
        *(_QWORD *)&v19 = v13;
        *(_DWORD *)v12 = 136315138;
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, (uint64_t *)&v19);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1ACCCC000, v10, v11, "Removing process assertion for %s", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1AF44981C](v13, -1, -1);
        MEMORY[0x1AF44981C](v12, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
      return;
    }
  }
  else
  {
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
  }
  outlined destroy of ProcessAssertion?((uint64_t)&v19);
  if (one-time initialization token for default != -1)
    swift_once();
  v14 = type metadata accessor for Logger();
  __swift_project_value_buffer(v14, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  v15 = Logger.logObject.getter();
  v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v22[0] = v18;
    *(_DWORD *)v17 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v19 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1ACCCC000, v15, v16, "No existing process assertion for %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v18, -1, -1);
    MEMORY[0x1AF44981C](v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t BackgroundApplicationLaunchBehavior.AssertionStore.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t BackgroundApplicationLaunchBehavior.AssertionStore.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t BackgroundApplicationLaunchBehavior.AssertionStore.init()()
{
  uint64_t v0;

  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = MEMORY[0x1E0DEE9E0];
  return v0;
}

unint64_t type metadata accessor for BKSProcessAssertion()
{
  unint64_t result;

  result = lazy cache variable for type metadata for BKSProcessAssertion;
  if (!lazy cache variable for type metadata for BKSProcessAssertion)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for BKSProcessAssertion);
  }
  return result;
}

uint64_t BackgroundApplicationLaunchBehavior.AssertionStore.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

id protocol witness for ProcessAssertion.acquire() in conformance BKSProcessAssertion()
{
  id *v0;

  return objc_msgSend(*v0, sel_acquire);
}

id protocol witness for ProcessAssertion.invalidate() in conformance BKSProcessAssertion()
{
  id *v0;

  return objc_msgSend(*v0, sel_invalidate);
}

uint64_t outlined destroy of ProcessAssertion?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for ProcessAssertion?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1ACF31550@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 88))();
  *a2 = result;
  return result;
}

uint64_t sub_1ACF31580(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 96);
  v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1ACF315B0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 112);
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of ProcessAssertion.acquire()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ProcessAssertion.invalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t type metadata accessor for BackgroundApplicationLaunchBehavior()
{
  return objc_opt_self();
}

uint64_t method lookup function for BackgroundApplicationLaunchBehavior()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.assertionStore.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.assertionStore.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.assertionStore.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.shouldHandleAppLaunch(for:options:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.handleAppLaunch(for:options:launchProvider:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 120)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 120));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATQ0_;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.revokeBackgroundAuthorization(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 128) + *(_QWORD *)(*(_QWORD *)v2 + 128));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = partial apply for closure #1 in closure #1 in AsyncSerialQueue.performAndWaitFor<A>(_:);
  return v8(a1, a2);
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.shouldThrowOnLaunchTimeout.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.launchAndAcquireBackgroundAssertion(for:options:launchProvider:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 144)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 144));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = partial apply for closure #1 in closure #1 in AsyncSerialQueue.performAndWaitFor<A>(_:);
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.createProcessAssertion(bundleIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.acquireBackgroundAssertion(bundleIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 160) + *(_QWORD *)(*(_QWORD *)v2 + 160));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = dispatch thunk of ApplicationLauncher.openApplicationOptions(for:options:);
  return v8(a1, a2);
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t method lookup function for BackgroundApplicationLaunchBehavior.AssertionStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.AssertionStore.assertions.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.AssertionStore.assertions.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.AssertionStore.assertions.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.AssertionStore.acquireBackgroundAssertion(_:bundleIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 120)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 120));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = dispatch thunk of ABCReporterProtocol.report(with:duration:);
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.AssertionStore.revokeBackgroundAuthorization(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of BackgroundApplicationLaunchBehavior.AssertionStore.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t specialized Data.init<A>(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  Swift::Int v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousBytes);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    outlined destroy of ContiguousBytes?((uint64_t)v14);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = _StringObject.sharedUTF8.getter();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = specialized Data._Representation.init(_:)(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = String.UTF8View._foreignCount()();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = specialized Data._Representation.init(count:)(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x1E0C80A78](*(_QWORD *)&v14[0]);
    specialized Data._Representation.withUnsafeMutableBytes<A>(_:)();
    __asm { BR              X12 }
  }
  outlined init with take of BackgroundSessionManagerDataSource(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

uint64_t specialized Data.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  v8[3] = MEMORY[0x1E0DEAC20];
  v8[4] = MEMORY[0x1E0CB1AA8];
  v8[0] = a1;
  v8[1] = a2;
  v2 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x1E0DEAC20]);
  v3 = (_BYTE *)*v2;
  if (*v2 && (v4 = (_BYTE *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      v6 = specialized Data.InlineData.init(_:)(v3, v4);
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      v6 = specialized Data.LargeSlice.init(_:)((uint64_t)v3, (uint64_t)v4);
    }
    else
    {
      v6 = specialized Data.InlineSlice.init(_:)((uint64_t)v3, (uint64_t)v4);
    }
  }
  else
  {
    v6 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
  return v6;
}

void specialized Data.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[3] = MEMORY[0x1E0CB0338];
  v3[4] = MEMORY[0x1E0CB0318];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_1ACF31F38
     + dword_1ACF3216C[__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x1E0CB0338])[1] >> 62];
  __asm { BR              X10 }
}

uint64_t sub_1ACF31F48()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int16 v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v6 = v2;
  v7 = v3;
  v8 = BYTE2(v3);
  v9 = BYTE3(v3);
  v10 = BYTE4(v3);
  v11 = BYTE5(v3);
  outlined copy of Data._Representation(v1, v0);
  closure #1 in Data.init<A>(_:)(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  outlined consume of Data._Representation(v1, v0);
  v4 = v12;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v13);
  return v4;
}

uint64_t UUID.data.getter()
{
  char v0;
  char v1;
  char v2;
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = UUID.uuid.getter();
  v10 = v0;
  v11 = v1;
  v12 = v2;
  v13 = v3;
  v14 = v4;
  v15 = v5;
  v16 = v6;
  v17 = v7;
  return specialized Data.init<A>(_:)((uint64_t)&v9, (uint64_t)&v18);
}

void UUID.init(data:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1ACF3229C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  if (BYTE6(v1) == 16)
  {
    lazy protocol witness table accessor for type Data and conformance Data();
    DataProtocol.copyBytes(to:)();
    UUID.init(uuid:)();
    outlined consume of Data._Representation(v2, v1);
    v3 = type metadata accessor for UUID();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v0, 0, 1, v3);
  }
  else
  {
    outlined consume of Data._Representation(v2, v1);
    v5 = type metadata accessor for UUID();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v0, 1, 1, v5);
  }
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = String.UTF16View.index(_:offsetBy:)();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x1AF4481A8](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

void specialized Data._Representation.withUnsafeMutableBytes<A>(_:)()
{
  __asm { BR              X11 }
}

_QWORD *sub_1ACF324DC@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

uint64_t outlined destroy of ContiguousBytes?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousBytes?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *_sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)__DataStorage._bytes.getter();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)__DataStorage._offset.getter();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = __DataStorage._length.getter();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = _StringGuts.copyUTF8(into:)();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t specialized Data.InlineData.init(_:)(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t specialized Data.LargeSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  type metadata accessor for __DataStorage();
  swift_allocObject();
  result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t specialized Data.InlineSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  type metadata accessor for __DataStorage();
  swift_allocObject();
  result = __DataStorage.init(bytes:length:)();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

_BYTE *specialized Data._Representation.init(_:)(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)specialized Data.InlineData.init(_:)(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t specialized Data._Representation.init(count:)(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

_QWORD *partial apply for specialized closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = _sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:), (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return specialized closure #1 in closure #3 in Data.init<A>(_:)(a1, a2);
}

uint64_t Histogram.__allocating_init(buckets:log:)(_QWORD *a1, uint64_t a2)
{
  swift_allocObject();
  return Histogram.init(buckets:log:)(a1, a2);
}

uint64_t Histogram.buckets.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Histogram.bucketCounts.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t Histogram.bucketCounts.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC14CopresenceCore9Histogram_bucketCounts);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*Histogram.bucketCounts.modify())()
{
  swift_beginAccess();
  return ActivitySession.audioSessionID.modify;
}

uint64_t Histogram.init(buckets:log:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint8_t *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  unint64_t v41;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  char v47;
  uint64_t v48;
  _QWORD *v49;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  unint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint8_t *v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t result;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  _QWORD *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  uint8_t *v83;
  uint64_t v84;
  _QWORD *v85;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Logger?);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v78 - v11;
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v78 - v14;
  MEMORY[0x1E0C80A78](v13);
  v81 = (uint64_t)&v78 - v16;
  v17 = v3 + OBJC_IVAR____TtC14CopresenceCore9Histogram_minValue;
  *(_QWORD *)v17 = 0;
  *(_BYTE *)(v17 + 8) = 1;
  v18 = v3 + OBJC_IVAR____TtC14CopresenceCore9Histogram_maxValue;
  *(_QWORD *)v18 = 0;
  *(_BYTE *)(v18 + 8) = 1;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC14CopresenceCore9Histogram_totalCount) = 0;
  v85 = a1;
  swift_bridgeObjectRetain();
  specialized MutableCollection<>.sort(by:)((uint64_t *)&v85);
  v19 = specialized static Array<A>.== infix(_:_:)(a1, v85);
  swift_release();
  if (v19)
  {
    v20 = a1[2];
    if (v20 < 2)
    {
      swift_bridgeObjectRelease();
      outlined init with copy of ActivitySession.DomainAssertionWrapper?(a2, (uint64_t)v12, &demangling cache variable for type metadata for Logger?);
      v26 = type metadata accessor for Logger();
      v27 = *(_QWORD *)(v26 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v12, 1, v26) == 1)
      {
        outlined destroy of UUID?(a2, &demangling cache variable for type metadata for Logger?);
        v23 = (uint64_t)v12;
        goto LABEL_10;
      }
      v32 = Logger.logObject.getter();
      v33 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = a2;
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1ACCCC000, v32, v33, "Bucket count must be greater than 1", v35, 2u);
        v36 = v35;
        a2 = v34;
        MEMORY[0x1AF44981C](v36, -1, -1);
      }

      outlined destroy of UUID?(a2, &demangling cache variable for type metadata for Logger?);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v26);
    }
    else if (a1[4])
    {
      swift_bridgeObjectRelease();
      outlined init with copy of ActivitySession.DomainAssertionWrapper?(a2, (uint64_t)v15, &demangling cache variable for type metadata for Logger?);
      v21 = type metadata accessor for Logger();
      v22 = *(_QWORD *)(v21 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v15, 1, v21) == 1)
      {
        outlined destroy of UUID?(a2, &demangling cache variable for type metadata for Logger?);
        v23 = (uint64_t)v15;
LABEL_10:
        outlined destroy of UUID?(v23, &demangling cache variable for type metadata for Logger?);
        goto LABEL_37;
      }
      v62 = Logger.logObject.getter();
      v63 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v62, v63))
      {
        v64 = a2;
        v65 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_1ACCCC000, v62, v63, "First bucket must be 0", v65, 2u);
        v66 = v65;
        a2 = v64;
        MEMORY[0x1AF44981C](v66, -1, -1);
      }

      outlined destroy of UUID?(a2, &demangling cache variable for type metadata for Logger?);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v21);
    }
    else
    {
      v79 = v3;
      v80 = a2;
      v37 = (_QWORD *)MEMORY[0x1E0DEE9E0];
      v85 = (_QWORD *)MEMORY[0x1E0DEE9E0];
      swift_bridgeObjectRetain();
      v38 = 0;
      v82 = xmmword_1ACF59E20;
      v83 = (uint8_t *)v20;
      do
      {
        v39 = a1[v38 + 4];
        v41 = specialized __RawDictionaryStorage.find<A>(_:)(v39);
        v42 = v37[2];
        v43 = (v40 & 1) == 0;
        v44 = v42 + v43;
        if (__OFADD__(v42, v43))
        {
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
          __break(1u);
          result = swift_release();
          __break(1u);
          return result;
        }
        v45 = v40;
        if (v37[3] < v44)
        {
          specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v44, 1);
          v37 = v85;
          v46 = specialized __RawDictionaryStorage.find<A>(_:)(v39);
          if ((v45 & 1) != (v47 & 1))
            goto LABEL_46;
          v41 = v46;
        }
        if ((v45 & 1) != 0)
        {
          v48 = v37[7];
          v49 = *(_QWORD **)(v48 + 8 * v41);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)(v48 + 8 * v41) = v49;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v49 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v49[2] + 1, 1, v49);
            *(_QWORD *)(v48 + 8 * v41) = v49;
          }
          v52 = v49[2];
          v51 = v49[3];
          if (v52 >= v51 >> 1)
          {
            v49 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v51 > 1), v52 + 1, 1, v49);
            *(_QWORD *)(v48 + 8 * v41) = v49;
          }
          v49[2] = v52 + 1;
          v49[v52 + 4] = v39;
          v20 = (unint64_t)v83;
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt64>);
          v53 = swift_allocObject();
          *(_OWORD *)(v53 + 16) = v82;
          *(_QWORD *)(v53 + 32) = v39;
          v37[(v41 >> 6) + 8] |= 1 << v41;
          *(_QWORD *)(v37[6] + 8 * v41) = v39;
          *(_QWORD *)(v37[7] + 8 * v41) = v53;
          v54 = v37[2];
          v55 = __OFADD__(v54, 1);
          v56 = v54 + 1;
          if (v55)
            goto LABEL_45;
          v37[2] = v56;
        }
        ++v38;
      }
      while (v20 != v38);
      swift_bridgeObjectRelease();
      v57 = specialized _NativeDictionary.filter(_:)((uint64_t)v37);
      swift_release();
      if (!v57[2])
      {
        v67 = v79;
        v69 = v80;
        outlined init with copy of ActivitySession.DomainAssertionWrapper?(v80, v79 + OBJC_IVAR____TtC14CopresenceCore9Histogram_log, &demangling cache variable for type metadata for Logger?);
        *(_QWORD *)(v67 + OBJC_IVAR____TtC14CopresenceCore9Histogram_buckets) = a1;
        v70 = specialized Array.init(repeating:count:)(0, v20);
        swift_release();
        outlined destroy of UUID?(v69, &demangling cache variable for type metadata for Logger?);
        *(_QWORD *)(v67 + OBJC_IVAR____TtC14CopresenceCore9Histogram_bucketCounts) = v70;
        return v67;
      }
      swift_bridgeObjectRelease();
      v58 = v80;
      v59 = v81;
      outlined init with copy of ActivitySession.DomainAssertionWrapper?(v80, v81, &demangling cache variable for type metadata for Logger?);
      v60 = type metadata accessor for Logger();
      v61 = *(_QWORD *)(v60 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v59, 1, v60) == 1)
      {
        outlined destroy of UUID?(v58, &demangling cache variable for type metadata for Logger?);
        swift_release();
        outlined destroy of UUID?(v59, &demangling cache variable for type metadata for Logger?);
      }
      else
      {
        swift_retain_n();
        v71 = Logger.logObject.getter();
        v72 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v71, v72))
        {
          v73 = (uint8_t *)swift_slowAlloc();
          v74 = (_QWORD *)swift_slowAlloc();
          v85 = v74;
          *(_DWORD *)v73 = 136315138;
          v83 = v73 + 4;
          swift_retain();
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt64]);
          v75 = Dictionary.Keys.description.getter();
          v77 = v76;
          swift_release();
          v84 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v75, v77, (uint64_t *)&v85);
          v59 = v81;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1ACCCC000, v71, v72, "Duplicates found, %s", v73, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1AF44981C](v74, -1, -1);
          MEMORY[0x1AF44981C](v73, -1, -1);
          swift_release();

        }
        else
        {

          swift_release_n();
        }
        outlined destroy of UUID?(v80, &demangling cache variable for type metadata for Logger?);
        (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v59, v60);
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    outlined init with copy of ActivitySession.DomainAssertionWrapper?(a2, (uint64_t)v9, &demangling cache variable for type metadata for Logger?);
    v24 = type metadata accessor for Logger();
    v25 = *(_QWORD *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v9, 1, v24) == 1)
    {
      outlined destroy of UUID?(a2, &demangling cache variable for type metadata for Logger?);
      outlined destroy of UUID?((uint64_t)v9, &demangling cache variable for type metadata for Logger?);
    }
    else
    {
      v28 = a2;
      v29 = Logger.logObject.getter();
      v30 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_1ACCCC000, v29, v30, "Buckets not sorted", v31, 2u);
        MEMORY[0x1AF44981C](v31, -1, -1);
      }

      outlined destroy of UUID?(v28, &demangling cache variable for type metadata for Logger?);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v24);
    }
  }
LABEL_37:
  type metadata accessor for Histogram();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD v13[6];
  uint64_t Token;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  Token = type metadata accessor for AttachmentLedger_AttachmentAuthGetToken(0);
  v4 = MEMORY[0x1E0C80A78](Token);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v9 = (char *)v13 - v8;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v10)
  {
    if (a1 != a2)
    {
      v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v13[4] = *(_QWORD *)(v7 + 72);
      v13[5] = a1;
      outlined init with copy of ActivitySession.DomainAssertionWrapper(a1 + v11, (uint64_t)v13 - v8, type metadata accessor for AttachmentLedger_AttachmentAuthGetToken);
      outlined init with copy of ActivitySession.DomainAssertionWrapper(a2 + v11, (uint64_t)v6, type metadata accessor for AttachmentLedger_AttachmentAuthGetToken);
      __asm { BR              X10 }
    }
  }
  return 1;
}

{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2)
  {
    if (a1 != a2)
      __asm { BR              X8 }
  }
  return 1;
}

{
  return specialized static Array<A>.== infix(_:_:)(a1, a2, type metadata accessor for AttachmentLedger_EncryptionID, &demangling cache variable for type metadata for (AttachmentLedger_EncryptionID?, AttachmentLedger_EncryptionID?), &demangling cache variable for type metadata for AttachmentLedger_EncryptionID?, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.MissingEncryptionID);
}

{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int (*v38)(uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  int EnumCaseMultiPayload;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t *v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  uint64_t *v55;
  _QWORD v57[8];
  char *v58;
  char *v59;
  char *v60;
  uint64_t *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
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

  v76 = *MEMORY[0x1E0C80C00];
  v4 = type metadata accessor for AttachmentLedger_AttachmentMetadata(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content, AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content));
  MEMORY[0x1E0C80A78](v62);
  v8 = (char *)v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content(0);
  v70 = *(_QWORD *)(v9 - 8);
  v71 = v9;
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v10);
  v61 = (_QWORD *)((char *)v57 - v14);
  MEMORY[0x1E0C80A78](v13);
  v68 = (uint64_t)v57 - v15;
  v69 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?, AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?));
  MEMORY[0x1E0C80A78](v69);
  v17 = (char *)v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
  v19 = MEMORY[0x1E0C80A78](v18);
  v21 = (char *)v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v19);
  v65 = (uint64_t)v57 - v23;
  MEMORY[0x1E0C80A78](v22);
  v75 = (uint64_t)v57 - v24;
  v67 = type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot(0);
  v25 = MEMORY[0x1E0C80A78](v67);
  v27 = (char *)v57 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v25);
  v30 = (char *)v57 - v29;
  v72 = a1;
  v73 = a2;
  v31 = *(_QWORD *)(a1 + 16);
  if (v31 != *(_QWORD *)(a2 + 16))
    goto LABEL_27;
  if (!v31 || v72 == v73)
  {
    v54 = 1;
    return v54 & 1;
  }
  v59 = v12;
  v66 = v21;
  v58 = v6;
  v60 = v8;
  v57[7] = 0;
  v32 = (*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  v64 = *(_QWORD *)(v28 + 72);
  v33 = v31 - 1;
  v34 = v65;
  while (1)
  {
    v74 = v33;
    outlined init with copy of ActivitySession.DomainAssertionWrapper(v72 + v32, (uint64_t)v30, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot);
    outlined init with copy of ActivitySession.DomainAssertionWrapper(v73 + v32, (uint64_t)v27, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot);
    v35 = v75;
    outlined init with copy of ActivitySession.DomainAssertionWrapper?((uint64_t)v30, v75, &demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
    outlined init with copy of ActivitySession.DomainAssertionWrapper?((uint64_t)v27, v34, &demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
    v36 = (uint64_t)&v17[*(int *)(v69 + 48)];
    outlined init with copy of ActivitySession.DomainAssertionWrapper?(v35, (uint64_t)v17, &demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
    outlined init with copy of ActivitySession.DomainAssertionWrapper?(v34, v36, &demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
    v37 = v71;
    v38 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48);
    if (v38((uint64_t)v17, 1, v71) == 1)
    {
      outlined destroy of UUID?(v34, &demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
      outlined destroy of UUID?(v35, &demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
      if (v38(v36, 1, v37) != 1)
      {
        v55 = &demangling cache variable for type metadata for (AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?, AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
        goto LABEL_26;
      }
      goto LABEL_16;
    }
    v63 = v32;
    v39 = (uint64_t)v66;
    outlined init with copy of ActivitySession.DomainAssertionWrapper?((uint64_t)v17, (uint64_t)v66, &demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
    if (v38(v36, 1, v37) == 1)
    {
      v55 = &demangling cache variable for type metadata for (AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?, AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
      goto LABEL_25;
    }
    v40 = v68;
    outlined init with take of ActivitySession.DomainAssertionWrapper(v36, v68, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content);
    v41 = (uint64_t)v60;
    v42 = (uint64_t)&v60[*(int *)(v62 + 48)];
    outlined init with copy of ActivitySession.DomainAssertionWrapper(v39, (uint64_t)v60, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content);
    outlined init with copy of ActivitySession.DomainAssertionWrapper(v40, v42, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content);
    if (swift_getEnumCaseMultiPayload() != 1)
      break;
    v43 = v17;
    v44 = v30;
    v45 = v27;
    v46 = (uint64_t)v59;
    outlined init with copy of ActivitySession.DomainAssertionWrapper(v41, (uint64_t)v59, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v48 = v75;
    if (EnumCaseMultiPayload != 1)
    {
      outlined destroy of ActivitySession.DomainAssertionWrapper(v46, type metadata accessor for AttachmentLedger_AttachmentMetadata);
      v27 = v45;
      v30 = v44;
      v17 = v43;
      goto LABEL_23;
    }
    v49 = (uint64_t)v58;
    outlined init with take of ActivitySession.DomainAssertionWrapper(v42, (uint64_t)v58, type metadata accessor for AttachmentLedger_AttachmentMetadata);
    v50 = static AttachmentLedger_AttachmentMetadata.== infix(_:_:)(v46, v49);
    outlined destroy of ActivitySession.DomainAssertionWrapper(v49, type metadata accessor for AttachmentLedger_AttachmentMetadata);
    outlined destroy of ActivitySession.DomainAssertionWrapper(v46, type metadata accessor for AttachmentLedger_AttachmentMetadata);
    v27 = v45;
    v30 = v44;
    v17 = v43;
    v32 = v63;
    if ((v50 & 1) == 0)
    {
      outlined destroy of ActivitySession.DomainAssertionWrapper(v41, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content);
      goto LABEL_24;
    }
    outlined destroy of ActivitySession.DomainAssertionWrapper(v41, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content);
    outlined destroy of ActivitySession.DomainAssertionWrapper(v68, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content);
    v34 = v65;
    outlined destroy of UUID?(v65, &demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
    outlined destroy of UUID?(v48, &demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
    outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v66, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content);
LABEL_16:
    outlined destroy of UUID?((uint64_t)v17, &demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
    type metadata accessor for UnknownStorage();
    lazy protocol witness table accessor for type UnknownStorage and conformance UnknownStorage();
    v54 = dispatch thunk of static Equatable.== infix(_:_:)();
    outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v27, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot);
    outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v30, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot);
    v33 = v74 - 1;
    if ((v54 & 1) != 0)
    {
      v32 += v64;
      if (v74)
        continue;
    }
    return v54 & 1;
  }
  v51 = v61;
  outlined init with copy of ActivitySession.DomainAssertionWrapper(v41, (uint64_t)v61, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content);
  v52 = *v51;
  v53 = v51[1];
  if (swift_getEnumCaseMultiPayload() != 1)
    __asm { BR              X10 }
  outlined consume of Data._Representation(v52, v53);
LABEL_23:
  outlined destroy of UUID?(v41, &demangling cache variable for type metadata for (AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content, AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content));
LABEL_24:
  v39 = (uint64_t)v66;
  outlined destroy of ActivitySession.DomainAssertionWrapper(v68, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content);
  v55 = &demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?;
  v34 = v65;
LABEL_25:
  outlined destroy of UUID?(v34, &demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
  outlined destroy of UUID?(v75, &demangling cache variable for type metadata for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content?);
  outlined destroy of ActivitySession.DomainAssertionWrapper(v39, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot.OneOf_Content);
LABEL_26:
  outlined destroy of UUID?((uint64_t)v17, v55);
  outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v27, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot);
  outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v30, type metadata accessor for AttachmentLedger_SubscribeResponse.InitializeAck.AttachmentSnapshot);
LABEL_27:
  v54 = 0;
  return v54 & 1;
}

{
  return specialized static Array<A>.== infix(_:_:)(a1, a2, type metadata accessor for AttachmentLedger_EncryptionID);
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v17;
  uint64_t v19;

  v4 = type metadata accessor for AttachmentLedger_AttachmentMetadata(0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v19 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      do
      {
        outlined init with copy of ActivitySession.DomainAssertionWrapper(a1 + v12, (uint64_t)v10, type metadata accessor for AttachmentLedger_AttachmentMetadata);
        outlined init with copy of ActivitySession.DomainAssertionWrapper(a2 + v12, (uint64_t)v7, type metadata accessor for AttachmentLedger_AttachmentMetadata);
        v15 = static AttachmentLedger_AttachmentMetadata.== infix(_:_:)(v10, v7);
        outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v7, type metadata accessor for AttachmentLedger_AttachmentMetadata);
        outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v10, type metadata accessor for AttachmentLedger_AttachmentMetadata);
        v17 = v14-- != 0;
        if ((v15 & 1) == 0)
          break;
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = type metadata accessor for CP_KeyValue(0);
  v4 = MEMORY[0x1E0C80A78](v15);
  v6 = (_QWORD *)((char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v4);
  v9 = (_QWORD *)((char *)v14 - v8);
  v16 = a1;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v10 && v16 != a2)
  {
    v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v14[4] = *(_QWORD *)(v7 + 72);
    outlined init with copy of ActivitySession.DomainAssertionWrapper(v16 + v11, (uint64_t)v14 - v8, type metadata accessor for CP_KeyValue);
    outlined init with copy of ActivitySession.DomainAssertionWrapper(a2 + v11, (uint64_t)v6, type metadata accessor for CP_KeyValue);
    v12 = *v9 == *v6 && v9[1] == v6[1];
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      __asm { BR              X10 }
    outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v6, type metadata accessor for CP_KeyValue);
    outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v9, type metadata accessor for CP_KeyValue);
    return 0;
  }
  return 1;
}

{
  return specialized static Array<A>.== infix(_:_:)(a1, a2, type metadata accessor for CP_EncryptionID, &demangling cache variable for type metadata for (CP_EncryptionID?, CP_EncryptionID?), &demangling cache variable for type metadata for CP_EncryptionID?, type metadata accessor for CP_SubscribeResponse.InitializeAck.MissingEncryptionID);
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v4 = type metadata accessor for CP_SequenceNumber(0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (uint64_t *)((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v5);
  v10 = (uint64_t *)((char *)&v14 - v9);
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
      return 1;
    v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v15 = *(_QWORD *)(v8 + 72);
    while (1)
    {
      outlined init with copy of ActivitySession.DomainAssertionWrapper(a1 + v12, (uint64_t)v10, type metadata accessor for CP_SequenceNumber);
      outlined init with copy of ActivitySession.DomainAssertionWrapper(a2 + v12, (uint64_t)v7, type metadata accessor for CP_SequenceNumber);
      if (*v10 != *v7)
        break;
      if (v10[1] != v7[1])
        break;
      type metadata accessor for UnknownStorage();
      lazy protocol witness table accessor for type UnknownStorage and conformance UnknownStorage();
      if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) == 0)
        break;
      outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v7, type metadata accessor for CP_SequenceNumber);
      outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v10, type metadata accessor for CP_SequenceNumber);
      v12 += v15;
      if (!--v11)
        return 1;
    }
    outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v7, type metadata accessor for CP_SequenceNumber);
    outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v10, type metadata accessor for CP_SequenceNumber);
  }
  return 0;
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t result;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = type metadata accessor for CP_TopicSubscribers.TopicSubscribersInfo(0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (uint64_t *)((char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v5);
  v10 = (uint64_t *)((char *)&v27 - v9);
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v11 && a1 != a2)
  {
    v12 = 0;
    v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v27 = a2 + v13;
    v28 = a1 + v13;
    v14 = *(_QWORD *)(v8 + 72);
    while (1)
    {
      outlined init with copy of ActivitySession.DomainAssertionWrapper(v28 + v14 * v12, (uint64_t)v10, type metadata accessor for CP_TopicSubscribers.TopicSubscribersInfo);
      outlined init with copy of ActivitySession.DomainAssertionWrapper(v27 + v14 * v12, (uint64_t)v7, type metadata accessor for CP_TopicSubscribers.TopicSubscribersInfo);
      v15 = *v10 == *v7 && v10[1] == v7[1];
      if (!v15 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        break;
      v16 = (_QWORD *)v10[2];
      v17 = (_QWORD *)v7[2];
      v18 = v16[2];
      if (v18 != v17[2])
        break;
      if (v18)
        v19 = v16 == v17;
      else
        v19 = 1;
      if (!v19)
      {
        if (v16[4] != v17[4])
          break;
        if (v18 != 1)
        {
          if (v16[5] != v17[5])
            break;
          v21 = v16 + 6;
          v22 = v17 + 6;
          v23 = v18 - 2;
          while (v23)
          {
            v25 = *v21++;
            v24 = v25;
            v26 = *v22++;
            --v23;
            if (v24 != v26)
              goto LABEL_24;
          }
        }
      }
      type metadata accessor for UnknownStorage();
      lazy protocol witness table accessor for type UnknownStorage and conformance UnknownStorage();
      if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) == 0)
        break;
      ++v12;
      outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v7, type metadata accessor for CP_TopicSubscribers.TopicSubscribersInfo);
      outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v10, type metadata accessor for CP_TopicSubscribers.TopicSubscribersInfo);
      result = 1;
      if (v12 == v11)
        return result;
    }
LABEL_24:
    outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v7, type metadata accessor for CP_TopicSubscribers.TopicSubscribersInfo);
    outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v10, type metadata accessor for CP_TopicSubscribers.TopicSubscribersInfo);
    return 0;
  }
  return 1;
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  char v16;
  BOOL v17;
  char v18;
  uint64_t v20;
  uint64_t v21;

  v4 = type metadata accessor for CP_TopicSubscribers.TerminateTopic(0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (uint64_t *)((char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v5);
  v10 = (uint64_t *)((char *)&v20 - v9);
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v16 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v20 = *(_QWORD *)(v8 + 72);
      v13 = v11 - 1;
      while (1)
      {
        outlined init with copy of ActivitySession.DomainAssertionWrapper(a1 + v12, (uint64_t)v10, type metadata accessor for CP_TopicSubscribers.TerminateTopic);
        outlined init with copy of ActivitySession.DomainAssertionWrapper(a2 + v12, (uint64_t)v7, type metadata accessor for CP_TopicSubscribers.TerminateTopic);
        v14 = *v10 == *v7 && v10[1] == v7[1];
        if (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          break;
        v21 = v13;
        type metadata accessor for UnknownStorage();
        lazy protocol witness table accessor for type UnknownStorage and conformance UnknownStorage();
        v15 = v21;
        v16 = dispatch thunk of static Equatable.== infix(_:_:)();
        outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v7, type metadata accessor for CP_TopicSubscribers.TerminateTopic);
        outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v10, type metadata accessor for CP_TopicSubscribers.TerminateTopic);
        v17 = v15 != 0;
        v13 = v15 - 1;
        v18 = v17;
        if ((v16 & 1) != 0)
        {
          v12 += v20;
          if ((v18 & 1) != 0)
            continue;
        }
        return v16 & 1;
      }
      outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v7, type metadata accessor for CP_TopicSubscribers.TerminateTopic);
      outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v10, type metadata accessor for CP_TopicSubscribers.TerminateTopic);
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  return v16 & 1;
}

{
  return specialized static Array<A>.== infix(_:_:)(a1, a2, type metadata accessor for CP_EncryptionID);
}

BOOL specialized static Array<A>.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  _BOOL8 result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (a1[4] != a2[4])
    return 0;
  v3 = a1 + 5;
  v4 = a2 + 5;
  v5 = v2 - 1;
  do
  {
    result = v5 == 0;
    if (!v5)
      break;
    v8 = *v3++;
    v7 = v8;
    v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

uint64_t specialized static Array<A>.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int (*v40)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t *v45;
  uint64_t (*v46)(_QWORD);
  _BYTE v48[16];
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(_QWORD);
  uint64_t v52;
  uint64_t (*v53)(_QWORD);
  _BYTE *v54;
  _BYTE *v55;
  _BYTE *v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE *v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v64 = a3(0);
  v59 = *(_QWORD *)(v64 - 8);
  MEMORY[0x1E0C80A78](v64);
  v57 = &v48[-v12];
  v58 = __swift_instantiateConcreteTypeFromMangledName(a4);
  MEMORY[0x1E0C80A78](v58);
  v55 = &v48[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v15 = MEMORY[0x1E0C80A78](v14);
  v17 = &v48[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = MEMORY[0x1E0C80A78](v15);
  v20 = &v48[-v19];
  MEMORY[0x1E0C80A78](v18);
  v65 = &v48[-v21];
  v66 = a6(0);
  v22 = MEMORY[0x1E0C80A78](v66);
  v24 = &v48[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v22);
  v27 = &v48[-v26];
  v60 = a1;
  v61 = a2;
  v28 = *(_QWORD *)(a1 + 16);
  if (v28 != *(_QWORD *)(a2 + 16))
  {
LABEL_19:
    v44 = 0;
    return v44 & 1;
  }
  if (v28 && v60 != v61)
  {
    v56 = v20;
    v53 = a3;
    v54 = v17;
    v49 = a4;
    v50 = 0;
    v29 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
    v30 = *(_QWORD *)(v25 + 72);
    v51 = a6;
    v52 = v30;
    v31 = v28 - 1;
    v32 = (uint64_t)v55;
    while (1)
    {
      v63 = v31;
      outlined init with copy of ActivitySession.DomainAssertionWrapper(v60 + v29, (uint64_t)v27, a6);
      v62 = v29;
      outlined init with copy of ActivitySession.DomainAssertionWrapper(v61 + v29, (uint64_t)v24, a6);
      if (*v27 != *v24)
        break;
      v34 = v65;
      v33 = v66;
      v35 = (uint64_t)v27;
      outlined init with copy of ActivitySession.DomainAssertionWrapper?((uint64_t)v27 + *(int *)(v66 + 24), (uint64_t)v65, a5);
      v36 = v24;
      v37 = (uint64_t)v24 + *(int *)(v33 + 24);
      v38 = (uint64_t)v56;
      outlined init with copy of ActivitySession.DomainAssertionWrapper?(v37, (uint64_t)v56, a5);
      v39 = v32 + *(int *)(v58 + 48);
      outlined init with copy of ActivitySession.DomainAssertionWrapper?((uint64_t)v34, v32, a5);
      outlined init with copy of ActivitySession.DomainAssertionWrapper?(v38, v39, a5);
      v40 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48);
      v41 = v64;
      if (v40(v32, 1, v64) != 1)
      {
        v42 = v32;
        v43 = (uint64_t)v54;
        outlined init with copy of ActivitySession.DomainAssertionWrapper?(v42, (uint64_t)v54, a5);
        if (v40(v39, 1, v41) != 1)
        {
          outlined init with take of ActivitySession.DomainAssertionWrapper(v39, (uint64_t)v57, v53);
          __asm { BR              X10 }
        }
        v45 = v49;
        v46 = v53;
        v24 = v36;
        v27 = (_QWORD *)v35;
        outlined destroy of UUID?((uint64_t)v56, a5);
        outlined destroy of UUID?((uint64_t)v65, a5);
        outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v54, v46);
        v32 = (uint64_t)v55;
        goto LABEL_17;
      }
      outlined destroy of UUID?(v38, a5);
      outlined destroy of UUID?((uint64_t)v34, a5);
      if (v40(v39, 1, v41) != 1)
      {
        v45 = v49;
        v24 = v36;
        v27 = (_QWORD *)v35;
LABEL_17:
        outlined destroy of UUID?(v32, v45);
        break;
      }
      outlined destroy of UUID?(v32, a5);
      v24 = v36;
      v27 = (_QWORD *)v35;
      type metadata accessor for UnknownStorage();
      lazy protocol witness table accessor for type UnknownStorage and conformance UnknownStorage();
      v44 = dispatch thunk of static Equatable.== infix(_:_:)();
      outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v24, a6);
      outlined destroy of ActivitySession.DomainAssertionWrapper(v35, a6);
      v31 = v63 - 1;
      if ((v44 & 1) != 0)
      {
        v29 = v62 + v52;
        if (v63)
          continue;
      }
      return v44 & 1;
    }
    outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v24, a6);
    outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v27, a6);
    goto LABEL_19;
  }
  v44 = 1;
  return v44 & 1;
}

uint64_t specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17 = a3(0);
  v6 = MEMORY[0x1E0C80A78](v17);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v11 = (char *)v16 - v10;
  v18 = a1;
  v19 = a2;
  v12 = *(_QWORD *)(a1 + 16);
  if (v12 == *(_QWORD *)(a2 + 16))
  {
    if (v12 && v18 != v19)
    {
      v13 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      v16[4] = *(_QWORD *)(v9 + 72);
      v16[5] = v8;
      v16[2] = a3;
      outlined init with copy of ActivitySession.DomainAssertionWrapper(v18 + v13, (uint64_t)v16 - v10, a3);
      outlined init with copy of ActivitySession.DomainAssertionWrapper(v19 + v13, (uint64_t)v8, a3);
      __asm { BR              X10 }
    }
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

unint64_t Histogram.indexForValue(_:low:high:)(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((uint64_t)a3 < a2)
    return 0;
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  v4 = *(_QWORD *)(v3 + OBJC_IVAR____TtC14CopresenceCore9Histogram_buckets);
  v5 = *(_QWORD *)(v4 + 16);
  if (v5 <= a3)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v6 = v4 + 32;
  if (*(_QWORD *)(v6 + 8 * a3) <= result)
    return a3;
  v7 = a2 + a3;
  if (__OFADD__(a2, a3))
    goto LABEL_25;
  if (v7 >= 0)
    v8 = a2 + a3;
  else
    v8 = v7 + 1;
  if (v7 >= -1)
  {
    v9 = v8 >> 1;
    if (v9 < v5)
    {
      v10 = *(_QWORD *)(v6 + 8 * v9);
      if (v10 == result)
        return v9;
      if (v7 < 2)
        return Histogram.indexForValue(_:low:high:)();
      v11 = *(_QWORD *)(v6 + 8 * (v9 - 1));
      if (v10 <= result || v11 > result)
        return Histogram.indexForValue(_:low:high:)();
      return v9 - 1;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t Histogram.minValue.getter()
{
  return AttachmentDataReport.assetTotalSize.getter(&OBJC_IVAR____TtC14CopresenceCore9Histogram_minValue);
}

uint64_t Histogram.maxValue.getter()
{
  return AttachmentDataReport.assetTotalSize.getter(&OBJC_IVAR____TtC14CopresenceCore9Histogram_maxValue);
}

uint64_t Histogram.totalCount.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC14CopresenceCore9Histogram_totalCount;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

Swift::Bool __swiftcall Histogram.recordValue(_:)(Swift::UInt64 a1)
{
  uint64_t v1;
  unint64_t v3;
  char v4;
  char v5;
  int64_t v6;
  void (*v7)(_BYTE *, _QWORD);
  uint64_t *v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _QWORD *v15;
  Swift::UInt64 v16;
  char v17;
  uint64_t v18;
  Swift::UInt64 v19;
  char v20;
  uint64_t v21;
  _BYTE v23[32];

  v3 = Histogram.indexForValue(_:low:high:)(a1, 0, *(_QWORD *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC14CopresenceCore9Histogram_buckets) + 16) - 1);
  v5 = v4;
  if ((v4 & 1) == 0)
  {
    v6 = v3;
    v7 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v1 + 144))(v23);
    v9 = v8;
    v10 = (_QWORD *)*v8;
    LOBYTE(v11) = swift_isUniquelyReferenced_nonNull_native();
    *v9 = (uint64_t)v10;
    if ((v11 & 1) == 0)
    {
      v11 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v10);
      v10 = (_QWORD *)v11;
      *v9 = v11;
    }
    if (v6 >= v10[2])
    {
      __break(1u);
    }
    else
    {
      v12 = v10[v6 + 4];
      v13 = __CFADD__(v12, 1);
      v14 = v12 + 1;
      if (!v13)
      {
        v10[v6 + 4] = v14;
        v7(v23, 0);
        v15 = (_QWORD *)(v1 + OBJC_IVAR____TtC14CopresenceCore9Histogram_totalCount);
        v11 = swift_beginAccess();
        if (!__OFADD__(*v15, 1))
        {
          ++*v15;
          v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 184))(v11);
          if ((v17 & 1) != 0 || v16 > a1)
          {
            v18 = v1 + OBJC_IVAR____TtC14CopresenceCore9Histogram_minValue;
            v16 = swift_beginAccess();
            *(_QWORD *)v18 = a1;
            *(_BYTE *)(v18 + 8) = 0;
          }
          v19 = (*(uint64_t (**)(Swift::UInt64))(*(_QWORD *)v1 + 208))(v16);
          if ((v20 & 1) != 0 || v19 < a1)
          {
            v21 = v1 + OBJC_IVAR____TtC14CopresenceCore9Histogram_maxValue;
            swift_beginAccess();
            *(_QWORD *)v21 = a1;
            *(_BYTE *)(v21 + 8) = 0;
          }
          goto LABEL_13;
        }
LABEL_16:
        __break(1u);
        return v11;
      }
    }
    __break(1u);
    goto LABEL_16;
  }
LABEL_13:
  LOBYTE(v11) = (v5 & 1) == 0;
  return v11;
}

Swift::Void __swiftcall Histogram.clearCounts()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = specialized Array.init(repeating:count:)(0, *(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC14CopresenceCore9Histogram_buckets) + 16));
  (*(void (**)(uint64_t))(*(_QWORD *)v0 + 136))(v1);
  v2 = (_QWORD *)(v0 + OBJC_IVAR____TtC14CopresenceCore9Histogram_totalCount);
  swift_beginAccess();
  *v2 = 0;
}

Swift::Void __swiftcall Histogram.clearMaxValue()()
{
  Histogram.clearMaxValue()(&OBJC_IVAR____TtC14CopresenceCore9Histogram_maxValue);
}

Swift::Void __swiftcall Histogram.clearMinValue()()
{
  Histogram.clearMaxValue()(&OBJC_IVAR____TtC14CopresenceCore9Histogram_minValue);
}

uint64_t Histogram.clearMaxValue()(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = v1 + *a1;
  result = swift_beginAccess();
  *(_QWORD *)v2 = 0;
  *(_BYTE *)(v2 + 8) = 1;
  return result;
}

Swift::Void __swiftcall Histogram.reset()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(void))(*(_QWORD *)v0 + 264))();
  v1 = v0 + OBJC_IVAR____TtC14CopresenceCore9Histogram_minValue;
  swift_beginAccess();
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = 1;
  v2 = v0 + OBJC_IVAR____TtC14CopresenceCore9Histogram_maxValue;
  swift_beginAccess();
  *(_QWORD *)v2 = 0;
  *(_BYTE *)(v2 + 8) = 1;
}

uint64_t Histogram.conciseDescription.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 312))(1);
}

uint64_t Histogram.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)v0 + 312))(0);
}

Swift::String __swiftcall Histogram.intervalDescription(omitEmptyBins:)(Swift::Bool omitEmptyBins)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  Swift::String result;
  uint64_t v28;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14CopresenceCore9Histogram_buckets);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    isUniquelyReferenced_nonNull_native = swift_bridgeObjectRetain();
    v5 = v2 + 40;
    v6 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v7 = 4;
    while (1)
    {
      v11 = v7 - 4;
      if (omitEmptyBins)
      {
        v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v28 + 128))(isUniquelyReferenced_nonNull_native);
        if (v11 >= *(_QWORD *)(v12 + 16))
        {
          __break(1u);
LABEL_24:
          __break(1u);
LABEL_25:
          __break(1u);
LABEL_26:
          __break(1u);
          goto LABEL_27;
        }
        v14 = *(_QWORD *)(v12 + 8 * v7);
        isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
        if (!v14)
          goto LABEL_6;
      }
      if ((uint64_t)v11 >= *(_QWORD *)(v2 + 16) - 1)
      {
        _StringGuts.grow(_:)(16);
        swift_bridgeObjectRelease();
        v20._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        String.append(_:)(v20);
        swift_bridgeObjectRelease();
        v21._countAndFlagsBits = 0x8FB8EFBE99E2202CLL;
        v21._object = (void *)0xAB00000000203A29;
        String.append(_:)(v21);
        v12 = (*(uint64_t (**)(void))(*(_QWORD *)v28 + 128))();
        if (v11 >= *(_QWORD *)(v12 + 16))
          goto LABEL_26;
        swift_bridgeObjectRelease();
        v22._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        String.append(_:)(v22);
        swift_bridgeObjectRelease();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        v15._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        String.append(_:)(v15);
        swift_bridgeObjectRelease();
        v16._countAndFlagsBits = 8236;
        v16._object = (void *)0xE200000000000000;
        String.append(_:)(v16);
        if ((unint64_t)(v7 - 3) >= *(_QWORD *)(v2 + 16))
          goto LABEL_24;
        v17._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        String.append(_:)(v17);
        swift_bridgeObjectRelease();
        v18._countAndFlagsBits = 2112041;
        v18._object = (void *)0xE300000000000000;
        String.append(_:)(v18);
        v12 = (*(uint64_t (**)(void))(*(_QWORD *)v28 + 128))();
        if (v11 >= *(_QWORD *)(v12 + 16))
          goto LABEL_25;
        swift_bridgeObjectRelease();
        v19._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        String.append(_:)(v19);
        swift_bridgeObjectRelease();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          goto LABEL_3;
      }
      isUniquelyReferenced_nonNull_native = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6[2] + 1, 1, v6);
      v6 = (_QWORD *)isUniquelyReferenced_nonNull_native;
LABEL_3:
      v9 = v6[2];
      v8 = v6[3];
      if (v9 >= v8 >> 1)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v8 > 1), v9 + 1, 1, v6);
        v6 = (_QWORD *)isUniquelyReferenced_nonNull_native;
      }
      v6[2] = v9 + 1;
      v10 = &v6[2 * v9];
      v10[4] = 91;
      v10[5] = 0xE100000000000000;
LABEL_6:
      v5 += 8;
      if (++v7 - v3 == 4)
      {
        swift_bridgeObjectRelease();
        if (!v6[2])
          goto LABEL_21;
LABEL_19:
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
        lazy protocol witness table accessor for type [String] and conformance [A]();
        v23 = BidirectionalCollection<>.joined(separator:)();
        v25 = v24;
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
  }
  if (*(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16))
    goto LABEL_19;
LABEL_21:
  swift_bridgeObjectRelease();
  v23 = 0;
  v25 = 0xE000000000000000;
LABEL_22:
  v12 = v23;
  v13 = (void *)v25;
LABEL_27:
  result._object = v13;
  result._countAndFlagsBits = v12;
  return result;
}

uint64_t Histogram.deinit()
{
  uint64_t v0;

  outlined destroy of UUID?(v0 + OBJC_IVAR____TtC14CopresenceCore9Histogram_log, &demangling cache variable for type metadata for Logger?);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Histogram.__deallocating_deinit()
{
  uint64_t v0;

  outlined destroy of UUID?(v0 + OBJC_IVAR____TtC14CopresenceCore9Histogram_log, &demangling cache variable for type metadata for Logger?);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Histogram(uint64_t *a1, uint64_t *a2)
{
  return specialized static Histogram.== infix(_:_:)(*a1, *a2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Histogram()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 304))();
}

uint64_t type metadata accessor for Histogram()
{
  uint64_t result;

  result = type metadata singleton initialization cache for Histogram;
  if (!type metadata singleton initialization cache for Histogram)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t *specialized _NativeDictionary.filter(_:)(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  unint64_t *v2;
  char v3;
  unint64_t v4;
  size_t v5;
  unint64_t *v6;
  void *v7;
  _QWORD v9[2];

  v2 = (unint64_t *)isStackAllocationSafe;
  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = specialized closure #1 in _NativeDictionary.filter(_:)((_QWORD *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, (uint64_t)v2);
    if (v1)
      swift_willThrow();
    else
      return v6;
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v2 = specialized closure #1 in _NativeDictionary.filter(_:)((unint64_t *)v7, v4, (uint64_t)v2);
    MEMORY[0x1AF44981C](v7, -1, -1);
  }
  return v2;
}

unint64_t *specialized closure #1 in _NativeDictionary.filter(_:)(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;

  v4 = 0;
  v5 = 0;
  v6 = a3 + 64;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }
    v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v13 >= v10)
      return (unint64_t *)specialized _NativeDictionary.extractDictionary(using:count:)(result, a2, v4, a3);
    v14 = *(_QWORD *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      v5 = v13 + 1;
      if (v13 + 1 >= v10)
        return (unint64_t *)specialized _NativeDictionary.extractDictionary(using:count:)(result, a2, v4, a3);
      v14 = *(_QWORD *)(v6 + 8 * v5);
      if (!v14)
      {
        v5 = v13 + 2;
        if (v13 + 2 >= v10)
          return (unint64_t *)specialized _NativeDictionary.extractDictionary(using:count:)(result, a2, v4, a3);
        v14 = *(_QWORD *)(v6 + 8 * v5);
        if (!v14)
          break;
      }
    }
LABEL_20:
    v9 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_5:
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * v12) + 16) >= 2uLL)
    {
      *(unint64_t *)((char *)result + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v4++, 1))
      {
        __break(1u);
        return (unint64_t *)specialized _NativeDictionary.extractDictionary(using:count:)(result, a2, v4, a3);
      }
    }
  }
  v15 = v13 + 3;
  if (v15 >= v10)
    return (unint64_t *)specialized _NativeDictionary.extractDictionary(using:count:)(result, a2, v4, a3);
  v14 = *(_QWORD *)(v6 + 8 * v15);
  if (v14)
  {
    v5 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    v5 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v5 >= v10)
      return (unint64_t *)specialized _NativeDictionary.extractDictionary(using:count:)(result, a2, v4, a3);
    v14 = *(_QWORD *)(v6 + 8 * v5);
    ++v15;
    if (v14)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary.extractDictionary(using:count:)(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t *v31;

  if (!a3)
    return MEMORY[0x1E0DEE9E0];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<UInt64, [UInt64]>);
  result = static _DictionaryStorage.allocate(capacity:)();
  v9 = result;
  v31 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= a2)
        return v9;
      v16 = v31[v15];
      ++v11;
      if (!v16)
      {
        v11 = v15 + 1;
        if (v15 + 1 >= a2)
          return v9;
        v16 = v31[v11];
        if (!v16)
        {
          v11 = v15 + 2;
          if (v15 + 2 >= a2)
            return v9;
          v16 = v31[v11];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= a2)
              return v9;
            v16 = v31[v17];
            if (!v16)
            {
              while (1)
              {
                v11 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v11 >= a2)
                  return v9;
                v16 = v31[v11];
                ++v17;
                if (v16)
                  goto LABEL_24;
              }
            }
            v11 = v17;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    v18 = 8 * v14;
    v19 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + v18);
    v20 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + v18);
    result = static Hasher._hash(seed:_:)();
    v21 = -1 << *(_BYTE *)(v9 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v27 = v23 == v26;
        if (v23 == v26)
          v23 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v23);
      }
      while (v28 == -1);
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(_QWORD *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    v29 = 8 * v24;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + v29) = v19;
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + v29) = v20;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    result = swift_bridgeObjectRetain();
    if (!v5)
      return v9;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t *v33;
  uint64_t v34;

  if (!a3)
    return MEMORY[0x1E0DEE9E0];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _DictionaryStorage<String, NSNumber>);
  result = static _DictionaryStorage.allocate(capacity:)();
  v9 = result;
  v33 = a1;
  v34 = a2;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= v34)
        return v9;
      v16 = v33[v15];
      ++v11;
      if (!v16)
      {
        v11 = v15 + 1;
        if (v15 + 1 >= v34)
          return v9;
        v16 = v33[v11];
        if (!v16)
        {
          v11 = v15 + 2;
          if (v15 + 2 >= v34)
            return v9;
          v16 = v33[v11];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v34)
              return v9;
            v16 = v33[v17];
            if (!v16)
            {
              while (1)
              {
                v11 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v11 >= v34)
                  return v9;
                v16 = v33[v11];
                ++v17;
                if (v16)
                  goto LABEL_24;
              }
            }
            v11 = v17;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    v18 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v14);
    v20 = *v18;
    v19 = v18[1];
    v21 = *(void **)(*(_QWORD *)(v4 + 56) + 8 * v14);
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    v22 = v21;
    String.hash(into:)();
    result = Hasher._finalize()();
    v23 = -1 << *(_BYTE *)(v9 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v26 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v25 == v28;
        if (v25 == v28)
          v25 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v30 == -1);
      v26 = __clz(__rbit64(~v30)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
    v31 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v26);
    *v31 = v20;
    v31[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v26) = v22;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v9;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary.extractDictionary(using:count:)(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v43;
  unint64_t *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;

  v8 = type metadata accessor for Date();
  v49 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x1E0C80A78](v8);
  v51 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9);
  v48 = (char *)&v43 - v12;
  if (!a3)
    return MEMORY[0x1E0DEE9E0];
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  v47 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Date>);
  result = static _DictionaryStorage.allocate(capacity:)();
  v14 = result;
  v44 = a1;
  v45 = a2;
  if (a2 < 1)
    v15 = 0;
  else
    v15 = *a1;
  v16 = 0;
  v17 = result + 64;
  v18 = v47;
  v19 = v48;
  v46 = a4;
  while (1)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v50 = v16;
      v21 = v20 | (v16 << 6);
    }
    else
    {
      v22 = v16 + 1;
      if (__OFADD__(v16, 1))
        goto LABEL_40;
      if (v22 >= v45)
        return v14;
      v23 = v44[v22];
      v24 = v16 + 1;
      if (!v23)
      {
        v24 = v16 + 2;
        if (v16 + 2 >= v45)
          return v14;
        v23 = v44[v24];
        if (!v23)
        {
          v24 = v16 + 3;
          if (v16 + 3 >= v45)
            return v14;
          v23 = v44[v24];
          if (!v23)
          {
            v25 = v16 + 4;
            if (v16 + 4 >= v45)
              return v14;
            v23 = v44[v25];
            if (!v23)
            {
              while (1)
              {
                v24 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_41;
                if (v24 >= v45)
                  return v14;
                v23 = v44[v24];
                ++v25;
                if (v23)
                  goto LABEL_24;
              }
            }
            v24 = v16 + 4;
          }
        }
      }
LABEL_24:
      v15 = (v23 - 1) & v23;
      v50 = v24;
      v21 = __clz(__rbit64(v23)) + (v24 << 6);
    }
    v26 = a4[7];
    v27 = (uint64_t *)(a4[6] + 16 * v21);
    v28 = *v27;
    v29 = v27[1];
    v30 = v49;
    v31 = *(_QWORD *)(v49 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v49 + 16))(v19, v26 + v31 * v21, v18);
    v32 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v32(v51, v19, v18);
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    result = Hasher._finalize()();
    v33 = -1 << *(_BYTE *)(v14 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      v36 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
      v18 = v47;
    }
    else
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v33) >> 6;
      v18 = v47;
      do
      {
        if (++v35 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v39 = v35 == v38;
        if (v35 == v38)
          v35 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v17 + 8 * v35);
      }
      while (v40 == -1);
      v36 = __clz(__rbit64(~v40)) + (v35 << 6);
    }
    *(_QWORD *)(v17 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v36;
    v41 = (_QWORD *)(*(_QWORD *)(v14 + 48) + 16 * v36);
    *v41 = v28;
    v41[1] = v29;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)(*(_QWORD *)(v14 + 56) + v36 * v31, v51, v18);
    ++*(_QWORD *)(v14 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v46;
    v16 = v50;
    if (!a3)
      return v14;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t specialized static Histogram.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t result;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;

  if (!specialized static Array<A>.== infix(_:_:)(*(_QWORD **)(a1 + OBJC_IVAR____TtC14CopresenceCore9Histogram_buckets), *(_QWORD **)(a2 + OBJC_IVAR____TtC14CopresenceCore9Histogram_buckets)))return 0;
  v4 = (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)a1 + 128))();
  v5 = (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)a2 + 128))();
  v6 = specialized static Array<A>.== infix(_:_:)(v4, v5);
  swift_bridgeObjectRelease();
  v7 = swift_bridgeObjectRelease();
  if (!v6)
    return 0;
  v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 184))(v7);
  v10 = v9;
  result = (*(uint64_t (**)(void))(*(_QWORD *)a2 + 184))();
  if ((v10 & 1) != 0)
  {
    if ((v12 & 1) == 0)
      return 0;
    goto LABEL_8;
  }
  v13 = result;
  result = 0;
  if ((v12 & 1) == 0 && v8 == v13)
  {
LABEL_8:
    v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 208))(result);
    v16 = v15;
    result = (*(uint64_t (**)(void))(*(_QWORD *)a2 + 208))();
    if ((v16 & 1) == 0)
    {
      v18 = result;
      result = 0;
      if ((v17 & 1) != 0 || v14 != v18)
        return result;
LABEL_15:
      v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 232))(result);
      return v19 == (*(uint64_t (**)(void))(*(_QWORD *)a2 + 232))();
    }
    if ((v17 & 1) != 0)
      goto LABEL_15;
    return 0;
  }
  return result;
}

uint64_t sub_1ACF38F84@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 128))();
  *a2 = result;
  return result;
}

uint64_t sub_1ACF38FB4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 136);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_1ACF38FE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 184))();
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1ACF3901C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14CopresenceCore9Histogram_minValue);
}

uint64_t sub_1ACF39028@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 208))();
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1ACF39060(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14CopresenceCore9Histogram_maxValue);
}

uint64_t keypath_set_2Tm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t result;

  v5 = *a1;
  v6 = *((_BYTE *)a1 + 8);
  v7 = *a2 + *a5;
  result = swift_beginAccess();
  *(_QWORD *)v7 = v5;
  *(_BYTE *)(v7 + 8) = v6;
  return result;
}

uint64_t sub_1ACF390C4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 232))();
  *a2 = result;
  return result;
}

uint64_t sub_1ACF390F4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC14CopresenceCore9Histogram_totalCount);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t ObjC metadata update function for Histogram()
{
  return type metadata accessor for Histogram();
}

void type metadata completion function for Histogram()
{
  unint64_t v0;

  type metadata accessor for Logger?();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for Histogram()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Histogram.bucketCounts.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of Histogram.bucketCounts.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of Histogram.bucketCounts.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of Histogram.__allocating_init(buckets:log:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of Histogram.minValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of Histogram.maxValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of Histogram.totalCount.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of Histogram.recordValue(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of Histogram.clearCounts()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of Histogram.clearMaxValue()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of Histogram.clearMinValue()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of Histogram.reset()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of Histogram.conciseDescription.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of Histogram.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of Histogram.intervalDescription(omitEmptyBins:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

void type metadata accessor for Logger?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Logger?)
  {
    type metadata accessor for Logger();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Logger?);
  }
}

unint64_t lazy protocol witness table accessor for type UnknownStorage and conformance UnknownStorage()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage;
  if (!lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage)
  {
    v1 = type metadata accessor for UnknownStorage();
    result = MEMORY[0x1AF44972C](MEMORY[0x1E0D3E9A8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage);
  }
  return result;
}

uint64_t DarwinNotification.__allocating_init(name:queue:)(char a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((a1 & 1) != 0)
    v3 = 0xD000000000000056;
  else
    v3 = 0xD00000000000003ALL;
  if ((a1 & 1) != 0)
    v4 = 0x80000001ACF7C020;
  else
    v4 = 0x80000001ACF7BFE0;
  v5 = swift_allocObject();
  DarwinNotification.init(name:queue:)(v3, v4, a2);
  return v5;
}

uint64_t DarwinNotification.state.getter()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t state64[5];

  state64[4] = *MEMORY[0x1E0C80C00];
  state64[0] = 0;
  swift_beginAccess();
  if (!notify_get_state(*(_DWORD *)(v0 + 32), state64))
    return state64[0];
  if (one-time initialization token for default != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Log.default);
  v2 = Logger.logObject.getter();
  v3 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1ACCCC000, v2, v3, "Could not get current state.", v4, 2u);
    MEMORY[0x1AF44981C](v4, -1, -1);
  }

  return 0;
}

uint64_t DarwinNotification.state.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  return notify_set_state(*(_DWORD *)(v1 + 32), a1);
}

Swift::Void __swiftcall DarwinNotification.post()()
{
  uint64_t v0;

  v0 = String.utf8CString.getter();
  notify_post((const char *)(v0 + 32));
  swift_release();
}

uint64_t DarwinNotification.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void (*DarwinNotification.state.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = v3 + 3;
  v3[4] = 0;
  v5 = v3 + 4;
  v3[5] = v1;
  swift_beginAccess();
  if (notify_get_state(*(_DWORD *)(v1 + 32), v5))
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)static Log.default);
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1ACCCC000, v7, v8, "Could not get current state.", v9, 2u);
      MEMORY[0x1AF44981C](v9, -1, -1);
    }

    v10 = 0;
  }
  else
  {
    v10 = *v5;
  }
  *v4 = v10;
  return DarwinNotification.state.modify;
}

void DarwinNotification.state.modify(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  notify_set_state(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 32), *(_QWORD *)(*(_QWORD *)a1 + 24));
  free(v1);
}

uint64_t DarwinNotification.__allocating_init(name:queue:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  DarwinNotification.init(name:queue:)(a1, a2, a3);
  return v6;
}

uint64_t DarwinNotification.deinit()
{
  uint64_t v0;

  swift_beginAccess();
  notify_cancel(*(_DWORD *)(v0 + 32));
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t DarwinNotification.__deallocating_deinit()
{
  uint64_t v0;

  swift_beginAccess();
  notify_cancel(*(_DWORD *)(v0 + 32));
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1ACF39844()
{
  swift_unownedRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in DarwinNotification.init(name:queue:)()
{
  swift_unownedRetainStrong();
  DarwinNotification.handleNotification()();
  return swift_release();
}

uint64_t block_destroy_helper_37()
{
  return swift_release();
}

uint64_t sub_1ACF3989C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = DarwinNotification.state.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1ACF398C4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  return notify_set_state(*(_DWORD *)(v3 + 32), v2);
}

uint64_t method lookup function for DarwinNotification()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DarwinNotification.__allocating_init(name:queue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t PeoplePickerHostConnection.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + direct field offset for PeoplePickerHostConnection.delegate;
  swift_beginAccess();
  return MEMORY[0x1AF449918](v1);
}

uint64_t PeoplePickerHostConnection.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + direct field offset for PeoplePickerHostConnection.delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*PeoplePickerHostConnection.delegate.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = direct field offset for PeoplePickerHostConnection.delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1AF449918](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return ActivitySession.sessionManager.modify;
}

Swift::Void __swiftcall PeoplePickerHostConnection.handleHostConnectionInvalidated()()
{
  void *v0;
  uint64_t v1;
  char *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;

  if (one-time initialization token for host != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Log.host);
  v2 = v0;
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v5 = 138412290;
    v7 = v2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v6 = v2;

    _os_log_impl(&dword_1ACCCC000, v3, v4, "handleHostConnectionInvalidated: %@", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v6, -1, -1);
    MEMORY[0x1AF44981C](v5, -1, -1);

  }
  else
  {

  }
  v8 = &v2[direct field offset for PeoplePickerHostConnection.delegate];
  swift_beginAccess();
  if (MEMORY[0x1AF449918](v8))
  {
    v9 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(ObjectType, v9);
    swift_unknownObjectRelease();
  }
}

char *PeoplePickerHostConnection.__allocating_init(connection:queue:)(void *a1, void *a2)
{
  objc_class *v2;
  char *v5;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[direct field offset for PeoplePickerHostConnection.delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  return specialized XPCHostConnection.init(connection:queue:)(a1, a2);
}

char *PeoplePickerHostConnection.init(connection:queue:)(void *a1, void *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + direct field offset for PeoplePickerHostConnection.delegate + 8) = 0;
  swift_unknownObjectWeakInit();
  return specialized XPCHostConnection.init(connection:queue:)(a1, a2);
}

uint64_t PeoplePickerHostConnection.__ivar_destroyer()
{
  uint64_t v0;

  return outlined destroy of weak ActivitySessionManagerProtocol?(v0 + direct field offset for PeoplePickerHostConnection.delegate);
}

id PeoplePickerHostConnection.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t @objc PeoplePickerHostConnection.__ivar_destroyer(uint64_t a1)
{
  return outlined destroy of weak ActivitySessionManagerProtocol?(a1 + direct field offset for PeoplePickerHostConnection.delegate);
}

uint64_t PeoplePickerHostConnection.checkIn(_:reply:)(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;

  v5 = v2 + direct field offset for PeoplePickerHostConnection.delegate;
  swift_beginAccess();
  if (MEMORY[0x1AF449918](v5))
  {
    v6 = *(_QWORD *)(v5 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, ObjectType, v6);
    swift_unknownObjectRelease();
  }
  return a2(1);
}

uint64_t PeoplePickerHostConnection.updateActivity(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t ObjectType;

  v3 = v1 + direct field offset for PeoplePickerHostConnection.delegate;
  swift_beginAccess();
  result = MEMORY[0x1AF449918](v3);
  if (result)
  {
    v5 = *(_QWORD *)(v3 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, ObjectType, v5);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1ACF3A114@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + direct field offset for PeoplePickerHostConnection.delegate;
  swift_beginAccess();
  result = MEMORY[0x1AF449918](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1ACF3A16C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + direct field offset for PeoplePickerHostConnection.delegate;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of PeoplePickerHostConnectionDelegate.handleHostConnectionInvalidated()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PeoplePickerHostConnectionDelegate.checkIn(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of PeoplePickerHostConnectionDelegate.updateActivity(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t type metadata accessor for PeoplePickerHostConnection()
{
  uint64_t result;

  result = type metadata singleton initialization cache for PeoplePickerHostConnection;
  if (!type metadata singleton initialization cache for PeoplePickerHostConnection)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for PeoplePickerHostConnection()
{
  return swift_initClassMetadata2();
}

uint64_t ObjC metadata update function for PeoplePickerHostConnection()
{
  return type metadata accessor for PeoplePickerHostConnection();
}

uint64_t specialized PeoplePickerHostConnection.checkIn(_:reply:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;

  v5 = a2 + direct field offset for PeoplePickerHostConnection.delegate;
  swift_beginAccess();
  if (MEMORY[0x1AF449918](v5))
  {
    v6 = *(_QWORD *)(v5 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, ObjectType, v6);
    swift_unknownObjectRelease();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1);
}

uint64_t AttachmentLedger_SubscribeResponse.InitializeAck.otherParticipants.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
  {
    swift_bridgeObjectRetain();
    v4 = (_QWORD *)MEMORY[0x1E0DEE9E0];
LABEL_17:
    swift_bridgeObjectRelease();
    return (uint64_t)v4;
  }
  v3 = (uint64_t *)(v1 + 32);
  swift_bridgeObjectRetain();
  v4 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  while (1)
  {
    v6 = *v3++;
    v5 = v6;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = specialized __RawDictionaryStorage.find<A>(_:)(v6);
    v10 = v4[2];
    v11 = (v8 & 1) == 0;
    v12 = v10 + v11;
    if (__OFADD__(v10, v11))
      break;
    v13 = v8;
    if (v4[3] >= v12)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v8 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        specialized _NativeDictionary.copy()();
        if ((v13 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v12, isUniquelyReferenced_nonNull_native);
      v14 = specialized __RawDictionaryStorage.find<A>(_:)(v5);
      if ((v13 & 1) != (v15 & 1))
        goto LABEL_20;
      v9 = v14;
      if ((v13 & 1) != 0)
      {
LABEL_3:
        *(_QWORD *)(v4[7] + 8 * v9) = v5;
        goto LABEL_4;
      }
    }
    v4[(v9 >> 6) + 8] |= 1 << v9;
    v16 = 8 * v9;
    *(_QWORD *)(v4[6] + v16) = v5;
    *(_QWORD *)(v4[7] + v16) = v5;
    v17 = v4[2];
    v18 = __OFADD__(v17, 1);
    v19 = v17 + 1;
    if (v18)
      goto LABEL_19;
    v4[2] = v19;
LABEL_4:
    swift_bridgeObjectRelease();
    if (!--v2)
      goto LABEL_17;
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t AttachmentLedger_SubscribeResponse.AttachmentUpdate.StatusChanged.Full.uploadStatus.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AttachmentLedger_MMCSMetadata.BlobData?);
  v2 = MEMORY[0x1E0C80A78](v1);
  MEMORY[0x1E0C80A78](v2);
  v3 = type metadata accessor for AttachmentLedger_MMCSMetadata.BlobData(0);
  v4 = MEMORY[0x1E0C80A78](v3);
  MEMORY[0x1E0C80A78](v4);
  if (*(_BYTE *)(v0 + 24) == 1)
    __asm { BR              X10 }
  lazy protocol witness table accessor for type PluginAttachmentLedgerTopic.Errors and conformance PluginAttachmentLedgerTopic.Errors();
  swift_allocError();
  *v5 = 1;
  return swift_willThrow();
}

uint64_t AttachmentLedger_AttachmentMetadata.uploadStatus.getter@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v12;
  _BYTE *v13;
  _QWORD v15[8];

  v15[7] = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AttachmentLedger_MMCSMetadata.BlobData?);
  v3 = MEMORY[0x1E0C80A78](v2);
  v15[3] = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v5 = type metadata accessor for AttachmentLedger_MMCSMetadata.BlobData(0);
  v6 = *(_QWORD *)(v5 - 8);
  v15[5] = v5;
  v15[6] = v6;
  v7 = MEMORY[0x1E0C80A78](v5);
  v15[4] = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AttachmentLedger_MMCSMetadata?);
  v10 = MEMORY[0x1E0C80A78](v9);
  MEMORY[0x1E0C80A78](v10);
  v11 = type metadata accessor for AttachmentLedger_MMCSMetadata(0);
  v12 = MEMORY[0x1E0C80A78](v11);
  MEMORY[0x1E0C80A78](v12);
  if (*(_BYTE *)(v1 + 32) == 1)
    __asm { BR              X10 }
  lazy protocol witness table accessor for type PluginAttachmentLedgerTopic.Errors and conformance PluginAttachmentLedgerTopic.Errors();
  swift_allocError();
  *v13 = 1;
  return swift_willThrow();
}

void thunk for @escaping @callee_guaranteed (@guaranteed PresenceSessionConnectionInfo?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t BackgroundSessionManagerXPCClient.begin(request:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t BackgroundSessionManagerXPCClient.begin(request:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v2 + 32) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = BackgroundSessionManagerXPCClient.begin(request:);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void closure #1 in BackgroundSessionManagerXPCClient.begin(request:)(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = partial apply for closure #1 in closure #1 in BackgroundSessionManagerXPCClient.begin(request:);
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed NSXPCListenerEndpoint?) -> ();
  aBlock[3] = &block_descriptor_26_1;
  v11 = _Block_copy(aBlock);
  v12 = a3;
  swift_release();
  objc_msgSend(a2, sel_beginWithRequest_completion_, v12, v11);
  _Block_release(v11);
}

void partial apply for closure #1 in BackgroundSessionManagerXPCClient.begin(request:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in BackgroundSessionManagerXPCClient.begin(request:)(a1, *(void **)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t closure #1 in closure #1 in BackgroundSessionManagerXPCClient.begin(request:)(void *a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v30;

  if (a1)
  {
    v4 = a1;
    if (one-time initialization token for default != -1)
      swift_once();
    v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)static Log.default);
    v6 = a2;
    v7 = a1;
    v8 = v6;
    v9 = a1;
    v10 = Logger.logObject.getter();
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      v30 = v13;
      *(_DWORD *)v12 = 136315394;
      type metadata accessor for BackgroundSessionCreationRequest();
      v14 = v8;
      v15 = String.init<A>(reflecting:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2080;
      v17 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      v18 = String.init<A>(reflecting:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v19, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1ACCCC000, v10, v11, "Failed to begin activity: %s with error %s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v13, -1, -1);
      MEMORY[0x1AF44981C](v12, -1, -1);
    }
    else
    {

    }
    v30 = (uint64_t)a1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v20 = type metadata accessor for Logger();
    __swift_project_value_buffer(v20, (uint64_t)static Log.default);
    v21 = a2;
    v22 = Logger.logObject.getter();
    v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v30 = v25;
      *(_DWORD *)v24 = 136315138;
      type metadata accessor for BackgroundSessionCreationRequest();
      v26 = v21;
      v27 = String.init<A>(reflecting:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v28, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ACCCC000, v22, v23, "Successfully began activity: %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v25, -1, -1);
      MEMORY[0x1AF44981C](v24, -1, -1);

    }
    else
    {

    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
    return CheckedContinuation.resume(returning:)();
  }
}

uint64_t BackgroundSessionManagerXPCClient.leave(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t BackgroundSessionManagerXPCClient.leave(identifier:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v2 + 32) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = BackgroundSessionManagerXPCClient.leave(identifier:);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

void closure #1 in BackgroundSessionManagerXPCClient.leave(identifier:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  Class v15;
  uint64_t v16;
  uint64_t v17;
  Class isa;
  id v19;
  _QWORD aBlock[6];

  v19 = a2;
  v17 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v7 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v4);
  v11 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = (v9 + *(unsigned __int8 *)(v5 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v13 + v11, v10, v7);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v13 + v12, (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = partial apply for closure #1 in closure #1 in BackgroundSessionManagerXPCClient.leave(identifier:);
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed NSXPCListenerEndpoint?) -> ();
  aBlock[3] = &block_descriptor_20_0;
  v14 = _Block_copy(aBlock);
  swift_release();
  v15 = isa;
  objc_msgSend(v19, sel_leaveWithIdentifier_completion_, isa, v14);
  _Block_release(v14);

}

void partial apply for closure #1 in BackgroundSessionManagerXPCClient.leave(identifier:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in BackgroundSessionManagerXPCClient.leave(identifier:)(a1, *(void **)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t BackgroundSessionManagerXPCClient.updateMembers(identifier:members:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t BackgroundSessionManagerXPCClient.updateMembers(identifier:members:)()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  v2 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v1 + 32) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  *v3 = v0;
  v3[1] = BackgroundSessionManagerXPCClient.updateMembers(identifier:members:);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void closure #1 in BackgroundSessionManagerXPCClient.updateMembers(identifier:members:)(uint64_t a1, void *a2, uint64_t a3, objc_class *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  Class v16;
  Class v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  Class v21;
  Class isa;
  id v23;
  _QWORD aBlock[6];

  v20 = a1;
  v21 = a4;
  v23 = a2;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
  v5 = *(_QWORD *)(v19 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v19);
  v7 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUHandle);
  lazy protocol witness table accessor for type TUHandle and conformance NSObject();
  v21 = Set._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
  v11 = v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v20, v19);
  v12 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v13 = (v9 + *(unsigned __int8 *)(v5 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v14 + v12, v10, v7);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v14 + v13, (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  aBlock[4] = partial apply for closure #1 in closure #1 in BackgroundSessionManagerXPCClient.updateMembers(identifier:members:);
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed NSXPCListenerEndpoint?) -> ();
  aBlock[3] = &block_descriptor_14_1;
  v15 = _Block_copy(aBlock);
  swift_release();
  v16 = isa;
  v17 = v21;
  objc_msgSend(v23, sel_updateMembersWithIdentifier_members_completion_, isa, v21, v15);
  _Block_release(v15);

}

void partial apply for closure #1 in BackgroundSessionManagerXPCClient.updateMembers(identifier:members:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in BackgroundSessionManagerXPCClient.updateMembers(identifier:members:)(a1, *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(objc_class **)(v1 + 40));
}

uint64_t closure #1 in closure #1 in BackgroundSessionManagerXPCClient.leave(identifier:)(void *a1, uint64_t a2, uint64_t a3, const char *a4, const char *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v10 = type metadata accessor for UUID();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v39 - v15;
  if (a1)
  {
    v17 = a1;
    if (one-time initialization token for default != -1)
      swift_once();
    v18 = type metadata accessor for Logger();
    __swift_project_value_buffer(v18, (uint64_t)static Log.default);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, a2, v10);
    v19 = a1;
    v20 = a1;
    v21 = Logger.logObject.getter();
    v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc();
      v24 = swift_slowAlloc();
      v39 = a4;
      v25 = v24;
      v42 = v24;
      *(_DWORD *)v23 = 136315394;
      v40 = a3;
      lazy protocol witness table accessor for type UUID and conformance UUID();
      v26 = dispatch thunk of CustomStringConvertible.description.getter();
      v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
      *(_WORD *)(v23 + 12) = 2080;
      v41 = (uint64_t)a1;
      v28 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      v29 = String.init<A>(reflecting:)();
      v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v30, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1ACCCC000, v21, v22, v39, (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v25, -1, -1);
      MEMORY[0x1AF44981C](v23, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);

    }
    v42 = (uint64_t)a1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v31 = type metadata accessor for Logger();
    __swift_project_value_buffer(v31, (uint64_t)static Log.default);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, a2, v10);
    v32 = Logger.logObject.getter();
    v33 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v42 = v35;
      v39 = a5;
      v40 = a3;
      *(_DWORD *)v34 = 136315138;
      lazy protocol witness table accessor for type UUID and conformance UUID();
      v36 = dispatch thunk of CustomStringConvertible.description.getter();
      v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v36, v37, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
      _os_log_impl(&dword_1ACCCC000, v32, v33, v39, v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v35, -1, -1);
      MEMORY[0x1AF44981C](v34, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    }

    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
    return CheckedContinuation.resume(returning:)();
  }
}

uint64_t BackgroundSessionManagerXPCClient.createPresenceSession(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t BackgroundSessionManagerXPCClient.createPresenceSession(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v2 + 32) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  type metadata accessor for PresenceSessionConnectionInfo();
  *v3 = v0;
  v3[1] = BackgroundSessionManagerXPCClient.createPresenceSession(with:);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

void closure #1 in BackgroundSessionManagerXPCClient.createPresenceSession(with:)(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<PresenceSessionConnectionInfo, Error>);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = partial apply for closure #1 in closure #1 in BackgroundSessionManagerXPCClient.createPresenceSession(with:);
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed PresenceSessionConnectionInfo?, @guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor_40;
  v11 = _Block_copy(aBlock);
  v12 = a3;
  swift_release();
  objc_msgSend(a2, sel_createPresenceSessionWith_completion_, v12, v11);
  _Block_release(v11);
}

void partial apply for closure #1 in BackgroundSessionManagerXPCClient.createPresenceSession(with:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in BackgroundSessionManagerXPCClient.createPresenceSession(with:)(a1, *(void **)(v1 + 24), *(void **)(v1 + 32));
}

void closure #1 in closure #1 in BackgroundSessionManagerXPCClient.createPresenceSession(with:)(void *a1, id a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  _QWORD *v28;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  if (a2)
  {
    v5 = a2;
    if (one-time initialization token for default != -1)
      swift_once();
    v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)static Log.default);
    v7 = a3;
    v8 = a2;
    v9 = v7;
    v10 = a2;
    v11 = Logger.logObject.getter();
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v14 = (_QWORD *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v37 = v35;
      *(_DWORD *)v13 = 138412546;
      v15 = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v14 = v9;

      *(_WORD *)(v13 + 12) = 2080;
      v16 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      v17 = String.init<A>(reflecting:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1ACCCC000, v11, v12, "Failed to create presence session with request: %@ with error: %s", (uint8_t *)v13, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v14, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v35, -1, -1);
      MEMORY[0x1AF44981C](v13, -1, -1);
    }
    else
    {

    }
    v37 = (uint64_t)a2;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<PresenceSessionConnectionInfo, Error>);
    CheckedContinuation.resume(throwing:)();
  }
  else
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v20 = type metadata accessor for Logger();
    __swift_project_value_buffer(v20, (uint64_t)static Log.default);
    v21 = a1;
    v22 = a3;
    v23 = v21;
    v24 = v22;
    v25 = Logger.logObject.getter();
    v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v28 = (_QWORD *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v37 = v36;
      *(_DWORD *)v27 = 138412546;
      v29 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v28 = v24;

      *(_WORD *)(v27 + 12) = 2080;
      if (a1)
      {
        type metadata accessor for PresenceSessionConnectionInfo();
        v30 = v23;
        v31 = String.init<A>(reflecting:)();
        v33 = v32;
      }
      else
      {
        v33 = 0xE300000000000000;
        v31 = 7104878;
      }
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v33, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ACCCC000, v25, v26, "Successfully created presence session with request: %@, connectionInfo: %s", (uint8_t *)v27, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v28, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v36, -1, -1);
      MEMORY[0x1AF44981C](v27, -1, -1);

    }
    else
    {

    }
    if (a1)
    {
      v37 = (uint64_t)v23;
      v34 = v23;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<PresenceSessionConnectionInfo, Error>);
      CheckedContinuation.resume(returning:)();
    }
    else
    {
      __break(1u);
    }
  }
}

void static BackgroundSessionManagerInterface.identity.getter(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

id static BackgroundSessionManagerInterface.hostObjectInterface.getter()
{
  return static ConversationManagerInterface.hostObjectInterface.getter(&one-time initialization token for hostObjectInterface, (id *)&static BackgroundSessionManagerInterface.hostObjectInterface);
}

id one-time initialization function for clientObjectInterface()
{
  id result;

  result = closure #1 in variable initialization expression of static BackgroundSessionManagerInterface.clientObjectInterface();
  static BackgroundSessionManagerInterface.clientObjectInterface = (uint64_t)result;
  return result;
}

id closure #1 in variable initialization expression of static BackgroundSessionManagerInterface.clientObjectInterface()
{
  id v0;
  uint64_t inited;
  uint64_t v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1EECDC0E8);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1ACF59E10;
  *(_QWORD *)(inited + 32) = type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for NSArray);
  *(_QWORD *)(inited + 40) = type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for TUConversationActivitySessionContainer);
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(inited, (uint64_t)sel_updateWithActivitySessions_, 0, 0);
  swift_setDeallocating();
  v2 = swift_initStackObject();
  *(_OWORD *)(v2 + 16) = xmmword_1ACF59E10;
  *(_QWORD *)(v2 + 32) = type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for NSSet);
  *(_QWORD *)(v2 + 40) = type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUHandle);
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v2, (uint64_t)sel_sessionDidReceiveUpdatedUnknownParticipantListWithSessionID_unknownParticipants_, 1, 0);
  swift_setDeallocating();
  return v0;
}

id static BackgroundSessionManagerInterface.clientObjectInterface.getter()
{
  return static ConversationManagerInterface.hostObjectInterface.getter(&one-time initialization token for clientObjectInterface, (id *)&static BackgroundSessionManagerInterface.clientObjectInterface);
}

id protocol witness for static XPCInterface.hostObjectInterface.getter in conformance BackgroundSessionManagerInterface(uint64_t a1, uint64_t a2)
{
  return protocol witness for static XPCInterface.hostObjectInterface.getter in conformance ConversationManagerInterface(a1, a2, &one-time initialization token for hostObjectInterface, (id *)&static BackgroundSessionManagerInterface.hostObjectInterface);
}

id protocol witness for static XPCInterface.clientObjectInterface.getter in conformance BackgroundSessionManagerInterface(uint64_t a1, uint64_t a2)
{
  return protocol witness for static XPCInterface.hostObjectInterface.getter in conformance ConversationManagerInterface(a1, a2, &one-time initialization token for clientObjectInterface, (id *)&static BackgroundSessionManagerInterface.clientObjectInterface);
}

ValueMetadata *type metadata accessor for BackgroundSessionManagerInterface()
{
  return &type metadata for BackgroundSessionManagerInterface;
}

uint64_t sub_1ACF3CA50()
{
  return objectdestroyTm_10(&demangling cache variable for type metadata for CheckedContinuation<PresenceSessionConnectionInfo, Error>);
}

void partial apply for closure #1 in closure #1 in BackgroundSessionManagerXPCClient.createPresenceSession(with:)(void *a1, void *a2)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<PresenceSessionConnectionInfo, Error>);
  closure #1 in closure #1 in BackgroundSessionManagerXPCClient.createPresenceSession(with:)(a1, a2, *(void **)(v2 + 16));
}

uint64_t block_destroy_helper_38()
{
  return swift_release();
}

uint64_t partial apply for closure #1 in closure #1 in BackgroundSessionManagerXPCClient.updateMembers(identifier:members:)(void *a1)
{
  return partial apply for closure #1 in closure #1 in BackgroundSessionManagerXPCClient.updateMembers(identifier:members:)(a1, "Failed to update members on identifier: %s with error: %s", "Successfully updated members on identifier: %s");
}

uint64_t objectdestroy_10Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for UUID();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in BackgroundSessionManagerXPCClient.leave(identifier:)(void *a1)
{
  return partial apply for closure #1 in closure #1 in BackgroundSessionManagerXPCClient.updateMembers(identifier:members:)(a1, "Failed to leave identifier: %s with error: %s", "Successfully left identifier: %s");
}

uint64_t partial apply for closure #1 in closure #1 in BackgroundSessionManagerXPCClient.updateMembers(identifier:members:)(void *a1, const char *a2, const char *a3)
{
  uint64_t v3;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v7 = *(_QWORD *)(type metadata accessor for UUID() - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = v8 + *(_QWORD *)(v7 + 64);
  v10 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>)
                                       - 8)
                           + 80);
  return closure #1 in closure #1 in BackgroundSessionManagerXPCClient.leave(identifier:)(a1, v3 + v8, v3 + ((v9 + v10) & ~v10), a2, a3);
}

uint64_t sub_1ACF3CC28()
{
  return objectdestroyTm_10(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
}

uint64_t objectdestroyTm_10(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);

  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v1 + v4, v2);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in BackgroundSessionManagerXPCClient.begin(request:)(void *a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
  return closure #1 in closure #1 in BackgroundSessionManagerXPCClient.begin(request:)(a1, *(void **)(v1 + 16));
}

BOOL static TopicDecryptionError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void TopicDecryptionError.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int TopicDecryptionError.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t TopicCryptorProvider.validEncryptionID(data:)()
{
  return 1;
}

unint64_t lazy protocol witness table accessor for type TopicDecryptionError and conformance TopicDecryptionError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TopicDecryptionError and conformance TopicDecryptionError;
  if (!lazy protocol witness table cache variable for type TopicDecryptionError and conformance TopicDecryptionError)
  {
    result = MEMORY[0x1AF44972C](&protocol conformance descriptor for TopicDecryptionError, &type metadata for TopicDecryptionError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TopicDecryptionError and conformance TopicDecryptionError);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TopicDecryptionError and conformance TopicDecryptionError;
  if (!lazy protocol witness table cache variable for type TopicDecryptionError and conformance TopicDecryptionError)
  {
    result = MEMORY[0x1AF44972C](&protocol conformance descriptor for TopicDecryptionError, &type metadata for TopicDecryptionError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TopicDecryptionError and conformance TopicDecryptionError);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TopicDecryptionError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1ACF3CE2C + 4 * byte_1ACF6B1C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1ACF3CE60 + 4 * asc_1ACF6B1C0[v4]))();
}

uint64_t sub_1ACF3CE60(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1ACF3CE68(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1ACF3CE70);
  return result;
}

uint64_t sub_1ACF3CE7C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1ACF3CE84);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1ACF3CE88(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1ACF3CE90(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TopicDecryptionError()
{
  return &type metadata for TopicDecryptionError;
}

uint64_t dispatch thunk of TopicCryptorProvider.encryptionID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TopicCryptorProvider.encryptionIDPublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of TopicCryptorProvider.decryptionIDSet.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TopicCryptorProvider.decryptionIDSetPublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TopicCryptorProvider.validEncryptionID(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of TopicCryptorProvider.refresh(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of TopicCryptorProvider.encrypt(data:seqNum:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of TopicCryptorProvider.decrypt(data:encryptionID:seqNum:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 64))();
}

uint64_t dispatch thunk of TopicCryptorProvider.refreshEncryptionIDSet(participantIDs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

void PubSubClient.TopicCategory.init(activity:)(void *a1@<X0>, char *a2@<X8>)
{
  char v4;
  unsigned int v5;

  if (a1)
  {
    if (objc_msgSend(a1, sel_isSystemActivity))
    {

      v4 = 2;
    }
    else
    {
      v5 = objc_msgSend(a1, sel_isScreenSharingActivity);

      if (v5)
        v4 = 3;
      else
        v4 = 1;
    }
  }
  else
  {
    v4 = 0;
  }
  *a2 = v4;
}

uint64_t static PubSubClientError.== infix(_:_:)()
{
  return 1;
}

void PubSubClientError.hash(into:)()
{
  Hasher._combine(_:)(0);
}

Swift::Int PubSubClientError.hashValue.getter()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

CopresenceCore::PubSubClient::TopicCategory_optional __swiftcall PubSubClient.TopicCategory.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  void *object;
  Swift::String v3;
  char *v4;
  unint64_t v5;
  CopresenceCore::PubSubClient::TopicCategory_optional result;
  char v7;

  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  v4 = v1;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of PubSubClient.TopicCategory.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  v7 = 5;
  if (v5 < 5)
    v7 = v5;
  *v4 = v7;
  return result;
}

uint64_t PubSubClient.TopicCategory.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1ACF3D100 + 4 * byte_1ACF6B2C0[*v0]))(0x6E776F6E6B6E75, 0xE700000000000000);
}

uint64_t sub_1ACF3D100()
{
  return 7368801;
}

uint64_t sub_1ACF3D110()
{
  return 0x6D6574737973;
}

uint64_t sub_1ACF3D124()
{
  return 0x68536E6565726373;
}

uint64_t sub_1ACF3D144()
{
  return 0x636E795374736166;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance PubSubClient.TopicCategory(char *a1)
{
  specialized == infix<A>(_:_:)(*a1);
}

void protocol witness for Hashable.hashValue.getter in conformance PubSubClient.TopicCategory()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  __asm { BR              X9 }
}

Swift::Int sub_1ACF3D1B4()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance PubSubClient.TopicCategory()
{
  __asm { BR              X10 }
}

uint64_t sub_1ACF3D274()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance PubSubClient.TopicCategory()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  __asm { BR              X9 }
}

Swift::Int sub_1ACF3D32C()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

CopresenceCore::PubSubClient::TopicCategory_optional protocol witness for RawRepresentable.init(rawValue:) in conformance PubSubClient.TopicCategory(Swift::String *a1)
{
  return PubSubClient.TopicCategory.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance PubSubClient.TopicCategory()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1ACF3D3EC + 4 * byte_1ACF6B2D4[*v0]))();
}

void sub_1ACF3D3EC(_QWORD *a1@<X8>)
{
  *a1 = 7368801;
  a1[1] = 0xE300000000000000;
}

void sub_1ACF3D400(_QWORD *a1@<X8>)
{
  *a1 = 0x6D6574737973;
  a1[1] = 0xE600000000000000;
}

void sub_1ACF3D418(_QWORD *a1@<X8>)
{
  *a1 = 0x68536E6565726373;
  a1[1] = 0xEB00000000657261;
}

void sub_1ACF3D43C(_QWORD *a1@<X8>)
{
  *a1 = 0x636E795374736166;
  a1[1] = 0xE800000000000000;
}

uint64_t PubSubClient.serviceProvider.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of UserNotificationCenter(v1 + 16, a1);
}

double PubSubClient.createTopicRpcRetryIntervalSeconds.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 56);
}

uint64_t PubSubClient.createTopicMaxAttempts.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t PubSubClient.reporter.getter()
{
  return swift_retain();
}

uint64_t PubSubClient.reporterTag.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PubSubClient.__allocating_init(serviceProvider:createTopicMaxAttempts:createTopicRpcRetryIntervalSeconds:topicReporter:topicReporterTag:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v12;
  uint64_t v13;

  v12 = swift_allocObject();
  v13 = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)(v12 + 96) = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)(v12 + 104) = v13;
  outlined init with take of BackgroundSessionManagerDataSource(a1, v12 + 16);
  *(double *)(v12 + 56) = a6;
  *(_QWORD *)(v12 + 64) = a2;
  *(_QWORD *)(v12 + 72) = a3;
  *(_QWORD *)(v12 + 80) = a4;
  *(_QWORD *)(v12 + 88) = a5;
  return v12;
}

uint64_t PubSubClient.init(serviceProvider:createTopicMaxAttempts:createTopicRpcRetryIntervalSeconds:topicReporter:topicReporterTag:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v6;
  uint64_t v12;

  v12 = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)(v6 + 96) = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)(v6 + 104) = v12;
  outlined init with take of BackgroundSessionManagerDataSource(a1, v6 + 16);
  *(double *)(v6 + 56) = a6;
  *(_QWORD *)(v6 + 64) = a2;
  *(_QWORD *)(v6 + 72) = a3;
  *(_QWORD *)(v6 + 80) = a4;
  *(_QWORD *)(v6 + 88) = a5;
  return v6;
}

uint64_t PubSubClient.__allocating_init(pluginClient:createTopicMaxAttempts:createTopicRpcRetryIntervalSeconds:topicReporter:topicReporterTag:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[5];

  v13 = type metadata accessor for PluginPubSubServiceProvider();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a1;
  v16[3] = v13;
  v16[4] = &protocol witness table for PluginPubSubServiceProvider;
  v16[0] = v14;
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, double))(v6 + 184))(v16, a2, a3, a4, a5, a6);
}

uint64_t PubSubClient.deinit()
{
  uint64_t v0;

  swift_beginAccess();
  *(_QWORD *)(v0 + 104) = MEMORY[0x1E0DEE9E8];
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PubSubClient.__deallocating_deinit()
{
  uint64_t v0;

  swift_beginAccess();
  *(_QWORD *)(v0 + 104) = MEMORY[0x1E0DEE9E8];
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall PubSubClient.close()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
}

uint64_t PubSubClient.updateVirtualParticipant(_:localParticipantID:)(void *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;

  v5 = v2[5];
  v6 = v2[6];
  __swift_project_boxed_opaque_existential_1(v2 + 2, v5);
  return (*(uint64_t (**)(id, uint64_t, uint64_t, uint64_t))(v6 + 32))(objc_msgSend(a1, sel_identifier), a2, v5, v6);
}

uint64_t PubSubClient.localParticipantID.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
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
  _QWORD aBlock[6];
  __int128 v43[2];
  _BYTE v44[80];

  v11 = v10;
  v36 = a8;
  v31 = a3;
  v33 = a2;
  v32 = a1;
  v35 = a10;
  v34 = a9;
  v16 = type metadata accessor for DispatchWorkItemFlags();
  v40 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = type metadata accessor for DispatchQoS();
  v38 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *a5;
  outlined init with take of PluginClientMetrics.ConnectionEstablishment?(a6, (uint64_t)v44, &demangling cache variable for type metadata for PubSubTopic.Configuration?);
  v23 = v11[5];
  v22 = v11[6];
  __swift_project_boxed_opaque_existential_1(v11 + 2, v23);
  v37 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v23, v22);
  outlined init with copy of UserNotificationCenter(a7, (uint64_t)v43);
  v24 = swift_allocObject();
  v25 = v31;
  *(_QWORD *)(v24 + 16) = v11;
  *(_QWORD *)(v24 + 24) = v25;
  v26 = v32;
  *(_QWORD *)(v24 + 32) = a4;
  *(_QWORD *)(v24 + 40) = v26;
  *(_QWORD *)(v24 + 48) = v33;
  *(_BYTE *)(v24 + 56) = v21;
  outlined init with take of PluginClientMetrics.ConnectionEstablishment?((uint64_t)v44, v24 + 64, &demangling cache variable for type metadata for PubSubTopic.Configuration?);
  outlined init with take of BackgroundSessionManagerDataSource(v43, v24 + 136);
  v27 = v34;
  *(_QWORD *)(v24 + 176) = v36;
  *(_QWORD *)(v24 + 184) = v27;
  *(_QWORD *)(v24 + 192) = v35;
  aBlock[4] = partial apply for closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:);
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_41;
  v28 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  static DispatchQoS.unspecified.getter();
  v41 = MEMORY[0x1E0DEE9D8];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags], MEMORY[0x1E0DEAF38]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  v29 = (void *)v37;
  MEMORY[0x1AF448634](0, v20, v18, v28);
  _Block_release(v28);

  (*(void (**)(char *, uint64_t))(v40 + 8))(v18, v16);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v20, v39);
  return swift_release();
}

uint64_t closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(_QWORD *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, _QWORD), uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(_QWORD, _QWORD);
  uint64_t v31;
  uint64_t v32;
  uint64_t TopicRequest;
  _QWORD *v34;
  int v35;
  char v36;

  TopicRequest = type metadata accessor for CP_CreateTopicRequest(0);
  MEMORY[0x1E0C80A78](TopicRequest);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v34 = a1;
  v21 = *(_QWORD *)(a1[12] + 16);
  v35 = a6;
  if (v21)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if ((v22 & 1) != 0)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      OS_dispatch_queue.sync<A>(execute:)();
      if ((v36 & 1) != 0)
      {
        v23 = swift_retain();
        a4(v23, 0);
        return swift_release_n();
      }
      v28 = a8;
      v29 = a7;
      v25 = a2;
      v30 = a4;
      v31 = a5;
      swift_release();
    }
    else
    {
      v28 = a8;
      v29 = a7;
      v25 = a2;
      v30 = a4;
      v31 = a5;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v28 = a8;
    v29 = a7;
    v25 = a2;
    v30 = a4;
    v31 = a5;
  }
  v32 = a10;
  TopicRequest = a11;
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = 0;
  MEMORY[0x1E0C80A78](v26);
  v27 = v35;
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CP_CreateTopicRequest and conformance CP_CreateTopicRequest, type metadata accessor for CP_CreateTopicRequest, (uint64_t)&protocol conformance descriptor for CP_CreateTopicRequest);
  static Message.with(_:)();
  createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(v34, (uint64_t)v20, v26, (uint64_t)v30, v31, v25, a3, v29, v27, v28, a9, v32, TopicRequest);
  outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v20, type metadata accessor for CP_CreateTopicRequest);
  return swift_release();
}

uint64_t closure #1 in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t result;

  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 40) = a4;
  *(_BYTE *)(a1 + 48) = 1;
  return result;
}

uint64_t PubSubClient.TopicCategory.asProto.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t TopicRequest;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51[2];
  uint64_t v52;

  v43 = a3;
  v44 = a8;
  v48 = a6;
  v49 = a4;
  v50 = a5;
  v46 = a12;
  v47 = a13;
  v42 = a9;
  v45 = a11;
  v40 = a10;
  v41 = a7;
  TopicRequest = type metadata accessor for CP_CreateTopicRequest(0);
  v17 = *(_QWORD *)(TopicRequest - 8);
  v18 = *(_QWORD *)(v17 + 64);
  MEMORY[0x1E0C80A78](TopicRequest);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a1[5];
  v21 = a1[6];
  v39 = a1;
  __swift_project_boxed_opaque_existential_1(a1 + 2, v20);
  v52 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 64))(a2, v20, v21);
  outlined init with copy of ActivitySession.DomainAssertionWrapper(a2, (uint64_t)v19, type metadata accessor for CP_CreateTopicRequest);
  outlined init with copy of UserNotificationCenter(a10, (uint64_t)v51);
  v22 = (*(unsigned __int8 *)(v17 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v23 = (v18 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = (v23 + 73) & 0xFFFFFFFFFFFFFFF8;
  v25 = (v24 + 47) & 0xFFFFFFFFFFFFFFF8;
  v26 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  v27 = (_QWORD *)swift_allocObject();
  v27[2] = a3;
  v27[3] = a1;
  v28 = v50;
  v27[4] = v49;
  v27[5] = v28;
  v29 = v41;
  v27[6] = v48;
  v27[7] = v29;
  outlined init with take of ActivitySession.DomainAssertionWrapper((uint64_t)v19, (uint64_t)v27 + v22, type metadata accessor for CP_CreateTopicRequest);
  v30 = v44;
  outlined init with take of PluginClientMetrics.ConnectionEstablishment?(v44, (uint64_t)v27 + v23, &demangling cache variable for type metadata for PubSubTopic.Configuration?);
  LOBYTE(a1) = v42;
  *((_BYTE *)v27 + v23 + 65) = v42;
  outlined init with take of BackgroundSessionManagerDataSource(v51, (uint64_t)v27 + v24);
  v31 = (_QWORD *)((char *)v27 + v25);
  v32 = v45;
  v33 = v46;
  *v31 = v45;
  v31[1] = v33;
  v34 = v47;
  *(_QWORD *)((char *)v27 + v26) = v47;
  outlined init with copy of UserNotificationCenter(v40, (uint64_t)v51);
  v35 = swift_allocObject();
  outlined init with take of PluginClientMetrics.ConnectionEstablishment?(v30, v35 + 16, &demangling cache variable for type metadata for PubSubTopic.Configuration?);
  *(_QWORD *)(v35 + 88) = v48;
  *(_QWORD *)(v35 + 96) = v29;
  *(_BYTE *)(v35 + 104) = (_BYTE)a1;
  *(_QWORD *)(v35 + 112) = v39;
  outlined init with take of BackgroundSessionManagerDataSource(v51, v35 + 120);
  *(_QWORD *)(v35 + 160) = v32;
  *(_QWORD *)(v35 + 168) = v33;
  v36 = v49;
  *(_QWORD *)(v35 + 176) = v34;
  *(_QWORD *)(v35 + 184) = v36;
  *(_QWORD *)(v35 + 192) = v50;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_unknownObjectRetain_n();
  swift_retain_n();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyPublisher<CP_CreateTopicResponse, PluginRpcError>);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type AnyPublisher<CP_CreateTopicResponse, PluginRpcError> and conformance AnyPublisher<A, B>, &demangling cache variable for type metadata for AnyPublisher<CP_CreateTopicResponse, PluginRpcError>, MEMORY[0x1E0C95D90]);
  Publisher.sink(receiveCompletion:receiveValue:)();
  swift_release();
  swift_release();
  swift_release();
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  return swift_release();
}

uint64_t closure #1 in createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, uint64_t), uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  _BOOL4 v64;
  uint64_t v65;
  uint8_t *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  int v73;
  unsigned __int8 v74;
  uint8_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(void *, uint64_t);
  uint64_t v110;
  uint64_t v111;

  v106 = a7;
  v107 = a8;
  v105 = a6;
  v108 = a5;
  v109 = a4;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PluginConnectError?);
  v18 = MEMORY[0x1E0C80A78](v17);
  v101 = (uint64_t)&v88 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v102 = (uint64_t)&v88 - v20;
  v21 = type metadata accessor for PluginConnectError();
  v99 = *(_QWORD *)(v21 - 8);
  v100 = v21;
  v22 = MEMORY[0x1E0C80A78](v21);
  v97 = (uint64_t)&v88 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x1E0C80A78](v22);
  v98 = (uint64_t)&v88 - v25;
  v26 = MEMORY[0x1E0C80A78](v24);
  v103 = (uint64_t)&v88 - v27;
  v28 = MEMORY[0x1E0C80A78](v26);
  v30 = (char *)&v88 - v29;
  MEMORY[0x1E0C80A78](v28);
  v104 = (uint64_t)&v88 - v31;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Subscribers.Completion<PluginRpcError>);
  MEMORY[0x1E0C80A78](v32);
  v34 = (char *)&v88 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = type metadata accessor for PluginRpcError();
  v36 = *(_QWORD *)(v35 - 8);
  v37 = MEMORY[0x1E0C80A78](v35);
  v39 = (char *)&v88 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v37);
  v41 = (char *)&v88 - v40;
  outlined init with copy of ActivitySession.DomainAssertionWrapper?(a1, (uint64_t)v34, &demangling cache variable for type metadata for Subscribers.Completion<PluginRpcError>);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35) == 1)
    return outlined destroy of UUID?((uint64_t)v34, &demangling cache variable for type metadata for Subscribers.Completion<PluginRpcError>);
  outlined init with take of ActivitySession.DomainAssertionWrapper((uint64_t)v34, (uint64_t)v41, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
  swift_beginAccess();
  if (*(_QWORD *)(a2 + 16) == *(_QWORD *)(a3 + 64))
  {
    type metadata accessor for PubSubTopicError(0);
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type PubSubTopicError and conformance PubSubTopicError, type metadata accessor for PubSubTopicError, (uint64_t)&protocol conformance descriptor for PubSubTopicError);
    v43 = (void *)swift_allocError();
    outlined init with copy of ActivitySession.DomainAssertionWrapper((uint64_t)v41, v44, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
    swift_storeEnumTagMultiPayload();
    v109(v43, 1);

    v45 = (uint64_t)v41;
  }
  else
  {
    v46 = (uint64_t)v41;
    v47 = a13;
    v94 = a14;
    v95 = a2;
    v48 = a11;
    v49 = a12;
    v50 = a9;
    v96 = v46;
    outlined init with copy of ActivitySession.DomainAssertionWrapper(v46, (uint64_t)v39, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v93 = a9;
      v51 = (void *)*((_QWORD *)v39 + 1);
      if (*v39 == 14)
      {
        if (one-time initialization token for log != -1)
          swift_once();
        v52 = type metadata accessor for Logger();
        __swift_project_value_buffer(v52, (uint64_t)log);
        v53 = Logger.logObject.getter();
        v54 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v55 = 0;
          _os_log_impl(&dword_1ACCCC000, v53, v54, "[CreateTopic] Failed, server bouncing", v55, 2u);
          v56 = v55;
          v48 = a11;
          v49 = a12;
          v47 = a13;
          MEMORY[0x1AF44981C](v56, -1, -1);
        }

        retry #1 () in closure #1 in createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(v95, a3, v105, v106, v107, (uint64_t)v109, v108, v93, a10, v48, v49, v47, v94);
        v57 = v96;
      }
      else
      {
        type metadata accessor for PubSubTopicError(0);
        lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type PubSubTopicError and conformance PubSubTopicError, type metadata accessor for PubSubTopicError, (uint64_t)&protocol conformance descriptor for PubSubTopicError);
        v68 = (void *)swift_allocError();
        v57 = v96;
        outlined init with copy of ActivitySession.DomainAssertionWrapper(v96, v69, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
        swift_storeEnumTagMultiPayload();
        v109(v68, 1);

      }
      swift_bridgeObjectRelease();
      v45 = v57;
    }
    else
    {
      v92 = a11;
      v58 = v104;
      outlined init with take of ActivitySession.DomainAssertionWrapper((uint64_t)v39, v104, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
      outlined init with copy of ActivitySession.DomainAssertionWrapper(v58, (uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
      v59 = type metadata accessor for NWError();
      v60 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 48))(v30, 3, v59);
      outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
      if (v60 == 3)
      {
        if (one-time initialization token for log != -1)
          swift_once();
        v61 = type metadata accessor for Logger();
        __swift_project_value_buffer(v61, (uint64_t)log);
        v62 = Logger.logObject.getter();
        v63 = static os_log_type_t.default.getter();
        v64 = os_log_type_enabled(v62, v63);
        v65 = v96;
        if (v64)
        {
          v66 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v66 = 0;
          _os_log_impl(&dword_1ACCCC000, v62, v63, "[CreateTopic] Failed, service-provider client closed", v66, 2u);
          MEMORY[0x1AF44981C](v66, -1, -1);
        }

        lazy protocol witness table accessor for type PubSubClientError and conformance PubSubClientError();
        v67 = (void *)swift_allocError();
        v109(v67, 1);

      }
      else
      {
        if (one-time initialization token for log != -1)
          swift_once();
        v70 = type metadata accessor for Logger();
        __swift_project_value_buffer(v70, (uint64_t)log);
        v71 = v103;
        outlined init with copy of ActivitySession.DomainAssertionWrapper(v58, v103, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
        v72 = Logger.logObject.getter();
        v73 = static os_log_type_t.error.getter();
        v74 = a10;
        if (os_log_type_enabled(v72, (os_log_type_t)v73))
        {
          v90 = v73;
          v93 = a9;
          v91 = a3;
          v75 = (uint8_t *)swift_slowAlloc();
          v89 = swift_slowAlloc();
          v111 = v89;
          *(_DWORD *)v75 = 136315138;
          v76 = v102;
          outlined init with copy of ActivitySession.DomainAssertionWrapper(v71, v102, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
          v78 = v99;
          v77 = v100;
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v99 + 56))(v76, 0, 1, v100);
          v79 = v76;
          v80 = v101;
          outlined init with copy of ActivitySession.DomainAssertionWrapper?(v79, v101, &demangling cache variable for type metadata for PluginConnectError?);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v80, 1, v77) == 1)
          {
            v81 = 0xE300000000000000;
            v82 = 7104878;
          }
          else
          {
            v83 = v72;
            v84 = v98;
            outlined init with take of ActivitySession.DomainAssertionWrapper(v80, v98, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
            outlined init with copy of ActivitySession.DomainAssertionWrapper(v84, v97, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
            v82 = String.init<A>(reflecting:)();
            v81 = v85;
            v86 = v84;
            v72 = v83;
            v74 = a10;
            outlined destroy of ActivitySession.DomainAssertionWrapper(v86, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
          }
          outlined destroy of UUID?(v102, &demangling cache variable for type metadata for PluginConnectError?);
          v110 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v82, v81, &v111);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          outlined destroy of ActivitySession.DomainAssertionWrapper(v103, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
          _os_log_impl(&dword_1ACCCC000, v72, (os_log_type_t)v90, "[CreateTopic] Failed with connection error, error=%s", v75, 0xCu);
          v87 = v89;
          swift_arrayDestroy();
          MEMORY[0x1AF44981C](v87, -1, -1);
          MEMORY[0x1AF44981C](v75, -1, -1);

          a3 = v91;
          v50 = v93;
        }
        else
        {
          outlined destroy of ActivitySession.DomainAssertionWrapper(v71, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);

        }
        retry #1 () in closure #1 in createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(v95, a3, v105, v106, v107, (uint64_t)v109, v108, v50, v74, v92, a12, a13, v94);
        v65 = v96;
      }
      outlined destroy of ActivitySession.DomainAssertionWrapper(v58, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
      v45 = v65;
    }
  }
  return outlined destroy of ActivitySession.DomainAssertionWrapper(v45, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
}

uint64_t retry #1 () in closure #1 in createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t TopicRequest;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  unint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  void *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  char *v63;
  void *v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t aBlock[6];
  __int128 v95;

  v86 = a8;
  v87 = a7;
  v85 = a6;
  v84 = a5;
  v90 = a4;
  v88 = a3;
  v92 = a2;
  v15 = type metadata accessor for DispatchWorkItemFlags();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for DispatchQoS();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  TopicRequest = type metadata accessor for CP_CreateTopicRequest(0);
  v81 = *(_QWORD *)(TopicRequest - 8);
  MEMORY[0x1E0C80A78](TopicRequest);
  v82 = v24;
  v83 = (uint64_t)&v66 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = type metadata accessor for DispatchTime();
  v80 = *(_QWORD *)(v91 - 8);
  v25 = MEMORY[0x1E0C80A78](v91);
  v27 = (char *)&v66 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v25);
  v89 = (char *)&v66 - v28;
  swift_beginAccess();
  v29 = *(_QWORD *)(a1 + 16);
  v30 = __OFADD__(v29, 1);
  v31 = v29 + 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    v13 = a1;
    v75 = v20;
    v79 = v15;
    v69 = a10;
    *(_QWORD *)(a1 + 16) = v31;
    if (one-time initialization token for log == -1)
      goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v74 = v22;
  v76 = v19;
  v77 = v18;
  v72 = a13;
  v71 = a12;
  v73 = a11;
  v70 = a9;
  v32 = type metadata accessor for Logger();
  __swift_project_value_buffer(v32, (uint64_t)log);
  v33 = v92;
  swift_retain_n();
  swift_retain_n();
  v34 = v90;
  swift_bridgeObjectRetain_n();
  v35 = Logger.logObject.getter();
  v36 = static os_log_type_t.default.getter();
  v37 = os_log_type_enabled(v35, v36);
  v78 = v16;
  v68 = v13;
  if (v37)
  {
    v38 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    aBlock[0] = v39;
    *(_DWORD *)v38 = 134218498;
    *(_QWORD *)&v95 = *(_QWORD *)(v33 + 56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    *(_WORD *)(v38 + 12) = 2048;
    swift_beginAccess();
    v40 = *(_QWORD *)(v13 + 16);
    swift_release();
    *(_QWORD *)&v95 = v40;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    *(_WORD *)(v38 + 22) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v95 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v88, v34, aBlock);
    v33 = v92;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1ACCCC000, v35, v36, "[CreateTopic] Retrying stream in %f seconds, attempt=#%ld topic=%s", (uint8_t *)v38, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v39, -1, -1);
    MEMORY[0x1AF44981C](v38, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_release_n();
  }
  static DispatchTime.now()();
  MEMORY[0x1AF447E84](v27, *(double *)(v33 + 56));
  v80 = *(_QWORD *)(v80 + 8);
  ((void (*)(char *, uint64_t))v80)(v27, v91);
  v41 = *(_QWORD *)(v33 + 40);
  v42 = *(_QWORD *)(v33 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v33 + 16), v41);
  v67 = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8))(v41, v42);
  v43 = v83;
  outlined init with copy of ActivitySession.DomainAssertionWrapper(v84, v83, type metadata accessor for CP_CreateTopicRequest);
  outlined init with copy of UserNotificationCenter(v69, (uint64_t)&v95);
  v44 = (*(unsigned __int8 *)(v81 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
  v45 = (v82 + v44 + 7) & 0xFFFFFFFFFFFFFFF8;
  v46 = (v45 + 15) & 0xFFFFFFFFFFFFFFF8;
  v47 = (v46 + 23) & 0xFFFFFFFFFFFFFFF8;
  v48 = (v47 + 23) & 0xFFFFFFFFFFFFFFF8;
  v49 = (v48 + 73) & 0xFFFFFFFFFFFFFFF8;
  v50 = (v49 + 47) & 0xFFFFFFFFFFFFFFF8;
  v51 = swift_allocObject();
  *(_QWORD *)(v51 + 16) = v92;
  outlined init with take of ActivitySession.DomainAssertionWrapper(v43, v51 + v44, type metadata accessor for CP_CreateTopicRequest);
  *(_QWORD *)(v51 + v45) = v68;
  v52 = (_QWORD *)(v51 + v46);
  v53 = v87;
  *v52 = v85;
  v52[1] = v53;
  v54 = (_QWORD *)(v51 + v47);
  v55 = v51 + v48;
  v56 = v90;
  *v54 = v88;
  v54[1] = v56;
  outlined init with take of PluginClientMetrics.ConnectionEstablishment?(v86, v55, &demangling cache variable for type metadata for PubSubTopic.Configuration?);
  *(_BYTE *)(v55 + 65) = v70;
  outlined init with take of BackgroundSessionManagerDataSource(&v95, v51 + v49);
  v57 = (_QWORD *)(v51 + v50);
  v58 = v71;
  *v57 = v73;
  v57[1] = v58;
  *(_QWORD *)(v51 + ((v50 + 23) & 0xFFFFFFFFFFFFFFF8)) = v72;
  aBlock[4] = (uint64_t)partial apply for closure #1 in retry #1 () in closure #1 in createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:);
  aBlock[5] = v51;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = (uint64_t)&block_descriptor_18_6;
  v59 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  v60 = v74;
  static DispatchQoS.unspecified.getter();
  v93 = MEMORY[0x1E0DEE9D8];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags], MEMORY[0x1E0DEAF38]);
  v61 = v77;
  v62 = v79;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  v63 = v89;
  v64 = (void *)v67;
  MEMORY[0x1AF4485D4](v89, v60, v61, v59);
  _Block_release(v59);

  (*(void (**)(char *, uint64_t))(v78 + 8))(v61, v62);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v60, v76);
  ((void (*)(char *, uint64_t))v80)(v63, v91);
  return swift_release();
}

void closure #2 in createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void (*a11)(void *, uint64_t), uint64_t a12)
{
  uint64_t Topic;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  _QWORD v31[16];
  void (*v32)(void *, uint64_t);
  uint64_t v33;
  _QWORD v34[6];
  uint64_t v35;
  uint64_t v36[8];

  v31[7] = a7;
  v31[8] = a8;
  v31[9] = a6;
  v31[10] = a3;
  v31[4] = a5;
  v33 = a12;
  v32 = a11;
  outlined init with take of PluginClientMetrics.ConnectionEstablishment?(a2, (uint64_t)v34, &demangling cache variable for type metadata for PubSubTopic.Configuration?);
  v31[14] = v34[1];
  v31[15] = v34[0];
  v31[13] = v34[3];
  v31[11] = v34[2];
  v31[12] = v34[5];
  Topic = type metadata accessor for CP_CreateTopicResponse.ClientTopicConfig(0);
  v14 = MEMORY[0x1E0C80A78](Topic);
  v31[5] = (char *)v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v14);
  MEMORY[0x1E0C80A78](v16);
  v31[6] = (char *)v31 - v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CP_CreateTopicResponse.ClientTopicConfig?);
  v19 = MEMORY[0x1E0C80A78](v18);
  MEMORY[0x1E0C80A78](v19);
  v20 = *(_QWORD *)a1;
  if (*(_BYTE *)(a1 + 8) == 1)
    __asm { BR              X9 }
  v22 = *(_QWORD *)(a1 + 16);
  v21 = *(_QWORD *)(a1 + 24);
  v23 = one-time initialization token for log;
  swift_bridgeObjectRetain();
  if (v23 != -1)
    swift_once();
  v24 = type metadata accessor for Logger();
  __swift_project_value_buffer(v24, (uint64_t)log);
  swift_bridgeObjectRetain();
  v25 = Logger.logObject.getter();
  v26 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = swift_slowAlloc();
    v28 = swift_slowAlloc();
    v36[0] = v28;
    *(_DWORD *)v27 = 134218242;
    v35 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v27 + 12) = 2080;
    swift_bridgeObjectRetain();
    v35 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v21, v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1ACCCC000, v25, v26, "[CreateTopic] Failed, unexpected response-status, code=%ld error=%s", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v28, -1, -1);
    MEMORY[0x1AF44981C](v27, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  type metadata accessor for PubSubTopicError(0);
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type PubSubTopicError and conformance PubSubTopicError, type metadata accessor for PubSubTopicError, (uint64_t)&protocol conformance descriptor for PubSubTopicError);
  v29 = (void *)swift_allocError();
  *v30 = 0xD000000000000017;
  v30[1] = 0x80000001ACF7DCF0;
  swift_storeEnumTagMultiPayload();
  v32(v29, 1);

}

uint64_t PubSubClient.createTopic(name:topicConfig:category:dataCryptorProvider:delegate:seqNumWatermark:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  char v16;
  uint64_t v17;
  _BYTE v19[40];
  _BYTE v20[72];

  outlined init with take of PluginClientMetrics.ConnectionEstablishment?(a3, (uint64_t)v20, &demangling cache variable for type metadata for PubSubTopic.Configuration?);
  v16 = *a4;
  outlined init with copy of ActivitySession.DomainAssertionWrapper?(a5, (uint64_t)v19, &demangling cache variable for type metadata for TopicCryptorProvider?);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v8;
  *(_QWORD *)(v17 + 24) = a1;
  *(_QWORD *)(v17 + 32) = a2;
  *(_BYTE *)(v17 + 40) = v16;
  outlined init with take of PluginClientMetrics.ConnectionEstablishment?((uint64_t)v20, v17 + 48, &demangling cache variable for type metadata for PubSubTopic.Configuration?);
  outlined init with take of PluginClientMetrics.ConnectionEstablishment?((uint64_t)v19, v17 + 120, &demangling cache variable for type metadata for TopicCryptorProvider?);
  *(_QWORD *)(v17 + 160) = a6;
  *(_QWORD *)(v17 + 168) = a7;
  *(_QWORD *)(v17 + 176) = a8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Future<PubSubTopic, Error>);
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return Future.init(_:)();
}

uint64_t closure #1 in PubSubClient.createTopic(name:topicConfig:category:dataCryptorProvider:delegate:seqNumWatermark:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[5];
  _BYTE v27[71];
  char v28[9];

  v16 = a6;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a1;
  *(_QWORD *)(v17 + 24) = a2;
  if (v16 == 5)
    v18 = 0;
  else
    v18 = a6;
  v28[0] = v18;
  outlined init with take of PluginClientMetrics.ConnectionEstablishment?(a7, (uint64_t)v27, &demangling cache variable for type metadata for PubSubTopic.Configuration?);
  outlined init with copy of ActivitySession.DomainAssertionWrapper?(a8, (uint64_t)&v24, &demangling cache variable for type metadata for TopicCryptorProvider?);
  if (v25)
  {
    outlined init with take of BackgroundSessionManagerDataSource(&v24, (uint64_t)v26);
    swift_retain();
  }
  else
  {
    v19 = type metadata accessor for TransparentTopicCryptorProvider();
    v20 = swift_allocObject();
    v26[3] = v19;
    v26[4] = &protocol witness table for TransparentTopicCryptorProvider;
    v26[0] = v20;
    swift_retain();
    outlined destroy of UUID?((uint64_t)&v24, &demangling cache variable for type metadata for TopicCryptorProvider?);
  }
  PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<PluginAttachmentLedgerTopic, Error>) -> (), v17, a4, a5, v28, (uint64_t)v27, (uint64_t)v26, a9, a10, a11);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
}

uint64_t sub_1ACF3FE88()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 144))
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 120);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in PubSubClient.createTopic(name:topicConfig:category:dataCryptorProvider:delegate:seqNumWatermark:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in PubSubClient.createTopic(name:topicConfig:category:dataCryptorProvider:delegate:seqNumWatermark:)(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_BYTE *)(v2 + 40), v2 + 48, v2 + 120, *(_QWORD *)(v2 + 160), *(_QWORD *)(v2 + 168), *(_QWORD *)(v2 + 176));
}

unint64_t lazy protocol witness table accessor for type PubSubClientError and conformance PubSubClientError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PubSubClientError and conformance PubSubClientError;
  if (!lazy protocol witness table cache variable for type PubSubClientError and conformance PubSubClientError)
  {
    result = MEMORY[0x1AF44972C](&protocol conformance descriptor for PubSubClientError, &type metadata for PubSubClientError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PubSubClientError and conformance PubSubClientError);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PubSubClientError and conformance PubSubClientError;
  if (!lazy protocol witness table cache variable for type PubSubClientError and conformance PubSubClientError)
  {
    result = MEMORY[0x1AF44972C](&protocol conformance descriptor for PubSubClientError, &type metadata for PubSubClientError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PubSubClientError and conformance PubSubClientError);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PubSubClient.TopicCategory and conformance PubSubClient.TopicCategory()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PubSubClient.TopicCategory and conformance PubSubClient.TopicCategory;
  if (!lazy protocol witness table cache variable for type PubSubClient.TopicCategory and conformance PubSubClient.TopicCategory)
  {
    result = MEMORY[0x1AF44972C](&protocol conformance descriptor for PubSubClient.TopicCategory, &type metadata for PubSubClient.TopicCategory);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PubSubClient.TopicCategory and conformance PubSubClient.TopicCategory);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for PubSubClientError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1ACF3FFE4 + 4 * byte_1ACF6B2E7[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1ACF40004 + 4 * byte_1ACF6B2EC[v4]))();
}

_BYTE *sub_1ACF3FFE4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1ACF40004(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1ACF4000C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1ACF40014(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1ACF4001C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1ACF40024(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PubSubClientError()
{
  return &type metadata for PubSubClientError;
}

uint64_t type metadata accessor for PubSubClient()
{
  return objc_opt_self();
}

uint64_t method lookup function for PubSubClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PubSubClient.__allocating_init(serviceProvider:createTopicMaxAttempts:createTopicRpcRetryIntervalSeconds:topicReporter:topicReporterTag:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of PubSubClient.__allocating_init(pluginClient:createTopicMaxAttempts:createTopicRpcRetryIntervalSeconds:topicReporter:topicReporterTag:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of PubSubClient.close()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of PubSubClient.updateVirtualParticipant(_:localParticipantID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of PubSubClient.localParticipantID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of PubSubClient.createTopic(name:topicConfig:category:dataCryptorProvider:delegate:seqNumWatermark:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t storeEnumTagSinglePayload for PubSubClient.TopicCategory(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1ACF40114 + 4 * byte_1ACF6B2F6[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1ACF40148 + 4 * byte_1ACF6B2F1[v4]))();
}

uint64_t sub_1ACF40148(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1ACF40150(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1ACF40158);
  return result;
}

uint64_t sub_1ACF40164(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1ACF4016CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1ACF40170(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1ACF40178(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PubSubClient.TopicCategory()
{
  return &type metadata for PubSubClient.TopicCategory;
}

uint64_t sub_1ACF40194()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 136);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)()
{
  uint64_t v0;

  return closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(uint64_t, _QWORD))(v0 + 40), *(_QWORD *)(v0 + 48), *(unsigned __int8 *)(v0 + 56), v0 + 64, v0 + 136, *(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 192));
}

uint64_t block_destroy_helper_39()
{
  return swift_release();
}

uint64_t sub_1ACF4022C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32));
}

uint64_t _s14CopresenceCore11PubSubTopicC11isAvailableSbvgSbyXEfU_TA_0@<X0>(BOOL *a1@<X8>)
{
  uint64_t v1;

  return closure #1 in PubSubTopic.isAvailable.getter(v1, a1);
}

uint64_t sub_1ACF40270()
{
  uint64_t v0;
  uint64_t TopicRequest;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  TopicRequest = type metadata accessor for CP_CreateTopicRequest(0);
  v2 = *(_QWORD *)(TopicRequest - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 73) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = v0 + v3 + *(int *)(TopicRequest + 32);
  v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + v4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = *(_QWORD *)(type metadata accessor for CP_CreateTopicRequest(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 73) & 0xFFFFFFFFFFFFFFF8;
  return closure #1 in createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(void *, uint64_t))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), v1 + v4, v1 + v5, *(_BYTE *)(v1 + v5 + 65), v1 + v6, *(_QWORD *)(v1 + ((v6 + 47) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((v6 + 47) & 0xFFFFFFFFFFFFFFF8) + 8), *(_QWORD *)(v1 + ((((v6 + 47) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_1ACF40414()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 120);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #2 in createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(uint64_t a1)
{
  uint64_t v1;

  closure #2 in createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(a1, v1 + 16, *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(unsigned __int8 *)(v1 + 104), *(_QWORD *)(v1 + 112), v1 + 120, *(_QWORD *)(v1 + 160), *(_QWORD *)(v1 + 168), *(_QWORD *)(v1 + 176), *(void (**)(void *, uint64_t))(v1 + 184), *(_QWORD *)(v1 + 192));
}

uint64_t sub_1ACF404E8()
{
  uint64_t v0;
  uint64_t TopicRequest;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  TopicRequest = type metadata accessor for CP_CreateTopicRequest(0);
  v2 = *(_QWORD *)(TopicRequest - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((((((((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 73) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = v0 + v3 + *(int *)(TopicRequest + 32);
  v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + v4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in retry #1 () in closure #1 in createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(type metadata accessor for CP_CreateTopicRequest(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return createTopicHelper #1 () in closure #1 in PubSubClient.getOrCreateTopic(promise:name:category:topicConfig:dataCryptorProvider:delegate:seqNumWatermark:)(*(_QWORD *)(v0 + 16), v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *(_QWORD *)(v0 + ((((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_1ACF406D0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t dispatch thunk of MemberProvider.members.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of MemberProvider.membersPublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t TopicInfo.id.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  outlined init with take of TopicInfo(v0, (uint64_t)&v3);
  v1 = v3;
  swift_bridgeObjectRetain();
  return v1;
}

Swift::Void __swiftcall PubSubTopicsObserver.TopicTermination.complete()()
{
  void (*v0)(void);

  v0();
}

uint64_t PubSubTopicsObserver.__allocating_init(serviceProvider:rpcMaxAttempts:rpcRetryIntervalSeconds:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = __swift_mutable_project_boxed_opaque_existential_1(a1, v7);
  v10 = specialized PubSubTopicsObserver.__allocating_init(serviceProvider:rpcMaxAttempts:rpcRetryIntervalSeconds:)(v9, a2, a3, v3, v7, v8);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v10;
}

uint64_t TopicInfo.description.getter()
{
  uint64_t v0;
  _BYTE v2[8];
  __int128 v3;
  char v4;

  outlined init with take of TopicInfo(v0, (uint64_t)v2);
  outlined init with take of TopicInfo(v0, (uint64_t)&v3);
  if ((v4 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_retain();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return String.init<A>(describing:)();
}

uint64_t protocol witness for IDProviding.id.getter in conformance TopicInfo@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance TopicInfo()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 32) & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_retain();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return String.init<A>(describing:)();
}

uint64_t PubSubTopicsObserver.TopicSubscribers.topicName.getter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t PubSubTopicsObserver.TopicSubscribers.subscriberIDs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PubSubTopicsObserver.TopicTermination.topicName.getter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t PubSubTopicsObserver.serviceProvider.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of UserNotificationCenter(v1 + 16, a1);
}

uint64_t PubSubTopicsObserver.rpcMaxAttempts.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

double PubSubTopicsObserver.rpcRetryIntervalSeconds.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

uint64_t PubSubTopicsObserver.init(serviceProvider:rpcMaxAttempts:rpcRetryIntervalSeconds:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = __swift_mutable_project_boxed_opaque_existential_1(a1, v7);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  v13 = specialized PubSubTopicsObserver.init(serviceProvider:rpcMaxAttempts:rpcRetryIntervalSeconds:)((uint64_t)v11, a2, v3, v7, v8, a3);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v13;
}

uint64_t PubSubTopicsObserver.receive<A>(subscriber:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_retain();
  PassthroughSubject.receive<A>(subscriber:)();
  result = swift_release();
  if (!*(_QWORD *)(v1 + 88))
  {
    *(_QWORD *)(v1 + 88) = PubSubTopicsObserver.createListenTopicSubscription()();
    return swift_release();
  }
  return result;
}

uint64_t PubSubTopicsObserver.createListenTopicSubscription()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.Map<AnyPublisher<CP_TopicSubscribers, PluginRpcError>, [TopicInfo]>);
  v2 = *(_QWORD *)(v1 - 8);
  v31 = v1;
  v32 = v2;
  MEMORY[0x1E0C80A78](v1);
  v30 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.BufferingStrategy<Never>);
  v4 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Publishers.PrefetchStrategy();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.Buffer<PassthroughSubject<CP_TopicSubscribersRequest, Never>>);
  v12 = *(_QWORD *)(v11 - 8);
  v27 = v11;
  v28 = v12;
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PassthroughSubject<CP_TopicSubscribersRequest, Never>);
  swift_allocObject();
  v15 = PassthroughSubject.init()();
  v0[9] = v15;
  v16 = v15;
  v29 = v15;
  swift_retain();
  swift_release();
  v33 = v16;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0C958B8], v7);
  v17 = v26;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0C958E8], v26);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type PassthroughSubject<CP_TopicSubscribersRequest, Never> and conformance PassthroughSubject<A, B>, &demangling cache variable for type metadata for PassthroughSubject<CP_TopicSubscribersRequest, Never>, MEMORY[0x1E0C95F48]);
  Publisher.buffer(size:prefetch:whenFull:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type Publishers.Buffer<PassthroughSubject<CP_TopicSubscribersRequest, Never>> and conformance Publishers.Buffer<A>, &demangling cache variable for type metadata for Publishers.Buffer<PassthroughSubject<CP_TopicSubscribersRequest, Never>>, MEMORY[0x1E0C95AB8]);
  v18 = v27;
  v19 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v18);
  v20 = v0[5];
  v21 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v20);
  v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 88))(v19, v20, v21);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyPublisher<CP_TopicSubscribers, PluginRpcError>);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [TopicInfo]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type AnyPublisher<CP_TopicSubscribers, PluginRpcError> and conformance AnyPublisher<A, B>, &demangling cache variable for type metadata for AnyPublisher<CP_TopicSubscribers, PluginRpcError>, MEMORY[0x1E0C95D90]);
  v22 = v30;
  Publisher.map<A>(_:)();
  swift_release();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  swift_allocObject();
  swift_weakInit();
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type Publishers.Map<AnyPublisher<CP_TopicSubscribers, PluginRpcError>, [TopicInfo]> and conformance Publishers.Map<A, B>, &demangling cache variable for type metadata for Publishers.Map<AnyPublisher<CP_TopicSubscribers, PluginRpcError>, [TopicInfo]>, MEMORY[0x1E0C95950]);
  v23 = v31;
  v24 = Publisher.sink(receiveCompletion:receiveValue:)();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v23);
  return v24;
}

uint64_t closure #1 in PubSubTopicsObserver.createListenTopicSubscription()@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int64_t v11;
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
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  _QWORD v37[3];
  _QWORD *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v6 = type metadata accessor for CP_TopicSubscribers.TopicSubscribersInfo(0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (_QWORD *)((char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = *a1;
  v11 = *(_QWORD *)(*a1 + 16);
  v12 = MEMORY[0x1E0DEE9D8];
  if (v11)
  {
    v37[1] = a1;
    v37[2] = a2;
    v38 = a3;
    v46 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v11, 0);
    v13 = 0;
    v14 = *(unsigned __int8 *)(v7 + 80);
    v37[0] = v10;
    v42 = v10 + ((v14 + 32) & ~v14);
    v41 = *(_QWORD *)(v7 + 72);
    v39 = v11;
    v40 = v9;
    while (1)
    {
      outlined init with copy of ActivitySession.DomainAssertionWrapper(v42 + v41 * v13, (uint64_t)v9, type metadata accessor for CP_TopicSubscribers.TopicSubscribersInfo);
      v15 = v9[1];
      v43 = *v9;
      v44 = v15;
      v16 = v9[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v17 = Set.init(minimumCapacity:)();
      v18 = v17;
      v19 = *(_QWORD *)(v16 + 16);
      if (v19)
        break;
      swift_bridgeObjectRelease();
LABEL_16:
      v29 = v43;
      outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v9, type metadata accessor for CP_TopicSubscribers.TopicSubscribersInfo);
      v12 = v46;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v12 + 16) + 1, 1);
        v12 = v46;
      }
      v31 = *(_QWORD *)(v12 + 16);
      v30 = *(_QWORD *)(v12 + 24);
      if (v31 >= v30 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1);
        v12 = v46;
      }
      ++v13;
      *(_QWORD *)(v12 + 16) = v31 + 1;
      v32 = v12 + 40 * v31;
      v33 = v44;
      *(_QWORD *)(v32 + 32) = v29;
      *(_QWORD *)(v32 + 40) = v33;
      *(_QWORD *)(v32 + 48) = v18;
      *(_QWORD *)(v32 + 56) = 0;
      *(_BYTE *)(v32 + 64) = 0;
      if (v13 == v11)
      {
        swift_bridgeObjectRelease();
        a3 = v38;
        goto LABEL_22;
      }
    }
    v20 = 0;
    v21 = v17 + 56;
    while (1)
    {
      v22 = *(_QWORD *)(v16 + 32 + 8 * v20++);
      v23 = static Hasher._hash(seed:_:)();
      v24 = -1 << *(_BYTE *)(v18 + 32);
      v25 = v23 & ~v24;
      if (((*(_QWORD *)(v21 + ((v25 >> 3) & 0xFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
        goto LABEL_12;
      v26 = *(_QWORD *)(v18 + 48);
      if (*(_QWORD *)(v26 + 8 * v25) == v22)
      {
LABEL_5:
        if (v20 == v19)
          goto LABEL_14;
      }
      else
      {
        v27 = ~v24;
        while (1)
        {
          v25 = (v25 + 1) & v27;
          if (((*(_QWORD *)(v21 + ((v25 >> 3) & 0xFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
            break;
          if (*(_QWORD *)(v26 + 8 * v25) == v22)
            goto LABEL_5;
        }
LABEL_12:
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v45 = v18;
        specialized _NativeSet.insertNew(_:at:isUnique:)(v22, v25, isUniquelyReferenced_nonNull_native);
        v18 = v45;
        swift_bridgeObjectRelease();
        if (v20 == v19)
        {
LABEL_14:
          swift_bridgeObjectRelease();
          v11 = v39;
          v9 = v40;
          goto LABEL_16;
        }
        v21 = v18 + 56;
      }
    }
  }
LABEL_22:
  swift_retain();
  v34 = swift_bridgeObjectRetain();
  v35 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay14CopresenceCore19CP_TopicSubscribersV09TerminateG0VG_AF0G4InfoOs5NeverOTg504_s14d41Core20PubSubTopicsObserverC29createListeng84Subscription33_B8497B8F5916E698C6A327A070E3F3BCLL7Combine14AnyCancellableCyFSayAA0I4j6OGAA03f4_I11h10VcfU_AjM09I9I0VXEfU0_AF0nopQ0CTf1cn_nTf4ng_n(v34);
  swift_bridgeObjectRelease();
  swift_release();
  v46 = v12;
  result = specialized Array.append<A>(contentsOf:)(v35);
  *a3 = v46;
  return result;
}

uint64_t closure #1 in closure #2 in closure #1 in PubSubTopicsObserver.createListenTopicSubscription()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v8 = type metadata accessor for CP_TopicSubscribersRequest(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v12 = result;
    MEMORY[0x1E0C80A78](result);
    *(&v13 - 4) = a1;
    *(&v13 - 3) = a2;
    *(&v13 - 2) = a3;
    *(&v13 - 1) = a4;
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CP_TopicSubscribersRequest and conformance CP_TopicSubscribersRequest, type metadata accessor for CP_TopicSubscribersRequest, (uint64_t)&protocol conformance descriptor for CP_TopicSubscribersRequest);
    static Message.with(_:)();
    if (*(_QWORD *)(v12 + 72))
    {
      swift_retain();
      PassthroughSubject.send(_:)();
      swift_release();
    }
    outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v10, type metadata accessor for CP_TopicSubscribersRequest);
    return swift_release();
  }
  return result;
}

uint64_t closure #2 in PubSubTopicsObserver.createListenTopicSubscription()(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t result;
  uint64_t v13;
  _BYTE v14[8];

  v2 = type metadata accessor for PluginRpcError();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Subscribers.Completion<PluginRpcError>);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v7);
  v11 = &v14[-v10];
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v13 = result;
    if (*(_QWORD *)(result + 72))
    {
      v14[7] = 1;
      swift_retain();
      PassthroughSubject.send(completion:)();
      swift_release();
    }
    *(_QWORD *)(v13 + 72) = 0;
    swift_release();
    outlined init with copy of ActivitySession.DomainAssertionWrapper?(a1, (uint64_t)v11, &demangling cache variable for type metadata for Subscribers.Completion<PluginRpcError>);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v3 + 48))(v11, 1, v2) == 1)
    {
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v9, 1, 1, v2);
      swift_retain();
      PassthroughSubject.send(completion:)();
      swift_release();
      swift_release();
      return outlined destroy of UUID?((uint64_t)v9, &demangling cache variable for type metadata for Subscribers.Completion<PluginRpcError>);
    }
    else
    {
      outlined init with take of ActivitySession.DomainAssertionWrapper((uint64_t)v11, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
      PubSubTopicsObserver.handleSubscriptionError(_:)((uint64_t)v5);
      swift_release();
      return outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
    }
  }
  return result;
}

uint64_t closure #3 in PubSubTopicsObserver.createListenTopicSubscription()()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    *(_QWORD *)(result + 96) = 0;
    swift_retain();
    PassthroughSubject.send(_:)();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in PubSubTopicsObserver.complete(topicInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE v15[16];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CP_TopicSubscribersRequest.OneOf_Operation?);
  MEMORY[0x1E0C80A78](v10);
  v12 = &v15[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for CP_TopicSubscribersRequest.TopicTerminatedAck(0);
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CP_TopicSubscribersRequest.TopicTerminatedAck and conformance CP_TopicSubscribersRequest.TopicTerminatedAck, type metadata accessor for CP_TopicSubscribersRequest.TopicTerminatedAck, (uint64_t)&protocol conformance descriptor for CP_TopicSubscribersRequest.TopicTerminatedAck);
  static Message.with(_:)();
  v13 = type metadata accessor for CP_TopicSubscribersRequest.OneOf_Operation(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 0, 1, v13);
  return outlined assign with take of CP_TopicSubscribersRequest.OneOf_Operation?((uint64_t)v12, a1);
}

uint64_t PubSubTopicsObserver.handleSubscriptionError(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  int v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  uint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  _BOOL4 v58;
  uint64_t v59;
  uint8_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99[4];
  uint64_t v100;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PluginRpcError?);
  v5 = MEMORY[0x1E0C80A78](v4);
  v94 = (char *)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v88 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Subscribers.Completion<PluginRpcError>);
  MEMORY[0x1E0C80A78](v9);
  v96 = (uint64_t)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PluginConnectError?);
  v12 = MEMORY[0x1E0C80A78](v11);
  v91 = (uint64_t)&v88 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v93 = (uint64_t)&v88 - v14;
  v92 = type metadata accessor for PluginConnectError();
  v15 = *(_QWORD *)(v92 - 8);
  v16 = MEMORY[0x1E0C80A78](v92);
  v89 = (uint64_t)&v88 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x1E0C80A78](v16);
  v90 = (uint64_t)&v88 - v19;
  v20 = MEMORY[0x1E0C80A78](v18);
  v95 = (uint64_t)&v88 - v21;
  MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v88 - v22;
  v24 = type metadata accessor for PluginRpcError();
  v97 = *(_QWORD *)(v24 - 8);
  v25 = MEMORY[0x1E0C80A78](v24);
  v27 = (char *)&v88 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x1E0C80A78](v25);
  v30 = (char *)&v88 - v29;
  v31 = MEMORY[0x1E0C80A78](v28);
  v33 = (char *)&v88 - v32;
  MEMORY[0x1E0C80A78](v31);
  v35 = (uint64_t *)((char *)&v88 - v34);
  v36 = *(_QWORD *)(v2 + 96);
  v98 = v2;
  if (v36 >= *(_QWORD *)(v2 + 56))
  {
    v95 = a1;
    if (one-time initialization token for log != -1)
      swift_once();
    v45 = type metadata accessor for Logger();
    __swift_project_value_buffer(v45, (uint64_t)log);
    outlined init with copy of ActivitySession.DomainAssertionWrapper(v95, (uint64_t)v33, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
    v46 = Logger.logObject.getter();
    v47 = static os_log_type_t.default.getter();
    v48 = os_log_type_enabled(v46, v47);
    v49 = (uint64_t)v94;
    if (v48)
    {
      v50 = (uint8_t *)swift_slowAlloc();
      v93 = swift_slowAlloc();
      v99[0] = v93;
      *(_DWORD *)v50 = 136315138;
      outlined init with copy of ActivitySession.DomainAssertionWrapper((uint64_t)v33, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
      v51 = v97;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v97 + 56))(v8, 0, 1, v24);
      outlined init with copy of ActivitySession.DomainAssertionWrapper?((uint64_t)v8, v49, &demangling cache variable for type metadata for PluginRpcError?);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v49, 1, v24) == 1)
      {
        v52 = 7104878;
        v53 = 0xE300000000000000;
      }
      else
      {
        outlined init with take of ActivitySession.DomainAssertionWrapper(v49, (uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
        outlined init with copy of ActivitySession.DomainAssertionWrapper((uint64_t)v30, (uint64_t)v27, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
        v52 = String.init<A>(reflecting:)();
        v53 = v81;
        outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
      }
      outlined destroy of UUID?((uint64_t)v8, &demangling cache variable for type metadata for PluginRpcError?);
      v100 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v52, v53, v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v33, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
      _os_log_impl(&dword_1ACCCC000, v46, v47, "[ListenTopicSubscribers] Retries exhausted, error=%s", v50, 0xCu);
      v82 = v93;
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v82, -1, -1);
      MEMORY[0x1AF44981C](v50, -1, -1);
    }
    else
    {
      outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v33, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
    }

    v83 = v98;
    v84 = v96;
    outlined init with copy of ActivitySession.DomainAssertionWrapper(v95, v96, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v97 + 56))(v84, 0, 1, v24);
    swift_retain();
    PassthroughSubject.send(completion:)();
    swift_release();
    outlined destroy of UUID?(v84, &demangling cache variable for type metadata for Subscribers.Completion<PluginRpcError>);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for PassthroughSubject<[TopicInfo], PluginRpcError>);
    swift_allocObject();
    *(_QWORD *)(v83 + 80) = PassthroughSubject.init()();
    swift_release();
    *(_QWORD *)(v83 + 88) = 0;
    return swift_release();
  }
  else
  {
    outlined init with copy of ActivitySession.DomainAssertionWrapper(a1, (uint64_t)&v88 - v34, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v37 = *(unsigned __int8 *)v35;
      v38 = (void *)v35[1];
      v39 = v35[3];
      if (v37 == 14)
      {
        if (one-time initialization token for log != -1)
          swift_once();
        v40 = type metadata accessor for Logger();
        __swift_project_value_buffer(v40, (uint64_t)log);
        v41 = Logger.logObject.getter();
        v42 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v41, v42))
        {
          v43 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v43 = 0;
          _os_log_impl(&dword_1ACCCC000, v41, v42, "[ListenTopicSubscribers] Failed, server bouncing", v43, 2u);
          MEMORY[0x1AF44981C](v43, -1, -1);
        }

        retry #1 () in PubSubTopicsObserver.handleSubscriptionError(_:)(v98);
        return swift_bridgeObjectRelease();
      }
      else
      {
        v67 = a1;
        v94 = (char *)v24;
        v68 = v35[2];
        if (one-time initialization token for log != -1)
          swift_once();
        v69 = type metadata accessor for Logger();
        __swift_project_value_buffer(v69, (uint64_t)log);
        v70 = v38;
        swift_bridgeObjectRetain();
        v71 = v38;
        swift_bridgeObjectRetain();
        v72 = Logger.logObject.getter();
        v73 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v72, v73))
        {
          v74 = (uint8_t *)swift_slowAlloc();
          v75 = swift_slowAlloc();
          v95 = v67;
          v76 = v75;
          *(_DWORD *)v74 = 136315138;
          v99[3] = v39;
          v100 = v75;
          LOBYTE(v99[0]) = v37;
          v99[1] = (uint64_t)v38;
          v99[2] = v68;
          v77 = v38;
          swift_bridgeObjectRetain();
          v78 = String.init<A>(reflecting:)();
          v99[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v78, v79, &v100);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1ACCCC000, v72, v73, "[ListenTopicSuscribers] Failed, unexpected status=%s", v74, 0xCu);
          swift_arrayDestroy();
          v80 = v76;
          v67 = v95;
          MEMORY[0x1AF44981C](v80, -1, -1);
          MEMORY[0x1AF44981C](v74, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        v87 = v96;
        outlined init with copy of ActivitySession.DomainAssertionWrapper(v67, v96, (uint64_t (*)(_QWORD))type metadata accessor for PluginRpcError);
        (*(void (**)(uint64_t, _QWORD, uint64_t, char *))(v97 + 56))(v87, 0, 1, v94);
        swift_retain();
        PassthroughSubject.send(completion:)();
        swift_release();

        swift_bridgeObjectRelease();
        return outlined destroy of UUID?(v87, &demangling cache variable for type metadata for Subscribers.Completion<PluginRpcError>);
      }
    }
    else
    {
      outlined init with take of ActivitySession.DomainAssertionWrapper((uint64_t)v35, (uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
      if (one-time initialization token for log != -1)
        swift_once();
      v54 = type metadata accessor for Logger();
      __swift_project_value_buffer(v54, (uint64_t)log);
      v55 = v95;
      outlined init with copy of ActivitySession.DomainAssertionWrapper((uint64_t)v23, v95, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
      v56 = Logger.logObject.getter();
      v57 = static os_log_type_t.error.getter();
      v58 = os_log_type_enabled(v56, v57);
      v59 = v92;
      if (v58)
      {
        v60 = (uint8_t *)swift_slowAlloc();
        v61 = swift_slowAlloc();
        v99[0] = v61;
        *(_DWORD *)v60 = 136315138;
        v62 = v93;
        outlined init with copy of ActivitySession.DomainAssertionWrapper(v55, v93, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(v62, 0, 1, v59);
        v63 = v62;
        v64 = v91;
        outlined init with copy of ActivitySession.DomainAssertionWrapper?(v63, v91, &demangling cache variable for type metadata for PluginConnectError?);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v64, 1, v59) == 1)
        {
          v65 = 7104878;
          v66 = 0xE300000000000000;
        }
        else
        {
          v85 = v90;
          outlined init with take of ActivitySession.DomainAssertionWrapper(v64, v90, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
          outlined init with copy of ActivitySession.DomainAssertionWrapper(v85, v89, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
          v65 = String.init<A>(reflecting:)();
          v66 = v86;
          outlined destroy of ActivitySession.DomainAssertionWrapper(v85, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
        }
        outlined destroy of UUID?(v93, &demangling cache variable for type metadata for PluginConnectError?);
        v100 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v65, v66, v99);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        outlined destroy of ActivitySession.DomainAssertionWrapper(v55, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
        _os_log_impl(&dword_1ACCCC000, v56, v57, "[ListenTopicSubscribers] Failed with connection error, error=%s", v60, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1AF44981C](v61, -1, -1);
        MEMORY[0x1AF44981C](v60, -1, -1);
      }
      else
      {
        outlined destroy of ActivitySession.DomainAssertionWrapper(v55, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
      }

      retry #1 () in PubSubTopicsObserver.handleSubscriptionError(_:)(v98);
      return outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for PluginConnectError);
    }
  }
}

uint64_t retry #1 () in PubSubTopicsObserver.handleSubscriptionError(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  char *v31;
  uint64_t v32;
  uint64_t v34;
  void (*v35)(char *, char *);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD aBlock[6];

  v2 = type metadata accessor for DispatchWorkItemFlags();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchTime();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v34 - v16;
  v18 = *(_QWORD *)(a1 + 96);
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    v36 = v5;
    v37 = v7;
    v5 = (char *)v15;
    v40 = v2;
    *(_QWORD *)(a1 + 96) = v20;
    if (one-time initialization token for log == -1)
      goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v38 = v6;
  v39 = v3;
  v21 = type metadata accessor for Logger();
  __swift_project_value_buffer(v21, (uint64_t)log);
  swift_retain();
  v22 = Logger.logObject.getter();
  v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    *(_DWORD *)v24 = 134218240;
    aBlock[0] = *(_QWORD *)(a1 + 64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v24 + 12) = 2048;
    aBlock[0] = *(_QWORD *)(a1 + 96);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl(&dword_1ACCCC000, v22, v23, "[ListenTopicSubscribers] Retrying stream in %f seconds, attempt=#%ld", (uint8_t *)v24, 0x16u);
    MEMORY[0x1AF44981C](v24, -1, -1);

  }
  else
  {

    swift_release();
  }
  static DispatchTime.now()();
  MEMORY[0x1AF447E84](v14, *(double *)(a1 + 64));
  v35 = *(void (**)(char *, char *))(v11 + 8);
  v25 = v5;
  v35(v14, v5);
  v26 = *(_QWORD *)(a1 + 40);
  v27 = *(_QWORD *)(a1 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 16), v26);
  v28 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v27 + 8))(v26, v27);
  v29 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = partial apply for closure #1 in retry #1 () in PubSubTopicsObserver.handleSubscriptionError(_:);
  aBlock[5] = v29;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_42;
  v30 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v41 = MEMORY[0x1E0DEE9D8];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags], MEMORY[0x1E0DEAF38]);
  v31 = v36;
  v32 = v40;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x1AF4485D4](v17, v9, v31, v30);
  _Block_release(v30);

  (*(void (**)(char *, uint64_t))(v39 + 8))(v31, v32);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v38);
  v35(v17, v25);
  swift_release();
  return swift_release();
}

uint64_t closure #1 in retry #1 () in PubSubTopicsObserver.handleSubscriptionError(_:)()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    *(_QWORD *)(result + 88) = PubSubTopicsObserver.createListenTopicSubscription()();
    swift_release();
    return swift_release();
  }
  return result;
}

Swift::Void __swiftcall PubSubTopicsObserver.requestTopicTermination(topic:)(Swift::String topic)
{
  uint64_t v1;
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  _QWORD v16[2];
  uint64_t v17;

  v2 = v1;
  object = topic._object;
  countAndFlagsBits = topic._countAndFlagsBits;
  v5 = type metadata accessor for CP_TopicSubscribersRequest(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1)
    swift_once();
  v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)log);
  swift_bridgeObjectRetain_n();
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v16[0] = v2;
    v12 = (uint8_t *)v11;
    v13 = swift_slowAlloc();
    v17 = v13;
    *(_DWORD *)v12 = 136315138;
    swift_bridgeObjectRetain();
    v16[1] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1ACCCC000, v9, v10, "[ListenTopicSubscribers] Requesting topic termination, topic=%s, reason=.initiatorLeft", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v13, -1, -1);
    v14 = v12;
    v2 = v16[0];
    MEMORY[0x1AF44981C](v14, -1, -1);

  }
  else
  {

    v15 = swift_bridgeObjectRelease_n();
  }
  MEMORY[0x1E0C80A78](v15);
  v16[-2] = countAndFlagsBits;
  v16[-1] = object;
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CP_TopicSubscribersRequest and conformance CP_TopicSubscribersRequest, type metadata accessor for CP_TopicSubscribersRequest, (uint64_t)&protocol conformance descriptor for CP_TopicSubscribersRequest);
  static Message.with(_:)();
  if (*(_QWORD *)(v2 + 72))
  {
    swift_retain();
    PassthroughSubject.send(_:)();
    swift_release();
  }
  outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)v7, type metadata accessor for CP_TopicSubscribersRequest);
}

uint64_t closure #1 in PubSubTopicsObserver.requestTopicTermination(topic:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE v11[16];
  uint64_t v12;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CP_TopicSubscribersRequest.OneOf_Operation?);
  MEMORY[0x1E0C80A78](v6);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for CP_TopicSubscribersRequest.TopicTerminationRequest(0);
  v12 = a2;
  v13 = a3;
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CP_TopicSubscribersRequest.TopicTerminationRequest and conformance CP_TopicSubscribersRequest.TopicTerminationRequest, type metadata accessor for CP_TopicSubscribersRequest.TopicTerminationRequest, (uint64_t)&protocol conformance descriptor for CP_TopicSubscribersRequest.TopicTerminationRequest);
  static Message.with(_:)();
  v9 = type metadata accessor for CP_TopicSubscribersRequest.OneOf_Operation(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  return outlined assign with take of CP_TopicSubscribersRequest.OneOf_Operation?((uint64_t)v8, a1);
}

uint64_t PubSubTopicsObserver.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t PubSubTopicsObserver.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for Publisher.receive<A>(subscriber:) in conformance PubSubTopicsObserver()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 240))();
}

uint64_t specialized PubSubTopicsObserver.init(serviceProvider:rpcMaxAttempts:rpcRetryIntervalSeconds:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v15 = a4;
  v16 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a1, a4);
  *(_QWORD *)(a3 + 72) = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for PassthroughSubject<[TopicInfo], PluginRpcError>);
  swift_allocObject();
  v12 = PassthroughSubject.init()();
  *(_QWORD *)(a3 + 88) = 0;
  *(_QWORD *)(a3 + 96) = 0;
  *(_QWORD *)(a3 + 80) = v12;
  outlined init with take of BackgroundSessionManagerDataSource(&v14, a3 + 16);
  *(_QWORD *)(a3 + 56) = a2;
  *(double *)(a3 + 64) = a6;
  return a3;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay14CopresenceCore19CP_TopicSubscribersV09TerminateG0VG_AF0G4InfoOs5NeverOTg504_s14d41Core20PubSubTopicsObserverC29createListeng84Subscription33_B8497B8F5916E698C6A327A070E3F3BCLL7Combine14AnyCancellableCyFSayAA0I4j6OGAA03f4_I11h10VcfU_AjM09I9I0VXEfU0_AF0nopQ0CTf1cn_nTf4ng_n(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v14 = MEMORY[0x1E0DEE9D8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    v4 = *(_QWORD *)(type metadata accessor for CP_TopicSubscribers.TerminateTopic(0) - 8);
    v5 = *(_QWORD *)(v4 + 72);
    v6 = (uint64_t *)(((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + a1 + 8);
    do
    {
      v7 = *(v6 - 1);
      v8 = *v6;
      v9 = swift_allocObject();
      swift_weakInit();
      v2 = v14;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v14 + 16) + 1, 1);
        v2 = v14;
      }
      v11 = *(_QWORD *)(v2 + 16);
      v10 = *(_QWORD *)(v2 + 24);
      if (v11 >= v10 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v10 > 1, v11 + 1, 1);
        v2 = v14;
      }
      v6 = (uint64_t *)((char *)v6 + v5);
      *(_QWORD *)(v2 + 16) = v11 + 1;
      v12 = v2 + 40 * v11;
      *(_QWORD *)(v12 + 32) = v7;
      *(_QWORD *)(v12 + 40) = v8;
      *(_QWORD *)(v12 + 48) = partial apply for closure #1 in closure #2 in closure #1 in PubSubTopicsObserver.createListenTopicSubscription();
      *(_QWORD *)(v12 + 56) = v9;
      *(_BYTE *)(v12 + 64) = 1;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t specialized PubSubTopicsObserver.__allocating_init(serviceProvider:rpcMaxAttempts:rpcRetryIntervalSeconds:)(uint64_t a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v11 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PubSubTopicsObserver();
  v14 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, a5);
  return specialized PubSubTopicsObserver.init(serviceProvider:rpcMaxAttempts:rpcRetryIntervalSeconds:)((uint64_t)v13, a2, v14, a5, a6, a3);
}

uint64_t partial apply for closure #1 in PubSubTopicsObserver.requestTopicTermination(topic:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in PubSubTopicsObserver.requestTopicTermination(topic:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t associated type witness table accessor for IDProviding.ID : Hashable in TopicInfo()
{
  return MEMORY[0x1E0DEA978];
}

uint64_t destroy for TopicInfo(uint64_t a1)
{
  return outlined consume of TopicInfo(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for TopicInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  outlined copy of TopicInfo(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for TopicInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  outlined copy of TopicInfo(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  outlined consume of TopicInfo(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for TopicInfo(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 32);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 32) = v3;
  outlined consume of TopicInfo(v4, v6, v5, v7, v8);
  return a1;
}

ValueMetadata *type metadata accessor for TopicInfo()
{
  return &type metadata for TopicInfo;
}

uint64_t type metadata accessor for PubSubTopicsObserver()
{
  return objc_opt_self();
}

uint64_t method lookup function for PubSubTopicsObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PubSubTopicsObserver.__allocating_init(serviceProvider:rpcMaxAttempts:rpcRetryIntervalSeconds:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of PubSubTopicsObserver.receive<A>(subscriber:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of PubSubTopicsObserver.requestTopicTermination(topic:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

ValueMetadata *type metadata accessor for PubSubTopicsObserver.TopicSubscribers()
{
  return &type metadata for PubSubTopicsObserver.TopicSubscribers;
}

uint64_t destroy for PubSubTopicsObserver.TopicTermination()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for PubSubTopicsObserver.TopicTermination(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PubSubTopicsObserver.TopicTermination(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PubSubTopicsObserver.TopicTermination(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PubSubTopicsObserver.TopicTermination()
{
  return &type metadata for PubSubTopicsObserver.TopicTermination;
}

uint64_t sub_1ACF430AC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in retry #1 () in PubSubTopicsObserver.handleSubscriptionError(_:)()
{
  return closure #1 in retry #1 () in PubSubTopicsObserver.handleSubscriptionError(_:)();
}

uint64_t block_destroy_helper_40()
{
  return swift_release();
}

uint64_t partial apply for closure #1 in closure #1 in PubSubTopicsObserver.requestTopicTermination(topic:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = 1;
  *(_BYTE *)(a1 + 24) = 1;
  return result;
}

uint64_t outlined assign with take of CP_TopicSubscribersRequest.OneOf_Operation?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CP_TopicSubscribersRequest.OneOf_Operation?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in PubSubTopicsObserver.createListenTopicSubscription()@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return closure #1 in PubSubTopicsObserver.createListenTopicSubscription()(a1, v2, a2);
}

uint64_t partial apply for closure #2 in PubSubTopicsObserver.createListenTopicSubscription()(uint64_t a1)
{
  return closure #2 in PubSubTopicsObserver.createListenTopicSubscription()(a1);
}

uint64_t partial apply for closure #3 in PubSubTopicsObserver.createListenTopicSubscription()()
{
  return closure #3 in PubSubTopicsObserver.createListenTopicSubscription()();
}

uint64_t partial apply for closure #1 in closure #2 in closure #1 in PubSubTopicsObserver.createListenTopicSubscription()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return closure #1 in closure #2 in closure #1 in PubSubTopicsObserver.createListenTopicSubscription()(a1, a2, a3, a4);
}

uint64_t partial apply for closure #1 in PubSubTopicsObserver.complete(topicInfo:)(uint64_t a1)
{
  uint64_t *v1;

  return closure #1 in PubSubTopicsObserver.complete(topicInfo:)(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t Dictionary.unwrappedValue(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v24 = a6;
  v25 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Optional();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v24 - v15;
  v26 = a1;
  v27 = a5;
  MEMORY[0x1AF448034](a1, a2, a3, a4, a5);
  v17 = *(_QWORD *)(a4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, a4) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v24, v16, a4);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v12, v26, a3);
  v18 = String.init<A>(describing:)();
  v20 = v19;
  v21 = type metadata accessor for Dictionary.Errors(0, a3, a4, v27);
  MEMORY[0x1AF44972C](&protocol conformance descriptor for [A : B].Errors, v21);
  swift_allocError();
  *(_QWORD *)v22 = v18;
  *(_QWORD *)(v22 + 8) = v20;
  *(_BYTE *)(v22 + 16) = 0;
  return swift_willThrow();
}

uint64_t type metadata accessor for Dictionary.Errors(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Dictionary.Errors);
}

uint64_t Dictionary.unwrappedValue<A>(for:as:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t, uint64_t);
  char *v38;
  char *v39;
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
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;

  v48 = a6;
  v55 = a5;
  v9 = *(_QWORD *)(a3 - 8);
  v50 = a2;
  v51 = v9;
  MEMORY[0x1E0C80A78](a1);
  v52 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = v11;
  v12 = type metadata accessor for Optional();
  v46 = *(_QWORD *)(v12 - 8);
  v47 = v12;
  MEMORY[0x1E0C80A78](v12);
  v53 = (char *)&v46 - v13;
  v14 = type metadata accessor for Optional();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v46 - v17;
  v19 = *(_QWORD *)(a4 - 8);
  v20 = MEMORY[0x1E0C80A78](v16);
  v22 = (char *)&v46 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v54 = (char *)&v46 - v23;
  v24 = a1;
  MEMORY[0x1AF448034](a1, v50, a3, a4, v55);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, a4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v52, a1, a3);
    v25 = String.init<A>(describing:)();
    v27 = v26;
    v28 = type metadata accessor for Dictionary.Errors(0, a3, a4, v55);
    MEMORY[0x1AF44972C](&protocol conformance descriptor for [A : B].Errors, v28);
    swift_allocError();
    *(_QWORD *)v29 = v25;
    *(_QWORD *)(v29 + 8) = v27;
    *(_BYTE *)(v29 + 16) = 0;
    return swift_willThrow();
  }
  else
  {
    v50 = a3;
    v31 = v51;
    v32 = v52;
    v33 = v54;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v54, v18, a4);
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v22, v33, a4);
    v34 = v49;
    v35 = swift_dynamicCast();
    v36 = *(_QWORD *)(v34 - 8);
    v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56);
    if ((v35 & 1) != 0)
    {
      v38 = v53;
      v37(v53, 0, 1, v34);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v54, a4);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v36 + 32))(v48, v38, v34);
    }
    else
    {
      v39 = v53;
      v37(v53, 1, 1, v34);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v39, v47);
      v40 = v50;
      (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v32, v24, v50);
      v41 = String.init<A>(describing:)();
      v43 = v42;
      v44 = type metadata accessor for Dictionary.Errors(0, v40, a4, v55);
      MEMORY[0x1AF44972C](&protocol conformance descriptor for [A : B].Errors, v44);
      swift_allocError();
      *(_QWORD *)v45 = v41;
      *(_QWORD *)(v45 + 8) = v43;
      *(_BYTE *)(v45 + 16) = 1;
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v54, a4);
    }
  }
}

uint64_t CPSystemStateObserver.carplayObserver.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t CPSystemStateObserver.displayCloneStateObserver.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t CPSystemStateObserver.managedConfigObserver.getter()
{
  return swift_unknownObjectRetain();
}

void *CPSystemStateObserver.conversationManager.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___CPSystemStateObserver_conversationManager);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void CPSystemStateObserver.conversationManager.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___CPSystemStateObserver_conversationManager);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*CPSystemStateObserver.conversationManager.modify())()
{
  swift_beginAccess();
  return ActivitySession.audioSessionID.modify;
}

uint64_t CPSystemStateObserver.lock.getter()
{
  return swift_retain();
}

uint64_t CPSystemStateObserver.observers.getter()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t CPSystemStateObserver.observers.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___CPSystemStateObserver_observers);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*CPSystemStateObserver.observers.modify())()
{
  swift_beginAccess();
  return ActivitySession.terminatingHandle.modify;
}

uint64_t CPSystemStateObserver.carPlayConnected.didset(uint64_t a1, const char *a2)
{
  char *v2;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;

  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(_QWORD *)&v2[OBJC_IVAR___CPSystemStateObserver_lock] + 16));
  if (one-time initialization token for default != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Log.default);
  v5 = v2;
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    *(_DWORD *)v8 = 136315138;
    v13 = v9;
    v10 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v6, v7, a2, v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v9, -1, -1);
    MEMORY[0x1AF44981C](v8, -1, -1);

  }
  else
  {

  }
  return CPSystemStateObserver.recomputeAllowedStates()();
}

uint64_t CPSystemStateObserver.screenTimeAllowed.getter()
{
  return CPSystemStateObserver.screenTimeAllowed.getter(&OBJC_IVAR___CPSystemStateObserver____lazy_storage___screenTimeAllowed, &OBJC_IVAR___CPSystemStateObserver_managedConfigObserver);
}

uint64_t CPSystemStateObserver.screenTimeAllowed.didset(void (*a1)(void), const char *a2)
{
  char *v2;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;

  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(_QWORD *)&v2[OBJC_IVAR___CPSystemStateObserver_lock] + 16));
  if (one-time initialization token for default != -1)
    swift_once();
  v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)static Log.default);
  v6 = v2;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315138;
    a1();
    v11 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v7, v8, a2, v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v10, -1, -1);
    MEMORY[0x1AF44981C](v9, -1, -1);

  }
  else
  {

  }
  return CPSystemStateObserver.recomputeAllowedStates()();
}

uint64_t CPSystemStateObserver.isDisplayCloned.getter()
{
  return CPSystemStateObserver.screenTimeAllowed.getter(&OBJC_IVAR___CPSystemStateObserver____lazy_storage___isDisplayCloned, &OBJC_IVAR___CPSystemStateObserver_displayCloneStateObserver);
}

uint64_t CPSystemStateObserver.screenTimeAllowed.getter(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t ObjectType;
  char v7;

  v3 = *a1;
  v4 = *(unsigned __int8 *)(v2 + *a1);
  if (v4 == 2)
  {
    v5 = *(_QWORD *)(v2 + *a2 + 8);
    ObjectType = swift_getObjectType();
    v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(ObjectType, v5);
    *(_BYTE *)(v2 + v3) = v7 & 1;
  }
  else
  {
    v7 = v4 & 1;
  }
  return v7 & 1;
}

Swift::Bool __swiftcall CPSystemStateObserver.computeSharePlayAllowed()()
{
  _BYTE *v0;
  char v1;
  uint64_t v2;
  _BYTE *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;

  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(_QWORD *)&v0[OBJC_IVAR___CPSystemStateObserver_lock] + 16));
  if ((v0[OBJC_IVAR___CPSystemStateObserver_carPlayConnected] & 1) != 0
    || (CPSystemStateObserver.screenTimeAllowed.getter() & 1) == 0
    || (v0[OBJC_IVAR___CPSystemStateObserver_isLockdownModeEnabled] & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    v1 = v0[OBJC_IVAR___CPSystemStateObserver_isScreening] ^ 1;
  }
  if (one-time initialization token for default != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.default);
  v3 = v0;
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = swift_slowAlloc();
    v18 = swift_slowAlloc();
    v19 = v18;
    *(_DWORD *)v6 = 136316162;
    v7 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v8, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    v9 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 22) = 2080;
    CPSystemStateObserver.screenTimeAllowed.getter();
    v11 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 32) = 2080;
    v13 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 42) = 2080;
    v15 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v4, v5, "CPSystemStateObserver computeSharePlayAllowed result %s carPlayConnected:%s && screenTimeAllowed:%s, && lockdownModeEnabled:%s, && isScreening %s", (uint8_t *)v6, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v18, -1, -1);
    MEMORY[0x1AF44981C](v6, -1, -1);

  }
  else
  {

  }
  return v1 & 1;
}

Swift::Bool __swiftcall CPSystemStateObserver.computeScreenSharingAllowed()()
{
  _BYTE *v0;
  char v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;

  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(_QWORD *)&v0[OBJC_IVAR___CPSystemStateObserver_lock] + 16));
  if ((v0[OBJC_IVAR___CPSystemStateObserver_carPlayConnected] & 1) == 0
    && (CPSystemStateObserver.screenTimeAllowed.getter() & 1) != 0
    && objc_msgSend(*(id *)&v0[OBJC_IVAR___CPSystemStateObserver_audioRoutePolicyManager], sel_sharePlaySupported))
  {
    v1 = v0[OBJC_IVAR___CPSystemStateObserver_isLockdownModeEnabled] ^ 1;
  }
  else
  {
    v1 = 0;
  }
  if (one-time initialization token for default != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.default);
  v3 = v0;
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = swift_slowAlloc();
    v18 = swift_slowAlloc();
    v19 = v18;
    *(_DWORD *)v6 = 136316162;
    v7 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v8, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    v9 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 22) = 2080;
    CPSystemStateObserver.screenTimeAllowed.getter();
    v11 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 32) = 2080;
    objc_msgSend(*(id *)&v3[OBJC_IVAR___CPSystemStateObserver_audioRoutePolicyManager], sel_sharePlaySupported);
    v13 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 42) = 2080;
    v15 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v4, v5, "CPSystemStateObserver computeScreenSharingAllowed result %s carPlayConnected:%s && screenTimeAllowed:%s && routeSupportsSharePlay:%s, && lockdownModeEnabled:%s", (uint8_t *)v6, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v18, -1, -1);
    MEMORY[0x1AF44981C](v6, -1, -1);

  }
  else
  {

  }
  return v1 & 1;
}

Swift::Bool __swiftcall CPSystemStateObserver.computeScreenSharingInitiationAllowed()()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)((char *)v0 + OBJC_IVAR___CPSystemStateObserver_lock);
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(v1 + 16));
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(v1 + 16));
  LOBYTE(v1) = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
  v2 = CPSystemStateObserver._allowScreenSharing.getter();
  v3 = OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowScreenSharing;
  *((_BYTE *)v0 + OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowScreenSharing) = v1 & 1;
  CPSystemStateObserver._allowScreenSharing.didset(v2 & 1);
  if ((*((_BYTE *)v0 + v3) & 1) != 0)
    v4 = CPSystemStateObserver.isDisplayCloned.getter() ^ 1;
  else
    LOBYTE(v4) = 0;
  if (one-time initialization token for default != -1)
    swift_once();
  v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)static Log.default);
  v6 = v0;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v17 = swift_slowAlloc();
    v18 = v17;
    *(_DWORD *)v9 = 136315650;
    v10 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    v12 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 22) = 2080;
    CPSystemStateObserver.isDisplayCloned.getter();
    v14 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v7, v8, "CPSystemStateObserver computeScreenSharingInitiationAllowed result %s allowScreenSharing:%s && displayIsCloned:%s", (uint8_t *)v9, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v17, -1, -1);
    MEMORY[0x1AF44981C](v9, -1, -1);

  }
  else
  {

  }
  return v4 & 1;
}

uint64_t CPSystemStateObserver._allowSharePlay.didset(char a1)
{
  char *v1;
  int v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(id (*)(void *), uint64_t);
  char *v17;
  uint64_t v18;

  v2 = a1 & 1;
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(_QWORD *)&v1[OBJC_IVAR___CPSystemStateObserver_lock] + 16));
  result = CPSystemStateObserver._allowSharePlay.getter();
  if ((result & 1) != v2)
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)static Log.default);
    v5 = v1;
    v6 = Logger.logObject.getter();
    v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v18 = v9;
      *(_DWORD *)v8 = 136315138;
      v10 = String.init<A>(reflecting:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ACCCC000, v6, v7, "CPSystemStateObserver allowSharePlay changed to %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v9, -1, -1);
      MEMORY[0x1AF44981C](v8, -1, -1);

    }
    else
    {

    }
    v14 = (*(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v5) + 0xE0))(v12, v13);
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v5;
    v16 = *(void (**)(id (*)(void *), uint64_t))(*(_QWORD *)v14 + 152);
    v17 = v5;
    v16(partial apply for closure #1 in CPSystemStateObserver._allowSharePlay.didset, v15);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t CPSystemStateObserver._allowSharePlay.getter()
{
  _QWORD *v0;
  uint64_t v1;
  int v2;
  char v3;

  v1 = OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowSharePlay;
  v2 = *((unsigned __int8 *)v0 + OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowSharePlay);
  if (v2 == 2)
  {
    v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
    *((_BYTE *)v0 + v1) = v3 & 1;
  }
  else
  {
    v3 = v2 & 1;
  }
  return v3 & 1;
}

uint64_t CPSystemStateObserver._allowScreenSharing.didset(char a1)
{
  char *v1;
  int v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t (*)(void *), uint64_t);
  char *v17;
  uint64_t v18;

  v2 = a1 & 1;
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(_QWORD *)&v1[OBJC_IVAR___CPSystemStateObserver_lock] + 16));
  result = CPSystemStateObserver._allowScreenSharing.getter();
  if ((result & 1) != v2)
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)static Log.default);
    v5 = v1;
    v6 = Logger.logObject.getter();
    v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v18 = v9;
      *(_DWORD *)v8 = 136315138;
      v10 = String.init<A>(reflecting:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ACCCC000, v6, v7, "CPSystemStateObserver allowScreenSharing changed to %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v9, -1, -1);
      MEMORY[0x1AF44981C](v8, -1, -1);

    }
    else
    {

    }
    v14 = (*(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v5) + 0xE0))(v12, v13);
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v5;
    v16 = *(void (**)(uint64_t (*)(void *), uint64_t))(*(_QWORD *)v14 + 152);
    v17 = v5;
    v16(partial apply for closure #1 in CPSystemStateObserver._allowScreenSharing.didset, v15);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t CPSystemStateObserver._allowScreenSharing.getter()
{
  _QWORD *v0;
  uint64_t v1;
  int v2;
  char v3;

  v1 = OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowScreenSharing;
  v2 = *((unsigned __int8 *)v0 + OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowScreenSharing);
  if (v2 == 2)
  {
    v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
    *((_BYTE *)v0 + v1) = v3 & 1;
  }
  else
  {
    v3 = v2 & 1;
  }
  return v3 & 1;
}

uint64_t CPSystemStateObserver._allowScreenSharingInitiation.didset(char a1)
{
  char *v1;
  int v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t (*)(void *), uint64_t);
  char *v17;
  uint64_t v18;

  v2 = a1 & 1;
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(_QWORD *)&v1[OBJC_IVAR___CPSystemStateObserver_lock] + 16));
  result = CPSystemStateObserver._allowScreenSharingInitiation.getter();
  if ((result & 1) != v2)
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)static Log.default);
    v5 = v1;
    v6 = Logger.logObject.getter();
    v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v18 = v9;
      *(_DWORD *)v8 = 136315138;
      v10 = String.init<A>(reflecting:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ACCCC000, v6, v7, "CPSystemStateObserver allowScreenSharingInitiation changed to %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v9, -1, -1);
      MEMORY[0x1AF44981C](v8, -1, -1);

    }
    else
    {

    }
    v14 = (*(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v5) + 0xE0))(v12, v13);
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v5;
    v16 = *(void (**)(uint64_t (*)(void *), uint64_t))(*(_QWORD *)v14 + 152);
    v17 = v5;
    v16(partial apply for closure #1 in CPSystemStateObserver._allowScreenSharingInitiation.didset, v15);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in CPSystemStateObserver._allowScreenSharing.didset(void *a1, uint64_t a2, SEL *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result;
  uint64_t v9;

  result = (uint64_t)objc_msgSend(a1, sel_respondsToSelector_, *a3);
  if ((result & 1) != 0)
  {
    v9 = swift_unknownObjectRetain();
    objc_msgSend(a1, *a3, a2, a4(v9) & 1);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t CPSystemStateObserver._allowScreenSharingInitiation.getter()
{
  _QWORD *v0;
  uint64_t v1;
  int v2;
  char v3;

  v1 = OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowScreenSharingInitiation;
  v2 = *((unsigned __int8 *)v0 + OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowScreenSharingInitiation);
  if (v2 == 2)
  {
    v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
    *((_BYTE *)v0 + v1) = v3 & 1;
  }
  else
  {
    v3 = v2 & 1;
  }
  return v3 & 1;
}

uint64_t CPSystemStateObserver.recomputeAllowedStates()()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;

  v1 = *(_QWORD *)((char *)v0 + OBJC_IVAR___CPSystemStateObserver_lock);
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(v1 + 16));
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(v1 + 16));
  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
  v4 = CPSystemStateObserver._allowSharePlay.getter();
  *((_BYTE *)v0 + OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowSharePlay) = v3 & 1;
  CPSystemStateObserver._allowSharePlay.didset(v4 & 1);
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(v1 + 16));
  v5 = (*(uint64_t (**)(void))((*v2 & *v0) + 0x178))();
  v6 = CPSystemStateObserver._allowScreenSharing.getter();
  *((_BYTE *)v0 + OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowScreenSharing) = v5 & 1;
  CPSystemStateObserver._allowScreenSharing.didset(v6 & 1);
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(v1 + 16));
  v7 = (*(uint64_t (**)(void))((*v2 & *v0) + 0x180))();
  v8 = CPSystemStateObserver._allowScreenSharingInitiation.getter();
  *((_BYTE *)v0 + OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowScreenSharingInitiation) = v7 & 1;
  return CPSystemStateObserver._allowScreenSharingInitiation.didset(v8 & 1);
}

uint64_t CPSystemStateObserver.allowSharePlay.getter()
{
  return CPSystemStateObserver.allowSharePlay.getter(CPSystemStateObserver._allowSharePlay.getter);
}

uint64_t CPSystemStateObserver.allowScreenSharing.getter()
{
  return CPSystemStateObserver.allowSharePlay.getter(CPSystemStateObserver._allowScreenSharing.getter);
}

uint64_t @objc CPSystemStateObserver.allowSharePlay.getter(char *a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  os_unfair_lock_s *v5;
  char *v6;

  v4 = *(_QWORD *)&a1[OBJC_IVAR___CPSystemStateObserver_lock];
  v5 = *(os_unfair_lock_s **)(v4 + 16);
  v6 = a1;
  os_unfair_lock_lock(v5);
  LOBYTE(a3) = a3();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v4 + 16));

  return a3 & 1;
}

uint64_t CPSystemStateObserver.allowScreenSharingInitiation.getter()
{
  return CPSystemStateObserver.allowSharePlay.getter(CPSystemStateObserver._allowScreenSharingInitiation.getter);
}

uint64_t CPSystemStateObserver.allowSharePlay.getter(uint64_t (*a1)(void))
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR___CPSystemStateObserver_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v3 + 16));
  LOBYTE(a1) = a1();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v3 + 16));
  return a1 & 1;
}

uint64_t CPSystemStateObserver.__allocating_init(queue:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return CPSystemStateObserver.init(queue:)(a1);
}

uint64_t CPSystemStateObserver.init(queue:)(void *a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t ObjectType;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char v16;

  objc_allocWithZone((Class)type metadata accessor for CPCarPlayObserver());
  v3 = v1;
  v4 = a1;
  v5 = CPCarPlayObserver.init(queue:)(v4);
  v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CPManagedConfigurationObserver()), sel_init);
  if (one-time initialization token for shared != -1)
    swift_once();
  v7 = (void *)static CPAudioRoutePolicyManager.shared;
  v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CPDisplayCloneStateObserver()), sel_init);
  ObjectType = swift_getObjectType();

  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  v16 = TULockdownModeEnabled();
  v14 = (*(uint64_t (**)(id, id, _UNKNOWN **, id, _UNKNOWN **, id, id, _UNKNOWN **, char))(ObjectType + 520))(v4, v10, &protocol witness table for CPCarPlayObserver, v11, &protocol witness table for CPManagedConfigurationObserver, v12, v13, &protocol witness table for CPDisplayCloneStateObserver, v16);

  swift_deallocPartialClassInstance();
  return v14;
}

char *CPSystemStateObserver.__allocating_init(queue:carplayObserver:managedConfigObserver:audioRoutePolicyManager:displayCloneStateObserver:isLockdownModeEnabled:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  objc_class *v9;
  id v18;

  v18 = objc_allocWithZone(v9);
  return CPSystemStateObserver.init(queue:carplayObserver:managedConfigObserver:audioRoutePolicyManager:displayCloneStateObserver:isLockdownModeEnabled:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

char *CPSystemStateObserver.init(queue:carplayObserver:managedConfigObserver:audioRoutePolicyManager:displayCloneStateObserver:isLockdownModeEnabled:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v9;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _DWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t ObjectType;
  void (*v32)(char *, _UNKNOWN **, uint64_t, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, _UNKNOWN **, uint64_t, uint64_t);
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, _UNKNOWN **, uint64_t, uint64_t);
  char *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  char *v46;
  id v47;
  id v48;
  _QWORD aBlock[6];
  objc_super v55;

  *(_QWORD *)&v9[OBJC_IVAR___CPSystemStateObserver_conversationManager] = 0;
  v14 = OBJC_IVAR___CPSystemStateObserver_lock;
  type metadata accessor for Lock();
  v15 = swift_allocObject();
  v16 = v9;
  v17 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v15 + 16) = v17;
  *v17 = 0;
  *(_QWORD *)&v9[v14] = v15;
  v18 = OBJC_IVAR___CPSystemStateObserver_observers;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DelegatesManager<CPSystemStateObserverObserver>);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = MEMORY[0x1E0DEE9D8];
  v20 = swift_allocObject();
  v21 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v20 + 16) = v21;
  *v21 = 0;
  *(_QWORD *)(v19 + 24) = v20;
  *(_QWORD *)&v16[v18] = v19;
  v16[OBJC_IVAR___CPSystemStateObserver____lazy_storage___screenTimeAllowed] = 2;
  v16[OBJC_IVAR___CPSystemStateObserver____lazy_storage___isDisplayCloned] = 2;
  v16[OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowSharePlay] = 2;
  v16[OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowScreenSharing] = 2;
  v16[OBJC_IVAR___CPSystemStateObserver____lazy_storage____allowScreenSharingInitiation] = 2;
  if (one-time initialization token for default != -1)
    swift_once();
  v22 = type metadata accessor for Logger();
  __swift_project_value_buffer(v22, (uint64_t)static Log.default);
  v23 = Logger.logObject.getter();
  v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_1ACCCC000, v23, v24, "CPSystemStateObserver init", v25, 2u);
    MEMORY[0x1AF44981C](v25, -1, -1);
  }

  v26 = &v16[OBJC_IVAR___CPSystemStateObserver_carplayObserver];
  *(_QWORD *)v26 = a2;
  *((_QWORD *)v26 + 1) = a3;
  v27 = &v16[OBJC_IVAR___CPSystemStateObserver_managedConfigObserver];
  *(_QWORD *)v27 = a4;
  *((_QWORD *)v27 + 1) = a5;
  v16[OBJC_IVAR___CPSystemStateObserver_carPlayConnected] = 0;
  *(_QWORD *)&v16[OBJC_IVAR___CPSystemStateObserver_audioRoutePolicyManager] = a6;
  v28 = &v16[OBJC_IVAR___CPSystemStateObserver_displayCloneStateObserver];
  *(_QWORD *)v28 = a7;
  *((_QWORD *)v28 + 1) = a8;
  v16[OBJC_IVAR___CPSystemStateObserver_isLockdownModeEnabled] = a9 & 1;
  v16[OBJC_IVAR___CPSystemStateObserver_isScreening] = 0;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();

  v55.receiver = v16;
  v55.super_class = (Class)type metadata accessor for CPSystemStateObserver();
  v29 = (char *)objc_msgSendSuper2(&v55, sel_init);
  v30 = *(_QWORD *)&v29[OBJC_IVAR___CPSystemStateObserver_carplayObserver + 8];
  ObjectType = swift_getObjectType();
  v32 = *(void (**)(char *, _UNKNOWN **, uint64_t, uint64_t))(v30 + 24);
  v33 = v29;
  swift_unknownObjectRetain();
  v32(v29, &protocol witness table for CPSystemStateObserver, ObjectType, v30);
  swift_unknownObjectRelease();
  v34 = *(_QWORD *)&v33[OBJC_IVAR___CPSystemStateObserver_managedConfigObserver + 8];
  v35 = swift_getObjectType();
  v36 = *(void (**)(char *, _UNKNOWN **, uint64_t, uint64_t))(v34 + 24);
  v37 = v33;
  swift_unknownObjectRetain();
  v36(v29, &protocol witness table for CPSystemStateObserver, v35, v34);
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)&v37[OBJC_IVAR___CPSystemStateObserver_audioRoutePolicyManager], sel_addObserver_withQueue_, v37, a1);
  v38 = *(_QWORD *)&v37[OBJC_IVAR___CPSystemStateObserver_displayCloneStateObserver + 8];
  v39 = swift_getObjectType();
  v40 = *(void (**)(char *, _UNKNOWN **, uint64_t, uint64_t))(v38 + 24);
  v41 = v37;
  swift_unknownObjectRetain();
  v40(v29, &protocol witness table for CPSystemStateObserver, v39, v38);
  swift_unknownObjectRelease();
  v42 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v43 = *MEMORY[0x1E0DBD5D0];
  v44 = swift_allocObject();
  *(_QWORD *)(v44 + 16) = v41;
  *(_QWORD *)(v44 + 24) = a1;
  aBlock[4] = partial apply for closure #1 in CPSystemStateObserver.init(queue:carplayObserver:managedConfigObserver:audioRoutePolicyManager:displayCloneStateObserver:isLockdownModeEnabled:);
  aBlock[5] = v44;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Notification) -> ();
  aBlock[3] = &block_descriptor_43;
  v45 = _Block_copy(aBlock);
  v46 = v41;
  v47 = a1;
  swift_release();
  v48 = objc_msgSend(v42, sel_addObserverForName_object_queue_usingBlock_, v43, 0, 0, v45);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  _Block_release(v45);
  swift_unknownObjectRelease();

  return v46;
}

void closure #1 in CPSystemStateObserver.init(queue:carplayObserver:managedConfigObserver:audioRoutePolicyManager:displayCloneStateObserver:isLockdownModeEnabled:)(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (one-time initialization token for default != -1)
    swift_once();
  v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)static Log.default);
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1ACCCC000, v6, v7, "CPSystemStateObserver added a conversation manager from notification", v8, 2u);
    MEMORY[0x1AF44981C](v8, -1, -1);
  }

  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DBD298]), sel_init);
  v10 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v11 = (*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & *a2) + 0xD0))(v9);
  v12 = (void *)(*(uint64_t (**)(uint64_t))((*v10 & *a2) + 0xC8))(v11);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, sel_addDelegate_queue_, a2, a3);
    objc_msgSend(v13, sel_registerWithCompletionHandler_, 0);

  }
}

uint64_t CPSystemStateObserver.addObserver(_:queue:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;

  v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xE0))();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 160))(a1, a2);
  return swift_release();
}

id CPSystemStateObserver.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CPSystemStateObserver.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CPSystemStateObserver.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CPSystemStateObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall CPSystemStateObserver.carPlayDidConnect()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;

  v1 = v0;
  if (one-time initialization token for default != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.default);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1ACCCC000, v3, v4, "CPSystemStateObserver got carplay connected callback", v5, 2u);
    MEMORY[0x1AF44981C](v5, -1, -1);
  }

  v6 = *(_QWORD *)(v1 + OBJC_IVAR___CPSystemStateObserver_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v6 + 16));
  *(_BYTE *)(v1 + OBJC_IVAR___CPSystemStateObserver_carPlayConnected) = 1;
  CPSystemStateObserver.carPlayConnected.didset((uint64_t)&OBJC_IVAR___CPSystemStateObserver_carPlayConnected, "CPSystemStateObserver carPlayConnected change to %s");
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v6 + 16));
}

Swift::Void __swiftcall CPSystemStateObserver.carPlayDidDisconnect()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;

  v1 = v0;
  if (one-time initialization token for default != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.default);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1ACCCC000, v3, v4, "CPSystemStateObserver got carplay disconnected callback", v5, 2u);
    MEMORY[0x1AF44981C](v5, -1, -1);
  }

  v6 = *(_QWORD *)(v1 + OBJC_IVAR___CPSystemStateObserver_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v6 + 16));
  *(_BYTE *)(v1 + OBJC_IVAR___CPSystemStateObserver_carPlayConnected) = 0;
  CPSystemStateObserver.carPlayConnected.didset((uint64_t)&OBJC_IVAR___CPSystemStateObserver_carPlayConnected, "CPSystemStateObserver carPlayConnected change to %s");
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v6 + 16));
}

Swift::Void __swiftcall CPSystemStateObserver.allowedStateChanged(allowed:)(Swift::Bool allowed)
{
  CPSystemStateObserver.allowedStateChanged(allowed:)(allowed, "CPSystemStateObserver got notification that from CPManagedConfigurationObserver allowed transitioned to %{BOOL}d", &OBJC_IVAR___CPSystemStateObserver____lazy_storage___screenTimeAllowed, (void (*)(void))CPSystemStateObserver.screenTimeAllowed.getter, "CPSystemStateObserver screenTimeAllowed change to %s");
}

Swift::Void __swiftcall CPSystemStateObserver.audioPolicyManager(_:sharePlayAllowedStateChanged:)(CPAudioRoutePolicyManager *_, Swift::Bool sharePlayAllowedStateChanged)
{
  specialized CPSystemStateObserver.audioPolicyManager(_:sharePlayAllowedStateChanged:)();
}

void CPSystemStateObserver.conversationManager(_:screeningChangedFor:)(uint64_t a1, void *a2)
{
  specialized CPSystemStateObserver.conversationManager(_:screeningChangedFor:)(a2);
}

void CPSystemStateObserver.conversationManager(_:stateChangedFor:)(uint64_t a1, void *a2)
{
  specialized CPSystemStateObserver.conversationManager(_:stateChangedFor:)(a2);
}

Swift::Void __swiftcall CPSystemStateObserver.clonedStateChanged(isCloned:)(Swift::Bool isCloned)
{
  CPSystemStateObserver.allowedStateChanged(allowed:)(isCloned, "CPSystemStateObserver got notification from CPDisplayCloneStateObserver that isCloned transitioned to %{BOOL}d", &OBJC_IVAR___CPSystemStateObserver____lazy_storage___isDisplayCloned, (void (*)(void))CPSystemStateObserver.isDisplayCloned.getter, "CPSystemStateObserver isDisplayCloned changed to %s");
}

void CPSystemStateObserver.allowedStateChanged(allowed:)(char a1, const char *a2, _QWORD *a3, void (*a4)(void), const char *a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;

  v10 = v5;
  if (one-time initialization token for default != -1)
    swift_once();
  v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Log.default);
  v13 = Logger.logObject.getter();
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v15 = 67109120;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_1ACCCC000, v13, v14, a2, v15, 8u);
    MEMORY[0x1AF44981C](v15, -1, -1);
  }

  v16 = *(_QWORD *)(v10 + OBJC_IVAR___CPSystemStateObserver_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v16 + 16));
  *(_BYTE *)(v10 + *a3) = a1 & 1;
  CPSystemStateObserver.screenTimeAllowed.didset(a4, a5);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v16 + 16));
}

uint64_t type metadata accessor for CPSystemStateObserver()
{
  return objc_opt_self();
}

uint64_t sub_1ACF46214()
{
  uint64_t v0;

  return swift_deallocObject();
}

void partial apply for closure #1 in CPSystemStateObserver.init(queue:carplayObserver:managedConfigObserver:audioRoutePolicyManager:displayCloneStateObserver:isLockdownModeEnabled:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in CPSystemStateObserver.init(queue:carplayObserver:managedConfigObserver:audioRoutePolicyManager:displayCloneStateObserver:isLockdownModeEnabled:)(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t block_destroy_helper_41()
{
  return swift_release();
}

void specialized CPSystemStateObserver.audioPolicyManager(_:sharePlayAllowedStateChanged:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;

  v1 = v0;
  if (one-time initialization token for default != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.default);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 67109120;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_1ACCCC000, v3, v4, "CPSystemStateObserver got notification from CPAudioPolicyManager that allowed transitioned to %{BOOL}d", v5, 8u);
    MEMORY[0x1AF44981C](v5, -1, -1);
  }

  v6 = *(_QWORD *)(v1 + OBJC_IVAR___CPSystemStateObserver_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v6 + 16));
  CPSystemStateObserver.recomputeAllowedStates()();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v6 + 16));
}

void specialized CPSystemStateObserver.conversationManager(_:screeningChangedFor:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;

  v2 = v1;
  if (one-time initialization token for default != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Log.default);
  v5 = a1;
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v9 = v5;

    _os_log_impl(&dword_1ACCCC000, v6, v7, "CPSystemStateObserver We got a callback from our conversation manager %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v9, -1, -1);
    MEMORY[0x1AF44981C](v8, -1, -1);

  }
  else
  {

  }
  v11 = *(_QWORD *)(v2 + OBJC_IVAR___CPSystemStateObserver_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v11 + 16));
  if (objc_msgSend(v5, sel_isScreening))
  {
    *(_BYTE *)(v2 + OBJC_IVAR___CPSystemStateObserver_isScreening) = 1;
    CPSystemStateObserver.carPlayConnected.didset((uint64_t)&OBJC_IVAR___CPSystemStateObserver_isScreening, "CPSystemStateObserver isScreening changed to %s");
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v11 + 16));
}

void specialized CPSystemStateObserver.conversationManager(_:stateChangedFor:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;

  v2 = v1;
  if (one-time initialization token for default != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Log.default);
  v5 = a1;
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v9 = v5;

    _os_log_impl(&dword_1ACCCC000, v6, v7, "CPSystemStateObserver We got a callback from our conversation manager %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v9, -1, -1);
    MEMORY[0x1AF44981C](v8, -1, -1);

  }
  else
  {

  }
  v11 = *(_QWORD *)(v2 + OBJC_IVAR___CPSystemStateObserver_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v11 + 16));
  if (objc_msgSend(v5, sel_state) == (id)4)
  {
    *(_BYTE *)(v2 + OBJC_IVAR___CPSystemStateObserver_isScreening) = 0;
    CPSystemStateObserver.carPlayConnected.didset((uint64_t)&OBJC_IVAR___CPSystemStateObserver_isScreening, "CPSystemStateObserver isScreening changed to %s");
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v11 + 16));
}

uint64_t sub_1ACF4675C@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xC8))();
  *a2 = result;
  return result;
}

uint64_t sub_1ACF4679C(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xD0);
  v4 = *a1;
  return v3(v2);
}

uint64_t sub_1ACF467E8@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xE0))();
  *a2 = result;
  return result;
}

uint64_t sub_1ACF46828(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xE8);
  v3 = swift_retain();
  return v2(v3);
}

uint64_t method lookup function for CPSystemStateObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CPSystemStateObserver.conversationManager.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CPSystemStateObserver.conversationManager.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CPSystemStateObserver.conversationManager.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CPSystemStateObserver.observers.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of CPSystemStateObserver.observers.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CPSystemStateObserver.observers.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of CPSystemStateObserver.computeSharePlayAllowed()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of CPSystemStateObserver.computeScreenSharingAllowed()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of CPSystemStateObserver.computeScreenSharingInitiationAllowed()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of CPSystemStateObserver.allowSharePlay.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of CPSystemStateObserver.allowScreenSharing.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of CPSystemStateObserver.allowScreenSharingInitiation.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of CPSystemStateObserver.__allocating_init(queue:carplayObserver:managedConfigObserver:audioRoutePolicyManager:displayCloneStateObserver:isLockdownModeEnabled:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 520))();
}

uint64_t dispatch thunk of CPSystemStateObserver.addObserver(_:queue:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x210))();
}

uint64_t partial apply for closure #1 in CPSystemStateObserver._allowScreenSharingInitiation.didset(void *a1)
{
  uint64_t v1;

  return closure #1 in CPSystemStateObserver._allowScreenSharing.didset(a1, *(_QWORD *)(v1 + 16), (SEL *)&selRef_systemStateObserver_screenSharingInitiationAllowedStateChanged_, (uint64_t (*)(uint64_t))CPSystemStateObserver._allowScreenSharingInitiation.getter);
}

id partial apply for closure #1 in CPSystemStateObserver._allowSharePlay.didset(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, sel_systemStateObserver_sharePlayAllowedStateChanged_, *(_QWORD *)(v1 + 16), CPSystemStateObserver._allowSharePlay.getter() & 1);
}

uint64_t sub_1ACF46A50()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in CPSystemStateObserver._allowScreenSharing.didset(void *a1)
{
  uint64_t v1;

  return closure #1 in CPSystemStateObserver._allowScreenSharing.didset(a1, *(_QWORD *)(v1 + 16), (SEL *)&selRef_systemStateObserver_screenSharingAllowedStateChanged_, (uint64_t (*)(uint64_t))CPSystemStateObserver._allowScreenSharing.getter);
}

uint64_t ApplicationLaunchBehavior.shouldThrowOnLaunchTimeout.getter()
{
  return 1;
}

uint64_t dispatch thunk of ApplicationLaunchProviding.launchApp(for:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATQ0_;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ApplicationLaunchBehavior.shouldHandleAppLaunch(for:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of ApplicationLaunchBehavior.handleAppLaunch(for:options:launchProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 16) + *(_QWORD *)(a5 + 16));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = partial apply for closure #1 in closure #1 in AsyncSerialQueue.performAndWaitFor<A>(_:);
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of ApplicationLaunchBehavior.revokeBackgroundAuthorization(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 24) + *(_QWORD *)(a4 + 24));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = partial apply for closure #1 in closure #1 in AsyncSerialQueue.performAndWaitFor<A>(_:);
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ApplicationLaunchBehavior.shouldThrowOnLaunchTimeout.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

id GroupSessionDataCryptorProvider.dataCryptor.willset(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  id v17;
  void *v18;
  void (*v19)(_BYTE *, _BYTE *, uint64_t);
  id result;
  uint64_t v21;
  void (*v22)(void);
  char v23;
  void (*v24)(_BYTE *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  id v60;
  _BYTE v61[12];
  int v62;
  uint64_t v63;
  _BYTE *v64;
  void (*v65)(_BYTE *, uint64_t);
  id v66;
  uint64_t v67;
  uint64_t v68;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v4);
  v6 = &v61[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = &v61[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = &v61[-v13];
  MEMORY[0x1E0C80A78](v12);
  v16 = &v61[-v15];
  v17 = objc_msgSend(a1, sel_encryptionKeyID);
  if (!v17)
  {
    result = (id)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_22;
  }
  v18 = v17;
  v66 = a1;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  v19 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32);
  v19(v6, v14, v7);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  result = (id)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if ((_DWORD)result == 1)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    return result;
  }
  v21 = ((uint64_t (*)(_BYTE *, _BYTE *, uint64_t))v19)(v16, v6, v7);
  v22 = *(void (**)(void))(*v2 + 152);
  ((void (*)(uint64_t))v22)(v21);
  lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E0CB09D0]);
  v23 = dispatch thunk of static Equatable.== infix(_:_:)();
  v24 = *(void (**)(_BYTE *, uint64_t))(v8 + 8);
  v25 = ((uint64_t (*)(_BYTE *, uint64_t))v24)(v14, v7);
  if ((v23 & 1) == 0)
  {
    if (one-time initialization token for log != -1)
      swift_once();
    v26 = type metadata accessor for Logger();
    __swift_project_value_buffer(v26, (uint64_t)log);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v11, v16, v7);
    swift_retain_n();
    v27 = Logger.logObject.getter();
    v28 = static os_log_type_t.default.getter();
    v29 = v28;
    if (os_log_type_enabled(v27, v28))
    {
      v30 = swift_slowAlloc();
      v64 = v16;
      v31 = v30;
      v63 = swift_slowAlloc();
      v68 = v63;
      *(_DWORD *)v31 = 136315650;
      v65 = v24;
      v32 = v2;
      v62 = v29;
      v22();
      lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E0CB09F0]);
      v33 = dispatch thunk of CustomStringConvertible.description.getter();
      v35 = v34;
      v65(v14, v7);
      v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v35, &v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 12) = 2080;
      v36 = dispatch thunk of CustomStringConvertible.description.getter();
      v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v36, v37, &v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v65(v11, v7);
      *(_WORD *)(v31 + 22) = 2080;
      v38 = v2[2];
      v39 = v2[3];
      swift_bridgeObjectRetain();
      v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v39, &v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      v2 = v32;
      v24 = v65;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ACCCC000, v27, (os_log_type_t)v62, "[DataCryptor] Local encryptionID rotated, invoking delegate, from=%s to=%s topic=%s", (uint8_t *)v31, 0x20u);
      v40 = v63;
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v40, -1, -1);
      v41 = v31;
      v16 = v64;
      MEMORY[0x1AF44981C](v41, -1, -1);

    }
    else
    {
      swift_release_n();
      v24(v11, v7);

      v25 = swift_release_n();
    }
  }
  v42 = (*(uint64_t (**)(uint64_t))(*v2 + 192))(v25);
  v43 = specialized Set.init<A>(_:)(v42);
  swift_bridgeObjectRelease();
  result = objc_msgSend(v66, sel_decryptionKeyIDSet);
  if (!result)
    goto LABEL_23;
  v44 = result;
  v45 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v46 = specialized Set.init<A>(_:)(v45);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v43 + 16) <= *(_QWORD *)(v46 + 16) >> 3)
  {
    v68 = v46;
    swift_bridgeObjectRetain();
    specialized Set._subtract<A>(_:)(v43);
  }
  else
  {
    swift_bridgeObjectRetain();
    specialized _NativeSet.subtracting<A>(_:)(v43, v46);
  }
  if (*(_QWORD *)(v46 + 16) <= *(_QWORD *)(v43 + 16) >> 3)
  {
    v68 = v43;
    specialized Set._subtract<A>(_:)(v46);
  }
  else
  {
    specialized _NativeSet.subtracting<A>(_:)(v46, v43);
  }
  swift_bridgeObjectRelease();
  if (one-time initialization token for log != -1)
    swift_once();
  v47 = type metadata accessor for Logger();
  __swift_project_value_buffer(v47, (uint64_t)log);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v48 = Logger.logObject.getter();
  v49 = static os_log_type_t.default.getter();
  v50 = v49;
  if (os_log_type_enabled(v48, v49))
  {
    v51 = swift_slowAlloc();
    v66 = (id)swift_slowAlloc();
    v68 = (uint64_t)v66;
    *(_DWORD *)v51 = 136315650;
    LODWORD(v63) = v50;
    lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E0CB09C8]);
    v64 = v16;
    swift_bridgeObjectRetain();
    v52 = Set.description.getter();
    v65 = v24;
    v54 = v53;
    swift_bridgeObjectRelease();
    v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v52, v54, &v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 12) = 2080;
    swift_bridgeObjectRetain();
    v55 = Set.description.getter();
    v57 = v56;
    swift_bridgeObjectRelease();
    v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v55, v57, &v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 22) = 2080;
    v58 = v2[2];
    v59 = v2[3];
    swift_bridgeObjectRetain();
    v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v58, v59, &v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v48, (os_log_type_t)v63, "[DataCryptor] Updated cryptor, added-encryptionIDs=%s removed-encryptionIDs=%s topic=%s", (uint8_t *)v51, 0x20u);
    v60 = v66;
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v60, -1, -1);
    MEMORY[0x1AF44981C](v51, -1, -1);

    return (id)((uint64_t (*)(_BYTE *, uint64_t))v65)(v64, v7);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release_n();

    return (id)((uint64_t (*)(_BYTE *, uint64_t))v24)(v16, v7);
  }
}

id GroupSessionDataCryptorProvider.dataCryptor.didset()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id result;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = type metadata accessor for UUID();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(v0[4], sel_encryptionKeyID);
  if (!v8)
  {
    result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v7, 1, 1, v1);
    goto LABEL_6;
  }
  v9 = v8;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v7, v4, v1);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v2 + 56))(v7, 0, 1, v1);
  result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1);
  if ((_DWORD)result == 1)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  (*((void (**)(char *))*v0 + 20))(v7);
  result = objc_msgSend(v0[4], sel_decryptionKeyIDSet);
  if (result)
  {
    v11 = result;
    v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    return (id)(*((uint64_t (**)(uint64_t))*v0 + 25))(v12);
  }
LABEL_7:
  __break(1u);
  return result;
}

_QWORD *GroupSessionDataCryptorProvider.__allocating_init(topic:dataCryptor:refreshEncryptionKeysHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;

  swift_allocObject();
  v10 = specialized GroupSessionDataCryptorProvider.init(topic:dataCryptor:refreshEncryptionKeysHandler:)(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  swift_release();
  return v10;
}

_QWORD *GroupSessionDataCryptorProvider.init(topic:dataCryptor:refreshEncryptionKeysHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5 = specialized GroupSessionDataCryptorProvider.init(topic:dataCryptor:refreshEncryptionKeysHandler:)(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  swift_release();
  return v5;
}

uint64_t GroupSessionDataCryptorProvider.encryptionID.setter(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *, uint64_t);
  uint64_t v8;

  v2 = type metadata accessor for UUID();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, a1, v2);
  swift_retain();
  CurrentValueSubject.send(_:)();
  v6 = *(void (**)(char *, uint64_t))(v3 + 8);
  v6(v5, v2);
  v6(a1, v2);
  return swift_release();
}

uint64_t GroupSessionDataCryptorProvider.decryptionIDSet.setter()
{
  swift_beginAccess();
  swift_retain();
  CurrentValueSubject.send(_:)();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t key path setter for GroupSessionDataCryptorProvider.encryptionID : GroupSessionDataCryptorProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = type metadata accessor for UUID();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 160))(v6);
}

uint64_t GroupSessionDataCryptorProvider.encryptionID.getter()
{
  swift_beginAccess();
  swift_retain();
  CurrentValueSubject.value.getter();
  return swift_release();
}

void (*GroupSessionDataCryptorProvider.encryptionID.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = type metadata accessor for UUID();
  v3[3] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[4] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[5] = malloc(v6);
  v3[6] = malloc(v6);
  swift_beginAccess();
  v3[7] = *(_QWORD *)(v1 + 56);
  swift_retain();
  CurrentValueSubject.value.getter();
  return GroupSessionDataCryptorProvider.encryptionID.modify;
}

void GroupSessionDataCryptorProvider.encryptionID.modify(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void *, uint64_t);

  v2 = *(void **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v4 = *(void **)(*(_QWORD *)a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, void *, uint64_t))(v5 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 40), v3, v6);
    CurrentValueSubject.send(_:)();
    v7 = *(void (**)(void *, uint64_t))(v5 + 8);
    v7(v4, v6);
    swift_release();
    v7(v3, v6);
  }
  else
  {
    CurrentValueSubject.send(_:)();
    (*(void (**)(void *, uint64_t))(v5 + 8))(v3, v6);
    swift_release();
  }
  free(v3);
  free(v4);
  free(v2);
}

uint64_t GroupSessionDataCryptorProvider.$encryptionID.getter()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t GroupSessionDataCryptorProvider.encryptionIDPublisher.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD v8[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.RemoveDuplicates<CurrentValueSubject<UUID, Never>>);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x1E0C80A78](v1);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 176))(v3);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentValueSubject<UUID, Never>);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type CurrentValueSubject<UUID, Never> and conformance CurrentValueSubject<A, B>, &demangling cache variable for type metadata for CurrentValueSubject<UUID, Never>, MEMORY[0x1E0C95FB8]);
  lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E0CB09D0]);
  Publisher<>.removeDuplicates()();
  swift_release();
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type Publishers.RemoveDuplicates<CurrentValueSubject<UUID, Never>> and conformance Publishers.RemoveDuplicates<A>, &demangling cache variable for type metadata for Publishers.RemoveDuplicates<CurrentValueSubject<UUID, Never>>, MEMORY[0x1E0C958E0]);
  v6 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  return v6;
}

uint64_t GroupSessionDataCryptorProvider.decryptionIDSet.getter()
{
  uint64_t v1;

  swift_beginAccess();
  swift_retain();
  CurrentValueSubject.value.getter();
  swift_release();
  return v1;
}

void (*GroupSessionDataCryptorProvider.decryptionIDSet.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  swift_beginAccess();
  v3[5] = *(_QWORD *)(v1 + 64);
  swift_retain();
  CurrentValueSubject.value.getter();
  return PluginAttachmentLedgerTopic.attachments.modify;
}

uint64_t GroupSessionDataCryptorProvider.$decryptionIDSet.getter()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t GroupSessionDataCryptorProvider.decryptionIDSetPublisher.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD v8[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Publishers.RemoveDuplicates<CurrentValueSubject<[UUID], Never>>);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x1E0C80A78](v1);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 216))(v3);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentValueSubject<[UUID], Never>);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type CurrentValueSubject<[UUID], Never> and conformance CurrentValueSubject<A, B>, &demangling cache variable for type metadata for CurrentValueSubject<[UUID], Never>, MEMORY[0x1E0C95FB8]);
  lazy protocol witness table accessor for type [UUID] and conformance <A> [A]();
  Publisher<>.removeDuplicates()();
  swift_release();
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type Publishers.RemoveDuplicates<CurrentValueSubject<[UUID], Never>> and conformance Publishers.RemoveDuplicates<A>, (uint64_t *)&demangling cache variable for type metadata for Publishers.RemoveDuplicates<CurrentValueSubject<[UUID], Never>>, MEMORY[0x1E0C958E0]);
  v6 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  return v6;
}

BOOL GroupSessionDataCryptorProvider.validEncryptionID(data:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined copy of Data._Representation(a1, a2);
  UUID.init(data:)(a1, a2);
  v7 = type metadata accessor for UUID();
  v8 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7) != 1;
  outlined destroy of UUID?((uint64_t)v6, (uint64_t *)&demangling cache variable for type metadata for UUID?);
  return v8;
}

uint64_t GroupSessionDataCryptorProvider.encrypt(data:seqNum:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  void *v6;
  Class isa;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v26[2];

  v4 = v3;
  v26[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = (void *)v4[4];
  swift_unknownObjectRetain();
  isa = Data._bridgeToObjectiveC()().super.isa;
  v26[0] = 0;
  v8 = objc_msgSend(v6, sel_encryptData_seqNum_error_, isa, a3, v26);
  swift_unknownObjectRelease();

  v9 = v26[0];
  if (v8)
  {
    v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  }
  else
  {
    v11 = v9;
    v12 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for log != -1)
      swift_once();
    v13 = type metadata accessor for Logger();
    __swift_project_value_buffer(v13, (uint64_t)log);
    v14 = v12;
    swift_retain();
    v15 = v12;
    swift_retain();
    v16 = Logger.logObject.getter();
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = swift_slowAlloc();
      v19 = (void *)swift_slowAlloc();
      v26[0] = v19;
      *(_DWORD *)v18 = 136315394;
      v20 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      v21 = String.init<A>(reflecting:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, (uint64_t *)v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      *(_WORD *)(v18 + 12) = 2080;
      v23 = v4[2];
      v24 = v4[3];
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, (uint64_t *)v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ACCCC000, v16, v17, "Encryption failure error=%s topic=%s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v19, -1, -1);
      MEMORY[0x1AF44981C](v18, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    return 0;
  }
  return v10;
}

uint64_t GroupSessionDataCryptorProvider.decrypt(data:encryptionID:seqNum:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  _QWORD *v4;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  void *v26;
  Class isa;
  Class v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  id v38;
  _BYTE *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  char v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  os_log_type_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  id v59;
  const char *v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint32_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t);
  char *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  os_log_type_t v74;
  int v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  id v90;
  id v91;
  _BYTE *v92;
  uint64_t v93;
  char *v94;
  os_log_type_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  NSObject *v106;
  os_log_type_t v107;
  int v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  os_log_type_t v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  unint64_t v122;
  _QWORD *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  os_log_type_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  unint64_t v133;
  const char *v134;
  uint64_t v135;
  os_log_type_t v136;
  int v137;
  uint64_t v138;
  unint64_t v139;
  id v140;
  uint64_t v141;
  unint64_t v142;
  _QWORD *v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  unint64_t v148;
  _QWORD *v149;
  _BYTE *v150;
  _BYTE *v151;
  _BYTE *v152;
  char *v154;
  char *v155;
  char *v156;
  char *v157;
  char *v158;
  char *v159;
  char *v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  _QWORD *v165;
  id v166;
  id v167;
  uint64_t v168;
  id v169[3];

  v167 = a4;
  v169[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = type metadata accessor for UUID();
  v163 = *(_QWORD *)(v6 - 8);
  v164 = v6;
  v7 = MEMORY[0x1E0C80A78](v6);
  v161 = (char *)&v154 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v160 = (char *)&v154 - v10;
  v11 = MEMORY[0x1E0C80A78](v9);
  v159 = (char *)&v154 - v12;
  v13 = MEMORY[0x1E0C80A78](v11);
  v158 = (char *)&v154 - v14;
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v154 - v16;
  v18 = MEMORY[0x1E0C80A78](v15);
  v20 = (char *)&v154 - v19;
  v21 = MEMORY[0x1E0C80A78](v18);
  v23 = (char *)&v154 - v22;
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v154 - v24;
  v165 = v4;
  v26 = (void *)v4[4];
  swift_unknownObjectRetain();
  isa = Data._bridgeToObjectiveC()().super.isa;
  v162 = a3;
  v28 = UUID._bridgeToObjectiveC()().super.isa;
  v169[0] = 0;
  v29 = objc_msgSend(v26, sel_decryptData_keyID_seqNum_error_, isa, v28, v167, v169);
  swift_unknownObjectRelease();

  v30 = v169[0];
  if (!v29)
  {
    v32 = v30;
    v154 = v25;
    v155 = v23;
    v156 = v20;
    v157 = v17;
    v34 = v162;
    v33 = v163;
    v36 = v164;
    v35 = v165;
    v37 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    v169[0] = v37;
    v167 = v37;
    v38 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if (swift_dynamicCast())
    {
      v31 = v168;
      lazy protocol witness table accessor for type TopicDecryptionError and conformance TopicDecryptionError();
      swift_allocError();
      *v39 = v31;
      swift_willThrow();
    }
    else
    {
      v166 = (id)_convertErrorToNSError(_:)();
      v40 = objc_msgSend(v166, sel_domain);
      v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v43 = v42;

      if (v41 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v43 == v44)
      {
        swift_bridgeObjectRelease_n();
        v45 = v35;
      }
      else
      {
        v46 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v45 = v35;
        if ((v46 & 1) == 0)
        {
          if (one-time initialization token for log != -1)
            swift_once();
          v65 = type metadata accessor for Logger();
          __swift_project_value_buffer(v65, (uint64_t)log);
          v66 = v33;
          v67 = *(void (**)(char *, uint64_t, uint64_t))(v33 + 16);
          v68 = v161;
          v67(v161, v34, v36);
          v69 = v167;
          v70 = v167;
          swift_retain();
          v71 = v166;
          v72 = v69;
          swift_retain();
          v73 = v71;
          v31 = Logger.logObject.getter();
          v74 = static os_log_type_t.error.getter();
          v75 = v74;
          if (os_log_type_enabled((os_log_t)v31, v74))
          {
            v76 = swift_slowAlloc();
            v166 = (id)swift_slowAlloc();
            v169[0] = v166;
            *(_DWORD *)v76 = 136315906;
            LODWORD(v162) = v75;
            v77 = objc_msgSend(v73, sel_domain);
            v78 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v79 = v167;
            v81 = v80;

            v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v78, v81, (uint64_t *)v169);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();

            swift_bridgeObjectRelease();
            *(_WORD *)(v76 + 12) = 2080;
            swift_getErrorValue();
            v82 = Error.localizedDescription.getter();
            v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v82, v83, (uint64_t *)v169);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();

            *(_WORD *)(v76 + 22) = 2080;
            lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E0CB09F0]);
            v84 = v161;
            v85 = v164;
            v86 = dispatch thunk of CustomStringConvertible.description.getter();
            v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v86, v87, (uint64_t *)v169);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v66 + 8))(v84, v85);
            *(_WORD *)(v76 + 32) = 2080;
            v88 = v165[2];
            v89 = v165[3];
            swift_bridgeObjectRetain();
            v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v88, v89, (uint64_t *)v169);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1ACCCC000, (os_log_t)v31, (os_log_type_t)v162, "[DataCryptor] Unexpected failure, domain=%s error=%s encryptionID=%s topic=%s", (uint8_t *)v76, 0x2Au);
            v90 = v166;
            swift_arrayDestroy();
            MEMORY[0x1AF44981C](v90, -1, -1);
            MEMORY[0x1AF44981C](v76, -1, -1);

          }
          else
          {

            v91 = v167;
            (*(void (**)(char *, uint64_t))(v66 + 8))(v68, v36);

            swift_release_n();
          }
          lazy protocol witness table accessor for type TopicDecryptionError and conformance TopicDecryptionError();
          swift_allocError();
          *v92 = 1;
          swift_willThrow();

          goto LABEL_57;
        }
      }
      v47 = v166;
      v48 = objc_msgSend(v166, sel_code);
      v49 = v34;
      switch((unint64_t)v48)
      {
        case 0uLL:
          if (one-time initialization token for log != -1)
            swift_once();
          v50 = type metadata accessor for Logger();
          __swift_project_value_buffer(v50, (uint64_t)log);
          v51 = v154;
          (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v154, v49, v36);
          swift_retain_n();
          v31 = Logger.logObject.getter();
          v52 = static os_log_type_t.fault.getter();
          v53 = v52;
          if (!os_log_type_enabled((os_log_t)v31, v52))
            goto LABEL_53;
          v54 = swift_slowAlloc();
          v165 = (_QWORD *)swift_slowAlloc();
          v169[0] = v165;
          *(_DWORD *)v54 = 136315394;
          lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E0CB09F0]);
          LODWORD(v162) = v53;
          v55 = dispatch thunk of CustomStringConvertible.description.getter();
          v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v55, v56, (uint64_t *)v169);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v33 + 8))(v51, v36);
          *(_WORD *)(v54 + 12) = 2080;
          v57 = v45[2];
          v58 = v45[3];
          swift_bridgeObjectRetain();
          v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v57, v58, (uint64_t *)v169);
          v59 = v166;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release_n();
          v47 = v59;
          swift_bridgeObjectRelease();
          v60 = "[DataCryptor] Unexpected failure, no-error set, encryptionID=%s topic=%s";
          v61 = v31;
          v62 = v162;
          v63 = (uint8_t *)v54;
          v64 = 22;
          goto LABEL_40;
        case 1uLL:
          if (one-time initialization token for log != -1)
            swift_once();
          v93 = type metadata accessor for Logger();
          __swift_project_value_buffer(v93, (uint64_t)log);
          v94 = v155;
          (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v155, v49, v36);
          swift_retain_n();
          v31 = Logger.logObject.getter();
          v95 = static os_log_type_t.default.getter();
          v96 = v95;
          if (os_log_type_enabled((os_log_t)v31, v95))
          {
            v97 = swift_slowAlloc();
            v165 = (_QWORD *)swift_slowAlloc();
            v169[0] = v165;
            *(_DWORD *)v97 = 136315394;
            lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E0CB09F0]);
            LODWORD(v162) = v96;
            v98 = dispatch thunk of CustomStringConvertible.description.getter();
            v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v98, v99, (uint64_t *)v169);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v33 + 8))(v94, v36);
            *(_WORD *)(v97 + 12) = 2080;
            v100 = v45[2];
            v101 = v45[3];
            swift_bridgeObjectRetain();
            v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v100, v101, (uint64_t *)v169);
            v47 = v166;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1ACCCC000, (os_log_t)v31, (os_log_type_t)v162, "[DataCryptor] Unknown keyID, encryptionID=%s topic=%s", (uint8_t *)v97, 0x16u);
            v102 = v165;
            swift_arrayDestroy();
            MEMORY[0x1AF44981C](v102, -1, -1);
            MEMORY[0x1AF44981C](v97, -1, -1);

          }
          else
          {
            (*(void (**)(char *, uint64_t))(v33 + 8))(v94, v36);

            swift_release_n();
          }
          lazy protocol witness table accessor for type TopicDecryptionError and conformance TopicDecryptionError();
          swift_allocError();
          *v151 = 0;
          goto LABEL_56;
        case 2uLL:
          if (one-time initialization token for log != -1)
            swift_once();
          v103 = type metadata accessor for Logger();
          __swift_project_value_buffer(v103, (uint64_t)log);
          v104 = v156;
          v105 = v49;
          v31 = v36;
          (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v156, v105, v36);
          swift_retain_n();
          v106 = Logger.logObject.getter();
          v107 = static os_log_type_t.fault.getter();
          v108 = v107;
          if (os_log_type_enabled(v106, v107))
          {
            v109 = swift_slowAlloc();
            v165 = (_QWORD *)swift_slowAlloc();
            v169[0] = v165;
            *(_DWORD *)v109 = 136315394;
            lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E0CB09F0]);
            LODWORD(v162) = v108;
            v110 = dispatch thunk of CustomStringConvertible.description.getter();
            v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v110, v111, (uint64_t *)v169);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v33 + 8))(v104, v31);
            *(_WORD *)(v109 + 12) = 2080;
            v113 = v45[2];
            v112 = v45[3];
            swift_bridgeObjectRetain();
            v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v113, v112, (uint64_t *)v169);
            v47 = v166;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1ACCCC000, v106, (os_log_type_t)v162, "[DataCryptor] CommonCryptorError, encryptionID=%s topic=%s", (uint8_t *)v109, 0x16u);
            v31 = (uint64_t)v165;
            swift_arrayDestroy();
            MEMORY[0x1AF44981C](v31, -1, -1);
            MEMORY[0x1AF44981C](v109, -1, -1);

            goto LABEL_55;
          }
          (*(void (**)(char *, uint64_t))(v33 + 8))(v104, v36);

          goto LABEL_54;
        case 3uLL:
          if (one-time initialization token for log != -1)
            swift_once();
          v114 = type metadata accessor for Logger();
          __swift_project_value_buffer(v114, (uint64_t)log);
          v51 = v157;
          v115 = v36;
          (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v157, v49, v36);
          swift_retain_n();
          v31 = Logger.logObject.getter();
          v116 = static os_log_type_t.fault.getter();
          v117 = v116;
          if (!os_log_type_enabled((os_log_t)v31, v116))
            goto LABEL_53;
          v118 = swift_slowAlloc();
          v165 = (_QWORD *)swift_slowAlloc();
          v169[0] = v165;
          *(_DWORD *)v118 = 136315394;
          lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E0CB09F0]);
          LODWORD(v162) = v117;
          v119 = dispatch thunk of CustomStringConvertible.description.getter();
          v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v119, v120, (uint64_t *)v169);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v33 + 8))(v51, v115);
          *(_WORD *)(v118 + 12) = 2080;
          v121 = v45[2];
          v122 = v45[3];
          swift_bridgeObjectRetain();
          v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v121, v122, (uint64_t *)v169);
          v47 = v166;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1ACCCC000, (os_log_t)v31, (os_log_type_t)v162, "[DataCryptor] Authentication failed, encryptionID=%s topic=%s", (uint8_t *)v118, 0x16u);
          v123 = v165;
          swift_arrayDestroy();
          MEMORY[0x1AF44981C](v123, -1, -1);
          v124 = v118;
          goto LABEL_41;
        case 4uLL:
          if (one-time initialization token for log != -1)
            swift_once();
          v125 = type metadata accessor for Logger();
          __swift_project_value_buffer(v125, (uint64_t)log);
          v126 = v158;
          v127 = v36;
          (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v158, v49, v36);
          swift_retain_n();
          v31 = Logger.logObject.getter();
          v128 = static os_log_type_t.fault.getter();
          if (!os_log_type_enabled((os_log_t)v31, v128))
            goto LABEL_48;
          v129 = swift_slowAlloc();
          v165 = (_QWORD *)swift_slowAlloc();
          v169[0] = v165;
          *(_DWORD *)v129 = 136315394;
          lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E0CB09F0]);
          v130 = dispatch thunk of CustomStringConvertible.description.getter();
          v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v130, v131, (uint64_t *)v169);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v163 + 8))(v126, v127);
          *(_WORD *)(v129 + 12) = 2080;
          v132 = v45[2];
          v133 = v45[3];
          swift_bridgeObjectRetain();
          v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v132, v133, (uint64_t *)v169);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release_n();
          swift_bridgeObjectRelease();
          v134 = "[DataCryptor] Insufficient size, encryptionID=%s topic=%s";
          goto LABEL_46;
        case 6uLL:
          if (one-time initialization token for log != -1)
            swift_once();
          v144 = type metadata accessor for Logger();
          __swift_project_value_buffer(v144, (uint64_t)log);
          v126 = v159;
          v127 = v36;
          (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v159, v49, v36);
          swift_retain_n();
          v31 = Logger.logObject.getter();
          v128 = static os_log_type_t.fault.getter();
          if (os_log_type_enabled((os_log_t)v31, v128))
          {
            v129 = swift_slowAlloc();
            v165 = (_QWORD *)swift_slowAlloc();
            v169[0] = v165;
            *(_DWORD *)v129 = 136315394;
            lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E0CB09F0]);
            v145 = dispatch thunk of CustomStringConvertible.description.getter();
            v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v145, v146, (uint64_t *)v169);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v163 + 8))(v126, v127);
            *(_WORD *)(v129 + 12) = 2080;
            v147 = v45[2];
            v148 = v45[3];
            swift_bridgeObjectRetain();
            v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v147, v148, (uint64_t *)v169);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release_n();
            swift_bridgeObjectRelease();
            v134 = "[DataCryptor] Unknown version, encryptionID=%s topic=%s";
LABEL_46:
            _os_log_impl(&dword_1ACCCC000, (os_log_t)v31, v128, v134, (uint8_t *)v129, 0x16u);
            v149 = v165;
            swift_arrayDestroy();
            MEMORY[0x1AF44981C](v149, -1, -1);
            MEMORY[0x1AF44981C](v129, -1, -1);

          }
          else
          {
LABEL_48:
            (*(void (**)(char *, uint64_t))(v33 + 8))(v126, v127);

            swift_release_n();
          }
          lazy protocol witness table accessor for type TopicDecryptionError and conformance TopicDecryptionError();
          swift_allocError();
          *v150 = 1;
          swift_willThrow();

          break;
        default:
          if (one-time initialization token for log != -1)
            swift_once();
          v135 = type metadata accessor for Logger();
          __swift_project_value_buffer(v135, (uint64_t)log);
          v51 = v160;
          (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v160, v49, v36);
          swift_retain_n();
          v31 = Logger.logObject.getter();
          v136 = static os_log_type_t.fault.getter();
          v137 = v136;
          if (os_log_type_enabled((os_log_t)v31, v136))
          {
            v54 = swift_slowAlloc();
            v165 = (_QWORD *)swift_slowAlloc();
            v168 = (uint64_t)v48;
            v169[0] = v165;
            *(_DWORD *)v54 = 134218498;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *(_WORD *)(v54 + 12) = 2080;
            lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E0CB09F0]);
            LODWORD(v162) = v137;
            v138 = dispatch thunk of CustomStringConvertible.description.getter();
            v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v138, v139, (uint64_t *)v169);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v33 + 8))(v51, v36);
            *(_WORD *)(v54 + 22) = 2080;
            v140 = v166;
            v141 = v45[2];
            v142 = v45[3];
            swift_bridgeObjectRetain();
            v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v141, v142, (uint64_t *)v169);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            v47 = v140;
            swift_release_n();
            swift_bridgeObjectRelease();
            v60 = "[DataCryptor] Unexpected error-code, code=%ld encryptionID=%s topic=%s";
            v61 = v31;
            v62 = v162;
            v63 = (uint8_t *)v54;
            v64 = 32;
LABEL_40:
            _os_log_impl(&dword_1ACCCC000, v61, v62, v60, v63, v64);
            v143 = v165;
            swift_arrayDestroy();
            MEMORY[0x1AF44981C](v143, -1, -1);
            v124 = v54;
LABEL_41:
            MEMORY[0x1AF44981C](v124, -1, -1);

          }
          else
          {
LABEL_53:
            (*(void (**)(char *, uint64_t))(v33 + 8))(v51, v36);

LABEL_54:
            swift_release_n();
          }
LABEL_55:
          lazy protocol witness table accessor for type TopicDecryptionError and conformance TopicDecryptionError();
          swift_allocError();
          *v152 = 1;
LABEL_56:
          swift_willThrow();

          break;
      }
    }
LABEL_57:

    return v31;
  }
  v31 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v31;
}

void GroupSessionDataCryptorProvider.refresh(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _OWORD v21[2];
  __int128 v22;
  uint64_t v23;
  id v24[4];
  uint64_t v25;
  uint64_t v26[5];

  v2 = v1;
  outlined init with copy of Any(a1, (uint64_t)v26);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CPDataCryptor);
  if (swift_dynamicCast())
  {
    if ((objc_msgSend(v24[0], sel_isEqual_, *(_QWORD *)(v2 + 32)) & 1) == 0)
    {
      GroupSessionDataCryptorProvider.dataCryptor.willset(v24[0]);
      *(id *)(v2 + 32) = v24[0];
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      GroupSessionDataCryptorProvider.dataCryptor.didset();
      swift_unknownObjectRelease();
      return;
    }
    if (one-time initialization token for log != -1)
      swift_once();
    v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)log);
    swift_retain();
    v5 = Logger.logObject.getter();
    v6 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v5, v6))
    {

      swift_unknownObjectRelease();
      swift_release();
      return;
    }
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v26[0] = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = *(_QWORD *)(v2 + 16);
    v10 = *(_QWORD *)(v2 + 24);
    swift_bridgeObjectRetain();
    v24[0] = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v5, v6, "[DataCryptor] Not refreshing cryptor since it's equal to the current cryptor, topic=%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v8, -1, -1);
    MEMORY[0x1AF44981C](v7, -1, -1);
    swift_unknownObjectRelease();
  }
  else
  {
    if (one-time initialization token for log != -1)
      swift_once();
    v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)log);
    outlined init with copy of Any(a1, (uint64_t)v26);
    swift_retain_n();
    v5 = Logger.logObject.getter();
    v12 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v5, v12))
    {
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);

      swift_release_n();
      return;
    }
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v25 = v14;
    *(_DWORD *)v13 = 136315394;
    outlined init with copy of Any((uint64_t)v26, (uint64_t)v24);
    outlined init with copy of Any?((uint64_t)v24, (uint64_t)&v22);
    if (v23)
    {
      outlined init with take of Any(&v22, v21);
      outlined init with copy of Any((uint64_t)v21, (uint64_t)&v20);
      v15 = String.init<A>(reflecting:)();
      v17 = v16;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
    }
    else
    {
      v17 = 0xE300000000000000;
      v15 = 7104878;
    }
    outlined destroy of UUID?((uint64_t)v24, (uint64_t *)&demangling cache variable for type metadata for Any?);
    v24[0] = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v17, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
    *(_WORD *)(v13 + 12) = 2080;
    v18 = *(_QWORD *)(v2 + 16);
    v19 = *(_QWORD *)(v2 + 24);
    swift_bridgeObjectRetain();
    v24[0] = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v19, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v14, -1, -1);
    MEMORY[0x1AF44981C](v13, -1, -1);
  }

}

Swift::Void __swiftcall GroupSessionDataCryptorProvider.refreshEncryptionIDSet(participantIDs:)(Swift::OpaquePointer_optional participantIDs)
{
  uint64_t v1;
  uint64_t v2;
  void *rawValue;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v2 = v1;
  rawValue = participantIDs.value._rawValue;
  if (one-time initialization token for log != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)log);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v14 = v8;
    *(_DWORD *)v7 = 136315394;
    if (rawValue)
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt64]);
      v9 = String.init<A>(reflecting:)();
      v11 = v10;
    }
    else
    {
      v11 = 0xE300000000000000;
      v9 = 7104878;
    }
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v11, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    v12 = *(_QWORD *)(v2 + 16);
    v13 = *(_QWORD *)(v2 + 24);
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v5, v6, "[DataCryptor] refresh-requested, participantIDs=%s topic=%s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v8, -1, -1);
    MEMORY[0x1AF44981C](v7, -1, -1);

  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(void *))(v2 + 40))(rawValue);
}

uint64_t GroupSessionDataCryptorProvider.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t GroupSessionDataCryptorProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for TopicCryptorProvider.encryptionID.getter in conformance GroupSessionDataCryptorProvider()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 152))();
}

uint64_t protocol witness for TopicCryptorProvider.decryptionIDSetPublisher.getter in conformance GroupSessionDataCryptorProvider()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 224))();
}

uint64_t protocol witness for TopicCryptorProvider.validEncryptionID(data:) in conformance GroupSessionDataCryptorProvider()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 232))() & 1;
}

uint64_t protocol witness for TopicCryptorProvider.refresh(with:) in conformance GroupSessionDataCryptorProvider()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 256))();
}

uint64_t protocol witness for TopicCryptorProvider.decrypt(data:encryptionID:seqNum:) in conformance GroupSessionDataCryptorProvider()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 248))();
}

uint64_t protocol witness for TopicCryptorProvider.refreshEncryptionIDSet(participantIDs:) in conformance GroupSessionDataCryptorProvider()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 264))();
}

_QWORD *specialized GroupSessionDataCryptorProvider.init(topic:dataCryptor:refreshEncryptionKeysHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  void *v22;
  _QWORD *result;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;

  v6 = v5;
  v12 = type metadata accessor for UUID();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v30 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v29 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  swift_unknownObjectRetain();
  swift_retain();
  v21 = objc_msgSend(a3, sel_encryptionKeyID);
  if (!v21)
  {
    result = (_QWORD *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v20, 1, 1, v12);
    goto LABEL_6;
  }
  v22 = v21;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v20, v17, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v20, 0, 1, v12);
  result = (_QWORD *)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v20, 1, v12);
  if ((_DWORD)result == 1)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  swift_beginAccess();
  v24 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v24(v17, v20, v12);
  v24(v30, v17, v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentValueSubject<UUID, Never>);
  swift_allocObject();
  v25 = CurrentValueSubject.init(_:)();
  v26 = *(void (**)(char *, uint64_t))(v13 + 8);
  v26(v17, v12);
  v6[7] = v25;
  v26(v20, v12);
  swift_endAccess();
  result = objc_msgSend(a3, sel_decryptionKeyIDSet);
  if (result)
  {
    v27 = result;
    v28 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_beginAccess();
    v31 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentValueSubject<[UUID], Never>);
    swift_allocObject();
    v6[8] = CurrentValueSubject.init(_:)();
    swift_endAccess();
    return v6;
  }
LABEL_7:
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type [UUID] and conformance <A> [A]()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = lazy protocol witness table cache variable for type [UUID] and conformance <A> [A];
  if (!lazy protocol witness table cache variable for type [UUID] and conformance <A> [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [UUID]);
    v2 = lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E0CB09D0]);
    result = MEMORY[0x1AF44972C](MEMORY[0x1E0DEAF30], v1, &v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [UUID] and conformance <A> [A]);
  }
  return result;
}

uint64_t sub_1ACF4A2B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 152))();
}

uint64_t sub_1ACF4A2E4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 192))();
  *a2 = result;
  return result;
}

uint64_t sub_1ACF4A314(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 200);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t type metadata accessor for GroupSessionDataCryptorProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for GroupSessionDataCryptorProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.__allocating_init(topic:dataCryptor:refreshEncryptionKeysHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.encryptionID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.encryptionID.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.encryptionID.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.$encryptionID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.encryptionIDPublisher.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.decryptionIDSet.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.decryptionIDSet.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.decryptionIDSet.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.$decryptionIDSet.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.decryptionIDSetPublisher.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.validEncryptionID(data:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.encrypt(data:seqNum:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.decrypt(data:encryptionID:seqNum:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.refresh(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of GroupSessionDataCryptorProvider.refreshEncryptionIDSet(participantIDs:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

id DisplayLayoutAppVisibilityMonitor.appPolicyManager.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t DisplayLayoutAppVisibilityMonitor.applicationController.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of UserNotificationCenter(v1 + 24, a1);
}

uint64_t DisplayLayoutAppVisibilityMonitor.__allocating_init(appPolicyManager:applicationController:)(void *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  DisplayLayoutAppVisibilityMonitor.init(appPolicyManager:applicationController:)(a1, a2);
  return v4;
}

_QWORD *DisplayLayoutAppVisibilityMonitor.init(appPolicyManager:applicationController:)(void *a1, uint64_t a2)
{
  _QWORD *v2;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[6];

  v2[8] = MEMORY[0x1E0DEE9E8];
  v2[9] = 0;
  v2[2] = a1;
  outlined init with copy of UserNotificationCenter(a2, (uint64_t)(v2 + 3));
  v5 = (void *)objc_opt_self();
  v6 = a1;
  v7 = objc_msgSend(v5, sel_configurationForDefaultMainDisplayMonitor);
  v8 = swift_allocObject();
  swift_weakInit();
  v13[4] = partial apply for closure #1 in DisplayLayoutAppVisibilityMonitor.init(appPolicyManager:applicationController:);
  v13[5] = v8;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed FBSDisplayLayoutMonitor, @guaranteed FBSDisplayLayout?, @guaranteed FBSDisplayLayoutTransitionContext?) -> ();
  v13[3] = &block_descriptor_44;
  v9 = _Block_copy(v13);
  swift_release();
  objc_msgSend(v7, sel_setTransitionHandler_, v9);
  _Block_release(v9);
  v10 = objc_msgSend((id)objc_opt_self(), sel_monitorWithConfiguration_, v7);

  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  v11 = (void *)v2[9];
  v2[9] = v10;

  return v2;
}

uint64_t sub_1ACF4A5F8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t closure #1 in DisplayLayoutAppVisibilityMonitor.init(appPolicyManager:applicationController:)(uint64_t a1, void *a2)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    DisplayLayoutAppVisibilityMonitor.handleDisplayLayout(_:)(a2);
    return swift_release();
  }
  return result;
}

uint64_t partial apply for closure #1 in DisplayLayoutAppVisibilityMonitor.init(appPolicyManager:applicationController:)(uint64_t a1, void *a2)
{
  return closure #1 in DisplayLayoutAppVisibilityMonitor.init(appPolicyManager:applicationController:)(a1, a2);
}

void DisplayLayoutAppVisibilityMonitor.handleDisplayLayout(_:)(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  id v3;
  id v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
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
  NSObject *oslog;
  uint64_t v30;

  if (a1)
  {
    v2 = v1;
    v3 = a1;
    v4 = objc_msgSend(v3, sel_elements);
    type metadata accessor for FBSDisplayLayoutElement();
    v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_retain();
    v6 = specialized Sequence.compactMap<A>(_:)(v5);
    swift_bridgeObjectRelease();
    swift_release();
    v7 = specialized Set.init<A>(_:)((uint64_t)v6);
    swift_bridgeObjectRelease();
    v8 = *(_QWORD *)(v7 + 16);
    v9 = *(_QWORD *)(v2[8] + 16);
    if (v8)
    {
      if (v9 > v8 >> 3)
      {
        swift_bridgeObjectRetain();
        v10 = swift_bridgeObjectRetain();
        v11 = specialized _NativeSet.subtracting<A>(_:)(v10, v7);
        swift_bridgeObjectRelease();
LABEL_13:
        v20 = v2[8];
        if (*(_QWORD *)(v7 + 16) <= *(_QWORD *)(v20 + 16) >> 3)
        {
          v30 = v2[8];
          swift_bridgeObjectRetain();
          specialized Set._subtract<A>(_:)(v7);
          v21 = v30;
          if (*(_QWORD *)(v11 + 16))
            goto LABEL_15;
        }
        else
        {
          swift_bridgeObjectRetain();
          v21 = specialized _NativeSet.subtracting<A>(_:)(v7, v20);
          if (*(_QWORD *)(v11 + 16))
          {
LABEL_15:
            swift_bridgeObjectRelease();
            swift_retain();
            specialized Sequence.forEach(_:)(v11, v2);
            swift_bridgeObjectRelease();
            swift_release();
LABEL_22:
            v2[8] = v7;

            swift_bridgeObjectRelease();
            return;
          }
        }
        v22 = *(_QWORD *)(v21 + 16);
        swift_bridgeObjectRelease();
        if (v22)
        {
          v23 = *(_QWORD *)(v21 + 16);
          swift_bridgeObjectRelease();
          if (!v23)
            goto LABEL_22;
          v24 = specialized Collection.first.getter(v7);
          if (!v25)
            goto LABEL_22;
          v26 = v24;
          v27 = v25;
          v28 = specialized AppVisibilityMonitor.applicationType(forBundleIdentifier:)();
          specialized AppVisibilityMonitor.handleAppVisibilityUpdate(forBundleIdentifier:applicationType:)(v26, v27, v28);
        }
LABEL_21:
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
    else if (v9)
    {
      v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v17 = v16;
      v18 = specialized AppVisibilityMonitor.applicationType(forBundleIdentifier:)();
      specialized AppVisibilityMonitor.handleAppVisibilityUpdate(forBundleIdentifier:applicationType:)(v15, v17, v18);
      goto LABEL_21;
    }
    swift_bridgeObjectRetain();
    v19 = swift_bridgeObjectRetain();
    specialized Set._subtract<A>(_:)(v19);
    swift_bridgeObjectRelease();
    v11 = v7;
    goto LABEL_13;
  }
  if (one-time initialization token for default != -1)
    swift_once();
  v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Log.default);
  oslog = Logger.logObject.getter();
  v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1ACCCC000, oslog, v13, "DisplayLayoutAppVisibilityMonitor: Skipping since no display layout was provided", v14, 2u);
    MEMORY[0x1AF44981C](v14, -1, -1);
  }

}

void thunk for @escaping @callee_guaranteed (@guaranteed FBSDisplayLayoutMonitor, @guaranteed FBSDisplayLayout?, @guaranteed FBSDisplayLayoutTransitionContext?) -> ()(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (*v7)(id, void *, void *);
  id v8;
  id v9;
  id v10;

  v7 = *(void (**)(id, void *, void *))(a1 + 32);
  swift_retain();
  v10 = a2;
  v8 = a3;
  v9 = a4;
  v7(v10, a3, a4);
  swift_release();

}

uint64_t block_destroy_helper_42()
{
  return swift_release();
}

void *DisplayLayoutAppVisibilityMonitor.deinit()
{
  uint64_t v0;
  void *result;

  result = *(void **)(v0 + 72);
  if (result)
  {
    objc_msgSend(result, sel_invalidate);

    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
    swift_bridgeObjectRelease();

    return (void *)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall DisplayLayoutAppVisibilityMonitor.invalidate()()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 72);
  if (v1)
    objc_msgSend(v1, sel_invalidate);
  else
    __break(1u);
}

void *DisplayLayoutAppVisibilityMonitor.__deallocating_deinit()
{
  uint64_t v0;
  void *result;

  result = *(void **)(v0 + 72);
  if (result)
  {
    objc_msgSend(result, sel_invalidate);

    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
    swift_bridgeObjectRelease();

    return (void *)swift_deallocClassInstance();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t protocol witness for AppVisibilityMonitor.applicationController.getter in conformance DisplayLayoutAppVisibilityMonitor@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of UserNotificationCenter(v1 + 24, a1);
}

id protocol witness for AppVisibilityMonitor.invalidate() in conformance DisplayLayoutAppVisibilityMonitor()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + 72);
  if (result)
    return objc_msgSend(result, sel_invalidate);
  __break(1u);
  return result;
}

uint64_t type metadata accessor for DisplayLayoutAppVisibilityMonitor()
{
  return objc_opt_self();
}

uint64_t method lookup function for DisplayLayoutAppVisibilityMonitor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DisplayLayoutAppVisibilityMonitor.__allocating_init(appPolicyManager:applicationController:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

unint64_t type metadata accessor for FBSDisplayLayoutElement()
{
  unint64_t result;

  result = lazy cache variable for type metadata for FBSDisplayLayoutElement;
  if (!lazy cache variable for type metadata for FBSDisplayLayoutElement)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for FBSDisplayLayoutElement);
  }
  return result;
}

void specialized Set._subtract<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  if ((*(_QWORD *)v1 & 0xC000000000000001) != 0)
  {
    if (!__CocoaSet.count.getter())
      return;
LABEL_5:
    if ((a1 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      __CocoaSet.makeIterator()();
      type metadata accessor for AddressableMember();
      lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type AddressableMember and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for AddressableMember, MEMORY[0x1E0DEFCF8]);
      Set.Iterator.init(_cocoa:)();
      a1 = v20;
      v18 = v21;
      v3 = v22;
      v4 = v23;
      v5 = v24;
    }
    else
    {
      v6 = -1 << *(_BYTE *)(a1 + 32);
      v18 = a1 + 56;
      v3 = ~v6;
      v7 = -v6;
      if (v7 < 64)
        v8 = ~(-1 << v7);
      else
        v8 = -1;
      v5 = v8 & *(_QWORD *)(a1 + 56);
      swift_bridgeObjectRetain();
      v4 = 0;
    }
    v9 = (unint64_t)(v3 + 64) >> 6;
    if (a1 < 0)
      goto LABEL_14;
    while (1)
    {
      if (v5)
      {
        v10 = (v5 - 1) & v5;
        v11 = __clz(__rbit64(v5)) | (v4 << 6);
        v12 = v4;
      }
      else
      {
        v14 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          return;
        }
        if (v14 >= v9)
          goto LABEL_36;
        v15 = *(_QWORD *)(v18 + 8 * v14);
        v12 = v4 + 1;
        if (!v15)
        {
          v12 = v4 + 2;
          if (v4 + 2 >= v9)
            goto LABEL_36;
          v15 = *(_QWORD *)(v18 + 8 * v12);
          if (!v15)
          {
            v12 = v4 + 3;
            if (v4 + 3 >= v9)
              goto LABEL_36;
            v15 = *(_QWORD *)(v18 + 8 * v12);
            if (!v15)
            {
              v12 = v4 + 4;
              if (v4 + 4 >= v9)
                goto LABEL_36;
              v15 = *(_QWORD *)(v18 + 8 * v12);
              if (!v15)
              {
                v12 = v4 + 5;
                if (v4 + 5 >= v9)
                  goto LABEL_36;
                v15 = *(_QWORD *)(v18 + 8 * v12);
                if (!v15)
                {
                  v16 = v4 + 6;
                  while (v9 != v16)
                  {
                    v15 = *(_QWORD *)(v18 + 8 * v16++);
                    if (v15)
                    {
                      v12 = v16 - 1;
                      goto LABEL_32;
                    }
                  }
LABEL_36:
                  outlined consume of [String : ()].Iterator._Variant();
                  return;
                }
              }
            }
          }
        }
LABEL_32:
        v10 = (v15 - 1) & v15;
        v11 = __clz(__rbit64(v15)) + (v12 << 6);
      }
      v13 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v11);
      if (!v13)
        goto LABEL_36;
      while (1)
      {
        v17 = (void *)specialized Set._Variant.remove(_:)(v13);

        v4 = v12;
        v5 = v10;
        if ((a1 & 0x8000000000000000) == 0)
          break;
LABEL_14:
        if (__CocoaSet.Iterator.next()())
        {
          type metadata accessor for AddressableMember();
          swift_unknownObjectRetain();
          swift_dynamicCast();
          v13 = v19;
          swift_unknownObjectRelease();
          v12 = v4;
          v10 = v5;
          if (v19)
            continue;
        }
        goto LABEL_36;
      }
    }
  }
  if (*(_QWORD *)(*(_QWORD *)v1 + 16))
    goto LABEL_5;
}

uint64_t specialized Set._subtract<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  int64_t v25;

  v3 = type metadata accessor for UUID();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v24 - v12;
  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v14 = a1 + 56;
  v15 = 1 << *(_BYTE *)(a1 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(a1 + 56);
  v25 = (unint64_t)(v15 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v18 = 0;
  if (!v17)
    goto LABEL_6;
LABEL_5:
  v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (i = v19 | (v18 << 6); ; i = __clz(__rbit64(v22)) + (v18 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v13, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v4 + 72) * i, v3);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v13, 0, 1, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v13, 1, v3) == 1)
      return swift_release();
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v13, v3);
    specialized Set._Variant.remove(_:)((uint64_t)v6, (uint64_t)v10);
    outlined destroy of UUID?((uint64_t)v10);
    result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if (v17)
      goto LABEL_5;
LABEL_6:
    v21 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v21 >= v25)
      goto LABEL_25;
    v22 = *(_QWORD *)(v14 + 8 * v21);
    ++v18;
    if (!v22)
    {
      v18 = v21 + 1;
      if (v21 + 1 >= v25)
        goto LABEL_25;
      v22 = *(_QWORD *)(v14 + 8 * v18);
      if (!v22)
      {
        v18 = v21 + 2;
        if (v21 + 2 >= v25)
          goto LABEL_25;
        v22 = *(_QWORD *)(v14 + 8 * v18);
        if (!v22)
        {
          v18 = v21 + 3;
          if (v21 + 3 >= v25)
            goto LABEL_25;
          v22 = *(_QWORD *)(v14 + 8 * v18);
          if (!v22)
            break;
        }
      }
    }
LABEL_21:
    v17 = (v22 - 1) & v22;
  }
  v23 = v21 + 4;
  if (v23 >= v25)
  {
LABEL_25:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v13, 1, 1, v3);
    return swift_release();
  }
  v22 = *(_QWORD *)(v14 + 8 * v23);
  if (v22)
  {
    v18 = v23;
    goto LABEL_21;
  }
  while (1)
  {
    v18 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v18 >= v25)
      goto LABEL_25;
    v22 = *(_QWORD *)(v14 + 8 * v18);
    ++v23;
    if (v22)
      goto LABEL_21;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t specialized Set._subtract<A>(_:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 64;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v14 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      v8 = v14 + 1;
      if (v14 + 1 >= v7)
        return swift_release();
      v15 = *(_QWORD *)(v3 + 8 * v8);
      if (!v15)
      {
        v8 = v14 + 2;
        if (v14 + 2 >= v7)
          return swift_release();
        v15 = *(_QWORD *)(v3 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 3;
          if (v14 + 3 >= v7)
            return swift_release();
          v15 = *(_QWORD *)(v3 + 8 * v8);
          if (!v15)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    specialized Set._Variant.remove(_:)(v12, v13);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v7)
    return swift_release();
  v15 = *(_QWORD *)(v3 + 8 * v16);
  if (v15)
  {
    v8 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v8);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v14 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      v8 = v14 + 1;
      if (v14 + 1 >= v7)
        return swift_release();
      v15 = *(_QWORD *)(v3 + 8 * v8);
      if (!v15)
      {
        v8 = v14 + 2;
        if (v14 + 2 >= v7)
          return swift_release();
        v15 = *(_QWORD *)(v3 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 3;
          if (v14 + 3 >= v7)
            return swift_release();
          v15 = *(_QWORD *)(v3 + 8 * v8);
          if (!v15)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    specialized Set._Variant.remove(_:)(v12, v13);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v7)
    return swift_release();
  v15 = *(_QWORD *)(v3 + 8 * v16);
  if (v15)
  {
    v8 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v8);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.subtracting<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  Swift::Int v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  id v23;
  char v24;
  int64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  int64_t v29;
  uint64_t isStackAllocationSafe;
  char v31;
  unint64_t v32;
  size_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int64_t v49;
  unint64_t v50;
  uint64_t v51;

  v2 = a2;
  v51 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for AddressableMember();
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type AddressableMember and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for AddressableMember, MEMORY[0x1E0DEFCF8]);
    Set.Iterator.init(_cocoa:)();
    v3 = v46;
    v4 = v47;
    v6 = v48;
    v5 = v49;
    v7 = v50;
  }
  else
  {
    v8 = -1 << *(_BYTE *)(a1 + 32);
    v4 = a1 + 56;
    v6 = ~v8;
    v9 = -v8;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v7 = v10 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v5 = 0;
  }
  v41 = v3;
  v42 = v4;
  v43 = v6;
  v44 = v5;
  v45 = v7;
  v11 = v2 + 56;
  while (1)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v7)
      {
        v12 = (v7 - 1) & v7;
        v13 = __clz(__rbit64(v7)) | (v5 << 6);
LABEL_14:
        v14 = *(void **)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v15 = v14;
        goto LABEL_15;
      }
      v25 = v5 + 1;
      if (__OFADD__(v5, 1))
        __break(1u);
      v26 = (unint64_t)(v6 + 64) >> 6;
      if (v25 >= v26)
      {
        v14 = 0;
        v12 = 0;
        goto LABEL_15;
      }
      v27 = *(_QWORD *)(v42 + 8 * v25);
      if (v27)
      {
LABEL_28:
        v12 = (v27 - 1) & v27;
        v13 = __clz(__rbit64(v27)) + (v25 << 6);
        v5 = v25;
        goto LABEL_14;
      }
      v28 = v5 + 2;
      if (v5 + 2 >= v26)
        goto LABEL_44;
      v27 = *(_QWORD *)(v42 + 8 * v28);
      if (v27)
      {
LABEL_32:
        v25 = v28;
        goto LABEL_28;
      }
      if (v5 + 3 < v26)
      {
        v27 = *(_QWORD *)(v42 + 8 * (v5 + 3));
        if (v27)
        {
          v25 = v5 + 3;
          goto LABEL_28;
        }
        v28 = v5 + 4;
        if (v5 + 4 >= v26)
        {
          v14 = 0;
          v12 = 0;
          v5 += 3;
LABEL_15:
          v44 = v5;
          v45 = v12;
          if (!v14)
            goto LABEL_53;
          goto LABEL_19;
        }
        v27 = *(_QWORD *)(v42 + 8 * v28);
        if (v27)
          goto LABEL_32;
        v25 = v5 + 5;
        if (v5 + 5 < v26)
        {
          v27 = *(_QWORD *)(v42 + 8 * v25);
          if (v27)
            goto LABEL_28;
          v25 = v26 - 1;
          v29 = v5 + 6;
          while (v26 != v29)
          {
            v27 = *(_QWORD *)(v42 + 8 * v29++);
            if (v27)
            {
              v25 = v29 - 1;
              goto LABEL_28;
            }
          }
LABEL_44:
          v14 = 0;
          v12 = 0;
          v5 = v25;
          goto LABEL_15;
        }
      }
      v14 = 0;
      v12 = 0;
      v5 = v28;
      goto LABEL_15;
    }
    v16 = __CocoaSet.Iterator.next()();
    if (!v16
      || (v39 = v16,
          type metadata accessor for AddressableMember(),
          swift_unknownObjectRetain(),
          swift_dynamicCast(),
          v14 = v40,
          swift_unknownObjectRelease(),
          !v40))
    {
LABEL_53:
      outlined consume of [String : ()].Iterator._Variant();
      return v2;
    }
LABEL_19:
    v17 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
    v18 = -1 << *(_BYTE *)(v2 + 32);
    v19 = v17 & ~v18;
    if (((*(_QWORD *)(v11 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
      goto LABEL_10;
    type metadata accessor for AddressableMember();
    v20 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v19);
    v21 = static NSObject.== infix(_:_:)();

    if ((v21 & 1) != 0)
      break;
    v22 = ~v18;
    while (1)
    {
      v19 = (v19 + 1) & v22;
      if (((*(_QWORD *)(v11 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
        break;
      v23 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v19);
      v24 = static NSObject.== infix(_:_:)();

      if ((v24 & 1) != 0)
        goto LABEL_47;
    }
LABEL_10:

    v3 = v41;
    v6 = v43;
    v5 = v44;
    v7 = v45;
  }
LABEL_47:

  v31 = *(_BYTE *)(v2 + 32);
  v32 = (unint64_t)((1 << v31) + 63) >> 6;
  v33 = 8 * v32;
  if ((v31 & 0x3Fu) < 0xE
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    memcpy((char *)&v39 - ((v33 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v33);
    specialized closure #1 in _NativeSet.subtracting<A>(_:)((unint64_t *)((char *)&v39 - ((v33 + 15) & 0x3FFFFFFFFFFFFFF0)), v32, v2, v19, &v41);
    v35 = v34;
    swift_release();
    outlined consume of [String : ()].Iterator._Variant();
  }
  else
  {
    v36 = (void *)swift_slowAlloc();
    memcpy(v36, (const void *)(v2 + 56), v33);
    specialized closure #1 in _NativeSet.subtracting<A>(_:)((unint64_t *)v36, v32, v2, v19, &v41);
    v35 = v37;
    swift_release();
    outlined consume of [String : ()].Iterator._Variant();
    MEMORY[0x1AF44981C](v36, -1, -1);
  }
  return v35;
}

{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, unint64_t, uint64_t);
  char v40;
  void (*v41)(char *, uint64_t);
  uint64_t isStackAllocationSafe;
  char v43;
  unint64_t v44;
  size_t v45;
  uint64_t v46;
  void *v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  int64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;
  unint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v55 = (char *)&v49 - v12;
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  v13 = -1 << *(_BYTE *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 56);
  v15 = ~v13;
  v16 = -v13;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  else
    v17 = -1;
  v56 = a1;
  v57 = a1 + 56;
  v18 = a1;
  v19 = a1 + 56;
  v20 = v17 & v14;
  v21 = v15;
  v58 = v15;
  v59 = 0;
  v60 = v17 & v14;
  v54 = (char *)(a2 + 56);
  v22 = v18;
  swift_bridgeObjectRetain();
  v23 = 0;
  v50 = v6;
  v53 = a2;
  v51 = v20;
  v52 = 0;
  if (!v20)
    goto LABEL_8;
LABEL_6:
  v24 = (v20 - 1) & v20;
  v25 = __clz(__rbit64(v20)) | (v23 << 6);
  v26 = v23;
  v27 = v19;
LABEL_7:
  (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v6, *(_QWORD *)(v22 + 48) + *(_QWORD *)(v8 + 72) * v25, v7);
  v28 = 0;
  while (1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, v28, 1, v7);
    v56 = v22;
    v57 = v27;
    v58 = v21;
    v59 = v26;
    v60 = v24;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      outlined consume of [String : ()].Iterator._Variant();
      outlined destroy of UUID?((uint64_t)v6);
      return v53;
    }
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v55, v6, v7);
    v32 = v53;
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    v33 = dispatch thunk of Hashable._rawHashValue(seed:)();
    v34 = -1 << *(_BYTE *)(v32 + 32);
    v35 = v33 & ~v34;
    if (((*(_QWORD *)&v54[(v35 >> 3) & 0xFFFFFFFFFFFFF8] >> v35) & 1) != 0)
      break;
    v41 = *(void (**)(char *, uint64_t))(v8 + 8);
LABEL_34:
    v41(v55, v7);
    v23 = v59;
    v20 = v60;
    v22 = v56;
    v19 = v57;
    v21 = v58;
    v6 = v50;
    v51 = v60;
    v52 = v59;
    if (v60)
      goto LABEL_6;
LABEL_8:
    v26 = v23 + 1;
    if (__OFADD__(v23, 1))
      __break(1u);
    v27 = v19;
    v29 = (unint64_t)(v21 + 64) >> 6;
    if (v26 >= v29)
      goto LABEL_26;
    v30 = *(_QWORD *)(v19 + 8 * v26);
    if (v30)
      goto LABEL_11;
    v23 += 2;
    if (v26 + 1 >= v29)
      goto LABEL_36;
    v30 = *(_QWORD *)(v19 + 8 * v23);
    if (v30)
      goto LABEL_14;
    if (v26 + 2 >= v29)
    {
LABEL_26:
      v24 = 0;
      v28 = 1;
      v26 = v23;
    }
    else
    {
      v30 = *(_QWORD *)(v19 + 8 * (v26 + 2));
      if (v30)
      {
        v26 += 2;
        goto LABEL_11;
      }
      v23 = v26 + 3;
      if (v26 + 3 >= v29)
      {
        v24 = 0;
        v28 = 1;
        v26 += 2;
      }
      else
      {
        v30 = *(_QWORD *)(v19 + 8 * v23);
        if (v30)
        {
LABEL_14:
          v26 = v23;
LABEL_11:
          v24 = (v30 - 1) & v30;
          v25 = __clz(__rbit64(v30)) + (v26 << 6);
          goto LABEL_7;
        }
        v26 += 4;
        if (v26 >= v29)
          goto LABEL_26;
        v30 = *(_QWORD *)(v19 + 8 * v26);
        if (v30)
          goto LABEL_11;
        v26 = v29 - 1;
        v31 = v52 + 6;
        while (v29 != v31)
        {
          v30 = *(_QWORD *)(v19 + 8 * v31++);
          if (v30)
          {
            v26 = v31 - 1;
            goto LABEL_11;
          }
        }
LABEL_36:
        v24 = 0;
        v28 = 1;
      }
    }
  }
  v36 = v32;
  v37 = ~v34;
  v38 = *(_QWORD *)(v8 + 72);
  v39 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  while (1)
  {
    v39(v11, *(_QWORD *)(v36 + 48) + v38 * v35, v7);
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09D0]);
    v40 = dispatch thunk of static Equatable.== infix(_:_:)();
    v41 = *(void (**)(char *, uint64_t))(v8 + 8);
    v41(v11, v7);
    if ((v40 & 1) != 0)
      break;
    v35 = (v35 + 1) & v37;
    if (((*(_QWORD *)&v54[(v35 >> 3) & 0xFFFFFFFFFFFFF8] >> v35) & 1) == 0)
      goto LABEL_34;
  }
  isStackAllocationSafe = ((uint64_t (*)(char *, uint64_t))v41)(v55, v7);
  v43 = *(_BYTE *)(v36 + 32);
  v44 = (unint64_t)((1 << v43) + 63) >> 6;
  v45 = 8 * v44;
  if ((v43 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    memcpy((char *)&v49 - ((v45 + 15) & 0x3FFFFFFFFFFFFFF0), v54, v45);
    v46 = specialized closure #1 in _NativeSet.subtracting<A>(_:)((unint64_t *)((char *)&v49 - ((v45 + 15) & 0x3FFFFFFFFFFFFFF0)), v44, v36, v35, &v56);
    swift_release();
    outlined consume of [String : ()].Iterator._Variant();
  }
  else
  {
    v48 = (void *)swift_slowAlloc();
    memcpy(v48, v54, v45);
    v46 = specialized closure #1 in _NativeSet.subtracting<A>(_:)((unint64_t *)v48, v44, v36, v35, &v56);
    swift_release();
    outlined consume of [String : ()].Iterator._Variant();
    MEMORY[0x1AF44981C](v48, -1, -1);
  }
  return v46;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  Swift::Int v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t isStackAllocationSafe;
  char v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;

  v2 = a2;
  v43 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v37 = a1 + 56;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v35 = ~v5;
    if (-v5 < 64)
      v6 = ~(-1 << -(char)v5);
    else
      v6 = -1;
    v7 = v6 & v4;
    v36 = (unint64_t)(63 - v5) >> 6;
    v8 = a2 + 56;
    swift_bridgeObjectRetain();
    v9 = 0;
    while (1)
    {
      if (v7)
      {
        v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v11 = v10 | (v9 << 6);
      }
      else
      {
        v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36)
          goto LABEL_47;
        v13 = *(_QWORD *)(v37 + 8 * v12);
        v14 = v9 + 1;
        if (!v13)
        {
          v14 = v9 + 2;
          if (v9 + 2 >= v36)
            goto LABEL_47;
          v13 = *(_QWORD *)(v37 + 8 * v14);
          if (!v13)
          {
            v14 = v9 + 3;
            if (v9 + 3 >= v36)
              goto LABEL_47;
            v13 = *(_QWORD *)(v37 + 8 * v14);
            if (!v13)
            {
              v14 = v9 + 4;
              if (v9 + 4 >= v36)
                goto LABEL_47;
              v13 = *(_QWORD *)(v37 + 8 * v14);
              if (!v13)
              {
                v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  outlined consume of [String : ()].Iterator._Variant();
                  return v2;
                }
                v13 = *(_QWORD *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      break;
                    if (v14 >= v36)
                      goto LABEL_47;
                    v13 = *(_QWORD *)(v37 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_24;
                  }
LABEL_49:
                  __break(1u);
                }
                v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        v7 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v9 = v14;
      }
      v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
      v18 = *v16;
      v17 = v16[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      v19 = Hasher._finalize()();
      v20 = -1 << *(_BYTE *)(v2 + 32);
      v21 = v19 & ~v20;
      if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
        break;
LABEL_6:
      swift_bridgeObjectRelease();
    }
    v22 = *(_QWORD *)(v2 + 48);
    v23 = (_QWORD *)(v22 + 16 * v21);
    v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      isStackAllocationSafe = swift_bridgeObjectRelease();
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
    }
    else
    {
      v25 = ~v20;
      do
      {
        v21 = (v21 + 1) & v25;
        if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          goto LABEL_6;
        v26 = (_QWORD *)(v22 + 16 * v21);
        v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
      isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    v29 = *(_BYTE *)(v2 + 32);
    v30 = (unint64_t)((1 << v29) + 63) >> 6;
    v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x1E0C80A78](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      v32 = specialized closure #1 in _NativeSet.subtracting<A>(_:)((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      outlined consume of [String : ()].Iterator._Variant();
    }
    else
    {
      v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      v32 = specialized closure #1 in _NativeSet.subtracting<A>(_:)((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      outlined consume of [String : ()].Iterator._Variant();
      MEMORY[0x1AF44981C](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
}

void specialized closure #1 in _NativeSet.subtracting<A>(_:)(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  Swift::Int v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  unint64_t i;
  unint64_t v24;
  id v25;
  char v26;
  int64_t v27;
  int64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  BOOL v32;
  int64_t v33;
  uint64_t v35;
  uint64_t v38;
  void *v39;

  v5 = a5;
  v7 = *(_QWORD *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v8 = v7 - 1;
  v38 = a3 + 56;
  while (2)
  {
    v35 = v8;
    do
    {
      while (1)
      {
        if ((*v5 & 0x8000000000000000) == 0)
        {
          v10 = v5[3];
          v9 = v5[4];
          if (v9)
          {
            v11 = (v9 - 1) & v9;
            v12 = __clz(__rbit64(v9)) | (v10 << 6);
LABEL_7:
            v13 = *(void **)(*(_QWORD *)(*v5 + 48) + 8 * v12);
            v14 = v13;
            goto LABEL_8;
          }
          v27 = v10 + 1;
          if (__OFADD__(v10, 1))
          {
            __break(1u);
            goto LABEL_47;
          }
          v28 = (unint64_t)(v5[2] + 64) >> 6;
          if (v27 >= v28)
          {
            v13 = 0;
            v11 = 0;
            goto LABEL_8;
          }
          v29 = v5[1];
          v30 = *(_QWORD *)(v29 + 8 * v27);
          if (v30)
          {
LABEL_22:
            v11 = (v30 - 1) & v30;
            v12 = __clz(__rbit64(v30)) + (v27 << 6);
            v10 = v27;
            goto LABEL_7;
          }
          if (v10 + 2 < v28)
          {
            v30 = *(_QWORD *)(v29 + 8 * (v10 + 2));
            if (v30)
            {
              v27 = v10 + 2;
              goto LABEL_22;
            }
            if (v10 + 3 >= v28)
            {
              v13 = 0;
              v11 = 0;
              v10 += 2;
              goto LABEL_8;
            }
            v30 = *(_QWORD *)(v29 + 8 * (v10 + 3));
            if (v30)
            {
              v27 = v10 + 3;
              goto LABEL_22;
            }
            v27 = v10 + 4;
            if (v10 + 4 >= v28)
            {
              v13 = 0;
              v11 = 0;
              v10 += 3;
LABEL_8:
              v5[3] = v10;
              v5[4] = v11;
              if (!v13)
                goto LABEL_45;
              goto LABEL_12;
            }
            v30 = *(_QWORD *)(v29 + 8 * v27);
            if (v30)
              goto LABEL_22;
            v27 = v28 - 1;
            v33 = v10 + 5;
            while (v28 != v33)
            {
              v30 = *(_QWORD *)(v29 + 8 * v33++);
              if (v30)
              {
                v27 = v33 - 1;
                goto LABEL_22;
              }
            }
          }
          v13 = 0;
          v11 = 0;
          v10 = v27;
          goto LABEL_8;
        }
        if (!__CocoaSet.Iterator.next()()
          || (type metadata accessor for AddressableMember(),
              swift_unknownObjectRetain(),
              swift_dynamicCast(),
              v13 = v39,
              swift_unknownObjectRelease(),
              !v39))
        {
LABEL_45:
          swift_retain();
          specialized _NativeSet.extractSubset(using:count:)(a1, a2, v35, a3, (uint64_t *)&demangling cache variable for type metadata for _SetStorage<AddressableMember>);
          return;
        }
LABEL_12:
        v15 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a3 + 40));
        v16 = -1 << *(_BYTE *)(a3 + 32);
        v17 = v15 & ~v16;
        v18 = v17 >> 6;
        v19 = 1 << v17;
        if (((1 << v17) & *(_QWORD *)(v38 + 8 * (v17 >> 6))) == 0)
          goto LABEL_3;
        type metadata accessor for AddressableMember();
        v20 = *(id *)(*(_QWORD *)(a3 + 48) + 8 * v17);
        v21 = static NSObject.== infix(_:_:)();

        if ((v21 & 1) != 0)
          break;
        v22 = ~v16;
        for (i = v17 + 1; ; i = v24 + 1)
        {
          v24 = i & v22;
          if (((*(_QWORD *)(v38 + (((i & v22) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v22)) & 1) == 0)
            break;
          v25 = *(id *)(*(_QWORD *)(a3 + 48) + 8 * v24);
          v26 = static NSObject.== infix(_:_:)();

          if ((v26 & 1) != 0)
          {

            v18 = v24 >> 6;
            v19 = 1 << v24;
            goto LABEL_25;
          }
        }
LABEL_3:

        v5 = a5;
      }

LABEL_25:
      v31 = a1[v18];
      a1[v18] = v31 & ~v19;
      v32 = (v19 & v31) == 0;
      v5 = a5;
    }
    while (v32);
    v8 = v35 - 1;
    if (__OFSUB__(v35, 1))
    {
LABEL_47:
      __break(1u);
      return;
    }
    if (v35 != 1)
      continue;
    break;
  }
}

uint64_t specialized closure #1 in _NativeSet.subtracting<A>(_:)(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, unint64_t, uint64_t);
  char v39;
  int64_t v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t *v51;
  char *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;

  v49 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for UUID();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v14);
  v57 = (char *)&v48 - v18;
  v19 = *(_QWORD *)(a3 + 16);
  v20 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  v21 = *(unint64_t *)((char *)a1 + v20) & ((-1 << a4) - 1);
  v51 = a1;
  v52 = v11;
  *(unint64_t *)((char *)a1 + v20) = v21;
  v22 = v19 - 1;
  v55 = a3 + 56;
  v56 = a3;
  v53 = a5;
  while (2)
  {
    v50 = v22;
    do
    {
      while (1)
      {
        v25 = *a5;
        v24 = a5[1];
        v27 = a5[2];
        v26 = a5[3];
        v28 = a5[4];
        v54 = v27;
        if (v28)
        {
          v29 = (v28 - 1) & v28;
          v30 = __clz(__rbit64(v28)) | (v26 << 6);
LABEL_7:
          (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v11, *(_QWORD *)(v25 + 48) + *(_QWORD *)(v13 + 72) * v30, v12);
          v31 = 0;
          goto LABEL_8;
        }
        v40 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
          goto LABEL_44;
        }
        v41 = (unint64_t)(v27 + 64) >> 6;
        if (v40 >= v41)
        {
          v29 = 0;
          v31 = 1;
          goto LABEL_8;
        }
        v42 = *(_QWORD *)(v24 + 8 * v40);
        if (v42)
          goto LABEL_17;
        v45 = v26 + 2;
        if (v26 + 2 >= v41)
          goto LABEL_35;
        v42 = *(_QWORD *)(v24 + 8 * v45);
        if (v42)
          goto LABEL_23;
        if (v26 + 3 >= v41)
          goto LABEL_36;
        v42 = *(_QWORD *)(v24 + 8 * (v26 + 3));
        if (v42)
        {
          v40 = v26 + 3;
          goto LABEL_17;
        }
        v45 = v26 + 4;
        if (v26 + 4 < v41)
        {
          v42 = *(_QWORD *)(v24 + 8 * v45);
          if (v42)
          {
LABEL_23:
            v40 = v45;
LABEL_17:
            v29 = (v42 - 1) & v42;
            v30 = __clz(__rbit64(v42)) + (v40 << 6);
            v26 = v40;
            goto LABEL_7;
          }
          v40 = v26 + 5;
          if (v26 + 5 < v41)
          {
            v42 = *(_QWORD *)(v24 + 8 * v40);
            if (v42)
              goto LABEL_17;
            v40 = v41 - 1;
            v46 = v26 + 6;
            while (v41 != v46)
            {
              v42 = *(_QWORD *)(v24 + 8 * v46++);
              if (v42)
              {
                v40 = v46 - 1;
                goto LABEL_17;
              }
            }
LABEL_35:
            v29 = 0;
            v31 = 1;
            v26 = v40;
            goto LABEL_8;
          }
LABEL_36:
          v29 = 0;
          v31 = 1;
          v26 = v45;
          goto LABEL_8;
        }
        v29 = 0;
        v31 = 1;
        v26 += 3;
LABEL_8:
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, v31, 1, v12);
        *a5 = v25;
        a5[1] = v24;
        a5[2] = v54;
        a5[3] = v26;
        a5[4] = v29;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
        {
          outlined destroy of UUID?((uint64_t)v11);
          v47 = v56;
          swift_retain();
          return specialized _NativeSet.extractSubset(using:count:)(v51, v49, v50, v47);
        }
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v57, v11, v12);
        v32 = v56;
        lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
        v33 = dispatch thunk of Hashable._rawHashValue(seed:)();
        v34 = -1 << *(_BYTE *)(v32 + 32);
        v35 = v33 & ~v34;
        if (((*(_QWORD *)(v55 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) != 0)
          break;
        v23 = *(uint64_t (**)(char *, uint64_t))(v13 + 8);
LABEL_4:
        result = v23(v57, v12);
        v11 = v52;
        a5 = v53;
      }
      v36 = ~v34;
      v37 = *(_QWORD *)(v13 + 72);
      v38 = *(void (**)(char *, unint64_t, uint64_t))(v13 + 16);
      while (1)
      {
        v38(v16, *(_QWORD *)(v56 + 48) + v37 * v35, v12);
        lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09D0]);
        v39 = dispatch thunk of static Equatable.== infix(_:_:)();
        v23 = *(uint64_t (**)(char *, uint64_t))(v13 + 8);
        v23(v16, v12);
        if ((v39 & 1) != 0)
          break;
        v35 = (v35 + 1) & v36;
        if (((*(_QWORD *)(v55 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) == 0)
          goto LABEL_4;
      }
      result = v23(v57, v12);
      v43 = (v35 >> 3) & 0x1FFFFFFFFFFFFFF8;
      v11 = v52;
      v44 = *(unint64_t *)((char *)v51 + v43);
      *(unint64_t *)((char *)v51 + v43) = v44 & ~(1 << v35);
      a5 = v53;
    }
    while ((v44 & (1 << v35)) == 0);
    v22 = v50 - 1;
    if (__OFSUB__(v50, 1))
    {
LABEL_44:
      __break(1u);
      return result;
    }
    if (v50 != 1)
      continue;
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t specialized closure #1 in _NativeSet.subtracting<A>(_:)(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  Swift::Int v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t i;
  unint64_t v33;
  _QWORD *v34;
  BOOL v35;
  int64_t v36;
  uint64_t v38;
  unint64_t *v39;
  uint64_t v40;

  v7 = *(_QWORD *)(a3 + 16);
  v39 = (unint64_t *)result;
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v8 = v7 - 1;
  v40 = a3 + 56;
  while (2)
  {
    v38 = v8;
    do
    {
      while (1)
      {
        v9 = a5[3];
        v10 = a5[4];
        if (v10)
        {
          v11 = (v10 - 1) & v10;
          v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_16;
        }
        v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        v14 = (unint64_t)(a5[2] + 64) >> 6;
        v15 = a5[3];
        if (v13 >= v14)
          goto LABEL_45;
        v16 = a5[1];
        v17 = *(_QWORD *)(v16 + 8 * v13);
        if (!v17)
        {
          v18 = v9 + 2;
          v15 = v9 + 1;
          if (v9 + 2 >= v14)
            goto LABEL_45;
          v17 = *(_QWORD *)(v16 + 8 * v18);
          if (!v17)
          {
            v15 = v9 + 2;
            if (v9 + 3 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              v13 = v9 + 3;
              goto LABEL_15;
            }
            v18 = v9 + 4;
            v15 = v9 + 3;
            if (v9 + 4 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * v18);
            if (!v17)
            {
              v13 = v9 + 5;
              v15 = v9 + 4;
              if (v9 + 5 >= v14)
                goto LABEL_45;
              v17 = *(_QWORD *)(v16 + 8 * v13);
              if (!v17)
              {
                v15 = v14 - 1;
                v36 = v9 + 6;
                while (v14 != v36)
                {
                  v17 = *(_QWORD *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return specialized _NativeSet.extractSubset(using:count:)(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          v13 = v18;
        }
LABEL_15:
        v11 = (v17 - 1) & v17;
        v12 = __clz(__rbit64(v17)) + (v13 << 6);
        v9 = v13;
LABEL_16:
        v19 = (uint64_t *)(*(_QWORD *)(*a5 + 48) + 16 * v12);
        v21 = *v19;
        v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        v22 = Hasher._finalize()();
        v23 = -1 << *(_BYTE *)(a3 + 32);
        v24 = v22 & ~v23;
        v25 = v24 >> 6;
        v26 = 1 << v24;
        if (((1 << v24) & *(_QWORD *)(v40 + 8 * (v24 >> 6))) == 0)
          goto LABEL_3;
        v27 = *(_QWORD *)(a3 + 48);
        v28 = (_QWORD *)(v27 + 16 * v24);
        v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          break;
        v31 = ~v23;
        for (i = v24 + 1; ; i = v33 + 1)
        {
          v33 = i & v31;
          if (((*(_QWORD *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0)
            break;
          v34 = (_QWORD *)(v27 + 16 * v33);
          v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v25 = v33 >> 6;
            v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        result = swift_bridgeObjectRelease();
      }
      result = swift_bridgeObjectRelease();
LABEL_23:
      v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1)
      continue;
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t specialized _NativeSet.extractSubset(using:count:)(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v35;
  unint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v8 = type metadata accessor for UUID();
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  v38 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<UUID>);
  result = static _SetStorage.allocate(capacity:)();
  v12 = result;
  v36 = a1;
  v37 = a2;
  if (a2 < 1)
    v14 = 0;
  else
    v14 = *a1;
  v15 = 0;
  v16 = result + 56;
  v17 = v38;
  while (1)
  {
    if (v14)
    {
      v18 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v19 = v18 | (v15 << 6);
    }
    else
    {
      v20 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_40;
      if (v20 >= v37)
      {
LABEL_37:
        swift_release();
        return v12;
      }
      v21 = v36[v20];
      ++v15;
      if (!v21)
      {
        v15 = v20 + 1;
        if (v20 + 1 >= v37)
          goto LABEL_37;
        v21 = v36[v15];
        if (!v21)
        {
          v15 = v20 + 2;
          if (v20 + 2 >= v37)
            goto LABEL_37;
          v21 = v36[v15];
          if (!v21)
          {
            v22 = v20 + 3;
            if (v22 >= v37)
              goto LABEL_37;
            v21 = v36[v22];
            if (!v21)
            {
              while (1)
              {
                v15 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v15 >= v37)
                  goto LABEL_37;
                v21 = v36[v15];
                ++v22;
                if (v21)
                  goto LABEL_24;
              }
            }
            v15 = v22;
          }
        }
      }
LABEL_24:
      v14 = (v21 - 1) & v21;
      v19 = __clz(__rbit64(v21)) + (v15 << 6);
    }
    v23 = a4;
    v24 = *(_QWORD *)(a4 + 48);
    v25 = *(_QWORD *)(v17 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v11, v24 + v25 * v19, v8);
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    result = dispatch thunk of Hashable._rawHashValue(seed:)();
    v26 = -1 << *(_BYTE *)(v12 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6))) != 0)
    {
      v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      v17 = v38;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v26) >> 6;
      v17 = v38;
      do
      {
        if (++v28 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v32 = v28 == v31;
        if (v28 == v31)
          v28 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v16 + 8 * v28);
      }
      while (v33 == -1);
      v29 = __clz(__rbit64(~v33)) + (v28 << 6);
    }
    *(_QWORD *)(v16 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v17 + 32))(*(_QWORD *)(v12 + 48) + v29 * v25, v11, v8);
    ++*(_QWORD *)(v12 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v23;
    if (!a3)
      goto LABEL_37;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

{
  return specialized _NativeSet.extractSubset(using:count:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _SetStorage<ActivitySession>);
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x1E0DEE9E8];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  result = static _SetStorage.allocate(capacity:)();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    result = Hasher._finalize()();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.extractSubset(using:count:)(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  Swift::Int v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  unint64_t *v30;

  v5 = a4;
  if (!a3)
  {
    v10 = MEMORY[0x1E0DEE9E8];
LABEL_36:
    swift_release();
    return v10;
  }
  v6 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v5;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  result = static _SetStorage.allocate(capacity:)();
  v10 = result;
  v30 = a1;
  if (a2 < 1)
    v11 = 0;
  else
    v11 = *a1;
  v12 = 0;
  v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
      goto LABEL_39;
    if (v16 >= a2)
      goto LABEL_36;
    v17 = v30[v16];
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= a2)
        goto LABEL_36;
      v17 = v30[v12];
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= a2)
          goto LABEL_36;
        v17 = v30[v12];
        if (!v17)
          break;
      }
    }
LABEL_23:
    v11 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(_QWORD *)(v10 + 40);
    v20 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * v15);
    result = NSObject._rawHashValue(seed:)(v19);
    v21 = -1 << *(_BYTE *)(v10 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v27 = v23 == v26;
        if (v23 == v26)
          v23 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v13 + 8 * v23);
      }
      while (v28 == -1);
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(_QWORD *)(v13 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v24) = v20;
    ++*(_QWORD *)(v10 + 16);
    if (__OFSUB__(v6--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v6)
      goto LABEL_36;
  }
  v18 = v16 + 3;
  if (v18 >= a2)
    goto LABEL_36;
  v17 = v30[v18];
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= a2)
      goto LABEL_36;
    v17 = v30[v12];
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t specialized Sequence.forEach(_:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v21;
  uint64_t (*v22)(void);
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  id v27;
  unsigned int v28;
  uint64_t v29;
  int64_t v30;
  _QWORD *v31;

  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 56);
  v31 = a2 + 3;
  v30 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v8 << 6);
      goto LABEL_24;
    }
    v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v12 >= v30)
      return swift_release();
    v13 = *(_QWORD *)(v29 + 8 * v12);
    ++v8;
    if (!v13)
    {
      v8 = v12 + 1;
      if (v12 + 1 >= v30)
        return swift_release();
      v13 = *(_QWORD *)(v29 + 8 * v8);
      if (!v13)
      {
        v8 = v12 + 2;
        if (v12 + 2 >= v30)
          return swift_release();
        v13 = *(_QWORD *)(v29 + 8 * v8);
        if (!v13)
        {
          v8 = v12 + 3;
          if (v12 + 3 >= v30)
            return swift_release();
          v13 = *(_QWORD *)(v29 + 8 * v8);
          if (!v13)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_24:
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
    v17 = *v15;
    v16 = v15[1];
    v18 = a2[6];
    v19 = a2[7];
    __swift_project_boxed_opaque_existential_1(v31, v18);
    v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 8);
    swift_bridgeObjectRetain();
    if ((v20(v17, v16, v18, v19) & 1) == 0)
    {
      v9 = 2;
      goto LABEL_5;
    }
    v21 = (_QWORD *)a2[2];
    v22 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v21) + 0x98);
    v23 = v21;
    v24 = v22();

    if (*(_QWORD *)(v24 + 16))
    {
      swift_bridgeObjectRetain();
      v25 = specialized __RawDictionaryStorage.find<A>(_:)(v17, v16);
      if ((v26 & 1) != 0)
      {
        v27 = *(id *)(*(_QWORD *)(v24 + 56) + 8 * v25);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v28 = objc_msgSend(v27, sel_BOOLValue);

        v9 = v28;
        goto LABEL_5;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    v9 = 0;
LABEL_5:
    specialized AppVisibilityMonitor.handleAppVisibilityUpdate(forBundleIdentifier:applicationType:)(v17, v16, v9);
    result = swift_bridgeObjectRelease();
  }
  v14 = v12 + 4;
  if (v14 >= v30)
    return swift_release();
  v13 = *(_QWORD *)(v29 + 8 * v14);
  if (v13)
  {
    v8 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v8 >= v30)
      return swift_release();
    v13 = *(_QWORD *)(v29 + 8 * v8);
    ++v14;
    if (v13)
      goto LABEL_23;
  }
LABEL_32:
  __break(1u);
  return result;
}

_QWORD *specialized Sequence.compactMap<A>(_:)(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v26;
  unint64_t v27;

  v1 = a1;
  if (a1 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    v2 = _CocoaArrayWrapper.endIndex.getter();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v3 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v27 = v1 & 0xC000000000000001;
    v4 = 4;
    while (1)
    {
      if (v27)
        v5 = (id)MEMORY[0x1AF448904](v4 - 4, v1);
      else
        v5 = *(id *)(v1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
      {
        __break(1u);
        goto LABEL_25;
      }
      v8 = objc_msgSend(v5, sel_bundleIdentifier);
      if (!v8)
        goto LABEL_19;
      v9 = v8;
      v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v12 = v11;

      if ((specialized AppVisibilityMonitor.shouldHandleAppVisibilityUpdate(forBundleIdentifier:)(v10, v12) & 1) == 0)
        break;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3[2] + 1, 1, v3);
      v14 = v3[2];
      v13 = v3[3];
      if (v14 >= v13 >> 1)
        v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v13 > 1), v14 + 1, 1, v3);
      v3[2] = v14 + 1;
      v15 = &v3[2 * v14];
      v15[4] = v10;
      v15[5] = v12;
LABEL_6:
      ++v4;
      if (v7 == v2)
        goto LABEL_23;
    }
    swift_bridgeObjectRelease();
LABEL_19:
    if (one-time initialization token for default != -1)
      swift_once();
    v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)static Log.default);
    v17 = v6;
    v18 = Logger.logObject.getter();
    v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = swift_slowAlloc();
      v26 = v3;
      v21 = v1;
      v22 = v2;
      v23 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v20 = 138412290;
      *(_QWORD *)(v20 + 4) = v17;
      *v23 = v17;
      _os_log_impl(&dword_1ACCCC000, v18, v19, "DisplayLayoutAppVisibilityMonitor: Ignoring visibility update for layout element: %@", (uint8_t *)v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      v24 = v23;
      v2 = v22;
      v1 = v21;
      v3 = v26;
      MEMORY[0x1AF44981C](v24, -1, -1);
      MEMORY[0x1AF44981C](v20, -1, -1);

    }
    else
    {

    }
    goto LABEL_6;
  }
LABEL_23:
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  Swift::Int v19;
  uint64_t result;
  char *v21;
  void (*v22)(char *, _QWORD);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *);
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char v38[32];
  uint64_t v39;

  v27 = a5;
  v28 = a8;
  v33 = a1;
  v34 = a2;
  v26 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](a1);
  v35 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v31 = (char *)&v24 - v13;
  v36 = a4;
  MEMORY[0x1E0C80A78](v12);
  v30 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_getAssociatedTypeWitness();
  v29 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v24 - v16;
  v18 = dispatch thunk of Collection.count.getter();
  if (!v18)
    return static Array._allocateUninitialized(_:)();
  v19 = v18;
  v25 = v15;
  v39 = Array.init()();
  v32 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v19);
  v36 = v17;
  result = dispatch thunk of Collection.startIndex.getter();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    v21 = v31;
    while (1)
    {
      v22 = (void (*)(char *, _QWORD))dispatch thunk of Collection.subscript.read();
      (*(void (**)(char *))(v11 + 16))(v21);
      v22(v38, 0);
      v23 = v37;
      v33(v21, v35);
      if (v23)
        break;
      v37 = 0;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v21, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      dispatch thunk of Collection.formIndex(after:)();
      if (!--v19)
      {
        (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v25);
        return v39;
      }
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v21, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v25);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v28, v35, v27);
  }
  return result;
}

uint64_t StateMachine.Transition.from.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t StateMachine.Transition.to.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 52));
}

uint64_t StateMachine.Transition.event.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 56));
}

void StateMachine.Transition.init(from:to:event:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for StateMachine.Transition();
}

uint64_t sub_1ACF4DF0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);

  v6(v5 + *(int *)(a1 + 52), v4, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v5 + *(int *)(a1 + 56), v3, v1);
}

void type metadata accessor for StateMachine.Transition()
{
  JUMPOUT(0x1AF44969CLL);
}

uint64_t StateMachine.Trigger.hash(into:)()
{
  dispatch thunk of Hashable.hash(into:)();
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t static StateMachine.Trigger.== infix(_:_:)()
{
  if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) != 0)
    type metadata accessor for StateMachine.Trigger();
  return 0;
}

Swift::Int StateMachine.Trigger.hashValue.getter()
{
  Hasher.init(_seed:)();
  StateMachine.Trigger.hash(into:)();
  return Hasher._finalize()();
}

uint64_t StateMachine._currentState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 112);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 16))(a1, v4);
}

uint64_t StateMachine._currentState.setter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 112);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 40))(v4, a1);
  return swift_endAccess();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance StateMachine<A, B>.Trigger()
{
  Hasher.init(_seed:)();
  StateMachine.Trigger.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance StateMachine<A, B>.Trigger()
{
  return static StateMachine.Trigger.== infix(_:_:)();
}

void StateMachine.__allocating_init(initialState:transitions:)(uint64_t a1)
{
  swift_allocObject();
  specialized StateMachine.init(initialState:transitions:)(a1);
}

uint64_t sub_1ACF4E1F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))(v2);
  return a1;
}

void StateMachine.init(initialState:transitions:)(uint64_t a1)
{
  specialized StateMachine.init(initialState:transitions:)(a1);
}

uint64_t sub_1ACF4E238(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v2 + 80) - 8) + 8))(v1);
  return a1;
}

void closure #1 in StateMachine.init(initialState:transitions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[10];

  v9[5] = *(_QWORD *)(a3 - 8);
  v3 = MEMORY[0x1E0C80A78](a1);
  v9[4] = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v9[6] = v5;
  v9[7] = v6;
  v9[8] = v7;
  v9[9] = v8;
  v9[0] = v7;
  v9[1] = v8;
  type metadata accessor for StateMachine.Trigger();
}

void sub_1ACF4E318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v8 - 136) = v3 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
  *(_QWORD *)(v8 - 144) = v9;
  v9(v7, v4, v0);
  *(_QWORD *)(v8 - 112) = v0;
  *(_QWORD *)(v8 - 104) = v2;
  *(_QWORD *)(v8 - 96) = v6;
  *(_QWORD *)(v8 - 88) = v5;
  type metadata accessor for StateMachine.Transition();
}

void sub_1ACF4E368(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 120) + 16))(*(_QWORD *)(v7 - 128), v5 + *(int *)(a1 + 56), v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v4, v6, v1);
  *(_QWORD *)(v7 - 112) = v1;
  *(_QWORD *)(v7 - 104) = v3;
  v8 = *(_QWORD *)(v7 - 152);
  *(_QWORD *)(v7 - 96) = *(_QWORD *)(v7 - 160);
  *(_QWORD *)(v7 - 88) = v8;
  type metadata accessor for StateMachine.Trigger();
}

uint64_t sub_1ACF4E3B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v4 + *(int *)(a1 + 52), v7, v3);
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v8 - 144))(*(_QWORD *)(v8 - 136), v5 + *(int *)(v1 + 52), v2);
}

void StateMachine.currentState.getter()
{
  Lock.withLock<A>(_:)((void (*)(void))partial apply for closure #1 in StateMachine.currentState.getter);
}

void StateMachine.execute(_:)(uint64_t a1)
{
  uint64_t v1;
  char v3;

  os_unfair_lock_lock(*(os_unfair_lock_t *)(*(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 128)) + 16));
  closure #1 in StateMachine.execute(_:)(v1, a1, (uint64_t)&v3);
}

uint64_t sub_1ACF4E494()
{
  uint64_t v0;
  unsigned __int8 v2;

  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + 16));
  return v2;
}

void closure #1 in StateMachine.execute(_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v13 = a2;
  v15 = a3;
  v3 = *(_QWORD **)a1;
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v5 = type metadata accessor for Optional();
  v10[3] = *(_QWORD *)(v5 - 8);
  v10[4] = v5;
  v6 = MEMORY[0x1E0C80A78](v5);
  v14 = (char *)v10 - v7;
  v8 = v3[11];
  v10[7] = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = v3[12];
  v11 = v3[13];
  v12 = v9;
  v16 = v4;
  v17 = v8;
  v18 = v9;
  v19 = v11;
  type metadata accessor for StateMachine.Trigger();
}

void sub_1ACF4E578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;

  *(_QWORD *)(v14 - 176) = *(_QWORD *)(a1 - 8);
  v15 = MEMORY[0x1E0C80A78](a1);
  v17 = (char *)&a9 - v16;
  v18 = *(_QWORD *)(v10 - 8);
  v19 = MEMORY[0x1E0C80A78](v15);
  v21 = (char *)&a9 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  *(_QWORD *)(v14 - 240) = (char *)&a9 - v22;
  v23 = *(_QWORD *)(v9 + 112);
  v24 = *(_QWORD *)(v12 + *(_QWORD *)(v9 + 120));
  *(_QWORD *)(v14 - 216) = v12;
  *(_QWORD *)(v14 - 208) = v24;
  v25 = v12 + v23;
  swift_beginAccess();
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  *(_QWORD *)(v14 - 248) = v26;
  v26(v21, v25, v10);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v14 - 200) + 16))(v11, *(_QWORD *)(v14 - 168), v13);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v17, v21, v10);
  *(_QWORD *)(v14 - 120) = v10;
  *(_QWORD *)(v14 - 112) = v13;
  v27 = *(_QWORD *)(v14 - 192);
  *(_QWORD *)(v14 - 104) = *(_QWORD *)(v14 - 184);
  *(_QWORD *)(v14 - 96) = v27;
  type metadata accessor for StateMachine.Trigger();
}

uint64_t sub_1ACF4E678(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
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
  uint64_t result;
  char v14;
  uint64_t v15;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v3 + *(int *)(a1 + 52), v5, v9);
  v11 = MEMORY[0x1AF44972C](&protocol conformance descriptor for StateMachine<A, B>.Trigger, v1);
  v12 = *(_QWORD *)(v10 - 160);
  MEMORY[0x1AF448034](v3, *(_QWORD *)(v10 - 208), v1, v4, v11);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 176) + 8))(v3, v1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v12, 1, v4) == 1)
  {
    result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v10 - 232) + 8))(v12, *(_QWORD *)(v10 - 224));
    v14 = 0;
  }
  else
  {
    v15 = *(_QWORD *)(v10 - 240);
    v2(v15, v12, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 - 248))(v7, v15, v4);
    StateMachine._currentState.setter(v7);
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v15, v4);
    v14 = 1;
  }
  **(_BYTE **)(v10 - 152) = v14;
  return result;
}

uint64_t StateMachine.deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 112));
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t StateMachine.__deallocating_deinit()
{
  StateMachine.deinit();
  return swift_deallocClassInstance();
}

void specialized StateMachine.init(initialState:transitions:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;

  v2 = v1;
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 128);
  type metadata accessor for Lock();
  v6 = swift_allocObject();
  v7 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v6 + 16) = v7;
  *v7 = 0;
  *(uint64_t *)((char *)v2 + v5) = v6;
  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(v4 + 80) - 8) + 16))((uint64_t)v2 + *(_QWORD *)(*v2 + 112), a1, *(_QWORD *)(v4 + 80));
  type metadata accessor for StateMachine.Transition();
}

void sub_1ACF4E89C()
{
  type metadata accessor for Array();
  type metadata accessor for StateMachine.Trigger();
}

uint64_t sub_1ACF4E8C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *TupleTypeMetadata2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[22];

  TupleTypeMetadata2 = (char *)swift_getTupleTypeMetadata2();
  v5 = MEMORY[0x1AF44972C](MEMORY[0x1E0DEAF50], v2);
  v7 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in StateMachine.init(initialState:transitions:), (uint64_t)v10, v2, TupleTypeMetadata2, MEMORY[0x1E0DEDCE8], v5, MEMORY[0x1E0DEDD18], v6);
  swift_bridgeObjectRelease();
  v10[6] = v7;
  v8 = type metadata accessor for Array();
  MEMORY[0x1AF44972C](&protocol conformance descriptor for StateMachine<A, B>.Trigger, a1);
  MEMORY[0x1AF44972C](MEMORY[0x1E0DEAF38], v8);
  *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 120)) = Dictionary.init<A>(uniqueKeysWithValues:)();
  return v1;
}

uint64_t partial apply for closure #1 in StateMachine.currentState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 112);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 16))(a1, v4);
}

uint64_t type metadata completion function for StateMachine()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void type metadata accessor for StateMachine()
{
  JUMPOUT(0x1AF44969CLL);
}

uint64_t method lookup function for StateMachine()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StateMachine.__allocating_init(initialState:transitions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of StateMachine.currentState.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of StateMachine.execute(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t type metadata instantiation function for StateMachine.Transition()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for StateMachine.Transition()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for StateMachine.Transition(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t *, uint64_t *, uint64_t);
  unint64_t v19;
  uint64_t v21;

  v4 = a1;
  v6 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(a3 + 24);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = *(_DWORD *)(v7 + 80);
  v10 = v8 + v9;
  v11 = *(_QWORD *)(v5 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  v13 = v8 + v12;
  if ((v12 | v9) > 7
    || ((*(_DWORD *)(v11 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0
    || ((v8 + v12 + ((v8 + v9) & ~v9)) & ~v12) + *(_QWORD *)(v11 + 64) > 0x18)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v16 + (((v12 | v9) + 16) & ~(v12 | v9)));
    swift_retain();
  }
  else
  {
    v17 = ~v9;
    v21 = ~v12;
    v18 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16);
    v18(a1, a2, v6);
    v19 = ((unint64_t)a2 + v10) & v17;
    v18((uint64_t *)(((unint64_t)v4 + v10) & v17), (uint64_t *)v19, v6);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))(((((unint64_t)v4 + v10) & v17) + v13) & v21, (v19 + v13) & v21, v5);
  }
  return v4;
}

uint64_t destroy for StateMachine.Transition(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(unint64_t, uint64_t);
  uint64_t v7;
  unint64_t v8;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(unint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  v7 = *(_QWORD *)(v5 + 64);
  v8 = (v7 + a1 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v6(v8, v4);
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((v8 + v7 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
}

uint64_t initializeWithCopy for StateMachine.Transition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = (v9 + v10 + a1) & ~v10;
  v12 = (v9 + v10 + a2) & ~v10;
  v8(v11, v12, v6);
  v13 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v13 + 16))((v9 + *(unsigned __int8 *)(v13 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), (v9 + *(unsigned __int8 *)(v13 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  return a1;
}

uint64_t assignWithCopy for StateMachine.Transition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = (v9 + v10 + a1) & ~v10;
  v12 = (v9 + v10 + a2) & ~v10;
  v8(v11, v12, v6);
  v13 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v13 + 24))((v9 + *(unsigned __int8 *)(v13 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), (v9 + *(unsigned __int8 *)(v13 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  return a1;
}

uint64_t initializeWithTake for StateMachine.Transition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = (v9 + v10 + a1) & ~v10;
  v12 = (v9 + v10 + a2) & ~v10;
  v8(v11, v12, v6);
  v13 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v13 + 32))((v9 + *(unsigned __int8 *)(v13 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), (v9 + *(unsigned __int8 *)(v13 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  return a1;
}

uint64_t assignWithTake for StateMachine.Transition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = (v9 + v10 + a1) & ~v10;
  v12 = (v9 + v10 + a2) & ~v10;
  v8(v11, v12, v6);
  v13 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v13 + 40))((v9 + *(unsigned __int8 *)(v13 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), (v9 + *(unsigned __int8 *)(v13 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  return a1;
}

uint64_t getEnumTagSinglePayload for StateMachine.Transition(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  char v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5)
    v8 = *(_DWORD *)(v4 + 84);
  else
    v8 = *(_DWORD *)(v6 + 84);
  if (!a2)
    return 0;
  v9 = *(_QWORD *)(v4 + 64);
  v10 = *(unsigned __int8 *)(v4 + 80);
  v11 = v9 + v10;
  v12 = *(unsigned __int8 *)(v6 + 80);
  v13 = a2 - v8;
  if (a2 <= v8)
    goto LABEL_23;
  v14 = ((v9 + v12 + (v11 & ~v10)) & ~v12) + *(_QWORD *)(v6 + 64);
  v15 = 8 * v14;
  if (v14 <= 3)
  {
    v17 = ((v13 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      v16 = *(_DWORD *)(a1 + v14);
      if (!v16)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      v16 = *(unsigned __int16 *)(a1 + v14);
      if (!*(_WORD *)(a1 + v14))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_23:
      if (v8)
      {
        if (v5 >= v7)
          return (*(uint64_t (**)(void))(v4 + 48))();
        else
          return (*(uint64_t (**)(uint64_t))(v6 + 48))((((v11 + a1) & ~v10) + v9 + v12) & ~v12);
      }
      return 0;
    }
  }
  v16 = *(unsigned __int8 *)(a1 + v14);
  if (!*(_BYTE *)(a1 + v14))
    goto LABEL_23;
LABEL_14:
  v18 = (v16 - 1) << v15;
  if (v14 > 3)
    v18 = 0;
  if (!(_DWORD)v14)
    return v8 + v18 + 1;
  if (v14 <= 3)
    v19 = ((v9 + v12 + (v11 & ~(_DWORD)v10)) & ~(_DWORD)v12) + *(_DWORD *)(v6 + 64);
  else
    v19 = 4;
  return ((uint64_t (*)(void))((char *)&loc_1ACF4F098 + 4 * byte_1ACF6B898[v19 - 1]))();
}

void storeEnumTagSinglePayload for StateMachine.Transition(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v5 + 64)
       + *(unsigned __int8 *)(v6 + 80)
       + ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  if (a3 > v7)
  {
    if (v8 <= 3)
    {
      v11 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v11))
      {
        v9 = 4u;
      }
      else if (v11 >= 0x100)
      {
        v9 = 2;
      }
      else
      {
        v9 = v11 > 1;
      }
    }
    else
    {
      v9 = 1u;
    }
  }
  else
  {
    v9 = 0u;
  }
  if (v7 < a2)
  {
    v10 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v12 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X4 }
}

uint64_t type metadata completion function for StateMachine.Trigger()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for StateMachine.Trigger(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  uint64_t v14;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (*(_BYTE *)(v6 + 80) | *(_BYTE *)(v7 + 80));
  if (v10 > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0
    || (v9 & (unint64_t)~v8) + *(_QWORD *)(v7 + 64) > 0x18)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v13 + ((v10 + 16) & ~v10));
    swift_retain();
  }
  else
  {
    v14 = ~v8;
    (*(void (**)(uint64_t *, uint64_t *))(v6 + 16))(a1, a2);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(((unint64_t)v4 + v9) & v14, ((unint64_t)a2 + v9) & v14, v5);
  }
  return v4;
}

uint64_t destroy for StateMachine.Trigger(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v4 + 8))();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((*(_QWORD *)(v4 + 64) + a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
}

uint64_t initializeWithCopy for StateMachine.Trigger(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 16))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t assignWithCopy for StateMachine.Trigger(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 24))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t initializeWithTake for StateMachine.Trigger(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 32))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t assignWithTake for StateMachine.Trigger(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t getEnumTagSinglePayload for StateMachine.Trigger(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5)
    v8 = *(_DWORD *)(v4 + 84);
  else
    v8 = *(_DWORD *)(v6 + 84);
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = *(_QWORD *)(v4 + 64) + v9;
  v11 = a2 - v8;
  if (a2 <= v8)
    goto LABEL_23;
  v12 = (v10 & ~v9) + *(_QWORD *)(v6 + 64);
  v13 = 8 * v12;
  if (v12 <= 3)
  {
    v15 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      v14 = *(_DWORD *)(a1 + v12);
      if (!v14)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 > 0xFF)
    {
      v14 = *(unsigned __int16 *)(a1 + v12);
      if (!*(_WORD *)(a1 + v12))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 < 2)
    {
LABEL_23:
      if (v8)
      {
        if (v5 >= v7)
          return (*(uint64_t (**)(void))(v4 + 48))();
        else
          return (*(uint64_t (**)(uint64_t))(v6 + 48))((v10 + a1) & ~v9);
      }
      return 0;
    }
  }
  v14 = *(unsigned __int8 *)(a1 + v12);
  if (!*(_BYTE *)(a1 + v12))
    goto LABEL_23;
LABEL_14:
  v16 = (v14 - 1) << v13;
  if (v12 > 3)
    v16 = 0;
  if (!(_DWORD)v12)
    return v8 + v16 + 1;
  if (v12 <= 3)
    v17 = (v10 & ~(_DWORD)v9) + *(_DWORD *)(v6 + 64);
  else
    v17 = 4;
  return ((uint64_t (*)(void))((char *)&loc_1ACF4F77C + 4 * byte_1ACF6B8A6[v17 - 1]))();
}

void storeEnumTagSinglePayload for StateMachine.Trigger(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  if (a3 > v7)
  {
    if (v8 <= 3)
    {
      v11 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v11))
      {
        v9 = 4u;
      }
      else if (v11 >= 0x100)
      {
        v9 = 2;
      }
      else
      {
        v9 = v11 > 1;
      }
    }
    else
    {
      v9 = 1u;
    }
  }
  else
  {
    v9 = 0u;
  }
  if (v7 < a2)
  {
    v10 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v12 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X16 }
}

void type metadata accessor for StateMachine.Trigger()
{
  JUMPOUT(0x1AF44969CLL);
}

void base witness table accessor for Equatable in StateMachine<A, B>.Trigger()
{
  JUMPOUT(0x1AF44972CLL);
}

void partial apply for closure #1 in StateMachine.init(initialState:transitions:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in StateMachine.init(initialState:transitions:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t AttachmentLedgerMetadata_AttachmentMetadata.developerMetadata.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = v2 + *(int *)(type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata() + 20);
  result = outlined consume of Data?(*(_QWORD *)v5, *(_QWORD *)(v5 + 8));
  *(_QWORD *)v5 = a1;
  *(_QWORD *)(v5 + 8) = a2;
  return result;
}

uint64_t type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata()
{
  uint64_t result;

  result = type metadata singleton initialization cache for AttachmentLedgerMetadata_AttachmentMetadata;
  if (!type metadata singleton initialization cache for AttachmentLedgerMetadata_AttachmentMetadata)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AttachmentLedgerMetadata_AttachmentMetadata.developerMetadata.getter()
{
  uint64_t v0;
  uint64_t *v1;
  unint64_t v2;
  uint64_t v3;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata() + 20));
  v2 = v1[1];
  if (v2 >> 60 == 15)
    v3 = 0;
  else
    v3 = *v1;
  outlined copy of Data?(*v1, v2);
  return v3;
}

uint64_t key path setter for AttachmentLedgerMetadata_AttachmentMetadata.developerMetadata : AttachmentLedgerMetadata_AttachmentMetadata(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata() + 20));
  v5 = *v4;
  v6 = v4[1];
  outlined copy of Data._Representation(v2, v3);
  result = outlined consume of Data?(v5, v6);
  *v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t (*AttachmentLedgerMetadata_AttachmentMetadata.developerMetadata.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata() + 20);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = *v4;
  v6 = v4[1];
  if (v6 >> 60 == 15)
    v7 = 0;
  else
    v7 = *v4;
  v8 = 0xC000000000000000;
  if (v6 >> 60 != 15)
    v8 = v6;
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v8;
  outlined copy of Data?(v5, v6);
  return AttachmentLedgerMetadata_AttachmentMetadata.developerMetadata.modify;
}

uint64_t AttachmentLedgerMetadata_AttachmentMetadata.developerMetadata.modify(uint64_t a1, char a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16) + *(int *)(a1 + 24);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)v3;
  v6 = *(_QWORD *)(v3 + 8);
  if ((a2 & 1) != 0)
  {
    outlined copy of Data._Representation(*(_QWORD *)a1, v2);
    outlined consume of Data?(v5, v6);
    *(_QWORD *)v3 = v4;
    *(_QWORD *)(v3 + 8) = v2;
    return outlined consume of Data._Representation(v4, v2);
  }
  else
  {
    result = outlined consume of Data?(*(_QWORD *)v3, *(_QWORD *)(v3 + 8));
    *(_QWORD *)v3 = v4;
    *(_QWORD *)(v3 + 8) = v2;
  }
  return result;
}

BOOL AttachmentLedgerMetadata_AttachmentMetadata.hasDeveloperMetadata.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata() + 20) + 8) >> 60 != 15;
}

Swift::Void __swiftcall AttachmentLedgerMetadata_AttachmentMetadata.clearDeveloperMetadata()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata() + 20);
  outlined consume of Data?(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  *(_OWORD *)v1 = xmmword_1ACF5C480;
}

uint64_t AttachmentLedgerMetadata_AttachmentMetadata.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UnknownStorage();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t AttachmentLedgerMetadata_AttachmentMetadata.unknownFields.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UnknownStorage();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*AttachmentLedgerMetadata_AttachmentMetadata.unknownFields.modify())()
{
  return destructiveProjectEnumData for ActivitySession.Errors;
}

double AttachmentLedgerMetadata_AttachmentMetadata.init()@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  double result;

  UnknownStorage.init()();
  v2 = type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata();
  result = 0.0;
  *(_OWORD *)(a1 + *(int *)(v2 + 20)) = xmmword_1ACF5C480;
  return result;
}

void *AttachmentLedgerMetadata_AttachmentMetadata.protoMessageName.unsafeMutableAddressor()
{
  return &static AttachmentLedgerMetadata_AttachmentMetadata.protoMessageName;
}

unint64_t static AttachmentLedgerMetadata_AttachmentMetadata.protoMessageName.getter()
{
  return 0xD000000000000023;
}

uint64_t AttachmentLedgerMetadata_AttachmentMetadata._protobuf_nameMap.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for _protobuf_nameMap != -1)
    swift_once();
  v0 = type metadata accessor for _NameMap();
  return __swift_project_value_buffer(v0, (uint64_t)static AttachmentLedgerMetadata_AttachmentMetadata._protobuf_nameMap);
}

uint64_t static AttachmentLedgerMetadata_AttachmentMetadata._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for _protobuf_nameMap != -1)
    swift_once();
  v2 = type metadata accessor for _NameMap();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static AttachmentLedgerMetadata_AttachmentMetadata._protobuf_nameMap);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t AttachmentLedgerMetadata_AttachmentMetadata.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = dispatch thunk of Decoder.nextFieldNumber()();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 1)
    {
      type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata();
      dispatch thunk of Decoder.decodeSingularBytesField(value:)();
    }
    v0 = 0;
  }
  return result;
}

uint64_t AttachmentLedgerMetadata_AttachmentMetadata.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  result = closure #1 in AttachmentLedgerMetadata_AttachmentMetadata.traverse<A>(visitor:)(v0);
  if (!v1)
    return UnknownStorage.traverse<A>(visitor:)();
  return result;
}

uint64_t closure #1 in AttachmentLedgerMetadata_AttachmentMetadata.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  result = type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata();
  v3 = a1 + *(int *)(result + 20);
  v4 = *(_QWORD *)(v3 + 8);
  if (v4 >> 60 != 15)
  {
    v5 = *(_QWORD *)v3;
    outlined copy of Data._Representation(*(_QWORD *)v3, *(_QWORD *)(v3 + 8));
    dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
    return outlined consume of Data?(v5, v4);
  }
  return result;
}

Swift::Int AttachmentLedgerMetadata_AttachmentMetadata.hashValue.getter()
{
  Hasher.init(_seed:)();
  type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata();
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type AttachmentLedgerMetadata_AttachmentMetadata and conformance AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t)&protocol conformance descriptor for AttachmentLedgerMetadata_AttachmentMetadata);
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

double protocol witness for Message.init() in conformance AttachmentLedgerMetadata_AttachmentMetadata@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;

  UnknownStorage.init()();
  result = 0.0;
  *(_OWORD *)(a2 + *(int *)(a1 + 20)) = xmmword_1ACF5C480;
  return result;
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance AttachmentLedgerMetadata_AttachmentMetadata()
{
  return AttachmentLedgerMetadata_AttachmentMetadata.decodeMessage<A>(decoder:)();
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance AttachmentLedgerMetadata_AttachmentMetadata()
{
  return AttachmentLedgerMetadata_AttachmentMetadata.traverse<A>(visitor:)();
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance AttachmentLedgerMetadata_AttachmentMetadata()
{
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type AttachmentLedgerMetadata_AttachmentMetadata and conformance AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t)&protocol conformance descriptor for AttachmentLedgerMetadata_AttachmentMetadata);
  return _MessageImplementationBase.isEqualTo(message:)();
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AttachmentLedgerMetadata_AttachmentMetadata@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for _protobuf_nameMap != -1)
    swift_once();
  v2 = type metadata accessor for _NameMap();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static AttachmentLedgerMetadata_AttachmentMetadata._protobuf_nameMap);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AttachmentLedgerMetadata_AttachmentMetadata()
{
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type AttachmentLedgerMetadata_AttachmentMetadata and conformance AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t)&protocol conformance descriptor for AttachmentLedgerMetadata_AttachmentMetadata);
  return Message.debugDescription.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AttachmentLedgerMetadata_AttachmentMetadata()
{
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type AttachmentLedgerMetadata_AttachmentMetadata and conformance AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t)&protocol conformance descriptor for AttachmentLedgerMetadata_AttachmentMetadata);
  return Message.hash(into:)();
}

uint64_t specialized static AttachmentLedgerMetadata_AttachmentMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  void (*v18)(_BYTE *, uint64_t, uint64_t);
  char v19;
  void (*v20)(_BYTE *, uint64_t);
  _BYTE v22[12];
  int v23;

  v4 = type metadata accessor for UnknownStorage();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = &v22[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v6);
  v10 = &v22[-v9];
  v11 = *(int *)(type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata() + 20);
  v12 = *(_QWORD *)(a1 + v11);
  v13 = *(_QWORD *)(a1 + v11 + 8);
  v14 = (uint64_t *)(a2 + v11);
  v15 = *v14;
  v16 = v14[1];
  if (v13 >> 60 == 15)
  {
    if (v16 >> 60 == 15)
      goto LABEL_7;
    goto LABEL_5;
  }
  if (v16 >> 60 == 15)
  {
LABEL_5:
    outlined copy of Data?(v12, v13);
    outlined copy of Data?(v15, v16);
    outlined consume of Data?(v12, v13);
    outlined consume of Data?(v15, v16);
LABEL_8:
    v19 = 0;
    return v19 & 1;
  }
  outlined copy of Data?(v12, v13);
  outlined copy of Data?(v15, v16);
  specialized static Data.== infix(_:_:)(v12, v13);
  v23 = v17;
  outlined consume of Data?(v15, v16);
  outlined consume of Data?(v12, v13);
  if ((v23 & 1) == 0)
    goto LABEL_8;
LABEL_7:
  v18 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16);
  v18(v10, a1, v4);
  v18(v8, a2, v4);
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
  v19 = dispatch thunk of static Equatable.== infix(_:_:)();
  v20 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v20(v8, v4);
  v20(v10, v4);
  return v19 & 1;
}

uint64_t base witness table accessor for CustomDebugStringConvertible in AttachmentLedgerMetadata_AttachmentMetadata()
{
  return lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type AttachmentLedgerMetadata_AttachmentMetadata and conformance AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t)&protocol conformance descriptor for AttachmentLedgerMetadata_AttachmentMetadata);
}

uint64_t base witness table accessor for Message in AttachmentLedgerMetadata_AttachmentMetadata()
{
  return lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type AttachmentLedgerMetadata_AttachmentMetadata and conformance AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t)&protocol conformance descriptor for AttachmentLedgerMetadata_AttachmentMetadata);
}

uint64_t base witness table accessor for Hashable in AttachmentLedgerMetadata_AttachmentMetadata()
{
  return lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type AttachmentLedgerMetadata_AttachmentMetadata and conformance AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t)&protocol conformance descriptor for AttachmentLedgerMetadata_AttachmentMetadata);
}

uint64_t base witness table accessor for Equatable in AttachmentLedgerMetadata_AttachmentMetadata()
{
  return lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type AttachmentLedgerMetadata_AttachmentMetadata and conformance AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata, (uint64_t)&protocol conformance descriptor for AttachmentLedgerMetadata_AttachmentMetadata);
}

uint64_t sub_1ACF50588@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for AttachmentLedgerMetadata_AttachmentMetadata() + 20));
  v4 = *v3;
  v5 = v3[1];
  if (v5 >> 60 == 15)
    v6 = 0;
  else
    v6 = *v3;
  v7 = 0xC000000000000000;
  if (v5 >> 60 != 15)
    v7 = v5;
  *a2 = v6;
  a2[1] = v7;
  return outlined copy of Data?(v4, v5);
}

uint64_t *initializeBufferWithCopyOfBuffer for AttachmentLedgerMetadata_AttachmentMetadata(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *((_QWORD *)v10 + 1);
    if (v11 >> 60 == 15)
    {
      *(_OWORD *)v9 = *(_OWORD *)v10;
    }
    else
    {
      v13 = *(_QWORD *)v10;
      outlined copy of Data._Representation(*(_QWORD *)v10, *((_QWORD *)v10 + 1));
      *(_QWORD *)v9 = v13;
      *((_QWORD *)v9 + 1) = v11;
    }
  }
  return a1;
}

uint64_t destroy for AttachmentLedgerMetadata_AttachmentMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t *v6;
  unint64_t v7;

  v4 = type metadata accessor for UnknownStorage();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v6 = (uint64_t *)(a1 + *(int *)(a2 + 20));
  v7 = v6[1];
  if (v7 >> 60 != 15)
    return outlined consume of Data._Representation(*v6, v7);
  return result;
}

uint64_t initializeWithCopy for AttachmentLedgerMetadata_AttachmentMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;

  v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (uint64_t *)(a2 + v7);
  v10 = v9[1];
  if (v10 >> 60 == 15)
  {
    *(_OWORD *)v8 = *(_OWORD *)v9;
  }
  else
  {
    v11 = *v9;
    outlined copy of Data._Representation(*v9, v9[1]);
    *(_QWORD *)v8 = v11;
    *(_QWORD *)(v8 + 8) = v10;
  }
  return a1;
}

uint64_t assignWithCopy for AttachmentLedgerMetadata_AttachmentMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *(_QWORD *)(a2 + v7 + 8);
  if (*(_QWORD *)(a1 + v7 + 8) >> 60 != 15)
  {
    if (v10 >> 60 != 15)
    {
      v12 = *v9;
      outlined copy of Data._Representation(v12, v10);
      v13 = *v8;
      v14 = v8[1];
      *v8 = v12;
      v8[1] = v10;
      outlined consume of Data._Representation(v13, v14);
      return a1;
    }
    outlined destroy of Data((uint64_t)v8);
    goto LABEL_6;
  }
  if (v10 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)v8 = *(_OWORD *)v9;
    return a1;
  }
  v11 = *v9;
  outlined copy of Data._Representation(v11, v10);
  *v8 = v11;
  v8[1] = v10;
  return a1;
}

uint64_t initializeWithTake for AttachmentLedgerMetadata_AttachmentMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for AttachmentLedgerMetadata_AttachmentMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *(_QWORD *)(a1 + v7 + 8);
  if (v10 >> 60 != 15)
  {
    v11 = v9[1];
    if (v11 >> 60 != 15)
    {
      v12 = *v8;
      *v8 = *v9;
      v8[1] = v11;
      outlined consume of Data._Representation(v12, v10);
      return a1;
    }
    outlined destroy of Data((uint64_t)v8);
  }
  *(_OWORD *)v8 = *(_OWORD *)v9;
  return a1;
}

uint64_t getEnumTagSinglePayload for AttachmentLedgerMetadata_AttachmentMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1ACF50958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  BOOL v10;
  unsigned int v11;

  v6 = type metadata accessor for UnknownStorage();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8) >> 60;
  v10 = ((4 * (_DWORD)v9) & 0xC) == 0;
  v11 = ((4 * v9) & 0xC | (v9 >> 2)) ^ 0xF;
  if (v10)
    return 0;
  else
    return v11;
}

uint64_t storeEnumTagSinglePayload for AttachmentLedgerMetadata_AttachmentMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1ACF509EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;

  result = type metadata accessor for UnknownStorage();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  v10 = (_QWORD *)(a1 + *(int *)(a4 + 20));
  *v10 = 0;
  v10[1] = (unint64_t)((~(_DWORD)a2 >> 2) & 3 | (4 * ~(_DWORD)a2)) << 60;
  return result;
}

uint64_t type metadata completion function for AttachmentLedgerMetadata_AttachmentMetadata()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id ProtectedAppsObserver.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t ProtectedAppsObserver.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC14CopresenceCore21ProtectedAppsObserver_delegate;
  swift_beginAccess();
  return MEMORY[0x1AF449918](v1);
}

uint64_t ProtectedAppsObserver.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC14CopresenceCore21ProtectedAppsObserver_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*ProtectedAppsObserver.delegate.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC14CopresenceCore21ProtectedAppsObserver_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1AF449918](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return ActivitySession.sessionManager.modify;
}

id ProtectedAppsObserver.init()()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  objc_super v6;

  *(_QWORD *)&v0[OBJC_IVAR____TtC14CopresenceCore21ProtectedAppsObserver_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for ProtectedAppsObserver();
  v1 = objc_msgSendSuper2(&v6, sel_init);
  v2 = (void *)objc_opt_self();
  v3 = v1;
  v4 = objc_msgSend(objc_msgSend(v2, sel_subjectMonitorRegistry), sel_addMonitor_, v3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v3;
}

uint64_t type metadata accessor for ProtectedAppsObserver()
{
  return objc_opt_self();
}

uint64_t ProtectedAppsObserver.hiddenApps.getter()
{
  id v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v0 = objc_msgSend((id)objc_opt_self(), sel_hiddenApplications);
  type metadata accessor for APApplication();
  v1 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v2)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  swift_bridgeObjectRetain();
  v2 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v2)
    goto LABEL_13;
LABEL_3:
  v15 = MEMORY[0x1E0DEE9D8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = 0;
    v5 = v15;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x1AF448904](v4, v1);
      else
        v6 = *(id *)(v1 + 8 * v4 + 32);
      v7 = v6;
      v8 = objc_msgSend(v6, sel_bundleIdentifier);
      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v11 = v10;

      v13 = *(_QWORD *)(v15 + 16);
      v12 = *(_QWORD *)(v15 + 24);
      if (v13 >= v12 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v12 > 1, v13 + 1, 1);
      ++v4;
      *(_QWORD *)(v15 + 16) = v13 + 1;
      v14 = v15 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v9;
      *(_QWORD *)(v14 + 40) = v11;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    return v5;
  }
  __break(1u);
  return result;
}

id ProtectedAppsObserver.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProtectedAppsObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t protocol witness for ProtectedAppsObserverProtocol.delegate.getter in conformance ProtectedAppsObserver()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **v0) + 0x58))();
}

uint64_t protocol witness for ProtectedAppsObserverProtocol.delegate.setter in conformance ProtectedAppsObserver()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **v0) + 0x60))();
}

void (*protocol witness for ProtectedAppsObserverProtocol.delegate.modify in conformance ProtectedAppsObserver(_QWORD *a1))(_QWORD *a1)
{
  _QWORD **v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **v1) + 0x68))();
  return protocol witness for PresenceDataSource.members.modify in conformance SKPresenceDataSource<A>;
}

uint64_t protocol witness for ProtectedAppsObserverProtocol.hiddenApps.getter in conformance ProtectedAppsObserver()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **v0) + 0x78))();
}

uint64_t specialized ProtectedAppsObserver.appProtectionSubjectsChanged(_:for:)(unint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t i;
  uint64_t j;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t ObjectType;
  _QWORD *v26;
  unint64_t v27;

  v2 = v1;
  v4 = MEMORY[0x1E0DEE9D8];
  v27 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = _CocoaArrayWrapper.endIndex.getter();
    v5 = result;
    if (!result)
      goto LABEL_19;
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v5)
      goto LABEL_19;
  }
  if (v5 < 1)
  {
    __break(1u);
    goto LABEL_36;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    for (i = 0; i != v5; ++i)
    {
      MEMORY[0x1AF448904](i, a1);
      objc_opt_self();
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x1AF448268]();
        if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    for (j = 0; j != v5; ++j)
    {
      v9 = *(void **)(a1 + 8 * j + 32);
      objc_opt_self();
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x1AF448268](v9);
        if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
    }
  }
LABEL_19:
  swift_bridgeObjectRelease();
  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_21:
      result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10 & ~(v10 >> 63), 0);
      if ((v10 & 0x8000000000000000) == 0)
      {
        v26 = v2;
        v11 = 0;
        v12 = v4;
        do
        {
          if ((v27 & 0xC000000000000001) != 0)
            v13 = (id)MEMORY[0x1AF448904](v11, v27);
          else
            v13 = *(id *)(v27 + 8 * v11 + 32);
          v14 = v13;
          v15 = objc_msgSend(v13, sel_bundleIdentifier, v26);
          v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v18 = v17;

          v20 = *(_QWORD *)(v12 + 16);
          v19 = *(_QWORD *)(v12 + 24);
          if (v20 >= v19 >> 1)
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1);
          ++v11;
          *(_QWORD *)(v12 + 16) = v20 + 1;
          v21 = v12 + 16 * v20;
          *(_QWORD *)(v21 + 32) = v16;
          *(_QWORD *)(v21 + 40) = v18;
        }
        while (v10 != v11);
        v22 = swift_bridgeObjectRelease();
        v2 = v26;
        goto LABEL_32;
      }
LABEL_36:
      __break(1u);
      return result;
    }
  }
  else
  {
    v10 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_21;
  }
  v22 = swift_bridgeObjectRelease();
  v12 = MEMORY[0x1E0DEE9D8];
LABEL_32:
  if (!(*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x58))(v22))
    return swift_bridgeObjectRelease();
  v24 = v23;
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 8))(v12, ObjectType, v24);
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_1ACF514CC@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x58))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1ACF5150C(uint64_t a1, _QWORD **a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x60);
  v4 = swift_unknownObjectRetain();
  return v3(v4, v2);
}

uint64_t dispatch thunk of ProtectedAppsObserverProtocol.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ProtectedAppsObserverProtocol.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of ProtectedAppsObserverProtocol.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ProtectedAppsObserverProtocol.hiddenApps.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ProtectedAppsObserverDelegate.appProtectionsChanged(bundleIDs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t method lookup function for ProtectedAppsObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ProtectedAppsObserver.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of ProtectedAppsObserver.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of ProtectedAppsObserver.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ProtectedAppsObserver.appProtectionSubjectsChanged(_:for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ProtectedAppsObserver.hiddenApps.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ActivitySessionContainerProvider.activitySessions.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ActivitySessionContainerProvider.pluginClientReporter.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ActivitySessionContainerProvider.pubSubTopicReporter.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ActivitySessionContainerProvider.topicCategory(groupUUID:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t SessionSuspensionController.__allocating_init(processIdentifier:suspensionTarget:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D87D90]), sel_init);
  type metadata accessor for SessionSuspensionController();
  v7 = swift_allocObject();
  return specialized SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)(a1, a2, a3, (uint64_t)v6, v7);
}

void thunk for @escaping @callee_guaranteed (@guaranteed RBSProcessMonitor, @guaranteed RBSProcessHandle, @guaranteed RBSProcessStateUpdate) -> ()(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (*v7)(id, id, id);
  id v8;
  id v9;
  id v10;

  v7 = *(void (**)(id, id, id))(a1 + 32);
  swift_retain();
  v10 = a2;
  v8 = a3;
  v9 = a4;
  v7(v10, v8, v9);
  swift_release();

}

uint64_t ProcessMonitorStateUpdate.isRunning.getter(char a1)
{
  return a1 & 1;
}

CopresenceCore::ProcessMonitorStateUpdate __swiftcall ProcessMonitorStateUpdate.init(isRunning:)(Swift::Bool isRunning)
{
  return (CopresenceCore::ProcessMonitorStateUpdate)isRunning;
}

uint64_t static SessionSuspensionController.Errors.== infix(_:_:)()
{
  return 1;
}

void SessionSuspensionController.Errors.hash(into:)()
{
  Hasher._combine(_:)(0);
}

Swift::Int SessionSuspensionController.Errors.hashValue.getter()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t SessionSuspensionController.suspensionTarget.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x1AF449918](v0 + 112);
}

uint64_t SessionSuspensionController.suspensionTarget.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 120) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*SessionSuspensionController.suspensionTarget.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x1AF449918](v1 + 112);
  v5 = *(_QWORD *)(v1 + 120);
  v3[3] = v4;
  v3[4] = v5;
  return SessionSuspensionController.suspensionTarget.modify;
}

void SessionSuspensionController.suspensionTarget.modify(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 120) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t SessionSuspensionController.processIdentifier.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned int *)(v0 + 128);
}

uint64_t SessionSuspensionController.processIdentifier.setter(int a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_DWORD *)(v1 + 128) = a1;
  return result;
}

uint64_t (*SessionSuspensionController.processIdentifier.modify())()
{
  swift_beginAccess();
  return ActivitySession.terminatingHandle.modify;
}

uint64_t SessionSuspensionController.processMonitor.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of UserNotificationCenter(v1 + 136, a1);
}

uint64_t key path setter for SessionSuspensionController.suspensionAcquireTask : SessionSuspensionController(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 176);
  *(_QWORD *)(v3 + 176) = v2;
  swift_retain_n();
  SessionSuspensionController.suspensionAcquireTask.didset(v4);
  swift_release();
  return swift_release();
}

void SessionSuspensionController.suspensionAcquireTask.didset(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;

  swift_beginAccess();
  if (*(_QWORD *)(v1 + 176))
  {
    v3 = one-time initialization token for suspensionController;
    swift_retain();
    if (v3 != -1)
      swift_once();
    v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)static Log.suspensionController);
    swift_retain_n();
    v5 = Logger.logObject.getter();
    v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v19 = v8;
      *(_DWORD *)v7 = 136315138;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Task<AnyCancellable, Error>);
      v9 = String.init<A>(reflecting:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ACCCC000, v5, v6, "Tracking suspensionAcquireTask: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v8, -1, -1);
      MEMORY[0x1AF44981C](v7, -1, -1);
      swift_release();

      return;
    }

    goto LABEL_13;
  }
  if (one-time initialization token for suspensionController != -1)
    swift_once();
  v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Log.suspensionController);
  swift_retain_n();
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v12, v13))
  {

LABEL_13:
    swift_release_n();
    return;
  }
  v14 = (uint8_t *)swift_slowAlloc();
  v15 = swift_slowAlloc();
  v19 = v15;
  *(_DWORD *)v14 = 136315138;
  if (a1)
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Task<AnyCancellable, Error>);
    v16 = String.init<A>(reflecting:)();
    v18 = v17;
  }
  else
  {
    v18 = 0xE300000000000000;
    v16 = 7104878;
  }
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v18, &v19);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_release_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1ACCCC000, v12, v13, "No longer tracking suspensionAcquireTask: %s", v14, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1AF44981C](v15, -1, -1);
  MEMORY[0x1AF44981C](v14, -1, -1);

}

uint64_t SessionSuspensionController.suspensionAcquireTask.getter()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t SessionSuspensionController.suspensionAcquireTask.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 176);
  *(_QWORD *)(v1 + 176) = a1;
  swift_retain();
  SessionSuspensionController.suspensionAcquireTask.didset(v3);
  swift_release();
  return swift_release();
}

void (*SessionSuspensionController.suspensionAcquireTask.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_beginAccess();
  v3[3] = *(_QWORD *)(v1 + 176);
  swift_retain();
  return SessionSuspensionController.suspensionAcquireTask.modify;
}

void SessionSuspensionController.suspensionAcquireTask.modify(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v4 = *(_QWORD *)(v3 + 176);
  *(_QWORD *)(v3 + 176) = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if ((a2 & 1) != 0)
  {
    swift_retain_n();
    SessionSuspensionController.suspensionAcquireTask.didset(v4);
    swift_release();
  }
  else
  {
    swift_retain();
    SessionSuspensionController.suspensionAcquireTask.didset(v4);
  }
  swift_release();
  swift_release();
  free(v2);
}

uint64_t key path setter for SessionSuspensionController.cancellables : SessionSuspensionController(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 184) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t SessionSuspensionController.cancellables.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t SessionSuspensionController.cancellables.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 184) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*SessionSuspensionController.cancellables.modify())()
{
  swift_beginAccess();
  return ActivitySession.audioSessionID.modify;
}

uint64_t SessionSuspensionController.__allocating_init(processIdentifier:suspensionTarget:processMonitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = *(_QWORD *)(a4 + 24);
  v10 = *(_QWORD *)(a4 + 32);
  v11 = __swift_mutable_project_boxed_opaque_existential_1(a4, v9);
  v12 = specialized SessionSuspensionController.__allocating_init(processIdentifier:suspensionTarget:processMonitor:)(a1, a2, a3, v11, v4, v9, v10);
  __swift_destroy_boxed_opaque_existential_1Tm(a4);
  return v12;
}

uint64_t type metadata accessor for SessionSuspensionController()
{
  return objc_opt_self();
}

uint64_t SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v9 = *(_QWORD *)(a4 + 24);
  v10 = *(_QWORD *)(a4 + 32);
  v11 = __swift_mutable_project_boxed_opaque_existential_1(a4, v9);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v14 + 16))(v13);
  v15 = specialized SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)(a1, a2, a3, (uint64_t)v13, v4, v9, v10);
  __swift_destroy_boxed_opaque_existential_1Tm(a4);
  return v15;
}

uint64_t closure #1 in SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[5] = a4;
  v5[6] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>.Iterator);
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>);
  AsyncStream.makeAsyncIterator()();
  swift_beginAccess();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = closure #1 in SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:);
  return AsyncStream.Iterator.next(isolation:)();
}

{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  int v1;
  uint64_t Strong;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;

  v1 = *(unsigned __int8 *)(v0 + 96);
  if (v1 == 2 || (Strong = swift_weakLoadStrong(), (*(_QWORD *)(v0 + 88) = Strong) == 0))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if ((v1 & 1) != 0)
    {
      if (one-time initialization token for suspensionController != -1)
        swift_once();
      v8 = type metadata accessor for Logger();
      __swift_project_value_buffer(v8, (uint64_t)static Log.suspensionController);
      v4 = Logger.logObject.getter();
      v9 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v4, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1ACCCC000, v4, v9, "Received notification that application is running.", v10, 2u);
        MEMORY[0x1AF44981C](v10, -1, -1);
      }
    }
    else
    {
      if (one-time initialization token for suspensionController != -1)
        swift_once();
      v3 = type metadata accessor for Logger();
      __swift_project_value_buffer(v3, (uint64_t)static Log.suspensionController);
      v4 = Logger.logObject.getter();
      v5 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v4, v5))
      {
        v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1ACCCC000, v4, v5, "Received notification that application isn't running", v6, 2u);
        MEMORY[0x1AF44981C](v6, -1, -1);
      }
    }

    return swift_task_switch();
  }
}

{
  SessionSuspensionController.releaseAssertionIfNecessary()();
  return swift_task_switch();
}

{
  uint64_t v0;
  _QWORD *v1;

  swift_release();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = closure #1 in SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:);
  return AsyncStream.Iterator.next(isolation:)();
}

{
  SessionSuspensionController.acquireAssertionIfNecessary()();
  return swift_task_switch();
}

_QWORD *SessionSuspensionController.deinit()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[20];
  v2 = v0[21];
  __swift_project_boxed_opaque_existential_1(v0 + 17, v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
  outlined destroy of weak ActivitySessionManagerProtocol?((uint64_t)(v0 + 14));
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 17));
  swift_release();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t SessionSuspensionController.__deallocating_deinit()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[20];
  v2 = v0[21];
  __swift_project_boxed_opaque_existential_1(v0 + 17, v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
  outlined destroy of weak ActivitySessionManagerProtocol?((uint64_t)(v0 + 14));
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 17));
  swift_release();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

Swift::Void __swiftcall SessionSuspensionController.acquireAssertionIfNecessary()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[24];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[3];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v2);
  v4 = &v26[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (one-time initialization token for suspensionController != -1)
    swift_once();
  v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)static Log.suspensionController);
  swift_retain_n();
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v29[0] = v9;
    *(_DWORD *)v8 = 136315138;
    swift_beginAccess();
    if (*(_QWORD *)(v0 + 176))
    {
      v28 = *(_QWORD *)(v0 + 176);
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Task<AnyCancellable, Error>);
      v10 = String.init<A>(reflecting:)();
      v12 = v11;
    }
    else
    {
      v10 = 7104878;
      v12 = 0xE300000000000000;
    }
    v28 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v12, v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_1ACCCC000, v6, v7, "Received request to acquire suspension, current suspensionAcquireTask: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v9, -1, -1);
    MEMORY[0x1AF44981C](v8, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  v13 = (uint64_t *)(v0 + 176);
  swift_beginAccess();
  if (*(_QWORD *)(v0 + 176))
  {
    swift_retain_n();
    v14 = Logger.logObject.getter();
    v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v28 = v17;
      *(_DWORD *)v16 = 136315138;
      if (*v13)
      {
        v27 = *v13;
        swift_retain();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Task<AnyCancellable, Error>);
        v18 = String.init<A>(reflecting:)();
        v20 = v19;
      }
      else
      {
        v18 = 7104878;
        v20 = 0xE300000000000000;
      }
      v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v20, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_1ACCCC000, v14, v15, "Not re-requesting assertion since there's already a task trying to grab an assertion %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v17, -1, -1);
      MEMORY[0x1AF44981C](v16, -1, -1);
    }
    else
    {
      swift_release_n();
    }

  }
  else
  {
    v21 = type metadata accessor for TaskPriority();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v4, 1, 1, v21);
    v22 = lazy protocol witness table accessor for type SessionSuspensionController and conformance SessionSuspensionController();
    v23 = (_QWORD *)swift_allocObject();
    v23[2] = v1;
    v23[3] = v22;
    v23[4] = v1;
    swift_retain_n();
    v24 = _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfC7Combine14AnyCancellableC_Tgm5((uint64_t)v4, (uint64_t)&async function pointer to partial apply for closure #1 in SessionSuspensionController.acquireAssertionIfNecessary(), (uint64_t)v23);
    v25 = *(_QWORD *)(v1 + 176);
    *(_QWORD *)(v1 + 176) = v24;
    swift_retain();
    SessionSuspensionController.suspensionAcquireTask.didset(v25);
    swift_release();
    swift_release();
  }
}

uint64_t closure #1 in SessionSuspensionController.acquireAssertionIfNecessary()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 72) = a1;
  *(_QWORD *)(v4 + 80) = a4;
  return swift_task_switch();
}

uint64_t closure #1 in SessionSuspensionController.acquireAssertionIfNecessary()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  _QWORD *v5;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 80) + 112;
  swift_beginAccess();
  v2 = MEMORY[0x1AF449918](v1);
  *(_QWORD *)(v0 + 88) = v2;
  if (v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + 120);
    ObjectType = swift_getObjectType();
    v18 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v3 + 8) + *(_QWORD *)(v3 + 8));
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v5;
    *v5 = v0;
    v5[1] = closure #1 in SessionSuspensionController.acquireAssertionIfNecessary();
    return v18(ObjectType, v3);
  }
  else
  {
    lazy protocol witness table accessor for type SessionSuspensionController.Errors and conformance SessionSuspensionController.Errors();
    v7 = (void *)swift_allocError();
    swift_willThrow();
    if (one-time initialization token for suspensionController != -1)
      swift_once();
    v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)static Log.suspensionController);
    v9 = v7;
    v10 = v7;
    v11 = Logger.logObject.getter();
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v19 = v14;
      *(_DWORD *)v13 = 136315138;
      *(_QWORD *)(v0 + 40) = v7;
      v15 = v7;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      v16 = String.init<A>(reflecting:)();
      *(_QWORD *)(v0 + 48) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v17, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1ACCCC000, v11, v12, "Failed to grab assertion, reason: %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v14, -1, -1);
      MEMORY[0x1AF44981C](v13, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t (*v22)(void);
  uint64_t v24[2];

  v1 = *(void **)(v0 + 112);
  static Task<>.checkCancellation()();
  if (v1)
  {
    v2 = v1;
    swift_release();
    swift_unknownObjectRelease();
    if (one-time initialization token for suspensionController != -1)
      swift_once();
    v3 = type metadata accessor for Logger();
    __swift_project_value_buffer(v3, (uint64_t)static Log.suspensionController);
    v4 = v1;
    v5 = v1;
    v6 = Logger.logObject.getter();
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v24[0] = v9;
      *(_DWORD *)v8 = 136315138;
      *(_QWORD *)(v0 + 40) = v2;
      v10 = v2;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      v11 = String.init<A>(reflecting:)();
      *(_QWORD *)(v0 + 48) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1ACCCC000, v6, v7, "Failed to grab assertion, reason: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v9, -1, -1);
      MEMORY[0x1AF44981C](v8, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    v22 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    if (one-time initialization token for suspensionController != -1)
      swift_once();
    v13 = type metadata accessor for Logger();
    __swift_project_value_buffer(v13, (uint64_t)static Log.suspensionController);
    swift_retain_n();
    v14 = Logger.logObject.getter();
    v15 = static os_log_type_t.default.getter();
    v16 = os_log_type_enabled(v14, v15);
    v17 = *(_QWORD *)(v0 + 104);
    if (v16)
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v24[0] = v19;
      *(_DWORD *)v18 = 136315138;
      *(_QWORD *)(v0 + 56) = v17;
      type metadata accessor for AnyCancellable();
      swift_retain();
      v20 = String.init<A>(reflecting:)();
      *(_QWORD *)(v0 + 64) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_1ACCCC000, v14, v15, "New assertion: %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF44981C](v19, -1, -1);
      MEMORY[0x1AF44981C](v18, -1, -1);

      swift_unknownObjectRelease();
    }
    else
    {
      swift_release_n();
      swift_unknownObjectRelease();

    }
    **(_QWORD **)(v0 + 72) = *(_QWORD *)(v0 + 104);
    v22 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v22();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;

  swift_unknownObjectRelease();
  v1 = *(void **)(v0 + 112);
  if (one-time initialization token for suspensionController != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.suspensionController);
  v3 = v1;
  v4 = v1;
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v13 = v8;
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v0 + 40) = v1;
    v9 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v10 = String.init<A>(reflecting:)();
    *(_QWORD *)(v0 + 48) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1ACCCC000, v5, v6, "Failed to grab assertion, reason: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v8, -1, -1);
    MEMORY[0x1AF44981C](v7, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in SessionSuspensionController.acquireAssertionIfNecessary()(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 104) = a1;
  *(_QWORD *)(v3 + 112) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

Swift::Void __swiftcall SessionSuspensionController.releaseAssertionIfNecessary()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13[3];

  v1 = v0;
  if (one-time initialization token for suspensionController != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.suspensionController);
  swift_retain_n();
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v13[0] = v6;
    *(_DWORD *)v5 = 136315138;
    swift_beginAccess();
    if (*(_QWORD *)(v1 + 176))
    {
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Task<AnyCancellable, Error>);
      v7 = String.init<A>(reflecting:)();
      v9 = v8;
    }
    else
    {
      v9 = 0xE300000000000000;
      v7 = 7104878;
    }
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v9, v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ACCCC000, v3, v4, "Received request to release assertion: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF44981C](v6, -1, -1);
    MEMORY[0x1AF44981C](v5, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_beginAccess();
  v10 = *(_QWORD *)(v1 + 176);
  if (v10)
  {
    v11 = type metadata accessor for AnyCancellable();
    swift_retain();
    v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    MEMORY[0x1AF448418](v10, v11, v12, MEMORY[0x1E0DEDB38]);
    swift_release();
    v10 = *(_QWORD *)(v1 + 176);
  }
  *(_QWORD *)(v1 + 176) = 0;
  SessionSuspensionController.suspensionAcquireTask.didset(v10);
  swift_release();
}

uint64_t SessionSuspensionController.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t protocol witness for SessionSuspensionControllerProtocol.init(processIdentifier:suspensionTarget:) in conformance SessionSuspensionController@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  id v8;
  uint64_t v9;
  uint64_t result;

  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D87D90]), sel_init);
  type metadata accessor for SessionSuspensionController();
  v9 = swift_allocObject();
  result = specialized SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)(a1, a2, a3, (uint64_t)v8, v9);
  *a4 = result;
  return result;
}

uint64_t RBSProcessMonitor.listenForUpdates(pid:)(int a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _BYTE v16[16];
  uint64_t v17;
  _QWORD aBlock[6];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>.Continuation.BufferingPolicy);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>.Continuation?);
  v7 = swift_allocBox();
  v9 = v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v17 = v9;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DF07B8], v3);
  AsyncStream.init(_:bufferingPolicy:_:)();
  v11 = swift_allocObject();
  *(_DWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = v7;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = partial apply for closure #2 in RBSProcessMonitor.listenForUpdates(pid:);
  *(_QWORD *)(v12 + 24) = v11;
  aBlock[4] = partial apply for thunk for @callee_guaranteed (@guaranteed RBSProcessMonitorConfiguring) -> ();
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed RBSProcessMonitorConfiguring) -> ();
  aBlock[3] = &block_descriptor_45;
  v13 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_updateConfiguration_, v13);
  _Block_release(v13);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t closure #1 in RBSProcessMonitor.listenForUpdates(pid:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  outlined destroy of AsyncStream<ProcessMonitorStateUpdate>.Continuation?(a2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>.Continuation);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

void closure #2 in RBSProcessMonitor.listenForUpdates(pid:)(void *a1, uint64_t a2, unint64_t a3)
{
  id v5;
  void *v6;
  uint64_t inited;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  Class isa;
  id v13;
  uint64_t v14;
  id v15;
  Class v16;
  void *v17;
  id v18;
  unint64_t aBlock[6];

  v5 = objc_msgSend((id)objc_opt_self(), sel_identifierWithPid_, a2);
  if (v5)
  {
    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1ACF59E40;
    *(_QWORD *)(inited + 32) = v6;
    aBlock[0] = inited;
    specialized Array._endMutation()();
    if (aBlock[0] >> 62)
    {
      v10 = v6;
      swift_bridgeObjectRetain();
      v11 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v11)
        goto LABEL_6;
    }
    else
    {
      v8 = *(_QWORD *)((aBlock[0] & 0xFFFFFFFFFFFFF8) + 0x10);
      v9 = v6;
      if (!v8)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for RBSProcessIdentifier);
        lazy protocol witness table accessor for type RBSProcessIdentifier and conformance NSObject();
        isa = Set._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        v13 = objc_msgSend((id)objc_opt_self(), sel_predicateMatchingIdentifiers_, isa);

        v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = xmmword_1ACF59E40;
        *(_QWORD *)(v14 + 32) = v13;
        specialized Array._endMutation()();
        type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for RBSProcessPredicate);
        v15 = v13;
        v16 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        objc_msgSend(a1, sel_setPredicates_, v16);

        aBlock[4] = (unint64_t)partial apply for closure #1 in closure #2 in RBSProcessMonitor.listenForUpdates(pid:);
        aBlock[5] = a3;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 1107296256;
        aBlock[2] = (unint64_t)thunk for @escaping @callee_guaranteed (@guaranteed RBSProcessMonitor, @guaranteed RBSProcessHandle, @guaranteed RBSProcessStateUpdate) -> ();
        aBlock[3] = (unint64_t)&block_descriptor_17_2;
        v17 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(a1, sel_setUpdateHandler_, v17);
        _Block_release(v17);
        v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D87DC0]), sel_init);
        objc_msgSend(v18, sel_setValues_, 1);
        objc_msgSend(a1, sel_setStateDescriptor_, v18);

        return;
      }
    }
    specialized Set.init(_nonEmptyArrayLiteral:)(aBlock[0]);
    goto LABEL_6;
  }
}

uint64_t closure #1 in closure #2 in RBSProcessMonitor.listenForUpdates(pid:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  _BYTE v15[8];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>.Continuation?);
  MEMORY[0x1E0C80A78](v4);
  v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>.Continuation.YieldResult);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = swift_projectBox();
  swift_beginAccess();
  outlined init with copy of AsyncStream<ProcessMonitorStateUpdate>.Continuation?(v11, (uint64_t)v6);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>.Continuation);
  v13 = *(_QWORD *)(v12 - 8);
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v12);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v15[7] = specialized ProcessMonitorStateUpdate.init(_:)(a3) & 1;
    AsyncStream.Continuation.yield(_:)();
    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v13 + 8))(v6, v12);
  }
  return result;
}

uint64_t protocol witness for ProcessMonitorProtocol.listenForUpdates(pid:) in conformance RBSProcessMonitor(int a1)
{
  return RBSProcessMonitor.listenForUpdates(pid:)(a1);
}

uint64_t specialized SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];

  v33 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>);
  v31 = *(_QWORD *)(v12 - 8);
  v32 = v12;
  v13 = *(_QWORD *)(v31 + 64);
  v14 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v30 - v16;
  v35[3] = type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for RBSProcessMonitor);
  v35[4] = &protocol witness table for RBSProcessMonitor;
  v35[0] = a4;
  swift_defaultActor_initialize();
  *(_QWORD *)(a5 + 120) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(a5 + 176) = 0;
  *(_QWORD *)(a5 + 184) = MEMORY[0x1E0DEE9E8];
  *(_DWORD *)(a5 + 128) = a1;
  swift_beginAccess();
  *(_QWORD *)(a5 + 120) = a3;
  swift_unknownObjectWeakAssign();
  outlined init with copy of UserNotificationCenter((uint64_t)v35, a5 + 136);
  v19 = *(_QWORD *)(a5 + 160);
  v18 = *(_QWORD *)(a5 + 168);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a5 + 136), v19);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 8);
  v30 = v17;
  v20(a1, v19, v18);
  v21 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v11, 1, 1, v21);
  v22 = swift_allocObject();
  swift_weakInit();
  v23 = v31;
  v24 = v32;
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v15, v17, v32);
  v25 = v23;
  v26 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = 0;
  *(_QWORD *)(v27 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v25 + 32))(v27 + v26, v15, v24);
  *(_QWORD *)(v27 + ((v13 + v26 + 7) & 0xFFFFFFFFFFFFFFF8)) = v22;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v11, (uint64_t)&closure #1 in SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)partial apply, v27);
  type metadata accessor for AnyCancellable();
  swift_allocObject();
  swift_retain();
  v28 = AnyCancellable.init(_:)();
  swift_beginAccess();
  specialized Set._Variant.insert(_:)(&v34, v28);
  swift_endAccess();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v30, v24);
  return a5;
}

uint64_t specialized SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41[5];

  v35 = a3;
  v39 = a2;
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>);
  v37 = *(_QWORD *)(v15 - 8);
  v38 = v15;
  v16 = *(_QWORD *)(v37 + 64);
  v17 = MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v34 - v19;
  v41[3] = a6;
  v41[4] = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v41);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(boxed_opaque_existential_1, a4, a6);
  swift_defaultActor_initialize();
  *(_QWORD *)(a5 + 120) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(a5 + 176) = 0;
  *(_QWORD *)(a5 + 184) = MEMORY[0x1E0DEE9E8];
  *(_DWORD *)(a5 + 128) = a1;
  swift_beginAccess();
  *(_QWORD *)(a5 + 120) = v35;
  swift_unknownObjectWeakAssign();
  outlined init with copy of UserNotificationCenter((uint64_t)v41, a5 + 136);
  v23 = *(_QWORD *)(a5 + 160);
  v22 = *(_QWORD *)(a5 + 168);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a5 + 136), v23);
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 8);
  v36 = v20;
  v24(a1, v23, v22);
  v25 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v14, 1, 1, v25);
  v26 = swift_allocObject();
  swift_weakInit();
  v27 = v37;
  v28 = v38;
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v18, v20, v38);
  v29 = v27;
  v30 = (*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = 0;
  *(_QWORD *)(v31 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v29 + 32))(v31 + v30, v18, v28);
  *(_QWORD *)(v31 + ((v16 + v30 + 7) & 0xFFFFFFFFFFFFFFF8)) = v26;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v14, (uint64_t)&async function pointer to partial apply for closure #1 in SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:), v31);
  type metadata accessor for AnyCancellable();
  swift_allocObject();
  swift_retain();
  v32 = AnyCancellable.init(_:)();
  swift_beginAccess();
  specialized Set._Variant.insert(_:)(&v40, v32);
  swift_endAccess();
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v41);
  swift_release();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v28);
  return a5;
}

uint64_t specialized SessionSuspensionController.__allocating_init(processIdentifier:suspensionTarget:processMonitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v13 = *(_QWORD *)(a6 - 8);
  MEMORY[0x1E0C80A78](a1);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SessionSuspensionController();
  v16 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a4, a6);
  return specialized SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)(a1, a2, a3, (uint64_t)v15, v16, a6, a7);
}

unint64_t lazy protocol witness table accessor for type SessionSuspensionController and conformance SessionSuspensionController()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type SessionSuspensionController and conformance SessionSuspensionController;
  if (!lazy protocol witness table cache variable for type SessionSuspensionController and conformance SessionSuspensionController)
  {
    v1 = type metadata accessor for SessionSuspensionController();
    result = MEMORY[0x1AF44972C](&protocol conformance descriptor for SessionSuspensionController, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SessionSuspensionController and conformance SessionSuspensionController);
  }
  return result;
}

uint64_t sub_1ACF5448C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SessionSuspensionController.acquireAssertionIfNecessary()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for closure #1 in closure #1 in AsyncSerialQueue.performAndWaitFor<A>(_:);
  v5[9] = a1;
  v5[10] = v4;
  return swift_task_switch();
}

uint64_t specialized ProcessMonitorStateUpdate.init(_:)(void *a1)
{
  id v2;
  void *v3;
  unsigned int v5;

  v2 = objc_msgSend(a1, sel_state);
  if (v2)
  {
    v3 = v2;
    if (objc_msgSend(v2, sel_taskState) == 4)
    {

      return 1;
    }
    v5 = objc_msgSend(v3, sel_taskState);

    if (v5 == 2)
      return 1;
  }
  else
  {

  }
  return 0;
}

uint64_t partial apply for closure #1 in RBSProcessMonitor.listenForUpdates(pid:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in RBSProcessMonitor.listenForUpdates(pid:)(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1ACF545BC()
{
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #2 in RBSProcessMonitor.listenForUpdates(pid:)(void *a1)
{
  uint64_t v1;

  closure #2 in RBSProcessMonitor.listenForUpdates(pid:)(a1, *(unsigned int *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1ACF545EC()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed RBSProcessMonitorConfiguring) -> ()(uint64_t a1)
{
  uint64_t v1;

  return thunk for @callee_guaranteed (@guaranteed RBSProcessMonitorConfiguring) -> ()(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t block_destroy_helper_43()
{
  return swift_release();
}

unint64_t lazy protocol witness table accessor for type SessionSuspensionController.Errors and conformance SessionSuspensionController.Errors()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SessionSuspensionController.Errors and conformance SessionSuspensionController.Errors;
  if (!lazy protocol witness table cache variable for type SessionSuspensionController.Errors and conformance SessionSuspensionController.Errors)
  {
    result = MEMORY[0x1AF44972C](&protocol conformance descriptor for SessionSuspensionController.Errors, &type metadata for SessionSuspensionController.Errors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SessionSuspensionController.Errors and conformance SessionSuspensionController.Errors);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SessionSuspensionController.Errors and conformance SessionSuspensionController.Errors;
  if (!lazy protocol witness table cache variable for type SessionSuspensionController.Errors and conformance SessionSuspensionController.Errors)
  {
    result = MEMORY[0x1AF44972C](&protocol conformance descriptor for SessionSuspensionController.Errors, &type metadata for SessionSuspensionController.Errors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SessionSuspensionController.Errors and conformance SessionSuspensionController.Errors);
  }
  return result;
}

uint64_t sub_1ACF54654@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = *a1 + 112;
  swift_beginAccess();
  result = MEMORY[0x1AF449918](v4);
  v6 = *(_QWORD *)(v3 + 120);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_1ACF546AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 120) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1ACF54704@<X0>(uint64_t *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_DWORD *)(v3 + 128);
  return result;
}

uint64_t sub_1ACF54748(int *a1, uint64_t *a2)
{
  int v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_DWORD *)(v3 + 128) = v2;
  return result;
}

uint64_t sub_1ACF54788@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 176);
  return swift_retain();
}

uint64_t sub_1ACF547D4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 184);
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of SessionSuspensionControllerTarget.acquireSuspensionAssertion()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 8) + *(_QWORD *)(a2 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = dispatch thunk of ConversationManagerClientProtocol.createActivitySession(with:onConversationWithUUID:);
  return v7(a1, a2);
}

uint64_t dispatch thunk of SessionSuspensionControllerProtocol.init(processIdentifier:suspensionTarget:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t storeEnumTagSinglePayload for ProcessMonitorStateUpdate(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1ACF548E0 + 4 * byte_1ACF6BC25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1ACF54914 + 4 * byte_1ACF6BC20[v4]))();
}

uint64_t sub_1ACF54914(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1ACF5491C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1ACF54924);
  return result;
}

uint64_t sub_1ACF54930(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1ACF54938);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1ACF5493C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1ACF54944(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProcessMonitorStateUpdate()
{
  return &type metadata for ProcessMonitorStateUpdate;
}

uint64_t dispatch thunk of ProcessMonitorProtocol.listenForUpdates(pid:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ProcessMonitorProtocol.invalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t method lookup function for SessionSuspensionController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SessionSuspensionController.suspensionTarget.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of SessionSuspensionController.suspensionTarget.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of SessionSuspensionController.suspensionTarget.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of SessionSuspensionController.processIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of SessionSuspensionController.processIdentifier.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of SessionSuspensionController.processIdentifier.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of SessionSuspensionController.suspensionAcquireTask.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of SessionSuspensionController.suspensionAcquireTask.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of SessionSuspensionController.suspensionAcquireTask.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of SessionSuspensionController.cancellables.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of SessionSuspensionController.cancellables.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of SessionSuspensionController.cancellables.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of SessionSuspensionController.__allocating_init(processIdentifier:suspensionTarget:processMonitor:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of SessionSuspensionController.acquireAssertionIfNecessary()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of SessionSuspensionController.releaseAssertionIfNecessary()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t storeEnumTagSinglePayload for SessionSuspensionController.Errors(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1ACF54A6C + 4 * byte_1ACF6BC2A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1ACF54A8C + 4 * byte_1ACF6BC2F[v4]))();
}

_BYTE *sub_1ACF54A6C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1ACF54A8C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1ACF54A94(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1ACF54A9C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1ACF54AA4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1ACF54AAC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SessionSuspensionController.Errors()
{
  return &type metadata for SessionSuspensionController.Errors;
}

unint64_t lazy protocol witness table accessor for type RBSProcessIdentifier and conformance NSObject()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type RBSProcessIdentifier and conformance NSObject;
  if (!lazy protocol witness table cache variable for type RBSProcessIdentifier and conformance NSObject)
  {
    v1 = type metadata accessor for TUConversationActivity(255, &lazy cache variable for type metadata for RBSProcessIdentifier);
    result = MEMORY[0x1AF44972C](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RBSProcessIdentifier and conformance NSObject);
  }
  return result;
}

uint64_t partial apply for closure #1 in closure #2 in RBSProcessMonitor.listenForUpdates(pid:)(uint64_t a1, uint64_t a2, void *a3)
{
  return closure #1 in closure #2 in RBSProcessMonitor.listenForUpdates(pid:)(a1, a2, a3);
}

uint64_t outlined init with copy of AsyncStream<ProcessMonitorStateUpdate>.Continuation?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>.Continuation?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of AsyncStream<ProcessMonitorStateUpdate>.Continuation?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>.Continuation?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1ACF54BF4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>)
                 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATQ0_;
  return closure #1 in SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)(a1, v6, v7, v8, v9);
}

uint64_t objectdestroy_24Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t closure #1 in SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)partial apply(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<ProcessMonitorStateUpdate>)
                 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = partial apply for closure #1 in closure #1 in AsyncSerialQueue.performAndWaitFor<A>(_:);
  return closure #1 in SessionSuspensionController.init(processIdentifier:suspensionTarget:processMonitor:)(a1, v6, v7, v8, v9);
}

uint64_t OnceToken.lock.getter()
{
  return swift_retain();
}

uint64_t OnceToken.called.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t OnceToken.called.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 24) = a1;
  return result;
}

uint64_t (*OnceToken.called.modify())()
{
  swift_beginAccess();
  return ActivitySession.audioSessionID.modify;
}

void OnceToken.execute(callback:)(void (*a1)(void))
{
  _QWORD *v1;
  uint64_t v3;

  v3 = v1[2];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v3 + 16));
  if (((*(uint64_t (**)(void))(*v1 + 96))() & 1) == 0)
  {
    a1();
    (*(void (**)(uint64_t))(*v1 + 104))(1);
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v3 + 16));
}

uint64_t OnceToken.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t OnceToken.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t OnceToken.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  _DWORD *v2;

  v0 = swift_allocObject();
  type metadata accessor for Lock();
  v1 = swift_allocObject();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = 0;
  *(_QWORD *)(v0 + 16) = v1;
  *(_BYTE *)(v0 + 24) = 0;
  return v0;
}

uint64_t OnceToken.init()()
{
  uint64_t v0;
  uint64_t v1;
  _DWORD *v2;

  type metadata accessor for Lock();
  v1 = swift_allocObject();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = 0;
  *(_QWORD *)(v0 + 16) = v1;
  *(_BYTE *)(v0 + 24) = 0;
  return v0;
}

uint64_t sub_1ACF55028@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 96))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1ACF5505C(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 104))(*a1);
}

uint64_t type metadata accessor for OnceToken()
{
  return objc_opt_self();
}

uint64_t method lookup function for OnceToken()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of OnceToken.called.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of OnceToken.called.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of OnceToken.called.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of OnceToken.execute(callback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of OnceToken.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t ResourceBundleClass.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

objc_class *one-time initialization function for resourceBundle()
{
  uint64_t ObjCClassFromMetadata;
  objc_class *result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = (objc_class *)objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  resourceBundle.super.isa = result;
  return result;
}

uint64_t one-time initialization function for sharePlay()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource();
  __swift_allocate_value_buffer(v0, static ImageResource.sharePlay);
  __swift_project_value_buffer(v0, (uint64_t)static ImageResource.sharePlay);
  if (one-time initialization token for resourceBundle != -1)
    swift_once();
  return MEMORY[0x1AF447338](0x616C506572616853, 0xE900000000000079, resourceBundle.super.isa);
}

uint64_t ImageResource.sharePlay.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for sharePlay != -1)
    swift_once();
  v0 = type metadata accessor for ImageResource();
  return __swift_project_value_buffer(v0, (uint64_t)static ImageResource.sharePlay);
}

uint64_t static ImageResource.sharePlay.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for sharePlay != -1)
    swift_once();
  v2 = type metadata accessor for ImageResource();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static ImageResource.sharePlay);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t __getGKLocalPlayerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getGKDaemonProxyClass_block_invoke_cold_1(v0);
}

uint64_t __getGKDaemonProxyClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[CPCrashReporter simulateCrashReportWithReason:pid:code:].cold.1(v0);
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t DataProtocol.copyBytes(to:count:)()
{
  return MEMORY[0x1E0CAE528]();
}

uint64_t DataProtocol.copyBytes(to:)()
{
  return MEMORY[0x1E0CAE530]();
}

uint64_t DateInterval.end.getter()
{
  return MEMORY[0x1E0CAE580]();
}

uint64_t DateInterval.end.setter()
{
  return MEMORY[0x1E0CAE588]();
}

uint64_t DateInterval.init(start:duration:)()
{
  return MEMORY[0x1E0CAE598]();
}

uint64_t DateInterval.start.getter()
{
  return MEMORY[0x1E0CAE5A0]();
}

uint64_t DateInterval.start.setter()
{
  return MEMORY[0x1E0CAE5A8]();
}

uint64_t DateInterval.duration.getter()
{
  return MEMORY[0x1E0CAE5C0]();
}

uint64_t DateInterval.init()()
{
  return MEMORY[0x1E0CAE5C8]();
}

uint64_t type metadata accessor for DateInterval()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t type metadata accessor for Notification()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x1E0CAEE50]();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5;
  void *v6;
  Swift::String result;

  v5 = MEMORY[0x1E0CAF328](_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return MEMORY[0x1E0CAFB50]();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)()
{
  return MEMORY[0x1E0CAFC18]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x1E0CAFDA0]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x1E0CAFE38](retstr);
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t URL.appending<A>(component:directoryHint:)()
{
  return MEMORY[0x1E0CAFFE0]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x1E0CAFFF8]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
  MEMORY[0x1E0CB0088]();
}

uint64_t Data.description.getter()
{
  return MEMORY[0x1E0CB0110]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return MEMORY[0x1E0CB0160]();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return MEMORY[0x1E0CB0188]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1E0CB01F0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t Date.init(timeInterval:since:)()
{
  return MEMORY[0x1E0CB0598]();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x1E0CB05D8]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x1E0CB06B8]();
}

uint64_t static Date.> infix(_:_:)()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t Date.init()()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t UUID.init(uuidString:)()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x1E0CB0910]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x1E0CB0930]();
}

uint64_t static UUID.== infix(_:_:)()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t UUID.init(uuid:)()
{
  return MEMORY[0x1E0CB0970]();
}

uint64_t UUID.uuid.getter()
{
  return MEMORY[0x1E0CB0978]();
}

uint64_t UUID.hashValue.getter()
{
  return MEMORY[0x1E0CB0980]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return MEMORY[0x1E0CA9B98]();
}

uint64_t type metadata accessor for ImageResource()
{
  return MEMORY[0x1E0CA9BA8]();
}

uint64_t Google_Protobuf_Empty.init()()
{
  return MEMORY[0x1E0D3E850]();
}

uint64_t type metadata accessor for Google_Protobuf_Empty()
{
  return MEMORY[0x1E0D3E858]();
}

uint64_t type metadata accessor for ProtobufFixed64()
{
  return MEMORY[0x1E0D3E980]();
}

uint64_t UnknownStorage.traverse<A>(visitor:)()
{
  return MEMORY[0x1E0D3E988]();
}

uint64_t UnknownStorage.init()()
{
  return MEMORY[0x1E0D3E990]();
}

uint64_t type metadata accessor for UnknownStorage()
{
  return MEMORY[0x1E0D3E998]();
}

uint64_t BinaryDecodingOptions.init()()
{
  return MEMORY[0x1E0D3EA60]();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return MEMORY[0x1E0D3EA68]();
}

uint64_t _MessageImplementationBase._protobuf_generated_isEqualTo(other:)()
{
  return MEMORY[0x1E0D3EA80]();
}

uint64_t _MessageImplementationBase.isEqualTo(message:)()
{
  return MEMORY[0x1E0D3EA90]();
}

uint64_t Enum.hash(into:)()
{
  return MEMORY[0x1E0D3EA98]();
}

uint64_t dispatch thunk of Decoder.decodeMapField<A, B>(fieldType:value:)()
{
  return MEMORY[0x1E0D3EAA8]();
}

uint64_t dispatch thunk of Decoder.nextFieldNumber()()
{
  return MEMORY[0x1E0D3EAB8]();
}

uint64_t dispatch thunk of Decoder.handleConflictingOneOf()()
{
  return MEMORY[0x1E0D3EAC0]();
}

uint64_t dispatch thunk of Decoder.decodeSingularBoolField(value:)()
{
  return MEMORY[0x1E0D3EAD8]();
}

uint64_t dispatch thunk of Decoder.decodeSingularEnumField<A>(value:)()
{
  return MEMORY[0x1E0D3EAE8]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedBytesField(value:)()
{
  return MEMORY[0x1E0D3EAF0]();
}

uint64_t dispatch thunk of Decoder.decodeSingularBytesField(value:)()
{
  return MEMORY[0x1E0D3EB10]();
}

{
  return MEMORY[0x1E0D3EB18]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedStringField(value:)()
{
  return MEMORY[0x1E0D3EB58]();
}

uint64_t dispatch thunk of Decoder.decodeSingularStringField(value:)()
{
  return MEMORY[0x1E0D3EB88]();
}

{
  return MEMORY[0x1E0D3EB90]();
}

uint64_t dispatch thunk of Decoder.decodeSingularUInt32Field(value:)()
{
  return MEMORY[0x1E0D3EBA0]();
}

uint64_t dispatch thunk of Decoder.decodeSingularUInt64Field(value:)()
{
  return MEMORY[0x1E0D3EBB0]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedFixed64Field(value:)()
{
  return MEMORY[0x1E0D3EBB8]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)()
{
  return MEMORY[0x1E0D3EBC0]();
}

uint64_t dispatch thunk of Decoder.decodeSingularFixed64Field(value:)()
{
  return MEMORY[0x1E0D3EBD0]();
}

uint64_t dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)()
{
  return MEMORY[0x1E0D3EBD8]();
}

uint64_t Message.isInitialized.getter()
{
  return MEMORY[0x1E0D3EC48]();
}

uint64_t Message.init(serializedData:extensions:partial:options:)()
{
  return MEMORY[0x1E0D3EC50]();
}

uint64_t Message.serializedData(partial:)()
{
  return MEMORY[0x1E0D3EC58]();
}

uint64_t Message.debugDescription.getter()
{
  return MEMORY[0x1E0D3EC68]();
}

uint64_t Message.hash(into:)()
{
  return MEMORY[0x1E0D3EC80]();
}

uint64_t static Message.with(_:)()
{
  return MEMORY[0x1E0D3EC88]();
}

uint64_t dispatch thunk of Visitor.visitMapField<A, B>(fieldType:value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ECA8]();
}

uint64_t dispatch thunk of Visitor.visitSingularBoolField(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ECF8]();
}

uint64_t dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED00]();
}

uint64_t dispatch thunk of Visitor.visitPackedFixed64Field(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED08]();
}

uint64_t dispatch thunk of Visitor.visitRepeatedBytesField(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED10]();
}

uint64_t dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED28]();
}

uint64_t dispatch thunk of Visitor.visitRepeatedStringField(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED48]();
}

uint64_t dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED68]();
}

uint64_t dispatch thunk of Visitor.visitSingularUInt32Field(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED70]();
}

uint64_t dispatch thunk of Visitor.visitSingularUInt64Field(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED78]();
}

uint64_t dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED80]();
}

uint64_t dispatch thunk of Visitor.visitSingularFixed64Field(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED90]();
}

uint64_t dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)()
{
  return MEMORY[0x1E0D3ED98]();
}

uint64_t type metadata accessor for _NameMap.NameDescription()
{
  return MEMORY[0x1E0D3EF28]();
}

uint64_t _NameMap.init(dictionaryLiteral:)()
{
  return MEMORY[0x1E0D3EF38]();
}

uint64_t _NameMap.init()()
{
  return MEMORY[0x1E0D3EF40]();
}

uint64_t type metadata accessor for _NameMap()
{
  return MEMORY[0x1E0D3EF48]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t OSSignpostID.init(_:)()
{
  return MEMORY[0x1E0DF2128]();
}

uint64_t static OSSignposter.disabled.getter()
{
  return MEMORY[0x1E0DF2138]();
}

uint64_t OSSignposter.isEnabled.getter()
{
  return MEMORY[0x1E0DF2140]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t OSSignposter.init(subsystem:category:)()
{
  return MEMORY[0x1E0DF2158]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t static OSLogIntegerFormatting.decimal.getter()
{
  return MEMORY[0x1E0DF2210]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t CustomCombineIdentifierConvertible<>.combineIdentifier.getter()
{
  return MEMORY[0x1E0C95640]();
}

uint64_t type metadata accessor for Publishers.SetFailureType()
{
  return MEMORY[0x1E0C95840]();
}

uint64_t type metadata accessor for Publishers.PrefetchStrategy()
{
  return MEMORY[0x1E0C958C0]();
}

uint64_t type metadata accessor for Publishers.Map()
{
  return MEMORY[0x1E0C95940]();
}

uint64_t type metadata accessor for Publishers.Merge()
{
  return MEMORY[0x1E0C95A48]();
}

uint64_t Publishers.Merge.init(_:_:)()
{
  return MEMORY[0x1E0C95A58]();
}

uint64_t type metadata accessor for Publishers.Filter()
{
  return MEMORY[0x1E0C95AC0]();
}

uint64_t type metadata accessor for Publishers.FlatMap()
{
  return MEMORY[0x1E0C95B68]();
}

uint64_t type metadata accessor for Publishers.Sequence()
{
  return MEMORY[0x1E0C95C00]();
}

uint64_t type metadata accessor for Publishers.ReceiveOn()
{
  return MEMORY[0x1E0C95CA8]();
}

uint64_t dispatch thunk of Subscriber.receive(completion:)()
{
  return MEMORY[0x1E0C95CD8]();
}

uint64_t dispatch thunk of Subscriber.receive(subscription:)()
{
  return MEMORY[0x1E0C95CE0]();
}

uint64_t dispatch thunk of Subscriber.receive(_:)()
{
  return MEMORY[0x1E0C95CE8]();
}

uint64_t type metadata accessor for Subscribers.Completion()
{
  return MEMORY[0x1E0C95D20]();
}

uint64_t static Subscribers.Demand.none.getter()
{
  return MEMORY[0x1E0C95D48]();
}

uint64_t static Subscribers.Demand.unlimited.getter()
{
  return MEMORY[0x1E0C95D50]();
}

uint64_t type metadata accessor for AnyPublisher()
{
  return MEMORY[0x1E0C95D78]();
}

uint64_t dispatch thunk of Subscription.request(_:)()
{
  return MEMORY[0x1E0C95DB0]();
}

uint64_t AnyCancellable.store(in:)()
{
  return MEMORY[0x1E0C95DD8]();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
  MEMORY[0x1E0C95DE8]();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return MEMORY[0x1E0C95E00]();
}

uint64_t dispatch thunk of AnyCancellable.__allocating_init(_:)()
{
  return MEMORY[0x1E0C95E38]();
}

uint64_t AnyCancellable.init(_:)()
{
  return MEMORY[0x1E0C95E48]();
}

uint64_t AsyncPublisher.makeAsyncIterator()()
{
  return MEMORY[0x1E0C95E50]();
}

uint64_t PassthroughSubject.send(completion:)()
{
  return MEMORY[0x1E0C95F00]();
}

uint64_t PassthroughSubject.send(_:)()
{
  return MEMORY[0x1E0C95F08]();
}

uint64_t PassthroughSubject.receive<A>(subscriber:)()
{
  return MEMORY[0x1E0C95F10]();
}

uint64_t PassthroughSubject.__allocating_init()()
{
  return MEMORY[0x1E0C95F18]();
}

uint64_t PassthroughSubject.init()()
{
  return MEMORY[0x1E0C95F20]();
}

uint64_t type metadata accessor for PassthroughSubject()
{
  return MEMORY[0x1E0C95F28]();
}

uint64_t CurrentValueSubject.send(_:)()
{
  return MEMORY[0x1E0C95F60]();
}

uint64_t CurrentValueSubject.value.getter()
{
  return MEMORY[0x1E0C95F70]();
}

uint64_t CurrentValueSubject.receive<A>(subscriber:)()
{
  return MEMORY[0x1E0C95F80]();
}

uint64_t type metadata accessor for CurrentValueSubject()
{
  return MEMORY[0x1E0C95F88]();
}

uint64_t CurrentValueSubject.__allocating_init(_:)()
{
  return MEMORY[0x1E0C95FA0]();
}

uint64_t CurrentValueSubject.init(_:)()
{
  return MEMORY[0x1E0C95FA8]();
}

uint64_t ConnectablePublisher.autoconnect()()
{
  return MEMORY[0x1E0C95FC0]();
}

uint64_t Fail.init(error:)()
{
  return MEMORY[0x1E0C96050]();
}

uint64_t Just.init(_:)()
{
  return MEMORY[0x1E0C960A8]();
}

uint64_t Empty.init(completeImmediately:)()
{
  return MEMORY[0x1E0C960B8]();
}

uint64_t Future.init(_:)()
{
  return MEMORY[0x1E0C96100]();
}

uint64_t Subject<>.send()()
{
  return MEMORY[0x1E0C96128]();
}

uint64_t Published.init(initialValue:)()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t Published.projectedValue.getter()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t Published.projectedValue.setter()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t static Published.subscript.modify()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t static Published.subscript.getter()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t static Published.subscript.setter()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t type metadata accessor for Published()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t Publisher.compactMap<A>(_:)()
{
  return MEMORY[0x1E0C961D8]();
}

uint64_t Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)()
{
  return MEMORY[0x1E0C961E0]();
}

uint64_t Publisher.removeDuplicates(by:)()
{
  return MEMORY[0x1E0C96238]();
}

uint64_t Publisher.map<A>(_:)()
{
  return MEMORY[0x1E0C96248]();
}

uint64_t Publisher.sink(receiveCompletion:receiveValue:)()
{
  return MEMORY[0x1E0C96290]();
}

uint64_t Publisher.catch<A>(_:)()
{
  return MEMORY[0x1E0C96298]();
}

uint64_t Publisher.first()()
{
  return MEMORY[0x1E0C962B8]();
}

uint64_t Publisher.buffer(size:prefetch:whenFull:)()
{
  return MEMORY[0x1E0C96300]();
}

uint64_t Publisher.filter(_:)()
{
  return MEMORY[0x1E0C96308]();
}

uint64_t Publisher.flatMap<A>(maxPublishers:_:)()
{
  return MEMORY[0x1E0C96350]();
}

uint64_t Publisher.flatMap<A, B>(maxPublishers:_:)()
{
  return MEMORY[0x1E0C96358]();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t Publisher.mapError<A>(_:)()
{
  return MEMORY[0x1E0C96390]();
}

uint64_t Publisher.dropFirst(_:)()
{
  return MEMORY[0x1E0C963B0]();
}

uint64_t Publisher.subscribe<A>(_:)()
{
  return MEMORY[0x1E0C963D8]();
}

uint64_t Publisher<>.removeDuplicates()()
{
  return MEMORY[0x1E0C963E8]();
}

uint64_t Publisher<>.setFailureType<A>(to:)()
{
  return MEMORY[0x1E0C96400]();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t Publisher<>.assign(to:)()
{
  return MEMORY[0x1E0C96420]();
}

uint64_t Publisher<>.values.getter()
{
  return MEMORY[0x1E0C96428]();
}

uint64_t Publisher<>.flatMap<A>(maxPublishers:_:)()
{
  return MEMORY[0x1E0C96430]();
}

uint64_t dispatch thunk of Scheduler.now.getter()
{
  return MEMORY[0x1E0C96458]();
}

uint64_t Scheduler.schedule(after:interval:_:)()
{
  return MEMORY[0x1E0C96460]();
}

uint64_t NWEndpoint.debugDescription.getter()
{
  return MEMORY[0x1E0CCE200]();
}

uint64_t type metadata accessor for NWEndpoint()
{
  return MEMORY[0x1E0CCE2A0]();
}

uint64_t NWEndpoint.init(_:)()
{
  return MEMORY[0x1E0CCE2B0]();
}

uint64_t NWConnection.__allocating_init(connection:parameters:)()
{
  return MEMORY[0x1E0CCE3F0]();
}

uint64_t NWConnection.identifier.getter()
{
  return MEMORY[0x1E0CCE3F8]();
}

uint64_t NWConnection.parameters.getter()
{
  return MEMORY[0x1E0CCE400]();
}

uint64_t NWConnection.ContentContext.init(identifier:expiration:priority:isFinal:antecedent:metadata:)()
{
  return MEMORY[0x1E0CCE418]();
}

uint64_t static NWConnection.ContentContext.finalMessage.getter()
{
  return MEMORY[0x1E0CCE420]();
}

uint64_t dispatch thunk of NWConnection.ContentContext.protocolMetadata(definition:)()
{
  return MEMORY[0x1E0CCE430]();
}

uint64_t type metadata accessor for NWConnection.ContentContext()
{
  return MEMORY[0x1E0CCE448]();
}

uint64_t type metadata accessor for NWConnection.SendCompletion()
{
  return MEMORY[0x1E0CCE468]();
}

uint64_t NWConnection.receiveMessage(completion:)()
{
  return MEMORY[0x1E0CCE470]();
}

uint64_t NWConnection.DataTransferReport.aggregatePathReport.getter()
{
  return MEMORY[0x1E0CCE480]();
}

uint64_t NWConnection.DataTransferReport.PathReport.transportMinimumRTT.getter()
{
  return MEMORY[0x1E0CCE488]();
}

uint64_t NWConnection.DataTransferReport.PathReport.transportRTTVariance.getter()
{
  return MEMORY[0x1E0CCE490]();
}

uint64_t NWConnection.DataTransferReport.PathReport.transportSmoothedRTT.getter()
{
  return MEMORY[0x1E0CCE498]();
}

uint64_t NWConnection.DataTransferReport.PathReport.sentTransportByteCount.getter()
{
  return MEMORY[0x1E0CCE4A0]();
}

uint64_t NWConnection.DataTransferReport.PathReport.sentApplicationByteCount.getter()
{
  return MEMORY[0x1E0CCE4A8]();
}

uint64_t NWConnection.DataTransferReport.PathReport.receivedTransportByteCount.getter()
{
  return MEMORY[0x1E0CCE4B0]();
}

uint64_t NWConnection.DataTransferReport.PathReport.receivedApplicationByteCount.getter()
{
  return MEMORY[0x1E0CCE4B8]();
}

uint64_t NWConnection.DataTransferReport.PathReport.retransmittedTransportByteCount.getter()
{
  return MEMORY[0x1E0CCE4C0]();
}

uint64_t type metadata accessor for NWConnection.DataTransferReport.PathReport()
{
  return MEMORY[0x1E0CCE4C8]();
}

uint64_t NWConnection.DataTransferReport.debugDescription.getter()
{
  return MEMORY[0x1E0CCE4D0]();
}

uint64_t NWConnection.DataTransferReport.duration.getter()
{
  return MEMORY[0x1E0CCE4D8]();
}

uint64_t type metadata accessor for NWConnection.DataTransferReport()
{
  return MEMORY[0x1E0CCE4E0]();
}

uint64_t NWConnection.stateUpdateHandler.setter()
{
  return MEMORY[0x1E0CCE4E8]();
}

uint64_t NWConnection.EstablishmentReport.handshakes.getter()
{
  return MEMORY[0x1E0CCE4F0]();
}

uint64_t NWConnection.EstablishmentReport.debugDescription.getter()
{
  return MEMORY[0x1E0CCE4F8]();
}

uint64_t NWConnection.EstablishmentReport.attemptStartedAfterInterval.getter()
{
  return MEMORY[0x1E0CCE500]();
}

uint64_t NWConnection.EstablishmentReport.duration.getter()
{
  return MEMORY[0x1E0CCE508]();
}

uint64_t NWConnection.EstablishmentReport.Handshake.definition.getter()
{
  return MEMORY[0x1E0CCE510]();
}

uint64_t NWConnection.EstablishmentReport.Handshake.handshakeRTT.getter()
{
  return MEMORY[0x1E0CCE518]();
}

uint64_t NWConnection.EstablishmentReport.Handshake.handshakeDuration.getter()
{
  return MEMORY[0x1E0CCE520]();
}

uint64_t type metadata accessor for NWConnection.EstablishmentReport.Handshake()
{
  return MEMORY[0x1E0CCE528]();
}

uint64_t type metadata accessor for NWConnection.EstablishmentReport()
{
  return MEMORY[0x1E0CCE538]();
}

uint64_t NWConnection.startDataTransferReport()()
{
  return MEMORY[0x1E0CCE558]();
}

uint64_t dispatch thunk of NWConnection.PendingDataTransferReport.collect(queue:completion:)()
{
  return MEMORY[0x1E0CCE560]();
}

uint64_t NWConnection.requestEstablishmentReport(queue:completion:)()
{
  return MEMORY[0x1E0CCE570]();
}

uint64_t NWConnection.init(to:using:)()
{
  return MEMORY[0x1E0CCE588]();
}

uint64_t NWConnection.send(content:contentContext:isComplete:completion:)()
{
  return MEMORY[0x1E0CCE5A0]();
}

uint64_t static NWConnection.State.== infix(_:_:)()
{
  return MEMORY[0x1E0CCE5A8]();
}

uint64_t type metadata accessor for NWConnection.State()
{
  return MEMORY[0x1E0CCE5E0]();
}

uint64_t NWConnection.start(queue:)()
{
  return MEMORY[0x1E0CCE5F0]();
}

uint64_t NWConnection.state.getter()
{
  return MEMORY[0x1E0CCE5F8]();
}

Swift::Void __swiftcall NWConnection.cancel()()
{
  MEMORY[0x1E0CCE600]();
}

uint64_t NWConnection.metadata(definition:)()
{
  return MEMORY[0x1E0CCE618]();
}

uint64_t type metadata accessor for NWConnection()
{
  return MEMORY[0x1E0CCE620]();
}

uint64_t dispatch thunk of NWParameters.ProtocolStack.applicationProtocols.setter()
{
  return MEMORY[0x1E0CCE658]();
}

uint64_t NWParameters.defaultProtocolStack.getter()
{
  return MEMORY[0x1E0CCE668]();
}

uint64_t type metadata accessor for NWParameters()
{
  return MEMORY[0x1E0CCE6C8]();
}

uint64_t NWParameters.__allocating_init(_:)()
{
  return MEMORY[0x1E0CCE6D8]();
}

uint64_t static NWProtocolQUIC.definition.getter()
{
  return MEMORY[0x1E0CCE7C0]();
}

uint64_t dispatch thunk of NWProtocolQUIC.Metadata.streamIdentifier.getter()
{
  return MEMORY[0x1E0CCE7D8]();
}

uint64_t type metadata accessor for NWProtocolQUIC.Metadata.KeepAliveBehavior()
{
  return MEMORY[0x1E0CCE7F0]();
}

uint64_t dispatch thunk of NWProtocolQUIC.Metadata.keepAlive.setter()
{
  return MEMORY[0x1E0CCE7F8]();
}

uint64_t type metadata accessor for NWProtocolQUIC.Metadata()
{
  return MEMORY[0x1E0CCE800]();
}

uint64_t type metadata accessor for NWProtocolQUIC()
{
  return MEMORY[0x1E0CCE808]();
}

uint64_t NWProtocolFramer.Definition.init(implementation:)()
{
  return MEMORY[0x1E0CCE860]();
}

uint64_t type metadata accessor for NWProtocolFramer.Definition()
{
  return MEMORY[0x1E0CCE868]();
}

uint64_t type metadata accessor for NWProtocolFramer.StartResult()
{
  return MEMORY[0x1E0CCE878]();
}

uint64_t dispatch thunk of NWProtocolFramer.Message.__allocating_init(definition:)()
{
  return MEMORY[0x1E0CCE880]();
}

uint64_t type metadata accessor for NWProtocolFramer.Message()
{
  return MEMORY[0x1E0CCE898]();
}

uint64_t dispatch thunk of NWProtocolFramer.Message.subscript.getter()
{
  return MEMORY[0x1E0CCE8A0]();
}

uint64_t dispatch thunk of NWProtocolFramer.Message.subscript.setter()
{
  return MEMORY[0x1E0CCE8A8]();
}

uint64_t NWProtocolFramer.Options.init(definition:)()
{
  return MEMORY[0x1E0CCE8B0]();
}

uint64_t type metadata accessor for NWProtocolFramer.Options()
{
  return MEMORY[0x1E0CCE8B8]();
}

uint64_t dispatch thunk of NWProtocolFramer.Options.subscript.getter()
{
  return MEMORY[0x1E0CCE8C0]();
}

uint64_t NWProtocolFramer.Instance.markFailed(error:)()
{
  return MEMORY[0x1E0CCE8D0]();
}

uint64_t NWProtocolFramer.Instance.parseInput(minimumIncompleteLength:maximumLength:parse:)()
{
  return MEMORY[0x1E0CCE8D8]();
}

uint64_t NWProtocolFramer.Instance.writeOutput(data:)()
{
  return MEMORY[0x1E0CCE8E8]();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NWProtocolFramer.Instance.writeOutputNoCopy(length:)(Swift::Int length)
{
  MEMORY[0x1E0CCE900](length);
}

uint64_t NWProtocolFramer.Instance.deliverInputNoCopy(length:message:isComplete:)()
{
  return MEMORY[0x1E0CCE908]();
}

uint64_t NWProtocolFramer.Instance.options.getter()
{
  return MEMORY[0x1E0CCE918]();
}

uint64_t NWConnectionGroup.setReceiveHandler(maximumMessageSize:rejectOversizedMessages:handler:)()
{
  return MEMORY[0x1E0CCE928]();
}

uint64_t NWConnectionGroup.stateUpdateHandler.setter()
{
  return MEMORY[0x1E0CCE930]();
}

uint64_t NWConnectionGroup.send(content:to:message:completion:)()
{
  return MEMORY[0x1E0CCE940]();
}

uint64_t NWConnectionGroup.init(with:using:)()
{
  return MEMORY[0x1E0CCE948]();
}

uint64_t type metadata accessor for NWConnectionGroup.State()
{
  return MEMORY[0x1E0CCE978]();
}

uint64_t NWConnectionGroup.start(queue:)()
{
  return MEMORY[0x1E0CCE988]();
}

Swift::Void __swiftcall NWConnectionGroup.cancel()()
{
  MEMORY[0x1E0CCE990]();
}

uint64_t static NWConnectionGroup.Message.default.getter()
{
  return MEMORY[0x1E0CCE9A8]();
}

uint64_t type metadata accessor for NWConnectionGroup.Message()
{
  return MEMORY[0x1E0CCE9B0]();
}

uint64_t type metadata accessor for NWConnectionGroup()
{
  return MEMORY[0x1E0CCE9C0]();
}

uint64_t NWConnectionGroup.__allocating_init(_:)()
{
  return MEMORY[0x1E0CCE9D0]();
}

uint64_t dispatch thunk of NWGroupDescriptor.members.getter()
{
  return MEMORY[0x1E0CCE9E0]();
}

uint64_t type metadata accessor for NWProtocolMetadata()
{
  return MEMORY[0x1E0CCE9F8]();
}

uint64_t static NWProtocolDefinition.== infix(_:_:)()
{
  return MEMORY[0x1E0CCEA08]();
}

uint64_t type metadata accessor for NWProtocolDefinition()
{
  return MEMORY[0x1E0CCEA10]();
}

uint64_t static NWProtocolQUICConnection.definition.getter()
{
  return MEMORY[0x1E0CCEA18]();
}

uint64_t type metadata accessor for NWProtocolQUICConnection()
{
  return MEMORY[0x1E0CCEA20]();
}

uint64_t static NWError.== infix(_:_:)()
{
  return MEMORY[0x1E0CCEAF0]();
}

uint64_t type metadata accessor for NWError()
{
  return MEMORY[0x1E0CCEB10]();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t DispatchWorkItem.init(flags:block:)()
{
  return MEMORY[0x1E0DEF708]();
}

uint64_t dispatch thunk of DispatchWorkItem.cancel()()
{
  return MEMORY[0x1E0DEF710]();
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x1E0DEF750]();
}

{
  return MEMORY[0x1E0DEF758]();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t type metadata accessor for CryptoKitError()
{
  return MEMORY[0x1E0CA91E8]();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return MEMORY[0x1E0CA92A8]();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return MEMORY[0x1E0CA92B0]();
}

uint64_t static HashFunction.hash<A>(data:)()
{
  return MEMORY[0x1E0CA92B8]();
}

uint64_t HashFunction.update<A>(data:)()
{
  return MEMORY[0x1E0CA92C0]();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return MEMORY[0x1E0CA92C8]();
}

uint64_t SHA256Digest.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x1E0CA92E0]();
}

uint64_t type metadata accessor for SHA256Digest()
{
  return MEMORY[0x1E0CA92F8]();
}

uint64_t SymmetricKey.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x1E0CA93A0]();
}

uint64_t SymmetricKey.init<A>(data:)()
{
  return MEMORY[0x1E0CA93B0]();
}

uint64_t type metadata accessor for SymmetricKey()
{
  return MEMORY[0x1E0CA93C8]();
}

uint64_t static AES.GCM.open(_:using:)()
{
  return MEMORY[0x1E0CA94B8]();
}

uint64_t static AES.GCM.seal<A>(_:using:nonce:)()
{
  return MEMORY[0x1E0CA94D0]();
}

uint64_t type metadata accessor for AES.GCM.Nonce()
{
  return MEMORY[0x1E0CA94F8]();
}

uint64_t AES.GCM.SealedBox.combined.getter()
{
  return MEMORY[0x1E0CA9528]();
}

uint64_t AES.GCM.SealedBox.init(combined:)()
{
  return MEMORY[0x1E0CA9530]();
}

uint64_t type metadata accessor for AES.GCM.SealedBox()
{
  return MEMORY[0x1E0CA9538]();
}

uint64_t dispatch thunk of static Digest.byteCount.getter()
{
  return MEMORY[0x1E0CA9900]();
}

uint64_t SHA256.finalize()()
{
  return MEMORY[0x1E0CA9920]();
}

uint64_t SHA256.init()()
{
  return MEMORY[0x1E0CA9938]();
}

uint64_t type metadata accessor for SHA256()
{
  return MEMORY[0x1E0CA9940]();
}

uint64_t type metadata accessor for Insecure.MD5()
{
  return MEMORY[0x1E0CA9A18]();
}

uint64_t type metadata accessor for Insecure.MD5Digest()
{
  return MEMORY[0x1E0CA9A48]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x1E0DE9D60]();
}

uint64_t Array.init()()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t CancellationError.init()()
{
  return MEMORY[0x1E0DF05B0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1E0CB17D8]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB17F8]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t Dictionary.compactMapValues<A>(_:)()
{
  return MEMORY[0x1E0DE9E68]();
}

uint64_t Dictionary.init<A>(uniqueKeysWithValues:)()
{
  return MEMORY[0x1E0DE9E80]();
}

uint64_t Dictionary.Keys.description.getter()
{
  return MEMORY[0x1E0DE9E90]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t dispatch thunk of Encodable.encode(to:)()
{
  return MEMORY[0x1E0DEA0F0]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t BidirectionalCollection<>.difference<A>(from:)()
{
  return MEMORY[0x1E0DEA3A0]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t static Comparable.> infix(_:_:)()
{
  return MEMORY[0x1E0DEA3E0]();
}

uint64_t static Comparable.>= infix(_:_:)()
{
  return MEMORY[0x1E0DEA3E8]();
}

uint64_t static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x1E0DEA3F0]();
}

uint64_t MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1E0DEA428]();
}

uint64_t MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)()
{
  return MEMORY[0x1E0DEA430]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x1E0DEA568]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1E0CB1940]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1E0DEA5F8]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = MEMORY[0x1E0DEA610]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1E0DEA758]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x1E0DEA800](a1._countAndFlagsBits, a1._object);
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x1E0DEA830]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t String.hashValue.getter()
{
  return MEMORY[0x1E0DEA950]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x1E0DEAA68]();
}

uint64_t Sequence.publisher.getter()
{
  return MEMORY[0x1E0C96490]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t Sequence.sorted(by:)()
{
  return MEMORY[0x1E0DEAB30]();
}

uint64_t Sequence.flatMap<A>(_:)()
{
  return MEMORY[0x1E0DEAB38]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t Sequence<>.contains(_:)()
{
  return MEMORY[0x1E0DEABA0]();
}

uint64_t UnsafeRawBufferPointer.regions.getter()
{
  return MEMORY[0x1E0CB1AB8]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEADA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1E0CB1AC0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1E0DEAE28]();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x1E0DEAE98]();
}

Swift::Void __swiftcall Array.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
  MEMORY[0x1E0DEAEB8](keepingCapacity);
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x1E0DEAEC8]();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1E0CB1B28]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t type metadata accessor for CancellationError()
{
  return MEMORY[0x1E0DF05E0]();
}

uint64_t TaskGroup.makeAsyncIterator()()
{
  return MEMORY[0x1E0DF0608]();
}

uint64_t dispatch thunk of AsyncIteratorProtocol.next()()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t static TaskPriority.background.getter()
{
  return MEMORY[0x1E0DF06F8]();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return MEMORY[0x1E0DF07D8]();
}

Swift::Void __swiftcall AsyncStream.Continuation.finish()()
{
  MEMORY[0x1E0DF07E0]();
}

uint64_t type metadata accessor for AsyncStream.Continuation()
{
  return MEMORY[0x1E0DF07E8]();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t AsyncStream.Iterator.next(isolation:)()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t static Task.== infix(_:_:)()
{
  return MEMORY[0x1E0DF0850]();
}

uint64_t Task.hash(into:)()
{
  return MEMORY[0x1E0DF0858]();
}

uint64_t Task.value.getter()
{
  return MEMORY[0x1E0DF0860]();
}

Swift::Void __swiftcall Task.cancel()()
{
  MEMORY[0x1E0DF0870]();
}

uint64_t static Task<>.checkCancellation()()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t static Task<>.sleep(nanoseconds:)()
{
  return MEMORY[0x1E0DF08D0]();
}

uint64_t static Task<>.sleep<A>(until:tolerance:clock:)()
{
  return MEMORY[0x1E0DF08E0]();
}

uint64_t ThrowingTaskGroup.next(isolation:)()
{
  return MEMORY[0x1E0DF0958]();
}

Swift::Void __swiftcall ThrowingTaskGroup.cancelAll()()
{
  MEMORY[0x1E0DF09A8]();
}

uint64_t type metadata accessor for ThrowingTaskGroup()
{
  return MEMORY[0x1E0DF09B0]();
}

uint64_t AsyncThrowingStream.Continuation.yield(_:)()
{
  return MEMORY[0x1E0DF0A68]();
}

uint64_t AsyncThrowingStream.Continuation.finish(throwing:)()
{
  return MEMORY[0x1E0DF0A70]();
}

uint64_t AsyncThrowingStream.init<>(_:bufferingPolicy:_:)()
{
  return MEMORY[0x1E0DF0AD8]();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1E0CB1B50]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x1E0CB1BB0]();
}

uint64_t static Set._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB1BC0]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t Set.description.getter()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t Set.Index._asCocoa.modify()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t Set.hashValue.getter()
{
  return MEMORY[0x1E0DEB378]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1E0CB1C10]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t RangeReplaceableCollection.removeFirst()()
{
  return MEMORY[0x1E0DEB738]();
}

uint64_t RangeReplaceableCollection<>.removeAll(where:)()
{
  return MEMORY[0x1E0DEB810]();
}

uint64_t NSEnumerator.makeIterator()()
{
  return MEMORY[0x1E0CB1CD0]();
}

uint64_t type metadata accessor for APApplication()
{
  return MEMORY[0x1E0CF9638]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t OS_dispatch_group.notify(qos:flags:queue:execute:)()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t OS_dispatch_group.notify(queue:work:)()
{
  return MEMORY[0x1E0DEF7F0]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:execute:)()
{
  return MEMORY[0x1E0DEF848]();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return MEMORY[0x1E0DEF868]();
}

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)()
{
  return MEMORY[0x1E0DEF898]();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride()
{
  return MEMORY[0x1E0DEF8A0]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return MEMORY[0x1E0DF22A8]();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
  MEMORY[0x1E0DEFA68]();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t NSCoder.decodeObject<A>(of:forKey:)()
{
  return MEMORY[0x1E0CB2020]();
}

uint64_t NSCoder.decodeObject(of:forKey:)()
{
  return MEMORY[0x1E0CB2028]();
}

uint64_t type metadata accessor for NSTimer.TimerPublisher()
{
  return MEMORY[0x1E0CB20A0]();
}

uint64_t static NSTimer.publish(every:tolerance:on:in:options:)()
{
  return MEMORY[0x1E0CB20B0]();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)MEMORY[0x1E0CB20D0](BOOLeanLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1E0DEFCD8](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t NSObject.hash(into:)()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t type metadata accessor for APSubject()
{
  return MEMORY[0x1E0CF9640]();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return MEMORY[0x1E0CB22E8]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t dispatch thunk of Strideable.advanced(by:)()
{
  return MEMORY[0x1E0DEBCB0]();
}

uint64_t StringProtocol.data(using:allowLossyConversion:)()
{
  return MEMORY[0x1E0CB2530]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x1E0DEBD70]();
}

uint64_t dispatch thunk of static BinaryInteger.& infix(_:_:)()
{
  return MEMORY[0x1E0DEBD78]();
}

uint64_t dispatch thunk of static BinaryInteger.~ prefix(_:)()
{
  return MEMORY[0x1E0DEBD98]();
}

uint64_t dispatch thunk of static BinaryInteger.&= infix(_:_:)()
{
  return MEMORY[0x1E0DEBDB0]();
}

uint64_t dispatch thunk of static BinaryInteger.>> infix<A>(_:_:)()
{
  return MEMORY[0x1E0DEBDC0]();
}

uint64_t dispatch thunk of static BinaryInteger.<< infix<A>(_:_:)()
{
  return MEMORY[0x1E0DEBDC8]();
}

uint64_t dispatch thunk of static BinaryInteger.|= infix(_:_:)()
{
  return MEMORY[0x1E0DEBDD0]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x1E0DEBDF8]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x1E0DEBE00]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x1E0DEBE10]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t __CocoaSet.Index.handleBitPattern.getter()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t __CocoaSet.element(at:)()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t __CocoaSet.isEqual(to:)()
{
  return MEMORY[0x1E0DEC108]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t __CocoaSet.contains(_:)()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t __CocoaSet.formIndex(after:isUnique:)()
{
  return MEMORY[0x1E0DEC128]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1E0DEC168](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x1E0DEC260]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC2A8](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x1E0DEC338]();
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t withTaskGroup<A, B>(of:returning:isolation:body:)()
{
  return MEMORY[0x1E0DF0B08]();
}

uint64_t _ArrayProtocol.filter(_:)()
{
  return MEMORY[0x1E0DEC5F8]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1E0DEC670]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC680](a1);
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t ContinuousClock.now.getter()
{
  return MEMORY[0x1E0DF0B18]();
}

uint64_t ContinuousClock.Instant.advanced(by:)()
{
  return MEMORY[0x1E0DF0B50]();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t ContinuousClock.init()()
{
  return MEMORY[0x1E0DF0B98]();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return MEMORY[0x1E0DEC7D0]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return MEMORY[0x1E0DEC990]();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return MEMORY[0x1E0DEC9F0]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x1E0DECAE0](isUnique, capacity);
}

uint64_t _NativeDictionary._insert(at:key:value:)()
{
  return MEMORY[0x1E0DECB08]();
}

uint64_t type metadata accessor for _NativeDictionary()
{
  return MEMORY[0x1E0DECB20]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECBE0]();
}

{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t CollectionDifference.removals.getter()
{
  return MEMORY[0x1E0DECDD8]();
}

uint64_t dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0DECEF8]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x1E0DECF28](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t withThrowingTaskGroup<A, B>(of:returning:isolation:body:)()
{
  return MEMORY[0x1E0DF0D38]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1E0DED030]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1E0DED160]();
}

uint64_t KeyedEncodingContainer.init<A>(_:)()
{
  return MEMORY[0x1E0DED180]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x1E0DED1B0](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t withCheckedContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t UnkeyedEncodingContainer.encodeConditional<A>(_:)()
{
  return MEMORY[0x1E0DED400]();
}

uint64_t UnkeyedEncodingContainer.encode<A>(contentsOf:)()
{
  return MEMORY[0x1E0DED408]();
}

{
  return MEMORY[0x1E0DED410]();
}

{
  return MEMORY[0x1E0DED418]();
}

{
  return MEMORY[0x1E0DED420]();
}

{
  return MEMORY[0x1E0DED428]();
}

{
  return MEMORY[0x1E0DED430]();
}

{
  return MEMORY[0x1E0DED438]();
}

{
  return MEMORY[0x1E0DED440]();
}

{
  return MEMORY[0x1E0DED448]();
}

{
  return MEMORY[0x1E0DED450]();
}

{
  return MEMORY[0x1E0DED458]();
}

{
  return MEMORY[0x1E0DED460]();
}

{
  return MEMORY[0x1E0DED468]();
}

{
  return MEMORY[0x1E0DED470]();
}

{
  return MEMORY[0x1E0DED478]();
}

{
  return MEMORY[0x1E0DED480]();
}

{
  return MEMORY[0x1E0DED488]();
}

uint64_t UnkeyedEncodingContainer.encode(_:)()
{
  return MEMORY[0x1E0DED490]();
}

{
  return MEMORY[0x1E0DED498]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x1E0DED550]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x1E0DED5C0]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t withTaskCancellationHandler<A>(operation:onCancel:isolation:)()
{
  return MEMORY[0x1E0DF0E78]();
}

uint64_t dispatch thunk of CustomDebugStringConvertible.debugDescription.getter()
{
  return MEMORY[0x1E0DED610]();
}

uint64_t SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x1E0DED748]();
}

{
  return MEMORY[0x1E0DED750]();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1E0DED8D0]();
}

{
  return MEMORY[0x1E0DED8D8]();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1E0DED900]();
}

uint64_t KeyedEncodingContainerProtocol.encodeConditional<A>(_:forKey:)()
{
  return MEMORY[0x1E0DED958]();
}

uint64_t withCheckedThrowingContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x1E0DED9E8]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return MEMORY[0x1E0DF0EE8]();
}

uint64_t dispatch thunk of Clock.sleep(until:tolerance:)()
{
  return MEMORY[0x1E0DF0EF0]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x1E0DEDB28]();
}

NSNumber __swiftcall Int32._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1E0CB2670]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x1E0DEDF18](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt16 a1)
{
  MEMORY[0x1E0DEDF20](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
  MEMORY[0x1E0DEDF30](a1);
}

Swift::Int __swiftcall Hasher.finalize()()
{
  return MEMORY[0x1E0DEDF38]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t Hasher.init()()
{
  return MEMORY[0x1E0DEDF48]();
}

NSNumber __swiftcall UInt32._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1E0CB26E8]();
}

uint64_t static UInt32._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB26F8]();
}

NSNumber __swiftcall UInt64._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1E0CB2710]();
}

uint64_t static UInt64._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB2720]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t dispatch thunk of CodingKey.stringValue.getter()
{
  return MEMORY[0x1E0DEE8B8]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t TaskLocal.init(wrappedValue:)()
{
  return MEMORY[0x1E0DF0F28]();
}

uint64_t TaskLocal.get()()
{
  return MEMORY[0x1E0DF0F38]();
}

uint64_t TaskLocal.withValue<A>(_:operation:isolation:file:line:)()
{
  return MEMORY[0x1E0DF0F48]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t CUTWeakLinkSymbol()
{
  return MEMORY[0x1E0D131E8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x1E0D7FE50]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x1E0D7FE68]();
}

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return MEMORY[0x1E0CD64C8]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x1E0CD66B8](trust, queue, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1E0CD6748](trust, policies);
}

uint64_t TUCopyIDSCanonicalAddressForHandle()
{
  return MEMORY[0x1E0DBD5E0]();
}

uint64_t TULockdownModeEnabled()
{
  return MEMORY[0x1E0DBD678]();
}

uint64_t TUObjectsAreEqualOrNil()
{
  return MEMORY[0x1E0DBD690]();
}

uint64_t TUPreferredFaceTimeBundleIdentifier()
{
  return MEMORY[0x1E0DBD6B0]();
}

uint64_t TUUnlockDeviceWithPromptFrontBoardOptionsDictionary()
{
  return MEMORY[0x1E0DBD768]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFPreferencesSetBackupDisabled()
{
  return MEMORY[0x1E0C9A380]();
}

uint64_t _CFPreferencesSetFileProtectionClass()
{
  return MEMORY[0x1E0C9A390]();
}

uint64_t _TUIsInternalInstall()
{
  return MEMORY[0x1E0DBD830]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

nw_connection_group_t nw_connection_group_create(nw_group_descriptor_t group_descriptor, nw_parameters_t parameters)
{
  return (nw_connection_group_t)MEMORY[0x1E0CCF0B8](group_descriptor, parameters);
}

uint64_t nw_connection_group_set_membership_changed_handler()
{
  return MEMORY[0x1E0CCF0C0]();
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1E0CCF8C8](parameters);
}

uint64_t nw_parameters_create_quic_stream()
{
  return MEMORY[0x1E0CCF978]();
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF990](configure_dtls, configure_udp);
}

void nw_protocol_stack_clear_application_protocols(nw_protocol_stack_t stack)
{
  MEMORY[0x1E0CCFFC8](stack);
}

uint64_t nw_quic_connection_copy_sec_protocol_options()
{
  return MEMORY[0x1E0CD0150]();
}

uint64_t nw_quic_connection_set_initial_max_streams_bidirectional()
{
  return MEMORY[0x1E0CD01A0]();
}

uint64_t nw_quic_connection_set_initial_max_streams_unidirectional()
{
  return MEMORY[0x1E0CD01A8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C849A8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
  MEMORY[0x1E0CD7218](options, application_protocol);
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
  MEMORY[0x1E0CD7350](options, verify_block, verify_block_queue);
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x1E0CD7368](trust);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1E0DEEB78]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC68]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x1E0DEEE60]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1E0DEEEF8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1E0DEEF00]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1E0DEEF08]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1E0DEEF60]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1E0DEEF68]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1E0DEEF70]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x1E0DEEF88]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x1E0DEEF90]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x1E0DEEFB0]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x1E0DEEFB8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

