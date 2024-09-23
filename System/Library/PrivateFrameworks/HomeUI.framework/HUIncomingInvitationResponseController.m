@implementation HUIncomingInvitationResponseController

- (HUIncomingInvitationResponseController)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_invitation_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUIncomingInvitationResponseController.m"), 40, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUIncomingInvitationResponseController init]",
    v5);

  return 0;
}

- (HUIncomingInvitationResponseController)initWithDelegate:(id)a3 invitation:(id)a4
{
  id v6;
  id v7;
  HUIncomingInvitationResponseController *v8;
  HUIncomingInvitationResponseController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUIncomingInvitationResponseController;
  v8 = -[HUIncomingInvitationResponseController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_invitation, a4);
  }

  return v9;
}

- (void)setState:(unint64_t)a3
{
  void *v5;
  char v6;
  id v7;

  if (self->_state != a3)
  {
    self->_state = a3;
    -[HUIncomingInvitationResponseController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[HUIncomingInvitationResponseController delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "invitationResponseController:stateDidChange:", self, a3);

    }
  }
}

- (void)respondToInvitationWithResponse:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[6];
  _QWORD v10[5];
  _QWORD v11[6];

  if (-[HUIncomingInvitationResponseController state](self, "state"))
  {
    NSLog(CFSTR("Responding twice to the same invitation!"));
  }
  else
  {
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke;
    v11[3] = &unk_1E6F556F8;
    v11[4] = self;
    v11[5] = a3;
    __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke((uint64_t)v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke_2;
    v10[3] = &unk_1E6F502A0;
    v10[4] = self;
    objc_msgSend(v6, "addSuccessBlock:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke_3;
    v9[3] = &unk_1E6F4E568;
    v9[4] = self;
    v9[5] = a3;
    v8 = (id)objc_msgSend(v7, "addFailureBlock:", v9);

  }
}

id __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "setResponse:", *(_QWORD *)(a1 + 40));
  switch(*(_QWORD *)(a1 + 40))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "_acceptInvitation");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "_declineInvitation");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "_ignoreInvitation");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      objc_msgSend(*(id *)(a1 + 32), "_reportJunk");
      v2 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v6 = (void *)v2;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Unknown response %@"), v3);

      v4 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "futureWithError:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v6;
}

uint64_t __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
}

void __74__HUIncomingInvitationResponseController_respondToInvitationWithResponse___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((unint64_t)(*(_QWORD *)(a1 + 40) - 1) > 3)
    v3 = 0;
  else
    v3 = (id)*MEMORY[0x1E0D30A40];
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:operationType:options:retryBlock:cancelBlock:", v5, v3, 0, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);

}

- (id)_ignoreInvitation
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__HUIncomingInvitationResponseController__ignoreInvitation__block_invoke;
  v3[3] = &unk_1E6F4C5E8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __59__HUIncomingInvitationResponseController__ignoreInvitation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "invitation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring invite %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "invitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ignoreInviteWithCompletionHandler:", v3);

}

- (id)_declineInvitation
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__HUIncomingInvitationResponseController__declineInvitation__block_invoke;
  v3[3] = &unk_1E6F4C5E8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __60__HUIncomingInvitationResponseController__declineInvitation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "invitation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Declining invite %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "invitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelInviteWithCompletionHandler:", v3);

}

- (id)_acceptInvitation
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__HUIncomingInvitationResponseController__acceptInvitation__block_invoke;
  v3[3] = &unk_1E6F4C5E8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __59__HUIncomingInvitationResponseController__acceptInvitation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "invitation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Accepting invite %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "invitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "acceptInviteWithCompletionHandler:", v3);

}

- (id)_reportJunk
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__HUIncomingInvitationResponseController__reportJunk__block_invoke;
  v3[3] = &unk_1E6F4C5E8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __53__HUIncomingInvitationResponseController__reportJunk__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "invitation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Reporting invite as junk %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "invitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportJunkInviteWithCompletionHandler:", v3);

}

- (HUIncomingInvitationResponseControllerDelegate)delegate
{
  return (HUIncomingInvitationResponseControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMIncomingHomeInvitation)invitation
{
  return self->_invitation;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)response
{
  return self->_response;
}

- (void)setResponse:(unint64_t)a3
{
  self->_response = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
