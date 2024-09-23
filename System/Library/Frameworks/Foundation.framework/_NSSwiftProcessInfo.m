@implementation _NSSwiftProcessInfo

- (id)beginActivityWithOptions:(unint64_t)a3 reason:(id)a4
{
  id v6;
  _NSSwiftProcessInfo *v7;
  id v8;
  id result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v6 = objc_allocWithZone((Class)_NSActivityAssertion);
  v7 = self;
  v8 = objc_msgSend(objc_msgSend(v6, sel_init), sel__initWithActivityOptions_reason_expirationHandler_, a3, String._bridgeToObjectiveCImpl()(), 0);
  result = (id)swift_unknownObjectRelease();
  if (v8)
  {

    swift_bridgeObjectRelease();
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)endActivity:(id)a3
{
  void *v3;

  if (a3)
  {
    objc_opt_self();
    v3 = (void *)swift_dynamicCastObjCClass();
    if (v3)
      objc_msgSend(v3, sel__endFromDealloc_, 0);
  }
}

- (void)performActivityWithOptions:(unint64_t)a3 reason:(id)a4 block:(id)a5
{
  uint64_t (*v8)();
  uint64_t (*v9)();
  id v10;
  void *v11;
  uint64_t v12;
  _NSSwiftProcessInfo *v13;

  v8 = (uint64_t (*)())_Block_copy(a5);
  v9 = v8;
  if (!a4)
  {
    v10 = 0;
    if (v8)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  a4 = v11;
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v9;
  v9 = partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ();
LABEL_6:
  v13 = self;
  specialized _NSSwiftProcessInfo.performActivity(options:reason:block:)(a3, (uint64_t)v10, (uint64_t)a4, v9, v12);
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed URL, @guaranteed Error) -> (@unowned Bool))?((uint64_t)v9);

  swift_bridgeObjectRelease();
}

- (void)performExpiringActivityWithReason:(id)a3 usingBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _NSSwiftProcessInfo *v11;
  _QWORD v12[6];

  v6 = _Block_copy(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (void *)objc_opt_self();
  v9 = String._bridgeToObjectiveCImpl()();
  v12[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> ();
  v12[5] = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = thunk for @escaping @callee_guaranteed (@unowned Bool) -> ();
  v12[3] = &block_descriptor_12_0;
  v10 = _Block_copy(v12);
  v11 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel__performExpiringActivityWithReason_usingBlock_, v9, v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
}

- (int64_t)thermalState
{
  uint64_t v3;
  _NSSwiftProcessInfo *v4;
  _NSSwiftProcessInfo *v5;
  os_unfair_lock_s *v6;
  uint64_t v8;

  swift_getObjectType();
  v3 = one-time initialization token for _globalState;
  v4 = self;
  v5 = v4;
  if (v3 != -1)
    v4 = (_NSSwiftProcessInfo *)swift_once();
  v6 = (os_unfair_lock_s *)static _NSSwiftProcessInfo._globalState;
  MEMORY[0x1E0C80A78](v4);
  swift_retain();
  os_unfair_lock_lock(v6 + 11);
  partial apply for closure #1 in _NSSwiftProcessInfo.thermalState.getter((uint64_t)&v6[4], &v8);
  os_unfair_lock_unlock(v6 + 11);

  swift_release();
  return v8;
}

+ (void)cancelThermalStateNotifyNotification
{
  uint64_t v2;
  os_unfair_lock_s *v3;

  if (one-time initialization token for _globalState != -1)
    swift_once();
  v2 = static _NSSwiftProcessInfo._globalState + 16;
  v3 = (os_unfair_lock_s *)(static _NSSwiftProcessInfo._globalState + 44);
  swift_retain();
  os_unfair_lock_lock(v3);
  closure #1 in static _NSSwiftProcessInfo.cancelThermalStateNotifyNotification()(v2);
  os_unfair_lock_unlock(v3);
  swift_release();
}

+ (void)updateThermalState:(unint64_t)a3
{
  swift_getObjCClassMetadata();
  static _NSSwiftProcessInfo.updateThermalState(_:)(a3);
}

- (BOOL)isLowPowerModeEnabled
{
  uint64_t v2;
  _NSSwiftProcessInfo *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  BOOL v7;

  v2 = one-time initialization token for _globalState;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = static _NSSwiftProcessInfo._globalState + 16;
  v5 = (os_unfair_lock_s *)(static _NSSwiftProcessInfo._globalState + 44);
  swift_retain();
  os_unfair_lock_lock(v5);
  partial apply for closure #1 in _NSSwiftProcessInfo.isLowPowerModeEnabled.getter(v4, (char *)&v7);
  os_unfair_lock_unlock(v5);

  swift_release();
  return v7;
}

+ (void)cancelPowerStateNotifyNotification
{
  uint64_t v2;
  os_unfair_lock_s *v3;

  if (one-time initialization token for _globalState != -1)
    swift_once();
  v2 = static _NSSwiftProcessInfo._globalState + 16;
  v3 = (os_unfair_lock_s *)(static _NSSwiftProcessInfo._globalState + 44);
  swift_retain();
  os_unfair_lock_lock(v3);
  closure #1 in static _NSSwiftProcessInfo.cancelPowerStateNotifyNotification()(v2);
  os_unfair_lock_unlock(v3);
  swift_release();
}

+ (void)updatePowerState:(unint64_t)a3
{
  os_unfair_lock_s *v3;

  if (one-time initialization token for _globalState != -1)
    a1 = (id)swift_once();
  v3 = (os_unfair_lock_s *)static _NSSwiftProcessInfo._globalState;
  MEMORY[0x1E0C80A78](a1);
  swift_retain();
  os_unfair_lock_lock(v3 + 11);
  partial apply for closure #1 in static _NSSwiftProcessInfo.updatePowerState(_:)((uint64_t)&v3[4]);
  os_unfair_lock_unlock(v3 + 11);
  swift_release();
}

- (void)_setShouldRelaunchDueToAutomaticTerminationStateChangedHandler:(id)a3
{
  uint64_t v4;
  uint64_t (*v5)();
  os_unfair_lock_s *v6;
  _NSSwiftProcessInfo *v7;

  v4 = (uint64_t)_Block_copy(a3);
  v5 = (uint64_t (*)())v4;
  if (v4)
  {
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v5;
    v5 = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ();
  }
  v6 = *(os_unfair_lock_s **)((char *)&self->super.super.isa + OBJC_IVAR____NSSwiftProcessInfo__state);
  MEMORY[0x1E0C80A78](v4);
  v7 = self;
  swift_retain();
  os_unfair_lock_lock(v6 + 19);
  partial apply for closure #1 in _NSSwiftProcessInfo._setShouldRelaunchDue(toAutomaticTerminationStateChangedHandler:)((uint64_t)&v6[4]);
  os_unfair_lock_unlock(v6 + 19);
  swift_release();
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed URL, @guaranteed Error) -> (@unowned Bool))?((uint64_t)v5);

}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)macCatalystVersion
{
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  int64_t v5;
  int64_t v6;

  result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)specialized _NSSwiftProcessInfo.operatingSystemVersion.getter();
  retstr->var0 = (int64_t)result;
  retstr->var1 = v5;
  retstr->var2 = v6;
  return result;
}

- (BOOL)macCatalystVersionIsAtLeastVersion:(id *)a3
{
  return specialized _NSSwiftProcessInfo.macCatalystVersionIs(atLeastVersion:)(a3->var0, a3->var1, a3->var2) & 1;
}

- (void)_reactivateActivity:(id)a3
{
  void *v3;

  if (a3)
  {
    objc_opt_self();
    v3 = (void *)swift_dynamicCastObjCClass();
    if (v3)
      objc_msgSend(v3, sel__reactivate);
  }
}

+ (NSProcessInfo)processInfo
{
  if (one-time initialization token for _shared != -1)
    swift_once();
  return (NSProcessInfo *)(id)static _NSSwiftProcessInfo._shared;
}

- (_NSSwiftProcessInfo)init
{
  return (_NSSwiftProcessInfo *)_NSSwiftProcessInfo.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (NSArray)arguments
{
  os_unfair_lock_s *v2;
  _NSSwiftProcessInfo *v3;
  uint64_t v5;

  v2 = (os_unfair_lock_s *)(*(_QWORD **)((char *)&self->super.super.isa + OBJC_IVAR____NSSwiftProcessInfo__processInfo))[2];
  v3 = self;
  swift_retain();
  os_unfair_lock_lock(v2 + 10);
  closure #1 in _ProcessInfo.arguments.getter((uint64_t)&v2[4], &v5);
  os_unfair_lock_unlock(v2 + 10);

  swift_release();
  return (NSArray *)(id)_ContiguousArrayBuffer._asCocoaArray()();
}

- (NSDictionary)environment
{
  specialized _ProcessInfo.environment.getter();
  return (NSDictionary *)(id)_NativeDictionary.bridged()();
}

- (NSString)globallyUniqueString
{
  void *v2;

  specialized _NSSwiftProcessInfo.globallyUniqueString.getter();
  v2 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)processName
{
  uint64_t v2;
  _NSSwiftProcessInfo *v3;
  void *v4;
  unint64_t v6;

  v2 = (*(_QWORD **)((char *)&self->super.super.isa + OBJC_IVAR____NSSwiftProcessInfo__processInfo))[2];
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 40));
  closure #1 in _ProcessInfo.processName.getter((unint64_t *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 40));

  swift_release();
  v4 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)setProcessName:(id)a3
{
  uint64_t v4;
  _NSSwiftProcessInfo *v5;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v4 = (*(_QWORD **)((char *)&self->super.super.isa + OBJC_IVAR____NSSwiftProcessInfo__processInfo))[2];
  v5 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 40));
  partial apply for closure #1 in _ProcessInfo.processName.setter((_QWORD *)(v4 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 40));

  swift_bridgeObjectRelease();
  swift_release();
}

- (BOOL)isMacCatalystApp
{
  return 0;
}

- (BOOL)isiOSAppOnMac
{
  return 0;
}

- (double)systemUptime
{
  unint64_t v2;
  unint64_t v3;
  _NSSwiftProcessInfo *v4;
  uint64_t v5;
  mach_timebase_info v7[2];

  v7[1] = *(mach_timebase_info *)MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v4 = self;
  mach_timebase_info(v7);
  LODWORD(v2) = v7[0].denom;
  LODWORD(v3) = v7[0].numer;
  v5 = mach_absolute_time();

  return 1.0 / (1000000000.0 / (double)v3 * (double)v2) * (double)v5;
}

- (NSString)hostName
{
  uint64_t v2;
  _NSSwiftProcessInfo *v3;
  void *v4;
  uint64_t v6;

  v2 = (*(_QWORD **)((char *)&self->super.super.isa + OBJC_IVAR____NSSwiftProcessInfo__processInfo))[3];
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  closure #1 in _ProcessInfo.hostName.getter((_QWORD *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));

  swift_release();
  v4 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (NSString)operatingSystemVersionString
{
  _NSSwiftProcessInfo *v2;
  NSString *result;
  NSString *v4;
  void *v5;

  v2 = self;
  result = (NSString *)CFCopySystemVersionString();
  if (result)
  {
    v4 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)(result);

    v5 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
    return (NSString *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  int64_t v5;
  int64_t v6;

  result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)specialized _NSSwiftProcessInfo.operatingSystemVersion.getter();
  retstr->var0 = (int64_t)result;
  retstr->var1 = v5;
  retstr->var2 = v6;
  return result;
}

- (BOOL)isOperatingSystemAtLeastVersion:(id *)a3
{
  return specialized _NSSwiftProcessInfo.macCatalystVersionIs(atLeastVersion:)(a3->var0, a3->var1, a3->var2) & 1;
}

@end
