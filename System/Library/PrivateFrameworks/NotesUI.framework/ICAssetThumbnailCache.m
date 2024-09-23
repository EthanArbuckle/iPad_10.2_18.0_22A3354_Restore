@implementation ICAssetThumbnailCache

+ (NSDate)currentVersionDate
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E80C0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED6E8390 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED6E8040);
  sub_1AC8E8638(v5, (uint64_t)v4);
  v6 = sub_1ACA3F9C0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) != 1)
  {
    v8 = (void *)sub_1ACA3F954();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }
  return (NSDate *)v8;
}

+ (ICAssetThumbnailCache)shared
{
  if (qword_1ED6E8398 != -1)
    swift_once();
  return (ICAssetThumbnailCache *)(id)qword_1ED6E8058;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  ICAssetThumbnailCache *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = _s7NotesUI19AssetThumbnailCacheCySo22ICThumbnailDescriptionCSgSo0F13ConfigurationCcig_0(v4);

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  sub_1ACA42C6C();
  __break(1u);
}

- (id)creationDateFor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  ICAssetThumbnailCache *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E80C0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = qword_1ED6E8390;
  v9 = a3;
  v10 = self;
  if (v8 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v5, (uint64_t)qword_1ED6E8040);
  sub_1AC8E8638(v11, (uint64_t)v7);

  v12 = sub_1ACA3F9C0();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) != 1)
  {
    v14 = (void *)sub_1ACA3F954();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v12);
  }
  return v14;
}

- (void)invalidateForObjectIdentifiers:(id)a3
{
  sub_1ACA42C6C();
  __break(1u);
}

- (ICAssetThumbnailCache)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[ICAssetThumbnailCache init](&v3, sel_init);
}

@end
