@implementation ArcadeAIDAAccountManagerDelegate

- (_TtC19AppStoreKitInternalP33_8D1DC5A59BCBA4F7D36E5B1D7235875932ArcadeAIDAAccountManagerDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArcadeAIDAAccountManagerDelegate();
  return -[ArcadeAIDAAccountManagerDelegate init](&v3, sel_init);
}

- (id)accountsForAccountManager:(id)a3
{
  id v4;
  _TtC19AppStoreKitInternalP33_8D1DC5A59BCBA4F7D36E5B1D7235875932ArcadeAIDAAccountManagerDelegate *v5;
  id v6;
  id v7;
  uint64_t inited;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_accountStore);
  v7 = objc_msgSend(v6, sel_aa_primaryAppleAccount);

  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1F017ABD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1D8931D70;
    v9 = (void *)*MEMORY[0x1E0CFCF18];
    *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CFCF18];
    *(_QWORD *)(inited + 40) = v7;
    v10 = v9;
    v11 = inited;
  }
  else
  {
    v11 = MEMORY[0x1E0DEE9D8];
  }
  sub_1D8573590(v11);

  type metadata accessor for AIDAServiceType(0);
  sub_1D832F5B8(0, &qword_1EDA32D30);
  sub_1D86958A0();
  v12 = (void *)sub_1D892AC7C();
  swift_bridgeObjectRelease();
  return v12;
}

@end
