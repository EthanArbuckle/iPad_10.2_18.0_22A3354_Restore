@implementation HAPNFCReaderNotification

- (id)_initializeNFCStream:(id)a3 withSource:(unint64_t)a4 workQueue:(id)a5 backgroundReadingSupported:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  HAPNFCReaderNotification *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HAPNFCReaderNotification *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void *)MEMORY[0x1D17B7244]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v15;
    v26 = 2112;
    v27 = (unint64_t)v10;
    v28 = 2048;
    v29 = a4;
    _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_INFO, "%{public}@Initializing NFC session: %@ %lu", (uint8_t *)&v24, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  v16 = (void *)MEMORY[0x1D17B7244]();
  v17 = v13;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (a4 != 1 || a6)
  {
    if (v19)
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v22;
      v26 = 2048;
      v27 = a4;
      _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_INFO, "%{public}@Initializing nfc xpc for source %lu", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v21 = -[HAPNFCReaderXPC initReaderWithStream:fromSource:workQueue:readerStream:]([HAPNFCReaderXPC alloc], "initReaderWithStream:fromSource:workQueue:readerStream:", v10, a4, v11, v17);
    objc_msgSend(v21, "beginSession");
  }
  else
  {
    if (v19)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v20;
      _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_INFO, "%{public}@Background tag reading not supported on this platform", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v21 = 0;
  }

  return v21;
}

- (void)_initializeHomeKitNFCStreamWithQueue:(id)a3 backgroundReadingSupported:(BOOL)a4
{
  id v5;

  -[HAPNFCReaderNotification _initializeNFCStream:withSource:workQueue:backgroundReadingSupported:](self, "_initializeNFCStream:withSource:workQueue:backgroundReadingSupported:", CFSTR("com.apple.nfcd.homekit.field"), 0, a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HAPNFCReaderNotification setNfcHomeKit:](self, "setNfcHomeKit:", v5);

}

- (void)_initializeProxCardStreamWithQueue:(id)a3 backgroundReadingSupported:(BOOL)a4
{
  id v5;

  -[HAPNFCReaderNotification _initializeNFCStream:withSource:workQueue:backgroundReadingSupported:](self, "_initializeNFCStream:withSource:workQueue:backgroundReadingSupported:", CFSTR("com.apple.nfcd.homekit.proxcard"), 1, a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HAPNFCReaderNotification setTagProxCard:](self, "setTagProxCard:", v5);

}

- (void)nfcStreamIndicationFromSource:(unint64_t)a3 withPayload:(id)a4
{
  id v6;
  void *v7;
  HAPNFCReaderNotification *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 2048;
    v15 = a3;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@NFC from source %lu with data: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[HAPNFCReaderNotification setupNotificationDictionaryWithNFCData:](v8, "setupNotificationDictionaryWithNFCData:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCReaderNotification _sendHomeNotificationForSource:withDictionary:](v8, "_sendHomeNotificationForSource:withDictionary:", a3, v11);

}

- (HAPNFCReaderNotification)init
{
  HAPNFCReaderNotification *v2;
  void *v3;
  HAPNFCReaderNotification *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  dispatch_queue_t v14;
  HAPNFCReaderNotification *v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)HAPNFCReaderNotification;
  v2 = -[HAPNFCReaderNotification init](&v16, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1D17B7244]();
    v4 = v2;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Initializing NFC streams", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v7 = (const char *)HAPDispatchQueueName(v4, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(v7, v8);

    v10 = (void *)MEMORY[0x1E0D51948];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __32__HAPNFCReaderNotification_init__block_invoke;
    v13[3] = &unk_1E894B9E8;
    v14 = v9;
    v15 = v4;
    v11 = v9;
    objc_msgSend(v10, "sharedHardwareManager:", v13);

  }
  return v2;
}

- (void)_sendHomeNotificationForSource:(unint64_t)a3 withDictionary:(id)a4
{
  id v6;
  void *v7;
  HAPNFCReaderNotification *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HAPNFCReaderNotification *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 == 1)
  {
    v14 = (void *)MEMORY[0x1D17B7244]();
    v8 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = (unint64_t)v6;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending HAPNFCStreamSource_AccessorySetupPayload notification with dictionary %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("kHAPNFCProxSetupNotification");
    goto LABEL_9;
  }
  if (!a3)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v10;
      v23 = 2112;
      v24 = (unint64_t)v6;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending HAPNFCStreamSource_HKField notification with dictionary %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("kHapTapNotification");
LABEL_9:
    objc_msgSend(v11, "postNotificationName:object:userInfo:", v13, v8, v6);

    goto LABEL_13;
  }
  v17 = (void *)MEMORY[0x1D17B7244]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v20;
    v23 = 2048;
    v24 = a3;
    _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unknown notifySource %lu", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
LABEL_13:

}

- (id)setupNotificationDictionaryWithNFCData:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("kHAPNFCData"));

  return v5;
}

- (HAPNFCReaderXPC)nfcHomeKit
{
  return (HAPNFCReaderXPC *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNfcHomeKit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HAPNFCReaderXPC)tagProxCard
{
  return (HAPNFCReaderXPC *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTagProxCard:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagProxCard, 0);
  objc_storeStrong((id *)&self->_nfcHomeKit, 0);
}

void __32__HAPNFCReaderNotification_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HAPNFCReaderNotification_init__block_invoke_2;
  block[3] = &unk_1E894E120;
  v5 = v3;
  v11 = v5;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 32);
  dispatch_async(v4, block);
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Completed initializing NFC streams", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);

}

uint64_t __32__HAPNFCReaderNotification_init__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isBackgroundTagReadingAvailable");
  result = objc_msgSend(*(id *)(a1 + 40), "_initializeHomeKitNFCStreamWithQueue:backgroundReadingSupported:", *(_QWORD *)(a1 + 48), v2);
  if ((_DWORD)v2)
    return objc_msgSend(*(id *)(a1 + 40), "_initializeProxCardStreamWithQueue:backgroundReadingSupported:", *(_QWORD *)(a1 + 48), 1);
  return result;
}

+ (void)start
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HAPNFCReaderNotification_start__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (start_onceToken != -1)
    dispatch_once(&start_onceToken, block);
}

void __33__HAPNFCReaderNotification_start__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)start_hapNFCReaderNotification;
  start_hapNFCReaderNotification = (uint64_t)v1;

}

@end
