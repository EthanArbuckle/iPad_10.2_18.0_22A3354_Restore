@implementation ExtensionManager

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  _TtC9ChronoKit16ExtensionManager *v6;
  objc_super v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  sub_1D2538510((uint64_t)self + OBJC_IVAR____TtC9ChronoKit16ExtensionManager_nsExtensionDiscoverer, (uint64_t)v8);
  v3 = v9;
  v4 = v10;
  __swift_project_boxed_opaque_existential_0(v8, v9);
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 32);
  v6 = self;
  v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for ExtensionManager();
  -[ExtensionManager dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ChronoKit16ExtensionManager_nsExtensionDiscoverer);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ChronoKit16ExtensionManager_remoteWidgetExtensionProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ChronoKit16ExtensionManager_applicationWorkspace);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ChronoKit16ExtensionManager_extensionFactory);
}

- (void)pluginsDidUninstall:(id)a3
{
  uint64_t v4;
  _TtC9ChronoKit16ExtensionManager *v5;

  if (a3)
    v4 = sub_1D26CDAF4();
  else
    v4 = 0;
  v5 = self;
  sub_1D25D8008(v4);

  swift_bridgeObjectRelease();
}

- (_TtC9ChronoKit16ExtensionManager)init
{
  _TtC9ChronoKit16ExtensionManager *result;

  result = (_TtC9ChronoKit16ExtensionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
