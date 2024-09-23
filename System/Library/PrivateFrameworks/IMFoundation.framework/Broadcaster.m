@implementation Broadcaster

- (id)methodSignatureForSelector:(SEL)a3
{
  Protocol *protocol;
  char *types;
  uint64_t v6;
  objc_method_description MethodDescription;

  protocol = self->_protocol;
  MethodDescription = protocol_getMethodDescription(protocol, a3, 1, 1);
  types = MethodDescription.types;
  if (MethodDescription.name)
  {
    if (MethodDescription.types)
      return (id)objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], types, (uint64_t)types, v6);
  }
  else
  {
    types = protocol_getMethodDescription(protocol, a3, 0, 1).types;
    if (types)
      return (id)objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], types, (uint64_t)types, v6);
  }
  return 0;
}

- (void)dealloc
{
  IMMessageContext *messageContext;
  NSArray *targets;
  objc_super v5;

  messageContext = self->_messageContext;
  if (messageContext)
    CFRelease(messageContext);
  targets = self->_targets;
  if (targets)
    CFRelease(targets);
  _Block_release(self->_completion);
  v5.receiver = self;
  v5.super_class = (Class)Broadcaster;
  -[Broadcaster dealloc](&v5, sel_dealloc);
}

- (Broadcaster)initWithNotifier:(id)a3 messageContext:(id)a4 protocol:(id)a5 targets:(id)a6 priority:(int)a7 completion:(id)a8
{
  if (!a5 || !objc_msgSend_count(a6, a2, (uint64_t)a3, (uint64_t)a4))
    return 0;
  self->_parent = (IMRemoteObjectBroadcaster *)a3;
  self->_targets = (NSArray *)a6;
  self->_messageContext = (IMMessageContext *)a4;
  self->_protocol = (Protocol *)a5;
  self->_curXPCMessagePriority = a7;
  self->_completion = _Block_copy(a8);
  return self;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  NSString *v10;
  IMMessageContext *messageContext;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int shouldBoost;
  const __CFString *v16;
  int v17;
  const char *v18;
  uint64_t v19;
  NSArray *targets;
  IMMessageContext *v21;
  id completion;
  uint64_t v23;
  void *v24;
  xpc_object_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void (**v53)(_QWORD);
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  _QWORD block[9];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_count(self->_targets, a2, (uint64_t)a3, v3))
    return;
  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    if (dword_1ECD90A78 <= 0)
      goto LABEL_7;
    goto LABEL_4;
  }
  if (dword_1ECD90A78)
  {
LABEL_4:
    v9 = (const char *)objc_msgSend_selector(a3, v6, v7, v8);
    v10 = NSStringFromSelector(v9);
    messageContext = self->_messageContext;
    shouldBoost = objc_msgSend_shouldBoost(messageContext, v12, v13, v14);
    v16 = CFSTR("NO");
    if (shouldBoost)
      v16 = CFSTR("YES");
    NSLog(CFSTR("forwarding: %@   held boost: %@   will boost: %@"), v10, messageContext, v16);
  }
LABEL_7:
  v17 = objc_msgSend_curXPCMessagePriority(self, v6, v7, v8);
  objc_msgSend_setCurXPCMessagePriority_(self, v18, 0, v19);
  kdebug_trace();
  targets = self->_targets;
  v21 = self->_messageContext;
  completion = self->_completion;
  v23 = IMCreateXPCObjectFromInvocation((uint64_t)a3);
  if (!v23)
    return;
  v24 = (void *)v23;
  v25 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v25, "invocation", v24);
  xpc_dictionary_set_int64(v25, "priority", v17);
  xpc_release(v24);
  if (!v25)
    goto LABEL_41;
  if (objc_msgSend_count(targets, v26, v27, v28))
    v32 = (void *)objc_msgSend__copyForEnumerating(targets, v29, v30, v31);
  else
    v32 = 0;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v29, (uint64_t)&v68, (uint64_t)v72, 16);
  if (!v33)
    goto LABEL_40;
  v37 = v33;
  v38 = *(_QWORD *)v69;
  while (2)
  {
    for (i = 0; i != v37; ++i)
    {
      if (*(_QWORD *)v69 != v38)
        objc_enumerationMutation(v32);
      v40 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
      if ((objc_msgSend_isValid(v40, v34, v35, v36) & 1) == 0)
      {
        if (dword_1ECD90A78 < 0)
        {
          if (qword_1ECD90F20 != -1)
            dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
          if (dword_1ECD90A78 <= 0)
            goto LABEL_40;
        }
        else if (!dword_1ECD90A78)
        {
          goto LABEL_40;
        }
        _IMLog(CFSTR("* Object is no longer valid, skipping this enqueue: %@"), (uint64_t)v41, v42, v43, v44, v45, v46, v47, (char)v40);
        goto LABEL_40;
      }
      v48 = objc_msgSend__queue(v40, v41, v42, v43);
      if (v48)
      {
        v49 = v48;
        dispatch_retain(v48);
        xpc_retain(v25);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1906735CC;
        block[3] = &unk_1E2C455F8;
        block[4] = v40;
        block[5] = v25;
        block[7] = v49;
        block[8] = completion;
        block[6] = v21;
        v53 = (void (**)(_QWORD))dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        if (v21
          && ((objc_msgSend_isReply(v21, v50, v51, v52) & 1) != 0
           || objc_msgSend_isSync(v21, v54, v55, v56)))
        {
          if ((_os_feature_enabled_impl() & 1) != 0
            || (v60 = (void *)objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v57, v58, v59),
                v64 = (void *)objc_msgSend_threadDictionary(v60, v61, v62, v63),
                (void *)objc_msgSend_objectForKey_(v64, v65, (uint64_t)CFSTR("com.apple.IMRemoteObjectDeliveringMessageKey"), v66) == v40))
          {
            v53[2](v53);
LABEL_33:
            _Block_release(v53);
            continue;
          }
          dispatch_sync(v49, v53);
        }
        else
        {
          dispatch_async(v49, v53);
        }
        if (v53)
          goto LABEL_33;
      }
    }
    v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v68, (uint64_t)v72, 16);
    if (v37)
      continue;
    break;
  }
LABEL_40:

LABEL_41:
  xpc_release(v25);
}

- (void)setCurXPCMessagePriority:(int)a3
{
  self->_curXPCMessagePriority = a3;
}

- (int)curXPCMessagePriority
{
  return self->_curXPCMessagePriority;
}

- (Broadcaster)initWithNotifier:(id)a3 messageContext:(id)a4 protocol:(id)a5 targets:(id)a6
{
  return (Broadcaster *)MEMORY[0x1E0DE7D20](self, sel_initWithNotifier_messageContext_protocol_targets_priority_, a3, a4);
}

- (Broadcaster)initWithNotifier:(id)a3 messageContext:(id)a4 protocol:(id)a5 targets:(id)a6 priority:(int)a7
{
  return (Broadcaster *)objc_msgSend_initWithNotifier_messageContext_protocol_targets_priority_completion_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, 0, 0);
}

- (void)sendXPCObject:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[6];

  if (a3)
  {
    if (objc_msgSend_count(self->_targets, a2, (uint64_t)a3, v3))
    {
      v9 = (void *)objc_msgSend_defaultBroadcaster(IMRemoteObjectBroadcaster, v6, v7, v8);
      v13 = objc_msgSend__queue(v9, v10, v11, v12);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = sub_19069AD90;
      v14[3] = &unk_1E2C455B0;
      v14[4] = a3;
      v14[5] = self;
      dispatch_sync(v13, v14);
    }
  }
}

@end
