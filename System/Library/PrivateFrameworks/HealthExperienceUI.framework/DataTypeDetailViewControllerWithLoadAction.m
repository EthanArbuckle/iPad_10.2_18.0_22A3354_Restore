@implementation DataTypeDetailViewControllerWithLoadAction

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction *v2;

  v2 = self;
  sub_1A97D457C();

}

- (_TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction)initWithCoder:(id)a3
{
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  objc_super v9;

  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction_onLoadAction);
  *v5 = 0;
  v5[1] = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction_shouldRunLoadAction) = 0;
  v6 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction_onLoadActionContext;
  v7 = type metadata accessor for DataTypeDetailViewControllerWithLoadAction.OnLoadActionContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DataTypeDetailViewControllerWithLoadAction(0);
  return -[DataTypeDetailViewController initWithCoder:](&v9, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1A9642C9C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction_onLoadAction));
  sub_1A97D53C0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction_onLoadActionContext);
}

@end
