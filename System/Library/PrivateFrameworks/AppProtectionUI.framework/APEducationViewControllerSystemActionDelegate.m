@implementation APEducationViewControllerSystemActionDelegate

- (APEducationViewControllerSystemActionDelegateDismissalDelegate)delegate
{
  return (APEducationViewControllerSystemActionDelegateDismissalDelegate *)(id)MEMORY[0x23B7EFDEC]((char *)self + OBJC_IVAR___APEducationViewControllerSystemActionDelegate_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)educationViewController:(id)a3 requestAuthenticationWithCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  APEducationViewControllerSystemActionDelegate *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (void *)objc_opt_self();
  v9 = a3;
  v10 = self;
  v11 = objc_msgSend(v8, sel_sharedGuard);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_2362F545C;
  *(_QWORD *)(v12 + 24) = v7;
  v14[4] = sub_2362F53AC;
  v14[5] = v12;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_2362F9DA0;
  v14[3] = &block_descriptor_42;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_authenticateUnconditionallyWithCompletion_, v13);
  _Block_release(v13);

  swift_release();
}

- (void)educationViewController:(id)a3 requestLockOfApplication:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  APEducationViewControllerSystemActionDelegate *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = (void *)objc_opt_self();
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = objc_msgSend(v10, sel_sharedManager);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = sub_2362F545C;
  *(_QWORD *)(v15 + 24) = v9;
  v17[4] = sub_2362F5378;
  v17[5] = v15;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 1107296256;
  v17[2] = sub_2362F9DA0;
  v17[3] = &block_descriptor_26;
  v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_setSubject_isLocked_completion_, v12, 1, v16);
  _Block_release(v16);

  swift_release();
}

- (void)educationViewController:(id)a3 requestHideOfApplication:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  APEducationViewControllerSystemActionDelegate *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = (void *)objc_opt_self();
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = objc_msgSend(v10, sel_sharedManager);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = sub_2362F51A0;
  *(_QWORD *)(v15 + 24) = v9;
  v17[4] = sub_2362F51A8;
  v17[5] = v15;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 1107296256;
  v17[2] = sub_2362F9DA0;
  v17[3] = &block_descriptor_10;
  v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_setSubject_isHidden_completion_, v12, 1, v16);
  _Block_release(v16);

  swift_release();
}

- (void)educationViewControllerRequestsDismissal:(id)a3 withResult:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  APEducationViewControllerSystemActionDelegate *v9;
  id v10;
  _QWORD v11[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = self;
  *(_QWORD *)(v6 + 24) = a3;
  v11[4] = sub_2362F5180;
  v11[5] = v6;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_2362F5F24;
  v11[3] = &block_descriptor;
  v7 = _Block_copy(v11);
  v8 = a3;
  v9 = self;
  v10 = v8;
  swift_release();
  objc_msgSend(v10, sel_dismissViewControllerAnimated_completion_, 1, v7);
  _Block_release(v7);

}

- (APEducationViewControllerSystemActionDelegate)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)APEducationViewControllerSystemActionDelegate;
  return -[APEducationViewControllerSystemActionDelegate init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_2362F5438((uint64_t)self + OBJC_IVAR___APEducationViewControllerSystemActionDelegate_delegate);
}

@end
