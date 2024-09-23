@implementation HAP2CoAPClient

- (HAP2CoAPClient)initWithSocketAddress:(const sockaddr *)a3 withAccessoryName:(id)a4 maxTransmitAttempts:(unint64_t)a5 initialACKTimeout:(double)a6
{
  if (self)
    return (HAP2CoAPClient *)-[HAP2CoAPClient initWithSocketAddress:withAccessoryName:workQueue:maxTransmitAttempts:initialACKTimeout:](self, &a3->sa_len, a4, 0, a5, a6);
  return self;
}

- (HAP2CoAPClient)initWithSocketAddress:(const sockaddr *)a3
{
  return -[HAP2CoAPClient initWithSocketAddress:withAccessoryName:maxTransmitAttempts:initialACKTimeout:](self, "initWithSocketAddress:withAccessoryName:maxTransmitAttempts:initialACKTimeout:", a3, 0, 0, 0.0);
}

- (HAP2CoAPClient)initWithIPAddress:(id)a3 port:(unsigned __int16)a4 maxTransmitAttempts:(unint64_t)a5 initialACKTimeout:(double)a6 workQueue:(id)a7
{
  return (HAP2CoAPClient *)-[HAP2CoAPClient _initWithIPAddress:port:maxTransmitAttempts:initialACKTimeout:workQueue:]((char *)self, a3, a4, a5, a7, a6);
}

- (HAP2CoAPClient)initWithIPAddress:(id)a3 port:(unsigned __int16)a4 maxTransmitAttempts:(unint64_t)a5 initialACKTimeout:(double)a6
{
  return (HAP2CoAPClient *)-[HAP2CoAPClient _initWithIPAddress:port:maxTransmitAttempts:initialACKTimeout:workQueue:]((char *)self, a3, a4, a5, 0, a6);
}

- (HAP2CoAPClient)initWithIPAddress:(id)a3 port:(unsigned __int16)a4
{
  return -[HAP2CoAPClient initWithIPAddress:port:maxTransmitAttempts:initialACKTimeout:](self, "initWithIPAddress:port:maxTransmitAttempts:initialACKTimeout:", a3, a4, 0, 0.0);
}

- (HAP2CoAPClient)initWithIPAddress:(id)a3
{
  return -[HAP2CoAPClient initWithIPAddress:port:](self, "initWithIPAddress:port:", a3, 0);
}

- (HAP2CoAPClientDelegate)delegate
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12987;
  v12 = __Block_byref_object_dispose__12988;
  v13 = 0;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__HAP2CoAPClient_delegate__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (HAP2CoAPClientDelegate *)v5;
}

- (void)setDelegate:(id)a3
{
  id v4;
  HAP2PropertyLock *propertyLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__HAP2CoAPClient_setDelegate___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HAP2PropertyLock performWritingBlock:](propertyLock, "performWritingBlock:", v7);

}

- (BOOL)connected
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v11 = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__HAP2CoAPClient_connected__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setConnected:(BOOL)a3
{
  HAP2PropertyLock *propertyLock;
  _QWORD v4[5];
  BOOL v5;

  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__HAP2CoAPClient_setConnected___block_invoke;
  v4[3] = &unk_1E894D770;
  v4[4] = self;
  v5 = a3;
  -[HAP2PropertyLock performWritingBlock:](propertyLock, "performWritingBlock:", v4);
}

- (unint64_t)maxTransmitAttempts
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v11 = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__HAP2CoAPClient_maxTransmitAttempts__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setMaxTransmitAttempts:(unint64_t)a3
{
  HAP2CoAPClient *v4;

  v4 = self;
  if (self)
    self = (HAP2CoAPClient *)self->_propertyLock;
  -[HAP2CoAPClient assertOwner](self, "assertOwner");
  v4->_maxTransmitAttempts = a3;
}

- (double)initialACKTimeout
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v11 = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__HAP2CoAPClient_initialACKTimeout__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setInitialACKTimeout:(double)a3
{
  HAP2CoAPClient *v4;

  v4 = self;
  if (self)
    self = (HAP2CoAPClient *)self->_propertyLock;
  -[HAP2CoAPClient assertOwner](self, "assertOwner");
  v4->_initialACKTimeout = a3;
}

- (void)openWithCompletion:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *workQueue;
  id v11;
  _QWORD block[4];
  id v13;
  HAP2CoAPClient *v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ Open"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v8);
  v16 = v9;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HAP2CoAPClient_openWithCompletion___block_invoke;
  block[3] = &unk_1E894D9E8;
  v13 = v9;
  v14 = self;
  v15 = v4;
  v11 = v4;
  dispatch_async(workQueue, block);

  __HMFActivityScopeLeave();
}

- (void)sendRequestWithMethod:(unsigned __int8)a3 path:(id)a4 payload:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *workQueue;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  HAP2CoAPClient *v24;
  id v25;
  id v26;
  id v27;
  unsigned __int8 v28;
  id v29;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ Send Request"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v16);
  v29 = v17;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HAP2CoAPClient_sendRequestWithMethod_path_payload_completion___block_invoke;
  block[3] = &unk_1E894D590;
  v23 = v17;
  v24 = self;
  v28 = a3;
  v25 = v10;
  v26 = v11;
  v27 = v12;
  v19 = v12;
  v20 = v11;
  v21 = v10;
  dispatch_async(workQueue, block);

  __HMFActivityScopeLeave();
}

- (void)alterMaxTransmitAttempts:(unint64_t)a3 initialACKTimeout:(double)a4
{
  HAP2CoAPClient *v4;
  double v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *workQueue;
  _QWORD v9[7];
  _QWORD v10[7];

  v4 = self;
  if (fabs(a4) >= 2.22044605e-16)
    v5 = a4;
  else
    v5 = 1.428;
  if (a3)
    v6 = a3;
  else
    v6 = 3;
  if (self)
    self = (HAP2CoAPClient *)self->_propertyLock;
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__HAP2CoAPClient_alterMaxTransmitAttempts_initialACKTimeout___block_invoke;
  v10[3] = &unk_1E894BB68;
  v10[4] = v4;
  v10[5] = v6;
  *(double *)&v10[6] = v5;
  -[HAP2CoAPClient performWritingBlock:](self, "performWritingBlock:", v10);
  if (v4)
    workQueue = v4->_workQueue;
  else
    workQueue = 0;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __61__HAP2CoAPClient_alterMaxTransmitAttempts_initialACKTimeout___block_invoke_2;
  v9[3] = &unk_1E894BB68;
  v9[4] = v4;
  v9[5] = v6;
  *(double *)&v9[6] = v5;
  dispatch_async(workQueue, v9);
}

- (void)closeWithError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *workQueue;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  HAP2CoAPClient *v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ Close"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v11);
  v21 = v12;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HAP2CoAPClient_closeWithError_completion___block_invoke;
  block[3] = &unk_1E894D6D0;
  v17 = v12;
  v18 = self;
  v19 = v6;
  v20 = v7;
  v14 = v7;
  v15 = v6;
  dispatch_async(workQueue, block);

  __HMFActivityScopeLeave();
}

- (coap_session_t)shouldOpenSessionWithContext:(coap_context_t *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  coap_address_t *p_address;
  char *session;
  char *v11;
  int sa_family;
  _BOOL4 v13;
  int v14;
  int *v15;
  char *v16;
  char *v17;
  int *v18;
  int *v19;
  char *v20;
  socklen_t v21;
  int v22;
  int *v23;
  char *v24;
  _OWORD *v25;
  size_t v26;
  int *v27;
  char *v28;
  __int16 v29;
  int *v30;
  char *v31;
  int *v32;
  char *v33;
  int v34;
  NSObject *v35;
  void *v36;
  NSObject *workQueue;
  id v38;
  unsigned int v40;
  __int16 v41;
  int v42;
  unsigned int v43;
  uint64_t v44;
  int v45;
  unsigned int v46;
  unsigned int v47;
  int v48;
  unsigned int v49;
  unsigned int v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  int v57;
  unsigned int v58;
  unsigned int v59;
  int v60;
  unsigned int v61;
  int32x2_t **v62;
  coap_session_t *var7;
  UT_hash_table *var0;
  uint64_t v65;
  UT_hash_table *v66;
  coap_session_t *v67;
  UT_hash_table *v68;
  _OWORD *v69;
  uint64_t v70;
  uint64_t v71;
  int32x2_t ***v72;
  unsigned int v73;
  int32x2_t **v74;
  _DWORD *v75;
  _DWORD *v76;
  int32x2_t *v77;
  unsigned __int32 v78;
  uint64_t v79;
  unsigned int v80;
  unsigned int v81;
  _QWORD *v82;
  int v83;
  uint64_t i;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  unsigned int v89;
  uint64_t v90;
  int32x2_t *v91;
  int32x2_t v92;
  int32x2_t v93;
  unsigned int v94;
  int v95;
  char v96;
  NSObject *v97;
  double v98;
  void *v99;
  int v100;
  int v101;
  _BYTE block[32];
  id v103;
  HAP2CoAPClient *v104;
  id v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ Open Session"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v8);
  p_address = &self->_address;
  session = coap_make_session(1, 1, 0, 0, &self->_address.size, 0, (uint64_t)a3, 0);
  v11 = session;
  if (!session)
    goto LABEL_55;
  ++*((_DWORD *)session + 1);
  v100 = 0;
  v101 = 1;
  sa_family = self->_address.addr.sa.sa_family;
  if (sa_family == 30)
  {
    v13 = self->_address.addr.sin6.sin6_addr.__u6_addr8[0] == 255;
    memset(&block[4], 0, 24);
    *(_DWORD *)block = p_address->size;
    block[5] = 30;
    *(in6_addr *)&block[12] = self->_address.addr.sin6.sin6_addr;
    *(_WORD *)&block[6] = self->_address.addr.sin.sin_port;
    *(_DWORD *)&block[28] = self->_address.addr.sin6.sin6_scope_id;
  }
  else if (sa_family == 2)
  {
    v13 = (self->_address.addr.sin.sin_addr.s_addr & 0xF0) == 224;
    memset(&block[4], 0, 28);
    *(_DWORD *)block = p_address->size;
    *(sockaddr *)&block[4] = self->_address.addr.sa;
  }
  else
  {
    memset(&block[4], 0, 28);
    *(_DWORD *)block = p_address->size;
    __memcpy_chk();
    v13 = 0;
  }
  *((_WORD *)v11 + 90) &= 0xEFFBu;
  v14 = socket(block[5], 2, 0);
  *((_DWORD *)v11 + 44) = v14;
  if (v14 == -1)
  {
    if (maxlog <= 3)
    {
LABEL_54:
      *((_WORD *)v11 + 90) = 0;
LABEL_55:
      coap_session_release((uint64_t)v11);
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v35 = hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)block = 138412290;
        *(_QWORD *)&block[4] = self;
        _os_log_error_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_ERROR, "%@ Failed to create coap session", block, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      goto LABEL_60;
    }
    v17 = "coap_socket_connect_udp: socket: %s\n";
    goto LABEL_51;
  }
  if (ioctl(v14, 0x8004667EuLL, &v101) == -1 && maxlog >= 4)
  {
    v15 = __error();
    v16 = strerror(*v15);
    coap_log_impl(4, "coap_socket_connect_udp: ioctl FIONBIO: %s\n", v16);
  }
  if (block[5] == 30)
  {
    if (!*(_WORD *)&block[6])
      *(_WORD *)&block[6] = 13078;
    if (setsockopt(*((_DWORD *)v11 + 44), 41, 27, &v100, 4u) == -1 && maxlog >= 4)
    {
      v18 = __error();
      strerror(*v18);
      coap_log_impl(4, "coap_socket_connect_udp: setsockopt IPV6_V6ONLY: %s\n");
    }
  }
  else if (block[5] == 2)
  {
    if (!*(_WORD *)&block[6])
      *(_WORD *)&block[6] = 13078;
  }
  else if (maxlog >= 1)
  {
    coap_log_impl(1, "coap_socket_connect_udp: unsupported sa_family\n");
  }
  if (v11[21])
  {
    if (setsockopt(*((_DWORD *)v11 + 44), 0xFFFF, 4, &v101, 4u) == -1 && maxlog >= 4)
    {
      v19 = __error();
      v20 = strerror(*v19);
      coap_log_impl(4, "coap_socket_connect_udp: setsockopt SO_REUSEADDR: %s\n", v20);
    }
    v21 = v11[21] == 2 ? 16 : *((_DWORD *)v11 + 4);
    if (bind(*((_DWORD *)v11 + 44), (const sockaddr *)(v11 + 20), v21) == -1)
    {
      if (maxlog <= 3)
        goto LABEL_52;
      v17 = "coap_socket_connect_udp: bind: %s\n";
      goto LABEL_51;
    }
  }
  v22 = *((_DWORD *)v11 + 44);
  if (v13)
  {
    if (getsockname(v22, (sockaddr *)(v11 + 140), (socklen_t *)v11 + 34) == -1 && maxlog >= 4)
    {
      v23 = __error();
      v24 = strerror(*v23);
      coap_log_impl(4, "coap_socket_connect_udp: getsockname for multicast socket: %s\n", v24);
    }
    *(_QWORD *)(v11 + 108) = 0;
    v25 = v11 + 108;
    *((_DWORD *)v11 + 33) = 0;
    *(_QWORD *)(v11 + 116) = 0;
    *(_QWORD *)(v11 + 124) = 0;
    v26 = *(unsigned int *)block;
    *((_DWORD *)v11 + 26) = *(_DWORD *)block;
    if (block[5] == 2)
    {
      *v25 = *(_OWORD *)&block[4];
    }
    else if (block[5] == 30)
    {
      v11[109] = 30;
      *(_OWORD *)(v11 + 116) = *(_OWORD *)&block[12];
      *((_WORD *)v11 + 55) = *(_WORD *)&block[6];
      *((_DWORD *)v11 + 33) = *(_DWORD *)&block[28];
    }
    else
    {
      memcpy(v25, &block[4], v26);
    }
    v29 = 4096;
    goto LABEL_65;
  }
  if (connect(v22, (const sockaddr *)&block[4], *(socklen_t *)block) == -1)
  {
    if (maxlog <= 3)
      goto LABEL_52;
    v17 = "coap_socket_connect_udp: connect: %s\n";
LABEL_51:
    v32 = __error();
    v33 = strerror(*v32);
    coap_log_impl(4, v17, v33);
LABEL_52:
    v34 = *((_DWORD *)v11 + 44);
    if (v34 != -1)
    {
      *((_QWORD *)v11 + 23) = 0;
      *((_QWORD *)v11 + 24) = 0;
      close(v34);
      *((_DWORD *)v11 + 44) = -1;
    }
    goto LABEL_54;
  }
  if (getsockname(*((_DWORD *)v11 + 44), (sockaddr *)(v11 + 140), (socklen_t *)v11 + 34) == -1 && maxlog >= 4)
  {
    v27 = __error();
    v28 = strerror(*v27);
    coap_log_impl(4, "coap_socket_connect_udp: getsockname: %s\n", v28);
  }
  v29 = 4;
  if (getpeername(*((_DWORD *)v11 + 44), (sockaddr *)(v11 + 108), (socklen_t *)v11 + 26) == -1 && maxlog >= 4)
  {
    v30 = __error();
    v31 = strerror(*v30);
    coap_log_impl(4, "coap_socket_connect_udp: getpeername: %s\n", v31);
  }
LABEL_65:
  v40 = -1640531527;
  v41 = *((_WORD *)v11 + 90) | v29 | 0x11;
  *((_QWORD *)v11 + 23) = v11;
  *((_WORD *)v11 + 90) = v41;
  v42 = -17973521;
  v43 = 64;
  v44 = 104;
  v45 = -1640531527;
  do
  {
    v46 = *(_DWORD *)&v11[v44 + 4] + v40;
    v47 = *(_DWORD *)&v11[v44 + 8] + v42;
    v48 = (*(_DWORD *)&v11[v44] + v45 - (v46 + v47)) ^ (v47 >> 13);
    v49 = (v46 - v47 - v48) ^ (v48 << 8);
    v50 = (v47 - v48 - v49) ^ (v49 >> 13);
    v51 = (v48 - v49 - v50) ^ (v50 >> 12);
    v52 = (v49 - v50 - v51) ^ (v51 << 16);
    v53 = (v50 - v51 - v52) ^ (v52 >> 5);
    v45 = (v51 - v52 - v53) ^ (v53 >> 3);
    v40 = (v52 - v53 - v45) ^ (v45 << 10);
    v42 = (v53 - v45 - v40) ^ (v40 >> 15);
    v43 -= 12;
    v44 += 12;
  }
  while (v43 > 0xB);
  v54 = (v45
       + (v11[167] << 24)
       + (v11[166] << 16)
       + (v11[165] << 8)
       + v11[164]
       + -64
       - v42
       - v40) ^ ((v42 + 64) >> 13);
  v55 = (v40 + -64 - v42 - v54) ^ (v54 << 8);
  v56 = (v42 + 64 - v54 - v55) ^ (v55 >> 13);
  v57 = (v54 - v55 - v56) ^ (v56 >> 12);
  v58 = (v55 - v56 - v57) ^ (v57 << 16);
  v59 = (v56 - v57 - v58) ^ (v58 >> 5);
  v60 = (v57 - v58 - v59) ^ (v59 >> 3);
  v61 = (v59 - v60 - ((v58 - v59 - v60) ^ (v60 << 10))) ^ (((v58 - v59 - v60) ^ (v60 << 10)) >> 15);
  v62 = (int32x2_t **)(v11 + 48);
  *((_QWORD *)v11 + 11) = v11 + 104;
  *((_DWORD *)v11 + 24) = 64;
  *((_DWORD *)v11 + 25) = v61;
  var7 = a3->var7;
  if (var7)
  {
    *((_QWORD *)v11 + 6) = var7->var7.var0;
    *((_QWORD *)v11 + 8) = 0;
    var0 = var7->var7.var0;
    v65 = *((_QWORD *)var0 + 3);
    *((_QWORD *)v11 + 7) = v65 - *((_QWORD *)var0 + 4);
    *(_QWORD *)(v65 + 16) = v11;
    *((_QWORD *)var0 + 3) = v62;
  }
  else
  {
    *((_QWORD *)v11 + 7) = 0;
    *((_QWORD *)v11 + 8) = 0;
    a3->var7 = (coap_session_t *)v11;
    v66 = (UT_hash_table *)malloc_type_malloc(0x40uLL, 0x10200405F856B24uLL);
    a3->var7->var7.var0 = v66;
    if (!v66)
      goto LABEL_116;
    *((_OWORD *)v66 + 2) = 0u;
    *((_OWORD *)v66 + 3) = 0u;
    *(_OWORD *)v66 = 0u;
    *((_OWORD *)v66 + 1) = 0u;
    v67 = a3->var7;
    v68 = v67->var7.var0;
    *((_QWORD *)v68 + 1) = 0x500000020;
    *((_QWORD *)v68 + 3) = &v67->var7;
    *((_QWORD *)v68 + 4) = 48;
    v69 = malloc_type_malloc(0x200uLL, 0x1020040EDED9539uLL);
    *(_QWORD *)a3->var7->var7.var0 = v69;
    if (!v69)
      goto LABEL_116;
    v69[30] = 0u;
    v69[31] = 0u;
    v69[28] = 0u;
    v69[29] = 0u;
    v69[26] = 0u;
    v69[27] = 0u;
    v69[24] = 0u;
    v69[25] = 0u;
    v69[22] = 0u;
    v69[23] = 0u;
    v69[20] = 0u;
    v69[21] = 0u;
    v69[18] = 0u;
    v69[19] = 0u;
    v69[16] = 0u;
    v69[17] = 0u;
    v69[14] = 0u;
    v69[15] = 0u;
    v69[12] = 0u;
    v69[13] = 0u;
    v69[10] = 0u;
    v69[11] = 0u;
    v69[8] = 0u;
    v69[9] = 0u;
    v69[6] = 0u;
    v69[7] = 0u;
    v69[4] = 0u;
    v69[5] = 0u;
    v69[2] = 0u;
    v69[3] = 0u;
    *v69 = 0u;
    v69[1] = 0u;
    var0 = a3->var7->var7.var0;
    *((_DWORD *)var0 + 14) = -1609490463;
  }
  ++*((_DWORD *)var0 + 4);
  v70 = (*((_DWORD *)var0 + 2) - 1) & v61;
  v71 = *(_QWORD *)var0;
  v72 = (int32x2_t ***)(v71 + 16 * v70);
  v73 = *((_DWORD *)v72 + 2) + 1;
  *((_DWORD *)v72 + 2) = v73;
  v74 = *v72;
  *((_QWORD *)v11 + 9) = 0;
  *((_QWORD *)v11 + 10) = v74;
  if (v74)
    v74[3] = (int32x2_t *)v62;
  *v72 = v62;
  if (v73 >= 10 * *(_DWORD *)(v71 + 16 * v70 + 12) + 10 && !(*v62)[6].i32[1])
  {
    v75 = malloc_type_malloc(32 * (*v62)[1].u32[0], 0x1020040EDED9539uLL);
    if (v75)
    {
      v76 = v75;
      bzero(v75, 32 * (*v62)[1].u32[0]);
      v77 = *v62;
      v78 = (*v62)[2].u32[0];
      v79 = (*v62)[1].u32[0];
      v80 = 2 * v79 - 1;
      if ((v80 & v78) != 0)
        v81 = (v78 >> ((*v62)[1].i32[1] + 1)) + 1;
      else
        v81 = v78 >> ((*v62)[1].i32[1] + 1);
      v77[5].i32[0] = v81;
      v77[5].i32[1] = 0;
      v82 = (_QWORD *)*v77;
      if ((_DWORD)v79)
      {
        v83 = 0;
        for (i = 0; i != v79; ++i)
        {
          v85 = v82[2 * i];
          if (v85)
          {
            do
            {
              v86 = *(_QWORD *)(v85 + 32);
              v87 = *(_DWORD *)(v85 + 52) & v80;
              v88 = (char *)&v76[4 * v87];
              v89 = *((_DWORD *)v88 + 2) + 1;
              *((_DWORD *)v88 + 2) = v89;
              if (v89 > v81)
              {
                v77[5].i32[1] = ++v83;
                v76[4 * v87 + 3] = v89 / v81;
              }
              *(_QWORD *)(v85 + 24) = 0;
              v90 = *(_QWORD *)v88;
              *(_QWORD *)(v85 + 32) = *(_QWORD *)v88;
              if (v90)
                *(_QWORD *)(v90 + 24) = v85;
              *(_QWORD *)v88 = v85;
              v85 = v86;
            }
            while (v86);
          }
        }
      }
      free(v82);
      v91 = *v62;
      v92 = (*v62)[1];
      v93.i32[0] = vadd_s32(v92, v92).u32[0];
      v93.i32[1] = vadd_s32(v92, (int32x2_t)0x100000001).i32[1];
      v91[1] = v93;
      *v91 = (int32x2_t)v76;
      if (v91[5].i32[1] <= (unsigned __int32)v91[2].i32[0] >> 1)
      {
        v91[6].i32[0] = 0;
      }
      else
      {
        v94 = v91[6].i32[0] + 1;
        v91[6].i32[0] = v94;
        if (v94 >= 2)
          v91[6].i32[1] = 1;
      }
      goto LABEL_93;
    }
LABEL_116:
    exit(-1);
  }
LABEL_93:
  if (maxlog >= 7)
  {
    coap_session_str((uint64_t)v11);
    coap_log_impl(7, "***%s: new outgoing session\n", (const char *)&coap_session_str_szSession);
  }
  v95 = *v11;
  if ((v95 - 3) < 2)
  {
    if ((*((_WORD *)v11 + 90) & 0x80) != 0)
    {
      v96 = 1;
      goto LABEL_103;
    }
    if (v95 != 4)
    {
      coap_session_send_csm((unsigned __int8 *)v11);
      goto LABEL_105;
    }
    goto LABEL_101;
  }
  if (v95 == 2)
  {
LABEL_101:
    *((_QWORD *)v11 + 27) = 0;
    ++*((_DWORD *)v11 + 1);
    goto LABEL_55;
  }
  if (v95 == 1)
  {
    v96 = 4;
LABEL_103:
    v11[2] = v96;
  }
LABEL_105:
  *(_QWORD *)block = 0;
  *(_QWORD *)&block[8] = 0;
  gettimeofday((timeval *)block, 0);
  *((_QWORD *)v11 + 34) = 1000 * (*(_QWORD *)block - coap_clock_offset)
                        + ((unint64_t)((double)*(int *)&block[8] * 1.024 + 512.0) >> 10);
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v97 = hap2Log_coap;
  if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)block = 138412290;
    *(_QWORD *)&block[4] = self;
    _os_log_impl(&dword_1CCE01000, v97, OS_LOG_TYPE_INFO, "%@ Created CoAP client session", block, 0xCu);
  }
  *((_DWORD *)v11 + 88) = -[HAP2CoAPClient maxTransmitAttempts](self, "maxTransmitAttempts") - 1;
  -[HAP2CoAPClient initialACKTimeout](self, "initialACKTimeout");
  *((_WORD *)v11 + 178) = (int)v98;
  *((_WORD *)v11 + 179) = (int)(v98 * 1000.0);
  *((_DWORD *)v11 + 90) = 6553601;
  if (maxlog >= 7)
  {
    coap_session_str((uint64_t)v11);
    coap_log_impl(7, "***%s: session ack_random_factor set to %d.%03d\n", (const char *)&coap_session_str_szSession, *((unsigned __int16 *)v11 + 180), *((unsigned __int16 *)v11 + 181));
  }
  *((_DWORD *)v11 + 3) = 65532;
  if (*((_DWORD *)v11 + 2) >= 0xFFFCu)
  {
    *((_DWORD *)v11 + 2) = 65532;
    if (maxlog >= 3)
      coap_log_impl(3, "DTLS overhead exceeds MTU\n");
  }
  v36 = 0;
LABEL_60:
  workQueue = self->_workQueue;
  *(_QWORD *)block = MEMORY[0x1E0C809B0];
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __50__HAP2CoAPClient__ioThreadOpenSessionWithContext___block_invoke;
  *(_QWORD *)&block[24] = &unk_1E894E120;
  v103 = v99;
  v104 = self;
  v105 = v36;
  v38 = v36;
  dispatch_async(workQueue, block);

  __HMFActivityScopeLeave();
  return (coap_session_t *)v11;
}

- (void)didCloseSession
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  coap_resource_t *notificationResource;
  NSObject *workQueue;
  _QWORD block[4];
  id v10;
  HAP2CoAPClient *v11;
  id v12;

  if (self)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Close Session"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v6);
    -[NSMutableSet removeAllObjects](self->_activeTokens, "removeAllObjects");
    -[NSMutableOrderedSet removeAllObjects](self->_previousResponseMessageIDs, "removeAllObjects");
    notificationResource = self->_notificationResource;
    if (notificationResource)
    {
      self->_notificationResource = 0;
      notificationResource->var12 = 0;
    }
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__HAP2CoAPClient__ioThreadDidCloseSession__block_invoke;
    block[3] = &unk_1E894E0F8;
    v10 = v12;
    v11 = self;
    dispatch_async(workQueue, block);

    __HMFActivityScopeLeave();
  }
}

- (void)didReceiveResponseInSession:(coap_session_t *)a3 messageID:(unint64_t)a4 response:(coap_pdu_t *)a5
{
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  unsigned int var0;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSString *v28;
  void *v29;
  char *var11;
  char *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  unsigned int var1;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *workQueue;
  id v45;
  void *v46;
  uint64_t v47;
  int v48;
  char *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  void *v55;
  _BYTE buf[24];
  const char *v57;
  id v58;
  HAP2CoAPClient *v59;
  id v60;
  id v61;
  int v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ Received Response"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v12);
    objc_msgSend(v55, "markWithFormat:", CFSTR("Message id: %lu"), a4);
    if (a5->var4 == 4)
      v13 = *(unsigned int *)a5->var10;
    else
      v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    var0 = a5->var0;
    if (!(_DWORD)v13 || (-[NSMutableSet containsObject:](self->_activeTokens, "containsObject:", v15) & 1) == 0)
    {
      if (var0 <= 1)
      {
        v20 = -[NSMutableOrderedSet containsObject:](self->_previousResponseMessageIDs, "containsObject:", v14);
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v21 = (void *)hap2Log_coap;
        v22 = os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO);
        if (v20)
        {
          if (v22)
          {
            v23 = v21;
            _stringForMessage((uint64_t)a5, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v24;
            _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_INFO, "%@ received more than once", buf, 0xCu);

          }
        }
        else
        {
          if (v22)
          {
            v25 = v21;
            _stringForMessage((uint64_t)a5, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v26;
            _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_INFO, "%@ received unexpectedly", buf, 0xCu);

          }
          coap_send_message_type(&a3->var0, (uint64_t)a5);
        }
      }
      goto LABEL_62;
    }
    -[NSMutableSet removeObject:](self->_activeTokens, "removeObject:", v15);
    if ((unint64_t)-[NSMutableOrderedSet count](self->_previousResponseMessageIDs, "count") >= 0xB)
      -[NSMutableOrderedSet removeObjectAtIndex:](self->_previousResponseMessageIDs, "removeObjectAtIndex:", 0);
    -[NSMutableOrderedSet addObject:](self->_previousResponseMessageIDs, "addObject:", v14);

    stringForToken(v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "markWithFormat:", CFSTR("Token: %@"), v17);

    if (a5->var0 == 3)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v18 = (id)hap2Log_coap;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        _stringForMessage((uint64_t)a5, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v39;
        _os_log_error_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%@ received RST", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_60;
    }
    if ((a5->var1 & 0xE0) == 0x40)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v27 = (id)hap2Log_coap;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = self->_accessoryName;
        _stringForMessage((uint64_t)a5, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v29;
        _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_DEFAULT, "[%{private}@] %@ succeeded", buf, 0x16u);

      }
      var11 = a5->var11;
      if (var11 && (v31 = &a5->var10[a5->var8 - (_QWORD)var11]) != 0)
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v32 = (id)hap2Log_coap;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          _stringForMessage((uint64_t)a5, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = "s";
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v53;
          if (v31 == (char *)1)
            v54 = "";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2080;
          v57 = v54;
          _os_log_debug_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_DEBUG, "%@ carries %lu byte%s of payload", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", var11, v31);
        v33 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v37 = (id)hap2Log_coap;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          _stringForMessage((uint64_t)a5, 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v52;
          _os_log_debug_impl(&dword_1CCE01000, v37, OS_LOG_TYPE_DEBUG, "%@ carries no payload", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v33 = objc_claimAutoreleasedReturnValue();
      }
      v38 = (void *)v33;
      v19 = 0;
      goto LABEL_61;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v34 = (id)hap2Log_coap;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      _stringForMessage((uint64_t)a5, 1);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      v46 = v45;
      v47 = 0;
      v48 = 65;
      v49 = &byte_1E894E558;
      while (v48 != a5->var1)
      {
        ++v47;
        v50 = *v49;
        v49 += 16;
        v48 = v50;
        if (v47 == 23)
        {
          v51 = 0;
          goto LABEL_69;
        }
      }
      v51 = coap_error[2 * v47 + 1];
LABEL_69:
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v51;
      _os_log_error_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_ERROR, "%@ failed: %s", buf, 0x16u);

    }
    var1 = a5->var1;
    if (var1 <= 0x8E)
    {
      v36 = 9;
      switch(var1)
      {
        case 0x80u:
          goto LABEL_59;
        case 0x81u:
        case 0x83u:
          goto LABEL_57;
        case 0x82u:
        case 0x85u:
          goto LABEL_50;
        case 0x84u:
          v36 = 14;
          goto LABEL_59;
        default:
          if (var1 - 64 > 3 || var1 == 66)
            goto LABEL_57;
          v19 = 0;
          break;
      }
      goto LABEL_60;
    }
    if (a5->var1 > 0xA2u)
    {
      if (var1 == 163)
      {
        v36 = 19;
        goto LABEL_59;
      }
      if (var1 == 164)
      {
        v36 = 24;
        goto LABEL_59;
      }
    }
    else if (var1 == 143 || var1 == 161)
    {
LABEL_50:
      v36 = 3;
LABEL_59:
      v40 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u.%02u"), var1 >> 5, var1 & 0x1F);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", CFSTR("CoAP responded with a failure code: %@"), v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", v36, v42, 0, 0, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 8, CFSTR("Failed to communicate using CoAP"), 0, 0, v43);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_60:
      v38 = 0;
LABEL_61:
      workQueue = self->_workQueue;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __74__HAP2CoAPClient__ioThreadDidReceiveResponseInSession_messageID_response___block_invoke;
      v57 = (const char *)&unk_1E894BC50;
      v58 = v55;
      v59 = self;
      v62 = v13;
      v60 = v38;
      v61 = v19;
      v15 = v19;
      v14 = v38;
      dispatch_async(workQueue, buf);

LABEL_62:
      __HMFActivityScopeLeave();

      return;
    }
LABEL_57:
    v36 = 15;
    goto LABEL_59;
  }
}

- (void)didReceiveRequestInSession:(coap_session_t *)a3 messageID:(unint64_t)a4 request:(coap_pdu_t *)a5 response:(coap_pdu_t *)a6
{
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableOrderedSet *v15;
  int v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSMutableOrderedSet *v21;
  _BOOL4 v22;
  NSMutableOrderedSet *v23;
  NSMutableOrderedSet *v24;
  void *v25;
  NSObject *workQueue;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _BYTE buf[24];
  void *v34;
  id v35;
  HAP2CoAPClient *v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ Received Request"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v13);
    objc_msgSend(v32, "markWithFormat:", CFSTR("Message id: %lu"), a4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_previousEventMessageIDs;
    v16 = -[NSMutableOrderedSet containsObject:](v15, "containsObject:", v14);

    if (v16)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v17 = (id)hap2Log_coap;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        _stringForMessage((uint64_t)a6, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v18;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%@ received more than once", buf, 0xCu);

      }
      a6->var1 = 67;
    }
    else
    {
      v30 = 0;
      v31 = 0;
      if (coap_get_data(a5, &v31, &v30))
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v19 = (id)hap2Log_coap;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          _stringForMessage((uint64_t)a5, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v31;
          _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%@ received with %lu bytes of data", buf, 0x16u);

        }
        v21 = self->_previousEventMessageIDs;
        v22 = (unint64_t)-[NSMutableOrderedSet count](v21, "count") > 5;

        if (v22)
        {
          v23 = self->_previousEventMessageIDs;
          -[NSMutableOrderedSet removeObjectAtIndex:](v23, "removeObjectAtIndex:", 0);

        }
        v24 = self->_previousEventMessageIDs;
        -[NSMutableOrderedSet addObject:](v24, "addObject:", v14);

        a6->var1 = 67;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v30, v31);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        workQueue = self->_workQueue;
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __81__HAP2CoAPClient__ioThreadDidReceiveRequestInSession_messageID_request_response___block_invoke;
        v34 = &unk_1E894E120;
        v35 = v32;
        v36 = self;
        v37 = v25;
        v27 = v25;
        dispatch_async(workQueue, buf);

      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v28 = (id)hap2Log_coap;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          _stringForMessage((uint64_t)a5, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v29;
          _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_INFO, "%@ received, but contains no data", buf, 0xCu);

        }
        a6->var0 = 3;
      }
    }

    __HMFActivityScopeLeave();
  }
}

- (void)didFailToSendMessageInSession:(coap_session_t *)a3 messageID:(unint64_t)a4 message:(coap_pdu_t *)a5 reason:(unint64_t)a6
{
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  NSObject *workQueue;
  id v14;
  NSString *v15;
  id v16;
  __CFString *v17;
  NSObject *v18;
  _BYTE block[24];
  __CFString *v20;
  HAP2CoAPClient *v21;
  id v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    if (*(_WORD *)&a5->var0 || a5->var4 || a6 != 2 || a5->var11)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = (id)hap2Log_coap;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v15 = self->_accessoryName;
        _stringForMessage((uint64_t)a5, 0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (a6 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%lu)"), a6);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = off_1E894BC98[a6];
        }
        *(_DWORD *)block = 138478339;
        *(_QWORD *)&block[4] = v15;
        *(_WORD *)&block[12] = 2112;
        *(_QWORD *)&block[14] = v16;
        *(_WORD *)&block[22] = 2112;
        v20 = v17;
        _os_log_error_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "[%{private}@] %@ failed to send with reason: %@", block, 0x20u);

      }
      if (a6 > 4
        || (objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", qword_1CCFA3348[a6]),
            (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v11 = hap2Log_coap;
        if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)block = 134217984;
          *(_QWORD *)&block[4] = a6;
          _os_log_error_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "Unhandled failure reason: %lu", block, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (a5->var4 == 4)
        v12 = *(_DWORD *)a5->var10;
      else
        v12 = 0;
      workQueue = self->_workQueue;
      *(_QWORD *)block = MEMORY[0x1E0C809B0];
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = __72__HAP2CoAPClient__ioThreadDidFailToSendMessageInSession_message_reason___block_invoke_58;
      v20 = (__CFString *)&unk_1E894BC78;
      v23 = v12;
      v21 = self;
      v22 = v10;
      v14 = v10;
      dispatch_async(workQueue, block);

    }
    else
    {
      -[HAP2CoAPClient _ioThreadDidReceivePongInSession:messageID:]((uint64_t)self, a5->var5);
      v18 = self->_workQueue;
      *(_QWORD *)block = MEMORY[0x1E0C809B0];
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = __72__HAP2CoAPClient__ioThreadDidFailToSendMessageInSession_message_reason___block_invoke;
      v20 = (__CFString *)&unk_1E894DD08;
      v21 = self;
      dispatch_async(v18, block);
    }
  }
}

- (void)didReceivePongInSession:(coap_session_t *)a3 messageID:(unint64_t)a4
{
  -[HAP2CoAPClient _ioThreadDidReceivePongInSession:messageID:]((uint64_t)self, a4);
}

- (void)didRegister
{
  void *v3;
  void *v4;
  NSObject *workQueue;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    objc_storeWeak((id *)&self->_ioThread, v3);

    workQueue = self->_workQueue;
  }
  else
  {

    workQueue = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__HAP2CoAPClient_didRegister__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)didUnregister
{
  HAP2CoAPClient *v2;
  _QWORD block[5];

  v2 = self;
  if (self)
    self = (HAP2CoAPClient *)self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__HAP2CoAPClient_didUnregister__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = v2;
  dispatch_async(&self->super.super, block);
  if (v2)
    objc_storeWeak((id *)&v2->_ioThread, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ioThread);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_previousEventMessageIDs, 0);
  objc_storeStrong((id *)&self->_previousResponseMessageIDs, 0);
  objc_storeStrong((id *)&self->_activeTokens, 0);
  objc_storeStrong((id *)&self->_closeError, 0);
  objc_storeStrong((id *)&self->_responseCompletionsByToken, 0);
  objc_storeStrong(&self->_closeCompletion, 0);
  objc_storeStrong(&self->_openCompletion, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __31__HAP2CoAPClient_didUnregister__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "clientDidGetUnregistered:", *(_QWORD *)(a1 + 32));

}

void __29__HAP2CoAPClient_didRegister__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "clientDidGetRegistered:", *(_QWORD *)(a1 + 32));

}

- (void)_ioThreadDidReceivePongInSession:(uint64_t)a1 messageID:(uint64_t)a2
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v3 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEBUG))
    {
      v4 = 134217984;
      v5 = a2;
      _os_log_debug_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_DEBUG, "<Pong id=%lu> received", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t __72__HAP2CoAPClient__ioThreadDidFailToSendMessageInSession_message_reason___block_invoke(uint64_t a1)
{
  return -[HAP2CoAPClient _queueSessionCompletion](*(_QWORD *)(a1 + 32));
}

void __72__HAP2CoAPClient__ioThreadDidFailToSendMessageInSession_message_reason___block_invoke_58(uint64_t a1)
{
  -[HAP2CoAPClient _queueSessionCompletion](*(_QWORD *)(a1 + 32));
  -[HAP2CoAPClient _callResponseCompletion:response:error:](*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), 0, *(void **)(a1 + 40));
}

- (uint64_t)_queueSessionCompletion
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 136));
    return +[HAP2CoAPIO queueSessionCompletionForConsumer:](HAP2CoAPIO, "queueSessionCompletionForConsumer:", v1);
  }
  return result;
}

- (void)_callResponseCompletion:(void *)a3 response:(void *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2CoAPClient responseCompletionsByToken](a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[HAP2CoAPClient responseCompletionsByToken](a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v9);

      ((void (**)(_QWORD, id, id))v11)[2](v11, v7, v8);
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v13 = (void *)hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        v14 = v13;
        stringForToken(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v15;
        v18 = 2112;
        v19 = v8;
        _os_log_error_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "<Response token=%@> received after we already called its completion handler: %@", (uint8_t *)&v16, 0x16u);

      }
    }

  }
}

- (id)responseCompletionsByToken
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
  return *(id *)(a1 + 88);
}

void __81__HAP2CoAPClient__ioThreadDidReceiveRequestInSession_messageID_request_response___block_invoke(uint64_t a1)
{
  dispatch_queue_t *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "begin");
  v6 = *(id *)(a1 + 32);
  v2 = *(dispatch_queue_t **)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  if (v2)
  {
    dispatch_assert_queue_V2(v2[17]);
    -[dispatch_queue_t delegate](v2, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "client:didReceiveEvent:", v2, v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  __HMFActivityScopeLeave();

}

void __74__HAP2CoAPClient__ioThreadDidReceiveResponseInSession_messageID_response___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = *(id *)(a1 + 32);
  -[HAP2CoAPClient _queueSessionCompletion](*(_QWORD *)(a1 + 40));
  -[HAP2CoAPClient _callResponseCompletion:response:error:](*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), *(void **)(a1 + 48), *(void **)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  __HMFActivityScopeLeave();

}

void __42__HAP2CoAPClient__ioThreadDidCloseSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "begin");
  v14 = *(id *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
    -[HAP2CoAPClient openCompletion](v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2, v14);
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[HAP2CoAPClient _didOpenWithError:](v2, v4);
    }
    else
    {
      v5 = objc_msgSend((id)v2, "connected", v14);
      objc_msgSend((id)v2, "setConnected:", 0);
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
      if (*(_BYTE *)(v2 + 41))
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
        *(_BYTE *)(v2 + 41) = 0;
        +[HAP2CoAPIO unregisterConsumer:](HAP2CoAPIO, "unregisterConsumer:", v2);
      }
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2CoAPClient responseCompletionsByToken](v2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          -[HAP2CoAPClient responseCompletionsByToken](v2);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "allValues");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          -[HAP2CoAPClient responseCompletionsByToken](v2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeAllObjects");

          v16 = MEMORY[0x1E0C809B0];
          v17 = 3221225472;
          v18 = __32__HAP2CoAPClient__didDisconnect__block_invoke;
          v19 = &unk_1E894BBB8;
          v20 = v6;
          objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v16);

        }
        objc_msgSend((id)v2, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
          objc_msgSend(v12, "clientDidDisconnect:error:", v2, v6);

      }
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
      v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17B7400](*(_QWORD *)(v2 + 80));
      if (v4)
      {
        -[HAP2CoAPClient setCloseCompletion:](v2, 0);
        v4[2](v4, 0);
      }
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v14, v16, v17, v18, v19);
  __HMFActivityScopeLeave();

}

- (id)openCompletion
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
  return (id)MEMORY[0x1D17B7400](*(_QWORD *)(a1 + 72));
}

- (void)_didOpenWithError:(uint64_t)a1
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    if (*(_BYTE *)(a1 + 41))
    {
      -[HAP2CoAPClient openCompletion](a1);
      v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[HAP2CoAPClient setOpenCompletion:](a1, 0);
      if (v5)
      {
        objc_msgSend((id)a1, "setConnected:", 0);
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
        *(_BYTE *)(a1 + 41) = 0;
        +[HAP2CoAPIO unregisterConsumer:](HAP2CoAPIO, "unregisterConsumer:", a1);
      }
      else
      {
        objc_msgSend((id)a1, "setConnected:", 1);
        objc_msgSend(MEMORY[0x1E0D28608], "sharedManager");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "registerWoWAssertionForObject:", a1);

      }
      ((void (**)(_QWORD, id))v3)[2](v3, v5);

    }
  }

}

uint64_t __32__HAP2CoAPClient__didDisconnect__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, *(_QWORD *)(a1 + 32));
}

- (void)setCloseCompletion:(uint64_t)a1
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = *(NSObject **)(a1 + 136);
  v4 = a2;
  dispatch_assert_queue_V2(v3);
  v5 = MEMORY[0x1D17B7400](v4);

  v6 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v5;

}

- (void)setOpenCompletion:(uint64_t)a1
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = *(NSObject **)(a1 + 136);
  v4 = a2;
  dispatch_assert_queue_V2(v3);
  v5 = MEMORY[0x1D17B7400](v4);

  v6 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v5;

}

void __50__HAP2CoAPClient__ioThreadOpenSessionWithContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = *(id *)(a1 + 32);
  -[HAP2CoAPClient _didOpenWithError:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  __HMFActivityScopeLeave();

}

void __44__HAP2CoAPClient_closeWithError_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  objc_msgSend(*(id *)(a1 + 32), "begin");
  v23 = *(id *)(a1 + 32);
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __44__HAP2CoAPClient_closeWithError_completion___block_invoke_2;
  v20 = &unk_1E894D798;
  v22 = *(id *)(a1 + 56);
  v21 = *(id *)(a1 + 32);
  v5 = v4;
  v6 = &v17;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 136));
    objc_msgSend((id)v3, "setConnected:", 0, v17, v18);
    objc_msgSend(MEMORY[0x1E0D28608], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deregisterWoWAssertionForObject:", v3);

    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 136));
    if (*(_BYTE *)(v3 + 41))
    {
      -[HAP2CoAPClient setCloseCompletion:](v3, v6);
      v8 = v5;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 136));
      objc_storeStrong((id *)(v3 + 96), v4);

      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 136));
      *(_BYTE *)(v3 + 41) = 0;
      +[HAP2CoAPIO unregisterConsumer:](HAP2CoAPIO, "unregisterConsumer:", v3);
      if (v8)
      {
        v9 = v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
      -[HAP2CoAPClient responseCompletionsByToken](v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        -[HAP2CoAPClient responseCompletionsByToken](v3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "allValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[HAP2CoAPClient responseCompletionsByToken](v3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeAllObjects");

        v24[0] = v2;
        v24[1] = 3221225472;
        v24[2] = __45__HAP2CoAPClient__closeWithError_completion___block_invoke;
        v24[3] = &unk_1E894BBB8;
        v25 = v10;
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v24);

      }
      -[HAP2CoAPClient openCompletion](v3);
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        -[HAP2CoAPClient setOpenCompletion:](v3, 0);
        ((void (**)(_QWORD, void *))v16)[2](v16, v10);
      }

    }
    else
    {
      ((void (*)(uint64_t *, _QWORD))v19)(v6, 0);
    }
  }

  __HMFActivityScopeLeave();
}

uint64_t __44__HAP2CoAPClient_closeWithError_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __45__HAP2CoAPClient__closeWithError_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __61__HAP2CoAPClient_alterMaxTransmitAttempts_initialACKTimeout___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMaxTransmitAttempts:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setInitialACKTimeout:", *(double *)(a1 + 48));
}

void __61__HAP2CoAPClient_alterMaxTransmitAttempts_initialACKTimeout___block_invoke_2(_QWORD *a1)
{
  dispatch_queue_t *v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  NSObject *v5;
  uint64_t v6;

  v1 = (dispatch_queue_t *)a1[4];
  if (v1)
  {
    v2 = a1[5];
    v3 = a1[6];
    dispatch_assert_queue_V2(v1[17]);
    if ((-[dispatch_queue_t connected](v1, "connected") & 1) != 0)
    {
      -[dispatch_queue_t initialACKTimeout](v1, "initialACKTimeout", MEMORY[0x1E0C809B0], 3221225472, __62__HAP2CoAPClient__alterMaxTransmitAttempts_initialACKTimeout___block_invoke, &__block_descriptor_48_e693_v24__0__HAP2CoAPClient_8__coap_session_t_CCCIII_coap_address_t_I____sockaddr_CC_14c___sockaddr_in_CCS_in_addr_I__8c___sockaddr_in6_CCSI_in6_addr_____16C__8S__4I___I____UT_hash_handle___UT_hash_table__v_v__UT_hash_handle___UT_hash_handle__vII__coap_addr_tuple_t__coap_address_t_I____sockaddr_CC_14c___sockaddr_in_CCS_in_addr_I__8c___sockaddr_in6_CCSI_in6_addr_____16C__8S__4I___I____coap_address_t_I____sockaddr_CC_14c___sockaddr_in_CCS_in_addr_I__8c___sockaddr_in6_CCSI_in6_addr_____16C__8S__4I___I____i_coap_socket_t_iS__coap_session_t___coap_endpoint_t____coap_endpoint_t___coap_context_t__vSCi__coap_queue_t_Q_8C_Q__coap_pdu_t_QQQQQ_Q_Q_vI_coap_fixed_point_t_SS__coap_fixed_point_t_SS_Ii_16l, v2, v3);
      -[HAP2CoAPClient _queueSessionBlock:withTimeout:requiresCompletion:](v1, &v6, 0, v4);
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v5 = hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v6) = 0;
        _os_log_error_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "Cannot alter timing values when not connected", (uint8_t *)&v6, 2u);
      }
    }
  }
}

void __62__HAP2CoAPClient__alterMaxTransmitAttempts_initialACKTimeout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_coap;
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 134218240;
      v10 = v6;
      v11 = 2048;
      v12 = v7;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "Altering timing values: maxTransmitAttempts = %lu, initialACKTimeout = %f", (uint8_t *)&v9, 0x16u);
    }
    *(_DWORD *)(a3 + 352) = *(_DWORD *)(a1 + 32) - 1;
    v8 = *(double *)(a1 + 40);
    *(_WORD *)(a3 + 356) = (int)v8;
    *(_WORD *)(a3 + 358) = (int)(v8 * 1000.0);
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v9) = 0;
    _os_log_error_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "Cannot alter timing values without a session", (uint8_t *)&v9, 2u);
  }
}

- (void)_queueSessionBlock:(uint64_t)a3 withTimeout:(double)a4 requiresCompletion:
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v7 = a2;
  dispatch_assert_queue_V2(a1[17]);
  objc_initWeak(&location, a1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HAP2CoAPClient__queueSessionBlock_withTimeout_requiresCompletion___block_invoke;
  v9[3] = &unk_1E894BB90;
  objc_copyWeak(&v11, &location);
  v8 = v7;
  v10 = v8;
  +[HAP2CoAPIO queueSessionBlockForConsumer:sessionBlock:withTimeout:requiresCompletion:](HAP2CoAPIO, "queueSessionBlockForConsumer:sessionBlock:withTimeout:requiresCompletion:", a1, v9, a3, a4);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __68__HAP2CoAPClient__queueSessionBlock_withTimeout_requiresCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

void __64__HAP2CoAPClient_sendRequestWithMethod_path_payload_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  dispatch_queue_t *v5;
  id v6;
  id v7;
  _QWORD *v8;
  const __SecRandom *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  char v21;
  id v22;
  _QWORD v23[2];
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD bytes[4];
  id v30;
  id v31;
  id v32;
  int v33;
  char v34;
  _QWORD v35[4];
  id v36;
  _QWORD *v37;

  objc_msgSend(*(id *)(a1 + 32), "begin");
  v28 = *(id *)(a1 + 32);
  v21 = *(_BYTE *)(a1 + 72);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v5 = *(dispatch_queue_t **)(a1 + 40);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v24 = __64__HAP2CoAPClient_sendRequestWithMethod_path_payload_completion___block_invoke_2;
  v25 = &unk_1E894BBE0;
  v27 = *(id *)(a1 + 64);
  v26 = *(id *)(a1 + 32);
  v22 = v2;
  v6 = v3;
  v7 = v4;
  v8 = v23;
  if (v5)
  {
    dispatch_assert_queue_V2(v5[17]);
    if ((-[dispatch_queue_t connected](v5, "connected") & 1) != 0)
    {
      dispatch_assert_queue_V2(v5[17]);
      v9 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
      while (1)
      {
        while (1)
        {
          LODWORD(bytes[0]) = 0;
          if (SecRandomCopyBytes(v9, 4uLL, bytes))
            break;
          v10 = LODWORD(bytes[0]);
          if (LODWORD(bytes[0]))
            goto LABEL_8;
        }
        v10 = arc4random();
        if ((_DWORD)v10)
        {
LABEL_8:
          -[HAP2CoAPClient responseCompletionsByToken]((uint64_t)v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            stringForToken(v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "markWithFormat:", CFSTR("Token: %@"), v14);

            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __74__HAP2CoAPClient__sendRequestWithMethod_path_payload_activity_completion___block_invoke;
            v35[3] = &unk_1E894BBE0;
            v15 = v7;
            v36 = v15;
            v37 = v8;
            v16 = (void *)MEMORY[0x1D17B7400](v35);
            -[HAP2CoAPClient responseCompletionsByToken]((uint64_t)v5);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

            bytes[0] = MEMORY[0x1E0C809B0];
            bytes[1] = 3221225472;
            bytes[2] = __74__HAP2CoAPClient__sendRequestWithMethod_path_payload_activity_completion___block_invoke_2;
            bytes[3] = &unk_1E894BC08;
            v34 = v21;
            v30 = v22;
            v31 = v6;
            v33 = v10;
            v32 = v15;
            -[dispatch_queue_t initialACKTimeout](v5, "initialACKTimeout");
            -[HAP2CoAPClient _queueSessionBlock:withTimeout:requiresCompletion:](v5, bytes, 1, v19);

            v20 = v36;
            goto LABEL_11;
          }
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, _QWORD, void *))v24)(v8, 0, v20);
LABEL_11:

  }
  __HMFActivityScopeLeave();

}

uint64_t __64__HAP2CoAPClient_sendRequestWithMethod_path_payload_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __74__HAP2CoAPClient__sendRequestWithMethod_path_payload_activity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v9 = *(id *)(a1 + 32);
  v7 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v7, "markWithFormat:", CFSTR("Failed to receive response: %@"), v6, v9);
  else
    objc_msgSend(v7, "markWithReason:", CFSTR("Received response"));
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v5, "length");
  objc_msgSend(v6, "domain");

  objc_msgSend(v6, "code");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __HMFActivityScopeLeave();

}

void __74__HAP2CoAPClient__sendRequestWithMethod_path_payload_activity_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  unsigned __int16 v13;
  int *v14;
  unint64_t v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  void *v18;
  id v19;
  const void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  const void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  int *v40;
  void *v41;
  uint64_t v42;
  int *v43;
  void *v44;
  void *v45;
  int *v46;
  void *v47;
  NSObject *v48;
  int *v49;
  const char *v50;
  void *v51;
  NSObject *v52;
  int *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  int *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  int v63;
  uint8_t buf[4];
  int *v65;
  __int16 v66;
  int *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = *(_BYTE *)(a1 + 60);
  v6 = *(void **)(a1 + 40);
  v7 = *(unsigned int *)(a1 + 56);
  v8 = *(void **)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  v10 = v6;
  v63 = v7;
  v11 = v8;
  v12 = v11;
  if (!a2)
    goto LABEL_42;
  if (a3)
  {
    v13 = *(_WORD *)(a3 + 224) + 1;
    *(_WORD *)(a3 + 224) = v13;
    v14 = (int *)v13;
    objc_msgSend(v11, "markWithFormat:", CFSTR("Message id: %lu"), v13);
    v15 = coap_session_max_pdu_size((unsigned __int8 *)a3);
    v16 = coap_pdu_init(0, v5, v13, v15);
    if (!v16)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v38 = (void *)hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        v39 = v38;
        stringForToken(v7);
        v40 = (int *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v65 = v14;
        v66 = 2112;
        v67 = v40;
        _os_log_error_impl(&dword_1CCE01000, v39, OS_LOG_TYPE_ERROR, "<Request id=%lu, token=%@> failed to allocate pdu", buf, 0x16u);

      }
      goto LABEL_30;
    }
    v17 = v16;
    v18 = v10;
    if (coap_add_token((uint64_t)v16, 4uLL, &v63))
    {
      v62 = a2;
      if (!objc_msgSend(v9, "length"))
        goto LABEL_8;
      v19 = objc_retainAutorelease(v9);
      v20 = (const void *)objc_msgSend(v19, "UTF8String");
      if (!v20)
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v43 = (int *)v19;
        v44 = (void *)hap2Log_coap;
        v10 = v18;
        v27 = a2;
        if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
        {
          v52 = v44;
          _stringForMessage((uint64_t)v17, 0);
          v53 = (int *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v65 = v53;
          v66 = 2112;
          v67 = v43;
          _os_log_error_impl(&dword_1CCE01000, v52, OS_LOG_TYPE_ERROR, "%@ failed to get utf8 for path '%@'", buf, 0x16u);

        }
        coap_delete_pdu(v17);
LABEL_40:
        v42 = v27;
        goto LABEL_41;
      }
      if (coap_add_option((uint64_t)v17, 0xBu, objc_msgSend(v19, "lengthOfBytesUsingEncoding:", 4), v20))
      {
LABEL_8:
        v61 = v9;
        v10 = v18;
        if (objc_msgSend(v18, "length"))
        {
          v21 = objc_msgSend(v18, "length");
          v22 = objc_retainAutorelease(v18);
          v23 = objc_msgSend(v22, "bytes");
          if (v21)
          {
            v24 = (const void *)v23;
            v25 = (void *)coap_add_data_after(v17, v21);
            if (!v25)
            {
              if (hap2LogInitialize_onceToken != -1)
                dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
              v9 = v61;
              v51 = (void *)hap2Log_coap;
              if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
              {
                v58 = v51;
                _stringForMessage((uint64_t)v17, 0);
                v59 = (int *)objc_claimAutoreleasedReturnValue();
                v60 = objc_msgSend(v22, "length");
                *(_DWORD *)buf = 138412546;
                v65 = v59;
                v66 = 2048;
                v67 = (int *)v60;
                _os_log_error_impl(&dword_1CCE01000, v58, OS_LOG_TYPE_ERROR, "%@ failed to attach payload (%lu bytes)", buf, 0x16u);

              }
              coap_delete_pdu(v17);
              v42 = v62;
              goto LABEL_41;
            }
            memcpy(v25, v24, v21);
          }
        }
        objc_msgSend(v12, "markWithReason:", CFSTR("Sending request"));
        v26 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
        v27 = v62;
        if (coap_send((unsigned __int8 *)a3, (uint64_t)v17) != -1)
        {
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v28 = (void *)hap2Log_coap;
          if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEFAULT))
          {
            v29 = *(void **)(v62 + 144);
            v30 = v29;
            v31 = v28;
            coap_session_str(a3);
            _stringForMessage((uint64_t)v17, 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138478339;
            v65 = (int *)v29;
            v66 = 2081;
            v67 = &coap_session_str_szSession;
            v68 = 2112;
            v69 = v32;
            _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_DEFAULT, "[%{private}@] %{private}s: %@ sent", buf, 0x20u);

            v27 = v62;
          }
          objc_msgSend(v12, "markWithReason:", CFSTR("Sent Request"));
          v33 = *(void **)(v27 + 104);
          v34 = (void *)MEMORY[0x1E0CB37E8];
          v35 = v33;
          objc_msgSend(v34, "numberWithUnsignedInt:", v7);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v36);

          v9 = v61;
          goto LABEL_42;
        }
        objc_msgSend(v12, "markWithReason:", CFSTR("Send Request Failed"));
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v9 = v61;
        v45 = (void *)hap2Log_coap;
        if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
        {
          v54 = *(void **)(v62 + 144);
          v55 = v54;
          v56 = v45;
          stringForToken(v7);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478339;
          v65 = (int *)v54;
          v27 = v62;
          v66 = 2048;
          v67 = v14;
          v68 = 2112;
          v69 = v57;
          _os_log_error_impl(&dword_1CCE01000, v56, OS_LOG_TYPE_ERROR, "[%{private}@] <Request id=%lu, token=%@> failed to send", buf, 0x20u);

        }
        goto LABEL_40;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v46 = (int *)v19;
      v47 = (void *)hap2Log_coap;
      v10 = v18;
      if (!os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v48 = v47;
      _stringForMessage((uint64_t)v17, 0);
      v49 = (int *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v65 = v49;
      v66 = 2112;
      v67 = v46;
      v50 = "%@ failed to attach path '%@'";
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v41 = (void *)hap2Log_coap;
      if (!os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v48 = v41;
      stringForToken(v7);
      v49 = (int *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v65 = v14;
      v66 = 2112;
      v67 = v49;
      v50 = "<Request id=%lu, token=%@> failed to attach token";
    }
    _os_log_error_impl(&dword_1CCE01000, v48, OS_LOG_TYPE_ERROR, v50, buf, 0x16u);

LABEL_29:
    coap_delete_pdu(v17);
LABEL_30:
    v42 = a2;
LABEL_41:
    -[HAP2CoAPClient _ioThreadRequestFailed:](v42, v7);
    goto LABEL_42;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v37 = hap2Log_coap;
  if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v65 = (int *)a2;
    _os_log_error_impl(&dword_1CCE01000, v37, OS_LOG_TYPE_ERROR, "%@ Failed to retrieve session", buf, 0xCu);
  }
LABEL_42:

}

- (void)_ioThreadRequestFailed:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  int v4;

  v2 = *(NSObject **)(a1 + 136);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__HAP2CoAPClient__ioThreadRequestFailed___block_invoke;
  v3[3] = &unk_1E894D748;
  v3[4] = a1;
  v4 = a2;
  dispatch_async(v2, v3);
}

void __41__HAP2CoAPClient__ioThreadRequestFailed___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  -[HAP2CoAPClient _queueSessionCompletion](*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned int *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HAP2CoAPClient _callResponseCompletion:response:error:](v2, v3, 0, v4);

}

void __37__HAP2CoAPClient_openWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD v4[2];
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "begin");
  v9 = *(id *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __37__HAP2CoAPClient_openWithCompletion___block_invoke_2;
  v6 = &unk_1E894D798;
  v2 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v3 = v4;
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
    if (objc_msgSend((id)v2, "connected"))
    {
      ((void (*)(_QWORD *, _QWORD))v5)(v3, 0);
    }
    else
    {
      -[HAP2CoAPClient setOpenCompletion:](v2, v3);
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
      if (!*(_BYTE *)(v2 + 41))
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
        *(_BYTE *)(v2 + 41) = 1;
        +[HAP2CoAPIO registerConsumer:](HAP2CoAPIO, "registerConsumer:", v2);
      }
    }
  }

  __HMFActivityScopeLeave();
}

uint64_t __37__HAP2CoAPClient_openWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

double __35__HAP2CoAPClient_initialACKTimeout__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 64);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __37__HAP2CoAPClient_maxTransmitAttempts__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

uint64_t __31__HAP2CoAPClient_setConnected___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __27__HAP2CoAPClient_connected__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

id __30__HAP2CoAPClient_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

void __26__HAP2CoAPClient_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (char)_initWithIPAddress:(unsigned int)a3 port:(uint64_t)a4 maxTransmitAttempts:(void *)a5 initialACKTimeout:(double)a6 workQueue:
{
  id v11;
  id v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  _OWORD v17[2];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a5;
  if (a1)
  {
    if (a3)
      v13 = a3;
    else
      v13 = 5683;
    memset(v17, 0, sizeof(v17));
    if (+[HAP2CoAPIO setCoapAddressFromString:port:coapAddress:](HAP2CoAPIO, "setCoapAddressFromString:port:coapAddress:", v11, v13, v17))
    {
      a1 = -[HAP2CoAPClient initWithSocketAddress:withAccessoryName:workQueue:maxTransmitAttempts:initialACKTimeout:](a1, (unsigned __int8 *)v17 + 4, 0, v12, a4, a6);
      v14 = a1;
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v15 = hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_error_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "Failed to parse address from string: %@", buf, 0xCu);
      }
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (char)initWithSocketAddress:(void *)a3 withAccessoryName:(void *)a4 workQueue:(uint64_t)a5 maxTransmitAttempts:(double)a6 initialACKTimeout:
{
  __CFString *v11;
  NSObject *v12;
  int v13;
  dispatch_queue_t v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  char *v19;
  unsigned int v20;
  size_t v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  objc_super v35;

  v11 = a3;
  v12 = a4;
  v13 = a2[1];
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    v15 = (const char *)HAPDispatchQueueName(a1, CFSTR("workQueue"));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(17, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create_with_target_V2(v15, v16, v17);

  }
  v35.receiver = a1;
  v35.super_class = (Class)HAP2CoAPClient;
  v18 = (char *)objc_msgSendSuper2(&v35, sel_init);
  v19 = v18;
  if (v18)
  {
    if (v13 == 30)
      v20 = 28;
    else
      v20 = 16;
    if (*a2)
      v21 = *a2;
    else
      v21 = v20;
    if (!a5)
      a5 = 3;
    if (a6 <= 0.0)
      a6 = 1.428;
    *(_QWORD *)(v18 + 12) = 0;
    *(_QWORD *)(v18 + 28) = 0;
    *(_QWORD *)(v18 + 20) = 0;
    *((_DWORD *)v18 + 9) = 0;
    *((_DWORD *)v18 + 2) = 28;
    *((_DWORD *)v18 + 2) = v21;
    memcpy(v18 + 12, a2, v21);
    +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", CFSTR("HAP2CoAPClient.propertyLock"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v19 + 16);
    *((_QWORD *)v19 + 16) = v22;

    if (v11)
      v24 = v11;
    else
      v24 = &stru_1E894EFE8;
    objc_storeStrong((id *)v19 + 18, v24);
    objc_storeStrong((id *)v19 + 17, v14);
    *((_QWORD *)v19 + 7) = a5;
    *((double *)v19 + 8) = a6;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)*((_QWORD *)v19 + 11);
    *((_QWORD *)v19 + 11) = v25;

    v27 = (void *)*((_QWORD *)v19 + 12);
    *((_QWORD *)v19 + 12) = 0;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)*((_QWORD *)v19 + 13);
    *((_QWORD *)v19 + 13) = v28;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v19 + 14);
    *((_QWORD *)v19 + 14) = v30;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)*((_QWORD *)v19 + 15);
    *((_QWORD *)v19 + 15) = v32;

  }
  return v19;
}

@end
