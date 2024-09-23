@implementation VideoMessagingServiceDelegate

- (_TtC20FaceTimeMessageStore29VideoMessagingServiceDelegate)init
{
  return (_TtC20FaceTimeMessageStore29VideoMessagingServiceDelegate *)VideoMessagingServiceDelegate.init()();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC20FaceTimeMessageStore29VideoMessagingServiceDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_23B3809DC();

  return v9 & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore29VideoMessagingServiceDelegate_listener));
  swift_unknownObjectRelease();
}

@end
