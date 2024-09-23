@implementation ICPDFTextFindingResult

- (int64_t)compare:(id)a3
{
  objc_class *v4;
  _TtC11NotesEditor22ICPDFTextFindingResult *v5;
  NSComparisonResult v6;
  ICTextFindingResult v8;

  v4 = (objc_class *)a3;
  v5 = self;
  v8.super.isa = v4;
  v6 = ICPDFTextFindingResult.compare(_:)(v8);

  return v6;
}

- (void)selectInTextView:(id)a3
{
  id v4;
  id v5;
  _TtC11NotesEditor22ICPDFTextFindingResult *v6;

  v6 = self;
  v4 = a3;
  v5 = -[ICTextFindingResult range](v6, sel_range);
  if (v4)
  {
    objc_msgSend(v4, sel_setSelectedRange_, v5, 0);

  }
}

- (id)framesForHighlightInTextView:(id)a3
{
  _WORD *v4;
  _TtC11NotesEditor22ICPDFTextFindingResult *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  ICPDFTextFindingResult.framesForHighlight(in:)(v4);

  sub_1DD7C0C74(0, (unint64_t *)&qword_1F03F7480);
  v6 = (void *)sub_1DD9D229C();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)scrollToVisibleInTextView:(id)a3
{
  id v5;
  _TtC11NotesEditor22ICPDFTextFindingResult *v6;

  v5 = a3;
  v6 = self;
  ICPDFTextFindingResult.scrollToVisible(in:)((ICTextView_optional *)a3);

}

+ (void)resultsInAttachment:(ICAttachment *)a3 matchingString:(NSString *)a4 textView:(ICTextView *)a5 ignoreCase:(BOOL)a6 wholeWords:(BOOL)a7 startsWith:(BOOL)a8 usePattern:(BOOL)a9 completion:(id)a10
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  ICAttachment *v24;
  NSString *v25;
  ICTextView *v26;
  uint64_t v27;
  ICAttachment *v28;

  HIDWORD(v27) = a8;
  v28 = a3;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBFA130);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a10);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a3;
  *(_QWORD *)(v20 + 24) = a4;
  *(_QWORD *)(v20 + 32) = a5;
  *(_BYTE *)(v20 + 40) = a6;
  *(_BYTE *)(v20 + 41) = a7;
  *(_BYTE *)(v20 + 42) = BYTE4(v27);
  *(_BYTE *)(v20 + 43) = a9;
  *(_QWORD *)(v20 + 48) = v19;
  *(_QWORD *)(v20 + 56) = a1;
  v21 = sub_1DD9D2344();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1F03F73B8;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1F03F7450;
  v23[5] = v22;
  v24 = v28;
  v25 = a4;
  v26 = a5;
  sub_1DD939D00((uint64_t)v18, (uint64_t)&unk_1F03F73C0, (uint64_t)v23);
  swift_release();
}

- (_TtC11NotesEditor22ICPDFTextFindingResult)init
{
  _TtC11NotesEditor22ICPDFTextFindingResult *result;

  result = (_TtC11NotesEditor22ICPDFTextFindingResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DD919280((uint64_t)self + OBJC_IVAR____TtC11NotesEditor22ICPDFTextFindingResult_result);
}

@end
