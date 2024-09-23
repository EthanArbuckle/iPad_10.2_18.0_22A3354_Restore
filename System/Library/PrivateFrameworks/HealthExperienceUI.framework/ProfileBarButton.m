@implementation ProfileBarButton

- (_TtC18HealthExperienceUI16ProfileBarButton)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI16ProfileBarButton____lazy_storage___meContactView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI16ProfileBarButton_gestureRecognizer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ProfileBarButton();
  return -[ProfileBarButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC18HealthExperienceUI16ProfileBarButton)init
{
  return -[ProfileBarButton initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 34.0, 34.0);
}

- (_TtC18HealthExperienceUI16ProfileBarButton)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI16ProfileBarButton *)sub_1A97EADBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)openProfileViewControllerWithSender:(id)a3
{
  _TtC18HealthExperienceUI16ProfileBarButton *v4;
  _TtC18HealthExperienceUI16ProfileBarButton *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A9A96670();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1A97EAFEC();

  sub_1A976B244((uint64_t)v6, (uint64_t)&qword_1ED27E5C0, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1A961D9E8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI16ProfileBarButton____lazy_storage___meContactView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI16ProfileBarButton_gestureRecognizer));
}

@end
