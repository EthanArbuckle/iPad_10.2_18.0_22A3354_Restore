@implementation HDNotificationStoreServer

- (void)remote_fetchBadgeForDomain:(int64_t)a3 completion:(id)a4
{
  -[HDNotificationManager badgeForDomain:completion:](self->_notificationManager, "badgeForDomain:completion:", a3, a4);
}

- (void)remote_setBadge:(id)a3 forDomain:(int64_t)a4 completion:(id)a5
{
  -[HDNotificationManager setBadge:forDomain:completion:](self->_notificationManager, "setBadge:forDomain:completion:", a3, a4, a5);
}

- (void)remote_postCompanionUserNotificationOfType:(int64_t)a3 completion:(id)a4
{
  -[HDNotificationManager postCompanionUserNotificationOfType:completion:](self->_notificationManager, "postCompanionUserNotificationOfType:completion:", a3, a4);
}

- (void)remote_postNotificationWithRequest:(id)a3 completion:(id)a4
{
  -[HDNotificationManager postNotificationWithRequest:completion:](self->_notificationManager, "postNotificationWithRequest:completion:", a3, a4);
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HDNotificationStoreServer *v17;
  HDNotificationManager *v18;
  HDNotificationManager *notificationManager;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "notificationManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:]([HDNotificationStoreServer alloc], "initWithUUID:configuration:client:delegate:", v11, v12, v13, v14);
    v18 = v16;
    notificationManager = v17->_notificationManager;
    v17->_notificationManager = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_featureUnavailableForProfileError");
    notificationManager = (HDNotificationManager *)(id)objc_claimAutoreleasedReturnValue();
    if (notificationManager)
    {
      if (a7)
        *a7 = objc_retainAutorelease(notificationManager);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }

  return v17;
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6938], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
}

@end
