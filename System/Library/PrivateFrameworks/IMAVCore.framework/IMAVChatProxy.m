@implementation IMAVChatProxy

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  unsigned int v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_initiatorIMHandle(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_otherIMHandle(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v23, (uint64_t)CFSTR("Initiator: %@, Receiver: %@"), v24, v25, v12, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x24BDD17C8];
  if (objc_msgSend_isVideo(self, v28, v29, v30, v31))
    v36 = CFSTR("Video");
  else
    v36 = CFSTR("Audio");
  v37 = objc_msgSend_state(self, v32, v33, v34, v35);
  _NSStringDescriptionForIMAVChatState(v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_conferenceID(self, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend_sessionID(self, v44, v45, v46, v47);
  objc_msgSend_GUID(self, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v27, v54, (uint64_t)CFSTR("<%p> %@ chat with %@ (state %@) (ConfID: %@) (SID: %u) (GUID: %@)"), v55, v56, self, v36, v26, v38, v43, v48, v53);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

- (id)account
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("AccountID"), v2, v3);
}

- (NSString)GUID
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("GUID"), v2, v3);
}

- (unsigned)sessionID
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("SessionID"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)conferenceID
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("ConferenceID"), v2, v3);
}

- (unsigned)state
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("State"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isStateFinal
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("IsStateFinal"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isSendingAudio
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("IsSendingAudio"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setIsSendingAudio:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  __CFDictionary *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t isVideo;
  const char *v32;
  _DWORD v33[2];
  __int16 v34;
  IMAVChatProxy *v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v33[0] = 67109378;
    v33[1] = v3;
    v34 = 2112;
    v35 = self;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Client called setIsSendingAudio %d on chat proxy %@", (uint8_t *)v33, 0x12u);
  }

  v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = objc_alloc(MEMORY[0x24BDD16E0]);
  v15 = (void *)objc_msgSend_initWithBool_(v7, v8, v3, v9, v10);
  if (v15)
    CFDictionarySetValue(v6, CFSTR("IsSendingAudio"), v15);
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v11, v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(self, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  isVideo = objc_msgSend_isVideo(self, v27, v28, v29, v30);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v16, v32, (uint64_t)v21, 11, (uint64_t)v6, v26, isVideo);

}

- (BOOL)isSendingVideo
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("IsSendingVideo"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setIsSendingVideo:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  __CFDictionary *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t isVideo;
  const char *v32;
  _DWORD v33[2];
  __int16 v34;
  IMAVChatProxy *v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v33[0] = 67109378;
    v33[1] = v3;
    v34 = 2112;
    v35 = self;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Client called setIsSendingVideo %d on chat proxy %@", (uint8_t *)v33, 0x12u);
  }

  v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = objc_alloc(MEMORY[0x24BDD16E0]);
  v15 = (void *)objc_msgSend_initWithBool_(v7, v8, v3, v9, v10);
  if (v15)
    CFDictionarySetValue(v6, CFSTR("IsSendingVideo"), v15);
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v11, v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(self, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  isVideo = objc_msgSend_isVideo(self, v27, v28, v29, v30);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v16, v32, (uint64_t)v21, 13, (uint64_t)v6, v26, isVideo);

}

- (void)setLocalAspectRatio:(CGSize)a3 cameraOrientation:(unsigned int)a4 cameraType:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  double height;
  double width;
  NSObject *v10;
  void *v11;
  __CFDictionary *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t isVideo;
  const char *v46;
  int v47;
  void *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  IMAVChatProxy *v54;
  uint64_t v55;
  NSSize v56;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  height = a3.height;
  width = a3.width;
  v55 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v56.width = width;
    v56.height = height;
    NSStringFromSize(v56);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 138413058;
    v48 = v11;
    v49 = 1024;
    v50 = v6;
    v51 = 1024;
    v52 = v5;
    v53 = 2112;
    v54 = self;
    _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "Client called setLocalAspectRatio: %@ cameraOrientation: %d cameraType: %d on chat proxy %@", (uint8_t *)&v47, 0x22u);

  }
  v12 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_valueWithSize_(MEMORY[0x24BDD1968], v13, v14, v15, v16, width, height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v18, v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v22, v5, v23, v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    CFDictionarySetValue(v12, CFSTR("AspectRatio"), v17);
  if (v21)
    CFDictionarySetValue(v12, CFSTR("Orientation"), v21);
  if (v29)
    CFDictionarySetValue(v12, CFSTR("CameraType"), v29);
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v25, v26, v27, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(self, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  isVideo = objc_msgSend_isVideo(self, v41, v42, v43, v44);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v30, v46, (uint64_t)v35, 12, (uint64_t)v12, v40, isVideo);

}

- (BOOL)hasReceivedFirstFrame
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("HasReceivedFirstFrame"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSNumber)dataUploaded
{
  uint64_t v2;
  uint64_t v3;

  return (NSNumber *)objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("DataUploaded"), v2, v3);
}

- (NSNumber)dataDownloaded
{
  uint64_t v2;
  uint64_t v3;

  return (NSNumber *)objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("DataDownloaded"), v2, v3);
}

- (NSDate)dateConnected
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("DateConnected"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v4, v5, v6, v7, v8);
  v10 = v9;
  if (v9 >= 1.0)
  {
    v12 = objc_alloc(MEMORY[0x24BDBCE60]);
    v11 = (void *)objc_msgSend_initWithTimeIntervalSince1970_(v12, v13, v14, v15, v16, v10);
  }
  else
  {
    v11 = 0;
  }

  return (NSDate *)v11;
}

- (NSDate)dateEnded
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("DateEnded"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v4, v5, v6, v7, v8);
  v10 = v9;
  if (v9 >= 1.0)
  {
    v12 = objc_alloc(MEMORY[0x24BDBCE60]);
    v11 = (void *)objc_msgSend_initWithTimeIntervalSince1970_(v12, v13, v14, v15, v16, v10);
  }
  else
  {
    v11 = 0;
  }

  return (NSDate *)v11;
}

- (NSArray)remoteParticipants
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  IMAVChatParticipantProxy *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("RemoteParticipants"), v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v5;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
        v14 = [IMAVChatParticipantProxy alloc];
        v20 = (void *)objc_msgSend_initWithDictionary_chat_(v14, v15, v13, (uint64_t)self, v16, (_QWORD)v23);
        if (v20)
          objc_msgSend_addObject_(v6, v17, (uint64_t)v20, v18, v19);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v21, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v10);
  }

  return (NSArray *)v6;
}

- (IMHandle)initiatorIMHandle
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("Initiator"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__imHandleFromProxyRepresentation_(IMAVChat, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMHandle *)v8;
}

- (IMHandle)otherIMHandle
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("Other"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__imHandleFromProxyRepresentation_(IMAVChat, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMHandle *)v8;
}

- (BOOL)_isProxy
{
  return 1;
}

- (BOOL)isActive
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_state(self, a2, v2, v3, v4) - 1 < 4;
}

- (BOOL)isCaller
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("IsCaller"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isVideo
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("IsVideo"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isMute
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("IsMute"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setMute:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  __CFDictionary *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t isVideo;
  const char *v33;
  _DWORD v34[2];
  __int16 v35;
  IMAVChatProxy *v36;
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v34[0] = 67109378;
    v34[1] = v3;
    v35 = 2112;
    v36 = self;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Client called setMute %d on chat proxy %@", (uint8_t *)v34, 0x12u);
  }

  v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = objc_alloc(MEMORY[0x24BDD16E0]);
  v16 = (void *)objc_msgSend_initWithDouble_(v7, v8, v9, v10, v11, (double)v3);
  if (v16)
    CFDictionarySetValue(v6, CFSTR("IsMute"), v16);
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v12, v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  isVideo = objc_msgSend_isVideo(self, v28, v29, v30, v31);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v17, v33, (uint64_t)v22, 9, (uint64_t)v6, v27, isVideo);

}

- (unsigned)endedReason
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("EndedReason"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int)endedError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("EndedError"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_intValue(v4, v5, v6, v7, v8);

  return v9;
}

- (double)invitationTimeoutTime
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("InvitationTimeoutTime"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v4, v5, v6, v7, v8);
  v10 = v9;

  return v10;
}

- (void)setInvitationTimeoutTime:(double)a3
{
  NSObject *v5;
  __CFDictionary *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t isVideo;
  const char *v33;
  int v34;
  double v35;
  __int16 v36;
  IMAVChatProxy *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 134218242;
    v35 = a3;
    v36 = 2112;
    v37 = self;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Client called setInvitationTimeoutTime %f on chat proxy %@", (uint8_t *)&v34, 0x16u);
  }

  v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = objc_alloc(MEMORY[0x24BDD16E0]);
  v16 = (void *)objc_msgSend_initWithDouble_(v7, v8, v9, v10, v11, a3);
  if (v16)
    CFDictionarySetValue(v6, CFSTR("InvitationTimeoutTime"), v16);
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v12, v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  isVideo = objc_msgSend_isVideo(self, v28, v29, v30, v31);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v17, v33, (uint64_t)v22, 7, (uint64_t)v6, v27, isVideo);

}

- (double)connectionTimeoutTime
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("ConnectionTimeoutTime"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v4, v5, v6, v7, v8);
  v10 = v9;

  return v10;
}

- (void)setConnectionTimeoutTime:(double)a3
{
  NSObject *v5;
  __CFDictionary *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t isVideo;
  const char *v33;
  int v34;
  double v35;
  __int16 v36;
  IMAVChatProxy *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 134218242;
    v35 = a3;
    v36 = 2112;
    v37 = self;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Client called setConnectionTimeoutTime %f on chat proxy %@", (uint8_t *)&v34, 0x16u);
  }

  v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = objc_alloc(MEMORY[0x24BDD16E0]);
  v16 = (void *)objc_msgSend_initWithDouble_(v7, v8, v9, v10, v11, a3);
  if (v16)
    CFDictionarySetValue(v6, CFSTR("ConnectionTimeoutTime"), v16);
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v12, v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  isVideo = objc_msgSend_isVideo(self, v28, v29, v30, v31);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v17, v33, (uint64_t)v22, 8, (uint64_t)v6, v27, isVideo);

}

- (BOOL)isRelayed
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("IsRelayed"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setRelayed:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t isVideo;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int isRelayed;
  int v42;
  _BOOL4 v43;
  __int16 v44;
  IMAVChatProxy *v45;
  uint64_t v46;

  v3 = a3;
  v46 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v42 = 67109378;
    v43 = v3;
    v44 = 2112;
    v45 = self;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Client called setRelayed %d on chat proxy %@", (uint8_t *)&v42, 0x12u);
  }

  if (objc_msgSend_isRelayed(self, v6, v7, v8, v9) == v3)
  {
    sub_2190076D0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      isRelayed = objc_msgSend_isRelayed(self, v37, v38, v39, v40);
      v42 = 67109120;
      v43 = isRelayed;
      _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "Not updating relayed value because it is already %d", (uint8_t *)&v42, 8u);
    }
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v11 = objc_alloc(MEMORY[0x24BDD16E0]);
    v19 = (void *)objc_msgSend_initWithBool_(v11, v12, v3, v13, v14);
    if (v19)
      CFDictionarySetValue((CFMutableDictionaryRef)v10, CFSTR("IsRelayed"), v19);
    objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v15, v16, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(self, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_GUID(self, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    isVideo = objc_msgSend_isVideo(self, v31, v32, v33, v34);
    objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v20, v36, (uint64_t)v25, 10, (uint64_t)v10, v30, isVideo);

  }
}

- (BOOL)_isCallUpgradeTo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v4 = a3;
  objc_msgSend_otherIMHandle(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ID(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ID(v4, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = MEMORY[0x219A28364](v14, v19);
  return (char)v4;
}

- (void)inviteAll
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t isVideo;
  const char *v24;
  int v25;
  IMAVChatProxy *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Client called inviteAll on chat proxy %@", (uint8_t *)&v25, 0xCu);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isVideo = objc_msgSend_isVideo(self, v19, v20, v21, v22);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v8, v24, (uint64_t)v13, 5, 0, v18, isVideo);

}

- (void)invite:(id)a3 additionalPeers:(id)a4
{
  objc_msgSend_invite_additionalPeers_excludingPushTokens_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (void)invite:(id)a3 additionalPeers:(id)a4 excludingPushTokens:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  __CFDictionary *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t isVideo;
  const char *v37;
  int v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  IMAVChatProxy *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  sub_2190076D0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 138413058;
    v39 = v8;
    v40 = 2112;
    v41 = v9;
    v42 = 2112;
    v43 = v10;
    v44 = 2112;
    v45 = self;
    _os_log_impl(&dword_218FEA000, v11, OS_LOG_TYPE_DEFAULT, "Client called invite %@ additionalPeers %@ excludingPushTokens %@ on chat proxy %@", (uint8_t *)&v38, 0x2Au);
  }

  v12 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend__proxyRepresentationForIMHandle_(IMAVChat, v13, (uint64_t)v8, v14, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    CFDictionarySetValue(v12, CFSTR("Buddy"), v20);
  if (v9)
    CFDictionarySetValue(v12, CFSTR("AdditionalPeers"), v9);
  if (v10)
    CFDictionarySetValue(v12, CFSTR("ExcludingPushTokens"), v10);
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v16, v17, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(self, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  isVideo = objc_msgSend_isVideo(self, v32, v33, v34, v35);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v21, v37, (uint64_t)v26, 6, (uint64_t)v12, v31, isVideo);

}

- (void)acceptInvitation
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t isVideo;
  const char *v24;
  int v25;
  IMAVChatProxy *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Client called acceptInvitation on chat proxy %@", (uint8_t *)&v25, 0xCu);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isVideo = objc_msgSend_isVideo(self, v19, v20, v21, v22);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v8, v24, (uint64_t)v13, 1, 0, v18, isVideo);

}

- (void)cancelInvitation
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t isVideo;
  const char *v24;
  int v25;
  IMAVChatProxy *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Client called cancelInvitation on chat proxy %@", (uint8_t *)&v25, 0xCu);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isVideo = objc_msgSend_isVideo(self, v19, v20, v21, v22);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v8, v24, (uint64_t)v13, 3, 0, v18, isVideo);

}

- (void)declineInvitation
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t isVideo;
  const char *v24;
  int v25;
  IMAVChatProxy *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Client called declineInvitation on chat proxy %@", (uint8_t *)&v25, 0xCu);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isVideo = objc_msgSend_isVideo(self, v19, v20, v21, v22);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v8, v24, (uint64_t)v13, 2, 0, v18, isVideo);

}

- (void)endChat
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  IMAVChatProxy *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Client called endChat on chat proxy %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend_endChatWithReason_(self, v4, 0, v5, v6);
}

- (void)endChatWithReason:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFDictionary *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t isVideo;
  const char *v36;
  int v37;
  void *v38;
  __int16 v39;
  IMAVChatProxy *v40;
  uint64_t v41;

  v3 = *(_QWORD *)&a3;
  v41 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _NSStringDescriptionForIMAVChatEndedReason(v3, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138412546;
    v38 = v10;
    v39 = 2112;
    v40 = self;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Client called endChatWithReason %@ on chat proxy %@", (uint8_t *)&v37, 0x16u);

  }
  v11 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v12, v3, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v11, CFSTR("EndedReason"), v15);

  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(self, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  isVideo = objc_msgSend_isVideo(self, v31, v32, v33, v34);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v20, v36, (uint64_t)v25, 4, (uint64_t)v11, v30, isVideo);

}

- (void)finalUpdate
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t v24[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Proxy is going away faking a state change to ended", v24, 2u);
  }

  v8 = (void *)objc_msgSend_mutableCopy(self->_info, v4, v5, v6, v7);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v9, 5, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v13, (uint64_t)v12, (uint64_t)CFSTR("State"), v14);

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v15, 1, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v19, (uint64_t)v18, (uint64_t)CFSTR("IsStateFinal"), v20);

  objc_msgSend_updateWithInfo_(self, v21, (uint64_t)v8, v22, v23);
}

- (void)updateWithInfo:(id)a3
{
  __CFString *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  void *v94;
  __CFString *v95;
  NSObject *v96;
  const __CFString *v97;
  const __CFString *v98;
  NSObject *v99;
  int v100;
  const __CFString *v101;
  const __CFString *v102;
  NSObject *v103;
  const __CFString *v104;
  const __CFString *v105;
  NSObject *v106;
  const __CFString *v107;
  const __CFString *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  int isVideo;
  NSObject *v115;
  _BOOL4 v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  NSObject *v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  IMAVChatProxy *v151;
  uint64_t v152;
  uint64_t i;
  void *v154;
  NSObject *v155;
  char v156;
  NSObject *v157;
  _BOOL4 v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  NSObject *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  unint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  NSObject *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  void *v196;
  const char *v197;
  NSObject *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  NSObject *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  NSObject *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  NSObject *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  __CFString *v236;
  int v237;
  int v238;
  int v239;
  int isMute;
  int isSendingAudio;
  int v242;
  int v243;
  int v244;
  int v245;
  unsigned int v246;
  int v247;
  unsigned int v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  uint8_t v253[128];
  uint8_t buf[4];
  _BYTE v255[10];
  const __CFString *v256;
  uint64_t v257;

  v257 = *MEMORY[0x24BDAC8D0];
  v5 = (__CFString *)a3;
  sub_2190076D0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v255 = self;
    *(_WORD *)&v255[8] = 2112;
    v256 = v5;
    _os_log_impl(&dword_218FEA000, v6, OS_LOG_TYPE_DEFAULT, "Updating proxy %@ with info %@", buf, 0x16u);
  }

  v246 = objc_msgSend_state(self, v7, v8, v9, v10);
  objc_msgSend_remoteParticipants(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v243 = objc_msgSend__inviteDelivered(v20, v21, v22, v23, v24);

  isMute = objc_msgSend_isMute(self, v25, v26, v27, v28);
  isSendingAudio = objc_msgSend_isSendingAudio(self, v29, v30, v31, v32);
  objc_msgSend_objectForKey_(self->_info, v33, (uint64_t)CFSTR("MetadataFinalized"), v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_BOOLValue(v36, v37, v38, v39, v40);

  objc_msgSend_objectForKey_(self->_info, v42, (uint64_t)CFSTR("HasReceivedFirstFrame"), v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_BOOLValue(v45, v46, v47, v48, v49);

  objc_storeStrong((id *)&self->_info, a3);
  v248 = objc_msgSend_state(self, v51, v52, v53, v54);
  objc_msgSend_remoteParticipants(self, v55, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v59, v60, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v242 = objc_msgSend__inviteDelivered(v64, v65, v66, v67, v68);

  v239 = objc_msgSend_isMute(self, v69, v70, v71, v72);
  v247 = objc_msgSend_isSendingAudio(self, v73, v74, v75, v76);
  objc_msgSend_objectForKey_(v5, v77, (uint64_t)CFSTR("MetadataFinalized"), v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v244 = objc_msgSend_BOOLValue(v80, v81, v82, v83, v84);

  objc_msgSend_objectForKey_(self->_info, v85, (uint64_t)CFSTR("HasReceivedFirstFrame"), v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v245 = objc_msgSend_BOOLValue(v88, v89, v90, v91, v92);

  sub_2190076D0();
  v93 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    _NSStringDescriptionForIMAVChatState(v246);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    _NSStringDescriptionForIMAVChatState(v248);
    v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v255 = v94;
    *(_WORD *)&v255[8] = 2112;
    v256 = v95;
    _os_log_impl(&dword_218FEA000, v93, OS_LOG_TYPE_DEFAULT, "Old state %@, new state %@", buf, 0x16u);

  }
  sub_2190076D0();
  v96 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
    if (v243)
      v97 = CFSTR("YES");
    else
      v97 = CFSTR("NO");
    if (v242)
      v98 = CFSTR("YES");
    else
      v98 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v255 = v97;
    *(_WORD *)&v255[8] = 2112;
    v256 = v98;
    _os_log_impl(&dword_218FEA000, v96, OS_LOG_TYPE_DEFAULT, "Old delivered %@, new  %@", buf, 0x16u);
  }

  sub_2190076D0();
  v99 = objc_claimAutoreleasedReturnValue();
  v100 = isSendingAudio;
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    if (isSendingAudio)
      v101 = CFSTR("YES");
    else
      v101 = CFSTR("NO");
    if (v247)
      v102 = CFSTR("YES");
    else
      v102 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v255 = v101;
    *(_WORD *)&v255[8] = 2112;
    v256 = v102;
    _os_log_impl(&dword_218FEA000, v99, OS_LOG_TYPE_DEFAULT, "Old sendingAudio %@, new %@", buf, 0x16u);
  }

  sub_2190076D0();
  v103 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
  {
    if (v41)
      v104 = CFSTR("YES");
    else
      v104 = CFSTR("NO");
    if (v244)
      v105 = CFSTR("YES");
    else
      v105 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v255 = v104;
    *(_WORD *)&v255[8] = 2112;
    v256 = v105;
    _os_log_impl(&dword_218FEA000, v103, OS_LOG_TYPE_DEFAULT, "Old metadataFinalized %@, new %@", buf, 0x16u);
  }

  sub_2190076D0();
  v106 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    if (v50)
      v107 = CFSTR("YES");
    else
      v107 = CFSTR("NO");
    if (v245)
      v108 = CFSTR("YES");
    else
      v108 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v255 = v107;
    *(_WORD *)&v255[8] = 2112;
    v256 = v108;
    _os_log_impl(&dword_218FEA000, v106, OS_LOG_TYPE_DEFAULT, "Old hasReceivedFirstRemoteFrame %@, new %@", buf, 0x16u);
  }

  v113 = 0x24BDD1000uLL;
  if (v246 != v248)
  {
    isVideo = objc_msgSend_isVideo(self, v109, v110, v111, v112);
    sub_2190076D0();
    v115 = objc_claimAutoreleasedReturnValue();
    v116 = os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT);
    if (isVideo)
    {
      if (v116)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v115, OS_LOG_TYPE_DEFAULT, "Kicking off AV call state update", buf, 2u);
      }

      objc_msgSend_sharedInstance(IMAVCallManager, v117, v118, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__updateAVCallState(v121, v122, v123, v124, v125);
    }
    else
    {
      if (v116)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v115, OS_LOG_TYPE_DEFAULT, "Kicking off AC call state update", buf, 2u);
      }

      objc_msgSend_sharedInstance(IMAVCallManager, v126, v127, v128, v129);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__updateACCallState(v121, v130, v131, v132, v133);
    }

    if (v248 == 1)
    {
      v238 = v41;
      if ((objc_msgSend_isCaller(self, v134, v135, v136, v137) & 1) != 0)
      {
        sub_2190076D0();
        v142 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v255 = self;
          _os_log_impl(&dword_218FEA000, v142, OS_LOG_TYPE_DEFAULT, " => Proxy is an outgoing chat, not notifying as invited: %@", buf, 0xCu);
        }
      }
      else
      {
        v237 = v50;
        v251 = 0u;
        v252 = 0u;
        v249 = 0u;
        v250 = 0u;
        objc_msgSend_sharedInstance(IMAVController, v138, v139, v140, v141);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_delegates(v143, v144, v145, v146, v147);
        v142 = objc_claimAutoreleasedReturnValue();

        v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(v142, v148, (uint64_t)&v249, (uint64_t)v253, 16);
        if (v149)
        {
          v150 = v149;
          v151 = self;
          v236 = v5;
          v152 = *(_QWORD *)v250;
          do
          {
            for (i = 0; i != v150; ++i)
            {
              if (*(_QWORD *)v250 != v152)
                objc_enumerationMutation(v142);
              v154 = *(void **)(*((_QWORD *)&v249 + 1) + 8 * i);
              sub_2190076D0();
              v155 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v255 = v154;
                _os_log_impl(&dword_218FEA000, v155, OS_LOG_TYPE_DEFAULT, "Checking delegate: %@", buf, 0xCu);
              }

              v156 = objc_opt_respondsToSelector();
              sub_2190076D0();
              v157 = objc_claimAutoreleasedReturnValue();
              v158 = os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT);
              if ((v156 & 1) != 0)
              {
                if (v158)
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v255 = v154;
                  _os_log_impl(&dword_218FEA000, v157, OS_LOG_TYPE_DEFAULT, " => Dispatching to delegate: %@", buf, 0xCu);
                }

                objc_msgSend_invitedToIMAVChat_(v154, v159, (uint64_t)v151, v160, v161);
              }
              else
              {
                if (v158)
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v255 = v154;
                  _os_log_impl(&dword_218FEA000, v157, OS_LOG_TYPE_DEFAULT, " => **NOT** Dispatching to delegate: %@", buf, 0xCu);
                }

              }
            }
            v150 = objc_msgSend_countByEnumeratingWithState_objects_count_(v142, v162, (uint64_t)&v249, (uint64_t)v253, 16);
          }
          while (v150);
          v5 = v236;
          self = v151;
          v50 = v237;
          v100 = isSendingAudio;
          v113 = 0x24BDD1000;
        }
      }

      v41 = v238;
    }
    sub_2190076D0();
    v163 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v255 = v246;
      *(_WORD *)&v255[4] = 1024;
      *(_DWORD *)&v255[6] = v248;
      _os_log_impl(&dword_218FEA000, v163, OS_LOG_TYPE_DEFAULT, "Posting proxy state changed notification from %d to %d", buf, 0xEu);
    }

    objc_msgSend_defaultCenter(*(void **)(v113 + 1744), v164, v165, v166, v167);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v170, v248, v171, v172);
    v173 = v113;
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObjectsAndKeys_(v169, v175, (uint64_t)v174, v176, v177, CFSTR("__kIMAVChatStateKey"), 0);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v168, v179, (uint64_t)CFSTR("__kIMAVChatStateChangedNotification"), (uint64_t)self, (uint64_t)v178);

    v113 = v173;
  }
  if (((v242 ^ 1 | v243) & 1) == 0)
  {
    sub_2190076D0();
    v180 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v180, OS_LOG_TYPE_DEFAULT, "Posting proxy participant notification delivered", buf, 2u);
    }

    objc_msgSend_defaultCenter(*(void **)(v113 + 1744), v181, v182, v183, v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteParticipants(self, v186, v187, v188, v189);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v190, v191, v192, v193, v194);
    v195 = v113;
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v185, v197, (uint64_t)CFSTR("__kIMAVChatParticipantInvitationDeliveredNotification"), (uint64_t)v196, 0);

    v113 = v195;
  }
  if (isMute != v239)
  {
    sub_2190076D0();
    v198 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v198, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v255 = isMute;
      *(_WORD *)&v255[4] = 1024;
      *(_DWORD *)&v255[6] = v239;
      _os_log_impl(&dword_218FEA000, v198, OS_LOG_TYPE_DEFAULT, "Posting proxy is mute changed notification from %d to %d", buf, 0xEu);
    }

    objc_msgSend_defaultCenter(*(void **)(v113 + 1744), v199, v200, v201, v202);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v203, v204, (uint64_t)CFSTR("__kIMAVChatIsMutedChangedNotification"), (uint64_t)self, 0);

  }
  if (v100 != v247)
  {
    sub_2190076D0();
    v205 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v255 = v100;
      *(_WORD *)&v255[4] = 1024;
      *(_DWORD *)&v255[6] = v247;
      _os_log_impl(&dword_218FEA000, v205, OS_LOG_TYPE_DEFAULT, "Posting proxy sending audio changed notification from %d to %d", buf, 0xEu);
    }

    objc_msgSend_defaultCenter(*(void **)(v113 + 1744), v206, v207, v208, v209);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v210, v211, (uint64_t)CFSTR("__kIMAVChatSendingAudioChangedNotification"), (uint64_t)self, 0);

  }
  if (((v244 ^ 1 | v41) & 1) == 0)
  {
    sub_2190076D0();
    v212 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v212, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v212, OS_LOG_TYPE_DEFAULT, "Posting proxy conference metadata updated notification", buf, 2u);
    }

    objc_msgSend_defaultCenter(*(void **)(v113 + 1744), v213, v214, v215, v216);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v217, v218, (uint64_t)CFSTR("__kIMAVChatConferenceMetadataUpdatedNotification"), (uint64_t)self, 0);

  }
  if (((v245 ^ 1 | v50) & 1) == 0)
  {
    sub_2190076D0();
    v219 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v219, OS_LOG_TYPE_DEFAULT, "Posting proxy participant received first frame notification", buf, 2u);
    }

    objc_msgSend_defaultCenter(*(void **)(v113 + 1744), v220, v221, v222, v223);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteParticipants(self, v225, v226, v227, v228);
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v229, v230, v231, v232, v233);
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v224, v235, (uint64_t)CFSTR("__kIMAVChatParticipantReceivedFirstFrameNotification"), (uint64_t)v234, 0);

  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, SEL))MEMORY[0x24BEDD108])(IMAVChat, sel_instanceMethodSignatureForSelector_, a3);
}

- (void)forwardInvocation:(id)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (const char *)objc_msgSend_selector(v3, v5, v6, v7, v8);
    NSStringFromSelector(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] ********** IMAVChatProxy does not respond to selector %@, please file a radar **********", (uint8_t *)&v11, 0xCu);

  }
  IMLogBacktrace();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

@end
