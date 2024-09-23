@implementation CNShareLocationController

- (void)setContact:(id)a3
{
  id v5;
  void *v6;
  _QWORD v7[5];

  v5 = a3;
  if ((-[CNContact isEqual:](self->_contact, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    objc_msgSend((id)objc_opt_class(), "fmlHandlesFromContact:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNShareLocationController setHandles:](self, "setHandles:", v6);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__CNShareLocationController_setContact___block_invoke;
    v7[3] = &unk_1E204F320;
    v7[4] = self;
    -[CNShareLocationController canShareWithCompletion:](self, "canShareWithCompletion:", v7);
  }

}

- (void)setHandles:(id)a3
{
  objc_storeStrong((id *)&self->_handles, a3);
}

- (void)startUpdatingFriends
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location[2];

  -[CNShareLocationController findMyLocateSession](self, "findMyLocateSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNShareLocationController findMyLocateSession](self, "findMyLocateSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startUpdatingFriendsWithInitialUpdates:completionHandler:", 0, &__block_literal_global_41850);

    objc_initWeak(location, self);
    -[CNShareLocationController findMyLocateSession](self, "findMyLocateSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__CNShareLocationController_startUpdatingFriends__block_invoke_52;
    v7[3] = &unk_1E204D250;
    objc_copyWeak(&v8, location);
    objc_msgSend(v5, "setFriendshipUpdateCallback:", v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
  else
  {
    CNUILogContactCard();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_18AC56000, v6, OS_LOG_TYPE_ERROR, "CNShareLocationController, can't start updating friends, findMyLocateSession is nil.", (uint8_t *)location, 2u);
    }

  }
}

- (_TtC10ContactsUI19FindMyLocateSession)findMyLocateSession
{
  return self->_findMyLocateSession;
}

- (void)setShareLocationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_shareLocationDelegate, a3);
}

- (CNShareLocationController)initWithIDSAvailabilityProvider:(id)a3
{
  id v4;
  _TtC10ContactsUI19FindMyLocateSession *v5;
  void *v6;
  void *v7;
  CNShareLocationController *v8;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "findMyFunctionalityAvailable"))
    v5 = objc_alloc_init(_TtC10ContactsUI19FindMyLocateSession);
  else
    v5 = 0;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultSchedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNShareLocationController initWithIDSAvailabilityProvider:fmlSession:schedulerProvider:](self, "initWithIDSAvailabilityProvider:fmlSession:schedulerProvider:", v4, v5, v7);

  return v8;
}

- (void)canShareWithCompletion:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "findMyFunctionalityAvailable")
    && (v5 = +[FindMyLocateSession hasCorrectPermissionsForLocationSharing](_TtC10ContactsUI19FindMyLocateSession, "hasCorrectPermissionsForLocationSharing"), -[CNShareLocationController handles](self, "handles"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "count"), v6, v5)&& v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__CNShareLocationController_canShareWithCompletion___block_invoke;
    v8[3] = &unk_1E204D170;
    v9 = v4;
    -[CNShareLocationController friendshipStateWithCompletion:](self, "friendshipStateWithCompletion:", v8);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

+ (BOOL)findMyFunctionalityAvailable
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlementVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D137B8];
  v12 = 0;
  v5 = objc_msgSend(v3, "currentProcessHasBooleanEntitlement:error:", v4, &v12);

  if ((v5 & 1) == 0)
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNShareLocationController.m", 418, 4, CFSTR("Missing entitlement for FindMyLocate. Please add com.apple.findmy.findmylocate.friendshipservice to the entitlements and mach services in the app."), v6, v7, v8, v9, v11);
  return v5;
}

- (NSSet)handles
{
  return self->_handles;
}

uint64_t __40__CNShareLocationController_setContact___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "initiateIDSRequest");
  return result;
}

- (CNShareLocationController)initWithIDSAvailabilityProvider:(id)a3 fmlSession:(id)a4 schedulerProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNShareLocationController *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *serialQueue;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNShareLocationController;
  v12 = -[CNShareLocationController init](&v16, sel_init);
  if (v12)
  {
    if (LoadAppleAccount_loadPredicate != -1)
      dispatch_once(&LoadAppleAccount_loadPredicate, &__block_literal_global_152);
    objc_storeStrong((id *)&v12->_idsAvailabilityProvider, a3);
    objc_storeStrong((id *)&v12->_schedulerProvider, a5);
    objc_storeStrong((id *)&v12->_findMyLocateSession, a4);
    v13 = dispatch_queue_create("CNShareLocationController.serialQueue", 0);
    serialQueue = v12->_serialQueue;
    v12->_serialQueue = (OS_dispatch_queue *)v13;

  }
  return v12;
}

void __49__CNShareLocationController_startUpdatingFriends__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CNUILogContactCard();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_error_impl(&dword_18AC56000, v4, OS_LOG_TYPE_ERROR, "FindMyLocateSession startUpdatingFriendsWithCompletion failed with an error. %@ ", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "FindMyLocateSession startUpdatingFriendsWithCompletion completed.", (uint8_t *)&v5, 2u);
  }

}

+ (id)fmlHandlesFromContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v3, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v9), "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v7);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v3, "phoneNumbers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v15), "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "unformattedInternationalStringValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v13);
  }

  v18 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = v4;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v19);
        +[CNFMLHandle handleWithIdentifier:](CNFMLHandle, "handleWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v23), (_QWORD)v26);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v21);
  }

  return v18;
}

- (void)isSharingWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__CNShareLocationController_isSharingWithCompletion___block_invoke;
  v6[3] = &unk_1E204D170;
  v7 = v4;
  v5 = v4;
  -[CNShareLocationController friendshipStateWithCompletion:](self, "friendshipStateWithCompletion:", v6);

}

- (void)friendshipStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CNShareLocationController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CNShareLocationController_friendshipStateWithCompletion___block_invoke;
  v7[3] = &unk_1E204F9B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)actionsMenuProviderWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD *);
  _QWORD v5[4];
  id v6;
  id location;

  v4 = (void (**)(id, _QWORD *))a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke;
  v5[3] = &unk_1E204D1C0;
  objc_copyWeak(&v6, &location);
  v4[2](v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)shareLocationWithExpiration:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CNShareLocationController bestPropertyFuture](self, "bestPropertyFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v5, "resultWithTimeout:error:", &v19, 2.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    CNUILogContactCard();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    v14 = "CNShareLocationController, failed to get best property when sharing: %@";
    v15 = v9;
    v16 = 12;
LABEL_13:
    _os_log_error_impl(&dword_18AC56000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    goto LABEL_3;
  }
  -[CNShareLocationController findMyLocateSession](self, "findMyLocateSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    CNUILogContactCard();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    *(_WORD *)buf = 0;
    v14 = "CNShareLocationController, can't start sharing, findMyLocateSession is nil.";
    v15 = v9;
    v16 = 2;
    goto LABEL_13;
  }
  objc_msgSend((id)objc_opt_class(), "fmlHandleFromContactProperty:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v9 = v11;
    -[CNShareLocationController findMyLocateSession](self, "findMyLocateSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__CNShareLocationController_shareLocationWithExpiration___block_invoke;
    v18[3] = &unk_1E204D1E8;
    v18[4] = self;
    objc_msgSend(v12, "sendFriendshipOfferTo:end:isFromGroup:completion:", v13, a3, 0, v18);

  }
  else
  {
    CNUILogContactCard();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v17, OS_LOG_TYPE_ERROR, "CNShareLocationController, failed to get best handle from best property when sharing", buf, 2u);
    }

    v9 = 0;
  }
LABEL_3:

}

- (void)stopSharingLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  -[CNShareLocationController findMyLocateSession](self, "findMyLocateSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNShareLocationController findMyLocateSession](self, "findMyLocateSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNShareLocationController handles](self, "handles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__CNShareLocationController_stopSharingLocation__block_invoke;
    v8[3] = &unk_1E204D1E8;
    v8[4] = self;
    objc_msgSend(v4, "stopSharingLocationWith:isFromGroup:completion:", v6, 0, v8);

  }
  else
  {
    CNUILogContactCard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v7, OS_LOG_TYPE_ERROR, "CNShareLocationController, can't stop sharing, findMyLocateSession is nil.", buf, 2u);
    }

  }
}

- (id)endOfDayDate
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextDateAfterDate:matchingUnit:value:options:", v3, 32, 4, 1024);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)stopUpdatingFriends
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  -[CNShareLocationController findMyLocateSession](self, "findMyLocateSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  CNUILogContactCard();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18AC56000, v5, OS_LOG_TYPE_DEFAULT, "FindMyLocateSession stop updating friends!", v6, 2u);
    }

    -[CNShareLocationController findMyLocateSession](self, "findMyLocateSession");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject stopUpdatingFriendsWithCompletionHandler:](v5, "stopUpdatingFriendsWithCompletionHandler:", &__block_literal_global_54);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18AC56000, v5, OS_LOG_TYPE_ERROR, "CNShareLocationController, can't stop updating friends, findMyLocateSession is nil.", buf, 2u);
  }

}

- (void)initiateIDSRequest
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint8_t buf[16];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[3];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  -[CNShareLocationController bestPropertyCancelable](self, "bestPropertyCancelable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v51 = (void *)objc_opt_new();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  -[CNShareLocationController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v61;
    v9 = *MEMORY[0x1E0C967C0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v61 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0C97280];
        -[CNShareLocationController contact](self, "contact");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "contactPropertyWithContact:propertyKey:identifier:", v13, v9, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v51, "addObject:", v15);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    }
    while (v7);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[CNShareLocationController contact](self, "contact");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "emailAddresses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v57;
    v21 = *MEMORY[0x1E0C966A8];
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v57 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        v24 = (void *)MEMORY[0x1E0C97280];
        -[CNShareLocationController contact](self, "contact");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "contactPropertyWithContact:propertyKey:identifier:", v25, v21, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v51, "addObject:", v27);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v19);
  }

  objc_msgSend(MEMORY[0x1E0D13CA0], "bestPropertyComparator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "sortUsingComparator:", v28);

  objc_msgSend(v51, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[CNShareLocationController schedulerProvider](self, "schedulerProvider");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = objc_alloc(MEMORY[0x1E0D13D08]);
    -[CNShareLocationController idsAvailabilityProvider](self, "idsAvailabilityProvider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithIDSAvailabilityProvider:", v32);

    objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", v29);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNShareLocationController contact](self, "contact");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "resolveBestFaceTimeIDSPropertyForContact:schedulerProvider:", v34, v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "onErrorHandler:", &__block_literal_global_60_41837);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNShareLocationController contact](self, "contact");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "resolveBestIMessageIDSPropertyForContact:schedulerProvider:", v36, v30);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "onErrorHandler:", &__block_literal_global_60_41837);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = (void *)MEMORY[0x1E0D13AE8];
    v64[0] = v49;
    v64[1] = v38;
    v64[2] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "concatenate:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "take:", 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_alloc_init(MEMORY[0x1E0D13B20]);
    objc_msgSend(v43, "future");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNShareLocationController setBestPropertyFuture:](self, "setBestPropertyFuture:", v44);

    -[NSObject backgroundScheduler](v30, "backgroundScheduler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __47__CNShareLocationController_initiateIDSRequest__block_invoke_63;
    v52[3] = &unk_1E204D2B8;
    v53 = v42;
    v54 = v43;
    v46 = v43;
    v47 = v42;
    objc_msgSend(v45, "performCancelableBlock:", v52);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNShareLocationController setBestPropertyCancelable:](self, "setBestPropertyCancelable:", v48);

  }
  else
  {
    CNUILogContactCard();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v30, OS_LOG_TYPE_ERROR, "CNShareLocationController: found no handles to check for IDS availability", buf, 2u);
    }
  }

}

- (void)notifySharingStatusDidChange
{
  void *v3;
  char v4;
  id v5;

  -[CNShareLocationController shareLocationDelegate](self, "shareLocationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNShareLocationController shareLocationDelegate](self, "shareLocationDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharingStatusDidChange");

  }
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNShareLocationProtocol)shareLocationDelegate
{
  return (CNShareLocationProtocol *)objc_loadWeakRetained((id *)&self->_shareLocationDelegate);
}

- (void)setFindMyLocateSession:(id)a3
{
  objc_storeStrong((id *)&self->_findMyLocateSession, a3);
}

- (CNUIIDSAvailabilityProvider)idsAvailabilityProvider
{
  return self->_idsAvailabilityProvider;
}

- (CNCancelable)bestPropertyCancelable
{
  return self->_bestPropertyCancelable;
}

- (void)setBestPropertyCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_bestPropertyCancelable, a3);
}

- (CNFuture)bestPropertyFuture
{
  return self->_bestPropertyFuture;
}

- (void)setBestPropertyFuture:(id)a3
{
  objc_storeStrong((id *)&self->_bestPropertyFuture, a3);
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_bestPropertyFuture, 0);
  objc_storeStrong((id *)&self->_bestPropertyCancelable, 0);
  objc_storeStrong((id *)&self->_idsAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_findMyLocateSession, 0);
  objc_destroyWeak((id *)&self->_shareLocationDelegate);
  objc_storeStrong((id *)&self->_contact, 0);
}

void __47__CNShareLocationController_initiateIDSRequest__block_invoke_63(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0D13AF0];
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "completionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observerWithCompletionHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscribe:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addCancelable:", v8);
}

id __47__CNShareLocationController_initiateIDSRequest__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CNUILogContactCard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v2;
    _os_log_error_impl(&dword_18AC56000, v3, OS_LOG_TYPE_ERROR, "CNShareLocationController, Contact IDS Property Resolver failed to find best property: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __48__CNShareLocationController_stopUpdatingFriends__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CNUILogContactCard();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_error_impl(&dword_18AC56000, v4, OS_LOG_TYPE_ERROR, "FindMyLocateSession stopUpdatingFriendsWithCompletion failed with an error. %@ ", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "FindMyLocateSession stopUpdatingFriendsWithCompletion completed.", (uint8_t *)&v5, 2u);
  }

}

void __49__CNShareLocationController_startUpdatingFriends__block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    v9 = objc_loadWeakRetained(v4);
    objc_msgSend(v9, "schedulerProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mainThreadScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__CNShareLocationController_startUpdatingFriends__block_invoke_2;
    v12[3] = &unk_1E204F880;
    objc_copyWeak(&v13, v4);
    objc_msgSend(v11, "performBlock:", v12);

    objc_destroyWeak(&v13);
  }

}

void __49__CNShareLocationController_startUpdatingFriends__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifySharingStatusDidChange");

}

void __48__CNShareLocationController_stopSharingLocation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    CNUILogContactCard();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_error_impl(&dword_18AC56000, v4, OS_LOG_TYPE_ERROR, "CNShareLocationController, can't stop sharing: %@ ", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CNShareLocationController_stopSharingLocation__block_invoke_49;
  v7[3] = &unk_1E204F648;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "performBlock:", v7);

}

uint64_t __48__CNShareLocationController_stopSharingLocation__block_invoke_49(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifySharingStatusDidChange");
}

void __57__CNShareLocationController_shareLocationWithExpiration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    CNUILogContactCard();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_error_impl(&dword_18AC56000, v4, OS_LOG_TYPE_ERROR, "CNShareLocationController, can't start sharing: %@ ", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CNShareLocationController_shareLocationWithExpiration___block_invoke_47;
  v7[3] = &unk_1E204F648;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "performBlock:", v7);

}

uint64_t __57__CNShareLocationController_shareLocationWithExpiration___block_invoke_47(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifySharingStatusDidChange");
}

id __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t v13[16];
  _QWORD v14[5];
  NSObject *v15;
  _QWORD *v16;
  uint64_t *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__41862;
  v24 = __Block_byref_object_dispose__41863;
  v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__41862;
  v18[4] = __Block_byref_object_dispose__41863;
  v19 = (id)MEMORY[0x1E0C9AA60];
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_20;
  v14[3] = &unk_1E204D198;
  v16 = v18;
  v17 = &v20;
  v14[4] = WeakRetained;
  v9 = v8;
  v15 = v9;
  objc_msgSend(WeakRetained, "friendshipStateWithCompletion:", v14);
  CNUILogContactCard();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_18AC56000, v10, OS_LOG_TYPE_DEFAULT, "FindMyLocateSession building shareMyLocation actions menu.", v13, 2u);
  }

  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (id)v21[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_20(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  uint8_t v46[8];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[6];

  if (a2 == 1)
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v12 = (void *)MEMORY[0x1E0DC3428];
    CNContactsUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION_INDEFINITELY_TEXT"), &stru_1E20507A8, CFSTR("Localized"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("infinity"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_4;
    v49[3] = &unk_1E2050228;
    v49[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v14, v15, 0, v49);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObject:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v22 = (void *)MEMORY[0x1E0DC3428];
    CNContactsUIBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION_END_OF_DAY_TEXT"), &stru_1E20507A8, CFSTR("Localized"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("calendar"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v16;
    v48[1] = 3221225472;
    v48[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_6;
    v48[3] = &unk_1E2050228;
    v48[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v22, "actionWithTitle:image:identifier:handler:", v24, v25, 0, v48);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayByAddingObject:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

    v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v31 = (void *)MEMORY[0x1E0DC3428];
    CNContactsUIBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION_ONE_HOUR_TEXT"), &stru_1E20507A8, CFSTR("Localized"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("clock"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_8;
    v47[3] = &unk_1E2050228;
    v47[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v31, "actionWithTitle:image:identifier:handler:", v33, v34, 0, v47);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "arrayByAddingObject:", v35);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v38 = *(void **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v36;

  }
  else if (!a2)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v4 = (void *)MEMORY[0x1E0DC3428];
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION_STOP_SHARING_TEXT"), &stru_1E20507A8, CFSTR("Localized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_2;
    v50[3] = &unk_1E2050228;
    v50[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v50);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  v39 = (void *)MEMORY[0x1E0DC39D0];
  CNContactsUIBundle();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION_ALERT_MESSAGE"), &stru_1E20507A8, CFSTR("Localized"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "menuWithTitle:children:", v41, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v44 = *(void **)(v43 + 40);
  *(_QWORD *)(v43 + 40) = v42;

  CNUILogContactCard();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v46 = 0;
    _os_log_impl(&dword_18AC56000, v45, OS_LOG_TYPE_DEFAULT, "FindMyLocateSession shareMyLocation actions menu complete.", v46, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_3;
  v4[3] = &unk_1E204F648;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "performBlock:", v4);

}

void __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_5;
  v4[3] = &unk_1E204F648;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "performBlock:", v4);

}

void __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_7;
  v4[3] = &unk_1E204F648;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "performBlock:", v4);

}

void __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_9;
  v4[3] = &unk_1E204F648;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "performBlock:", v4);

}

uint64_t __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shareLocationWithExpiration:", 0);
}

uint64_t __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shareLocationWithExpiration:", 1);
}

uint64_t __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shareLocationWithExpiration:", 2);
}

uint64_t __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopSharingLocation");
}

uint64_t __59__CNShareLocationController_friendshipStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "handles", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v2);
      v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
      objc_msgSend(*(id *)(a1 + 32), "findMyLocateSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "findMyLocateSession");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "friendshipState:", v7);

        if (v10 < 2)
          break;
      }
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __53__CNShareLocationController_isSharingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

uint64_t __52__CNShareLocationController_canShareWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 2);
}

+ (id)fmlHandleFromContactProperty:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C967C0]);

  if (v5)
  {
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unformattedInternationalStringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_7:
      v10 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v3, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C966A8]);

    if (!v9)
      goto LABEL_7;
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_7;
  }
  +[CNFMLHandle handleWithIdentifier:](CNFMLHandle, "handleWithIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v10;
}

@end
