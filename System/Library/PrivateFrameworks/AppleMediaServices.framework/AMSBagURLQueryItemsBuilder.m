@implementation AMSBagURLQueryItemsBuilder

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_2();
  swift_bridgeObjectRelease();
}

- (AMSBagURLQueryItemsBuilder)initWithClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5
{
  sub_18CEC181C();
  sub_18CEC181C();
  return (AMSBagURLQueryItemsBuilder *)BagURLQueryItemsBuilder.init(clientInfo:profile:profileVersion:)(a3);
}

- (AMSBagURLQueryItemsBuilder)initWithClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5 operatingSystem:(id)a6 operatingSystemVersion:(id)a7 deviceClass:(id)a8 buildVariant:(id)a9
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v28;
  uint64_t v29;

  v9 = (uint64_t)a9;
  v10 = sub_18CEC181C();
  v28 = v11;
  v29 = v10;
  v12 = sub_18CEC181C();
  v14 = v13;
  v15 = sub_18CEC181C();
  v17 = v16;
  v18 = sub_18CEC181C();
  v20 = v19;
  v21 = sub_18CEC181C();
  v23 = v22;
  if (a9)
  {
    v9 = sub_18CEC181C();
    v25 = v24;
  }
  else
  {
    v25 = 0;
  }
  return (AMSBagURLQueryItemsBuilder *)BagURLQueryItemsBuilder.init(clientInfo:profile:profileVersion:operatingSystem:operatingSystemVersion:deviceClass:buildVariant:)((uint64_t)a3, v29, v28, v12, v14, v15, v17, v18, v20, v21, v23, v9, v25);
}

- (id)queryItemsWithCookies:(id)a3 storefront:(id)a4
{
  id *v6;
  uint64_t v7;
  void *v8;
  AMSBagURLQueryItemsBuilder *v9;
  void *v10;

  sub_18C88B3D8();
  v6 = (id *)sub_18CEC19A8();
  if (a4)
  {
    v7 = sub_18CEC181C();
    a4 = v8;
  }
  else
  {
    v7 = 0;
  }
  v9 = self;
  BagURLQueryItemsBuilder.queryItems(withCookies:storefront:)(v6, v7, (unint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18CEC1144();
  v10 = (void *)sub_18CEC199C();
  swift_bridgeObjectRelease();
  return v10;
}

+ (id)storefrontFromQueryItems:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  sub_18CEC1144();
  v3 = sub_18CEC19A8();
  static BagURLQueryItemsBuilder.storefront(fromQueryItems:)(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    v6 = (void *)sub_18CEC17F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (AMSBagURLQueryItemsBuilder)init
{
  BagURLQueryItemsBuilder.init()();
}

@end
