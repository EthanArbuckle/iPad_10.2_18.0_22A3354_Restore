@implementation MNNavigationServiceLocalProxy

- (MNNavigationServiceLocalProxy)init
{
  MNNavigationServiceLocalProxy *v2;
  MNNavigationServiceLocalProxy *v3;
  MNNavigationServiceLocalProxy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNNavigationServiceLocalProxy;
  v2 = -[MNNavigationServiceLocalProxy init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_navigationServiceState = 0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  MNNavigationServiceLocalProxy *v4;
  objc_super v5;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);
  objc_msgSend(v3, "navigationDelegate");
  v4 = (MNNavigationServiceLocalProxy *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    objc_msgSend(v3, "setNavigationDelegate:", 0);

  v5.receiver = self;
  v5.super_class = (Class)MNNavigationServiceLocalProxy;
  -[MNNavigationServiceLocalProxy dealloc](&v5, sel_dealloc);
}

- (void)start
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__MNNavigationServiceLocalProxy_start__block_invoke;
  v2[3] = &unk_1E61D23C8;
  v2[4] = self;
  MNRunAsynchronouslyOnMainThread(v2);
}

void __38__MNNavigationServiceLocalProxy_start__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEffectiveBundleIdentifier:", CFSTR("com.apple.Maps"));
  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerObserver:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setNavigationDelegate:", *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(v2, "isStarted") & 1) == 0)
    objc_msgSend(v2, "start");

}

- (void)reset
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  MNGetMNNavigationXPCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "MNNavigationServiceLocalProxy reset", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__MNNavigationServiceLocalProxy_reset__block_invoke;
  v4[3] = &unk_1E61D23C8;
  v4[4] = self;
  MNRunAsynchronouslyOnMainThread(v4);
}

void __38__MNNavigationServiceLocalProxy_reset__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

  }
}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;
  uint8_t buf[16];

  v5 = a3;
  MNGetMNNavigationXPCLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "MNNavigationServiceLocalProxy setRoutesForPreview", buf, 2u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__MNNavigationServiceLocalProxy_setRoutesForPreview_selectedRouteIndex___block_invoke;
  v8[3] = &unk_1E61D23F0;
  v9 = v5;
  v10 = a4;
  v7 = v5;
  MNRunAsynchronouslyOnMainThread(v8);

}

void __72__MNNavigationServiceLocalProxy_setRoutesForPreview_selectedRouteIndex___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRoutesForPreview:selectedRouteIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MNGetMNNavigationXPCLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v15 = objc_msgSend(v6, "navigationType");
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "MNNavigationServiceLocalProxy startNavigationWithType: %u", buf, 8u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__MNNavigationServiceLocalProxy_startNavigationWithDetails_activeBlock___block_invoke;
  v11[3] = &unk_1E61D2418;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  MNRunAsynchronouslyOnMainThread(v11);

}

void __72__MNNavigationServiceLocalProxy_startNavigationWithDetails_activeBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = MEMORY[0x1B5E0E364](a1[6]);
  v3 = a1[4];
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startNavigationWithDetails:activeBlock:", a1[5], 0);

}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 - 1 > 9)
      v6 = CFSTR("Unknown");
    else
      v6 = off_1E61D2578[a3 - 1];
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "MNNavigationServiceLocalProxy stopNavigationWithReason: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__MNNavigationServiceLocalProxy_stopNavigationWithReason___block_invoke;
  v7[3] = &unk_1E61D23F0;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);
}

void __58__MNNavigationServiceLocalProxy_stopNavigationWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopNavigationWithReason:", *(_QWORD *)(a1 + 40));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

  }
}

- (void)rerouteWithWaypoints:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__MNNavigationServiceLocalProxy_rerouteWithWaypoints___block_invoke;
  v5[3] = &unk_1E61D23C8;
  v6 = v3;
  v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);

}

void __54__MNNavigationServiceLocalProxy_rerouteWithWaypoints___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rerouteWithWaypoints:", *(_QWORD *)(a1 + 32));

}

- (void)insertWaypoint:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MNNavigationServiceLocalProxy_insertWaypoint___block_invoke;
  v5[3] = &unk_1E61D23C8;
  v6 = v3;
  v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);

}

void __48__MNNavigationServiceLocalProxy_insertWaypoint___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertWaypoint:", *(_QWORD *)(a1 + 32));

}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__MNNavigationServiceLocalProxy_removeWaypointAtIndex___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __55__MNNavigationServiceLocalProxy_removeWaypointAtIndex___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeWaypointAtIndex:", *(_QWORD *)(a1 + 32));

}

- (void)advanceToNextLeg
{
  MNRunAsynchronouslyOnMainThread(&__block_literal_global_9);
}

void __49__MNNavigationServiceLocalProxy_advanceToNextLeg__block_invoke()
{
  id v0;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "advanceToNextLeg");

}

- (void)updateDestination:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__MNNavigationServiceLocalProxy_updateDestination___block_invoke;
  v5[3] = &unk_1E61D23C8;
  v6 = v3;
  v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);

}

void __51__MNNavigationServiceLocalProxy_updateDestination___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateDestination:", *(_QWORD *)(a1 + 32));

}

- (void)resumeOriginalDestination
{
  MNRunAsynchronouslyOnMainThread(&__block_literal_global_13);
}

void __58__MNNavigationServiceLocalProxy_resumeOriginalDestination__block_invoke()
{
  id v0;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resumeOriginalDestination");

}

- (void)forceReroute
{
  MNRunAsynchronouslyOnMainThread(&__block_literal_global_14);
}

void __45__MNNavigationServiceLocalProxy_forceReroute__block_invoke()
{
  id v0;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "forceReroute");

}

- (void)switchToRoute:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MNNavigationServiceLocalProxy_switchToRoute___block_invoke;
  v5[3] = &unk_1E61D23C8;
  v6 = v3;
  v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);

}

void __47__MNNavigationServiceLocalProxy_switchToRoute___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switchToRoute:", *(_QWORD *)(a1 + 32));

}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  int v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__MNNavigationServiceLocalProxy_changeTransportType_route___block_invoke;
  v7[3] = &unk_1E61D2460;
  v9 = a3;
  v8 = v5;
  v6 = v5;
  MNRunAsynchronouslyOnMainThread(v7);

}

void __59__MNNavigationServiceLocalProxy_changeTransportType_route___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeTransportType:route:", *(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)switchToDestinationRoute
{
  MNRunAsynchronouslyOnMainThread(&__block_literal_global_15);
}

void __57__MNNavigationServiceLocalProxy_switchToDestinationRoute__block_invoke()
{
  id v0;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "switchToDestinationRoute");

}

- (void)setGuidanceType:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__MNNavigationServiceLocalProxy_setGuidanceType___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __49__MNNavigationServiceLocalProxy_setGuidanceType___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGuidanceType:", *(_QWORD *)(a1 + 32));

}

- (void)changeUserOptions:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__MNNavigationServiceLocalProxy_changeUserOptions___block_invoke;
  v5[3] = &unk_1E61D23C8;
  v6 = v3;
  v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);

}

void __51__MNNavigationServiceLocalProxy_changeUserOptions___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeUserOptions:", *(_QWORD *)(a1 + 32));

  +[MNUserOptionsEngine sharedInstance](MNUserOptionsEngine, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "update:", *(_QWORD *)(a1 + 32));

}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__MNNavigationServiceLocalProxy_setVoiceGuidanceLevelOverride___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __63__MNNavigationServiceLocalProxy_setVoiceGuidanceLevelOverride___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setVoiceGuidanceLevelOverride:", *(_QWORD *)(a1 + 32));

}

- (void)repeatCurrentGuidanceWithReply:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__MNNavigationServiceLocalProxy_repeatCurrentGuidanceWithReply___block_invoke;
  v5[3] = &unk_1E61D2488;
  v6 = v3;
  v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);

}

void __64__MNNavigationServiceLocalProxy_repeatCurrentGuidanceWithReply___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "repeatCurrentGuidanceWithReply:", *(_QWORD *)(a1 + 32));

}

- (void)repeatCurrentTrafficAlertWithReply:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__MNNavigationServiceLocalProxy_repeatCurrentTrafficAlertWithReply___block_invoke;
  v5[3] = &unk_1E61D2488;
  v6 = v3;
  v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);

}

void __68__MNNavigationServiceLocalProxy_repeatCurrentTrafficAlertWithReply___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "repeatCurrentTrafficAlertWithReply:", *(_QWORD *)(a1 + 32));

}

- (void)vibrateForPrompt:(unint64_t)a3 withReply:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  unint64_t v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MNNavigationServiceLocalProxy_vibrateForPrompt_withReply___block_invoke;
  v7[3] = &unk_1E61D24B0;
  v8 = v5;
  v9 = a3;
  v6 = v5;
  MNRunAsynchronouslyOnMainThread(v7);

}

void __60__MNNavigationServiceLocalProxy_vibrateForPrompt_withReply___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vibrateForPrompt:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)stopCurrentGuidancePrompt
{
  MNRunAsynchronouslyOnMainThread(&__block_literal_global_17);
}

void __58__MNNavigationServiceLocalProxy_stopCurrentGuidancePrompt__block_invoke()
{
  id v0;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stopCurrentGuidancePrompt");

}

- (void)setHeadingOrientation:(int)a3
{
  _QWORD v3[4];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__MNNavigationServiceLocalProxy_setHeadingOrientation___block_invoke;
  v3[3] = &__block_descriptor_36_e5_v8__0l;
  v4 = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __55__MNNavigationServiceLocalProxy_setHeadingOrientation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned int *)(a1 + 32);
  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHeadingOrientation:", v1);

}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__MNNavigationServiceLocalProxy_setGuidancePromptsEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e5_v8__0l;
  v4 = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __59__MNNavigationServiceLocalProxy_setGuidancePromptsEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 32);
  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGuidancePromptsEnabled:", v1);

}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__MNNavigationServiceLocalProxy_setIsDisplayingNavigationTray___block_invoke;
  v3[3] = &__block_descriptor_33_e5_v8__0l;
  v4 = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __63__MNNavigationServiceLocalProxy_setIsDisplayingNavigationTray___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsDisplayingNavigationTray:", *(unsigned __int8 *)(a1 + 32));

}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__MNNavigationServiceLocalProxy_setIsConnectedToCarplay___block_invoke;
  v3[3] = &__block_descriptor_33_e5_v8__0l;
  v4 = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __57__MNNavigationServiceLocalProxy_setIsConnectedToCarplay___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsConnectedToCarplay:", *(unsigned __int8 *)(a1 + 32));

}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__MNNavigationServiceLocalProxy_setDisplayedStepIndex___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __55__MNNavigationServiceLocalProxy_setDisplayedStepIndex___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisplayedStepIndex:", *(_QWORD *)(a1 + 32));

}

- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__MNNavigationServiceLocalProxy_setRideIndex_forSegmentIndex___block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a3;
  v4[5] = a4;
  MNRunAsynchronouslyOnMainThread(v4);
}

void __62__MNNavigationServiceLocalProxy_setRideIndex_forSegmentIndex___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRideIndex:forSegmentIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__MNNavigationServiceLocalProxy_setJunctionViewImageWidth_height___block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&v4[4] = a3;
  *(double *)&v4[5] = a4;
  MNRunAsynchronouslyOnMainThread(v4);
}

void __66__MNNavigationServiceLocalProxy_setJunctionViewImageWidth_height___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setJunctionViewImageWidth:height:", *(double *)(a1 + 32), *(double *)(a1 + 40));

}

- (void)disableNavigationCapability:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__MNNavigationServiceLocalProxy_disableNavigationCapability___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __61__MNNavigationServiceLocalProxy_disableNavigationCapability___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableNavigationCapability:", *(_QWORD *)(a1 + 32));

}

- (void)enableNavigationCapability:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__MNNavigationServiceLocalProxy_enableNavigationCapability___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __60__MNNavigationServiceLocalProxy_enableNavigationCapability___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableNavigationCapability:", *(_QWORD *)(a1 + 32));

}

- (void)changeOfflineMode:(unsigned __int8)a3
{
  _QWORD v3[4];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__MNNavigationServiceLocalProxy_changeOfflineMode___block_invoke;
  v3[3] = &__block_descriptor_33_e5_v8__0l;
  v4 = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __51__MNNavigationServiceLocalProxy_changeOfflineMode___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeOfflineMode:", *(unsigned __int8 *)(a1 + 32));

}

- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__MNNavigationServiceLocalProxy_acceptReroute_forTrafficIncidentAlert___block_invoke;
  v7[3] = &unk_1E61D2538;
  v9 = a3;
  v8 = v5;
  v6 = v5;
  MNRunAsynchronouslyOnMainThread(v7);

}

void __71__MNNavigationServiceLocalProxy_acceptReroute_forTrafficIncidentAlert___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptReroute:forTrafficIncidentAlert:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)setTraceIsPlaying:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__MNNavigationServiceLocalProxy_setTraceIsPlaying___block_invoke;
  v3[3] = &__block_descriptor_33_e5_v8__0l;
  v4 = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __51__MNNavigationServiceLocalProxy_setTraceIsPlaying___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTraceIsPlaying:", *(unsigned __int8 *)(a1 + 32));

}

- (void)setTracePlaybackSpeed:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__MNNavigationServiceLocalProxy_setTracePlaybackSpeed___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __55__MNNavigationServiceLocalProxy_setTracePlaybackSpeed___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTracePlaybackSpeed:", *(double *)(a1 + 32));

}

- (void)setTracePosition:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__MNNavigationServiceLocalProxy_setTracePosition___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __50__MNNavigationServiceLocalProxy_setTracePosition___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTracePosition:", *(double *)(a1 + 32));

}

- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__MNNavigationServiceLocalProxy_recordTraceBookmarkAtCurrentPositionWthScreenshotData___block_invoke;
  v5[3] = &unk_1E61D23C8;
  v6 = v3;
  v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);

}

void __87__MNNavigationServiceLocalProxy_recordTraceBookmarkAtCurrentPositionWthScreenshotData___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordTraceBookmarkAtCurrentPositionWthScreenshotData:", *(_QWORD *)(a1 + 32));

}

- (void)recordPedestrianTracePath:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__MNNavigationServiceLocalProxy_recordPedestrianTracePath___block_invoke;
  v5[3] = &unk_1E61D23C8;
  v6 = v3;
  v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);

}

void __59__MNNavigationServiceLocalProxy_recordPedestrianTracePath___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordPedestrianTracePath:", *(_QWORD *)(a1 + 32));

}

- (void)setSimulationSpeedOverride:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__MNNavigationServiceLocalProxy_setSimulationSpeedOverride___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __60__MNNavigationServiceLocalProxy_setSimulationSpeedOverride___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSimulationSpeedOverride:", *(double *)(a1 + 32));

}

- (void)setSimulationSpeedMultiplier:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__MNNavigationServiceLocalProxy_setSimulationSpeedMultiplier___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __62__MNNavigationServiceLocalProxy_setSimulationSpeedMultiplier___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSimulationSpeedMultiplier:", *(double *)(a1 + 32));

}

- (void)setSimulationPosition:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__MNNavigationServiceLocalProxy_setSimulationPosition___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __55__MNNavigationServiceLocalProxy_setSimulationPosition___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSimulationPosition:", *(double *)(a1 + 32));

}

- (void)interfaceHashesWithHandler:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    (*((void (**)(id, unint64_t, unint64_t))a3 + 2))(v4, +[MNNavigationService clientInterfaceHash](MNNavigationService, "clientInterfaceHash"), +[MNNavigationService daemonInterfaceHash](MNNavigationService, "daemonInterfaceHash"));

  }
}

- (void)checkinForNavigationService:(id)a3
{
  void (**v3)(id, void *);
  int BOOL;
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *))a3;
  BOOL = GEOConfigGetBOOL();
  if (v3 && BOOL)
  {
    +[MNFilePaths navTempDirectoryPath](MNFilePaths, "navTempDirectoryPath");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "UTF8String");
    v6 = (void *)sandbox_extension_issue_file();

    MNGetMNNavigationServiceLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "Sandbox extension (%s) issued.", (uint8_t *)&v8, 0xCu);
    }

    v3[2](v3, v6);
    free(v6);
  }

}

- (void)pauseRealtimeUpdatesForSubscriber:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__MNNavigationServiceLocalProxy_pauseRealtimeUpdatesForSubscriber___block_invoke;
  v5[3] = &unk_1E61D23C8;
  v6 = v3;
  v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);

}

void __67__MNNavigationServiceLocalProxy_pauseRealtimeUpdatesForSubscriber___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pauseRealtimeUpdatesForSubscriber:", *(_QWORD *)(a1 + 32));

}

- (void)resumeRealtimeUpdatesForSubscriber:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__MNNavigationServiceLocalProxy_resumeRealtimeUpdatesForSubscriber___block_invoke;
  v5[3] = &unk_1E61D23C8;
  v6 = v3;
  v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);

}

void __68__MNNavigationServiceLocalProxy_resumeRealtimeUpdatesForSubscriber___block_invoke(uint64_t a1)
{
  id v2;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeRealtimeUpdatesForSubscriber:", *(_QWORD *)(a1 + 32));

}

- (void)stateManager:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = -[MNNavigationServiceLocalProxy _serviceStateForStateType:](self, "_serviceStateForStateType:", a4);
  v8 = -[MNNavigationServiceLocalProxy _serviceStateForStateType:](self, "_serviceStateForStateType:", a5);
  MNGetMNNavigationXPCLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    MNNavigationServiceStateAsString(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MNNavigationServiceStateAsString(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "MNNavigationServiceLocalProxy willChangeFromState: '%@' toState: '%@'", (uint8_t *)&v13, 0x16u);

  }
  if (v7 != v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "navigationServiceProxy:willChangeFromState:toState:", self, v7, v8);

  }
}

- (void)stateManager:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = -[MNNavigationServiceLocalProxy _serviceStateForStateType:](self, "_serviceStateForStateType:", a4);
  v8 = -[MNNavigationServiceLocalProxy _serviceStateForStateType:](self, "_serviceStateForStateType:", a5);
  MNGetMNNavigationXPCLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    MNNavigationServiceStateAsString(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MNNavigationServiceStateAsString(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "MNNavigationServiceLocalProxy didChangeFromState: '%@' toState: '%@'", (uint8_t *)&v13, 0x16u);

  }
  if (v7 != v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "navigationServiceProxy:didChangeFromState:toState:", self, v7, v8);

  }
}

- (unint64_t)_serviceStateForStateType:(unint64_t)a3
{
  if (a3 + 1 > 7)
    return 2;
  else
    return qword_1B0BF2F90[a3 + 1];
}

- (void)navigationSessionManager:(id)a3 shouldEndWithReason:(unint64_t)a4
{
  -[MNNavigationServiceLocalProxy stopNavigationWithReason:](self, "stopNavigationWithReason:", a4);
}

- (void)navigationSessionManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

  if (v7)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "_navigation_errorCodeAsString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "Navigation service encountered an unrecoverable error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(v5, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_25_0);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didFailWithError:", self, v5);

}

void __75__MNNavigationServiceLocalProxy_navigationSessionManager_didFailWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)navigationSessionManager:(id)a3 didChangeNavigationState:(int)a4
{
  uint64_t v4;
  id WeakRetained;

  v4 = *(_QWORD *)&a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didChangeNavigationState:", self, v4);

}

- (void)navigationSessionManager:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didUpdateDisplayedStepIndex:segmentIndex:", self, a4, a5);

}

- (void)navigationSessionManager:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilManeuver:(double)a5 timeUntilManeuver:(double)a6
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didUpdateDistanceUntilManeuver:timeUntilManeuver:forStepIndex:", self, a4, a5, a6);

}

- (void)navigationSessionManagerDidFinishLocationUpdate:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxyDidFinishLocationUpdate:", self);

}

- (void)navigationSessionManager:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:isApproachingEndOfLeg:", self, a4);

}

- (void)navigationSessionManager:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  MNNavigationServiceClientInterface **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didEnterPreArrivalStateForWaypoint:endOfLegIndex:", self, v8, a5);

}

- (void)navigationSessionManager:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  MNNavigationServiceClientInterface **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didArriveAtWaypoint:endOfLegIndex:", self, v8, a5);

}

- (void)navigationSessionManager:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  MNNavigationServiceClientInterface **p_delegate;
  id v10;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:", self, v10, a5, a6);

}

- (void)navigationSessionManagerDidEnterPreArrivalState:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxyDidEnterPreArrivalState:", self);

}

- (void)navigationSessionManagerDidArrive:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxyDidArrive:", self);

}

- (void)navigationSessionManagerWillPause:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxyWillPauseNavigation:", self);

}

- (void)navigationSessionManagerWillResumeFromPause:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxyWillResumeFromPauseNavigation:", self);

}

- (void)navigationSessionManager:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didReceiveRouteSignalStrength:", self, a4);

}

- (void)navigationSessionManager:(id)a3 didUpdateETAResponseForRoute:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didUpdateETAResponseForRoute:", self, v6);

}

- (void)navigationSessionManager:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didUpdateHeading:accuracy:", self, a4, a5);

}

- (void)navigationSessionManager:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didUpdateMotionType:confidence:", self, a4, a5);

}

- (void)navigationSessionManager:(id)a3 didUpdatePreviewRoutes:(id)a4 withSelectedRouteIndex:(unint64_t)a5
{
  MNNavigationServiceClientInterface **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didUpdatePreviewRoutes:withSelectedRouteIndex:", self, v8, a5);

}

- (void)navigationSessionManagerWillReroute:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxyWillReroute:", self);

}

- (void)navigationSessionManager:(id)a3 didRerouteWithRoute:(id)a4 location:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  MNNavigationServiceClientInterface **p_delegate;
  id v12;
  id v13;
  id v14;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didRerouteWithRoute:withLocation:withAlternateRoutes:rerouteReason:", self, v14, v13, v12, a7);

}

- (void)navigationSessionManagerDidCancelReroute:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxyDidCancelReroute:", self);

}

- (void)navigationSessionManager:(id)a3 didUpdateRouteWithNewRideSelection:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didUpdateRouteWithNewRideSelection:", self, v6);

}

- (void)navigationSessionManager:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5
{
  uint64_t v5;
  MNNavigationServiceClientInterface **p_delegate;
  id v8;
  id WeakRetained;

  v5 = *(_QWORD *)&a4;
  p_delegate = &self->_delegate;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didSwitchToNewTransportType:newRoute:", self, v5, v8);

}

- (void)navigationSessionManager:(id)a3 didFailRerouteWithError:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didFailRerouteWithError:", self, v6);

}

- (void)navigationSessionManager:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didUpdateAlternateRoutes:", self, v6);

}

- (void)navigationSessionManager:(id)a3 proceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  MNNavigationServiceClientInterface **p_delegate;
  id v10;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didUpdateProceedToRouteDistance:displayString:closestStepIndex:", self, v10, a6, a4);

}

- (void)navigationSessionManager:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilSign:(double)a5 timeUntilSign:(double)a6
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didUpdateDistanceUntilSign:timeUntilSign:forStepIndex:", self, a4, a5, a6);

}

- (void)navigationSessionManager:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:willAnnounce:inSeconds:", self, a4, a5);

}

- (void)navigationSessionManager:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  uint64_t v10;
  uint64_t v11;
  MNNavigationServiceClientInterface **p_delegate;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id WeakRetained;

  v10 = *(_QWORD *)&a8;
  v11 = *(_QWORD *)&a6;
  p_delegate = &self->_delegate;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v19) = a10;
  objc_msgSend(WeakRetained, "navigationServiceProxy:displayPrimaryStep:instructions:shieldType:shieldText:drivingSide:maneuverStepIndex:isSynthetic:", self, v18, v17, v11, v16, v10, a9, v19);

}

- (void)navigationSessionManager:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:displayManeuverAlertForAnnouncementStage:", self, a4);

}

- (void)navigationSessionManager:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8
{
  uint64_t v8;
  uint64_t v9;
  MNNavigationServiceClientInterface **p_delegate;
  id v14;
  id v15;
  id v16;
  id WeakRetained;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a6;
  p_delegate = &self->_delegate;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:displaySecondaryStep:instructions:shieldType:shieldText:drivingSide:", self, v16, v15, v9, v14, v8);

}

- (void)navigationSessionManagerHideSecondaryStep:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxyHideSecondaryStep:", self);

}

- (void)navigationSessionManagerBeginGuidanceUpdate:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxyBeginGuidanceUpdate:", self);

}

- (void)navigationSessionManagerEndGuidanceUpdate:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxyEndGuidanceUpdate:", self);

}

- (void)navigationSessionManager:(id)a3 updateSignsWithInfo:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:updateSignsWithInfo:", self, v6);

}

- (void)navigationSessionManager:(id)a3 updateSignsWithARInfo:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:updateSignsWithARInfo:", self, v6);

}

- (void)navigationSessionManager:(id)a3 usePersistentDisplay:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:usePersistentDisplay:", self, v4);

}

- (void)navigationSessionManager:(id)a3 showLaneDirections:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:showLaneDirections:", self, v6);

}

- (void)navigationSessionManager:(id)a3 hideLaneDirectionsForId:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:hideLaneDirectionsForId:", self, v6);

}

- (void)navigationSessionManager:(id)a3 showJunctionView:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:showJunctionView:", self, v6);

}

- (void)navigationSessionManager:(id)a3 hideJunctionViewForId:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:hideJunctionViewForId:", self, v6);

}

- (void)navigationSessionManager:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didEnableGuidancePrompts:", self, v4);

}

- (void)navigationSessionManager:(id)a3 newGuidanceEventFeedback:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:newGuidanceEventFeedback:", self, v6);

}

- (void)navigationSessionManager:(id)a3 updatedGuidanceEventFeedback:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:updatedGuidanceEventFeedback:", self, v6);

}

- (void)navigationSessionManager:(id)a3 didReceiveTrafficIncidentAlert:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didReceiveTrafficIncidentAlert:", self, v6);

}

- (void)navigationSessionManager:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didUpdateTrafficIncidentAlert:", self, v6);

}

- (void)navigationSessionManager:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didInvalidateTrafficIncidentAlert:", self, v6);

}

- (void)navigationSessionManager:(id)a3 didDismissTrafficIncidentAlert:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didDismissTrafficIncidentAlert:", self, v6);

}

- (void)navigationSessionManager:(id)a3 didStartSpeakingPrompt:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didStartSpeakingPrompt:", self, v6);

}

- (void)navigationSessionManager:(id)a3 willProcessSpeechEvent:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:willProcessSpeechEvent:", self, v6);

}

- (void)navigationSessionManager:(id)a3 didProcessSpeechEvent:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didProcessSpeechEvent:", self, v6);

}

- (void)navigationSessionManager:(id)a3 triggerHaptics:(int)a4
{
  uint64_t v4;
  id WeakRetained;

  v4 = *(_QWORD *)&a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:triggerHaptics:", self, v4);

}

- (void)navigationSessionManager:(id)a3 didUpdateTracePlaybackDetails:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didUpdateTracePlaybackDetails:", self, v6);

}

- (void)navigationSessionManager:(id)a3 willSendTransitUpdateRequestForRouteIDs:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:willRequestRealtimeUpdatesForRouteIDs:", self, v6);

}

- (void)navigationSessionManager:(id)a3 didReceiveTransitUpdates:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didReceiveRealtimeUpdates:", self, v6);

}

- (void)navigationSessionManager:(id)a3 didReceiveTransitAlert:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didReceiveTransitAlert:", self, v6);

}

- (void)navigationSessionManager:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  MNNavigationServiceClientInterface **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationServiceProxy:didSendNavigationServiceCallback:", self, v6);

}

- (MNNavigationServiceClientInterface)delegate
{
  return (MNNavigationServiceClientInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_navigationServiceActiveBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
