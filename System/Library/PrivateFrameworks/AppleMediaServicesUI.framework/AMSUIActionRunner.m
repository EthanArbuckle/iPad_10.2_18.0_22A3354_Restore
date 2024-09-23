@implementation AMSUIActionRunner

+ (BOOL)canHandle:(id)a3 context:(id)a4
{
  uint64_t v5;
  id v6;

  v5 = sub_211246324();
  swift_getObjCClassMetadata();
  v6 = a4;
  static UIActionRunner.canHandle(_:context:)(v5, a4);
}

+ (void)handle:(NSDictionary *)a3 context:(AMSUIActionContext *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSDictionary *v10;
  AMSUIActionContext *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  v10 = a3;
  v11 = a4;
  sub_21123A04C((uint64_t)&unk_254A9F800, (uint64_t)v9);
}

+ (id)handle:(id)a3 context:(id)a4
{
  id v5;

  sub_211246324();
  swift_getObjCClassMetadata();
  v5 = a4;
  static UIActionRunner.handle(_:context:)();
}

- (AMSUIActionRunner)init
{
  return (AMSUIActionRunner *)UIActionRunner.init()();
}

@end
