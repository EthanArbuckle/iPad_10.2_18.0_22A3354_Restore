@implementation ICSystemPaperIndexableTextContentHelper

- (PKDrawing)drawing
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03F9C58);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___ICSystemPaperIndexableTextContentHelper_drawing;
  swift_beginAccess();
  sub_1DD9CB048((uint64_t)v6, (uint64_t)v5);
  v7 = sub_1DD9D20A4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1DD9D208C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (PKDrawing *)v9;
}

- (void)setDrawing:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  ICSystemPaperIndexableTextContentHelper *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  ICSystemPaperIndexableTextContentHelper *v12;
  char *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03F9C58);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v8 = self;
    v9 = a3;
    sub_1DD9D2098();

    v10 = sub_1DD9D20A4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 0, 1, v10);
  }
  else
  {
    v11 = sub_1DD9D20A4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
    v12 = self;
  }
  v13 = (char *)self + OBJC_IVAR___ICSystemPaperIndexableTextContentHelper_drawing;
  swift_beginAccess();
  sub_1DD9CB1F8((uint64_t)v7, (uint64_t)v13);
  swift_endAccess();

}

- (ICSystemPaperIndexableTextContentHelper)initWithPaperAttachment:(id)a3
{
  id v3;
  ICSystemPaperIndexableTextContentHelper *v4;

  v3 = a3;
  v4 = (ICSystemPaperIndexableTextContentHelper *)sub_1DD9CB808(v3);

  return v4;
}

- (id)searchWithQuery:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  ICSystemPaperIndexableTextContentHelper *v7;
  void *v8;

  v4 = sub_1DD9D2170();
  v6 = v5;
  v7 = self;
  ICSystemPaperIndexableTextContentHelper.search(query:)(v4, v6);

  swift_bridgeObjectRelease();
  sub_1DD9CBE40();
  v8 = (void *)sub_1DD9D229C();
  swift_bridgeObjectRelease();
  return v8;
}

- (ICSystemPaperIndexableTextContentHelper)init
{
  ICSystemPaperIndexableTextContentHelper *result;

  result = (ICSystemPaperIndexableTextContentHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1DD8FF244((uint64_t)self + OBJC_IVAR___ICSystemPaperIndexableTextContentHelper_drawing, &qword_1F03F9C58);
}

@end
