@implementation OrderDetailsViewControllerProvider

+ (id)makeViewControllerWithOrderTypeIdentifier:(id)a3 orderIdentifier:(id)a4 fulfillmentIdentifier:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  id v18;

  v6 = sub_2339D42E4();
  v8 = v7;
  v9 = sub_2339D42E4();
  v11 = v10;
  if (a5)
  {
    v12 = sub_2339D42E4();
    a5 = v13;
  }
  else
  {
    v12 = 0;
  }
  v14 = (char *)objc_allocWithZone((Class)type metadata accessor for OrderDetailsViewController());
  v15 = (uint64_t *)&v14[qword_2560DCD20];
  *v15 = v6;
  v15[1] = v8;
  v16 = (uint64_t *)&v14[qword_2560DCD28];
  *v16 = v9;
  v16[1] = v11;
  v17 = (uint64_t *)&v14[qword_2560DCD30];
  *v17 = v12;
  v17[1] = (uint64_t)a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18 = sub_23393A01C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v18;
}

- (_TtC12FinanceKitUI34OrderDetailsViewControllerProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OrderDetailsViewControllerProvider();
  return -[OrderDetailsViewControllerProvider init](&v3, sel_init);
}

@end
