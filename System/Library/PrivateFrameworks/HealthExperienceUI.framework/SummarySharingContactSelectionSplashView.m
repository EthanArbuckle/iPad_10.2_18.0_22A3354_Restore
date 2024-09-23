@implementation SummarySharingContactSelectionSplashView

- (_TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView *)sub_1A97AA8A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView_openContactsHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(uint64_t);
  id v13;
  _TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView *v14;
  uint64_t v15;
  uint64_t v17;

  v8 = sub_1A9A91F18();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A91EDC();
  v12 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                       + OBJC_IVAR____TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView_openContactsHandler);
  if (v12)
  {
    v13 = a3;
    v14 = self;
    v15 = sub_1A9649378((uint64_t)v12);
    v12(v15);
    sub_1A9642C9C((uint64_t)v12);

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return 0;
}

- (void).cxx_destruct
{
  sub_1A9642C9C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView_openContactsHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView_textView));
}

@end
