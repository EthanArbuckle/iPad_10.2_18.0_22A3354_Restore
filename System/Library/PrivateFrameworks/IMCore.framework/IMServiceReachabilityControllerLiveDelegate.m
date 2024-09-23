@implementation IMServiceReachabilityControllerLiveDelegate

- (id)preconditionsForServiceName:(id)a3
{
  void *v3;

  sub_1A2199764();
  swift_retain();
  sub_1A217B1BC();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1A200E71C(0, &qword_1EE65C288);
  v3 = (void *)sub_1A21997C4();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)preferredAccountIDForServiceName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  sub_1A2199764();
  swift_retain();
  sub_1A217B484();
  v4 = v3;
  swift_release();
  swift_bridgeObjectRelease();
  if (v4)
  {
    v5 = (void *)sub_1A2199758();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)objc_opt_self();
  v7 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  v8 = objc_msgSend(v6, sel_sharedController);
  v9 = objc_msgSend(v8, sel_remoteDaemon);

  objc_msgSend(v9, sel_calculateReachabilityWithRequest_responseHandler_, v7, a4);
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
}

- (int64_t)sortOrderForServiceName:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  sub_1A2199764();
  v3 = (void *)objc_opt_self();
  swift_retain();
  v4 = (void *)sub_1A2199758();
  v5 = objc_msgSend(v3, sel_serviceWithInternalName_, v4);

  if (v5)
  {
    v6 = objc_msgSend(v5, sel_serviceForSendingPriority);
    swift_release();
    swift_bridgeObjectRelease();

    return (int64_t)v6;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    return -1;
  }
}

- (NSArray)serviceNamesForSending
{
  void *v2;

  sub_1A217B6CC();
  v2 = (void *)sub_1A21997C4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (int64_t)taskDeadlineSeconds
{
  return IMBagIntValueWithDefault();
}

@end
