@implementation _AppExtensionHostView.HostCoordinator

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  return 1;
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _TtCV10ContactsUI21_AppExtensionHostView15HostCoordinator *v13;

  v6 = qword_1EDF98218;
  v7 = a3;
  v13 = self;
  v8 = a4;
  if (v6 != -1)
    swift_once();
  v9 = sub_18AF4E900();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EDF99420);
  v10 = sub_18AF4E8E8();
  v11 = sub_18AF4FF08();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_18AC56000, v10, v11, "Will be deactivating the host view...", v12, 2u);
    MEMORY[0x18D7778C0](v12, -1, -1);
  }

}

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4;
  _TtCV10ContactsUI21_AppExtensionHostView15HostCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_18ACF0D3C(v4);

}

- (_TtCV10ContactsUI21_AppExtensionHostView15HostCoordinator)init
{
  _TtCV10ContactsUI21_AppExtensionHostView15HostCoordinator *result;

  result = (_TtCV10ContactsUI21_AppExtensionHostView15HostCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18ACEF088((uint64_t)self + OBJC_IVAR____TtCV10ContactsUI21_AppExtensionHostView15HostCoordinator_parent, type metadata accessor for _AppExtensionHostView);
  sub_18ACCDE68((uint64_t)self + OBJC_IVAR____TtCV10ContactsUI21_AppExtensionHostView15HostCoordinator_identity, (uint64_t *)&unk_1EDF996C8);
  swift_unknownObjectRelease();
}

@end
