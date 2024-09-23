@implementation GKPlayerPickerViewController

- (GKPlayerPickerViewController)initWithContext:(id)a3
{
  id v5;
  GKPlayerPickerViewController *v6;
  GKPlayerPickerViewController *v7;
  GKMatchmakerViewController *v8;
  GKMatchmakerViewController *matchmakerVC;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKPlayerPickerViewController;
  v6 = -[GKPlayerPickerViewController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = -[GKMatchmakerViewController initWithPlayerPickerDelegate:andPlayerPickerContext:]([GKMatchmakerViewController alloc], "initWithPlayerPickerDelegate:andPlayerPickerContext:", v7, v5);
    matchmakerVC = v7->_matchmakerVC;
    v7->_matchmakerVC = v8;

    -[GKMatchmakerViewController setMatchmakerDelegate:](v7->_matchmakerVC, "setMatchmakerDelegate:", v7);
  }

  return v7;
}

- (GKPlayerPickerViewController)initWithMaxPlayers:(int64_t)a3
{
  return (GKPlayerPickerViewController *)-[GKPlayerPickerViewController _initWithMaxPlayers:excludedPlayers:](self, "_initWithMaxPlayers:excludedPlayers:", a3, 0);
}

- (id)_initWithMaxPlayers:(int64_t)a3 excludedPlayers:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  GKPlayerPickerViewController *v9;

  v6 = (objc_class *)MEMORY[0x1E0D25B18];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setMaxPlayers:", a3);
  objc_msgSend(v8, "setExcludedPlayers:", v7);

  objc_msgSend(v8, "setPickerOrigin:", 0);
  v9 = -[GKPlayerPickerViewController initWithContext:](self, "initWithContext:", v8);

  return v9;
}

- (GKPlayerPickerViewController)initWithMatch:(id)a3 maxPlayers:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  GKPlayerPickerViewController *v10;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D25B18]);
  objc_msgSend(v7, "setMaxPlayers:", a4);
  objc_msgSend(v7, "setPickerOrigin:", 2);
  objc_msgSend(v6, "players");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "players");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExcludedPlayers:", v9);

  }
  objc_msgSend(v7, "setMatch:", v6);
  v10 = -[GKPlayerPickerViewController initWithContext:](self, "initWithContext:", v7);

  return v10;
}

- (id)matchmaker
{
  return (id)objc_msgSend(MEMORY[0x1E0D25350], "sharedMatchmaker");
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GKPlayerPickerViewController;
  -[GKPlayerPickerViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[GKPlayerPickerViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maxPlayers");

  if (v4 <= 0)
  {
    -[GKPlayerPickerViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 0;
    objc_msgSend(v12, "setOpacity:", v14);
  }
  else
  {
    -[GKPlayerPickerViewController matchmakerVC](self, "matchmakerVC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerPickerViewController addChildViewController:](self, "addChildViewController:", v5);

    -[GKPlayerPickerViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerPickerViewController matchmakerVC](self, "matchmakerVC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v8);

    -[GKPlayerPickerViewController matchmakerVC](self, "matchmakerVC");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didMoveToParentViewController:", self);

    v10 = (void *)MEMORY[0x1E0CB3718];
    -[GKPlayerPickerViewController matchmakerVC](self, "matchmakerVC");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerPickerViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v12, v13);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GKPlayerPickerViewController;
  -[GKPlayerPickerViewController viewWillAppear:](&v15, sel_viewWillAppear_, a3);
  -[GKPlayerPickerViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maxPlayers");

  if (v5 <= 0)
  {
    if (!*MEMORY[0x1E0D25460])
      v6 = (id)GKOSLoggers();
    v7 = *MEMORY[0x1E0D25448];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
      -[GKPlayerPickerViewController viewWillAppear:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    -[GKPlayerPickerViewController internalPlayerPickerDidCancel](self, "internalPlayerPickerDidCancel");
  }
}

- (void)internalPlayerPickerDidPickPlayers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKPlayerPickerViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "match");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v4);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v52 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v56;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v56 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v12);
          -[GKPlayerPickerViewController matchmaker](self, "matchmaker");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "cancelPendingInviteToPlayer:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      }
      while (v10);
    }

    v15 = objc_alloc_init(MEMORY[0x1E0D25340]);
    objc_msgSend(v15, "setRecipients:", v7);
    -[GKPlayerPickerViewController context](self, "context");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "match");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "players");
    v51 = (void *)v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    -[GKPlayerPickerViewController context](self, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "match");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "expectedPlayerCount");
    -[GKPlayerPickerViewController matchmaker](self, "matchmaker");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allInvitedInvitees");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMinPlayers:", v17 + v20 + objc_msgSend(v22, "count") + 1);

    objc_msgSend(v15, "setMaxPlayers:", objc_msgSend(v8, "count") + objc_msgSend(v15, "minPlayers"));
    -[GKPlayerPickerViewController matchmaker](self, "matchmaker");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerPickerViewController context](self, "context");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "match");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __67__GKPlayerPickerViewController_internalPlayerPickerDidPickPlayers___block_invoke;
    v53[3] = &unk_1E59C45D8;
    v54 = v15;
    v26 = v15;
    objc_msgSend(v23, "addPlayersToMatch:matchRequest:completionHandler:", v25, v26, v53);

    v4 = v52;
  }
  -[GKPlayerPickerViewController delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[GKPlayerPickerViewController delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_opt_respondsToSelector();

    if ((v29 & 1) != 0)
    {
      -[GKPlayerPickerViewController delegate](self, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "playerPickerViewController:didPickPlayers:", self, v4);

    }
    else
    {
      if (!*MEMORY[0x1E0D25460])
        v39 = (id)GKOSLoggers();
      v40 = *MEMORY[0x1E0D25448];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
        -[GKPlayerPickerViewController internalPlayerPickerDidPickPlayers:].cold.2(v40, v41, v42, v43, v44, v45, v46, v47);
    }
  }
  else
  {
    if (!*MEMORY[0x1E0D25460])
      v31 = (id)GKOSLoggers();
    v32 = *MEMORY[0x1E0D25448];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
      -[GKPlayerPickerViewController internalPlayerPickerDidPickPlayers:].cold.1((uint64_t)self, v32, v33, v34, v35, v36, v37, v38);
  }
  -[GKPlayerPickerViewController matchmaker](self, "matchmaker");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "stopBrowsingForNearbyPlayers");

}

void __67__GKPlayerPickerViewController_internalPlayerPickerDidPickPlayers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  if (!*MEMORY[0x1E0D25460])
    v4 = (id)GKOSLoggers();
  v5 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_ERROR))
    __67__GKPlayerPickerViewController_internalPlayerPickerDidPickPlayers___block_invoke_cold_1(a1, (uint64_t)v3, v5);

}

- (void)internalPlayerPickerDidCancel
{
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, a1, a3, "<Warning>: playerPickerViewControllerWasCancelled: delegate method not implemented for GKPlayerPickerViewController", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)matchmakerViewController:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  v6 = a4;
  if (!*MEMORY[0x1E0D25460])
    v7 = (id)GKOSLoggers();
  v8 = *MEMORY[0x1E0D25450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
    -[GKPlayerPickerViewController matchmakerViewController:didFailWithError:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

}

- (GKPlayerPickerDelegate)delegate
{
  return (GKPlayerPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GKPlayerPickerContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (GKMatchmakerViewController)matchmakerVC
{
  return self->_matchmakerVC;
}

- (void)setMatchmakerVC:(id)a3
{
  objc_storeStrong((id *)&self->_matchmakerVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchmakerVC, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewWillAppear:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, a1, a3, "<Error>: Invalid parameters for GKPlayerPickerViewController.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)internalPlayerPickerDidPickPlayers:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "<Warning>: delegate not found for GKPlayerPickerViewController instance: %{public}p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)internalPlayerPickerDidPickPlayers:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, a1, a3, "<Warning>: playerPickerViewController:didPickPlayers: delegate method not implemented for GKPlayerPickerViewController", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __67__GKPlayerPickerViewController_internalPlayerPickerDidPickPlayers___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1AB361000, log, OS_LOG_TYPE_ERROR, "Failed to add players in the player picker. request: %@, error: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)matchmakerViewController:(uint64_t)a3 didFailWithError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "Player Picker - matchmakerViewController:didFailWithError: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
