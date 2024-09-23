@implementation QuestionGroupTitleViewController

+ (id)viewWithTitle:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = sub_21DAC481C();
  _s12FeedbackCore32QuestionGroupTitleViewControllerC4view5titleSo6UIViewCSS_tFZ_0(v3, v4);
  v6 = v5;
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC12FeedbackCore32QuestionGroupTitleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC12FeedbackCore32QuestionGroupTitleViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_21DAC481C();
    v6 = a4;
    v7 = (void *)sub_21DAC4810();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for QuestionGroupTitleViewController();
  v9 = -[QuestionGroupTitleViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC12FeedbackCore32QuestionGroupTitleViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for QuestionGroupTitleViewController();
  return -[QuestionGroupTitleViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
