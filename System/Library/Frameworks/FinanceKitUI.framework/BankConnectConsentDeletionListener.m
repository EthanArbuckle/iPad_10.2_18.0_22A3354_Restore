@implementation BankConnectConsentDeletionListener

- (_TtC12FinanceKitUI34BankConnectConsentDeletionListener)init
{
  _TtC12FinanceKitUI34BankConnectConsentDeletionListener *result;

  result = (_TtC12FinanceKitUI34BankConnectConsentDeletionListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12FinanceKitUI34BankConnectConsentDeletionListener_fetchController));
  sub_23372F664(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12FinanceKitUI34BankConnectConsentDeletionListener_onDeletionOfLastConsent));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12FinanceKitUI34BankConnectConsentDeletionListener_context));
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
  _TtC12FinanceKitUI34BankConnectConsentDeletionListener *v19;
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
  sub_2338A5EDC((uint64_t)v26, (uint64_t)v17, a6);

  sub_2338A6220((uint64_t)v14);
  sub_2338A6220((uint64_t)v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
}

@end
