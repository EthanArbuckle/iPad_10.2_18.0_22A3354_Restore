@implementation APApplication

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (BOOL)isLocked
{
  APApplication *v2;
  char v3;

  v2 = self;
  v3 = APApplication.isLocked.getter();

  return v3 & 1;
}

- (BOOL)isHidden
{
  APApplication *v2;
  char v3;

  v2 = self;
  v3 = APApplication.isHidden.getter();

  return v3 & 1;
}

+ (APApplication)applicationWithBundleIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];

  v3 = sub_2362CB698();
  v5 = v4;
  if (qword_2542A5598 != -1)
    swift_once();
  sub_23624E76C((uint64_t)&qword_2542A5920, (uint64_t)v8);
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v6 = (void *)sub_23624E7E4(v3, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  swift_bridgeObjectRelease();
  return (APApplication *)v6;
}

- (void)dealloc
{
  uint64_t v3;
  APApplication *v4;
  id v5;
  objc_super v6;
  _QWORD v7[5];

  sub_23624E76C((uint64_t)self + OBJC_IVAR___APSubject_clientArenaStorage, (uint64_t)v7);
  v3 = *__swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v4 = self;
  v5 = -[APApplication bundleIdentifier](v4, sel_bundleIdentifier);
  sub_2362CB698();

  if (os_unfair_lock_trylock((os_unfair_lock_t)(v3 + 24)))
  {
    sub_23624EB80((void **)(v3 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 24));
  }
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  v6.receiver = v4;
  v6.super_class = (Class)APApplication;
  -[APApplication dealloc](&v6, sel_dealloc);
}

- (id)bundleIdentifier
{
  return sub_23624EC40();
}

- (id)initFileprivWithBundleID:(id)a3 arena:(id)a4
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  objc_super v10;

  v6 = sub_2362CB698();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___APApplication__bundleIdentifier);
  *v7 = v6;
  v7[1] = v8;
  v10.receiver = self;
  v10.super_class = (Class)APApplication;
  return -[APSubject initWithArena:](&v10, sel_initWithArena_, a4);
}

- (NSString)description
{
  APApplication *v2;
  void *v3;

  v2 = self;
  APApplication.description.getter();

  v3 = (void *)sub_2362CB674();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)effectiveBundleIdentifier
{
  APApplication *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = -[APApplication bundleIdentifier](v2, sel_bundleIdentifier);
  sub_2362CB698();

  v4 = (void *)sub_2362CB674();
  swift_bridgeObjectRelease();
  return v4;
}

- (BOOL)isEffectivelyLocked
{
  APApplication *v2;
  char v3;

  v2 = self;
  v3 = APApplication.isEffectivelyLocked.getter();

  return v3 & 1;
}

+ (id)lockedApplications
{
  return sub_2362C2824((uint64_t)a1, (uint64_t)a2, static APApplication.lockedApplications());
}

+ (id)hiddenApplications
{
  return sub_2362C2824((uint64_t)a1, (uint64_t)a2, static APApplication.hiddenApplications());
}

+ (id)applicationsWithContentHiddenFromSearch
{
  return sub_2362C2824((uint64_t)a1, (uint64_t)a2, static APApplication.applicationsWithContentHiddenFromSearch());
}

+ (id)hiddenAppBundleIdentifiers
{
  return sub_2362C2A98((uint64_t)a1, (uint64_t)a2, (void (*)(uint64_t *__return_ptr, os_unfair_lock_s *, uint64_t))sub_23624EDBC);
}

+ (id)lockedAppBundleIdentifiers
{
  return sub_2362C2A98((uint64_t)a1, (uint64_t)a2, (void (*)(uint64_t *__return_ptr, os_unfair_lock_s *, uint64_t))sub_23624EDD8);
}

+ (id)effectivelyLockedAppBundleIdentifiers
{
  return sub_2362C2A98((uint64_t)a1, (uint64_t)a2, (void (*)(uint64_t *__return_ptr, os_unfair_lock_s *, uint64_t))sub_236290880);
}

+ (id)bundleIdentifiersWithContentHiddenFromSearch
{
  id v2;
  void *v3;

  v2 = objc_msgSend(a1, sel_lockedAppBundleIdentifiers);
  sub_2362CB7AC();

  v3 = (void *)sub_2362CB7A0();
  swift_bridgeObjectRelease();
  return v3;
}

@end
