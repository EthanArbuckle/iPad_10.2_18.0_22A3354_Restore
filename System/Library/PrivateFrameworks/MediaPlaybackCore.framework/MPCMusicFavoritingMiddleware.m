@implementation MPCMusicFavoritingMiddleware

- (void)setInvalidationObservers:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationObservers, a3);
}

- (id)requestingUserSubscriptionStatus:(id)a3 chain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "nextObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMusicFavoritingMiddleware requestingUserSubscriptionStatus](self, "requestingUserSubscriptionStatus");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (id)v9;
  else
    v11 = v7;
  objc_msgSend(v8, "requestingUserSubscriptionStatus:chain:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (ICMusicSubscriptionStatus)requestingUserSubscriptionStatus
{
  return self->_requestingUserSubscriptionStatus;
}

- (void)setRequestingUserSubscriptionStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingUserSubscriptionStatus, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

- (id)operationsForRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPCMusicFavoritingMiddleware operationsForPlayerRequest:](self, "operationsForPlayerRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (id)operationsForPlayerRequest:(id)a3
{
  id v4;
  MPCMusicFavoritingMiddlewareOperation *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[MPCMusicFavoritingMiddlewareOperation initWithMiddleware:playerRequest:]([MPCMusicFavoritingMiddlewareOperation alloc], "initWithMiddleware:playerRequest:", self, v4);

  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_stateDumpObject
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("requestingUserSubscriptionStatus");
  -[MPCMusicFavoritingMiddleware requestingUserSubscriptionStatus](self, "requestingUserSubscriptionStatus");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("<NULL>");
  v13[1] = v6;
  v12[2] = CFSTR("invalidationObservers");
  -[MPCMusicFavoritingMiddleware invalidationObservers](self, "invalidationObservers");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("<NULL>");
  v13[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

@end
