@implementation ReviewDialogCoordinator

- (void)AMSURLSession:(AMSURLSession *)a3 task:(NSURLSessionTask *)a4 handleAuthenticateRequest:(AMSAuthenticateRequest *)a5 completion:(id)a6
{
  sub_211227630(self, (int)a2, a3, a4, a5, a6, (uint64_t)&unk_24CB580C8, (uint64_t)&unk_254A9EA90);
}

- (void)AMSURLSession:(AMSURLSession *)a3 task:(NSURLSessionTask *)a4 handleDialogRequest:(AMSDialogRequest *)a5 completion:(id)a6
{
  sub_211227630(self, (int)a2, a3, a4, a5, a6, (uint64_t)&unk_24CB580A0, (uint64_t)&unk_254A9EA80);
}

- (_TtC20AppleMediaServicesUI23ReviewDialogCoordinator)init
{
  return (_TtC20AppleMediaServicesUI23ReviewDialogCoordinator *)ReviewDialogCoordinator.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20AppleMediaServicesUI23ReviewDialogCoordinator__authenticateRequest));
  sub_2111BF9D4((uint64_t)self + OBJC_IVAR____TtC20AppleMediaServicesUI23ReviewDialogCoordinator__authenticateContinuation, &qword_254A9E9D0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20AppleMediaServicesUI23ReviewDialogCoordinator__dialogRequest));
  sub_2111BF9D4((uint64_t)self + OBJC_IVAR____TtC20AppleMediaServicesUI23ReviewDialogCoordinator__dialogContinuation, &qword_254A9E9E8);
  v3 = (char *)self + OBJC_IVAR____TtC20AppleMediaServicesUI23ReviewDialogCoordinator___observationRegistrar;
  v4 = sub_2112450A0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
