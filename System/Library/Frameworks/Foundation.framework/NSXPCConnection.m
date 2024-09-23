@implementation NSXPCConnection

- (id)replacementObjectForEncoder:(id)a3 object:(id)a4
{
  char v5;
  void *v7;

  if (!atomic_load((unint64_t *)&self->_delegate))
    return a4;
  v5 = atomic_load(&self->_state2);
  if ((v5 & 2) == 0)
    return a4;
  v7 = (void *)atomic_load((unint64_t *)&self->_delegate);
  return (id)objc_msgSend(v7, "replacementObjectForXPCConnection:encoder:object:");
}

void __56__NSXPCConnection__initWithPeerConnection_name_options___block_invoke(uint64_t a1, void *a2)
{
  message_handler_0(*(unsigned __int8 **)(a1 + 32), a2);
}

- (id)_errorDescription
{
  char v3;
  uint64_t pid;
  char v5;
  NSString *v6;
  NSString *v7;
  char v8;
  NSString *serviceName;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
    pid = -[_NSXPCTransport processIdentifier](self->_transport, "processIdentifier");
  else
    pid = xpc_connection_get_pid(self->_connection.xpc);
  v5 = atomic_load(&self->_state2);
  if ((v5 & 0x10) != 0)
  {
    if ((_DWORD)pid)
      v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" from pid %d"), pid);
    else
      v7 = (NSString *)&stru_1E0F56070;
    serviceName = self->_serviceName;
    if (serviceName && -[NSString length](serviceName, "length"))
    {
      v11 = CFSTR("custom");
      if ((v3 & 0x40) == 0)
        v11 = CFSTR("mach");
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("connection%@ on %@ service named %@"), v7, v11, self->_serviceName);
    }
    else
    {
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("connection%@ on anonymousListener or serviceListener"), v7, v12, v13);
    }
  }
  else
  {
    if ((_DWORD)pid)
      v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" with pid %d"), pid);
    else
      v6 = (NSString *)&stru_1E0F56070;
    v8 = atomic_load(&self->_state2);
    if ((v8 & 0x20) != 0)
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("connection to service%@ created from an endpoint"), v6, v12, v13);
    else
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("connection to service%@ named %@"), v6, self->_serviceName, v13);
  }
}

- (NSXPCConnection)initWithMachServiceName:(NSString *)name options:(NSXPCConnectionOptions)options
{
  NSXPCConnection *v7;
  const char *v8;
  const char *v9;
  NSObject *v10;
  NSObject *global_queue;
  _xpc_connection_s *mach_service;
  _xpc_connection_s *xpc;
  void *v15;
  _QWORD handler[6];

  handler[5] = *MEMORY[0x1E0C80C00];
  v7 = -[NSXPCConnection init](self, "init");
  if (v7)
  {
    v8 = -[NSFileManager fileSystemRepresentationWithPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileSystemRepresentationWithPath:", name);
    if (!v8)
    {

      v8 = 0;
    }
    v9 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.NSXPCConnection.m-user.%@"), name), "UTF8String");
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v7->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v9, v10, global_queue);
    v7->_serviceName = (NSString *)-[NSString copy](name, "copy");
    mach_service = xpc_connection_create_mach_service(v8, (dispatch_queue_t)v7->_userQueue, (options >> 11) & 2);
    v7->_connection.xpc = mach_service;
    if (!mach_service)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Unable to connect to the specified name (%@). No connection was created."), _NSMethodExceptionProem((objc_class *)v7, a2), v7->_serviceName), 0);
      objc_exception_throw(v15);
    }
    xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)v7->_userQueue);
    xpc = v7->_connection.xpc;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __51__NSXPCConnection_initWithMachServiceName_options___block_invoke;
    handler[3] = &unk_1E0F4FF38;
    handler[4] = v7;
    xpc_connection_set_event_handler(xpc, handler);
    -[NSString UTF8String](v7->_serviceName, "UTF8String");
  }
  return v7;
}

- (NSXPCConnection)init
{
  NSXPCConnection *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSXPCConnection;
  v2 = -[NSXPCConnection init](&v4, sel_init);
  if (v2)
  {
    v2->_exportInfo = (_NSXPCConnectionExportedObjectTable *)objc_opt_new();
    v2->_importInfo = (_NSXPCConnectionImportInfo *)objc_opt_new();
    v2->_repliesExpected = (_NSXPCConnectionExpectedReplies *)objc_opt_new();
    v2->_repliesRequested = (_NSXPCConnectionRequestedReplies *)objc_opt_new();
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_eCache = (_NSXPCConnectionClassCache *)objc_opt_new();
    v2->_dCache = (_NSXPCConnectionClassCache *)objc_opt_new();
    v2->_importInfo->_generationCount = 1;
  }
  return v2;
}

void __51__NSXPCConnection_initWithMachServiceName_options___block_invoke(uint64_t a1, void *a2)
{
  message_handler_0(*(unsigned __int8 **)(a1 + 32), a2);
}

- (void)_sendInvocation:(id)a3 orArguments:(id *)a4 count:(unint64_t)a5 methodSignature:(id)a6 selector:(SEL)a7 withProxy:(id)a8
{
  const char *v14;
  double v15;
  SEL v16;
  xpc_object_t v17;
  unint64_t v18;
  const char *v19;
  char v20;
  _QWORD *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  const char *v27;
  id v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  _QWORD *v32;
  const char *v33;
  const char *v34;
  SEL v35;
  SEL v36;
  uint64_t v37;
  _NSXPCDistantObject *v38;
  id v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  int v43;
  __objc2_class *v44;
  _BYTE *v45;
  void *v46;
  NSXPCEncoder *v47;
  NSProgress *v48;
  NSProgress *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  NSObject *v55;
  _BYTE *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  char v62;
  _NSXPCConnectionExportedObjectTable *exportInfo;
  uint64_t v64;
  char v65;
  NSObject *userQueue;
  xpc_object_t v67;
  void *v68;
  _BOOL4 v69;
  NSString *v70;
  NSString *v71;
  void *v72;
  _QWORD *v73;
  const __CFString *v74;
  NSString *v75;
  objc_class *v76;
  uint64_t v77;
  const char *v78;
  char v79;
  dispatch_time_t v80;
  char v81;
  const char *Name;
  const char *v83;
  uint64_t v84;
  unint64_t v85;
  SEL v86;
  dispatch_semaphore_t v87;
  xpc_object_t v88;
  NSXPCConnection *v90;
  id Property;
  void *v92;
  _BYTE *v93;
  uint64_t value;
  id newValue;
  uint64_t v96;
  _QWORD handler[2];
  void (*v99)(uint64_t, void *);
  void *v100;
  NSXPCConnection *v101;
  _QWORD *v102;
  id v103;
  char *v104;
  uint64_t v105;
  SEL v106;
  char v107;
  _QWORD v108[6];
  _QWORD v109[6];
  _QWORD v110[6];
  _QWORD block[6];
  id v112;
  id v113[258];

  v113[256] = *(id *)MEMORY[0x1E0C80C00];
  v92 = (void *)objc_msgSend(a8, "_userInfo");
  if (a8)
  {
    v15 = *((double *)a8 + 8);
    Property = objc_getProperty(a8, v14, 32, 1);
    newValue = objc_getProperty(a8, v16, 16, 1);
  }
  else
  {
    Property = 0;
    newValue = 0;
    v15 = 0.0;
  }
  v17 = xpc_dictionary_create(0, 0, 0);
  v18 = objc_msgSend(a6, "numberOfArguments");
  if (!a3 && v18 - 2 != a5)
  {
    v70 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[NSXPCConnection sendInvocation]: Mismatch of count of expected arguments (%s) %lu vs %lu"), sel_getName(a7), v18 - 2, a5);
LABEL_105:
    v71 = v70;
    v72 = (void *)MEMORY[0x1E0C99DA0];
    v73 = (_QWORD *)MEMORY[0x1E0C99768];
    goto LABEL_119;
  }
  if (a8)
    value = *((_QWORD *)a8 + 5);
  else
    value = 0;
  v85 = a5;
  v86 = a2;
  v93 = a8;
  if (v18 >= 3)
  {
    v19 = 0;
    v20 = 0;
    v87 = 0;
    v88 = v17;
    v21 = 0;
    v22 = v18 - 2;
    v23 = 2;
    v96 = 1;
    v90 = self;
    while (1)
    {
      v24 = objc_msgSend(a6, "_argInfo:", v19 + 2);
      if (!v24)
        break;
      v25 = *(_WORD *)(v24 + 34);
      if ((v25 & 0x80) != 0)
      {
        v24 = *(_QWORD *)v24;
        if (!v24)
          break;
        v25 = *(_WORD *)(v24 + 34);
      }
      if ((v25 & 8) != 0)
      {
        Name = sel_getName(a7);
        v74 = CFSTR("[NSXPCConnection sendInvocation]: Arguments to messages sent to this proxy may not be 'byref'. (%s)");
        goto LABEL_117;
      }
      if ((v25 & 2) != 0)
      {
        Name = sel_getName(a7);
        v74 = CFSTR("[NSXPCConnection sendInvocation]: Arguments to messages sent to this proxy may not be 'out'. (%s)");
        goto LABEL_117;
      }
      if ((v25 & 0x1000) != 0)
      {
        v26 = *(_QWORD *)(v24 + 8);
        if (v26)
        {
          if ((*(_WORD *)(v26 + 34) & 0x1000) != 0)
          {
            Name = sel_getName(a7);
            v74 = CFSTR("[NSXPCConnection sendInvocation]: Arguments to messages sent to this proxy may not be of type '**'. (%s)");
            goto LABEL_117;
          }
        }
      }
      if (v25 < 0)
      {
        if ((v20 & 1) != 0)
        {
          Name = sel_getName(a7);
          v74 = CFSTR("[NSXPCConnection sendInvocation]: Only one reply block is allowed per message send. (%s)");
          goto LABEL_117;
        }
        if (v93 && (v93[56] & 2) != 0)
        {
          Name = sel_getName(a7);
          v74 = CFSTR("[NSXPCConnection sendInvocation]: A reply block was sent over a 'no importance' proxy. (%s)");
          goto LABEL_117;
        }
        v113[0] = 0;
        if (a3)
        {
          objc_msgSend(a3, "getArgument:atIndex:", v113, v19 + 2);
          v28 = v113[0];
          if (!v113[0])
            goto LABEL_110;
        }
        else
        {
          v28 = a4[(_QWORD)v19];
          v113[0] = v28;
          if (!v28)
          {
LABEL_110:
            Name = sel_getName(a7);
            v74 = CFSTR("[NSXPCConnection sendInvocation]: A NULL reply block was passed into a message meant to be sent over a connection. (%s)");
            goto LABEL_117;
          }
        }
        v29 = _Block_signature(v28);
        if (!v29)
        {
          Name = sel_getName(a7);
          v74 = CFSTR("[NSXPCConnection sendInvocation]: Block was not compiled using a compiler that inserts type information about arguments. (%s)");
          goto LABEL_117;
        }
        v30 = v29;
        v31 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", v29), "_argInfo:", -1);
        if ((*(_WORD *)(v31 + 34) & 0x80) != 0)
          v31 = *(_QWORD *)v31;
        if (*(_BYTE *)(v31 + 36) != 118)
        {
          Name = sel_getName(a7);
          v74 = CFSTR("[NSXPCConnection sendInvocation]: Return value of block argument must be 'void'. (%s)");
          goto LABEL_117;
        }
        v32 = -[_NSXPCConnectionExpectedReplyInfo initWithSelector:]([_NSXPCConnectionExpectedReplyInfo alloc], (uint64_t)a7);
        v21 = v32;
        if (v32)
        {
          objc_setProperty_atomic(v32, v33, newValue, 40);
          v21[7] = value;
          if (v92)
            objc_setProperty_atomic(v21, v34, v92, 48);
          objc_setProperty_atomic_copy(v21, v34, v113[0], 8);
          objc_setProperty_atomic_copy(v21, v35, Property, 16);
          if (v15 != 0.0)
          {
            v87 = dispatch_semaphore_create(0);
            objc_setProperty_atomic(v21, v36, v87, 24);
          }
        }
        else if (v15 != 0.0)
        {
          v87 = dispatch_semaphore_create(0);
        }
        sel_getName(a7);
        v96 |= 0x20uLL;
        xpc_dictionary_set_string(v17, "replysig", v30);
        v20 = 1;
      }
      else if ((v25 & 0x2000) != 0)
      {
        v113[0] = 0;
        if (a3)
        {
          objc_msgSend(a3, "getArgument:atIndex:", v113, v19 + 2);
          v27 = (const char *)(v23 - 2);
        }
        else
        {
          v113[0] = a4[(_QWORD)v19];
          v27 = v19;
        }
        v37 = objc_msgSend(newValue, "_interfaceForArgument:ofSelector:reply:", v27, a7, 0);
        if (v113[0])
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!v37)
            {
              Name = v27;
              v83 = sel_getName(a7);
              v74 = CFSTR("[NSXPCConnection sendInvocation]: A proxy object was passed as an argument to a message (argument %ld) but the interface does not specify a proxy object there. (%s)");
              goto LABEL_117;
            }
          }
          else if (v113[0] && v37)
          {
            v112 = 0;
            v38 = [_NSXPCDistantObject alloc];
            v39 = -[_NSXPCDistantObject _initWithConnection:exportedObject:interface:](v38, "_initWithConnection:exportedObject:interface:", v90, v113[0], v37);
            v112 = v39;
            if (a3)
            {
              objc_msgSend(a3, "setArgument:atIndex:", &v112, v19 + 2);
              objc_msgSend(a3, "_addAttachedObject:", v112);
            }
            else
            {
              a4[(_QWORD)v27] = v39;
            }

          }
        }
        self = v90;
        v17 = v88;
      }
      ++v23;
      if ((const char *)v22 == ++v19)
        goto LABEL_56;
    }
    v70 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[NSXPCConnection sendInvocation]: No argument type for invocation argument (%s)"), sel_getName(a7), v83, v84);
    goto LABEL_105;
  }
  v21 = 0;
  v87 = 0;
  v96 = 1;
LABEL_56:
  v40 = objc_msgSend(a6, "_argInfo:", -1);
  v42 = v40;
  if ((*(_WORD *)(v40 + 34) & 0x80) != 0)
    v42 = *(_QWORD *)v40;
  v43 = *(unsigned __int8 *)(v42 + 36);
  if (v43 != 118)
  {
    if (v21)
    {
      v44 = (__objc2_class *)objc_msgSend(newValue, "_returnClassForSelector:", a7);
      if (v44 == NSProgress)
        goto LABEL_61;
      v76 = (objc_class *)v44;
      v77 = *(unsigned __int8 *)(v42 + 36);
      v78 = sel_getName(a7);
      v75 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[NSXPCConnection sendInvocation]: Return type (%c) of method %s is an object (%s) but not 'NSProgress'"), v77, v78, class_getName(v76));
    }
    else
    {
      Name = sel_getName(a7);
      v74 = CFSTR("[NSXPCConnection sendInvocation]: Return type of methods sent over this proxy must be 'void' or 'NSProgress *' (%s)");
LABEL_117:
      v75 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v74, Name, v83, v84);
    }
    v71 = v75;
    v72 = (void *)MEMORY[0x1E0C99DA0];
    v73 = (_QWORD *)MEMORY[0x1E0C99778];
LABEL_119:
    objc_exception_throw((id)objc_msgSend(v72, "exceptionWithName:reason:userInfo:", *v73, v71, 0));
  }
LABEL_61:
  if (value != 1)
  {
    v45 = v93;
    if (v93)
      v45 = (_BYTE *)*((_QWORD *)v93 + 6);
    if (v45 != (_BYTE *)self->_importInfo->_generationCount)
    {
      v55 = v87;
      if (v21 && objc_getProperty(v21, v41, 16, 1))
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke;
        block[3] = &unk_1E0F4C650;
        block[4] = self;
        block[5] = v21;
        if (v93 && (v93[56] & 4) != 0)
          __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke((uint64_t)block);
        else
          dispatch_async((dispatch_queue_t)self->_userQueue, block);
      }
      v69 = v21 != 0;
      goto LABEL_124;
    }
  }
  v46 = (void *)objc_opt_new();
  v47 = -[NSXPCEncoder initWithStackSpace:size:]([NSXPCEncoder alloc], "initWithStackSpace:size:", v113, 2048);
  -[NSXPCEncoder _setConnection:](v47, "_setConnection:", self);
  -[NSXPCEncoder setDelegate:](v47, "setDelegate:", self);
  if (self->_otherInfo)
    -[NSXPCCoder setUserInfo:](v47, "setUserInfo:");
  if (a3)
    -[NSXPCEncoder _encodeInvocation:isReply:into:](v47, "_encodeInvocation:isReply:into:", a3, 0, v17);
  else
    -[NSXPCEncoder _encodeInvocationObjectArgumentsOnly:count:typeString:selector:isReply:into:](v47, "_encodeInvocationObjectArgumentsOnly:count:typeString:selector:isReply:into:", a4, v85, objc_msgSend(a6, "_cTypeString"), a7, 0, v17);

  xpc_dictionary_set_uint64(v17, "proxynum", value);
  if (!v21)
  {
    xpc_dictionary_set_uint64(v17, "f", v96);
    if (v93)
    {
      v53 = *((_QWORD *)v93 + 7);
      v54 = atomic_load(&self->_state2);
      if ((v53 & 2) != 0)
      {
        if ((v54 & 0x40) != 0)
          -[_NSXPCTransport sendNotification:](self->_transport, "sendNotification:", v17, v51, v52);
        else
          xpc_connection_send_notification();
        goto LABEL_132;
      }
      if ((v54 & 0x40) == 0)
        goto LABEL_77;
    }
    else
    {
      v81 = atomic_load(&self->_state2);
      if ((v81 & 0x40) == 0)
      {
LABEL_77:
        xpc_connection_send_message(self->_connection.xpc, v17);
LABEL_132:
        xpc_release(v17);
        goto LABEL_133;
      }
    }
    -[_NSXPCTransport sendMessage:](self->_transport, "sendMessage:", v17, v51, v52);
    goto LABEL_132;
  }
  v113[0] = 0;
  if (v43 != 118)
  {
    v113[0] = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 1);
    objc_msgSend(a3, "setReturnValue:", v113);
    v50 = v96 | 0xC0;
    v49 = (NSProgress *)v113[0];
    goto LABEL_84;
  }
  v48 = +[NSProgress currentProgress](NSProgress, "currentProgress");
  if (v48)
  {
    v49 = -[NSProgress initWithParent:userInfo:]([NSProgress alloc], "initWithParent:userInfo:", v48, 0);
    v113[0] = v49;
    v50 = v96 | 0x40;
LABEL_84:
    v56 = v93;
    goto LABEL_85;
  }
  v49 = 0;
  v56 = v93;
  v50 = v96;
LABEL_85:
  v57 = -[_NSXPCConnectionExpectedReplies sequenceForProgress:]((uint64_t)self->_repliesExpected, v49);
  xpc_dictionary_set_uint64(v17, "sequence", (uint64_t)v57);
  xpc_dictionary_set_uint64(v17, "f", v50);
  if (v113[0])
  {
    objc_msgSend(v113[0], "setTotalUnitCount:", 1);
    v60 = MEMORY[0x1E0C809B0];
    v110[0] = MEMORY[0x1E0C809B0];
    v110[1] = 3221225472;
    v110[2] = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_2;
    v110[3] = &unk_1E0F4EE20;
    v110[4] = self;
    v110[5] = v57;
    objc_msgSend(v113[0], "setCancellationHandler:", v110);
    v109[0] = v60;
    v109[1] = 3221225472;
    v109[2] = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_3;
    v109[3] = &unk_1E0F4EE20;
    v109[4] = self;
    v109[5] = v57;
    objc_msgSend(v113[0], "setPausingHandler:", v109);
    v108[0] = v60;
    v108[1] = 3221225472;
    v108[2] = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_4;
    v108[3] = &unk_1E0F4EE20;
    v108[4] = self;
    v108[5] = v57;
    objc_msgSend(v113[0], "setResumingHandler:", v108);
  }
  v61 = objc_msgSend(newValue, "_hasProxiesInReplyBlockArgumentsOfSelector:", a7, v58, v59);
  v62 = v61;
  if (v61)
  {
    exportInfo = self->_exportInfo;
    if (exportInfo)
      dispatch_group_enter((dispatch_group_t)exportInfo->_replyGroup);
  }
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  v99 = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_5;
  v100 = &unk_1E0F55518;
  v101 = self;
  v102 = v21;
  v103 = v113[0];
  v104 = v57;
  v105 = value;
  v106 = v86;
  v107 = v62;
  if (v56)
  {
    v64 = *((_QWORD *)v56 + 7);
    v65 = atomic_load(&self->_state2);
    v55 = v87;
    if ((v64 & 4) != 0)
    {
      if ((v65 & 0x40) != 0)
        v67 = (id)-[_NSXPCTransport sendMessageWithReplySync:](self->_transport, "sendMessageWithReplySync:", v17);
      else
        v67 = __NSXPCCONNECTION_IS_WAITING_FOR_A_SYNCHRONOUS_REPLY__(self->_connection.xpc, v17);
      v68 = v67;
      v99((uint64_t)handler, v67);
      xpc_release(v68);
      goto LABEL_123;
    }
    userQueue = self->_userQueue;
    if ((v65 & 0x40) == 0)
      goto LABEL_93;
LABEL_122:
    -[_NSXPCTransport sendMessageWithReply:onQueue:replyHandler:](self->_transport, "sendMessageWithReply:onQueue:replyHandler:", v17, userQueue, handler);
    goto LABEL_123;
  }
  v79 = atomic_load(&self->_state2);
  userQueue = self->_userQueue;
  v55 = v87;
  if ((v79 & 0x40) != 0)
    goto LABEL_122;
LABEL_93:
  xpc_connection_send_message_with_reply(self->_connection.xpc, v17, userQueue, handler);
LABEL_123:
  v69 = 1;
LABEL_124:
  xpc_release(v17);
  if (v69 && v55)
  {
    v80 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    if (dispatch_semaphore_wait(v55, v80))
    {
      -[NSXPCConnection invalidate](self, "invalidate");
      dispatch_semaphore_wait(v55, 0xFFFFFFFFFFFFFFFFLL);
    }
    dispatch_release(v55);
  }
LABEL_133:

}

- (NSXPCInterface)remoteObjectInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 96, 1);
}

- (id)_queue
{
  return self->_userQueue;
}

- (uid_t)effectiveUserIdentifier
{
  char v2;

  v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0)
    return -[_NSXPCTransport effectiveUserIdentifier](self->_transport, "effectiveUserIdentifier");
  else
    return xpc_connection_get_euid(self->_connection.xpc);
}

- (id)userInfo
{
  return self->_otherInfo;
}

+ (_QWORD)_currentBoost
{
  _QWORD *result;

  objc_opt_self();
  result = (_QWORD *)_CFGetTSD();
  if (result)
    return -[_NSXPCBoost _initWithEvent:]([_NSXPCBoost alloc], result);
  return result;
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_7(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[13];

  v13[12] = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int *)(*(_QWORD *)(a1[7] + 8) + 24);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(1u, v4));
  if (!v5)
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = *(_QWORD *)(v6 + 64);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_8;
    v13[3] = &unk_1E0F55478;
    v13[4] = v6;
    v13[5] = a2;
    v9 = (const void *)a1[8];
    v10 = a1[9];
    v13[6] = v7;
    v13[7] = a3;
    v11 = a1[10];
    v13[10] = v10;
    v13[11] = v11;
    v12 = a1[6];
    v13[8] = a4;
    v13[9] = v12;
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](v8, v9, (uint64_t)v13);
  }
}

- (void)_decodeAndInvokeReplyBlockWithEvent:(id)a3 sequence:(unint64_t)a4 replyInfo:(id)a5
{
  NSXPCDecoder *v8;
  SEL v9;
  NSXPCDecoder *v10;
  const char *v11;
  id v12;
  void *v13;
  NSString *v14;
  SEL v15;
  const char *v16;
  const __CFString **v17;
  NSString **v18;
  uint64_t v19;
  NSObject *v20;
  NSString *v21;
  const __CFString *v22;
  NSString *v23;
  _QWORD v24[2];
  _QWORD v25[4];
  uint8_t buf[4];
  NSXPCConnection *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v8 = [NSXPCDecoder alloc];
    v10 = -[NSXPCDecoder initWithInterface:](v8, "initWithInterface:", objc_getProperty(a5, v9, 40, 1));
    -[NSXPCDecoder _setConnection:](v10, "_setConnection:", self);
    if (self->_otherInfo)
      -[NSXPCCoder setUserInfo:](v10, "setUserInfo:");
    v12 = -[NSXPCDecoder _decodeReplyFromXPCObject:forSelector:](v10, "_decodeReplyFromXPCObject:forSelector:", a3, *((_QWORD *)a5 + 4));
    if (!v12)
    {
      v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSXPCConnection %p: Decode of incoming invocation failed (no result)"), self);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0));
    }
    objc_msgSend(v12, "setTarget:", objc_getProperty(a5, v11, 8, 1));
    _CFGetTSD();
    _CFSetTSD();
    v13 = (void *)atomic_load((unint64_t *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = -[NSString initWithUTF8String:]([NSString alloc], "initWithUTF8String:", sel_getName(*((SEL *)a5 + 4)));
      if (objc_getProperty(a5, v15, 48, 1))
      {
        v24[0] = CFSTR("_NSXPCConnectionInvocationReplyToSelectorKey");
        v24[1] = CFSTR("_NSXPCConnectionInvocationReplyUserInfoKey");
        v25[0] = v14;
        v25[1] = objc_getProperty(a5, v16, 48, 1);
        v17 = (const __CFString **)v24;
        v18 = (NSString **)v25;
        v19 = 2;
      }
      else
      {
        v22 = CFSTR("_NSXPCConnectionInvocationReplyToSelectorKey");
        v23 = v14;
        v17 = &v22;
        v18 = &v23;
        v19 = 1;
      }
      objc_msgSend(v12, "setUserInfo:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, v19));
      objc_msgSend(v13, "connection:handleInvocation:isReply:", self, v12, 1);

    }
    else
    {
      __NSXPCCONNECTION_IS_CALLING_OUT_TO_REPLY_BLOCK__(v12);
    }
    -[_NSXPCConnectionExpectedReplyInfo cleanup]((uint64_t)a5);
    _CFSetTSD();
  }
  else
  {
    v20 = _NSXPCLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = self;
      _os_log_fault_impl(&dword_1817D9000, v20, OS_LOG_TYPE_FAULT, "%{public}@: Warning: Received reply to unknown message. Dropping incoming message and invalidating connection.", buf, 0xCu);
    }
    -[NSXPCConnection invalidate](self, "invalidate");
  }
}

- (void)_decodeAndInvokeMessageWithEvent:(id)a3 reply:(id)a4 flags:(unint64_t)a5
{
  char v5;
  const char *uint64;
  os_unfair_lock_s *v11;
  os_unfair_lock_s *v12;
  os_unfair_lock_s *v13;
  unint64_t v14;
  NSXPCDecoder *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  BOOL v21;
  _NSProgressWithRemoteParent *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _WORD *v26;
  __int16 v27;
  char v28;
  NSObject *v29;
  const char *v30;
  const char *string;
  uint64_t v32;
  void *v33;
  char v34;
  NSObject *v35;
  char v36;
  uint64_t i;
  NSObject *v38;
  char v39;
  char v40;
  _QWORD *v41;
  char v42;
  char v43;
  const char *Name;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  const void *v52;
  void *v53;
  _NSProgressWithRemoteParent *v54;
  char v55;
  _BOOL4 v56;
  _QWORD v57[11];
  _QWORD v58[11];
  _QWORD v59[11];
  _QWORD v60[10];
  id v61;
  void *v62;
  _QWORD v63[3];
  int v64;
  id v65;
  const char *v66;
  _BYTE buf[12];
  __int16 v68;
  const char *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  _QWORD v74[8];

  v5 = a5;
  v74[5] = *MEMORY[0x1E0C80C00];
  uint64 = (const char *)xpc_dictionary_get_uint64(a3, "proxynum");
  if (!uint64
    || (v11 = -[_NSXPCConnectionExportedObjectTable exportedObjectForProxyNumber:]((os_unfair_lock_s *)self->_exportInfo, uint64), v12 = -[_NSXPCConnectionExportedObjectTable interfaceForProxyNumber:]((os_unfair_lock_s *)self->_exportInfo, uint64), !v11))
  {
    v16 = _NSXPCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      v68 = 2048;
      v69 = uint64;
      _os_log_fault_impl(&dword_1817D9000, v16, OS_LOG_TYPE_FAULT, "%{public}@: received an undecodable message for proxy %lld (no exported object to receive message). Dropping message.", buf, 0x16u);
    }
    goto LABEL_10;
  }
  v13 = v12;
  if (!v12)
  {
    v17 = _NSXPCLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_fault_impl(&dword_1817D9000, v17, OS_LOG_TYPE_FAULT, "%{public}@: received an undecodable message (no protocol set to define allowed messages on exported object). Dropping message.", buf, 0xCu);
    }
LABEL_10:
    -[NSXPCConnection invalidate](self, "invalidate");
    return;
  }
  v14 = atomic_load((unint64_t *)&self->_delegate);
  v53 = (void *)v14;
  v55 = objc_opt_respondsToSelector();
  v65 = 0;
  v66 = 0;
  memset(v74, 0, 32);
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v64 = 0;
  v61 = 0;
  v62 = 0;
  v15 = -[NSXPCDecoder initWithInterface:]([NSXPCDecoder alloc], "initWithInterface:", v13);
  -[NSXPCDecoder _setConnection:](v15, "_setConnection:", self);
  if (self->_otherInfo)
    -[NSXPCCoder setUserInfo:](v15, "setUserInfo:");
  v56 = -[NSXPCDecoder _decodeMessageFromXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSignature:outSelector:](v15, "_decodeMessageFromXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSignature:outSelector:", a3, (v55 & 1) == 0, &v62, v74, 4, &v61, &v66) == 1;
  if (!v66)
  {
    v18 = _NSXPCLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_fault_impl(&dword_1817D9000, v18, OS_LOG_TYPE_FAULT, "%{public}@: received an undecodable message (invocation with no selector)", buf, 0xCu);
    }
    v56 = 0;
    v62 = 0;
  }

  if (!v62 && !v56)
    goto LABEL_88;
  if ((v5 & 0x20) == 0)
  {
    if (!objc_msgSend(v62, "_hasBlockArgument"))
    {
      v54 = 0;
      v21 = 1;
      goto LABEL_36;
    }
    v19 = _NSXPCLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_fault_impl(&dword_1817D9000, v19, OS_LOG_TYPE_FAULT, "%{public}@: received an undecodable message (remote asked for no reply, but we expected one). Dropping message.", buf, 0xCu);
    }
    goto LABEL_88;
  }
  v20 = xpc_dictionary_get_uint64(a3, "sequence");
  v52 = (const void *)v20;
  if ((v5 & 0x40) != 0)
  {
    v22 = -[NSProgress initWithParent:userInfo:]([_NSProgressWithRemoteParent alloc], "initWithParent:userInfo:", 0, 0);
    -[NSProgress setTotalUnitCount:](v22, "setTotalUnitCount:", 1);
    -[NSProgress set_adoptChildUserInfo:](v22, "set_adoptChildUserInfo:", 1);
    -[_NSProgressWithRemoteParent setSequence:](v22, "setSequence:", v20);
    -[_NSProgressWithRemoteParent setParentConnection:](v22, "setParentConnection:", self);
    v54 = v22;
    v21 = (v5 & 0x80) == 0;
  }
  else
  {
    v54 = 0;
    v21 = 1;
  }
  v23 = objc_msgSend(v61, "numberOfArguments");
  v24 = v23 - 2;
  if (v23 == 2)
    goto LABEL_36;
  v25 = 0;
  while (1)
  {
    v26 = (_WORD *)objc_msgSend(v61, "_argInfo:", v25 + 2);
    if (!v26)
    {
      v29 = _NSXPCLog();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        goto LABEL_88;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      v30 = "%{public}@: received an undecodable message (invocation with bad argument info)";
LABEL_105:
      _os_log_fault_impl(&dword_1817D9000, v29, OS_LOG_TYPE_FAULT, v30, buf, 0xCu);
      goto LABEL_88;
    }
    v27 = v26[17];
    if ((v27 & 0x80) == 0)
      goto LABEL_34;
    if (!*(_QWORD *)v26)
    {
      v29 = _NSXPCLog();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        goto LABEL_88;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      v30 = "%{public}@: received an undecodable message (invocation with bad replaced by pointer argument)";
      goto LABEL_105;
    }
    v27 = *(_WORD *)(*(_QWORD *)v26 + 34);
LABEL_34:
    if (v27 < 0)
      break;
    if (v24 == ++v25)
      goto LABEL_36;
  }
  string = xpc_dictionary_get_string(a3, "replysig");
  if (!string)
  {
    v38 = _NSXPCLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_fault_impl(&dword_1817D9000, v38, OS_LOG_TYPE_FAULT, "%{public}@: received an undecodable message (invocation with no signature info)", buf, 0xCu);
    }
    goto LABEL_88;
  }
  v50 = (void *)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", string);
  v32 = -[os_unfair_lock_s _methodSignatureForReplyBlockOfSelector:](v13, "_methodSignatureForReplyBlockOfSelector:", v66);
  v33 = (void *)v32;
  if (!v50
    || !v32
    || (objc_msgSend(v50, "isEqual:", v32) & 1) == 0
    && (objc_msgSend(v33, "_isCompatibleWithMethodSignature:", v50) & 1) == 0)
  {
    v35 = _NSXPCLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      Name = sel_getName(v66);
      v45 = objc_msgSend(v50, "debugDescription");
      v46 = objc_msgSend(v33, "debugDescription");
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = self;
      v68 = 2082;
      v69 = Name;
      v70 = 2114;
      v71 = v45;
      v72 = 2114;
      v73 = v46;
      _os_log_fault_impl(&dword_1817D9000, v35, OS_LOG_TYPE_FAULT, "%{public}@ received an undecodable message (incompatible reply block signature for %{public}s (wire: %{public}@ vs local: %{public}@)", buf, 0x2Au);
    }
LABEL_88:
    -[NSXPCConnection invalidate](self, "invalidate");
    goto LABEL_85;
  }
  v49 = v33;
  v51 = objc_msgSend(v33, "numberOfArguments") - 1;
  if (v51 > 3)
    v34 = 0;
  else
    v34 = objc_msgSend(v33, "_isAllObjects");
  -[_NSXPCConnectionRequestedReplies beginTransactionForSequence:selector:reply:withProgress:]((uint64_t)self->_repliesRequested, v52, v66, a4, v54);
  v39 = v34 ^ 1;
  if (v51)
    v40 = 1;
  else
    v40 = v34 ^ 1;
  if ((v40 & 1) == 0)
  {
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke;
    v60[3] = &unk_1E0F553D8;
    v60[5] = a4;
    v60[6] = v63;
    v60[7] = v52;
    v60[8] = v66;
    v60[9] = uint64;
    v60[4] = self;
    v41 = v60;
    goto LABEL_110;
  }
  if (v51 != 1)
    v39 = 1;
  if ((v39 & 1) == 0)
  {
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_3;
    v59[3] = &unk_1E0F55400;
    v59[4] = self;
    v59[5] = v13;
    v59[8] = v52;
    v59[9] = v66;
    v59[10] = uint64;
    v59[6] = a4;
    v59[7] = v63;
    v41 = v59;
    goto LABEL_110;
  }
  v42 = v34 ^ 1;
  if (v51 == 2)
    v43 = v34 ^ 1;
  else
    v43 = 1;
  if ((v43 & 1) == 0)
  {
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_5;
    v58[3] = &unk_1E0F55450;
    v58[4] = self;
    v58[5] = v13;
    v58[8] = v52;
    v58[9] = v66;
    v58[10] = uint64;
    v58[6] = a4;
    v58[7] = v63;
    v41 = v58;
    goto LABEL_110;
  }
  if (v51 != 3)
    v42 = 1;
  if ((v42 & 1) != 0)
  {
    objc_msgSend(v49, "_cTypeString");
    v65 = (id)__NSMakeSpecialForwardingCaptureBlock();
    v47 = v65;
  }
  else
  {
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_7;
    v57[3] = &unk_1E0F554A0;
    v57[4] = self;
    v57[5] = v13;
    v57[8] = v52;
    v57[9] = v66;
    v57[10] = uint64;
    v57[6] = a4;
    v57[7] = v63;
    v41 = v57;
LABEL_110:
    v65 = v41;
  }
  if (v62)
  {
    objc_msgSend(v62, "setArgument:atIndex:", &v65, v25 + 2);
  }
  else if (v56)
  {

    v74[v25] = v65;
  }
LABEL_36:
  _CFGetTSD();
  _CFGetTSD();
  _CFGetTSD();
  _CFSetTSD();
  _CFSetTSD();
  if (a4)
  {
    xpc_retain(a4);
    _CFSetTSD();
  }
  if (v54)
    v28 = !v21;
  else
    v28 = 1;
  if ((v28 & 1) == 0)
    -[NSProgress becomeCurrentWithPendingUnitCount:](v54, "becomeCurrentWithPendingUnitCount:", 1);
  *(_QWORD *)buf = 0;
  if (v62)
  {
    objc_msgSend(v62, "setTarget:", v11);
    if ((v55 & 1) != 0)
    {
      objc_msgSend(v62, "retainArguments");
      objc_msgSend(v53, "connection:handleInvocation:isReply:", self, v62, 0);
    }
    else
    {
      __NSXPCCONNECTION_IS_CALLING_OUT_TO_REPLY_BLOCK__(v62);
    }
  }
  else
  {
    if (!v56)
    {
      v48 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Attempt to dispatch neither invocation nor simple message send."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
      objc_exception_throw(v48);
    }
    switch(objc_msgSend(v61, "numberOfArguments"))
    {
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
        *(_QWORD *)buf = __NSXPCCONNECTION_IS_CALLING_OUT_TO_EXPORTED_OBJECT_S0__(v11, v66);
        break;
      default:
        break;
    }
  }
  if (v54)
    v36 = v21;
  else
    v36 = 1;
  if ((v36 & 1) == 0)
  {
    if (!v56)
      objc_msgSend(v62, "getReturnValue:", buf);
    if (*(_QWORD *)buf && (objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(*(id *)buf, "isCancellable") & 1) == 0)
        -[_NSProgressWithRemoteParent setCancellable:](v54, "setCancellable:", 0);
      if (objc_msgSend(*(id *)buf, "isPausable"))
        -[_NSProgressWithRemoteParent setPausable:](v54, "setPausable:", 1);
      -[NSProgress addChild:withPendingUnitCount:](v54, "addChild:withPendingUnitCount:", *(_QWORD *)buf, 1);
    }
  }
  if ((v28 & 1) == 0)
    -[NSProgress resignCurrent](v54, "resignCurrent");

  _CFSetTSD();
  if (a4)
    xpc_release(a4);
  if (v56)
  {
    for (i = 0; i != 4; ++i)

  }
  _CFSetTSD();
  _CFSetTSD();
LABEL_85:
  _Block_object_dispose(v63, 8);
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke(_QWORD *a1)
{
  unsigned int *v1;
  unsigned int v2;
  const void *v3;
  uint64_t v4;
  _QWORD v5[9];

  v5[8] = *MEMORY[0x1E0C80C00];
  v1 = (unsigned int *)(*(_QWORD *)(a1[6] + 8) + 24);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(1u, v1));
  if (!v2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_2;
    v5[3] = &unk_1E0F4EE48;
    v3 = (const void *)a1[7];
    v4 = a1[9];
    v5[6] = a1[8];
    v5[7] = v4;
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](*(_QWORD *)(a1[4] + 64), v3, (uint64_t)v5);
  }
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_8(uint64_t a1)
{
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = _replacedWithDistantObject(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 80), 0);
  v2[1] = _replacedWithDistantObject(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(void **)(a1 + 48), *(_QWORD *)(a1 + 80), 1);
  v2[2] = _replacedWithDistantObject(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(void **)(a1 + 48), *(_QWORD *)(a1 + 80), 2);
  _sendReplyArgumentsOnly(*(_QWORD *)(a1 + 32), (uint64_t)"v@?@@@", (uint64_t)v2, 3, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(void **)(a1 + 72));
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unsigned int *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  _QWORD v8[6];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if (!v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 64);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_4;
    v8[3] = &unk_1E0F54758;
    v8[4] = v4;
    v8[5] = a2;
    v6 = *(const void **)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 80);
    v10 = *(_QWORD *)(a1 + 72);
    v11 = v7;
    v9 = *(_OWORD *)(a1 + 40);
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](v5, v6, (uint64_t)v8);
  }
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_9(uint64_t a1, uint64_t a2)
{
  unsigned int *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[7];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if (!v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(v4 + 64);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_10;
    v10[3] = &unk_1E0F55428;
    v10[4] = v5;
    v10[5] = a2;
    v10[6] = v4;
    v7 = *(const void **)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 80);
    v11 = *(_OWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 88);
    v12 = v8;
    v13 = v9;
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](v6, v7, (uint64_t)v10);
  }
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_10(uint64_t a1)
{
  unint64_t v2;
  id v3;
  NSXPCEncoder *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _xpc_connection_s *v9;
  id v10;
  uint64_t v11[257];

  v11[256] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "numberOfArguments") >= 2)
  {
    v2 = 1;
    do
    {
      if ((*(_WORD *)(objc_msgSend(*(id *)(a1 + 32), "_argInfo:", v2) + 34) & 0x2000) != 0)
      {
        v11[0] = 0;
        objc_msgSend(*(id *)(a1 + 40), "getArgument:atIndex:", v11, v2);
        v10 = 0;
        v3 = _replacedWithDistantObject(*(_QWORD *)(a1 + 48), v11[0], *(void **)(a1 + 56), *(_QWORD *)(a1 + 72), v2 - 1);
        v10 = v3;
        if (v3)
        {
          objc_msgSend(*(id *)(a1 + 40), "_addAttachedObject:", v3, v10);
          objc_msgSend(*(id *)(a1 + 40), "setArgument:atIndex:", &v10, v2);
        }
      }
      ++v2;
    }
    while (v2 < objc_msgSend(*(id *)(a1 + 32), "numberOfArguments", v10));
  }
  v4 = -[NSXPCEncoder initWithStackSpace:size:]([NSXPCEncoder alloc], "initWithStackSpace:size:", v11, 2048);
  -[NSXPCEncoder _setConnection:](v4, "_setConnection:", *(_QWORD *)(a1 + 48));
  -[NSXPCEncoder setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 80))
    -[NSXPCCoder setUserInfo:](v4, "setUserInfo:");
  -[NSXPCEncoder _encodeInvocation:isReply:into:](v4, "_encodeInvocation:isReply:into:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 64));

  v7 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 48) + 36));
  v8 = *(_QWORD *)(a1 + 48);
  if ((v7 & 0x40) != 0)
  {
    objc_msgSend(*(id *)(v8 + 152), "sendMessage:", *(_QWORD *)(a1 + 64), v5, v6);
  }
  else
  {
    v9 = *(_xpc_connection_s **)(v8 + 8);
    if (v9)
      xpc_connection_send_message(v9, *(xpc_object_t *)(a1 + 64));
  }
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_5(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  unsigned int *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[12];

  v11[11] = *MEMORY[0x1E0C80C00];
  v3 = (unsigned int *)(*(_QWORD *)(a1[7] + 8) + 24);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(1u, v3));
  if (!v4)
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = *(_QWORD *)(v5 + 64);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_6;
    v11[3] = &unk_1E0F55428;
    v11[4] = v5;
    v11[5] = a2;
    v8 = (const void *)a1[8];
    v9 = a1[9];
    v11[6] = v6;
    v11[7] = a3;
    v10 = a1[10];
    v11[9] = v9;
    v11[10] = v10;
    v11[8] = a1[6];
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](v7, v8, (uint64_t)v11);
  }
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_6(uint64_t a1)
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = _replacedWithDistantObject(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 72), 0);
  v2[1] = _replacedWithDistantObject(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(void **)(a1 + 48), *(_QWORD *)(a1 + 72), 1);
  _sendReplyArgumentsOnly(*(_QWORD *)(a1 + 32), (uint64_t)"v@?@@", (uint64_t)v2, 2, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(void **)(a1 + 64));
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_4(uint64_t a1)
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = _replacedWithDistantObject(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 64), 0);
  _sendReplyArgumentsOnly(*(_QWORD *)(a1 + 32), (uint64_t)"v@?@", (uint64_t)v2, 1, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(void **)(a1 + 56));
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_2(uint64_t a1)
{
  _sendReplyArgumentsOnly(*(_QWORD *)(a1 + 32), (uint64_t)"v@?", 0, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(void **)(a1 + 40));
}

void __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  Class Class;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  char v20;
  char v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  void *v28;
  NSString **v29;
  const __CFString **v30;
  const char *v31;
  id Property;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  NSString *v40;
  const __CFString *v41;
  NSString *v42;
  const __CFString *v43;
  NSString *v44;
  const __CFString *v45;
  uint64_t v46;
  const __CFString *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    v6 = *(_QWORD *)(v5 + 56);
  else
    v6 = 0;
  v7 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 48))
  {
    -[_NSXPCConnectionExpectedReplies removeProgressSequence:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(const void **)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));

  }
  v8 = (void *)MEMORY[0x186DA8F78](v4, v6, v7);
  Class = object_getClass(a2);
  if (Class == (Class)MEMORY[0x1E0C81310])
  {
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      v12 = *(_QWORD *)(a1 + 40);
      if (v12)
        v13 = *(const char **)(v12 + 56);
      else
        v13 = 0;
      v14 = *(void **)(a1 + 40);
      if (v14 && objc_getProperty(v14, v13, 16, 1))
      {
        if (*(_QWORD *)(a1 + 64) == 1)
        {
          v45 = CFSTR("NSDebugDescription");
          v46 = objc_msgSend(*(id *)(a1 + 32), "_errorDescription");
          v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
          v16 = 4097;
        }
        else
        {
          v47 = CFSTR("NSDebugDescription");
          v48[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The %@ was interrupted, but the message was sent over an additional proxy and therefore this proxy has become invalid."), objc_msgSend(*(id *)(a1 + 32), "_errorDescription"));
          v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
          v16 = 4099;
        }
        goto LABEL_39;
      }
      goto LABEL_42;
    }
    if (a2 != (void *)MEMORY[0x1E0C81260])
    {
      if (a2 != (void *)MEMORY[0x1E0C81278])
      {
        if (a2 != (void *)MEMORY[0x1E0C81288])
        {
          v10 = (void *)MEMORY[0x186DAAD0C](a2);
          v11 = _NSXPCLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v36 = v10;
            _os_log_error_impl(&dword_1817D9000, v11, OS_LOG_TYPE_ERROR, "Unexpected XPC error type on reply: %s", buf, 0xCu);
          }
          free(v10);
        }
        goto LABEL_42;
      }
      v25 = *(_QWORD *)(a1 + 40);
      if (v25)
        v26 = *(const char **)(v25 + 56);
      else
        v26 = 0;
      v27 = *(void **)(a1 + 40);
      if (v27 && objc_getProperty(v27, v26, 16, 1))
      {
        v37 = CFSTR("NSDebugDescription");
        v38 = CFSTR("The code signature requirement failed.");
        v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v16 = 4102;
LABEL_39:
        +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), v16, v15);
        Property = *(id *)(a1 + 40);
        if (Property)
          Property = objc_getProperty(Property, v31, 16, 1);
        __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)Property);
      }
LABEL_42:
      -[_NSXPCConnectionExpectedReplyInfo cleanup](*(_QWORD *)(a1 + 40));
      goto LABEL_43;
    }
    v17 = *(_QWORD *)(a1 + 40);
    if (v17)
      v18 = *(const char **)(v17 + 56);
    else
      v18 = 0;
    v19 = *(void **)(a1 + 40);
    if (!v19 || !objc_getProperty(v19, v18, 16, 1))
      goto LABEL_42;
    v20 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 36));
    if ((v20 & 8) != 0)
    {
      v43 = CFSTR("NSDebugDescription");
      v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The %@ was invalidated from this process."), objc_msgSend(*(id *)(a1 + 32), "_errorDescription"));
      v28 = (void *)MEMORY[0x1E0C99D80];
      v29 = &v44;
      v30 = &v43;
    }
    else
    {
      v21 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 36));
      if ((v21 & 0x40) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_xpcConnection");
        v22 = xpc_connection_copy_invalidation_reason();
        if (v22)
        {
          v23 = (void *)v22;
          v41 = CFSTR("NSDebugDescription");
          v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The %@ was invalidated: %s."), objc_msgSend(*(id *)(a1 + 32), "_errorDescription"), v22);
          v24 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
          free(v23);
LABEL_38:
          v16 = 4099;
          v15 = v24;
          goto LABEL_39;
        }
      }
      v39 = CFSTR("NSDebugDescription");
      v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The %@ was invalidated."), objc_msgSend(*(id *)(a1 + 32), "_errorDescription"));
      v28 = (void *)MEMORY[0x1E0C99D80];
      v29 = &v40;
      v30 = &v39;
    }
    v24 = objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, 1);
    goto LABEL_38;
  }
  if (Class != (Class)MEMORY[0x1E0C812F8])
  {
    v34 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: encoded data has been corrupted, root object is not an XPC dictionary"), _NSMethodExceptionProem(*(objc_class **)(a1 + 32), *(const char **)(a1 + 72))), 0);
    objc_exception_throw(v34);
  }
  objc_msgSend(*(id *)(a1 + 32), "_decodeAndInvokeReplyBlockWithEvent:sequence:replyInfo:", a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
LABEL_43:
  if (*(_BYTE *)(a1 + 80))
  {
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    if (v33)
      dispatch_group_leave(*(dispatch_group_t *)(v33 + 48));
  }
  objc_autoreleasePoolPop(v8);
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSXPCConnection;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[NSXPCConnection description](&v3, sel_description), -[NSXPCConnection _errorDescription](self, "_errorDescription"));
}

- (uint64_t)_sendProgressMessage:(uint64_t)a3 forSequence:
{
  uint64_t v5;
  char v6;

  if (result)
  {
    v5 = result;
    xpc_dictionary_set_uint64(xdict, "f", 0x15uLL);
    xpc_dictionary_set_uint64(xdict, "sequence", a3);
    v6 = atomic_load((unsigned int *)(v5 + 36));
    if ((v6 & 0x40) != 0)
      return objc_msgSend(*(id *)(v5 + 152), "sendNotification:", xdict);
    else
      return xpc_connection_send_notification();
  }
  return result;
}

void __44__NSXPCConnection_initWithListenerEndpoint___block_invoke(uint64_t a1, void *a2)
{
  message_handler_0(*(unsigned __int8 **)(a1 + 32), a2);
}

- (pid_t)processIdentifier
{
  char v2;

  v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0)
    return -[_NSXPCTransport processIdentifier](self->_transport, "processIdentifier");
  else
    return xpc_connection_get_pid(self->_connection.xpc);
}

- (id)_xpcConnection
{
  char v2;
  void *v4;

  v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Custom transports do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v4);
  }
  return self->_connection.xpc;
}

+ (NSXPCConnection)currentConnection
{
  return (NSXPCConnection *)(id)_CFGetTSD();
}

- (uint64_t)_initWithPeerConnection:(void *)a1 name:(_xpc_connection_s *)a2 options:(__CFString *)a3
{
  uint64_t v5;
  uint64_t pid;
  const __CFString *v7;
  NSString *v8;
  unsigned int *v9;
  unsigned int v10;
  const char *v11;
  NSObject *v12;
  NSObject *global_queue;
  _xpc_connection_s *v14;
  _xpc_connection_s *v15;
  _QWORD handler[6];

  handler[5] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = objc_msgSend(a1, "init");
  if (v5)
  {
    *(_QWORD *)(v5 + 104) = -[__CFString copy](a3, "copy");
    pid = xpc_connection_get_pid(a2);
    v7 = CFSTR("anonymous");
    if (a3)
      v7 = a3;
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.NSXPCConnection.user.%@.%d"), v7, pid);
    v9 = (unsigned int *)(v5 + 36);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 | 0x10, v9));
    v11 = -[NSString UTF8String](v8, "UTF8String");
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    *(_QWORD *)(v5 + 24) = dispatch_queue_create_with_target_V2(v11, v12, global_queue);
    v14 = (_xpc_connection_s *)xpc_retain(a2);
    *(_QWORD *)(v5 + 8) = v14;
    xpc_connection_set_target_queue(v14, *(dispatch_queue_t *)(v5 + 24));
    v15 = *(_xpc_connection_s **)(v5 + 8);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __56__NSXPCConnection__initWithPeerConnection_name_options___block_invoke;
    handler[3] = &unk_1E0F4FF38;
    handler[4] = v5;
    xpc_connection_set_event_handler(v15, handler);
  }
  return v5;
}

- (void)invalidate
{
  unsigned int *p_state2;
  unsigned int v3;
  char v4;
  OS_xpc_object *xpc;

  p_state2 = &self->_state2;
  do
    v3 = __ldaxr(p_state2);
  while (__stlxr(v3 | 8, p_state2));
  v4 = atomic_load(&self->_state2);
  if ((v4 & 0x40) != 0)
  {
    -[_NSXPCTransport cancel](self->_transport, "cancel");
  }
  else
  {
    xpc = self->_connection.xpc;
    if (xpc)
      xpc_connection_cancel(xpc);
  }
}

- (void)setRemoteObjectInterface:(NSXPCInterface *)remoteObjectInterface
{
  objc_setProperty_atomic(self, a2, remoteObjectInterface, 96);
}

- (void)setDelegate:(id)a3
{
  char v4;
  unsigned int *p_state2;
  unsigned int v6;
  unsigned int v7;

  atomic_store((unint64_t)a3, (unint64_t *)&self->_delegate);
  atomic_load((unint64_t *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();
  p_state2 = &self->_state2;
  if ((v4 & 1) != 0)
  {
    do
      v6 = __ldaxr(p_state2);
    while (__stlxr(v6 | 2, p_state2));
  }
  else
  {
    do
      v7 = __ldaxr(p_state2);
    while (__stlxr(v7 & 0xFFFFFFFD, p_state2));
  }
}

- (void)setOptions:(unint64_t)a3
{
  __int16 v3;
  char v6;
  char v7;
  void *v8;

  v3 = a3;
  if ((a3 & 0x100) != 0)
  {
    v6 = atomic_load(&self->_state2);
    if ((v6 & 0x40) != 0)
      goto LABEL_7;
    xpc_connection_set_legacy();
  }
  if ((v3 & 0x1000) == 0)
    return;
  v7 = atomic_load(&self->_state2);
  if ((v7 & 0x40) != 0)
  {
LABEL_7:
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Custom transports do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v8);
  }
  xpc_connection_set_privileged();
}

- (uint64_t)_removeImportedProxy:(uint64_t)result
{
  void *v3;

  if (result)
  {
    v3 = (void *)result;
    if (!a2 || *(_QWORD *)(a2 + 40) != 1)
    {
      result = -[_NSXPCConnectionImportInfo removeProxy:](*(_QWORD *)(result + 72), a2);
      if ((_DWORD)result)
        return objc_msgSend(v3, "_sendDesistForProxy:", a2);
    }
  }
  return result;
}

- (void)dealloc
{
  id interruptionHandler;
  id invalidationHandler;
  OS_xpc_object *bootstrap;
  NSObject *userQueue;
  OS_xpc_object *xpc;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];

  interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {

    self->_interruptionHandler = 0;
  }
  invalidationHandler = self->_invalidationHandler;
  if (invalidationHandler)
  {

    self->_invalidationHandler = 0;
  }

  bootstrap = self->_bootstrap;
  if (bootstrap)
    xpc_release(bootstrap);
  userQueue = self->_userQueue;
  if (userQueue)
    dispatch_release(userQueue);

  xpc = self->_connection.xpc;
  if (xpc)
    xpc_release(xpc);
  v8.receiver = self;
  v8.super_class = (Class)NSXPCConnection;
  -[NSXPCConnection dealloc](&v8, sel_dealloc);
}

- (void)_sendDesistForProxy:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  char v7;

  if (a3)
  {
    v4 = *((_QWORD *)a3 + 5);
    if (v4 == 1)
      return;
    v5 = *((_QWORD *)a3 + 6);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  if (v5 == self->_importInfo->_generationCount)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "f", 0xDuLL);
    xpc_dictionary_set_uint64(v6, "proxynum", v4);
    v7 = atomic_load(&self->_state2);
    if ((v7 & 0x40) != 0)
    {
      -[_NSXPCTransport sendNotification:](self->_transport, "sendNotification:", v6);
    }
    else if (self->_connection.xpc)
    {
      xpc_connection_send_notification();
    }
    xpc_release(v6);
  }
}

- (void)setExportedInterface:(NSXPCInterface *)exportedInterface
{
  -[_NSXPCConnectionExportedObjectTable setInterface:forProxyNumber:]((uint64_t)self->_exportInfo, exportedInterface, (const void *)1);
}

- (void)setInvalidationHandler:(void *)invalidationHandler
{
  os_unfair_lock_s *p_lock;
  id v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_invalidationHandler;
  if (v6 != invalidationHandler)
  {
    if (v6)

    if (invalidationHandler)
      v7 = (void *)objc_msgSend(invalidationHandler, "copy");
    else
      v7 = 0;
    self->_invalidationHandler = v7;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setInterruptionHandler:(void *)interruptionHandler
{
  os_unfair_lock_s *p_lock;
  id v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_interruptionHandler;
  if (v6 != interruptionHandler)
  {
    if (v6)

    if (interruptionHandler)
      v7 = (void *)objc_msgSend(interruptionHandler, "copy");
    else
      v7 = 0;
    self->_interruptionHandler = v7;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setExportedObject:(id)exportedObject
{
  -[_NSXPCConnectionExportedObjectTable setExportedObject:forProxyNumber:]((uint64_t)self->_exportInfo, exportedObject, (const void *)1);
}

- (void)invalidationHandler
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)objc_msgSend(self->_invalidationHandler, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_additionalInvalidationHandler
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)objc_msgSend(objc_getAssociatedObject(self, "additionalInvalidationHandler"), "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_setQueue:(id)a3
{
  OS_dispatch_queue *userQueue;
  BOOL v6;
  NSObject *v7;
  char v8;
  void *v9;

  if (!a3)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: The queue parameter is NULL, which is invalid"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v9);
  }
  userQueue = self->_userQueue;
  if (userQueue)
    v6 = userQueue == a3;
  else
    v6 = 1;
  if (!v6)
  {
    dispatch_retain((dispatch_object_t)a3);
    v7 = self->_userQueue;
    self->_userQueue = (OS_dispatch_queue *)a3;
    v8 = atomic_load(&self->_state2);
    if ((v8 & 0x40) != 0)
      -[_NSXPCTransport setTargetQueue:](self->_transport, "setTargetQueue:", a3);
    else
      xpc_connection_set_target_queue(self->_connection.xpc, (dispatch_queue_t)a3);
    dispatch_release(v7);
  }
}

- (void)interruptionHandler
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)objc_msgSend(self->_interruptionHandler, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)activate
{
  unsigned __int8 *p_state;
  unsigned __int8 v4;
  char v5;
  OS_xpc_object *xpc;

  p_state = (unsigned __int8 *)&self->_state;
  do
    v4 = __ldaxr(p_state);
  while (__stlxr(v4 | 4, p_state));
  if ((v4 & 4) == 0)
    CFRetain(self);
  -[_NSXPCConnectionImportInfo _clearEntitlementCache]((uint64_t)self->_importInfo);
  v5 = atomic_load(&self->_state2);
  if ((v5 & 0x40) != 0)
  {
    -[_NSXPCTransport activate](self->_transport, "activate");
  }
  else
  {
    xpc = self->_connection.xpc;
    if (xpc)
      xpc_connection_activate(xpc);
  }
}

- (void)resume
{
  unsigned __int8 *p_state;
  unsigned __int8 v4;
  char v5;

  p_state = (unsigned __int8 *)&self->_state;
  do
    v4 = __ldaxr(p_state);
  while (__stlxr(v4 | 4, p_state));
  if ((v4 & 4) == 0)
    CFRetain(self);
  -[_NSXPCConnectionImportInfo _clearEntitlementCache]((uint64_t)self->_importInfo);
  v5 = atomic_load(&self->_state2);
  if ((v5 & 0x40) != 0)
    -[_NSXPCTransport resume](self->_transport, "resume");
  else
    xpc_connection_resume(self->_connection.xpc);
}

- (id)_initWithCustomTransport:(id)a3
{
  NSXPCConnection *v4;
  NSObject *v5;
  NSObject *global_queue;
  unsigned int *p_state2;
  unsigned int v8;
  _NSXPCTransport *v9;
  uint64_t v10;
  _NSXPCTransport *transport;
  _NSXPCTransport *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v4 = -[NSXPCConnection init](self, "init");
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v4->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.NSXPCConnection.user.endpoint", v5, global_queue);
    p_state2 = &v4->_state2;
    do
      v8 = __ldaxr(p_state2);
    while (__stlxr(v8 | 0x40, p_state2));
    v9 = (_NSXPCTransport *)a3;
    v4->_transport = v9;
    -[_NSXPCTransport setTargetQueue:](v9, "setTargetQueue:", v4->_userQueue);
    v10 = MEMORY[0x1E0C809B0];
    transport = v4->_transport;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__NSXPCConnection__initWithCustomTransport___block_invoke;
    v15[3] = &unk_1E0F4FF38;
    v15[4] = v4;
    -[_NSXPCTransport setErrorHandler:](transport, "setErrorHandler:", v15);
    v12 = v4->_transport;
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __44__NSXPCConnection__initWithCustomTransport___block_invoke_2;
    v14[3] = &unk_1E0F554F0;
    v14[4] = v4;
    -[_NSXPCTransport setMessageHandler:](v12, "setMessageHandler:", v14);
  }
  return v4;
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6 arg3:(id)a7 arg4:(id)a8
{
  id Property;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  if (a4)
    Property = objc_getProperty(a4, a2, 16, 1);
  else
    Property = 0;
  v16[0] = a5;
  v16[1] = a6;
  v16[2] = a7;
  v16[3] = a8;
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:](self, "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:", 0, v16, 4, objc_msgSend(Property, "_methodSignatureForRemoteSelector:", a3), a3, a4);
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4
{
  id Property;

  if (a4)
    Property = objc_getProperty(a4, a2, 16, 1);
  else
    Property = 0;
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:](self, "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:", 0, 0, 0, objc_msgSend(Property, "_methodSignatureForRemoteSelector:", a3), a3, a4);
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6 arg3:(id)a7
{
  id Property;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  if (a4)
    Property = objc_getProperty(a4, a2, 16, 1);
  else
    Property = 0;
  v14[0] = a5;
  v14[1] = a6;
  v14[2] = a7;
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:](self, "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:", 0, v14, 3, objc_msgSend(Property, "_methodSignatureForRemoteSelector:", a3), a3, a4);
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5
{
  id Property;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (a4)
    Property = objc_getProperty(a4, a2, 16, 1);
  else
    Property = 0;
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:](self, "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:", 0, &v9, 1, objc_msgSend(Property, "_methodSignatureForRemoteSelector:", a3, v9, v10), a3, a4);
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6
{
  id Property;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (a4)
    Property = objc_getProperty(a4, a2, 16, 1);
  else
    Property = 0;
  v12[0] = a5;
  v12[1] = a6;
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:](self, "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:", 0, v12, 2, objc_msgSend(Property, "_methodSignatureForRemoteSelector:", a3), a3, a4);
}

- (id)_unboostingRemoteObjectProxy
{
  return (id)objc_msgSend(objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self, 1, 0, self->_remoteObjectInterface, 2, 0);
}

- (id)remoteObjectProxy
{
  return (id)objc_msgSend(objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self, 1, 0, self->_remoteObjectInterface, 0, 0);
}

- (id)remoteObjectProxyWithErrorHandler:(void *)handler
{
  return (id)objc_msgSend(objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self, 1, 0, self->_remoteObjectInterface, 0, handler);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(void *)handler
{
  return (id)objc_msgSend(objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self, 1, 0, self->_remoteObjectInterface, 4, handler);
}

- (Class)_remoteObjectInterfaceClass
{
  NSXPCInterface *remoteObjectInterface;

  remoteObjectInterface = self->_remoteObjectInterface;
  if (remoteObjectInterface)
    return -[NSXPCInterface _customSubclass](remoteObjectInterface, "_customSubclass");
  else
    return (Class)objc_opt_class();
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSXPCInterface)exportedInterface
{
  return (NSXPCInterface *)-[_NSXPCConnectionExportedObjectTable interfaceForProxyNumber:]((os_unfair_lock_s *)self->_exportInfo, (const void *)1);
}

- (id)exportedObject
{
  return -[_NSXPCConnectionExportedObjectTable exportedObjectForProxyNumber:]((os_unfair_lock_s *)self->_exportInfo, (const void *)1);
}

- (NSXPCConnection)initWithListenerEndpoint:(NSXPCListenerEndpoint *)endpoint
{
  NSXPCConnection *v5;
  NSObject *v6;
  NSObject *global_queue;
  unsigned int *p_state2;
  unsigned int v9;
  _xpc_connection_s *v10;
  _xpc_connection_s *xpc;
  NSString *v13;
  _QWORD handler[6];

  handler[5] = *MEMORY[0x1E0C80C00];
  v5 = -[NSXPCConnection init](self, "init");
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v5->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.NSXPCConnection.user.endpoint", v6, global_queue);
    p_state2 = &v5->_state2;
    do
      v9 = __ldaxr(p_state2);
    while (__stlxr(v9 | 0x20, p_state2));
    if (-[NSXPCListenerEndpoint _endpoint](endpoint, "_endpoint"))
    {
      v10 = xpc_connection_create_from_endpoint((xpc_endpoint_t)-[NSXPCListenerEndpoint _endpoint](endpoint, "_endpoint"));
      v5->_connection.xpc = v10;
      if (v10)
      {
        xpc_connection_set_target_queue(v10, (dispatch_queue_t)v5->_userQueue);
        xpc = v5->_connection.xpc;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __44__NSXPCConnection_initWithListenerEndpoint___block_invoke;
        handler[3] = &unk_1E0F4FF38;
        handler[4] = v5;
        xpc_connection_set_event_handler(xpc, handler);
        v5->_endpoint = endpoint;
        return v5;
      }
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Unable to connect to the specified endpoint. No connection was created."), _NSMethodExceptionProem((objc_class *)v5, a2));
    }
    else
    {
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Endpoint argument is NULL."), _NSMethodExceptionProem((objc_class *)v5, a2));
    }
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0));
  }
  return v5;
}

- (void)scheduleSendBarrierBlock:(void *)block
{
  char v3;
  OS_xpc_object *xpc;

  v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    -[_NSXPCTransport sendBarrierBlock:](self->_transport, "sendBarrierBlock:", block);
  }
  else
  {
    xpc = self->_connection.xpc;
    if (xpc)
      xpc_connection_send_barrier(xpc, block);
  }
}

- (id)valueForEntitlement:(id)a3
{
  os_unfair_lock_s *importInfo;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  if (self)
    -[NSXPCConnection auditToken](self, "auditToken");
  importInfo = (os_unfair_lock_s *)self->_importInfo;
  v7[0] = v8;
  v7[1] = v9;
  return -[_NSXPCConnectionImportInfo _valueForEntitlement:auditToken:](importInfo, (uint64_t)a3, v7);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  char v3;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_transport;
    if (result)
    {
      return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
    }
    else
    {
      *(_OWORD *)retstr->var0 = 0u;
      *(_OWORD *)&retstr->var0[4] = 0u;
    }
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)xpc_connection_get_audit_token();
  }
  return result;
}

- (NSXPCConnection)initWithServiceName:(NSString *)serviceName
{
  return -[NSXPCConnection initWithServiceName:options:](self, "initWithServiceName:options:", serviceName, 0);
}

void __47__NSXPCConnection_initWithServiceName_options___block_invoke(uint64_t a1, void *a2)
{
  message_handler_0(*(unsigned __int8 **)(a1 + 32), a2);
}

void __44__NSXPCConnection__initWithCustomTransport___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  message_handler_message(*(_QWORD *)(a1 + 32), a2, a3);
}

- (void)setUserInfo:(id)a3
{
  NSObject *otherInfo;

  otherInfo = self->_otherInfo;
  if (otherInfo != a3)
  {

    self->_otherInfo = a3;
  }
}

void __44__NSXPCConnection__initWithCustomTransport___block_invoke(uint64_t a1, uint64_t a2)
{
  message_handler_error(*(unsigned __int8 **)(a1 + 32), a2);
}

- (gid_t)effectiveGroupIdentifier
{
  char v2;

  v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0)
    return -[_NSXPCTransport effectiveGroupIdentifier](self->_transport, "effectiveGroupIdentifier");
  else
    return xpc_connection_get_egid(self->_connection.xpc);
}

- (au_asid_t)auditSessionIdentifier
{
  char v2;

  v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0)
    return -[_NSXPCTransport auditSessionIdentifier](self->_transport, "auditSessionIdentifier");
  else
    return xpc_connection_get_asid(self->_connection.xpc);
}

- (NSXPCConnection)initWithServiceName:(id)a3 options:(unint64_t)a4
{
  NSXPCConnection *v6;
  const char *v7;
  const char *v8;
  NSObject *v9;
  NSObject *global_queue;
  _xpc_connection_s *v11;
  _xpc_connection_s *xpc;
  void *v14;
  _QWORD handler[6];

  handler[5] = *MEMORY[0x1E0C80C00];
  v6 = -[NSXPCConnection init](self, "init", a3, a4);
  if (v6)
  {
    v7 = -[NSFileManager fileSystemRepresentationWithPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileSystemRepresentationWithPath:", a3);
    if (!v7)
    {

      v7 = 0;
    }
    v8 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.NSXPCConnection.user.%@"), a3), "UTF8String");
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v6->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v8, v9, global_queue);
    v6->_serviceName = (NSString *)objc_msgSend(a3, "copy");
    v11 = xpc_connection_create(v7, (dispatch_queue_t)v6->_userQueue);
    v6->_connection.xpc = v11;
    if (!v11)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Unable to connect to the specified name (%@). No connection was created."), _NSMethodExceptionProem((objc_class *)v6, a2), v6->_serviceName), 0);
      objc_exception_throw(v14);
    }
    xpc_connection_set_target_queue(v11, (dispatch_queue_t)v6->_userQueue);
    xpc = v6->_connection.xpc;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __47__NSXPCConnection_initWithServiceName_options___block_invoke;
    handler[3] = &unk_1E0F4FF38;
    handler[4] = v6;
    xpc_connection_set_event_handler(xpc, handler);
    -[NSString UTF8String](v6->_serviceName, "UTF8String");
  }
  return v6;
}

- (void)_setUUID:(id)a3
{
  char v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Custom transports do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v4);
  }
  v5[0] = 0;
  v5[1] = 0;
  objc_msgSend(a3, "getUUIDBytes:", v5);
  xpc_connection_set_instance();
}

- (void)suspend
{
  char v2;

  v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0)
    -[_NSXPCTransport suspend](self->_transport, "suspend");
  else
    xpc_connection_suspend(self->_connection.xpc);
}

- (void)_decodeProgressMessageWithData:(id)a3 flags:(unint64_t)a4
{
  int v4;
  const void *uint64;
  os_unfair_lock_s *v8;

  v4 = a4;
  uint64 = (const void *)xpc_dictionary_get_uint64(a3, "sequence");
  if ((v4 & 0x10000) != 0)
  {
    -[os_unfair_lock_s cancel](-[_NSXPCConnectionRequestedReplies progressForSequence:]((os_unfair_lock_s *)self->_repliesRequested, uint64), "cancel");
  }
  else if ((v4 & 0x20000) != 0)
  {
    -[os_unfair_lock_s pause](-[_NSXPCConnectionRequestedReplies progressForSequence:]((os_unfair_lock_s *)self->_repliesRequested, uint64), "pause");
  }
  else if ((v4 & 0x40000) != 0)
  {
    -[os_unfair_lock_s resume](-[_NSXPCConnectionRequestedReplies progressForSequence:]((os_unfair_lock_s *)self->_repliesRequested, uint64), "resume");
  }
  else
  {
    v8 = -[_NSXPCConnectionExpectedReplies progressForSequence:]((os_unfair_lock_s *)self->_repliesExpected, uint64);
    -[NSProgress _receiveProgressMessage:forSequence:](v8, a3);
  }
}

- (NSString)_serviceInfoForDecoder
{
  if (result)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSXPCInterface: %@\n%@"), -[objc_class debugDescription](result[12].super.isa, "debugDescription"), -[NSString debugDescription](result, "debugDescription"));
  return result;
}

+ (void)_handoffCurrentReplyToQueue:(id)a3 block:(id)a4
{
  void *v6;

  if (!_CFGetTSD())
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: called when there is no reply context"), _NSMethodExceptionProem((objc_class *)a1, a2)), 0);
    objc_exception_throw(v6);
  }
  xpc_dictionary_handoff_reply();
}

- (uint64_t)_initWithRemotePeerConnection:(void *)a1 name:(uint64_t)a2 options:(__CFString *)a3
{
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  const __CFString *v9;
  NSString *v10;
  unsigned int v11;
  const char *v12;
  NSObject *v13;
  NSObject *global_queue;
  _NSXPCRemoteTransport *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = objc_msgSend(a1, "init");
  v6 = v5;
  if (v5)
  {
    v7 = (unsigned int *)(v5 + 36);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 | 0x40, v7));
    *(_QWORD *)(v5 + 104) = -[__CFString copy](a3, "copy");
    v9 = CFSTR("anonymous");
    if (a3)
      v9 = a3;
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.NSXPCConnection.user.%@.remote"), v9);
    do
      v11 = __ldaxr(v7);
    while (__stlxr(v11 | 0x10, v7));
    v12 = -[NSString UTF8String](v10, "UTF8String");
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    *(_QWORD *)(v6 + 24) = dispatch_queue_create_with_target_V2(v12, v13, global_queue);
    v15 = -[_NSXPCRemoteTransport initWithConnection:]([_NSXPCRemoteTransport alloc], "initWithConnection:", a2);
    *(_QWORD *)(v6 + 152) = v15;
    -[_NSXPCRemoteTransport setTargetQueue:](v15, "setTargetQueue:", *(_QWORD *)(v6 + 24));
    v16 = MEMORY[0x1E0C809B0];
    v17 = *(void **)(v6 + 152);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __62__NSXPCConnection__initWithRemotePeerConnection_name_options___block_invoke;
    v21[3] = &unk_1E0F4FF38;
    v21[4] = v6;
    objc_msgSend(v17, "setErrorHandler:", v21);
    v18 = *(void **)(v6 + 152);
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __62__NSXPCConnection__initWithRemotePeerConnection_name_options___block_invoke_2;
    v20[3] = &unk_1E0F554F0;
    v20[4] = v6;
    objc_msgSend(v18, "setMessageHandler:", v20);
  }
  return v6;
}

void __62__NSXPCConnection__initWithRemotePeerConnection_name_options___block_invoke(uint64_t a1, uint64_t a2)
{
  message_handler_error(*(unsigned __int8 **)(a1 + 32), a2);
}

void __62__NSXPCConnection__initWithRemotePeerConnection_name_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  message_handler_message(*(_QWORD *)(a1 + 32), a2, a3);
}

- (id)_initWithRemoteService:(id)a3 name:(id)a4 options:(unint64_t)a5 mode:(unint64_t)a6
{
  NSXPCConnection *v9;
  NSXPCConnection *v10;
  unsigned int *p_state2;
  unsigned int v12;
  const char *v13;
  NSObject *v14;
  NSObject *global_queue;
  _NSXPCRemoteTransport *v16;
  uint64_t v17;
  _NSXPCTransport *transport;
  _NSXPCTransport *v19;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v9 = -[NSXPCConnection init](self, "init", a3, a4, a5);
  v10 = v9;
  if (v9)
  {
    p_state2 = &v9->_state2;
    do
      v12 = __ldaxr(p_state2);
    while (__stlxr(v12 | 0x40, p_state2));
    v13 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.NSXPCConnection.r-user.%@"), v9->_serviceName), "UTF8String");
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v10->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v13, v14, global_queue);
    v16 = -[_NSXPCRemoteTransport initWithRemoteService:name:queue:mode:]([_NSXPCRemoteTransport alloc], "initWithRemoteService:name:queue:mode:", a3, a4, v10->_userQueue, a6);
    v10->_transport = (_NSXPCTransport *)v16;
    -[_NSXPCRemoteTransport setTargetQueue:](v16, "setTargetQueue:", v10->_userQueue);
    v17 = MEMORY[0x1E0C809B0];
    transport = v10->_transport;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__NSXPCConnection__initWithRemoteService_name_options_mode___block_invoke;
    v22[3] = &unk_1E0F4FF38;
    v22[4] = v10;
    -[_NSXPCTransport setErrorHandler:](transport, "setErrorHandler:", v22);
    v19 = v10->_transport;
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __60__NSXPCConnection__initWithRemoteService_name_options_mode___block_invoke_2;
    v21[3] = &unk_1E0F554F0;
    v21[4] = v10;
    -[_NSXPCTransport setMessageHandler:](v19, "setMessageHandler:", v21);
    -[NSString UTF8String](v10->_serviceName, "UTF8String");
  }
  return v10;
}

void __60__NSXPCConnection__initWithRemoteService_name_options_mode___block_invoke(uint64_t a1, uint64_t a2)
{
  message_handler_error(*(unsigned __int8 **)(a1 + 32), a2);
}

void __60__NSXPCConnection__initWithRemoteService_name_options_mode___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  message_handler_message(*(_QWORD *)(a1 + 32), a2, a3);
}

- (id)_initWithRemoteService:(id)a3 name:(id)a4 options:(unint64_t)a5
{
  return -[NSXPCConnection _initWithRemoteService:name:options:mode:](self, "_initWithRemoteService:name:options:mode:", a3, a4, a5, 0);
}

- (id)_initWithRemoteConnection:(id)a3 name:(id)a4
{
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  unsigned int *p_state2;
  unsigned int v8;
  const char *v9;
  NSObject *v10;
  NSObject *global_queue;
  _NSXPCRemoteTransport *v12;
  uint64_t v13;
  _NSXPCTransport *transport;
  _NSXPCTransport *v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v5 = -[NSXPCConnection init](self, "init", a3, a4);
  v6 = v5;
  if (v5)
  {
    p_state2 = &v5->_state2;
    do
      v8 = __ldaxr(p_state2);
    while (__stlxr(v8 | 0x40, p_state2));
    v9 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.NSXPCConnection.r-user.%@"), v5->_serviceName), "UTF8String");
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v6->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v9, v10, global_queue);
    v12 = -[_NSXPCRemoteTransport initWithConnection:]([_NSXPCRemoteTransport alloc], "initWithConnection:", a3);
    v6->_transport = (_NSXPCTransport *)v12;
    -[_NSXPCRemoteTransport setTargetQueue:](v12, "setTargetQueue:", v6->_userQueue);
    v13 = MEMORY[0x1E0C809B0];
    transport = v6->_transport;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__NSXPCConnection__initWithRemoteConnection_name___block_invoke;
    v18[3] = &unk_1E0F4FF38;
    v18[4] = v6;
    -[_NSXPCTransport setErrorHandler:](transport, "setErrorHandler:", v18);
    v15 = v6->_transport;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __50__NSXPCConnection__initWithRemoteConnection_name___block_invoke_2;
    v17[3] = &unk_1E0F554F0;
    v17[4] = v6;
    -[_NSXPCTransport setMessageHandler:](v15, "setMessageHandler:", v17);
    -[NSString UTF8String](v6->_serviceName, "UTF8String");
  }
  return v6;
}

void __50__NSXPCConnection__initWithRemoteConnection_name___block_invoke(uint64_t a1, uint64_t a2)
{
  message_handler_error(*(unsigned __int8 **)(a1 + 32), a2);
}

void __50__NSXPCConnection__initWithRemoteConnection_name___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  message_handler_message(*(_QWORD *)(a1 + 32), a2, a3);
}

- (NSXPCConnection)initWithMachServiceName:(id)a3
{
  return -[NSXPCConnection initWithMachServiceName:options:](self, "initWithMachServiceName:options:", a3, 0);
}

void __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke(uint64_t a1)
{
  const char *v2;
  id Property;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("NSDebugDescription");
  v5[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The %@ was interrupted, but the message was sent over an additional proxy and therefore this proxy has become invalid."), objc_msgSend(*(id *)(a1 + 32), "_errorDescription"));
  +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4099, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
  Property = *(id *)(a1 + 40);
  if (Property)
    Property = objc_getProperty(Property, v2, 16, 1);
  __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)Property);
  -[_NSXPCConnectionExpectedReplyInfo cleanup](*(_QWORD *)(a1 + 40));
}

uint64_t __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelProgress:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseProgress:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resumeProgress:", *(_QWORD *)(a1 + 40));
}

- (void)set_additionalInvalidationHandler:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_setAssociatedObject(self, "additionalInvalidationHandler", a3, (void *)0x303);
  os_unfair_lock_unlock(p_lock);
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)_setLanguages:(id)a3
{
  char v4;
  void *v6;

  v4 = atomic_load(&self->_state2);
  if ((v4 & 0x40) != 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Custom transports do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v6);
  }
  os_unfair_lock_lock(&self->_lock);
  if (!self->_bootstrap)
  {
    self->_bootstrap = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    if (a3)
      goto LABEL_4;
LABEL_6:
    _CFBundleSetupXPCBootstrap();
    goto LABEL_7;
  }
  if (!a3)
    goto LABEL_6;
LABEL_4:
  _CFBundleSetupXPCBootstrapWithLanguages();
LABEL_7:
  xpc_connection_set_bootstrap();
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_setBootstrapObject:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_lock;
  OS_xpc_object *bootstrap;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  bootstrap = self->_bootstrap;
  if (!bootstrap)
  {
    bootstrap = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    self->_bootstrap = bootstrap;
  }
  xpc_dictionary_set_value(bootstrap, (const char *)objc_msgSend(a4, "UTF8String"), a3);
  xpc_connection_set_bootstrap();
  os_unfair_lock_unlock(p_lock);
}

- (id)delegate
{
  return (id)atomic_load((unint64_t *)&self->_delegate);
}

- (id)remoteObjectProxyWithUserInfo:(id)a3 errorHandler:(id)a4
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self, 1, 0, self->_remoteObjectInterface, 0, a4);
  objc_msgSend(v5, "set_userInfo:", a3);
  return v5;
}

- (id)remoteObjectProxyWithTimeout:(double)a3 errorHandler:(id)a4
{
  id result;

  result = (id)objc_msgSend(objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self, 1, 0, self->_remoteObjectInterface, 0, a4);
  if (result)
    *((double *)result + 8) = a3;
  return result;
}

- (void)_setTargetUserIdentifier:(unsigned int)a3
{
  char v3;
  void *v4;

  v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Custom transports do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v4);
  }
  xpc_connection_set_target_uid();
}

- (void)_killConnection:(int)a3
{
  char v3;
  void *v4;

  v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Custom transports do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v4);
  }
  xpc_connection_kill();
}

- (void)_cancelProgress:(unint64_t)a3
{
  xpc_object_t v5;
  char v6;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "f", 0x10015uLL);
  xpc_dictionary_set_uint64(v5, "sequence", a3);
  v6 = atomic_load(&self->_state2);
  if ((v6 & 0x40) != 0)
    -[_NSXPCTransport sendNotification:](self->_transport, "sendNotification:", v5);
  else
    xpc_connection_send_notification();
  xpc_release(v5);
}

- (void)_pauseProgress:(unint64_t)a3
{
  xpc_object_t v5;
  char v6;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "f", 0x20015uLL);
  xpc_dictionary_set_uint64(v5, "sequence", a3);
  v6 = atomic_load(&self->_state2);
  if ((v6 & 0x40) != 0)
    -[_NSXPCTransport sendNotification:](self->_transport, "sendNotification:", v5);
  else
    xpc_connection_send_notification();
  xpc_release(v5);
}

- (void)_resumeProgress:(unint64_t)a3
{
  xpc_object_t v5;
  char v6;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "f", 0x40015uLL);
  xpc_dictionary_set_uint64(v5, "sequence", a3);
  v6 = atomic_load(&self->_state2);
  if ((v6 & 0x40) != 0)
    -[_NSXPCTransport sendNotification:](self->_transport, "sendNotification:", v5);
  else
    xpc_connection_send_notification();
  xpc_release(v5);
}

@end
