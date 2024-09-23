@implementation AMSMediaURLBuilderUtility

+ (id)devicePlatform
{
  __CFString **v2;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (+[AMSDevice deviceIsAppleTV](AMSDevice, "deviceIsAppleTV")
    || +[AMSDevice deviceIsAppleTVSimulator](AMSDevice, "deviceIsAppleTVSimulator"))
  {
    v2 = AMSMediaTaskPlatformAppleTV;
    return *v2;
  }
  if (+[AMSDevice deviceIsAppleWatch](AMSDevice, "deviceIsAppleWatch")
    || +[AMSDevice deviceIsAppleWatchSimulator](AMSDevice, "deviceIsAppleWatchSimulator"))
  {
    v2 = AMSMediaTaskPlatformAppleWatch;
    return *v2;
  }
  if (+[AMSDevice deviceIsAudioAccessory](AMSDevice, "deviceIsAudioAccessory"))
  {
    v2 = AMSMediaTaskPlatformHomePod;
    return *v2;
  }
  if (+[AMSDevice deviceIsiPad](AMSDevice, "deviceIsiPad")
    || +[AMSDevice deviceIsiPadSimulator](AMSDevice, "deviceIsiPadSimulator"))
  {
LABEL_13:
    v2 = AMSMediaTaskPlatformiPad;
    return *v2;
  }
  if (+[AMSDevice deviceIsiPhone](AMSDevice, "deviceIsiPhone")
    || +[AMSDevice deviceIsiPhoneSimulator](AMSDevice, "deviceIsiPhoneSimulator")
    || +[AMSDevice deviceIsiPod](AMSDevice, "deviceIsiPod")
    || +[AMSDevice deviceIsiPodSimulator](AMSDevice, "deviceIsiPodSimulator"))
  {
    v2 = AMSMediaTaskPlatformiPhone;
    return *v2;
  }
  if (+[AMSDevice deviceIsMac](AMSDevice, "deviceIsMac"))
  {
    v2 = AMSMediaTaskPlatformMac;
    return *v2;
  }
  if (+[AMSDevice deviceIsRealityDevice](AMSDevice, "deviceIsRealityDevice")
    || +[AMSDevice deviceIsRealityDeviceSimulator](AMSDevice, "deviceIsRealityDeviceSimulator"))
  {
    if (_os_feature_enabled_impl())
    {
      v2 = &AMSMediaTaskPlatformReality;
      return *v2;
    }
    goto LABEL_13;
  }
  +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(v4, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown device platform", (uint8_t *)&v10, 0x16u);

  }
  return 0;
}

@end
