@implementation IMDServiceReachabilityController

+ (IMDServiceReachabilityController)sharedController
{
  if (qword_1EFC614F0 != -1)
    swift_once();
  return (IMDServiceReachabilityController *)(id)qword_1EFC62EB0;
}

- (int64_t)taskDeadlineSeconds
{
  return IMBagIntValueWithDefault();
}

- (int64_t)sortOrderForServiceName:(id)a3
{
  IMDServiceReachabilityController *v4;
  int64_t v5;

  sub_1D166DACC();
  v4 = self;
  v5 = sub_1D162C5C8();

  swift_bridgeObjectRelease();
  return v5;
}

- (id)reachabilityContextForChat:(id)a3
{
  id v5;
  IMDServiceReachabilityController *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1D162C7B4(a3);

  return v7;
}

- (void)calculateServiceForSendingToChat:(id)a3 accounts:(id)a4 completionBlock:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  IMDServiceReachabilityController *v11;

  v7 = _Block_copy(a5);
  sub_1D15FD3C0(0, &qword_1EFC62BE8);
  v8 = sub_1D166DBEC();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = a3;
  v11 = self;
  sub_1D162AF6C(v10, v8, (uint64_t)sub_1D162CA00, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)calculateServiceForSendingToHandles:(id)a3 accounts:(id)a4 context:(id)a5 completionBlock:(id)a6
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  IMDServiceReachabilityController *v13;

  v8 = _Block_copy(a6);
  v9 = sub_1D166DBEC();
  sub_1D15FD3C0(0, &qword_1EFC62BE8);
  v10 = sub_1D166DBEC();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v12 = a5;
  v13 = self;
  sub_1D162B160(v9, v10, v12, (uint64_t)sub_1D162B964, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (IMDServiceReachabilityController)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDServiceReachabilityController_tasks) = (Class)MEMORY[0x1E0DEE9E8];
  v3.receiver = self;
  v3.super_class = (Class)IMDServiceReachabilityController;
  return -[IMDServiceReachabilityController init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
