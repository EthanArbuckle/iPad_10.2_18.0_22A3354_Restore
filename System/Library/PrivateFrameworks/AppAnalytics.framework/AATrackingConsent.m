@implementation AATrackingConsent

- (AATrackingConsent)init
{
  return (AATrackingConsent *)sub_1A5EC4E5C();
}

+ (AATrackingConsent)shared
{
  if (qword_1ED1CDB20 != -1)
    swift_once();
  return (AATrackingConsent *)(id)qword_1ED1CDB10;
}

- (void)push
{
  sub_1A5F0B478(self, (uint64_t)a2, (uint64_t)"Tracking consent pushed", (void (*)(_QWORD))MEMORY[0x1E0C82D28]);
}

- (void)pop
{
  sub_1A5F0B478(self, (uint64_t)a2, (uint64_t)"Tracking consent popped", (void (*)(_QWORD))MEMORY[0x1E0C82D30]);
}

- (void)allow
{
  uint64_t v2;
  AATrackingConsent *v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATrackingConsent_lock);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock_with_options();
  sub_1A5F0B530((uint64_t)v3);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v2 + 16));

  swift_release();
}

- (void).cxx_destruct
{

  swift_release();
}

@end
