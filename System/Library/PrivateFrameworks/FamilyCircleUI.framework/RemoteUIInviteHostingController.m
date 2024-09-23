@implementation RemoteUIInviteHostingController

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  _TtC14FamilyCircleUI31RemoteUIInviteHostingController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v3 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for RemoteUIInviteHostingController();
  v14.receiver = self;
  v14.super_class = v8;
  v9 = self;
  -[RemoteUIInviteHostingController viewDidDisappear:](&v14, sel_viewDidDisappear_, v3);
  v10 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_20E07D838();
  v11 = sub_20E07D82C();
  v12 = swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v13;
  sub_20DE89F9C((uint64_t)v7, (uint64_t)&unk_2549FE188, v12);

  swift_release();
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  _TtC14FamilyCircleUI31RemoteUIInviteHostingController *v9;
  uint64_t v10;
  _TtC14FamilyCircleUI31RemoteUIInviteHostingController *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  objc_super v15;

  v3 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for RemoteUIInviteHostingController();
  v15.receiver = self;
  v15.super_class = v8;
  v9 = self;
  -[HelpfulRemoteUiHostingVC viewDidAppear:](&v15, sel_viewDidAppear_, v3);
  v10 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_20E07D838();
  v11 = v9;
  v12 = sub_20E07D82C();
  v13 = (_QWORD *)swift_allocObject();
  v14 = MEMORY[0x24BEE6930];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v11;
  sub_20DE89F9C((uint64_t)v7, (uint64_t)&unk_2549FE178, (uint64_t)v13);

  swift_release();
}

- (_TtC14FamilyCircleUI31RemoteUIInviteHostingController)initWithNibName:(id)a3 bundle:(id)a4
{
  _QWORD *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  id v10;
  _TtC14FamilyCircleUI31RemoteUIInviteHostingController *v11;
  objc_super v13;

  if (a3)
  {
    sub_20E07D5D4();
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC14FamilyCircleUI31RemoteUIInviteHostingController_inviteCode);
    *v6 = 0;
    v6[1] = 0xE000000000000000;
    v7 = a4;
    v8 = (void *)sub_20E07D5A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC14FamilyCircleUI31RemoteUIInviteHostingController_inviteCode);
    *v9 = 0;
    v9[1] = 0xE000000000000000;
    v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for RemoteUIInviteHostingController();
  v11 = -[HelpfulRemoteUiHostingVC initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, v8, a4);

  return v11;
}

- (_TtC14FamilyCircleUI31RemoteUIInviteHostingController)initWithCoder:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC14FamilyCircleUI31RemoteUIInviteHostingController_inviteCode);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RemoteUIInviteHostingController();
  return -[HelpfulRemoteUiHostingVC initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
