@implementation CSNotificationDispatcher

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CSNotificationDispatcher modalDestination](self, "modalDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateNotificationSectionSettings:previousSectionSettings:", v7, v6);

  -[CSNotificationDispatcher listDestination](self, "listDestination");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateNotificationSectionSettings:previousSectionSettings:", v7, v6);

}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSNotificationDispatcher listDestination](self, "listDestination");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationsLoadedForSectionIdentifier:", v4);

}

- (CSNotificationDestination)listDestination
{
  return (CSNotificationDestination *)objc_loadWeakRetained((id *)&self->_listDestination);
}

- (CSNotificationDestination)modalDestination
{
  return (CSNotificationDestination *)objc_loadWeakRetained((id *)&self->_modalDestination);
}

- (void)setActive:(BOOL)a3
{
  CSNotificationDispatcher *v4;
  CSNotificationDispatcher *v5;
  id v6;

  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
      v4 = self;
    else
      v4 = 0;
    v5 = v4;
    -[CSNotificationDispatcher modalDestination](self, "modalDestination");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDispatcher:", v5);

  }
}

- (void)setBannerDestinationUnavailable:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *bannerDestinationSuppressionReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  bannerDestinationSuppressionReasons = self->_bannerDestinationSuppressionReasons;
  v10 = v6;
  if (v4)
  {
    if (!bannerDestinationSuppressionReasons)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v9 = self->_bannerDestinationSuppressionReasons;
      self->_bannerDestinationSuppressionReasons = v8;

      v6 = v10;
      bannerDestinationSuppressionReasons = self->_bannerDestinationSuppressionReasons;
    }
    -[NSMutableSet addObject:](bannerDestinationSuppressionReasons, "addObject:", v6);
  }
  else
  {
    -[NSMutableSet removeObject:](bannerDestinationSuppressionReasons, "removeObject:", v6);
  }

}

- (BOOL)isNotificationContentExtensionVisible:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[CSNotificationDispatcher isActive](self, "isActive"))
  {
    -[CSNotificationDispatcher listDestination](self, "listDestination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isNotificationContentExtensionVisible:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isPresentingNotificationInLongLook
{
  _BOOL4 v3;
  id WeakRetained;
  char v5;

  v3 = -[CSNotificationDispatcher isActive](self, "isActive");
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_listDestination);
    v5 = objc_msgSend(WeakRetained, "isPresentingNotificationInLongLook");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  id WeakRetained;
  char v7;

  v3 = a3;
  v5 = -[CSNotificationDispatcher isActive](self, "isActive");
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_listDestination);
    v7 = objc_msgSend(WeakRetained, "dismissNotificationInLongLookAnimated:", v3);

    LOBYTE(v5) = v7;
  }
  return v5;
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x1E0DC60C8];
}

- (BOOL)interceptsQueueRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  id WeakRetained;
  int v12;
  void *v13;

  v4 = a3;
  if (!-[CSNotificationDispatcher isActive](self, "isActive"))
    goto LABEL_4;
  -[CSNotificationDispatcher activeBehavior](self, "activeBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "notificationBehavior");

  if (v6 == 3
    || (-[CSNotificationDispatcher activeBehavior](self, "activeBehavior"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "notificationBehavior"),
        v7,
        v8 == 2))
  {
LABEL_4:
    LOBYTE(v9) = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_carPlayStatusProvider);
    v12 = objc_msgSend(WeakRetained, "isCarPlayActiveForNotifications");

    if (v12)
    {
      objc_msgSend(v4, "requestDestinations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0DC60C0]) ^ 1;

    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }

  return v9;
}

- (BOOL)canReceiveNotificationRequest:(id)a3
{
  return 1;
}

- (void)postNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "requestsFullScreenPresentation");

  if (!v6)
  {
    if (!-[CSNotificationDispatcher isActive](self, "isActive"))
    {
      objc_msgSend(v4, "options");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "addToLockScreenWhenUnlocked"))
      {

      }
      else
      {
        objc_msgSend(v4, "requestDestinations");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "containsObject:", *MEMORY[0x1E0DC60D8]);

        if (!v29)
        {
          v45 = (void *)*MEMORY[0x1E0DC5F70];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
          {
            v12 = v45;
            v46 = (objc_class *)objc_opt_class();
            NSStringFromClass(v46);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "notificationIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "un_logDigest");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 138543618;
            v48 = v14;
            v49 = 2114;
            v50 = v16;
            v17 = "Destination %{public}@ ignoring received notification %{public}@";
            goto LABEL_26;
          }
          goto LABEL_27;
        }
      }
    }
    v30 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "un_logDigest");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v33;
      v49 = 2114;
      v50 = v35;
      _os_log_impl(&dword_1D0337000, v31, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received notification %{public}@", (uint8_t *)&v47, 0x16u);

    }
    -[CSNotificationDispatcher listDestination](self, "listDestination");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  -[CSNotificationDispatcher activeBehavior](self, "activeBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "notificationBehavior");

  if (v8 == 2)
  {
    v9 = -[NSMutableSet count](self->_bannerDestinationSuppressionReasons, "count");
    v10 = (void *)*MEMORY[0x1E0DC5F70];
    v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        v12 = v10;
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "notificationIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "un_logDigest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 138543618;
        v48 = v14;
        v49 = 2114;
        v50 = v16;
        v17 = "Destination %{public}@ ignoring received full screen notification due to temporary notification behavior %{public}@";
LABEL_26:
        _os_log_impl(&dword_1D0337000, v12, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v47, 0x16u);

        goto LABEL_27;
      }
      goto LABEL_27;
    }
    if (v11)
    {
      v38 = v10;
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "un_logDigest");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v40;
      v49 = 2114;
      v50 = v42;
      _os_log_impl(&dword_1D0337000, v38, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ converting received full screen notification to banner due to temporary notification behavior %{public}@", (uint8_t *)&v47, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "notificationDispatcher");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bannerDestination");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "postNotificationRequest:", v4);

LABEL_18:
    goto LABEL_27;
  }
  v19 = -[CSNotificationDispatcher isActive](self, "isActive");
  v20 = (void *)*MEMORY[0x1E0DC5F70];
  v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      v22 = v20;
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "un_logDigest");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v24;
      v49 = 2114;
      v50 = v26;
      _os_log_impl(&dword_1D0337000, v22, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received full screen notification %{public}@", (uint8_t *)&v47, 0x16u);

    }
    -[CSNotificationDispatcher modalDestination](self, "modalDestination");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
    v36 = v27;
    objc_msgSend(v27, "postNotificationRequest:", v4);
    goto LABEL_18;
  }
  if (v21)
  {
    v12 = v20;
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "un_logDigest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 138543618;
    v48 = v14;
    v49 = 2114;
    v50 = v16;
    v17 = "Destination %{public}@ ignoring received full screen notification %{public}@";
    goto LABEL_26;
  }
LABEL_27:

}

- (void)modifyNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ modifying notification %{public}@", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(v4, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestsFullScreenPresentation");

  if (v12)
    -[CSNotificationDispatcher modalDestination](self, "modalDestination");
  else
    -[CSNotificationDispatcher listDestination](self, "listDestination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateNotificationRequest:", v4);

}

- (void)withdrawNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ withdrawing notification %{public}@", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(v4, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestsFullScreenPresentation");

  if (v12)
    -[CSNotificationDispatcher modalDestination](self, "modalDestination");
  else
    -[CSNotificationDispatcher listDestination](self, "listDestination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "withdrawNotificationRequest:", v4);

}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CSNotificationDispatcher modalDestination](self, "modalDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateNotificationSystemSettings:previousSystemSettings:", v7, v6);

  -[CSNotificationDispatcher listDestination](self, "listDestination");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateNotificationSystemSettings:previousSystemSettings:", v7, v6);

}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (-[CSNotificationDispatcher isActive](self, "isActive"))
    return 2;
  else
    return 1;
}

- (void)destination:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotificationRequest:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "destination:requestPermissionToExecuteAction:forNotificationRequest:withParameters:completion:", self, v14, v13, v12, v11);

}

- (void)destination:(id)a3 performAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v9 = a6;
  v13 = a8;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "destination:executeAction:forNotificationRequest:requestAuthentication:withParameters:completion:", self, v16, v15, v9, v14, v13);

}

- (void)destination:(id)a3 clearNotificationRequests:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destination:requestsClearingNotificationRequests:", self, v5);

}

- (void)destination:(id)a3 clearNotificationRequestsFromIncomingSection:(id)a4
{
  -[CSNotificationDispatcher _clearNotificationRequestsFromIncomingSection:](self, "_clearNotificationRequestsFromIncomingSection:", a4);
}

- (void)destination:(id)a3 clearNotificationRequestsInSections:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destination:requestsClearingNotificationRequestsInSections:", self, v5);

}

- (void)destination:(id)a3 clearNotificationRequestsFromDate:(id)a4 toDate:(id)a5 inSections:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "destination:requestsClearingNotificationRequestsFromDate:toDate:inSections:", self, v11, v10, v9);

}

- (void)destination:(id)a3 setAllowsNotifications:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a5;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "destination:setAllowsNotifications:forSectionIdentifier:", self, v5, v8);

}

- (void)destination:(id)a3 setDeliverQuietly:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a5;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "destination:setDeliverQuietly:forSectionIdentifier:", self, v5, v8);

}

- (void)destination:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  id v14;

  v9 = a4;
  v14 = a5;
  v11 = a6;
  v12 = a7;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "destination:setMuted:untilDate:forSectionIdentifier:threadIdentifier:", self, v9, v14, v11, v12);

}

- (void)destination:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a5;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "destination:setAllowsCriticalAlerts:forSectionIdentifier:", self, v5, v8);

}

- (void)destination:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a5;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "destination:setAllowsTimeSensitive:forSectionIdentifier:", self, v5, v8);

}

- (void)destination:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a5;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "destination:setAllowsDirectMessages:forSectionIdentifier:", self, v5, v8);

}

- (void)destination:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a5;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "destination:setScheduledDelivery:forSectionIdentifier:", self, v5, v8);

}

- (void)destination:(id)a3 setSystemScheduledDeliveryEnabled:(BOOL)a4 scheduledDeliveryTimes:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a5;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "destination:setSystemScheduledDeliveryEnabled:scheduledDeliveryTimes:", self, v5, v8);

}

- (id)destination:(id)a3 notificationRequestForUUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "destination:notificationRequestForUUID:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)destination:(id)a3 settingsForSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationSectionSettingsForDestination:forSectionIdentifier:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)notificationSectionSettingsForDestination:(id)a3
{
  void *v4;
  void *v5;

  -[CSNotificationDispatcher delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSectionSettingsForDestination:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)notificationSystemSettingsForDestination:(id)a3
{
  void *v4;
  void *v5;

  -[CSNotificationDispatcher delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSystemSettingsForDestination:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)destination:(id)a3 setNotificationSystemSettings:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destination:setNotificationSystemSettings:", self, v5);

}

- (void)stopAllRealerts
{
  id v2;

  -[CSNotificationDispatcher alertingController](self, "alertingController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "killRealerts");

}

- (void)_clearNotificationRequestsFromIncomingSection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CSNotificationDispatcher delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DC60D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destination:requestsClearingNotificationRequests:fromDestinations:", self, v4, v5);

}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setModalDestination:(id)a3
{
  objc_storeWeak((id *)&self->_modalDestination, a3);
}

- (void)setListDestination:(id)a3
{
  objc_storeWeak((id *)&self->_listDestination, a3);
}

- (CSBehavior)activeBehavior
{
  return self->_activeBehavior;
}

- (void)setActiveBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_activeBehavior, a3);
}

- (CSCarPlayStatusProviding)carPlayStatusProvider
{
  return (CSCarPlayStatusProviding *)objc_loadWeakRetained((id *)&self->_carPlayStatusProvider);
}

- (void)setCarPlayStatusProvider:(id)a3
{
  objc_storeWeak((id *)&self->_carPlayStatusProvider, a3);
}

- (SBNCAlertingController)alertingController
{
  return (SBNCAlertingController *)objc_loadWeakRetained((id *)&self->_alertingController);
}

- (void)setAlertingController:(id)a3
{
  objc_storeWeak((id *)&self->_alertingController, a3);
}

- (NCNotificationDestinationDelegate)delegate
{
  return (NCNotificationDestinationDelegate *)objc_loadWeakRetained((id *)&self->_notificationDestinationDelegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_notificationDestinationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationDestinationDelegate);
  objc_destroyWeak((id *)&self->_alertingController);
  objc_destroyWeak((id *)&self->_carPlayStatusProvider);
  objc_storeStrong((id *)&self->_activeBehavior, 0);
  objc_destroyWeak((id *)&self->_listDestination);
  objc_destroyWeak((id *)&self->_modalDestination);
  objc_storeStrong((id *)&self->_bannerDestinationSuppressionReasons, 0);
}

@end
