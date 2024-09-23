@implementation IMTextMessagePipelineParameter

+ (id)participantDestinationIdentifierWithMessage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "messageSubType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  switch(v5)
  {
    case 0:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "typingIndicator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 1:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 2:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tapback");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 3:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "balloonPlugin");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 4:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sticker");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 5:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "audioMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 6:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "emojiTapback");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 7:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stickerTapback");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v11 = (void *)v9;

      break;
    default:
      if (IMOSLoggingEnabled(v6))
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v13 = 134217984;
          v14 = v5;
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "<IMTextMessagePipelineParameter> Unhandled BlastDoorTextMessageMessageType: %ld", (uint8_t *)&v13, 0xCu);
        }

      }
      v11 = 0;
      break;
  }

  return v11;
}

+ (id)participantDestinationIdentifierWithBasicMessage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "messageSubType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  switch(v5)
  {
    case 0:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "typingIndicator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 1:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tapback");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 3:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "audioMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 4:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unsupported");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 5:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "emojiTapback");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "participantDestinationIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v11 = (void *)v9;

      break;
    default:
      if (IMOSLoggingEnabled(v6))
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v13 = 134217984;
          v14 = v5;
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "<IMTextMessagePipelineParameter> Unable to extract destination identifiers from BlastDoorTextMessageMessageType: %ld", (uint8_t *)&v13, 0xCu);
        }

      }
      v11 = 0;
      break;
  }

  return v11;
}

- (id)messageSummaryInfoDictionaryWithBlastDoorMessage:(id)a3
{
  id v3;
  __CFDictionary *Mutable;
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
  const void *v29;
  void *v30;
  void *v31;
  void *v32;
  const void *v33;
  __CFDictionary *v34;
  __CFDictionary *v35;

  v3 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "messageSubType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tapback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageSummaryInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v8, "contentType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D38350], v9);

  objc_msgSend(v3, "messageSubType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tapback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageSummaryInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "summary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D383C0], v13);

  objc_msgSend(v3, "messageSubType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tapback");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messageSummaryInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pluginBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D38388], v17);

  objc_msgSend(v3, "messageSubType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tapback");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messageSummaryInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pluginDisplayName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D38390], v21);

  objc_msgSend(v3, "messageSummaryInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "associatedBalloonBundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D38328], v23);

  objc_msgSend(v3, "messageSummaryInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sourceApplicationID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D383B0], v25);

  objc_msgSend(v3, "messageSummaryInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "has_updatedDateWithServerTime"))
  {
    v27 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "messageSummaryInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithBool:", objc_msgSend(v28, "updatedDateWithServerTime"));
    v29 = (const void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
      goto LABEL_17;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D383D8], v29);
    v26 = (void *)v29;
  }

LABEL_17:
  objc_msgSend(v3, "messageSummaryInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "has_hasBeenRetried"))
  {
    v31 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "messageSummaryInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "numberWithBool:", objc_msgSend(v32, "hasBeenRetried"));
    v33 = (const void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
      goto LABEL_21;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D38378], v33);
    v30 = (void *)v33;
  }

LABEL_21:
  if (-[__CFDictionary count](Mutable, "count"))
    v34 = Mutable;
  else
    v34 = 0;
  v35 = v34;

  return v35;
}

- (id)messageSummaryInfoDictionaryWithBlastDoorBasicMessage:(id)a3
{
  id v3;
  __CFDictionary *Mutable;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFDictionary *v14;
  __CFDictionary *v15;

  v3 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "messageSubType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tapback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageSummaryInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v8, "contentType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D38350], v9);

  objc_msgSend(v3, "messageSubType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tapback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageSummaryInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "summary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D383C0], v13);

  if (-[__CFDictionary count](Mutable, "count"))
    v14 = Mutable;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

+ (id)nicknameDictionaryWithBlastDoorMessage:(id)a3
{
  id v3;
  void *v4;
  void *Mutable;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
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
  id v23;
  void *v24;
  void *v25;

  v3 = a3;
  objc_msgSend(v3, "nicknameInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    objc_msgSend(v3, "truncatedNicknameRecordKey");
    Mutable = (void *)objc_claimAutoreleasedReturnValue();

    if (!Mutable)
      goto LABEL_24;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  objc_msgSend(v3, "nicknameInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameCloudKitRecordKey, v7);

  objc_msgSend(v3, "nicknameInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decryptionKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameCloudKitDecryptionRecordKey, v9);

  objc_msgSend(v3, "truncatedNicknameRecordKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameParticipantTruncatedRIDKey, v10);

  objc_msgSend(v3, "nicknameInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v3, "nicknameInformation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lowResWallpaperTag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameLowResWallpaperTagKey, v14);

    objc_msgSend(v3, "nicknameInformation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wallpaperTag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameWallpaperTagKey, v16);

    objc_msgSend(v3, "nicknameInformation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "wallpaperMetadataTag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameWallpaperMetadataTagKey, v18);

    objc_msgSend(v3, "nicknameInformation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "includesWallpaperData");
    NSStringFromBOOL();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryWallpaperUpdateKey, v20);

    objc_msgSend(v3, "nicknameInformation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "messageType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, CFSTR("MessageType"), v22);

    v23 = objc_alloc(MEMORY[0x1E0CB37E8]);
    objc_msgSend(v3, "nicknameInformation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithLong:", objc_msgSend(v24, "updateInfoIncluded"));

    if (v25)
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameUpdateInfoIncluded, v25);

  }
LABEL_24:

  return Mutable;
}

+ (id)availabilityVerificationRecipientChannelIDPrefixWithBlastDoorMessage:(id)a3
{
  return (id)objc_msgSend(a3, "availabilityVerificationRecipientChannelIDPrefix");
}

+ (id)availabilityVerificationRecipientEncryptionValidationTokenWithBlastDoorTextMessage:(id)a3
{
  return (id)objc_msgSend(a3, "availabilityVerificationRecipientEncryptionValidationToken");
}

+ (id)availabilityOffGridRecipientSubscriptionValidationTokenWithBlastDoorMessage:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "availabilityOffGridRecipientSubscriptionValidationToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)availabilityOffGridRecipientEncryptionValidationTokenWithBlastDoorMessage:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "availabilityOffGridRecipientEncryptionValidationToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)seenAsOffGridWithBlastDoorMessage:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "seenAsOffGrid");
  else
    v4 = 0;

  return v4;
}

+ (id)lastPublisherOfOffGridStatusWithBlastDoorMessage:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "lastPublisherOfOffGridStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)isExpirableWithBlastDoorTextMessage:(id)a3
{
  return objc_msgSend(a3, "isExpirable");
}

+ (BOOL)isAutoReplyWithBlastDoorMessage:(id)a3
{
  return objc_msgSend(a3, "isAutoReply");
}

+ (BOOL)isSOSWithBlastDoorMessage:(id)a3
{
  return objc_msgSend(a3, "isSOS");
}

+ (BOOL)isCriticalWithBlastDoorMessage:(id)a3
{
  return objc_msgSend(a3, "isCritical");
}

+ (id)replicationSourceServiceNameWithBlastDoorMessage:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "has_replicationSourceID"))
  {
    v4 = objc_msgSend(v3, "replicationSourceID");
    +[IMDServiceController sharedController](IMDServiceController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceWithReplicationSourceID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "internalName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 138412546;
        v11 = v7;
        v12 = 2048;
        v13 = v4;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Resolved replication source service to %@ for ID %llu", (uint8_t *)&v10, 0x16u);
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)replicationSourceServiceNameWithBlastDoorBasicMessage:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "has_replicationSourceID"))
  {
    v4 = objc_msgSend(v3, "replicationSourceID");
    +[IMDServiceController sharedController](IMDServiceController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceWithReplicationSourceID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "internalName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 138412546;
        v11 = v7;
        v12 = 2048;
        v13 = v4;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Resolved replication source service to %@ for ID %llu", (uint8_t *)&v10, 0x16u);
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (unint64_t)scheduleTypeWithBlastDoorTextMessage:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  if (objc_msgSend(v3, "scheduleType") == -1)
  {
    if (IMOSLoggingEnabled(-1))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Got message with Unspecified ScheduleType, downgrading to NotScheduled", v7, 2u);
      }

    }
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "scheduleType");
  }

  return v4;
}

+ (id)scheduledDateWithBlastDoorTextMessage:(id)a3
{
  return (id)objc_msgSend(a3, "scheduledDate");
}

+ (id)richBodyWithBlastDoorMessage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "messageSubType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  v6 = 0;
  switch(v5)
  {
    case 1:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "balloonPlugin");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 4:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sticker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 5:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "audioMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v10 = v8;
      objc_msgSend(v8, "content");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 7:
      objc_msgSend(v3, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stickerTapback");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v10 = v9;
      objc_msgSend(v9, "messageContent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "content");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      break;
    default:
      break;
  }

  return v6;
}

+ (id)richBodyWithBlastDoorBasicMessage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "messageSubType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 3)
  {
    objc_msgSend(v3, "messageSubType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 != 1)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "messageSubType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(v7, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

+ (id)convertAttributionInfoToArray:(id)a3
{
  return (id)objc_msgSend(a3, "__imArrayByApplyingBlock:", &unk_1E9228D60);
}

+ (id)attributionInfoArrayWithBlastDoorMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "messageSubType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 4)
  {
    objc_msgSend(v4, "messageSubType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sticker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v4, "messageSubType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sticker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "messageContent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "attributionInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (v6 == 3)
  {
    objc_msgSend(v4, "messageSubType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "balloonPlugin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v6 != 1)
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "messageSubType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = v8;
  objc_msgSend(v8, "attributionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

LABEL_11:
  objc_msgSend(a1, "convertAttributionInfoToArray:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)plainTextBodyWithBlastDoorMessage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "messageSubType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 3)
  {
    objc_msgSend(v3, "messageSubType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "balloonPlugin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 != 1)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "messageSubType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(v7, "plainTextBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

+ (id)plainTextBodyWithBlastDoorBasicMessage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "messageSubType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 1)
  {
    objc_msgSend(v3, "messageSubType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "plainTextBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)plainTextSubjectWithBlastDoorMessage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "messageSubType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 1)
  {
    objc_msgSend(v3, "messageSubType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "plainTextSubject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)plainTextSubjectWithBlastDoorBasicMessage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "messageSubType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 1)
  {
    objc_msgSend(v3, "messageSubType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "plainTextSubject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)fileTransferForBlastDoorFileTransferAttribute:(id)a3 fileTransferGUIDs:(id)a4 supportingStickerAttributes:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  CFMutableDictionaryRef Mutable;
  void *v28;
  void *v29;
  __CFDictionary *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  char v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67;
  _BOOL4 v68;
  void *v69;
  void *v71;
  void *v72;
  id v73;
  _QWORD v74[4];
  __CFDictionary *v75;
  id v76;
  id v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v68 = a5;
  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v73 = a4;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v19 = 0;
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "datasize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "attachmentSubtype");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "livePhoto");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v72, "iris");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v71, "length"))
  {
    if (objc_msgSend(v73, "count"))
    {
      objc_msgSend(v73, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transferForGUID:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "setIsAuxImage:", 1);
        objc_msgSend(MEMORY[0x1E0D39848], "AuxGUIDFromFileTransferGUID:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LOWORD(v67) = 0;
        objc_msgSend(v15, "makeNewIncomingTransferWithGUID:filename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", v14, v16, 0, objc_msgSend(v69, "longLongValue"), 0, 0, v67);

        v17 = v14;
        +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "transferForGUID:", v17);
        v19 = (id)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          if (IMOSLoggingEnabled(objc_msgSend(v19, "setIsAuxVideo:", 1)))
          {
            OSLogHandleForIMFoundationCategory();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v79 = v19;
              _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Successfully created AuxVideo transfer %@", buf, 0xCu);
            }

          }
          goto LABEL_24;
        }
        if (IMOSLoggingEnabled(v20))
        {
          OSLogHandleForIMFoundationCategory();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v79 = v17;
            _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "Was not able to create Aux video transfer for guid %@", buf, 0xCu);
          }

        }
      }
      else
      {
        if (IMOSLoggingEnabled(v13))
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v79 = v10;
            _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Could not find Aux image transfer with guid %@ while parsing message", buf, 0xCu);
          }

        }
      }
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v79 = v7;
        v80 = 2112;
        v81 = v73;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Could not find Aux image transfer with name (%@) because the list of guids was nil or empty: %@", buf, 0x16u);
      }

    }
    v40 = 0;
    v19 = 0;
    goto LABEL_40;
  }
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", v23, 0, objc_msgSend(v69, "longLongValue"), 0, 0, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "transferForGUID:", v17);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
LABEL_24:
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  objc_msgSend(v6, "attachments");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sortedArrayUsingComparator:", &unk_1E9228DA0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = sub_1D1459170;
  v74[3] = &unk_1E9228DC8;
  v30 = Mutable;
  v75 = v30;
  v31 = v7;
  v76 = v31;
  v32 = v6;
  v77 = v32;
  objc_msgSend(v29, "enumerateObjectsUsingBlock:", v74);
  objc_msgSend(v32, "attachmentSubtype");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "audioMessage");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    CFDictionarySetValue(v30, CFSTR("name"), v31);
    objc_msgSend(v32, "utiType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      CFDictionarySetValue(v30, CFSTR("uti-type"), v35);

    objc_msgSend(v34, "inlineAttachmentKey");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
      CFDictionarySetValue(v30, CFSTR("inline-attachment"), v36);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isAudioTranscriptionEnabled");

    if (v38)
    {
      objc_msgSend(v34, "audioTranscription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
        CFDictionarySetValue(v30, CFSTR("audio-transcription"), v39);

    }
  }
  objc_msgSend(v19, "setUserInfo:", v30);

  v40 = 1;
LABEL_40:

  if ((v40 & 1) == 0)
  {
    v57 = 0;
    goto LABEL_56;
  }
LABEL_41:
  objc_msgSend(v6, "attachmentSubtype");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "emojiImage");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(v43, "emojiImageContentIdentifer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "emojiImageShortDescription");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stickerInfoDictionaryFromBlastDoorEmojiImageAttachmentInfo:", v43);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAdaptiveImageGlyphContentIdentifier:", v44);
    objc_msgSend(v19, "setAdaptiveImageGlyphContentDescription:", v45);
    objc_msgSend(v19, "setStickerUserInfo:", v46);

  }
  if (v19 && v68)
  {
    objc_msgSend(v6, "attachmentSubtype");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "sticker");
    v48 = objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(a1, "stickerInfoDictionaryFromBlastDoorStickerAttachmentInfo:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        objc_msgSend(v19, "setStickerUserInfo:", v49);
      }
      else
      {
        IMLogHandleForCategory();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          sub_1D1666448(v58, v59, v60, v61, v62, v63, v64, v65);

      }
    }
  }
  else
  {
    IMLogHandleForCategory();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_1D1666478(v48, v50, v51, v52, v53, v54, v55, v56);
  }

  v19 = v19;
  v57 = v19;
LABEL_56:

  return v57;
}

+ (id)stickerInfoDictionaryWithStickerGUID:(id)a3 stickerPackGUID:(id)a4 stickerHash:(id)a5 positionIntent:(id)a6 associatedPositionIntent:(id)a7 parentPreviewWidth:(id)a8 stickerXOffset:(id)a9 stickerYOffset:(id)a10 stickerScale:(id)a11 stickerRotation:(id)a12 stickerBundleID:(id)a13 stickerIsReaction:(id)a14 stickerPositionVersion:(id)a15 stickerExternalURI:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  __CFDictionary *v30;
  __CFDictionary *v31;
  void *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;

  v21 = a3;
  v35 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v34 = a8;
  v40 = a9;
  v25 = v21;
  v39 = a10;
  v26 = a11;
  v37 = a12;
  v36 = a13;
  v27 = a14;
  v28 = a15;
  v29 = a16;
  v30 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = v30;
  if (v25)
    CFDictionarySetValue(v30, (const void *)*MEMORY[0x1E0D392F8], v25);
  v38 = v26;
  if (v35)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D39310], v35);
  if (v22)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D39300], v22);
  if (v23)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D392C0], v23);
  if (v24)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D392B0], v24);
  if (v34)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D392C8], v34);
  if (v40)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D39328], v40);
  if (v39)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D39330], v39);
  if (v26)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D392D8], v26);
  if (v37)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D392D0], v37);
  if (v36)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D392E0], v36);
  if (v27)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D39308], v27);
  if (v28)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D39318], v28);
  if (v29)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D392F0], v29);
  v32 = (void *)-[__CFDictionary copy](v31, "copy");

  return v32;
}

+ (id)stickerInfoDictionaryFromBlastDoorStickerAttachmentInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = a3;
  objc_msgSend(v4, "stickerIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerPackIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerHash");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "has_positionIntent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "positionIntent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }
  if (objc_msgSend(v4, "has_associatedPositionIntent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "associatedPositionIntent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
  }
  if (objc_msgSend(v4, "has_parentPreviewWidth"))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "parentPreviewWidth");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = 0;
  }
  if (objc_msgSend(v4, "has_stickerOffset"))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "stickerOffset");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
  }
  if (objc_msgSend(v4, "has_stickerOffset"))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "stickerOffset");
    objc_msgSend(v11, "numberWithDouble:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }
  if (objc_msgSend(v4, "has_stickerScale"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "stickerScale");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v4, "has_stickerRotation"))
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "stickerRotation");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = a1;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    a1 = v18;
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v4, "balloonBundleID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v4, "isReaction");
  v22 = objc_msgSend(v4, "stickerPositionVersion");
  objc_msgSend(v4, "stickerExternalURI");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stickerInfoDictionaryWithStickerGUID:stickerPackGUID:stickerHash:positionIntent:associatedPositionIntent:parentPreviewWidth:stickerXOffset:stickerYOffset:stickerScale:stickerRotation:stickerBundleID:stickerIsReaction:stickerPositionVersion:stickerExternalURI:", v36, v35, v34, v32, v31, v30, v33, v29, v16, v20, v27, v24, v25, v23);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)stickerInfoDictionaryFromBlastDoorEmojiImageAttachmentInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "stickerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerPackIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerBalloonBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerExternalURI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "stickerInfoDictionaryWithStickerGUID:stickerPackGUID:stickerHash:positionIntent:associatedPositionIntent:parentPreviewWidth:stickerXOffset:stickerYOffset:stickerScale:stickerRotation:stickerBundleID:stickerIsReaction:stickerPositionVersion:stickerExternalURI:", v5, v6, v7, 0, 0, 0, 0, 0, 0, 0, v8, 0, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_fileTransferMatchingAttribute:(id)a3 inFileTransfers:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
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
  id v24;
  int v25;
  id v26;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = a4;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v30)
  {
    v32 = 0;
    v29 = *(_QWORD *)v40;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(obj);
        v31 = v5;
        v6 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v5);
        objc_msgSend(v34, "attachments");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v33 = v7;
        v8 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v36;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v36 != v10)
                objc_enumerationMutation(v33);
              v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              objc_msgSend(v12, "attachmentURL");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "absoluteString");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v12, "encryptionKey");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v14, "length"))
              {
                objc_msgSend(v6, "userInfo");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("mmcs-url"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v6, "userInfo");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("decryption-key"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v17, "isEqualToString:", v14)
                  && (objc_msgSend(v19, "isEqualToString:", v15) & 1) != 0)
                {
                  v26 = v6;

                  v32 = v26;
                  goto LABEL_25;
                }

              }
              objc_msgSend(v34, "attachmentSubtype");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "emojiImage");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "emojiImageContentIdentifer");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v6, "adaptiveImageGlyphContentIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v22, "length")
                && objc_msgSend(v23, "length")
                && objc_msgSend(v22, "isEqualToString:", v23))
              {
                v24 = v6;

                v25 = 0;
                v32 = v24;
              }
              else
              {
                v25 = 1;
              }

              if (!v25)
                goto LABEL_25;
            }
            v9 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v9)
              continue;
            break;
          }
        }
LABEL_25:

        v5 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v30);
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (id)convertBlastDoorInstanceTypedAttributesToNativeTypesInAttributedString:(id)a3 supportingStickerAttributes:(BOOL)a4 existingFileTransfersForMessage:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  IMTextMessageAttributedStringContent *v16;
  void *v17;
  void *v18;
  IMTextMessageAttributedStringContent *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t, uint64_t);
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;

  v8 = a5;
  if (a3)
  {
    v9 = (void *)objc_msgSend(a3, "mutableCopy");
    v10 = objc_msgSend(v9, "length");
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = sub_1D1459FD8;
    v24 = &unk_1E9228DF0;
    v29 = a1;
    v25 = v8;
    v26 = v11;
    v30 = a4;
    v27 = v12;
    v28 = v9;
    v13 = v9;
    v14 = v12;
    v15 = v11;
    objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, &v21);
    v16 = [IMTextMessageAttributedStringContent alloc];
    v17 = (void *)objc_msgSend(v13, "copy", v21, v22, v23, v24);
    v18 = (void *)objc_msgSend(v14, "copy");
    v19 = -[IMTextMessageAttributedStringContent initWithMessageBodyWithNativeAttributes:fileTransferGuids:](v16, "initWithMessageBodyWithNativeAttributes:fileTransferGuids:", v17, v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)supportsStickerAttributesInMessageBody
{
  return 0;
}

- (id)_createSuperFormattedStringWithAttributedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "__im_attributedStringByAssigningMessagePartNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v3;
  v6 = v4;

  return v6;
}

- (IMTextMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  id v7;
  IMTextMessagePipelineParameter *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  id v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFDictionary *Mutable;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  IMTextMessagePipelineParameter *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[4];
  IMTextMessagePipelineParameter *v81;
  objc_super v82;

  v6 = a3;
  v7 = a4;
  v82.receiver = self;
  v82.super_class = (Class)IMTextMessagePipelineParameter;
  v8 = -[IMTextMessagePipelineParameter init](&v82, sel_init);
  if (!v8)
    goto LABEL_32;
  objc_msgSend(v7, "fromIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setFromIdentifier:](v8, "setFromIdentifier:", v9);

  objc_msgSend(v7, "toIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setToIdentifier:](v8, "setToIdentifier:", v10);

  -[IMTextMessagePipelineParameter setIsFromMe:](v8, "setIsFromMe:", objc_msgSend(v7, "isFromMe"));
  objc_msgSend(v6, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageGUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v11;
  v72 = objc_msgSend(v11, "timestamp");
  +[IMTextMessagePipelineParameter richBodyWithBlastDoorMessage:](IMTextMessagePipelineParameter, "richBodyWithBlastDoorMessage:", v6);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = -[IMTextMessagePipelineParameter supportsStickerAttributesInMessageBody](v8, "supportsStickerAttributesInMessageBody");
  v78 = (void *)v14;
  +[IMTextMessagePipelineParameter convertBlastDoorInstanceTypedAttributesToNativeTypesInAttributedString:supportingStickerAttributes:existingFileTransfersForMessage:](IMTextMessagePipelineParameter, "convertBlastDoorInstanceTypedAttributesToNativeTypesInAttributedString:supportingStickerAttributes:existingFileTransfersForMessage:", v14, v15, MEMORY[0x1E0C9AA60]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "messageBodyWithNativeAttributes");
  v17 = objc_claimAutoreleasedReturnValue();
  v77 = v16;
  objc_msgSend(v16, "fileTransferGuids");
  v18 = objc_claimAutoreleasedReturnValue();
  +[IMTextMessagePipelineParameter plainTextBodyWithBlastDoorMessage:](IMTextMessagePipelineParameter, "plainTextBodyWithBlastDoorMessage:", v6);
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v19)
      v21 = v19;
    else
      v21 = CFSTR(" ");
    v22 = (void *)objc_msgSend(v20, "initWithString:", v21);
    -[IMTextMessagePipelineParameter _createSuperFormattedStringWithAttributedString:](v8, "_createSuperFormattedStringWithAttributedString:", v22);
    v17 = objc_claimAutoreleasedReturnValue();

  }
  +[IMTextMessagePipelineParameter plainTextSubjectWithBlastDoorMessage:](IMTextMessagePipelineParameter, "plainTextSubjectWithBlastDoorMessage:", v6);
  v23 = objc_claimAutoreleasedReturnValue();
  +[IMTextMessagePipelineParameter attributionInfoArrayWithBlastDoorMessage:](IMTextMessagePipelineParameter, "attributionInfoArrayWithBlastDoorMessage:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setAttributionInfoArray:](v8, "setAttributionInfoArray:", v24);

  v74 = (void *)v17;
  -[IMTextMessagePipelineParameter setRichBody:](v8, "setRichBody:", v17);
  -[IMTextMessagePipelineParameter setPlainTextBody:](v8, "setPlainTextBody:", v19);
  v73 = (void *)v23;
  -[IMTextMessagePipelineParameter setPlainTextSubject:](v8, "setPlainTextSubject:", v23);
  v76 = (void *)v18;
  -[IMTextMessagePipelineParameter setFileTransferGUIDs:](v8, "setFileTransferGUIDs:", v18);
  objc_msgSend(v6, "messageSubType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "audioMessage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "inlineAudioMessages");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v13;
  if (objc_msgSend(v27, "count") == 1)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    objc_msgSend(v27, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      CFDictionarySetValue(Mutable, CFSTR("ia-0"), v30);

    -[IMTextMessagePipelineParameter setInlineAttachmentsDictionary:](v8, "setInlineAttachmentsDictionary:", Mutable);
  }
  -[IMTextMessagePipelineParameter setGUID:](v8, "setGUID:", v79);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v72);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setTimestamp:](v8, "setTimestamp:", v31);

  objc_msgSend(v13, "storageContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setIsFromStorage:](v8, "setIsFromStorage:", objc_msgSend(v32, "isFromStorage"));

  objc_msgSend(v13, "storageContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setIsLastFromStorage:](v8, "setIsLastFromStorage:", objc_msgSend(v33, "isLastFromStorage"));

  -[IMTextMessagePipelineParameter setWantsDeliveryReceipt:](v8, "setWantsDeliveryReceipt:", objc_msgSend(v13, "wantsDeliveryReceipt"));
  -[IMTextMessagePipelineParameter setWantsCheckpointing:](v8, "setWantsCheckpointing:", objc_msgSend(v13, "wantsCheckpointing"));
  +[IMTextMessagePipelineParameter participantDestinationIdentifierWithMessage:](IMTextMessagePipelineParameter, "participantDestinationIdentifierWithMessage:", v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setParticipantIdentifiers:](v8, "setParticipantIdentifiers:", v34);

  -[IMTextMessagePipelineParameter messageSummaryInfoDictionaryWithBlastDoorMessage:](v8, "messageSummaryInfoDictionaryWithBlastDoorMessage:", v6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setMessageSummaryInfo:](v8, "setMessageSummaryInfo:", v35);

  +[IMTextMessagePipelineParameter nicknameDictionaryWithBlastDoorMessage:](IMTextMessagePipelineParameter, "nicknameDictionaryWithBlastDoorMessage:", v6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setNicknameDictionary:](v8, "setNicknameDictionary:", v36);

  -[IMTextMessagePipelineParameter setAutoReply:](v8, "setAutoReply:", +[IMTextMessagePipelineParameter isAutoReplyWithBlastDoorMessage:](IMTextMessagePipelineParameter, "isAutoReplyWithBlastDoorMessage:", v6));
  +[IMTextMessagePipelineParameter availabilityVerificationRecipientChannelIDPrefixWithBlastDoorMessage:](IMTextMessagePipelineParameter, "availabilityVerificationRecipientChannelIDPrefixWithBlastDoorMessage:", v6);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setAvailabilityVerificationRecipientChannelIDPrefix:](v8, "setAvailabilityVerificationRecipientChannelIDPrefix:", v37);

  +[IMTextMessagePipelineParameter availabilityVerificationRecipientEncryptionValidationTokenWithBlastDoorTextMessage:](IMTextMessagePipelineParameter, "availabilityVerificationRecipientEncryptionValidationTokenWithBlastDoorTextMessage:", v6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setAvailabilityVerificationRecipientEncryptionValidationToken:](v8, "setAvailabilityVerificationRecipientEncryptionValidationToken:", v38);

  +[IMTextMessagePipelineParameter availabilityOffGridRecipientSubscriptionValidationTokenWithBlastDoorMessage:](IMTextMessagePipelineParameter, "availabilityOffGridRecipientSubscriptionValidationTokenWithBlastDoorMessage:", v6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setAvailabilityOffGridRecipientSubscriptionValidationToken:](v8, "setAvailabilityOffGridRecipientSubscriptionValidationToken:", v39);

  +[IMTextMessagePipelineParameter availabilityOffGridRecipientEncryptionValidationTokenWithBlastDoorMessage:](IMTextMessagePipelineParameter, "availabilityOffGridRecipientEncryptionValidationTokenWithBlastDoorMessage:", v6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setAvailabilityOffGridRecipientEncryptionValidationToken:](v8, "setAvailabilityOffGridRecipientEncryptionValidationToken:", v40);

  -[IMTextMessagePipelineParameter setSeenAsOffGrid:](v8, "setSeenAsOffGrid:", +[IMTextMessagePipelineParameter seenAsOffGridWithBlastDoorMessage:](IMTextMessagePipelineParameter, "seenAsOffGridWithBlastDoorMessage:", v6));
  +[IMTextMessagePipelineParameter lastPublisherOfOffGridStatusWithBlastDoorMessage:](IMTextMessagePipelineParameter, "lastPublisherOfOffGridStatusWithBlastDoorMessage:", v6);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setLastPublisherOfOffGridStatus:](v8, "setLastPublisherOfOffGridStatus:", v41);

  -[IMTextMessagePipelineParameter setExpirable:](v8, "setExpirable:", +[IMTextMessagePipelineParameter isExpirableWithBlastDoorTextMessage:](IMTextMessagePipelineParameter, "isExpirableWithBlastDoorTextMessage:", v6));
  -[IMTextMessagePipelineParameter setSos:](v8, "setSos:", +[IMTextMessagePipelineParameter isSOSWithBlastDoorMessage:](IMTextMessagePipelineParameter, "isSOSWithBlastDoorMessage:", v6));
  -[IMTextMessagePipelineParameter setCritical:](v8, "setCritical:", +[IMTextMessagePipelineParameter isCriticalWithBlastDoorMessage:](IMTextMessagePipelineParameter, "isCriticalWithBlastDoorMessage:", v6));
  +[IMTextMessagePipelineParameter replicationSourceServiceNameWithBlastDoorMessage:](IMTextMessagePipelineParameter, "replicationSourceServiceNameWithBlastDoorMessage:", v6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setReplicationSourceServiceName:](v8, "setReplicationSourceServiceName:", v42);

  -[IMTextMessagePipelineParameter setScheduleType:](v8, "setScheduleType:", +[IMTextMessagePipelineParameter scheduleTypeWithBlastDoorTextMessage:](IMTextMessagePipelineParameter, "scheduleTypeWithBlastDoorTextMessage:", v6));
  +[IMTextMessagePipelineParameter scheduledDateWithBlastDoorTextMessage:](IMTextMessagePipelineParameter, "scheduledDateWithBlastDoorTextMessage:", v6);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setScheduledDate:](v8, "setScheduledDate:", v43);

  objc_msgSend(v6, "threadIdentifierGUID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setThreadIdentifierGUID:](v8, "setThreadIdentifierGUID:", v44);

  objc_msgSend(v6, "threadOriginatorFallbackHash");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setThreadOriginatorFallbackHash:](v8, "setThreadOriginatorFallbackHash:", v45);

  objc_msgSend(v6, "expressiveSendStyleIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setExpressiveSendStyleIdentifier:](v8, "setExpressiveSendStyleIdentifier:", v46);

  if ((objc_msgSend(v6, "has_groupParticipantVersion") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "groupParticipantVersion"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setGroupParticipantVersion:](v8, "setGroupParticipantVersion:", v47);

  }
  else
  {
    -[IMTextMessagePipelineParameter setGroupParticipantVersion:](v8, "setGroupParticipantVersion:", 0);
  }
  if ((objc_msgSend(v6, "has_groupProtocolVersion") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "groupProtocolVersion"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setGroupProtocolVersion:](v8, "setGroupProtocolVersion:", v48);

  }
  else
  {
    -[IMTextMessagePipelineParameter setGroupProtocolVersion:](v8, "setGroupProtocolVersion:", 0);
  }
  v75 = v7;
  v49 = v27;
  if ((objc_msgSend(v6, "has_groupPhotoCreationTime") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "groupPhotoCreationTime"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setGroupPhotoCreationTime:](v8, "setGroupPhotoCreationTime:", v50);

  }
  else
  {
    -[IMTextMessagePipelineParameter setGroupPhotoCreationTime:](v8, "setGroupPhotoCreationTime:", 0);
  }
  objc_msgSend(v6, "replicatedFallbackGUIDs");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter setReplicatedFallbackGUIDs:](v8, "setReplicatedFallbackGUIDs:", v51);

  -[IMTextMessagePipelineParameter participantIdentifiers](v8, "participantIdentifiers");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = sub_1D145B838;
  v80[3] = &unk_1E9227D78;
  v53 = v8;
  v81 = v53;
  objc_msgSend(v52, "__imArrayByFilteringWithBlock:", v80);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "_IDsFromURIs");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMTextMessagePipelineParameter fromIdentifier](v53, "fromIdentifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "_stripFZIDPrefix");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMTextMessagePipelineParameter participantIdentifiers](v53, "participantIdentifiers");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "count");

  if (v59 <= 2)
  {
    if (!-[IMTextMessagePipelineParameter isFromMe](v53, "isFromMe") || !objc_msgSend(v55, "count"))
      goto LABEL_26;
    objc_msgSend(v55, "lastObject");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "_stripFZIDPrefix");
    v62 = objc_claimAutoreleasedReturnValue();

    v57 = (void *)v62;
  }
  else
  {
    objc_msgSend(v6, "groupID");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setGroupID:](v53, "setGroupID:", v60);

    objc_msgSend(v6, "currentGroupName");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setCurrentGroupName:](v53, "setCurrentGroupName:", v61);
  }

LABEL_26:
  if (objc_msgSend(v57, "length"))
  {
    -[IMTextMessagePipelineParameter setFromDisplayID:](v53, "setFromDisplayID:", v57);
  }
  else
  {
    IMLogHandleForCategory();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      sub_1D16664A8(v63, v64, v65, v66, v67, v68, v69, v70);

  }
  v7 = v75;
LABEL_32:

  return v8;
}

- (IMTextMessagePipelineParameter)initWithBDBasic:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  id v7;
  IMTextMessagePipelineParameter *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFDictionary *Mutable;
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
  IMTextMessagePipelineParameter *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  IMTextMessagePipelineParameter *v62;
  objc_super v63;

  v6 = a3;
  v7 = a4;
  v63.receiver = self;
  v63.super_class = (Class)IMTextMessagePipelineParameter;
  v8 = -[IMTextMessagePipelineParameter init](&v63, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "fromIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setFromIdentifier:](v8, "setFromIdentifier:", v9);

    objc_msgSend(v7, "toIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setToIdentifier:](v8, "setToIdentifier:", v10);

    -[IMTextMessagePipelineParameter setIsFromMe:](v8, "setIsFromMe:", objc_msgSend(v7, "isFromMe"));
    objc_msgSend(v6, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageGUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = objc_claimAutoreleasedReturnValue();

    v55 = objc_msgSend(v11, "timestamp");
    +[IMTextMessagePipelineParameter richBodyWithBlastDoorBasicMessage:](IMTextMessagePipelineParameter, "richBodyWithBlastDoorBasicMessage:", v6);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMTextMessagePipelineParameter convertBlastDoorInstanceTypedAttributesToNativeTypesInAttributedString:supportingStickerAttributes:existingFileTransfersForMessage:](IMTextMessagePipelineParameter, "convertBlastDoorInstanceTypedAttributesToNativeTypesInAttributedString:supportingStickerAttributes:existingFileTransfersForMessage:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messageBodyWithNativeAttributes");
    v15 = objc_claimAutoreleasedReturnValue();
    v53 = v14;
    v16 = v14;
    v17 = (void *)v15;
    objc_msgSend(v16, "fileTransferGuids");
    v18 = objc_claimAutoreleasedReturnValue();
    +[IMTextMessagePipelineParameter plainTextBodyWithBlastDoorBasicMessage:](IMTextMessagePipelineParameter, "plainTextBodyWithBlastDoorBasicMessage:", v6);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v20 = objc_alloc(MEMORY[0x1E0CB3498]);
      if (v19)
        v21 = (const __CFString *)v19;
      else
        v21 = CFSTR(" ");
      v22 = (void *)objc_msgSend(v20, "initWithString:", v21);
      -[IMTextMessagePipelineParameter _createSuperFormattedStringWithAttributedString:](v8, "_createSuperFormattedStringWithAttributedString:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v23;
    }
    +[IMTextMessagePipelineParameter plainTextSubjectWithBlastDoorBasicMessage:](IMTextMessagePipelineParameter, "plainTextSubjectWithBlastDoorBasicMessage:", v6);
    v24 = objc_claimAutoreleasedReturnValue();
    v57 = v17;
    -[IMTextMessagePipelineParameter setRichBody:](v8, "setRichBody:", v17);
    v58 = (void *)v19;
    -[IMTextMessagePipelineParameter setPlainTextBody:](v8, "setPlainTextBody:", v19);
    -[IMTextMessagePipelineParameter setPlainTextSubject:](v8, "setPlainTextSubject:", v24);
    v59 = (void *)v18;
    -[IMTextMessagePipelineParameter setFileTransferGUIDs:](v8, "setFileTransferGUIDs:", v18);
    objc_msgSend(v6, "threadIdentifierGUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setThreadIdentifierGUID:](v8, "setThreadIdentifierGUID:", v25);

    objc_msgSend(v6, "threadOriginatorFallbackHash");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setThreadOriginatorFallbackHash:](v8, "setThreadOriginatorFallbackHash:", v26);

    objc_msgSend(v6, "messageSubType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "audioMessage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "inlineAudioMessages");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = v29;
    if (objc_msgSend(v29, "count") == 1)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      objc_msgSend(v29, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
        CFDictionarySetValue(Mutable, CFSTR("ia-0"), v31);

      -[IMTextMessagePipelineParameter setInlineAttachmentsDictionary:](v8, "setInlineAttachmentsDictionary:", Mutable);
    }
    -[IMTextMessagePipelineParameter setGUID:](v8, "setGUID:", v13);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v55);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setTimestamp:](v8, "setTimestamp:", v32);

    objc_msgSend(v11, "storageContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setIsFromStorage:](v8, "setIsFromStorage:", objc_msgSend(v33, "isFromStorage"));

    objc_msgSend(v11, "storageContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setIsLastFromStorage:](v8, "setIsLastFromStorage:", objc_msgSend(v34, "isLastFromStorage"));

    -[IMTextMessagePipelineParameter setWantsDeliveryReceipt:](v8, "setWantsDeliveryReceipt:", objc_msgSend(v11, "wantsDeliveryReceipt"));
    -[IMTextMessagePipelineParameter setWantsCheckpointing:](v8, "setWantsCheckpointing:", objc_msgSend(v11, "wantsCheckpointing"));
    +[IMTextMessagePipelineParameter participantDestinationIdentifierWithBasicMessage:](IMTextMessagePipelineParameter, "participantDestinationIdentifierWithBasicMessage:", v6);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setParticipantIdentifiers:](v8, "setParticipantIdentifiers:", v35);

    -[IMTextMessagePipelineParameter messageSummaryInfoDictionaryWithBlastDoorBasicMessage:](v8, "messageSummaryInfoDictionaryWithBlastDoorBasicMessage:", v6);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setMessageSummaryInfo:](v8, "setMessageSummaryInfo:", v36);

    +[IMTextMessagePipelineParameter replicationSourceServiceNameWithBlastDoorBasicMessage:](IMTextMessagePipelineParameter, "replicationSourceServiceNameWithBlastDoorBasicMessage:", v6);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setReplicationSourceServiceName:](v8, "setReplicationSourceServiceName:", v37);

    if ((objc_msgSend(v6, "has_groupParticipantVersion") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "groupParticipantVersion"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMTextMessagePipelineParameter setGroupParticipantVersion:](v8, "setGroupParticipantVersion:", v38);

    }
    else
    {
      -[IMTextMessagePipelineParameter setGroupParticipantVersion:](v8, "setGroupParticipantVersion:", 0);
    }
    v56 = (void *)v24;
    v39 = (void *)v13;
    if ((objc_msgSend(v6, "has_groupProtocolVersion") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "groupProtocolVersion"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMTextMessagePipelineParameter setGroupProtocolVersion:](v8, "setGroupProtocolVersion:", v40);

    }
    else
    {
      -[IMTextMessagePipelineParameter setGroupProtocolVersion:](v8, "setGroupProtocolVersion:", 0);
    }
    -[IMTextMessagePipelineParameter participantIdentifiers](v8, "participantIdentifiers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = sub_1D145BEC4;
    v61[3] = &unk_1E9227D78;
    v42 = v8;
    v62 = v42;
    objc_msgSend(v41, "__imArrayByFilteringWithBlock:", v61);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_IDsFromURIs");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMTextMessagePipelineParameter fromIdentifier](v42, "fromIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_stripFZIDPrefix");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMTextMessagePipelineParameter participantIdentifiers](v42, "participantIdentifiers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");

    if (v48 <= 2)
    {
      if (!-[IMTextMessagePipelineParameter isFromMe](v42, "isFromMe") || !objc_msgSend(v44, "count"))
        goto LABEL_23;
      objc_msgSend(v44, "lastObject");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "_stripFZIDPrefix");
      v51 = objc_claimAutoreleasedReturnValue();

      v46 = (void *)v51;
    }
    else
    {
      objc_msgSend(v6, "groupID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMTextMessagePipelineParameter setGroupID:](v42, "setGroupID:", v49);

      objc_msgSend(v6, "currentGroupName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMTextMessagePipelineParameter setCurrentGroupName:](v42, "setCurrentGroupName:", v50);
    }

LABEL_23:
    -[IMTextMessagePipelineParameter setFromDisplayID:](v42, "setFromDisplayID:", v46);

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMTextMessagePipelineParameter GUID](self, "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMTextMessagePipelineParameter isFromStorage](self, "isFromStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMTextMessagePipelineParameter isLastFromStorage](self, "isLastFromStorage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMTextMessagePipelineParameter isFromMe](self, "isFromMe"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter messageItems](self, "messageItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = -[IMTextMessagePipelineParameter hadChat](self, "hadChat");
  v12 = CFSTR("NO");
  if (v11)
    v12 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMMessagePipelineParameter %p> { guid: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, isFromMe: %@, output messageItems: %lu, hadChat: %@}"), self, v4, v5, v6, v7, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (BOOL)wantsDeliveryReceipt
{
  return self->_wantsDeliveryReceipt;
}

- (void)setWantsDeliveryReceipt:(BOOL)a3
{
  self->_wantsDeliveryReceipt = a3;
}

- (BOOL)wantsCheckpointing
{
  return self->_wantsCheckpointing;
}

- (void)setWantsCheckpointing:(BOOL)a3
{
  self->_wantsCheckpointing = a3;
}

- (BOOL)isFromStorage
{
  return self->_isFromStorage;
}

- (void)setIsFromStorage:(BOOL)a3
{
  self->_isFromStorage = a3;
}

- (BOOL)isLastFromStorage
{
  return self->_isLastFromStorage;
}

- (void)setIsLastFromStorage:(BOOL)a3
{
  self->_isLastFromStorage = a3;
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (NSString)plainTextBody
{
  return self->_plainTextBody;
}

- (void)setPlainTextBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)plainTextSubject
{
  return self->_plainTextSubject;
}

- (void)setPlainTextSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSAttributedString)richBody
{
  return self->_richBody;
}

- (void)setRichBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)fileTransferGUIDs
{
  return self->_fileTransferGUIDs;
}

- (void)setFileTransferGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_fileTransferGUIDs, a3);
}

- (NSArray)participantIdentifiers
{
  return self->_participantIdentifiers;
}

- (void)setParticipantIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_participantIdentifiers, a3);
}

- (NSString)fromDisplayID
{
  return self->_fromDisplayID;
}

- (void)setFromDisplayID:(id)a3
{
  objc_storeStrong((id *)&self->_fromDisplayID, a3);
}

- (NSString)replyToGUID
{
  return self->_replyToGUID;
}

- (void)setReplyToGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)threadIdentifierGUID
{
  return self->_threadIdentifierGUID;
}

- (void)setThreadIdentifierGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)threadOriginatorFallbackHash
{
  return self->_threadOriginatorFallbackHash;
}

- (void)setThreadOriginatorFallbackHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)expressiveSendStyleIdentifier
{
  return self->_expressiveSendStyleIdentifier;
}

- (void)setExpressiveSendStyleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDictionary)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (void)setMessageSummaryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_messageSummaryInfo, a3);
}

- (NSDictionary)inlineAttachmentsDictionary
{
  return self->_inlineAttachmentsDictionary;
}

- (void)setInlineAttachmentsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_inlineAttachmentsDictionary, a3);
}

- (NSArray)attributionInfoArray
{
  return self->_attributionInfoArray;
}

- (void)setAttributionInfoArray:(id)a3
{
  objc_storeStrong((id *)&self->_attributionInfoArray, a3);
}

- (NSDictionary)nicknameDictionary
{
  return self->_nicknameDictionary;
}

- (void)setNicknameDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameDictionary, a3);
}

- (BOOL)isFromTrustedSnapSender
{
  return self->_fromTrustedSnapSender;
}

- (void)setFromTrustedSnapSender:(BOOL *)a3
{
  self->_fromTrustedSnapSender = a3;
}

- (NSString)availabilityVerificationRecipientChannelIDPrefix
{
  return self->_availabilityVerificationRecipientChannelIDPrefix;
}

- (void)setAvailabilityVerificationRecipientChannelIDPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityVerificationRecipientChannelIDPrefix, a3);
}

- (NSString)availabilityVerificationRecipientEncryptionValidationToken
{
  return self->_availabilityVerificationRecipientEncryptionValidationToken;
}

- (void)setAvailabilityVerificationRecipientEncryptionValidationToken:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityVerificationRecipientEncryptionValidationToken, a3);
}

- (NSString)availabilityOffGridRecipientSubscriptionValidationToken
{
  return self->_availabilityOffGridRecipientSubscriptionValidationToken;
}

- (void)setAvailabilityOffGridRecipientSubscriptionValidationToken:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityOffGridRecipientSubscriptionValidationToken, a3);
}

- (NSString)availabilityOffGridRecipientEncryptionValidationToken
{
  return self->_availabilityOffGridRecipientEncryptionValidationToken;
}

- (void)setAvailabilityOffGridRecipientEncryptionValidationToken:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityOffGridRecipientEncryptionValidationToken, a3);
}

- (BOOL)seenAsOffGrid
{
  return self->_seenAsOffGrid;
}

- (void)setSeenAsOffGrid:(BOOL)a3
{
  self->_seenAsOffGrid = a3;
}

- (NSString)lastPublisherOfOffGridStatus
{
  return self->_lastPublisherOfOffGridStatus;
}

- (void)setLastPublisherOfOffGridStatus:(id)a3
{
  objc_storeStrong((id *)&self->_lastPublisherOfOffGridStatus, a3);
}

- (BOOL)isExpirable
{
  return self->_expirable;
}

- (void)setExpirable:(BOOL)a3
{
  self->_expirable = a3;
}

- (BOOL)isAutoReply
{
  return self->_autoReply;
}

- (void)setAutoReply:(BOOL)a3
{
  self->_autoReply = a3;
}

- (BOOL)isSOS
{
  return self->_sos;
}

- (void)setSos:(BOOL)a3
{
  self->_sos = a3;
}

- (BOOL)isCritical
{
  return self->_critical;
}

- (void)setCritical:(BOOL)a3
{
  self->_critical = a3;
}

- (unint64_t)scheduleType
{
  return self->_scheduleType;
}

- (void)setScheduleType:(unint64_t)a3
{
  self->_scheduleType = a3;
}

- (unint64_t)scheduleState
{
  return self->_scheduleState;
}

- (void)setScheduleState:(unint64_t)a3
{
  self->_scheduleState = a3;
}

- (NSDate)scheduledDate
{
  return self->_scheduledDate;
}

- (void)setScheduledDate:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledDate, a3);
}

- (NSString)replicationSourceServiceName
{
  return self->_replicationSourceServiceName;
}

- (void)setReplicationSourceServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (IMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (IMDServiceSession)serviceSession
{
  return self->_serviceSession;
}

- (void)setServiceSession:(id)a3
{
  objc_storeStrong((id *)&self->_serviceSession, a3);
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)currentGroupName
{
  return self->_currentGroupName;
}

- (void)setCurrentGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSNumber)groupParticipantVersion
{
  return self->_groupParticipantVersion;
}

- (void)setGroupParticipantVersion:(id)a3
{
  objc_storeStrong((id *)&self->_groupParticipantVersion, a3);
}

- (NSNumber)groupProtocolVersion
{
  return self->_groupProtocolVersion;
}

- (void)setGroupProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_groupProtocolVersion, a3);
}

- (NSNumber)groupPhotoCreationTime
{
  return self->_groupPhotoCreationTime;
}

- (void)setGroupPhotoCreationTime:(id)a3
{
  objc_storeStrong((id *)&self->_groupPhotoCreationTime, a3);
}

- (NSArray)replicatedFallbackGUIDs
{
  return self->_replicatedFallbackGUIDs;
}

- (void)setReplicatedFallbackGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_replicatedFallbackGUIDs, a3);
}

- (BOOL)wasDetonated
{
  return self->_wasDetonated;
}

- (void)setWasDetonated:(BOOL)a3
{
  self->_wasDetonated = a3;
}

- (NSString)associatedMessageGUID
{
  return self->_associatedMessageGUID;
}

- (void)setAssociatedMessageGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSArray)messageItems
{
  return self->_messageItems;
}

- (void)setMessageItems:(id)a3
{
  objc_storeStrong((id *)&self->_messageItems, a3);
}

- (IMDChat)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
  objc_storeStrong((id *)&self->_chat, a3);
}

- (BOOL)hadChat
{
  return self->_hadChat;
}

- (void)setHadChat:(BOOL)a3
{
  self->_hadChat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_messageItems, 0);
  objc_storeStrong((id *)&self->_associatedMessageGUID, 0);
  objc_storeStrong((id *)&self->_replicatedFallbackGUIDs, 0);
  objc_storeStrong((id *)&self->_groupPhotoCreationTime, 0);
  objc_storeStrong((id *)&self->_groupProtocolVersion, 0);
  objc_storeStrong((id *)&self->_groupParticipantVersion, 0);
  objc_storeStrong((id *)&self->_currentGroupName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_replicationSourceServiceName, 0);
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_lastPublisherOfOffGridStatus, 0);
  objc_storeStrong((id *)&self->_availabilityOffGridRecipientEncryptionValidationToken, 0);
  objc_storeStrong((id *)&self->_availabilityOffGridRecipientSubscriptionValidationToken, 0);
  objc_storeStrong((id *)&self->_availabilityVerificationRecipientEncryptionValidationToken, 0);
  objc_storeStrong((id *)&self->_availabilityVerificationRecipientChannelIDPrefix, 0);
  objc_storeStrong((id *)&self->_nicknameDictionary, 0);
  objc_storeStrong((id *)&self->_attributionInfoArray, 0);
  objc_storeStrong((id *)&self->_inlineAttachmentsDictionary, 0);
  objc_storeStrong((id *)&self->_messageSummaryInfo, 0);
  objc_storeStrong((id *)&self->_expressiveSendStyleIdentifier, 0);
  objc_storeStrong((id *)&self->_threadOriginatorFallbackHash, 0);
  objc_storeStrong((id *)&self->_threadIdentifierGUID, 0);
  objc_storeStrong((id *)&self->_replyToGUID, 0);
  objc_storeStrong((id *)&self->_fromDisplayID, 0);
  objc_storeStrong((id *)&self->_participantIdentifiers, 0);
  objc_storeStrong((id *)&self->_fileTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_richBody, 0);
  objc_storeStrong((id *)&self->_plainTextSubject, 0);
  objc_storeStrong((id *)&self->_plainTextBody, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

@end
