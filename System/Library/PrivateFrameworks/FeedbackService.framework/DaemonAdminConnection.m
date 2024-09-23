@implementation DaemonAdminConnection

- (_TtC15FeedbackService21DaemonAdminConnection)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15FeedbackService21DaemonAdminConnection____lazy_storage___connectionForAdmin) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DaemonAdminConnection();
  return -[DaemonAdminConnection init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FeedbackService21DaemonAdminConnection____lazy_storage___connectionForAdmin));
}

@end
