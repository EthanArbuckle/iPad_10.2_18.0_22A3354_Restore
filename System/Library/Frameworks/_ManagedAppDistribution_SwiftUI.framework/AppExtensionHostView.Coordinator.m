@implementation AppExtensionHostView.Coordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  _TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256248B68);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2355C8FDC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_2355C8FB8();
  v8 = a3;
  v9 = self;
  v10 = v8;
  v11 = sub_2355C8FAC();
  v12 = (_QWORD *)swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v9;
  v12[5] = v10;
  sub_23558BAE0((uint64_t)v6, (uint64_t)&unk_256248B78, (uint64_t)v12);
  swift_release();

}

- (_TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator)init
{
  _TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator *result;

  result = (_TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23558DF78((uint64_t)self + OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator_parent, type metadata accessor for AppExtensionHostView);
  sub_23558E470((uint64_t)self + OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator_identity, (uint64_t *)&unk_256248BC0);
}

@end
