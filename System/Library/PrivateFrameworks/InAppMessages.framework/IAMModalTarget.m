@implementation IAMModalTarget

- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 fromMessageEntry:(id)a5 forTarget:(id)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13 && v14)
  {
    if (+[IAMModalTarget isAnyModalTargetPresentingMessage](IAMModalTarget, "isAnyModalTargetPresentingMessage"))
    {
      IAMLogCategoryDefault();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v18;
        _os_log_impl(&dword_20DD38000, v17, OS_LOG_TYPE_DEFAULT, "Unable to display modal message = %{public}@. Another modal message is already being displayed.", buf, 0xCu);

      }
      goto LABEL_7;
    }
    objc_msgSend(v12, "applicationContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v19, "allowsModalMessageDisplay") & 1) != 0)
      {
        -[IAMModalTarget _applicationViewControllerForModalPresentation](self, "_applicationViewControllerForModalPresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __104__IAMModalTarget_messageCoordinator_didUpdatePriorityMessage_fromMessageEntry_forTarget_withCompletion___block_invoke;
          v26[3] = &unk_24C871490;
          v27 = v16;
          -[IAMModalTarget _presentMessage:messageEntry:fromViewController:withCompletion:](self, "_presentMessage:messageEntry:fromViewController:withCompletion:", v13, v14, v20, v26);

        }
        else
        {
          IAMLogCategoryDefault();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v29 = v25;
            _os_log_impl(&dword_20DD38000, v24, OS_LOG_TYPE_DEFAULT, "Unable to display modal message = %{public}@. Application context did not provide a view controller from which to present.", buf, 0xCu);

          }
          (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
        }

        goto LABEL_23;
      }
      IAMLogCategoryDefault();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v22;
        v23 = "Unable to display modal message = %{public}@. Host app has denied modal presentation.";
        goto LABEL_21;
      }
    }
    else
    {
      IAMLogCategoryDefault();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v22;
        v23 = "Unable to display modal message = %{public}@. No application context provided to message coordinator.";
LABEL_21:
        _os_log_impl(&dword_20DD38000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);

      }
    }

    (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
LABEL_23:

    goto LABEL_24;
  }
LABEL_7:
  (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
LABEL_24:

}

- (void)setMessageGroupsByGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (IAMModalTarget)initWithMessageCoordinator:(id)a3 targetIdentifier:(id)a4
{
  id v6;
  id v7;
  IAMModalTarget *v8;
  NSDictionary *messageGroupsByGroupIdentifier;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IAMModalTarget;
  v8 = -[IAMModalTarget init](&v11, sel_init);
  if (v8)
  {
    objc_msgSend((id)_allModalTargets, "addObject:", v8);
    objc_storeWeak((id *)&v8->_messageCoordinator, v6);
    objc_storeStrong((id *)&v8->_targetIdentifier, a4);
    messageGroupsByGroupIdentifier = v8->_messageGroupsByGroupIdentifier;
    v8->_messageGroupsByGroupIdentifier = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v8;
}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)_allModalTargets;
    _allModalTargets = v2;

  }
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)_allModalTargets, "removeObject:", self);
  v3.receiver = self;
  v3.super_class = (Class)IAMModalTarget;
  -[IAMModalTarget dealloc](&v3, sel_dealloc);
}

uint64_t __104__IAMModalTarget_messageCoordinator_didUpdatePriorityMessage_fromMessageEntry_forTarget_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 forTarget:(id)a5
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("IAMModalTarget requires a message entry, messageCoordinator:didUpdatePriorityMessage:forTarget: should not be called: %@"), a5, self);
}

- (void)webMessagePresentationCoordinatorWebMessageDidLoad:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  IAMWebMessagePresentationCoordinator *webMessagePresentationCoordinator;
  uint8_t v10[16];

  v4 = a3;
  -[IAMModalTarget presentingMessageContext](self, "presentingMessageContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(v4, "present"))
    {
      objc_msgSend(v5, "message");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IAMModalTarget _reportMessageDidAppearWithIdentifier:](self, "_reportMessageDidAppearWithIdentifier:", v7);

    }
    else
    {
      -[IAMWebMessagePresentationCoordinator setDelegate:](self->_webMessagePresentationCoordinator, "setDelegate:", 0);
      webMessagePresentationCoordinator = self->_webMessagePresentationCoordinator;
      self->_webMessagePresentationCoordinator = 0;

      -[IAMModalTarget setPresentingMessageContext:](self, "setPresentingMessageContext:", 0);
    }
  }
  else
  {
    IAMLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20DD38000, v8, OS_LOG_TYPE_ERROR, "Unable to present web modal message, no presenting message context.", v10, 2u);
    }

  }
}

- (void)webMessagePresentationCoordinatorWebMessageDidFail:(id)a3
{
  IAMWebMessagePresentationCoordinator *webMessagePresentationCoordinator;

  -[IAMWebMessagePresentationCoordinator setDelegate:](self->_webMessagePresentationCoordinator, "setDelegate:", 0);
  webMessagePresentationCoordinator = self->_webMessagePresentationCoordinator;
  self->_webMessagePresentationCoordinator = 0;

  -[IAMModalTarget setPresentingMessageContext:](self, "setPresentingMessageContext:", 0);
}

- (void)webMessagePresentationCoordinatorWebMessageDidFinishPresentation:(id)a3
{
  IAMWebMessagePresentationCoordinator *webMessagePresentationCoordinator;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  -[IAMWebMessagePresentationCoordinator setDelegate:](self->_webMessagePresentationCoordinator, "setDelegate:", 0);
  webMessagePresentationCoordinator = self->_webMessagePresentationCoordinator;
  self->_webMessagePresentationCoordinator = 0;

  -[IAMModalTarget presentingMessageContext](self, "presentingMessageContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "message");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject identifier](v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IAMModalTarget _reportMessageDidDisappearWithIdentifier:](self, "_reportMessageDidDisappearWithIdentifier:", v8);

  }
  else
  {
    IAMLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20DD38000, v7, OS_LOG_TYPE_ERROR, "Unable to report web modal message disappearance, no presenting message context.", v9, 2u);
    }
  }

  -[IAMModalTarget setPresentingMessageContext:](self, "setPresentingMessageContext:", 0);
}

- (void)webMessagePresentationCoordinatorWebMessageDidReportEvent:(id)a3 event:(id)a4
{
  IAMMessageCoordinator **p_messageCoordinator;
  id v5;
  id WeakRetained;

  p_messageCoordinator = &self->_messageCoordinator;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_messageCoordinator);
  objc_msgSend(WeakRetained, "reportMetricsEvent:", v5);

}

- (void)webMessagePresentationCoordinatorWebMessageDidRequestAction:(id)a3 actionConfiguration:(id)a4
{
  id v5;
  NSObject *v6;
  IAMMessageCoordinator **p_messageCoordinator;
  id WeakRetained;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  IAMLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v5;
    _os_log_impl(&dword_20DD38000, v6, OS_LOG_TYPE_DEFAULT, "Web modal message requested action = %{public}@", (uint8_t *)&v11, 0xCu);
  }

  p_messageCoordinator = &self->_messageCoordinator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageCoordinator);
  objc_msgSend(WeakRetained, "applicationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_messageCoordinator);
    objc_msgSend(v9, "messageCoordinator:didRequestAction:", v10, v5);

  }
}

- (void)messageGroup:(id)a3 didReportModalMessageWithIdentifier:(id)a4 actionWasPerformedWithIdentifier:(id)a5
{
  IAMMessageCoordinator **p_messageCoordinator;
  id v8;
  id v9;
  id WeakRetained;

  p_messageCoordinator = &self->_messageCoordinator;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_messageCoordinator);
  objc_msgSend(WeakRetained, "reportMessageWithIdentifier:actionWasPerformedWithIdentifier:fromTargetWithIdentifier:", v9, v8, self->_targetIdentifier);

}

- (void)messageGroup:(id)a3 didReportModalMessagePresentationFailedWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  IAMLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "groupIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_20DD38000, v8, OS_LOG_TYPE_ERROR, "Message group with identifier = %{public}@ reported failure to present modal message with identifier = %{public}@.", (uint8_t *)&v10, 0x16u);

  }
  -[IAMModalTarget setPresentingMessageContext:](self, "setPresentingMessageContext:", 0);

}

- (void)messageGroup:(id)a3 didReportModalMessageWasPresentedWithIdentifier:(id)a4
{
  -[IAMModalTarget _reportMessageDidAppearWithIdentifier:](self, "_reportMessageDidAppearWithIdentifier:", a4);
}

- (void)messageGroup:(id)a3 didReportModalMessageWasDismissedWithIdentifier:(id)a4
{
  -[IAMModalTarget _reportMessageDidDisappearWithIdentifier:](self, "_reportMessageDidDisappearWithIdentifier:", a4);
  -[IAMModalTarget setPresentingMessageContext:](self, "setPresentingMessageContext:", 0);
}

- (void)setPresentingMessageContext:(id)a3
{
  IAMPresentingModalMessageContext *v5;
  IAMPresentingModalMessageContext *presentingMessageContext;
  IAMPresentingModalMessageContext **p_presentingMessageContext;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (IAMPresentingModalMessageContext *)a3;
  p_presentingMessageContext = &self->_presentingMessageContext;
  presentingMessageContext = self->_presentingMessageContext;
  if (presentingMessageContext != v5)
  {
    if (presentingMessageContext)
    {
      -[IAMPresentingModalMessageContext messageGroup](presentingMessageContext, "messageGroup");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "setInternalDelegate:", 0);
      -[IAMPresentingModalMessageContext presentationExpirationTimer](*p_presentingMessageContext, "presentationExpirationTimer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        objc_msgSend(v10, "invalidate");
      IAMLogCategoryDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[IAMPresentingModalMessageContext message](*p_presentingMessageContext, "message");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v14;
        _os_log_impl(&dword_20DD38000, v12, OS_LOG_TYPE_DEFAULT, "Finishing presentation of message with identifier = %{public}@.", (uint8_t *)&v20, 0xCu);

      }
    }
    if (v5)
    {
      -[IAMPresentingModalMessageContext messageGroup](v5, "messageGroup");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        objc_msgSend(v15, "setInternalDelegate:", self);
      IAMLogCategoryDefault();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[IAMPresentingModalMessageContext message](v5, "message");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v19;
        _os_log_impl(&dword_20DD38000, v17, OS_LOG_TYPE_DEFAULT, "Starting presentation of message with identifier = %{public}@.", (uint8_t *)&v20, 0xCu);

      }
    }
    objc_storeStrong((id *)p_presentingMessageContext, a3);
  }

}

- (void)_reportMessageDidAppearWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  IAMLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_20DD38000, v5, OS_LOG_TYPE_DEFAULT, "Modal message appeared with identifier = %{public}@.", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_messageCoordinator);
  objc_msgSend(WeakRetained, "reportMessageDidAppearWithIdentifier:fromTargetWithIdentifier:", v4, self->_targetIdentifier);

}

- (void)_reportMessageDidDisappearWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  IAMLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_20DD38000, v5, OS_LOG_TYPE_DEFAULT, "Modal message disappeared with identifier = %{public}@.", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_messageCoordinator);
  objc_msgSend(WeakRetained, "reportMessageDidDisappearWithIdentifier:fromTargetWithIdentifier:", v4, self->_targetIdentifier);

}

- (void)_presentMessage:(id)a3 messageEntry:(id)a4 fromViewController:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  IAMPresentingModalMessageContext *v16;
  void *v17;
  void *v18;
  void *v19;
  IAMPresentingModalMessageContext *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  IAMPresentingModalMessageContext *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "applicationMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasWebArchiveURL");

  if (v15)
  {
    v16 = -[IAMPresentingModalMessageContext initWithMessage:messageGroup:presentingViewController:presentationExpirationTimer:presentationHandler:]([IAMPresentingModalMessageContext alloc], "initWithMessage:messageGroup:presentingViewController:presentationExpirationTimer:presentationHandler:", v10, 0, v12, 0, 0);
    -[IAMModalTarget setPresentingMessageContext:](self, "setPresentingMessageContext:", v16);

    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke;
    v33[3] = &unk_24C871490;
    v34 = v13;
    -[IAMModalTarget _presentWebModalMessageEntry:withCompletion:](self, "_presentWebModalMessageEntry:withCompletion:", v11, v33);
    v17 = v34;
  }
  else
  {
    objc_msgSend(v10, "messageGroupIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_messageGroupsByGroupIdentifier, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if (objc_msgSend(v18, "shouldPerformModalMessagePresentation"))
      {
        v20 = -[IAMPresentingModalMessageContext initWithMessage:messageGroup:presentingViewController:presentationExpirationTimer:presentationHandler:]([IAMPresentingModalMessageContext alloc], "initWithMessage:messageGroup:presentingViewController:presentationExpirationTimer:presentationHandler:", v10, v19, v12, 0, 0);
        -[IAMModalTarget setPresentingMessageContext:](self, "setPresentingMessageContext:", v20);

        objc_msgSend(v19, "performModalMessagePresentation:fromViewController:", v10, v12);
        (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
      }
      else
      {
        objc_initWeak((id *)buf, self);
        v23 = (void *)MEMORY[0x24BDBCF40];
        v24 = MEMORY[0x24BDAC760];
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_12;
        v31[3] = &unk_24C8714E0;
        objc_copyWeak(&v32, (id *)buf);
        objc_msgSend(v23, "scheduledTimerWithTimeInterval:repeats:block:", 0, v31, 5.0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v24;
        v29[1] = 3221225472;
        v29[2] = __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_3;
        v29[3] = &unk_24C871508;
        objc_copyWeak(&v30, (id *)buf);
        v25 = (void *)MEMORY[0x212BB42FC](v29);
        v26 = -[IAMPresentingModalMessageContext initWithMessage:messageGroup:presentingViewController:presentationExpirationTimer:presentationHandler:]([IAMPresentingModalMessageContext alloc], "initWithMessage:messageGroup:presentingViewController:presentationExpirationTimer:presentationHandler:", v10, v19, v12, v28, v25);
        -[IAMModalTarget setPresentingMessageContext:](self, "setPresentingMessageContext:", v26);

        -[IAMPresentingModalMessageContext presentationHandler](self->_presentingMessageContext, "presentationHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "viewControllerForModalMessagePresentation:completion:", v10, v27);

        (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
        objc_destroyWeak(&v30);

        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      IAMLogCategoryDefault();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v22;
        v37 = 2114;
        v38 = v17;
        _os_log_impl(&dword_20DD38000, v21, OS_LOG_TYPE_DEFAULT, "Unable to display modal message = %{public}@. No message group for identifier = %{public}@.", buf, 0x16u);

      }
      (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
    }

  }
}

uint64_t __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_12(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_2;
  block[3] = &unk_24C8714B8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePresentingMessageContextDidExpireBeforePresentation");

}

void __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_4;
  v5[3] = &unk_24C871070;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handlePresentation:", *(_QWORD *)(a1 + 32));

}

- (id)_applicationViewControllerForModalPresentation
{
  IAMMessageCoordinator **p_messageCoordinator;
  id WeakRetained;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;

  p_messageCoordinator = &self->_messageCoordinator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageCoordinator);
  objc_msgSend(WeakRetained, "applicationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_messageCoordinator);
    objc_msgSend(v6, "applicationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerForModalPresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_presentWebModalMessageEntry:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  IAMWebMessagePresentationCoordinator *v19;
  IAMWebMessagePresentationCoordinator *webMessagePresentationCoordinator;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  objc_msgSend(v6, "applicationMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedLocationForResourceWithIdentifier:", *MEMORY[0x24BEC85B8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_6;
  IAMLogCategoryDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v11;
    _os_log_impl(&dword_20DD38000, v10, OS_LOG_TYPE_ERROR, "Unable to display message: %{public}@ webarchive from cache. Attempting to find webarchive in host bundle", (uint8_t *)&v23, 0xCu);

  }
  objc_msgSend(v8, "webArchiveURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLForResource:withExtension:", v9, CFSTR("webarchive"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLByStandardizingPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "absoluteString");
    v17 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v17;
LABEL_6:
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[IAMWebMessagePresentationCoordinator initWithWebMessageEntry:webArchiveURL:]([IAMWebMessagePresentationCoordinator alloc], "initWithWebMessageEntry:webArchiveURL:", v6, v18);
    webMessagePresentationCoordinator = self->_webMessagePresentationCoordinator;
    self->_webMessagePresentationCoordinator = v19;

    -[IAMWebMessagePresentationCoordinator setDelegate:](self->_webMessagePresentationCoordinator, "setDelegate:", self);
    -[IAMWebMessagePresentationCoordinator load](self->_webMessagePresentationCoordinator, "load");
    v7[2](v7, 1);

    goto LABEL_7;
  }
  -[IAMModalTarget setPresentingMessageContext:](self, "setPresentingMessageContext:", 0);
  IAMLogCategoryDefault();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v22;
    v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_20DD38000, v21, OS_LOG_TYPE_ERROR, "Unable to display message = %{public}@ and webarchive = %{public}@ No local webarchive in bundle.", (uint8_t *)&v23, 0x16u);

  }
  v7[2](v7, 0);
LABEL_7:

}

- (void)_handlePresentingMessageContextDidExpireBeforePresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[IAMModalTarget presentingMessageContext](self, "presentingMessageContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IAMLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_20DD38000, v6, OS_LOG_TYPE_ERROR, "Couldn't present modal message with identifier = %{public}@, view controller to present not provided before context expired.", (uint8_t *)&v8, 0xCu);

    }
  }
  -[IAMModalTarget setPresentingMessageContext:](self, "setPresentingMessageContext:", 0);

}

- (void)_handlePresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IAMModalTarget presentingMessageContext](self, "presentingMessageContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "presentationExpirationTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    objc_msgSend(v6, "presentingViewController");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (v8)
      {
        -[NSObject presentViewController:animated:completion:](v8, "presentViewController:animated:completion:", v4, 1, 0);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[IAMModalTarget _reportMessageDidAppearWithIdentifier:](self, "_reportMessageDidAppearWithIdentifier:", v10);

        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_presentationControllerDismissalTransitionDidEnd_, *MEMORY[0x24BDF7C70], v4);

LABEL_13:
        goto LABEL_14;
      }
      IAMLogCategoryDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        v14 = "Couldn't present modal message with identifier = %{public}@, presenting view controller has been deallocated.";
        goto LABEL_11;
      }
    }
    else
    {
      IAMLogCategoryDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        v14 = "Couldn't present modal message with identifier = %{public}@, no view controller to present.";
LABEL_11:
        _os_log_impl(&dword_20DD38000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v15, 0xCu);

      }
    }

    -[IAMModalTarget setPresentingMessageContext:](self, "setPresentingMessageContext:", 0);
    goto LABEL_13;
  }
  IAMLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_20DD38000, v8, OS_LOG_TYPE_ERROR, "Couldn't present modal message, no presenting message context.", (uint8_t *)&v15, 2u);
  }
LABEL_14:

}

- (void)presentationControllerDismissalTransitionDidEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDF7C68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDF7C70];
    objc_msgSend(v4, "object");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, v9, v10);

    -[IAMModalTarget presentingMessageContext](self, "presentingMessageContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "message");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IAMModalTarget _reportMessageDidDisappearWithIdentifier:](self, "_reportMessageDidDisappearWithIdentifier:", v14);

      -[IAMModalTarget setPresentingMessageContext:](self, "setPresentingMessageContext:", 0);
    }
    else
    {
      IAMLogCategoryDefault();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_20DD38000, v15, OS_LOG_TYPE_ERROR, "Unable to report modal message disappearance, no presenting message context.", v16, 2u);
      }

    }
  }

}

+ (BOOL)isAnyModalTargetPresentingMessage
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)_allModalTargets;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (*(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * i) + 24))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (IAMPresentingModalMessageContext)presentingMessageContext
{
  return self->_presentingMessageContext;
}

- (NSDictionary)messageGroupsByGroupIdentifier
{
  return self->_messageGroupsByGroupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageGroupsByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingMessageContext, 0);
  objc_storeStrong((id *)&self->_webMessagePresentationCoordinator, 0);
  objc_destroyWeak((id *)&self->_messageCoordinator);
}

@end
