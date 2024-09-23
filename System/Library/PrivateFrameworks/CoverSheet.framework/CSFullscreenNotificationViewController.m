@implementation CSFullscreenNotificationViewController

- (CSFullscreenNotificationViewController)initWithNotificationRequest:(id)a3
{
  return -[CSFullscreenNotificationViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (CSFullscreenNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CSFullscreenNotificationViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSFullscreenNotificationViewController;
  v4 = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__lockButtonPressed_, *MEMORY[0x1E0DAC350], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__silencingHardwareButtonPressed_, *MEMORY[0x1E0DAC378], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__silencingHardwareButtonPressed_, *MEMORY[0x1E0DAC3F8], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CSFullscreenNotificationViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1D0337000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

- (void)noteDidDismissProgrammatically
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRequest notificationIdentifier](self->_request, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1D0337000, v4, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received notice of programmatic dismissal for notification %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[CSFullscreenNotificationViewController _handleDismissAction](self, "_handleDismissAction");
}

- (void)_handlePrimaryAction
{
  -[CSFullscreenNotificationViewController _handleAction:withName:](self, "_handleAction:withName:", self->_primaryAction, CFSTR("primary"));
}

- (void)_handleSecondaryAction
{
  -[CSFullscreenNotificationViewController _handleAction:withName:](self, "_handleAction:withName:", self->_secondaryAction, CFSTR("secondary"));
}

- (void)_handleDismissAction
{
  -[CSFullscreenNotificationViewController _handleAction:withName:](self, "_handleAction:withName:", self->_dismissAction, CFSTR("dismiss"));
}

- (void)_handleSilenceAction
{
  -[CSFullscreenNotificationViewController _handleAction:withName:](self, "_handleAction:withName:", self->_silenceAction, CFSTR("silence"));
}

- (void)_handleAction:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NCNotificationRequest *request;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  CSFullscreenNotificationViewController *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC5F70];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      v10 = v8;
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRequest notificationIdentifier](self->_request, "notificationIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "un_logDigest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v12;
      v27 = 2114;
      v28 = v7;
      v29 = 2114;
      v30 = v14;
      _os_log_impl(&dword_1D0337000, v10, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ performing %{public}@ action for notification %{public}@", buf, 0x20u);

    }
    -[CSFullscreenNotificationViewController dispatcher](self, "dispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    request = self->_request;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __65__CSFullscreenNotificationViewController__handleAction_withName___block_invoke;
    v22[3] = &unk_1E8E2E468;
    v23 = v6;
    v24 = self;
    objc_msgSend(v15, "destination:performAction:forNotificationRequest:requestAuthentication:withParameters:completion:", self, v23, request, 1, 0, v22);

  }
  else
  {
    if (v9)
    {
      v17 = v8;
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRequest notificationIdentifier](self->_request, "notificationIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "un_logDigest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v19;
      v27 = 2114;
      v28 = v7;
      v29 = 2114;
      v30 = v21;
      _os_log_impl(&dword_1D0337000, v17, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ skipping performing %{public}@ action for notification %{public}@ because it is nil", buf, 0x20u);

    }
    -[CSFullscreenNotificationViewController _dismissFromSignificantUserInteraction](self, "_dismissFromSignificantUserInteraction");
  }

}

uint64_t __65__CSFullscreenNotificationViewController__handleAction_withName___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldDismissNotification");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "_dismissFromSignificantUserInteraction");
  return result;
}

- (void)_silencingHardwareButtonPressed:(id)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRequest notificationIdentifier](self->_request, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received hardware button pressed event for notification %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[CSFullscreenNotificationViewController _handleSilenceAction](self, "_handleSilenceAction");
}

- (void)_lockButtonPressed:(id)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRequest notificationIdentifier](self->_request, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received lock button pressed event for notification %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[CSFullscreenNotificationViewController _handlePrimaryAction](self, "_handlePrimaryAction");
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 520;
}

- (void)aggregateAppearance:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSFullscreenNotificationViewController;
  v3 = a3;
  -[CSModalViewControllerBase aggregateAppearance:](&v12, sel_aggregateAppearance_, v3);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "hidden:", 0, v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vibrantAndCentered:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hidesTime:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "priority:", 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addComponent:", v8);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "priority:", 40);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hidden:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addComponent:", v11);

}

- (void)aggregateBehavior:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSFullscreenNotificationViewController;
  v3 = a3;
  -[CSModalViewControllerBase aggregateBehavior:](&v4, sel_aggregateBehavior_, v3);
  objc_msgSend(v3, "removeRestrictedCapabilities:", 2, v4.receiver, v4.super_class);
  objc_msgSend(v3, "addRestrictedCapabilities:", 16781312);
  objc_msgSend(v3, "setIdleTimerMode:", 1);
  objc_msgSend(v3, "setIdleTimerDuration:", 9);
  objc_msgSend(v3, "setIdleWarnMode:", 2);

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSFullscreenNotificationViewController;
  if (!-[CSCoverSheetViewControllerBase handleEvent:](&v15, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    v5 = objc_msgSend(v4, "type");
    if (v5 != 27 && v5 != 9)
    {
      v13 = 0;
      goto LABEL_10;
    }
    v6 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCoverSheetEventType(objc_msgSend(v4, "type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRequest notificationIdentifier](self->_request, "notificationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "un_logDigest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received %{public}@ event for notification %{public}@", buf, 0x20u);

    }
    -[CSFullscreenNotificationViewController _handleDismissAction](self, "_handleDismissAction");
  }
  v13 = objc_msgSend(v4, "isConsumable");
LABEL_10:

  return v13;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "type");
  return v3 == 27 || v3 == 9;
}

- (void)handlePrimaryActionForView:(id)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRequest notificationIdentifier](self->_request, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received primary button tap event for notification %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[CSFullscreenNotificationViewController _handlePrimaryAction](self, "_handlePrimaryAction");
}

- (void)handleSecondaryActionForView:(id)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRequest notificationIdentifier](self->_request, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received secondary button tap event for notification %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[CSFullscreenNotificationViewController _handleSecondaryAction](self, "_handleSecondaryAction");
}

- (void)postNotificationRequest:(id)a3
{
  id v5;
  NCNotificationRequest **p_request;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NCNotificationAction *v16;
  NCNotificationAction *primaryAction;
  NCNotificationAction *v18;
  NCNotificationAction *secondaryAction;
  NCNotificationAction *v20;
  NCNotificationAction *v21;
  NCNotificationAction *v22;
  NCNotificationAction *silenceAction;
  NCNotificationAction *v24;
  NCNotificationAction *dismissAction;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_request = &self->_request;
  if (self->_request)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_request == nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[CSFullscreenNotificationViewController postNotificationRequest:].cold.3();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D041F2F0);
  }
  v7 = v5;
  NSClassFromString(CFSTR("NCNotificationRequest"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[CSFullscreenNotificationViewController postNotificationRequest:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D041F354);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NCNotificationRequestClass]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[CSFullscreenNotificationViewController postNotificationRequest:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D041F3B8);
  }

  v8 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notificationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "un_logDigest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v11;
    v31 = 2114;
    v32 = v13;
    _os_log_impl(&dword_1D0337000, v9, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presenting notification %{public}@", buf, 0x16u);

  }
  objc_storeStrong((id *)&self->_request, a3);
  objc_msgSend(v7, "supplementaryActions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0DC5F58]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "objectAtIndex:", 0);
    v16 = (NCNotificationAction *)objc_claimAutoreleasedReturnValue();
    primaryAction = self->_primaryAction;
    self->_primaryAction = v16;

  }
  if ((unint64_t)objc_msgSend(v15, "count") >= 2)
  {
    objc_msgSend(v15, "objectAtIndex:", 1);
    v18 = (NCNotificationAction *)objc_claimAutoreleasedReturnValue();
    secondaryAction = self->_secondaryAction;
    self->_secondaryAction = v18;

  }
  if (!self->_primaryAction)
  {
    objc_storeStrong((id *)&self->_primaryAction, self->_secondaryAction);
    -[NCNotificationRequest clearAction](*p_request, "clearAction");
    v20 = (NCNotificationAction *)objc_claimAutoreleasedReturnValue();
    v21 = self->_secondaryAction;
    self->_secondaryAction = v20;

  }
  -[NCNotificationRequest silenceAction](*p_request, "silenceAction");
  v22 = (NCNotificationAction *)objc_claimAutoreleasedReturnValue();
  silenceAction = self->_silenceAction;
  self->_silenceAction = v22;

  -[NCNotificationRequest clearAction](*p_request, "clearAction");
  v24 = (NCNotificationAction *)objc_claimAutoreleasedReturnValue();
  dismissAction = self->_dismissAction;
  self->_dismissAction = v24;

}

- (void)updateNotificationRequest:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = a3;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ does not support updating notification %{public}@", (uint8_t *)&v11, 0x16u);

  }
}

- (void)withdrawNotificationRequest:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = a3;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ withdrawing notification %{public}@", (uint8_t *)&v11, 0x16u);

  }
}

- (BOOL)isNotificationContentExtensionVisible:(id)a3
{
  return 0;
}

- (BOOL)isPresentingNotificationInLongLook
{
  return 0;
}

- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3
{
  return 0;
}

- (void)_dismissFromSignificantUserInteraction
{
  void *v3;

  +[CSAction actionWithType:](CSAction, "actionWithType:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v3);

  -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
}

- (NCNotificationRequest)notificationRequest
{
  return self->_request;
}

- (CSNotificationDispatcher)dispatcher
{
  return (CSNotificationDispatcher *)objc_loadWeakRetained((id *)&self->_dispatcher);
}

- (void)setDispatcher:(id)a3
{
  objc_storeWeak((id *)&self->_dispatcher, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dispatcher);
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_silenceAction, 0);
  objc_storeStrong((id *)&self->_secondaryAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)postNotificationRequest:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3(&dword_1D0337000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

- (void)postNotificationRequest:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1D0337000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

@end
