@implementation APLockedAppsMetaSubject

- (_TtC13AppProtection23APLockedAppsMetaSubject)init
{
  _TtC13AppProtection23APLockedAppsMetaSubject *result;

  result = (_TtC13AppProtection23APLockedAppsMetaSubject *)sub_2362CBB00();
  __break(1u);
  return result;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isLocked
{
  _TtC13AppProtection23APLockedAppsMetaSubject *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_2362C2EE4((void (*)(uint64_t *__return_ptr, os_unfair_lock_s *, uint64_t))sub_23624EDD8);

  return v3;
}

- (NSString)description
{
  return (NSString *)(id)sub_2362CB674();
}

- (BOOL)shieldable
{
  return 0;
}

- (id)effectiveBundleIdentifier
{
  return (id)sub_2362CB674();
}

- (_TtC13AppProtection23APLockedAppsMetaSubject)initWithArena:(id)a3
{
  sub_2362C302C((uint64_t)self, (uint64_t)a2, a3);
}

@end
