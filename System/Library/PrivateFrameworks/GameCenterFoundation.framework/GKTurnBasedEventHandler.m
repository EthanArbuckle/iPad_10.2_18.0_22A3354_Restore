@implementation GKTurnBasedEventHandler

+ (GKTurnBasedEventHandler)sharedTurnBasedEventHandler
{
  if (sharedTurnBasedEventHandler_once != -1)
    dispatch_once(&sharedTurnBasedEventHandler_once, &__block_literal_global_140);
  return (GKTurnBasedEventHandler *)(id)sharedTurnBasedEventHandler_sSharedTurnBasedEventHandler;
}

void __54__GKTurnBasedEventHandler_sharedTurnBasedEventHandler__block_invoke()
{
  GKTurnBasedEventHandler *v0;
  void *v1;

  v0 = objc_alloc_init(GKTurnBasedEventHandler);
  v1 = (void *)sharedTurnBasedEventHandler_sSharedTurnBasedEventHandler;
  sharedTurnBasedEventHandler_sSharedTurnBasedEventHandler = (uint64_t)v0;

}

- (GKTurnBasedEventHandler)init
{
  GKTurnBasedEventHandler *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *lookForEventQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKTurnBasedEventHandler;
  v2 = -[GKTurnBasedEventHandler init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("GKTurnBasedEventHandler.lookForEventQueue", v3);
    lookForEventQueue = v2->_lookForEventQueue;
    v2->_lookForEventQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)callTurnEventForMatch:(id)a3 userTapped:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[GKTurnBasedEventHandler delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "handleTurnEventForMatch:didBecomeActive:", v7, v4);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "handleTurnEventForMatch:", v7);
    }
  }

}

- (void)lookForEvent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke;
  v2[3] = &unk_1E75B1590;
  v2[4] = self;
  +[GKActivity named:execute:](GKActivity, "named:execute:", CFSTR("lookForEvent"), v2);
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2;
  v6[3] = &unk_1E75B1A28;
  v6[4] = v3;
  v7 = v2;
  v5 = v2;
  dispatch_async(v4, v6);

}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 500, "-[GKTurnBasedEventHandler lookForEvent]_block_invoke_2");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_3;
  v7[3] = &unk_1E75B1800;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  objc_msgSend(v6, "perform:", v7);
  objc_msgSend(v6, "wait");

}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_4;
  v10[3] = &unk_1E75B4D98;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  v14 = v3;
  v9 = v3;
  objc_msgSend(v5, "getNextTurnBasedEventWithHandler:", v10);

}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_4(uint64_t a1, void *a2, void *a3, uint64_t a4, char a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id *v20;
  id *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  void *v31;
  _QWORD v32[2];
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  char v42;
  uint8_t buf[16];

  v11 = a2;
  v12 = a3;
  v13 = a6;
  if (v13)
  {
    if (!os_log_GKGeneral)
      v14 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_4_cold_1();
  }
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (!os_log_GKGeneral)
      v17 = GKOSLoggers();
    v18 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v18, OS_LOG_TYPE_INFO, "lookForEvent:TBG MatchID Found, attempting to load TBG Match Details", buf, 2u);
    }
    v19 = *(void **)(a1 + 32);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_158;
    v33[3] = &unk_1E75B4D48;
    v20 = &v34;
    v34 = v11;
    v41 = a4;
    v21 = &v35;
    v35 = *(id *)(a1 + 32);
    v36 = v15;
    v37 = v16;
    v42 = a5;
    v22 = *(void **)(a1 + 48);
    v38 = *(_QWORD *)(a1 + 40);
    v39 = v22;
    v40 = v12;
    v23 = v16;
    objc_msgSend(v19, "perform:", v33);

  }
  else
  {
    if (!os_log_GKGeneral)
      v24 = GKOSLoggers();
    v25 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v25, OS_LOG_TYPE_INFO, "lookForEvent:Posting Notifiation: GKInternalTurnBasedGameEventNotification", buf, 2u);
    }
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), 0);
    v26 = *(void **)(a1 + 32);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_174;
    v30[3] = &unk_1E75B1800;
    v20 = &v31;
    v31 = v16;
    v21 = (id *)v32;
    v27 = *(id *)(a1 + 48);
    v28 = *(_QWORD *)(a1 + 40);
    v32[0] = v27;
    v32[1] = v28;
    v29 = v16;
    objc_msgSend(v26, "perform:", v30);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_158(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  char v19;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_160;
  v9[3] = &unk_1E75B4D20;
  v18 = *(_QWORD *)(a1 + 88);
  v4 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 56);
  v19 = *(_BYTE *)(a1 + 96);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(void **)(a1 + 72);
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = *(id *)(a1 + 80);
  v17 = v3;
  v8 = v3;
  +[GKTurnBasedMatch loadTurnBasedMatchWithDetailsForMatchID:withCompletionHandler:](GKTurnBasedMatch, "loadTurnBasedMatchWithDetailsForMatchID:withCompletionHandler:", v4, v9);

}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_160(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  _QWORD block[4];
  id v67;
  id v68;
  uint64_t v69;
  char v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  id v75;
  uint64_t v76;
  char v77;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_160_cold_1();
  }
  else
  {
    switch(*(_QWORD *)(a1 + 96))
    {
      case 'P':
        if (!os_log_GKGeneral)
          v8 = GKOSLoggers();
        v9 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandTurnBasedInvite", buf, 2u);
        }
        v10 = *(void **)(a1 + 32);
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_161;
        v71[3] = &unk_1E75B4CF8;
        v72 = v5;
        v73 = *(id *)(a1 + 40);
        v74 = *(id *)(a1 + 48);
        v11 = *(id *)(a1 + 56);
        v77 = *(_BYTE *)(a1 + 104);
        v12 = *(_QWORD *)(a1 + 64);
        v75 = v11;
        v76 = v12;
        objc_msgSend(v10, "perform:", v71);

        v13 = v72;
        goto LABEL_50;
      case 'Q':
        if (!os_log_GKGeneral)
          v14 = GKOSLoggers();
        v15 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v15, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandTurnBasedTurn", buf, 2u);
        }
        goto LABEL_16;
      case 'R':
        if (!os_log_GKGeneral)
          v22 = GKOSLoggers();
        v23 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v23, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandTurnBasedComplete", buf, 2u);
        }
        objc_msgSend(*(id *)(a1 + 40), "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), *(_QWORD *)(a1 + 48));
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_167;
        v61[3] = &unk_1E75B1AA0;
        v62 = *(id *)(a1 + 56);
        v63 = v5;
        v24 = *(id *)(a1 + 72);
        v25 = *(_QWORD *)(a1 + 64);
        v64 = v24;
        v65 = v25;
        dispatch_async(MEMORY[0x1E0C80D38], v61);

        v13 = v62;
        goto LABEL_50;
      case 'U':
LABEL_16:
        if (!os_log_GKGeneral)
          v16 = GKOSLoggers();
        v17 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v17, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandTurnBasedMatchChanged", buf, 2u);
        }
        goto LABEL_20;
      case 'X':
        if (!os_log_GKGeneral)
          v26 = GKOSLoggers();
        v27 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v27, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandExchangeRequested", buf, 2u);
        }
        objc_msgSend(*(id *)(a1 + 40), "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), *(_QWORD *)(a1 + 48));
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_170;
        v56[3] = &unk_1E75B1AA0;
        v57 = v5;
        v58 = *(id *)(a1 + 80);
        v28 = *(id *)(a1 + 56);
        v29 = *(_QWORD *)(a1 + 64);
        v59 = v28;
        v60 = v29;
        dispatch_async(MEMORY[0x1E0C80D38], v56);

        v13 = v57;
        goto LABEL_50;
      case 'Y':
        if (!os_log_GKGeneral)
          v30 = GKOSLoggers();
        v31 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v31, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandExchangeCompleted", buf, 2u);
        }
        objc_msgSend(*(id *)(a1 + 40), "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), *(_QWORD *)(a1 + 48));
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_171;
        v51[3] = &unk_1E75B1AA0;
        v52 = v5;
        v53 = *(id *)(a1 + 80);
        v32 = *(id *)(a1 + 56);
        v33 = *(_QWORD *)(a1 + 64);
        v54 = v32;
        v55 = v33;
        dispatch_async(MEMORY[0x1E0C80D38], v51);

        v13 = v52;
        goto LABEL_50;
      case 'Z':
        if (!os_log_GKGeneral)
          v34 = GKOSLoggers();
        v35 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v35, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandExchangeCanceled", buf, 2u);
        }
        objc_msgSend(*(id *)(a1 + 40), "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), *(_QWORD *)(a1 + 48));
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_172;
        v46[3] = &unk_1E75B1AA0;
        v47 = v5;
        v48 = *(id *)(a1 + 80);
        v36 = *(id *)(a1 + 56);
        v37 = *(_QWORD *)(a1 + 64);
        v49 = v36;
        v50 = v37;
        dispatch_async(MEMORY[0x1E0C80D38], v46);

        v13 = v47;
        goto LABEL_50;
      case '[':
LABEL_20:
        if (!os_log_GKGeneral)
          v18 = GKOSLoggers();
        v19 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v19, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandTurnReminder", buf, 2u);
        }
        objc_msgSend(*(id *)(a1 + 40), "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), *(_QWORD *)(a1 + 48));
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_166;
        block[3] = &unk_1E75B4CA8;
        v67 = *(id *)(a1 + 56);
        v20 = v5;
        v70 = *(_BYTE *)(a1 + 104);
        v21 = *(_QWORD *)(a1 + 64);
        v68 = v20;
        v69 = v21;
        dispatch_async(MEMORY[0x1E0C80D38], block);

        v13 = v67;
        goto LABEL_50;
      case '\\':
        if (!os_log_GKGeneral)
          v38 = GKOSLoggers();
        v39 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v39, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandExchangeSelected", buf, 2u);
        }
        objc_msgSend(*(id *)(a1 + 40), "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), *(_QWORD *)(a1 + 48));
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_173;
        v42[3] = &unk_1E75B1A78;
        v43 = *(id *)(a1 + 56);
        v40 = v5;
        v41 = *(_QWORD *)(a1 + 64);
        v44 = v40;
        v45 = v41;
        dispatch_async(MEMORY[0x1E0C80D38], v42);

        v13 = v43;
LABEL_50:

        break;
      default:
        break;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_161(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  char v14;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_162;
  v8[3] = &unk_1E75B4CD0;
  v4 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v14 = *(_BYTE *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 64);
  v11 = v5;
  v12 = v6;
  v13 = v3;
  v7 = v3;
  objc_msgSend(v4, "acceptInviteWithCompletionHandler:", v8);

}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_162(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  char v15;

  v8 = a2;
  if (!a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), *(_QWORD *)(a1 + 40));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_3_163;
    v11[3] = &unk_1E75B4CA8;
    v12 = *(id *)(a1 + 48);
    v9 = v8;
    v15 = *(_BYTE *)(a1 + 72);
    v10 = *(_QWORD *)(a1 + 56);
    v13 = v9;
    v14 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v5, v6, v7);

}

uint64_t __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_3_163(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "eventEmitter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player:receivedTurnEventForMatch:didBecomeActive:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 48), "callTurnEventForMatch:userTapped:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 48), "lookForEvent");
}

uint64_t __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_166(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "eventEmitter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player:receivedTurnEventForMatch:didBecomeActive:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 48), "callTurnEventForMatch:userTapped:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 48), "lookForEvent");
}

uint64_t __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_167(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "eventEmitter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player:matchEnded:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 48), "handleMatchEnded:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 56), "lookForEvent");
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_170(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "exchangeForID:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "eventEmitter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player:receivedExchangeRequest:forMatch:", *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 56), "lookForEvent");
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_171(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "exchangeForID:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "eventEmitter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v5, "replies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player:receivedExchangeReplies:forCompletedExchange:forMatch:", v3, v4, v5, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 56), "lookForEvent");
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_172(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "exchangeForID:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "eventEmitter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player:receivedExchangeCancellation:forMatch:", *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 56), "lookForEvent");
}

uint64_t __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_173(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "eventEmitter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player:receivedTurnEventForMatch:didBecomeActive:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);

  objc_msgSend(*(id *)(a1 + 48), "callTurnEventForMatch:userTapped:", *(_QWORD *)(a1 + 40), 1);
  return objc_msgSend(*(id *)(a1 + 48), "lookForEvent");
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_174(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiplayerService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_175;
  v9[3] = &unk_1E75B4D70;
  v10 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v13 = v3;
  v8 = v3;
  objc_msgSend(v5, "getPlayersToInviteWithHandlerV2:", v9);

}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_175(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_175_cold_1();
  }
  objc_msgSend(v5, "_gkPlayersFromInternals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_176;
    block[3] = &unk_1E75B1A78;
    v10 = *(id *)(a1 + 32);
    v11 = v8;
    v12 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend(*(id *)(a1 + 48), "lookForEvent");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_176(id *a1)
{
  void *v2;
  id v3;

  objc_msgSend(a1[4], "eventEmitter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "listenerRegisteredForSelector:", sel_player_didRequestMatchWithOtherPlayers_))
  {
    objc_msgSend(v3, "player:didRequestMatchWithOtherPlayers:", a1[4], a1[5]);
  }
  else
  {
    objc_msgSend(a1[5], "_gkPlayersIDsFromPlayers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "player:didRequestMatchWithPlayers:", a1[4], v2);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(a1[6], "handleInviteFromGameCenter:", v2);

  }
}

- (BOOL)didBecomeActive
{
  return self->_didBecomeActive;
}

- (void)setDidBecomeActive:(BOOL)a3
{
  self->_didBecomeActive = a3;
}

- (NSObject)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(NSObject *)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (OS_dispatch_queue)lookForEventQueue
{
  return self->_lookForEventQueue;
}

- (void)setLookForEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lookForEventQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookForEventQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v0, v1, "lookForEvent:Get Next Turn Based Event Failed.Error: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_160_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v0, v1, "lookForEvent:Load Turn Based Match with Details failed.Error: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_175_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v0, v1, "lookForEvent:Failed to get players to invite.Error: %@", v2);
  OUTLINED_FUNCTION_2();
}

@end
