@implementation XRSpace

+ (void)runWhenOperationFinishes:(id)a3 block:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  XRFollowUpBlock *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v9 = a4;
  if (v18 && !objc_msgSend_isFinished(v18, v5, v6, v7, v8))
  {
    v11 = [XRFollowUpBlock alloc];
    v10 = objc_msgSend_initWithBlock_operation_(v11, v12, (uint64_t)v9, (uint64_t)v18, v13);
    objc_msgSend_go(v10, v14, v15, v16, v17);
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v10, v9);
  }

}

- (XRSpace)initWithQueue:(id)a3
{
  id v5;
  XRSpace *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void **p_queue;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
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
  uint64_t v30;
  NSMutableString *tag;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSMutableDictionary *userDataByToken;
  uint64_t v38;
  NSMutableSet *notificationShims;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSString *opName;
  objc_super v52;

  v5 = a3;
  v52.receiver = self;
  v52.super_class = (Class)XRSpace;
  v6 = -[XRSpace init](&v52, sel_init);
  if (v6)
  {
    v7 = (void *)objc_opt_class();
    v6->_supportsOpNames = objc_msgSend_instancesRespondToSelector_(v7, v8, (uint64_t)sel_name, v9, v10);
    v11 = (void *)objc_opt_class();
    v6->_overridesQoS = objc_msgSend_instancesRespondToSelector_(v11, v12, (uint64_t)sel_setQualityOfService_, v13, v14);
    p_queue = (void **)&v6->_queue;
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_msgSend_addObserver_forKeyPath_options_context_(v6->_queue, v16, (uint64_t)v6, (uint64_t)CFSTR("operationCount"), 1, 0);
    objc_msgSend_spaceName(v6, v17, v18, v19, v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      objc_msgSend_setName_(*p_queue, v21, (uint64_t)v25, v23, v24);
    if (objc_msgSend_isSerial(v6, v21, v22, v23, v24))
      objc_msgSend_setMaxConcurrentOperationCount_(*p_queue, v26, 1, v28, v29);
    if (v6->_overridesQoS)
      objc_msgSend_setQualityOfService_(*p_queue, v26, -1, v28, v29);
    v30 = objc_msgSend_mutableCopy(v25, v26, v27, v28, v29);
    tag = v6->_tag;
    v6->_tag = (NSMutableString *)v30;

    v32 = objc_alloc(MEMORY[0x24BDBCED8]);
    v36 = objc_msgSend_initWithCapacity_(v32, v33, 5, v34, v35);
    userDataByToken = v6->_userDataByToken;
    v6->_userDataByToken = (NSMutableDictionary *)v36;

    v38 = objc_opt_new();
    notificationShims = v6->_notificationShims;
    v6->_notificationShims = (NSMutableSet *)v38;

    v40 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend_spaceName(v6, v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend_initWithFormat_(v40, v46, (uint64_t)CFSTR("%@ op"), v47, v48, v45);
    opName = v6->_opName;
    v6->_opName = (NSString *)v49;

  }
  return v6;
}

- (XRSpace)init
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  XRSpace *v7;

  v3 = (void *)objc_opt_new();
  v7 = (XRSpace *)objc_msgSend_initWithQueue_(self, v4, (uint64_t)v3, v5, v6);

  return v7;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_removeObserver_forKeyPath_(self->_queue, a2, (uint64_t)self, (uint64_t)CFSTR("operationCount"), v2);
  v4.receiver = self;
  v4.super_class = (Class)XRSpace;
  -[XRSpace dealloc](&v4, sel_dealloc);
}

- (void)_postQueueStateChanged
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;
  id v20;

  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], a2, v2, v3, v4);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentThread(MEMORY[0x24BDD17F0], v6, v7, v8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v19 != v10)
    DVTIUAssertMainThread((uint64_t)"-[XRSpace _postQueueStateChanged]", (const char *)0x62, v12, v13, v14);
  if (qword_25583C658 != -1)
    dispatch_once(&qword_25583C658, &unk_24EDC2A10);
  objc_msgSend_defaultQueue(MEMORY[0x24BDD16D8], v11, v12, v13, v14);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_notificationWithName_object_(MEMORY[0x24BDD16C8], v15, (uint64_t)CFSTR("XRSpaceQueueCountChangedNotification"), (uint64_t)self, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enqueueNotification_postingStyle_coalesceMask_forModes_(v20, v18, (uint64_t)v17, 1, 3, qword_25583C660);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend_isEqual_(v10, v13, (uint64_t)CFSTR("operationCount"), v14, v15)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(self, v16, (uint64_t)sel__postQueueStateChanged, 0, 0);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)XRSpace;
    -[XRSpace observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)addOperation:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = (id)objc_msgSend__scheduleOperationFromCurrentQueue_(self, a2, (uint64_t)a3, v3, v4);
}

- (id)_scheduleOperationFromCurrentQueue:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  if ((objc_msgSend_isOpValidForSpace_(self, v5, (uint64_t)v4, v6, v7) & 1) == 0)
    objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v8, (uint64_t)CFSTR("XRInvalidOperationForSpaceException"), (uint64_t)CFSTR("%@ is invalid in %@"), v11, v4, self);
  if (self->_supportsOpNames)
  {
    objc_msgSend_name(v4, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      objc_msgSend_setName_(v4, v8, (uint64_t)self->_opName, v10, v11);
  }
  objc_msgSend_addOperation_(self->_queue, v8, (uint64_t)v4, v10, v11);
  return v4;
}

- (id)afterOperation:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_226350774;
  v11[3] = &unk_24EDC2D48;
  v12 = v6;
  v7 = v6;
  objc_msgSend_afterOperation_priority_spaceBlock_(self, v8, (uint64_t)a3, 0, (uint64_t)v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)afterOperation:(id)a3 spaceBlock:(id)a4
{
  objc_msgSend_afterOperation_priority_spaceBlock_(self, a2, (uint64_t)a3, 0, (uint64_t)a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)afterOperations:(id)a3 priority:(int64_t)a4 spaceBlock:(id)a5
{
  id v8;
  id v9;
  XRSpaceBlockOp *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = [XRSpaceBlockOp alloc];
  v14 = (void *)objc_msgSend_initWithSpaceBlock_(v10, v11, (uint64_t)v9, v12, v13);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = v8;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v32;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v15);
        objc_msgSend_addDependency_(v14, v17, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v22++), v18, v19, (_QWORD)v31);
      }
      while (v20 != v22);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v20);
  }

  objc_msgSend_setQueuePriority_(v14, v23, a4, v24, v25);
  objc_msgSend__scheduleOperationFromCurrentQueue_(self, v26, (uint64_t)v14, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)afterOperation:(id)a3 priority:(int64_t)a4 spaceBlock:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v11 = a5;
  if (v8)
  {
    v16[0] = v8;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, (uint64_t)v16, 1, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_afterOperations_priority_spaceBlock_(self, v13, (uint64_t)v12, a4, (uint64_t)v11);
  }
  else
  {
    v12 = 0;
    objc_msgSend_afterOperations_priority_spaceBlock_(self, v9, 0, a4, (uint64_t)v11);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)

  return v14;
}

- (id)afterOperationsRunBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  void *v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  id *v34;
  uint64_t v35;

  v4 = a3;
  v34 = 0;
  objc_opt_class();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_226350CE4;
  v32 = sub_226350CF4;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  if (!NSClassFromString(CFSTR("NSBlock")))
    __assert_rtn("-[XRSpace afterOperationsRunBlock:]", "XRSpace.mm", 182, "MyBlockClass != nil");
  v34 = (id *)&v35;
  v5 = objc_alloc_init(MEMORY[0x24BDD1478]);
  v6 = (void *)v29[5];
  v29[5] = (uint64_t)v5;

  v7 = v4;
  v11 = v7;
  v12 = v7;
  if (*((_BYTE *)v25 + 24))
  {
    v13 = v7;
    while (1)
    {
      if (v13)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_addDependency_((void *)v29[5], v14, (uint64_t)v13, v15, v16);
        }
        else if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_addExecutionBlock_((void *)v29[5], v17, (uint64_t)v13, v18, v19);
          *((_BYTE *)v25 + 24) = 0;
        }
        else
        {
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = sub_226350CFC;
          v23[3] = &unk_24EDC2D70;
          v23[4] = &v24;
          v23[5] = &v28;
          DVTIUAssertRecover((uint64_t)"-[XRSpace afterOperationsRunBlock:]", 212, v23);
        }
      }
      if (!*((_BYTE *)v25 + 24))
        break;
      v20 = v34++;
      v12 = *v20;

      v13 = v12;
      if (!*((_BYTE *)v25 + 24))
        goto LABEL_14;
    }
    v12 = v13;
  }
LABEL_14:
  objc_msgSend__scheduleOperationFromCurrentQueue_(self, v8, v29[5], v9, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v21;
}

- (id)storeUserData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  XRSpaceDataToken *v10;
  NSMutableString *tag;
  unint64_t seqNum;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  if ((objc_msgSend_currentlyInThisSpace(self, v5, v6, v7, v8) & 1) == 0)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_226350E7C;
    v19[3] = &unk_24EDC2D98;
    v19[4] = &v20;
    DVTIUAssertRecover((uint64_t)"-[XRSpace storeUserData:]", 231, v19);
  }
  if (*((_BYTE *)v21 + 24))
  {
    v9 = self->_userDataByToken;
    objc_sync_enter(v9);
    v10 = [XRSpaceDataToken alloc];
    tag = self->_tag;
    seqNum = self->_seqNum;
    self->_seqNum = seqNum + 1;
    v15 = (void *)objc_msgSend_initWithSpaceTag_sequenceID_(v10, v13, (uint64_t)tag, seqNum, v14);
    objc_msgSend_setObject_forKey_(self->_userDataByToken, v16, (uint64_t)v4, (uint64_t)v15, v17);
    objc_sync_exit(v9);

  }
  else
  {
    v15 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v15;
}

- (void)replaceUserData:(id)a3 forToken:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  const char *v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  if ((objc_msgSend_currentlyInThisSpace(self, v8, v9, v10, v11) & 1) == 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_226350FE4;
    v15[3] = &unk_24EDC2D98;
    v15[4] = &v16;
    DVTIUAssertRecover((uint64_t)"-[XRSpace replaceUserData:forToken:]", 253, v15);
  }
  if (*((_BYTE *)v17 + 24))
  {
    v12 = self->_userDataByToken;
    objc_sync_enter(v12);
    if (v7)
      objc_msgSend_setObject_forKey_(self->_userDataByToken, v13, (uint64_t)v6, (uint64_t)v7, v14);
    objc_sync_exit(v12);

  }
  _Block_object_dispose(&v16, 8);

}

- (void)removeUserDataForToken:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  if ((objc_msgSend_currentlyInThisSpace(self, v5, v6, v7, v8) & 1) == 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_226351134;
    v13[3] = &unk_24EDC2D98;
    v13[4] = &v14;
    DVTIUAssertRecover((uint64_t)"-[XRSpace removeUserDataForToken:]", 272, v13);
  }
  if (*((_BYTE *)v15 + 24))
  {
    v9 = self->_userDataByToken;
    objc_sync_enter(v9);
    if (v4)
      objc_msgSend_removeObjectForKey_(self->_userDataByToken, v10, (uint64_t)v4, v11, v12);
    objc_sync_exit(v9);

  }
  _Block_object_dispose(&v14, 8);

}

- (id)userDataForToken:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  if ((objc_msgSend_currentlyInThisSpace(self, v5, v6, v7, v8) & 1) == 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_2263512A0;
    v15[3] = &unk_24EDC2D98;
    v15[4] = &v16;
    DVTIUAssertRecover((uint64_t)"-[XRSpace userDataForToken:]", 289, v15);
  }
  if (*((_BYTE *)v17 + 24))
  {
    v9 = self->_userDataByToken;
    objc_sync_enter(v9);
    if (v4)
    {
      objc_msgSend_objectForKey_(self->_userDataByToken, v10, (uint64_t)v4, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_sync_exit(v9);

  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (BOOL)isOpValidForSpace:(id)a3
{
  return 1;
}

- (id)spaceName
{
  return 0;
}

- (BOOL)isSerial
{
  return 0;
}

- (BOOL)currentlyInThisSpace
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSOperationQueue *v6;

  objc_msgSend_currentQueue(MEMORY[0x24BDD1710], a2, v2, v3, v4);
  v6 = (NSOperationQueue *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v6 == self->_queue;

  return (char)self;
}

- (unint64_t)operationCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_operationCount(self->_queue, a2, v2, v3, v4);
}

- (BOOL)isBusy
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_operationCount(self->_queue, a2, v2, v3, v4) != 0;
}

- (void)requestLocalNotification:(id)a3 object:(id)a4 observer:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  void *v30;
  _BOOL4 v31;
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
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSOperationQueue *queue;
  id v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id location;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (_DVTIURuntimeCheckForBlockCaptureOfObject((uint64_t)v12, v11))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      sub_22636FC14();
    _DVTIUInvalidBlockCaptureBreak(v12, v11);
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v17 = (void *)objc_msgSend_copy(self->_notificationShims, v13, v14, v15, v16, v57);
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v63, (uint64_t)v67, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v64 != v24)
          objc_enumerationMutation(v17);
        v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        if (objc_msgSend_targetIsSet(v26, v19, v20, v21, v22))
        {
          objc_msgSend_target(v26, v19, v27, v21, v22);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28 == 0;

          if (v29)
            goto LABEL_13;
        }
        objc_msgSend_observer(v26, v19, v27, v21, v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30 == 0;

        if (v31)
LABEL_13:
          objc_msgSend__removeNotificationShim_(self, v19, (uint64_t)v26, v21, v22);
      }
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v63, (uint64_t)v67, 16);
    }
    while (v23);
  }

  v32 = (void *)objc_opt_new();
  objc_msgSend_setObserver_(v32, v33, (uint64_t)v11, v34, v35);
  if (v10)
  {
    objc_msgSend_setTarget_(v32, v36, (uint64_t)v10, v37, v38);
    objc_msgSend_setTargetIsSet_(v32, v39, 1, v40, v41);
  }
  objc_initWeak(&location, v32);
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = sub_2263516AC;
  v59[3] = &unk_24EDC2DC0;
  objc_copyWeak(&v61, &location);
  v48 = v12;
  v60 = v48;
  objc_msgSend_addObserverForName_object_queue_usingBlock_(v46, v49, (uint64_t)v58, (uint64_t)v10, (uint64_t)queue, v59);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setToken_(v32, v51, (uint64_t)v50, v52, v53);

  objc_msgSend_addObject_(self->_notificationShims, v54, (uint64_t)v32, v55, v56);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);

}

- (void)stopObservationsOfObject:(id)a3 forObserver:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableSet *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  _BOOL4 v24;
  id v25;
  _BOOL4 v26;
  id v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
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

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = self->_notificationShims;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v39, (uint64_t)v44, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v40 != v20)
          objc_enumerationMutation(v13);
        v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend_observer(v22, v15, v16, v17, v18);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = v23 == v7;

        if (v24)
        {
          if (!v6
            || objc_msgSend_targetIsSet(v22, v15, v16, v17, v18)
            && (objc_msgSend_target(v22, v15, v16, v17, v18),
                v25 = (id)objc_claimAutoreleasedReturnValue(),
                v26 = v25 == v6,
                v25,
                v26))
          {
            objc_msgSend_addObject_(v12, v15, (uint64_t)v22, v17, v18);
          }
        }
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v39, (uint64_t)v44, 16);
    }
    while (v19);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = v12;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v35, (uint64_t)v43, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v27);
        objc_msgSend__removeNotificationShim_(self, v29, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), v30, v31, (_QWORD)v35);
      }
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v35, (uint64_t)v43, 16);
    }
    while (v32);
  }

}

- (void)_removeNotificationShim:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_removeObject_(self->_notificationShims, a2, (uint64_t)a3, v3, v4);
}

- (void)receiveMobileAgent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend_ticket(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_226351AD0;
  v14[3] = &unk_24EDC2DE8;
  v10 = v4;
  v15 = v10;
  v13 = (id)objc_msgSend_afterOperation_block_(self, v11, (uint64_t)v9, (uint64_t)v14, v12);

}

- (void)setupVisitAfterOperation:(id)a3 itinerary:(id)a4 mode:(id)a5
{
  objc_msgSend_setNextStop_mode_ticket_(a4, a2, (uint64_t)self, (uint64_t)a5, (uint64_t)a3);
}

- (BOOL)supportsOpNames
{
  return self->_supportsOpNames;
}

- (void)setSupportsOpNames:(BOOL)a3
{
  self->_supportsOpNames = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opName, 0);
  objc_storeStrong((id *)&self->_notificationShims, 0);
  objc_storeStrong((id *)&self->_userDataByToken, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
