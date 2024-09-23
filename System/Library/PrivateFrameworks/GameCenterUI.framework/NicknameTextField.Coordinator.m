@implementation NicknameTextField.Coordinator

- (void)dealloc
{
  _TtCV12GameCenterUIP33_71E88C93E9376CB5FC37AECD01F72ACD17NicknameTextField11Coordinator *v2;

  v2 = self;
  sub_1AB6889B0();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12GameCenterUIP33_71E88C93E9376CB5FC37AECD01F72ACD17NicknameTextField11Coordinator_nicknameController));
  swift_release();
}

- (void)keyboardWillShow:(id)a3
{
  sub_1AB688CC4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))j__CGSizeMake);
}

- (void)keyboardWillHide:(id)a3
{
  sub_1AB688CC4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))CGSizeMake);
}

- (BOOL)nicknameShouldBeginEditing
{
  _TtCV12GameCenterUIP33_71E88C93E9376CB5FC37AECD01F72ACD17NicknameTextField11Coordinator *v2;
  char v3;

  v2 = self;
  v3 = sub_1AB688D54();

  return v3 & 1;
}

- (void)nicknameDidBecomeFirstResponder
{
  _TtCV12GameCenterUIP33_71E88C93E9376CB5FC37AECD01F72ACD17NicknameTextField11Coordinator *v2;

  v2 = self;
  sub_1AB688E0C();

}

- (void)nicknameDidResignFirstResponder
{
  _TtCV12GameCenterUIP33_71E88C93E9376CB5FC37AECD01F72ACD17NicknameTextField11Coordinator *v2;

  v2 = self;
  sub_1AB688EC0();

}

- (void)nicknameWillbeginUpdating
{
  _TtCV12GameCenterUIP33_71E88C93E9376CB5FC37AECD01F72ACD17NicknameTextField11Coordinator *v2;

  v2 = self;
  sub_1AB689138();

}

- (void)nicknameUpdateAvatarImage:(id)a3
{
  _TtCV12GameCenterUIP33_3C5A4F43D1BCC319589942A954EC7ED117NicknameTextField11Coordinator *v4;

  sub_1AB7DAF90();
  v4 = self;
  sub_1AB577A88();
  swift_bridgeObjectRelease();

}

- (void)nicknameUpdateRequestCompletedWithStatus:(id)a3 error:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtCV12GameCenterUIP33_71E88C93E9376CB5FC37AECD01F72ACD17NicknameTextField11Coordinator *v10;

  if (a3)
  {
    v6 = sub_1AB7DAF90();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a4;
  v10 = self;
  sub_1AB6891CC(v6, v8, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)nicknameTextDidChangeWithMessage:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtCV12GameCenterUIP33_71E88C93E9376CB5FC37AECD01F72ACD17NicknameTextField11Coordinator *v7;

  if (a3)
  {
    v4 = sub_1AB7DAF90();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1AB689834(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtCV12GameCenterUIP33_3C5A4F43D1BCC319589942A954EC7ED117NicknameTextField11Coordinator)init
{
  sub_1AB554BE8();
}

- (_TtCV12GameCenterUIP33_71E88C93E9376CB5FC37AECD01F72ACD17NicknameTextField11Coordinator)init
{
  sub_1AB554BE8();
}

@end
