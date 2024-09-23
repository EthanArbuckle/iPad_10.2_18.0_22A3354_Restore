@implementation FamilySettingsDestinations

+ (id)urlDestinationTo:(int64_t)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v11;

  v5 = sub_1CAF200D0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjCClassMetadata();
  static FamilySettingsDestinations.urlDestination(to:)(a3);
  v9 = (void *)sub_1CAF200A0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

+ (id)urlDestinationTo:(int64_t)a3 params:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v6 = sub_1CAF200D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1CAF20394();
  static FamilySettingsDestinations.urlDestination(to:params:)(a3, v10, (uint64_t)v9);
  swift_bridgeObjectRelease();
  v11 = (void *)sub_1CAF200A0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (FamilySettingsDestinations)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FamilySettingsDestinations;
  return -[FamilySettingsDestinations init](&v3, sel_init);
}

@end
