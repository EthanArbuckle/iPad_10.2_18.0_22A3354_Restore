@implementation GKTurnBasedExchange

- (GKTurnBasedExchange)initWithInternalRepresentation:(id)a3 daemonProxy:(id)a4
{
  id v6;
  id v7;
  GKTurnBasedExchange *v8;
  GKTurnBasedExchange *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[GKInternalRepresentation internalRepresentation](GKTurnBasedExchangeInternal, "internalRepresentation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11.receiver = self;
  v11.super_class = (Class)GKTurnBasedExchange;
  v8 = -[GKTurnBasedExchange init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_internal, v6);
    objc_storeStrong((id *)&v9->_daemonProxy, a4);
  }

  return v9;
}

- (NSString)message
{
  GKDaemonProxy *daemonProxy;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  daemonProxy = self->_daemonProxy;
  -[GKTurnBasedExchangeInternal localizableMessage](self->_internal, "localizableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchange match](self, "match");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy localizedMessageFromDictionary:forBundleID:](daemonProxy, "localizedMessageFromDictionary:forBundleID:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (GKTurnBasedExchangeStatus)status
{
  void *v2;
  void *v3;
  GKTurnBasedExchangeStatus v4;

  -[GKTurnBasedExchange internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("A")) & 1) != 0)
    {
      v4 = GKTurnBasedExchangeStatusActive;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("C")) & 1) != 0
           || (objc_msgSend(v3, "isEqualToString:", CFSTR("T")) & 1) != 0)
    {
      v4 = GKTurnBasedExchangeStatusComplete;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("X")))
    {
      v4 = GKTurnBasedExchangeStatusCanceled;
    }
    else
    {
      v4 = GKTurnBasedExchangeStatusUnknown;
    }
  }
  else
  {
    v4 = GKTurnBasedExchangeStatusUnknown;
  }

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKTurnBasedExchange internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GKTurnBasedExchange internal](self, "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  GKTurnBasedExchange *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (description_onceToken_531 != -1)
    dispatch_once(&description_onceToken_531, &__block_literal_global_532);
  v3 = (void *)description_statusEnumLookupDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKTurnBasedExchange status](self, "status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = CFSTR("INVALID");
  if (v5)
    v6 = (const __CFString *)v5;
  v34 = (__CFString *)v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v33 = self;
  -[GKTurnBasedExchange recipients](self, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v13, "internal");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "playerID");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (void *)v16;
        else
          v18 = v13;
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v19);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v10);
  }

  v32 = (void *)MEMORY[0x1E0CB3940];
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchange exchangeID](v33, "exchangeID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchange sendDate](v33, "sendDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchange timeoutDate](v33, "timeoutDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchange completionDate](v33, "completionDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchange sender](v33, "sender");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "internal");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "player");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "playerID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23)
  {
    -[GKTurnBasedExchange sender](v33, "sender");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[GKTurnBasedExchange message](v33, "message");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchange data](v33, "data");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");
  -[GKTurnBasedExchange replies](v33, "replies");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("<%@ %p - exchangeID:%@ status:%@ sendDate:%@ timeoutDate:%@ completionDate:%@ sender:%@ recipients:%@ message:%@ data.length:%ld replies:%@>"), v39, v33, v38, v34, v37, v36, v35, v24, v7, v25, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  return v29;
}

void __34__GKTurnBasedExchange_description__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E75FB088;
  v2[1] = &unk_1E75FB0A0;
  v3[0] = CFSTR("Unknown");
  v3[1] = CFSTR("Active");
  v2[2] = &unk_1E75FB0B8;
  v2[3] = &unk_1E75FB0D0;
  v3[2] = CFSTR("Complete");
  v3[3] = CFSTR("X-Canceled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)description_statusEnumLookupDict;
  description_statusEnumLookupDict = v0;

}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKTurnBasedExchange;
  objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKTurnBasedExchange;
  -[GKTurnBasedExchange methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKTurnBasedExchange forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedExchange;
  if (-[GKTurnBasedExchange respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKTurnBasedExchange forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  int v4;

  if (a3)
  {
    if (class_respondsToSelector((Class)a1, a3))
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      v4 = GKApplicationLinkedOnOrAfter();
      if (v4)
        LOBYTE(v4) = +[GKTurnBasedExchangeInternal instancesRespondToSelector:](GKTurnBasedExchangeInternal, "instancesRespondToSelector:", a3);
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKTurnBasedExchange internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKTurnBasedExchange internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (void)_updateInternalFromMatchInternal:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "exchanges", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[GKTurnBasedExchange exchangeID](self, "exchangeID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "exchangeID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (v12)
        {
          -[GKTurnBasedExchange setInternal:](self, "setInternal:", v9);
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)cancelWithLocalizableMessageKey:(NSString *)key arguments:(NSArray *)arguments completionHandler:(void *)completionHandler
{
  NSString *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[4];
  NSString *v26;
  NSArray *v27;
  id v28;
  GKTurnBasedExchange *v29;
  id v30;

  v8 = key;
  v9 = arguments;
  v10 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 2121, "-[GKTurnBasedExchange cancelWithLocalizableMessageKey:arguments:completionHandler:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[GKPreferences shared](GKPreferences, "shared");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "multiplayerAllowedPlayerType");

  v15 = MEMORY[0x1E0C809B0];
  if (v14)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil or invalid localizable message key"), 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v21);
    }
    if (!v9)
      v9 = (NSArray *)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_gkLocalizedStringForKey:defaultValue:arguments:", v8, v8, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __83__GKTurnBasedExchange_cancelWithLocalizableMessageKey_arguments_completionHandler___block_invoke;
    v25[3] = &unk_1E75B4198;
    v26 = v8;
    v9 = v9;
    v27 = v9;
    v28 = v17;
    v29 = self;
    v30 = v12;
    v18 = v17;
    objc_msgSend(v30, "perform:", v25);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 10, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setError:", v16);
  }

  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __83__GKTurnBasedExchange_cancelWithLocalizableMessageKey_arguments_completionHandler___block_invoke_3;
  v22[3] = &unk_1E75B2BB0;
  v23 = v12;
  v24 = v10;
  v22[4] = self;
  v19 = v12;
  v20 = v10;
  objc_msgSend(v19, "notifyOnMainQueueWithBlock:", v22);

}

void __83__GKTurnBasedExchange_cancelWithLocalizableMessageKey_arguments_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v3 = a2;
  +[GKTurnBasedMatch _localizableMessageWithKey:arguments:defaultMessage:](GKTurnBasedMatch, "_localizableMessageWithKey:arguments:defaultMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "turnBasedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "exchangeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "match");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__GKTurnBasedExchange_cancelWithLocalizableMessageKey_arguments_completionHandler___block_invoke_2;
  v12[3] = &unk_1E75B4EE8;
  v10 = *(void **)(a1 + 64);
  v12[4] = *(_QWORD *)(a1 + 56);
  v13 = v10;
  v14 = v3;
  v11 = v3;
  objc_msgSend(v6, "cancelExchange:withMessage:match:handler:", v7, v4, v9, v12);

}

void __83__GKTurnBasedExchange_cancelWithLocalizableMessageKey_arguments_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "_updateInternalFromMatchInternal:", v6);
    objc_msgSend(*(id *)(a1 + 32), "match");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInternal:", v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "setError:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __83__GKTurnBasedExchange_cancelWithLocalizableMessageKey_arguments_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "match");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v4);

  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
}

- (void)replyWithLocalizableMessageKey:(NSString *)key arguments:(NSArray *)arguments data:(NSData *)data completionHandler:(void *)completionHandler
{
  NSString *v10;
  NSArray *v11;
  NSData *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[4];
  NSString *v30;
  NSArray *v31;
  id v32;
  GKTurnBasedExchange *v33;
  NSData *v34;
  id v35;

  v10 = key;
  v11 = arguments;
  v12 = data;
  v13 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 2154, "-[GKTurnBasedExchange replyWithLocalizableMessageKey:arguments:data:completionHandler:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[GKPreferences shared](GKPreferences, "shared");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "multiplayerAllowedPlayerType");

  v18 = MEMORY[0x1E0C809B0];
  if (v17)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil or invalid localizable message key"), 0);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v25);
    }
    if (!v11)
      v11 = (NSArray *)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_gkLocalizedStringForKey:defaultValue:arguments:", v10, v10, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v18;
    v29[1] = 3221225472;
    v29[2] = __87__GKTurnBasedExchange_replyWithLocalizableMessageKey_arguments_data_completionHandler___block_invoke;
    v29[3] = &unk_1E75B18F0;
    v30 = v10;
    v11 = v11;
    v31 = v11;
    v32 = v20;
    v33 = self;
    v34 = v12;
    v35 = v15;
    v21 = v20;
    objc_msgSend(v35, "perform:", v29);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 10, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setError:", v22);

  }
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __87__GKTurnBasedExchange_replyWithLocalizableMessageKey_arguments_data_completionHandler___block_invoke_3;
  v26[3] = &unk_1E75B2BB0;
  v27 = v15;
  v28 = v13;
  v26[4] = self;
  v23 = v15;
  v24 = v13;
  objc_msgSend(v23, "notifyOnMainQueueWithBlock:", v26);

}

void __87__GKTurnBasedExchange_replyWithLocalizableMessageKey_arguments_data_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v3 = a2;
  +[GKTurnBasedMatch _localizableMessageWithKey:arguments:defaultMessage:](GKTurnBasedMatch, "_localizableMessageWithKey:arguments:defaultMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "turnBasedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "exchangeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 56), "match");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__GKTurnBasedExchange_replyWithLocalizableMessageKey_arguments_data_completionHandler___block_invoke_2;
  v12[3] = &unk_1E75B4EE8;
  v12[4] = *(_QWORD *)(a1 + 56);
  v13 = *(id *)(a1 + 72);
  v14 = v3;
  v11 = v3;
  objc_msgSend(v6, "replyToExchange:withMessage:data:match:handler:", v7, v4, v8, v10, v12);

}

void __87__GKTurnBasedExchange_replyWithLocalizableMessageKey_arguments_data_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "_updateInternalFromMatchInternal:", v6);
    objc_msgSend(*(id *)(a1 + 32), "match");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInternal:", v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "setError:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __87__GKTurnBasedExchange_replyWithLocalizableMessageKey_arguments_data_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "match");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v4);

  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
}

- (GKTurnBasedParticipant)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
  objc_storeStrong((id *)&self->_match, a3);
}

- (GKTurnBasedExchangeInternal)internal
{
  return (GKTurnBasedExchangeInternal *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)replies
{
  return self->_replies;
}

- (void)setReplies:(id)a3
{
  objc_storeStrong((id *)&self->_replies, a3);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_replies, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_daemonProxy, 0);
}

@end
