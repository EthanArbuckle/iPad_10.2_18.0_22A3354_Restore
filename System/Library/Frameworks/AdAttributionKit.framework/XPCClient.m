@implementation XPCClient

- (void)handleMessages:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC20AttributionKitCommon9XPCClient *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_232EB9EEC();
  v7 = v6;

  sub_232EB6E34();
  sub_232EA2EE8(v5, v7);

}

- (_TtC20AttributionKitCommon9XPCClient)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_232EB9F04();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[XPCClient init](&v5, sel_init);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC20AttributionKitCommon9XPCClient_id;
  v3 = sub_232EB9F10();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
