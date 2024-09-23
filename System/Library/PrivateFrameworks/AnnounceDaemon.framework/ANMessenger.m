@implementation ANMessenger

- (ANMessenger)init
{
  void *v3;
  void *v4;
  ANMessenger *v5;

  v3 = (void *)objc_opt_new();
  +[ANRapportConnection sharedConnection](ANRapportConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ANMessenger initWithIDSConnection:rapportConnection:](self, "initWithIDSConnection:rapportConnection:", v3, v4);

  return v5;
}

- (ANMessenger)initWithIDSConnection:(id)a3 rapportConnection:(id)a4
{
  id v7;
  id v8;
  ANMessenger *v9;
  uint64_t v10;
  OS_os_log *log;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ANMessenger;
  v9 = -[ANMessenger init](&v13, sel_init);
  if (v9)
  {
    ANLogWithCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    objc_storeStrong((id *)&v9->_idsConnection, a3);
    -[ANIDSConnectionProvider setDelegate:](v9->_idsConnection, "setDelegate:", v9);
    objc_storeStrong((id *)&v9->_rapportConnection, a4);
    -[ANRapportConnectionProvider setDelegate:](v9->_rapportConnection, "setDelegate:", v9);
    +[ANMessenger purgeTemporaryFiles](ANMessenger, "purgeTemporaryFiles");
  }

  return v9;
}

- (void)cleanForExit
{
  id v2;

  -[ANMessenger rapportConnection](self, "rapportConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deactivateLinkWithOptions:", 1);

}

- (ANParticipant)localParticipant
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[ANMessenger rapportConnection](self, "rapportConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "populateWithDevice:", v5);

  return (ANParticipant *)v3;
}

- (void)sendRequest:(id)a3 sentHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(v14, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  if (v8 >= 2)
  {
    if (v8 == 2)
    {
      objc_msgSend(v14, "destination");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "replyToSender");

      objc_msgSend(v14, "destination");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "announcement");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[ANMessenger sendReply:forAnnouncement:completion:](self, "sendReply:forAnnouncement:completion:", v14, v12, v6);
      else
        -[ANMessenger broadcastReply:forAnnouncement:completion:](self, "broadcastReply:forAnnouncement:completion:", v14, v12, v6);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1045, *MEMORY[0x1E0CF7C58]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v13);

    }
  }
  else
  {
    -[ANMessenger sendAnnouncement:sentHandler:](self, "sendAnnouncement:sentHandler:", v14, v6);
  }

}

- (void)sendAnnouncement:(id)a3 sentHandler:(id)a4
{
  -[ANMessenger sendAnnouncement:isRetry:sentHandler:](self, "sendAnnouncement:isRetry:sentHandler:", a3, 0, a4);
}

- (void)sendAnnouncement:(id)a3 isRetry:(BOOL)a4 sentHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD, id);
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  NSObject *v32;
  const __CFString *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  __CFString *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint8_t buf[4];
  const __CFString *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v6 = a4;
  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a5;
  objc_msgSend(v8, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "destination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rooms");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "destination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "zones");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "content");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)v13;
    +[ANValidationHelper performPreflightChecksForSendingContent:toHome:rooms:zones:](ANValidationHelper, "performPreflightChecksForSendingContent:toHome:rooms:zones:");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (id)v16;
      -[ANMessenger log](self, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v66 = v11;
        v67 = 2112;
        v68 = v13;
        v69 = 2112;
        v70 = v15;
        v71 = 2112;
        v72 = v17;
        _os_log_error_impl(&dword_1D23A0000, v18, OS_LOG_TYPE_ERROR, "Failed preflight check. Home = %@, Rooms = %@, Zones = %@, Error = %@", buf, 0x2Au);
      }

      v9[2](v9, 0, v17);
      +[ANAnalytics shared](ANAnalytics, "shared");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v11;
      v21 = objc_msgSend(v17, "code");
      v22 = v60;
      objc_msgSend(v60, "endpointIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v21;
      v11 = v20;
      objc_msgSend(v19, "error:context:", v25, v24);
    }
    else
    {
      -[ANMessenger idsConnection](self, "idsConnection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "service");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[ANMessenger locationForHome:rooms:zones:idsService:](ANMessenger, "locationForHome:rooms:zones:idsService:", v11, v61, v15, v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = 0;
      +[ANMessenger createAnnouncementWithRequest:forLocation:inHome:isReply:error:](ANMessenger, "createAnnouncementWithRequest:forLocation:inHome:isReply:error:", v8, v19, v11, 0, &v62);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v62;
      v59 = v11;
      if (v29)
      {
        v56 = v19;
        v30 = objc_msgSend(v19, "flags");
        v57 = v15;
        objc_msgSend(MEMORY[0x1E0CBA980], "hmu_roomsInZones:appendingRooms:", v15, v61);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v29;
        if (objc_msgSend(v29, "isRelayRequest"))
        {
          -[ANMessenger log](self, "log");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = CFSTR("Everyone");
            if ((v30 & 1) == 0)
              v33 = CFSTR("Rooms/Zones");
            *(_DWORD *)buf = 138412290;
            v66 = v33;
            _os_log_impl(&dword_1D23A0000, v32, OS_LOG_TYPE_DEFAULT, "Sending (Announce To %@) Relay Request", buf, 0xCu);
          }

          v23 = v31;
          v34 = v31;
          v11 = v59;
          -[ANMessenger _relayAnnouncementThroughHomePod:inHome:rooms:sentHandler:](self, "_relayAnnouncementThroughHomePod:inHome:rooms:sentHandler:", v34, v59, v24, v9);
          v22 = v60;
        }
        else
        {
          if ((v30 & 1) != 0)
          {
            objc_msgSend(v60, "homeKitUserIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42
              && (objc_msgSend(v60, "homeKitUserIdentifier"),
                  v43 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[__CFString hmu_userWithUniqueIdentifier:](v59, "hmu_userWithUniqueIdentifier:", v43),
                  v44 = objc_claimAutoreleasedReturnValue(),
                  v43,
                  v44))
            {
              v54 = (void *)v44;
              v64 = v44;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v54 = 0;
              v55 = (void *)MEMORY[0x1E0C9AA60];
            }
            +[ANHomeManager shared](ANHomeManager, "shared");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "currentAccessory");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              v53 = v46;
              objc_msgSend(v60, "endpointIdentifier");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (v47)
              {
                v48 = (void *)MEMORY[0x1E0C9AA60];
              }
              else
              {
                +[ANHomeManager shared](ANHomeManager, "shared");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "currentAccessory");
                v52 = v45;
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = v50;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
                v48 = (void *)objc_claimAutoreleasedReturnValue();

                v45 = v52;
              }

              v46 = v53;
            }
            else
            {
              v48 = (void *)MEMORY[0x1E0C9AA60];
            }

            -[ANMessenger rapportConnection](self, "rapportConnection");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            +[ANMessengerDestination destinationForHome:excludingUsers:excludingAccessories:rapportConnection:](ANMessengerDestination, "destinationForHome:excludingUsers:excludingAccessories:rapportConnection:", v59, v55, v48, v51);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = v57;
            v40 = v54;
          }
          else
          {
            -[ANMessenger rapportConnection](self, "rapportConnection");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[ANMessengerDestination destinationForAccessoriesInHome:rooms:rapportConnection:](ANMessengerDestination, "destinationForAccessoriesInHome:rooms:rapportConnection:", v59, v24, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
          }

          -[ANMessenger _sendAnnouncement:toDestination:sentHandler:](self, "_sendAnnouncement:toDestination:sentHandler:", v31, v41, v9);
          v23 = v31;
          v11 = v59;
          v22 = v60;
          v19 = v56;
        }
      }
      else
      {
        v9[2](v9, 0, v17);
        +[ANAnalytics shared](ANAnalytics, "shared");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v17, "code");
        objc_msgSend(v60, "endpointIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "error:context:", v58, v39);

        v22 = v60;
        v23 = 0;

      }
    }

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1002, *MEMORY[0x1E0CF7C58]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v26);

  }
  else
  {
    -[ANMessenger log](self, "log");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D23A0000, v35, OS_LOG_TYPE_DEFAULT, "Home is nil for sendAnnouncement, refreshing Home Manager and retrying", buf, 2u);
    }

    +[ANHomeManager shared](ANHomeManager, "shared");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend(v36, "refreshHomeSynchronous");

    -[ANMessenger sendAnnouncement:isRetry:sentHandler:](self, "sendAnnouncement:isRetry:sentHandler:", v8, 1, v9);
  }

}

- (void)sendReply:(id)a3 forAnnouncement:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void (**v26)(id, _QWORD, id);
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  ANMessenger *v34;
  id v35;
  void *v36;
  id v37;
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homeForID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  objc_msgSend(v16, "setFlags:", 0);
  v38 = 0;
  +[ANMessenger createAnnouncementWithRequest:forLocation:inHome:isReply:error:](ANMessenger, "createAnnouncementWithRequest:forLocation:inHome:isReply:error:", v8, v16, v14, 1, &v38);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v38;
  v37 = v18;
  if (v17)
  {
    v34 = self;
    v35 = v8;
    v19 = (void *)objc_opt_new();
    objc_msgSend(v9, "announcer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isAccessory");

    objc_msgSend(v9, "announcer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "homeKitID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v14, "hmu_accessoryWithUniqueIdentifierUUIDString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        objc_msgSend(v19, "addAccessory:", v24);
    }
    else
    {
      objc_msgSend(v14, "hmu_userWithUniqueIdentifierUUIDString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        objc_msgSend(v19, "addUser:inHome:", v24, v14);
    }
    v29 = v35;
    v33 = v37;

    -[ANMessenger _sendAnnouncement:toDestination:sentHandler:](v34, "_sendAnnouncement:toDestination:sentHandler:", v17, v19, v10);
  }
  else
  {
    v25 = v18;
    v10[2](v10, 0, v18);
    +[ANAnalytics shared](ANAnalytics, "shared");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v14;
    v26 = v10;
    v27 = objc_msgSend(v25, "code");
    objc_msgSend(v8, "content");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "endpointIdentifier");
    v29 = v8;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v27;
    v10 = v26;
    v14 = v36;
    objc_msgSend(v19, "error:context:", v32, v31);

    v33 = v37;
  }

}

- (void)broadcastReply:(id)a3 forAnnouncement:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  ANMessenger *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  ANMessenger *v76;
  void *v77;
  char v78;
  uint64_t v79;
  void *v80;
  void *v81;
  ANMessenger *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint8_t buf[4];
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v89 = a3;
  v8 = a4;
  v87 = a5;
  -[ANMessenger log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v94 = v10;
    _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "Replying to Announcement: %@", buf, 0xCu);

  }
  +[ANHomeManager shared](ANHomeManager, "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homeForID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[ANMessenger idsConnection](self, "idsConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANMessenger locationForReplyToAnnouncement:home:idsService:](ANMessenger, "locationForReplyToAnnouncement:home:idsService:", v8, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v90 = 0;
  +[ANMessenger createAnnouncementWithRequest:forLocation:inHome:isReply:error:](ANMessenger, "createAnnouncementWithRequest:forLocation:inHome:isReply:error:", v89, v17, v14, 1, &v90);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v90;
  v20 = v19;
  v88 = v8;
  if (!v18)
  {
    v39 = v87;
    (*((void (**)(id, _QWORD, id))v87 + 2))(v87, 0, v19);
    +[ANAnalytics shared](ANAnalytics, "shared");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v20, "code");
    objc_msgSend(v89, "content");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "endpointIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v37);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v41;
    v40 = v20;
    objc_msgSend(v22, "error:context:", v43, v42);

    goto LABEL_40;
  }
  v86 = v19;
  objc_msgSend(v17, "allRoomsInHome:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  objc_msgSend(v18, "announcer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "homeKitID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v18, "announcer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isAccessory");

    if (v26)
    {
      objc_msgSend(v14, "hmu_accessoryWithUniqueIdentifierUUIDString:", v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "room");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v17, "roomUUIDs");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v24;
        v31 = v8;
        v32 = v22;
        v33 = (void *)objc_msgSend(v29, "mutableCopy");

        objc_msgSend(v28, "uniqueIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "removeObject:", v34);

        v35 = (void *)objc_msgSend(v33, "copy");
        objc_msgSend(v17, "setRoomUUIDs:", v35);

        objc_msgSend(v32, "removeObject:", v28);
        v22 = v32;
        v8 = v31;
        v24 = v30;
      }

    }
  }
  if (!objc_msgSend(v18, "isRelayRequest"))
  {
    objc_msgSend(v89, "content");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "location");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "flags");

    v85 = v22;
    if ((v46 & 1) != 0)
    {
      objc_msgSend(v44, "homeKitUserIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55
        && (objc_msgSend(v44, "homeKitUserIdentifier"),
            v56 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v14, "hmu_userWithUniqueIdentifier:", v56),
            v57 = objc_claimAutoreleasedReturnValue(),
            v56,
            v57))
      {
        v84 = (void *)v57;
        v92 = v57;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
        v79 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v84 = 0;
        v79 = MEMORY[0x1E0C9AA60];
      }
      +[ANHomeManager shared](ANHomeManager, "shared");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "currentAccessory");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v44;
      if (v59)
      {
        objc_msgSend(v44, "endpointIdentifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          v61 = (void *)MEMORY[0x1E0C9AA60];
        }
        else
        {
          +[ANHomeManager shared](ANHomeManager, "shared");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "currentAccessory");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v65;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          v60 = 0;
        }
        v64 = v24;

      }
      else
      {
        v64 = v24;
        v61 = (void *)MEMORY[0x1E0C9AA60];
      }

      -[ANMessenger rapportConnection](self, "rapportConnection");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)v79;
      +[ANMessengerDestination destinationForHome:excludingUsers:excludingAccessories:rapportConnection:](ANMessengerDestination, "destinationForHome:excludingUsers:excludingAccessories:rapportConnection:", v14, v79, v61, v66);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = v86;
      v24 = v64;
      v44 = v81;
      v63 = v84;
      goto LABEL_37;
    }
    v83 = v24;
    v47 = (void *)objc_msgSend(v22, "copy");
    -[ANMessenger rapportConnection](self, "rapportConnection");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANMessengerDestination destinationForAccessoriesInHome:rooms:rapportConnection:](ANMessengerDestination, "destinationForAccessoriesInHome:rooms:rapportConnection:", v14, v47, v48);
    v49 = v8;
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v49, "announcer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "homeKitUserID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v49, "announcer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    v82 = self;
    if (v51)
    {
      objc_msgSend(v52, "homeKitUserID");
      v54 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v62 = objc_msgSend(v52, "isAccessory");

      if ((v62 & 1) != 0)
      {
        v63 = 0;
        v24 = v83;
        goto LABEL_32;
      }
      objc_msgSend(v88, "announcer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "homeKitID");
      v54 = objc_claimAutoreleasedReturnValue();
    }
    v68 = (void *)v54;
    v24 = v83;
    objc_msgSend(v14, "hmu_userWithUniqueIdentifierUUIDString:", v54);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_32:
    objc_msgSend(v44, "homeKitUserIdentifier");
    v69 = objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      v70 = (void *)v69;
      objc_msgSend(v44, "homeKitUserIdentifier");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "UUIDString");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "announcer");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "homeKitUserID");
      v73 = v17;
      v74 = v44;
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v71, "isEqualToString:", v75);

      v44 = v74;
      v17 = v73;

      v24 = v83;
      if ((v78 & 1) != 0)
      {
        self = v82;
        v40 = v86;
LABEL_38:

LABEL_39:
        v76 = self;
        v39 = v87;
        -[ANMessenger _sendAnnouncement:toDestination:sentHandler:](v76, "_sendAnnouncement:toDestination:sentHandler:", v18, v37, v87);

        v22 = v85;
        goto LABEL_40;
      }
    }
    if (!v63)
    {
      self = v82;
      v40 = v86;
      goto LABEL_39;
    }
    self = v82;
    -[ANMessenger rapportConnection](v82, "rapportConnection");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addUser:inHome:rapportConnection:", v63, v14, v67);
    v40 = v86;
LABEL_37:

    goto LABEL_38;
  }
  -[ANMessenger log](self, "log");
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D23A0000, v36, OS_LOG_TYPE_DEFAULT, "Sending (Reply) Relay Request", buf, 2u);
  }

  v37 = (void *)objc_msgSend(v22, "copy");
  v38 = self;
  v39 = v87;
  -[ANMessenger _relayAnnouncementThroughHomePod:inHome:rooms:sentHandler:](v38, "_relayAnnouncementThroughHomePod:inHome:rooms:sentHandler:", v18, v14, v37, v87);
  v40 = v86;
LABEL_40:

}

- (void)forwardAnnouncementToCompanion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANMessenger rapportConnection](self, "rapportConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairedCompanion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "supportsAnnounce"))
  {
    -[ANMessenger log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = (uint64_t)v9;
      _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "Forwarding announcement to companion %@", buf, 0xCu);

    }
    +[ANHomeManager shared](ANHomeManager, "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "homeUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "homeForID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "homeLocationStatus"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "location");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHomeLocationStatus:", v14);

      -[ANMessenger log](self, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_msgSend(v13, "homeLocationStatus");
        *(_DWORD *)buf = 134217984;
        v28 = v17;
        _os_log_impl(&dword_1D23A0000, v16, OS_LOG_TYPE_INFO, "Inserted Home Location Status: %ld", buf, 0xCu);
      }

      objc_msgSend(v4, "announcerNameInHome:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ANLocalizedString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if ((v20 & 1) == 0)
      {
        objc_msgSend(v4, "announcer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setName:", v18);

      }
    }
    -[ANMessenger rapportConnection](self, "rapportConnection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageForCompanion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __46__ANMessenger_forwardAnnouncementToCompanion___block_invoke;
    v26[3] = &unk_1E938F210;
    v26[4] = self;
    objc_msgSend(v22, "sendMessage:device:responseHandler:", v23, v7, v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[ANMessenger log](self, "log");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[ANMessenger forwardAnnouncementToCompanion:].cold.1(v7, (uint64_t)v24, v25);

    }
  }

}

void __46__ANMessenger_forwardAnnouncementToCompanion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "Announcement forwarded to companion over rapport: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)mockAnnouncement:(id)a3 playbackDeadline:(id)a4 sentHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  objc_msgSend(v8, "destination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0CF7E58]);
    objc_msgSend(v12, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithHomeID:", v14);

    objc_msgSend(v15, "setFlags:", 1);
    v31 = 0;
    +[ANMessenger createAnnouncementWithRequest:forLocation:inHome:isReply:error:](ANMessenger, "createAnnouncementWithRequest:forLocation:inHome:isReply:error:", v8, v15, v12, 1, &v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v31;
    if (v16)
    {
      objc_msgSend(v16, "setPlaybackDeadline:", v9);
      objc_msgSend(v16, "playbackDeadline");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v19 = (void *)MEMORY[0x1E0C99D68];
        -[ANMessenger _calculateAnnouncementDeadline:](self, "_calculateAnnouncementDeadline:", v16);
        v21 = v20;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dateWithTimeInterval:sinceDate:", v22, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPlaybackDeadline:", v23);

      }
      objc_msgSend(MEMORY[0x1E0CF7E80], "senderWithID:type:", &stru_1E93913D0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSender:", v24);

      v25 = objc_alloc(MEMORY[0x1E0CF7DF8]);
      objc_msgSend(v16, "message");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithMessage:", v26);

      -[ANMessenger log](self, "log");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "-[ANMessenger mockAnnouncement:playbackDeadline:sentHandler:]";
        v34 = 2112;
        v35 = v27;
        _os_log_impl(&dword_1D23A0000, v28, OS_LOG_TYPE_DEFAULT, "%s: Sending announcement: %@", buf, 0x16u);
      }

      -[ANMessenger delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "receivedAnnouncement:", v27);

      v10[2](v10, v27, 0);
    }
    else
    {
      ((void (**)(id, void *, id))v10)[2](v10, 0, v17);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1002, *MEMORY[0x1E0CF7C58]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v30);

  }
}

- (void)_relayAnnouncementThroughHomePod:(id)a3 inHome:(id)a4 rooms:(id)a5 sentHandler:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, id);
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v10 = a3;
  v11 = (void (**)(id, _QWORD, id))a6;
  v12 = a5;
  v13 = a4;
  -[ANMessenger rapportConnection](self, "rapportConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  +[ANMessengerDestination relayDestinationForHome:rooms:rapportConnection:error:](ANMessengerDestination, "relayDestinationForHome:rooms:rapportConnection:error:", v13, v12, v14, &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v17;
  if (v15)
  {
    -[ANMessenger _sendAnnouncement:toDestination:sentHandler:](self, "_sendAnnouncement:toDestination:sentHandler:", v10, v15, v11);
  }
  else
  {
    v11[2](v11, 0, v16);

    +[ANAnalytics shared](ANAnalytics, "shared");
    v11 = (void (**)(id, _QWORD, id))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "error:", objc_msgSend(v16, "code"));
  }

}

- (double)_calculateAnnouncementDeadline:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  int v17;
  const char *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberForDefault:", *MEMORY[0x1E0CF7AC0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v4, "fileData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "fileData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    -[ANMessenger log](self, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315650;
      v18 = "-[ANMessenger _calculateAnnouncementDeadline:]";
      v19 = 2048;
      v20 = (double)(v11 >> 10);
      v21 = 2048;
      v22 = v8;
      _os_log_impl(&dword_1D23A0000, v12, OS_LOG_TYPE_DEFAULT, "%s: Calculate announcement deadline. fileSize: %f defaultDeadline: %f", (uint8_t *)&v17, 0x20u);
    }

    if ((v11 - 204800) >> 10 >= 0x65)
    {
      if (v11 < 0x32000)
        v8 = v8 + -0.5;
      else
        v8 = v8 + 0.5;
    }
  }
  else
  {
    -[ANMessenger log](self, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ANMessenger _calculateAnnouncementDeadline:].cold.1(v13, v8, v14, v15);

  }
  return v8;
}

- (void)_fulfillRelayRequest:(id)a3 withSenderContext:(id)a4 sentHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v7, "action");
  if (v9 == 4)
  {
    v10 = 2;
  }
  else
  {
    if (v9 != 5)
      goto LABEL_6;
    v10 = 3;
  }
  objc_msgSend(v7, "setAction:", v10);
LABEL_6:
  +[ANHomeManager shared](ANHomeManager, "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homeForID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "flags") & 1) != 0)
  {
    objc_msgSend(v7, "announcer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "homeKitID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hmu_userWithUniqueIdentifierUUIDString:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v31[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0C9AA60];
    }
    -[ANMessenger rapportConnection](self, "rapportConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C9AA60];
    +[ANMessengerDestination destinationForHome:excludingUsers:excludingAccessories:rapportConnection:](ANMessengerDestination, "destinationForHome:excludingUsers:excludingAccessories:rapportConnection:", v14, v17, MEMORY[0x1E0C9AA60], v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setFlags:", objc_msgSend(v15, "flags") & 0xFFFFFFFFFFFFFFFDLL);
    objc_msgSend(v15, "setFlags:", objc_msgSend(v15, "flags") & 0xFFFFFFFFFFFFFFFBLL);
    objc_msgSend(v15, "setUserUUIDs:", v22);
    objc_msgSend(v15, "setDeviceIDs:", v22);
  }
  else
  {
    objc_msgSend(v15, "allRoomsInHome:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANMessenger rapportConnection](self, "rapportConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANMessengerDestination destinationForAccessoriesInHome:rooms:rapportConnection:](ANMessengerDestination, "destinationForAccessoriesInHome:rooms:rapportConnection:", v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v23 = (void *)MEMORY[0x1E0C99D68];
  -[ANMessenger _calculateAnnouncementDeadline:](self, "_calculateAnnouncementDeadline:", v7);
  v25 = v24;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dateWithTimeInterval:sinceDate:", v26, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaybackDeadline:", v27);

  v30 = 0;
  objc_msgSend(v7, "processAudioWithEffects:error:", objc_msgSend(MEMORY[0x1E0CF7DF8], "defaultAudioEffects"), &v30);
  v28 = v30;
  if (v28)
  {
    -[ANMessenger log](self, "log");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[ANMessenger _fulfillRelayRequest:withSenderContext:sentHandler:].cold.1();

  }
  -[ANMessenger _sendAnnouncement:toDestination:sentHandler:](self, "_sendAnnouncement:toDestination:sentHandler:", v7, v18, v8);

}

- (void)_forwardRelayRequest:(id)a3 withSenderContext:(id)a4 sentHandler:(id)a5
{
  void (**v7)(id, id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v7 = (void (**)(id, id, void *))a5;
  -[ANMessenger rapportConnection](self, "rapportConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "devices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pairedCompanion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "sender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 && v11)
  {
    objc_msgSend(v11, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "idsDeviceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) != 0)
    {
      +[ANHomeManager shared](ANHomeManager, "shared");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "location");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "homeUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "homeForID:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "location");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allRoomsInHome:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[ANMessenger _relayAnnouncementThroughHomePod:inHome:rooms:sentHandler:](self, "_relayAnnouncementThroughHomePod:inHome:rooms:sentHandler:", v26, v19, v21, v7);
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("Sender is not companion: %@ != %@"), v23, v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:description:", 1030, *MEMORY[0x1E0CF7C58], v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v26, v25);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:description:", 1030, *MEMORY[0x1E0CF7C58], CFSTR("Unable to validate sender"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v26, v19);
  }

}

- (void)_sendAnnouncement:(id)a3 toDestination:(id)a4 sentHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t i;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t m;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  double v107;
  double v108;
  NSObject *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  double v119;
  double v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  NSObject *v132;
  void *v133;
  void (**v134)(id, _QWORD, void *);
  void *v135;
  id v136;
  char *v137;
  uint64_t v138;
  id obj;
  id obja;
  id objb;
  uint64_t v142;
  void *v143;
  int v144;
  void *v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _QWORD v154[4];
  id v155;
  ANMessenger *v156;
  id v157;
  id v158;
  uint64_t v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  _QWORD v168[5];
  _BYTE v169[128];
  uint8_t v170[128];
  uint8_t buf[4];
  _BYTE v172[18];
  _BYTE v173[128];
  _BYTE v174[128];
  uint64_t v175;

  v175 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v145 = v9;
  objc_msgSend(v9, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANMessenger _logDebugInfoForHome:](self, "_logDebugInfoForHome:", v11);

  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLForDefault:", *MEMORY[0x1E0CF7B70]);

  if (v13)
  {
    -[ANMessenger log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ANMessenger _sendAnnouncement:toDestination:sentHandler:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:description:", 1036, *MEMORY[0x1E0CF7C58], CFSTR("Force Send Failure Enabled in User Defaults"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v15);
    goto LABEL_89;
  }
  objc_msgSend(v8, "playbackDeadline");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = (void *)MEMORY[0x1E0C99D68];
    -[ANMessenger _calculateAnnouncementDeadline:](self, "_calculateAnnouncementDeadline:", v8);
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateWithTimeInterval:sinceDate:", v20, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlaybackDeadline:", v21);

  }
  -[ANMessenger idsConnection](self, "idsConnection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "service");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "participantsWithService:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setListeners:", v24);

  objc_msgSend(v8, "listeners");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  +[ANHomeManager shared](ANHomeManager, "shared");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "currentAccessory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    if (v28)
    {
      objc_msgSend(v8, "location");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v32, "flags") & 1) != 0)
      {
        objc_msgSend(v9, "home");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "usersIncludingCurrentUserWithAnnounceEnabled");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = objc_msgSend(v126, "count");

        if (v127)
          v31 = 1009;
        else
          v31 = 1043;
        goto LABEL_86;
      }

    }
    v31 = 1009;
LABEL_86:
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CF7C58];
    goto LABEL_87;
  }
  if (v28)
  {
    if (!-[ANMessenger _willTargetReachableDevicesForAnnouncement:inDestination:](self, "_willTargetReachableDevicesForAnnouncement:inDestination:", v8, v9))
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CF7C58];
      v31 = 1009;
LABEL_87:
      objc_msgSend(v29, "an_errorWithCode:component:", v31, v30);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v15);
      +[ANAnalytics shared](ANAnalytics, "shared");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = objc_msgSend(v15, "code");
      objc_msgSend(v8, "announcer");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      +[ANAnalyticsContext contextWithAnnouncer:](ANAnalyticsContext, "contextWithAnnouncer:", v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "error:context:", v129, v131);

LABEL_88:
LABEL_89:

      goto LABEL_90;
    }
  }
  else if (objc_msgSend(v8, "isRelayRequest"))
  {
    objc_msgSend(v9, "accessories");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (v34)
    {
      objc_msgSend(v9, "accessories");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v168[0] = MEMORY[0x1E0C809B0];
      v168[1] = 3221225472;
      v168[2] = __59__ANMessenger__sendAnnouncement_toDestination_sentHandler___block_invoke;
      v168[3] = &unk_1E938F238;
      v168[4] = self;
      objc_msgSend(v35, "hmu_compactMap:", v168);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v15, "count"))
      {
        -[ANMessenger log](self, "log");
        v132 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
          -[ANMessenger _sendAnnouncement:toDestination:sentHandler:].cold.2(v9, v132);

        objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1009, *MEMORY[0x1E0CF7C58]);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, 0, v128);
        +[ANAnalytics shared](ANAnalytics, "shared");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "error:", objc_msgSend(v128, "code"));

        goto LABEL_88;
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "numberForDefault:", *MEMORY[0x1E0CF7BF0]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "doubleValue");
  v39 = v38;

  objc_msgSend(MEMORY[0x1E0CF7EA8], "sharedManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "transaction:setActiveForTimeInterval:", *MEMORY[0x1E0CF7DC8], v39);

  -[ANMessenger log](self, "log");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v172 = v8;
    _os_log_impl(&dword_1D23A0000, v41, OS_LOG_TYPE_DEFAULT, "Sending Message: %@", buf, 0xCu);
  }
  v134 = v10;

  -[ANMessenger log](self, "log");
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "listeners");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v172 = v44;
    _os_log_impl(&dword_1D23A0000, v42, OS_LOG_TYPE_DEFAULT, "Sending To %lu Participants", buf, 0xCu);

  }
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  objc_msgSend(v8, "listeners");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v164, v174, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v165;
    v49 = 1;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v165 != v48)
          objc_enumerationMutation(v45);
        v51 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * i);
        -[ANMessenger log](self, "log");
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v172 = v49 + i;
          *(_WORD *)&v172[4] = 2112;
          *(_QWORD *)&v172[6] = v51;
          _os_log_impl(&dword_1D23A0000, v52, OS_LOG_TYPE_DEFAULT, "Participant %d: %@", buf, 0x12u);
        }

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v164, v174, 16);
      v49 += i;
    }
    while (v47);
  }

  objc_msgSend(v8, "announcer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANAnalyticsContext contextWithAnnouncer:](ANAnalyticsContext, "contextWithAnnouncer:", v53);
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v145, "devices");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = objc_msgSend(v54, "count");

  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  objc_msgSend(v145, "devices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v173, 16);
  if (v55)
  {
    v56 = v55;
    v144 = 0;
    v57 = *(_QWORD *)v161;
    do
    {
      for (j = 0; j != v56; ++j)
      {
        if (*(_QWORD *)v161 != v57)
          objc_enumerationMutation(obj);
        v59 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * j);
        objc_msgSend(v145, "home");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        +[ANMessenger announcementForDevice:inHome:fromAnnouncement:](ANMessenger, "announcementForDevice:inHome:fromAnnouncement:", v59, v60, v8);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "message");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        -[ANMessenger rapportConnection](self, "rapportConnection");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v154[0] = MEMORY[0x1E0C809B0];
        v154[1] = 3221225472;
        v154[2] = __59__ANMessenger__sendAnnouncement_toDestination_sentHandler___block_invoke_37;
        v154[3] = &unk_1E938F260;
        v155 = v8;
        v156 = self;
        v157 = v145;
        v159 = v142;
        v158 = v143;
        objc_msgSend(v63, "sendMessage:device:responseHandler:", v62, v59, v154);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (v64)
        {
          -[ANMessenger log](self, "log");
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v59, "name");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v172 = v66;
            *(_WORD *)&v172[8] = 2112;
            *(_QWORD *)&v172[10] = v64;
            _os_log_error_impl(&dword_1D23A0000, v65, OS_LOG_TYPE_ERROR, "Failed to send Message for Device %@: %@", buf, 0x16u);

          }
          ++v144;
        }

      }
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v173, 16);
    }
    while (v56);
  }
  else
  {
    v144 = 0;
  }

  objc_msgSend(v145, "users");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend(v67, "count");

  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  objc_msgSend(v145, "users");
  v136 = (id)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v150, v170, 16);
  if (v68)
  {
    v69 = v68;
    obja = *(id *)v151;
    do
    {
      for (k = 0; k != v69; ++k)
      {
        if (*(id *)v151 != obja)
          objc_enumerationMutation(v136);
        v71 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * k);
        objc_msgSend(v71, "hmu_idsDestination");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        if (v72)
        {
          objc_msgSend(v145, "home");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          +[ANMessenger announcementForUser:inHome:fromAnnouncement:](ANMessenger, "announcementForUser:inHome:fromAnnouncement:", v71, v73, v8);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "message");
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          -[ANMessenger idsConnection](self, "idsConnection");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "sendMessage:messageUUIDString:destination:", v75, v77, v72);
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "creationTimestamp");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "timeIntervalSinceDate:", v80);
          v82 = v81;

          -[ANMessenger log](self, "log");
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            *(double *)v172 = v82;
            *(_WORD *)&v172[8] = 2112;
            *(_QWORD *)&v172[10] = v72;
            _os_log_impl(&dword_1D23A0000, v83, OS_LOG_TYPE_INFO, "Took %f sec to send over IDS to %@", buf, 0x16u);
          }

          if (v78)
          {
            -[ANMessenger log](self, "log");
            v84 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v71, "userID");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v172 = v88;
              *(_WORD *)&v172[8] = 2112;
              *(_QWORD *)&v172[10] = v78;
              _os_log_error_impl(&dword_1D23A0000, v84, OS_LOG_TYPE_ERROR, "Failed to send Message for User %@: %@", buf, 0x16u);

            }
            ++v144;
          }
          +[ANAnalytics shared](ANAnalytics, "shared");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "home");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "uniqueIdentifier");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "announcementSent:inHome:withError:withTime:sendType:ofGroupCount:context:", v8, v87, objc_msgSend(v78, "code"), 2, v138, v143, v82);

        }
      }
      v69 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v150, v170, 16);
    }
    while (v69);
  }

  objc_msgSend(v145, "accessories");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = (char *)objc_msgSend(v89, "count");

  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  objc_msgSend(v145, "accessories");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v146, v169, 16);
  if (v90)
  {
    v91 = v90;
    objb = *(id *)v147;
    do
    {
      for (m = 0; m != v91; ++m)
      {
        if (*(id *)v147 != objb)
          objc_enumerationMutation(v135);
        v93 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * m);
        -[ANMessenger idsConnection](self, "idsConnection");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "service");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "hmu_destinationForService:", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v96, "destinationURIs");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend(v97, "count");

        if (v98)
        {
          objc_msgSend(v145, "home");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          +[ANMessenger announcementForAccessory:inHome:fromAnnouncement:](ANMessenger, "announcementForAccessory:inHome:fromAnnouncement:", v93, v99, v8);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "message");
          v101 = objc_claimAutoreleasedReturnValue();

          -[ANMessenger idsConnection](self, "idsConnection");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "sendMessage:messageUUIDString:destination:", v101, v103, v96);
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "creationTimestamp");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "timeIntervalSinceDate:", v106);
          v108 = v107;

          -[ANMessenger log](self, "log");
          v109 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            *(double *)v172 = v108;
            *(_WORD *)&v172[8] = 2112;
            *(_QWORD *)&v172[10] = v96;
            _os_log_impl(&dword_1D23A0000, v109, OS_LOG_TYPE_INFO, "Took %f sec to send over IDS to %@", buf, 0x16u);
          }

          if (v104)
          {
            -[ANMessenger log](self, "log");
            v110 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v93, "name");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v172 = v114;
              *(_WORD *)&v172[8] = 2112;
              *(_QWORD *)&v172[10] = v104;
              _os_log_error_impl(&dword_1D23A0000, v110, OS_LOG_TYPE_ERROR, "Failed to send Message for User %@: %@", buf, 0x16u);

            }
            ++v144;
          }
          +[ANAnalytics shared](ANAnalytics, "shared");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "home");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "uniqueIdentifier");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "announcementSent:inHome:withError:withTime:sendType:ofGroupCount:context:", v8, v113, objc_msgSend(v104, "code"), 3, v137, v143, v108);

        }
        else
        {
          if ((objc_msgSend(v93, "hmu_isEndpoint") & 1) != 0)
            goto LABEL_77;
          -[ANMessenger log](self, "log");
          v101 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v93, "name");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "uniqueIdentifier");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v172 = v115;
            *(_WORD *)&v172[8] = 2112;
            *(_QWORD *)&v172[10] = v116;
            _os_log_error_impl(&dword_1D23A0000, v101, OS_LOG_TYPE_ERROR, "No IDS URI for Accessory: %@, %@", buf, 0x16u);

          }
        }

LABEL_77:
      }
      v91 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v146, v169, 16);
    }
    while (v91);
  }

  v10 = v134;
  ((void (**)(id, id, void *))v134)[2](v134, v8, 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "creationTimestamp");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "timeIntervalSinceDate:", v118);
  v120 = v119;

  if (v144 <= 0)
    v121 = 0;
  else
    v121 = 5000;
  +[ANAnalytics shared](ANAnalytics, "shared");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "home");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "uniqueIdentifier");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "announcementSent:inHome:withError:withTime:sendType:ofGroupCount:context:", v8, v124, v121, 0, &v137[v138 + v142], v143, v120);

LABEL_90:
}

id __59__ANMessenger__sendAnnouncement_toDestination_sentHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "idsConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "IDSDestinationForIDSService:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinationURIs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __59__ANMessenger__sendAnnouncement_toDestination_sentHandler___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  double v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "creationTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = v10;

  objc_msgSend(*(id *)(a1 + 40), "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v18 = 134218242;
    v19 = v11;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1D23A0000, v12, OS_LOG_TYPE_INFO, "Took %f sec to send over rapport to %@", (uint8_t *)&v18, 0x16u);
  }

  +[ANAnalytics shared](ANAnalytics, "shared");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v7, "code");

  objc_msgSend(v13, "announcementSent:inHome:withError:withTime:sendType:ofGroupCount:context:", v14, v16, v17, 1, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), v11);
}

- (BOOL)_willTargetReachableDevicesForAnnouncement:(id)a3 inDestination:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "flags") & 1) != 0 || (objc_msgSend(v5, "isRelayType") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v10 = objc_msgSend(v5, "action");

    if (v10 == 1)
    {
      v8 = 1;
      goto LABEL_5;
    }
    objc_msgSend(v6, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allRoomsInHome:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(MEMORY[0x1E0CBA7D8], "hmu_accessoriesInRooms:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "announceAccessoriesWithAnnounceEnabledFromAccessories:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "na_map:", &__block_literal_global_0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "devices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __72__ANMessenger__willTargetReachableDevicesForAnnouncement_inDestination___block_invoke_2;
    v20[3] = &unk_1E938F2C8;
    v21 = v16;
    v18 = v16;
    objc_msgSend(v17, "na_firstObjectPassingTest:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v19 != 0;
  }

LABEL_5:
  return v8;
}

uint64_t __72__ANMessenger__willTargetReachableDevicesForAnnouncement_inDestination___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

uint64_t __72__ANMessenger__willTargetReachableDevicesForAnnouncement_inDestination___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "homeKitIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)getScanningDeviceCandidates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ANMessenger idsConnection](self, "idsConnection", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isHomePod") & 1) == 0)
        {
          objc_msgSend(v11, "nsuuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "nsuuid");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "UUIDString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v14);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  -[ANMessenger log](self, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl(&dword_1D23A0000, v15, OS_LOG_TYPE_INFO, "Coordinated Alerts Announce device candidates: %@", buf, 0xCu);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
}

- (void)_logDebugInfoForHome:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ANMessenger *v9;

  v4 = a3;
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__ANMessenger__logDebugInfoForHome___block_invoke;
  v7[3] = &unk_1E938F2F0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __36__ANMessenger__logDebugInfoForHome___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  id obj;
  id objc;
  id objd;
  id obja;
  id objb;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  uint8_t v116[128];
  uint8_t buf[4];
  id v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  void *v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  int v132;
  __int16 v133;
  void *v134;
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v1 = (void *)MEMORY[0x1E0CBA1A8];
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "announceAccessoriesFromAccessories:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v110, v136, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v111;
    do
    {
      v7 = 0;
      v85 = v5;
      do
      {
        if (*(_QWORD *)v111 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "log");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "room");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uniqueIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v6;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "supportsAnnounce"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "an_isAnnounceEnabled"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v118 = v10;
          v119 = 2112;
          v120 = v12;
          v121 = 2112;
          v122 = v13;
          v123 = 2112;
          v124 = v15;
          v125 = 2112;
          v126 = v16;
          _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "[Accessory] Name: %@, Room: %@, HomeKitID: %@, Announce Supported: %@, Announced Enabled: %@", buf, 0x34u);

          v6 = v14;
          v5 = v85;

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v136, 16);
    }
    while (v5);
  }

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "rapportConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "devices");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activeDevicesSupportingAnnounce");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = v19;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v106, v135, 16);
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v107;
    *(_QWORD *)&v21 = 138414338;
    v77 = v21;
    v78 = *(_QWORD *)v107;
    do
    {
      v24 = 0;
      v79 = v22;
      do
      {
        if (*(_QWORD *)v107 != v23)
          objc_enumerationMutation(v81);
        v25 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v24);
        objc_msgSend(*(id *)(a1 + 40), "log", v77);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v25, "name");
          objc = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifier");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "idsDeviceIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "homeKitIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v25, "flags"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v25, "statusFlags"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "model");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v25, "supportsAnnounce");
          objc_msgSend(v25, "homeKitUserIdentifiers");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v77;
          v118 = objc;
          v119 = 2112;
          v120 = v86;
          v121 = 2112;
          v122 = v27;
          v123 = 2112;
          v124 = v28;
          v125 = 2112;
          v126 = v83;
          v127 = 2112;
          v128 = v29;
          v129 = 2112;
          v130 = v30;
          v131 = 1024;
          v132 = v31;
          v133 = 2112;
          v134 = v32;
          _os_log_impl(&dword_1D23A0000, v26, OS_LOG_TYPE_DEFAULT, "[RPDevice] Name: %@, RapportID: %@, IDSDeviceID: %@, HomeKitID: %@, Flags: %@, Status Flags: %@, Model: %@, Announce Supported: %d, HomeKitUserIDs: %@", buf, 0x58u);

          v23 = v78;
          v22 = v79;

        }
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v106, v135, 16);
    }
    while (v22);
  }

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "rapportConnection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "devices");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activeDevicesSupportingAnnounce");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "devicesInHome:", *(_QWORD *)(a1 + 32));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = v36;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v102, v116, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v103;
    v80 = *(_QWORD *)v103;
    do
    {
      v40 = 0;
      v82 = (id)v38;
      do
      {
        if (*(_QWORD *)v103 != v39)
          objc_enumerationMutation(v84);
        v41 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v40);
        objc_msgSend(*(id *)(a1 + 40), "log");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v41, "name");
          objd = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "identifier");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "idsDeviceIdentifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "homeKitIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "flags"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v41, "statusFlags"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "model");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v41, "supportsAnnounce");
          objc_msgSend(v41, "homeKitUserIdentifiers");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138414338;
          v118 = objd;
          v119 = 2112;
          v120 = v87;
          v121 = 2112;
          v122 = v43;
          v123 = 2112;
          v124 = v44;
          v125 = 2112;
          v126 = v45;
          v127 = 2112;
          v128 = v46;
          v129 = 2112;
          v130 = v47;
          v131 = 1024;
          v132 = v48;
          v133 = 2112;
          v134 = v49;
          _os_log_impl(&dword_1D23A0000, v42, OS_LOG_TYPE_DEFAULT, "[RPDevice Device In Home] Name: %@, RapportID: %@, IDSDeviceID: %@, HomeKitID: %@, Flags: %@, Status Flags: %@, Model: %@, Announce Supported: %d, HomeKitUserIDs: %@", buf, 0x58u);

          v39 = v80;
          v38 = (uint64_t)v82;

        }
        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v102, v116, 16);
    }
    while (v38);
  }

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "hmu_allUsersIncludingCurrentUser");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v99 != v52)
          objc_enumerationMutation(obja);
        v54 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "log");
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v54, "userID");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "userIDSURI");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "unprefixedURI");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "senderCorrelationIdentifier");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(*(id *)(a1 + 32), "announceAccessAllowedForUser:", v54);
          *(_DWORD *)buf = 138413058;
          v118 = v56;
          v119 = 2112;
          v120 = v58;
          v121 = 2112;
          v122 = v59;
          v123 = 1024;
          LODWORD(v124) = v60;
          _os_log_impl(&dword_1D23A0000, v55, OS_LOG_TYPE_DEFAULT, "[HMUser] UserID: %@, IDSURI: %@, SenderCorrID: %@, Announce Enabled: %d", buf, 0x26u);

        }
      }
      v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
    }
    while (v51);
  }

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "idsConnection");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "service");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "devices");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objb = v63;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v94, v114, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v95;
    do
    {
      for (j = 0; j != v65; ++j)
      {
        if (*(_QWORD *)v95 != v66)
          objc_enumerationMutation(objb);
        v68 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 40), "log");
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v68, "name");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v68, "isHomePod"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "uniqueID");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "uniqueIDOverride");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "modelIdentifier");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v118 = v70;
          v119 = 2112;
          v120 = v71;
          v121 = 2112;
          v122 = v72;
          v123 = 2112;
          v124 = v73;
          v125 = 2112;
          v126 = v74;
          _os_log_impl(&dword_1D23A0000, v69, OS_LOG_TYPE_DEFAULT, "[IDS Device] Name: %@, isHomePod: %@, Unique ID: %@, Unique ID Override: %@, Model: %@", buf, 0x34u);

        }
      }
      v65 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v94, v114, 16);
    }
    while (v65);
  }

  objc_msgSend(*(id *)(a1 + 40), "log");
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    v76 = (void *)IDSCopyLocalDeviceUniqueID();
    *(_DWORD *)buf = 138412290;
    v118 = v76;
    _os_log_impl(&dword_1D23A0000, v75, OS_LOG_TYPE_DEFAULT, "[IDS Local Device] UniqueID: %@", buf, 0xCu);

  }
}

- (void)connection:(id)a3 didReceiveMessage:(id)a4 fromSender:(id)a5 senderContext:(id)a6 handler:(id)a7
{
  id v12;
  __CFString *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void (**v60)(_QWORD, _QWORD);
  _QWORD v61[5];
  _QWORD v62[5];
  void (**v63)(_QWORD, _QWORD);
  uint8_t buf[4];
  double v65;
  __int16 v66;
  const __CFString *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (__CFString *)a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[ANMessenger log](self, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v65 = *(double *)&v14;
    v66 = 2112;
    v67 = v13;
    _os_log_impl(&dword_1D23A0000, v17, OS_LOG_TYPE_DEFAULT, "Received Message From (%@): %@", buf, 0x16u);
  }

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7DF8]), "initWithMessage:", v13);
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "creationTimestamp");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", v20);
    v22 = v21;

    objc_msgSend(v18, "setSender:", v14);
    +[ANValidationHelper performBasicValidationForAnnouncement:type:](ANValidationHelper, "performBasicValidationForAnnouncement:type:", v18, 1);
    v23 = objc_claimAutoreleasedReturnValue();
    v60 = (void (**)(_QWORD, _QWORD))v16;
    if (v23)
    {
      v24 = (void *)v23;
      v25 = v13;
      v26 = v14;
      v27 = v12;
      v28 = v15;
      -[ANMessenger log](self, "log");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[ANMessenger connection:didReceiveMessage:fromSender:senderContext:handler:].cold.5();

      +[ANAnalytics shared](ANAnalytics, "shared");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v24, "code");
      objc_msgSend(v18, "announcer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[ANAnalyticsContext contextWithAnnouncer:](ANAnalyticsContext, "contextWithAnnouncer:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "error:context:", v31, v33);

      goto LABEL_8;
    }
    -[ANMessenger idsConnection](self, "idsConnection");
    v36 = (id)objc_claimAutoreleasedReturnValue();

    if (v36 == v12)
    {
      +[ANMessenger performIDSValidationForAnnouncement:withSenderContext:](ANMessenger, "performIDSValidationForAnnouncement:withSenderContext:", v18, v15);
      v43 = objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        v24 = (void *)v43;
        v25 = v13;
        v26 = v14;
        v27 = v12;
        v28 = v15;
        -[ANMessenger log](self, "log");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[ANMessenger connection:didReceiveMessage:fromSender:senderContext:handler:].cold.2();
        goto LABEL_24;
      }
    }
    else
    {
      -[ANMessenger rapportConnection](self, "rapportConnection");
      v37 = (id)objc_claimAutoreleasedReturnValue();

      if (v37 != v12)
      {
        v59 = v15;
        objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 5018, *MEMORY[0x1E0CF7C58]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ANMessenger log](self, "log");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          -[ANMessenger connection:didReceiveMessage:fromSender:senderContext:handler:].cold.4();

        +[ANAnalytics shared](ANAnalytics, "shared");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v24, "code");
        objc_msgSend(v18, "announcer");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[ANAnalyticsContext contextWithAnnouncer:](ANAnalyticsContext, "contextWithAnnouncer:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "error:context:", v40, v42);

        v16 = v60;
        ((void (**)(_QWORD, void *))v60)[2](v60, v24);
        v15 = v59;
        goto LABEL_12;
      }
      +[ANMessenger performRapportValidationForAnnouncement:withSenderContext:](ANMessenger, "performRapportValidationForAnnouncement:withSenderContext:", v18, v15);
      v45 = objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        v24 = (void *)v45;
        v25 = v13;
        v26 = v14;
        v27 = v12;
        v28 = v15;
        -[ANMessenger log](self, "log");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[ANMessenger connection:didReceiveMessage:fromSender:senderContext:handler:].cold.3();
LABEL_24:

        +[ANAnalytics shared](ANAnalytics, "shared");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v24, "code");
        objc_msgSend(v18, "announcer");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[ANAnalyticsContext contextWithAnnouncer:](ANAnalyticsContext, "contextWithAnnouncer:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "error:context:", v47, v49);

LABEL_8:
        v16 = v60;
        ((void (**)(_QWORD, void *))v60)[2](v60, v24);
        v15 = v28;
        v12 = v27;
        v14 = v26;
        v13 = v25;
        goto LABEL_12;
      }
    }
    -[ANMessenger log](self, "log");
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      -[ANMessenger rapportConnection](self, "rapportConnection");
      v51 = (id)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("IDS");
      if (v51 == v12)
        v52 = CFSTR("rapport");
      *(_DWORD *)buf = 134218242;
      v65 = v22;
      v66 = 2112;
      v67 = v52;
      _os_log_impl(&dword_1D23A0000, v50, OS_LOG_TYPE_INFO, "Received Message took %f over %@", buf, 0x16u);

    }
    if (!objc_msgSend(MEMORY[0x1E0CF7E38], "isPhone") || (objc_msgSend(v18, "isRelayRequest") & 1) == 0)
    {
      objc_msgSend(v18, "announcer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[ANAnalyticsContext contextWithAnnouncer:](ANAnalyticsContext, "contextWithAnnouncer:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      +[ANAnalytics shared](ANAnalytics, "shared");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[ANMessenger rapportConnection](self, "rapportConnection");
      v56 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "announcementReceived:withTime:receiveTimeType:context:", v18, v56 != v12, v54, v22);

    }
    +[ANHomeManager shared](ANHomeManager, "shared");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "currentAccessory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v18, "action") & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v16 = v60;
      if (!v24)
      {
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __77__ANMessenger_connection_didReceiveMessage_fromSender_senderContext_handler___block_invoke;
        v62[3] = &unk_1E938F318;
        v62[4] = self;
        v63 = v60;
        -[ANMessenger _forwardRelayRequest:withSenderContext:sentHandler:](self, "_forwardRelayRequest:withSenderContext:sentHandler:", v18, v15, v62);

        goto LABEL_12;
      }
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __77__ANMessenger_connection_didReceiveMessage_fromSender_senderContext_handler___block_invoke_49;
      v61[3] = &unk_1E938F340;
      v61[4] = self;
      -[ANMessenger _fulfillRelayRequest:withSenderContext:sentHandler:](self, "_fulfillRelayRequest:withSenderContext:sentHandler:", v18, v15, v61);
    }
    -[ANMessenger delegate](self, "delegate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "receivedAnnouncement:", v18);

    v16 = v60;
    v60[2](v60, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 5017, *MEMORY[0x1E0CF7C58]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANMessenger log](self, "log");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[ANMessenger connection:didReceiveMessage:fromSender:senderContext:handler:].cold.1();

    +[ANAnalytics shared](ANAnalytics, "shared");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "error:", objc_msgSend(v24, "code"));

    (*((void (**)(id, void *))v16 + 2))(v16, v24);
  }
LABEL_12:

}

void __77__ANMessenger_connection_didReceiveMessage_fromSender_senderContext_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __77__ANMessenger_connection_didReceiveMessage_fromSender_senderContext_handler___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "Forwarded message on behalf of companion", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77__ANMessenger_connection_didReceiveMessage_fromSender_senderContext_handler___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "Did not relay announcement: %@, announcement = %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)connection:(id)a3 failedDeliveryForMessage:(id)a4 withError:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  NSObject *v11;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E0CF7DF8];
  v9 = a4;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithMessage:", v9);

  if (v10)
  {
    -[ANMessenger delegate](self, "delegate");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject failedToDeliverAnnouncement:error:](v11, "failedToDeliverAnnouncement:error:", v10, v7);
  }
  else
  {
    -[ANMessenger log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ANMessenger connection:didReceiveMessage:fromSender:senderContext:handler:].cold.1();
  }

}

- (id)connectionDidReceiveRequestForHomeLocationStatus:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  +[ANHomeManager shared](ANHomeManager, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allHomes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "homeLocationStatus", (_QWORD)v15));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v3;
}

- (ANMessengerDelegate)delegate
{
  return (ANMessengerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ANRapportConnectionProvider)rapportConnection
{
  return self->_rapportConnection;
}

- (ANIDSConnectionProvider)idsConnection
{
  return self->_idsConnection;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_idsConnection, 0);
  objc_storeStrong((id *)&self->_rapportConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)createAnnouncementWithRequest:(id)a3 forLocation:(id)a4 inHome:(id)a5 isReply:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v51;
  id *v52;
  _BOOL4 log;
  NSObject *loga;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  uint8_t buf[4];
  const __CFString *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v8 = a6;
  v70 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v11, "content");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "audioFileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v15, 2, &v63);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v63;
  ANLogHandleMessenger_Announcement();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v65 = &stru_1E93913D0;
      v66 = 2112;
      v67 = v15;
      v68 = 2112;
      v69 = v17;
      _os_log_impl(&dword_1D23A0000, v19, OS_LOG_TYPE_ERROR, "%@Failed to load data from file: URL = %@, Error = %@", buf, 0x20u);
    }

    v20 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v17);
    goto LABEL_43;
  }
  log = v8;
  v61 = v11;
  v52 = a7;
  v59 = v13;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "length"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v65 = &stru_1E93913D0;
    v66 = 2112;
    v67 = v15;
    v68 = 2112;
    v69 = v21;
    _os_log_impl(&dword_1D23A0000, v19, OS_LOG_TYPE_DEFAULT, "%@Loaded audio file data from URL (%@) of size %@", buf, 0x20u);

  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7E10]), "initWithData:type:", v16, 1);
  objc_msgSend(v22, "setFlags:", 1);
  v23 = (void *)objc_opt_new();
  v57 = v22;
  objc_msgSend(v23, "addObject:", v22);
  objc_msgSend(v14, "transcription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "dataUsingEncoding:", 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7E10]), "initWithData:type:", v26, 2);
    objc_msgSend(v23, "addObject:", v27);

  }
  v56 = v25;
  v28 = (void *)objc_opt_new();
  v60 = v23;
  v29 = objc_msgSend(v23, "copy");
  objc_msgSend(v28, "setDataItems:", v29);

  v62 = 0;
  LOBYTE(v29) = objc_msgSend(v28, "processAudioWithEffects:error:", objc_msgSend(MEMORY[0x1E0CF7DF8], "defaultAudioEffects"), &v62);
  v30 = v62;
  if ((v29 & 1) == 0)
  {
    ANLogHandleMessenger_Announcement();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v65 = &stru_1E93913D0;
      v66 = 2112;
      v67 = v30;
      _os_log_impl(&dword_1D23A0000, v31, OS_LOG_TYPE_ERROR, "%@Failed to process audio. Requesting remote normalization. Error = %@", buf, 0x16u);
    }

  }
  v55 = v30;
  v58 = v12;
  objc_msgSend(v28, "setLocation:", v12);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCreationTimestamp:", v32);

  v33 = (void *)MEMORY[0x1E0CF7DF8];
  objc_msgSend(v61, "clientID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setSource:", objc_msgSend(v33, "sourceFromString:", v34));

  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "BOOLForDefault:", *MEMORY[0x1E0CF7BD8]);

  +[ANHomeManager shared](ANHomeManager, "shared");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "currentAccessory");
  v38 = objc_claimAutoreleasedReturnValue();

  if (v36 && !v38)
  {
    v39 = 0;
    if (log)
      v40 = 5;
    else
      v40 = 4;
    objc_msgSend(v28, "setAction:", v40);
    ANLogHandleMessenger_Announcement();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v60;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v65 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v41, OS_LOG_TYPE_DEFAULT, "%@Relaying message via resident.", buf, 0xCu);
    }

    v13 = v59;
    goto LABEL_29;
  }
  objc_msgSend(v28, "setAction:", log);
  v13 = v59;
  v42 = v60;
  v39 = (void *)v38;
  if (v38)
  {
    objc_msgSend(v14, "homeKitUserIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v59, "hmu_userWithUniqueIdentifier:", v43);
      v44 = objc_claimAutoreleasedReturnValue();
      if (!v44)
      {
        v45 = 0;
LABEL_34:

        objc_msgSend(v28, "announcer");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "populateWithUser:andAccessory:", v44, v39);

        v13 = v59;
        goto LABEL_35;
      }
      if (objc_msgSend(v59, "announceAccessAllowedForUser:", v44))
      {
        ANLogHandleMessenger_Announcement();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject name](v44, "name");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject uniqueIdentifier](v44, "uniqueIdentifier");
          loga = v45;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v65 = &stru_1E93913D0;
          v66 = 2112;
          v67 = v51;
          v68 = 2112;
          v69 = v46;
          _os_log_impl(&dword_1D23A0000, loga, OS_LOG_TYPE_DEFAULT, "%@Recognized User with Announce access. Not sending to personal devices for user. %@, %@", buf, 0x20u);

          v45 = loga;
        }
        goto LABEL_34;
      }
      v45 = v44;
    }
    else
    {
      v45 = 0;
    }
    v44 = 0;
    goto LABEL_34;
  }
LABEL_29:
  objc_msgSend(v28, "announcer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentUser");
  v44 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "populateWithUser:", v44);
LABEL_35:

  +[ANValidationHelper performBasicValidationForAnnouncement:type:](ANValidationHelper, "performBasicValidationForAnnouncement:type:", v28, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    ANLogHandleMessenger_Announcement();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v65 = &stru_1E93913D0;
      v66 = 2112;
      v67 = v48;
      _os_log_impl(&dword_1D23A0000, v49, OS_LOG_TYPE_ERROR, "%@Failed Send Basic Validation with Error: %@", buf, 0x16u);
    }

    v20 = 0;
    if (v52)
      *v52 = objc_retainAutorelease(v48);
    v42 = v60;
  }
  else
  {
    v20 = v28;
  }

  v12 = v58;
  v11 = v61;
LABEL_43:

  return v20;
}

+ (id)announcementForDevice:(id)a3 inHome:(id)a4 fromAnnouncement:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v9, "isRelayRequest") & 1) != 0
    || +[ANMessenger _isAnnouncerAdminInAnnouncement:home:](ANMessenger, "_isAnnouncerAdminInAnnouncement:home:", v9, v8)|| objc_msgSend(v7, "isOwnerDevice"))
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(v7, "homeKitUserIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        while (2)
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(v8, "hmu_userWithUniqueIdentifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18), (_QWORD)v21);
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v20 = (void *)v19;
              +[ANMessenger announcementForUser:inHome:fromAnnouncement:](ANMessenger, "announcementForUser:inHome:fromAnnouncement:", v19, v8, v9);
              v10 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_18;
            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v16)
            continue;
          break;
        }
      }

    }
    v10 = (id)objc_msgSend(v9, "copy", (_QWORD)v21);
    objc_msgSend(v10, "announcer");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clearIdentifiers");
LABEL_18:

  }
  return v10;
}

+ (id)announcementForAccessory:(id)a3 inHome:(id)a4 fromAnnouncement:(id)a5
{
  return a5;
}

+ (id)announcementForUser:(id)a3 inHome:(id)a4 fromAnnouncement:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (+[ANMessenger _isAnnouncerAdminInAnnouncement:home:](ANMessenger, "_isAnnouncerAdminInAnnouncement:home:", v9, v8)|| (objc_msgSend(v8, "hmu_isAdministrator:", v7) & 1) != 0)
  {
    v10 = v9;
  }
  else
  {
    v10 = (id)objc_msgSend(v9, "copy");
    objc_msgSend(v10, "announcer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clearIdentifiers");

  }
  return v10;
}

+ (id)locationForHome:(id)a3 rooms:(id)a4 zones:(id)a5 idsService:(id)a6
{
  id v9;
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (objc_class *)MEMORY[0x1E0CF7E58];
  v13 = a6;
  v14 = [v12 alloc];
  objc_msgSend(v9, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithHomeID:", v15);

  if (objc_msgSend(v10, "count") || objc_msgSend(v11, "count"))
  {
    objc_msgSend(v16, "setFlags:", 0);
    v17 = (void *)MEMORY[0x1E0CBA7D8];
    objc_msgSend(MEMORY[0x1E0CBA7D8], "an_roomsWithAnnounceAccessoriesFromRooms:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hmu_uniqueIdentifiersFromRooms:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRoomUUIDs:", v19);

    v20 = (void *)MEMORY[0x1E0CBA980];
    objc_msgSend(MEMORY[0x1E0CBA980], "an_zonesWithAnnounceAccessoriesFromZones:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hmu_uniqueIdentifiersFromZones:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setZoneUUIDs:", v22);

  }
  else
  {
    objc_msgSend(v16, "setFlags:", 1);
  }
  +[ANMessenger _setIdentifiersForIDSService:inLocation:home:](ANMessenger, "_setIdentifiersForIDSService:inLocation:home:", v13, v16, v9);

  return v16;
}

+ (id)locationForReplyToAnnouncement:(id)a3 home:(id)a4 idsService:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "flags") & 1) != 0)
  {
    v13 = (void *)objc_msgSend(v10, "copy");
    goto LABEL_9;
  }
  v11 = objc_alloc(MEMORY[0x1E0CF7E58]);
  objc_msgSend(v10, "homeUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithHomeID:", v12);

  v14 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v10, "roomUUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmu_roomsWithUniqueIdentifiers:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v10, "zoneUUIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmu_zonesWithUniqueIdentifiers:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "announcer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "isAccessory"))
    goto LABEL_6;
  objc_msgSend(v7, "announcer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "homeKitID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v7, "announcer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "homeKitID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmu_accessoryWithUniqueIdentifierUUIDString:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "room");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      objc_msgSend(v34, "addObject:", v21);
LABEL_6:

  }
  v27 = (void *)MEMORY[0x1E0CBA7D8];
  objc_msgSend(v34, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hmu_uniqueIdentifiersFromRooms:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRoomUUIDs:", v29);

  v30 = (void *)MEMORY[0x1E0CBA980];
  objc_msgSend(v20, "allObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "hmu_uniqueIdentifiersFromZones:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setZoneUUIDs:", v32);

LABEL_9:
  +[ANMessenger _setIdentifiersForIDSService:inLocation:home:](ANMessenger, "_setIdentifiersForIDSService:inLocation:home:", v9, v13, v8);

  return v13;
}

+ (void)purgeTemporaryFiles
{
  objc_msgSend(MEMORY[0x1E0CF7E48], "purgeTemporarySubDirectory:", CFSTR("3F177F71-FA73-49C2-8E35-68132FBDFA23"));
}

+ (BOOL)_isAnnouncerAdminInAnnouncement:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "announcer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeKitID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "announcer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isAccessory");

    if (v10)
    {
      objc_msgSend(v5, "announcer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "homeKitUserID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(v6, "hmu_accessoryWithUniqueIdentifierUUIDString:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 != 0;
        goto LABEL_10;
      }
      objc_msgSend(v5, "announcer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "homeKitUserID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hmu_userWithUniqueIdentifierUUIDString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_5;
    }
    else
    {
      objc_msgSend(v6, "hmu_userWithUniqueIdentifierUUIDString:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
LABEL_5:
        LOBYTE(v16) = 0;
LABEL_10:

        goto LABEL_11;
      }
    }
    LOBYTE(v16) = objc_msgSend(v6, "hmu_isAdministrator:", v15);
    goto LABEL_10;
  }
  LOBYTE(v16) = 0;
LABEL_11:

  return v16;
}

+ (void)_setIdentifiersForIDSService:(id)a3 inLocation:(id)a4 home:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentAccessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if ((objc_msgSend(v8, "flags") & 1) != 0)
      objc_msgSend(v8, "setFlags:", objc_msgSend(v8, "flags") | 6);
    objc_msgSend(v9, "currentUser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserUUIDs:", v14);

    objc_msgSend(v7, "uniqueIdentifiersForDevicesExcludingAppleAccessories");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDeviceIDs:", v15);

  }
}

+ (id)performBasicValidationForAnnouncement:(id)a3 type:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  int v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v5 = a3;
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[ANHomeManager shared](ANHomeManager, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeForID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Local device is not part of home: (%@) in Announcement (%@)"), v7, v18);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CF7C58];
      v21 = 1016;
      v22 = v11;
LABEL_27:
      objc_msgSend(v19, "an_errorWithCode:component:description:", v21, v20, v22);
      v32 = objc_claimAutoreleasedReturnValue();
LABEL_28:
      v14 = (void *)v32;
      goto LABEL_29;
    }
    +[ANHomeManager shared](ANHomeManager, "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentAccessory");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(MEMORY[0x1E0CF7E38], "isAnnounceAccessory");
    v13 = v12;
    if (!v11 && (v12 & 1) == 0)
    {
      if ((objc_msgSend(v9, "announceAccessAllowedForCurrentUser") & 1) != 0)
      {
        v14 = 0;
LABEL_29:

        goto LABEL_30;
      }
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CF7C58];
      v22 = CFSTR("Announce Access Not Allowed For Current User");
      goto LABEL_15;
    }
    if (v11)
      v23 = 0;
    else
      v23 = v12;
    if (v23 == 1)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CF7C58];
      v22 = CFSTR("Current Accessory is nil, and device is HomePod this should not happen");
      v21 = 1048;
      goto LABEL_27;
    }
    if ((-[__CFString an_isAnnounceAccessory](v11, "an_isAnnounceAccessory") & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CF7C58];
      v22 = CFSTR("Current Accessory does not support Announce");
      v21 = 1030;
      goto LABEL_27;
    }
    v24 = objc_msgSend(v5, "isRelayRequest");
    if (!a4 && (v24 & 1) == 0 && (-[__CFString an_isAnnounceEnabled](v11, "an_isAnnounceEnabled") & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CF7C58];
      v22 = CFSTR("Announce not enabled for Current Accessory");
LABEL_15:
      v21 = 1017;
      goto LABEL_27;
    }
    v14 = 0;
    if (!v11 || ((v13 ^ 1) & 1) != 0)
      goto LABEL_29;
    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLForDefault:", *MEMORY[0x1E0CF7AA0]);

    if (v26)
    {
      +[ANHomeManager shared](ANHomeManager, "shared");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "currentHome");
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        -[__CFString uniqueIdentifier](v28, "uniqueIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uniqueIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if ((v31 & 1) != 0)
        {

LABEL_33:
          +[ANMessenger validateAnnouncerInAnnouncement:home:](ANMessenger, "validateAnnouncerInAnnouncement:home:", v5, v9);
          v32 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
        v40 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "uniqueIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString uniqueIdentifier](v28, "uniqueIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", CFSTR("Announcent Home ID (%@) does not match Current Home ID (%@)"), v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:description:", 1016, *MEMORY[0x1E0CF7C58], v43);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
        goto LABEL_29;
      }
      v36 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CF7C58];
      v39 = CFSTR("Unable to determine current home for accessory to validate announcement");
      v38 = 1030;
    }
    else
    {
      if ((-[__CFString hmu_isPartOfHome:](v11, "hmu_isPartOfHome:", v9) & 1) != 0)
        goto LABEL_33;
      v34 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "uniqueIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("Accessory is not in the Announcement's home (%@)"), v35);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v36 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CF7C58];
      v38 = 1016;
      v39 = v28;
    }
    objc_msgSend(v36, "an_errorWithCode:component:description:", v38, v37, v39);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Announcement (%@) missing Home ID"), v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:description:", 1030, *MEMORY[0x1E0CF7C58], v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v14;
}

+ (id)validateAnnouncerInAnnouncement:(id)a3 home:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;

  v5 = a4;
  objc_msgSend(a3, "announcer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeKitUserID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "hmu_userWithUniqueIdentifierUUIDString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((objc_msgSend(v5, "announceAccessAllowedForUser:", v8) & 1) != 0)
      {
        v9 = 0;
LABEL_9:

        goto LABEL_10;
      }
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CF7C58];
      v12 = CFSTR("Announce Access Not Allowed For User");
      v13 = 1017;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CF7C58];
      v12 = CFSTR("No user with matching identifier");
      v13 = 1030;
    }
    objc_msgSend(v10, "an_errorWithCode:component:description:", v13, v11, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

+ (id)performIDSValidationForAnnouncement:(id)a3 withSenderContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  const __CFString *v31;

  v5 = a4;
  v6 = a3;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[ANHomeManager shared](ANHomeManager, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "homeUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeForID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || (objc_msgSend(v12, "hmu_isRemoteAccessAllowedForCurrentUser") & 1) != 0)
  {
    objc_msgSend(v5, "senderCorrelationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (objc_msgSend(v5, "isValidDevice"))
      {
        objc_msgSend(v12, "currentUser");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "owner");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "uniqueIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "isEqual:", v17);

        if (!v18)
        {
          v19 = 0;
          v31 = CFSTR("Received message from a known device but current user is not owner.");
          goto LABEL_18;
        }
        objc_msgSend(v12, "owner");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v5, "senderCorrelationIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hmu_userWithSenderCorrelationIdentifier:", v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          v31 = CFSTR("No user with matching Sender Correlation ID");
          goto LABEL_18;
        }
      }
      if (v8)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "BOOLForDefault:", *MEMORY[0x1E0CF7BD8]);

      if (!v25)
        goto LABEL_12;
      objc_msgSend(v19, "uniqueIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "owner");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "uniqueIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v26, "isEqual:", v28);

      if ((v29 & 1) != 0)
      {
LABEL_12:
        v30 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v31 = CFSTR("Received an announcement from non-owner");
LABEL_18:
      objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:description:", 1030, *MEMORY[0x1E0CF7C58], v31);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CF7C58];
    v22 = CFSTR("No Sender Correlation ID");
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CF7C58];
    v22 = CFSTR("Remote Access Not Allowed for Current User");
  }
  objc_msgSend(v20, "an_errorWithCode:component:description:", 1030, v21, v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v30;
}

+ (id)performRapportValidationForAnnouncement:(id)a3 withSenderContext:(id)a4
{
  return 0;
}

+ (id)performPreflightChecksForSendingContent:(id)a3 toHome:(id)a4 rooms:(id)a5 zones:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "count") || objc_msgSend(v12, "count"))
  {
    +[ANMessenger _performPreflightChecksForSendingToRooms:zones:](ANMessenger, "_performPreflightChecksForSendingToRooms:zones:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[ANMessenger _performPreflightChecksForSendingContent:toHome:](ANMessenger, "_performPreflightChecksForSendingContent:toHome:", v9, v10);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

+ (id)_performPreflightChecksForSendingContent:(id)a3 toHome:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v37;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmu_homePodsIncludingCurrentAccessoryDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v7, "homePodsIncludingCurrentAccessorySupportingAnnounce");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      +[ANHomeManager shared](ANHomeManager, "shared");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentAccessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v32 = (void *)MEMORY[0x1E0CBA1A8];
        objc_msgSend(v7, "accessories");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "announceAccessoriesWithAnnounceEnabledFromAccessories:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "count");

        if (!v35)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1031, *MEMORY[0x1E0CF7C58]);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
LABEL_21:
        v4 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v14 = v13;
      objc_msgSend(v7, "usersIncludingCurrentUserWithAnnounceEnabled");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CBA1A8];
      objc_msgSend(v7, "accessories");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "announceAccessoriesWithAnnounceEnabledFromAccessories:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

      objc_msgSend(v14, "room");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v22 = (void *)MEMORY[0x1E0CBA1A8];
        objc_msgSend(v20, "accessories");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "announceAccessoriesWithAnnounceEnabledFromAccessories:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "removeObjectsInArray:", v24);
      }
      objc_msgSend(v6, "homeKitUserIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v37 = v14;
        objc_msgSend(v7, "hmu_userWithUniqueIdentifier:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)objc_msgSend(v15, "mutableCopy");
          objc_msgSend(v27, "removeObject:", v26);
          if (!objc_msgSend(v27, "count") && !objc_msgSend(v19, "count"))
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1047, *MEMORY[0x1E0CF7C58]);
            v4 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = 0;
            v14 = v37;
            goto LABEL_15;
          }

        }
        v14 = v37;
      }
      if (objc_msgSend(v15, "count") || objc_msgSend(v19, "count"))
      {
        v28 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1031, *MEMORY[0x1E0CF7C58]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
      }
LABEL_15:

      if ((v28 & 1) == 0)
        goto LABEL_23;
      goto LABEL_21;
    }
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CF7C58];
    v31 = 1035;
  }
  else
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CF7C58];
    v31 = 1033;
  }
  objc_msgSend(v29, "an_errorWithCode:component:", v31, v30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v4;
}

+ (id)_performPreflightChecksForSendingToRooms:(id)a3 zones:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CBA7D8], "an_roomsWithAnnounceAccessoriesFromRooms:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBA980], "an_zonesWithAnnounceAccessoriesFromZones:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CF7C58];
      v27 = 1049;
      goto LABEL_14;
    }
  }
  v10 = (void *)MEMORY[0x1E0CBA1A8];
  objc_msgSend(MEMORY[0x1E0CBA7D8], "hmu_accessoriesInRooms:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "announceAccessoriesFromAccessories:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(MEMORY[0x1E0CBA980], "hmu_accessoriesInZones:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "announceAccessoriesFromAccessories:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (!v16)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CF7C58];
      v27 = 1035;
      goto LABEL_14;
    }
  }
  v17 = (void *)MEMORY[0x1E0CBA1A8];
  objc_msgSend(MEMORY[0x1E0CBA7D8], "hmu_accessoriesInRooms:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "announceAccessoriesWithAnnounceEnabledFromAccessories:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "count"))
  {
    v20 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(MEMORY[0x1E0CBA980], "hmu_accessoriesInZones:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "announceAccessoriesWithAnnounceEnabledFromAccessories:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
      goto LABEL_10;
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CF7C58];
    v27 = 1031;
LABEL_14:
    objc_msgSend(v25, "an_errorWithCode:component:", v27, v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }

LABEL_10:
  v24 = 0;
LABEL_15:

  return v24;
}

- (void)forwardAnnouncementToCompanion:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v8 = 2112;
  v9 = a2;
  OUTLINED_FUNCTION_5(&dword_1D23A0000, a3, v6, "Failed to forward message to companion %@: %@", v7);

}

- (void)_calculateAnnouncementDeadline:(uint64_t)a3 .cold.1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  const char *v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 136315394;
  v5 = "-[ANMessenger _calculateAnnouncementDeadline:]";
  v6 = 2048;
  v7 = a2;
  OUTLINED_FUNCTION_5(&dword_1D23A0000, a1, a4, "%s: Error in Calculate announcement deadline, fileData is nil. return defaultDeadline: %f", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

- (void)_fulfillRelayRequest:withSenderContext:sentHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D23A0000, v0, v1, "Failed to process audio pre-relay. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_sendAnnouncement:toDestination:sentHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1D23A0000, v0, v1, "Forcing Send Failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_sendAnnouncement:(void *)a1 toDestination:(NSObject *)a2 sentHandler:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1D23A0000, a2, OS_LOG_TYPE_ERROR, "Unable to relay over IDS. No URI for accessories %@", v4, 0xCu);

}

- (void)connection:didReceiveMessage:fromSender:senderContext:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1D23A0000, v0, v1, "Failed to init Announcement from message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)connection:didReceiveMessage:fromSender:senderContext:handler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D23A0000, v0, v1, "IDS Validation Failed with Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)connection:didReceiveMessage:fromSender:senderContext:handler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D23A0000, v0, v1, "Rapport Validation Failed with Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)connection:didReceiveMessage:fromSender:senderContext:handler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1D23A0000, v0, v1, "Received announcement from unsupported connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)connection:didReceiveMessage:fromSender:senderContext:handler:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D23A0000, v0, v1, "Basic Validation Failed with Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __77__ANMessenger_connection_didReceiveMessage_fromSender_senderContext_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D23A0000, v0, v1, "Failed to forward announcement for companion; %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
