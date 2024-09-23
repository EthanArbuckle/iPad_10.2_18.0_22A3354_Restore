@implementation ICPaperTextAttachmentManager

- (ICPaperTextAttachmentManager)initWithNote:(id)a3 textView:(id)a4
{
  return (ICPaperTextAttachmentManager *)PaperTextAttachmentManager.init(note:textView:)(a3, a4);
}

- (void)paperKitViewDidAppear:(id)a3
{
  id v4;
  ICPaperTextAttachmentManager *v5;

  v4 = a3;
  v5 = self;
  sub_1DD96D37C(v4);

}

- (void)paperKitViewWillDisappear:(id)a3
{
  id v4;
  ICPaperTextAttachmentManager *v5;

  v4 = a3;
  v5 = self;
  sub_1DD96F244(v4);

}

- (void)noteDidChangeCalculatePreviewBehavior:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  ICPaperTextAttachmentManager *v8;
  uint64_t v9;

  v4 = sub_1DD9D0538();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD9D0514();
  v8 = self;
  sub_1DD96CFC0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)insertMagicGenerativePlaygroundWithAutomaticContent
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  ICPaperTextAttachmentManager *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = sub_1DD9D1D38();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0D658F8], v3);
  v7 = self;
  if (ICInternalSettingsIsGenerationToolEnabled())
  {
    sub_1DD96DDB4(1);
    if (v8)
    {
      v9 = v8;
      sub_1DD9D1E4C();
      v10 = (void *)swift_dynamicCastClass();
      if (v10)
      {
        objc_msgSend(v10, sel_bounds);
        sub_1DD9D1E34();
      }

    }
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

}

- (void)insertMagicGenerativePlaygroundWithText:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  ICPaperTextAttachmentManager *v7;
  Swift::String v8;

  v4 = sub_1DD9D2170();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  PaperTextAttachmentManager.insertMagicGenerativePlaygroundWithText(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)insertMagicGenerativePlaygroundWithImage:(CGImage *)a3
{
  CGImage *v4;
  ICPaperTextAttachmentManager *v5;

  v4 = a3;
  v5 = self;
  PaperTextAttachmentManager.insertMagicGenerativePlaygroundWithImage(_:)(v4);

}

- (ICPaperTextAttachmentManager)init
{
  ICPaperTextAttachmentManager *result;

  result = (ICPaperTextAttachmentManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICPaperTextAttachmentManager_isMathPaperSolvingAllowedObservation));
}

@end
