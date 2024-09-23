@implementation SFStepperContainer

- (SFStepperContainer)initWithCoder:(id)a3
{
  id v4;
  SFStepperContainer *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFStepperContainer_stepper) = 0;
  v4 = a3;

  result = (SFStepperContainer *)sub_18BAC18C4();
  __break(1u);
  return result;
}

- (SFStepperContainer)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  SFStepperContainer *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = sub_18BAC0598();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFStepperContainer_stepper) = 0;
  v13.receiver = self;
  v13.super_class = (Class)SFStepperContainer;
  v11 = -[SFStepperContainer initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  MEMORY[0x18D77E418]();
  sub_18BAC0580();
  MEMORY[0x18D77E424](v10);

  return v11;
}

- (SFStepper)stepper
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFStepperContainer_stepper);
  swift_beginAccess();
  return (SFStepper *)*v2;
}

- (void)setStepper:(id)a3
{
  SFStepperContainer *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18BABA020(a3);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  SFStepperContainer *v7;
  id v8;
  SFStepper *v9;
  SFStepper *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v7 = self;
  v8 = a4;
  v9 = -[SFStepperContainer stepper](v7, sel_stepper);
  if (v9)
  {
    v10 = v9;
    v15.receiver = v7;
    v15.super_class = (Class)SFStepperContainer;
    v11 = -[SFStepperContainer hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v8, x, y);
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, sel_isDescendantOfView_, v10);

      if ((v13 & 1) == 0)
      {

        v12 = 0;
      }
    }
    else
    {

    }
  }
  else
  {

    v12 = 0;
  }
  return v12;
}

- (void)hideStepperWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  SFStepperContainer *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  SFStepperContainer.hideStepper(completion:)((uint64_t)sub_18B92A118, v5);

  swift_release();
}

- (void).cxx_destruct
{

}

@end
