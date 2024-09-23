@implementation _AppExtensionEventEditHostView.HostCoordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4;
  _TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1AF9E4FA4(v4);

}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  _QWORD *v6;
  uint64_t (*v7)(void);
  id v8;
  _TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator *v9;
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
  _TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator *v13;

  v7 = sub_1AF9F7BF0();
  v9 = v8;
  v10 = sub_1AF9F7BF0();
  v12 = v11;
  v13 = self;
  sub_1AF9E61F8(v7, v9, v10, v12, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)didCompleteWithAction:(int64_t)a3 oldToNewObjectIDMap:(id)a4 waitUntilTimestamp:(id)a5 serializedDictionary:(id)a6 objectIDToChangeSetDictionaryMap:(id)a7 objectIDToPersistentDictionaryMap:(id)a8 eventConstraints:(id)a9
{
  uint64_t v13;
  id v16;
  id v17;
  _TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v13 = (uint64_t)a4;
  if (a4)
  {
    sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
    sub_1AF9DAC9C();
    v13 = sub_1AF9F7BC0();
  }
  if (a6)
    a6 = (id)sub_1AF9F7BC0();
  if (a7)
  {
    sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
    sub_1AF9DAC9C();
    a7 = (id)sub_1AF9F7BC0();
  }
  if (a8)
  {
    sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
    sub_1AF9DAC9C();
    a8 = (id)sub_1AF9F7BC0();
  }
  v16 = a5;
  v17 = a9;
  v18 = self;
  if (v17)
  {
    v19 = sub_1AF9F78B4();
    v21 = v20;

  }
  else
  {
    v19 = 0;
    v21 = 0xF000000000000000;
  }
  sub_1AF9E64F8(a3, v13, v16, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, v19, v21);
  sub_1AF9E018C(v19, v21);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator)init
{
  _TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator *result;

  result = (_TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent
                              + 8];
  v4 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent
                              + 24];
  swift_release();
  sub_1AF9C09DC(v3);
  sub_1AF9C09DC(v4);
  sub_1AF9C6BF4((uint64_t)self + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_identity, &qword_1EEE6B878);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_conn));
  swift_release();
}

@end
