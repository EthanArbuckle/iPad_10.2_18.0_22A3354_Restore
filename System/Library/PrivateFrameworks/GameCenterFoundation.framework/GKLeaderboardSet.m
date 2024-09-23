@implementation GKLeaderboardSet

- (GKLeaderboardSet)initWithInternalRepresentation:(id)a3
{
  id v4;
  GKLeaderboardSet *v5;
  GKLeaderboardSet *v6;
  objc_super v8;

  v4 = a3;
  if (!v4)
  {
    +[GKInternalRepresentation internalRepresentation](GKLeaderboardSetInternal, "internalRepresentation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardSet;
  v5 = -[GKLeaderboardSet init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeStrong((id *)&v5->_internal, v4);

  return v6;
}

- (GKLeaderboardSet)init
{
  return -[GKLeaderboardSet initWithInternalRepresentation:](self, "initWithInternalRepresentation:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKLeaderboardSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  GKLeaderboardSet *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("internal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[GKLeaderboardSet initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKLeaderboardSet internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("internal"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKLeaderboardSet internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKLeaderboardSet internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardSet;
  -[GKLeaderboardSet description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardSet identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardSet title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@ - %@ "), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKLeaderboardSet;
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
  v10.super_class = (Class)GKLeaderboardSet;
  -[GKLeaderboardSet methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKLeaderboardSet forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
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
  v8.super_class = (Class)GKLeaderboardSet;
  if (-[GKLeaderboardSet respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKLeaderboardSet forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
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
        LOBYTE(v4) = +[GKLeaderboardSetInternal instancesRespondToSelector:](GKLeaderboardSetInternal, "instancesRespondToSelector:", a3);
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
  -[GKLeaderboardSet internal](self, "internal");
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
  -[GKLeaderboardSet internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (void)loadLeaderboardsForGame:(id)a3 forPlayer:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  GKLeaderboardSet *v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboardSet.m", 144, "-[GKLeaderboardSet loadLeaderboardsForGame:forPlayer:withCompletionHandler:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke;
    v19[3] = &unk_1E75B2C00;
    v20 = v8;
    v21 = v9;
    v22 = self;
    v14 = v12;
    v23 = v14;
    objc_msgSend(v14, "perform:", v19);
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke_4;
    v16[3] = &unk_1E75B1BF0;
    v17 = v14;
    v18 = v10;
    v15 = v14;
    objc_msgSend(v15, "notifyOnMainQueueWithBlock:", v16);

  }
}

void __76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "gameDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E75B1C58;
  v11 = a1[7];
  v12 = v3;
  v9 = v3;
  objc_msgSend(v5, "getLeaderboardsForGameDescriptor:player:setIdentifier:handler:", v6, v7, v8, v10);

}

void __76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "_gkMapConcurrentlyWithBlock:", &__block_literal_global_54);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("leaderboards"));

  }
  objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

GKLeaderboard *__76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  GKLeaderboard *v3;

  v2 = a2;
  v3 = -[GKLeaderboard initWithInternalRepresentation:]([GKLeaderboard alloc], "initWithInternalRepresentation:", v2);

  return v3;
}

void __76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("leaderboards"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)loadLeaderboardsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  +[GKGame currentGame](GKGame, "currentGame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__GKLeaderboardSet_loadLeaderboardsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E75B1CF0;
  v8 = v4;
  v6 = v4;
  -[GKLeaderboardSet loadLeaderboardsForGame:withCompletionHandler:](self, "loadLeaderboardsForGame:withCompletionHandler:", v5, v7);

}

void __58__GKLeaderboardSet_loadLeaderboardsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
    }
    else if (v9)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v9, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

    }
  }

}

- (void)loadLeaderboardsForGame:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  +[GKGame currentGame](GKGame, "currentGame");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardSet loadLeaderboardsForGame:forPlayer:withCompletionHandler:](self, "loadLeaderboardsForGame:forPlayer:withCompletionHandler:", v7, v6, v5);

}

- (void)loadLeaderboardsWithHandler:(void *)handler
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = handler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboardSet.m", 183, "-[GKLeaderboardSet loadLeaderboardsWithHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke;
  v14[3] = &unk_1E75B1788;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v8, "perform:", v14);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke_4;
  v11[3] = &unk_1E75B1BF0;
  v12 = v8;
  v13 = v4;
  v9 = v8;
  v10 = v4;
  objc_msgSend(v9, "notifyOnMainQueueWithBlock:", v11);

}

void __48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke(uint64_t a1, void *a2)
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
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGame currentGame](GKGame, "currentGame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gameDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke_2;
  v12[3] = &unk_1E75B1C58;
  v13 = *(id *)(a1 + 40);
  v14 = v3;
  v11 = v3;
  objc_msgSend(v5, "getLeaderboardsForGameDescriptor:player:leaderboardIDs:setIdentifier:handler:", v7, v9, 0, v10, v12);

}

void __48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "_gkMapWithBlock:", &__block_literal_global_28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResult:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

GKLeaderboard *__48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  GKLeaderboard *v3;

  v2 = a2;
  v3 = -[GKLeaderboard initWithInternalRepresentation:]([GKLeaderboard alloc], "initWithInternalRepresentation:", v2);

  return v3;
}

void __48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v3;
  if (v3)
    v4 = v3;
  else
    v4 = MEMORY[0x1E0C9AA60];
  objc_msgSend(*(id *)(a1 + 32), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v4, v5);

}

+ (void)loadLeaderboardSetsForGame:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboardSet.m", 210, "+[GKLeaderboardSet loadLeaderboardSetsForGame:withCompletionHandler:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E75B1788;
    v16 = v5;
    v10 = v8;
    v17 = v10;
    objc_msgSend(v10, "perform:", v15);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke_4;
    v12[3] = &unk_1E75B1BF0;
    v13 = v10;
    v14 = v6;
    v11 = v10;
    objc_msgSend(v11, "notifyOnMainQueueWithBlock:", v12);

  }
}

void __69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "gameDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E75B1C58;
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "getLeaderboardSetsForGameDescriptor:handler:", v6, v8);

}

void __69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setError:", a3);
  if (objc_msgSend(v7, "count"))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "_gkMapConcurrentlyWithBlock:", &__block_literal_global_30);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("leaderboardSets"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

GKLeaderboardSet *__69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  GKLeaderboardSet *v3;

  v2 = a2;
  v3 = -[GKLeaderboardSet initWithInternalRepresentation:]([GKLeaderboardSet alloc], "initWithInternalRepresentation:", v2);

  return v3;
}

void __69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("leaderboardSets"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

+ (void)loadLeaderboardSetsWithCompletionHandler:(void *)completionHandler
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = completionHandler;
  +[GKGame currentGame](GKGame, "currentGame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__GKLeaderboardSet_loadLeaderboardSetsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E75B1CF0;
  v7 = v3;
  v5 = v3;
  +[GKLeaderboardSet loadLeaderboardSetsForGame:withCompletionHandler:](GKLeaderboardSet, "loadLeaderboardSetsForGame:withCompletionHandler:", v4, v6);

}

void __61__GKLeaderboardSet_loadLeaderboardSetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
    }
    else if (v9)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v9, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

    }
  }

}

- (GKLeaderboardSetInternal)internal
{
  return (GKLeaderboardSetInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
