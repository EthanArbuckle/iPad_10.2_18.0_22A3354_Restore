@implementation IMAVCallManager

+ (id)sharedInstance
{
  if (qword_253DE94B8 != -1)
    dispatch_once(&qword_253DE94B8, &unk_24DA576D0);
  return (id)qword_253DE94E8;
}

- (IMAVCallManager)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  IMAVCallManager *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int shouldRunACConferences;
  void *v17;
  const char *v18;
  uint64_t v19;
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
  char shouldObserveConferences;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSDate *lastCallStateChange;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int shouldRunConferences;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  NSMutableArray *v62;
  NSMutableArray *acChatProxyArray;
  NSMutableArray *v64;
  NSMutableArray *avChatProxyArray;
  NSMutableDictionary *v66;
  NSMutableDictionary *guidToACChatProxyMap;
  NSMutableDictionary *v68;
  NSMutableDictionary *guidToAVChatProxyMap;
  uint64_t v70;
  int *v71;
  void *v72;
  int *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t state64[5];
  int *v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v84;
  int *v85;
  objc_super v86;

  v86.receiver = self;
  v86.super_class = (Class)IMAVCallManager;
  v6 = -[IMAVCallManager init](&v86, sel_init);
  if (v6)
  {
    objc_msgSend_sharedInstance(IMAVController, v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend__shouldRunConferences(v7, v8, v9, v10, v11) & 1) != 0)
    {
      shouldRunACConferences = 1;
    }
    else
    {
      objc_msgSend_sharedInstance(IMAVController, v12, v13, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      shouldRunACConferences = objc_msgSend__shouldRunACConferences(v17, v18, v19, v20, v21);

    }
    objc_msgSend_sharedInstance(IMAVController, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    shouldObserveConferences = objc_msgSend__shouldObserveConferences(v26, v27, v28, v29, v30);

    if (shouldRunACConferences)
    {
      objc_msgSend_ensureHandlerSetup(IMAVHandler, v32, v33, v34, v35);
      objc_msgSend_date(MEMORY[0x24BDBCE60], v36, v37, v38, v39);
      v40 = objc_claimAutoreleasedReturnValue();
      lastCallStateChange = v6->_lastCallStateChange;
      v6->_lastCallStateChange = (NSDate *)v40;

      objc_msgSend_sharedInstance(IMAVController, v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      shouldRunConferences = objc_msgSend__shouldRunConferences(v46, v47, v48, v49, v50);

      if (shouldRunConferences)
        notify_register_check("kIMAVCoreAVCallStateChanged", &v6->_avToken);
      objc_msgSend_sharedInstance(IMAVController, v52, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend__shouldRunACConferences(v56, v57, v58, v59, v60);

      if (v61)
        notify_register_check("kIMAVCoreACCallStateChanged", &v6->_acToken);
    }
    else if ((shouldObserveConferences & 1) == 0)
    {
      v70 = MEMORY[0x24BDAC760];
      v81 = MEMORY[0x24BDAC760];
      v82 = 3221225472;
      v83 = sub_219001744;
      v84 = &unk_24DA576F8;
      v71 = v6;
      v85 = v71;
      v72 = (void *)MEMORY[0x24BDAC9B8];
      im_notify_register_dispatch();
      state64[1] = v70;
      state64[2] = 3221225472;
      state64[3] = (uint64_t)sub_2190017A8;
      state64[4] = (uint64_t)&unk_24DA576F8;
      v73 = v71;
      v80 = v73;
      im_notify_register_dispatch();

      state64[0] = 0;
      notify_get_state(v6->_avToken, state64);
      objc_msgSend__setAVCallState_quietly_(v73, v74, LODWORD(state64[0]), 1, v75);
      notify_get_state(v71[17], state64);
      objc_msgSend__setACCallState_quietly_(v73, v76, LODWORD(state64[0]), 1, v77);

      guidToAVChatProxyMap = (NSMutableDictionary *)v85;
      goto LABEL_13;
    }
    v62 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    acChatProxyArray = v6->_acChatProxyArray;
    v6->_acChatProxyArray = v62;

    v64 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    avChatProxyArray = v6->_avChatProxyArray;
    v6->_avChatProxyArray = v64;

    v66 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    guidToACChatProxyMap = v6->_guidToACChatProxyMap;
    v6->_guidToACChatProxyMap = v66;

    v68 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    guidToAVChatProxyMap = v6->_guidToAVChatProxyMap;
    v6->_guidToAVChatProxyMap = v68;
LABEL_13:

  }
  return v6;
}

- (NSArray)calls
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend__mutableFTCalls(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v6, v7, (uint64_t)self->_acChatProxyArray, v8, v9);
  objc_msgSend_addObjectsFromArray_(v6, v10, (uint64_t)self->_avChatProxyArray, v11, v12);
  return (NSArray *)v6;
}

- (id)_mutableFTCalls
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend__copyMutableFTCalls(self, a2, v2, v3, v4);
}

- (id)_copyMutableFTCalls
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
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
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend__chatListLock(IMAVChat, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v8, v9, v10, v11, v12);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = self->_chatArray;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v37, (uint64_t)v41, 16);
  if (v15)
  {
    v20 = v15;
    v21 = *(_QWORD *)v38;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v13);
        objc_msgSend_object(*(void **)(*((_QWORD *)&v37 + 1) + 8 * v22), v16, v17, v18, v19, (_QWORD)v37);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          objc_msgSend_addObject_(v3, v23, (uint64_t)v26, v24, v25);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v37, (uint64_t)v41, 16);
    }
    while (v20);
  }

  objc_msgSend__chatListLock(IMAVChat, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v31, v32, v33, v34, v35);

  return v3;
}

- (id)_nonRetainingChatList
{
  NSMutableArray *chatArray;
  NSMutableArray *v4;
  NSMutableArray *v5;

  chatArray = self->_chatArray;
  if (!chatArray)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->_chatArray;
    self->_chatArray = v4;

    chatArray = self->_chatArray;
  }
  return chatArray;
}

- (void)_addIMAVChatToChatList:(id)a3
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
  NSMutableArray *v14;
  NSMutableArray *chatArray;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id inited;

  v4 = a3;
  objc_msgSend__chatListLock(IMAVChat, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v9, v10, v11, v12, v13);

  if (!self->_chatArray)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    chatArray = self->_chatArray;
    self->_chatArray = v14;

  }
  v16 = objc_alloc(MEMORY[0x24BE50390]);
  inited = (id)objc_msgSend_initRefWithObject_(v16, v17, (uint64_t)v4, v18, v19);

  objc_msgSend_addObject_(self->_chatArray, v20, (uint64_t)inited, v21, v22);
  objc_msgSend__chatListLock(IMAVChat, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v27, v28, v29, v30, v31);

}

- (void)_removeIMAVChatFromChatList:(id)a3
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
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend__chatListLock(IMAVChat, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v9, v10, v11, v12, v13);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = self->_chatArray;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v16)
  {
    v21 = v16;
    v22 = *(_QWORD *)v34;
LABEL_3:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v22)
        objc_enumerationMutation(v14);
      if ((id)objc_msgSend_hash(*(void **)(*((_QWORD *)&v33 + 1) + 8 * v23), v17, v18, v19, v20, (_QWORD)v33) == v4)
        break;
      if (v21 == ++v23)
      {
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v33, (uint64_t)v37, 16);
        if (v21)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend__chatListLock(IMAVChat, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v28, v29, v30, v31, v32);

}

- (void)_postStateChangeNamed:(id)a3 fromState:(unsigned int)a4 toState:(unsigned int)a5 postType:(BOOL)a6 type:(unsigned int)a7
{
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  const char *v14;
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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v7 = *(_QWORD *)&a7;
  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v14, v10, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v18, v9, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend_initWithObjectsAndKeys_(v13, v22, (uint64_t)v17, v23, v24, CFSTR("PreviousState"), v21, CFSTR("NewState"), 0);

  if (v8)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v26, v7, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v25, v30, (uint64_t)v29, (uint64_t)CFSTR("CallType"), v31);

  }
  sub_2190076D0();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v40 = v12;
    v41 = 2112;
    v42 = v25;
    _os_log_impl(&dword_218FEA000, v32, OS_LOG_TYPE_DEFAULT, "Posting %@  with %@", buf, 0x16u);
  }

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v37, v38, (uint64_t)v12, (uint64_t)self, (uint64_t)v25);

}

- (void)_postStateChangeIfNecessary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t globalCallState;
  const char *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_callState(self, a2, v2, v3, v4);
  if (self->_globalCallState != (_DWORD)v6)
  {
    v7 = v6;
    sub_2190076D0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringDescriptionForIMAVChatState(self->_globalCallState);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _NSStringDescriptionForIMAVChatState(v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "Global call state changed from %@ to %@", (uint8_t *)&v13, 0x16u);

    }
    globalCallState = self->_globalCallState;
    self->_globalCallState = v7;
    objc_msgSend__postStateChangeNamed_fromState_toState_postType_type_(self, v12, (uint64_t)CFSTR("com.apple.avcore.callstatechanged"), globalCallState, v7, 0, 0);
  }
}

- (unsigned)_callState
{
  uint64_t v2;
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
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char shouldObserveConferences;

  objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10) & 1) != 0)
    goto LABEL_4;
  objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__shouldRunACConferences(v15, v16, v17, v18, v19))
  {

LABEL_4:
LABEL_5:
    objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_connectToDaemon(v28, v29, v30, v31, v32);

    goto LABEL_6;
  }
  objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  shouldObserveConferences = objc_msgSend__shouldObserveConferences(v34, v35, v36, v37, v38);

  if ((shouldObserveConferences & 1) != 0)
    goto LABEL_5;
LABEL_6:
  if (self->_avCallState <= self->_acCallState)
    return self->_acCallState;
  else
    return self->_avCallState;
}

- (unsigned)_callStateForType:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char shouldObserveConferences;

  objc_msgSend_sharedInstance(IMAVController, a2, *(uint64_t *)&a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__shouldRunConferences(v7, v8, v9, v10, v11) & 1) != 0)
    goto LABEL_4;
  objc_msgSend_sharedInstance(IMAVController, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__shouldRunACConferences(v16, v17, v18, v19, v20))
  {

LABEL_4:
LABEL_5:
    objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_connectToDaemon(v29, v30, v31, v32, v33);

    goto LABEL_6;
  }
  objc_msgSend_sharedInstance(IMAVController, v21, v22, v23, v24);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  shouldObserveConferences = objc_msgSend__shouldObserveConferences(v36, v37, v38, v39, v40);

  if ((shouldObserveConferences & 1) != 0)
    goto LABEL_5;
LABEL_6:
  if (a3 == 1)
  {
    v34 = 72;
    return *(_DWORD *)((char *)&self->super.isa + v34);
  }
  if (a3 == 2)
  {
    v34 = 76;
    return *(_DWORD *)((char *)&self->super.isa + v34);
  }
  return 0;
}

- (void)_setAVCallState:(unsigned int)a3
{
  uint64_t v3;

  objc_msgSend__setAVCallState_quietly_(self, a2, *(uint64_t *)&a3, 0, v3);
}

- (void)_setAVCallState:(unsigned int)a3 quietly:(BOOL)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  _BYTE v28[10];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (self->_avCallState != a3)
  {
    sub_2190076D0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringDescriptionForIMAVChatState(self->_avCallState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _NSStringDescriptionForIMAVChatState(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412546;
      *(_QWORD *)v28 = v8;
      *(_WORD *)&v28[8] = 2112;
      v29 = v9;
      _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "Setting av call state from %@ to %@", (uint8_t *)&v27, 0x16u);

    }
    v14 = objc_msgSend__callState(self, v10, v11, v12, v13);
    self->_avCallState = a3;
    v19 = objc_msgSend__callState(self, v15, v16, v17, v18);
    if (!a4)
    {
      v20 = v19;
      if ((_DWORD)v14 != (_DWORD)v19)
      {
        sub_2190076D0();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 67109376;
          *(_DWORD *)v28 = v14;
          *(_WORD *)&v28[4] = 1024;
          *(_DWORD *)&v28[6] = v20;
          _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "Posting overall non-telephony state changed from %d to %d", (uint8_t *)&v27, 0xEu);
        }

        objc_msgSend__postStateChangeNamed_fromState_toState_postType_type_(self, v22, (uint64_t)CFSTR("com.apple.avcore._callstatechanged"), v14, v20, 1, 1);
        objc_msgSend__postStateChangeIfNecessary(self, v23, v24, v25, v26);
      }
    }
  }
}

- (void)_updateAVCallState
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  unsigned int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int isStateFinal;
  unsigned int v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend_calls(self, a2, v2, v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v30, (uint64_t)v36, 16);
  if (v8)
  {
    v13 = v8;
    v14 = 0;
    v15 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v6);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend_isVideo(v17, v9, v10, v11, v12))
        {
          v18 = objc_msgSend_state(v17, v9, v10, v11, v12);
          isStateFinal = objc_msgSend_isStateFinal(v17, v19, v20, v21, v22);
          if (v14 <= v18)
            v24 = v18;
          else
            v24 = v14;
          if (isStateFinal)
            v14 = v14;
          else
            v14 = v24;
        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v30, (uint64_t)v36, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  sub_2190076D0();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    _NSStringDescriptionForIMAVChatState(v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v26;
    _os_log_impl(&dword_218FEA000, v25, OS_LOG_TYPE_DEFAULT, "Updating AV call state to %@", buf, 0xCu);

  }
  objc_msgSend__setAVCallState_(self, v27, v14, v28, v29);
}

- (void)_setACCallState:(unsigned int)a3
{
  uint64_t v3;

  objc_msgSend__setACCallState_quietly_(self, a2, *(uint64_t *)&a3, 0, v3);
}

- (void)_setACCallState:(unsigned int)a3 quietly:(BOOL)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  _BYTE v28[10];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (self->_acCallState != a3)
  {
    sub_2190076D0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringDescriptionForIMAVChatState(self->_acCallState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _NSStringDescriptionForIMAVChatState(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412546;
      *(_QWORD *)v28 = v8;
      *(_WORD *)&v28[8] = 2112;
      v29 = v9;
      _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "Setting ac call state from %@ to %@", (uint8_t *)&v27, 0x16u);

    }
    v14 = objc_msgSend__callState(self, v10, v11, v12, v13);
    self->_acCallState = a3;
    v19 = objc_msgSend__callState(self, v15, v16, v17, v18);
    if (!a4)
    {
      v20 = v19;
      if ((_DWORD)v14 != (_DWORD)v19)
      {
        sub_2190076D0();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 67109376;
          *(_DWORD *)v28 = v14;
          *(_WORD *)&v28[4] = 1024;
          *(_DWORD *)&v28[6] = v20;
          _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "Posting overall non-telephony state changed from %d to %d", (uint8_t *)&v27, 0xEu);
        }

        objc_msgSend__postStateChangeNamed_fromState_toState_postType_type_(self, v22, (uint64_t)CFSTR("com.apple.avcore._callstatechanged"), v14, v20, 1, 2);
        objc_msgSend__postStateChangeIfNecessary(self, v23, v24, v25, v26);
      }
    }
  }
}

- (void)_updateACCallState
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  unsigned int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int isStateFinal;
  unsigned int v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend_calls(self, a2, v2, v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v30, (uint64_t)v36, 16);
  if (v8)
  {
    v13 = v8;
    v14 = 0;
    v15 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v6);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if ((objc_msgSend_isVideo(v17, v9, v10, v11, v12) & 1) == 0)
        {
          v18 = objc_msgSend_state(v17, v9, v10, v11, v12);
          isStateFinal = objc_msgSend_isStateFinal(v17, v19, v20, v21, v22);
          if (v14 <= v18)
            v24 = v18;
          else
            v24 = v14;
          if (isStateFinal)
            v14 = v14;
          else
            v14 = v24;
        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v30, (uint64_t)v36, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  sub_2190076D0();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    _NSStringDescriptionForIMAVChatState(v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v26;
    _os_log_impl(&dword_218FEA000, v25, OS_LOG_TYPE_DEFAULT, "Updating AC call state to %@", buf, 0xCu);

  }
  objc_msgSend__setACCallState_(self, v27, v14, v28, v29);
}

- (unsigned)callState
{
  uint64_t v2;
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
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char shouldObserveConferences;

  objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10) & 1) == 0)
  {
    objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend__shouldRunACConferences(v15, v16, v17, v18, v19))
    {
      objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      shouldObserveConferences = objc_msgSend__shouldObserveConferences(v34, v35, v36, v37, v38);

      if ((shouldObserveConferences & 1) == 0)
        return objc_msgSend__callState(self, v24, v25, v26, v27);
      goto LABEL_5;
    }

  }
LABEL_5:
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connectToDaemon(v28, v29, v30, v31, v32);

  return objc_msgSend__callState(self, v24, v25, v26, v27);
}

- (void)_updateOverallChatState
{
  uint64_t v2;
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
  int shouldRunACConferences;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  uint64_t v56;
  unsigned int v57;
  BOOL v58;
  id v59;
  IMAVCallManager *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  IMPowerAssertion *v71;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  IMPowerAssertion *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int shouldRunConferences;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int avCallState;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unsigned int acCallState;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  double v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  NSDate *lastCallStateChange;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  int v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  char v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  char v179;
  char v180;
  char v181;
  IMPowerAssertion *powerAssertion;
  NSObject *v183;
  IMPowerAssertion *v184;
  NSObject *v185;
  id v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  IMPowerAssertion *v191;
  IMPowerAssertion *v192;
  IMAVCallManager *v193;
  uint64_t v194;
  unsigned int v195;
  void *v196;
  void *v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  uint8_t buf[4];
  IMPowerAssertion *v203;
  _BYTE v204[128];
  uint64_t v205;

  v205 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10))
  {

  }
  else
  {
    objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    shouldRunACConferences = objc_msgSend__shouldRunACConferences(v19, v20, v21, v22, v23);

    if (!shouldRunACConferences)
      return;
  }
  v200 = 0u;
  v201 = 0u;
  v198 = 0u;
  v199 = 0u;
  v193 = self;
  objc_msgSend_calls(self, v15, v16, v17, v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v198, (uint64_t)v204, 16);
  if (!v27)
  {
    v196 = 0;
    v197 = 0;
    v195 = 0;
    v29 = 0;
    goto LABEL_25;
  }
  v28 = v27;
  v196 = 0;
  v197 = 0;
  v195 = 0;
  v29 = 0;
  v30 = *(_QWORD *)v199;
  v31 = 0x25503A000uLL;
  do
  {
    v32 = 0;
    v194 = v28;
    do
    {
      if (*(_QWORD *)v199 != v30)
        objc_enumerationMutation(v25);
      v33 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * v32);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v38 = objc_msgSend_state(v33, v34, v35, v36, v37);
        if ((objc_msgSend_isStateFinal(v33, v39, v40, v41, v42) & 1) == 0)
        {
          if (objc_msgSend_isVideo(v33, v34, v43, v44, v45))
          {
            if (v29 <= v38)
              v29 = v38;
            else
              v29 = v29;
            v50 = v196;
            v51 = v197;
            v52 = v33;
            if ((_DWORD)v29 != objc_msgSend_state(v196, v46, v47, v48, v49))
              goto LABEL_20;
          }
          else
          {
            v53 = v30;
            v54 = v31;
            v55 = v25;
            v56 = v29;
            v57 = v195;
            if (v195 <= v38)
              v57 = v38;
            v50 = v197;
            v51 = v33;
            v52 = v196;
            v195 = v57;
            v58 = v57 == objc_msgSend_state(v197, v46, v47, v48, v49);
            v29 = v56;
            v25 = v55;
            v31 = v54;
            v30 = v53;
            v28 = v194;
            if (!v58)
            {
LABEL_20:
              v59 = v33;

              v196 = v52;
              v197 = v51;
            }
          }
        }
      }
      ++v32;
    }
    while (v28 != v32);
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v34, (uint64_t)&v198, (uint64_t)v204, 16);
  }
  while (v28);
LABEL_25:

  v60 = v193;
  objc_msgSend__sendProxyUpdate(v193, v61, v62, v63, v64);
  if ((_DWORD)v29 == 5)
  {

    v196 = 0;
    v29 = 0;
  }
  v69 = v195;
  if (v195 == 5)
  {

    v197 = 0;
    v69 = 0;
  }
  if (!(v29 | v69))
  {
    sub_2190076D0();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringDescriptionForIMAVChatState(0);
      v71 = (IMPowerAssertion *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v203 = v71;
      _os_log_impl(&dword_218FEA000, v70, OS_LOG_TYPE_DEFAULT, "Ending logging session with state: %@", buf, 0xCu);

    }
    sub_2190076D0();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend__FTCalls(v193, v73, v74, v75, v76);
      v77 = (IMPowerAssertion *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v203 = v77;
      _os_log_impl(&dword_218FEA000, v72, OS_LOG_TYPE_DEFAULT, "Remaining chats: %@", buf, 0xCu);

    }
  }
  objc_msgSend_sharedInstance(IMAVController, v65, v66, v67, v68);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  shouldRunConferences = objc_msgSend__shouldRunConferences(v78, v79, v80, v81, v82);

  if (shouldRunConferences)
  {
    v88 = v29;
    v89 = v69;
    avCallState = v193->_avCallState;
    v91 = (void *)MEMORY[0x24BDBCE70];
    v92 = v88;
    _NSStringDescriptionForIMAVChatState(v88);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    _NSStringDescriptionForIMAVChatState(avCallState);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_timeIntervalSinceNow(v193->_lastCallStateChange, v96, v97, v98, v99);
    objc_msgSend_stringWithFormat_(v95, v101, (uint64_t)CFSTR("%.1f"), v102, v103, fabs(v100));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObjectsAndKeys_(v91, v105, (uint64_t)v93, v106, v107, CFSTR("CurrentState"), v94, CFSTR("PreviousState"), v104, CFSTR("TimeSinceLastStateChange"), 0);
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    if (qword_253DE9478 != -1)
      dispatch_once(&qword_253DE9478, &unk_24DA57718);
    v60 = v193;
    v69 = v89;
    if (off_253DE9470)
      off_253DE9470(8, CFSTR("VideoCallStateChange"), v108, 0);

    v29 = v92;
  }
  objc_msgSend_sharedInstance(IMAVController, v84, v85, v86, v87);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend__shouldRunACConferences(v109, v110, v111, v112, v113);

  if (v114)
  {
    acCallState = v60->_acCallState;
    v120 = (void *)MEMORY[0x24BDBCE70];
    v121 = v69;
    _NSStringDescriptionForIMAVChatState(v69);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    _NSStringDescriptionForIMAVChatState(acCallState);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_timeIntervalSinceNow(v60->_lastCallStateChange, v125, v126, v127, v128);
    objc_msgSend_stringWithFormat_(v124, v130, (uint64_t)CFSTR("%.1f"), v131, v132, fabs(v129));
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObjectsAndKeys_(v120, v134, (uint64_t)v122, v135, v136, CFSTR("CurrentState"), v123, CFSTR("PreviousState"), v133, CFSTR("TimeSinceLastStateChange"), 0);
    v137 = (void *)objc_claimAutoreleasedReturnValue();

    if (qword_25503B908 != -1)
      dispatch_once(&qword_25503B908, &unk_24DA57738);
    v60 = v193;
    v69 = v121;
    if (off_25503B900)
      off_25503B900(8, CFSTR("AudioCallStateChange"), v137, 0);

  }
  objc_msgSend_date(MEMORY[0x24BDBCE60], v115, v116, v117, v118);
  v138 = objc_claimAutoreleasedReturnValue();
  lastCallStateChange = v60->_lastCallStateChange;
  v60->_lastCallStateChange = (NSDate *)v138;

  objc_msgSend_sharedInstance(IMAVController, v140, v141, v142, v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = objc_msgSend__shouldRunConferences(v144, v145, v146, v147, v148);

  if (v149)
  {
    objc_msgSend__setAVCallState_(v60, v150, v29, v152, v153);
    notify_set_state(v60->_avToken, v29);
    notify_post("kIMAVCoreAVCallStateChanged");
  }
  objc_msgSend_sharedInstance(IMAVController, v150, v151, v152, v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = objc_msgSend__shouldRunACConferences(v154, v155, v156, v157, v158);

  if (v159)
  {
    objc_msgSend__setACCallState_(v60, v160, v69, v162, v163);
    notify_set_state(v60->_acToken, v69);
    notify_post("kIMAVCoreACCallStateChanged");
  }
  objc_msgSend_sharedInstance(IMAVController, v160, v161, v162, v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = objc_msgSend__shouldRunConferences(v164, v165, v166, v167, v168);

  objc_msgSend_sharedInstance(IMAVController, v170, v171, v172, v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = objc_msgSend__shouldRunACConferences(v174, v175, v176, v177, v178);

  if ((_DWORD)v29)
    v180 = v169;
  else
    v180 = 0;
  if ((_DWORD)v69)
    v181 = v179;
  else
    v181 = 0;
  powerAssertion = v60->_powerAssertion;
  if ((v180 & 1) != 0 || (v181 & 1) != 0)
  {
    if (!powerAssertion)
    {
      v186 = objc_alloc(MEMORY[0x24BE50348]);
      v190 = objc_msgSend_initWithIdentifier_(v186, v187, (uint64_t)CFSTR("ActiveFaceTimeConferenceAssertion"), v188, v189);
      v191 = v60->_powerAssertion;
      v60->_powerAssertion = (IMPowerAssertion *)v190;

      sub_2190076D0();
      v185 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
      {
        v192 = v60->_powerAssertion;
        *(_DWORD *)buf = 138412290;
        v203 = v192;
        _os_log_impl(&dword_218FEA000, v185, OS_LOG_TYPE_DEFAULT, "Setting power assertion: %@", buf, 0xCu);
      }
LABEL_66:

    }
  }
  else if (powerAssertion)
  {
    sub_2190076D0();
    v183 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
    {
      v184 = v60->_powerAssertion;
      *(_DWORD *)buf = 138412290;
      v203 = v184;
      _os_log_impl(&dword_218FEA000, v183, OS_LOG_TYPE_DEFAULT, "Releasing power assertion: %@", buf, 0xCu);
    }

    v185 = v60->_powerAssertion;
    v60->_powerAssertion = 0;
    goto LABEL_66;
  }

}

- (void)_addAVChatProxy:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *guidToAVChatProxyMap;
  NSMutableArray *v11;
  NSMutableArray *avChatProxyArray;
  NSMutableDictionary *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSMutableDictionary *v21;
  int v22;
  NSMutableDictionary *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!self->_guidToAVChatProxyMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    guidToAVChatProxyMap = self->_guidToAVChatProxyMap;
    self->_guidToAVChatProxyMap = Mutable;

  }
  if (!self->_avChatProxyArray)
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    avChatProxyArray = self->_avChatProxyArray;
    self->_avChatProxyArray = v11;

  }
  v13 = self->_guidToAVChatProxyMap;
  objc_msgSend_GUID(v8, v4, v5, v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v13, v15, (uint64_t)v8, (uint64_t)v14, v16);

  objc_msgSend_addObject_(self->_avChatProxyArray, v17, (uint64_t)v8, v18, v19);
  sub_2190076D0();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = self->_guidToAVChatProxyMap;
    v22 = 138412290;
    v23 = v21;
    _os_log_impl(&dword_218FEA000, v20, OS_LOG_TYPE_DEFAULT, "New AV proxy map after add %@", (uint8_t *)&v22, 0xCu);
  }

}

- (void)_addACChatProxy:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *guidToACChatProxyMap;
  NSMutableArray *v11;
  NSMutableArray *acChatProxyArray;
  NSMutableDictionary *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSMutableDictionary *v21;
  int v22;
  NSMutableDictionary *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!self->_guidToACChatProxyMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    guidToACChatProxyMap = self->_guidToACChatProxyMap;
    self->_guidToACChatProxyMap = Mutable;

  }
  if (!self->_acChatProxyArray)
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    acChatProxyArray = self->_acChatProxyArray;
    self->_acChatProxyArray = v11;

  }
  v13 = self->_guidToACChatProxyMap;
  objc_msgSend_GUID(v8, v4, v5, v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v13, v15, (uint64_t)v8, (uint64_t)v14, v16);

  objc_msgSend_addObject_(self->_acChatProxyArray, v17, (uint64_t)v8, v18, v19);
  sub_2190076D0();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = self->_guidToACChatProxyMap;
    v22 = 138412290;
    v23 = v21;
    _os_log_impl(&dword_218FEA000, v20, OS_LOG_TYPE_DEFAULT, "New AC proxy map after add %@", (uint8_t *)&v22, 0xCu);
  }

}

- (void)_updateAVChatProxyWithInfo:(id)a3
{
  id v4;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *guidToAVChatProxyMap;
  NSMutableArray *v7;
  NSMutableArray *avChatProxyArray;
  NSObject *v9;
  NSMutableDictionary *v10;
  id v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t i;
  NSMutableDictionary *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  int isEqualToIgnoringCase;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  _BOOL4 v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  IMAVChatProxy *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  NSMutableDictionary *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t k;
  void *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  NSMutableDictionary *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  NSMutableDictionary *v103;
  __int128 v104;
  id obj;
  uint64_t v106;
  IMAVCallManager *v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  uint8_t v123[128];
  uint8_t buf[4];
  NSMutableDictionary *v125;
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_guidToAVChatProxyMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    guidToAVChatProxyMap = self->_guidToAVChatProxyMap;
    self->_guidToAVChatProxyMap = Mutable;

  }
  if (!self->_avChatProxyArray)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    avChatProxyArray = self->_avChatProxyArray;
    self->_avChatProxyArray = v7;

  }
  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_guidToAVChatProxyMap;
    *(_DWORD *)buf = 138412290;
    v125 = v10;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "Old AV proxy map %@", buf, 0xCu);
  }

  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  obj = v4;
  v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v117, (uint64_t)v123, 16);
  if (v108)
  {
    v106 = *(_QWORD *)v118;
    *(_QWORD *)&v16 = 138412290;
    v104 = v16;
    v107 = self;
    do
    {
      for (i = 0; i != v108; ++i)
      {
        if (*(_QWORD *)v118 != v106)
          objc_enumerationMutation(obj);
        v18 = *(NSMutableDictionary **)(*((_QWORD *)&v117 + 1) + 8 * i);
        objc_msgSend_objectForKey_(v18, v13, (uint64_t)CFSTR("GUID"), v14, v15, v104);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = v11;
          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          objc_msgSend__calls(self, v19, v20, v21, v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v113, (uint64_t)v122, 16);
          if (v27)
          {
            v32 = v27;
            v33 = *(_QWORD *)v114;
            while (2)
            {
              for (j = 0; j != v32; ++j)
              {
                if (*(_QWORD *)v114 != v33)
                  objc_enumerationMutation(v25);
                objc_msgSend_GUID(*(void **)(*((_QWORD *)&v113 + 1) + 8 * j), v28, v29, v30, v31);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v35, v36, (uint64_t)v23, v37, v38);

                if (isEqualToIgnoringCase)
                {
                  sub_2190076D0();
                  v53 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_218FEA000, v53, OS_LOG_TYPE_DEFAULT, "Ignoring proxy update, we own the real IMAVChat object", buf, 2u);
                  }

                  v11 = v24;
                  objc_msgSend_addObject_(v24, v54, (uint64_t)v23, v55, v56);
                  goto LABEL_41;
                }
              }
              v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v113, (uint64_t)v122, 16);
              if (v32)
                continue;
              break;
            }
          }

          sub_2190076D0();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v104;
            v125 = v18;
            _os_log_impl(&dword_218FEA000, v40, OS_LOG_TYPE_DEFAULT, "Updating chat proxy with info %@", buf, 0xCu);
          }

          v11 = v24;
          objc_msgSend_addObject_(v24, v41, (uint64_t)v23, v42, v43);
          objc_msgSend_objectForKey_(v107->_guidToAVChatProxyMap, v44, (uint64_t)v23, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          sub_2190076D0();
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
          if (v47)
          {
            if (v49)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_218FEA000, v48, OS_LOG_TYPE_DEFAULT, "Found existing proxy, updating...", buf, 2u);
            }

            objc_msgSend_updateWithInfo_(v47, v50, (uint64_t)v18, v51, v52);
          }
          else
          {
            if (v49)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_218FEA000, v48, OS_LOG_TYPE_DEFAULT, "Creating new proxy", buf, 2u);
            }

            v59 = objc_alloc_init(IMAVChatProxy);
            objc_msgSend_setObject_forKey_(v107->_guidToAVChatProxyMap, v60, (uint64_t)v59, (uint64_t)v23, v61);
            objc_msgSend_addObject_(v107->_avChatProxyArray, v62, (uint64_t)v59, v63, v64);
            objc_msgSend_updateWithInfo_(v59, v65, (uint64_t)v18, v66, v67);
            sub_2190076D0();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              v69 = v107->_guidToAVChatProxyMap;
              *(_DWORD *)buf = v104;
              v125 = v69;
              _os_log_impl(&dword_218FEA000, v68, OS_LOG_TYPE_DEFAULT, "AV Proxy Map: %@", buf, 0xCu);
            }

          }
LABEL_41:
          self = v107;
        }
        else
        {
          sub_2190076D0();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_218FEA000, v57, OS_LOG_TYPE_DEFAULT, "No GUID in proxy update, ignoring...", buf, 2u);
          }

          sub_2190076D0();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v104;
            v125 = v18;
            _os_log_impl(&dword_218FEA000, v58, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }

        }
      }
      v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v117, (uint64_t)v123, 16);
    }
    while (v108);
  }

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v74 = (void *)objc_msgSend__copyForEnumerating(self->_avChatProxyArray, v70, v71, v72, v73);
  v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v75, (uint64_t)&v109, (uint64_t)v121, 16);
  if (v76)
  {
    v81 = v76;
    v82 = *(_QWORD *)v110;
    do
    {
      for (k = 0; k != v81; ++k)
      {
        if (*(_QWORD *)v110 != v82)
          objc_enumerationMutation(v74);
        v84 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * k);
        objc_msgSend_GUID(v84, v77, v78, v79, v80);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend_containsObject_(v11, v86, (uint64_t)v85, v87, v88);

        if ((v89 & 1) == 0)
        {
          v90 = self->_guidToAVChatProxyMap;
          objc_msgSend_GUID(v84, v77, v78, v79, v80);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectForKey_(v90, v92, (uint64_t)v91, v93, v94);

          objc_msgSend_removeObjectIdenticalTo_(self->_avChatProxyArray, v95, (uint64_t)v84, v96, v97);
          objc_msgSend_finalUpdate(v84, v98, v99, v100, v101);
        }
      }
      v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v77, (uint64_t)&v109, (uint64_t)v121, 16);
    }
    while (v81);
  }

  sub_2190076D0();
  v102 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    v103 = self->_guidToAVChatProxyMap;
    *(_DWORD *)buf = 138412290;
    v125 = v103;
    _os_log_impl(&dword_218FEA000, v102, OS_LOG_TYPE_DEFAULT, "New AV proxy map %@", buf, 0xCu);
  }

}

- (void)_updateACChatProxyWithInfo:(id)a3
{
  id v4;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *guidToACChatProxyMap;
  NSMutableArray *v7;
  NSMutableArray *acChatProxyArray;
  NSObject *v9;
  NSMutableDictionary *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t i;
  NSMutableDictionary *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  int isEqualToIgnoringCase;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  _BOOL4 v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  IMAVChatProxy *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  NSMutableDictionary *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  void *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  NSMutableDictionary *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  NSMutableDictionary *v100;
  __int128 v101;
  id obj;
  uint64_t v103;
  uint64_t v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint8_t v120[128];
  uint8_t buf[4];
  NSMutableDictionary *v122;
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_guidToACChatProxyMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    guidToACChatProxyMap = self->_guidToACChatProxyMap;
    self->_guidToACChatProxyMap = Mutable;

  }
  if (!self->_acChatProxyArray)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    acChatProxyArray = self->_acChatProxyArray;
    self->_acChatProxyArray = v7;

  }
  v105 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_guidToACChatProxyMap;
    *(_DWORD *)buf = 138412290;
    v122 = v10;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "Old AC proxy map %@", buf, 0xCu);
  }

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  obj = v4;
  v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v114, (uint64_t)v120, 16);
  if (v104)
  {
    v103 = *(_QWORD *)v115;
    *(_QWORD *)&v15 = 138412290;
    v101 = v15;
    do
    {
      for (i = 0; i != v104; ++i)
      {
        if (*(_QWORD *)v115 != v103)
          objc_enumerationMutation(obj);
        v17 = *(NSMutableDictionary **)(*((_QWORD *)&v114 + 1) + 8 * i);
        objc_msgSend_objectForKey_(v17, v12, (uint64_t)CFSTR("GUID"), v13, v14, v101);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v112 = 0u;
          v113 = 0u;
          v110 = 0u;
          v111 = 0u;
          objc_msgSend__calls(self, v18, v19, v20, v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v110, (uint64_t)v119, 16);
          if (v25)
          {
            v30 = v25;
            v31 = *(_QWORD *)v111;
            while (2)
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v111 != v31)
                  objc_enumerationMutation(v23);
                objc_msgSend_GUID(*(void **)(*((_QWORD *)&v110 + 1) + 8 * j), v26, v27, v28, v29);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v33, v34, (uint64_t)v22, v35, v36);

                if (isEqualToIgnoringCase)
                {
                  sub_2190076D0();
                  v51 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_218FEA000, v51, OS_LOG_TYPE_DEFAULT, "Ignoring proxy update, we own the real IMAVChat object", buf, 2u);
                  }

                  objc_msgSend_addObject_(v105, v52, (uint64_t)v22, v53, v54);
                  goto LABEL_40;
                }
              }
              v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v110, (uint64_t)v119, 16);
              if (v30)
                continue;
              break;
            }
          }

          sub_2190076D0();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v101;
            v122 = v17;
            _os_log_impl(&dword_218FEA000, v38, OS_LOG_TYPE_DEFAULT, "Updating chat proxy with info %@", buf, 0xCu);
          }

          objc_msgSend_addObject_(v105, v39, (uint64_t)v22, v40, v41);
          objc_msgSend_objectForKey_(self->_guidToACChatProxyMap, v42, (uint64_t)v22, v43, v44);
          v45 = objc_claimAutoreleasedReturnValue();
          sub_2190076D0();
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
          if (v45)
          {
            if (v47)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_218FEA000, v46, OS_LOG_TYPE_DEFAULT, "Found existing proxy, updating...", buf, 2u);
            }

            objc_msgSend_updateWithInfo_(v45, v48, (uint64_t)v17, v49, v50);
          }
          else
          {
            if (v47)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_218FEA000, v46, OS_LOG_TYPE_DEFAULT, "Creating new proxy", buf, 2u);
            }

            v56 = objc_alloc_init(IMAVChatProxy);
            objc_msgSend_setObject_forKey_(self->_guidToACChatProxyMap, v57, (uint64_t)v56, (uint64_t)v22, v58);
            objc_msgSend_addObject_(self->_acChatProxyArray, v59, (uint64_t)v56, v60, v61);
            objc_msgSend_updateWithInfo_(v56, v62, (uint64_t)v17, v63, v64);
            sub_2190076D0();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              v66 = self->_guidToACChatProxyMap;
              *(_DWORD *)buf = v101;
              v122 = v66;
              _os_log_impl(&dword_218FEA000, v65, OS_LOG_TYPE_DEFAULT, "AC Proxy Map: %@", buf, 0xCu);
            }

          }
        }
        else
        {
          sub_2190076D0();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_218FEA000, v55, OS_LOG_TYPE_DEFAULT, "No GUID in proxy update, ignoring...", buf, 2u);
          }

          sub_2190076D0();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v101;
            v122 = v17;
            _os_log_impl(&dword_218FEA000, v45, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }
        }

LABEL_40:
      }
      v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v114, (uint64_t)v120, 16);
    }
    while (v104);
  }

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v71 = (void *)objc_msgSend__copyForEnumerating(self->_acChatProxyArray, v67, v68, v69, v70);
  v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v72, (uint64_t)&v106, (uint64_t)v118, 16);
  if (v73)
  {
    v78 = v73;
    v79 = *(_QWORD *)v107;
    do
    {
      for (k = 0; k != v78; ++k)
      {
        if (*(_QWORD *)v107 != v79)
          objc_enumerationMutation(v71);
        v81 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * k);
        objc_msgSend_GUID(v81, v74, v75, v76, v77);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend_containsObject_(v105, v83, (uint64_t)v82, v84, v85);

        if ((v86 & 1) == 0)
        {
          v87 = self->_guidToACChatProxyMap;
          objc_msgSend_GUID(v81, v74, v75, v76, v77);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectForKey_(v87, v89, (uint64_t)v88, v90, v91);

          objc_msgSend_removeObjectIdenticalTo_(self->_acChatProxyArray, v92, (uint64_t)v81, v93, v94);
          objc_msgSend_finalUpdate(v81, v95, v96, v97, v98);
        }
      }
      v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v74, (uint64_t)&v106, (uint64_t)v118, 16);
    }
    while (v78);
  }

  sub_2190076D0();
  v99 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    v100 = self->_guidToACChatProxyMap;
    *(_DWORD *)buf = 138412290;
    v122 = v100;
    _os_log_impl(&dword_218FEA000, v99, OS_LOG_TYPE_DEFAULT, "New AC proxy map %@", buf, 0xCu);
  }

}

- (void)_sendProxyUpdate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int shouldRunConferences;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
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
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int shouldRunACConferences;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[16];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  shouldRunConferences = objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10);

  v16 = 0x24BE50000;
  if (shouldRunConferences)
  {
    v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    objc_msgSend_calls(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v90, (uint64_t)v95, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v91;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v91 != v26)
            objc_enumerationMutation(v22);
          v28 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v27);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_isVideo(v28, v29, v30, v31, v32))
          {
            objc_msgSend__proxyRepresentation(v28, v29, v33, v34, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v17, v37, (uint64_t)v36, v38, v39);

          }
          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v29, (uint64_t)&v90, (uint64_t)v95, 16);
      }
      while (v25);
    }

    sub_2190076D0();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v40, OS_LOG_TYPE_DEFAULT, "Sending video chat proxy update", buf, 2u);
    }

    v16 = 0x24BE50000uLL;
    objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_ofProperty_(v45, v46, (uint64_t)v17, (uint64_t)CFSTR("AVChatProxy"), v47);

  }
  objc_msgSend_sharedInstance(IMAVController, v12, v13, v14, v15);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  shouldRunACConferences = objc_msgSend__shouldRunACConferences(v48, v49, v50, v51, v52);

  if (shouldRunACConferences)
  {
    v54 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    objc_msgSend_calls(self, v55, v56, v57, v58, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v85, (uint64_t)v94, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v86;
      do
      {
        v64 = 0;
        do
        {
          if (*(_QWORD *)v86 != v63)
            objc_enumerationMutation(v59);
          v65 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v64);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend_isVideo(v65, v66, v67, v68, v69) & 1) == 0)
          {
            objc_msgSend__proxyRepresentation(v65, v66, v70, v71, v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v54, v74, (uint64_t)v73, v75, v76);

          }
          ++v64;
        }
        while (v62 != v64);
        v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v66, (uint64_t)&v85, (uint64_t)v94, 16);
      }
      while (v62);
    }

    sub_2190076D0();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v77, OS_LOG_TYPE_DEFAULT, "Sending audio chat proxy update", buf, 2u);
    }

    objc_msgSend_sharedInstance(*(void **)(v16 + 720), v78, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_ofProperty_(v82, v83, (uint64_t)v54, (uint64_t)CFSTR("ACChatProxy"), v84);

  }
}

- (BOOL)hasActiveCall
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v5 = objc_msgSend_callState(self, a2, v2, v3, v4);
  return v5 != 5 && v5 != 0;
}

- (BOOL)_hasActiveFaceTimeCall
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  v4 = objc_msgSend__callStateForType_(self, a2, 1, v2, v3);
  return v4 != 5 && v4 != 0;
}

- (BOOL)_hasActiveAudioCall
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  v4 = objc_msgSend__callStateForType_(self, a2, 2, v2, v3);
  return v4 != 5 && v4 != 0;
}

- (id)_activeFaceTimeCall
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  int v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend__FTCalls(self, a2, v2, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend_isVideo(v14, v7, v8, v9, v10))
        {
          v15 = objc_msgSend_state(v14, v7, v8, v9, v10);
          if (v15 != 5 && v15 != 0)
          {
            v11 = v14;
            goto LABEL_14;
          }
        }
      }
      v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v11);
  }
LABEL_14:

  return v11;
}

- (id)_activeAudioCall
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  int v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend__FTCalls(self, a2, v2, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend_isVideo(v14, v7, v8, v9, v10) & 1) == 0)
        {
          v15 = objc_msgSend_state(v14, v7, v8, v9, v10);
          if (v15 != 5 && v15 != 0)
          {
            v11 = v14;
            goto LABEL_14;
          }
        }
      }
      v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v11);
  }
LABEL_14:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCallStateChange, 0);
  objc_storeStrong((id *)&self->_guidToAVChatProxyMap, 0);
  objc_storeStrong((id *)&self->_guidToACChatProxyMap, 0);
  objc_storeStrong((id *)&self->_avChatProxyArray, 0);
  objc_storeStrong((id *)&self->_acChatProxyArray, 0);
  objc_storeStrong((id *)&self->_chatArray, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
}

@end
