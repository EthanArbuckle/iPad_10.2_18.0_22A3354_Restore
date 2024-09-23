@implementation IMAVChatParticipant

- (IMAVChatParticipant)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;

  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("IMAVChatParticipant.m"), 51, CFSTR("-[IMAVChatParticipant init] should never be called!"));

  return 0;
}

- (id)_initAs:(id)a3 invitedBy:(id)a4 sendingAudio:(BOOL)a5 sendingVideo:(BOOL)a6 usingICE:(BOOL)a7 toChat:(id)a8 inState:(unsigned int)a9 withError:(int)a10 andReason:(unsigned int)a11 andVCPartyID:(id)a12 account:(id)a13
{
  id v20;
  id v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  IMAVChatParticipant *v28;
  NSMutableArray *v29;
  NSMutableArray *participantsCallInfo;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSString *conferenceID;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  NSData *inFrequencyLevel;
  NSData *outFrequencyLevel;
  IMAVChatParticipant *v64;
  void *v66;
  const char *v67;
  BOOL v68;
  objc_super v69;

  v20 = a3;
  v21 = a4;
  v22 = a8;
  v23 = a12;
  v69.receiver = self;
  v69.super_class = (Class)IMAVChatParticipant;
  v28 = -[IMAVChatParticipant init](&v69, sel_init);
  if (v28)
  {
    v68 = a6;
    if (!v20 || !v21 || !v22)
    {
      objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v24, v25, v26, v27);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v66, v67, (uint64_t)a2, (uint64_t)v28, (uint64_t)CFSTR("IMAVChatParticipant.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(imHandle != nil) && (inviter != nil) && (chat != nil)"));

    }
    if (!v28->_participantsCallInfo)
    {
      v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      participantsCallInfo = v28->_participantsCallInfo;
      v28->_participantsCallInfo = v29;

    }
    objc_storeStrong((id *)&v28->_imHandle, a3);
    objc_storeStrong((id *)&v28->_inviter, a4);
    objc_msgSend_setAVChat_(v28, v31, (uint64_t)v22, v32, v33);
    objc_msgSend_conferenceID(v22, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend_copy(v38, v39, v40, v41, v42);
    conferenceID = v28->_conferenceID;
    v28->_conferenceID = (NSString *)v43;

    objc_msgSend__setScreenOrientation_(v28, v45, 0, v46, v47);
    __asm { FMOV            V0.2D, #-1.0 }
    v28->_remotePortraitOrientation = _Q0;
    v28->_remoteLandscapeOrientation = _Q0;
    v28->_sendingAudio = a5;
    v28->_sendingVideo = v68;
    objc_msgSend__setCameraType_(v28, v53, 0, v54, v55);
    objc_msgSend__setCameraOrientation_(v28, v56, 0, v57, v58);
    v28->_isInitiator = v20 == v21;
    objc_msgSend_setVCPartyID_(v28, v59, (uint64_t)v23, v60, v61);
    v28->_state = a9;
    v28->_chatEndedReason = a11;
    inFrequencyLevel = v28->_inFrequencyLevel;
    v28->_inFrequencyLevel = 0;

    outFrequencyLevel = v28->_outFrequencyLevel;
    v28->_outFrequencyLevel = 0;

    v64 = v28;
  }

  return v28;
}

- (void)_registerCallInfo:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *participantsCallInfo;
  NSMutableArray *v8;
  NSMutableArray *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;

  v4 = (const char *)a3;
  participantsCallInfo = self->_participantsCallInfo;
  v13 = (char *)v4;
  if (!participantsCallInfo)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = self->_participantsCallInfo;
    self->_participantsCallInfo = v8;

    v4 = v13;
    participantsCallInfo = self->_participantsCallInfo;
  }
  if ((objc_msgSend_containsObjectIdenticalTo_(participantsCallInfo, v4, (uint64_t)v4, v5, v6) & 1) == 0)
    objc_msgSend_addObject_(self->_participantsCallInfo, v10, (uint64_t)v13, v11, v12);

}

- (id)callInfoBeingHandedOff
{
  void *v3;
  NSMutableArray *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x219A284CC](self, a2);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_participantsCallInfo;
  v10 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend_isBeingHandedOff(v13, v6, v7, v8, v9, (_QWORD)v15) & 1) != 0)
        {
          v10 = v13;
          goto LABEL_11;
        }
      }
      v10 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v15, (uint64_t)v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  objc_autoreleasePoolPop(v3);
  return v10;
}

- (BOOL)matchesAVConferenceCallID:(int64_t)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;

  v5 = (void *)MEMORY[0x219A284CC](self, a2);
  if (objc_msgSend_count(self->_participantsCallInfo, v6, v7, v8, v9))
  {
    objc_msgSend__callInfoForCallID_(self, v10, a3, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;

  }
  else
  {
    v14 = 0;
  }
  objc_autoreleasePoolPop(v5);
  return v14;
}

- (BOOL)hasUnfinishedSessions
{
  NSMutableArray *v2;
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = self->_participantsCallInfo;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v2);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend_state(v11, v4, v5, v6, v7, (_QWORD)v13) != 4 && objc_msgSend_state(v11, v4, v5, v6, v7))
        {
          LOBYTE(v8) = 1;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v4, (uint64_t)&v13, (uint64_t)v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  return v8;
}

- (BOOL)hasConnectingSessions
{
  NSMutableArray *v2;
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_participantsCallInfo;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v2);
        if (objc_msgSend_state(*(void **)(*((_QWORD *)&v12 + 1) + 8 * i), v4, v5, v6, v7, (_QWORD)v12) < 3)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v4, (uint64_t)&v12, (uint64_t)v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (BOOL)hasReinitiateCapability
{
  return self->_hasReinitiateCapability;
}

- (int64_t)bestCallID
{
  NSMutableArray *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  unsigned int v31;
  unsigned int v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v2 = self->_participantsCallInfo;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v38, (uint64_t)v42, 16);
  if (!v4)
  {
    v32 = 0;
    goto LABEL_22;
  }
  v9 = v4;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v39 != v13)
        objc_enumerationMutation(v2);
      v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      if ((objc_msgSend_isFinished(v15, v5, v6, v7, v8, (_QWORD)v38) & 1) == 0)
      {
        v20 = v15;

        v12 = v20;
      }
      if ((objc_msgSend_isFinished(v15, v16, v17, v18, v19) & 1) == 0
        && (objc_msgSend_isBeingHandedOff(v15, v21, v22, v23, v24) & 1) == 0)
      {
        v25 = v15;

        v10 = v25;
      }
      if (objc_msgSend_state(v15, v21, v22, v23, v24) <= 2)
      {
        v30 = v15;

        v11 = v30;
      }
      v31 = objc_msgSend_callID(v15, v26, v27, v28, v29);
    }
    v32 = v31;
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v38, (uint64_t)v42, 16);
  }
  while (v9);

  if (v10)
  {
    v32 = objc_msgSend_callID(v10, v33, v34, v35, v36);

    v2 = v10;
LABEL_22:

    return v32;
  }
  if (v11)
  {
    v32 = objc_msgSend_callID(v11, v33, v34, v35, v36);

    v2 = v11;
    goto LABEL_22;
  }
  if (v12)
  {
    v32 = objc_msgSend_callID(v12, v33, v34, v35, v36);
    v2 = v12;
    goto LABEL_22;
  }
  return v32;
}

- (id)_callInfoForCallID:(int64_t)a3
{
  NSMutableArray *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_participantsCallInfo;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v6)
  {
    v11 = v6;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v4);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend_callID(v14, v7, v8, v9, v10, (_QWORD)v17) == a3)
        {
          v15 = v14;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (id)initAs:(id)a3 invitedBy:(id)a4 toChat:(id)a5 account:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t isVideo;
  unint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t hasCapability;
  void *v51;
  const char *v52;
  void *inited;
  int v55;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend_isLoginIMHandle(v10, v14, v15, v16, v17))
  {
    objc_msgSend_sharedInstance(IMAVController, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_microphoneCapable(v22, v23, v24, v25, v26);

    if (objc_msgSend_isVideo(v12, v28, v29, v30, v31))
    {
      objc_msgSend_sharedInstance(IMAVController, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      isVideo = objc_msgSend_cameraCapable(v36, v37, v38, v39, v40);

    }
    else
    {
      isVideo = 0;
    }
    hasCapability = 0;
  }
  else if (v10 == v11)
  {
    isVideo = objc_msgSend_isVideo(v12, v18, v19, v20, v21);
    hasCapability = 0;
    v27 = 1;
  }
  else
  {
    v42 = objc_msgSend_capabilities(v10, v18, v19, v20, v21);
    v27 = (v42 >> 19) & 1;
    isVideo = objc_msgSend_isVideo(v12, v43, v44, v45, v46) & ((v42 & 0x40000) != 0);
    hasCapability = objc_msgSend_hasCapability_(v10, v47, 0x2000000000, v48, v49);
  }
  objc_msgSend_vcPartyIDForIMHandle_(v12, v32, (uint64_t)v10, v34, v35);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  inited = (void *)objc_msgSend__initAs_invitedBy_sendingAudio_sendingVideo_usingICE_toChat_inState_withError_andReason_andVCPartyID_account_(self, v52, (uint64_t)v10, (uint64_t)v11, v27, isVideo, hasCapability, v12, 0, v55, v51, v13);

  return inited;
}

- (void)disconnectFromAVChat
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_setAVChat_(self, a2, 0, v2, v3);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int isVideo;
  __CFString *v12;
  __CFString *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
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
  void *v29;

  objc_msgSend_avChat(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isVideo = objc_msgSend_isVideo(v6, v7, v8, v9, v10);
  v12 = CFSTR("an audio");
  if (isVideo)
    v12 = CFSTR("a video");
  v13 = v12;

  v18 = CFSTR("has been invited to");
  switch(self->_state)
  {
    case 0u:

      v18 = CFSTR("is not yet involved in");
      v13 = CFSTR("a");
      break;
    case 1u:
      break;
    case 2u:
      v18 = CFSTR("is waiting for others to join");
      break;
    case 3u:
      v18 = CFSTR("is connecting to");
      break;
    case 4u:
      v18 = CFSTR("is connected to");
      break;
    case 5u:

      v18 = CFSTR("has left");
      v13 = CFSTR("the");
      break;
    default:

      v18 = CFSTR("is in an invalid state");
      v13 = CFSTR("for a");
      break;
  }
  v19 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_imHandle(self, v14, v15, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vcPartyID(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v19, v26, (uint64_t)CFSTR("%@ %@ %@ %@ chat (%p)"), v27, v28, v20, v18, v13, v25, self);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  NSData *inFrequencyLevel;
  NSData *outFrequencyLevel;
  NSMutableArray *participantsCallInfo;
  NSArray *additionalPeers;
  NSArray *excludingPushTokens;
  NSDictionary *properties;
  IMHandle *imHandle;
  IMHandle *inviter;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;
  uint8_t buf[4];
  IMAVChatParticipant *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "participant: %@", buf, 0xCu);
  }

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v8, v9, (uint64_t)self, 0, 0);

  inFrequencyLevel = self->_inFrequencyLevel;
  self->_inFrequencyLevel = 0;

  outFrequencyLevel = self->_outFrequencyLevel;
  self->_outFrequencyLevel = 0;

  participantsCallInfo = self->_participantsCallInfo;
  self->_participantsCallInfo = 0;

  additionalPeers = self->_additionalPeers;
  self->_additionalPeers = 0;

  excludingPushTokens = self->_excludingPushTokens;
  self->_excludingPushTokens = 0;

  properties = self->_properties;
  self->_properties = 0;

  imHandle = self->_imHandle;
  self->_imHandle = 0;

  inviter = self->_inviter;
  self->_inviter = 0;

  objc_msgSend_disconnectFromAVChat(self, v18, v19, v20, v21);
  objc_msgSend_setVCPartyID_(self, v22, 0, v23, v24);
  v25.receiver = self;
  v25.super_class = (Class)IMAVChatParticipant;
  -[IMAVChatParticipant dealloc](&v25, sel_dealloc);
}

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSString *)objc_msgSend_name(self->_imHandle, a2, v2, v3, v4);
}

- (BOOL)isLocalParticipant
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  IMAVChatParticipant *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IMAVChatParticipant *v11;

  v5 = self;
  objc_msgSend_avChat(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localParticipant(v6, v7, v8, v9, v10);
  v11 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v11 == v5;

  return (char)v5;
}

- (void)requestIconIfNecessary
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
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  IMAVChatParticipant *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "participant: %@", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend_imHandle(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isBuddy(v8, v9, v10, v11, v12) & 1) == 0)
    objc_msgSend_requestValueOfProperty_(v8, v13, *MEMORY[0x24BE50448], v14, v15);

}

- (id)_callInfoWithState:(int64_t)a3
{
  NSMutableArray *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_participantsCallInfo;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v6)
  {
    v11 = v6;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v4);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend_state(v14, v7, v8, v9, v10, (_QWORD)v17) == a3)
        {
          v15 = v14;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (id)_callInfosWaitingForAcceptAction
{
  id v3;
  NSMutableArray *participantsCallInfo;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  participantsCallInfo = self->_participantsCallInfo;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_218FF8144;
  v10[3] = &unk_24DA572A8;
  v5 = v3;
  v11 = v5;
  objc_msgSend_enumerateObjectsUsingBlock_(participantsCallInfo, v6, (uint64_t)v10, v7, v8);

  return v5;
}

- (id)_callInfosWaitingForResponse
{
  id v3;
  NSMutableArray *participantsCallInfo;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  participantsCallInfo = self->_participantsCallInfo;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_218FF8238;
  v10[3] = &unk_24DA572A8;
  v5 = v3;
  v11 = v5;
  objc_msgSend_enumerateObjectsUsingBlock_(participantsCallInfo, v6, (uint64_t)v10, v7, v8);

  return v5;
}

- (id)_processIncomingCallProperties:(id)a3
{
  id v4;
  NSObject *v5;
  IMAVChatParticipantCallInfo *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  int v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v65 = 138412290;
    v66 = v4;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "_processIncomingCallProperties: %@", (uint8_t *)&v65, 0xCu);
  }

  v6 = objc_alloc_init(IMAVChatParticipantCallInfo);
  objc_msgSend_objectForKey_(v4, v7, *MEMORY[0x24BE50478], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteICEData_(v6, v11, (uint64_t)v10, v12, v13);

  objc_msgSend_objectForKey_(v4, v14, *MEMORY[0x24BE50498], v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteNATType_(v6, v18, (uint64_t)v17, v19, v20);

  objc_msgSend_objectForKey_(v4, v21, *MEMORY[0x24BE50490], v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteNATIP_(v6, v25, (uint64_t)v24, v26, v27);

  objc_msgSend_objectForKey_(v4, v28, *MEMORY[0x24BE50458], v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPeerCN_(v6, v32, (uint64_t)v31, v33, v34);

  objc_msgSend_objectForKey_(v4, v35, *MEMORY[0x24BE504E8], v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteSKEData_(v6, v39, (uint64_t)v38, v40, v41);

  objc_msgSend_objectForKey_(v4, v42, *MEMORY[0x24BE504C8], v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPeerProtocolVersion_(v6, v46, (uint64_t)v45, v47, v48);

  objc_msgSend__registerCallInfo_(self, v49, (uint64_t)v6, v50, v51);
  objc_msgSend_objectForKey_(v4, v52, *MEMORY[0x24BE50470], v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend_BOOLValue(v55, v56, v57, v58, v59);
  objc_msgSend_setHasReinitiateCapability_(self, v61, v60, v62, v63);

  return v6;
}

- (BOOL)_processResponseDictionary:(id)a3 allowSecondConnection:(BOOL)a4
{
  _BOOL4 v4;
  IMAVChatParticipant *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  IMAVChatParticipant *v31;
  __CFDictionary *v32;
  const void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unsigned int v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  IMAVChatParticipant *v121;
  __CFDictionary *v122;
  _BOOL4 v123;
  IMAVChatParticipant *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  NSObject *v132;
  IMAVChatParticipant *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  IMAVChatParticipant *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unsigned int v152;
  const char *v153;
  uint64_t v154;
  NSObject *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  void *v192;
  uint8_t buf[4];
  IMAVChatParticipant *v194;
  __int16 v195;
  IMAVChatParticipant *v196;
  uint64_t v197;

  v4 = a4;
  v197 = *MEMORY[0x24BDAC8D0];
  v6 = (IMAVChatParticipant *)a3;
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v194 = v6;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "_processResponseDictionary: %@", buf, 0xCu);
  }

  objc_msgSend_objectForKey_(v6, v8, *MEMORY[0x24BE504E0], v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_dictionaryWithPlistData_(MEMORY[0x24BDBCE70], v11, (uint64_t)v14, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__callInfosWaitingForResponse(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imFirstObject(v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      sub_2190076D0();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend__participantsCallInfo(self, v27, v28, v29, v30);
        v31 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v194 = self;
        v195 = 2112;
        v196 = v31;
        _os_log_impl(&dword_218FEA000, v26, OS_LOG_TYPE_DEFAULT, "[WARN] *** No call info found for participant: %@  (All: %@)", buf, 0x16u);

      }
    }
    v32 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v33 = (const void *)*MEMORY[0x24BE504F8];
    objc_msgSend_objectForKey_(v15, v34, *MEMORY[0x24BE504F8], v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
      CFDictionarySetValue(v32, v33, v37);

    objc_msgSend_objectForKey_(v15, v38, *MEMORY[0x24BE50458], v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPeerCN_(v25, v42, (uint64_t)v41, v43, v44);

    objc_msgSend_objectForKey_(v15, v45, *MEMORY[0x24BE50478], v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteICEData_(v25, v49, (uint64_t)v48, v50, v51);

    objc_msgSend_objectForKey_(v15, v52, *MEMORY[0x24BE50498], v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteNATType_(v25, v56, (uint64_t)v55, v57, v58);

    objc_msgSend_objectForKey_(v15, v59, *MEMORY[0x24BE50490], v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteNATIP_(v25, v63, (uint64_t)v62, v64, v65);

    objc_msgSend_objectForKey_(v15, v66, *MEMORY[0x24BE50480], v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRelayInitiate_(v25, v70, (uint64_t)v69, v71, v72);

    objc_msgSend_objectForKey_(v15, v73, *MEMORY[0x24BE504E8], v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteSKEData_(v25, v77, (uint64_t)v76, v78, v79);

    objc_msgSend_objectForKey_(v15, v80, *MEMORY[0x24BE504C8], v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPeerProtocolVersion_(v25, v84, (uint64_t)v83, v85, v86);

    objc_msgSend_setState_(v25, v87, 1, v88, v89);
    if (objc_msgSend_count(v32, v90, v91, v92, v93))
      objc_msgSend_setProperties_(self, v94, (uint64_t)v32, v95, v96);
    objc_msgSend_objectForKey_(v6, v94, *MEMORY[0x24BE504D8], v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend_intValue(v97, v98, v99, v100, v101);

    v107 = objc_msgSend_state(self, v103, v104, v105, v106);
    objc_msgSend_objectForKey_(v15, v108, *MEMORY[0x24BE50470], v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend_BOOLValue(v111, v112, v113, v114, v115);
    objc_msgSend_setHasReinitiateCapability_(self, v117, v116, v118, v119);

    sub_2190076D0();
    v120 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringDescriptionForIMAVResponse(v102);
      v192 = v14;
      v121 = v6;
      v122 = v32;
      v123 = v4;
      v124 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v194 = v124;
      v195 = 2112;
      v196 = self;
      _os_log_impl(&dword_218FEA000, v120, OS_LOG_TYPE_DEFAULT, "Handling response: %@ from participant: %@", buf, 0x16u);

      v4 = v123;
      v32 = v122;
      v6 = v121;
      v14 = v192;
    }

    objc_msgSend__handleIMAVResponse_(self, v125, v102, v126, v127);
    if (!(_DWORD)v102)
    {
      if (v107 < 3 || v4)
      {
        if (v107 >= 3 && v4)
        {
          objc_msgSend__callInfoWithState_(self, v128, 3, v130, v131);
          v133 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
          v138 = v133;
          if (v133)
          {
            objc_msgSend_setIsBeingHandedOff_(v133, v134, 1, v136, v137);
            objc_msgSend_setIsReinitiate_(v25, v139, 1, v140, v141);
          }
          objc_msgSend_sharedInstance(IMAVInterface, v134, v135, v136, v137);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_avChat(self, v143, v144, v145, v146);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          v152 = objc_msgSend_callID(v138, v148, v149, v150, v151);
          objc_msgSend_endAVConferenceWithChat_callID_(v142, v153, (uint64_t)v147, v152, v154);

          sub_2190076D0();
          v155 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v194 = v138;
            _os_log_impl(&dword_218FEA000, v155, OS_LOG_TYPE_DEFAULT, "Officially stopping the call we're handing off from %@", buf, 0xCu);
          }

          objc_msgSend_avChat(self, v156, v157, v158, v159);
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_vcPartyID(self, v161, v162, v163, v164);
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_conferencePersonWithID_mediaDidStall_(v160, v166, (uint64_t)v165, 1, v167);

          objc_msgSend_avChat(self, v168, v169, v170, v171);
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__setIsAudioInterrupted_(v172, v173, 1, v174, v175);

          objc_msgSend_avChat(self, v176, v177, v178, v179);
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__setIsVideoInterrupted_(v180, v181, 1, v182, v183);

        }
        objc_msgSend_sharedInstance(IMAVInterface, v128, v129, v130, v131);
        v132 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_avChat(self, v184, v185, v186, v187);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_avChat_prepareConnectionWithCallInfo_(v132, v189, (uint64_t)v188, (uint64_t)v25, v190);

      }
      else
      {
        sub_2190076D0();
        v132 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v194 = self;
          _os_log_impl(&dword_218FEA000, v132, OS_LOG_TYPE_DEFAULT, "Received accept for participant (%@) who was already connecting, ignoring this", buf, 0xCu);
        }
      }

    }
  }

  return v14 != 0;
}

- (BOOL)_generateCallInfo:(id)a3
{
  IMAVChatParticipant *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
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
  void *v25;
  const char *v26;
  char v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  IMAVChatParticipant *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  int v41;
  IMAVChatParticipant *v42;
  __int16 v43;
  IMAVChatParticipant *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = (IMAVChatParticipant *)a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v41 = 138412546;
    v42 = self;
    v43 = 2112;
    v44 = v4;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "getLocalICEData: %@ callInfo: %@", (uint8_t *)&v41, 0x16u);
  }

  objc_msgSend_sharedInstance(IMAVInterface, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_avChat(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ID(self->_imHandle, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_service(self->_imHandle, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_avChat_generateCallInfoForID_service_usingRelay_callInfo_(v10, v26, (uint64_t)v15, (uint64_t)v20, (uint64_t)v25, 0, v4);

  sub_2190076D0();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_localICEData(v4, v29, v30, v31, v32);
    v33 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
    v41 = 138412546;
    v42 = v33;
    v43 = 2112;
    v44 = self;
    _os_log_impl(&dword_218FEA000, v28, OS_LOG_TYPE_DEFAULT, "    result: %@ participant: %@", (uint8_t *)&v41, 0x16u);

  }
  objc_msgSend_avChat(self, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__postNotificationName_participant_userInfo_(v38, v39, (uint64_t)CFSTR("__kIMAVChatParticipantCallInfoChangedNotification"), (uint64_t)self, 0);

  return v27;
}

- (id)_natType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  objc_msgSend_properties(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE50498];
  objc_msgSend_objectForKey_(v5, v7, *MEMORY[0x24BE50498], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_objectForKey_(v5, v11, v6, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectForKey_(v5, v11, *MEMORY[0x24BE504E0], v12, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend_dictionaryWithPlistData_(MEMORY[0x24BDBCE70], v15, (uint64_t)v18, v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v19, v20, v6, v21, v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (void)_handleIMAVResponse:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int16 v30;
  uint8_t v31[2];
  __int16 v32;
  uint8_t v33[16];
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t buf[16];

  switch(a3)
  {
    case 0u:
      sub_2190076D0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Remote user accepted", buf, 2u);
      }

      objc_msgSend_setState_(self, v6, 3, v7, v8);
      return;
    case 1u:
      sub_2190076D0();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "Remote user has Declined", v33, 2u);
      }

      objc_msgSend_setStateToEndedWithReason_andError_(self, v10, 5, 0, v11);
      return;
    case 2u:
      sub_2190076D0();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, "Remote user is busy", v35, 2u);
      }

      objc_msgSend_setStateToEndedWithReason_andError_(self, v13, 3, 0, v14);
      return;
    case 4u:
      sub_2190076D0();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      v32 = 0;
      v16 = "Remote user doesn't have a good network";
      v17 = (uint8_t *)&v32;
      break;
    case 5u:
      sub_2190076D0();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      *(_WORD *)v31 = 0;
      v16 = "Remote user has no wifi";
      v17 = v31;
      break;
    case 7u:
      sub_2190076D0();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_218FEA000, v18, OS_LOG_TYPE_DEFAULT, "Remote user has missed the call", v34, 2u);
      }

      objc_msgSend_setStateToEndedWithReason_andError_(self, v19, 22, 0, v20);
      return;
    case 0xBu:
      sub_2190076D0();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      v30 = 0;
      v16 = "Remote user filtered the call";
      v17 = (uint8_t *)&v30;
      break;
    default:
      objc_msgSend_setStateToEndedWithReason_andError_(self, a2, 5, 0xFFFFFFFFLL, v3);
      return;
  }
  _os_log_impl(&dword_218FEA000, v15, OS_LOG_TYPE_DEFAULT, v16, v17, 2u);
LABEL_23:

  objc_msgSend_avChat(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__reduceInvitationTimeoutTime(v25, v26, v27, v28, v29);

}

- (void)_noteInviteDelivered:(BOOL)a3
{
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t buf[4];
  void *v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v5 = self->_participantsCallInfo;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v94, (uint64_t)v100, 16);
  if (v7)
  {
    v12 = v7;
    v13 = *(_QWORD *)v95;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v95 != v13)
        objc_enumerationMutation(v5);
      v15 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v14);
      if (objc_msgSend_state(v15, v8, v9, v10, v11, (_QWORD)v94) <= 2)
      {
        if (objc_msgSend_inviteNeedsDelivery(v15, v8, v9, v10, v11))
          break;
      }
      if (v12 == ++v14)
      {
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v94, (uint64_t)v100, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_17;
      }
    }
    objc_msgSend_setInviteNeedsDelivery_(v15, v8, 0, v10, v11);
    if (a3)
    {

      goto LABEL_18;
    }
    if (objc_msgSend_isReinitiate(v15, v16, v17, v18, v19))
    {
      sub_2190076D0();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v99 = v15;
        _os_log_impl(&dword_218FEA000, v24, OS_LOG_TYPE_DEFAULT, "Ending call info %@ since the re-initiate failed", buf, 0xCu);
      }

      objc_msgSend_setState_(v15, v25, 4, v26, v27);
      objc_msgSend_sharedInstance(IMAVInterface, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_avChat(self, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend_callID(v15, v38, v39, v40, v41);
      objc_msgSend_endAVConferenceWithChat_callID_(v32, v43, (uint64_t)v37, v42, v44);

    }
  }
LABEL_17:

  if (a3)
  {
LABEL_18:
    if ((objc_msgSend__inviteDelivered(self, v20, v21, v22, v23, (_QWORD)v94) & 1) != 0)
      return;
    objc_msgSend_avChat(self, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localParticipant(v49, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isInitiator(v54, v55, v56, v57, v58))
    {
      v63 = objc_msgSend_state(self, v59, v60, v61, v62);

      if (v63 > 3)
        return;
      objc_msgSend_avChat(self, v64, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__postNotificationName_participant_userInfo_(v68, v69, (uint64_t)CFSTR("__kIMAVChatParticipantInvitationDeliveredNotification"), (uint64_t)self, 0);

      objc_msgSend_avChat(self, v70, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__timings(v74, v75, v76, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stopTimingForKey_(v79, v80, (uint64_t)CFSTR("invitation-delivery-time"), v81, v82);

      objc_msgSend__setInviteDelivered_(self, v83, 1, v84, v85);
      objc_msgSend_sharedInstance(IMAVCallManager, v86, v87, v88, v89);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__sendProxyUpdate(v49, v90, v91, v92, v93);
    }
    else
    {

    }
  }
}

- (void)_cleanupOrphanedCallInfos
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
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
  unsigned int v36;
  const char *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend__participantsCallInfo(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v40, (uint64_t)v46, 16);
  if (v8)
  {
    v14 = v8;
    v15 = *(_QWORD *)v41;
    *(_QWORD *)&v13 = 138412290;
    v39 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v6);
        v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend_state(v17, v9, v10, v11, v12, v39) <= 1)
        {
          sub_2190076D0();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v39;
            v45 = v17;
            _os_log_impl(&dword_218FEA000, v18, OS_LOG_TYPE_DEFAULT, "Cleaning up call info because it has not started connecting: %@", buf, 0xCu);
          }

          objc_msgSend_setState_(v17, v19, 4, v20, v21);
          objc_msgSend_sharedInstance(IMAVInterface, v22, v23, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_avChat(self, v27, v28, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend_callID(v17, v32, v33, v34, v35);
          objc_msgSend_endAVConferenceWithChat_callID_(v26, v37, (uint64_t)v31, v36, v38);

        }
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v40, (uint64_t)v46, 16);
    }
    while (v14);
  }

}

- (void)_hangupCallLaterIfReinitiateFailsForCallInfo:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  im_dispatch_after();

}

- (id)_callInfoForReinitiate
{
  IMAVChatParticipantCallInfo *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_alloc_init(IMAVChatParticipantCallInfo);
  objc_msgSend_setIsReinitiate_(v2, v3, 1, v4, v5);
  objc_msgSend_setInviteNeedsDelivery_(v2, v6, 1, v7, v8);
  return v2;
}

- (void)reinitializeCallForCallID:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint8_t v43[16];

  objc_msgSend__callInfoForCallID_(self, a2, a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isBeingHandedOff(v6, v7, v8, v9, v10) & 1) == 0
    && (objc_msgSend_isFinished(v6, v11, v12, v13, v14) & 1) == 0
    && objc_msgSend_state(v6, v15, v16, v17, v18) == 3)
  {
    MEMORY[0x219A28280](CFSTR("com.apple.conference"), CFSTR("kDisableReInitiate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      if ((objc_msgSend_isLocalParticipant(self, v20, v21, v22, v23) & 1) == 0
        && (objc_msgSend_hasConnectingSessions(self, v24, v25, v26, v27) & 1) == 0
        && objc_msgSend_hasReinitiateCapability(self, v24, v25, v26, v27))
      {
        objc_msgSend_setIsBeingHandedOff_(v6, v24, 1, v26, v27);
        objc_msgSend__callInfoForReinitiate(self, v28, v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__registerCallInfo_(self, v33, (uint64_t)v32, v34, v35);
        objc_msgSend__reInitiateWithCallInfo_(self, v36, (uint64_t)v32, v37, v38);
        objc_msgSend__hangupCallLaterIfReinitiateFailsForCallInfo_(self, v39, (uint64_t)v32, v40, v41);

      }
      if ((objc_msgSend_hasReinitiateCapability(self, v24, v25, v26, v27) & 1) == 0)
      {
        sub_2190076D0();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v43 = 0;
          _os_log_impl(&dword_218FEA000, v42, OS_LOG_TYPE_DEFAULT, " We don't have re-initiate capability...", v43, 2u);
        }

      }
    }
  }

}

- (void)setState:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int state;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _BYTE v24[24];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (self->_state != a3)
  {
    v3 = *(_QWORD *)&a3;
    sub_2190076D0();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringDescriptionForIMAVChatParticipantState(v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _NSStringDescriptionForIMAVChatParticipantState(self->_state);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v24 = 138412802;
      *(_QWORD *)&v24[4] = self;
      *(_WORD *)&v24[12] = 2112;
      *(_QWORD *)&v24[14] = v6;
      *(_WORD *)&v24[22] = 2112;
      v25 = v7;
      _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "participant: %@   state: %@   oldState: %@", v24, 0x20u);

    }
    state = self->_state;
    if (state == 5)
    {
      sub_2190076D0();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_218FEA000, v13, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatParticipant: invalid state transition: cannot transition out of end state!", v24, 2u);
      }

    }
    else
    {
      switch((int)v3)
      {
        case 1:
          if (state)
          {
            sub_2190076D0();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              _NSStringDescriptionForIMAVChatParticipantState(self->_state);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              _NSStringDescriptionForIMAVChatParticipantState(1u);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v24 = 138412546;
              *(_QWORD *)&v24[4] = v15;
              *(_WORD *)&v24[12] = 2112;
              *(_QWORD *)&v24[14] = v16;
              _os_log_impl(&dword_218FEA000, v14, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatParticipant: invalid state transition:  from state (%@) to state (%@)!", v24, 0x16u);

            }
          }
          if (objc_msgSend_isInitiator(self, v8, v9, v10, v11))
          {
            sub_2190076D0();
            v17 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              goto LABEL_39;
            *(_WORD *)v24 = 0;
            v18 = "[WARN] IMAVChatParticipant: the initiator of a chat should never be invited!";
            goto LABEL_38;
          }
          goto LABEL_40;
        case 2:
          if (state - 3 >= 2)
          {
            if (!state)
              goto LABEL_35;
          }
          else if ((objc_msgSend_isInitiator(self, v8, v9, v10, v11) & 1) != 0)
          {
            goto LABEL_35;
          }
          sub_2190076D0();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            _NSStringDescriptionForIMAVChatParticipantState(self->_state);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            _NSStringDescriptionForIMAVChatParticipantState(2u);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v24 = 138412546;
            *(_QWORD *)&v24[4] = v22;
            *(_WORD *)&v24[12] = 2112;
            *(_QWORD *)&v24[14] = v23;
            _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatParticipant: invalid state transition:  from state (%@) to state (%@)!", v24, 0x16u);

          }
LABEL_35:
          if ((objc_msgSend_isInitiator(self, v8, v9, v10, v11) & 1) == 0)
          {
            sub_2190076D0();
            v17 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              goto LABEL_39;
            *(_WORD *)v24 = 0;
            v18 = "[WARN] IMAVChatParticipant: only the initiator of a chat should ever be waiting!";
            goto LABEL_38;
          }
LABEL_40:
          objc_msgSend__setState_withReason_andError_(self, v8, v3, 0, 0, *(_OWORD *)v24, *(_QWORD *)&v24[16]);
          break;
        case 3:
          if (state - 1 >= 2)
          {
            sub_2190076D0();
            v17 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              goto LABEL_39;
            _NSStringDescriptionForIMAVChatParticipantState(self->_state);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            _NSStringDescriptionForIMAVChatParticipantState(3u);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v24 = 138412546;
            *(_QWORD *)&v24[4] = v19;
            *(_WORD *)&v24[12] = 2112;
            *(_QWORD *)&v24[14] = v20;
            goto LABEL_27;
          }
          goto LABEL_40;
        case 4:
          if (state != 3)
          {
            sub_2190076D0();
            v17 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              goto LABEL_39;
            _NSStringDescriptionForIMAVChatParticipantState(self->_state);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            _NSStringDescriptionForIMAVChatParticipantState(4u);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v24 = 138412546;
            *(_QWORD *)&v24[4] = v19;
            *(_WORD *)&v24[12] = 2112;
            *(_QWORD *)&v24[14] = v20;
LABEL_27:
            _os_log_impl(&dword_218FEA000, v17, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatParticipant: invalid state transition:  from state (%@) to state (%@)!", v24, 0x16u);

            goto LABEL_28;
          }
          goto LABEL_40;
        case 5:
          sub_2190076D0();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            v18 = "[WARN] IMAVChatParticipant: do not use setState:IMAVChatStateEnded.  Use setStateToEndedWithReason:andError: instead.";
LABEL_38:
            _os_log_impl(&dword_218FEA000, v17, OS_LOG_TYPE_DEFAULT, v18, v24, 2u);
          }
          goto LABEL_39;
        default:
          sub_2190076D0();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            _NSStringDescriptionForIMAVChatParticipantState(v3);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v24 = 138412290;
            *(_QWORD *)&v24[4] = v19;
            _os_log_impl(&dword_218FEA000, v17, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatParticipant: invalid state (%@)", v24, 0xCu);
LABEL_28:

          }
LABEL_39:

          goto LABEL_40;
      }
    }
  }
}

- (void)setStateToEndedWithReason:(unsigned int)a3 andError:(int)a4
{
  unsigned int state;
  uint64_t v5;
  uint64_t v6;
  NSObject *v8;
  uint8_t v9[16];

  state = self->_state;
  if (state != 5)
  {
    v5 = *(_QWORD *)&a4;
    v6 = *(_QWORD *)&a3;
    if (!state)
    {
      sub_2190076D0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatParticipant: Invalid state transition: from zero state to end state.", v9, 2u);
      }

    }
    objc_msgSend__setState_withReason_andError_(self, a2, 5, v6, v5);
  }
}

- (void)_setState:(unsigned int)a3 withReason:(unsigned int)a4 andError:(int)a5
{
  uint64_t v5;
  uint64_t state;
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  id v26;

  v5 = *(_QWORD *)&a3;
  state = self->_state;
  self->_state = a3;
  self->_chatEndedReason = a4;
  objc_msgSend_account(self->_imHandle, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayOfAllIMHandles(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_indexOfObjectIdenticalTo_(v13, v14, (uint64_t)self->_imHandle, v15, v16);

  if ((_DWORD)v5 == 5 && v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_setCapabilities_(self->_imHandle, v18, 0, v20, v21);
    objc_msgSend_setPersonStatus_(self->_imHandle, v22, 0, v23, v24);
  }
  objc_msgSend_avChat(self, v18, v19, v20, v21);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participant_changedFromState_toState_(v26, v25, (uint64_t)self, state, v5);

}

- (void)_processPropertyUpdate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  IMAVChatParticipant *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  IMAVChatParticipant *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_objectForKey_(a3, a2, *MEMORY[0x24BE504B0], v3, v4);
  v6 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v6;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "kFZVCPropertyPeerMayRequireCTBreak: %@", (uint8_t *)&v21, 0xCu);
  }

  if (objc_msgSend_BOOLValue(v6, v8, v9, v10, v11))
  {
    sub_2190076D0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = self;
      _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, "%@ may require break before make!", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend_avChat(self, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMayRequireBreakBeforeMake_(v17, v18, 1, v19, v20);

  }
}

- (void)_updateProperties:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char isEqualToDictionary;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;

  v38 = a3;
  if (objc_msgSend_count(v38, v4, v5, v6, v7))
  {
    objc_msgSend_properties(self, v8, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12
      || (v17 = (void *)v12,
          objc_msgSend_properties(self, v13, v14, v15, v16),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v18, v19, (uint64_t)v38, v20, v21),
          v18,
          v17,
          (isEqualToDictionary & 1) == 0))
    {
      objc_msgSend_properties(self, v13, v14, v15, v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend_mutableCopy(v23, v24, v25, v26, v27);

      objc_msgSend_addEntriesFromDictionary_(v28, v29, (uint64_t)v38, v30, v31);
      objc_msgSend_setProperties_(self, v32, (uint64_t)v28, v33, v34);
      objc_msgSend__processPropertyUpdate_(self, v35, (uint64_t)v38, v36, v37);

    }
  }

}

- (void)_setConferenceID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSString *v6;
  NSString *conferenceID;

  if (self->_conferenceID != a3)
  {
    v6 = (NSString *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
    conferenceID = self->_conferenceID;
    self->_conferenceID = v6;

  }
}

- (void)setInFrequencyLevel:(id)a3
{
  NSData *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSData *v13;

  v5 = (NSData *)a3;
  if (self->_inFrequencyLevel != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_inFrequencyLevel, a3);
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v10, v11, (uint64_t)CFSTR("__kIMAVChatParticipantInFrequencyChangedNotification"), (uint64_t)self, v12);

    v5 = v13;
  }

}

- (void)setOutFrequencyLevel:(id)a3
{
  NSData *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSData *v13;

  v5 = (NSData *)a3;
  if (self->_outFrequencyLevel != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_outFrequencyLevel, a3);
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v10, v11, (uint64_t)CFSTR("__kIMAVChatParticipantOutFrequencyChangedNotification"), (uint64_t)self, v12);

    v5 = v13;
  }

}

- (void)_switchToUseNewIMHandle:(id)a3
{
  IMHandle *v5;
  IMHandle **p_imHandle;
  IMHandle *imHandle;
  IMHandle *v8;

  v5 = (IMHandle *)a3;
  if (v5)
  {
    imHandle = self->_imHandle;
    p_imHandle = &self->_imHandle;
    if (imHandle != v5)
    {
      v8 = v5;
      objc_storeStrong((id *)p_imHandle, a3);
      v5 = v8;
    }
  }

}

- (void)sendAVMessage:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4;
  id v6;
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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  void *v45;
  const char *v46;
  id v47;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend_avChat(self, v7, v8, v9, v10);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imHandle(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ID(v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_sessionID(v47, v26, v27, v28, v29);
  objc_msgSend_conferenceID(v47, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v47, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueID(v40, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendAVMessageToPerson_sessionID_type_userInfo_conference_account_(v15, v46, (uint64_t)v25, v30, v4, v6, v35, v45);

}

- (CGRect)contentRectForCameraOrientation:(unsigned int)a3 cameraType:(unsigned int)a4
{
  uint64_t v4;
  char isLocalParticipant;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGRect result;

  isLocalParticipant = objc_msgSend_isLocalParticipant(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4);
  v8 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  if ((isLocalParticipant & 1) == 0)
  {
    v12 = 240;
    if (a3 < 2)
      v12 = 208;
    v13 = 248;
    if (a3 < 2)
      v13 = 216;
    v14 = 256;
    if (a3 < 2)
      v14 = 224;
    v15 = 264;
    if (a3 < 2)
      v15 = 232;
    v8 = *(double *)((char *)&self->super.isa + v12);
    v9 = *(double *)((char *)&self->super.isa + v13);
    v10 = *(double *)((char *)&self->super.isa + v14);
    v11 = *(double *)((char *)&self->super.isa + v15);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGSize)aspectRatioForCameraOrientation:(unsigned int)a3 cameraType:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  CGFloat width;
  double v17;
  CGFloat height;
  double v19;
  double v20;
  CGSize result;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  if (objc_msgSend_isLocalParticipant(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4))
  {
    objc_msgSend_avChat(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localAspectRatioForCameraOrientation_cameraType_(v12, v13, v6, v5, v14);
    width = v15;
    height = v17;

  }
  else if (v6 > 1)
  {
    width = self->_remoteLandscapeOrientation.width;
    height = self->_remoteLandscapeOrientation.height;
  }
  else
  {
    width = self->_remotePortraitOrientation.width;
    height = self->_remotePortraitOrientation.height;
  }
  v19 = width;
  v20 = height;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGSize)localAspectRatioForCameraOrientation:(unsigned int)a3 cameraType:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  CGFloat width;
  double v17;
  CGFloat height;
  double v19;
  double v20;
  CGSize result;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  if (objc_msgSend_isLocalParticipant(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4))
  {
    objc_msgSend_avChat(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localAspectRatioForCameraOrientation_cameraType_(v12, v13, v6, v5, v14);
    width = v15;
    height = v17;

  }
  else if (v6 > 1)
  {
    width = self->_remotePIPLandscapeOrientation.width;
    height = self->_remotePIPLandscapeOrientation.height;
  }
  else
  {
    width = self->_remotePIPPortraitOrientation.width;
    height = self->_remotePIPPortraitOrientation.height;
  }
  v19 = width;
  v20 = height;
  result.height = v20;
  result.width = v19;
  return result;
}

- (unsigned)state
{
  return self->_state;
}

- (BOOL)isSendingAudio
{
  return self->_sendingAudio;
}

- (BOOL)isSendingVideo
{
  return self->_sendingVideo;
}

- (BOOL)isAudioMuted
{
  return self->_audioMuted;
}

- (void)setAudioMuted:(BOOL)a3
{
  self->_audioMuted = a3;
}

- (BOOL)isVideoPaused
{
  return self->_videoPaused;
}

- (void)setVideoPaused:(BOOL)a3
{
  self->_videoPaused = a3;
}

- (BOOL)isVideoDegraded
{
  return self->_videoDegraded;
}

- (void)setVideoDegraded:(BOOL)a3
{
  self->_videoDegraded = a3;
}

- (NSArray)additionalPeers
{
  return self->_additionalPeers;
}

- (void)setAdditionalPeers:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPeers, a3);
}

- (NSArray)excludingPushTokens
{
  return self->_excludingPushTokens;
}

- (void)setExcludingPushTokens:(id)a3
{
  objc_storeStrong((id *)&self->_excludingPushTokens, a3);
}

- (BOOL)isMediaStalled
{
  return self->_mediaStalled;
}

- (void)setMediaStalled:(BOOL)a3
{
  self->_mediaStalled = a3;
}

- (NSString)vcPartyID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVCPartyID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unsigned)cameraType
{
  return self->_cameraType;
}

- (void)_setCameraType:(unsigned int)a3
{
  self->_cameraType = a3;
}

- (unsigned)cameraOrientation
{
  return self->_cameraOrientation;
}

- (void)_setCameraOrientation:(unsigned int)a3
{
  self->_cameraOrientation = a3;
}

- (IMHandle)imHandle
{
  return self->_imHandle;
}

- (IMHandle)invitedBy
{
  return self->_inviter;
}

- (IMAVChat)avChat
{
  return self->_avChat;
}

- (void)setAVChat:(id)a3
{
  self->_avChat = (IMAVChat *)a3;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (unsigned)reasonChatEnded
{
  return self->_chatEndedReason;
}

- (int)error
{
  return self->_chatError;
}

- (void)_setChatError:(int)a3
{
  self->_chatError = a3;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (NSString)_conferenceID
{
  return self->_conferenceID;
}

- (CGSize)_remotePortraitOrientation
{
  double width;
  double height;
  CGSize result;

  width = self->_remotePortraitOrientation.width;
  height = self->_remotePortraitOrientation.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setRemotePortraitOrientation:(CGSize)a3
{
  self->_remotePortraitOrientation = a3;
}

- (CGSize)_remoteLandscapeOrientation
{
  double width;
  double height;
  CGSize result;

  width = self->_remoteLandscapeOrientation.width;
  height = self->_remoteLandscapeOrientation.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setRemoteLandscapeOrientation:(CGSize)a3
{
  self->_remoteLandscapeOrientation = a3;
}

- (BOOL)_inviteDelivered
{
  return self->_inviteDelivered;
}

- (void)_setInviteDelivered:(BOOL)a3
{
  self->_inviteDelivered = a3;
}

- (NSTimer)_connectTimeoutTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 112, 1);
}

- (void)_setConnectTimeoutTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (CGSize)_remotePIPPortraitOrientation
{
  double width;
  double height;
  CGSize result;

  width = self->_remotePIPPortraitOrientation.width;
  height = self->_remotePIPPortraitOrientation.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setRemotePIPPortraitOrientation:(CGSize)a3
{
  self->_remotePIPPortraitOrientation = a3;
}

- (CGSize)_remotePIPLandscapeOrientation
{
  double width;
  double height;
  CGSize result;

  width = self->_remotePIPLandscapeOrientation.width;
  height = self->_remotePIPLandscapeOrientation.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setRemotePIPLandscapeOrientation:(CGSize)a3
{
  self->_remotePIPLandscapeOrientation = a3;
}

- (CGRect)_remotePortraitContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_remotePortraitContentRect.origin.x;
  y = self->_remotePortraitContentRect.origin.y;
  width = self->_remotePortraitContentRect.size.width;
  height = self->_remotePortraitContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setRemotePortraitContentRect:(CGRect)a3
{
  self->_remotePortraitContentRect = a3;
}

- (CGRect)_remoteLandscapeContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_remoteLandscapeContentRect.origin.x;
  y = self->_remoteLandscapeContentRect.origin.y;
  width = self->_remoteLandscapeContentRect.size.width;
  height = self->_remoteLandscapeContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setRemoteLandscapeContentRect:(CGRect)a3
{
  self->_remoteLandscapeContentRect = a3;
}

- (unsigned)_screenOrientation
{
  return self->_screenOrientation;
}

- (void)_setScreenOrientation:(unsigned int)a3
{
  self->_screenOrientation = a3;
}

- (NSMutableArray)_participantsCallInfo
{
  return self->_participantsCallInfo;
}

- (void)set_participantsCallInfo:(id)a3
{
  objc_storeStrong((id *)&self->_participantsCallInfo, a3);
}

- (void)setHasReinitiateCapability:(BOOL)a3
{
  self->_hasReinitiateCapability = a3;
}

- (NSData)inFrequencyLevel
{
  return self->_inFrequencyLevel;
}

- (NSData)outFrequencyLevel
{
  return self->_outFrequencyLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outFrequencyLevel, 0);
  objc_storeStrong((id *)&self->_inFrequencyLevel, 0);
  objc_storeStrong((id *)&self->_participantsCallInfo, 0);
  objc_storeStrong((id *)&self->_connectTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_conferenceID, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_inviter, 0);
  objc_storeStrong((id *)&self->_imHandle, 0);
  objc_storeStrong((id *)&self->_vcPartyID, 0);
  objc_storeStrong((id *)&self->_excludingPushTokens, 0);
  objc_storeStrong((id *)&self->_additionalPeers, 0);
}

- (void)_reInitiateWithCallInfo:(id)a3
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
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v4 = a3;
  objc_msgSend_avChat(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vcPartyID(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_219004730;
  v23[3] = &unk_24DA57760;
  v24 = v9;
  v25 = v4;
  dispatch_get_global_queue(0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  v22 = v9;
  sub_21900462C(v14, v19, 1, v23, v20);

}

- (void)sendInvitation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
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
  IMAVChatParticipantCallInfo *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  IMAVChatParticipantCallInfo *v37;
  _QWORD v38[4];
  IMAVChatParticipantCallInfo *v39;

  if (!objc_msgSend_state(self, a2, v2, v3, v4))
  {
    objc_msgSend_setState_(self, v6, 1, v7, v8);
    objc_msgSend_avChat(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__timings(v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopTimingForKey_(v18, v19, (uint64_t)CFSTR("time-to-av-invitation-op-creation"), v20, v21);

    v22 = objc_alloc_init(IMAVChatParticipantCallInfo);
    objc_msgSend__registerCallInfo_(self, v23, (uint64_t)v22, v24, v25);
    objc_msgSend_GUID(v13, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vcPartyID(self, v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = sub_2190052B8;
    v38[3] = &unk_24DA57788;
    v39 = v22;
    dispatch_get_global_queue(0, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v22;
    sub_21900462C(v30, v35, 0, v38, v36);

  }
}

- (void)cancelInvitation
{
  uint64_t v2;

  objc_msgSend__cancelInvitationWithReason_response_(self, a2, 1, 0, v2);
}

- (void)cancelInvitationWithResponse:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], a2, *(uint64_t *)&a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__cancelInvitationWithReason_response_(self, v6, 1, (uint64_t)v8, v7);

}

- (void)cancelInvitationWithReason:(unsigned int)a3
{
  uint64_t v3;

  objc_msgSend__cancelInvitationWithReason_response_(self, a2, *(uint64_t *)&a3, 0, v3);
}

- (void)_cancelInvitationWithReason:(unsigned int)a3 response:(id)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  int v86;
  void *v87;
  __int16 v88;
  id v89;
  uint64_t v90;

  v4 = *(_QWORD *)&a3;
  v90 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend_setStateToEndedWithReason_andError_(self, v7, v4, 0, v8);
  objc_msgSend_avChat(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_endedReason(v13, v14, v15, v16, v17);

  if (v18 <= 0x18 && ((1 << v18) & 0x1811000) != 0)
  {
    sub_2190076D0();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_avChat(self, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_endedReason(v28, v29, v30, v31, v32);
      _NSStringDescriptionForIMAVChatEndedReason(v33, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = 138412290;
      v87 = v38;
      _os_log_impl(&dword_218FEA000, v23, OS_LOG_TYPE_DEFAULT, "No need to send cancel since chat ended with reason %@", (uint8_t *)&v86, 0xCu);

    }
  }
  else
  {
    objc_msgSend_imHandle(self, v19, v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    sub_2190076D0();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_ID(v23, v40, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = 138412290;
      v87 = v44;
      _os_log_impl(&dword_218FEA000, v39, OS_LOG_TYPE_DEFAULT, "Sending cancel invite for %@ to service", (uint8_t *)&v86, 0xCu);

    }
    sub_2190076D0();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_ID(v23, v46, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = 138412546;
      v87 = v50;
      v88 = 2112;
      v89 = v6;
      _os_log_impl(&dword_218FEA000, v45, OS_LOG_TYPE_DEFAULT, "Sending cancel invite to %@ with response %@", (uint8_t *)&v86, 0x16u);

    }
    objc_msgSend_avChat(self, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedInstance(IMAVController, v56, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)MEMORY[0x24BDBCE70];
    v62 = (void *)MEMORY[0x24BDD16E0];
    v67 = objc_msgSend_sessionID(v55, v63, v64, v65, v66);
    objc_msgSend_numberWithUnsignedInt_(v62, v68, v67, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObject_forKey_(v61, v72, (uint64_t)v71, *MEMORY[0x24BE504F0], v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(v23, v75, v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_conferenceID(v55, v80, v81, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancelVCRequestWithBuddy_vcProps_forAccount_conferenceID_reason_(v60, v85, (uint64_t)v23, (uint64_t)v74, (uint64_t)v79, v84, v6);

  }
}

- (void)_sendResponse:(unsigned int)a3 callInfo:(id)a4
{
  id v6;
  NSObject *v7;
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
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char isReinitiate;
  void *v40;
  _QWORD v41[4];
  id v42;
  int v43;
  uint8_t buf[4];
  IMAVChatParticipant *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _NSStringDescriptionForIMAVResponse(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v45 = self;
    v46 = 2112;
    v47 = v8;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "participant: %@   response: %@", buf, 0x16u);

  }
  objc_msgSend_avChat(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13;
  if (a3)
  {
    objc_msgSend_GUID(v13, v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vcPartyID(self, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    sub_21900583C(a3, 0, 1, 1, (uint64_t)v19, v24, v6);

  }
  else
  {
    if (objc_msgSend_isReinitiate(v6, v14, v15, v16, v17))
      objc_msgSend__hangupCallLaterIfReinitiateFailsForCallInfo_(self, v25, (uint64_t)v6, v27, v28);
    objc_msgSend_GUID(v18, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vcPartyID(self, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    isReinitiate = objc_msgSend_isReinitiate(v6, v35, v36, v37, v38);
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = sub_219005818;
    v41[3] = &unk_24DA577B0;
    v43 = 0;
    v42 = v6;
    dispatch_get_global_queue(0, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    sub_21900462C(v29, v34, isReinitiate, v41, v40);

    v19 = v42;
  }

}

- (void)sendResponse:(unsigned int)a3
{
  uint64_t v3;

  objc_msgSend__sendResponse_callInfo_(self, a2, *(uint64_t *)&a3, 0, v3);
}

- (void)setWaitingToConnect:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  IMAVChatParticipant *v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412546;
    v25 = self;
    v26 = 1024;
    v27 = v3;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "participant: %@  waiting: %d", (uint8_t *)&v24, 0x12u);
  }

  objc_msgSend__connectTimeoutTimer(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  if (v3)
  {

    if (!v15)
    {
      objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x24BDBCF40], v16, (uint64_t)self, (uint64_t)sel__connectTimeout_, 0, 0, 180.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__setConnectTimeoutTimer_(self, v18, (uint64_t)v17, v19, v20);

    }
  }
  else
  {
    objc_msgSend_invalidate(v10, v11, v12, v13, v14);

    objc_msgSend__setConnectTimeoutTimer_(self, v21, 0, v22, v23);
  }
}

- (void)resetWaitingToConnectTimer
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
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  IMAVChatParticipant *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "participant: %@", (uint8_t *)&v21, 0xCu);
  }

  objc_msgSend__connectTimeoutTimer(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v8, v9, v10, v11, v12);

  objc_msgSend__setConnectTimeoutTimer_(self, v13, 0, v14, v15);
  objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x24BDBCF40], v16, (uint64_t)self, (uint64_t)sel__connectTimeout_, 0, 0, 180.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setConnectTimeoutTimer_(self, v18, (uint64_t)v17, v19, v20);

}

- (void)_connectTimeout:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_name(self, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v9;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, "Participant %@ _connectTimeout", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend__setConnectTimeoutTimer_(self, v10, 0, v11, v12);
  objc_msgSend_setStateToEndedWithReason_andError_(self, v13, 6, 1008, v14);
}

- (void)videoLayer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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

  if (!objc_msgSend_isLocalParticipant(self, a2, v2, v3, v4))
    return 0;
  objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_localVideoLayer(v9, v10, v11, v12, v13);

  return v14;
}

- (void)setVideoLayer:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  if (objc_msgSend_isLocalParticipant(self, a2, (uint64_t)a3, v3, v4))
  {
    objc_msgSend_sharedInstance(IMAVInterface, v6, v7, v8, v9);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocalVideoLayer_(v13, v10, (uint64_t)a3, v11, v12);

  }
}

- (void)videoBackLayer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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

  if (!objc_msgSend_isLocalParticipant(self, a2, v2, v3, v4))
    return 0;
  objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_localVideoBackLayer(v9, v10, v11, v12, v13);

  return v14;
}

- (void)setVideoBackLayer:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  if (objc_msgSend_isLocalParticipant(self, a2, (uint64_t)a3, v3, v4))
  {
    objc_msgSend_sharedInstance(IMAVInterface, v6, v7, v8, v9);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocalVideoBackLayer_(v13, v10, (uint64_t)a3, v11, v12);

  }
}

- (id)_proxyRepresentation
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_name(self, v4, v5, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend_setObject_forKey_(v3, v8, (uint64_t)v10, (uint64_t)CFSTR("Name"), v9);

  return v3;
}

@end
