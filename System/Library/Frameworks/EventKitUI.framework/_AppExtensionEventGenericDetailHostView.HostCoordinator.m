@implementation _AppExtensionEventGenericDetailHostView.HostCoordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4;
  _TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1AF9C36E4(v4);

}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  _QWORD *v6;
  uint64_t (*v7)(void);
  id v8;
  _TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator *v9;
  void *v10;
  id v11;

  v6 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x88);
  v8 = a3;
  v9 = self;
  v11 = a4;
  v10 = (void *)v7();
  objc_msgSend(v10, sel_invalidate);

  (*(void (**)(_QWORD))((*v6 & (uint64_t)v9->super.isa) + 0x90))(0);
}

- (void)requestPresentViewWithName:(id)a3 viewID:(id)a4 presentationStyle:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator *v13;

  v7 = sub_1AF9F7BF0();
  v9 = v8;
  v10 = sub_1AF9F7BF0();
  v12 = v11;
  v13 = self;
  sub_1AF9C3E98(v7, v9, v10, v12, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)requestDismissViewWithName:(id)a3 presentationStyle:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator *v9;

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
  sub_1AF9C4198(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)didChangeNavigationBarButtonsWithLeftBarButtonIDs:(id)a3 rightBarButtonIDs:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  _TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator *v7;

  v4 = (uint64_t)a4;
  if (!a3)
  {
    v6 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = sub_1AF9F7C2C();
  if (v4)
LABEL_3:
    v4 = sub_1AF9F7C2C();
LABEL_4:
  v7 = self;
  sub_1AF9C4460(v6, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)didChangeBottomStatusButtonsWithBottomStatusButtonActions:(id)a3
{
  uint64_t v4;
  _TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator *v5;

  if (a3)
  {
    sub_1AF9C6B78(0, &qword_1EEE6BA60);
    v4 = sub_1AF9F7C2C();
  }
  else
  {
    v4 = 0;
  }
  v5 = self;
  sub_1AF9C4744(v4);

  swift_bridgeObjectRelease();
}

- (_TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator)init
{
  _TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator *result;

  result = (_TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                              + 8];
  v4 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                              + 24];
  v5 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                              + 40];
  v6 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                              + 56];
  swift_release();
  sub_1AF9C09DC(v3);
  sub_1AF9C09DC(v4);
  sub_1AF9C09DC(v5);
  sub_1AF9C09DC(v6);
  sub_1AF9C6BF4((uint64_t)self + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_identity, &qword_1EEE6B878);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_conn));
}

@end
