@implementation CXJoinCallAction

- (CXJoinCallAction)initWithCallUUID:(id)a3 groupUUID:(id)a4
{
  id v7;
  CXJoinCallAction *v8;
  CXJoinCallAction *v9;
  uint64_t v10;
  NSSet *remoteMembers;
  uint64_t v12;
  NSSet *otherInvitedHandles;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CXJoinCallAction;
  v8 = -[CXCallAction initWithCallUUID:](&v15, sel_initWithCallUUID_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_groupUUID, a4);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    remoteMembers = v9->_remoteMembers;
    v9->_remoteMembers = (NSSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    otherInvitedHandles = v9->_otherInvitedHandles;
    v9->_otherInvitedHandles = (NSSet *)v12;

    v9->_video = 1;
  }

  return v9;
}

- (id)customDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  void *v33;
  void *v34;
  void *v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)CXJoinCallAction;
  -[CXCallAction customDescription](&v37, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXJoinCallAction groupUUID](self, "groupUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" groupUUID=%@"), v4);

  -[CXJoinCallAction remoteMembers](self, "remoteMembers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" remoteMembers=%@"), v5);

  -[CXJoinCallAction otherInvitedHandles](self, "otherInvitedHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[CXJoinCallAction otherInvitedHandles](self, "otherInvitedHandles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" otherInvitedHandles=%@"), v8);

  }
  -[CXJoinCallAction callerID](self, "callerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CXJoinCallAction callerID](self, "callerID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" callerID=%@"), v10);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" videoEnabled=%d"), -[CXJoinCallAction isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" uplinkMuted=%d"), -[CXJoinCallAction isUplinkMuted](self, "isUplinkMuted"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" shouldSuppressInCallUI=%d"), -[CXJoinCallAction shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  -[CXJoinCallAction dateStarted](self, "dateStarted");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" dateStarted=%@"), v11);

  objc_msgSend(v3, "appendFormat:", CFSTR(" wantsStagingArea=%d"), -[CXJoinCallAction wantsStagingArea](self, "wantsStagingArea"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isLetMeIn=%d"), -[CXJoinCallAction isLetMeIn](self, "isLetMeIn"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isJoiningConversationWithLink=%d"), -[CXJoinCallAction isJoiningConversationWithLink](self, "isJoiningConversationWithLink"));
  -[CXJoinCallAction pseudonym](self, "pseudonym");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CXJoinCallAction pseudonym](self, "pseudonym");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" pseudonym=%@"), v13);

  }
  -[CXJoinCallAction publicKey](self, "publicKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CXJoinCallAction publicKey](self, "publicKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" publicKey=%@"), v15);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" video=%d"), -[CXJoinCallAction isVideo](self, "isVideo"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" relay=%d"), -[CXJoinCallAction isRelay](self, "isRelay"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" screening=%d"), -[CXJoinCallAction isScreening](self, "isScreening"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" upgrade=%d"), -[CXJoinCallAction isUpgrade](self, "isUpgrade"));
  -[CXJoinCallAction upgradeSessionUUID](self, "upgradeSessionUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" upgradeSessionUUID=%@"), v16);

  objc_msgSend(v3, "appendFormat:", CFSTR(" avMode=%lu"), -[CXJoinCallAction avMode](self, "avMode"));
  objc_msgSend((id)objc_opt_class(), "timeout");
  objc_msgSend(v3, "appendFormat:", CFSTR(" timeout=%f"), v17);
  objc_msgSend(v3, "appendFormat:", CFSTR(" presentationMode=%lu"), -[CXJoinCallAction presentationMode](self, "presentationMode"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" screenShareRequestType=%lu"), -[CXJoinCallAction screenShareRequestType](self, "screenShareRequestType"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" shouldSendLegacyScreenSharingInvite=%d"), -[CXJoinCallAction shouldSendLegacyScreenSharingInvite](self, "shouldSendLegacyScreenSharingInvite"));
  -[CXJoinCallAction messagesGroupUUID](self, "messagesGroupUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CXJoinCallAction messagesGroupUUID](self, "messagesGroupUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" messagesGroupUUID=%@"), v19);

  }
  -[CXJoinCallAction messagesGroupName](self, "messagesGroupName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CXJoinCallAction messagesGroupName](self, "messagesGroupName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" messagesGroupName=%@"), v21);

  }
  -[CXJoinCallAction remotePushTokens](self, "remotePushTokens");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[CXJoinCallAction remotePushTokens](self, "remotePushTokens");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" remotePushTokens=%@"), v23);

  }
  -[CXJoinCallAction joinCallActivity](self, "joinCallActivity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[CXJoinCallAction joinCallActivity](self, "joinCallActivity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" joinCallActivity=%@"), v25);

  }
  -[CXJoinCallAction conversationProviderIdentifier](self, "conversationProviderIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[CXJoinCallAction conversationProviderIdentifier](self, "conversationProviderIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" conversationProviderIdentifier=%@"), v27);

  }
  -[CXJoinCallAction notificationStylesByHandleType](self, "notificationStylesByHandleType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[CXJoinCallAction notificationStylesByHandleType](self, "notificationStylesByHandleType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" notificationStylesByHandleType=%@"), v29);

  }
  -[CXJoinCallAction associationIdentifier](self, "associationIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[CXJoinCallAction associationIdentifier](self, "associationIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" associationIdentifier=%@"), v31);

  }
  -[CXJoinCallAction associationAVCIdentifier](self, "associationAVCIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[CXJoinCallAction associationAVCIdentifier](self, "associationAVCIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" associationAVCIdentifier=%@"), v33);

  }
  -[CXJoinCallAction collaborationIdentifier](self, "collaborationIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[CXJoinCallAction collaborationIdentifier](self, "collaborationIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" collaborationIdentifier=%@"), v35);

  }
  return v3;
}

- (void)fulfill
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CXJoinCallAction fulfillWithDateStarted:](self, "fulfillWithDateStarted:", v3);

}

- (void)fulfillWithDateStarted:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXJoinCallAction fulfillWithDateStarted:]", CFSTR("dateStarted"));
  v4 = (void *)-[CXJoinCallAction copy](self, "copy");
  objc_msgSend(v4, "updateAsFulfilledWithDateStarted:", v6);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionCompleted:", v4);

}

- (void)updateAsFulfilledWithDateStarted:(id)a3
{
  id v4;

  v4 = a3;
  -[CXAction updateAsFulfilled](self, "updateAsFulfilled");
  -[CXJoinCallAction setDateStarted:](self, "setDateStarted:", v4);

}

+ (double)timeout
{
  void *v2;
  void *v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("join-call-action-timeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (double)(unint64_t)objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 15.0;

  return v4;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CXJoinCallAction;
  v6 = a3;
  -[CXAction updateCopy:withZone:](&v24, sel_updateCopy_withZone_, v6, a4);
  -[CXJoinCallAction groupUUID](self, "groupUUID", v24.receiver, v24.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGroupUUID:", v7);

  -[CXJoinCallAction remoteMembers](self, "remoteMembers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteMembers:", v8);

  -[CXJoinCallAction otherInvitedHandles](self, "otherInvitedHandles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOtherInvitedHandles:", v9);

  -[CXJoinCallAction callerID](self, "callerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCallerID:", v10);

  objc_msgSend(v6, "setVideoEnabled:", -[CXJoinCallAction isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v6, "setUplinkMuted:", -[CXJoinCallAction isUplinkMuted](self, "isUplinkMuted"));
  objc_msgSend(v6, "setShouldSuppressInCallUI:", -[CXJoinCallAction shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  objc_msgSend(v6, "setWantsStagingArea:", -[CXJoinCallAction wantsStagingArea](self, "wantsStagingArea"));
  objc_msgSend(v6, "setLetMeIn:", -[CXJoinCallAction isLetMeIn](self, "isLetMeIn"));
  objc_msgSend(v6, "setJoiningConversationWithLink:", -[CXJoinCallAction isJoiningConversationWithLink](self, "isJoiningConversationWithLink"));
  -[CXJoinCallAction pseudonym](self, "pseudonym");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPseudonym:", v11);

  -[CXJoinCallAction publicKey](self, "publicKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPublicKey:", v12);

  objc_msgSend(v6, "setVideo:", -[CXJoinCallAction isVideo](self, "isVideo"));
  objc_msgSend(v6, "setUpgrade:", -[CXJoinCallAction isUpgrade](self, "isUpgrade"));
  -[CXJoinCallAction messagesGroupUUID](self, "messagesGroupUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessagesGroupUUID:", v13);

  -[CXJoinCallAction messagesGroupName](self, "messagesGroupName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessagesGroupName:", v14);

  -[CXJoinCallAction dateStarted](self, "dateStarted");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDateStarted:", v15);

  -[CXJoinCallAction upgradeSessionUUID](self, "upgradeSessionUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUpgradeSessionUUID:", v16);

  -[CXJoinCallAction remotePushTokens](self, "remotePushTokens");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemotePushTokens:", v17);

  -[CXJoinCallAction joinCallActivity](self, "joinCallActivity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setJoinCallActivity:", v18);

  -[CXJoinCallAction conversationProviderIdentifier](self, "conversationProviderIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConversationProviderIdentifier:", v19);

  -[CXJoinCallAction notificationStylesByHandleType](self, "notificationStylesByHandleType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNotificationStylesByHandleType:", v20);

  objc_msgSend(v6, "setAvMode:", -[CXJoinCallAction avMode](self, "avMode"));
  objc_msgSend(v6, "setPresentationMode:", -[CXJoinCallAction presentationMode](self, "presentationMode"));
  -[CXJoinCallAction associationIdentifier](self, "associationIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssociationIdentifier:", v21);

  -[CXJoinCallAction associationAVCIdentifier](self, "associationAVCIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssociationAVCIdentifier:", v22);

  -[CXJoinCallAction collaborationIdentifier](self, "collaborationIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCollaborationIdentifier:", v23);

  objc_msgSend(v6, "setRelay:", -[CXJoinCallAction isRelay](self, "isRelay"));
  objc_msgSend(v6, "setScreenShareRequestType:", -[CXJoinCallAction screenShareRequestType](self, "screenShareRequestType"));
  objc_msgSend(v6, "setShouldSendLegacyScreenSharingInvite:", -[CXJoinCallAction shouldSendLegacyScreenSharingInvite](self, "shouldSendLegacyScreenSharingInvite"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXJoinCallAction)initWithCoder:(id)a3
{
  id v4;
  CXJoinCallAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUUID *groupUUID;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSSet *remoteMembers;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSSet *otherInvitedHandles;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  CXHandle *callerID;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *pseudonym;
  void *v35;
  uint64_t v36;
  NSData *publicKey;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSUUID *messagesGroupUUID;
  void *v44;
  uint64_t v45;
  NSString *messagesGroupName;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSDate *dateStarted;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSUUID *upgradeSessionUUID;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSSet *remotePushTokens;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  CXJoinCallActivity *joinCallActivity;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSString *conversationProviderIdentifier;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  NSDictionary *notificationStylesByHandleType;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  NSNumber *associationIdentifier;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  NSString *associationAVCIdentifier;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  NSString *collaborationIdentifier;
  void *v89;
  void *v90;
  void *v91;
  objc_super v93;

  v4 = a3;
  v93.receiver = self;
  v93.super_class = (Class)CXJoinCallAction;
  v5 = -[CXCallAction initWithCoder:](&v93, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_groupUUID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    groupUUID = v5->_groupUUID;
    v5->_groupUUID = (NSUUID *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_remoteMembers);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    remoteMembers = v5->_remoteMembers;
    v5->_remoteMembers = (NSSet *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_otherInvitedHandles);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    otherInvitedHandles = v5->_otherInvitedHandles;
    v5->_otherInvitedHandles = (NSSet *)v20;

    v22 = objc_opt_class();
    NSStringFromSelector(sel_callerID);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    callerID = v5->_callerID;
    v5->_callerID = (CXHandle *)v24;

    NSStringFromSelector(sel_isVideoEnabled);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_videoEnabled = objc_msgSend(v4, "decodeBoolForKey:", v26);

    NSStringFromSelector(sel_isUplinkMuted);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_uplinkMuted = objc_msgSend(v4, "decodeBoolForKey:", v27);

    NSStringFromSelector(sel_shouldSuppressInCallUI);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldSuppressInCallUI = objc_msgSend(v4, "decodeBoolForKey:", v28);

    NSStringFromSelector(sel_wantsStagingArea);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wantsStagingArea = objc_msgSend(v4, "decodeBoolForKey:", v29);

    NSStringFromSelector(sel_isLetMeIn);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_letMeIn = objc_msgSend(v4, "decodeBoolForKey:", v30);

    NSStringFromSelector(sel_isJoiningConversationWithLink);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_joiningConversationWithLink = objc_msgSend(v4, "decodeBoolForKey:", v31);

    NSStringFromSelector(sel_pseudonym);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v32);
    v33 = objc_claimAutoreleasedReturnValue();
    pseudonym = v5->_pseudonym;
    v5->_pseudonym = (NSString *)v33;

    NSStringFromSelector(sel_publicKey);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v35);
    v36 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v36;

    NSStringFromSelector(sel_isVideo);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_video = objc_msgSend(v4, "decodeBoolForKey:", v38);

    NSStringFromSelector(sel_isUpgrade);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_upgrade = objc_msgSend(v4, "decodeBoolForKey:", v39);

    NSStringFromSelector(sel_isRelay);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_relay = objc_msgSend(v4, "decodeBoolForKey:", v40);

    NSStringFromSelector(sel_messagesGroupUUID);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v41);
    v42 = objc_claimAutoreleasedReturnValue();
    messagesGroupUUID = v5->_messagesGroupUUID;
    v5->_messagesGroupUUID = (NSUUID *)v42;

    NSStringFromSelector(sel_messagesGroupName);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v44);
    v45 = objc_claimAutoreleasedReturnValue();
    messagesGroupName = v5->_messagesGroupName;
    v5->_messagesGroupName = (NSString *)v45;

    v47 = objc_opt_class();
    NSStringFromSelector(sel_dateStarted);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v47, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    dateStarted = v5->_dateStarted;
    v5->_dateStarted = (NSDate *)v49;

    v51 = objc_opt_class();
    NSStringFromSelector(sel_upgradeSessionUUID);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();
    upgradeSessionUUID = v5->_upgradeSessionUUID;
    v5->_upgradeSessionUUID = (NSUUID *)v53;

    v55 = (void *)MEMORY[0x1E0C99E60];
    v56 = objc_opt_class();
    objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_remotePushTokens);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v57, v58);
    v59 = objc_claimAutoreleasedReturnValue();
    remotePushTokens = v5->_remotePushTokens;
    v5->_remotePushTokens = (NSSet *)v59;

    v61 = objc_opt_class();
    NSStringFromSelector(sel_joinCallActivity);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v61, v62);
    v63 = objc_claimAutoreleasedReturnValue();
    joinCallActivity = v5->_joinCallActivity;
    v5->_joinCallActivity = (CXJoinCallActivity *)v63;

    v65 = objc_opt_class();
    NSStringFromSelector(sel_conversationProviderIdentifier);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v65, v66);
    v67 = objc_claimAutoreleasedReturnValue();
    conversationProviderIdentifier = v5->_conversationProviderIdentifier;
    v5->_conversationProviderIdentifier = (NSString *)v67;

    v69 = (void *)MEMORY[0x1E0C99E60];
    v70 = objc_opt_class();
    objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_notificationStylesByHandleType);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v71, v72);
    v73 = objc_claimAutoreleasedReturnValue();
    notificationStylesByHandleType = v5->_notificationStylesByHandleType;
    v5->_notificationStylesByHandleType = (NSDictionary *)v73;

    NSStringFromSelector(sel_avMode);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_avMode = objc_msgSend(v4, "decodeIntegerForKey:", v75);

    NSStringFromSelector(sel_presentationMode);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_presentationMode = objc_msgSend(v4, "decodeIntegerForKey:", v76);

    v77 = objc_opt_class();
    NSStringFromSelector(sel_associationIdentifier);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v77, v78);
    v79 = objc_claimAutoreleasedReturnValue();
    associationIdentifier = v5->_associationIdentifier;
    v5->_associationIdentifier = (NSNumber *)v79;

    v81 = objc_opt_class();
    NSStringFromSelector(sel_associationAVCIdentifier);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v81, v82);
    v83 = objc_claimAutoreleasedReturnValue();
    associationAVCIdentifier = v5->_associationAVCIdentifier;
    v5->_associationAVCIdentifier = (NSString *)v83;

    v85 = objc_opt_class();
    NSStringFromSelector(sel_collaborationIdentifier);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v85, v86);
    v87 = objc_claimAutoreleasedReturnValue();
    collaborationIdentifier = v5->_collaborationIdentifier;
    v5->_collaborationIdentifier = (NSString *)v87;

    NSStringFromSelector(sel_isRelay);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_relay = objc_msgSend(v4, "decodeBoolForKey:", v89);

    NSStringFromSelector(sel_screenShareRequestType);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_screenShareRequestType = objc_msgSend(v4, "decodeIntegerForKey:", v90);

    NSStringFromSelector(sel_shouldSendLegacyScreenSharingInvite);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldSendLegacyScreenSharingInvite = objc_msgSend(v4, "decodeBoolForKey:", v91);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL8 v59;
  void *v60;
  unint64_t v61;
  void *v62;
  _BOOL8 v63;
  void *v64;
  objc_super v65;

  v65.receiver = self;
  v65.super_class = (Class)CXJoinCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v65, sel_encodeWithCoder_, v4);
  -[CXJoinCallAction groupUUID](self, "groupUUID", v65.receiver, v65.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_groupUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXJoinCallAction remoteMembers](self, "remoteMembers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_remoteMembers);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[CXJoinCallAction otherInvitedHandles](self, "otherInvitedHandles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_otherInvitedHandles);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[CXJoinCallAction callerID](self, "callerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_callerID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[CXJoinCallAction isVideoEnabled](self, "isVideoEnabled");
  NSStringFromSelector(sel_isVideoEnabled);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  v15 = -[CXJoinCallAction isUplinkMuted](self, "isUplinkMuted");
  NSStringFromSelector(sel_isUplinkMuted);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  v17 = -[CXJoinCallAction shouldSuppressInCallUI](self, "shouldSuppressInCallUI");
  NSStringFromSelector(sel_shouldSuppressInCallUI);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  v19 = -[CXJoinCallAction wantsStagingArea](self, "wantsStagingArea");
  NSStringFromSelector(sel_wantsStagingArea);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

  v21 = -[CXJoinCallAction isVideo](self, "isVideo");
  NSStringFromSelector(sel_isVideo);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v21, v22);

  v23 = -[CXJoinCallAction isUpgrade](self, "isUpgrade");
  NSStringFromSelector(sel_isUpgrade);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v23, v24);

  v25 = -[CXJoinCallAction isLetMeIn](self, "isLetMeIn");
  NSStringFromSelector(sel_isLetMeIn);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v25, v26);

  v27 = -[CXJoinCallAction isJoiningConversationWithLink](self, "isJoiningConversationWithLink");
  NSStringFromSelector(sel_isJoiningConversationWithLink);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v27, v28);

  -[CXJoinCallAction pseudonym](self, "pseudonym");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_pseudonym);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, v30);

  -[CXJoinCallAction publicKey](self, "publicKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_publicKey);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, v32);

  -[CXJoinCallAction messagesGroupUUID](self, "messagesGroupUUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_messagesGroupUUID);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, v34);

  -[CXJoinCallAction messagesGroupName](self, "messagesGroupName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_messagesGroupName);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, v36);

  -[CXJoinCallAction dateStarted](self, "dateStarted");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dateStarted);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, v38);

  -[CXJoinCallAction upgradeSessionUUID](self, "upgradeSessionUUID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_upgradeSessionUUID);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, v40);

  -[CXJoinCallAction remotePushTokens](self, "remotePushTokens");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_remotePushTokens);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v41, v42);

  -[CXJoinCallAction joinCallActivity](self, "joinCallActivity");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_joinCallActivity);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v43, v44);

  -[CXJoinCallAction conversationProviderIdentifier](self, "conversationProviderIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_conversationProviderIdentifier);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v45, v46);

  -[CXJoinCallAction notificationStylesByHandleType](self, "notificationStylesByHandleType");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_notificationStylesByHandleType);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v47, v48);

  v49 = -[CXJoinCallAction avMode](self, "avMode");
  NSStringFromSelector(sel_avMode);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v49, v50);

  v51 = -[CXJoinCallAction presentationMode](self, "presentationMode");
  NSStringFromSelector(sel_presentationMode);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v51, v52);

  -[CXJoinCallAction associationIdentifier](self, "associationIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_associationIdentifier);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v53, v54);

  -[CXJoinCallAction associationAVCIdentifier](self, "associationAVCIdentifier");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_associationAVCIdentifier);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v55, v56);

  -[CXJoinCallAction collaborationIdentifier](self, "collaborationIdentifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_collaborationIdentifier);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v57, v58);

  v59 = -[CXJoinCallAction isRelay](self, "isRelay");
  NSStringFromSelector(sel_isRelay);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v59, v60);

  v61 = -[CXJoinCallAction screenShareRequestType](self, "screenShareRequestType");
  NSStringFromSelector(sel_screenShareRequestType);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v61, v62);

  v63 = -[CXJoinCallAction shouldSendLegacyScreenSharingInvite](self, "shouldSendLegacyScreenSharingInvite");
  NSStringFromSelector(sel_shouldSendLegacyScreenSharingInvite);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v63, v64);

}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (void)setGroupUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSSet)remoteMembers
{
  return self->_remoteMembers;
}

- (void)setRemoteMembers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSSet)otherInvitedHandles
{
  return self->_otherInvitedHandles;
}

- (void)setOtherInvitedHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CXHandle)callerID
{
  return self->_callerID;
}

- (void)setCallerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)isUplinkMuted
{
  return self->_uplinkMuted;
}

- (void)setUplinkMuted:(BOOL)a3
{
  self->_uplinkMuted = a3;
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (void)setAvMode:(unint64_t)a3
{
  self->_avMode = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (void)setCollaborationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  self->_shouldSuppressInCallUI = a3;
}

- (BOOL)wantsStagingArea
{
  return self->_wantsStagingArea;
}

- (void)setWantsStagingArea:(BOOL)a3
{
  self->_wantsStagingArea = a3;
}

- (BOOL)isLetMeIn
{
  return self->_letMeIn;
}

- (void)setLetMeIn:(BOOL)a3
{
  self->_letMeIn = a3;
}

- (BOOL)isJoiningConversationWithLink
{
  return self->_joiningConversationWithLink;
}

- (void)setJoiningConversationWithLink:(BOOL)a3
{
  self->_joiningConversationWithLink = a3;
}

- (NSString)pseudonym
{
  return self->_pseudonym;
}

- (void)setPseudonym:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (BOOL)isUpgrade
{
  return self->_upgrade;
}

- (void)setUpgrade:(BOOL)a3
{
  self->_upgrade = a3;
}

- (NSUUID)upgradeSessionUUID
{
  return self->_upgradeSessionUUID;
}

- (void)setUpgradeSessionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSUUID)messagesGroupUUID
{
  return self->_messagesGroupUUID;
}

- (void)setMessagesGroupUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)messagesGroupName
{
  return self->_messagesGroupName;
}

- (void)setMessagesGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSDate)dateStarted
{
  return self->_dateStarted;
}

- (void)setDateStarted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSSet)remotePushTokens
{
  return self->_remotePushTokens;
}

- (void)setRemotePushTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (CXJoinCallActivity)joinCallActivity
{
  return self->_joinCallActivity;
}

- (void)setJoinCallActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)isRelay
{
  return self->_relay;
}

- (void)setRelay:(BOOL)a3
{
  self->_relay = a3;
}

- (BOOL)isScreening
{
  return self->_screening;
}

- (void)setScreening:(BOOL)a3
{
  self->_screening = a3;
}

- (NSString)conversationProviderIdentifier
{
  return self->_conversationProviderIdentifier;
}

- (void)setConversationProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSDictionary)notificationStylesByHandleType
{
  return self->_notificationStylesByHandleType;
}

- (void)setNotificationStylesByHandleType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSNumber)associationIdentifier
{
  return self->_associationIdentifier;
}

- (void)setAssociationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)associationAVCIdentifier
{
  return self->_associationAVCIdentifier;
}

- (void)setAssociationAVCIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (unint64_t)screenShareRequestType
{
  return self->_screenShareRequestType;
}

- (void)setScreenShareRequestType:(unint64_t)a3
{
  self->_screenShareRequestType = a3;
}

- (BOOL)shouldSendLegacyScreenSharingInvite
{
  return self->_shouldSendLegacyScreenSharingInvite;
}

- (void)setShouldSendLegacyScreenSharingInvite:(BOOL)a3
{
  self->_shouldSendLegacyScreenSharingInvite = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationAVCIdentifier, 0);
  objc_storeStrong((id *)&self->_associationIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationStylesByHandleType, 0);
  objc_storeStrong((id *)&self->_conversationProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_joinCallActivity, 0);
  objc_storeStrong((id *)&self->_remotePushTokens, 0);
  objc_storeStrong((id *)&self->_dateStarted, 0);
  objc_storeStrong((id *)&self->_messagesGroupName, 0);
  objc_storeStrong((id *)&self->_messagesGroupUUID, 0);
  objc_storeStrong((id *)&self->_upgradeSessionUUID, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_pseudonym, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
  objc_storeStrong((id *)&self->_callerID, 0);
  objc_storeStrong((id *)&self->_otherInvitedHandles, 0);
  objc_storeStrong((id *)&self->_remoteMembers, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
}

@end
