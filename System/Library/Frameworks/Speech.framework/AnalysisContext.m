@implementation AnalysisContext

- (id)_contextualStringsForKey:(id)a3
{
  _TtC6Speech15AnalysisContext *v4;
  uint64_t v5;
  void *v6;

  sub_1B25CCA18();
  v4 = self;
  v5 = sub_1B25496A0();

  swift_bridgeObjectRelease();
  if (v5)
  {
    v6 = (void *)sub_1B25CCB98();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_setContextualStrings:(id)a3 forKey:(id)a4
{
  _TtC6Speech15AnalysisContext *v5;

  if (a3)
    sub_1B25CCBA4();
  sub_1B25CCA18();
  v5 = self;
  sub_1B2549784();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)_userDataForKey:(id)a3
{
  _TtC6Speech15AnalysisContext *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD v12[3];
  uint64_t v13;

  sub_1B25CCA18();
  v4 = self;
  sub_1B25498E4((uint64_t)v12);

  swift_bridgeObjectRelease();
  v5 = v13;
  if (!v13)
    return 0;
  v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v6, v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)sub_1B25CD5C4();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v10;
}

- (void)_setUserData:(id)a3 forKey:(id)a4
{
  id v6;
  _TtC6Speech15AnalysisContext *v7;
  id v8;
  _TtC6Speech15AnalysisContext *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1B25CD180();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v8 = a4;
    v9 = self;
  }
  v10 = sub_1B25CCA18();
  v12 = v11;

  sub_1B2549A9C((uint64_t)v13, v10, v12);
  swift_bridgeObjectRelease();

  sub_1B254E678((uint64_t)v13, &qword_1ED36D068);
}

- (NSString)geoLMRegionID
{
  _TtC6Speech15AnalysisContext *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1B254A120();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B25CCA0C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setGeoLMRegionID:(id)a3
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  _TtC6Speech15AnalysisContext *v7;

  if (a3)
  {
    v4 = sub_1B25CCA18();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1B254A228(v4, v6);

}

- (_TtC6Speech15AnalysisContext)init
{
  return (_TtC6Speech15AnalysisContext *)AnalysisContext.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_63_6();
}

@end
