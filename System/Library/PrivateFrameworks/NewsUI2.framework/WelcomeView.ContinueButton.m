@implementation WelcomeView.ContinueButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WelcomeView.ContinueButton();
  return -[WelcomeView.ContinueButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WelcomeView.ContinueButton();
  v4 = v5.receiver;
  -[WelcomeView.ContinueButton setHighlighted:](&v5, sel_setHighlighted_, v3);
  sub_1D60A7FC0();

}

- (_TtCC7NewsUI211WelcomeView14ContinueButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtCC7NewsUI211WelcomeView14ContinueButton *v7;
  uint64_t v8;
  _TtCC7NewsUI211WelcomeView14ContinueButton *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for WelcomeView.ContinueButton();
  v7 = -[WelcomeView.ContinueButton initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v8 = qword_1ED624128;
  v9 = v7;
  if (v8 != -1)
    swift_once();
  -[WelcomeView.ContinueButton setBackgroundColor:](v9, sel_setBackgroundColor_, qword_1ED6987B8);

  return v9;
}

- (_TtCC7NewsUI211WelcomeView14ContinueButton)initWithCoder:(id)a3
{
  _TtCC7NewsUI211WelcomeView14ContinueButton *result;

  result = (_TtCC7NewsUI211WelcomeView14ContinueButton *)sub_1D6E28010();
  __break(1u);
  return result;
}

@end
