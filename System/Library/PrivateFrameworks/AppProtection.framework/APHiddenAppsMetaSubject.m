@implementation APHiddenAppsMetaSubject

- (_TtC13AppProtection23APHiddenAppsMetaSubject)init
{
  _TtC13AppProtection23APHiddenAppsMetaSubject *result;

  result = (_TtC13AppProtection23APHiddenAppsMetaSubject *)sub_2362CBB00();
  __break(1u);
  return result;
}

- (BOOL)isHidden
{
  _TtC13AppProtection23APHiddenAppsMetaSubject *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_2362C2EE4((void (*)(uint64_t *__return_ptr, os_unfair_lock_s *, uint64_t))sub_23624EDBC);

  return v3;
}

- (BOOL)isLocked
{
  return -[APHiddenAppsMetaSubject isHidden](self, sel_isHidden);
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

- (_TtC13AppProtection23APHiddenAppsMetaSubject)initWithArena:(id)a3
{
  sub_2362C302C((uint64_t)self, (uint64_t)a2, a3);
}

@end
