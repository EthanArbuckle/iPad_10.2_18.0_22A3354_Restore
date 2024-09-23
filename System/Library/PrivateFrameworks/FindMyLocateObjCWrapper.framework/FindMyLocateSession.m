@implementation FindMyLocateSession

- (FindMyLocateSession)init
{
  FindMyLocateSession *v2;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FindMyLocateSession;
  v2 = -[FindMyLocateSession init](&v5, sel_init);
  v3 = objc_alloc_init(_TtC23FindMyLocateObjCWrapper13ObjCBootstrap);
  -[FindMyLocateSession setTrampoline:](v2, "setTrampoline:", v3);

  return v2;
}

- (void)setLocationUpdateCallback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocationUpdateCallback:", v4);

}

- (id)locationUpdateCallback
{
  void *v2;
  void *v3;

  -[FindMyLocateSession trampoline](self, "trampoline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationUpdateCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFriendshipUpdateCallback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFriendshipUpdateCallback:", v4);

}

- (id)friendshipUpdateCallback
{
  void *v2;
  void *v3;

  -[FindMyLocateSession trampoline](self, "trampoline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "friendshipUpdateCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setMeDeviceUpdateCallback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMeDeviceUpdateCallback:", v4);

}

- (id)meDeviceUpdateCallback
{
  void *v2;
  void *v3;

  -[FindMyLocateSession trampoline](self, "trampoline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "meDeviceUpdateCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)sendFriendshipOfferToHandles:(id)a3 expiration:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendFriendshipOfferTo:from:end:isFromGroup:completionHandler:", v11, 0, a4, v6, v10);

}

- (void)sendFriendshipOfferToHandles:(id)a3 from:(id)a4 expiration:(int64_t)a5 isFromGroup:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a6;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendFriendshipOfferTo:from:end:isFromGroup:completionHandler:", v14, v13, a5, v7, v12);

}

- (void)sendFriendshipInviteToHandle:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendFriendshipInviteTo:from:isFromGroup:completionHandler:", v9, 0, v5, v8);

}

- (void)sendFriendshipInviteToHandle:(id)a3 from:(id)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendFriendshipInviteTo:from:isFromGroup:completionHandler:", v12, v11, v6, v10);

}

- (void)stopSharingLocationWith:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stopSharingLocationWith:from:isFromGroup:completionHandler:", v9, 0, v5, v8);

}

- (void)stopSharingLocationWith:(id)a3 from:(id)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stopSharingLocationWith:from:isFromGroup:completionHandler:", v12, v11, v6, v10);

}

- (void)startRefreshingLocationForHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startRefreshingLocationFor:priority:isFromGroup:reverseGeocode:completionHandler:", v11, a4, v6, 1, v10);

}

- (void)startRefreshingLocationForHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 reverseGeocode:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;

  v7 = a6;
  v8 = a5;
  v12 = a7;
  v13 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startRefreshingLocationFor:priority:isFromGroup:reverseGeocode:completionHandler:", v13, a4, v8, v7, v12);

}

- (void)stopRefreshingLocationForHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopRefreshingLocationFor:priority:isFromGroup:completionHandler:", v11, a4, v6, v10);

}

- (void)stopRefreshingLocationWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopRefreshingLocationWithCompletionHandler:", v4);

}

- (void)startUpdatingFriendsWithInitialUpdates:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startUpdatingFriendsWithInitialUpdates:completionHandler:", v4, v6);

}

- (void)stopUpdatingFriendsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopUpdatingFriendsWithCompletionHandler:", v4);

}

- (void)startMonitoringActiveLocationSharingDeviceChangeWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startMonitoringActiveLocationSharingDeviceWithCompletionHandler:", v4);

}

- (void)setActiveLocationSharingDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActiveLocationSharingDevice:completionHandler:", v7, v6);

}

- (void)getActiveLocationSharingDeviceWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getActiveLocationSharingDeviceWithCompletionHandler:", v4);

}

- (void)getFriendsSharingLocationsWithMeWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getFriendsWith:completionHandler:", 1, v4);

}

- (void)getFriendsFollowingMyLocationWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getFriendsWith:completionHandler:", 0, v4);

}

- (void)canShareLocationWithHandle:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "canShareLocationWithHandle:isFromGroup:completionHandler:", v9, v5, v8);

}

- (void)friendshipStateWithHandle:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "friendshipStateWithHandle:isFromGroup:completionHandler:", v9, v5, v8);

}

- (void)getOfferExpirationForHandle:(id)a3 groupId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getOfferExpirationForHandle:groupId:completionHandler:", v10, v9, v8);

}

+ (BOOL)FMFAllowed
{
  void *v2;

  if ((objc_msgSend((id)FMFAllowed_fmfAllowedNumber, "BOOLValue") & 1) == 0)
  {
    v2 = (void *)MGCopyAnswer();
    objc_storeStrong((id *)&FMFAllowed_fmfAllowedNumber, v2);
    if (v2)
      CFRelease(v2);
  }
  return objc_msgSend((id)FMFAllowed_fmfAllowedNumber, "BOOLValue");
}

+ (BOOL)FMFRestricted
{
  uint64_t v2;
  void *v3;

  v2 = *MEMORY[0x24BE63930];
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "effectiveBoolValueForSetting:", v2) == 2;

  return v2;
}

- (id)cachedFriendsFollowingMyLocation
{
  void *v2;
  void *v3;

  -[FindMyLocateSession trampoline](self, "trampoline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedFriendsFollowingMyLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cachedFriendsSharingLocationsWithMe
{
  void *v2;
  void *v3;

  -[FindMyLocateSession trampoline](self, "trampoline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedFriendsSharingLocationWithMe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cachedLocationForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedLocationFor:includeAddress:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)cachedLocationForHandle:(id)a3 includeAddress:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedLocationFor:includeAddress:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)cachedOfferExpirationForHandle:(id)a3 groupId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedOfferExpirationFor:groupId:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)cachedCanShareLocationWithHandle:(id)a3 isFromGroup:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int64_t v8;

  v4 = a4;
  v6 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "cachedCanShareLocationWithHandle:isFromGroup:", v6, v4);

  return v8;
}

- (void)processLocationPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processLocationPayloadWithPayload:completionHandler:", v7, v6);

}

- (void)processLocationCommandPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FindMyLocateSession trampoline](self, "trampoline");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processLocationCommandPayloadWithPayload:completionHandler:", v7, v6);

}

- (_TtC23FindMyLocateObjCWrapper13ObjCBootstrap)trampoline
{
  return self->_trampoline;
}

- (void)setTrampoline:(id)a3
{
  objc_storeStrong((id *)&self->_trampoline, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trampoline, 0);
}

@end
