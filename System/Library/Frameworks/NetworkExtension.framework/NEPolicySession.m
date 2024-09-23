@implementation NEPolicySession

- (NEPolicySession)initWithSocket:(int)a3
{
  NEPolicySession *v4;
  NEPolicySession *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *policies;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *ioQueue;
  NSObject *v11;
  NEPolicySession *v12;
  int NECPSessionFD;
  int v15;
  objc_super v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  char *v20;
  uint8_t __strerrbuf[136];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NEPolicySession;
  v4 = -[NEPolicySession init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_internalPriority = 0;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    policies = v5->_policies;
    v5->_policies = v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("NEPolicy Control IO Queue", v8);
    ioQueue = v5->_ioQueue;
    v5->_ioQueue = (OS_dispatch_queue *)v9;

    if ((a3 & 0x80000000) == 0)
    {
      v5->_sessionFD = a3;
LABEL_11:
      v12 = v5;
      goto LABEL_12;
    }
    if (getuid())
      NECPSessionFD = NEHelperGetNECPSessionFD();
    else
      NECPSessionFD = necp_session_open();
    v5->_sessionFD = NECPSessionFD;
    if ((NECPSessionFD & 0x80000000) == 0)
      goto LABEL_11;
    v15 = *__error();
    if (strerror_r(v15, (char *)__strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      v18 = v15;
      v19 = 2080;
      v20 = (char *)__strerrbuf;
      _os_log_fault_impl(&dword_19BD16000, v11, OS_LOG_TYPE_FAULT, "Failed to open NECP session fd: [%d] %s", buf, 0x12u);
    }
  }
  else
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__strerrbuf = 0;
      _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "Failed to init NEPolicySession", __strerrbuf, 2u);
    }
  }

  v12 = 0;
LABEL_12:

  return v12;
}

- (id)initFromPrivilegedProcess
{
  uint64_t v3;
  NEPolicySession *v4;
  int v5;
  NSObject *v6;
  _DWORD v8[2];
  __int16 v9;
  char *v10;
  char __strerrbuf[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = necp_session_open();
  if ((v3 & 0x80000000) != 0)
  {
    v5 = *__error();
    if (strerror_r(v5, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v8[0] = 67109378;
      v8[1] = v5;
      v9 = 2080;
      v10 = __strerrbuf;
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "Failed to open NECP session fd: [%d] %s", (uint8_t *)v8, 0x12u);
    }

    v4 = 0;
  }
  else
  {
    self = -[NEPolicySession initWithSocket:](self, "initWithSocket:", v3);
    v4 = self;
  }

  return v4;
}

- (NEPolicySession)init
{
  return -[NEPolicySession initWithSocket:](self, "initWithSocket:", 0xFFFFFFFFLL);
}

- (NEPolicySession)initWithSessionName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NEPolicySession *v8;
  NEPolicySession *v9;
  NEPolicySessionFileHandle *v10;
  void *v11;
  void *v12;
  uint8_t v14[8];
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = -1;
  +[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __39__NEPolicySession_initWithSessionName___block_invoke;
  v17[3] = &unk_1E3CC3218;
  v7 = v4;
  v18 = v7;
  v19 = &v20;
  objc_msgSend(v5, "iterateFileHandlesWithBlock:", v17);

  v8 = -[NEPolicySession initWithSocket:](self, "initWithSocket:", *((unsigned int *)v21 + 6));
  v9 = v8;
  if ((v21[3] & 0x80000000) != 0)
  {
    if (v8)
    {
      v10 = -[NEPolicySessionFileHandle initWithPolicySession:name:]([NEPolicySessionFileHandle alloc], "initWithPolicySession:name:", v8, v7);
      if (v10)
      {
        +[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v6;
        v15[1] = 3221225472;
        v15[2] = __39__NEPolicySession_initWithSessionName___block_invoke_2;
        v15[3] = &unk_1E3CC3240;
        v16 = v7;
        objc_msgSend(v11, "setFileHandle:matchingPredicate:", v10, v15);

        +[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "commit");

      }
    }
    else
    {
      ne_log_obj();
      v10 = (NEPolicySessionFileHandle *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl(&dword_19BD16000, &v10->super.super, OS_LOG_TYPE_ERROR, "Failed to allocate a NEPolicySession", v14, 2u);
      }
    }

  }
  else
  {
    -[NEPolicySession removeAllPolicies](v8, "removeAllPolicies");
  }

  _Block_object_dispose(&v20, 8);
  return v9;
}

- (void)dealloc
{
  NEPolicySession *v2;
  objc_super v3;

  v2 = self;
  if (!self || (LODWORD(self) = self->_sessionFD, (self & 0x80000000) == 0))
    close((int)self);
  v3.receiver = v2;
  v3.super_class = (Class)NEPolicySession;
  -[NEPolicySession dealloc](&v3, sel_dealloc);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  int64_t internalPriority;
  __CFString *v9;
  __CFString *v10;
  SEL v11;
  id Property;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  objc_msgSend(v7, "appendString:", CFSTR("{"));
  if (!self)
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("priority"), v5, a4);
    Property = 0;
    goto LABEL_24;
  }
  internalPriority = self->_internalPriority;
  if (internalPriority > 299)
  {
    switch(internalPriority)
    {
      case 300:
        v9 = CFSTR("high");
        break;
      case 301:
        v9 = CFSTR("high1");
        break;
      case 302:
        v9 = CFSTR("high2");
        break;
      case 303:
        v9 = CFSTR("high3");
        break;
      case 304:
        v9 = CFSTR("high4");
        break;
      default:
        if (internalPriority == 400)
        {
          v9 = CFSTR("HighRestricted");
        }
        else
        {
          if (internalPriority != 500)
            goto LABEL_22;
          v9 = CFSTR("low");
        }
        break;
    }
    goto LABEL_23;
  }
  if (internalPriority > 100)
  {
    if (internalPriority == 101)
    {
      v9 = CFSTR("control1");
      goto LABEL_23;
    }
    if (internalPriority == 200)
    {
      v9 = CFSTR("privileged-tunnel");
      goto LABEL_23;
    }
LABEL_22:
    v9 = CFSTR("unknown");
    goto LABEL_23;
  }
  if (!internalPriority)
  {
    v9 = CFSTR("default");
    goto LABEL_23;
  }
  if (internalPriority != 100)
    goto LABEL_22;
  v9 = CFSTR("control");
LABEL_23:
  v10 = v9;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("priority"), v5, a4);

  Property = objc_getProperty(self, v11, 32, 1);
LABEL_24:
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("policies"), v5, a4);
  objc_msgSend(v7, "appendString:", CFSTR("\n}"));
  return v7;
}

- (id)description
{
  return -[NEPolicySession descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (int)dupSocket
{
  if (self && (LODWORD(self) = self->_sessionFD, (self & 0x80000000) != 0))
    return -1;
  else
    return dup((int)self);
}

- (int64_t)priority
{
  char v2;

  if (self)
  {
    v2 = *(_BYTE *)(self + 8);
    self = *(_QWORD *)(self + 24);
    if ((v2 & 1) != 0)
    {
      if (self > 399)
      {
        switch(self)
        {
          case 0x190:
            return 8;
          case 0x1F4:
            return 9;
          case 0xFFFFLL:
            return 10;
        }
      }
      else
      {
        switch(self)
        {
          case 300:
            self = 3;
            break;
          case 301:
            self = 4;
            break;
          case 302:
            self = 5;
            break;
          case 303:
            self = 6;
            break;
          case 304:
            self = 7;
            break;
          default:
            if (self == 100)
            {
              self = 1;
            }
            else if (self == 200)
            {
              self = 2;
            }
            break;
        }
      }
    }
  }
  return self;
}

- (void)setPriority:(int64_t)a3
{
  char v3;
  char v4;
  int64_t v5;
  unint64_t v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  char *v14;
  char __strerrbuf[4];
  int v16;
  uint64_t v17;

  v5 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3 - 1;
  if (!v4 & v3)
  {
LABEL_4:
    if (a3 > 299)
    {
      switch(a3)
      {
        case 300:
          goto LABEL_6;
        case 301:
          goto LABEL_17;
        case 302:
          goto LABEL_18;
        case 303:
          goto LABEL_19;
        case 304:
          goto LABEL_20;
        default:
          if (a3 == 400)
            goto LABEL_21;
          if (a3 == 500)
            goto LABEL_13;
          goto LABEL_22;
      }
    }
    if (a3 > 100)
    {
      if (a3 == 101)
        goto LABEL_25;
      if (a3 == 200)
      {
LABEL_16:
        v5 = 200;
        goto LABEL_25;
      }
    }
    else
    {
      if (!a3)
        goto LABEL_25;
      if (a3 == 100)
      {
LABEL_10:
        v5 = 100;
        goto LABEL_25;
      }
    }
LABEL_22:
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__strerrbuf = 67109120;
      v16 = v5;
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "Unknown priority level %u", (uint8_t *)__strerrbuf, 8u);
    }

  }
  else
  {
    switch(a3)
    {
      case 1:
        goto LABEL_10;
      case 2:
        goto LABEL_16;
      case 3:
LABEL_6:
        v5 = 300;
        break;
      case 4:
LABEL_17:
        v5 = 301;
        break;
      case 5:
LABEL_18:
        v5 = 302;
        break;
      case 6:
LABEL_19:
        v5 = 303;
        break;
      case 7:
LABEL_20:
        v5 = 304;
        break;
      case 8:
LABEL_21:
        v5 = 400;
        break;
      case 9:
LABEL_13:
        v5 = 500;
        break;
      case 10:
        v5 = 0xFFFFLL;
        goto LABEL_22;
      default:
        goto LABEL_4;
    }
  }
LABEL_25:
  if (self)
  {
    if (!necp_session_action())
    {
      self->_internalPriority = v5;
      self->_convertToLegacyPriority = v7 < 0xA;
      return;
    }
  }
  else if (!necp_session_action())
  {
    return;
  }
  v9 = *__error();
  if (strerror_r(v9, __strerrbuf, 0x80uLL))
    __strerrbuf[0] = 0;
  ne_log_obj();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109378;
    v12 = v9;
    v13 = 2080;
    v14 = __strerrbuf;
    _os_log_fault_impl(&dword_19BD16000, v10, OS_LOG_TYPE_FAULT, "Failed to set priority: [%d] %s", buf, 0x12u);
  }

}

- (BOOL)lockSessionToCurrentProcess
{
  int v2;
  int v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  char *v8;
  char __strerrbuf[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = necp_session_action();
  if (v2)
  {
    v3 = *__error();
    if (strerror_r(v3, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v6[0] = 67109378;
      v6[1] = v3;
      v7 = 2080;
      v8 = __strerrbuf;
      _os_log_fault_impl(&dword_19BD16000, v4, OS_LOG_TYPE_FAULT, "Failed to lock session to process: [%d] %s", (uint8_t *)v6, 0x12u);
    }

  }
  return v2 == 0;
}

- (BOOL)registerServiceUUID:(id)a3
{
  int v3;
  int v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  char *v9;
  char __strerrbuf[128];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v11[0] = 0;
  v11[1] = 0;
  objc_msgSend(a3, "getUUIDBytes:", v11);
  v3 = necp_session_action();
  if (v3)
  {
    v4 = *__error();
    if (strerror_r(v4, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7[0] = 67109378;
      v7[1] = v4;
      v8 = 2080;
      v9 = __strerrbuf;
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, "Failed to register service: [%d] %s", (uint8_t *)v7, 0x12u);
    }

  }
  return v3 == 0;
}

- (BOOL)unregisterServiceUUID:(id)a3
{
  int v3;
  int v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  char *v9;
  char __strerrbuf[128];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v11[0] = 0;
  v11[1] = 0;
  objc_msgSend(a3, "getUUIDBytes:", v11);
  v3 = necp_session_action();
  if (v3)
  {
    v4 = *__error();
    if (strerror_r(v4, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7[0] = 67109378;
      v7[1] = v4;
      v8 = 2080;
      v9 = __strerrbuf;
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, "Failed to unregister service: [%d] %s", (uint8_t *)v7, 0x12u);
    }

  }
  return v3 == 0;
}

- (unint64_t)addDomainFilterWithData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  char *v16;
  char __strerrbuf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "bytes");
    v6 = objc_msgSend(v5, "length");
    if (necp_session_action())
    {
      v7 = *__error();
      if (strerror_r(v7, __strerrbuf, 0x80uLL))
        __strerrbuf[0] = 0;
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109378;
        v14 = v7;
        v15 = 2080;
        v16 = __strerrbuf;
        _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "Failed to add domain filter: [%d] %s", buf, 0x12u);
      }

      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__strerrbuf = 134217984;
        v18 = (const char *)v6;
        _os_log_debug_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEBUG, "Failed to add domain filter of length %zu", (uint8_t *)__strerrbuf, 0xCu);
      }

    }
    else
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__strerrbuf = 134217984;
        v18 = (const char *)v6;
        _os_log_debug_impl(&dword_19BD16000, v10, OS_LOG_TYPE_DEBUG, "Added domain filter of length %zu", (uint8_t *)__strerrbuf, 0xCu);
      }

    }
  }
  else
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__strerrbuf = 136315138;
      v18 = "-[NEPolicySession addDomainFilterWithData:]";
      _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, "%s called with null filterData", (uint8_t *)__strerrbuf, 0xCu);
    }

  }
  return 0;
}

- (BOOL)removeDomainFilterWithID:(unint64_t)a3
{
  int v3;
  int v4;
  NSObject *v5;
  int v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  char *v13;
  char __strerrbuf[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v3 = necp_session_action();
  if (v3)
  {
    v4 = *__error();
    if (strerror_r(v4, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109634;
      v9 = v7;
      v10 = 1024;
      v11 = v4;
      v12 = 2080;
      v13 = __strerrbuf;
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, "Failed to remove domain filter %u: [%d] %s", buf, 0x18u);
    }

  }
  return v3 == 0;
}

- (BOOL)removeAllDomainFilters
{
  int v2;
  int v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  char *v8;
  char __strerrbuf[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = necp_session_action();
  if (v2)
  {
    v3 = *__error();
    if (strerror_r(v3, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v6[0] = 67109378;
      v6[1] = v3;
      v7 = 2080;
      v8 = __strerrbuf;
      _os_log_fault_impl(&dword_19BD16000, v4, OS_LOG_TYPE_FAULT, "Failed to remove all domain filters: [%d] %s", (uint8_t *)v6, 0x12u);
    }

  }
  return v2 == 0;
}

- (unint64_t)addPolicy:(id)a3 storeLocally:(BOOL)a4
{
  _BOOL4 v4;
  id *v6;
  id *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _UNKNOWN **v19;
  char *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  unint64_t v25;
  unsigned __int8 v26;
  NSObject *v27;
  unint64_t v28;
  uint64_t *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t *v41;
  int v42;
  void *v43;
  char *v44;
  unint64_t v45;
  int v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  objc_class *v53;
  id v54;
  id v55;
  void *v56;
  char v57;
  unint64_t v58;
  unint64_t v59;
  BOOL v60;
  uint64_t *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t *v67;
  uint64_t v68;
  _UNKNOWN **v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  uint64_t v78;
  objc_class *v79;
  id v80;
  id v81;
  void *v82;
  unint64_t v83;
  char v84;
  char v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  char *v90;
  void *v91;
  uint64_t v92;
  int v93;
  int v94;
  void *v95;
  uint64_t v96;
  void *v97;
  int v98;
  NSObject *v99;
  NSObject *v100;
  NSObject *v101;
  const char *v102;
  id Property;
  void *v104;
  id v105;
  uint64_t v107;
  uint64_t v108;
  NSObject *v109;
  _BOOL4 v110;
  void *v111;
  id *v112;
  id *v113;
  NEPolicySession *v114;
  void *v115;
  void *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  unsigned __int8 v125;
  char v126;
  char v127;
  char v128;
  uint8_t buf[4];
  int v130;
  __int16 v131;
  char *v132;
  char __strerrbuf[32];
  __int128 v134;
  __int128 v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;

  v4 = a4;
  v138 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = v6;
  if (!v6)
    goto LABEL_87;
  v8 = v6[2];
  if (!v8)
    goto LABEL_87;
  switch(*((_QWORD *)v8 + 4))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 7:
    case 0xCLL:
    case 0xDLL:
    case 0xELL:
      goto LABEL_4;
    case 5:
    case 6:
      if (!*((_QWORD *)v8 + 6))
        goto LABEL_87;
      goto LABEL_4;
    case 8:
    case 0xBLL:
    case 0xFLL:
      if (!*((_QWORD *)v8 + 7))
        goto LABEL_87;
      goto LABEL_4;
    case 9:
      if (!objc_msgSend(*((id *)v8 + 8), "count"))
        goto LABEL_87;
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v9 = *((id *)v8 + 8);
      v32 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v121, __strerrbuf, 16);
      if (!v32)
        goto LABEL_85;
      v33 = v32;
      v34 = *(_QWORD *)v122;
      break;
    default:
      goto LABEL_87;
  }
  do
  {
    for (i = 0; i != v33; ++i)
    {
      if (*(_QWORD *)v122 != v34)
        objc_enumerationMutation(v9);
      v36 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * i);
      if (!v36
        || (v37 = *(_QWORD *)(v36 + 24), (unint64_t)(v37 - 8) < 0xFFFFFFFFFFFFFFF9)
        || (v38 = *(_QWORD *)(v36 + 48), v38 > 6))
      {
LABEL_86:

LABEL_87:
        v28 = 0;
        goto LABEL_204;
      }
      if (*(_QWORD *)(v36 + 32))
      {
        if (v38)
          goto LABEL_86;
      }
      else
      {
        if (v38)
          v39 = *(_QWORD *)(v36 + 40) == 0;
        else
          v39 = 1;
        if (!v39)
          goto LABEL_86;
      }
      v40 = *(_QWORD *)(v36 + 16);
      if ((unint64_t)(v37 - 5) > 1)
      {
        if (v40 || v37 == 7 && !*(_DWORD *)(v36 + 8))
          goto LABEL_86;
      }
      else if (!v40)
      {
        goto LABEL_86;
      }
    }
    v33 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v121, __strerrbuf, 16);
  }
  while (v33);
LABEL_85:

LABEL_4:
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v9 = v7[3];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v117, buf, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v118;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v118 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * v13);
        if (!v14)
          goto LABEL_86;
        switch(*(_QWORD *)(v14 + 72))
        {
          case 1:
          case 2:
            if (!*(_QWORD *)(v14 + 80))
              goto LABEL_86;
            break;
          case 3:
          case 4:
          case 7:
          case 0xALL:
          case 0xFLL:
          case 0x11:
          case 0x12:
          case 0x13:
          case 0x18:
          case 0x19:
          case 0x1ALL:
          case 0x1BLL:
          case 0x1CLL:
          case 0x1FLL:
          case 0x20:
          case 0x27:
          case 0x28:
            break;
          case 5:
            if (!*(_QWORD *)(v14 + 88))
              goto LABEL_86;
            break;
          case 6:
            if (!*(_QWORD *)(v14 + 96))
              goto LABEL_86;
            break;
          case 8:
            if (!*(_QWORD *)(v14 + 112))
              goto LABEL_86;
            break;
          case 9:
            if (*(_DWORD *)(v14 + 48) > *(_DWORD *)(v14 + 52))
              goto LABEL_86;
            break;
          case 0xBLL:
          case 0xDLL:
          case 0x14:
          case 0x16:
            if (!*(_QWORD *)(v14 + 120))
              goto LABEL_86;
            break;
          case 0xCLL:
          case 0xELL:
          case 0x15:
          case 0x17:
            if (!*(_QWORD *)(v14 + 120) || !*(_QWORD *)(v14 + 128))
              goto LABEL_86;
            break;
          case 0x10:
            if (!*(_QWORD *)(v14 + 144) || !*(_QWORD *)(v14 + 152))
              goto LABEL_86;
            break;
          case 0x1DLL:
            if (!*(_QWORD *)(v14 + 160))
              goto LABEL_86;
            break;
          case 0x1ELL:
            if (!*(_WORD *)(v14 + 14))
              goto LABEL_86;
            break;
          case 0x25:
            if (!*(_WORD *)(v14 + 16))
              goto LABEL_86;
            break;
          case 0x26:
            if (!*(_DWORD *)(v14 + 32))
              goto LABEL_86;
            break;
          case 0x2ALL:
            if (!*(_QWORD *)(v14 + 104))
              goto LABEL_86;
            break;
          case 0x2BLL:
            if (!*(_DWORD *)(v14 + 36) && !*(_DWORD *)(v14 + 40) && !*(_DWORD *)(v14 + 44))
              goto LABEL_86;
            break;
          default:
            goto LABEL_86;
        }
        ++v13;
      }
      while (v11 != v13);
      v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v117, buf, 16);
      v11 = v15;
    }
    while (v15);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v17 = v16;
  if (!v16)
  {
    ne_log_obj();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__strerrbuf = 0;
      _os_log_error_impl(&dword_19BD16000, v27, OS_LOG_TYPE_ERROR, "Failed to create add message", (uint8_t *)__strerrbuf, 2u);
    }

    v28 = 0;
    goto LABEL_203;
  }
  v18 = v16;
  v19 = &off_1E3CBB000;
  +[NEPolicySession addTLVToMessage:type:length:value:]((uint64_t)NEPolicySession, v18, 2, 4, (uint64_t)(v7 + 1));
  v20 = (char *)v7[2];
  v21 = v18;
  v22 = v21;
  if (!v20)
  {
    v111 = v17;
    v113 = v7;

LABEL_209:
    ne_log_obj();
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__strerrbuf = 0;
      _os_log_error_impl(&dword_19BD16000, v109, OS_LOG_TYPE_ERROR, "Failed to add TLVs to message", (uint8_t *)__strerrbuf, 2u);
    }

    v28 = 0;
    v17 = v111;
    v7 = v113;
    goto LABEL_203;
  }
  v23 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v24 = v23;
  v25 = *((_QWORD *)v20 + 4) - 1;
  if (v25 > 0xE)
    v26 = 0;
  else
    v26 = byte_19BED726B[v25];
  v114 = self;
  v125 = v26;
  objc_msgSend(v23, "appendBytes:length:", &v125, 1);
  v116 = v22;
  switch(*((_QWORD *)v20 + 4))
  {
    case 1:
      v29 = (uint64_t *)(v20 + 12);
      goto LABEL_136;
    case 2:
      v29 = (uint64_t *)(v20 + 8);
      goto LABEL_136;
    case 3:
      v42 = *((_DWORD *)v20 + 4);
      v41 = (uint64_t *)(v20 + 16);
      if (!v42)
        goto LABEL_139;
      v30 = v24;
      v29 = v41;
      goto LABEL_137;
    case 4:
    case 7:
      v29 = (uint64_t *)(v20 + 20);
      goto LABEL_136;
    case 5:
      objc_msgSend(*((id *)v20 + 6), "dataUsingEncoding:", 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appendData:", v43);
      LOBYTE(v136) = 0;
      v44 = (char *)&v136;
      goto LABEL_207;
    case 6:
      v45 = *((_QWORD *)v20 + 5) - 1;
      if (v45 > 0xE)
        v46 = 0;
      else
        v46 = byte_19BED726B[v45];
      LODWORD(v136) = v46;
      objc_msgSend(v24, "appendBytes:length:", &v136, 4);
      objc_msgSend(*((id *)v20 + 6), "dataUsingEncoding:", 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appendData:", v43);
      v128 = 0;
      v44 = &v128;
LABEL_207:
      objc_msgSend(v24, "appendBytes:length:", v44, 1);

      goto LABEL_139;
    case 8:
    case 0xBLL:
    case 0xFLL:
      v136 = 0;
      v137 = 0;
      objc_msgSend(*((id *)v20 + 7), "getUUIDBytes:", &v136);
      v29 = &v136;
      v30 = v24;
      v31 = 16;
      goto LABEL_138;
    case 9:
      v115 = v24;
      v112 = v7;
      v110 = v4;
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v47 = *((id *)v20 + 8);
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v121, __strerrbuf, 16);
      if (!v48)
        goto LABEL_134;
      v49 = v48;
      v50 = *(_QWORD *)v122;
      break;
    case 0xELL:
      LODWORD(v136) = -1;
      v29 = &v136;
LABEL_136:
      v30 = v24;
LABEL_137:
      v31 = 4;
LABEL_138:
      objc_msgSend(v30, "appendBytes:length:", v29, v31);
      goto LABEL_139;
    default:
      goto LABEL_139;
  }
  while (2)
  {
    v51 = 0;
    while (2)
    {
      if (*(_QWORD *)v122 != v50)
        objc_enumerationMutation(v47);
      v52 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * v51);
      if (!v52)
        goto LABEL_132;
      v53 = (objc_class *)MEMORY[0x1E0C99DF0];
      v54 = v116;
      v55 = objc_alloc_init(v53);
      v56 = v55;
      v57 = 2;
      switch(*(_QWORD *)(v52 + 24))
      {
        case 1:
          break;
        case 2:
          if (*(_DWORD *)(v52 + 12))
            v57 = 8;
          else
            v57 = 1;
          break;
        case 3:
          v57 = 3;
          break;
        case 4:
          v57 = 4;
          break;
        case 5:
          v57 = 5;
          break;
        case 6:
          v57 = 6;
          break;
        case 7:
          v57 = 7;
          break;
        default:
          v57 = 0;
          break;
      }
      v128 = v57;
      objc_msgSend(v55, "appendBytes:length:", &v128, 1);
      if (*(_QWORD *)(v52 + 40))
      {
        LOBYTE(v58) = 0x80;
      }
      else
      {
        v59 = *(_QWORD *)(v52 + 48);
        v60 = v59 > 7;
        v58 = 0x4020100402010800uLL >> (8 * v59);
        if (v60)
          LOBYTE(v58) = 0;
      }
      v127 = v58;
      objc_msgSend(v56, "appendBytes:length:", &v127, 1);
      v62 = *(_QWORD *)(v52 + 24);
      if ((unint64_t)(v62 - 5) < 2)
      {
        v136 = 0;
        v137 = 0;
        objc_msgSend(*(id *)(v52 + 16), "getUUIDBytes:", &v136);
        v61 = &v136;
        v63 = v56;
        v64 = 16;
LABEL_123:
        objc_msgSend(v63, "appendBytes:length:", v61, v64);
        goto LABEL_124;
      }
      if (v62 == 2)
      {
        v61 = (uint64_t *)(v52 + 12);
        if (!*(_DWORD *)(v52 + 12))
          goto LABEL_124;
LABEL_122:
        v63 = v56;
        v64 = 4;
        goto LABEL_123;
      }
      if (v62 == 7)
      {
        v61 = (uint64_t *)(v52 + 8);
        goto LABEL_122;
      }
LABEL_124:
      v65 = *(void **)(v52 + 40);
      if (*(_QWORD *)(v52 + 32))
      {
        if (v65)
        {
          v136 = 0;
          v137 = 0;
          objc_msgSend(v65, "getUUIDBytes:", &v136);
          objc_msgSend(v56, "appendBytes:length:", &v136, 16);
          objc_msgSend(*(id *)(v52 + 32), "dataUsingEncoding:", 1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "appendData:", v66);
          v126 = 0;
          v67 = (uint64_t *)&v126;
        }
        else
        {
          objc_msgSend(*(id *)(v52 + 32), "dataUsingEncoding:", 1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "appendData:", v66);
          LOBYTE(v136) = 0;
          v67 = &v136;
        }
        objc_msgSend(v56, "appendBytes:length:", v67, 1);

      }
      else if (v65)
      {
        v136 = 0;
        v137 = 0;
        objc_msgSend(v65, "getUUIDBytes:", &v136);
        objc_msgSend(v56, "appendBytes:length:", &v136, 16);
      }
      v68 = (uint64_t)v19[434];
      v69 = v19;
      v70 = objc_msgSend(v56, "length", v61);
      v71 = objc_msgSend(v56, "bytes");
      v72 = v70;
      v19 = v69;
      +[NEPolicySession addTLVToMessage:type:length:value:](v68, v54, 10, v72, v71);

LABEL_132:
      if (v49 != ++v51)
        continue;
      break;
    }
    v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v121, __strerrbuf, 16);
    if (v49)
      continue;
    break;
  }
LABEL_134:

  v7 = v112;
  v4 = v110;
  v24 = v115;
  v22 = v116;
LABEL_139:
  +[NEPolicySession addTLVToMessage:type:length:value:]((uint64_t)v19[434], v22, 4, objc_msgSend(v24, "length"), objc_msgSend(v24, "bytes"));

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v73 = v7[3];
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v117, buf, 16);
  if (v74)
  {
    v75 = v74;
    v111 = v17;
    v113 = v7;
    v76 = *(_QWORD *)v118;
    while (2)
    {
      for (j = 0; j != v75; ++j)
      {
        if (*(_QWORD *)v118 != v76)
          objc_enumerationMutation(v73);
        v78 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * j);
        if (!v78)
        {

          goto LABEL_209;
        }
        v79 = (objc_class *)MEMORY[0x1E0C99DF0];
        v80 = v22;
        v81 = objc_alloc_init(v79);
        v82 = v81;
        v83 = *(_QWORD *)(v78 + 72) - 1;
        if (v83 > 0x2A)
          v84 = 0;
        else
          v84 = byte_19BED7240[v83];
        LOBYTE(v121) = v84;
        objc_msgSend(v81, "appendBytes:length:", &v121, 1);
        v85 = *(_BYTE *)(v78 + 8);
        LOBYTE(v136) = v85;
        if (*(_BYTE *)(v78 + 9))
          LOBYTE(v136) = v85 | 2;
        objc_msgSend(v82, "appendBytes:length:", &v136, 1);
        switch(*(_QWORD *)(v78 + 72))
        {
          case 1:
          case 2:
            *(_QWORD *)__strerrbuf = 0;
            *(_QWORD *)&__strerrbuf[8] = 0;
            objc_msgSend(*(id *)(v78 + 80), "getUUIDBytes:", __strerrbuf);
            v90 = __strerrbuf;
            v91 = v82;
            v92 = 16;
            goto LABEL_183;
          case 3:
            v96 = *(_QWORD *)(v78 + 20);
            goto LABEL_175;
          case 4:
          case 0x28:
            v90 = (char *)(v78 + 28);
            goto LABEL_182;
          case 5:
            v95 = *(void **)(v78 + 88);
            goto LABEL_180;
          case 6:
            v95 = *(void **)(v78 + 96);
            goto LABEL_180;
          case 8:
            v95 = *(void **)(v78 + 112);
            goto LABEL_180;
          case 9:
            v96 = *(_QWORD *)(v78 + 48);
LABEL_175:
            *(_QWORD *)__strerrbuf = v96;
            v90 = __strerrbuf;
            v91 = v82;
            v92 = 8;
            goto LABEL_183;
          case 0xALL:
          case 0x13:
            v90 = (char *)(v78 + 12);
            goto LABEL_177;
          case 0xBLL:
          case 0xDLL:
          case 0x14:
          case 0x16:
            memset(&__strerrbuf[1], 0, 28);
            __strerrbuf[0] = *(_BYTE *)(v78 + 10);
            objc_msgSend(*(id *)(v78 + 120), "addressData");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "getBytes:length:", &__strerrbuf[1], 28);

            v87 = objc_msgSend(*(id *)(v78 + 120), "addressFamily");
            if (v87 == 30)
            {
              if (__strerrbuf[0] >= 0x81u)
                __strerrbuf[0] = 0x80;
            }
            else if (v87 == 2 && __strerrbuf[0] >= 0x21u)
            {
              __strerrbuf[0] = 32;
            }
            v90 = __strerrbuf;
            v91 = v82;
            v92 = 29;
            goto LABEL_183;
          case 0xCLL:
          case 0xELL:
          case 0x15:
          case 0x17:
            *(_QWORD *)&v135 = 0;
            v134 = 0u;
            memset(__strerrbuf, 0, sizeof(__strerrbuf));
            objc_msgSend(*(id *)(v78 + 120), "addressData");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "getBytes:length:", __strerrbuf, 28);

            objc_msgSend(*(id *)(v78 + 128), "addressData");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "getBytes:length:", &__strerrbuf[28], 28);

            v90 = __strerrbuf;
            v91 = v82;
            v92 = 56;
            goto LABEL_183;
          case 0xFLL:
            v95 = *(void **)(v78 + 136);
            if (v95)
              goto LABEL_180;
            break;
          case 0x10:
            v134 = 0u;
            v135 = 0u;
            memset(__strerrbuf, 0, sizeof(__strerrbuf));
            objc_msgSend(*(id *)(v78 + 144), "getCString:maxLength:encoding:", __strerrbuf, 32, 4);
            objc_msgSend(*(id *)(v78 + 152), "getCString:maxLength:encoding:", &v134, 32, 4);
            v90 = __strerrbuf;
            v91 = v82;
            v92 = 64;
            goto LABEL_183;
          case 0x12:
            v90 = (char *)(v78 + 11);
            v91 = v82;
            v92 = 1;
            goto LABEL_183;
          case 0x18:
            v90 = (char *)(v78 + 56);
            goto LABEL_182;
          case 0x1CLL:
            v94 = *(_DWORD *)(v78 + 64);
            v93 = *(_DWORD *)(v78 + 68);
            *(_DWORD *)__strerrbuf = *(_DWORD *)(v78 + 60);
            *(_DWORD *)&__strerrbuf[4] = v93;
            *(_DWORD *)&__strerrbuf[8] = v94;
            v90 = __strerrbuf;
            v91 = v82;
            v92 = 12;
            goto LABEL_183;
          case 0x1DLL:
            v95 = *(void **)(v78 + 160);
            if (!v95)
              break;
            goto LABEL_180;
          case 0x1ELL:
            v90 = (char *)(v78 + 14);
            goto LABEL_177;
          case 0x25:
            v90 = (char *)(v78 + 16);
LABEL_177:
            v91 = v82;
            v92 = 2;
            goto LABEL_183;
          case 0x26:
            v90 = (char *)(v78 + 32);
            goto LABEL_182;
          case 0x2ALL:
            v95 = *(void **)(v78 + 104);
LABEL_180:
            objc_msgSend(v95, "dataUsingEncoding:", 1);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "appendData:", v97);
            __strerrbuf[0] = 0;
            objc_msgSend(v82, "appendBytes:length:", __strerrbuf, 1);

            break;
          case 0x2BLL:
            objc_msgSend(v82, "appendBytes:length:", v78 + 36, 4);
            objc_msgSend(v82, "appendBytes:length:", v78 + 40, 4);
            v90 = (char *)(v78 + 44);
LABEL_182:
            v91 = v82;
            v92 = 4;
LABEL_183:
            objc_msgSend(v91, "appendBytes:length:", v90, v92);
            break;
          default:
            break;
        }
        +[NEPolicySession addTLVToMessage:type:length:value:]((uint64_t)v19[434], v80, 3, objc_msgSend(v82, "length"), objc_msgSend(v82, "bytes"));

        v22 = v116;
      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v117, buf, 16);
      if (v75)
        continue;
      break;
    }

    v17 = v111;
    v7 = v113;
  }
  else
  {

    *(_WORD *)__strerrbuf = 0;
    +[NEPolicySession addTLVToMessage:type:length:value:]((uint64_t)v19[434], v22, 3, 2, (uint64_t)__strerrbuf);
  }

  objc_msgSend(v22, "bytes");
  objc_msgSend(v22, "length");
  LODWORD(v121) = 0;
  if (necp_session_action())
  {
    v98 = *__error();
    if (strerror_r(v98, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    ne_log_obj();
    v99 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      v130 = v98;
      v131 = 2080;
      v132 = __strerrbuf;
      _os_log_fault_impl(&dword_19BD16000, v99, OS_LOG_TYPE_FAULT, "Failed to add policy: [%d] %s", buf, 0x12u);
    }

    ne_log_obj();
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
    {
      v107 = objc_msgSend(v116, "length");
      *(_DWORD *)__strerrbuf = 134217984;
      *(_QWORD *)&__strerrbuf[4] = v107;
      _os_log_debug_impl(&dword_19BD16000, v100, OS_LOG_TYPE_DEBUG, "Failed to add policy with tlv message of length %zu", (uint8_t *)__strerrbuf, 0xCu);
    }
    v28 = 0;
LABEL_202:

  }
  else
  {
    ne_log_obj();
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
    {
      v108 = objc_msgSend(v116, "length");
      *(_DWORD *)__strerrbuf = 134217984;
      *(_QWORD *)&__strerrbuf[4] = v108;
      _os_log_debug_impl(&dword_19BD16000, v101, OS_LOG_TYPE_DEBUG, "Added policy with tlv message of length %zu", (uint8_t *)__strerrbuf, 0xCu);
    }

    v28 = v121;
    if (v4)
    {
      if (v114)
        Property = objc_getProperty(v114, v102, 32, 1);
      else
        Property = 0;
      v104 = (void *)MEMORY[0x1E0CB37E8];
      v105 = Property;
      objc_msgSend(v104, "numberWithUnsignedInteger:", v28);
      v100 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setObject:forKeyedSubscript:", v7, v100);

      goto LABEL_202;
    }
  }
LABEL_203:

LABEL_204:
  return v28;
}

- (unint64_t)addPolicy:(id)a3
{
  return -[NEPolicySession addPolicy:storeLocally:](self, "addPolicy:storeLocally:", a3, 0);
}

- (id)dumpKernelPolicies
{
  uint64_t v2;
  unsigned int *v3;
  int *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  char *v8;
  NSObject *v9;
  uint32_t v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _UNKNOWN **v19;
  id v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  unsigned __int8 *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  unsigned __int8 *v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  unsigned int v41;
  unsigned __int8 *v42;
  unsigned __int8 v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  const __CFString *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  id v55;
  const char *v56;
  const char *v57;
  const char *v58;
  unsigned int *v59;
  const char *v60;
  const char *v61;
  __CFString *v62;
  const char *v63;
  const __CFString *v64;
  __CFString *v65;
  const __CFString *v66;
  __int128 *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  const char *v71;
  const char *v72;
  CFStringRef v73;
  const char *v74;
  const __CFString *v75;
  __CFString *v76;
  const __CFString *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  unsigned int *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *v91;
  unsigned int *v92;
  const char *v93;
  const char *v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  void *v106;
  id v107;
  __CFString *v108;
  const __CFString *v109;
  NSObject *v110;
  const char *v111;
  NSObject *v112;
  uint32_t v113;
  int v114;
  const char *v115;
  char *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  __CFString *v120;
  unint64_t i;
  unint64_t v122;
  uint64_t v123;
  void *v124;
  id v125;
  uint64_t v126;
  int v127;
  unsigned __int8 *v128;
  int v129;
  void *v130;
  _BYTE buf[20];
  char *v132;
  char __strerrbuf[48];
  __int128 v134;
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v2 = 0x80000;
  v3 = (unsigned int *)malloc_type_malloc(0x80000uLL, 0xF27A1854uLL);
  if (!v3)
  {
    v2 = 0x40000;
    v3 = (unsigned int *)malloc_type_malloc(0x40000uLL, 0xA3E84552uLL);
    if (!v3)
    {
      v15 = *__error();
      if (strerror_r(v15, __strerrbuf, 0x80uLL))
        __strerrbuf[0] = 0;
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = 0x40000;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v15;
        *(_WORD *)&buf[18] = 2080;
        v132 = __strerrbuf;
        _os_log_fault_impl(&dword_19BD16000, v16, OS_LOG_TYPE_FAULT, "Failed to allocate memory for policy dump (%zu bytes): [%d] %s", buf, 0x1Cu);
      }

      goto LABEL_24;
    }
  }
  __memset_chk();
  if (necp_session_action())
  {
    v4 = __error();
    v5 = *v4;
    if (*v4 != 12)
    {
      if (strerror_r(*v4, __strerrbuf, 0x80uLL))
        __strerrbuf[0] = 0;
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v5;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = __strerrbuf;
        _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, "Failed to dump all policies: [%d] %s", buf, 0x12u);
      }

      goto LABEL_23;
    }
    if (strerror_r(12, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 12;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = __strerrbuf;
      v7 = "Failed to dump all policies: [%d] %s";
      v8 = buf;
      v9 = v6;
      v10 = 18;
LABEL_21:
      _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, v7, (uint8_t *)v8, v10);
    }
LABEL_22:

LABEL_23:
    free(v3);
LABEL_24:
    v13 = 0;
    return v13;
  }
  v11 = *v3;
  if (v11 <= 3)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)__strerrbuf = 0;
    v7 = "Dump TLV size too small, ignoring";
LABEL_20:
    v8 = __strerrbuf;
    v9 = v6;
    v10 = 2;
    goto LABEL_21;
  }
  if (v2 - 4 < v11)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)__strerrbuf = 0;
    v7 = "Dump TLV size too large, ignoring";
    goto LABEL_20;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v3 + 1, v11);
  free(v3);
  *(_OWORD *)buf = xmmword_19BED722C;
  *(_DWORD *)&buf[16] = 20;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", buf, 0, "PROCESS", 0, 0);
  objc_msgSend(v18, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", buf, 1, "SESSION ORDER", 0, 0);
  objc_msgSend(v18, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", buf, 2, "POLICY ORDER", 0, 0);
  objc_msgSend(v18, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", buf, 3, "CONDITIONS", 0, 0);
  v118 = v18;
  objc_msgSend(v18, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", buf, 4, "RESULTS", 0, 1);
  v19 = &off_1E3CBB000;
  v20 = v17;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "bytes");
  v117 = v20;
  v22 = 0;
  v122 = objc_msgSend(v20, "length");
  v123 = v21;
  v23 = v21 + v122;
  v24 = (unsigned __int8 *)v21;
  for (i = v21 + v122; ; v23 = i)
  {
    objc_opt_self();
    objc_opt_self();
    if (v23 <= (unint64_t)v24)
    {
      ne_log_obj();
      v110 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        goto LABEL_212;
      *(_WORD *)__strerrbuf = 0;
      v111 = "Reached end of TLV Buffer";
      v112 = v110;
      v113 = 2;
      goto LABEL_211;
    }
    v25 = *(unsigned int *)(v24 + 1);
    if ((unint64_t)&v24[v25 + 5] > v23)
      break;
    v26 = (void *)+[NEPolicySession copyTLVForBytes:messageLength:type:includeHeaderOffset:n:hasFlags:]((uint64_t)v19[434], v123, v122, 101, v22, 0);
    if (!v26)
      goto LABEL_213;
    v27 = v26;
    v127 = v22;
    v128 = v24;
    v126 = objc_msgSend(v26, "length");
    v28 = v27;
    objc_opt_self();
    v125 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v130 = v29;
    if (objc_msgSend(v28, "length"))
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      while (1)
      {
        v33 = v31;
        v34 = (unsigned __int8 *)(objc_msgSend(v28, "bytes") + v30);
        objc_opt_self();
        if (!v34)
          goto LABEL_193;
        v35 = *v34;
        if (!*v34)
          goto LABEL_193;
        v129 = *(_DWORD *)(v34 + 1);
        v31 = (void *)+[NEPolicySession copyTLVForBytes:messageLength:type:includeHeaderOffset:n:hasFlags:]((uint64_t)v19[434], objc_msgSend(v28, "bytes") + v30, objc_msgSend(v28, "length"), v35, 0, 0);

        v36 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        if (v31 && objc_msgSend(v31, "bytes"))
        {
          if ((int)v35 > 99)
          {
            if ((_DWORD)v35 == 100 || (_DWORD)v35 == 102)
            {
              objc_msgSend(v36, "appendFormat:", CFSTR("%s"), objc_msgSend(v31, "bytes"), v116);
            }
            else if ((_DWORD)v35 == 103)
            {
              v38 = *(int *)objc_msgSend(v31, "bytes");
              v39 = "unknown";
              if (((int)v38 / 1000) <= 0xA)
                v39 = off_1E3CC34A0[(int)v38 / 1000];
              objc_msgSend(v36, "appendFormat:", CFSTR("%s (%u)"), v39, v38);
            }
          }
          else
          {
            switch((_DWORD)v35)
            {
              case 2:
                goto LABEL_45;
              case 3:
                if (objc_msgSend(v31, "length"))
                {
                  v40 = 0;
                  v41 = 0;
                  do
                  {
                    v42 = (unsigned __int8 *)(objc_msgSend(v31, "bytes") + v40);
                    objc_opt_self();
                    if (v42)
                    {
                      v41 += *(_DWORD *)(v42 + 1) + 6;
                      v43 = v42[5];
                      LODWORD(v42) = *v42;
                    }
                    else
                    {
                      v43 = 0;
                    }
                    v44 = (void *)+[NEPolicySession copyTLVForBytes:messageLength:type:includeHeaderOffset:n:hasFlags:]((uint64_t)v19[434], objc_msgSend(v31, "bytes") + v40, objc_msgSend(v31, "length"), (int)v42, 0, 1);
                    v45 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
                    objc_msgSend(v130, "objectForKey:", &unk_1E3D03748);
                    v46 = (id)objc_claimAutoreleasedReturnValue();
                    if (!v46)
                      v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    switch((int)v42)
                    {
                      case 0:
                        v47 = v45;
                        v48 = CFSTR("default ");
                        goto LABEL_125;
                      case 1:
                        memset(__strerrbuf, 0, 37);
                        uuid_unparse((const unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v44), "bytes"), __strerrbuf);
                        v49 = "!";
                        if ((v43 & 1) == 0)
                          v49 = "";
                        v116 = __strerrbuf;
                        objc_msgSend(v45, "appendFormat:", CFSTR("%seffective-application:%s "), v49);
                        break;
                      case 2:
                        memset(__strerrbuf, 0, 37);
                        uuid_unparse((const unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v44), "bytes"), __strerrbuf);
                        v50 = "!";
                        if ((v43 & 1) == 0)
                          v50 = "";
                        v116 = __strerrbuf;
                        objc_msgSend(v45, "appendFormat:", CFSTR("%sreal-application:%s "), v50);
                        break;
                      case 3:
                        if ((v43 & 1) != 0)
                          v51 = "!";
                        else
                          v51 = "";
                        v116 = (char *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                        objc_msgSend(v45, "appendFormat:", CFSTR("%sdomain:%s "), v51);
                        break;
                      case 4:
                        if ((v43 & 1) != 0)
                          v52 = "!";
                        else
                          v52 = "";
                        v116 = (char *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                        objc_msgSend(v45, "appendFormat:", CFSTR("%saccount-identifier:%s "), v52);
                        break;
                      case 5:
                        if (v44 && objc_msgSend(v44, "length"))
                        {
                          if ((v43 & 1) != 0)
                            v53 = "!";
                          else
                            v53 = "";
                          v116 = (char *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                          objc_msgSend(v45, "appendFormat:", CFSTR("%scustom-entitlement:%s "), v53);
                        }
                        else
                        {
                          v72 = "!";
                          if ((v43 & 1) == 0)
                            v72 = "";
                          v115 = v72;
                          v47 = v45;
                          v48 = CFSTR("%sentitlement ");
LABEL_125:
                          objc_msgSend(v47, "appendFormat:", v48, v115);
                        }
                        break;
                      case 6:
                        if ((v43 & 1) != 0)
                          v54 = "!";
                        else
                          v54 = "";
                        v55 = objc_retainAutorelease(v44);
                        objc_msgSend(v45, "appendFormat:", CFSTR("%seffective-pid:%u "), v54, *(unsigned int *)objc_msgSend(v55, "bytes"));
                        if ((unint64_t)objc_msgSend(v55, "length") >= 8)
                        {
                          v116 = (char *)*(unsigned int *)(objc_msgSend(objc_retainAutorelease(v55), "bytes") + 4);
                          objc_msgSend(v45, "appendFormat:", CFSTR("%sversion:%d "), v54);
                        }
                        break;
                      case 7:
                        if ((v43 & 1) != 0)
                          v56 = "!";
                        else
                          v56 = "";
                        v116 = (char *)*(unsigned int *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                        objc_msgSend(v45, "appendFormat:", CFSTR("%suid:%u "), v56);
                        break;
                      case 8:
                        v57 = "!";
                        if ((v43 & 1) == 0)
                          v57 = "";
                        objc_msgSend(v45, "appendFormat:", CFSTR("%sall-interfaces "), v57);
                        break;
                      case 9:
                        if ((v43 & 1) != 0)
                          v58 = "!";
                        else
                          v58 = "";
                        v116 = (char *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                        objc_msgSend(v45, "appendFormat:", CFSTR("%sscoped-interface:%s "), v58);
                        break;
                      case 10:
                        v59 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                        v60 = "!";
                        if ((v43 & 1) == 0)
                          v60 = "";
                        v116 = (char *)*v59;
                        objc_msgSend(v45, "appendFormat:", CFSTR("%straffic-class-range:%u-%u "), v60);
                        break;
                      case 11:
                        if ((v43 & 1) != 0)
                          v61 = "!";
                        else
                          v61 = "";
                        v116 = (char *)*(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                        objc_msgSend(v45, "appendFormat:", CFSTR("%sip-protocol:%u "), v61);
                        break;
                      case 16:
                        v134 = 0u;
                        memset(__strerrbuf, 0, sizeof(__strerrbuf));
                        v67 = (__int128 *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                        v68 = v67[3];
                        v70 = *v67;
                        v69 = v67[1];
                        *(_OWORD *)&__strerrbuf[32] = v67[2];
                        v134 = v68;
                        *(_OWORD *)__strerrbuf = v70;
                        *(_OWORD *)&__strerrbuf[16] = v69;
                        v71 = "!";
                        if ((v43 & 1) == 0)
                          v71 = "";
                        v116 = __strerrbuf;
                        objc_msgSend(v45, "appendFormat:", CFSTR("%sagent-domain:%s/agent-type:%s"), v71);
                        break;
                      default:
                        if ((v42 & 0xFE) == 0xE)
                        {
                          v119 = objc_msgSend(objc_retainAutorelease(v44), "bytes");
                          v120 = (__CFString *)NECreateAddressString((CFStringRef)v119);
                          v73 = NECreateAddressString((CFStringRef)(v119 + 28));
                          v74 = "!";
                          if ((v43 & 1) == 0)
                            v74 = "";
                          if (v120)
                            v75 = v120;
                          else
                            v75 = CFSTR("<nil>");
                          v76 = (__CFString *)v73;
                          if ((_DWORD)v42 == 14)
                            v77 = CFSTR("%slocal-address-range:%@-%@");
                          else
                            v77 = CFSTR("%sremote-address-range:%@-%@");
                          v116 = (char *)v75;
                          objc_msgSend(v45, "appendFormat:", v77, v74);

                        }
                        else if ((v42 & 0xFE) == 0xC)
                        {
                          v62 = NECreateAddressStringWithPort(objc_msgSend(objc_retainAutorelease(v44), "bytes") + 1);
                          v63 = "!";
                          if ((v43 & 1) == 0)
                            v63 = "";
                          v64 = CFSTR("<nil>");
                          if (v62)
                            v64 = v62;
                          v65 = v62;
                          if ((_DWORD)v42 == 12)
                            v66 = CFSTR("%slocal-address:%@/%u");
                          else
                            v66 = CFSTR("%sremote-address:%@/%u");
                          v116 = (char *)v64;
                          objc_msgSend(v45, "appendFormat:", v66, v63);

                        }
                        else
                        {
                          switch((int)v42)
                          {
                            case 17:
                              v78 = "!";
                              if ((v43 & 1) == 0)
                                v78 = "";
                              objc_msgSend(v45, "appendFormat:", CFSTR("%smodern-network-api"), v78);
                              break;
                            case 18:
                              if ((v43 & 1) != 0)
                                v79 = "!";
                              else
                                v79 = "";
                              v116 = (char *)*(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                              objc_msgSend(v45, "appendFormat:", CFSTR("%slocal-networks:%u"), v79);
                              break;
                            case 24:
                              if ((v43 & 1) != 0)
                                v80 = "!";
                              else
                                v80 = "";
                              v116 = (char *)*(unsigned int *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                              objc_msgSend(v45, "appendFormat:", CFSTR("%sclient-flags:%u"), v80);
                              break;
                            case 25:
                              v81 = "!";
                              if ((v43 & 1) == 0)
                                v81 = "";
                              objc_msgSend(v45, "appendFormat:", CFSTR("%slocal-address-empty"), v81);
                              break;
                            case 26:
                              v82 = "!";
                              if ((v43 & 1) == 0)
                                v82 = "";
                              objc_msgSend(v45, "appendFormat:", CFSTR("%sremote-address-empty"), v82);
                              break;
                            case 27:
                              v83 = "!";
                              if ((v43 & 1) == 0)
                                v83 = "";
                              objc_msgSend(v45, "appendFormat:", CFSTR("%splatform-binary"), v83);
                              break;
                            case 28:
                              v84 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                              v85 = "!";
                              if ((v43 & 1) == 0)
                                v85 = "";
                              v116 = (char *)*v84;
                              objc_msgSend(v45, "appendFormat:", CFSTR("%splatform:%u/sdk-version:%u/min-sdk-version:%u"), v85);
                              break;
                            case 29:
                              if (v44 && objc_msgSend(v44, "length"))
                              {
                                if ((v43 & 1) != 0)
                                  v86 = "!";
                                else
                                  v86 = "";
                                v116 = (char *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                                objc_msgSend(v45, "appendFormat:", CFSTR("%ssigning-identifier:%s "), v86);
                              }
                              else
                              {
                                v94 = "!";
                                if ((v43 & 1) == 0)
                                  v94 = "";
                                objc_msgSend(v45, "appendFormat:", CFSTR("%ssigning-identifier "), v94);
                              }
                              break;
                            case 30:
                              if ((v43 & 1) != 0)
                                v87 = "!";
                              else
                                v87 = "";
                              v116 = (char *)*(unsigned int *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                              objc_msgSend(v45, "appendFormat:", CFSTR("%spacket-filter-tags:%u"), v87);
                              break;
                            case 31:
                              v88 = "!";
                              if ((v43 & 1) == 0)
                                v88 = "";
                              objc_msgSend(v45, "appendFormat:", CFSTR("%sis-loopback"), v88);
                              break;
                            case 32:
                              v89 = "!";
                              if ((v43 & 1) == 0)
                                v89 = "";
                              objc_msgSend(v45, "appendFormat:", CFSTR("%sdelegate-is-platform-binary"), v89);
                              break;
                            case 37:
                              if ((v43 & 1) != 0)
                                v90 = "!";
                              else
                                v90 = "";
                              v116 = (char *)(bswap32(*(unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v44), "bytes")) >> 16);
                              objc_msgSend(v45, "appendFormat:", CFSTR("%sscheme-port:%u"), v90);
                              break;
                            case 39:
                              v91 = "!";
                              if ((v43 & 1) == 0)
                                v91 = "";
                              objc_msgSend(v45, "appendFormat:", CFSTR("%ssigned-result"), v91);
                              break;
                            case 43:
                              if ((unint64_t)objc_msgSend(v44, "length") >= 0xC)
                              {
                                v92 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
                                v93 = "!";
                                if ((v43 & 1) == 0)
                                  v93 = "";
                                v116 = (char *)*v92;
                                objc_msgSend(v45, "appendFormat:", CFSTR("%sscoped-interface-flags: %X, eflags %X, xflags %X"), v93);
                              }
                              break;
                            default:
                              goto LABEL_126;
                          }
                        }
                        break;
                    }
LABEL_126:
                    objc_msgSend(v46, "addObject:", v45);
                    v29 = v130;
                    objc_msgSend(v130, "setObject:forKey:", v46, &unk_1E3D03748);

                    v40 = v41;
                    v19 = &off_1E3CBB000;
                  }
                  while (objc_msgSend(v31, "length") > (unint64_t)v41);
                }
                goto LABEL_48;
              case 5:
LABEL_45:
                objc_msgSend(v36, "appendFormat:", CFSTR("%u"), *(unsigned int *)objc_msgSend(v31, "bytes"), v116);
                break;
            }
          }
        }
        else
        {
          objc_msgSend(v36, "appendFormat:", CFSTR("N/A"), v115, v116);
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v36, v37);

LABEL_48:
        v30 = (v32 + v129 + 5);

        v32 = v30;
        if (objc_msgSend(v28, "length") <= (unint64_t)v30)
          goto LABEL_193;
      }
    }
    v31 = 0;
LABEL_193:
    if (objc_msgSend(v29, "count"))
    {
      *(_DWORD *)&__strerrbuf[16] = 20;
      *(_OWORD *)__strerrbuf = xmmword_19BED722C;
      objc_msgSend(v29, "objectForKey:", &unk_1E3D03760);
      v95 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v96 = v29;
      v97 = v125;
      objc_msgSend(v125, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 0, objc_msgSend(v95, "UTF8String"), 0, 0);

      objc_msgSend(v96, "objectForKey:", &unk_1E3D03778);
      v98 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v125, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 1, objc_msgSend(v98, "UTF8String"), 0, 0);

      objc_msgSend(v96, "objectForKey:", &unk_1E3D03790);
      v99 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v125, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 2, objc_msgSend(v99, "UTF8String"), 0, 0);

      objc_msgSend(v96, "objectForKey:", &unk_1E3D03748);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      if (v100 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (v101 = objc_msgSend(v100, "count")) != 0)
      {
        v102 = v101;
        v103 = 0;
        v104 = v101 - 1;
        do
        {
          objc_msgSend(v100, "objectAtIndex:", v103);
          v105 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v125, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 3, objc_msgSend(v105, "UTF8String"), v103 != 0, v104 != v103);

          ++v103;
        }
        while (v102 != v103);
      }
      else
      {
        objc_msgSend(v125, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 3, "--", 0, 0);
      }
      v106 = v130;
      objc_msgSend(v130, "objectForKey:", &unk_1E3D037A8);
      v107 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v125, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 4, objc_msgSend(v107, "UTF8String"), 0, 1);

      v108 = (__CFString *)v125;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NO DATA"));
      v108 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v106 = v29;
      v97 = v125;
    }
    v24 = &v128[v126 + 5];
    v22 = v127 + 1;

    if (v108)
      v109 = v108;
    else
      v109 = CFSTR("nil");
    objc_msgSend(v124, "appendString:", v109);

  }
  v114 = *v24;
  ne_log_obj();
  v110 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
    goto LABEL_212;
  *(_DWORD *)__strerrbuf = 134218496;
  *(_QWORD *)&__strerrbuf[4] = &v24[-v123];
  *(_WORD *)&__strerrbuf[12] = 1024;
  *(_DWORD *)&__strerrbuf[14] = v114;
  *(_WORD *)&__strerrbuf[18] = 1024;
  *(_DWORD *)&__strerrbuf[20] = v25;
  v111 = "TLV buffer truncated: cursor - start: %zu, type: %d, length: %u";
  v112 = v110;
  v113 = 24;
LABEL_211:
  _os_log_impl(&dword_19BD16000, v112, OS_LOG_TYPE_INFO, v111, (uint8_t *)__strerrbuf, v113);
LABEL_212:

LABEL_213:
  if (&v24[-v123] != (unsigned __int8 *)v122)
    objc_msgSend(v124, "appendString:", CFSTR("\nMISSING POLICY INFORMATION!\n"));

  v13 = v118;
  objc_msgSend(v118, "appendString:", v124);

  return v13;
}

- (BOOL)apply
{
  int v2;
  int v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  char *v8;
  char __strerrbuf[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = necp_session_action();
  if (v2)
  {
    v3 = *__error();
    if (strerror_r(v3, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v6[0] = 67109378;
      v6[1] = v3;
      v7 = 2080;
      v8 = __strerrbuf;
      _os_log_fault_impl(&dword_19BD16000, v4, OS_LOG_TYPE_FAULT, "Failed to apply policies: [%d] %s", (uint8_t *)v6, 0x12u);
    }

  }
  return v2 == 0;
}

- (id)policyWithID:(unint64_t)a3
{
  void *v4;
  NEPolicySession *v5;
  void *v6;
  void *v7;

  if (self)
    self = (NEPolicySession *)objc_getProperty(self, a2, 32, 1);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = self;
  objc_msgSend(v4, "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEPolicySession objectForKey:](v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)removePolicyWithID:(unint64_t)a3
{
  const char *v5;
  int v6;
  NSObject *v7;
  id Property;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  char *v19;
  char __strerrbuf[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  if (!self)
  {
    if (necp_session_action())
      goto LABEL_3;
    Property = 0;
LABEL_9:
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = Property;
    objc_msgSend(v10, "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v12);

    return 1;
  }
  if (!necp_session_action())
  {
    Property = objc_getProperty(self, v5, 32, 1);
    goto LABEL_9;
  }
LABEL_3:
  v6 = *__error();
  if (strerror_r(v6, __strerrbuf, 0x80uLL))
    __strerrbuf[0] = 0;
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109634;
    v15 = v13;
    v16 = 1024;
    v17 = v6;
    v18 = 2080;
    v19 = __strerrbuf;
    _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, "Failed to delete policy %u: [%d] %s", buf, 0x18u);
  }

  return 0;
}

- (BOOL)removeAllPolicies
{
  const char *v3;
  int v4;
  NSObject *v5;
  id Property;
  _DWORD v8[2];
  __int16 v9;
  char *v10;
  char __strerrbuf[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!self)
  {
    if (necp_session_action())
      goto LABEL_3;
    Property = 0;
LABEL_9:
    objc_msgSend(Property, "removeAllObjects");
    return 1;
  }
  if (!necp_session_action())
  {
    Property = objc_getProperty(self, v3, 32, 1);
    goto LABEL_9;
  }
LABEL_3:
  v4 = *__error();
  if (strerror_r(v4, __strerrbuf, 0x80uLL))
    __strerrbuf[0] = 0;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v8[0] = 67109378;
    v8[1] = v4;
    v9 = 2080;
    v10 = __strerrbuf;
    _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, "Failed to delete all policies: [%d] %s", (uint8_t *)v8, 0x12u);
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReceivedResponse, 0);
  objc_storeStrong((id *)&self->_responseSemaphore, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
  objc_storeStrong((id *)&self->_policies, 0);
}

+ (uint64_t)copyTLVForBytes:(uint64_t)a1 messageLength:(uint64_t)a2 type:(unint64_t)a3 includeHeaderOffset:(int)a4 n:(int)a5 hasFlags:(int)a6
{
  uint64_t result;
  unint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  objc_opt_self();
  result = 0;
  if (!a2 || !a3)
    return result;
  v12 = 0;
  v13 = 0;
  while (1)
  {
    v14 = a2 + v12;
    if (*(unsigned __int8 *)(a2 + v12) == a4)
      break;
LABEL_7:
    v12 += *(unsigned int *)(v14 + 1) + 5;
    if (v12 >= a3)
      return 0;
  }
  if (v13 != a5)
  {
    ++v13;
    goto LABEL_7;
  }
  v15 = 5;
  if (a6)
    v15 = 6;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14 + v15, *(unsigned int *)(v14 + 1));
  return objc_claimAutoreleasedReturnValue();
}

+ (void)addTLVToMessage:(char)a3 type:(uint64_t)a4 length:(uint64_t)a5 value:
{
  id v7;
  int v8;
  char v9;

  v9 = a3;
  v7 = a2;
  objc_opt_self();
  objc_msgSend(v7, "appendBytes:length:", &v9, 1);
  v8 = a4;
  objc_msgSend(v7, "appendBytes:length:", &v8, 4);
  objc_msgSend(v7, "appendBytes:length:", a5, a4);

}

uint64_t __39__NEPolicySession_initWithSessionName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "name"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)),
        v4,
        v5))
  {
    objc_msgSend(v3, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = dup(objc_msgSend(v6, "fileDescriptor"));

    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __39__NEPolicySession_initWithSessionName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
