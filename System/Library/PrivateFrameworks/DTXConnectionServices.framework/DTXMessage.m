@implementation DTXMessage

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)kDTXBarrierMessage;
    kDTXBarrierMessage = v2;

    objc_msgSend_setMessageType_((void *)kDTXBarrierMessage, v4, 5);
    objc_msgSend__makeImmutable((void *)kDTXBarrierMessage, v5, v6);
    v7 = objc_opt_new();
    v8 = (void *)kDTXAckBarrierMessage;
    kDTXAckBarrierMessage = v7;

    objc_msgSend_setMessageType_((void *)kDTXAckBarrierMessage, v9, 5);
    objc_msgSend__makeImmutable((void *)kDTXAckBarrierMessage, v10, v11);
    v12 = objc_opt_new();
    v13 = (void *)kDTXHeartbeatMessage;
    kDTXHeartbeatMessage = v12;

    objc_msgSend_setMessageType_((void *)kDTXHeartbeatMessage, v14, 5);
    objc_msgSend__makeImmutable((void *)kDTXHeartbeatMessage, v15, v16);
    v17 = objc_opt_new();
    v18 = (void *)kDTXInterruptionMessage;
    kDTXInterruptionMessage = v17;

    objc_msgSend_setErrorStatus_((void *)kDTXInterruptionMessage, v19, 2);
    objc_msgSend__makeImmutable((void *)kDTXInterruptionMessage, v20, v21);
    mach_timebase_info((mach_timebase_info_t)&dword_253F42640);
    v38 = (void *)MEMORY[0x24BDBCF20];
    v37 = objc_opt_class();
    v36 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    objc_msgSend_setWithObjects_(v38, v33, v37, v36, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, 0);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)qword_253F42630;
    qword_253F42630 = v34;

  }
}

+ (NSSet)defaultAllowedSecureCodingClasses
{
  return (NSSet *)(id)qword_253F42630;
}

- (NSData)data
{
  if (self->_messageType == 1)
    return self->_payloadData;
  else
    return (NSData *)0;
}

- (id)description
{
  return sub_21DC98474(self, self->_identifier | ((unint64_t)self->_conversationIndex << 32), self->_channelCode | ((unint64_t)self->_expectsReply << 32));
}

- (id)descriptionWithRoutingInformation:(DTXMessageRoutingInfo)a3
{
  return sub_21DC98474(self, *(unint64_t *)&a3.var0, *(uint64_t *)&a3.var2);
}

+ (void)setReportCompressionBlock:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_21DC98A24;
  v5[3] = &unk_24E1AAF48;
  v6 = v3;
  v4 = v3;
  sub_21DC989A4(v5);

}

- (void)compressWithCompressor:(id)a3 usingType:(int)a4 forCompatibilityWithVersion:(int64_t)a5
{
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  id v10;
  unsigned int messageType;
  void **p_payloadData;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int *p_compressionType;
  unsigned int v39;
  id v40;
  const char *v41;
  uint64_t v42;
  _DWORD *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[7];
  int v60;
  int v61;
  uint8_t buf[4];
  uint64_t v63;
  uint64_t v64;

  v6 = *(_QWORD *)&a4;
  v64 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  messageType = self->_messageType;
  if (messageType == 1)
  {
    p_payloadData = (void **)&self->_payloadData;
    if (!objc_msgSend_length(self->_payloadData, v8, v9)
      || (unint64_t)objc_msgSend_length(*p_payloadData, v13, v14) >> 32)
    {
      goto LABEL_18;
    }
    if (!v10)
      sub_21DCA0440();
    v17 = objc_msgSend_length(*p_payloadData, v15, v16);
    v18 = objc_alloc(MEMORY[0x24BDBCEC8]);
    v22 = (void *)objc_msgSend_initWithLength_(v18, v19, v17 + 4);
    v61 = 0;
    if (qword_2553ACB30)
    {
      v23 = mach_absolute_time();
      v26 = objc_msgSend_bytes(self->_payloadData, v24, v25);
      v29 = objc_msgSend_length(self->_payloadData, v27, v28);
      v30 = objc_retainAutorelease(v22);
      v33 = objc_msgSend_mutableBytes(v30, v31, v32);
      v35 = objc_msgSend_compressBuffer_ofLength_toBuffer_ofLength_usingCompressionType_withFinalCompressionType_(v10, v34, v26, v29, v33 + 4, v17, v6, &v61);
      v36 = mach_absolute_time();
      v59[0] = MEMORY[0x24BDAC760];
      v59[1] = 3221225472;
      v59[2] = sub_21DC98D20;
      v59[3] = &unk_24E1AB428;
      v59[4] = self;
      v59[5] = v35;
      v59[6] = v36 - v23;
      v60 = v61;
      sub_21DC989A4(v59);
      if (v35)
      {
LABEL_9:
        v37 = v61;
        self->_compressionType = v61;
        p_compressionType = &self->_compressionType;
        *(p_compressionType - 1) = 7;
        if (a5 <= 1)
        {
          v39 = v37 - 3;
          if (v39 >= 8 || ((0xF3u >> v39) & 1) == 0)
            sub_21DCA0468(p_compressionType, a5);
          *p_compressionType = dword_21DCA2230[v39];
        }
        v40 = objc_retainAutorelease(v22);
        v43 = (_DWORD *)objc_msgSend_mutableBytes(v40, v41, v42);
        *v43 = objc_msgSend_length(*p_payloadData, v44, v45);
        objc_msgSend_setLength_(v40, v46, v35 + 4);
        objc_storeStrong(p_payloadData, v40);
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      v47 = objc_msgSend_bytes(*p_payloadData, v20, v21);
      v50 = objc_msgSend_length(*p_payloadData, v48, v49);
      v51 = objc_retainAutorelease(v22);
      v54 = objc_msgSend_mutableBytes(v51, v52, v53);
      v35 = objc_msgSend_compressBuffer_ofLength_toBuffer_ofLength_usingCompressionType_withFinalCompressionType_(v10, v55, v47, v50, v54 + 4, v17, v6, &v61);
      if (v35)
        goto LABEL_9;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v58 = objc_msgSend_length(*p_payloadData, v56, v57);
      *(_DWORD *)buf = 134217984;
      v63 = v58;
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "DTXMessage failed to compress buffer of length %llu", buf, 0xCu);
    }
    goto LABEL_17;
  }
  if (messageType == 8)
    objc_msgSend_compressWithCompressor_usingType_forCompatibilityWithVersion_(self->_payloadObject, v8, (uint64_t)v10, v6, a5);
LABEL_18:

}

+ (id)messageWithObject:(id)a3
{
  id v3;
  void *v4;
  const char *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_setPayloadObject_(v4, v5, (uint64_t)v3);

  return v4;
}

+ (id)messageWithError:(id)a3
{
  id v3;
  void *v4;
  const char *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_setError_(v4, v5, (uint64_t)v3);

  return v4;
}

+ (id)messageWithPrimitive:(void *)a3
{
  void *v4;
  uint64_t Serialized;
  const char *v6;
  const char *v7;
  unsigned int v9;

  v4 = (void *)objc_opt_new();
  v9 = 0;
  Serialized = DTXPrimitiveDictionaryGetSerialized((uint64_t)a3, &v9);
  objc_msgSend__setPayloadBuffer_length_shouldCopy_destructor_(v4, v6, Serialized, v9, 1, 0);
  objc_msgSend_setMessageType_(v4, v7, 6);
  return v4;
}

+ (id)messageWithBuffer:(const void *)a3 length:(unint64_t)a4
{
  void *v6;
  const char *v7;

  v6 = (void *)objc_opt_new();
  objc_msgSend__setPayloadBuffer_length_shouldCopy_destructor_(v6, v7, (uint64_t)a3, a4, 1, 0);
  return v6;
}

+ (id)messageReferencingBuffer:(const void *)a3 length:(unint64_t)a4 destructor:(id)a5
{
  void (**v7)(_QWORD);
  _QWORD *v8;
  const char *v9;

  v7 = (void (**)(_QWORD))a5;
  v8 = (_QWORD *)objc_opt_new();
  objc_msgSend__setPayloadBuffer_length_shouldCopy_destructor_(v8, v9, (uint64_t)a3, a4, 0, v7);
  if (v7 && !v8[3])
    v7[2](v7);

  return v8;
}

+ (id)messageWithData:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a3;
  v6 = objc_opt_new();
  if (v6)
  {
    v7 = objc_msgSend_copy(v3, v4, v5);
    v8 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v7;

    *(_DWORD *)(v6 + 8) = 1;
    v9 = (id)v6;
  }

  return (id)v6;
}

+ (id)messageWithSelector:(SEL)a3 typesAndArguments:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v16;
  const char *v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a4;
  if (!a3)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, a1, CFSTR("DTXMessage.m"), 541, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selector"));

  }
  v7 = (void *)objc_opt_new();
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPayloadObject_(v7, v9, (uint64_t)v8);

  objc_msgSend_setMessageType_(v7, v10, 2);
  objc_msgSend__appendTypesAndValues_withKey_list_(v7, v11, v4, 0, &v18);
  objc_msgSend__makeImmutable(v7, v12, v13);
  return v7;
}

+ (id)messageWithSelector:(SEL)a3 objectArguments:(id)a4
{
  const char *v7;
  uint64_t v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v16;
  const char *v17;
  uint64_t v18;

  v9 = a4;
  if (!a3)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v7, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, a1, CFSTR("DTXMessage.m"), 554, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selector"));

  }
  v10 = objc_alloc((Class)a1);
  v12 = (void *)objc_msgSend_initWithSelector_firstArg_remainingObjectArgs_(v10, v11, (uint64_t)a3, v9, &v18);
  objc_msgSend__makeImmutable(v12, v13, v14);

  return v12;
}

+ (id)messageWithSelector:(SEL)a3 arguments:(id)a4
{
  const char *v7;
  uint64_t v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v16;
  const char *v17;

  v9 = a4;
  if (!a3)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v7, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, a1, CFSTR("DTXMessage.m"), 564, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selector"));

  }
  v10 = objc_alloc((Class)a1);
  v12 = (void *)objc_msgSend_initWithSelector_objects_(v10, v11, (uint64_t)a3, v9);
  objc_msgSend__makeImmutable(v12, v13, v14);

  return v12;
}

+ (id)message
{
  return (id)objc_opt_new();
}

- (id)newReply
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  const char *v15;

  v3 = (void *)objc_opt_new();
  v6 = objc_msgSend_channelCode(self, v4, v5);
  objc_msgSend_setChannelCode_(v3, v7, v6);
  v10 = objc_msgSend_identifier(self, v8, v9);
  objc_msgSend_setIdentifier_(v3, v11, v10);
  v14 = objc_msgSend_conversationIndex(self, v12, v13);
  objc_msgSend_setConversationIndex_(v3, v15, (v14 + 1));
  return v3;
}

- (id)newReplyWithObject:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  const char *v16;

  objc_msgSend_messageWithObject_(DTXMessage, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_channelCode(self, v5, v6);
  objc_msgSend_setChannelCode_(v4, v8, v7);
  v11 = objc_msgSend_identifier(self, v9, v10);
  objc_msgSend_setIdentifier_(v4, v12, v11);
  v15 = objc_msgSend_conversationIndex(self, v13, v14);
  objc_msgSend_setConversationIndex_(v4, v16, (v15 + 1));
  return v4;
}

- (id)newReplyWithError:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  const char *v16;

  objc_msgSend_messageWithError_(DTXMessage, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_channelCode(self, v5, v6);
  objc_msgSend_setChannelCode_(v4, v8, v7);
  v11 = objc_msgSend_identifier(self, v9, v10);
  objc_msgSend_setIdentifier_(v4, v12, v11);
  v15 = objc_msgSend_conversationIndex(self, v13, v14);
  objc_msgSend_setConversationIndex_(v4, v16, (v15 + 1));
  return v4;
}

- (id)newReplyWithMessage:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  int v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v44;

  v5 = a3;
  v8 = objc_msgSend_errorStatus(v5, v6, v7);
  if (v8 == 3)
  {
    v11 = objc_msgSend_errorStatus(v5, v9, v10);
    v18 = CFSTR("peer unable to respond");
  }
  else
  {
    if (v8 != 2)
    {
      objc_msgSend_message(DTXMessage, v9, v10);
      v21 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v21 + 48), a3);
      *(_QWORD *)(v21 + 32) = objc_msgSend_cost(v5, v24, v25);
      objc_msgSend_setMessageType_((void *)v21, v26, 8);
      v29 = objc_msgSend_errorStatus(v5, v27, v28);
      objc_msgSend_setErrorStatus_((void *)v21, v30, v29);
      goto LABEL_7;
    }
    v11 = objc_msgSend_errorStatus(v5, v9, v10);
    v18 = CFSTR("interruption encountered and re-routed");
  }
  sub_21DC99490(v11, v18, v12, v13, v14, v15, v16, v17, v44);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_messageWithError_(DTXMessage, v20, (uint64_t)v19);
  v21 = objc_claimAutoreleasedReturnValue();

LABEL_7:
  v31 = objc_msgSend_channelCode(self, v22, v23);
  objc_msgSend_setChannelCode_((void *)v21, v32, v31);
  v35 = objc_msgSend_identifier(self, v33, v34);
  objc_msgSend_setIdentifier_((void *)v21, v36, v35);
  v39 = objc_msgSend_conversationIndex(self, v37, v38);
  objc_msgSend_setConversationIndex_((void *)v21, v40, (v39 + 1));
  objc_msgSend__makeImmutable((void *)v21, v41, v42);

  return (id)v21;
}

- (id)newReplyReferencingBuffer:(const void *)a3 length:(unint64_t)a4 destructor:(id)a5
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  int v17;
  const char *v18;

  objc_msgSend_messageReferencingBuffer_length_destructor_(DTXMessage, a2, (uint64_t)a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_channelCode(self, v7, v8);
  objc_msgSend_setChannelCode_(v6, v10, v9);
  v13 = objc_msgSend_identifier(self, v11, v12);
  objc_msgSend_setIdentifier_(v6, v14, v13);
  v17 = objc_msgSend_conversationIndex(self, v15, v16);
  objc_msgSend_setConversationIndex_(v6, v18, (v17 + 1));
  return v6;
}

- (DTXMessage)initWithSelector:(SEL)a3 firstArg:(id)a4 remainingObjectArgs:(char *)a5
{
  id v8;
  DTXMessage *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  id v16;
  _QWORD v18[4];
  DTXMessage *v19;
  objc_super v20;
  char *v21;

  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DTXMessage;
  v21 = a5;
  v9 = -[DTXMessage init](&v20, sel_init);
  if (v9)
  {
    NSStringFromSelector(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPayloadObject_(v9, v11, (uint64_t)v10);

    v9->_messageType = 2;
    if (v8)
    {
      objc_msgSend__willModifyAuxiliary(v9, v12, v13);
      v14 = MEMORY[0x24BDAC760];
      do
      {
        v18[0] = v14;
        v18[1] = 3221225472;
        v18[2] = sub_21DC9984C;
        v18[3] = &unk_24E1AB450;
        v19 = v9;
        sub_21DC99728(v8, v18);
        v15 = (id *)v21;
        v21 += 8;
        v16 = *v15;

        v8 = v16;
      }
      while (v16);
    }
  }

  return v9;
}

- (DTXMessage)initWithSelector:(SEL)a3 objects:(id)a4
{
  id v6;
  DTXMessage *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  _QWORD v24[4];
  DTXMessage *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v30.receiver = self;
  v30.super_class = (Class)DTXMessage;
  v7 = -[DTXMessage init](&v30, sel_init);
  if (v7)
  {
    NSStringFromSelector(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPayloadObject_(v7, v9, (uint64_t)v8);

    v7->_messageType = 2;
    if (objc_msgSend_count(v6, v10, v11))
    {
      objc_msgSend__willModifyAuxiliary(v7, v12, v13);
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v14 = v6;
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v26, v31, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v27;
        v19 = MEMORY[0x24BDAC760];
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v27 != v18)
              objc_enumerationMutation(v14);
            v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v20);
            v24[0] = v19;
            v24[1] = 3221225472;
            v24[2] = sub_21DC99A1C;
            v24[3] = &unk_24E1AB450;
            v25 = v7;
            sub_21DC99728(v21, v24);

            ++v20;
          }
          while (v17 != v20);
          v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v22, (uint64_t)&v26, v31, 16);
        }
        while (v17);
      }

    }
  }

  return v7;
}

- (DTXMessage)initWithInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  DTXMessage *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  const char *v23;
  _BYTE *ArgumentTypeAtIndex;
  const char *v25;
  uint64_t v26;
  const char *v27;
  char v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  _BYTE *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  _QWORD v39[4];
  DTXMessage *v40;
  void *v41;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)DTXMessage;
  v7 = -[DTXMessage init](&v42, sel_init);
  if (v7)
  {
    v8 = (const char *)objc_msgSend_selector(v4, v5, v6);
    NSStringFromSelector(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPayloadObject_(v7, v10, (uint64_t)v9);

    v7->_messageType = 2;
    objc_msgSend_methodSignature(v4, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_numberOfArguments(v13, v14, v15);
    if (v16 >= 3)
    {
      v19 = v16;
      objc_msgSend__willModifyAuxiliary(v7, v17, v18);
      v20 = *MEMORY[0x24BDBCAB8];
      for (i = 2; i != v19; ++i)
      {
        v22 = objc_retainAutorelease(v13);
        ArgumentTypeAtIndex = (_BYTE *)objc_msgSend_getArgumentTypeAtIndex_(v22, v23, i);
        if (*ArgumentTypeAtIndex == 64)
        {
          v41 = 0;
          objc_msgSend_getArgument_atIndex_(v4, v25, (uint64_t)&v41, i);
          if (v41)
          {
            v28 = objc_msgSend_conformsToProtocol_(v41, v27, (uint64_t)&unk_2553AD878);
            v29 = v41;
            if ((v28 & 1) == 0)
            {
              v30 = (void *)MEMORY[0x24BDBCE88];
              v31 = objc_opt_class();
              objc_msgSend_raise_format_(v30, v32, v20, CFSTR("Arguments for proxied messages must conform to NSSecureCoding. %@ does not."), v31);
              v29 = v41;
            }
          }
          else
          {
            v29 = 0;
          }
          v39[0] = MEMORY[0x24BDAC760];
          v39[1] = 3221225472;
          v39[2] = sub_21DC99C30;
          v39[3] = &unk_24E1AB450;
          v40 = v7;
          sub_21DC99728(v29, v39);

        }
        else
        {
          v33 = ArgumentTypeAtIndex;
          v34 = (void *)MEMORY[0x24BDBCE88];
          v35 = (const char *)objc_msgSend_selector(v4, v25, v26);
          NSStringFromSelector(v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_raise_format_(v34, v37, v20, CFSTR("Invalid argument type %s at index %lu of selector %@"), v33, i, v36);

        }
      }
    }

  }
  return v7;
}

- (void)dealloc
{
  void *auxiliary;
  objc_super v4;

  auxiliary = self->_auxiliary;
  if (auxiliary && !self->_deserialized)
  {
    DTXPrimitiveDictionaryDestroy(auxiliary);
    self->_auxiliary = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DTXMessage;
  -[DTXMessage dealloc](&v4, sel_dealloc);
}

- (void)_setPayloadBuffer:(const char *)a3 length:(unint64_t)a4 shouldCopy:(BOOL)a5 destructor:(id)a6
{
  _BOOL4 v6;
  const char *v10;
  id v11;
  NSData *v12;
  id v13;
  const char *v14;
  NSData *v15;
  NSData *payloadData;
  NSData *v17;
  _QWORD v18[4];
  NSData *v19;

  v6 = a5;
  v11 = a6;
  if (a3 && a4)
  {
    if (v6)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v10, (uint64_t)a3, a4);
      v12 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11)
      {
        v13 = objc_alloc(MEMORY[0x24BDBCE50]);
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = sub_21DC99DA8;
        v18[3] = &unk_24E1AB478;
        v19 = (NSData *)v11;
        v15 = (NSData *)objc_msgSend_initWithBytesNoCopy_length_deallocator_(v13, v14, (uint64_t)a3, a4, v18);
        payloadData = self->_payloadData;
        self->_payloadData = v15;

        v17 = v19;
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v10, (uint64_t)a3, a4, 0);
      v12 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    v17 = self->_payloadData;
    self->_payloadData = v12;
    goto LABEL_9;
  }
LABEL_10:
  self->_messageType = 1;

}

- (void)setPayloadObject:(id)a3
{
  NSSecureCoding *v6;
  unsigned __int8 v7;
  void *v8;
  objc_class *v9;
  void *v10;
  const char *Name;
  const char *v12;
  NSSecureCoding *payloadObject;
  _QWORD v14[5];

  v6 = (NSSecureCoding *)a3;
  v7 = atomic_load((unsigned __int8 *)&self->_immutable);
  if ((v7 & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDBCE88];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    objc_msgSend_raise_format_(v8, v12, (uint64_t)CFSTR("DTXMessageException"), CFSTR("-[%@ %s] Unable to modify immutable message: %@"), v10, Name, self);

  }
  if (self->_payloadObject != v6)
  {
    objc_storeStrong((id *)&self->_payloadObject, a3);
    payloadObject = self->_payloadObject;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_21DC99EA4;
    v14[3] = &unk_24E1AB450;
    v14[4] = self;
    sub_21DC99728(payloadObject, v14);
  }

}

- (NSSecureCoding)payloadObject
{
  uint64_t v2;
  void *v4;

  objc_msgSend_defaultAllowedSecureCodingClasses(DTXMessage, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_21DC99F28(self, v4);

  return self->_payloadObject;
}

- (id)objectWithAllowedClasses:(id)a3
{
  id v4;
  NSSecureCoding *v5;
  id v6;
  Class i;
  const char *v8;
  objc_class *v9;

  v4 = a3;
  sub_21DC99F28(self, v4);
  v5 = self->_payloadObject;
  v6 = v4;
  for (i = object_getClass(v5); ; i = class_getSuperclass(v9))
  {
    v9 = i;
    if (!i)
      break;
    if (objc_msgSend_containsObject_(v6, v8, (uint64_t)i))
    {
      v9 = v5;
      break;
    }
  }

  return v9;
}

- (NSSecureCoding)object
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;

  v6 = 0;
  switch(objc_msgSend_messageType(self, a2, v2))
  {
    case 1u:
    case 3u:
    case 6u:
      objc_msgSend_defaultAllowedSecureCodingClasses(DTXMessage, v4, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectWithAllowedClasses_(self, v8, (uint64_t)v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 8u:
      objc_msgSend_object(self->_payloadObject, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return (NSSecureCoding *)v6;
  }
  return (NSSecureCoding *)v6;
}

- (const)getBufferWithReturnedLength:(unint64_t *)a3
{
  if (self->_messageType != 1)
    return 0;
  if (a3)
    *a3 = objc_msgSend_length(self->_payloadData, a2, (uint64_t)a3);
  return (const void *)objc_msgSend_bytes(self->_payloadData, a2, (uint64_t)a3);
}

- (void)_makeImmutable
{
  BOOL *p_immutable;
  void *v5;
  void *v6;
  NSDictionary *auxiliaryPromoted;
  const char *v8;
  NSDictionary *v9;
  _QWORD v10[5];

  if (qword_253F42660 != -1)
    dispatch_once(&qword_253F42660, &unk_24E1AA960);
  p_immutable = &self->_immutable;
  do
  {
    if (__ldxr((unsigned __int8 *)p_immutable))
    {
      __clrex();
      return;
    }
  }
  while (__stxr(1u, (unsigned __int8 *)p_immutable));
  if (self->_auxiliaryPromoted)
  {
    if (!self->_auxiliary)
    {
      DTXPrimitiveDictionaryCreate();
      self->_auxiliary = v5;
    }
    v6 = (void *)MEMORY[0x22079E084]();
    auxiliaryPromoted = self->_auxiliaryPromoted;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_21DC9A4F8;
    v10[3] = &unk_24E1AB560;
    v10[4] = self;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(auxiliaryPromoted, v8, (uint64_t)v10);
    v9 = self->_auxiliaryPromoted;
    self->_auxiliaryPromoted = 0;

    objc_autoreleasePoolPop(v6);
  }
}

- (void)_makeBarrier
{
  unsigned __int8 v3;
  void *v5;
  objc_class *v6;
  void *v7;
  const char *Name;
  const char *v9;

  v3 = atomic_load((unsigned __int8 *)&self->_immutable);
  if ((v3 & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDBCE88];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    objc_msgSend_raise_format_(v5, v9, (uint64_t)CFSTR("DTXMessageException"), CFSTR("-[%@ %s] Unable to modify immutable message: %@"), v7, Name, self);

  }
  self->_messageType = 5;
}

- (void)setErrorStatus:(unsigned int)a3
{
  unsigned __int8 v5;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *Name;
  const char *v11;

  v5 = atomic_load((unsigned __int8 *)&self->_immutable);
  if ((v5 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    objc_msgSend_raise_format_(v7, v11, (uint64_t)CFSTR("DTXMessageException"), CFSTR("-[%@ %s] Unable to modify immutable message: %@"), v9, Name, self);

  }
  self->_status = a3;
}

- (void)_willModifyAuxiliary
{
  unsigned __int8 v3;
  void *v5;
  objc_class *v6;
  void *v7;
  const char *Name;
  const char *v9;
  void *v10;

  v3 = atomic_load((unsigned __int8 *)&self->_immutable);
  if ((v3 & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDBCE88];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    objc_msgSend_raise_format_(v5, v9, (uint64_t)CFSTR("DTXMessageException"), CFSTR("-[%@ %s] Unable to modify immutable message: %@"), v7, Name, self);

  }
  if (!self->_auxiliary)
  {
    DTXPrimitiveDictionaryCreate();
    self->_auxiliary = v10;
  }
}

- (void)_appendTypesAndValues:(unsigned int)a3 withKey:(id)a4 list:(char *)a5
{
  uint64_t v6;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void *v14;
  id v15;
  char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void *v29;
  char *v30;
  _QWORD v31[5];
  id v32;
  char *v33;

  v6 = *(_QWORD *)&a3;
  v9 = a4;
  v33 = a5;
  objc_msgSend__willModifyAuxiliary(self, v10, v11);
  v12 = MEMORY[0x24BDAC760];
  while ((int)v6 > 5)
  {
    if ((_DWORD)v6 == 6)
    {
      v22 = v33;
      v33 += 8;
      v23 = *(_QWORD *)v22;
      v24 = objc_retainAutorelease(v9);
      v27 = (char *)objc_msgSend_UTF8String(v24, v25, v26);
      DTXPrimitiveDictionaryAddPrimitivePair((unint64_t *)&self->_auxiliary, v27, 6, v23);
LABEL_10:
      if (v9)
        goto LABEL_15;
      goto LABEL_14;
    }
    if ((_DWORD)v6 != 11)
      goto LABEL_13;
    v13 = (void **)v33;
    v33 += 8;
    v14 = *v13;
    v31[0] = v12;
    v31[1] = 3221225472;
    v31[2] = sub_21DC9A90C;
    v31[3] = &unk_24E1AB588;
    v31[4] = self;
    v32 = v9;
    v15 = v14;
    sub_21DC99728(v15, v31);

    if (v9)
      goto LABEL_15;
LABEL_14:
    v30 = v33;
    v33 += 8;
    v6 = *(unsigned int *)v30;
  }
  if ((_DWORD)v6 == 3)
  {
    v16 = v33;
    v33 += 8;
    v17 = *(unsigned int *)v16;
    v18 = objc_retainAutorelease(v9);
    v21 = (char *)objc_msgSend_UTF8String(v18, v19, v20);
    DTXPrimitiveDictionaryAddPrimitivePair((unint64_t *)&self->_auxiliary, v21, 3, v17);
    goto LABEL_10;
  }
  if (!(_DWORD)v6)
    goto LABEL_15;
LABEL_13:
  v28 = objc_opt_class();
  NSStringFromSelector(a2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("-[%@ %@]: unknown parameter type (%d)"), v28, v29, v6);

  if (!v9)
    goto LABEL_14;
LABEL_15:

}

- (id)_mutableAuxiliaryDictionary
{
  unsigned __int8 v3;
  void *v5;
  objc_class *v6;
  void *v7;
  const char *Name;
  const char *v9;
  NSDictionary *auxiliaryPromoted;
  NSDictionary *v11;
  NSDictionary *v12;

  v3 = atomic_load((unsigned __int8 *)&self->_immutable);
  if ((v3 & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDBCE88];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    objc_msgSend_raise_format_(v5, v9, (uint64_t)CFSTR("DTXMessageException"), CFSTR("-[%@ %s] Unable to modify immutable message: %@"), v7, Name, self);

  }
  auxiliaryPromoted = self->_auxiliaryPromoted;
  if (!auxiliaryPromoted)
  {
    v11 = (NSDictionary *)objc_opt_new();
    v12 = self->_auxiliaryPromoted;
    self->_auxiliaryPromoted = v11;

    auxiliaryPromoted = self->_auxiliaryPromoted;
  }
  return auxiliaryPromoted;
}

- (void)setString:(id)a3 forMessageKey:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend__mutableAuxiliaryDictionary(self, v7, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v9, v10, (uint64_t)v11, v6);

      }
    }
  }

}

- (void)setInteger:(int64_t)a3 forMessageKey:(id)a4
{
  void *v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  id v13;

  if (a4)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = a4;
    objc_msgSend_numberWithLongLong_(v6, v8, a3);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__mutableAuxiliaryDictionary(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v11, v12, (uint64_t)v13, v7);

  }
}

- (void)setData:(id)a3 forMessageKey:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend__mutableAuxiliaryDictionary(self, v7, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v9, v10, (uint64_t)v11, v6);

      }
    }
  }

}

- (id)_faultAuxiliaryValueOfType:(Class)a3 forKey:(id)a4
{
  const char *v6;
  id v7;
  id v8;
  NSDictionary *auxiliaryPromoted;
  NSDictionary *v10;
  NSDictionary *v11;
  void *v12;
  void *v13;

  v7 = a4;
  if (v7)
  {
    if (self->_messageType == 8)
    {
      objc_msgSend__faultAuxiliaryValueOfType_forKey_(self->_payloadObject, v6, (uint64_t)a3, v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      auxiliaryPromoted = self->_auxiliaryPromoted;
      if (!auxiliaryPromoted)
      {
        v10 = (NSDictionary *)CFDictionaryCreateWithDTXPrimitiveDictionary((uint64_t)self->_auxiliary);
        v11 = self->_auxiliaryPromoted;
        self->_auxiliaryPromoted = v10;

        auxiliaryPromoted = self->_auxiliaryPromoted;
      }
      objc_msgSend_objectForKeyedSubscript_(auxiliaryPromoted, v6, (uint64_t)v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 && (objc_opt_isKindOfClass() & 1) == 0)
        v13 = 0;
      else
        v13 = v12;
      v8 = v13;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)integerForMessageKey:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int64_t v10;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend__faultAuxiliaryValueOfType_forKey_(self, v6, v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend_longLongValue(v7, v8, v9);
  return v10;
}

- (id)stringForMessageKey:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend__faultAuxiliaryValueOfType_forKey_(self, v6, v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dataForMessageKey:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend__faultAuxiliaryValueOfType_forKey_(self, v6, v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)valueForMessageKey:(id)a3
{
  return (id)objc_msgSend__faultAuxiliaryValueOfType_forKey_(self, a2, 0, a3);
}

- (NSError)error
{
  uint64_t v2;
  unsigned int messageType;
  void *v5;
  const char *v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  messageType = self->_messageType;
  if (messageType == 4)
  {
    objc_msgSend_payloadObject(self, a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v5;
      }
      else
      {
        v8 = (void *)MEMORY[0x24BDD1540];
        v11 = *MEMORY[0x24BDD0FC8];
        v12[0] = v5;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v6, (uint64_t)v12, &v11, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v8, v10, (uint64_t)CFSTR("DTXConnection"), 1, v9);
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v7 = 0;
    }

    return (NSError *)v7;
  }
  else if (messageType == 8)
  {
    objc_msgSend_error(self->_payloadObject, a2, v2);
    return (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return (NSError *)0;
  }
}

- (void)setError:(id)a3
{
  objc_msgSend_setPayloadObject_(self, a2, (uint64_t)a3);
  self->_messageType = 4;
  self->_status = 1;
}

- (BOOL)isDispatch
{
  uint64_t v2;
  unsigned int messageType;

  messageType = self->_messageType;
  if (messageType == 8)
    return objc_msgSend_isDispatch(self->_payloadObject, a2, v2);
  else
    return messageType == 2;
}

- (BOOL)isBarrier
{
  uint64_t v2;
  unsigned int messageType;

  messageType = self->_messageType;
  if (messageType == 8)
    return objc_msgSend_isBarrier(self->_payloadObject, a2, v2);
  else
    return messageType == 5;
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unsigned int)a3
{
  self->_messageType = a3;
}

- (BOOL)shouldInvokeWithTarget:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  int isDispatch;
  const char *v8;
  uint64_t v9;
  char v10;
  NSString *v11;
  SEL v12;
  const char *v13;
  void *v14;

  v4 = a3;
  isDispatch = objc_msgSend_isDispatch(self, v5, v6);
  v10 = 0;
  if (v4 && isDispatch)
  {
    objc_msgSend_payloadObject(self, v8, v9);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = NSSelectorFromString(v11);

    objc_msgSend_methodSignatureForSelector_(v4, v13, (uint64_t)v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v10 = sub_21DC9AFC8((uint64_t)v12, v4);
    else
      v10 = 0;

  }
  return v10;
}

- (void)invokeWithTarget:(id)a3 replyChannel:(id)a4 validator:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSString *v15;
  SEL v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *auxiliary;
  id v38;
  id v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  const __CFArray *v47;
  const char *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  id v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  DTXMessage *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  CFRange v84;

  v83 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (!objc_msgSend_isDispatch(self, v11, v12))
    goto LABEL_29;
  objc_msgSend_payloadObject(self, v13, v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = NSSelectorFromString(v15);

  objc_msgSend_methodSignatureForSelector_(v8, v17, (uint64_t)v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (v10 || (sub_21DC9AFC8((uint64_t)v16, v8) & 1) != 0)
      goto LABEL_8;
    v22 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_payloadObject(self, v18, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v22, v24, (uint64_t)CFSTR("DTXMessageInvocationException"), CFSTR("Unable to invoke -[%@ %@] - the selector is not allowed"), v8, v23);
  }
  else
  {
    v25 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_payloadObject(self, v18, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v25, v26, (uint64_t)CFSTR("DTXMessageInvocationException"), CFSTR("Unable to invoke -[%@ %@] - it does not respond to the selector"), v8, v23);
  }

LABEL_8:
  objc_msgSend_invocationWithMethodSignature_(MEMORY[0x24BDBCE98], v18, (uint64_t)v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSelector_(v27, v28, (uint64_t)v16);
  objc_msgSend_setTarget_(v27, v29, (uint64_t)v8);
  objc_msgSend_defaultAllowedSecureCodingClasses(DTXMessage, v30, v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v10[2](v10, v27);
    v35 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v35;
  }
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v78 = objc_msgSend_numberOfArguments(v20, v32, v33) - 2;
  v36 = (void *)objc_opt_new();
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  auxiliary = self->_auxiliary;
  v65[0] = MEMORY[0x24BDAC760];
  v65[1] = 3221225472;
  v65[2] = sub_21DC9B758;
  v65[3] = &unk_24E1AB5B0;
  v68 = &v79;
  v69 = &v75;
  v70 = &v71;
  v38 = v27;
  v66 = v38;
  v39 = v36;
  v67 = v39;
  sub_21DC9B6B8((uint64_t)auxiliary, v34, v65);
  if (v80[3] < (unint64_t)v76[3])
  {
    v42 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_payloadObject(self, v40, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v42, v44, (uint64_t)CFSTR("DTXMessageInvocationException"), CFSTR("Unable to invoke -[%@ %@] - too few arguments (%lu provided, %lu expected)"), v8, v43, v80[3], v76[3]);

  }
  objc_msgSend_invoke(v38, v40, v41);
  v47 = (const __CFArray *)v72[3];
  if (v47)
  {
    v84.length = CFArrayGetCount((CFArrayRef)v72[3]);
    v84.location = 0;
    CFArrayApplyFunction(v47, v84, (CFArrayApplierFunction)j__free, 0);
    CFRelease((CFTypeRef)v72[3]);
  }
  v64 = 0;
  if ((unint64_t)objc_msgSend_methodReturnLength(v20, v45, v46) < 8)
  {
    v51 = 0;
  }
  else
  {
    objc_msgSend_getReturnValue_(v38, v48, (uint64_t)&v64);
    v50 = v64;
    v51 = v50;
    if (v50)
    {
      if ((objc_msgSend_conformsToProtocol_(v50, v48, (uint64_t)&unk_2553AD878) & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v60 = (void *)MEMORY[0x24BDBCE88];
          objc_msgSend_payloadObject(self, v48, v49);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_raise_format_(v60, v53, (uint64_t)CFSTR("DTXMessageInvocationException"), CFSTR("Unable to invoke -[%@ %@] - 'id' return value does not conform to NSSecureCoding"), v8, v52);

        }
      }
    }
  }
  if (objc_msgSend_expectsReply(self, v48, v49))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = v51;
      v61[0] = MEMORY[0x24BDAC760];
      v61[1] = 3221225472;
      v61[2] = sub_21DC9B90C;
      v61[3] = &unk_24E1AB5D8;
      v62 = v9;
      v63 = self;
      objc_msgSend_handleCompletion_(v56, v57, (uint64_t)v61);

    }
    else
    {
      if (v51)
        v58 = objc_msgSend_newReplyWithObject_(self, v54, (uint64_t)v51);
      else
        v58 = objc_msgSend_newReply(self, v54, v55);
      v56 = (id)v58;
      objc_msgSend_sendControlAsync_replyHandler_(v9, v59, v58, 0);
    }

  }
  _Block_object_dispose(&v71, 8);

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);

LABEL_29:
}

+ (BOOL)extractSerializedCompressionInfoFromBuffer:(const char *)a3 length:(unint64_t)a4 compressionType:(int *)a5 uncompressedLength:(unint64_t *)a6 compressedDataOffset:(unint64_t *)a7
{
  BOOL result;
  unint64_t v8;
  const char *v9;

  result = 0;
  if (a3 && a4 >= 0x14 && a5 && a6 && a7)
  {
    if (*(_DWORD *)a3 == 7
      && (v8 = *((_QWORD *)a3 + 1) - *((unsigned int *)a3 + 1), *a5 = (*(_DWORD *)a3 >> 8) & 0xF, v8 >= 4))
    {
      v9 = &a3[*((unsigned int *)a3 + 1)];
      *a6 = *((unsigned int *)v9 + 4);
      *a7 = v9 + 16 - a3 + 4;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_decompressedData:(id)a3 compressor:(id)a4 compressionType:(int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  unsigned int *v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  DTXDecompressionException *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  id v34;
  DTXDecompressionException *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  void *v39;
  const char *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  const __CFString *v43;
  _QWORD v44[2];

  v5 = *(_QWORD *)&a5;
  v44[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
    sub_21DCA050C();
  v11 = v8;
  if ((unint64_t)objc_msgSend_length(v7, v9, v10) <= 3)
  {
    v28 = [DTXDecompressionException alloc];
    v43 = CFSTR("compressionType");
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v29, v5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v30;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v31, (uint64_t)v44, &v43, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend_initWithName_reason_userInfo_(v28, v33, (uint64_t)CFSTR("DTXDecompressionException"), CFSTR("payload too small to contain block compression header"), v32);
    goto LABEL_8;
  }
  v12 = objc_retainAutorelease(v7);
  v15 = (unsigned int *)objc_msgSend_bytes(v12, v13, v14);
  v16 = objc_alloc(MEMORY[0x24BDBCEC8]);
  v18 = (void *)objc_msgSend_initWithLength_(v16, v17, *v15);
  v21 = objc_msgSend_length(v12, v19, v20) - 4;
  v22 = objc_retainAutorelease(v18);
  v25 = objc_msgSend_mutableBytes(v22, v23, v24);
  if ((objc_msgSend_uncompressBuffer_ofLength_toBuffer_withKnownUncompressedLength_usingCompressionType_(v11, v26, (uint64_t)(v15 + 1), v21, v25, *v15, v5) & 1) == 0)
  {
    v35 = [DTXDecompressionException alloc];
    v41[0] = CFSTR("compressionType");
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v36, v5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = CFSTR("uncompressedSize");
    v42[0] = v30;
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v37, *v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v32;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v38, (uint64_t)v42, v41, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend_initWithName_reason_userInfo_(v35, v40, (uint64_t)CFSTR("DTXDecompressionException"), CFSTR("block decompressor failed"), v39);

LABEL_8:
    objc_exception_throw(v34);
  }

  return v22;
}

- (id)_initWithReferencedSerializedForm:(id)a3 compressor:(id)a4 payloadSet:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  DTXMessage *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  unsigned int v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSData *payloadData;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v28.receiver = self;
  v28.super_class = (Class)DTXMessage;
  v11 = -[DTXMessage init](&v28, sel_init);
  if (v11)
  {
    v12 = objc_retainAutorelease(v8);
    v15 = (unsigned __int8 *)objc_msgSend_bytes(v12, v13, v14);
    v11->_deserialized = 1;
    v11->_cost = objc_msgSend_length(v12, v16, v17);
    v18 = *((unsigned int *)v15 + 1);
    v19 = *((_QWORD *)v15 + 1) - v18;
    v10[2](v10, (uint64_t)&v15[v18 + 16], v19);
    v11->_auxiliary = (void *)DTXPrimitiveDictionaryReferencingSerialized(v15 + 16, *((unsigned int *)v15 + 1));
    v22 = *v15;
    v11->_messageType = v22;
    v11->_status = v22 == 4;
    if (v22 == 7)
    {
      objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v20, (uint64_t)&v15[*((unsigned int *)v15 + 1) + 16], v19, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__decompressedData_compressor_compressionType_(v11, v24, (uint64_t)v23, v9, (*(_DWORD *)v15 >> 12) & 0xF0 | (*(_DWORD *)v15 >> 8) & 0xFu);
      v25 = objc_claimAutoreleasedReturnValue();
      payloadData = v11->_payloadData;
      v11->_payloadData = (NSData *)v25;

      if (!v11->_payloadData)
      {

        v11 = 0;
        goto LABEL_7;
      }
      v11->_messageType = 1;

    }
    objc_msgSend__makeImmutable(v11, v20, v21);
  }
LABEL_7:

  return v11;
}

- (DTXMessage)initWithSerializedForm:(id)a3 compressor:(id)a4
{
  id v7;
  id v8;
  NSData *serializedData;
  const char *v10;
  DTXMessage *v11;
  _QWORD v13[4];
  DTXMessage *v14;

  objc_storeStrong((id *)&self->_serializedData, a3);
  v7 = a3;
  v8 = a4;
  serializedData = self->_serializedData;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_21DC9BE40;
  v13[3] = &unk_24E1AB600;
  v14 = self;
  v11 = (DTXMessage *)objc_msgSend__initWithReferencedSerializedForm_compressor_payloadSet_(v14, v10, (uint64_t)serializedData, v8, v13);

  return v11;
}

- (DTXMessage)initWithSerializedForm:(const char *)a3 length:(unint64_t)a4 destructor:(id)a5 compressor:(id)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  const char *v16;
  NSData *v17;
  const char *v18;
  DTXMessage *v19;
  NSData *serializedData;
  NSData *v21;
  _QWORD v23[4];
  DTXMessage *v24;
  _QWORD v25[4];
  id v26;

  v10 = a5;
  v11 = (objc_class *)MEMORY[0x24BDBCE50];
  v12 = a6;
  v13 = [v11 alloc];
  v14 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_21DC9BF88;
  v25[3] = &unk_24E1AB478;
  v26 = v10;
  v15 = v10;
  v17 = (NSData *)objc_msgSend_initWithBytesNoCopy_length_deallocator_(v13, v16, (uint64_t)a3, a4, v25);
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = sub_21DC9BF9C;
  v23[3] = &unk_24E1AB600;
  v24 = self;
  v19 = (DTXMessage *)objc_msgSend__initWithReferencedSerializedForm_compressor_payloadSet_(v24, v18, (uint64_t)v17, v12, v23);

  serializedData = v19->_serializedData;
  v19->_serializedData = v17;
  v21 = v17;

  return v19;
}

- (void)serializedFormApply:(id)a3
{
  const char *v4;
  void (**v5)(id, _DWORD *, uint64_t);
  uint64_t Serialized;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int messageType;
  const char *v12;
  uint64_t v13;
  NSData *payloadData;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD v19[2];
  uint64_t v20;
  unsigned int v21;

  v5 = (void (**)(id, _DWORD *, uint64_t))a3;
  if (v5)
  {
    if (self->_messageType == 8)
    {
      objc_msgSend_serializedFormApply_(self->_payloadObject, v4, (uint64_t)v5);
    }
    else
    {
      v21 = 0;
      Serialized = DTXPrimitiveDictionaryGetSerialized((uint64_t)self->_auxiliary, &v21);
      v7 = v21;
      v10 = objc_msgSend_length(self->_payloadData, v8, v9);
      messageType = self->_messageType;
      if (messageType == 7)
        messageType = (self->_compressionType << 12) & 0xF0000 | ((self->_compressionType & 0xF) << 8) | 7;
      v19[0] = messageType;
      v19[1] = v21;
      v20 = v10 + v7;
      v5[2](v5, v19, 16);
      v13 = v21;
      if (v21)
        ((void (*)(void (**)(id, _DWORD *, uint64_t), uint64_t))v5[2])(v5, Serialized);
      payloadData = self->_payloadData;
      if (payloadData)
      {
        v15 = objc_msgSend_bytes(payloadData, v12, v13);
        v18 = objc_msgSend_length(self->_payloadData, v16, v17);
        ((void (**)(id, uint64_t, uint64_t))v5)[2](v5, v15, v18);
      }
    }
  }

}

- (unint64_t)serializedLength
{
  uint64_t v2;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  unsigned int v8;

  if (self->_messageType == 8)
    return objc_msgSend_serializedLength(self->_payloadObject, a2, v2);
  v8 = 0;
  DTXPrimitiveDictionaryGetSerialized((uint64_t)self->_auxiliary, &v8);
  v5 = v8;
  return v5 + objc_msgSend_length(self->_payloadData, v6, v7) + 16;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

- (unsigned)channelCode
{
  return self->_channelCode;
}

- (void)setChannelCode:(unsigned int)a3
{
  self->_channelCode = a3;
}

- (BOOL)expectsReply
{
  return self->_expectsReply;
}

- (void)setExpectsReply:(BOOL)a3
{
  self->_expectsReply = a3;
}

- (unsigned)conversationIndex
{
  return self->_conversationIndex;
}

- (void)setConversationIndex:(unsigned int)a3
{
  self->_conversationIndex = a3;
}

- (BOOL)deserialized
{
  return self->_deserialized;
}

- (unsigned)errorStatus
{
  return self->_status;
}

- (unint64_t)cost
{
  return self->_cost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryPromoted, 0);
  objc_storeStrong((id *)&self->_payloadObject, 0);
  objc_storeStrong((id *)&self->_serializedData, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
}

@end
