@implementation URLProtocolDelegate

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  _TtC7MusicUI19URLProtocolDelegate *v14;

  v10 = _Block_copy(a6);
  _Block_copy(v10);
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = self;
  sub_21D2CD05C((uint64_t)v11, (uint64_t)v12, v13, (uint64_t)v14, (void (**)(_QWORD, _QWORD, _QWORD))v10);
  _Block_release(v10);

}

- (_TtC7MusicUI19URLProtocolDelegate)init
{
  return (_TtC7MusicUI19URLProtocolDelegate *)sub_21D2CD3C4();
}

- (void).cxx_destruct
{
  sub_21CDD5880((uint64_t)self + OBJC_IVAR____TtC7MusicUI19URLProtocolDelegate_tabViewController, qword_25533D850);
}

@end
