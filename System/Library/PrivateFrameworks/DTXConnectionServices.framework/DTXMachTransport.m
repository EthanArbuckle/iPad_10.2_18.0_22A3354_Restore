@implementation DTXMachTransport

+ (id)schemes
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], a2, (uint64_t)CFSTR("mach"), 0);
}

- (BOOL)_setupWithSendPort:(unsigned int)a3 receivePort:(unsigned int)a4 disconnectBlock:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  BOOL v8;
  BOOL v9;
  void *v10;
  id disconnectBlock;
  OS_dispatch_source *v12;
  OS_dispatch_source *listenSource;
  uint64_t v14;
  void *v15;
  void *v16;
  id inputReaderBlock;
  OS_dispatch_source *v18;
  OS_dispatch_source *deadPortSource;
  NSObject *v20;
  const char *v21;
  objc_class *v23;
  void *v24;
  void *v25;
  _QWORD handler[5];
  _QWORD v28[5];

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = a3 - 1 >= 0xFFFFFFFE || a4 - 1 >= 0xFFFFFFFE;
  v9 = !v8;
  if (v8)
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("-[%@ %@]: Invalid ports provided: %d, %d"), v24, v25, v6, v5);

  }
  else
  {
    self->_sendPort = a3;
    self->_receivePort = a4;
    v10 = (void *)MEMORY[0x22079E258](a5, a2);
    disconnectBlock = self->_disconnectBlock;
    self->_disconnectBlock = v10;

    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDAC9E0], self->_receivePort, 0, (dispatch_queue_t)self->_inputQueue);
    listenSource = self->_listenSource;
    self->_listenSource = v12;

    v14 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = sub_21DC885C0;
    v28[3] = &unk_24E1AAAC8;
    v28[4] = self;
    v15 = (void *)MEMORY[0x22079E258](v28);
    v16 = (void *)MEMORY[0x22079E258]();
    inputReaderBlock = self->_inputReaderBlock;
    self->_inputReaderBlock = v16;

    dispatch_source_set_event_handler((dispatch_source_t)self->_listenSource, self->_inputReaderBlock);
    dispatch_resume((dispatch_object_t)self->_listenSource);
    v18 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDAC9E8], self->_sendPort, 1uLL, (dispatch_queue_t)self->_inputQueue);
    deadPortSource = self->_deadPortSource;
    self->_deadPortSource = v18;

    v20 = self->_deadPortSource;
    handler[0] = v14;
    handler[1] = 3221225472;
    handler[2] = sub_21DC886E4;
    handler[3] = &unk_24E1AAAC8;
    handler[4] = self;
    dispatch_source_set_event_handler(v20, handler);
    dispatch_resume((dispatch_object_t)self->_deadPortSource);
    objc_msgSend_setStatus_(self, v21, 1);

  }
  return v9;
}

- (DTXMachTransport)init
{
  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  return self;
}

- (DTXMachTransport)initWithReceiveRight:(unsigned int)a3 sendRight:(unsigned int)a4 disconnectBlock:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void (**v8)(_QWORD);
  DTXMachTransport *v9;
  DTXMachTransport *v10;
  const char *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = (void (**)(_QWORD))a5;
  v13.receiver = self;
  v13.super_class = (Class)DTXMachTransport;
  v9 = -[DTXTransport init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    sub_21DC88814(v9);
    if ((objc_msgSend__setupWithSendPort_receivePort_disconnectBlock_(v10, v11, v5, v6, v8) & 1) == 0)
    {
      if (v8)
        v8[2](v8);

      v10 = 0;
    }
  }

  return v10;
}

- (DTXMachTransport)initWithRemoteAddress:(id)a3
{
  id v5;
  DTXMachTransport *v6;
  DTXMachTransport *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *p_sendPort;
  unsigned int *p_receivePort;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  unsigned int v26;
  unsigned int *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  pid_t v32;
  pid_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_class *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  BOOLean_t is_self;
  mach_msg_type_name_t v41;
  mach_port_t v42;
  ipc_space_t v43;
  mach_port_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOLean_t v47;
  uint64_t v48;
  objc_class *v49;
  void *v50;
  void *v51;
  char *v52;
  uint64_t v53;
  ipc_space_t v54;
  uint64_t v55;
  BOOLean_t v56;
  mach_msg_type_name_t v57;
  mach_port_t v58;
  ipc_space_t v59;
  mach_port_t v60;
  uint64_t v61;
  uint64_t inserted;
  BOOLean_t v63;
  int v64;
  uint64_t v65;
  objc_class *v66;
  void *v67;
  void *v68;
  char *v69;
  void (**v70)(_QWORD);
  const char *v71;
  BOOLean_t v72;
  BOOLean_t v73;
  pid_t v74;
  uint64_t v75;
  _QWORD v76[4];
  DTXMachTransport *v77;
  mach_port_name_t task;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  objc_super v83;
  mach_port_name_t name;
  mach_port_t poly[2];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v83.receiver = self;
  v83.super_class = (Class)DTXMachTransport;
  v6 = -[DTXTransport initWithRemoteAddress:](&v83, sel_initWithRemoteAddress_, v5);
  v7 = v6;
  if (v6)
  {
    sub_21DC88814(v6);
    objc_msgSend_host(v5, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_intValue(v10, v11, v12);

    p_sendPort = &v7->_sendPort;
    v7->_sendPort = 0;
    p_receivePort = &v7->_receivePort;
    v7->_receivePort = 0;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    objc_msgSend_pathComponents(v5, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v79, v86, 16);
    if (v20)
    {
      v23 = v20;
      v24 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v80 != v24)
            objc_enumerationMutation(v18);
          v26 = objc_msgSend_intValue(*(void **)(*((_QWORD *)&v79 + 1) + 8 * i), v21, v22);
          if (v26 - 1 <= 0xFFFFFFFD)
          {
            v27 = &v7->_sendPort;
            if (*p_sendPort + 1 < 2 || (v27 = &v7->_receivePort, *p_receivePort + 1 <= 1))
              *v27 = v26;
          }
        }
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v79, v86, 16);
      }
      while (v23);
    }

    if (*p_sendPort + 1 < 2 || *p_receivePort + 1 <= 1)
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("-[%@ %@]: Invalid ports in address: %@"), v29, v30, v5);

LABEL_16:
LABEL_17:
      v7 = 0;
      goto LABEL_18;
    }
    v32 = getpid();
    v33 = v32;
    v34 = *MEMORY[0x24BDAEC58];
    task = *MEMORY[0x24BDAEC58];
    if ((_DWORD)v13 == v32)
    {
      v74 = v32;
      v75 = v13;
      v35 = v34;
    }
    else
    {
      if (task_for_pid(v34, v13, &task))
      {
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("-[%@ %@]: Unable to connect to URL specifying ports in remote process' (%d) namespace: %@"), v37, v38, v13, v5);

        goto LABEL_16;
      }
      v74 = v33;
      v75 = v13;
      v35 = task;
      LODWORD(v34) = *MEMORY[0x24BDAEC58];
    }
    v39 = *p_receivePort;
    *p_receivePort = 0;
    *(_QWORD *)poly = 0;
    name = 0;
    is_self = mach_task_is_self(v35);
    if (is_self)
    {
      v72 = is_self;
      poly[1] = v39;
      v41 = 16;
    }
    else
    {
      v45 = MEMORY[0x22079DF88](v35, v39, 16, &poly[1], poly);
      if ((_DWORD)v45)
        goto LABEL_45;
      v72 = 0;
      v41 = poly[0];
    }
    if (mach_task_is_self(v34))
    {
      v42 = poly[1];
      name = poly[1];
      if (v41 - 19 > 0xFFFFFFFC)
      {
LABEL_36:
        *p_receivePort = v42;
        if (v42 - 1 <= 0xFFFFFFFD)
          goto LABEL_46;
        v45 = 5;
LABEL_45:
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = mach_error_string(v45);
        NSLog(CFSTR("-[%@ %@]: Unable to extract receive right from process %d: %s (%d)"), v50, v51, v75, v52, v45);

LABEL_46:
        v53 = task;
        v54 = *MEMORY[0x24BDAEC58];
        v55 = *p_sendPort;
        *p_sendPort = 0;
        *(_QWORD *)poly = 0;
        v56 = mach_task_is_self(v53);
        if (v56)
        {
          v73 = v56;
          poly[1] = v55;
          v57 = 17;
        }
        else
        {
          v61 = MEMORY[0x22079DF88](v53, v55, 17, &poly[1], poly);
          if ((_DWORD)v61)
            goto LABEL_68;
          v73 = 0;
          v57 = poly[0];
        }
        if (mach_task_is_self(v54))
        {
          v58 = poly[1];
          name = poly[1];
          if (v57 - 19 > 0xFFFFFFFC)
          {
LABEL_58:
            *p_sendPort = v58;
            if (v58 - 1 <= 0xFFFFFFFD)
            {
              v64 = v75;
LABEL_69:
              if (v64 != v74)
                mach_port_deallocate(*MEMORY[0x24BDAEC58], task);
              v76[0] = MEMORY[0x24BDAC760];
              v76[1] = 3221225472;
              v76[2] = sub_21DC88F4C;
              v76[3] = &unk_24E1AAAC8;
              v7 = v7;
              v77 = v7;
              v70 = (void (**)(_QWORD))MEMORY[0x22079E258](v76);
              if (objc_msgSend__setupWithSendPort_receivePort_disconnectBlock_(v7, v71, *p_sendPort, *p_receivePort, v70))
              {

                goto LABEL_18;
              }
              v70[2](v70);

              goto LABEL_17;
            }
            v61 = 5;
LABEL_68:
            v66 = (objc_class *)objc_opt_class();
            NSStringFromClass(v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = mach_error_string(v61);
            v64 = v75;
            NSLog(CFSTR("-[%@ %@]: Unable to extract send right from process %d: %s (%d)"), v67, v68, v75, v69, v61);

            goto LABEL_69;
          }
          v59 = v54;
          v60 = poly[1];
        }
        else
        {
          if ((_DWORD)v53 != v54)
          {
            while (1)
            {
              name = 0;
              v65 = mach_port_allocate(v54, 4u, &name);
              if ((_DWORD)v65)
                break;
              v65 = mach_port_deallocate(v54, name);
              if ((_DWORD)v65)
                break;
              inserted = mach_port_insert_right(v54, name, poly[1], v57);
              if ((inserted & 0xFFFFFFF7) != 5)
                goto LABEL_56;
            }
            v61 = v65;
            v63 = v73;
            goto LABEL_66;
          }
          name = v55;
          v60 = poly[1];
          v59 = v53;
          v58 = v55;
        }
        inserted = mach_port_insert_right(v59, v58, v60, v57);
LABEL_56:
        v61 = inserted;
        v63 = v73;
        if (!(_DWORD)inserted)
        {
          v58 = name;
          goto LABEL_58;
        }
LABEL_66:
        if (!v63)
          mach_port_mod_refs(*MEMORY[0x24BDAEC58], poly[1], poly[0], -1);
        goto LABEL_68;
      }
      v43 = v34;
      v44 = poly[1];
    }
    else
    {
      if ((_DWORD)v35 != (_DWORD)v34)
      {
        while (1)
        {
          name = 0;
          v48 = mach_port_allocate(v34, 4u, &name);
          if ((_DWORD)v48)
            break;
          v48 = mach_port_deallocate(v34, name);
          if ((_DWORD)v48)
            break;
          v46 = mach_port_insert_right(v34, name, poly[1], v41);
          if ((v46 & 0xFFFFFFF7) != 5)
            goto LABEL_34;
        }
        v45 = v48;
        v47 = v72;
        goto LABEL_43;
      }
      name = v39;
      v44 = poly[1];
      v43 = v34;
      v42 = v39;
    }
    v46 = mach_port_insert_right(v43, v42, v44, v41);
LABEL_34:
    v45 = v46;
    v47 = v72;
    if (!(_DWORD)v46)
    {
      v42 = name;
      goto LABEL_36;
    }
LABEL_43:
    if (!v47)
      mach_port_mod_refs(*MEMORY[0x24BDAEC58], poly[1], poly[0], -1);
    goto LABEL_45;
  }
LABEL_18:

  return v7;
}

- (DTXMachTransport)initWithXPCRepresentation:(id)a3
{
  id v4;
  DTXMachTransport *v5;
  DTXMachTransport *v6;
  DTXMachTransport *v7;
  void (**v8)(_QWORD);
  const char *v9;
  _QWORD v11[4];
  DTXMachTransport *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DTXMachTransport;
  v5 = -[DTXTransport initWithXPCRepresentation:](&v13, sel_initWithXPCRepresentation_, v4);
  v6 = v5;
  if (v5)
  {
    sub_21DC88814(v5);
    v6->_sendPort = xpc_dictionary_copy_mach_send();
    v6->_receivePort = xpc_dictionary_extract_mach_recv();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_21DC89104;
    v11[3] = &unk_24E1AAAC8;
    v7 = v6;
    v12 = v7;
    v8 = (void (**)(_QWORD))MEMORY[0x22079E258](v11);
    if ((objc_msgSend__setupWithSendPort_receivePort_disconnectBlock_(v7, v9, v6->_sendPort, v6->_receivePort, v8) & 1) == 0)
    {
      v8[2](v8);

      v7 = 0;
    }

    v6 = v7;
  }

  return v6;
}

- (id)serializedXPCRepresentation
{
  NSObject *outputQueue;
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
  v9 = sub_21DC8924C;
  v10 = sub_21DC8925C;
  v11 = 0;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_21DC89264;
  v5[3] = &unk_24E1AAA28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)dealloc
{
  DTXMachMessage *sendBuffer;
  objc_super v4;

  sendBuffer = self->_sendBuffer;
  if (sendBuffer)
  {
    free(sendBuffer);
    self->_sendBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DTXMachTransport;
  -[DTXTransport dealloc](&v4, sel_dealloc);
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  unint64_t v5;
  unint64_t v6;
  char *v7;
  unsigned int bufferedLength;
  unsigned int v9;
  DTXMachMessage *sendBuffer;
  mach_msg_header_t *v11;

  if (self->_sendPort + 1 >= 2)
  {
    v6 = a4;
    v7 = (char *)a3;
    v5 = 0;
    bufferedLength = self->_bufferedLength;
    do
    {
      if (v6 >= 32672 - (unint64_t)bufferedLength)
        v9 = 32672 - bufferedLength;
      else
        v9 = v6;
      memcpy(&self->_sendBuffer->var1[bufferedLength], v7, v9);
      bufferedLength = self->_bufferedLength + v9;
      self->_bufferedLength = bufferedLength;
      if (!v6 || bufferedLength == 32672)
      {
        sendBuffer = self->_sendBuffer;
        *(_QWORD *)&sendBuffer->var0.var0.var0 = 0;
        *(_QWORD *)&sendBuffer->var0.var0.var2 = 0;
        sendBuffer->var0.var1 = 0;
        *(_QWORD *)&sendBuffer->var0.var0.var4 = 0;
        v11 = (mach_msg_header_t *)self->_sendBuffer;
        v11->msgh_remote_port = self->_sendPort;
        v11->msgh_bits = 19;
        LODWORD(sendBuffer) = self->_bufferedLength;
        v11[1].msgh_bits = sendBuffer;
        if (mach_msg(v11, 1, ((_DWORD)sendBuffer + 35) & 0xFFFFFFF8, 0, 0, 0, 0))
          goto LABEL_3;
        bufferedLength = 0;
        self->_bufferedLength = 0;
      }
      v7 += v9;
      v5 += v9;
      v6 -= v9;
    }
    while (v6);
  }
  else
  {
    v5 = 0;
LABEL_3:
    objc_msgSend_disconnect(self, a2, (uint64_t)a3, a4);
  }
  return v5;
}

- (void)disconnect
{
  NSObject *listenSource;
  NSObject *inputQueue;
  uint64_t v5;
  NSObject *outputQueue;
  _QWORD v7[5];
  objc_super v8;
  _QWORD block[5];

  listenSource = self->_listenSource;
  if (listenSource)
    dispatch_source_cancel(listenSource);
  inputQueue = self->_inputQueue;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC895E4;
  block[3] = &unk_24E1AAAC8;
  block[4] = self;
  dispatch_sync(inputQueue, block);
  v8.receiver = self;
  v8.super_class = (Class)DTXMachTransport;
  -[DTXTransport disconnect](&v8, sel_disconnect);
  outputQueue = self->_outputQueue;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = sub_21DC89634;
  v7[3] = &unk_24E1AAAC8;
  v7[4] = self;
  dispatch_async(outputQueue, v7);
}

- (id)localAddresses
{
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = getpid();
  v4 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend_stringByAppendingFormat_(CFSTR("mach"), v5, (uint64_t)CFSTR("://%d/%d/%d"), v3, self->_receivePort, self->_sendPort);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(v4, v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, (uint64_t)v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)fileDescriptorHandshakeWithReceivePort:(unsigned int)a3
{
  uint64_t v5;
  _QWORD *v6;
  int v7;
  const char *v8;
  pid_t v9;
  const char *Name;
  void *v11;
  DTXFileDescriptorTransport *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  BOOL v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  _QWORD v29[2];
  uint64_t (*v30)(uint64_t, int, unsigned int *, _DWORD *);
  void *v31;
  uint64_t *v32;
  unsigned int *v33;
  int *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  int v39;
  int v40;
  _OWORD v41[16];
  _OWORD v42[16];
  int msg;
  const char *msg_4;
  __int16 msg_12;
  pid_t msg_14;
  __int16 msg_18;
  const char *msg_20;
  __int16 v49;
  int v50;
  _DWORD v51[193];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v27 = -1;
  v28 = -1;
  if (a3 - 1 >= 0xFFFFFFFE)
  {
    v7 = 1;
  }
  else
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v5 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v30 = sub_21DC8AA94;
    v31 = &unk_24E1AAB88;
    v32 = &v35;
    v33 = &v28;
    v34 = &v27;
    v6 = v29;
    bzero(&msg, 0x324uLL);
    if (mach_msg((mach_msg_header_t *)&msg, 2, 0, 0x324u, a3, 0, 0) || (_DWORD)msg_20 == 70)
    {
      LODWORD(v42[0]) = 0;
      LODWORD(v41[0]) = 4;
      ((void (*)(_QWORD *, _QWORD, _OWORD *, _OWORD *, _QWORD))v30)(v6, 0, v42, v41, 0);
    }
    else if (v51[191] + (_DWORD)msg_4 == 804 && (HIDWORD(msg_20) - 65) > 0xFFFFFFBF)
    {
      v15 = 0;
      v16 = msg;
      memset(v42, 0, sizeof(v42));
      v17 = 4 * HIDWORD(msg_20);
      v18 = v51;
      v19 = v51;
      memset(v41, 0, sizeof(v41));
      while (1)
      {
        v21 = *v19;
        v19 += 3;
        v20 = v21;
        if (HIBYTE(v21))
          break;
        v22 = v20 - 1441792;
        v23 = v20 & 0xFF0000;
        v24 = v22 >= 0xFFFB0000 || v23 == 0x100000;
        if (v24 && (v16 & 0x80000000) == 0)
          break;
        v25 = 4 * (v22 < 0xFFFB0000);
        if (v23 == 0x100000)
          v25 = 1;
        *(_DWORD *)((char *)v42 + v15) = *(v18 - 2);
        if (v16 >= 0)
          v26 = 6;
        else
          v26 = v25;
        *(_DWORD *)((char *)v41 + v15) = v26;
        v15 += 4;
        v18 = v19;
        if (v17 == v15)
          goto LABEL_31;
      }
      v39 = 4;
      v40 = 0;
LABEL_31:
      ((void (*)(_QWORD *))v30)(v6);
      mach_msg_destroy((mach_msg_header_t *)&msg);
    }
    else
    {
      LODWORD(v42[0]) = 0;
      LODWORD(v41[0]) = 4;
      ((void (*)(_QWORD *, _QWORD, _OWORD *, _OWORD *, _QWORD))v30)(v6, 0, v42, v41, 0);
      mach_msg_destroy((mach_msg_header_t *)&msg);
    }

    v7 = *((_DWORD *)v36 + 6);
    _Block_object_dispose(&v35, 8);
    if (!v7)
    {
      v13 = [DTXFileDescriptorTransport alloc];
      v11 = (void *)objc_msgSend_initWithIncomingFileDescriptor_outgoingFileDescriptor_disconnectBlock_(v13, v14, v28, v5, 3221225472, sub_21DC89B98, &unk_24E1AAAE8, __PAIR64__(v27, v28));
      return v11;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v8 = getprogname();
    v9 = getpid();
    Name = sel_getName(a2);
    msg = 136315906;
    msg_4 = v8;
    msg_12 = 1024;
    msg_14 = v9;
    msg_18 = 2082;
    msg_20 = Name;
    v49 = 1024;
    v50 = v7;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s(%d) [error]: '%{public}s' failed: (%d)\n", (uint8_t *)&msg, 0x22u);
  }
  v11 = 0;
  return v11;
}

+ (id)fileDescriptorHandshakeWithSendPort:(unsigned int)a3
{
  int v4;
  ipc_space_t *v5;
  const char *v6;
  pid_t v7;
  const char *v8;
  mach_port_name_t name[2];
  int v11[2];
  int v12[2];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  pid_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3 - 1 >= 0xFFFFFFFE)
  {
    v4 = 1;
    goto LABEL_19;
  }
  *(_QWORD *)v11 = -1;
  *(_QWORD *)v12 = -1;
  if (pipe(v11) || pipe(v12))
  {
    *(_QWORD *)name = 0;
    v4 = 6;
LABEL_5:
    if ((v11[0] & 0x80000000) == 0)
      close(v11[0]);
    goto LABEL_7;
  }
  *(_QWORD *)name = 0;
  if (!fileport_makeport())
    fileport_makeport();
  v4 = 15;
  if ((v11[0] & 0x80000000) == 0)
  {
    if (fcntl(v11[0], 2, 1) == -1 || v11[1] < 0 || fcntl(v11[1], 2, 1) == -1)
      v4 = 29;
    goto LABEL_5;
  }
  v4 = 29;
LABEL_7:
  if ((v11[1] & 0x80000000) == 0)
    close(v11[1]);
  if ((v12[0] & 0x80000000) == 0)
    close(v12[0]);
  if ((v12[1] & 0x80000000) == 0)
    close(v12[1]);
  v5 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  if (name[1] - 1 <= 0xFFFFFFFD)
    mach_port_deallocate(*MEMORY[0x24BDAEC58], name[1]);
  if (name[0] - 1 <= 0xFFFFFFFD)
    mach_port_deallocate(*v5, name[0]);
LABEL_19:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v6 = getprogname();
    v7 = getpid();
    v8 = sel_getName(a2);
    *(_DWORD *)buf = 136315906;
    v14 = v6;
    v15 = 1024;
    v16 = v7;
    v17 = 2082;
    v18 = v8;
    v19 = 1024;
    v20 = v4;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s(%d) [error]: '%{public}s' failed: (%d)\n", buf, 0x22u);
  }
  return 0;
}

+ (id)_legacyFileDescriptorHandshakeWithReceivePort:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  DTXFileDescriptorTransport *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  int v10;
  _QWORD v12[5];
  int v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v3 = MEMORY[0x24BDAC760];
  v18 = -1;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_21DC8A2AC;
  v14[3] = &unk_24E1AAB10;
  v14[4] = &v15;
  v4 = sub_21DC8A0DC(a3, v14);
  v5 = v4;
  if ((v4 & 0x80000000) == 0)
  {
    if ((v16[3] & 0x80000000) == 0)
    {
      v6 = [DTXFileDescriptorTransport alloc];
      v7 = *((unsigned int *)v16 + 6);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = sub_21DC8A56C;
      v12[3] = &unk_24E1AAB38;
      v12[4] = &v15;
      v13 = v5;
      v9 = (void *)objc_msgSend_initWithIncomingFileDescriptor_outgoingFileDescriptor_disconnectBlock_(v6, v8, v7, v5, v12);
      goto LABEL_8;
    }
    close(v4);
  }
  v10 = *((_DWORD *)v16 + 6);
  if ((v10 & 0x80000000) == 0)
    close(v10);
  v9 = 0;
LABEL_8:
  _Block_object_dispose(&v15, 8);
  return v9;
}

+ (id)_legacyFileDescriptorHandshakeWithSendPort:(unsigned int)a3
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  ipc_space_t *v8;
  mach_error_t v9;
  NSObject *v10;
  id v11;
  const char *v12;
  pid_t v13;
  char *v14;
  mach_error_t inserted;
  NSObject *v16;
  id v17;
  const char *v18;
  pid_t v19;
  char *v20;
  uint64_t v21;
  void (**v22)(_QWORD);
  id v23;
  _QWORD v25[5];
  unsigned int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[2];
  void (*v34)(uint64_t, uint64_t, void *);
  void *v35;
  id v36;
  unsigned int v37;
  mach_port_name_t name[2];
  mach_port_name_t *v39;
  uint64_t v40;
  char v41;
  _BYTE buf[40];
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_21DC8924C;
  v31 = sub_21DC8925C;
  v32 = 0;
  v4 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_21DC8A910;
  v25[3] = &unk_24E1AAB60;
  v26 = a3;
  v25[4] = &v27;
  v5 = v25;
  v33[0] = v4;
  v33[1] = 3221225472;
  v34 = sub_21DC8AC24;
  v35 = &unk_24E1AABD8;
  v37 = a3;
  v6 = v5;
  v36 = v6;
  v7 = v33;
  name[0] = 0;
  v8 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  v9 = mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, name);
  if (v9)
  {
    v10 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = getprogname();
      v13 = getpid();
      v14 = mach_error_string(v9);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v13;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v14;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v9;
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_allocate' failed: %s (%d)\n", buf, 0x22u);
    }

  }
  inserted = mach_port_insert_right(*v8, name[0], name[0], 0x14u);
  if (inserted)
  {
    v16 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = getprogname();
      v19 = getpid();
      v20 = mach_error_string(inserted);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v19;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v20;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = inserted;
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_insert_right' failed: %s (%d)\n", buf, 0x22u);
    }

  }
  v21 = name[0];
  *(_QWORD *)name = 0;
  v39 = name;
  v40 = 0x2020000000;
  v41 = 0;
  *(_QWORD *)buf = v4;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = sub_21DC8ACD4;
  *(_QWORD *)&buf[24] = &unk_24E1AAB38;
  *(_QWORD *)&buf[32] = name;
  v43 = v21;
  v22 = (void (**)(_QWORD))MEMORY[0x22079E258](buf);
  v34((uint64_t)v7, v21, v22);
  v22[2](v22);

  _Block_object_dispose(name, 8);
  v23 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disconnectBlock, 0);
  objc_storeStrong(&self->_inputReaderBlock, 0);
  objc_storeStrong((id *)&self->_deadPortSource, 0);
  objc_storeStrong((id *)&self->_listenSource, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_inputQueue, 0);
}

@end
