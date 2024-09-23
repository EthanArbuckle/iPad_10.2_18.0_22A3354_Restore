@implementation CKPhoneLockStateObserver

+ (CKPhoneLockStateObserver)sharedInstance
{
  return (CKPhoneLockStateObserver *)static PhoneLockStateObserver.shared.getter();
}

+ (void)setSharedInstance:(id)a3
{
  static PhoneLockStateObserver.shared.setter((uint64_t)a3);
}

- (CKPhoneLockStateObserver)init
{
  return (CKPhoneLockStateObserver *)PhoneLockStateObserver.init()();
}

- (void)dealloc
{
  CKPhoneLockStateObserver *v2;

  v2 = self;
  PhoneLockStateObserver.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___CKPhoneLockStateObserver__isLocked;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<Bool>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
