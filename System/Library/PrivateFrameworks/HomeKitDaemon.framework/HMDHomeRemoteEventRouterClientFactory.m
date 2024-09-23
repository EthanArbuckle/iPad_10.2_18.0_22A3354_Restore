@implementation HMDHomeRemoteEventRouterClientFactory

- (id)primaryResidentClientWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 storeReadHandle:(id)a11 storeWriteHandle:(id)a12
{
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  HMDRemoteEventRouterPrimaryResidentClient *v23;
  id v24;
  id v26;
  HMDRemoteEventRouterPrimaryResidentClient *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v18 = a12;
  v33 = a11;
  v32 = a10;
  v30 = a9;
  v31 = a8;
  v29 = a7;
  v28 = a6;
  v19 = a5;
  v26 = a4;
  v20 = a3;
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("RemoteEventRouter.Primary.Client."), "stringByAppendingString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [HMDRemoteEventRouterPrimaryResidentClient alloc];
  v24 = objc_retainAutorelease(v22);
  v27 = -[HMDRemoteEventRouterClient initWithMessageTargetUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:storeReadHandle:storeWriteHandle:logCategory:](v23, "initWithMessageTargetUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:storeReadHandle:storeWriteHandle:logCategory:", v20, v26, v19, v28, v29, v31, v30, v32, v33, v18, objc_msgSend(v24, "UTF8String"));

  return v27;
}

- (id)residentClientWithAccessoryUUID:(id)a3 homeUUID:(id)a4 queue:(id)a5 dataSource:(id)a6 messageDispatcher:(id)a7 notificationCenter:(id)a8 requestMessageName:(id)a9 updateMessageName:(id)a10 multiHopFetchResponseMessageName:(id)a11 storeReadHandle:(id)a12 storeWriteHandle:(id)a13
{
  id v19;
  id v20;
  void *v21;
  void *v22;
  HMDRemoteEventRouterResidentClient *v23;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v35 = a13;
  v34 = a12;
  v33 = a11;
  v32 = a10;
  v30 = a9;
  v31 = a8;
  v36 = a7;
  v28 = a6;
  v27 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("RemoteEventRouter.Resident.Client."), "stringByAppendingString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [HMDRemoteEventRouterResidentClient alloc];
  +[HMDRemoteEventRouterClientRetryIntervals retryIntervalsForResidentClient](HMDRemoteEventRouterClientRetryIntervals, "retryIntervalsForResidentClient");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_retainAutorelease(v22);
  v25 = -[HMDRemoteEventRouterResidentClient initWitAccessoryUUID:homeUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:storeReadHandle:storeWriteHandle:retryIntervalProvider:logCategory:](v23, "initWitAccessoryUUID:homeUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:storeReadHandle:storeWriteHandle:retryIntervalProvider:logCategory:", v20, v19, v27, v28, v36, v31, v30, v32, v33, v34, v35, v26, objc_msgSend(v29, "UTF8String"));

  return v25;
}

@end
