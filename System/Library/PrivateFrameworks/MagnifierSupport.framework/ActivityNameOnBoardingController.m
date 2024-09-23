@implementation ActivityNameOnBoardingController

- (void)viewDidLoad
{
  _TtC16MagnifierSupport32ActivityNameOnBoardingController *v2;

  v2 = self;
  sub_2273DA884();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivityNameOnBoardingController();
  v4 = (char *)v5.receiver;
  -[OBBaseWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_activityNameTextField], sel_becomeFirstResponder, v5.receiver, v5.super_class);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  _TtC16MagnifierSupport32ActivityNameOnBoardingController *v5;

  v4 = a3;
  v5 = self;
  sub_2273DAD10(v4);

  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  id v6;
  _TtC16MagnifierSupport32ActivityNameOnBoardingController *v7;

  v6 = a3;
  v7 = self;
  sub_2273DB050(v6, a4);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  void *v7;
  id v8;
  _TtC16MagnifierSupport32ActivityNameOnBoardingController *v9;

  v7 = (void *)objc_opt_self();
  v8 = a3;
  v9 = self;
  objc_msgSend(v7, sel_cancelPreviousPerformRequestsWithTarget_selector_object_, v9, sel_activityNameFromTextFieldWithTextField_, v8);
  -[ActivityNameOnBoardingController performSelector:withObject:afterDelay:](v9, sel_performSelector_withObject_afterDelay_, sel_activityNameFromTextFieldWithTextField_, v8, 0.01);

  return 1;
}

- (void)activityNameFromTextFieldWithTextField:(id)a3
{
  id v4;
  _TtC16MagnifierSupport32ActivityNameOnBoardingController *v5;

  v4 = a3;
  v5 = self;
  sub_2273DB2AC(v4);

}

- (BOOL)textFieldShouldClear:(id)a3
{
  void *v4;
  id v5;
  _TtC16MagnifierSupport32ActivityNameOnBoardingController *v6;
  char *v7;
  uint64_t v8;
  uint64_t ObjectType;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_activityNameTakenLabel);
  v5 = a3;
  v6 = self;
  objc_msgSend(v4, sel_setHidden_, 1);
  v7 = (char *)v6 + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_createActivityDelegate;
  if (MEMORY[0x2276B3E34]((char *)v6 + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_createActivityDelegate))
  {
    v8 = *((_QWORD *)v7 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(ObjectType, v8);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport32ActivityNameOnBoardingController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = sub_22758E1E4();
  v11 = v10;
  if (!a4)
  {
    v13 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    v16 = 0;
    return (_TtC16MagnifierSupport32ActivityNameOnBoardingController *)sub_2273DBBF0(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)sub_22758E1E4();
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = sub_22758E1E4();
  v16 = v15;
  return (_TtC16MagnifierSupport32ActivityNameOnBoardingController *)sub_2273DBBF0(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC16MagnifierSupport32ActivityNameOnBoardingController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v9 = sub_22758E1E4();
  v11 = v10;
  if (a4)
  {
    a4 = (id)sub_22758E1E4();
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  v14 = a5;
  return (_TtC16MagnifierSupport32ActivityNameOnBoardingController *)sub_2273DBE44(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_activityNameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_activityNameTakenLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_button));
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_createActivityDelegate);
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_delegate);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC16MagnifierSupport32ActivityNameOnBoardingController *v5;

  v4 = a3;
  v5 = self;
  sub_2273DC160();

}

@end
