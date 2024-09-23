@implementation SuggestedActionTileViewController

- (void)didTapAction:(id)a3
{
  _TtC18HealthExperienceUI33SuggestedActionTileViewController *v4;
  uint64_t v5;
  uint64_t v6;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  v5 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v4->super.super.super.isa) + 0x1A0))(v5);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
}

- (void)didTapLink:(id)a3
{
  _TtC18HealthExperienceUI33SuggestedActionTileViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)viewDidLoad
{
  _QWORD *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SuggestedActionTileViewController();
  v2 = v4.receiver;
  v3 = -[SuggestedActionTileViewController viewDidLoad](&v4, sel_viewDidLoad);
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x198))(v3);

}

- (_TtC18HealthExperienceUI33SuggestedActionTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC18HealthExperienceUI33SuggestedActionTileViewController *)SuggestedActionTileViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18HealthExperienceUI33SuggestedActionTileViewController)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI33SuggestedActionTileViewController *)SuggestedActionTileViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1A970AD84((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33SuggestedActionTileViewController_context);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33SuggestedActionTileViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33SuggestedActionTileViewController____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33SuggestedActionTileViewController____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33SuggestedActionTileViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33SuggestedActionTileViewController____lazy_storage___bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33SuggestedActionTileViewController____lazy_storage___linkButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33SuggestedActionTileViewController____lazy_storage___actionButton));
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33SuggestedActionTileViewController_suggestedActionDelegate);
}

@end
