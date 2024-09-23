@implementation OrderNavigationModel

- (_TtC12FinanceKitUI20OrderNavigationModel)init
{
  return (_TtC12FinanceKitUI20OrderNavigationModel *)sub_233948A74();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC12FinanceKitUI20OrderNavigationModel__path;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560E1E90);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  id v18;
  _TtC12FinanceKitUI20OrderNavigationModel *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[32];

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560E1F00);
  MEMORY[0x24BDAC7A8](v12);
  v14 = &v26[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v15);
  v17 = &v26[-v16];
  v18 = a3;
  swift_unknownObjectRetain();
  v19 = self;
  v20 = a5;
  v21 = a7;
  sub_2339D489C();
  swift_unknownObjectRelease();
  if (v20)
  {
    sub_2339D2514();

    v22 = sub_2339D2520();
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v17, 0, 1, v22);
  }
  else
  {
    v23 = sub_2339D2520();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v17, 1, 1, v23);
  }
  if (v21)
  {
    sub_2339D2514();

    v24 = sub_2339D2520();
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v14, 0, 1, v24);
  }
  else
  {
    v25 = sub_2339D2520();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v14, 1, 1, v25);
  }
  sub_23394AAD8((uint64_t)v26, (uint64_t)v17, a6);

  sub_23371BA60((uint64_t)v14, &qword_2560E1F00);
  sub_23371BA60((uint64_t)v17, &qword_2560E1F00);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
}

@end
