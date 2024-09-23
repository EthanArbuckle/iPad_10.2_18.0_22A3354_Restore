@implementation AsyncTaskDelegate

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC15CTLazuliSupport17AsyncTaskDelegate_continuation;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256801288);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  _TtC15CTLazuliSupport17AsyncTaskDelegate *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_23763E464(v9, a5);

}

@end
