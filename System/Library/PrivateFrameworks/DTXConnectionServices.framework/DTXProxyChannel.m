@implementation DTXProxyChannel

- (DTXProxyChannel)initWithChannel:(id)a3 remoteProtocol:(id)a4 localProtocol:(id)a5
{
  id v9;
  id v10;
  id v11;
  DTXProxyChannel *v12;
  DTXProxyChannel *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *additionalAllowedClassesForProtocolMethods;
  DTXChannel *channel;
  const char *v19;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)DTXProxyChannel;
  v12 = -[DTXProxyChannel init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_channel, a3);
    objc_storeStrong((id *)&v13->_remoteInterface, a4);
    objc_storeStrong((id *)&v13->_exportedInterface, a5);
    objc_msgSend_set(MEMORY[0x24BDBCF20], v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    additionalAllowedClassesForProtocolMethods = v13->_additionalAllowedClassesForProtocolMethods;
    v13->_additionalAllowedClassesForProtocolMethods = (NSSet *)v16;

    objc_initWeak(&location, v13);
    channel = v13->_channel;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_21DC87958;
    v21[3] = &unk_24E1AAA78;
    objc_copyWeak(&v22, &location);
    objc_msgSend__setDispatchValidator_(channel, v19, (uint64_t)v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (id)remoteObjectProxy
{
  _DTXProxy *v3;
  const char *v4;

  v3 = [_DTXProxy alloc];
  return (id)objc_msgSend_initWithChannel_(v3, v4, (uint64_t)self);
}

- (void)cancel
{
  DTXChannel *channel;
  _QWORD v3[5];

  channel = self->_channel;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_21DC87A40;
  v3[3] = &unk_24E1AA988;
  v3[4] = self;
  objc_msgSend_sendControlAsync_replyHandler_(channel, a2, kDTXAckBarrierMessage, v3);
}

- (id)_allowedClassesForArgumentsOfRemoteInterfaceSelector:(SEL)a3 methodSignature:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  unint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;

  v5 = a4;
  objc_msgSend_defaultAllowedSecureCodingClasses(DTXMessage, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  v10 = (void *)objc_opt_new();
  if (objc_msgSend_numberOfArguments(v9, v11, v12))
  {
    v14 = 0;
    do
    {
      v15 = objc_msgSend__classForObjectAtArgumentIndex_(v9, v13, v14);
      if (v15)
        objc_msgSend_addObject_(v10, v16, v15);
      ++v14;
    }
    while (v14 < objc_msgSend_numberOfArguments(v9, v16, v17));
  }

  if (objc_msgSend_count(v10, v18, v19))
  {
    objc_msgSend_setByAddingObjectsFromSet_(v8, v20, (uint64_t)v10);
    v22 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v22;
  }
  objc_msgSend_additionalAllowedClassesForProtocolMethods(self, v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v23, v24, v25))
  {
    objc_msgSend_setByAddingObjectsFromSet_(v8, v26, (uint64_t)v23);
    v27 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v27;
  }

  return v8;
}

- (id)_allowedClassesForReturnValues
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_defaultAllowedSecureCodingClasses(DTXMessage, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_additionalAllowedClassesForProtocolMethods(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v7, v8, v9))
  {
    objc_msgSend_setByAddingObjectsFromSet_(v4, v10, (uint64_t)v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v11;
  }

  return v4;
}

- (id)_validateDispatch:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t MethodTypeEncoding;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  char v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  unint64_t v35;
  id v36;
  const char *v37;
  _BYTE *ArgumentTypeAtIndex;
  const char *v39;
  uint64_t v40;
  _BYTE *v41;
  void *v42;
  void *v43;
  const char *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  void *v50;
  const char *v51;
  void *v52;
  void *v54;

  v6 = a3;
  atomic_store(1u, (unsigned __int8 *)&self->_hasProcessedMessage);
  if (!self->_exportedInterface)
    objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v4, (uint64_t)CFSTR("DTXMissingInterfaceException"), CFSTR("No exported interface has been specified"));
  v7 = (const char *)objc_msgSend_selector(v6, v4, v5);
  MethodTypeEncoding = _protocol_getMethodTypeEncoding();
  if (!MethodTypeEncoding)
  {
    v10 = (void *)MEMORY[0x24BDBCE88];
    NSStringFromSelector(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v10, v12, (uint64_t)CFSTR("DTXSelectorNotAllowedException"), CFSTR("Selector %@ is not part of the exported interface"), v11);

  }
  objc_msgSend_signatureWithObjCTypes_(MEMORY[0x24BDBCEB0], v8, MethodTypeEncoding);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_methodSignature(v6, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_numberOfArguments(v16, v17, v18);
  v22 = objc_msgSend_numberOfArguments(v13, v20, v21);

  if (v19 != v22)
  {
    v25 = (void *)MEMORY[0x24BDBCE88];
    NSStringFromSelector(v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v25, v27, (uint64_t)CFSTR("DTXSelectorMismatchException"), CFSTR("Incorrect number of arguments in incoming message with selector %@"), v26);

  }
  v54 = v6;
  objc_msgSend_target(v6, v23, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_opt_respondsToSelector();

  if ((v29 & 1) == 0)
  {
    v32 = (void *)MEMORY[0x24BDBCE88];
    NSStringFromSelector(v7);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v32, v34, (uint64_t)CFSTR("DTXSelectorUnimplementedException"), CFSTR("Selector %@ is a valid part of the exported interface, but the exported object does not implement it."), v33);

  }
  if ((unint64_t)objc_msgSend_numberOfArguments(v13, v30, v31) >= 3)
  {
    v35 = 2;
    do
    {
      v36 = objc_retainAutorelease(v13);
      ArgumentTypeAtIndex = (_BYTE *)objc_msgSend_getArgumentTypeAtIndex_(v36, v37, v35);
      if (*ArgumentTypeAtIndex != 64)
      {
        v41 = ArgumentTypeAtIndex;
        v42 = (void *)MEMORY[0x24BDBCE88];
        NSStringFromSelector(v7);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_raise_format_(v42, v44, (uint64_t)CFSTR("DTXSelectorInvalidArgumentTypeException"), CFSTR("Invalid argument type %s at index %lu of selector %@"), v41, v35, v43);

      }
      ++v35;
    }
    while (v35 < objc_msgSend_numberOfArguments(v36, v39, v40));
  }
  v45 = objc_retainAutorelease(v13);
  if (*(_BYTE *)objc_msgSend_methodReturnType(v45, v46, v47) != 64)
  {
    v49 = (void *)MEMORY[0x24BDBCE88];
    NSStringFromSelector(v7);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v49, v51, (uint64_t)CFSTR("DTXSelectorInvalidReturnTypeException"), CFSTR("Selector %@ is a part of the exported interface, but return type is not an object."), v50);

  }
  objc_msgSend__allowedClassesForArgumentsOfRemoteInterfaceSelector_methodSignature_(self, v48, (uint64_t)v7, v45);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (void)setExportedObject:(id)a3 queue:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  char v9;
  char *v10;

  v10 = (char *)a3;
  v6 = a4;
  v7 = v10;
  v8 = v6;
  if (v10)
  {
    v9 = objc_msgSend_conformsToProtocol_(v10, v10, (uint64_t)self->_exportedInterface);
    v7 = v10;
    if ((v9 & 1) == 0)
    {
      objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v10, *MEMORY[0x24BDBCA98], CFSTR("Exported object does not conform to the exported interface."));
      v7 = v10;
    }
  }
  objc_msgSend__setDispatchTarget_queue_(self->_channel, v7, (uint64_t)v7, v8);

}

- (void)setAdditionalAllowedClassesForProtocolMethods:(id)a3
{
  const char *v4;
  NSSet *v5;
  BOOL *p_hasProcessedMessage;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  NSSet *additionalAllowedClassesForProtocolMethods;

  v5 = (NSSet *)a3;
  p_hasProcessedMessage = &self->_hasProcessedMessage;
  do
    v7 = __ldaxr((unsigned __int8 *)p_hasProcessedMessage);
  while (__stlxr(1u, (unsigned __int8 *)p_hasProcessedMessage));
  if ((v7 & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDBCE88];
    v9 = *MEMORY[0x24BDBCA98];
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v4, (uint64_t)"-[DTXProxyChannel setAdditionalAllowedClassesForProtocolMethods:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v8, v11, v9, CFSTR("%@ must only be called once, before sending or receiving messages"), v10);

  }
  additionalAllowedClassesForProtocolMethods = self->_additionalAllowedClassesForProtocolMethods;
  self->_additionalAllowedClassesForProtocolMethods = v5;

}

- (void)_sendInvocationMessage:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  DTXMessage *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  atomic_store(1u, (unsigned __int8 *)&self->_hasProcessedMessage);
  v4 = a3;
  v17 = (id)objc_opt_new();
  objc_msgSend_setReturnValue_(v4, v5, (uint64_t)&v17);
  objc_msgSend_retainArguments(v4, v6, v7);
  v8 = [DTXMessage alloc];
  v10 = (void *)objc_msgSend_initWithInvocation_(v8, v9, (uint64_t)v4);

  objc_msgSend_channel(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_21DC880C8;
  v15[3] = &unk_24E1AAAA0;
  v15[4] = self;
  v16 = v17;
  objc_msgSend_sendControlAsync_replyHandler_(v13, v14, (uint64_t)v10, v15);

}

- (Protocol)remoteInterface
{
  return (Protocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRemoteInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (DTXChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (NSSet)additionalAllowedClassesForProtocolMethods
{
  return self->_additionalAllowedClassesForProtocolMethods;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalAllowedClassesForProtocolMethods, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
}

@end
