@implementation ExtensionHostingViewControllerRepresentable.Coordinator

- (void).cxx_destruct
{
  sub_20AE92148((uint64_t)self + OBJC_IVAR____TtCV12ExtensionKit43ExtensionHostingViewControllerRepresentable11Coordinator_parent, type metadata accessor for ExtensionHostingViewControllerRepresentable);
}

- (void)hostViewControllerDidActivate:(id)a3
{
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _TtCV12ExtensionKit43ExtensionHostingViewControllerRepresentable11Coordinator *v9;
  id v10;

  v5 = (char *)self + OBJC_IVAR____TtCV12ExtensionKit43ExtensionHostingViewControllerRepresentable11Coordinator_parent;
  v6 = *(_QWORD *)&v5[*(int *)(type metadata accessor for ExtensionHostingViewControllerRepresentable(0) + 28)];
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = a3;
  v8 = a3;
  v9 = self;

  sub_20AE9D4D8();
  sub_20AE8D9E0();
  v10 = (id)sub_20AE9D508();
  sub_20AE9D0F4();

}

- (_TtCV12ExtensionKit43ExtensionHostingViewControllerRepresentable11Coordinator)init
{
  _TtCV12ExtensionKit43ExtensionHostingViewControllerRepresentable11Coordinator *result;

  result = (_TtCV12ExtensionKit43ExtensionHostingViewControllerRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
