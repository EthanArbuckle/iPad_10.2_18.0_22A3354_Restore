@implementation GKTextModerator

- (GKTextModerator)init
{
  return (GKTextModerator *)sub_1BCEBBD88();
}

- (NSLocale)locale
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  GKTextModerator *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF49A058);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  GKTextModerator.locale.getter();

  v7 = sub_1BCF15118();
  v8 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7) != 1)
  {
    v8 = (void *)sub_1BCF150D0();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  }
  return (NSLocale *)v8;
}

- (BOOL)shouldFilter:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  GKTextModerator *v7;
  Swift::String v8;

  v4 = sub_1BCF15628();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = GKTextModerator.shouldFilter(_:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

+ (GKTextModerator)localeAgnosticTextModerator
{
  return (GKTextModerator *)static GKTextModerator.localeAgnostic.getter();
}

+ (GKTextModerator)defaultTextModerator
{
  return (GKTextModerator *)static GKTextModerator.default.getter();
}

+ (BOOL)isAvailable
{
  char v2;

  static GKTextModerator.isAvailable()();
  return v2 & 1;
}

+ (BOOL)isAvailableForLocale:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  char v8;
  uint64_t v10;

  v3 = sub_1BCF15118();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCF150DC();
  static GKTextModerator.isAvailable(locale:)();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8 & 1;
}

+ (id)forLocale:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v9;

  v3 = sub_1BCF15118();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCF150DC();
  v7 = (void *)static GKTextModerator.for (locale:)((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GKTextModerator_implementation);
}

@end
