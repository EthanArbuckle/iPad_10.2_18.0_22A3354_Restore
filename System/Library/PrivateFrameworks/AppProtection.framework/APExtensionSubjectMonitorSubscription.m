@implementation APExtensionSubjectMonitorSubscription

- (void)invalidate
{
  uint64_t v2;
  _TtC13AppProtection37APExtensionSubjectMonitorSubscription *v3;

  v2 = *(_QWORD *)(*(char **)((char *)&self->super.isa
                            + OBJC_IVAR____TtC13AppProtection37APExtensionSubjectMonitorSubscription_registry)
                 + OBJC_IVAR___APExtensionSubjectMonitorRegistry_state);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 28));
  sub_236279A44((unint64_t *)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 28));

  swift_release();
}

- (_TtC13AppProtection37APExtensionSubjectMonitorSubscription)init
{
  _TtC13AppProtection37APExtensionSubjectMonitorSubscription *result;

  result = (_TtC13AppProtection37APExtensionSubjectMonitorSubscription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_236279A10((uint64_t)self + OBJC_IVAR____TtC13AppProtection37APExtensionSubjectMonitorSubscription_monitorRef);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13AppProtection37APExtensionSubjectMonitorSubscription_registry));
}

@end
