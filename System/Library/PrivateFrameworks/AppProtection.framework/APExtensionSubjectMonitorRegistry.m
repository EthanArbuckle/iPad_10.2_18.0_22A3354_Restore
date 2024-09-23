@implementation APExtensionSubjectMonitorRegistry

- (APExtensionSubjectMonitorRegistry)initWithExtensionSubject:(id)a3
{
  id v3;
  APExtensionSubjectMonitorRegistry *v4;

  v3 = a3;
  v4 = (APExtensionSubjectMonitorRegistry *)sub_236279120(v3);

  return v4;
}

- (void)dealloc
{
  APExtensionSubjectMonitorRegistry *v2;

  v2 = self;
  sub_236276BD8();
}

- (void).cxx_destruct
{

  swift_release();
}

- (id)addMonitor:(id)a3
{
  uint64_t v4;
  APExtensionSubjectMonitorRegistry *v5;
  void *v6;
  void *v8;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___APExtensionSubjectMonitorRegistry_state);
  swift_unknownObjectRetain();
  v5 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 28));
  sub_2362799BC((_QWORD *)(v4 + 16), &v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 28));
  v6 = v8;
  swift_unknownObjectRelease();

  swift_release();
  return v6;
}

- (void)resume
{
  APExtensionSubjectMonitorRegistry *v2;

  v2 = self;
  sub_236276F30();

}

- (void)invalidate
{
  APExtensionSubjectMonitorRegistry *v2;

  v2 = self;
  sub_2362772AC();

}

- (APExtensionSubjectMonitorRegistry)init
{
  APExtensionSubjectMonitorRegistry *result;

  result = (APExtensionSubjectMonitorRegistry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
