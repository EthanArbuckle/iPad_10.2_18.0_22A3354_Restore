@implementation DIPHTTPSession

- (NSString)description
{
  _TtC17CoreODIEssentials14DIPHTTPSession *v2;
  void *v3;

  v2 = self;
  sub_20A4A5560();

  v3 = (void *)sub_20A5B88F4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void (**v23)(void *, void *);
  int v24;
  id v25;
  _TtC17CoreODIEssentials14DIPHTTPSession *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _TtC17CoreODIEssentials14DIPHTTPSession *v31;

  v30 = a5;
  v31 = self;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545FA648);
  v12 = MEMORY[0x24BDAC7A8](v10, v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12, v15);
  v17 = (char *)&v28 - v16;
  v18 = sub_20A5B8240();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18, v20);
  v22 = (char *)&v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = (void (**)(void *, void *))_Block_copy(a7);
  sub_20A5B8204();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
  sub_20A4AC32C((uint64_t)v17, (uint64_t)v14);
  v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v14, 1, v18);
  v29 = a3;
  v28 = a4;
  v25 = v30;
  v26 = v31;
  v27 = 0;
  if (v24 != 1)
  {
    v27 = (void *)sub_20A5B81EC();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v18);
  }
  v23[2](v23, v27);

  sub_20A44CE2C((uint64_t)v17, &qword_2545FA648);
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v6;
  id v7;
  _TtC17CoreODIEssentials14DIPHTTPSession *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_20A4ABBE8(v7);

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  _TtC17CoreODIEssentials14DIPHTTPSession *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_20A4ABF6C(a4);

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC17CoreODIEssentials14DIPHTTPSession *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_20A4AC1D0(v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (_TtC17CoreODIEssentials14DIPHTTPSession)init
{
  _TtC17CoreODIEssentials14DIPHTTPSession *result;

  result = (_TtC17CoreODIEssentials14DIPHTTPSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreODIEssentials14DIPHTTPSession__anonymousURLSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreODIEssentials14DIPHTTPSession_nsurlSessionConfiguration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreODIEssentials14DIPHTTPSession_anonymousNSURLSessionConfiguration));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

@end
