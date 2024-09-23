@implementation TitleWithSubHeadingView

- (_TtC18HealthExperienceUI23TitleWithSubHeadingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC18HealthExperienceUI23TitleWithSubHeadingView *v10;
  uint64_t v11;
  _TtC18HealthExperienceUI23TitleWithSubHeadingView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC18HealthExperienceUI23TitleWithSubHeadingView_headingLabel;
  v9 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  v11 = OBJC_IVAR____TtC18HealthExperienceUI23TitleWithSubHeadingView_subHeadingLabel;
  *(Class *)((char *)&v10->super.super.super.isa + v11) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for TitleWithSubHeadingView();
  v12 = -[TitleWithSubHeadingView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_1A992833C();

  return v12;
}

- (_TtC18HealthExperienceUI23TitleWithSubHeadingView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC18HealthExperienceUI23TitleWithSubHeadingView *result;

  v5 = OBJC_IVAR____TtC18HealthExperienceUI23TitleWithSubHeadingView_headingLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC18HealthExperienceUI23TitleWithSubHeadingView_subHeadingLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);

  result = (_TtC18HealthExperienceUI23TitleWithSubHeadingView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23TitleWithSubHeadingView_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23TitleWithSubHeadingView_subHeadingLabel));
}

@end
