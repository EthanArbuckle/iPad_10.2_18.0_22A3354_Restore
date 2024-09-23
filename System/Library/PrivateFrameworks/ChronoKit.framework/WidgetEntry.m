@implementation WidgetEntry

- (void)invalidate
{
  _QWORD *v3;
  uint64_t v4;
  void (*v5)(void);
  _TtC9ChronoKit11WidgetEntry *v6;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9ChronoKit11WidgetEntry_descriptorObserver);
  v4 = v3[4];
  __swift_project_boxed_opaque_existential_0(v3, v3[3]);
  v5 = *(void (**)(void))(v4 + 24);
  v6 = self;
  v5();

}

- (_TtC9ChronoKit11WidgetEntry)init
{
  _TtC9ChronoKit11WidgetEntry *result;

  result = (_TtC9ChronoKit11WidgetEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry_protectionType;
  v4 = sub_1D26CD488();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1D25340E4((uint64_t)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry_key, (uint64_t (*)(_QWORD))type metadata accessor for WidgetEntryKey);
  swift_release();
  sub_1D253703C((uint64_t)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry__lock_cachedViewableEntry, (uint64_t *)&unk_1ED96BF50);
  v5 = (char *)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry__lock_configuredDate;
  v6 = sub_1D26CB9DC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_1D253703C((uint64_t)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry__lock_currentEntry, &qword_1ED96BF40);
  swift_release();
  sub_1D253703C((uint64_t)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry__lock_content, &qword_1ED96BF68);
  sub_1D253703C((uint64_t)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry__lock_contentLoadErrorDate, &qword_1ED96B1E0);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry_descriptorObserver);
}

- (NSString)description
{
  _TtC9ChronoKit11WidgetEntry *v2;
  void *v3;

  v2 = self;
  WidgetEntry.description.getter();

  v3 = (void *)sub_1D26CD914();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
