@implementation ProductLookupEvent

- (NSString)productID
{
  return (NSString *)sub_1000291A8((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_100029178);
}

- (void)setProductID:(id)a3
{
  sub_100029204(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_100029190);
}

- (NSString)extensionName
{
  return (NSString *)sub_1000291A8((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1000291EC);
}

- (void)setExtensionName:(id)a3
{
  sub_100029204(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_100029274);
}

- (NSString)itemKind
{
  return (NSString *)sub_1000291A8((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_10002928C);
}

- (void)setItemKind:(id)a3
{
  sub_100029204(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1000292D8);
}

- (void)configureWithItem:(id)a3 compatibleExtension:(id)a4
{
  id v6;
  id v7;
  _TtC17StoreKitUIService18ProductLookupEvent *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000292FC(v6, a4);

}

+ (NSString)name
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_100029464();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (BOOL)canCreatePayload
{
  return sub_1000294A4();
}

- (_TtC17StoreKitUIService18ProductLookupEvent)init
{
  return (_TtC17StoreKitUIService18ProductLookupEvent *)sub_1000294C0();
}

- (void).cxx_destruct
{
  sub_100029680((uint64_t)self + OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_productID);
  sub_100029680((uint64_t)self + OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_extensionName);
  swift_bridgeObjectRelease(*(_QWORD *)&self->productID[OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_itemKind]);
}

@end
