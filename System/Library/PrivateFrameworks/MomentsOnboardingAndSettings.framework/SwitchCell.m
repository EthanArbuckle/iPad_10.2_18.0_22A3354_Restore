@implementation SwitchCell

- (_TtC28MomentsOnboardingAndSettings10SwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  _TtC28MomentsOnboardingAndSettings10SwitchCell *v10;
  objc_super v12;

  if (a4)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange);
    *v7 = 0;
    v7[1] = 0;
    v8 = (void *)MEMORY[0x2426A69DC](v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange);
    *v9 = 0;
    v9[1] = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for SwitchCell();
  v10 = -[SwitchCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, v8);

  return v10;
}

- (_TtC28MomentsOnboardingAndSettings10SwitchCell)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange);
  v6 = (objc_class *)type metadata accessor for SwitchCell();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[SwitchCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.isa
                                                                                       + OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange));
}

@end
