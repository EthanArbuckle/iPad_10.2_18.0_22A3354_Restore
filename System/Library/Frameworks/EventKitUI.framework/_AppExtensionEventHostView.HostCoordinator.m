@implementation _AppExtensionEventHostView.HostCoordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4;
  _TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1AF9D86B0(v4);

}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  _QWORD *v6;
  uint64_t (*v7)(void);
  id v8;
  _TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator *v9;
  void *v10;
  id v11;

  v6 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x90);
  v8 = a3;
  v9 = self;
  v11 = a4;
  v10 = (void *)v7();
  objc_msgSend(v10, sel_invalidate);

  (*(void (**)(_QWORD))((*v6 & (uint64_t)v9->super.isa) + 0x98))(0);
}

- (void)requestPresentViewWithName:(id)a3 viewID:(id)a4 presentationStyle:(int64_t)a5 sourceRect:(id)a6 preferredContentSize:(id)a7 oopContentBackgroundColor:(id)a8
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator *v21;

  v12 = sub_1AF9F7BF0();
  v14 = v13;
  v15 = (void *)sub_1AF9F7BF0();
  v17 = v16;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = self;
  sub_1AF9D9BA4(v12, v14, v15, v17, a5, v18, v19, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)requestDismissViewWithName:(id)a3 presentationStyle:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator *v9;

  if (a3)
  {
    v6 = sub_1AF9F7BF0();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = self;
  sub_1AF9D9F28(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)didCompleteWithAction:(int64_t)a3
{
  _TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator *v4;

  v4 = self;
  sub_1AF9DA1F0(a3);

}

- (_TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator)init
{
  _TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator *result;

  result = (_TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 8];
  v4 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 24];
  v5 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 40];
  swift_release();
  sub_1AF9C09DC(v3);
  sub_1AF9C09DC(v4);
  sub_1AF9C09DC(v5);
  sub_1AF9C6BF4((uint64_t)self + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_identity, &qword_1EEE6B878);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_conn));
  swift_release();
}

@end
