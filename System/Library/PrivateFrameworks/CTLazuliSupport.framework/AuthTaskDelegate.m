@implementation AuthTaskDelegate

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
  _TtC15CTLazuliSupport16AuthTaskDelegate *v22;
  uint64_t v23;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800BD8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_23764A558();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_256800BE8;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_256800BF8;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_23762EA78((uint64_t)v13, (uint64_t)&unk_256800C08, (uint64_t)v18);
  swift_release();
}

- (_TtC15CTLazuliSupport16AuthTaskDelegate)init
{
  _TtC15CTLazuliSupport16AuthTaskDelegate *result;

  result = (_TtC15CTLazuliSupport16AuthTaskDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
