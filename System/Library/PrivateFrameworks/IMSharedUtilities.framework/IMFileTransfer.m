@implementation IMFileTransfer

- (void)_clear
{

  self->_utiType = 0;
  self->_mimeType = 0;

  self->_messageGUID = 0;
  self->_guid = 0;

  self->_startDate = 0;
  self->_createdDate = 0;

  self->_filename = 0;
  self->_transferDataURL = 0;

  self->_localURL = 0;
  self->_temporaryHighQualityLocalURL = 0;

  self->_otherPerson = 0;
  self->_accountID = 0;

  self->_errorDescription = 0;
  self->_localUserInfo = 0;

  self->_attachmentSendContexts = 0;
  self->_transferredFilename = 0;

  self->_transcoderUserInfo = 0;
  self->_AuxTranscoderUserInfo = 0;
  self->_isSticker = 0;

  self->_adaptiveImageGlyphContentIdentifier = 0;
  self->_adaptiveImageGlyphContentDescription = 0;
  self->_isScreenshot = 0;

  self->_stickerUserInfo = 0;
  self->_attributionInfo = 0;
  *(_WORD *)&self->_hideAttachment = 0;
  self->_isContact = 0;
  self->_updateReason = 0;

  self->_commSafetySensitive = 0;
}

- (id)_dictionaryRepresentation
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSString *guid;
  NSString *messageGUID;
  const void *v7;
  const void *v8;
  NSString *filename;
  NSString *mimeType;
  NSString *utiType;
  NSString *transferredFilename;
  const void *v13;
  const void *v14;
  const void *v15;
  NSDictionary *localUserInfo;
  NSDictionary *transcoderUserInfo;
  NSDictionary *stickerUserInfo;
  NSDictionary *attributionInfo;
  NSDictionary *AuxTranscoderUserInfo;
  NSString *otherPerson;
  NSString *accountID;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  const void *v28;
  NSString *audioTranscriptionText;
  NSString *adaptiveImageGlyphContentIdentifier;
  NSString *adaptiveImageGlyphContentDescription;
  const void *v32;
  const void *v33;
  const void *v34;
  const void *v35;
  const void *v36;
  const void *v37;
  const void *v38;
  const void *v39;
  const void *v40;
  NSString *errorDescription;
  NSDate *startDate;
  const void *v43;
  NSDate *createdDate;
  const void *v45;
  NSURL *transferDataURL;
  NSString *v47;
  NSURL *localURL;
  NSString *v49;
  NSURL *temporaryHighQualityLocalURL;
  NSString *v51;
  NSString *sandboxToken;
  const void *v53;

  -[IMFileTransfer _calculateTypeInformation](self, "_calculateTypeInformation");
  v3 = (__CFDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = v3;
  guid = self->_guid;
  if (guid)
    CFDictionarySetValue(v3, CFSTR("IMFileTransferGUID"), guid);
  messageGUID = self->_messageGUID;
  if (messageGUID)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferMessageGUID"), messageGUID);
  if (self->_transferState)
  {
    v7 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    if (v7)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferStateKey"), v7);
  }
  if (self->_isIncoming)
  {
    v8 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    if (v8)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferIsIncomingKey"), v8);
  }
  filename = self->_filename;
  if (filename)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferFilenameKey"), filename);
  mimeType = self->_mimeType;
  if (mimeType)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferMIMETypeKey"), mimeType);
  utiType = self->_utiType;
  if (utiType)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferUTITypeKey"), utiType);
  transferredFilename = self->_transferredFilename;
  if (transferredFilename)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferTransferredFilenameKey"), transferredFilename);
  if (self->_hfsCreator)
  {
    v13 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    if (v13)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferHFSCreatorKey"), v13);
  }
  if (self->_hfsType)
  {
    v14 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    if (v14)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferHFSTypeKey"), v14);
  }
  if (self->_hfsFlags)
  {
    v15 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    if (v15)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferHFSFlagsKey"), v15);
  }
  localUserInfo = self->_localUserInfo;
  if (localUserInfo)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferLocalUserInfoKey"), localUserInfo);
  transcoderUserInfo = self->_transcoderUserInfo;
  if (transcoderUserInfo)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferTranscoderUserInfoKey"), transcoderUserInfo);
  stickerUserInfo = self->_stickerUserInfo;
  if (stickerUserInfo)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferStickerUserInfoKey"), stickerUserInfo);
  attributionInfo = self->_attributionInfo;
  if (attributionInfo)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferAttributionInfoKey"), attributionInfo);
  AuxTranscoderUserInfo = self->_AuxTranscoderUserInfo;
  if (AuxTranscoderUserInfo)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferAuxTranscoderUserInfoKey"), AuxTranscoderUserInfo);
  otherPerson = self->_otherPerson;
  if (otherPerson)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferOtherPersonKey"), otherPerson);
  accountID = self->_accountID;
  if (accountID)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferAccountKey"), accountID);
  v23 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_currentBytes);
  if (v23)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferCurrentBytesKey"), v23);
  v24 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_totalBytes);
  if (v24)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferTotalBytesKey"), v24);
  v25 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_averageTransferRate);
  if (v25)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferAverageRateKey"), v25);
  v26 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_auxStateWasDowngraded);
  if (v26)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferAuxStateWasDowngradedKey"), v26);
  v27 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAuxVideo);
  if (v27)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferIsAuxVideoKey"), v27);
  v28 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isScreenshot);
  if (v28)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferIsScreenshotKey"), v28);
  audioTranscriptionText = self->_audioTranscriptionText;
  if (audioTranscriptionText)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferAudioTranscriptionTextKey"), audioTranscriptionText);
  adaptiveImageGlyphContentIdentifier = self->_adaptiveImageGlyphContentIdentifier;
  if (adaptiveImageGlyphContentIdentifier)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferAdaptiveImageGlyphContentIdentifierKey"), adaptiveImageGlyphContentIdentifier);
  adaptiveImageGlyphContentDescription = self->_adaptiveImageGlyphContentDescription;
  if (adaptiveImageGlyphContentDescription)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferAdaptiveImageGlyphContentDescriptionKey"), adaptiveImageGlyphContentDescription);
  v32 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAuxImage);
  if (v32)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferIsAuxImageKey"), v32);
  v33 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSticker);
  if (v33)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferIsStickerKey"), v33);
  v34 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hideAttachment);
  if (v34)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferHideAttachmentKey"), v34);
  v35 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cloudKitSyncState != 0);
  if (v35)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferCloudKitSyncStateKey"), v35);
  v36 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_commSafetySensitive);
  if (v36)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferIsCommSafetySensitiveKey"), v36);
  if (self->_isDirectory)
  {
    v37 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    if (v37)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferIsDirectoryKey"), v37);
  }
  if (self->_shouldAttemptToResume)
  {
    v38 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    if (v38)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferShouldAttemptToResumeKey"), v38);
  }
  if (self->_shouldForceArchive)
  {
    v39 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    if (v39)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferShouldForceArchive"), v39);
  }
  if (self->_error)
  {
    v40 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    if (v40)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferErrorReasonKey"), v40);
  }
  errorDescription = self->_errorDescription;
  if (errorDescription)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferErrorDescriptionKey"), errorDescription);
  startDate = self->_startDate;
  if (startDate)
  {
    -[NSDate timeIntervalSince1970](startDate, "timeIntervalSince1970");
    v43 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    if (v43)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferStartDate"), v43);
  }
  createdDate = self->_createdDate;
  if (createdDate)
  {
    -[NSDate timeIntervalSince1970](createdDate, "timeIntervalSince1970");
    v45 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    if (v45)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferCreatedDate"), v45);
  }
  transferDataURL = self->_transferDataURL;
  if (transferDataURL)
  {
    v47 = -[NSURL absoluteString](transferDataURL, "absoluteString");
    if (v47)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferTransferDataURLKey"), v47);
  }
  localURL = self->_localURL;
  if (localURL)
  {
    v49 = -[NSURL absoluteString](localURL, "absoluteString");
    if (v49)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferLocalURLKey"), v49);
  }
  temporaryHighQualityLocalURL = self->_temporaryHighQualityLocalURL;
  if (temporaryHighQualityLocalURL)
  {
    v51 = -[NSURL absoluteString](temporaryHighQualityLocalURL, "absoluteString");
    if (v51)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferTemporaryHighQualityLocalURLKey"), v51);
  }
  sandboxToken = self->_sandboxToken;
  if (sandboxToken)
    CFDictionarySetValue(v4, CFSTR("sIMFileTransferSandboxTokenKey"), sandboxToken);
  v53 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_updateReason);
  if (v53)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferUpdateReasonKey"), v53);
  return v4;
}

- (BOOL)_updateWithDictionaryRepresentation:(id)a3
{
  id v5;
  NSURL *v6;
  NSURL *v7;
  NSObject *v8;
  NSURL *v9;
  NSURL *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  NSDate *v15;
  void *v16;
  NSDate *v17;
  void *v18;
  uint64_t v19;
  NSURL *v20;
  uint64_t v21;
  NSURL *v22;
  NSObject *v23;
  uint64_t v24;
  NSURL *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  char v29;
  char v30;
  char v31;
  int v33;
  NSURL *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (self->_guid)
    v5 = -[IMFileTransfer _dictionaryRepresentation](self, "_dictionaryRepresentation");
  else
    v5 = 0;
  -[IMFileTransfer _clear](self, "_clear");
  v6 = (NSURL *)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferGUID"));
  v7 = v6;
  if (v6
    && (-[NSURL isEqualToString:](v6, "isEqualToString:", -[NSURL im_lastPathComponent](v6, "im_lastPathComponent")) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v33 = 138412546;
        v34 = v7;
        v35 = 2112;
        v36 = -[NSURL im_lastPathComponent](v7, "im_lastPathComponent");
        _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "tried to update IMFileTransfer with guid that has path specifiers %@. using stripped guid instead %@", (uint8_t *)&v33, 0x16u);
      }
    }
    v7 = -[NSURL im_lastPathComponent](v7, "im_lastPathComponent");
  }
  self->_guid = (NSString *)v7;
  v9 = (NSURL *)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferMessageGUID"));
  v10 = v9;
  if (v9
    && (-[NSURL isEqualToString:](v9, "isEqualToString:", -[NSURL im_lastPathComponent](v9, "im_lastPathComponent")) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = -[NSURL im_lastPathComponent](v10, "im_lastPathComponent");
        v33 = 138412546;
        v34 = v10;
        v35 = 2112;
        v36 = v12;
        _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "tried to update IMFileTransfer with messageGuid that has path specifiers %@. using stripped message guid instead %@", (uint8_t *)&v33, 0x16u);
      }
    }
    v10 = -[NSURL im_lastPathComponent](v10, "im_lastPathComponent");
  }
  self->_messageGUID = (NSString *)v10;
  self->_transferState = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferStateKey")), "integerValue");
  self->_isIncoming = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferIsIncomingKey")), "BOOLValue");
  self->_filename = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferFilenameKey")), "im_lastPathComponent");
  self->_transferredFilename = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferTransferredFilenameKey")), "im_lastPathComponent");
  self->_mimeType = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferMIMETypeKey"));
  self->_utiType = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferUTITypeKey"));
  self->_hfsCreator = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferHFSCreatorKey")), "integerValue");
  self->_hfsType = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferHFSTypeKey")), "integerValue");
  self->_hfsFlags = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferHFSFlagsKey")), "integerValue");
  self->_otherPerson = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferOtherPersonKey"));
  self->_accountID = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferAccountKey"));
  self->_currentBytes = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferCurrentBytesKey")), "unsignedLongLongValue");
  self->_totalBytes = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferTotalBytesKey")), "unsignedLongLongValue");
  self->_averageTransferRate = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferAverageRateKey")), "unsignedLongLongValue");
  self->_isDirectory = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferIsDirectoryKey")), "BOOLValue");
  self->_shouldAttemptToResume = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferShouldAttemptToResumeKey")), "BOOLValue");
  self->_shouldForceArchive = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferShouldForceArchive")), "BOOLValue");
  v13 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferErrorReasonKey"));
  if (v13)
  {
    v14 = (int)objc_msgSend(v13, "intValue");
  }
  else
  {
    v14 = 15;
    if (self->_transferState != 6)
      v14 = -1;
  }
  self->_error = v14;
  self->_errorDescription = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferErrorDescriptionKey"));
  self->_localUserInfo = (NSDictionary *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferLocalUserInfoKey"));
  self->_transcoderUserInfo = (NSDictionary *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferTranscoderUserInfoKey"));
  self->_stickerUserInfo = (NSDictionary *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferStickerUserInfoKey"));
  self->_attributionInfo = (NSDictionary *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferAttributionInfoKey"));
  self->_AuxTranscoderUserInfo = (NSDictionary *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferAuxTranscoderUserInfoKey"));
  if (self->_error == -2)
    self->_error = 18;
  v15 = (NSDate *)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferStartDate"));
  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0C99D68];
    -[NSDate doubleValue](v15, "doubleValue");
    v15 = (NSDate *)(id)objc_msgSend(v16, "dateWithTimeIntervalSince1970:");
  }
  self->_startDate = v15;
  v17 = (NSDate *)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferCreatedDate"));
  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0C99D68];
    -[NSDate doubleValue](v17, "doubleValue");
    v17 = (NSDate *)(id)objc_msgSend(v18, "dateWithTimeIntervalSince1970:");
  }
  self->_createdDate = v17;
  v19 = objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferTransferDataURLKey"));
  if (v19)
    v20 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v19);
  else
    v20 = 0;
  self->_transferDataURL = v20;
  v21 = objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferLocalURLKey"));
  if (v21)
  {
    v22 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v21);
    if (-[NSURL isFileURL](v22, "isFileURL"))
    {
      self->_localURL = v22;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v33 = 138412290;
          v34 = v22;
          _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "tried to update IMFileTransfer with non-local URL: %@", (uint8_t *)&v33, 0xCu);
        }
      }

      self->_localURL = 0;
    }
  }
  else
  {

    self->_localURL = 0;
  }
  v24 = objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferTemporaryHighQualityLocalURLKey"));
  if (v24)
  {
    v25 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v24);
    if (-[NSURL isFileURL](v25, "isFileURL"))
    {
      self->_temporaryHighQualityLocalURL = v25;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v33 = 138412290;
          v34 = v25;
          _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_INFO, "tried to update IMFileTransfer with non-file transfer temporaryHighQualityLocalURL: %@", (uint8_t *)&v33, 0xCu);
        }
      }

      self->_temporaryHighQualityLocalURL = 0;
    }
  }
  else
  {

    self->_temporaryHighQualityLocalURL = 0;
  }
  if (!self->_localURL)
  {
    v27 = objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferLocalPathKey"));
    if (v27)
      -[IMFileTransfer _setLocalPath:](self, "_setLocalPath:", v27);
  }
  v28 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferAuxStateWasDowngradedKey"));
  if (v28)
  {
    if (self->_auxStateWasDowngraded)
      v29 = 1;
    else
      v29 = objc_msgSend(v28, "BOOLValue");
    self->_auxStateWasDowngraded = v29;
  }
  if (objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferIsAuxImageKey")))
  {
    v30 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferIsAuxImageKey")), "BOOLValue");
    if ((v30 & 1) != 0 || self->_auxStateWasDowngraded)
      self->_isAuxImage = v30;
  }
  if (objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferIsAuxVideoKey")))
  {
    v31 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferIsAuxVideoKey")), "BOOLValue");
    if ((v31 & 1) != 0 || self->_auxStateWasDowngraded)
      self->_isAuxVideo = v31;
  }
  if (objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferIsScreenshotKey")))
    self->_isScreenshot = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferIsScreenshotKey")), "BOOLValue");
  if (objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferAudioTranscriptionTextKey")))
    self->_audioTranscriptionText = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferAudioTranscriptionTextKey")), "copy");
  if (objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferIsStickerKey")))
    self->_isSticker = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferIsStickerKey")), "BOOLValue");
  self->_adaptiveImageGlyphContentIdentifier = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferAdaptiveImageGlyphContentIdentifierKey"));
  self->_adaptiveImageGlyphContentDescription = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferAdaptiveImageGlyphContentDescriptionKey"));
  if (objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferHideAttachmentKey")))
    self->_hideAttachment = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferHideAttachmentKey")), "BOOLValue");
  if (objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferCloudKitSyncStateKey")))
    self->_cloudKitSyncState = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferCloudKitSyncStateKey")), "BOOLValue");
  if (objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferIsCommSafetySensitiveKey")))
    self->_commSafetySensitive = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferIsCommSafetySensitiveKey")), "integerValue");
  if (objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferUpdateReasonKey")))
    self->_updateReason = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IMFileTransferUpdateReasonKey")), "integerValue");
  self->_sandboxToken = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("sIMFileTransferSandboxTokenKey"));
  if (v5)
    return objc_msgSend(v5, "isEqualToDictionary:", -[IMFileTransfer _dictionaryRepresentation](self, "_dictionaryRepresentation")) ^ 1;
  else
    return 1;
}

- (int64_t)transferState
{
  return self->_transferState;
}

- (IMFileTransfer)init
{
  IMFileTransfer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMFileTransfer;
  result = -[IMFileTransfer init](&v3, sel_init);
  if (result)
  {
    result->_needsWrapper = 1;
    result->_commSafetySensitive = 0;
    result->_updateReason = 0;
    *(_QWORD *)&result->_isAuxImage = 0;
    result->_adaptiveImageGlyphContentIdentifier = 0;
    result->_adaptiveImageGlyphContentDescription = 0;
    result->_cloudKitServerChangeTokenBlob = 0;
    result->_cloudKitRecordID = 0;
    result->_cloudKitSyncState = 0;
  }
  return result;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)_calculateTypeInformation
{
  NSString *v3;
  uint64_t v4;

  if (!self->_utiType && -[NSString length](-[NSString pathExtension](self->_filename, "pathExtension"), "length"))
    self->_utiType = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager"), "UTITypeOfPath:", self->_filename);
  if (!self->_mimeType)
  {
    v3 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager"), "MIMETypeOfPath:", self->_filename);
    self->_mimeType = v3;
    if (!v3)
    {
      if (self->_utiType)
      {
        v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager"), "pathExtensionForUTIType:", self->_utiType);
        self->_mimeType = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager"), "MIMETypeOfPathExtension:", v4);
      }
    }
  }
}

+ (BOOL)genmojiFileTransferShouldDisplayAsPermanentlyFailed:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  char v6;
  NSObject *v7;
  char v8;
  NSObject *v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "guid");
    v5 = objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v4, "transferState"))
    {
      case 5:
        v6 = objc_msgSend(v4, "existsAtLocalPath");
        if ((v6 & 1) == 0)
        {
          IMLogHandleForCategory("IMFileTransfer");
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            sub_19E36DEBC();

        }
        v8 = v6 ^ 1;
        goto LABEL_21;
      case 6:
        IMLogHandleForCategory("IMFileTransfer");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_19E36DDFC();
        goto LABEL_19;
      case 7:
        IMLogHandleForCategory("IMFileTransfer");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_19E36DE5C();
        goto LABEL_19;
      case 8:
        IMLogHandleForCategory("IMFileTransfer");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_19E36DD9C();
        goto LABEL_19;
      case 9:
        IMLogHandleForCategory("IMFileTransfer");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_19E36DD3C();
LABEL_19:

        goto LABEL_20;
      default:
        v8 = 0;
        goto LABEL_21;
    }
  }
  IMLogHandleForCategory("IMFileTransfer");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_19E36DCFC(v5);
LABEL_20:
  v8 = 1;
LABEL_21:

  return v8;
}

- (BOOL)isFromMomentShare
{
  return -[NSDictionary objectForKey:](-[IMFileTransfer attributionInfo](self, "attributionInfo"), "objectForKey:", CFSTR("cmm-url")) != 0;
}

- (NSURL)shareURL
{
  NSURL *result;
  NSURL *v4;

  result = -[NSDictionary objectForKey:](-[IMFileTransfer attributionInfo](self, "attributionInfo"), "objectForKey:", CFSTR("cmm-url"));
  if (result)
  {
    v4 = result;
    if (objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer attributionInfo](self, "attributionInfo"), "objectForKey:", CFSTR("ac")), "unsignedIntValue") == 1)return v4;
    else
      return 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[IMFileTransfer _clear](self, "_clear");

  self->_cloudKitServerChangeTokenBlob = 0;
  self->_cloudKitRecordID = 0;

  self->_originalGUID = 0;
  self->_audioTranscriptionText = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMFileTransfer;
  -[IMFileTransfer dealloc](&v3, sel_dealloc);
}

+ (BOOL)_doesLocalURLRequireArchiving:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  v3 = (void *)objc_msgSend(a3, "path");
  v4 = objc_msgSend((id)objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Contents")), "stringByAppendingPathComponent:", CFSTR("MacOS"));
  v5 = objc_msgSend((id)objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Contents")), "stringByAppendingPathComponent:", CFSTR("MacOS"));
  return (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v4) & 1) != 0
      || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v5) & 1) != 0
      || sub_19E3148C8(v3, 0, &v7);
}

+ (id)_dictionaryRepresentationGUIDKey
{
  return CFSTR("IMFileTransferGUID");
}

- (id)_initWithGUID:(id)a3 filename:(id)a4 isDirectory:(BOOL)a5 localURL:(id)a6 account:(id)a7 otherPerson:(id)a8 totalBytes:(unint64_t)a9 hfsType:(unsigned int)a10 hfsCreator:(unsigned int)a11 hfsFlags:(unsigned __int16)a12 isIncoming:(BOOL)a13
{
  IMFileTransfer *v19;
  NSObject *v20;
  NSObject *v21;
  NSString *v22;
  int v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v19 = -[IMFileTransfer init](self, "init");
  if (v19)
  {
    if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend(a3, "im_lastPathComponent")) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v24 = 138412546;
          v25 = a3;
          v26 = 2112;
          v27 = objc_msgSend(a3, "im_lastPathComponent");
          _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "tried to init IMFileTransfer with guid that has path specifiers %@. using stripped guid instead %@", (uint8_t *)&v24, 0x16u);
        }
      }
      a3 = (id)objc_msgSend(a3, "im_lastPathComponent");
    }
    v19->_guid = (NSString *)a3;
    v19->_filename = (NSString *)(id)objc_msgSend(a4, "im_lastPathComponent");
    v19->_accountID = (NSString *)a7;
    v19->_otherPerson = (NSString *)a8;
    v19->_createdDate = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19->_isDirectory = a5;
    v19->_hfsType = a10;
    v19->_hfsCreator = a11;
    v19->_hfsFlags = a12;
    v19->_totalBytes = a9;
    v19->_isIncoming = a13;
    if (objc_msgSend(a6, "isFileURL"))
    {
      -[IMFileTransfer _setLocalURL:](v19, "_setLocalURL:", a6);
    }
    else if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = a6;
        _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "tried to init IMFileTransfer with non-local URL: %@", (uint8_t *)&v24, 0xCu);
      }
    }
    v19->_needsWrapper = 1;
    *(_DWORD *)&v19->_isAuxImage = 0;
    v19->_adaptiveImageGlyphContentIdentifier = 0;
    v19->_adaptiveImageGlyphContentDescription = 0;
    v22 = (NSString *)a3;
    v19->_commSafetySensitive = 0;
    v19->_originalGUID = v22;
    v19->_updateReason = 0;
  }
  return v19;
}

- (void)_setAccount:(id)a3 otherPerson:(id)a4
{
  NSString *accountID;
  NSString *otherPerson;

  if (a3)
  {
    accountID = self->_accountID;
    if (accountID != a3)
    {

      self->_accountID = (NSString *)a3;
    }
  }
  if (a4)
  {
    otherPerson = self->_otherPerson;
    if (otherPerson != a4)
    {

      self->_otherPerson = (NSString *)a4;
    }
  }
}

- (void)_setStartDate:(id)a3
{
  NSDate *startDate;
  double v6;

  startDate = self->_startDate;
  if (startDate != a3)
  {

    self->_startDate = (NSDate *)a3;
    objc_msgSend(a3, "timeIntervalSince1970");
    self->_lastAveragedInterval = v6;
  }
}

- (void)_setCurrentBytes:(unint64_t)a3 totalBytes:(unint64_t)a4
{
  -[IMFileTransfer setCurrentBytes:](self, "setCurrentBytes:", a3);
  MEMORY[0x1E0DE7D20](self, sel_setTotalBytes_);
}

- (void)_setAveragedTransferRate:(unint64_t)a3 lastAveragedInterval:(double)a4 lastAveragedBytes:(unint64_t)a5
{
  self->_averageTransferRate = a3;
  self->_lastAveragedInterval = a4;
  self->_lastAveragedBytes = a5;
}

- (void)_setDirectory:(BOOL)a3 hfsType:(unsigned int)a4 hfsCreator:(unsigned int)a5 hfsFlags:(unsigned __int16)a6
{
  self->_isDirectory = a3;
  self->_hfsType = a4;
  self->_hfsCreator = a5;
  self->_hfsFlags = a6;
}

- (NSString)serviceFromUserInfo
{
  return (NSString *)-[NSDictionary objectForKey:](self->_localUserInfo, "objectForKey:", CFSTR("service"));
}

+ (id)whitelistedKeys
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("IMFileTransferGUID");
  v3[1] = CFSTR("IMFileTransferMessageGUID");
  v3[2] = CFSTR("IMFileTransferFilenameKey");
  v3[3] = CFSTR("IMFileTransferMIMETypeKey");
  v3[4] = CFSTR("IMFileTransferUTITypeKey");
  v3[5] = CFSTR("IMFileTransferLocalUserInfoKey");
  v3[6] = CFSTR("IMFileTransferCreatedDate");
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7));
}

- (void)_updateWithDictionaryRepresentationForWhitelistedKeys:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(a3, "allKeys"));
  objc_msgSend(v5, "intersectSet:", +[IMFileTransfer whitelistedKeys](IMFileTransfer, "whitelistedKeys"));
  objc_msgSend(a3, "dictionaryWithValuesForKeys:", objc_msgSend(v5, "allObjects"));
  MEMORY[0x1E0DE7D20](self, sel__updateWithDictionaryRepresentation_);
}

- (id)_dictionaryToSend
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSString *guid;
  NSString *messageGUID;
  NSString *filename;
  NSString *mimeType;
  NSString *utiType;
  NSDictionary *localUserInfo;
  NSDate *createdDate;
  const void *v12;
  NSObject *v13;
  int v15;
  __CFDictionary *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (__CFDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = v3;
  guid = self->_guid;
  if (guid)
    CFDictionarySetValue(v3, CFSTR("IMFileTransferGUID"), guid);
  messageGUID = self->_messageGUID;
  if (messageGUID)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferMessageGUID"), messageGUID);
  filename = self->_filename;
  if (filename)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferFilenameKey"), filename);
  mimeType = self->_mimeType;
  if (mimeType)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferMIMETypeKey"), mimeType);
  utiType = self->_utiType;
  if (utiType)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferUTITypeKey"), utiType);
  localUserInfo = self->_localUserInfo;
  if (localUserInfo)
    CFDictionarySetValue(v4, CFSTR("IMFileTransferLocalUserInfoKey"), localUserInfo);
  createdDate = self->_createdDate;
  if (createdDate)
  {
    -[NSDate timeIntervalSince1970](createdDate, "timeIntervalSince1970");
    v12 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    if (v12)
      CFDictionarySetValue(v4, CFSTR("IMFileTransferCreatedDate"), v12);
  }
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Constructed transfer dictionary to send: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  return v4;
}

+ (id)guidForFileTransferDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "_stringForKey:", CFSTR("IMFileTransferGUID"));
}

- (NSDate)refreshDate
{
  NSDate *v3;
  NSDate *v4;

  v3 = -[NSDictionary objectForKey:](self->_localUserInfo, "objectForKey:", CFSTR("refresh-date"));
  if (v3
    && (v4 = v3,
        -[NSDate compare:](-[IMFileTransfer createdDate](self, "createdDate"), "compare:", v3) != NSOrderedDescending))
  {
    return v4;
  }
  else
  {
    return -[IMFileTransfer createdDate](self, "createdDate");
  }
}

- (NSString)originalFilename
{
  id v3;

  v3 = -[NSDictionary objectForKey:](-[IMFileTransfer userInfo](self, "userInfo"), "objectForKey:", CFSTR("service"));
  if (v3 && -[__CFString isEqualToString:](IMServiceNameRCS[0], "isEqualToString:", v3))
    return (NSString *)objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer userInfo](self, "userInfo"), "objectForKey:", CFSTR("file")), "objectForKey:", CFSTR("fileName"));
  else
    return self->_filename;
}

- (void)fixInvalidTransferStateIfNeeded
{
  if (!-[IMFileTransfer isFinished](self, "isFinished")
    && !-[IMFileTransfer isInThumbnailState](self, "isInThumbnailState"))
  {
    if (-[IMFileTransfer transferState](self, "transferState"))
    {
      -[IMFileTransfer _setTransferState:](self, "_setTransferState:", 7);
      MEMORY[0x1E0DE7D20](self, sel__setError_);
    }
  }
}

- (BOOL)isDownloadExpired
{
  id v3;
  void *v4;
  NSDate *v6;

  v3 = -[NSDictionary objectForKey:](-[IMFileTransfer userInfo](self, "userInfo"), "objectForKey:", CFSTR("service"));
  if (v3 && -[__CFString isEqualToString:](IMServiceNameRCS[0], "isEqualToString:", v3))
  {
    v4 = (void *)objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer userInfo](self, "userInfo"), "objectForKey:", CFSTR("file")), "objectForKey:", CFSTR("validUntil"));
    if (v4)
      return objc_msgSend(v4, "compare:", objc_msgSend(MEMORY[0x1E0C99D68], "now")) == -1;
    return 1;
  }
  v6 = -[IMFileTransfer refreshDate](self, "refreshDate");
  if (!v6)
  {
    v6 = -[IMFileTransfer createdDate](self, "createdDate");
    if (!v6)
      return 1;
  }
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2678400.0), "compare:", v6) == 1;
}

- (void)setRefreshDate:(id)a3
{
  NSDictionary *v5;

  if ((IMSharedHelperAreObjectsLogicallySame(-[NSDictionary objectForKey:](self->_localUserInfo, "objectForKey:", CFSTR("refresh-date")), a3) & 1) == 0)
  {
    v5 = (NSDictionary *)-[NSDictionary mutableCopy](self->_localUserInfo, "mutableCopy");

    if (a3)
      -[NSDictionary setObject:forKey:](v5, "setObject:forKey:", a3, CFSTR("refresh-date"));
    else
      -[NSDictionary removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("refresh-date"));
    self->_localUserInfo = v5;
  }
}

- (BOOL)canBeAccepted
{
  return self->_isIncoming && -[IMFileTransfer transferState](self, "transferState") < 3;
}

- (BOOL)isFinished
{
  return -[IMFileTransfer transferState](self, "transferState") <= 6
      && -[IMFileTransfer transferState](self, "transferState") > 4;
}

- (NSString)displayName
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
  -[IMFileTransfer filename](self, "filename");
  -[IMFileTransfer hfsFlags](self, "hfsFlags");
  return (NSString *)MEMORY[0x1E0DE7D20](v3, sel_displayNameOfFileWithName_hfsFlags_);
}

- (BOOL)existsAtLocalPath
{
  if (self->_isIncoming && -[IMFileTransfer transferState](self, "transferState") != 5)
    return 0;
  else
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", -[IMFileTransfer localPath](self, "localPath"));
}

- (BOOL)thumbnailExistsAtLocalPath
{
  int v3;

  v3 = -[IMFileTransfer isInThumbnailState](self, "isInThumbnailState");
  if (v3)
    LOBYTE(v3) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", -[IMFileTransfer localPath](self, "localPath"));
  return v3;
}

- (BOOL)isSticker
{
  return -[NSDictionary count](-[IMFileTransfer stickerUserInfo](self, "stickerUserInfo"), "count") != 0;
}

- (BOOL)isContact
{
  NSUInteger v3;
  CFStringRef PreferredIdentifierForTag;

  v3 = -[NSString length](-[NSString stringByTrimmingCharactersInSet:](-[IMFileTransfer mimeType](self, "mimeType"), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet")), "length");
  if (v3)
  {
    PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A90], (CFStringRef)-[IMFileTransfer mimeType](self, "mimeType"), 0);
    CFAutorelease(PreferredIdentifierForTag);
    LOBYTE(v3) = IMUTTypeIsVCard(PreferredIdentifierForTag);
  }
  return v3;
}

- (BOOL)isAnimojiV2
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer transcoderUserInfo](self, "transcoderUserInfo"), "objectForKey:", CFSTR("AVIsAnimojiV2")), "BOOLValue");
}

- (BOOL)wantsAlphaRemoved
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer transcoderUserInfo](self, "transcoderUserInfo"), "objectForKey:", CFSTR("AVIsRemoveAlpha")), "BOOLValue");
}

- (void)setAdaptiveImageGlyphContentIdentifier:(id)a3
{
  NSString *adaptiveImageGlyphContentIdentifier;
  id v6;

  adaptiveImageGlyphContentIdentifier = self->_adaptiveImageGlyphContentIdentifier;
  if (adaptiveImageGlyphContentIdentifier != a3)
  {

    self->_adaptiveImageGlyphContentIdentifier = (NSString *)a3;
    v6 = a3;
    -[NSString length](self->_adaptiveImageGlyphContentIdentifier, "length");
    MEMORY[0x1E0DE7D20](self, sel_setTranscoderUserInfoIsGenmoji_);
  }
}

- (void)setTranscoderUserInfoIsGenmoji:(BOOL)a3
{
  _BOOL4 v3;
  NSDictionary *transcoderUserInfo;
  id v6;
  void *v7;
  NSDictionary *v8;

  v3 = a3;
  transcoderUserInfo = self->_transcoderUserInfo;
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](transcoderUserInfo, "objectForKeyedSubscript:", CFSTR("isGenmoji")), "BOOLValue") != a3)
  {
    if (transcoderUserInfo)
      v6 = (id)-[NSDictionary mutableCopy](transcoderUserInfo, "mutableCopy");
    else
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = v6;

    if (v3)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("isGenmoji"));
    else
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("isGenmoji"));
    v8 = (NSDictionary *)objc_msgSend(v7, "copy");

    self->_transcoderUserInfo = v8;
  }
}

- (BOOL)isGenmojiFallback
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_transcoderUserInfo, "objectForKeyedSubscript:", CFSTR("isGenmojiFallback")), "BOOLValue");
}

- (void)setIsGenmojiFallback:(BOOL)a3
{
  _BOOL4 v3;
  NSDictionary *transcoderUserInfo;
  id v6;
  void *v7;
  NSDictionary *v8;

  v3 = a3;
  transcoderUserInfo = self->_transcoderUserInfo;
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](transcoderUserInfo, "objectForKeyedSubscript:", CFSTR("isGenmojiFallback")), "BOOLValue") != a3)
  {
    if (transcoderUserInfo)
      v6 = (id)-[NSDictionary mutableCopy](transcoderUserInfo, "mutableCopy");
    else
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = v6;

    if (v3)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("isGenmojiFallback"));
    else
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("isGenmojiFallback"));
    v8 = (NSDictionary *)objc_msgSend(v7, "copy");

    self->_transcoderUserInfo = v8;
  }
}

- (BOOL)canMarkPurgeable
{
  NSString *v3;
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  NSString *v9;
  NSString *v10;
  int64_t v11;
  int64_t v12;
  const __CFString *v13;
  id v14;
  const __CFString *v15;
  uint64_t v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString pathExtension](-[IMFileTransfer filename](self, "filename"), "pathExtension");
  v4 = -[NSString im_isAudioMessageExtension](v3, "im_isAudioMessageExtension");
  v5 = -[NSString containsString:](-[IMFileTransfer filename](self, "filename"), "containsString:", CFSTR("GroupPhotoImage"));
  v6 = -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("pluginpayload"))
    || -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("pluginpayloadattachment"));
  LOBYTE(v17) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[IMFileTransfer attributionInfo](self, "attributionInfo"), "objectForKeyedSubscript:", CFSTR("bundle-id")), "hasPrefix:", CFSTR("com.apple.messages.URLBalloonProvider"));
  v7 = objc_msgSend((id)objc_opt_class(), "canMarkPurgeableWithCKSyncState:transferState:isAudio:isSticker:isGroupPhoto:isPluginPayload:isRichLink:", -[IMFileTransfer cloudKitSyncState](self, "cloudKitSyncState"), -[IMFileTransfer transferState](self, "transferState"), v4, -[IMFileTransfer isSticker](self, "isSticker"), v5, v6, v17);
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = -[IMFileTransfer guid](self, "guid");
      v10 = -[IMFileTransfer filename](self, "filename");
      v11 = -[IMFileTransfer cloudKitSyncState](self, "cloudKitSyncState");
      v12 = -[IMFileTransfer transferState](self, "transferState");
      if (-[IMFileTransfer hideAttachment](self, "hideAttachment"))
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      v14 = -[NSDictionary objectForKeyedSubscript:](-[IMFileTransfer attributionInfo](self, "attributionInfo"), "objectForKeyedSubscript:", CFSTR("bundle-id"));
      if (v7)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      *(_DWORD *)buf = 138413826;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2048;
      v23 = v11;
      v24 = 2048;
      v25 = v12;
      v26 = 2112;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "canMarkPurgeable transfer: %@ file: [%@], cloudKitSyncState: [%ld], transferState: [%ld], hideAttachment: [%@], bundleID: [%@], purgeable: [%@]", buf, 0x48u);
    }
  }
  return v7;
}

- (BOOL)canMarkPurgeableIfIsRichLink:(BOOL)a3
{
  NSString *v3;
  uint64_t v4;

  v3 = -[NSString lowercaseString](-[NSString pathExtension](-[IMFileTransfer filename](self, "filename"), "pathExtension"), "lowercaseString");
  if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("pluginpayload")))
    -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("pluginpayloadattachment"));
  v4 = objc_opt_class();
  return MEMORY[0x1E0DE7D20](v4, sel_canMarkPurgeableIfIsRichLink_isPluginPayload_);
}

+ (BOOL)canMarkPurgeableWithCKSyncState:(int64_t)a3 transferState:(int64_t)a4 isAudio:(BOOL)a5 isSticker:(BOOL)a6 isGroupPhoto:(BOOL)a7
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  return objc_msgSend(a1, "canMarkPurgeableWithCKSyncState:transferState:isAudio:isSticker:isGroupPhoto:isPluginPayload:isRichLink:", a3, a4, a5, a6, a7, 0, v8);
}

+ (BOOL)canMarkPurgeableWithCKSyncState:(int64_t)a3 transferState:(int64_t)a4 isAudio:(BOOL)a5 isSticker:(BOOL)a6 isGroupPhoto:(BOOL)a7 isPluginPayload:(BOOL)a8 isRichLink:(BOOL)a9
{
  if (a3 != 1 || a4 != 5 || a5 || a6 || a7)
    return 0;
  else
    return MEMORY[0x1E0DE7D20](a1, sel_canMarkPurgeableIfIsRichLink_isPluginPayload_);
}

+ (BOOL)canMarkPurgeableIfIsRichLink:(BOOL)a3 isPluginPayload:(BOOL)a4
{
  return !a4 || a3;
}

- (BOOL)isLocation
{
  return -[NSString isEqualToString:](-[IMFileTransfer mimeType](self, "mimeType"), "isEqualToString:", CFSTR("text/x-vlocation"));
}

- (BOOL)isRecipeBasedSticker
{
  _BOOL4 v3;

  v3 = -[IMFileTransfer isSticker](self, "isSticker");
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer stickerUserInfo](self, "stickerUserInfo"), "objectForKey:", CFSTR("srecipe")), "length") != 0;
  return v3;
}

- (BOOL)isAutoloopVideo
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer transcoderUserInfo](self, "transcoderUserInfo"), "objectForKey:", CFSTR("AVIsAutoloopVideo")), "BOOLValue");
}

- (BOOL)isOpusAudioMessage
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer transcoderUserInfo](self, "transcoderUserInfo"), "objectForKey:", CFSTR("AVIsOpusAudioMessage")), "BOOLValue");
}

- (BOOL)isHEVCWithAlphaVideo
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer transcoderUserInfo](self, "transcoderUserInfo"), "objectForKey:", CFSTR("AVIsHEVCWithAlphaVideo")), "BOOLValue");
}

- (BOOL)isAdaptiveImageGlyph
{
  return -[NSString length](self->_adaptiveImageGlyphContentIdentifier, "length") != 0;
}

- (BOOL)isInThumbnailState
{
  return -[IMFileTransfer transferState](self, "transferState") == 9;
}

- (int64_t)thumbnailMode
{
  return (int)objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer userInfo](self, "userInfo"), "objectForKey:", CFSTR("thumbMode")), "intValue");
}

- (void)setThumbnailMode:(int64_t)a3
{
  NSDictionary *v5;

  if ((int)objc_msgSend(-[NSDictionary objectForKey:](self->_localUserInfo, "objectForKey:", CFSTR("thumbMode")), "intValue") != a3)
  {
    v5 = (NSDictionary *)-[NSDictionary mutableCopy](self->_localUserInfo, "mutableCopy");

    if (a3)
      -[NSDictionary setObject:forKey:](v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), CFSTR("thumbMode"));
    else
      -[NSDictionary removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("thumbMode"));
    self->_localUserInfo = v5;
  }
}

- (BOOL)isTemporaryBackwardCompatibilityAsset
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer userInfo](self, "userInfo"), "objectForKey:", CFSTR("isTemporaryBackwardCompatibilityAsset")), "BOOLValue");
}

- (void)setIsTemporaryBackwardCompatibilityAsset:(BOOL)a3
{
  _BOOL4 v3;
  NSDictionary *v5;

  v3 = a3;
  if (-[IMFileTransfer isTemporaryBackwardCompatibilityAsset](self, "isTemporaryBackwardCompatibilityAsset") != a3)
  {
    v5 = (NSDictionary *)-[NSDictionary mutableCopy](self->_localUserInfo, "mutableCopy");

    if (v3)
      -[NSDictionary setObject:forKey:](v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("isTemporaryBackwardCompatibilityAsset"));
    else
      -[NSDictionary removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("isTemporaryBackwardCompatibilityAsset"));
    self->_localUserInfo = v5;
  }
}

- (void)_setTransferDataURL:(id)a3
{
  NSURL *transferDataURL;

  transferDataURL = self->_transferDataURL;
  if (transferDataURL != a3)
  {

    self->_transferDataURL = (NSURL *)a3;
  }
}

- (NSString)localPath
{
  return -[NSURL path](-[IMFileTransfer localURL](self, "localURL"), "path");
}

- (NSString)temporaryHighQualityLocalPath
{
  return -[NSURL path](-[IMFileTransfer temporaryHighQualityLocalURL](self, "temporaryHighQualityLocalURL"), "path");
}

- (NSString)permanentHighQualityLocalPath
{
  NSString *v2;

  v2 = -[IMFileTransfer localPath](self, "localPath");
  return (NSString *)MEMORY[0x1E0DE7D20](v2, sel___im_filePathWithVariant_);
}

- (void)_setLocalPath:(id)a3
{
  if (a3)
    -[IMFileTransfer _setLocalURL:](self, "_setLocalURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a3, 0));
}

- (void)_setLocalURL:(id)a3
{
  NSURL *localURL;
  uint64_t v6;
  NSString *filename;
  void *v8;

  localURL = self->_localURL;
  if (localURL != a3)
  {

    self->_localURL = (NSURL *)a3;
  }
  if (a3)
  {
    v6 = objc_msgSend((id)objc_msgSend(a3, "path"), "lastPathComponent");
    filename = self->_filename;
    if (filename != (NSString *)v6)
    {
      v8 = (void *)v6;

      self->_filename = (NSString *)v8;
    }
  }
}

- (NSString)mimeType
{
  -[IMFileTransfer _calculateTypeInformation](self, "_calculateTypeInformation");
  return self->_mimeType;
}

- (NSString)type
{
  -[IMFileTransfer _calculateTypeInformation](self, "_calculateTypeInformation");
  return self->_utiType;
}

- (unsigned)hfsType
{
  -[IMFileTransfer _calculateTypeInformation](self, "_calculateTypeInformation");
  return self->_hfsType;
}

- (id)description
{
  objc_class *v3;
  int64_t v4;
  const __CFString *v5;
  uint64_t v6;
  NSURL *v7;
  NSString *v8;
  NSString *v9;
  int64_t v10;
  unint64_t totalBytes;
  NSDate *v12;
  int64_t v13;
  unint64_t v14;
  const __CFString *v15;
  const __CFString *v17;
  NSString *v18;
  void *v19;

  v19 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v3);
  v4 = -[IMFileTransfer transferState](self, "transferState");
  if ((unint64_t)(v4 + 1) > 0xA)
    v5 = CFSTR("Unknown");
  else
    v5 = off_1E3FBA508[v4 + 1];
  v17 = v5;
  v6 = -[IMFileTransfer cloudKitSyncState](self, "cloudKitSyncState");
  v7 = -[IMFileTransfer localURL](self, "localURL");
  v8 = -[IMFileTransfer transferredFilename](self, "transferredFilename");
  v9 = -[IMFileTransfer guid](self, "guid");
  v10 = -[IMFileTransfer error](self, "error");
  totalBytes = self->_totalBytes;
  v12 = -[IMFileTransfer createdDate](self, "createdDate");
  v13 = -[IMFileTransfer commSafetySensitive](self, "commSafetySensitive");
  v14 = -[IMFileTransfer updateReason](self, "updateReason");
  if (v14 > 2)
    v15 = CFSTR("Unhandled New Case");
  else
    v15 = off_1E3FBA560[v14];
  return (id)objc_msgSend(v19, "stringWithFormat:", CFSTR("[%@: %p  state: %@  sync state: %@  local path: %@  transferred name: %@  guid: %@  error: %d  total bytes: %d  created: %@ commSafety: %d update reason: %@]"), v18, self, v17, IMStringFromCKSyncState(v6), v7, v8, v9, v10, totalBytes, v12, v13, v15);
}

- (unint64_t)totalBytes
{
  NSString *v3;
  uint64_t v5;

  if (-[IMFileTransfer transferState](self, "transferState") == 5 && !self->_totalBytes)
  {
    v5 = 0;
    v3 = -[IMFileTransfer localPath](self, "localPath");
    if (-[NSString length](v3, "length"))
      self->_totalBytes = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager"), "attributesOfItemAtPath:error:", v3, &v5), "fileSize");
  }
  return self->_totalBytes;
}

- (unint64_t)currentBytes
{
  if (-[IMFileTransfer transferState](self, "transferState") == 5)
    return MEMORY[0x1E0DE7D20](self, sel_totalBytes);
  else
    return self->_currentBytes;
}

+ (id)AuxGUIDFromFileTransferGUID:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (a3)
    return (id)objc_msgSend(CFSTR("Aux_"), "stringByAppendingString:");
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "nil guid passed to AuxGUIDFromFileTransferGUID", v5, 2u);
    }
  }
  return 0;
}

+ (id)guidByStrippingAuxPrefix:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (a3)
    return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Aux_"), &stru_1E3FBBA48);
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "nil guid passed to guidByStrippingAuxPrefix", v5, 2u);
    }
  }
  return 0;
}

- (int64_t)finalTransferStateForSuccess:(BOOL)a3
{
  -[IMFileTransfer thumbnailMode](self, "thumbnailMode");
  return MEMORY[0x1E0DE7D20](IMFileTransfer, sel_finalTransferStateForThumbnailMode_success_);
}

+ (int64_t)finalTransferStateForThumbnailMode:(int64_t)a3 success:(BOOL)a4
{
  int64_t v4;
  int64_t v5;
  uint64_t v6;

  v4 = 9;
  if (a4)
    v4 = 5;
  v5 = 5;
  if (!a4)
    v5 = 0;
  v6 = 9;
  if (!a4)
    v6 = 0;
  if (a3 == 1)
    v5 = v6;
  if (a3 == 2)
    return v4;
  else
    return v5;
}

+ (int64_t)thumbnailModeForMode:(int64_t)a3 afterDownloadSuccess:(BOOL)a4
{
  int64_t v4;

  v4 = a3 - 1;
  if (a4)
    v4 = a3 == 1;
  if (a3)
    return v4;
  else
    return 0;
}

- (int64_t)thumbnailModeAfterDownloadSuccess:(BOOL)a3
{
  -[IMFileTransfer thumbnailMode](self, "thumbnailMode");
  return MEMORY[0x1E0DE7D20](IMFileTransfer, sel_thumbnailModeForMode_afterDownloadSuccess_);
}

- (id)createAndPersistLivePhotoBundleIfNecessary
{
  NSString *v3;
  NSObject *v4;
  NSString *v5;
  id v6;
  id v7;
  NSObject *v8;
  NSString *v9;
  const char *v10;
  NSObject *v11;
  NSString *v12;
  NSObject *v13;
  uint32_t v14;
  NSString *v15;
  NSString *v16;
  _QWORD *v17;
  void *v18;
  objc_class *v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSString *v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSString *v27;
  NSObject *v28;
  NSString *v29;
  NSObject *v30;
  NSString *v32;
  void (*v33)(uint64_t, uint64_t);
  _QWORD v34[5];
  uint64_t v35;
  uint64_t v36;
  _BYTE buf[24];
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString __im_livePhotoBundlePathWithGUID:](-[IMFileTransfer localPath](self, "localPath"), "__im_livePhotoBundlePathWithGUID:", -[IMFileTransfer guid](self, "guid"));
  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = -[IMFileTransfer guid](self, "guid");
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Live Photo bundle path didn't exist for transfer with GUID %@", buf, 0xCu);
      }
    }
    v5 = -[IMFileTransfer localPath](self, "localPath");
    v6 = -[IMFileTransfer _auxVideoPathIfItExists](self, "_auxVideoPathIfItExists");
    v7 = v6;
    if (!v5)
    {
      if (!IMOSLoggingEnabled())
        return 0;
      v11 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        return 0;
      v12 = -[IMFileTransfer guid](self, "guid");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      v10 = "Live Photo bundle could not be created because the image path didn't exist for transfer with GUID %@, videoC"
            "omplementPath: %@";
      v13 = v11;
      v14 = 22;
      goto LABEL_18;
    }
    if (!v6)
    {
      if (!IMOSLoggingEnabled())
        return 0;
      v8 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        return 0;
      v15 = -[IMFileTransfer guid](self, "guid");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v15;
      v10 = "Live Photo bundle could not be created because the video complement path didn't exist for transfer with GUID %@";
LABEL_17:
      v13 = v8;
      v14 = 12;
LABEL_18:
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, v10, buf, v14);
      return 0;
    }
    if (-[NSString isEqualToString:](v5, "isEqualToString:", v6))
    {
      if (!IMOSLoggingEnabled())
        return 0;
      v8 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        return 0;
      v9 = -[IMFileTransfer guid](self, "guid");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      v10 = "Live Photo bundle could not be created because the image and video complement paths are the same for transfer with GUID %@";
      goto LABEL_17;
    }
    v16 = -[NSString stringByAppendingPathComponent:](-[NSString stringByDeletingLastPathComponent](v5, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", -[IMFileTransfer guid](self, "guid"));
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v17 = (_QWORD *)qword_1ECFC6D78;
    v38 = (void (*)(uint64_t, uint64_t))qword_1ECFC6D78;
    if (!qword_1ECFC6D78)
    {
      v18 = (void *)sub_19E316F94();
      v17 = dlsym(v18, "PFLivePhotoBundleExtension");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v17;
      qword_1ECFC6D78 = (uint64_t)v17;
    }
    _Block_object_dispose(buf, 8);
    if (!v17)
    {
      sub_19E36B7D8();
      __break(1u);
    }
    v3 = -[NSString stringByAppendingPathExtension:](v16, "stringByAppendingPathExtension:", *v17);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    v38 = sub_19E24771C;
    v39 = sub_19E247578;
    v19 = (objc_class *)qword_1ECFC6C80;
    v40 = qword_1ECFC6C80;
    if (!qword_1ECFC6C80)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = sub_19E317044;
      v34[3] = &unk_1E3FB4F80;
      v34[4] = buf;
      sub_19E317044((uint64_t)v34);
      v19 = *(objc_class **)(*(_QWORD *)&buf[8] + 40);
    }
    _Block_object_dispose(buf, 8);
    v20 = [v19 alloc];
    *(_OWORD *)buf = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v21 = (void *)objc_msgSend(v20, "initWithPathToVideo:pathToImage:imageDisplayTime:pairingIdentifier:", v7, v5, buf, 0);
    v34[0] = 0;
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = -[IMFileTransfer guid](self, "guid");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v3;
        _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "Creating live photo bundle for transfer %@ at path %@", buf, 0x16u);
      }
    }
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v25 = objc_msgSend(v21, "writeToBundleAtURL:error:", v24, v34);

    if (!v25
      || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v3) & 1) == 0)
    {
      v30 = IMLogHandleForCategory("IMFileTransfer");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v32 = -[IMFileTransfer guid](self, "guid");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v32;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v3;
        *(_WORD *)&buf[22] = 2112;
        v38 = (void (*)(uint64_t, uint64_t))v34[0];
        _os_log_error_impl(&dword_19E239000, v30, OS_LOG_TYPE_ERROR, "Error creating live photo bundle for transfer %@ at path %@. Error: %@", buf, 0x20u);
      }
      return 0;
    }
    if (IMOSLoggingEnabled())
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = -[IMFileTransfer guid](self, "guid");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v3;
        _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_INFO, "Successfully created live photo bundle for transfer %@ at path %@", buf, 0x16u);
      }
    }
    -[NSString im_markFileAsPurgeable:](v3, "im_markFileAsPurgeable:", 1);
    v35 = *MEMORY[0x1E0C999D8];
    v36 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v33 = 0;
    objc_msgSend(v24, "setResourceValues:error:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1), &v33);
    if (v33)
    {
      v28 = IMLogHandleForCategory("IMFileTransfer");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = -[IMFileTransfer guid](self, "guid");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2112;
        v38 = v33;
        _os_log_error_impl(&dword_19E239000, v28, OS_LOG_TYPE_ERROR, "Error setting resource values for transfer %@ at url %@. Error: %@", buf, 0x20u);
      }
    }
  }
  return v3;
}

- (id)_auxVideoPathIfItExists
{
  NSString *v3;
  NSString *v4;

  v3 = -[NSString stringByAppendingPathExtension:](-[NSString stringByDeletingPathExtension](-[IMFileTransfer localPath](self, "localPath"), "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", CFSTR("MOV"));
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v3) & 1) == 0)
  {
    v4 = -[NSString stringByAppendingPathExtension:](-[NSString stringByDeletingPathExtension](-[IMFileTransfer localPath](self, "localPath"), "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", CFSTR("mov"));
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v4))
      return v4;
    else
      return 0;
  }
  return v3;
}

- (BOOL)_isCloudKitEnabled
{
  return IMGetDomainBoolForKeyWithDefaultValue();
}

- (BOOL)_isMissingAndDownloadable
{
  BOOL v3;
  BOOL v4;

  v3 = -[IMFileTransfer _isCloudKitEnabled](self, "_isCloudKitEnabled");
  v4 = -[IMFileTransfer existsAtLocalPath](self, "existsAtLocalPath");
  if (!v4 && !v3)
    v4 = -[IMFileTransfer isDownloadExpired](self, "isDownloadExpired");
  return !v4;
}

- (void)_resetTransferStateIfAttachmentIsMissingAndDownloadable
{
  NSObject *v3;
  int v4;
  IMFileTransfer *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (-[IMFileTransfer _isMissingAndDownloadable](self, "_isMissingAndDownloadable"))
  {
    -[IMFileTransfer _setTransferState:](self, "_setTransferState:", 0);
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = 138412290;
        v5 = self;
        _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "File not on disk, but in cloudkit or MMCS. Resetting state: %@", (uint8_t *)&v4, 0xCu);
      }
    }
  }
}

- (void)setMimeType:(id)a3
{
  self->_mimeType = (NSString *)a3;
}

- (double)_lastUpdatedInterval
{
  return self->_lastUpdatedInterval;
}

- (void)_setLastUpdatedInterval:(double)a3
{
  self->_lastUpdatedInterval = a3;
}

- (double)_lastAveragedInterval
{
  return self->_lastAveragedInterval;
}

- (void)_setLastAveragedInterval:(double)a3
{
  self->_lastAveragedInterval = a3;
}

- (unint64_t)_lastAveragedBytes
{
  return self->_lastAveragedBytes;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)_setTransferState:(int64_t)a3
{
  self->_transferState = a3;
}

- (BOOL)isIncoming
{
  return self->_isIncoming;
}

- (void)setIsIncoming:(BOOL)a3
{
  self->_isIncoming = a3;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSURL)transferDataURL
{
  return self->_transferDataURL;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (void)setHfsType:(unsigned int)a3
{
  self->_hfsType = a3;
}

- (unsigned)hfsFlags
{
  return self->_hfsFlags;
}

- (void)setHfsFlags:(unsigned __int16)a3
{
  self->_hfsFlags = a3;
}

- (unsigned)hfsCreator
{
  return self->_hfsCreator;
}

- (void)setHfsCreator:(unsigned int)a3
{
  self->_hfsCreator = a3;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSString)otherPerson
{
  return self->_otherPerson;
}

- (void)setOtherPerson:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (void)setCurrentBytes:(unint64_t)a3
{
  self->_currentBytes = a3;
}

- (void)setTotalBytes:(unint64_t)a3
{
  self->_totalBytes = a3;
}

- (unint64_t)averageTransferRate
{
  return self->_averageTransferRate;
}

- (void)setAverageTransferRate:(unint64_t)a3
{
  self->_averageTransferRate = a3;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (void)setIsDirectory:(BOOL)a3
{
  self->_isDirectory = a3;
}

- (BOOL)shouldAttemptToResume
{
  return self->_shouldAttemptToResume;
}

- (void)setShouldAttemptToResume:(BOOL)a3
{
  self->_shouldAttemptToResume = a3;
}

- (int64_t)error
{
  return self->_error;
}

- (void)_setError:(int64_t)a3
{
  self->_error = a3;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)_setErrorDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (BOOL)wasRegisteredAsStandalone
{
  return self->_wasRegisteredAsStandalone;
}

- (void)setRegisteredAsStandalone:(BOOL)a3
{
  self->_wasRegisteredAsStandalone = a3;
}

- (BOOL)shouldForceArchive
{
  return self->_shouldForceArchive;
}

- (void)_setForceArchive:(BOOL)a3
{
  self->_shouldForceArchive = a3;
}

- (NSDictionary)userInfo
{
  return self->_localUserInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (BOOL)_needsWrapper
{
  return self->_needsWrapper;
}

- (void)_setNeedsWrapper:(BOOL)a3
{
  self->_needsWrapper = a3;
}

- (NSString)transferredFilename
{
  return self->_transferredFilename;
}

- (void)setTransferredFilename:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (NSDictionary)transcoderUserInfo
{
  return self->_transcoderUserInfo;
}

- (void)setTranscoderUserInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (BOOL)isAuxImage
{
  return self->_isAuxImage;
}

- (void)setIsAuxImage:(BOOL)a3
{
  self->_isAuxImage = a3;
}

- (BOOL)isAuxVideo
{
  return self->_isAuxVideo;
}

- (void)setIsAuxVideo:(BOOL)a3
{
  self->_isAuxVideo = a3;
}

- (NSDictionary)AuxTranscoderUserInfo
{
  return self->_AuxTranscoderUserInfo;
}

- (void)setAuxTranscoderUserInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (void)setIsSticker:(BOOL)a3
{
  self->_isSticker = a3;
}

- (NSString)adaptiveImageGlyphContentIdentifier
{
  return self->_adaptiveImageGlyphContentIdentifier;
}

- (NSString)adaptiveImageGlyphContentDescription
{
  return self->_adaptiveImageGlyphContentDescription;
}

- (void)setAdaptiveImageGlyphContentDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (NSDictionary)stickerUserInfo
{
  return self->_stickerUserInfo;
}

- (void)setStickerUserInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (BOOL)hideAttachment
{
  return self->_hideAttachment;
}

- (void)setHideAttachment:(BOOL)a3
{
  self->_hideAttachment = a3;
}

- (NSArray)attachmentSendContexts
{
  return self->_attachmentSendContexts;
}

- (void)setAttachmentSendContexts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (void)setIsLocation:(BOOL)a3
{
  self->_isLocation = a3;
}

- (void)setIsContact:(BOOL)a3
{
  self->_isContact = a3;
}

- (int64_t)cloudKitSyncState
{
  return self->_cloudKitSyncState;
}

- (void)setCloudKitSyncState:(int64_t)a3
{
  self->_cloudKitSyncState = a3;
}

- (NSData)cloudKitServerChangeTokenBlob
{
  return self->_cloudKitServerChangeTokenBlob;
}

- (void)setCloudKitServerChangeTokenBlob:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (NSString)cloudKitRecordID
{
  return self->_cloudKitRecordID;
}

- (void)setCloudKitRecordID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (NSString)sandboxToken
{
  return self->_sandboxToken;
}

- (void)setSandboxToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (BOOL)isScreenshot
{
  return self->_isScreenshot;
}

- (void)setIsScreenshot:(BOOL)a3
{
  self->_isScreenshot = a3;
}

- (NSString)audioTranscriptionText
{
  return self->_audioTranscriptionText;
}

- (void)setAudioTranscriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (int64_t)commSafetySensitive
{
  return self->_commSafetySensitive;
}

- (void)setCommSafetySensitive:(int64_t)a3
{
  self->_commSafetySensitive = a3;
}

- (NSURL)localURL
{
  return self->_localURL;
}

- (NSURL)temporaryHighQualityLocalURL
{
  return self->_temporaryHighQualityLocalURL;
}

- (void)setTemporaryHighQualityLocalURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (void)setAttributionInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (BOOL)appMessageFallbackImage
{
  return self->_appMessageFallbackImage;
}

- (void)setAppMessageFallbackImage:(BOOL)a3
{
  self->_appMessageFallbackImage = a3;
}

- (NSString)originalGUID
{
  return self->_originalGUID;
}

- (void)setOriginalGUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (int64_t)updateReason
{
  return self->_updateReason;
}

- (void)setUpdateReason:(int64_t)a3
{
  self->_updateReason = a3;
}

- (BOOL)auxStateWasDowngraded
{
  return self->_auxStateWasDowngraded;
}

- (void)setAuxStateWasDowngraded:(BOOL)a3
{
  self->_auxStateWasDowngraded = a3;
}

- (int64_t)fetchOptions
{
  return self->_fetchOptions;
}

- (void)_setFetchOptions:(int64_t)a3
{
  self->_fetchOptions = a3;
}

@end
