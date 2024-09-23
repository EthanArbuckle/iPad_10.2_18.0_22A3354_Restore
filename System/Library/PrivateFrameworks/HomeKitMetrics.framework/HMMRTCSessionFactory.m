@implementation HMMRTCSessionFactory

- (id)sessionWithUUID:(id)a3 serviceName:(id)a4 uploadImmediately:(BOOL)a5 commonFields:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HMMRTCSession *v14;
  HMMRTCSession *v15;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  +[HMMQueuingRTCBackendSessionManager sharedSessionManager](HMMQueuingRTCBackendSessionManager, "sharedSessionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logBackendSessionWithServiceName:sessionUUID:isRealtime:", v10, v9, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = -[HMMRTCSession initWithUUID:serviceName:commonFields:backend:]([HMMRTCSession alloc], "initWithUUID:serviceName:commonFields:backend:", v9, v10, v11, v13);
  else
    v14 = -[HMMNullRTCSession initWithUUID:serviceName:]([HMMNullRTCSession alloc], "initWithUUID:serviceName:", v9, v10);
  v15 = v14;

  return v15;
}

@end
