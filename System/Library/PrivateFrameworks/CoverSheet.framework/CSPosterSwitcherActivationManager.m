@implementation CSPosterSwitcherActivationManager

- (CSPosterSwitcherActivationManager)initWithSource:(id)a3 delegate:(id)a4 unlockRequester:(id)a5
{
  id v8;
  id v9;
  id v10;
  CSPosterSwitcherActivationManager *v11;
  CSPosterSwitcherActivationManager *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CSPosterSwitcherActivationManager;
  v11 = -[CSPosterSwitcherActivationManager init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_source, v8);
    objc_storeWeak((id *)&v12->_delegate, v9);
    objc_storeStrong((id *)&v12->_unlockRequester, a5);
    v12->_hasBeenCoachedSinceReset = 0;
  }

  return v12;
}

- (void)activateWithHandler:(id)a3 onFailure:(id)a4
{
  void (**v6)(_QWORD);
  void (**v7)(id, const __CFString *, _QWORD);
  id WeakRetained;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  void (**v14)(_QWORD);
  void (**v15)(id, const __CFString *, _QWORD);

  v6 = (void (**)(_QWORD))a3;
  v7 = (void (**)(id, const __CFString *, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_source);
  objc_msgSend(WeakRetained, "posterSwitcherPresentationStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "state");
  switch(v10)
  {
    case 2:
      v7[2](v7, CFSTR("Poster switcher is already presented"), 0);
      break;
    case 1:
      v6[2](v6);
      break;
    case 0:
      v11 = objc_msgSend(v9, "notReadyReason");
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __67__CSPosterSwitcherActivationManager_activateWithHandler_onFailure___block_invoke;
      v12[3] = &unk_1E8E2FD20;
      v14 = v6;
      v15 = v7;
      v13 = v9;
      -[CSPosterSwitcherActivationManager _failActivationWithReason:completion:](self, "_failActivationWithReason:completion:", v11, v12);

      break;
  }

}

void __67__CSPosterSwitcherActivationManager_activateWithHandler_onFailure___block_invoke(uint64_t a1, int a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    NSStringForCSPosterSwitcherPresentationNotReadyReason(objc_msgSend(*(id *)(a1 + 32), "notReadyReason"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((a3 & 1) != 0)
      v6 = 0;
    else
      v6 = objc_msgSend(*(id *)(a1 + 32), "shouldProvideNotReadyFeedback");
    (*(void (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v7, v6);

  }
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "type");
  if (v4 == 25 || v4 == 12)
    -[CSPosterSwitcherActivationManager _resetUnauthenticatedActivationAttemptCount](self, "_resetUnauthenticatedActivationAttemptCount");
  return 0;
}

- (void)_resetUnauthenticatedActivationAttemptCount
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "PosterSwitcherActivationManager attempt count reset", v4, 2u);
  }

  self->_hasBeenCoachedSinceReset = 0;
}

- (void)_presentCoachingMessage:(unint64_t)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (a3 == 1)
  {
    v8 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("POSTER_SWITCHER_UNLOCK_TO_EDIT"), &stru_1E8E30B28, CFSTR("SpringBoardUIServices"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "posterSwitcherActivationManager:didChangeToCoachingText:", self, v7);

    goto LABEL_5;
  }
  if (!a3)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "posterSwitcherActivationManager:didChangeToCoachingText:", self, 0);
LABEL_5:
    WeakRetained = v8;
  }

}

- (void)_failActivationWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  CSUnlockRequesting *unlockRequester;
  id WeakRetained;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  if (a3 > 5)
    goto LABEL_4;
  if (a3 != 2)
  {
    -[CSPosterSwitcherActivationManager _resetUnauthenticatedActivationAttemptCount](self, "_resetUnauthenticatedActivationAttemptCount");
LABEL_4:
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
    goto LABEL_5;
  }
  if (self->_hasBeenCoachedSinceReset)
  {
    -[CSUnlockRequesting createUnlockRequest](self->_unlockRequester, "createUnlockRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIntent:", 2);
    objc_msgSend(v7, "setSource:", 25);
    objc_msgSend(v7, "setWantsBiometricPresentation:", 1);
    objc_msgSend(v7, "setConfirmedNotInPocket:", 1);
    unlockRequester = self->_unlockRequester;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__CSPosterSwitcherActivationManager__failActivationWithReason_completion___block_invoke;
    v10[3] = &unk_1E8E2E5A0;
    v10[4] = self;
    v11 = v6;
    -[CSUnlockRequesting unlockWithRequest:completion:](unlockRequester, "unlockWithRequest:completion:", v7, v10);

  }
  else
  {
    self->_hasBeenCoachedSinceReset = 1;
    -[CSPosterSwitcherActivationManager _presentCoachingMessage:](self, "_presentCoachingMessage:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, objc_msgSend(WeakRetained, "userPresenceDetectedSinceWake") ^ 1);

  }
LABEL_5:

}

void __74__CSPosterSwitcherActivationManager__failActivationWithReason_completion___block_invoke(uint64_t a1, int a2)
{
  dispatch_time_t v3;
  _QWORD block[4];
  id v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_resetUnauthenticatedActivationAttemptCount");
    v3 = dispatch_time(0, 150000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__CSPosterSwitcherActivationManager__failActivationWithReason_completion___block_invoke_2;
    block[3] = &unk_1E8E2DFD8;
    v5 = *(id *)(a1 + 40);
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __74__CSPosterSwitcherActivationManager__failActivationWithReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CSPosterSwitcherActivationSource)source
{
  return (CSPosterSwitcherActivationSource *)objc_loadWeakRetained((id *)&self->_source);
}

- (void)setSource:(id)a3
{
  objc_storeWeak((id *)&self->_source, a3);
}

- (CSPosterSwitcherActivationManagerDelegate)delegate
{
  return (CSPosterSwitcherActivationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSUnlockRequesting)unlockRequester
{
  return self->_unlockRequester;
}

- (void)setUnlockRequester:(id)a3
{
  objc_storeStrong((id *)&self->_unlockRequester, a3);
}

- (BOOL)hasBeenCoachedSinceReset
{
  return self->_hasBeenCoachedSinceReset;
}

- (void)setHasBeenCoachedSinceReset:(BOOL)a3
{
  self->_hasBeenCoachedSinceReset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockRequester, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_source);
}

@end
