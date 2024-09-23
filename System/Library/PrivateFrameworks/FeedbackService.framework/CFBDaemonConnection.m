@implementation CFBDaemonConnection

- (_TtC15FeedbackService19CFBDaemonConnection)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15FeedbackService19CFBDaemonConnection____lazy_storage___xpcConnection) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CFBDaemonConnection();
  return -[CFBDaemonConnection init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FeedbackService19CFBDaemonConnection____lazy_storage___xpcConnection));
}

@end
