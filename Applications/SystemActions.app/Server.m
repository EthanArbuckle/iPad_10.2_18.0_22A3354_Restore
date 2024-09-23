@implementation Server

- (_TtC13SystemActions6Server)init
{
  return (_TtC13SystemActions6Server *)sub_100001C24();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SystemActions6Server_runners));
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  _TtC13SystemActions6Server *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_100002038((uint64_t)v10, v9);

  swift_unknownObjectRelease(a5);
}

@end
