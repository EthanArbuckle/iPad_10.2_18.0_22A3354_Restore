@implementation BuddyAISFlowTaskInfo

- (BuddyAISFlowTaskInfo)initWithUnderlyingFlowTaskInfo:(id)a3
{
  id v3;
  BuddyAISFlowTaskInfo *v4;
  objc_super v6;
  id location[2];
  id v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyAISFlowTaskInfo;
  v8 = -[BuddyAISFlowTaskInfo init](&v6, "init");
  objc_storeStrong(&v8, v8);
  if (v8)
    objc_storeStrong((id *)v8 + 1, location[0]);
  v4 = (BuddyAISFlowTaskInfo *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (void)waitUntilLoadedWithCompletion:(id)a3
{
  void *v3;
  AISFlowTaskInfoProtocol *v4;
  AISFlowTaskInfoProtocol *v5;
  id location[2];
  BuddyAISFlowTaskInfo *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  v4 = -[BuddyAISFlowTaskInfo underlyingFlowTaskInfo](v7, "underlyingFlowTaskInfo");
  if (v4)
  {
    v5 = -[BuddyAISFlowTaskInfo underlyingFlowTaskInfo](v7, "underlyingFlowTaskInfo");
    -[AISFlowTaskInfoProtocol waitUntilLoadedWithCompletionHandler:](v5, "waitUntilLoadedWithCompletionHandler:", location[0]);

  }
  else
  {
    (*((void (**)(void))location[0] + 2))();
  }
  objc_storeStrong(location, 0);
}

- (AISFlowTaskInfoProtocol)underlyingFlowTaskInfo
{
  return self->_underlyingFlowTaskInfo;
}

- (void)setUnderlyingFlowTaskInfo:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingFlowTaskInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingFlowTaskInfo, 0);
}

@end
