@implementation SKPurchaseIntent

- (NSString)additionalBuyParams
{
  uint64_t v2;
  void *v3;

  SKPurchaseIntent.additionalBuyParams.getter();
  if (v2)
  {
    v3 = (void *)sub_1AC0F79A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setAdditionalBuyParams:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  SKPurchaseIntent *v7;

  if (a3)
  {
    v4 = sub_1AC0F79CC();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  SKPurchaseIntent.additionalBuyParams.setter(v4, v6);

}

- (SKPurchaseIntent)initWithBundleId:(id)a3 productIdentifier:(id)a4 appName:(id)a5 productName:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v8 = sub_1AC0F79CC();
  v10 = v9;
  v11 = sub_1AC0F79CC();
  v13 = v12;
  if (!a5)
  {
    v15 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v16 = 0;
    v18 = 0;
    return (SKPurchaseIntent *)sub_1AC046E50(v8, v10, v11, v13, (uint64_t)a5, v15, v16, v18);
  }
  a5 = (id)sub_1AC0F79CC();
  v15 = v14;
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v16 = sub_1AC0F79CC();
  v18 = v17;
  return (SKPurchaseIntent *)sub_1AC046E50(v8, v10, v11, v13, (uint64_t)a5, v15, v16, v18);
}

- (void)send:(id)a3
{
  void *v4;
  uint64_t v5;
  SKPurchaseIntent *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_1AC0845B0((uint64_t)&unk_1EEC65E28, v5);
}

- (SKPurchaseIntent)init
{
  SKPurchaseIntent.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_17();
  OUTLINED_FUNCTION_3_17();
  OUTLINED_FUNCTION_3_17();
  swift_bridgeObjectRelease();
}

@end
