@implementation HeartbeatEventServiceURLSessionDelegate

- (_TtC12AppAnalyticsP33_883BEF9FB9BC10A2D6AB6388C0003C3E39HeartbeatEventServiceURLSessionDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[HeartbeatEventServiceURLSessionDelegate init](&v3, sel_init);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  _TtC12AppAnalyticsP33_883BEF9FB9BC10A2D6AB6388C0003C3E39HeartbeatEventServiceURLSessionDelegate *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1A5F41270(v9, a5);

}

@end
