@implementation BBObserverGatewayEnumerator

- (BBObserverGatewayEnumerator)init
{
  BBObserverGatewayEnumerator *v2;
  NSMutableSet *v3;
  NSMutableSet *gatewaysPlayedLightsAndSirens;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BBObserverGatewayEnumerator;
  v2 = -[BBObserverGatewayEnumerator init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    gatewaysPlayedLightsAndSirens = v2->_gatewaysPlayedLightsAndSirens;
    v2->_gatewaysPlayedLightsAndSirens = v3;

  }
  return v2;
}

- (void)cancel
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[BBObserverGatewayEnumerator bulletin](self, "bulletin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bulletinID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBObserverGatewayEnumerator bulletin](self, "bulletin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Gateway enumerator for bulletin %{public}@ in section %{public}@ cancelled", (uint8_t *)&v9, 0x16u);

  }
  self->_cancelled = 1;
}

- (void)enumerateWithCompletion:(id)a3
{
  NSArray *gateways;
  id v5;
  id v6;

  gateways = self->_gateways;
  v5 = a3;
  -[NSArray objectEnumerator](gateways, "objectEnumerator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BBObserverGatewayEnumerator attemptNextGatewayInEnumerator:playLightsAndSirens:completion:](self, "attemptNextGatewayInEnumerator:playLightsAndSirens:completion:", v6, 1, v5);

}

- (void)attemptNextGatewayInEnumerator:(id)a3 playLightsAndSirens:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  BBBulletin *bulletin;
  unint64_t feeds;
  double gatewayTimeout;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  BBObserverGatewayEnumerator *v24;
  id v25;
  id v26;
  void (**v27)(_QWORD);
  BOOL v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v6 = a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  -[BBBulletin bulletinID](self->_bulletin, "bulletinID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin sectionID](self->_bulletin, "sectionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cancelled)
  {
    v14 = BBLogGateway;
    if (!os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:
      v9[2](v9);
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138543618;
    v30 = v10;
    v31 = 2114;
    v32 = v11;
    v15 = "Gateway enumerator was cancelled for bulletin %{public}@ in section %{public}@";
LABEL_4:
    _os_log_impl(&dword_20CCB9000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
    goto LABEL_5;
  }
  if (!v12)
  {
    -[BBObserverGatewayEnumerator sendToDefaultGatewayToPlayLightsAndSirens:](self, "sendToDefaultGatewayToPlayLightsAndSirens:", v6);
    v14 = BBLogGateway;
    if (!os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 138543618;
    v30 = v10;
    v31 = 2114;
    v32 = v11;
    v15 = "Gateway enumerator was completed for bulletin %{public}@ in section %{public}@";
    goto LABEL_4;
  }
  v16 = BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v30 = v13;
    v31 = 2114;
    v32 = v10;
    v33 = 2114;
    v34 = v11;
    _os_log_impl(&dword_20CCB9000, v16, OS_LOG_TYPE_DEFAULT, "Attempt gateway %{public}@ for bulletin %{public}@ in section %{public}@", buf, 0x20u);
  }
  bulletin = self->_bulletin;
  feeds = self->_feeds;
  gatewayTimeout = self->_gatewayTimeout;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __93__BBObserverGatewayEnumerator_attemptNextGatewayInEnumerator_playLightsAndSirens_completion___block_invoke;
  v20[3] = &unk_24C564C20;
  v21 = v13;
  v22 = v10;
  v23 = v11;
  v24 = self;
  v25 = v12;
  v28 = v6;
  v26 = v8;
  v27 = v9;
  objc_msgSend(v25, "sendAddBulletin:playLightsAndSirens:forFeeds:withTimeout:handler:", bulletin, v6, feeds, v20, gatewayTimeout);

LABEL_10:
}

void __93__BBObserverGatewayEnumerator_attemptNextGatewayInEnumerator_playLightsAndSirens_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const char *v14;
  uint64_t v15;
  _BYTE v16[22];
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
      v7 = "DID";
    else
      v7 = "DID NOT";
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v10 = *(void **)(a1 + 56);
    v12 = v6;
    v13 = objc_msgSend(v10, "cancelled");
    *(_DWORD *)v16 = 138544386;
    v14 = "NOT";
    *(_QWORD *)&v16[4] = v8;
    *(_WORD *)&v16[12] = 2082;
    if (v13)
      v14 = "";
    *(_QWORD *)&v16[14] = v7;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v11;
    v21 = 2082;
    v22 = v14;
    _os_log_impl(&dword_20CCB9000, v12, OS_LOG_TYPE_DEFAULT, "Gateway enumerator received from %{public}@ %{public}s play lights and sirens for %{public}@ in section %{public}@ currently %{public}s cancelled", v16, 0x34u);

  }
  if (a2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 48), "addObject:", *(_QWORD *)(a1 + 64));
  if (*(_BYTE *)(a1 + 88))
    v15 = a2 ^ 1u;
  else
    v15 = 0;
  objc_msgSend(*(id *)(a1 + 56), "attemptNextGatewayInEnumerator:playLightsAndSirens:completion:", *(_QWORD *)(a1 + 72), v15, *(_QWORD *)(a1 + 80), *(_OWORD *)v16);

}

- (id)defaultGateway
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_gateways;
  v3 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "gatewayPriority", (_QWORD)v8) == 3)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)sendToDefaultGatewayToPlayLightsAndSirens:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[BBObserverGatewayEnumerator defaultGateway](self, "defaultGateway");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_gatewaysPlayedLightsAndSirens, "containsObject:", v5) & 1) == 0)
  {
    v6 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v5, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBBulletin bulletinID](self->_bulletin, "bulletinID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBBulletin sectionID](self->_bulletin, "sectionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Attempt default gateway %{public}@ for bulletin %{public}@ in section %{public}@", (uint8_t *)&v11, 0x20u);

    }
    objc_msgSend(v5, "sendObserversAddBulletin:playLightsAndSirens:forFeeds:", self->_bulletin, v3, self->_feeds);
  }

}

- (NSArray)gateways
{
  return self->_gateways;
}

- (void)setGateways:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
  objc_storeStrong((id *)&self->_bulletin, a3);
}

- (unint64_t)feeds
{
  return self->_feeds;
}

- (void)setFeeds:(unint64_t)a3
{
  self->_feeds = a3;
}

- (double)gatewayTimeout
{
  return self->_gatewayTimeout;
}

- (void)setGatewayTimeout:(double)a3
{
  self->_gatewayTimeout = a3;
}

- (NSMutableSet)gatewaysPlayedLightsAndSirens
{
  return self->_gatewaysPlayedLightsAndSirens;
}

- (void)setGatewaysPlayedLightsAndSirens:(id)a3
{
  objc_storeStrong((id *)&self->_gatewaysPlayedLightsAndSirens, a3);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewaysPlayedLightsAndSirens, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);
  objc_storeStrong((id *)&self->_gateways, 0);
}

@end
