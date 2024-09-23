@implementation BankConnectInstitutionMatcher

- (void)institutionForPaymentPass:(id)a3 withCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _TtC10FinanceKit29BankConnectInstitutionMatcher *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  _TtC10FinanceKit29BankConnectInstitutionMatcher *v21;
  uint64_t v22;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254247060);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = a3;
  v13 = self;
  v14 = objc_msgSend(v12, sel_primaryAccountIdentifier);
  v15 = sub_23361E150();
  v17 = v16;

  v18 = sub_23361E534();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v9, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = v12;
  v19[5] = sub_2331CA260;
  v19[6] = v11;
  v19[7] = v13;
  v19[8] = v15;
  v19[9] = v17;
  v20 = v12;
  v21 = v13;
  swift_retain();
  sub_2333B205C((uint64_t)v9, (uint64_t)&unk_25604E390, (uint64_t)v19);

  swift_release();
  swift_release();
}

- (_TtC10FinanceKit29BankConnectInstitutionMatcher)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectInstitutionMatcher();
  return -[BankConnectInstitutionMatcher init](&v3, sel_init);
}

@end
