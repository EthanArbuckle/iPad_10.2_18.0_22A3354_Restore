@implementation CWFSensingAutoDataCollector

+ (id)sharedCWFSensingAutoDataCollectorInstanceWith:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0655EF0;
  block[3] = &unk_1E6133138;
  v11 = v3;
  v4 = qword_1ECFD6A40;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ECFD6A40, block);
    v7 = v11;
  }
  v8 = (id)qword_1ECFD6A38;

  return v8;
}

- (CWFSensingAutoDataCollector)initWithHomes:(id)a3
{
  id v4;
  CWFSensingAutoDataCollector *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CWFSensingAutoDataCollector *v9;
  dispatch_queue_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  id v24;
  objc_super v25;
  int v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CWFSensingAutoDataCollector;
  v5 = -[CWFSensingAutoDataCollector init](&v25, sel_init);
  v9 = v5;
  if (v5)
  {
    if ((objc_msgSend_currentAccessoryInfo_(v5, v6, (uint64_t)v4, v7, v8) & 1) != 0)
    {
      v10 = dispatch_queue_create("com.apple.wifi.CWFSensingAutoDataCollector", 0);
      objc_msgSend_set_serviceQueue_(v9, v11, (uint64_t)v10, v12, v13);

      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v14, v15, v16, v17);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_set_serviceObjects_(v9, v19, (uint64_t)v18, v20, v21);
    }
    else
    {

      CWFGetOSLog();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        CWFGetOSLog();
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = MEMORY[0x1E0C81028];
        v24 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v26 = 136446722;
        v27 = "-[CWFSensingAutoDataCollector initWithHomes:]";
        v28 = 2082;
        v29 = "CWFSensingAutoDataCollector.m";
        v30 = 1024;
        v31 = 90;
        _os_log_send_and_compose_impl();
      }
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)currentAccessoryInfo:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = a3;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v32, (uint64_t)v37, 16);
  if (v5)
  {
    v10 = v5;
    v11 = 0;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend_accessories(v14, v6, v7, v8, v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v28, (uint64_t)v36, 16);
        if (v17)
        {
          v22 = v17;
          v23 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v29 != v23)
                objc_enumerationMutation(v15);
              v25 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              if (objc_msgSend_isCurrentAccessory(v25, v18, v19, v20, v21))
              {
                objc_msgSend_set_currentAccessory_(self, v18, (uint64_t)v25, v20, v21);
                v11 = 1;
                goto LABEL_16;
              }
            }
            v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v28, (uint64_t)v36, 16);
            if (v22)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v32, (uint64_t)v37, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11 & 1;
}

- (void)cleanUpOutOfScopeAccessory
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
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[6];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend__serviceObjects(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v8)
  {
    v13 = v8;
    v14 = *(_QWORD *)v21;
    v15 = MEMORY[0x1E0C809B0];
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v6);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16);
        objc_msgSend__serviceQueue(self, v9, v10, v11, v12);
        v18 = objc_claimAutoreleasedReturnValue();
        v19[0] = v15;
        v19[1] = 3221225472;
        v19[2] = sub_1B06563D0;
        v19[3] = &unk_1E61333E0;
        v19[4] = self;
        v19[5] = v17;
        dispatch_async(v18, v19);

        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v13);
  }

}

- (void)registerForAccessoriesInRoomWithDelegate:(id)a3
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
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char isCurrentAccessory;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  NSObject *v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  NSObject *v78;
  id v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  int *v85;
  uint64_t v86;
  void *v87;
  _QWORD block[4];
  id v89;
  void *v90;
  CWFSensingAutoDataCollector *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  int v96;
  const char *v97;
  __int16 v98;
  const char *v99;
  __int16 v100;
  int v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  void *v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend__currentAccessory(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_room(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v87 = v14;
  objc_msgSend_accessories(v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v92, (uint64_t)v106, 16);
  if (!v21)
    goto LABEL_19;
  v26 = v21;
  v27 = *(_QWORD *)v93;
  while (2)
  {
    for (i = 0; i != v26; ++i)
    {
      if (*(_QWORD *)v93 != v27)
        objc_enumerationMutation(v19);
      v29 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
      objc_msgSend__serviceObjects(self, v22, v23, v24, v25, v85, v86);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uniqueIdentifier(v29, v31, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v30, v36, (uint64_t)v35, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {

      }
      else
      {
        isCurrentAccessory = objc_msgSend_isCurrentAccessory(v29, v40, v41, v42, v43);

        if ((isCurrentAccessory & 1) != 0)
          continue;
        objc_msgSend_createCWFSensingHMADataCollectorFor_withOptions_andDelegate_(CWFSensingHMADataCollector, v22, (uint64_t)v29, 0, (uint64_t)v4);
        v45 = objc_claimAutoreleasedReturnValue();
        if (!v45)
        {
          CWFGetOSLog();
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (v77)
          {
            CWFGetOSLog();
            v78 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v78 = MEMORY[0x1E0C81028];
            v79 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_uniqueIdentifier(v29, v80, v81, v82, v83);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = 136446978;
            v97 = "-[CWFSensingAutoDataCollector registerForAccessoriesInRoomWithDelegate:]";
            v98 = 2082;
            v99 = "CWFSensingAutoDataCollector.m";
            v100 = 1024;
            v101 = 137;
            v102 = 2114;
            v103 = v84;
            _os_log_send_and_compose_impl();

          }
          goto LABEL_19;
        }
        v50 = (void *)v45;
        objc_msgSend__serviceQueue(self, v46, v47, v48, v49);
        v51 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1B06569C4;
        block[3] = &unk_1E6133340;
        v30 = v50;
        v89 = v30;
        v90 = v29;
        v91 = self;
        dispatch_async(v51, block);

        objc_msgSend__serviceObjects(self, v52, v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_uniqueIdentifier(v29, v57, v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v56, v62, (uint64_t)v30, (uint64_t)v61, v63);

        CWFGetOSLog();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (v64)
        {
          CWFGetOSLog();
          v65 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v65 = MEMORY[0x1E0C81028];
          v66 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_uniqueIdentifier(v29, v67, v68, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__serviceObjects(self, v72, v73, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = 136447234;
          v97 = "-[CWFSensingAutoDataCollector registerForAccessoriesInRoomWithDelegate:]";
          v98 = 2082;
          v99 = "CWFSensingAutoDataCollector.m";
          v100 = 1024;
          v101 = 150;
          v102 = 2114;
          v103 = v71;
          v104 = 2114;
          v105 = v76;
          LODWORD(v86) = 48;
          v85 = &v96;
          _os_log_send_and_compose_impl();

        }
        v35 = v89;
      }

    }
    v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v92, (uint64_t)v106, 16);
    if (v26)
      continue;
    break;
  }
LABEL_19:

}

- (void)updateRegisteredServiceWithDelegate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_registerForAccessoriesInRoomWithDelegate_(self, a2, (uint64_t)a3, v3, v4);
  MEMORY[0x1E0DE7D20](self, sel_cleanUpOutOfScopeAccessory, v6, v7, v8);
}

- (NSMutableDictionary)_serviceObjects
{
  return self->__serviceObjects;
}

- (void)set_serviceObjects:(id)a3
{
  objc_storeStrong((id *)&self->__serviceObjects, a3);
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
  objc_storeStrong((id *)&self->__serviceQueue, a3);
}

- (HMAccessory)_currentAccessory
{
  return self->__currentAccessory;
}

- (void)set_currentAccessory:(id)a3
{
  objc_storeStrong((id *)&self->__currentAccessory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentAccessory, 0);
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__serviceObjects, 0);
}

@end
