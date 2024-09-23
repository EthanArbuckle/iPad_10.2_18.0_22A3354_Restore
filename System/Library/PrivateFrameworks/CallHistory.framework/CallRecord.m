@implementation CallRecord

- (NSSet)chRemoteParticipantHandles
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int64_t v14;
  int64_t v15;
  CHPhoneNumber *v16;
  void *v17;
  CHPhoneNumber *v18;
  void *v19;
  CHHandle *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = -[CallRecord supportsRemoteParticipantHandles](self, "supportsRemoteParticipantHandles");
  v4 = objc_alloc(MEMORY[0x1E0C99E20]);
  v5 = v4;
  if (v3)
  {
    -[CallRecord remoteParticipantHandles](self, "remoteParticipantHandles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[CallRecord remoteParticipantHandles](self, "remoteParticipantHandles", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "chHandle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }
  }
  else
  {
    v7 = (void *)objc_msgSend(v4, "initWithCapacity:", 1);
    -[CallRecord address](self, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CallRecord chHandleType](self, "chHandleType");
    if (v14 && v8)
    {
      v15 = v14;
      if (v14 == 2)
      {
        v16 = [CHPhoneNumber alloc];
        -[CallRecord iso_country_code](self, "iso_country_code");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[CHPhoneNumber initWithDigits:isoCountryCode:](v16, "initWithDigits:isoCountryCode:", v8, v17);

        -[CHPhoneNumber normalizedRepresentation](v18, "normalizedRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = 0;
      }
      v20 = -[CHHandle initWithType:value:normalizedValue:]([CHHandle alloc], "initWithType:value:normalizedValue:", v15, v8, v19);
      objc_msgSend(v7, "addObject:", v20);

    }
  }

  v21 = (void *)objc_msgSend(v7, "copy");
  return (NSSet *)v21;
}

- (BOOL)supportsRemoteParticipantHandles
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 14;

  return v4;
}

- (CHRecentCall)chRecentCall
{
  CHRecentCall *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v36;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(CHRecentCall);
  -[CallRecord face_time_data](self, "face_time_data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setBytesOfDataUsed:](v3, "setBytesOfDataUsed:", v4);

  -[CallRecord number_availability](self, "number_availability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setCallerIdAvailability:](v3, "setCallerIdAvailability:", objc_msgSend(v5, "integerValue"));

  -[CallRecord location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setCallerIdLocation:](v3, "setCallerIdLocation:", v6);

  -[CHRecentCall setCallStatus:](v3, "setCallStatus:", -[CallRecord chCallStatus](self, "chCallStatus"));
  -[CallRecord date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setDate:](v3, "setDate:", v7);

  -[CallRecord disconnected_cause](self, "disconnected_cause");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setDisconnectedCause:](v3, "setDisconnectedCause:", v8);

  -[CallRecord duration](self, "duration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  -[CHRecentCall setDuration:](v3, "setDuration:");

  -[CallRecord filtered_out_reason](self, "filtered_out_reason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setFilteredOutReason:](v3, "setFilteredOutReason:", v10);

  -[CallRecord handle_type](self, "handle_type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setHandleType:](v3, "setHandleType:", objc_msgSend(v11, "integerValue"));

  -[CallRecord imageURL](self, "imageURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setImageURL:](v3, "setImageURL:", v12);

  -[CallRecord iso_country_code](self, "iso_country_code");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setIsoCountryCode:](v3, "setIsoCountryCode:", v13);

  -[CallRecord junkConfidence](self, "junkConfidence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setJunkConfidence:](v3, "setJunkConfidence:", objc_msgSend(v14, "integerValue"));

  -[CallRecord junkIdentificationCategory](self, "junkIdentificationCategory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setJunkIdentificationCategory:](v3, "setJunkIdentificationCategory:", v15);

  -[CallRecord localParticipantUUID](self, "localParticipantUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setLocalParticipantUUID:](v3, "setLocalParticipantUUID:", v16);

  -[CallRecord name](self, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setName:](v3, "setName:", v17);

  -[CallRecord outgoingLocalParticipantUUID](self, "outgoingLocalParticipantUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setOutgoingLocalParticipantUUID:](v3, "setOutgoingLocalParticipantUUID:", v18);

  -[CallRecord participantGroupUUID](self, "participantGroupUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setParticipantGroupUUID:](v3, "setParticipantGroupUUID:", v19);

  -[CallRecord read](self, "read");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setRead:](v3, "setRead:", objc_msgSend(v20, "BOOLValue"));

  -[CallRecord chRemoteParticipantHandles](self, "chRemoteParticipantHandles");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setRemoteParticipantHandles:](v3, "setRemoteParticipantHandles:", v21);

  -[CallRecord service_provider](self, "service_provider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setServiceProvider:](v3, "setServiceProvider:", v22);

  -[CallRecord unique_id](self, "unique_id");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setUniqueId:](v3, "setUniqueId:", v23);

  -[CallRecord verificationStatus](self, "verificationStatus");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setVerificationStatus:](v3, "setVerificationStatus:", objc_msgSend(v24, "integerValue"));

  -[CallRecord hasMessage](self, "hasMessage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setHasMessage:](v3, "setHasMessage:", objc_msgSend(v25, "BOOLValue"));

  -[CallRecord conversationID](self, "conversationID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setConversationID:](v3, "setConversationID:", v26);

  -[CallRecord autoAnsweredReason](self, "autoAnsweredReason");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setAutoAnsweredReason:](v3, "setAutoAnsweredReason:", objc_msgSend(v27, "integerValue"));

  -[CallRecord chEmergencyMediaItems](self, "chEmergencyMediaItems");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setEmergencyMediaItems:](v3, "setEmergencyMediaItems:", v28);

  -[CHRecentCall setUsedEmergencyVideoStreaming:](v3, "setUsedEmergencyVideoStreaming:", -[CallRecord usedEmergencyVideoStreaming](self, "usedEmergencyVideoStreaming"));
  -[CHRecentCall setWasEmergencyCall:](v3, "setWasEmergencyCall:", -[CallRecord wasEmergencyCall](self, "wasEmergencyCall"));
  -[CallRecord blockedByExtension](self, "blockedByExtension");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setBlockedByExtension:](v3, "setBlockedByExtension:", v29);

  -[CallRecord callDirectoryIdentityType](self, "callDirectoryIdentityType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setCallDirectoryIdentityType:](v3, "setCallDirectoryIdentityType:", objc_msgSend(v30, "integerValue"));

  -[CallRecord screenSharingType](self, "screenSharingType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setScreenSharingType:](v3, "setScreenSharingType:", objc_msgSend(v31, "integerValue"));

  -[CallRecord call_category](self, "call_category");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setCallCategory:](v3, "setCallCategory:", objc_msgSend(v32, "integerValue"));

  -[CallRecord address](self, "address");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setCallerId:](v3, "setCallerId:", v33);

  -[CallRecord calltype](self, "calltype");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setCallType:](v3, "setCallType:", objc_msgSend(v34, "integerValue"));

  -[CHRecentCall dictionaryRepresentation](v3, "dictionaryRepresentation");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHRecentCall setCallOccurrences:](v3, "setCallOccurrences:", v36);

  return v3;
}

- (unsigned)chCallStatus
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  int *v8;
  void *v9;
  int v10;

  -[CallRecord originated](self, "originated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[CallRecord duration](self, "duration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  if (v4)
  {
    v8 = &kCHCallStatusCancelled;
    if (v7 > 0.0)
      v8 = &kCHCallStatusConnectedOutgoing;
  }
  else if (v7 <= 0.0)
  {
    -[CallRecord answered](self, "answered");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v8 = &kCHCallStatusMissed;
    if (v10)
      v8 = &kCHCallStatusAnsweredElsewhere;
  }
  else
  {
    v8 = &kCHCallStatusConnectedIncoming;
  }
  return *v8;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CallRecord"));
}

- (void)setChCallStatus:(unsigned int)a3
{
  id v4;

  if (a3 == 1)
    goto LABEL_4;
  if (a3 == 2)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CallRecord setOriginated:](self, "setOriginated:");
    goto LABEL_7;
  }
  if (a3 != 4)
  {
    if (a3 != 16)
      return;
    goto LABEL_6;
  }
LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CallRecord setAnswered:](self, "setAnswered:");
LABEL_7:

}

- (int64_t)chHandleType
{
  void *v3;
  uint64_t v4;
  int64_t v5;

  if (-[CallRecord supportsHandleType](self, "supportsHandleType"))
  {
    -[CallRecord handle_type](self, "handle_type");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    -[CallRecord address](self, "address");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[CHHandle handleTypeForValue:](CHHandle, "handleTypeForValue:", v3);
  }
  v5 = v4;

  return v5;
}

- (NSSet)chEmergencyMediaItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[CallRecord supportsEmergencyMedia](self, "supportsEmergencyMedia"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[CallRecord emergencyMediaItems](self, "emergencyMediaItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[CallRecord emergencyMediaItems](self, "emergencyMediaItems", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "chEmergencyMediaItem");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }
  v12 = (void *)objc_msgSend(v5, "copy");

  return (NSSet *)v12;
}

- (id)compositeCallCategoryForContext:(id)a3
{
  void *v4;
  uint64_t v5;

  if (-[CallRecord supportsCallCategory](self, "supportsCallCategory", a3))
  {
    -[CallRecord call_category](self, "call_category");
  }
  else
  {
    -[CallRecord calltype](self, "calltype");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[CHRecentCall categoryForCallType:](CHRecentCall, "categoryForCallType:", v5));
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)compositeHandleTypeForContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CallRecord chHandleType](self, "chHandleType", a3));
}

- (id)compositeJunkConfidenceForContext:(id)a3
{
  if (-[CallRecord supportsJunkConfidence](self, "supportsJunkConfidence", a3))
    -[CallRecord junkConfidence](self, "junkConfidence");
  else
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)compositeCallDirectoryIdentityType:(id)a3
{
  if (-[CallRecord supportsCallDirectoryIdentityType](self, "supportsCallDirectoryIdentityType", a3))
    -[CallRecord callDirectoryIdentityType](self, "callDirectoryIdentityType");
  else
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)compositeLocalParticipantUUIDForContext:(id)a3
{
  void *v4;

  if (-[CallRecord supportsLocalParticipantUUID](self, "supportsLocalParticipantUUID", a3))
  {
    -[CallRecord localParticipantUUID](self, "localParticipantUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)compositeOutgoingLocalParticipantUUIDForContext:(id)a3
{
  void *v4;

  if (-[CallRecord supportsOutgoingLocalParticipantUUID](self, "supportsOutgoingLocalParticipantUUID", a3))
  {
    -[CallRecord outgoingLocalParticipantUUID](self, "outgoingLocalParticipantUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)compositeParticipantGroupUUIDForContext:(id)a3
{
  void *v4;

  if (-[CallRecord supportsParticipantGroupUUID](self, "supportsParticipantGroupUUID", a3))
  {
    -[CallRecord participantGroupUUID](self, "participantGroupUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)compositeRemoteParticipantHandlesForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CallRecord supportsRemoteParticipantHandles](self, "supportsRemoteParticipantHandles"))
  {
    -[CallRecord remoteParticipantHandles](self, "remoteParticipantHandles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithContext:", v4, (_QWORD)v16);
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v13 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    -[CallRecord chRemoteParticipantHandles](self, "chRemoteParticipantHandles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      +[CHManagedHandle managedHandlesForHandles:inManagedObjectContext:](CHManagedHandle, "managedHandlesForHandles:inManagedObjectContext:", v14, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (id)compositeServiceProviderForContext:(id)a3
{
  void *v4;
  uint64_t v5;

  if (-[CallRecord supportsServiceProvider](self, "supportsServiceProvider", a3))
  {
    -[CallRecord service_provider](self, "service_provider");
  }
  else
  {
    -[CallRecord calltype](self, "calltype");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    +[CHRecentCall serviceProviderForCallType:](CHRecentCall, "serviceProviderForCallType:", v5);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)compositeVerificationStatusForContext:(id)a3
{
  if (-[CallRecord supportsVerificationStatus](self, "supportsVerificationStatus", a3))
    -[CallRecord verificationStatus](self, "verificationStatus");
  else
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)compositeEmergencyMediaItemsForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CallRecord supportsEmergencyMedia](self, "supportsEmergencyMedia"))
  {
    -[CallRecord emergencyMediaItems](self, "emergencyMediaItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "copyWithContext:", v4, (_QWORD)v15);
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    v13 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)addEmergencyMediaItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[CallRecord chEmergencyMediaItems](self, "chEmergencyMediaItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "isEqualToMediaItem:", v4) & 1) != 0)
        {
          v19 = 0;
          goto LABEL_18;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v7)
        continue;
      break;
    }
  }

  v10 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[CallRecord chEmergencyMediaItems](self, "chEmergencyMediaItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count") + 1);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[CallRecord emergencyMediaItems](self, "emergencyMediaItems", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  -[CallRecord managedObjectContext](self, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[EmergencyMediaItem managedEmergencyMediaItemForEmergencyMediaItem:inManagedObjectContext:](EmergencyMediaItem, "managedEmergencyMediaItemForEmergencyMediaItem:inManagedObjectContext:", v4, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v18);
  -[CallRecord setEmergencyMediaItems:](self, "setEmergencyMediaItems:", v5);

  v19 = 1;
LABEL_18:

  return v19;
}

- (BOOL)supportsCallCategory
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 5;

  return v4;
}

- (BOOL)supportsHandleType
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 12;

  return v4;
}

- (BOOL)supportsImageURL
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 23;

  return v4;
}

- (BOOL)supportsBlockedBy
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 30;

  return v4;
}

- (BOOL)supportsCallDirectoryIdentityType
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 31;

  return v4;
}

- (BOOL)supportsJunkConfidence
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 20;

  return v4;
}

- (BOOL)supportsLocalParticipantUUID
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 15;

  return v4;
}

- (BOOL)supportsOutgoingLocalParticipantUUID
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 16;

  return v4;
}

- (BOOL)supportsParticipantGroupUUID
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 22;

  return v4;
}

- (BOOL)supportsServiceProvider
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 5;

  return v4;
}

- (BOOL)supportsVerificationStatus
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 17;

  return v4;
}

- (BOOL)supportsHasMessage
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 24;

  return v4;
}

- (BOOL)supportsJunkIdentificationCategory
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 25;

  return v4;
}

- (BOOL)supportsAutoAnsweredReason
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 27;

  return v4;
}

- (BOOL)supportsEmergencyMedia
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 28;

  return v4;
}

- (BOOL)supportsScreenSharingType
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CallRecord entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v3) > 33;

  return v4;
}

@end
