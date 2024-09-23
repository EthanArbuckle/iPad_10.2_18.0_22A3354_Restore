@implementation DTXChannel

- (DTXChannel)initWithConnection:(id)a3 channelIdentifier:(unsigned int)a4 label:(id)a5
{
  DTXConnection *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  DTXChannel *v14;
  DTXChannel *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  BOOL v22;
  const char *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *serialQueue;
  void *v32;
  const char *v33;
  objc_super v34;

  v10 = (DTXConnection *)a3;
  v13 = a5;
  if (!v10)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v11, v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, self, CFSTR("DTXConnection.m"), 1664, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  v34.receiver = self;
  v34.super_class = (Class)DTXChannel;
  v14 = -[DTXChannel init](&v34, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_channelCode = a4;
    objc_storeStrong((id *)&v14->_label, a5);
    if (v15->_channelCode)
      objc_storeStrong((id *)&v15->_strongConnection, a3);
    v15->_connection = v10;
    v18 = (void *)MEMORY[0x24BDD17C8];
    v19 = objc_msgSend_atomicConnectionNumber(v10, v16, v17);
    LODWORD(v21) = v15->_channelCode;
    v22 = (int)v21 < 0;
    if ((int)v21 >= 0)
      v21 = v21;
    else
      v21 = -(int)v21;
    v23 = "f";
    if (!v22)
      v23 = "";
    objc_msgSend_stringWithFormat_(v18, v20, (uint64_t)CFSTR("%s [x%d.c%d%s]"), "DTXChannel serializer queue", v19, v21, v23);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = (const char *)objc_msgSend_UTF8String(v24, v25, v26);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_queue_create(v27, v28);
    serialQueue = v15->_serialQueue;
    v15->_serialQueue = (OS_dispatch_queue *)v29;

    v15->_handlerGuard._os_unfair_lock_opaque = 0;
    v15->_compressionTypeHint = 1;
  }

  return v15;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  const char *Name;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  BOOL v11;
  const char *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  v8 = objc_msgSend_atomicConnectionNumber(self->_connection, v6, v7);
  LODWORD(v10) = self->_channelCode;
  v11 = (int)v10 < 0;
  if ((int)v10 >= 0)
    v10 = v10;
  else
    v10 = -(int)v10;
  v12 = "f";
  if (!v11)
    v12 = "";
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%s %p : x%d.c%d%s> \"%@\"), Name, self, v8, v10, v12, self->_label);
}

- (void)_scheduleBlock:(id)a3
{
  if (a3)
    dispatch_async((dispatch_queue_t)self->_serialQueue, a3);
}

- (void)_scheduleMessage:(id)a3 tracker:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  int v13;
  const char *v14;
  uint64_t v15;
  NSObject *serialQueue;
  DTXConnection *v17;
  DTXConnection *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  DTXConnection *v26;
  id v27;
  _QWORD block[5];

  v8 = a3;
  v9 = a4;
  v12 = a5;
  if (!v8)
    v8 = (id)kDTXInterruptionMessage;
  v13 = objc_msgSend_errorStatus(v8, v10, v11);
  if (v12 || v13 != 2)
  {
    if (objc_msgSend_isDispatch(v8, v14, v15))
    {
      v17 = self->_connection;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = sub_21DC93920;
      v24[3] = &unk_24E1AB178;
      v24[4] = self;
      v25 = v8;
      v26 = v17;
      v27 = v9;
      v18 = v17;
      v19 = (void *)MEMORY[0x22079E258](v24);

      if (!v19)
        goto LABEL_11;
    }
    else
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = sub_21DC93C54;
      v20[3] = &unk_24E1AB1A0;
      v20[4] = self;
      v23 = v12;
      v21 = v8;
      v22 = v9;
      v19 = (void *)MEMORY[0x22079E258](v20);

      if (!v19)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    dispatch_async((dispatch_queue_t)self->_serialQueue, v19);
    goto LABEL_11;
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC938E4;
  block[3] = &unk_24E1AAAC8;
  block[4] = self;
  dispatch_async(serialQueue, block);
LABEL_12:

}

- ($2AC1CA6B41BA5ED35C064565198F84D5)_callbackSnapshot
{
  $2AC1CA6B41BA5ED35C064565198F84D5 *result;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  _QWORD *(*v9)(_QWORD *, _QWORD *);
  void (*v10)(uint64_t);
  uint64_t v11;
  _OWORD v12[2];

  v6 = 0;
  v7 = &v6;
  v8 = 0x5012000000;
  v9 = sub_21DC93E5C;
  v10 = sub_21DC93E90;
  v11 = 1024;
  memset(v12, 0, sizeof(v12));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_21DC93F04;
  v5[3] = &unk_24E1AB1C8;
  v5[4] = &v6;
  sub_21DC93E98((os_unfair_lock_s *)self, v5);
  sub_21DC93BC4(retstr, (uint64_t)(v7 + 6));
  _Block_object_dispose(&v6, 8);
  sub_21DC93C1C((id *)v12);
  return result;
}

- (void)setMessageHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_21DC90F48;
  v14 = sub_21DC90F70;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_21DC94058;
  v7[3] = &unk_24E1AB1F0;
  v5 = v4;
  v7[4] = self;
  v8 = v5;
  v9 = &v10;
  sub_21DC93E98((os_unfair_lock_s *)self, v7);
  v6 = (void *)v11[5];
  v11[5] = 0;

  _Block_object_dispose(&v10, 8);
}

- (void)_setDispatchTarget:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_21DC8E814;
  v19 = sub_21DC8E824;
  v20 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_21DC94250;
  v11[3] = &unk_24E1AB218;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v14 = &v15;
  v9 = v7;
  v13 = v9;
  sub_21DC93E98((os_unfair_lock_s *)self, v11);
  v10 = (void *)v16[5];
  v16[5] = 0;

  _Block_object_dispose(&v15, 8);
}

- (void)setDispatchTarget:(id)a3
{
  objc_msgSend__setDispatchTarget_queue_(self, a2, (uint64_t)a3, 0);
}

- (void)_setDispatchValidator:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_21DC94354;
  v6[3] = &unk_24E1AB240;
  v7 = v4;
  v5 = v4;
  sub_21DC93E98((os_unfair_lock_s *)self, v6);

}

- (void)registerDisconnectHandler:(id)a3
{
  id v4;
  void *v5;
  DTXConnection *connection;
  uint64_t v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    connection = self->_connection;
    v7 = qword_253F42610;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_21DC94420;
    v9[3] = &unk_24E1AB268;
    v10 = v4;
    objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(connection, v8, v7, self, 2, 0, v9);

  }
}

- (void)cancel
{
  const char *v3;

  objc_msgSend__unregisterChannel_(self->_connection, a2, (uint64_t)self);
  objc_msgSend_setIsCanceled_(self, v3, 1);
}

- (void)suspend
{
  dispatch_suspend((dispatch_object_t)self->_serialQueue);
}

- (void)resume
{
  dispatch_resume((dispatch_object_t)self->_serialQueue);
}

- (void)sendControlAsync:(id)a3 replyHandler:(id)a4
{
  objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self->_connection, a2, (uint64_t)a3, self, 2, 0, a4);
}

- (void)sendControlSync:(id)a3 replyHandler:(id)a4
{
  const char *v7;
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if (!v8)
    sub_21DC944FC((uint64_t)self, a2);
  objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self->_connection, v7, (uint64_t)v9, self, 2, 1, v8);

}

- (BOOL)sendMessageAsync:(id)a3 replyHandler:(id)a4
{
  return objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self->_connection, a2, (uint64_t)a3, self, 0, 0, a4);
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
  sub_21DC94610(a3, self->_connection, self, 0, a4);
}

- (void)sendMessageSync:(id)a3 replyHandler:(id)a4
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (!v7)
    sub_21DC944FC((uint64_t)self, a2);
  sub_21DC94610(v8, self->_connection, self, 1, v7);

}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (unsigned)channelCode
{
  return self->_channelCode;
}

- (int)compressionTypeHint
{
  return self->_compressionTypeHint;
}

- (void)setCompressionTypeHint:(int)a3
{
  self->_compressionTypeHint = a3;
}

- (DTXConnection)_connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  sub_21DC93C1C((id *)&self->_channelGuarded.userDispatchQueue);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_strongConnection, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
