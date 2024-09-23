@implementation APLazyRecordApplication

- (APApplication)application
{
  return (APApplication *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR___APLazyRecordApplication_application));
}

- (APLazyRecordApplication)initWithApplication:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v5 = OBJC_IVAR___APLazyRecordApplication_lazyRecord;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563D7220);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 28) = 0;
  *(_QWORD *)(v6 + 16) = 0;
  *(_BYTE *)(v6 + 24) = 2;
  *(Class *)((char *)&self->super.isa + v5) = (Class)v6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APLazyRecordApplication_application) = (Class)a3;
  v9.receiver = self;
  v9.super_class = (Class)APLazyRecordApplication;
  v7 = a3;
  return -[APLazyRecordApplication init](&v9, sel_init);
}

- (id)loadRecordWithError:(id *)a3
{
  os_unfair_lock_s *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  APLazyRecordApplication *v6;
  void *v7;
  void *v9;

  v3 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR___APLazyRecordApplication_lazyRecord);
  v4 = (uint64_t)&v3[4];
  v5 = v3 + 7;
  v6 = self;
  os_unfair_lock_lock(v5);
  sub_236260A00(v4, &v9);
  os_unfair_lock_unlock(v5);
  v7 = v9;

  return v7;
}

- (NSString)localizedName
{
  APLazyRecordApplication *v2;
  void *v3;

  v2 = self;
  sub_236260670();

  v3 = (void *)sub_2362CB674();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  APLazyRecordApplication *v2;
  APApplication *v3;
  id v4;
  void *v5;

  v2 = self;
  v3 = -[APLazyRecordApplication application](v2, sel_application);
  v4 = -[APApplication bundleIdentifier](v3, sel_bundleIdentifier);

  sub_2362CB698();
  v5 = (void *)sub_2362CB674();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)detach
{
  APLazyRecordApplication *v2;

  v2 = self;
  sub_236260818();

}

- (APLazyRecordApplication)init
{
  APLazyRecordApplication *result;

  result = (APLazyRecordApplication *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
}

@end
