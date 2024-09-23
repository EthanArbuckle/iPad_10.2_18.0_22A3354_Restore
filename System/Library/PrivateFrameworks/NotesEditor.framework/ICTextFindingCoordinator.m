@implementation ICTextFindingCoordinator

- (ICTextFindingCoordinator)initWithDataSource:(id)a3
{
  objc_class *ObjectType;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[ICTextFindingCoordinator init](&v6, sel_init);
}

- (ICTextFindingCoordinator)init
{
  ICTextFindingCoordinator *result;

  result = (ICTextFindingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DD8FF058((uint64_t)self + OBJC_IVAR___ICTextFindingCoordinator_dataSource);
}

- (void)configureFindInteraction:(id)a3 forTextView:(id)a4
{
  id v6;
  id v7;
  ICTextFindingCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s11NotesEditor22TextFindingCoordinatorC9configure15findInteraction3forySo06UIFindH0C_So10ICTextViewCtF_0(v6);

}

- (void)matchesForString:(NSString *)a3 inTextStorage:(NSTextStorage *)a4 note:(ICNote *)a5 ignoreCase:(BOOL)a6 wholeWords:(BOOL)a7 startsWith:(BOOL)a8 completion:(id)a9
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  NSString *v24;
  NSTextStorage *v25;
  ICNote *v26;
  ICTextFindingCoordinator *v27;
  uint64_t v28;

  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBFA130);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a9);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a3;
  *(_QWORD *)(v20 + 24) = a4;
  *(_QWORD *)(v20 + 32) = a5;
  *(_BYTE *)(v20 + 40) = a6;
  *(_BYTE *)(v20 + 41) = a7;
  *(_BYTE *)(v20 + 42) = a8;
  *(_QWORD *)(v20 + 48) = v19;
  *(_QWORD *)(v20 + 56) = self;
  v21 = sub_1DD9D2344();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1F03F7468;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1F03F7470;
  v23[5] = v22;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = self;
  sub_1DD939D00((uint64_t)v18, (uint64_t)&unk_1F03F7478, (uint64_t)v23);
  swift_release();
}

- (BOOL)replaceMatches:(id)a3 withString:(id)a4 error:(id *)a5
{
  unint64_t v6;
  char **v7;
  char *v8;
  char *v9;
  ICTextFindingCoordinator *v10;

  sub_1DD7C0C74(0, &qword_1F03F7438);
  v6 = sub_1DD9D22A8();
  v7 = (char **)sub_1DD9D2170();
  v9 = v8;
  v10 = self;
  sub_1DD91BA6C(v6, v7, v9, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (void)replaceAllOccurrencesOfQueryString:(NSString *)a3 withString:(NSString *)a4 inTextStorage:(NSTextStorage *)a5 note:(ICNote *)a6 ignoreCase:(BOOL)a7 wholeWords:(BOOL)a8 startsWith:(BOOL)a9 completion:(id)a10
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  NSString *v24;
  NSString *v25;
  NSTextStorage *v26;
  ICNote *v27;
  ICTextFindingCoordinator *v28;
  uint64_t v29;
  NSString *v30;

  HIDWORD(v29) = a8;
  v30 = a3;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBFA130);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a10);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a3;
  *(_QWORD *)(v20 + 24) = a4;
  *(_QWORD *)(v20 + 32) = a5;
  *(_QWORD *)(v20 + 40) = a6;
  *(_BYTE *)(v20 + 48) = a7;
  *(_BYTE *)(v20 + 49) = BYTE4(v29);
  *(_BYTE *)(v20 + 50) = a9;
  *(_QWORD *)(v20 + 56) = v19;
  *(_QWORD *)(v20 + 64) = self;
  v21 = sub_1DD9D2344();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1F03F7448;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1F03F7450;
  v23[5] = v22;
  v24 = v30;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  v28 = self;
  sub_1DD939D00((uint64_t)v18, (uint64_t)&unk_1F03F73C0, (uint64_t)v23);
  swift_release();
}

@end
