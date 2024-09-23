@implementation CtrClient

- (id)init:(const char *)a3
{
  CtrClient *v5;
  CtrClient *v6;
  CtrClient *v7;
  __int128 v9;
  objc_super v10;

  if ((MGGetBoolAnswer() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)CtrClient;
    v5 = -[CtrClient init](&v10, sel_init);
    v6 = v5;
    if (v5)
    {
      -[CtrClient createClient:](v5, "createClient:", a3);
      std::shared_ptr<CtrXPC::Command>::operator=[abi:ne180100]((uint64_t)&v6->CtrXPCClientPtr, &v9);
      if (*((_QWORD *)&v9 + 1))
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v9 + 1));
    }
    self = v6;
    v7 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CtrClient init:].cold.1();
    v7 = 0;
  }

  return v7;
}

- (shared_ptr<CtrXPC::Client>)createClient:(const char *)a3
{
  _QWORD *v3;
  Client *v4;
  __shared_weak_count *v5;
  shared_ptr<CtrXPC::Client> result;

  CtrXPC::Client::create((CtrXPC::Client *)a3, v3);
  result.__cntrl_ = v5;
  result.__ptr_ = v4;
  return result;
}

- (void)setEventHandler:(const void *)a3 EventBlock:(id)a4 dqueue:(queue)a5
{
  id v8;
  uint64_t *ptr;
  NSObject *v10;
  dispatch_object_t object;

  v8 = a4;
  ptr = (uint64_t *)self->CtrXPCClientPtr.__ptr_;
  v10 = *(NSObject **)a5.var0.var0;
  object = v10;
  if (v10)
    dispatch_retain(v10);
  CtrXPC::Client::setEventHandler(ptr, (const std::string *)a3, v8, &object);
  if (object)
    dispatch_release(object);

}

- (void)setClientEventsOn
{
  CtrXPC::Client::eventsOn((CtrXPC::Client::State **)self->CtrXPCClientPtr.__ptr_);
}

- (void)setClientEventsOff
{
  CtrXPC::Client::eventsOff((CtrXPC::Client::State **)self->CtrXPCClientPtr.__ptr_);
}

- (Result)getProperty:(Result *__return_ptr)retstr output:
{
  uint64_t v1;
  const char *v2;
  void *v3;
  Result *result;

  CtrXPC::Client::getProperty(*(CtrXPC::Client **)(v1 + 8), v2, v3, (uint64_t)retstr);
  return result;
}

- (Result)setProperty:(Result *__return_ptr)retstr prperty_val:
{
  uint64_t v1;
  const char *v2;
  const char *v3;
  Result *result;

  CtrXPC::Client::set(*(CtrXPC::Client **)(v1 + 8), v2, v3, (uint64_t)retstr);
  return result;
}

- (Result)sendData:(Result *__return_ptr)retstr data:data_length:
{
  uint64_t v1;
  const char *v2;
  unsigned __int8 *v3;
  uint64_t v4;
  Result *result;

  CtrXPC::Client::sendData(*(CtrXPC::Client **)(v1 + 8), v2, v3, v4, (uint64_t)retstr);
  return result;
}

- (Result)addPrefix:(Result *__return_ptr)retstr
{
  uint64_t v1;
  _OWORD *v2;
  CtrXPC::Client *v3;
  __int128 v4;
  Result *result;
  _OWORD v6[2];

  v3 = *(CtrXPC::Client **)(v1 + 8);
  v4 = v2[1];
  v6[0] = *v2;
  v6[1] = v4;
  CtrXPC::Client::addPrefix(v3, (uint64_t)v6, (uint64_t)retstr);
  return result;
}

- (Result)removePrefix:(Result *__return_ptr)retstr
{
  uint64_t v1;
  _OWORD *v2;
  CtrXPC::Client *v3;
  __int128 v4;
  Result *result;
  _OWORD v6[2];

  v3 = *(CtrXPC::Client **)(v1 + 8);
  v4 = v2[1];
  v6[0] = *v2;
  v6[1] = v4;
  CtrXPC::Client::removePrefix(v3, (uint64_t)v6, (uint64_t)retstr);
  return result;
}

- (Result)updateAccData:(Result *__return_ptr)retstr
{
  uint64_t v1;
  __int128 *v2;
  CtrXPC::Client *v3;
  Result *result;
  __int128 v5;
  uint64_t v6;

  v3 = *(CtrXPC::Client **)(v1 + 8);
  v5 = *v2;
  v6 = *((_QWORD *)v2 + 2);
  CtrXPC::Client::updateAccData(v3, (uint64_t)&v5, (uint64_t)retstr);
  return result;
}

- (Result)form:(Result *__return_ptr)retstr
{
  uint64_t v1;
  uint64_t v2;
  CtrXPC::Client *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  Result *result;
  _OWORD v8[6];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(CtrXPC::Client **)(v1 + 8);
  v4 = *(_OWORD *)(v2 + 80);
  v8[4] = *(_OWORD *)(v2 + 64);
  v8[5] = v4;
  v9 = *(_QWORD *)(v2 + 96);
  v5 = *(_OWORD *)(v2 + 16);
  v8[0] = *(_OWORD *)v2;
  v8[1] = v5;
  v6 = *(_OWORD *)(v2 + 48);
  v8[2] = *(_OWORD *)(v2 + 32);
  v8[3] = v6;
  CtrXPC::Client::form(v3, (uint64_t)v8, (uint64_t)retstr);
  return result;
}

- (Result)leave
{
  uint64_t v1;
  Result *result;

  CtrXPC::Client::leave(*(CtrXPC::Client **)(v1 + 8), (uint64_t)retstr);
  return result;
}

- (Result)scan:(Result *__return_ptr)retstr
{
  uint64_t v1;
  __int128 *v2;
  CtrXPC::Client *v3;
  Result *result;
  __int128 v5;
  uint64_t v6;

  v3 = *(CtrXPC::Client **)(v1 + 8);
  v5 = *v2;
  v6 = *((_QWORD *)v2 + 2);
  CtrXPC::Client::scan(v3, (uint64_t)&v5, (uint64_t)retstr);
  return result;
}

- (Result)addService:(Result *__return_ptr)retstr
{
  uint64_t v1;
  __int128 *v2;
  CtrXPC::Client *v3;
  Result *result;
  __int128 v5;
  uint64_t v6;

  v3 = *(CtrXPC::Client **)(v1 + 8);
  v5 = *v2;
  v6 = *((_QWORD *)v2 + 2);
  CtrXPC::Client::addService(v3, (uint64_t)&v5, (uint64_t)retstr);
  return result;
}

- (Result)removeService:(Result *__return_ptr)retstr
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Result *result;

  CtrXPC::Client::removeService(*(CtrXPC::Client **)(v1 + 8), v2, v3, (uint64_t)retstr);
  return result;
}

- (Result)join:(Result *__return_ptr)retstr
{
  uint64_t v1;
  uint64_t v2;
  CtrXPC::Client *v3;
  __int128 v4;
  Result *result;
  _OWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(CtrXPC::Client **)(v1 + 8);
  v4 = *(_OWORD *)(v2 + 16);
  v6[0] = *(_OWORD *)v2;
  v6[1] = v4;
  v6[2] = *(_OWORD *)(v2 + 32);
  v7 = *(_QWORD *)(v2 + 48);
  CtrXPC::Client::join(v3, (uint64_t)v6, (uint64_t)retstr);
  return result;
}

- (Result)joiner:(Result *__return_ptr)retstr
{
  uint64_t v1;
  uint64_t v2;
  CtrXPC::Client *v3;
  __int128 v4;
  __int128 v5;
  Result *result;
  _OWORD v7[4];
  uint64_t v8;

  v3 = *(CtrXPC::Client **)(v1 + 8);
  v4 = *(_OWORD *)(v2 + 48);
  v7[2] = *(_OWORD *)(v2 + 32);
  v7[3] = v4;
  v8 = *(_QWORD *)(v2 + 64);
  v5 = *(_OWORD *)(v2 + 16);
  v7[0] = *(_OWORD *)v2;
  v7[1] = v5;
  CtrXPC::Client::joiner(v3, (uint64_t)v7, (uint64_t)retstr);
  return result;
}

- (Result)resume
{
  uint64_t v1;
  Result *result;

  CtrXPC::Client::resume(*(CtrXPC::Client **)(v1 + 8), (uint64_t)retstr);
  return result;
}

- (Result)reset:(Result *__return_ptr)retstr
{
  uint64_t v1;
  char v2;
  Result *result;

  CtrXPC::Client::reset(*(CtrXPC::Client **)(v1 + 8), v2, (uint64_t)retstr);
  return result;
}

- (Result)sendNwDiagReqGet:(Result *__return_ptr)retstr
{
  uint64_t v1;
  uint64_t v2;
  CtrXPC::Client *v3;
  __int128 v4;
  Result *result;
  _OWORD v6[2];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(CtrXPC::Client **)(v1 + 8);
  v4 = *(_OWORD *)(v2 + 16);
  v6[0] = *(_OWORD *)v2;
  v6[1] = v4;
  v7 = *(_DWORD *)(v2 + 32);
  CtrXPC::Client::send_network_diag_get(v3, (uint64_t)v6, (uint64_t)retstr);
  return result;
}

- (Result)setChannel:(Result *__return_ptr)retstr
{
  uint64_t v1;
  char v2;
  Result *result;

  CtrXPC::Client::setChannel(*(CtrXPC::Client **)(v1 + 8), v2, (uint64_t)retstr);
  return result;
}

- (Result)attachToNetwork:(Result *__return_ptr)retstr output:
{
  uint64_t v1;
  _OWORD *v2;
  uint64_t v3;
  CtrXPC::Client *v4;
  __int128 v5;
  Result *result;
  _OWORD v7[3];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = *(CtrXPC::Client **)(v1 + 8);
  v5 = v2[1];
  v7[0] = *v2;
  v7[1] = v5;
  v7[2] = v2[2];
  CtrXPC::Client::attachToNetwork(v4, (uint64_t)v7, v3, (uint64_t)retstr);
  return result;
}

- (Result)attachToNetwork:(Result *__return_ptr)retstr
{
  uint64_t v1;
  _OWORD *v2;
  CtrXPC::Client *v3;
  __int128 v4;
  Result *result;
  _OWORD v6[3];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *(CtrXPC::Client **)(v1 + 8);
  v4 = v2[1];
  v6[0] = *v2;
  v6[1] = v4;
  v6[2] = v2[2];
  CtrXPC::Client::attachToNetwork(v3, v6, (uint64_t)retstr);
  return result;
}

- (Result)commissionOrFormNetwork:(Result *__return_ptr)retstr output:
{
  uint64_t v1;
  char v2;
  void *v3;
  Result *result;

  CtrXPC::Client::commissionOrFormNetwork(*(CtrXPC::Client **)(v1 + 8), v3, v2, (uint64_t)retstr);
  return result;
}

- (Result)generatePSKc:(Result *__return_ptr)retstr output:
{
  uint64_t v1;
  _OWORD *v2;
  uint64_t v3;
  CtrXPC::Client *v4;
  __int128 v5;
  Result *result;
  _OWORD v7[2];

  v4 = *(CtrXPC::Client **)(v1 + 8);
  v5 = v2[1];
  v7[0] = *v2;
  v7[1] = v5;
  CtrXPC::Client::generatePSKc(v4, (uint64_t)v7, v3, (uint64_t)retstr);
  return result;
}

- (Result)threadStart:(Result *__return_ptr)retstr outputUniqueId:
{
  Result *result;

  retstr->var0 = 3;
  *(_OWORD *)&retstr->var1.var0.var0.var0.var1.var1 = 0uLL;
  retstr->var1.var0.var0.var0.var1.var0 = 0;
  return result;
}

- (Result)threadStart:(Result *__return_ptr)retstr outUniqueId:
{
  Result *result;

  retstr->var0 = 3;
  *(_OWORD *)&retstr->var1.var0.var0.var0.var1.var1 = 0uLL;
  retstr->var1.var0.var0.var0.var1.var0 = 0;
  return result;
}

- (Result)generateThreadDiagnosticsMonitorLogs
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  int v5;
  Result *result;
  void *v7;
  char v8;

  v2 = v1;
  std::string::basic_string[abi:ne180100]<0>(&v7, "Command Error");
  v4 = v7;
  v5 = v8;
  CtrXPC::Client::generate_diagnostics(*(CtrXPC::Client **)(v2 + 8), (uint64_t)retstr);
  if (v5 < 0)
    operator delete(v4);
  return result;
}

- (Result)threadStart:(Result *__return_ptr)retstr outUniqueId:waitForSync:
{
  Result *result;

  retstr->var0 = 3;
  *(_OWORD *)&retstr->var1.var0.var0.var0.var1.var1 = 0uLL;
  retstr->var1.var0.var0.var0.var1.var0 = 0;
  return result;
}

- (Result)threadLeave
{
  uint64_t v1;
  Result *result;

  CtrXPC::Client::threadLeave(*(CtrXPC::Client **)(v1 + 8), (uint64_t)retstr);
  return result;
}

- (void)threadLeaveWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  CtrXPC::Client::threadLeaveWithCompletion((uint64_t *)self->CtrXPCClientPtr.__ptr_, (uint64_t)v4);

}

- (void)captureTriggerData:(int)a3 triggerId:(int)a4 accessoryInfoList:(id)a5 completionHandler:(id)a6
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  char v23;
  char v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  CtrTriggerResult *v76;
  CtrTriggerResult *v77;
  void *context;
  void (**v79)(id, uint64_t, uint64_t);
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  char v87;
  void *v88;
  char v89;
  void *v90;
  id v91;
  void *__p[2];
  char v93;
  uint8_t buf[4];
  const char *v95;
  uint64_t v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned __int8 v106;
  unsigned __int8 v107;
  _QWORD *v108;
  uint64_t v109;
  uint64_t v110;
  unsigned int v111;
  _QWORD *v112;
  uint64_t v113;
  uint64_t v114;
  char v115;
  int v116;
  unsigned __int8 v117;
  uint64_t v118;
  _QWORD *v119;
  uint64_t v120;
  uint64_t v121;
  char v122;
  void *v123;
  unsigned int v124;
  unsigned int v125;
  unsigned int v126;
  unsigned int v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  unsigned __int8 v134;
  unsigned __int8 v135;
  _QWORD *v136;
  uint64_t v137;
  uint64_t v138;
  unsigned int v139;
  _QWORD *v140;
  uint64_t v141;
  uint64_t v142;
  char v143;
  int v144;
  unsigned __int8 v145;
  uint64_t v146;
  _QWORD *v147;
  uint64_t v148;
  uint64_t v149;
  char v150;
  _BYTE v151[8];
  unint64_t v152;
  _QWORD v153[698];
  char v154;
  _QWORD v155[3];

  v6 = MEMORY[0x24BDAC7A8](self, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6);
  v8 = v7;
  v87 = v9;
  v89 = v10;
  v85 = v6;
  v155[1] = *MEMORY[0x24BDAC8D0];
  v91 = v11;
  v79 = v8;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v95 = "-[CtrClient captureTriggerData:triggerId:accessoryInfoList:completionHandler:]";
    LOWORD(v96) = 1024;
    *(_DWORD *)((char *)&v96 + 2) = 276;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  context = (void *)MEMORY[0x23B8415A0]();
  v108 = 0;
  v109 = 0;
  v12 = &v154;
  v110 = 0;
  v112 = 0;
  v113 = 0;
  v69 = &v108;
  v63 = &v112;
  v114 = 0;
  v75 = &v119;
  v121 = 0;
  v13 = 200;
  v119 = 0;
  v120 = 0;
  do
  {
    v14 = &buf[v13];
    *((_QWORD *)v14 + 2) = 0;
    *((_QWORD *)v14 + 3) = 0;
    *(_QWORD *)v14 = 0;
    *((_QWORD *)v14 + 1) = 0;
    *((_QWORD *)v14 + 4) = 0;
    *((_QWORD *)v14 + 5) = 0;
    *((_QWORD *)v14 + 6) = 0;
    *((_QWORD *)v14 + 7) = 0;
    *((_QWORD *)v14 + 8) = 0;
    *((_QWORD *)v14 + 9) = 0;
    v13 += 184;
    *((_QWORD *)v14 + 10) = 0;
    *((_QWORD *)v14 + 11) = 0;
  }
  while (v14 + 184 != (uint8_t *)&v123);
  v137 = 0;
  v66 = &v136;
  v136 = 0;
  v138 = 0;
  v60 = &v140;
  v140 = 0;
  v142 = 0;
  v141 = 0;
  v72 = &v147;
  v147 = 0;
  v149 = 0;
  v15 = 18792;
  v148 = 0;
  do
  {
    v16 = &buf[v15];
    *((_QWORD *)v16 + 2) = 0;
    *((_QWORD *)v16 + 3) = 0;
    *(_QWORD *)v16 = 0;
    *((_QWORD *)v16 + 1) = 0;
    *((_QWORD *)v16 + 4) = 0;
    *((_QWORD *)v16 + 5) = 0;
    *((_QWORD *)v16 + 6) = 0;
    *((_QWORD *)v16 + 7) = 0;
    *((_QWORD *)v16 + 8) = 0;
    *((_QWORD *)v16 + 9) = 0;
    v15 += 184;
    *((_QWORD *)v16 + 10) = 0;
    *((_QWORD *)v16 + 11) = 0;
  }
  while (v16 + 184 != v151);
  v17 = 37208;
  do
  {
    v18 = &buf[v17];
    *((_QWORD *)v18 + 2) = 0;
    *((_QWORD *)v18 + 3) = 0;
    *(_QWORD *)v18 = 0;
    *((_QWORD *)v18 + 1) = 0;
    *((_QWORD *)v18 + 4) = 0;
    *((_QWORD *)v18 + 5) = 0;
    v17 += 56;
  }
  while (v18 + 56 != (uint8_t *)v155);
  if (v91)
  {
    v152 = objc_msgSend(v91, "count");
    if (v152)
    {
      v19 = 0;
      do
      {
        objc_msgSend(v91, "objectAtIndex:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "ipaddr");
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v21, "UTF8String"));
        std::string::operator=[abi:ne180100]((uint64_t)&v153[7 * v19], (__int128 *)__p);
        if (v93 < 0)
          operator delete(__p[0]);

        objc_msgSend(v20, "name");
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v22, "UTF8String"));
        std::string::operator=[abi:ne180100]((uint64_t)&v153[7 * v19 + 3], (__int128 *)__p);
        if (v93 < 0)
          operator delete(__p[0]);

        v23 = objc_msgSend(v20, "isBatteryPowered");
        if ((unint64_t)(56 * v19 - 5552) < 0xFFFFFFFFFFFF58C7
          || (BYTE1(v153[7 * v19 + 6]) = v23,
              v24 = objc_msgSend(v20, "isMatter"),
              (unint64_t)(56 * v19 - 5553) < 0xFFFFFFFFFFFF58C7))
        {
          __break(1u);
LABEL_81:
          __break(0x5500u);
        }
        LOBYTE(v153[7 * v19 + 6]) = v24;

        v25 = v19 + 1;
        if (__OFADD__((_DWORD)v19, 1))
          goto LABEL_81;
        v19 = v25;
      }
      while (v152 > v25);
    }
  }
  else
  {
    v152 = 0;
  }
  v151[1] = v87;
  v151[0] = v89;
  bzero((char *)&v95 + 4, 0x9140uLL);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 0, 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  CtrXPC::Client::captureTriggerDataWithCompletion(*(CtrXPC::Client **)(v85 + 8), (Ctr_triggerBasedStats *)buf);
  if (v122)
  {
    if (SHIBYTE(v121) < 0)
    {
      if (!v120)
      {
LABEL_30:
        v82 = 0;
LABEL_31:
        if (SHIBYTE(v149) < 0)
        {
          if (!v148)
          {
LABEL_37:
            v83 = 0;
LABEL_38:
            if (SHIBYTE(v110) < 0)
            {
              if (!v109)
              {
LABEL_44:
                v84 = 0;
LABEL_45:
                if (SHIBYTE(v138) < 0)
                {
                  if (!v137)
                  {
LABEL_51:
                    v86 = 0;
LABEL_52:
                    if (SHIBYTE(v114) < 0)
                    {
                      if (!v113)
                      {
LABEL_58:
                        v88 = 0;
LABEL_59:
                        if (SHIBYTE(v142) < 0)
                        {
                          if (!v141)
                          {
LABEL_65:
                            v90 = 0;
                            goto LABEL_66;
                          }
                          v60 = v140;
                        }
                        else if (!HIBYTE(v142))
                        {
                          goto LABEL_65;
                        }
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v60);
                        v90 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_66:
                        v76 = [CtrTriggerResult alloc];
                        v73 = BYTE4(v95);
                        v70 = BYTE5(v95);
                        v67 = BYTE6(v95);
                        v64 = HIBYTE(v95);
                        v61 = v96;
                        v58 = HIDWORD(v96);
                        v56 = v97;
                        v54 = v98;
                        v52 = v99;
                        v50 = v100;
                        v48 = v101;
                        v46 = v102;
                        v27 = v103;
                        v28 = v104;
                        v29 = v105;
                        v30 = v106;
                        v31 = v107;
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v111);
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)((char *)&v44 + 1) = v116;
                        LOBYTE(v44) = v115;
                        LOBYTE(v43) = v31 != 0;
                        LOBYTE(v42) = v30 != 0;
                        v26 = -[CtrTriggerResult initWithData:num_thirdparty_BRs:num_thread_networks:max_simultaneous_prefixes:tx_total:tx_total_success:tx_success_perc:rx_total:rx_total_success:rx_success_perc:tx_delayavg:tx_delaymin:tx_delaymax:coex_tx_denied_reqs_perc:coex_rx_denied_reqs_perc:thirdparty_leader:last_known_device_role:is_partition_id_change_detected:leader_name:num_routers:thread_mesh_size:is_parent_change_detected:is_threaddaemon_crash_detected:is_threadfw_crash_detected:is_role_detach_disable_detected:is_border_router_advertised:num_border_routers_advertised:duration:](v76, "initWithData:num_thirdparty_BRs:num_thread_networks:max_simultaneous_prefixes:tx_total:tx_total_success:tx_success_perc:rx_total:rx_total_success:rx_success_perc:tx_delayavg:tx_delaymin:tx_delaymax:coex_tx_denied_reqs_perc:coex_rx_denied_reqs_perc:thirdparty_leader:last_known_device_role:is_partition_id_change_detected:leader_name:num_routers:thread_mesh_size:is_parent_change_detected:is_threaddaemon_crash_detected:is_threadfw_crash_detected:is_role_detach_disable_detected:is_border_router_advertised:num_border_routers_advertised:duration:", v73, v70, v67, v64, v61, v58, v56, v54, v52, v50, v48,
                                v46,
                                v27,
                                v28,
                                v29,
                                v42,
                                v82,
                                v43,
                                v84,
                                v32,
                                v88,
                                v44,
                                v117,
                                v118);

                        goto LABEL_67;
                      }
                      v63 = v112;
                    }
                    else if (!HIBYTE(v114))
                    {
                      goto LABEL_58;
                    }
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v63);
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    goto LABEL_59;
                  }
                  v66 = v136;
                }
                else if (!HIBYTE(v138))
                {
                  goto LABEL_51;
                }
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v66);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_52;
              }
              v69 = v108;
            }
            else if (!HIBYTE(v110))
            {
              goto LABEL_44;
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v69, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_45;
          }
          v72 = v147;
        }
        else if (!HIBYTE(v149))
        {
          goto LABEL_37;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v72);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      }
      v75 = v119;
    }
    else if (!HIBYTE(v121))
    {
      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v75);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  v82 = 0;
  v83 = 0;
  v84 = 0;
  v86 = 0;
  v88 = 0;
  v90 = 0;
  v26 = 0;
LABEL_67:
  if (v150)
  {
    v77 = [CtrTriggerResult alloc];
    v74 = v123;
    v71 = BYTE1(v123);
    v68 = BYTE2(v123);
    v65 = BYTE3(v123);
    v62 = HIDWORD(v123);
    v59 = v124;
    v57 = v125;
    v55 = v126;
    v53 = v127;
    v51 = v128;
    v49 = v129;
    v47 = v130;
    v33 = v132;
    v45 = v131;
    v34 = v133;
    v35 = v134;
    v36 = v135;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v139);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)((char *)&v44 + 1) = v144;
    LOBYTE(v44) = v143;
    LOBYTE(v43) = v36 != 0;
    LOBYTE(v42) = v35 != 0;
    v38 = -[CtrTriggerResult initWithData:num_thirdparty_BRs:num_thread_networks:max_simultaneous_prefixes:tx_total:tx_total_success:tx_success_perc:rx_total:rx_total_success:rx_success_perc:tx_delayavg:tx_delaymin:tx_delaymax:coex_tx_denied_reqs_perc:coex_rx_denied_reqs_perc:thirdparty_leader:last_known_device_role:is_partition_id_change_detected:leader_name:num_routers:thread_mesh_size:is_parent_change_detected:is_threaddaemon_crash_detected:is_threadfw_crash_detected:is_role_detach_disable_detected:is_border_router_advertised:num_border_routers_advertised:duration:](v77, "initWithData:num_thirdparty_BRs:num_thread_networks:max_simultaneous_prefixes:tx_total:tx_total_success:tx_success_perc:rx_total:rx_total_success:rx_success_perc:tx_delayavg:tx_delaymin:tx_delaymax:coex_tx_denied_reqs_perc:coex_rx_denied_reqs_perc:thirdparty_leader:last_known_device_role:is_partition_id_change_detected:leader_name:num_routers:thread_mesh_size:is_parent_change_detected:is_threaddaemon_crash_detected:is_threadfw_crash_detected:is_role_detach_disable_detected:is_border_router_advertised:num_border_routers_advertised:duration:", v74, v71, v68, v65, v62, v59, v57, v55, v53, v51, v49, v47, v45,
            v33,
            v34,
            v42,
            v83,
            v43,
            v86,
            v37,
            v90,
            v44,
            v145,
            v146);

  }
  else
  {
    v38 = 0;
  }
  if (v38 | v26)
  {
    v40 = v80;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Results are invalid"), 1, 0);
    v39 = objc_claimAutoreleasedReturnValue();

    v40 = (void *)v39;
  }
  v81 = v40;
  v79[2](v79, v26, v38);

  v41 = -5600;
  do
  {
    if (*v12 < 0)
      operator delete(*(void **)(v12 - 23));
    if (*(v12 - 24) < 0)
      operator delete(*(void **)(v12 - 47));
    v12 -= 56;
    v41 += 56;
  }
  while (v41);
  Ctr_triggerStatsResult::~Ctr_triggerStatsResult(&v123);
  Ctr_triggerStatsResult::~Ctr_triggerStatsResult((void **)((char *)&v95 + 4));
  objc_autoreleasePoolPop(context);

}

- (Result)updatePrimaryResident:(Result *__return_ptr)retstr isPrimaryResidentThreadCapable:primaryResidentInfo:
{
  uint64_t v1;
  int v2;
  int v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  CtrXPC::Client *v13;
  Result *result;
  _BYTE v15[8];
  uint64_t v16;
  _BYTE buf[12];
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v5 = v3;
  v6 = v2;
  v7 = v1;
  v22 = *MEMORY[0x24BDAC8D0];
  v9 = v4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CtrClient updatePrimaryResident:isPrimaryResidentThreadCapable:primaryResidentInfo:]";
    v18 = 1024;
    v19 = 491;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  v10 = *(void **)buf;
  v11 = SHIBYTE(v21);
  if (v9)
    v12 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  else
    v12 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v9;
    v18 = 1024;
    v19 = v6;
    v20 = 1024;
    v21 = v5;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "primaryInfo=%@,  isPrimaryResident=%d, isPrimaryResidentThreadCapable=%d\n", buf, 0x18u);
  }
  v13 = *(CtrXPC::Client **)(v7 + 8);
  v15[0] = v6 != 0;
  v15[1] = v5 != 0;
  v16 = v12;
  CtrXPC::Client::updatePrimaryResident(v13, (uint64_t)v15, (uint64_t)retstr);
  if (v11 < 0)
    operator delete(v10);

  return result;
}

- (void)threadStart:(id)a3 geoAvailable:(BOOL)a4 isPrimaryUser:(BOOL)a5 waitForSync:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  xpc_object_t v17;
  uint64_t *v18;
  uint64_t *ptr;
  __int128 v20;
  __int128 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  _OWORD v29[3];
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  __n128 (*v34)(uint64_t, uint64_t);
  uint64_t (*v35)();
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  int v41;
  char v42;
  uint64_t v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  _QWORD v49[2];

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v49[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  v31 = 0;
  v32 = &v31;
  v33 = 0x6812000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  v36 = "";
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v42 = 1;
  v43 = 0;
  if (v12)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
    if (v14)
    {
      v15 = objc_retainAutorelease(v14);
      v16 = objc_msgSend(v15, "UTF8String");
      v32[10] = v16;
      v17 = xpc_dictionary_create(0, 0, 0);
      v18 = v32;
      v32[7] = (uint64_t)v17;
      *((_BYTE *)v18 + 72) = v8;
      *((_BYTE *)v18 + 88) = v10;
      *((_BYTE *)v18 + 92) = v9;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v15;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "activeOperationalDataset : %@ \n", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v45) = v8;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "waitForSync flag : %d \n", buf, 8u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v45) = v10;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "geoAvailable flag : %d\n", buf, 8u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v45) = v9;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "isPrimaryUser flag : %d\n", buf, 8u);
      }
      ptr = (uint64_t *)self->CtrXPCClientPtr.__ptr_;
      v20 = *((_OWORD *)v32 + 3);
      v21 = *((_OWORD *)v32 + 4);
      v30 = v32[12];
      v29[0] = v20;
      v29[1] = v21;
      v29[2] = *((_OWORD *)v32 + 5);
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __75__CtrClient_threadStart_geoAvailable_isPrimaryUser_waitForSync_completion___block_invoke;
      v26[3] = &unk_250B20870;
      v28 = &v31;
      v27 = v13;
      CtrXPC::Client::threadStartWithCompletion(ptr, (uint64_t)v29, (uint64_t)v26);

    }
    else
    {
      v24 = (void *)MEMORY[0x24BDD1540];
      v46 = *MEMORY[0x24BDD0FC8];
      v47 = CFSTR("activeOperationalDataset parameter is encoded incorrectly");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v25);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, id))v13 + 2))(v13, v15);
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v48 = *MEMORY[0x24BDD0FC8];
    v49[0] = CFSTR("activeOperationalDataset parameter is required");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v23);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, id))v13 + 2))(v13, v15);
  }

  _Block_object_dispose(&v31, 8);
}

void __75__CtrClient_threadStart_geoAvailable_isPrimaryUser_waitForSync_completion___block_invoke(uint64_t a1, _DWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
  if (*a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __75__CtrClient_threadStart_geoAvailable_isPrimaryUser_waitForSync_completion___block_invoke_cold_1();
    v4 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDD0FC8];
    v8 = CFSTR("Error: threadstart failed !");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[CtrClient threadStart:geoAvailable:isPrimaryUser:waitForSync:completion:]_block_invoke";
      v11 = 1024;
      v12 = 544;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s:%d: threadstart is successful !", buf, 0x12u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)threadStart:(id)a3 activeOperationalDataSet:(id)a4 geoAvailable:(BOOL)a5 waitForSync:(BOOL)a6 completion:(id)a7
{
  -[CtrClient threadStart:activeOperationalDataSet:geoAvailable:routerMode:eMAC:waitForSync:completion:](self, "threadStart:activeOperationalDataSet:geoAvailable:routerMode:eMAC:waitForSync:completion:", a3, a4, a5, 0, 0, a6, a7);
}

- (void)threadStart:(id)a3 activeOperationalDataSet:(id)a4 geoAvailable:(BOOL)a5 routerMode:(BOOL)a6 eMAC:(id)a7 waitForSync:(BOOL)a8 completion:(id)a9
{
  _BOOL4 v9;
  _BOOL4 v11;
  _BOOL4 v12;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  xpc_object_t v25;
  uint64_t v26;
  uint64_t *v27;
  id v28;
  uint64_t v29;
  uint64_t *ptr;
  __int128 v31;
  __int128 v32;
  id v33;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  _QWORD *v38;
  _OWORD v39[3];
  uint64_t v40;
  _QWORD v41[5];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  __n128 (*v46)(uint64_t, uint64_t);
  uint64_t (*v47)();
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  int v53;
  char v54;
  uint64_t v55;
  uint8_t buf[4];
  id v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  _QWORD v61[4];

  v9 = a8;
  v11 = a6;
  v12 = a5;
  v61[1] = *MEMORY[0x24BDAC8D0];
  v14 = (unint64_t)a3;
  v15 = a4;
  v16 = a7;
  v17 = a9;
  v43 = 0;
  v44 = &v43;
  v45 = 0x6812000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  v48 = "";
  v49 = 0;
  v50 = 0;
  v51 = 0;
  v52 = 0;
  v53 = 0;
  v54 = 1;
  v55 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__19;
  v41[4] = __Block_byref_object_dispose__20;
  v18 = (unint64_t)v15;
  v42 = (id)v18;
  if (v14 | v18)
  {
    if (v16 || !v11)
    {
      if (v14)
      {
        objc_msgSend((id)v14, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v33 = objc_retainAutorelease(v24);
          v24 = (void *)objc_msgSend(v33, "UTF8String");
        }
        else
        {
          v33 = 0;
        }
      }
      else
      {
        v33 = 0;
        v24 = 0;
      }
      v44[6] = (uint64_t)v24;
      v25 = xpc_dictionary_create(0, 0, 0);
      v26 = 0;
      v27 = v44;
      v44[7] = (uint64_t)v25;
      *((_BYTE *)v27 + 72) = v9;
      *((_BYTE *)v27 + 88) = v12;
      *((_BYTE *)v27 + 90) = v11;
      v28 = 0;
      if (v16 && v11)
      {
        v28 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v16, 4));
        v26 = objc_msgSend(v28, "UTF8String");
        v27 = v44;
      }
      v27[12] = v26;
      if (v18)
      {
        v21 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v18, 4));
        v29 = objc_msgSend(v21, "UTF8String");
        v27 = v44;
      }
      else
      {
        v29 = 0;
        v21 = 0;
      }
      v27[10] = v29;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v33;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "inUniqueId string : %@ \n", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v21;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "activeOperationalDataset : %@ \n", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v9;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "waitForSync flag : %d \n", buf, 8u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v12;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "geoAvailable flag : %d\n", buf, 8u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v11;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "routerMode flag : %d\n", buf, 8u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v28;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "eMAC str : %@\n", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v16;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "eMAC : %@\n", buf, 0xCu);
      }
      ptr = (uint64_t *)self->CtrXPCClientPtr.__ptr_;
      v31 = *((_OWORD *)v44 + 3);
      v32 = *((_OWORD *)v44 + 4);
      v40 = v44[12];
      v39[0] = v31;
      v39[1] = v32;
      v39[2] = *((_OWORD *)v44 + 5);
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __102__CtrClient_threadStart_activeOperationalDataSet_geoAvailable_routerMode_eMAC_waitForSync_completion___block_invoke;
      v35[3] = &unk_250B20898;
      v37 = &v43;
      v36 = v17;
      v38 = v41;
      CtrXPC::Client::threadStartWithCompletion(ptr, (uint64_t)v39, (uint64_t)v35);

    }
    else
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v58 = *MEMORY[0x24BDD0FC8];
      v59 = CFSTR("eMAC is required if router mode is on");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, id))v17 + 2))(v17, 0, v21);
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v60 = *MEMORY[0x24BDD0FC8];
    v61[0] = CFSTR("inUniqueId or activeOperationalDataset parameter is required");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v23);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, id))v17 + 2))(v17, 0, v21);
  }

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);

}

void __102__CtrClient_threadStart_activeOperationalDataSet_geoAvailable_routerMode_eMAC_waitForSync_completion___block_invoke(_QWORD *a1, _DWORD *a2)
{
  void *v3;
  char *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*a2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(a1[5] + 8) + 56));
    (*(void (**)(void))(a1[4] + 16))();

    return;
  }
  if (xpc_dictionary_get_string(*(xpc_object_t *)(*(_QWORD *)(a1[5] + 8) + 56), "PropVal"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(*(xpc_object_t *)(*(_QWORD *)(a1[5] + 8) + 56), "PropVal"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v3);
      if (v4)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v8 = v4;
          v9 = 2112;
          v10 = v3;
          _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Output UUID : %@, UUID-NSSTRING : %@ \n", buf, 0x16u);
        }
        xpc_release(*(xpc_object_t *)(*(_QWORD *)(a1[5] + 8) + 56));
        (*(void (**)(void))(a1[4] + 16))();

        return;
      }
    }

  }
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[CtrClient threadStart:activeOperationalDataSet:geoAvailable:routerMode:eMAC:waitForSync:completion:]_block_invoke";
      v9 = 1024;
      LODWORD(v10) = 640;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s:%d: Even after the success, output value is nil", buf, 0x12u);
    }
    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __102__CtrClient_threadStart_activeOperationalDataSet_geoAvailable_routerMode_eMAC_waitForSync_completion___block_invoke_cold_1();

  }
}

- (void)threadStopWithCompletion:(id)a3
{
  id v4;
  uint64_t *ptr;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[3];
  char v10;
  __int128 v11;
  char v12;
  __int16 v13;
  char v14;
  uint64_t v15;
  _BYTE v16[15];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0;
  *(_QWORD *)&v16[7] = 0;
  ptr = (uint64_t *)self->CtrXPCClientPtr.__ptr_;
  v9[0] = 0;
  v9[2] = 0;
  v10 = 0;
  v11 = *(unint64_t *)v16;
  v12 = 1;
  v13 = 0;
  v14 = 1;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__CtrClient_threadStopWithCompletion___block_invoke;
  v7[3] = &unk_250B208C0;
  v8 = v4;
  v6 = v4;
  CtrXPC::Client::threadStopWithCompletion(ptr, (uint64_t)v9, (uint64_t)v7);

}

void __38__CtrClient_threadStopWithCompletion___block_invoke(uint64_t a1, _DWORD *a2)
{
  id v3;

  if (*a2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)provideExtendedMACAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  id v9;
  uint64_t v10;
  uint64_t *ptr;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  xpc_object_t v16;
  uint64_t v17;
  char v18;
  _BYTE v19[19];
  char v20;
  uint64_t v21;
  _QWORD v22[3];
  char v23;
  _BYTE v24[19];
  char v25;
  uint64_t v26;
  _BYTE v27[19];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  *(_DWORD *)&v27[15] = 0;
  *(_QWORD *)&v27[7] = 0;
  v8 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    v9 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4));
    v10 = objc_msgSend(v9, "UTF8String");
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  ptr = (uint64_t *)self->CtrXPCClientPtr.__ptr_;
  v22[0] = 0;
  v22[1] = v8;
  v22[2] = 0;
  v23 = 0;
  *(_OWORD *)v24 = *(_OWORD *)v27;
  *(_DWORD *)&v24[15] = *(_DWORD *)&v27[15];
  v25 = 1;
  v26 = v10;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__CtrClient_provideExtendedMACAddress_completion___block_invoke;
  v13[3] = &unk_250B208E8;
  v15 = 0;
  v16 = v8;
  v17 = 0;
  v18 = 0;
  *(_OWORD *)v19 = *(_OWORD *)v27;
  *(_DWORD *)&v19[15] = *(_DWORD *)&v27[15];
  v20 = 1;
  v21 = v10;
  v12 = v7;
  v14 = v12;
  CtrXPC::Client::provideExtendedMACAddress(ptr, (uint64_t)v22, (uint64_t)v13);

}

void __50__CtrClient_provideExtendedMACAddress_completion___block_invoke(uint64_t a1, _DWORD *a2)
{
  void *v3;
  const char *string;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 48);
  if (*a2)
  {
    string = xpc_dictionary_get_string(v3, "PropVal");
    if (string
      && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string),
          v5 = objc_claimAutoreleasedReturnValue(),
          (v6 = (void *)v5) != 0))
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD0FF0];
      v12[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, 0);
      v10 = 0;
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    xpc_release(*(xpc_object_t *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    xpc_release(v3);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

- (void)startPairingForExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, id);
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t *ptr;
  void *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(id, id);
  _QWORD v20[3];
  char v21;
  __int128 v22;
  __int16 v23;
  BOOL v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  _BYTE v31[18];
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, id))a5;
  *(_DWORD *)&v31[14] = 0;
  *(_QWORD *)&v31[7] = 0;
  if (v8 || !v6)
  {
    if (v8)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
      if (!v13)
      {
        v16 = (void *)MEMORY[0x24BDD1540];
        v27 = *MEMORY[0x24BDD0FC8];
        v28 = CFSTR("failed to interpret eMACAddress");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v17);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        v9[2](v9, v12);
        goto LABEL_10;
      }
      v12 = objc_retainAutorelease(v13);
      v14 = objc_msgSend(v12, "UTF8String");
    }
    else
    {
      v14 = 0;
      v12 = 0;
    }
    ptr = (uint64_t *)self->CtrXPCClientPtr.__ptr_;
    v20[0] = 0;
    v20[2] = 0;
    v21 = 0;
    v22 = *(_OWORD *)v31;
    v23 = *(_WORD *)&v31[16];
    v24 = v6;
    v25 = 1;
    v26 = v14;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __70__CtrClient_startPairingForExtendedMACAddress_isWedDevice_completion___block_invoke;
    v18[3] = &unk_250B208C0;
    v19 = v9;
    CtrXPC::Client::startPairing(ptr, (uint64_t)v20, (uint64_t)v18);

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    v30 = CFSTR("eMACAddress is required if it is wed device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v9[2](v9, v12);
  }
LABEL_10:

}

void __70__CtrClient_startPairingForExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1, _DWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (*a2)
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    v6 = *MEMORY[0x24BDD0FC8];
    v7[0] = CFSTR("Failed to start pairing");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

- (void)stopPairing:(id)a3
{
  id v4;
  uint64_t *ptr;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[3];
  char v10;
  _BYTE v11[19];
  char v12;
  uint64_t v13;
  _BYTE v14[15];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0;
  *(_QWORD *)&v14[7] = 0;
  ptr = (uint64_t *)self->CtrXPCClientPtr.__ptr_;
  v9[0] = 0;
  v9[2] = 0;
  v10 = 0;
  *(_DWORD *)&v11[15] = 0;
  *(_OWORD *)v11 = *(unint64_t *)v14;
  v12 = 1;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __25__CtrClient_stopPairing___block_invoke;
  v7[3] = &unk_250B208C0;
  v8 = v4;
  v6 = v4;
  CtrXPC::Client::stopPairing(ptr, (uint64_t)v9, (uint64_t)v7);

}

void __25__CtrClient_stopPairing___block_invoke(uint64_t a1, _DWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (*a2)
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    v6 = *MEMORY[0x24BDD0FC8];
    v7[0] = CFSTR("Failed to stop pairing");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

- (void)startFWUpdate:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, id);
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t *ptr;
  void *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(id, id);
  _QWORD v20[3];
  char v21;
  __int128 v22;
  __int16 v23;
  BOOL v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  _BYTE v31[18];
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, id))a5;
  *(_DWORD *)&v31[14] = 0;
  *(_QWORD *)&v31[7] = 0;
  if (v8 || !v6)
  {
    if (v8)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
      if (!v13)
      {
        v16 = (void *)MEMORY[0x24BDD1540];
        v27 = *MEMORY[0x24BDD0FC8];
        v28 = CFSTR("failed to interpret eMACAddress");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v17);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        v9[2](v9, v12);
        goto LABEL_10;
      }
      v12 = objc_retainAutorelease(v13);
      v14 = objc_msgSend(v12, "UTF8String");
    }
    else
    {
      v14 = 0;
      v12 = 0;
    }
    ptr = (uint64_t *)self->CtrXPCClientPtr.__ptr_;
    v20[0] = 0;
    v20[2] = 0;
    v21 = 0;
    v22 = *(_OWORD *)v31;
    v23 = *(_WORD *)&v31[16];
    v24 = v6;
    v25 = 1;
    v26 = v14;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __50__CtrClient_startFWUpdate_isWedDevice_completion___block_invoke;
    v18[3] = &unk_250B208C0;
    v19 = v9;
    CtrXPC::Client::startFWUpdate(ptr, (uint64_t)v20, (uint64_t)v18);

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    v30 = CFSTR("eMACAddress is required if it is wed device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v9[2](v9, v12);
  }
LABEL_10:

}

void __50__CtrClient_startFWUpdate_isWedDevice_completion___block_invoke(uint64_t a1, _DWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (*a2)
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    v6 = *MEMORY[0x24BDD0FC8];
    v7[0] = CFSTR("Failed to start FW Update");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

- (void)stopFWUpdate:(id)a3
{
  id v4;
  uint64_t *ptr;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[3];
  char v10;
  _BYTE v11[19];
  char v12;
  uint64_t v13;
  _BYTE v14[15];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0;
  *(_QWORD *)&v14[7] = 0;
  ptr = (uint64_t *)self->CtrXPCClientPtr.__ptr_;
  v9[0] = 0;
  v9[2] = 0;
  v10 = 0;
  *(_DWORD *)&v11[15] = 0;
  *(_OWORD *)v11 = *(unint64_t *)v14;
  v12 = 1;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __26__CtrClient_stopFWUpdate___block_invoke;
  v7[3] = &unk_250B208C0;
  v8 = v4;
  v6 = v4;
  CtrXPC::Client::stopFWUpdate(ptr, (uint64_t)v9, (uint64_t)v7);

}

void __26__CtrClient_stopFWUpdate___block_invoke(uint64_t a1, _DWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (*a2)
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    v6 = *MEMORY[0x24BDD0FC8];
    v7[0] = CFSTR("Failed to stop FW Update");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.threadradiod.ctr"), 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

- (void).cxx_destruct
{
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)&self->CtrXPCClientPtr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)init:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23A0F8000, MEMORY[0x24BDACB70], v0, "%s:%d: Thread radio is not supported on this device.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __75__CtrClient_threadStart_geoAvailable_isPrimaryUser_waitForSync_completion___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23A0F8000, MEMORY[0x24BDACB70], v0, "%s:%d: threadstart failed !", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __102__CtrClient_threadStart_activeOperationalDataSet_geoAvailable_routerMode_eMAC_waitForSync_completion___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23A0F8000, MEMORY[0x24BDACB70], v0, "%s:%d: Even after the success, output value is nil, returning error", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

@end
