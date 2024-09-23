@implementation XPCClient

- (_TtC22ManagedAppDistribution9XPCClient)init
{
  return (_TtC22ManagedAppDistribution9XPCClient *)sub_233B43564();
}

- (void)handleMessages:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC22ManagedAppDistribution9XPCClient *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_233B57E10();
  v7 = v6;

  XPCClient.handleMessages(_:)(v5, v7);
  sub_233B13CD8(v5, v7);

}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC22ManagedAppDistribution9XPCClient_id;
  v3 = sub_233B57E40();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
}

@end
