@implementation APSPushConnection

- (_TtC10ChronoCore17APSPushConnection)init
{
  _TtC10ChronoCore17APSPushConnection *result;

  result = (_TtC10ChronoCore17APSPushConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1D272E144((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17APSPushConnection_delegate);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  _TtC10ChronoCore17APSPushConnection *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC10ChronoCore17APSPushConnection *v13;

  if (a4)
  {
    v6 = a3;
    v7 = self;
    v8 = a4;
    v9 = sub_1D29C1668();
    v11 = v10;

  }
  else
  {
    v12 = a3;
    v13 = self;
    v9 = 0;
    v11 = 0xF000000000000000;
  }
  sub_1D28EB85C(v9, v11);
  sub_1D273BEAC(v9, v11);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  _TtC10ChronoCore17APSPushConnection *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D28EBA30(a4);

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5
{
  id v8;
  id v9;
  _TtC10ChronoCore17APSPushConnection *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  _TtC10ChronoCore17APSPushConnection *v17;

  if (a4)
  {
    v8 = a3;
    v9 = a5;
    v10 = self;
    v11 = a4;
    v12 = sub_1D29C1668();
    v14 = v13;

  }
  else
  {
    v15 = a3;
    v16 = a5;
    v17 = self;
    v12 = 0;
    v14 = 0xF000000000000000;
  }
  sub_1D28EBD54(v12, v14, a5);
  sub_1D273BEAC(v12, v14);

}

@end
