@implementation FAFamilySettingsViewControllerV2

- (_TtP14FamilyCircleUI40FAFamilySettingsViewControllerV2Delegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_delegate;
  swift_beginAccess();
  return (_TtP14FamilyCircleUI40FAFamilySettingsViewControllerV2Delegate_ *)(id)MEMORY[0x212BB98BC](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (UIViewController)_presenter
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2__presenter);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)set_presenter:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2__presenter);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2)initWithAppleAccount:(id)a3 grandSlamSigner:(id)a4 familyCircle:(id)a5 pictureStore:(id)a6 accountManager:(id)a7 peopleDiscoveryService:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  swift_getObjectType();
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  swift_unknownObjectRetain();
  return (_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *)sub_20DE92558(v15, v16, v17, v18, v19, (uint64_t)a8, (char *)self);
}

- (_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_20DE93010();
}

- (UINavigationItem)navigationItem
{
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v2;
  id v3;

  v2 = self;
  v3 = sub_20DE891DC();

  return (UINavigationItem *)v3;
}

- (void)viewDidLoad
{
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v2;

  v2 = self;
  sub_20DE89300();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FAFamilySettingsViewControllerV2();
  v4 = v8.receiver;
  -[FAFamilySettingsViewControllerV2 viewWillAppear:](&v8, sel_viewWillAppear_, v3);
  sub_20DE8BD48();
  v5 = (void *)sub_20E07D5A4();
  objc_msgSend(v4, sel_setTitle_, v5, v8.receiver, v8.super_class);

  v6 = objc_msgSend(v4, sel_navigationItem);
  v7 = (void *)sub_20E07D5A4();
  objc_msgSend(v6, sel_setTitle_, v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v4;

  v4 = self;
  sub_20DE8AB30(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v4;

  v4 = self;
  sub_20DE8BA60(a3);

}

- (void)dealloc
{
  void *v3;
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_currentStateController);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_cancel);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FAFamilySettingsViewControllerV2();
  -[FAFamilySettingsViewControllerV2 dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_appleAccount));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_grandSlamSigner));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_pictureStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_accountManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_activityIndicatorViewForAdd));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_locationViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_familySettingsHelper));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_addMemberButton));
  sub_20DE93BB8((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_currentStateController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_appleCashHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_appleCardFamilySettingsViewModel));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_circleStore);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2__presenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_disclosureViewController));
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v7;
  id v8;

  v8 = a3;
  v7 = self;
  sub_20DE8CA74((uint64_t)a3, a4);

}

- (_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *result;

  v4 = a4;
  result = (_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didSelectSubscriptionWithURL:(NSURL *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSURL *v15;
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2549F6A50;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2549F6A58;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_20E032A2C((uint64_t)v9, (uint64_t)&unk_2549F6A60, (uint64_t)v14);
  swift_release();
}

- (void)didSelectSubscriptionWithURLMemberDetails:(NSURL *)a3 familyMemberDSID:(NSString *)a4 serviceName:(int64_t)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSURL *v19;
  NSString *v20;
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2549F6A30;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2549F6A38;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = self;
  sub_20E032A2C((uint64_t)v13, (uint64_t)&unk_2549F6A40, (uint64_t)v18);
  swift_release();
}

- (void)stopFamilySharing
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_20E07D838();
  v7 = self;
  v8 = sub_20E07D82C();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  sub_20DE89F9C((uint64_t)v5, (uint64_t)&unk_2549F6A20, (uint64_t)v9);

  swift_release();
}

- (void)addFamilyMemberButtonWasTapped
{
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v2;

  v2 = self;
  FAFamilySettingsViewControllerV2.addFamilyMemberButtonWasTapped()();

}

- (void)loadMemberDetailsWithMember:(FAFamilyMember *)a3 navigationController:(UINavigationController *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  FAFamilyMember *v17;
  UINavigationController *v18;
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2549F6A08;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2549F6A10;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_20E032A2C((uint64_t)v11, (uint64_t)&unk_2549F7C60, (uint64_t)v16);
  swift_release();
}

- (void)didTapAddRemoteGuardianFor:(id)a3
{
  id v4;
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v5;

  v4 = a3;
  v5 = self;
  _s14FamilyCircleUI32FAFamilySettingsViewControllerV2C23didTapAddRemoteGuardian3forySo0D6MemberC_tF_0();

}

- (void)amsHookWasCalled
{
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v2;

  v2 = self;
  sub_20DE91A78();

}

- (void)handleDisclosureDismiss
{
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v2;

  v2 = self;
  sub_20DE91C48();

}

@end
