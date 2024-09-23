@implementation AMSActionRunner

+ (BOOL)canHandle:(id)a3 context:(id)a4
{
  uint64_t v5;
  id v6;

  v5 = sub_18CEC1774();
  swift_getObjCClassMetadata();
  v6 = a4;
  LOBYTE(a4) = static ActionRunner.canHandle(_:context:)(v5, a4);
  swift_bridgeObjectRelease();

  return a4 & 1;
}

+ (void)handle:(NSDictionary *)a3 context:(AMSActionContext *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSDictionary *v10;
  AMSActionContext *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  v10 = a3;
  v11 = a4;
  sub_18C869ACC((uint64_t)&unk_1EE055228, (uint64_t)v9);
}

+ (id)handle:(id)a3 context:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = sub_18CEC1774();
  swift_getObjCClassMetadata();
  v6 = a4;
  v7 = static ActionRunner.handle(_:context:)(v5, a4);
  swift_bridgeObjectRelease();

  return v7;
}

- (AMSActionRunner)init
{
  return (AMSActionRunner *)ActionRunner.init()();
}

@end
