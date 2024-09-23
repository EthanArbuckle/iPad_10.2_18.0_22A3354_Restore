@implementation ICTextElementAnimator

- (ICTextElementAnimator)initWithTextView:(id)a3 originTrackedParagraphs:(id)a4 destinationTrackedParagraphs:(id)a5
{
  objc_class *ObjectType;
  objc_class *v8;
  objc_class *v9;
  id v10;
  ICTextElementAnimator *v11;
  ICTextElementAnimator *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1DD7C0C74(0, &qword_1F03F8F10);
  v8 = (objc_class *)sub_1DD9D22A8();
  v9 = (objc_class *)sub_1DD9D22A8();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTextElementAnimator_textView) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTextElementAnimator_originTrackedParagraphs) = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTextElementAnimator_destinationTrackedParagraphs) = v9;
  v10 = a3;
  v11 = self;
  *(Class *)((char *)&v11->super.isa + OBJC_IVAR___ICTextElementAnimator_uuidsToElementAnimationConfigurations) = (Class)sub_1DD903A10(MEMORY[0x1E0DEE9D8]);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[ICTextElementAnimator init](&v14, sel_init);
  sub_1DD98C230();

  return v12;
}

- (void)animateWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  ICTextElementAnimator *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1DD98E268;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  TextElementAnimator.animate(completion:)((uint64_t)v7, v6);
  sub_1DD8FE450((uint64_t)v7);

}

- (ICTextElementAnimator)init
{
  ICTextElementAnimator *result;

  result = (ICTextElementAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
