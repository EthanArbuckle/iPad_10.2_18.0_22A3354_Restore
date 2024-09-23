@implementation AMSURLSentry

- (void)isTrustedURL:(NSURL *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSURL *v8;
  AMSURLSentry *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_18C869ACC((uint64_t)&unk_1EE0566D0, (uint64_t)v7);
}

- (AMSURLSentry)initWithBag:(id)a3
{
  swift_unknownObjectRetain();
  return (AMSURLSentry *)URLSentry.init(bag:)(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (AMSURLSentry)init
{
  URLSentry.init()();
}

@end
