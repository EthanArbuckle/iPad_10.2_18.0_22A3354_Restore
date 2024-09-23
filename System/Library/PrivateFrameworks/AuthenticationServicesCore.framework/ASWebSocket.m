@implementation ASWebSocket

- (void)URLSession:(id)a3 webSocketTask:(id)a4 didOpenWithProtocol:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC26AuthenticationServicesCore11ASWebSocket *v13;

  if (a5)
  {
    v8 = sub_20E6EA1CC();
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_20E6C8BE4(v8, v10);

  swift_bridgeObjectRelease();
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  _TtC26AuthenticationServicesCore11ASWebSocket *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_20E6C8D0C(a5);

}

- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 didReceiveChallenge:(NSURLAuthenticationChallenge *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSURLSession *v19;
  NSURLSessionTask *v20;
  NSURLAuthenticationChallenge *v21;
  _TtC26AuthenticationServicesCore11ASWebSocket *v22;
  uint64_t v23;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A2E8A0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_20E6EA37C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_254A2F2F8;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_254A2EFD0;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_20E6E2380((uint64_t)v13, (uint64_t)&unk_254A2E918, (uint64_t)v18);
  swift_release();
}

- (_TtC26AuthenticationServicesCore11ASWebSocket)init
{
  _TtC26AuthenticationServicesCore11ASWebSocket *result;

  result = (_TtC26AuthenticationServicesCore11ASWebSocket *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20E683BAC((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore11ASWebSocket_delegate);

  sub_20E67BADC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC26AuthenticationServicesCore11ASWebSocket_connectionCompletionHandler));
  sub_20E6C921C((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore11ASWebSocket_testDelegate);
}

@end
