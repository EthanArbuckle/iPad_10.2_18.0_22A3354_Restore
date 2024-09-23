@implementation HMIFeedbackSession

- (HMIFeedbackSession)init
{
  HMIFeedbackSession *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURLSession *session;
  HMIHomeKitClient *v10;
  HMIHomeKitClient *homeKitClient;
  NSString *feedbackServiceHost;
  void *v13;
  int v14;
  NSString *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HMIFeedbackSession;
  v2 = -[HMIFeedbackSession init](&v17, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("HMIFeedback Queue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD1850];
    -[HMIFeedbackSession operationQueue](v2, "operationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionWithConfiguration:delegate:delegateQueue:", v5, v2, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    session = v2->_session;
    v2->_session = (NSURLSession *)v8;

    v10 = -[HMIHomeKitClient initWithNoCaching]([HMIHomeKitClient alloc], "initWithNoCaching");
    homeKitClient = v2->_homeKitClient;
    v2->_homeKitClient = v10;

    feedbackServiceHost = v2->_feedbackServiceHost;
    v2->_feedbackServiceHost = (NSString *)CFSTR("hkcvml.apple.com");

    if (+[HMIPreference isInternalInstall](HMIPreference, "isInternalInstall"))
    {
      +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLPreferenceForKey:defaultValue:", CFSTR("useDevelopmentFeedbackService"), 0);

      if (v14)
      {
        v15 = v2->_feedbackServiceHost;
        v2->_feedbackServiceHost = (NSString *)CFSTR("hkcvml-dev.apple.com");

      }
    }

  }
  return v2;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  int v12;
  void *v13;
  HMIFeedbackSession *v14;
  NSObject *v15;
  void *v16;
  __CFError *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  HMIFeedbackSession *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  const void *AppleSSLPinned;
  void *v32;
  __SecTrust *v33;
  OSStatus v34;
  void *v35;
  HMIFeedbackSession *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFError *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  CFErrorRef error;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  CFErrorRef v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (+[HMIPreference isInternalInstall](HMIPreference, "isInternalInstall"))
  {
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLPreferenceForKey:defaultValue:", CFSTR("useDevelopmentFeedbackService"), 0);

    if (v12)
    {
      v13 = (void *)MEMORY[0x220735570]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMIFeedbackSession feedbackServiceHost](v14, "feedbackServiceHost");
        v17 = (__CFError *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v16;
        v50 = 2112;
        v51 = v17;
        _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_INFO, "%{public}@Trusting host: %@ by default, not enforcing certificate pinning since user is donating videos to a dev server", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
LABEL_16:
      v10[2](v10, 1, 0);
      goto LABEL_21;
    }
  }
  objc_msgSend(v9, "protectionSpace");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "host");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIFeedbackSession feedbackServiceHost](self, "feedbackServiceHost");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  v22 = (void *)MEMORY[0x220735570]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
  if ((v21 & 1) != 0)
  {
    if (v25)
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v26;
      _os_log_impl(&dword_219D45000, v24, OS_LOG_TYPE_INFO, "%{public}@Force Certificate Pinning", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(v9, "protectionSpace");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "authenticationMethod");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x24BDD12F8]);

    if (!v29)
      goto LABEL_16;
    -[HMIFeedbackSession feedbackServiceHost](v23, "feedbackServiceHost");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    AppleSSLPinned = (const void *)SecPolicyCreateAppleSSLPinned();

    if (AppleSSLPinned)
    {
      objc_msgSend(v9, "protectionSpace");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (__SecTrust *)objc_msgSend(v32, "serverTrust");

      v34 = SecTrustSetPolicies(v33, AppleSSLPinned);
      CFRelease(AppleSSLPinned);
      if (v34)
      {
        v35 = (void *)MEMORY[0x220735570]();
        v36 = v23;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v38;
          v50 = 2048;
          v51 = (CFErrorRef)v34;
          _os_log_impl(&dword_219D45000, v37, OS_LOG_TYPE_ERROR, "%{public}@Error setting trust policies: %lu", buf, 0x16u);

        }
      }
      else
      {
        error = 0;
        if (SecTrustEvaluateWithError(v33, &error))
        {
          objc_msgSend(MEMORY[0x24BDD1818], "credentialForTrust:", v33);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v45);

          goto LABEL_21;
        }
        if (!error)
          goto LABEL_15;
        v35 = (void *)MEMORY[0x220735570]();
        v36 = v23;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v46;
          v50 = 2112;
          v51 = error;
          _os_log_impl(&dword_219D45000, v37, OS_LOG_TYPE_ERROR, "%{public}@Invalid certificate: %@", buf, 0x16u);

        }
      }

      objc_autoreleasePoolPop(v35);
    }
LABEL_15:
    v10[2](v10, 2, 0);
    goto LABEL_21;
  }
  if (v25)
  {
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "protectionSpace");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "host");
    v41 = (__CFError *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = v39;
    v50 = 2112;
    v51 = v41;
    _os_log_impl(&dword_219D45000, v24, OS_LOG_TYPE_INFO, "%{public}@Trusting host: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
  v42 = (void *)MEMORY[0x24BDD1818];
  objc_msgSend(v9, "protectionSpace");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "credentialForTrust:", objc_msgSend(v43, "serverTrust"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v44);

LABEL_21:
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5 != -1)
    dispatch_once(&logCategory__hmf_once_t5, &__block_literal_global_17);
  return (id)logCategory__hmf_once_v6;
}

void __33__HMIFeedbackSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6;
  logCategory__hmf_once_v6 = v0;

}

- (HMIHomeKitClient)homeKitClient
{
  return (HMIHomeKitClient *)objc_getProperty(self, a2, 8, 1);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)feedbackServiceHost
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackServiceHost, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_homeKitClient, 0);
}

@end
