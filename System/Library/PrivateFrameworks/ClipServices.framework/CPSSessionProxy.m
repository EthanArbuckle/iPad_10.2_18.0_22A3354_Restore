@implementation CPSSessionProxy

- (CPSSessionProxy)initWithURL:(id)a3
{
  id v4;
  NSURL *v5;
  NSURL *url;
  CPSSessionProxy *v7;
  objc_super v9;

  v4 = a3;
  if (v4
    && (v9.receiver = self,
        v9.super_class = (Class)CPSSessionProxy,
        (self = -[CPSSessionProxy init](&v9, sel_init)) != 0))
  {
    v5 = (NSURL *)objc_msgSend(v4, "copy");
    url = self->_url;
    self->_url = v5;

    self->_mutableIvarLock._os_unfair_lock_opaque = 0;
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_url, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSURL isEqual:](self->_url, "isEqual:", v4[3]);
  else
    v5 = 0;

  return v5;
}

- (BOOL)canRequestLocationConfirmation
{
  void *v2;
  char v3;
  void *v5;
  void *v6;

  -[CPSSessionProxy launchReason](self, "launchReason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("QR")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("AppclipCode")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("NFC")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("ClipTester")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ClipTester"));

  }
  return v3;
}

- (NSString)launchReason
{
  void *v3;
  NSString *v4;
  NSString *launchReason;
  __CFString *v6;
  __CFString *v7;
  NSString *v8;

  -[CPSSessionProxy configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchReason");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  launchReason = v4;
  if (!v4)
    launchReason = self->_launchReason;
  v6 = launchReason;

  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("Other");
  v8 = v7;

  return v8;
}

- (void)connectToService
{
  id v3;

  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerSessionProxy:", self);

}

- (void)disconnect
{
  id v3;

  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterSessionProxy:", self);

}

- (void)prewarmClip
{
  -[CPSSessionProxy prewarmClipWithCompletionHandler:](self, "prewarmClipWithCompletionHandler:", 0);
}

- (void)prewarmClipWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prewarmClipWithURL:completionHandler:", self->_url, v4);

}

- (void)fetchClipMetadataAndImages
{
  id v3;

  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchClipMetadataAndImagesWithURL:completionHandler:", self->_url, 0);

}

- (void)installClip
{
  -[CPSSessionProxy installClipWithCompletion:](self, "installClipWithCompletion:", 0);
}

- (void)installClipWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "installClipWithURL:completionHandler:", self->_url, v4);

}

- (void)cancel
{
  void *v3;
  NSURL *url;
  id v5;
  _QWORD v6[4];
  id v7;
  CPSSessionProxy *v8;

  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __25__CPSSessionProxy_cancel__block_invoke;
  v6[3] = &unk_24C3B9378;
  v7 = v3;
  v8 = self;
  v5 = v3;
  objc_msgSend(v5, "cancelPrewarmingClipWithURL:completionHandler:", url, v6);

}

uint64_t __25__CPSSessionProxy_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterSessionProxy:", *(_QWORD *)(a1 + 40));
}

- (void)openClipWithLaunchOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openClipWithURL:launchOptions:completion:", self->_url, v7, v6);

}

- (void)notifyWebClipActivationWithBundleID:(id)a3 referrerBundleID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notifyWebClipActivationWithBundleID:referrerBundleID:", v6, v5);

}

- (void)getLastLaunchOptionsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a3;
  -[CPSClipMetadata clipBundleID](self->_metadata, "clipBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata clipBundleID](self->_metadata, "clipBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getLastLaunchOptionsWithBundleID:completion:", v6, v7);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)checkAndConsumeShowsAppAttributionBannerWithCompletion:(id)a3
{
  void *v4;
  id showAppAttributionBannerCallback;
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a3;
  os_unfair_lock_lock(&self->_mutableIvarLock);
  if (self->_showAppAttributionBannerCallback)
  {
    os_unfair_lock_unlock(&self->_mutableIvarLock);
    v6[2](v6, 0);
  }
  else
  {
    v4 = (void *)MEMORY[0x20BD30A54](v6);
    showAppAttributionBannerCallback = self->_showAppAttributionBannerCallback;
    self->_showAppAttributionBannerCallback = v4;

    os_unfair_lock_unlock(&self->_mutableIvarLock);
    -[CPSSessionProxy _checkAndConsumeShowsAppAttributionBannerIfNeeded](self, "_checkAndConsumeShowsAppAttributionBannerIfNeeded");
  }

}

- (void)_checkAndConsumeShowsAppAttributionBannerIfNeeded
{
  os_unfair_lock_s *p_mutableIvarLock;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  p_mutableIvarLock = &self->_mutableIvarLock;
  os_unfair_lock_lock(&self->_mutableIvarLock);
  if (self->_showAppAttributionBannerCallback
    && !self->_isCheckingAppAttributionBannerCanShow
    && (-[CPSClipMetadata clipBundleID](self->_metadata, "clipBundleID"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    self->_isCheckingAppAttributionBannerCanShow = 1;
    os_unfair_lock_unlock(p_mutableIvarLock);
    objc_initWeak(&location, self);
    +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata webClipID](self->_metadata, "webClipID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __68__CPSSessionProxy__checkAndConsumeShowsAppAttributionBannerIfNeeded__block_invoke;
    v7[3] = &unk_24C3BA6D8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v5, "checkAndConsumeShowsAppAttributionBannerForBundleID:completion:", v6, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    os_unfair_lock_unlock(p_mutableIvarLock);
  }
}

void __68__CPSSessionProxy__checkAndConsumeShowsAppAttributionBannerIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  os_unfair_lock_s *v7;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained + 2;
    v7 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 2);
    LOBYTE(v7[3]._os_unfair_lock_opaque) = 0;
    v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD30A54](*(_QWORD *)&v7[4]._os_unfair_lock_opaque);
    v6 = *(void **)&v7[4]._os_unfair_lock_opaque;
    *(_QWORD *)&v7[4]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v4);
    v5[2](v5, a2);

    WeakRetained = v7;
  }

}

- (void)didDetermineAvailability:(BOOL)a3
{
  _BOOL8 v3;
  CPSSessionProxyDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "proxy:didDetermineAvailability:", self, v3);

  }
}

- (void)didUpdateMetadata:(id)a3
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_metadata, a3);
  -[CPSSessionProxy _checkAndConsumeShowsAppAttributionBannerIfNeeded](self, "_checkAndConsumeShowsAppAttributionBannerIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "proxyDidUpdateMetadata:", self);

  }
}

- (void)didFinishLoadingWithError:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "proxy:didFinishLoadingWithError:", self, v7);

  }
}

- (void)didUpdateInstallProgress:(id)a3
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_estimatedProgress, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "proxyDidChangeProgress:", self);

  }
}

- (void)didInstallApplicationPlaceholder
{
  CPSSessionProxyDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "proxyDidInstallApplicationPlaceholder:", self);

  }
}

- (void)didRetrieveApplicationIcon:(id)a3
{
  id WeakRetained;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_applicationIconFileURL, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "proxy:didRetrieveApplicationIcon:", self, v6);

}

- (void)didRetrieveBusinessIcon:(id)a3
{
  id WeakRetained;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_businessIconURL, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "proxyDidRetrieveBusinessIcon:", self);

}

- (void)didRetrieveHeroImage:(id)a3
{
  id WeakRetained;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_heroImageFileURL, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "proxy:didRetrieveHeroImage:", self, v6);

}

- (void)didFinishTestingAtTime:(double)a3
{
  id WeakRetained;

  self->_appLaunchTime = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "proxyAppDidLaunchForTesting:", self);

}

- (void)remoteServiceDidCrash
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "proxyRemoteServiceDidCrash:", self);

}

- (CPSSessionProxyDelegate)delegate
{
  return (CPSSessionProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (CPSClipMetadata)metadata
{
  return self->_metadata;
}

- (NSNumber)estimatedProgress
{
  return self->_estimatedProgress;
}

- (NSURL)applicationIconFileURL
{
  return self->_applicationIconFileURL;
}

- (NSURL)heroImageFileURL
{
  return self->_heroImageFileURL;
}

- (BOOL)usedByPPT
{
  return self->_usedByPPT;
}

- (void)setUsedByPPT:(BOOL)a3
{
  self->_usedByPPT = a3;
}

- (BOOL)originIsControlCenter
{
  return self->_originIsControlCenter;
}

- (void)setOriginIsControlCenter:(BOOL)a3
{
  self->_originIsControlCenter = a3;
}

- (void)setLaunchReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (void)setSourceBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)referrerBundleID
{
  return self->_referrerBundleID;
}

- (void)setReferrerBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CPSSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (double)appLaunchTime
{
  return self->_appLaunchTime;
}

- (NSURL)businessIconURL
{
  return self->_businessIconURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessIconURL, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_referrerBundleID, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_heroImageFileURL, 0);
  objc_storeStrong((id *)&self->_applicationIconFileURL, 0);
  objc_storeStrong((id *)&self->_estimatedProgress, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong(&self->_showAppAttributionBannerCallback, 0);
}

@end
