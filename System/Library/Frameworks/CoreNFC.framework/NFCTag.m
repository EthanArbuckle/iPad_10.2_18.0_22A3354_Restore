@implementation NFCTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFCTag)initWithCoder:(id)a3
{
  id v5;
  NFCTag *v6;
  uint64_t v7;
  NFTag *tag;
  uint64_t v9;
  NSNumber *sessionKey;
  uint64_t v11;
  NFCHardwareManager *hardwareManager;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *delegateQueue;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  void *v28;
  const char *Name;
  objc_super v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NFCTag;
  v6 = -[NFCTag init](&v30, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tag"));
    v7 = objc_claimAutoreleasedReturnValue();
    tag = v6->_tag;
    v6->_tag = (NFTag *)v7;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    sessionKey = v6->_sessionKey;
    v6->_sessionKey = (NSNumber *)v9;

    v6->_configuration = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("configuration"));
    if (!v6->_sessionKey)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("NFCTag.m"), 67, CFSTR("Missing session key"));

    }
    +[NFCHardwareManager sharedHardwareManager](NFCHardwareManager, "sharedHardwareManager");
    v11 = objc_claimAutoreleasedReturnValue();
    hardwareManager = v6->_hardwareManager;
    v6->_hardwareManager = (NFCHardwareManager *)v11;

    -[NFCHardwareManager getReaderSessionWithKey:](v6->_hardwareManager, "getReaderSessionWithKey:", v6->_sessionKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "sessionQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      delegateQueue = v6->_delegateQueue;
      v6->_delegateQueue = (OS_dispatch_queue *)v15;
    }
    else
    {
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v18 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v6);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v6);
        Name = sel_getName(a2);
        v22 = 45;
        if (isMetaClass)
          v22 = 43;
        v18(3, "%c[%{public}s %{public}s]:%i Session has been invalidated", v22, ClassName, Name, 72);
      }
      NFSharedLogGetLogger();
      delegateQueue = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(delegateQueue, OS_LOG_TYPE_ERROR))
      {
        v23 = object_getClass(v6);
        if (class_isMetaClass(v23))
          v24 = 43;
        else
          v24 = 45;
        v25 = object_getClassName(v6);
        v26 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v32 = v24;
        v33 = 2082;
        v34 = v25;
        v35 = 2082;
        v36 = v26;
        v37 = 1024;
        v38 = 72;
        _os_log_impl(&dword_215BBD000, delegateQueue, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session has been invalidated", buf, 0x22u);
      }
    }

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NFTag *tag;
  id v5;

  tag = self->_tag;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tag, CFSTR("tag"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionKey, CFSTR("sessionKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_configuration, CFSTR("configuration"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v9;

  if (!self->_hardwareManager)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCTag.m"), 92, CFSTR("Nil hardwareManager"));

  }
  v4 = objc_alloc((Class)objc_opt_class());
  -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSession:tag:startupConfig:", v5, self->_tag, self->_configuration);

  return v6;
}

- (BOOL)isReadOnly
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  BOOL v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  const char *ClassName;
  const char *Name;
  const char *v35;
  uint64_t v36;
  _QWORD v37[5];
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __20__NFCTag_isReadOnly__block_invoke;
  v37[3] = &unk_24D44F9B0;
  v37[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __20__NFCTag_isReadOnly__block_invoke((uint64_t)v37);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && (objc_msgSend(v7, "isEqualToNFTag:", v5) & 1) != 0)
  {
    v36 = 0;
    objc_msgSend(v6, "ndefStatus:maxMessageLength:", &v36, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v11(4, "%c[%{public}s %{public}s]:%i Error=%@", v14, ClassName, Name, 122, v9);
      }
      NFSharedLogGetLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(self);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        v18 = object_getClassName(self);
        v19 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v39 = v17;
        v40 = 2082;
        v41 = v18;
        v42 = 2082;
        v43 = v19;
        v44 = 1024;
        v45 = 122;
        v46 = 2112;
        v47 = v9;
        _os_log_impl(&dword_215BBD000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error=%@", buf, 0x2Cu);
      }

      v20 = 0;
    }
    else
    {
      v20 = v36 == 3;
    }

  }
  else
  {
    v21 = NFLogGetLogger();
    if (v21)
    {
      v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      v24 = class_isMetaClass(v23);
      v25 = object_getClassName(self);
      v35 = sel_getName(a2);
      v26 = 45;
      if (v24)
        v26 = 43;
      v22(4, "%c[%{public}s %{public}s]:%i Tag is not connected", v26, v25, v35, 115);
    }
    NFSharedLogGetLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28))
        v29 = 43;
      else
        v29 = 45;
      v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v39 = v29;
      v40 = 2082;
      v41 = v30;
      v42 = 2082;
      v43 = v31;
      v44 = 1024;
      v45 = 115;
      _os_log_impl(&dword_215BBD000, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag is not connected", buf, 0x22u);
    }

    v20 = 0;
  }

  return v20;
}

id __20__NFCTag_isReadOnly__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

- (BOOL)isNDEFFormatted
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  BOOL v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  const char *ClassName;
  const char *Name;
  const char *v35;
  unint64_t v36;
  _QWORD v37[5];
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __25__NFCTag_isNDEFFormatted__block_invoke;
  v37[3] = &unk_24D44F9B0;
  v37[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __25__NFCTag_isNDEFFormatted__block_invoke((uint64_t)v37);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && (objc_msgSend(v7, "isEqualToNFTag:", v5) & 1) != 0)
  {
    v36 = 0;
    objc_msgSend(v6, "ndefStatus:maxMessageLength:", &v36, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v11(4, "%c[%{public}s %{public}s]:%i Error=%@", v14, ClassName, Name, 146, v9);
      }
      NFSharedLogGetLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(self);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        v18 = object_getClassName(self);
        v19 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v39 = v17;
        v40 = 2082;
        v41 = v18;
        v42 = 2082;
        v43 = v19;
        v44 = 1024;
        v45 = 146;
        v46 = 2112;
        v47 = v9;
        _os_log_impl(&dword_215BBD000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error=%@", buf, 0x2Cu);
      }

      v20 = 0;
    }
    else
    {
      v20 = v36 > 1;
    }

  }
  else
  {
    v21 = NFLogGetLogger();
    if (v21)
    {
      v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      v24 = class_isMetaClass(v23);
      v25 = object_getClassName(self);
      v35 = sel_getName(a2);
      v26 = 45;
      if (v24)
        v26 = 43;
      v22(4, "%c[%{public}s %{public}s]:%i Tag is not connected", v26, v25, v35, 139);
    }
    NFSharedLogGetLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28))
        v29 = 43;
      else
        v29 = 45;
      v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v39 = v29;
      v40 = 2082;
      v41 = v30;
      v42 = 2082;
      v43 = v31;
      v44 = 1024;
      v45 = 139;
      _os_log_impl(&dword_215BBD000, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag is not connected", buf, 0x22u);
    }

    v20 = 0;
  }

  return v20;
}

id __25__NFCTag_isNDEFFormatted__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

- (unint64_t)capacity
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  const char *ClassName;
  const char *Name;
  const char *v35;
  unint64_t v36;
  _QWORD v37[5];
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __18__NFCTag_capacity__block_invoke;
  v37[3] = &unk_24D44F9B0;
  v37[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __18__NFCTag_capacity__block_invoke((uint64_t)v37);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && (objc_msgSend(v7, "isEqualToNFTag:", v5) & 1) != 0)
  {
    v36 = 0;
    objc_msgSend(v6, "ndefStatus:maxMessageLength:", 0, &v36);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v11(4, "%c[%{public}s %{public}s]:%i Error=%@", v14, ClassName, Name, 174, v9);
      }
      NFSharedLogGetLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(self);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        v18 = object_getClassName(self);
        v19 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v39 = v17;
        v40 = 2082;
        v41 = v18;
        v42 = 2082;
        v43 = v19;
        v44 = 1024;
        v45 = 174;
        v46 = 2112;
        v47 = v9;
        _os_log_impl(&dword_215BBD000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error=%@", buf, 0x2Cu);
      }

      v20 = 0;
    }
    else
    {
      v20 = v36;
    }

  }
  else
  {
    v21 = NFLogGetLogger();
    if (v21)
    {
      v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      v24 = class_isMetaClass(v23);
      v25 = object_getClassName(self);
      v35 = sel_getName(a2);
      v26 = 45;
      if (v24)
        v26 = 43;
      v22(4, "%c[%{public}s %{public}s]:%i Tag is not connected", v26, v25, v35, 167);
    }
    NFSharedLogGetLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28))
        v29 = 43;
      else
        v29 = 45;
      v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v39 = v29;
      v40 = 2082;
      v41 = v30;
      v42 = 2082;
      v43 = v31;
      v44 = 1024;
      v45 = 167;
      _os_log_impl(&dword_215BBD000, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag is not connected", buf, 0x22u);
    }

    v20 = 0;
  }

  return v20;
}

id __18__NFCTag_capacity__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

- (void)queryNDEFStatusWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = _os_activity_create(&dword_215BBD000, "NFCNDEFTag queryNDEFStatusWithCompletionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_24D44FA28;
    v12[4] = self;
    v14 = v5;
    v15 = a2;
    v13 = v7;
    v9 = v5;
    objc_msgSend(v13, "submitBlockOnSessionQueue:", v12);

    v10 = v13;
  }
  else
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke;
    v16[3] = &unk_24D44F8B0;
    v17 = v5;
    v11 = v5;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v16);
    v10 = v17;
  }

}

void __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v1 + 16))(v1, 1, 0, v2);

}

void __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  id *v18;
  void *v19;
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const char *ClassName;
  const char *Name;
  const char *v36;
  _QWORD v37[4];
  _QWORD v38[3];
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[5];
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v2 = *(os_unfair_lock_s **)(a1 + 32);
  v3 = MEMORY[0x24BDAC760];
  v4 = v2 + 8;
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_3;
  v46[3] = &unk_24D44F9B0;
  v46[4] = v2;
  os_unfair_lock_lock(v2 + 8);
  __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_3((uint64_t)v46);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(v4);
  objc_msgSend(*(id *)(a1 + 40), "currentTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToNFTag:", v5) & 1) != 0)
  {
    v42 = 0;
    v43 = 0;
    objc_msgSend(*(id *)(a1 + 40), "ndefStatus:maxMessageLength:", &v43, &v42);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v9 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 56));
        v12 = 45;
        if (isMetaClass)
          v12 = 43;
        v9(4, "%c[%{public}s %{public}s]:%i Error=%@", v12, ClassName, Name, 214, v7);
      }
      NFSharedLogGetLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v14))
          v15 = 43;
        else
          v15 = 45;
        v16 = object_getClassName(*(id *)(a1 + 32));
        v17 = sel_getName(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 67110146;
        v48 = v15;
        v49 = 2082;
        v50 = v16;
        v51 = 2082;
        v52 = v17;
        v53 = 1024;
        v54 = 214;
        v55 = 2112;
        v56 = v7;
        _os_log_impl(&dword_215BBD000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error=%@", buf, 0x2Cu);
      }

      v39[0] = v3;
      v39[1] = 3221225472;
      v39[2] = __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_46;
      v39[3] = &unk_24D44F9D8;
      v18 = &v41;
      v19 = *(void **)(a1 + 40);
      v41 = *(id *)(a1 + 48);
      v40 = v7;
      objc_msgSend(v19, "submitBlockOnDelegateQueue:", v39);

    }
    else
    {
      if (v43 > 4)
        v32 = 0;
      else
        v32 = qword_215BFCD80[v43];
      v37[0] = v3;
      v37[1] = 3221225472;
      v37[2] = __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_2_47;
      v37[3] = &unk_24D44FA00;
      v18 = (id *)v38;
      v33 = *(void **)(a1 + 40);
      v38[0] = *(id *)(a1 + 48);
      v38[1] = v32;
      v38[2] = v42;
      objc_msgSend(v33, "submitBlockOnDelegateQueue:", v37);
    }

  }
  else
  {
    v20 = NFLogGetLogger();
    if (v20)
    {
      v21 = (void (*)(uint64_t, const char *, ...))v20;
      v22 = object_getClass(*(id *)(a1 + 32));
      v23 = class_isMetaClass(v22);
      v24 = object_getClassName(*(id *)(a1 + 32));
      v36 = sel_getName(*(SEL *)(a1 + 56));
      v25 = 45;
      if (v23)
        v25 = 43;
      v21(4, "%c[%{public}s %{public}s]:%i Tag is not connected", v25, v24, v36, 202);
    }
    NFSharedLogGetLogger();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v27))
        v28 = 43;
      else
        v28 = 45;
      v29 = object_getClassName(*(id *)(a1 + 32));
      v30 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67109890;
      v48 = v28;
      v49 = 2082;
      v50 = v29;
      v51 = 2082;
      v52 = v30;
      v53 = 1024;
      v54 = 202;
      _os_log_impl(&dword_215BBD000, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag is not connected", buf, 0x22u);
    }

    v44[0] = v3;
    v44[1] = 3221225472;
    v44[2] = __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_45;
    v44[3] = &unk_24D44F8B0;
    v31 = *(void **)(a1 + 40);
    v45 = *(id *)(a1 + 48);
    objc_msgSend(v31, "submitBlockOnDelegateQueue:", v44);

  }
}

id __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

void __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_45(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 104);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v1 + 16))(v1, 1, 0, v2);

}

uint64_t __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_2_47(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a1[5], a1[6], 0);
}

- (void)readNDEFWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_215BBD000, "NFCNDEFTag readNDEFWithCompletionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __40__NFCTag_readNDEFWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_24D44FA50;
    v8 = &v13;
    v9 = v6;
    v13 = v9;
    v14 = v4;
    v10 = v4;
    objc_msgSend(v9, "submitBlockOnSessionQueue:", v12);

  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __40__NFCTag_readNDEFWithCompletionHandler___block_invoke;
    v15[3] = &unk_24D44F8B0;
    v8 = &v16;
    v16 = v4;
    v11 = v4;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v15);
  }

}

void __40__NFCTag_readNDEFWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __40__NFCTag_readNDEFWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  v14 = 0;
  objc_msgSend(v2, "readNdefMessageWithError:", &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  +[NFCError errorWithNFCDError:defaultNFCErrorCode:](NFCError, "errorWithNFCDError:defaultNFCErrorCode:", v4, 104);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__NFCTag_readNDEFWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_24D44F8D8;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v11 = v3;
  v8 = v5;
  v9 = v3;
  objc_msgSend(v6, "submitBlockOnDelegateQueue:", v10);

}

uint64_t __40__NFCTag_readNDEFWithCompletionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)writeLockWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_215BBD000, "NFCNDEFTag writeLockWithCompletionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __41__NFCTag_writeLockWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_24D44FA50;
    v8 = &v13;
    v9 = v6;
    v13 = v9;
    v14 = v4;
    v10 = v4;
    objc_msgSend(v9, "submitBlockOnSessionQueue:", v12);

  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __41__NFCTag_writeLockWithCompletionHandler___block_invoke;
    v15[3] = &unk_24D44F8B0;
    v8 = &v16;
    v16 = v4;
    v11 = v4;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v15);
  }

}

void __41__NFCTag_writeLockWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __41__NFCTag_writeLockWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "writeLockNdef");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFCError errorWithNFCDError:defaultNFCErrorCode:](NFCError, "errorWithNFCDError:defaultNFCErrorCode:", v2, 104);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__NFCTag_writeLockWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_24D44F9D8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "submitBlockOnDelegateQueue:", v7);

}

uint64_t __41__NFCTag_writeLockWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)writeNDEF:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_215BBD000, "NFCNDEFTag writeNDEF:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __38__NFCTag_writeNDEF_completionHandler___block_invoke_2;
    v15[3] = &unk_24D44FA78;
    v11 = &v16;
    v12 = v9;
    v16 = v12;
    v17 = v6;
    v18 = v7;
    v13 = v7;
    objc_msgSend(v12, "submitBlockOnSessionQueue:", v15);

  }
  else
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __38__NFCTag_writeNDEF_completionHandler___block_invoke;
    v19[3] = &unk_24D44F8B0;
    v11 = &v20;
    v20 = v7;
    v14 = v7;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v19);
  }

}

void __38__NFCTag_writeNDEF_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __38__NFCTag_writeNDEF_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  objc_msgSend(v2, "writeNdefMessage:error:", v3, &v12);
  v4 = v12;
  +[NFCError errorWithNFCDError:defaultNFCErrorCode:](NFCError, "errorWithNFCDError:defaultNFCErrorCode:", v4, 104);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__NFCTag_writeNDEF_completionHandler___block_invoke_3;
  v9[3] = &unk_24D44F9D8;
  v7 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "submitBlockOnDelegateQueue:", v9);

}

uint64_t __38__NFCTag_writeNDEF_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (unint64_t)type
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD v7[2];
  uint64_t (*v8)(uint64_t);
  void *v9;
  NFCTag *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v8 = __14__NFCTag_type__block_invoke;
  v9 = &unk_24D44FAA0;
  v10 = self;
  v11 = &v12;
  v3 = v7;
  os_unfair_lock_lock(p_lock);
  v8((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  v4 = v13[3];
  if (v4 >= 0x11)
    v5 = 1;
  else
    v5 = qword_215BFCDA8[v4];
  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __14__NFCTag_type__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "type");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isAvailable
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[5];

  p_lock = &self->_lock;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __21__NFCTag_isAvailable__block_invoke;
  v9[3] = &unk_24D44F9B0;
  v9[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __21__NFCTag_isAvailable__block_invoke((uint64_t)v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToNFTag:", v4) & 1) != 0)
  {
LABEL_5:
    v7 = objc_msgSend(v5, "checkPresenceWithError:", 0);
    goto LABEL_6;
  }
  v7 = 0;
  if (!v6 && (self->_configuration & 1) != 0)
  {
    if (!-[NFCTag _connectWithSession:outError:](self, "_connectWithSession:outError:", v5, 0))
    {
      v7 = 0;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

id __21__NFCTag_isAvailable__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

- (id)asNFCISO15693Tag
{
  NFCTag *v3;

  if (-[NFCTag type](self, "type") == 1)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)asNFCISO7816Tag
{
  NFCTag *v3;

  if (-[NFCTag type](self, "type") == 3)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)asNFCMiFareTag
{
  NFCTag *v3;

  if (-[NFCTag type](self, "type") == 4)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)asNFCFeliCaTag
{
  NFCTag *v3;

  if (-[NFCTag type](self, "type") == 2)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (NFCTag)initWithSession:(id)a3 tag:(id)a4 startupConfig:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NFCTag *v13;
  uint64_t v14;
  NSNumber *sessionKey;
  uint64_t v16;
  OS_dispatch_queue *delegateQueue;
  uint64_t v18;
  NFCHardwareManager *hardwareManager;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCTag.m"), 418, CFSTR("Nil session"));

  }
  objc_msgSend(v9, "sessionQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCTag.m"), 419, CFSTR("Nil session queue"));

  }
  objc_msgSend(v9, "hardwareManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCTag.m"), 420, CFSTR("Nil hardwareManager"));

  }
  v24.receiver = self;
  v24.super_class = (Class)NFCTag;
  v13 = -[NFCTag init](&v24, sel_init);
  if (v13)
  {
    objc_msgSend(v9, "sessionId");
    v14 = objc_claimAutoreleasedReturnValue();
    sessionKey = v13->_sessionKey;
    v13->_sessionKey = (NSNumber *)v14;

    objc_storeStrong((id *)&v13->_tag, a4);
    v13->_configuration = a5;
    objc_msgSend(v9, "sessionQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    delegateQueue = v13->_delegateQueue;
    v13->_delegateQueue = (OS_dispatch_queue *)v16;

    objc_msgSend(v9, "hardwareManager");
    v18 = objc_claimAutoreleasedReturnValue();
    hardwareManager = v13->_hardwareManager;
    v13->_hardwareManager = (NFCHardwareManager *)v18;

    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (id)identifier
{
  os_unfair_lock_s *p_lock;
  void *v3;
  _QWORD v5[5];

  p_lock = &self->_lock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __20__NFCTag_identifier__block_invoke;
  v5[3] = &unk_24D44FAC8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __20__NFCTag_identifier__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v3;
}

id __20__NFCTag_identifier__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "technology");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2 == 2)
  {
    objc_msgSend(v3, "tagB");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pupi");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "tagID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)selectedAID
{
  os_unfair_lock_s *p_lock;
  void *v3;
  _QWORD v5[5];

  p_lock = &self->_lock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __21__NFCTag_selectedAID__block_invoke;
  v5[3] = &unk_24D44FAC8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __21__NFCTag_selectedAID__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v3;
}

id __21__NFCTag_selectedAID__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "technology");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2 == 1)
    objc_msgSend(v3, "tagA");
  else
    objc_msgSend(v3, "tagB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedAID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)systemCode
{
  os_unfair_lock_s *p_lock;
  void *v3;
  _QWORD v5[5];

  p_lock = &self->_lock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __20__NFCTag_systemCode__block_invoke;
  v5[3] = &unk_24D44FAC8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __20__NFCTag_systemCode__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v3;
}

id __20__NFCTag_systemCode__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tagF");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SystemCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)historicalBytes
{
  os_unfair_lock_s *p_lock;
  void *v3;
  _QWORD v5[5];

  p_lock = &self->_lock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__NFCTag_historicalBytes__block_invoke;
  v5[3] = &unk_24D44FAC8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __25__NFCTag_historicalBytes__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v3;
}

id __25__NFCTag_historicalBytes__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tagA");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "historicalBytes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)applicationData
{
  os_unfair_lock_s *p_lock;
  void *v3;
  _QWORD v5[5];

  p_lock = &self->_lock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__NFCTag_applicationData__block_invoke;
  v5[3] = &unk_24D44FAC8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __25__NFCTag_applicationData__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v3;
}

id __25__NFCTag_applicationData__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tagB");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "applicationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)proprietaryApplicationDataCoding
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  _QWORD v5[2];
  void (*v6)(uint64_t);
  void *v7;
  NFCTag *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v6 = __42__NFCTag_proprietaryApplicationDataCoding__block_invoke;
  v7 = &unk_24D44FAA0;
  v8 = self;
  v9 = &v10;
  v3 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  LOBYTE(p_lock) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_lock;
}

void __42__NFCTag_proprietaryApplicationDataCoding__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tagB");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "applicationDataCoding");

}

- (void)disconnect
{
  -[NFCTag _disconnectWithError:](self, "_disconnectWithError:", 0);
}

- (int64_t)configuration
{
  return self->_configuration;
}

- (void)_setTag:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __18__NFCTag__setTag___block_invoke;
  v7[3] = &unk_24D44FAF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_lock);
  __18__NFCTag__setTag___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

void __18__NFCTag__setTag___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)_setSession:(id)a3
{
  NSNumber *v4;
  NSNumber *sessionKey;

  objc_msgSend(a3, "sessionId");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  sessionKey = self->_sessionKey;
  self->_sessionKey = v4;

}

- (void)_setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (BOOL)isEqualToNFTag:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD *v7;
  _QWORD v9[2];
  uint64_t (*v10)(_QWORD *);
  void *v11;
  NFCTag *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  p_lock = &self->_lock;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v10 = __25__NFCTag_isEqualToNFTag___block_invoke;
  v11 = &unk_24D44FB18;
  v14 = &v15;
  v12 = self;
  v6 = v4;
  v13 = v6;
  v7 = v9;
  os_unfair_lock_lock(p_lock);
  v10(v7);
  os_unfair_lock_unlock(p_lock);

  LOBYTE(p_lock) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)p_lock;
}

uint64_t __25__NFCTag_isEqualToNFTag___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "isEqualToNFTag:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)_getInternalReaderSession
{
  void *v3;
  void *v4;
  id v5;

  -[NFCTag hardwareManager](self, "hardwareManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getReaderSessionWithKey:", self->_sessionKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)dispatchOnDelegateQueueAsync:(id)a3
{
  OS_dispatch_queue *delegateQueue;
  id v6;
  NSObject *v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  delegateQueue = self->_delegateQueue;
  v6 = a3;
  if (delegateQueue)
  {
    v7 = delegateQueue;
  }
  else
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Session queue is not available; dispatching on main queue",
        v13,
        ClassName,
        Name,
        543);
    }
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      *(_DWORD *)buf = 67109890;
      v19 = v16;
      v20 = 2082;
      v21 = object_getClassName(self);
      v22 = 2082;
      v23 = sel_getName(a2);
      v24 = 1024;
      v25 = 543;
      _os_log_impl(&dword_215BBD000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session queue is not available; dispatching on main queue",
        buf,
        0x22u);
    }

    v7 = MEMORY[0x24BDAC9B8];
  }
  dispatch_async(v7, v6);

}

- (BOOL)_connectWithSession:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "connectTag:error:", self->_tag, a4);
  }
  else if (a4)
  {
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_connectWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __40__NFCTag__connectWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_24D44F9B0;
    v13[4] = self;
    os_unfair_lock_lock(&self->_lock);
    __40__NFCTag__connectWithCompletionHandler___block_invoke_2((uint64_t)v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __40__NFCTag__connectWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_24D44FB40;
    v10[4] = self;
    v11 = v5;
    v12 = v4;
    v8 = v4;
    objc_msgSend(v11, "connectTag:completionHandler:", v7, v10);

  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __40__NFCTag__connectWithCompletionHandler___block_invoke;
    v14[3] = &unk_24D44F8B0;
    v15 = v4;
    v9 = v4;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v14);

  }
}

void __40__NFCTag__connectWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

id __40__NFCTag__connectWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

void __40__NFCTag__connectWithCompletionHandler___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  void *v5;
  os_unfair_lock_s *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  if (!v3)
  {
    v4 = (os_unfair_lock_s *)a1[4];
    v5 = (void *)a1[5];
    v6 = v4 + 8;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __40__NFCTag__connectWithCompletionHandler___block_invoke_4;
    v7[3] = &unk_24D44FAF0;
    v7[4] = v4;
    v8 = v5;
    os_unfair_lock_lock(v6);
    __40__NFCTag__connectWithCompletionHandler___block_invoke_4((uint64_t)v7);
    os_unfair_lock_unlock(v6);

  }
  (*(void (**)(_QWORD, id))(a1[6] + 16))(a1[6], v3);

}

void __40__NFCTag__connectWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "currentTag");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

- (BOOL)_disconnectWithError:(id *)a3
{
  void *v4;
  void *v5;
  char v6;

  -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "disconnectTagWithError:", a3);
  }
  else if (a3)
  {
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_transceiveWithData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (-[NFCTag type](self, "type") != 1 || (unint64_t)objc_msgSend(v6, "length") < 0x101)
      goto LABEL_8;
    v9 = 105;
  }
  else
  {
    v9 = 103;
  }
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_8:
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __48__NFCTag__transceiveWithData_completionHandler___block_invoke_2;
    v14[3] = &unk_24D44FB68;
    v14[4] = self;
    v15 = v8;
    v16 = v6;
    v17 = v7;
    v13 = v7;
    objc_msgSend(v15, "submitBlockOnSessionQueue:", v14);

    goto LABEL_9;
  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __48__NFCTag__transceiveWithData_completionHandler___block_invoke;
  v18[3] = &unk_24D44F9D8;
  v19 = v10;
  v20 = v7;
  v11 = v10;
  v12 = v7;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v18);

LABEL_9:
}

uint64_t __48__NFCTag__transceiveWithData_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __48__NFCTag__transceiveWithData_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v17 = 0;
  v18 = 0;
  v5 = objc_msgSend(v2, "_transceiveWithSession:sendData:receivedData:error:", v3, v4, &v18, &v17);
  v6 = v18;
  v7 = v17;
  if ((v5 & 1) == 0)
  {
    v8 = objc_opt_new();

    v6 = (id)v8;
  }
  v9 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__NFCTag__transceiveWithData_completionHandler___block_invoke_3;
  v13[3] = &unk_24D44F8D8;
  v10 = *(id *)(a1 + 56);
  v15 = v7;
  v16 = v10;
  v14 = v6;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v9, "submitBlockOnDelegateQueue:", v13);

}

uint64_t __48__NFCTag__transceiveWithData_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)_transceiveWithSession:(id)a3 sendData:(id)a4 receivedData:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  os_unfair_lock_s *p_lock;
  id v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  id v21;
  os_unfair_lock_s *v22;
  BOOL v23;
  BOOL v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;

  v10 = a3;
  v11 = a4;
  if (a5)
    *a5 = 0;
  if ((self->_configuration & 1) == 0)
  {
    objc_msgSend(v10, "currentTag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToNFTag:", self->_tag))
    {
      v28 = 0;
      v29 = 0;
      objc_msgSend(v10, "transceive:tagUpdate:error:", v11, &v29, &v28);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v29;
      v15 = v28;
      if (v14)
      {
        p_lock = &self->_lock;
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __61__NFCTag__transceiveWithSession_sendData_receivedData_error___block_invoke_2;
        v26[3] = &unk_24D44FAF0;
        v26[4] = self;
        v17 = v14;
        v27 = v17;
        os_unfair_lock_lock(p_lock);
        __61__NFCTag__transceiveWithSession_sendData_receivedData_error___block_invoke_2((uint64_t)v26);
        os_unfair_lock_unlock(p_lock);

        goto LABEL_13;
      }
    }
    else
    {
      +[NFCError errorWithCode:](NFCError, "errorWithCode:", 104);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v13 = 0;
    }
    v17 = 0;
LABEL_13:

    if (!a5)
      goto LABEL_15;
    goto LABEL_14;
  }
  v34 = 0;
  v18 = -[NFCTag _connectWithSession:outError:](self, "_connectWithSession:outError:", v10, &v34);
  v19 = v34;
  v20 = v19;
  if (v18)
  {
    v32 = v19;
    v33 = 0;
    objc_msgSend(v10, "transceive:tagUpdate:error:", v11, &v33, &v32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v33;
    v15 = v32;

    if (v21)
    {
      v22 = &self->_lock;
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __61__NFCTag__transceiveWithSession_sendData_receivedData_error___block_invoke;
      v30[3] = &unk_24D44FAF0;
      v30[4] = self;
      v17 = v21;
      v31 = v17;
      os_unfair_lock_lock(v22);
      __61__NFCTag__transceiveWithSession_sendData_receivedData_error___block_invoke((uint64_t)v30);
      os_unfair_lock_unlock(v22);

      if (!a5)
        goto LABEL_15;
LABEL_14:
      *a5 = objc_retainAutorelease(v13);
      goto LABEL_15;
    }
  }
  else
  {
    v13 = 0;
    v15 = v19;
  }
  v17 = 0;
  if (a5)
    goto LABEL_14;
LABEL_15:
  if (a6)
    *a6 = objc_retainAutorelease(v15);
  if (v15)
    v23 = 1;
  else
    v23 = v13 == 0;
  v24 = !v23;

  return v24;
}

void __61__NFCTag__transceiveWithSession_sendData_receivedData_error___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

void __61__NFCTag__transceiveWithSession_sendData_receivedData_error___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)_sendAPDU:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__NFCTag__sendAPDU_completionHandler___block_invoke;
  v8[3] = &unk_24D44F888;
  v9 = v6;
  v7 = v6;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", a3, v8);

}

void __38__NFCTag__sendAPDU_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, uint64_t, _QWORD);
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD, id))(v6 + 16))(v6, v7, 0, 0, v5);
  }
  else if ((unint64_t)objc_msgSend(v20, "length") > 1)
  {
    v10 = objc_msgSend(v20, "length");
    v11 = objc_retainAutorelease(v20);
    v12 = (unsigned __int8 *)objc_msgSend(v11, "bytes");
    v13 = *(_QWORD *)(a1 + 32);
    if (v10 == 2)
    {
      v7 = (void *)objc_opt_new();
      v14 = *v12;
      v15 = v12[1];
      v16 = *(void (**)(uint64_t, void *, uint64_t, uint64_t, _QWORD))(v13 + 16);
      v17 = v13;
      v18 = v7;
    }
    else
    {
      objc_msgSend(v11, "subdataWithRange:", 0, objc_msgSend(v11, "length") - 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v12[objc_msgSend(v11, "length") - 2];
      v15 = v12[objc_msgSend(v11, "length") - 1];
      v16 = *(void (**)(uint64_t, void *, uint64_t, uint64_t, _QWORD))(v13 + 16);
      v17 = v13;
      v18 = v7;
      v14 = v19;
    }
    v16(v17, v18, v14, v15, 0);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v7 = (void *)objc_opt_new();
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 102);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD, void *))(v8 + 16))(v8, v7, 0, 0, v9);

  }
}

- (BOOL)isMatchingSession:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  NSNumber *sessionKey;
  void *v9;
  BOOL v10;

  v6 = a3;
  objc_msgSend(v6, "sessionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!a4)
    {
      v10 = 0;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  sessionKey = self->_sessionKey;
  objc_msgSend(v6, "sessionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NSNumber isEqualToNumber:](sessionKey, "isEqualToNumber:", v9);

  if (a4 && !v10)
  {
LABEL_6:
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return v10;
}

+ (unint64_t)_MaxRetry
{
  return 256;
}

+ (double)_MaxRetryInterval
{
  return 3.0;
}

- (NFCHardwareManager)hardwareManager
{
  return self->_hardwareManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareManager, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_sessionKey, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
