@implementation _AppExtensionCalendarChooserHostView.HostCoordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4;
  _TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1AF9F2EA4(v4);

}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  _QWORD *v6;
  uint64_t (*v7)(void);
  id v8;
  _TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator *v9;
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

- (void)requestPresentViewWithName:(id)a3 viewID:(id)a4 presentationStyle:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator *v13;

  v7 = sub_1AF9F7BF0();
  v9 = v8;
  v10 = sub_1AF9F7BF0();
  v12 = v11;
  v13 = self;
  sub_1AF9F3898(v7, v9, v10, v12, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)calendarSelectionChanged:(id)a3 allSelected:(BOOL)a4
{
  uint64_t v6;
  _TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator *v7;

  sub_1AF9C6B78(0, &qword_1EEE6C610);
  v6 = sub_1AF9F7C2C();
  v7 = self;
  sub_1AF9F3B98(v6, a4);

  swift_bridgeObjectRelease();
}

- (_TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator)init
{
  _TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator *result;

  result = (_TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent
                              + 8];
  v4 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent
                              + 24];
  swift_release();
  sub_1AF9C09DC(v3);
  sub_1AF9C09DC(v4);
  sub_1AF9C6BF4((uint64_t)self + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_identity, &qword_1EEE6B878);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_conn));
  swift_release();
}

@end
