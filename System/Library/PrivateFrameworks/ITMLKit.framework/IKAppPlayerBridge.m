@implementation IKAppPlayerBridge

- (void)setAppPlayer:(id)a3
{
  IKAppPlayer **p_appPlayer;
  id v5;

  p_appPlayer = &self->_appPlayer;
  v5 = a3;
  objc_storeWeak((id *)p_appPlayer, v5);
  -[_IKPlaceholderAppPlayer transferValuesToAppPlayer:](self->_placeholderAppPlayer, "transferValuesToAppPlayer:", v5);

}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3;
  IKJSPlayer *v4;
  void *v5;
  IKJSPlayer *v6;

  v3 = a3;
  v4 = [IKJSPlayer alloc];
  objc_msgSend(v3, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSPlayer initWithAppContext:bridge:](v4, "initWithAppContext:bridge:", v5, v3);

  objc_msgSend(v3, "setJsPlayer:", v6);
  return v6;
}

- (IKAppPlayerBridge)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6;
  void *v7;
  IKAppPlayerBridge *v8;
  uint64_t v9;
  NSString *featureName;
  _IKPlaceholderAppPlayer *v11;
  _IKPlaceholderAppPlayer *placeholderAppPlayer;

  v6 = a4;
  objc_msgSend(a3, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IKAppPlayerBridge initWithAppContext:jsPlayer:](self, "initWithAppContext:jsPlayer:", v7, 0);

  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v9;

    v11 = objc_alloc_init(_IKPlaceholderAppPlayer);
    placeholderAppPlayer = v8->_placeholderAppPlayer;
    v8->_placeholderAppPlayer = v11;

    objc_storeWeak((id *)&v8->_appPlayer, 0);
  }

  return v8;
}

- (IKAppPlayerBridge)initWithAppContext:(id)a3 jsPlayer:(id)a4
{
  id v6;
  id v7;
  IKAppPlayerBridge *v8;
  IKAppPlayerBridge *v9;
  _IKPlaceholderAppPlayer *v10;
  id WeakRetained;
  id *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id *v19;
  _IKPlaceholderAppPlayer *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)IKAppPlayerBridge;
  v8 = -[IKAppPlayerBridge init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_appContext, v6);
    objc_storeWeak((id *)&v9->_jsPlayer, v7);
    v9->_interactiveOverlayDismissable = 1;
    v9->_showsResumeMenu = 1;
    v10 = objc_alloc_init(_IKPlaceholderAppPlayer);
    -[_IKPlaceholderAppPlayer setInteractiveOverlayDismissable:](v10, "setInteractiveOverlayDismissable:", v9->_interactiveOverlayDismissable);
    -[_IKPlaceholderAppPlayer setShowsResumeMenu:](v10, "setShowsResumeMenu:", v9->_showsResumeMenu);
    objc_storeStrong((id *)&v9->_placeholderAppPlayer, v10);
    if (v7)
    {
      if (initWithAppContext_jsPlayer__onceToken != -1)
        dispatch_once(&initWithAppContext_jsPlayer__onceToken, &__block_literal_global_460);
      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__8;
      v26 = __Block_byref_object_dispose__8;
      v27 = 0;
      WeakRetained = objc_loadWeakRetained((id *)&v9->_appContext);
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __49__IKAppPlayerBridge_initWithAppContext_jsPlayer___block_invoke_462;
      v17 = &unk_1E9F4C7B0;
      v21 = &v22;
      v18 = v6;
      v12 = v9;
      v19 = v12;
      v20 = v10;
      objc_msgSend(WeakRetained, "evaluateDelegateBlockSync:", &v14);

      objc_msgSend((id)_globalAppPlayers, "addObject:", v23[5], v14, v15, v16, v17);
      objc_storeWeak(v12 + 6, (id)v23[5]);

      _Block_object_dispose(&v22, 8);
    }

  }
  return v9;
}

void __49__IKAppPlayerBridge_initWithAppContext_jsPlayer___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
  v1 = (void *)_globalAppPlayers;
  _globalAppPlayers = v0;

}

uint64_t __49__IKAppPlayerBridge_initWithAppContext_jsPlayer___block_invoke_462(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForPlayer:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return objc_msgSend(*(id *)(a1 + 48), "transferValuesToAppPlayer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
}

- (void)cleanup
{
  id WeakRetained;
  id v4;
  _IKPlaceholderAppPlayer *v5;
  id v6;
  void *v7;
  id v8;
  _IKPlaceholderAppPlayer *placeholderAppPlayer;
  _QWORD v10[6];

  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", &__block_literal_global_465);
  WeakRetained = objc_loadWeakRetained((id *)&self->_appPlayer);
  if (WeakRetained)
  {

  }
  else if (!self->_placeholderAppPlayer)
  {
    return;
  }
  v4 = objc_loadWeakRetained((id *)&self->_appPlayer);
  v5 = self->_placeholderAppPlayer;
  v6 = objc_loadWeakRetained((id *)&self->_appPlayer);

  if (v6)
  {
    v7 = (void *)_globalAppPlayers;
    v8 = objc_loadWeakRetained((id *)&self->_appPlayer);
    objc_msgSend(v7, "removeObject:", v8);

  }
  objc_storeWeak((id *)&self->_appPlayer, 0);
  placeholderAppPlayer = self->_placeholderAppPlayer;
  self->_placeholderAppPlayer = 0;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __28__IKAppPlayerBridge_cleanup__block_invoke_2;
  v10[3] = &__block_descriptor_48_e5_v8__0l;
  v10[4] = v4;
  v10[5] = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);
}

void __28__IKAppPlayerBridge_cleanup__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "appPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanup");

}

void __28__IKAppPlayerBridge_cleanup__block_invoke_2(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

- (void)play
{
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", &__block_literal_global_467);
}

void __25__IKAppPlayerBridge_play__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "appPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "play");

}

- (void)present
{
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", &__block_literal_global_468);
}

void __28__IKAppPlayerBridge_present__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "appPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "present");

}

- (void)pause
{
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", &__block_literal_global_469);
}

void __26__IKAppPlayerBridge_pause__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "appPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

}

- (void)stop
{
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", &__block_literal_global_470);
}

void __25__IKAppPlayerBridge_stop__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "appPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

}

- (void)next
{
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", &__block_literal_global_471);
}

void __25__IKAppPlayerBridge_next__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "appPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "next");

}

- (void)previous
{
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", &__block_literal_global_472);
}

void __29__IKAppPlayerBridge_previous__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "appPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previous");

}

- (void)changeToMediaAtIndex:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__IKAppPlayerBridge_changeToMediaAtIndex___block_invoke;
  v3[3] = &__block_descriptor_40_e44_v24__0__IKAppContext_8__IKAppPlayerBridge_16l;
  v3[4] = a3;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v3);
}

void __42__IKAppPlayerBridge_changeToMediaAtIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeToMediaAtIndex:", *(_QWORD *)(a1 + 32));

}

- (void)scan:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__IKAppPlayerBridge_scan___block_invoke;
  v3[3] = &__block_descriptor_40_e44_v24__0__IKAppContext_8__IKAppPlayerBridge_16l;
  *(double *)&v3[4] = a3;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v3);
}

void __26__IKAppPlayerBridge_scan___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scan:", *(double *)(a1 + 32));

}

- (void)setPlaylist:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  objc_storeStrong((id *)&self->_playlist, a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__IKAppPlayerBridge_setPlaylist___block_invoke;
  v7[3] = &unk_1E9F4C918;
  v8 = v5;
  v6 = v5;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v7);

}

void __33__IKAppPlayerBridge_setPlaylist___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)a3[1];
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "appPlaylist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaylist:", v7);

  objc_msgSend(v6, "appPlayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "appPlaylist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPlaylist:", v8);

}

- (void)setElapsedTime:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__IKAppPlayerBridge_setElapsedTime___block_invoke;
  v3[3] = &__block_descriptor_40_e44_v24__0__IKAppContext_8__IKAppPlayerBridge_16l;
  *(double *)&v3[4] = a3;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v3);
}

void __36__IKAppPlayerBridge_setElapsedTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setElapsedTime:", *(double *)(a1 + 32));

}

- (void)setOverlayDocument:(id)a3
{
  id v5;
  IKAppDocument *v6;
  id WeakRetained;
  id v8;
  IKAppDocument *v9;
  IKAppDocument *v10;
  _QWORD v11[4];
  IKAppDocument *v12;

  v5 = a3;
  objc_storeStrong((id *)&self->_overlayDocument, a3);
  if (v5)
  {
    v6 = [IKAppDocument alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
    v8 = objc_loadWeakRetained((id *)&self->_jsPlayer);
    v9 = -[IKAppDocument initWithAppContext:document:owner:](v6, "initWithAppContext:document:owner:", WeakRetained, v5, v8);

  }
  else
  {
    v9 = 0;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__IKAppPlayerBridge_setOverlayDocument___block_invoke;
  v11[3] = &unk_1E9F4C918;
  v12 = v9;
  v10 = v9;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v11);

}

void __40__IKAppPlayerBridge_setOverlayDocument___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;

  v4 = (void *)a3[1];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v4, "setOverlayDocument:", v5);
  objc_msgSend(v6, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setOverlayDocument:", *(_QWORD *)(a1 + 32));
}

- (void)setInteractiveOverlayDismissable:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[4];
  BOOL v5;

  v3 = MEMORY[0x1E0C809B0];
  self->_interactiveOverlayDismissable = a3;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __54__IKAppPlayerBridge_setInteractiveOverlayDismissable___block_invoke;
  v4[3] = &__block_descriptor_33_e44_v24__0__IKAppContext_8__IKAppPlayerBridge_16l;
  v5 = a3;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
}

void __54__IKAppPlayerBridge_setInteractiveOverlayDismissable___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;

  v4 = (void *)a3[1];
  v5 = *(unsigned __int8 *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v4, "setInteractiveOverlayDismissable:", v5);
  objc_msgSend(v6, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setInteractiveOverlayDismissable:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setInteractiveOverlayDocument:(id)a3
{
  id v5;
  IKAppDocument *v6;
  id WeakRetained;
  id v8;
  IKAppDocument *v9;
  IKAppDocument *v10;
  _QWORD v11[4];
  IKAppDocument *v12;

  v5 = a3;
  objc_storeStrong((id *)&self->_interactiveOverlayDocument, a3);
  if (v5)
  {
    v6 = [IKAppDocument alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
    v8 = objc_loadWeakRetained((id *)&self->_jsPlayer);
    v9 = -[IKAppDocument initWithAppContext:document:owner:](v6, "initWithAppContext:document:owner:", WeakRetained, v5, v8);

  }
  else
  {
    v9 = 0;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__IKAppPlayerBridge_setInteractiveOverlayDocument___block_invoke;
  v11[3] = &unk_1E9F4C918;
  v12 = v9;
  v10 = v9;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v11);

}

void __51__IKAppPlayerBridge_setInteractiveOverlayDocument___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;

  v4 = (void *)a3[1];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v4, "setInteractiveOverlayDocument:", v5);
  objc_msgSend(v6, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setInteractiveOverlayDocument:", *(_QWORD *)(a1 + 32));
}

- (int64_t)state
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__IKAppPlayerBridge_state__block_invoke;
  v4[3] = &unk_1E9F4C960;
  v4[4] = &v5;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __26__IKAppPlayerBridge_state__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "state");

}

- (NSDate)currentMediaItemDate
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__IKAppPlayerBridge_currentMediaItemDate__block_invoke;
  v4[3] = &unk_1E9F4C960;
  v4[4] = &v5;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

void __41__IKAppPlayerBridge_currentMediaItemDate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMediaItemDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (NSNumber)currentMediaItemDuration
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__IKAppPlayerBridge_currentMediaItemDuration__block_invoke;
  v4[3] = &unk_1E9F4C960;
  v4[4] = &v5;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __45__IKAppPlayerBridge_currentMediaItemDuration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMediaItemDuration");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (IKAppMediaItemBridge)currentMediaItem
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__IKAppPlayerBridge_currentMediaItem__block_invoke;
  v4[3] = &unk_1E9F4C960;
  v4[4] = &v5;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  objc_msgSend((id)v6[5], "bridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v5, 8);

  return (IKAppMediaItemBridge *)v2;
}

void __37__IKAppPlayerBridge_currentMediaItem__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMediaItem");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (IKAppMediaItemBridge)nextMediaItem
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__IKAppPlayerBridge_nextMediaItem__block_invoke;
  v4[3] = &unk_1E9F4C960;
  v4[4] = &v5;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  objc_msgSend((id)v6[5], "bridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v5, 8);

  return (IKAppMediaItemBridge *)v2;
}

void __34__IKAppPlayerBridge_nextMediaItem__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextMediaItem");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (IKAppMediaItemBridge)previousMediaItem
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__IKAppPlayerBridge_previousMediaItem__block_invoke;
  v4[3] = &unk_1E9F4C960;
  v4[4] = &v5;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  objc_msgSend((id)v6[5], "bridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v5, 8);

  return (IKAppMediaItemBridge *)v2;
}

void __38__IKAppPlayerBridge_previousMediaItem__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousMediaItem");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (double)scanRate
{
  double v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__IKAppPlayerBridge_scanRate__block_invoke;
  v4[3] = &unk_1E9F4C960;
  v4[4] = &v5;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __29__IKAppPlayerBridge_scanRate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  objc_msgSend(a3, "appPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scanRate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;

}

- (NSArray)currentMediaItemAccessLogs
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__IKAppPlayerBridge_currentMediaItemAccessLogs__block_invoke;
  v4[3] = &unk_1E9F4C960;
  v4[4] = &v5;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __47__IKAppPlayerBridge_currentMediaItemAccessLogs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMediaItemAccessLogs");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (NSArray)currentMediaItemErrorLogs
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__IKAppPlayerBridge_currentMediaItemErrorLogs__block_invoke;
  v4[3] = &unk_1E9F4C960;
  v4[4] = &v5;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __46__IKAppPlayerBridge_currentMediaItemErrorLogs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMediaItemErrorLogs");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setShowsResumeMenu:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[4];
  BOOL v5;

  v3 = MEMORY[0x1E0C809B0];
  self->_showsResumeMenu = a3;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __40__IKAppPlayerBridge_setShowsResumeMenu___block_invoke;
  v4[3] = &__block_descriptor_33_e44_v24__0__IKAppContext_8__IKAppPlayerBridge_16l;
  v5 = a3;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
}

void __40__IKAppPlayerBridge_setShowsResumeMenu___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;

  v4 = (void *)a3[1];
  v5 = *(unsigned __int8 *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v4, "setShowsResumeMenu:", v5);
  objc_msgSend(v6, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setShowsResumeMenu:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setMuted:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[4];
  BOOL v5;

  v3 = MEMORY[0x1E0C809B0];
  self->_muted = a3;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __30__IKAppPlayerBridge_setMuted___block_invoke;
  v4[3] = &__block_descriptor_33_e44_v24__0__IKAppContext_8__IKAppPlayerBridge_16l;
  v5 = a3;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
}

void __30__IKAppPlayerBridge_setMuted___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;

  v4 = (void *)a3[1];
  v5 = *(unsigned __int8 *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v4, "setMuted:", v5);
  objc_msgSend(v6, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setMuted:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setContextMenuData:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *contextMenuData;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");
  contextMenuData = self->_contextMenuData;
  self->_contextMenuData = v5;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__IKAppPlayerBridge_setContextMenuData___block_invoke;
  v8[3] = &unk_1E9F4C918;
  v9 = v4;
  v7 = v4;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v8);

}

void __40__IKAppPlayerBridge_setContextMenuData___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;

  v4 = (void *)a3[1];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v4, "setContextMenuData:", v5);
  objc_msgSend(v6, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setContextMenuData:", *(_QWORD *)(a1 + 32));
}

- (void)setUserInfo:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *userInfo;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");
  userInfo = self->_userInfo;
  self->_userInfo = v5;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__IKAppPlayerBridge_setUserInfo___block_invoke;
  v8[3] = &unk_1E9F4C918;
  v9 = v4;
  v7 = v4;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v8);

}

void __33__IKAppPlayerBridge_setUserInfo___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)a3[1];
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setUserInfo:", v7);

  objc_msgSend(v6, "appPlayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v9, "setUserInfo:", v8);

}

- (void)startObservingEvent:(id)a3 extraInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__IKAppPlayerBridge_startObservingEvent_extraInfo___block_invoke;
  v10[3] = &unk_1E9F4C988;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v10);

}

void __51__IKAppPlayerBridge_startObservingEvent_extraInfo___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;

  v4 = (void *)a3[1];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(v4, "startObservingEvent:extraInfo:", v5, v6);
  objc_msgSend(v7, "appPlayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "startObservingEvent:extraInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)stopObservingEvent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__IKAppPlayerBridge_stopObservingEvent___block_invoke;
  v6[3] = &unk_1E9F4C918;
  v7 = v4;
  v5 = v4;
  -[IKAppPlayerBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __40__IKAppPlayerBridge_stopObservingEvent___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;

  v4 = (void *)a3[1];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v4, "stopObservingEvent:", v5);
  objc_msgSend(v6, "appPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stopObservingEvent:", *(_QWORD *)(a1 + 32));
}

- (void)dispatchEvent:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  -[IKAppPlayerBridge appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __55__IKAppPlayerBridge_dispatchEvent_userInfo_completion___block_invoke;
  v19[3] = &unk_1E9F4C9B0;
  v22 = v23;
  v19[4] = self;
  v13 = v8;
  v20 = v13;
  v14 = v9;
  v21 = v14;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __55__IKAppPlayerBridge_dispatchEvent_userInfo_completion___block_invoke_2;
  v16[3] = &unk_1E9F4C9D8;
  v15 = v10;
  v17 = v15;
  v18 = v23;
  objc_msgSend(v11, "evaluate:completionBlock:", v19, v16);

  _Block_object_dispose(v23, 8);
}

void __55__IKAppPlayerBridge_dispatchEvent_userInfo_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "jsPlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "dispatchEvent:userInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __55__IKAppPlayerBridge_dispatchEvent_userInfo_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_evaluateDelegateBlockSync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[IKAppPlayerBridge appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__IKAppPlayerBridge__evaluateDelegateBlockSync___block_invoke;
  v7[3] = &unk_1E9F4CA00;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __48__IKAppPlayerBridge__evaluateDelegateBlockSync___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, WeakRetained);
  }

}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (IKAppPlaylistBridge)playlist
{
  return self->_playlist;
}

- (IKAppPlayer)appPlayer
{
  return (IKAppPlayer *)objc_loadWeakRetained((id *)&self->_appPlayer);
}

- (IKJSPlayer)jsPlayer
{
  return (IKJSPlayer *)objc_loadWeakRetained((id *)&self->_jsPlayer);
}

- (void)setJsPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_jsPlayer, a3);
}

- (IKDOMDocument)overlayDocument
{
  return self->_overlayDocument;
}

- (IKDOMDocument)interactiveOverlayDocument
{
  return self->_interactiveOverlayDocument;
}

- (BOOL)interactiveOverlayDismissable
{
  return self->_interactiveOverlayDismissable;
}

- (BOOL)muted
{
  return self->_muted;
}

- (NSDictionary)contextMenuData
{
  return self->_contextMenuData;
}

- (BOOL)showsResumeMenu
{
  return self->_showsResumeMenu;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_contextMenuData, 0);
  objc_storeStrong((id *)&self->_interactiveOverlayDocument, 0);
  objc_storeStrong((id *)&self->_overlayDocument, 0);
  objc_destroyWeak((id *)&self->_jsPlayer);
  objc_destroyWeak((id *)&self->_appPlayer);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_placeholderAppPlayer, 0);
}

@end
