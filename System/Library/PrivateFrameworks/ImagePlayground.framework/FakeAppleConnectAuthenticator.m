@implementation FakeAppleConnectAuthenticator

- (void)authenticateIfNeededWithCompletion:(id)a3
{
  void (**v4)(void *, void *, _QWORD);
  void *v5;
  _TtC15ImagePlaygroundP33_D269C10191F2B449B931B82A2B76F81C29FakeAppleConnectAuthenticator *v6;

  v4 = (void (**)(void *, void *, _QWORD))_Block_copy(a3);
  v6 = self;
  v5 = (void *)sub_23EFD14E4();
  v4[2](v4, v5, 0);

  _Block_release(v4);
}

- (_TtC15ImagePlaygroundP33_D269C10191F2B449B931B82A2B76F81C29FakeAppleConnectAuthenticator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[FakeAppleConnectAuthenticator init](&v3, sel_init);
}

@end
