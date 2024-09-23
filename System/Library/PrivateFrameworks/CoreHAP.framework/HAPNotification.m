@implementation HAPNotification

+ (void)postNotification:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v12;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@CoreHAP - Sending notification %@ with object %@ and userInfo %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", v7, v8, v9);

}

+ (id)typeToString:(unint64_t)a3
{
  if (a3 - 1 < 4)
    return off_1E8949548[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown Reachability Notification type %ld"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
