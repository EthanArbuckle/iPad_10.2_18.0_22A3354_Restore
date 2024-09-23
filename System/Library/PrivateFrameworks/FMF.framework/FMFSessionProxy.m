@implementation FMFSessionProxy

- (void)didUpdateFollowing:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateFollowing:", v4);

}

- (void)didUpdateFences:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateFences:", v4);

}

- (void)didUpdateFollowers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateFollowers:", v4);

}

- (void)setLocations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocations:", v4);

}

- (void)didUpdateLocations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateLocations:", v4);

}

- (FMFSession)session
{
  return (FMFSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (FMFSessionProxy)initWithFMFSession:(id)a3
{
  id v4;
  FMFSessionProxy *v5;
  FMFSessionProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMFSessionProxy;
  v5 = -[FMFSessionProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[FMFSessionProxy setSession:](v5, "setSession:", v4);

  return v6;
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (void)modelDidLoad
{
  id v2;

  -[FMFSessionProxy session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelDidLoad");

}

- (void)didChangeActiveLocationSharingDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didChangeActiveLocationSharingDevice:", v4);

}

- (void)didUpdatePreferences:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdatePreferences:", v4);

}

- (void)networkReachabilityUpdated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[FMFSessionProxy session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkReachabilityUpdated:", v3);

}

- (void)failedToGetLocationForHandle:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FMFSessionProxy session](self, "session");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "failedToGetLocationForHandle:error:", v7, v6);

}

- (void)didAddFollowerHandle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didAddFollowerHandle:", v4);

}

- (void)didRemoveFollowerHandle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didRemoveFollowerHandle:", v4);

}

- (void)didStartFollowingHandle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didStartFollowingHandle:", v4);

}

- (void)didStopFollowingHandle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didStopFollowingHandle:", v4);

}

- (void)didReceiveFriendshipRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReceiveFriendshipRequest:", v4);

}

- (void)didUpdateHideFromFollowersStatus:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[FMFSessionProxy session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didUpdateHideFromFollowersStatus:", v3);

}

- (void)didUpdatePendingOffersForHandles:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdatePendingOffersForHandles:", v4);

}

- (void)didUpdateActiveDeviceList:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateActiveDeviceList:", v4);

}

- (void)sendMappingPacket:(id)a3 toHandle:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FMFSessionProxy session](self, "session");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendMappingPacket:toHandle:", v7, v6);

}

- (void)didUpdateFavorites:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateFavorites:", v4);

}

- (void)abDidChange
{
  id v2;

  -[FMFSessionProxy session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "abDidChange");

}

- (void)abPreferencesDidChange
{
  id v2;

  -[FMFSessionProxy session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "abPreferencesDidChange");

}

- (void)didReceiveServerError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSessionProxy session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReceiveServerError:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
}

@end
