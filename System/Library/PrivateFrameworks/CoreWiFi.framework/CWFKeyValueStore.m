@implementation CWFKeyValueStore

- (void)__ubiquitousKVSChanged:(id)a3
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
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSString *identifier;
  NSObject *eventQueue;
  void *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSString *v45;
  NSObject *v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  NSString *v52;
  _QWORD block[5];
  id v54;
  _QWORD v55[5];
  id v56;
  int v57;
  NSString *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_userInfo(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, *MEMORY[0x1E0CB3358], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_userInfo(v4, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v18, v19, *MEMORY[0x1E0CB3360], v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend_integerValue(v13, v23, v24, v25, v26))
  {
    case 0:
      CWFGetOSLog();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        CWFGetOSLog();
        v28 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = MEMORY[0x1E0C81028];
        v34 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        identifier = self->_identifier;
        objc_msgSend___debugDescriptionForType_(self, v35, self->_type, v36, v37);
        v57 = 138543618;
        v58 = identifier;
        v59 = 2114;
        v60 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();

      }
      eventQueue = self->_eventQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B06EAE54;
      block[3] = &unk_1E61333E0;
      block[4] = self;
      v54 = v22;
      dispatch_async(eventQueue, block);
      v40 = v54;
      goto LABEL_18;
    case 1:
      CWFGetOSLog();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        CWFGetOSLog();
        v30 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = MEMORY[0x1E0C81028];
        v41 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v45 = self->_identifier;
        objc_msgSend___debugDescriptionForType_(self, v42, self->_type, v43, v44);
        v57 = 138543618;
        v58 = v45;
        v59 = 2114;
        v60 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();

      }
      v46 = self->_eventQueue;
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = sub_1B06EADE8;
      v55[3] = &unk_1E61333E0;
      v55[4] = self;
      v56 = v22;
      dispatch_async(v46, v55);
      v40 = v56;
LABEL_18:

      break;
    case 2:
      CWFGetOSLog();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        CWFGetOSLog();
        v32 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = MEMORY[0x1E0C81028];
        v47 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      goto LABEL_25;
    case 3:
      CWFGetOSLog();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        CWFGetOSLog();
        v32 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = MEMORY[0x1E0C81028];
        v51 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
LABEL_24:
        v52 = self->_identifier;
        objc_msgSend___debugDescriptionForType_(self, v48, self->_type, v49, v50);
        v57 = 138543618;
        v58 = v52;
        v59 = 2114;
        v60 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();

      }
LABEL_25:

      break;
    default:
      break;
  }

}

- (id)__debugDescriptionForType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) < 5)
    return off_1E61354E8[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("? (%ld)"), v3, v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CWFKeyValueStore)initWithType:(int64_t)a3 identifier:(id)a4
{
  id v7;
  CWFKeyValueStore *v8;
  CWFKeyValueStore *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *mutexQueue;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  NSObject *v41;
  dispatch_queue_t v42;
  OS_dispatch_queue *eventQueue;
  int64_t type;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSUbiquitousKeyValueStore *v49;
  void *v50;
  NSObject *v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  NSUbiquitousKeyValueStore *ubiquitousKVS;
  void *v58;
  id v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  NSString *identifier;
  void *v65;
  objc_super v66;
  int v67;
  NSString *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v66.receiver = self;
  v66.super_class = (Class)CWFKeyValueStore;
  v8 = -[CWFKeyValueStore init](&v66, sel_init);
  v9 = v8;
  if ((unint64_t)(a3 - 6) < 0xFFFFFFFFFFFFFFFBLL)
    goto LABEL_22;
  if (!v8)
    goto LABEL_22;
  v8->_type = a3;
  if (!v7)
    goto LABEL_22;
  objc_storeStrong((id *)&v8->_identifier, a4);
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend___debugDescriptionForType_(v9, v11, v9->_type, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v10, v15, (uint64_t)CFSTR("com.apple.corewifi.kvs-%@.mutex.(%@)"), v16, v17, v14, v7);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21, v22);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = dispatch_queue_create(v23, v24);
  mutexQueue = v9->_mutexQueue;
  v9->_mutexQueue = (OS_dispatch_queue *)v25;

  if (!v9->_mutexQueue)
    goto LABEL_22;
  v30 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend___debugDescriptionForType_(v9, v27, v9->_type, v28, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v30, v32, (uint64_t)CFSTR("com.apple.corewifi.kvs-%@.events.(%@)"), v33, v34, v31, v7);
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v40 = (const char *)objc_msgSend_UTF8String(v35, v36, v37, v38, v39);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = dispatch_queue_create(v40, v41);
  eventQueue = v9->_eventQueue;
  v9->_eventQueue = (OS_dispatch_queue *)v42;

  if (!v9->_eventQueue)
    goto LABEL_22;
  type = v9->_type;
  if (type == 5)
  {
    v52 = objc_alloc(MEMORY[0x1E0CB3A38]);
    v55 = objc_msgSend__initWithStoreIdentifier_usingEndToEndEncryption_(v52, v53, (uint64_t)v9->_identifier, 1, v54);
    ubiquitousKVS = v9->_ubiquitousKVS;
    v9->_ubiquitousKVS = (NSUbiquitousKeyValueStore *)v55;

    if (!v9->_ubiquitousKVS)
    {
      CWFGetOSLog();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        CWFGetOSLog();
        v51 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v51 = MEMORY[0x1E0C81028];
        v63 = MEMORY[0x1E0C81028];
      }

      if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
LABEL_20:
      identifier = v9->_identifier;
      objc_msgSend___debugDescriptionForType_(v9, v60, v9->_type, v61, v62);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 138543618;
      v68 = identifier;
      v69 = 2114;
      v70 = v65;
      _os_log_send_and_compose_impl();

LABEL_21:
LABEL_22:

      v9 = 0;
    }
  }
  else if (type == 3)
  {
    v45 = objc_alloc(MEMORY[0x1E0CB3A38]);
    v48 = objc_msgSend__initWithStoreIdentifier_usingEndToEndEncryption_(v45, v46, (uint64_t)v9->_identifier, 0, v47);
    v49 = v9->_ubiquitousKVS;
    v9->_ubiquitousKVS = (NSUbiquitousKeyValueStore *)v48;

    if (!v9->_ubiquitousKVS)
    {
      CWFGetOSLog();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        CWFGetOSLog();
        v51 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v51 = MEMORY[0x1E0C81028];
        v59 = MEMORY[0x1E0C81028];
      }

      if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      goto LABEL_20;
    }
  }

  return v9;
}

- (void)activate
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06EB2F0;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)invalidate
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06EB598;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1B063EAF0;
  v16 = sub_1B063EA40;
  v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06EB7DC;
  block[3] = &unk_1E6134148;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *mutexQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06EB998;
  block[3] = &unk_1E6133340;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(mutexQueue, block);

}

- (void)removeAllEntries
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06EBC24;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06EBFDC;
  block[3] = &unk_1E61333E0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(mutexQueue, block);

}

- (id)dictionaryRepresentation
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EAF0;
  v10 = sub_1B063EA40;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06EC374;
  v5[3] = &unk_1E6134120;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)__synchronize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *identifier;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL result;
  void *v16;

  switch(self->_type)
  {
    case 1:
    case 4:
      identifier = (const __CFString *)self->_identifier;
      v7 = (const __CFString *)*MEMORY[0x1E0C9B240];
      v8 = (const __CFString *)*MEMORY[0x1E0C9B230];
      goto LABEL_11;
    case 2:
      identifier = (const __CFString *)self->_identifier;
      v8 = (const __CFString *)*MEMORY[0x1E0C9B230];
      v7 = CFSTR("mobile");
LABEL_11:
      if (CFPreferencesSynchronize(identifier, v7, v8))
        goto LABEL_12;
      goto LABEL_4;
    case 3:
    case 5:
      if ((objc_msgSend_synchronize(self->_ubiquitousKVS, a2, v2, v3, v4) & 1) == 0)
        goto LABEL_4;
LABEL_12:
      result = 1;
      break;
    default:
LABEL_4:
      CWFGetOSLog();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        CWFGetOSLog();
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = MEMORY[0x1E0C81028];
        v11 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend___debugDescriptionForType_(self, v12, self->_type, v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();

      }
      result = 0;
      break;
  }
  return result;
}

- (BOOL)synchronize
{
  NSObject *mutexQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06EC698;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ubiquitousKVS, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end
