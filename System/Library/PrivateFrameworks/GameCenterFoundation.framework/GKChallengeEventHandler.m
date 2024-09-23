@implementation GKChallengeEventHandler

+ (GKChallengeEventHandler)challengeEventHandler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__GKChallengeEventHandler_challengeEventHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (challengeEventHandler_onceToken != -1)
    dispatch_once(&challengeEventHandler_onceToken, block);
  return (GKChallengeEventHandler *)(id)challengeEventHandler_sSharedChallengeEventHandler;
}

uint64_t __48__GKChallengeEventHandler_challengeEventHandler__block_invoke(uint64_t a1)
{
  GKChallengeEventHandler *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = objc_alloc_init(GKChallengeEventHandler);
  v3 = (void *)challengeEventHandler_sSharedChallengeEventHandler;
  challengeEventHandler_sSharedChallengeEventHandler = (uint64_t)v2;

  v4 = objc_alloc_init((Class)objc_msgSend(*(id *)(a1 + 32), "uiDelegateClass"));
  v5 = (void *)_block_invoke_sUIDelegate;
  _block_invoke_sUIDelegate = (uint64_t)v4;

  return objc_msgSend((id)challengeEventHandler_sSharedChallengeEventHandler, "setUiDelegate:", _block_invoke_sUIDelegate);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  void *v5;
  id v6;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);

    v5 = obj;
    if (v6 != obj)
    {
      objc_storeWeak((id *)&self->_delegate, obj);
      if (self->_pendingReceivedChallenge)
      {
        -[GKChallengeEventHandler receivedChallengeSelected:](self, "receivedChallengeSelected:");
        -[GKChallengeEventHandler setPendingReceivedChallenge:](self, "setPendingReceivedChallenge:", 0);
      }
      v5 = obj;
      if (self->_pendingCompletedChallenge)
      {
        -[GKChallengeEventHandler completedChallengeSelected:](self, "completedChallengeSelected:");
        -[GKChallengeEventHandler setPendingCompletedChallenge:](self, "setPendingCompletedChallenge:", 0);
        v5 = obj;
      }
    }
  }

}

- (void)receivedChallengeSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[GKChallengeEventHandler delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        +[GKChallenge challengeForInternalRepresentation:](GKChallenge, "challengeForInternalRepresentation:", v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localPlayerDidSelectChallenge:", v6);

      }
    }
    else
    {
      -[GKChallengeEventHandler setPendingReceivedChallenge:](self, "setPendingReceivedChallenge:", v7);
    }

    v4 = v7;
  }

}

- (void)completedChallengeSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v14 = v4;
    -[GKChallengeEventHandler delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[GKChallenge challengeForInternalRepresentation:](GKChallenge, "challengeForInternalRepresentation:", v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "receivingPlayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "internal");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "playerID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "internal");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playerID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "isEqualToString:", v12);

      if (v13)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v5, "localPlayerDidCompleteChallenge:", v6);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "remotePlayerDidCompleteChallenge:", v6);
      }

    }
    else
    {
      -[GKChallengeEventHandler setPendingCompletedChallenge:](self, "setPendingCompletedChallenge:", v14);
    }

    v4 = v14;
  }

}

- (void)challengeReceived:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  if (!v4)
    goto LABEL_12;
  +[GKChallenge challengeForInternalRepresentation:](GKChallenge, "challengeForInternalRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeEventHandler delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "infoDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("GKShowChallengeBanners"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "BOOLValue");
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (!v11)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__GKChallengeEventHandler_challengeReceived___block_invoke;
    v12[3] = &unk_1E75B1A78;
    v12[4] = self;
    v13 = v5;
    v14 = v4;
    -[GKChallengeEventHandler showBannerForChallenge:complete:](self, "showBannerForChallenge:complete:", v13, v12);

    goto LABEL_9;
  }
  if ((objc_msgSend(v6, "shouldShowBannerForLocallyReceivedChallenge:", v5) & 1) != 0)
    goto LABEL_8;
LABEL_9:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "localPlayerDidReceiveChallenge:", v5);

LABEL_12:
}

void __45__GKChallengeEventHandler_challengeReceived___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "localPlayerDidSelectChallenge:", *(_QWORD *)(a1 + 40));
  if (!v4)
    objc_msgSend(*(id *)(a1 + 32), "setPendingReceivedChallenge:", *(_QWORD *)(a1 + 48));
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventEmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player:wantsToPlayChallenge:", v2, *(_QWORD *)(a1 + 40));

}

- (void)challengeCompleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  GKChallengeEventHandler *v18;
  int v19;
  void *v20;
  GKChallengeEventHandler *v21;
  id v22;

  v4 = a3;
  if (!v4)
    goto LABEL_23;
  v22 = v4;
  +[GKChallenge challengeForInternalRepresentation:](GKChallenge, "challengeForInternalRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeEventHandler delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "infoDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v8;
  objc_msgSend(v8, "objectForKey:", CFSTR("GKShowChallengeBanners"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v21 = self;
  if (v9)
    v19 = objc_msgSend(v9, "BOOLValue");
  else
    v19 = 1;
  objc_msgSend(v5, "receivingPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playerID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "internal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playerID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "isEqualToString:", v16);

  if (!v17)
  {
    v18 = v21;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((objc_msgSend(v6, "shouldShowBannerForRemotelyCompletedChallenge:", v5) & 1) == 0)
      {
LABEL_18:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "remotePlayerDidCompleteChallenge:", v5);
        goto LABEL_20;
      }
    }
    else if (!v19)
    {
      goto LABEL_18;
    }
    -[GKChallengeEventHandler showBannerForChallenge:complete:](v21, "showBannerForChallenge:complete:", v5, 0);
    goto LABEL_18;
  }
  v18 = v21;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!v19)
      goto LABEL_14;
    goto LABEL_13;
  }
  if ((objc_msgSend(v6, "shouldShowBannerForLocallyCompletedChallenge:", v5) & 1) != 0)
LABEL_13:
    -[GKChallengeEventHandler showBannerForChallenge:complete:](v21, "showBannerForChallenge:complete:", v5, 0);
LABEL_14:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "localPlayerDidCompleteChallenge:", v5);
LABEL_20:
  if (!v6)
    -[GKChallengeEventHandler setPendingCompletedChallenge:](v18, "setPendingCompletedChallenge:", v22);

  v4 = v22;
LABEL_23:

}

- (void)showBannerForChallenge:(id)a3 complete:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "receivingPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "issuingPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "state") == 1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[GKChallengeEventHandlerUIDelegate showReceivedBannerForIssuingPlayer:challenge:handler:](self->_uiDelegate, "showReceivedBannerForIssuingPlayer:challenge:handler:", v8, v9, v6);
  }
  else if (objc_msgSend(v7, "isLocalPlayer"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[GKChallengeEventHandlerUIDelegate showLocallyCompletedBannerForIssuingPlayer:challenge:handler:](self->_uiDelegate, "showLocallyCompletedBannerForIssuingPlayer:challenge:handler:", v8, v9, v6);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GKChallengeEventHandlerUIDelegate showRemotelyCompletedBannerForReceivingPlayer:challenge:handler:](self->_uiDelegate, "showRemotelyCompletedBannerForReceivingPlayer:challenge:handler:", v7, v9, v6);
  }

}

- (GKChallengeEventHandlerUIDelegate)uiDelegate
{
  return self->_uiDelegate;
}

- (void)setUiDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_uiDelegate, a3);
}

- (GKChallengeInternal)pendingReceivedChallenge
{
  return self->_pendingReceivedChallenge;
}

- (void)setPendingReceivedChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_pendingReceivedChallenge, a3);
}

- (GKChallengeInternal)pendingCompletedChallenge
{
  return self->_pendingCompletedChallenge;
}

- (void)setPendingCompletedChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCompletedChallenge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCompletedChallenge, 0);
  objc_storeStrong((id *)&self->_pendingReceivedChallenge, 0);
  objc_storeStrong((id *)&self->_uiDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
