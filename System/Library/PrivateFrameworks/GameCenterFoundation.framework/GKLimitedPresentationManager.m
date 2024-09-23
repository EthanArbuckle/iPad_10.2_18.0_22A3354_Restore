@implementation GKLimitedPresentationManager

- (GKLimitedPresentationManager)initWithDefaultsKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = sub_1BCF15628();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (GKLimitedPresentationManager *)LimitedPresentationManager.init(defaultsKey:)(v3, v4);
}

- (void)presentationDisabledWithConfig:(GKLimitedPresentationConfig *)a3 context:(GKLimitedPresentationContext *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  GKLimitedPresentationConfig *v10;
  GKLimitedPresentationContext *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  swift_retain();
  sub_1BCF092DC((uint64_t)&unk_1EF49C940, (uint64_t)v9);
}

- (void)presentationDisabledWithConfig:(GKLimitedPresentationConfig *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  GKLimitedPresentationConfig *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  swift_retain();
  sub_1BCF092DC((uint64_t)&unk_1EF49C930, (uint64_t)v7);
}

- (void)resetWithCompletionHandler:(id)a3
{
  sub_1BCF0AF1C((uint64_t)self, (int)a2, a3, (uint64_t)&unk_1E75BB450, (uint64_t)&unk_1EF49C920);
}

- (void)didPresentWithCompletionHandler:(id)a3
{
  sub_1BCF0AF1C((uint64_t)self, (int)a2, a3, (uint64_t)&unk_1E75BB3B0, (uint64_t)&unk_1EF49C8E0);
}

- (GKLimitedPresentationManager)init
{
  LimitedPresentationManager.init()();
}

@end
