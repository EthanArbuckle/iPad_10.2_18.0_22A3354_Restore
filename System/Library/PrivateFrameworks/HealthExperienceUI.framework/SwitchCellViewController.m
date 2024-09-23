@implementation SwitchCellViewController

- (void)switchTapped
{
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  _TtC18HealthExperienceUI24SwitchCellViewController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t ObjectType;
  id v10;
  _TtC18HealthExperienceUI24SwitchCellViewController *v11;
  _TtC18HealthExperienceUI24SwitchCellViewController *v12;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.super.isa) + 0xF0);
  v12 = self;
  v3 = v2();
  if (!v3)
  {
    v11 = v12;
    goto LABEL_5;
  }
  v5 = (_TtC18HealthExperienceUI24SwitchCellViewController *)v3;
  v6 = v4;
  v7 = sub_1A96A0E10();
  if (v7)
  {
    v8 = v7;
    ObjectType = swift_getObjectType();
    v10 = objc_msgSend(v8, sel_isOn);

    (*(void (**)(id, uint64_t, uint64_t))(v6 + 16))(v10, ObjectType, v6);
    v11 = v5;
LABEL_5:

    return;
  }
  __break(1u);
}

- (_TtC18HealthExperienceUI24SwitchCellViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC18HealthExperienceUI24SwitchCellViewController *)SwitchCellViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18HealthExperienceUI24SwitchCellViewController)initWithCoder:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCellViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCellViewController____lazy_storage___switchView) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCellViewController____lazy_storage___cellAccessoryView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SwitchCellViewController();
  return -[CellWithAccessoryViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCellViewController_delegate);
  sub_1A9673FA0(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCellViewController____lazy_storage___switchView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCellViewController____lazy_storage___cellAccessoryView));
}

@end
