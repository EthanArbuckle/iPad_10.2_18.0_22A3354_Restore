@implementation HMDUserNotificationCenter

- (HMDUserNotificationCenter)initWithBundleIdentifier:(id)a3 logEventSubmitter:(id)a4
{
  id v6;
  id v7;
  HMDUserNotificationCenter *v8;
  uint64_t v9;
  UNUserNotificationCenter *userNotificationCenter;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDUserNotificationCenter;
  v8 = -[HMDUserNotificationCenter init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", v6);
    userNotificationCenter = v8->_userNotificationCenter;
    v8->_userNotificationCenter = (UNUserNotificationCenter *)v9;

    -[UNUserNotificationCenter setDelegate:](v8->_userNotificationCenter, "setDelegate:", v8);
    objc_storeStrong((id *)&v8->_logEventSubmitter, a4);
  }

  return v8;
}

- (id)configureWithNotificationCategories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t v15;

  v4 = a3;
  -[HMDUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNotificationCategories:", v4);

  -[HMDUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWantsNotificationResponsesDelivered");

  v7 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[HMDUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__HMDUserNotificationCenter_configureWithNotificationCategories___block_invoke;
  v13[3] = &unk_24E797408;
  v13[4] = self;
  v15 = 64;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v8, "requestAuthorizationWithOptions:completionHandler:", 64, v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

- (void)setBadgeNumber:(int64_t)a3
{
  id v4;

  -[HMDUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBadgeCount:withCompletionHandler:", a3, 0);

}

- (void)updateContent:(id)a3 forNotificationWithRequestIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDUserNotificationCenter *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v11;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating notification with request identifier %@ with content: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDUserNotificationCenter userNotificationCenter](v9, "userNotificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __80__HMDUserNotificationCenter_updateContent_forNotificationWithRequestIdentifier___block_invoke;
  v14[3] = &unk_24E79BCC8;
  v14[4] = v9;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v12, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v13, v6, v14);

}

- (id)showNotificationWithTitle:(id)a3 body:(id)a4 threadIdentifier:(id)a5 categoryIdentifier:(id)a6 requestIdentifier:(id)a7 date:(id)a8 attachments:(id)a9 userInfo:(id)a10 shouldIgnoreDoNotDisturb:(BOOL)a11 interruptionLevel:(unint64_t)a12 logEventTopic:(int64_t)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDUserNotificationCenter *v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  HMDBulletinNotificationLogEvent *v38;
  uint64_t v40;
  id v42;
  void *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v45 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = objc_alloc_init(MEMORY[0x24BDF8800]);
  v44 = v18;
  objc_msgSend(v25, "setTitle:", v18);
  objc_msgSend(v25, "setBody:", v19);
  objc_msgSend(MEMORY[0x24BDF8870], "defaultSound");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSound:", v26);

  v43 = v22;
  objc_msgSend(v25, "setDate:", v22);
  if (v20)
    objc_msgSend(v25, "setThreadIdentifier:", v20);
  if (v21)
    objc_msgSend(v25, "setCategoryIdentifier:", v21);
  if (v24)
    objc_msgSend(v25, "setUserInfo:", v24);
  objc_msgSend(v25, "setShouldIgnoreDoNotDisturb:", a11, a12);
  if (v23)
    objc_msgSend(v25, "setAttachments:", v23);
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v25, "setInterruptionLevel:", v40);
    if (v40 == 3)
    {
      objc_msgSend(MEMORY[0x24BDF8870], "defaultCriticalSound");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSound:", v27);

    }
  }
  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", v45, v25, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x227676638]();
  v30 = self;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v42 = v24;
    v32 = v23;
    v33 = v21;
    v34 = v20;
    v35 = v19;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v36;
    v48 = 2112;
    v49 = v28;
    _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Adding bulletin: %@", buf, 0x16u);

    v19 = v35;
    v20 = v34;
    v21 = v33;
    v23 = v32;
    v24 = v42;
  }

  objc_autoreleasePoolPop(v29);
  -[HMDUserNotificationCenter _showNotification:](v30, "_showNotification:", v28);
  -[HMDUserNotificationCenter logEventSubmitter](v30, "logEventSubmitter");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[HMDBulletinNotificationLogEvent initWithTopic:]([HMDBulletinNotificationLogEvent alloc], "initWithTopic:", a13);
  objc_msgSend(v37, "submitLogEvent:", v38);

  return v28;
}

- (void)removeNotificationRequestsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removePendingNotificationRequestsWithIdentifiers:", v4);

  -[HMDUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeDeliveredNotificationsWithIdentifiers:", v4);

}

- (void)fetchAreUserNotificationsEnabledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HMDUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__HMDUserNotificationCenter_fetchAreUserNotificationsEnabledWithCompletion___block_invoke;
  v7[3] = &unk_24E797430;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getNotificationSettingsWithCompletionHandler:", v7);

}

- (void)_showNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HMDUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__HMDUserNotificationCenter__showNotification___block_invoke;
  v7[3] = &unk_24E79BD80;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addNotificationRequest:withCompletionHandler:", v6, v7);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[HMDUserNotificationCenter delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notificationCenter:didReceiveNotificationResponse:withCompletionHandler:", self, v8, v7);

}

- (void)notificationSettingsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HMDUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__HMDUserNotificationCenter_notificationSettingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_24E797430;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getNotificationSettingsWithCompletionHandler:", v7);

}

- (HMDUserNotificationCenterDelegate)delegate
{
  return (HMDUserNotificationCenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return (UNUserNotificationCenter *)objc_getProperty(self, a2, 16, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __71__HMDUserNotificationCenter_notificationSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__HMDUserNotificationCenter__showNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v6;
      v10 = 2112;
      v11 = v3;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "%{public}@Error adding notification request. Error: %@. Request: %@.", (uint8_t *)&v8, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

uint64_t __76__HMDUserNotificationCenter_fetchAreUserNotificationsEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), (unint64_t)objc_msgSend(a2, "authorizationStatus") > 1);
}

void __80__HMDUserNotificationCenter_updateContent_forNotificationWithRequestIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543874;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update notification with request identifier %@: %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __65__HMDUserNotificationCenter_configureWithNotificationCategories___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      v17 = 138543618;
      v18 = v10;
      v19 = 2048;
      v20 = v11;
      v12 = "%{public}@Authorization request with options: %lu was granted.";
      v13 = v9;
      v14 = OS_LOG_TYPE_INFO;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v13, v14, v12, (uint8_t *)&v17, v15);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = 138543874;
    v18 = v10;
    v19 = 2048;
    v20 = v16;
    v21 = 2112;
    v22 = v5;
    v12 = "%{public}@Authorization request with options: %lu was not granted with error:%@.";
    v13 = v9;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_231033 != -1)
    dispatch_once(&logCategory__hmf_once_t6_231033, &__block_literal_global_231034);
  return (id)logCategory__hmf_once_v7_231035;
}

void __40__HMDUserNotificationCenter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_231035;
  logCategory__hmf_once_v7_231035 = v0;

}

@end
