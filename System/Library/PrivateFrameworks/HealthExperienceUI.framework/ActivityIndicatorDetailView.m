@implementation ActivityIndicatorDetailView

- (_TtC18HealthExperienceUI27ActivityIndicatorDetailView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI27ActivityIndicatorDetailView *)sub_1A99A97D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI27ActivityIndicatorDetailView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A99AB550();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView_activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView____lazy_storage___detailTextView));
  sub_1A96AF160((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView_action);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView_titleLeadingAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView_titleTopOrCenterAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView_detailTextViewTopAnchor));
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC18HealthExperienceUI27ActivityIndicatorDetailView *v13;
  uint64_t v15;

  v8 = sub_1A9A91F18();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A91EDC();
  v12 = a3;
  v13 = self;
  LOBYTE(self) = sub_1A99AB69C((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

@end
