@implementation FBKQuestionGroupDiffableSection

- (FBKQuestionGroup)questionGroup
{
  return (FBKQuestionGroup *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                     + OBJC_IVAR____TtC12FeedbackCore31FBKQuestionGroupDiffableSection_questionGroup));
}

- (_TtC12FeedbackCore31FBKQuestionGroupDiffableSection)initWithQuestionGroup:(id)a3 visibleQuestions:(id)a4 formResponse:(id)a5 useInlineChoices:(BOOL)a6 questionIDsInErrorState:(id)a7
{
  unint64_t v10;
  void **v11;
  id v12;
  char *v13;
  _TtC12FeedbackCore31FBKQuestionGroupDiffableSection *v14;

  sub_21DA3BF58(0, &qword_255399360);
  v10 = sub_21DAC496C();
  sub_21DA3BF58(0, &qword_255398F18);
  sub_21DA6EECC();
  v11 = (void **)sub_21DAC49D8();
  v12 = a3;
  v13 = (char *)a5;
  v14 = (_TtC12FeedbackCore31FBKQuestionGroupDiffableSection *)sub_21DA6E500(v12, v10, v13, a6, v11);

  return v14;
}

+ (id)identifierForQuestion:(id)a3 formResponse:(id)a4 questionIDsInErrorState:(id)a5
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;

  sub_21DA3BF58(0, &qword_255398F18);
  sub_21DA6EECC();
  v7 = sub_21DAC49D8();
  v8 = a3;
  v9 = a4;
  _s12FeedbackCore31FBKQuestionGroupDiffableSectionC21identifierForQuestion_12formResponse23questionIDsInErrorStateSSSo0C0C_So07FBKFormK0CShySo8NSNumberCGtFZ_0(v8, (uint64_t)v9, v7);

  swift_bridgeObjectRelease();
  v10 = (void *)sub_21DAC4810();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)questionWithRowIdentifier:(id)a3
{
  return sub_21DA6D874(self, (uint64_t)a2, (uint64_t)a3, sub_21DA6D5B4);
}

- (id)questionOrChoiceWithRowIdentifier:(id)a3
{
  return sub_21DA6D874(self, (uint64_t)a2, (uint64_t)a3, sub_21DA6D70C);
}

- (id)visibleQuestions
{
  _TtC12FeedbackCore31FBKQuestionGroupDiffableSection *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = swift_bridgeObjectRetain();
  sub_21DA6E39C(v3, (uint64_t)v2);

  swift_bridgeObjectRelease();
  sub_21DA3BF58(0, &qword_255399360);
  v4 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)questionWithChoice:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC12FeedbackCore31FBKQuestionGroupDiffableSection *v6;
  void *v7;

  v4 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC12FeedbackCore31FBKQuestionGroupDiffableSection_choiceIdentifierToQuestion);
  v5 = a3;
  v6 = self;
  v7 = sub_21DA6D274(v5, v4);

  return v7;
}

- (NSString)sectionIdentifier
{
  void *v2;
  _TtC12FeedbackCore31FBKQuestionGroupDiffableSection *v3;
  NSString *result;
  NSString *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore31FBKQuestionGroupDiffableSection_questionGroup);
  v3 = self;
  result = (NSString *)objc_msgSend(v2, sel_title);
  if (result)
  {
    v5 = result;
    sub_21DAC481C();

    v6 = (void *)sub_21DAC4810();
    swift_bridgeObjectRelease();
    return (NSString *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSArray)rowIdentifiers
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC12FeedbackCore31FBKQuestionGroupDiffableSection)init
{
  _TtC12FeedbackCore31FBKQuestionGroupDiffableSection *result;

  result = (_TtC12FeedbackCore31FBKQuestionGroupDiffableSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore31FBKQuestionGroupDiffableSection_questionGroup));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
