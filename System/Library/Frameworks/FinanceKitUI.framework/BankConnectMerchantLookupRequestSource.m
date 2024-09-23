@implementation BankConnectMerchantLookupRequestSource

- (id)mapsMerchantLookupRequest
{
  _TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_23375E468();

  return v3;
}

- (id)mapsURL
{
  return 0;
}

- (BOOL)isSettlement
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource *v14;
  int v15;
  BOOL v18;
  uint64_t v20;

  v3 = sub_2339D0498();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v20 - v8;
  v10 = sub_2339D081C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = self;
  sub_2339D13B0();
  sub_2339D0804();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  v15 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
  if (v15 == *MEMORY[0x24BDC9350] || v15 == *MEMORY[0x24BDC9360] || v15 == *MEMORY[0x24BDC9370])
  {
LABEL_12:
    v18 = 0;
    goto LABEL_13;
  }
  if (v15 != *MEMORY[0x24BDC9368])
  {
    if (v15 != *MEMORY[0x24BDC9378])
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    goto LABEL_12;
  }
  v18 = 1;
LABEL_13:
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);

  return v18;
}

- (BOOL)isRefund
{
  return 0;
}

- (BOOL)containsSensitiveData
{
  return 1;
}

- (id)identifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource *v11;
  void *v12;
  uint64_t v14;

  v3 = sub_2339D23DC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2339D081C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = self;
  sub_2339D13B0();
  sub_2339D07D4();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_2339D2394();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v12 = (void *)sub_2339D42C0();
  swift_bridgeObjectRelease();
  return v12;
}

- (int64_t)type
{
  return 0;
}

- (_TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource)init
{
  _TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource *result;

  result = (_TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource_input;
  v4 = sub_2339D13F8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource_piiProcessor);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource_deviceIdentityProvider);
  swift_release();
}

@end
