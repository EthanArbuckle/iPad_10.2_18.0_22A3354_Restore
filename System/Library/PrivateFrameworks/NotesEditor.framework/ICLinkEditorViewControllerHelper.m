@implementation ICLinkEditorViewControllerHelper

+ (id)presentFromViewController:(id)a3 delegate:(id)a4 text:(id)a5 url:(id)a6 attachment:(id)a7 stringSelection:(id)a8 range:(_NSRange)a9 addApproach:(int64_t)a10
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v28;
  NSUInteger location;

  location = a9.location;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBF97F0);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a5)
  {
    v19 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v22 = sub_1DD9D0724();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v18, 1, 1, v22);
    goto LABEL_6;
  }
  v19 = sub_1DD9D2170();
  a5 = v20;
  if (!a6)
    goto LABEL_5;
LABEL_3:
  sub_1DD9D06E8();
  v21 = sub_1DD9D0724();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 0, 1, v21);
LABEL_6:
  v23 = a3;
  swift_unknownObjectRetain();
  v24 = a7;
  v25 = a8;
  v26 = (void *)sub_1DD9B1D54(v23, (char *)a4, v19, (uint64_t)a5, (uint64_t)v18, a7, v25, location, a9.length, a10);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DD92A8B8((uint64_t)v18);
  return v26;
}

- (ICLinkEditorViewControllerHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LinkEditorViewControllerHelper();
  return -[ICLinkEditorViewControllerHelper init](&v3, sel_init);
}

@end
