@implementation SNMovieRemixSession

- (id)subscribeWithFinalResultHandler:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  SNMovieRemixSession *v10;
  id v11;

  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  v11 = sub_1D4304AE0((uint64_t)sub_1D42CA4D4, v8, (uint64_t)sub_1D42E9D3C, v9);

  swift_release();
  swift_release();
  return v11;
}

- (void)yieldBuffer:(id)a3
{
  id v4;
  SNMovieRemixSession *v5;

  v4 = a3;
  v5 = self;
  sub_1D4304DAC((uint64_t)v4);

}

- (void)finishWithError:(id)a3
{
  SNMovieRemixSession *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_1D4304E68(a3);

}

- (SNMovieRemixSession)init
{
  SNMovieRemixSession.init()();
}

- (void).cxx_destruct
{
  swift_release();
  sub_1D42CFC14();
  sub_1D42B8F48();
  swift_release();
}

@end
