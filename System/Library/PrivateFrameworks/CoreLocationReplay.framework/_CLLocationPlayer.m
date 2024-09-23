@implementation _CLLocationPlayer

- (_CLLocationPlayer)init
{
  char *v2;
  _CLLocationPlayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CLLocationPlayer;
  v2 = -[_CLLocationPlayer init](&v5, sel_init);
  v3 = (_CLLocationPlayer *)v2;
  if (v2)
  {
    v2[13648] = 1;
    *(_DWORD *)(v2 + 13649) = 0;
    *((_QWORD *)v2 + 1707) = 0xBFF0000000000000;
    *((_QWORD *)v2 + 1708) = objc_alloc_init(MEMORY[0x24BDBFAE8]);
  }
  return v3;
}

- (void)dealloc
{
  CLSimulationManager *simulationManager;
  objc_super v4;

  simulationManager = self->_simulationManager;
  if (simulationManager)
  {

    self->_simulationManager = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_CLLocationPlayer;
  -[_CLLocationPlayer dealloc](&v4, sel_dealloc);
}

- (void)setEnableFusion:(BOOL)a3
{
  NSObject *v5;
  uint8_t v6[16];

  if (-[_CLLocationPlayer isPlayerActive](self, "isPlayerActive"))
  {
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v5 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_210765000, v5, OS_LOG_TYPE_ERROR, "CLLP,setEnableFusion:,Cannot set a flag while player is active", v6, 2u);
    }
  }
  else
  {
    self->_fusionEnabled = a3;
  }
}

- (void)setEnableSimulation:(BOOL)a3
{
  NSObject *v5;
  uint8_t v6[16];

  if (-[_CLLocationPlayer isPlayerActive](self, "isPlayerActive"))
  {
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v5 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_210765000, v5, OS_LOG_TYPE_ERROR, "CLLP,setEnableSimulation:,Cannot set a flag while player is active", v6, 2u);
    }
  }
  else
  {
    self->_simulationEnabled = a3;
  }
}

- (void)start
{
  NSObject *v3;
  uint8_t v4[16];

  objc_sync_enter(self);
  if (-[_CLLocationPlayer isPlayerActive](self, "isPlayerActive"))
  {
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v3 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_210765000, v3, OS_LOG_TYPE_ERROR, "CLLP,start,Player is already active - nothing to start", v4, 2u);
    }
  }
  else
  {
    sub_21076B6DC((unsigned __int8 *)&self->_locationFuser.visionLock_);
    sub_21076B718((uint64_t)&self->_locationFuser, 1);
    atomic_store(0, (unsigned __int8 *)&self->_locationFuser.visionLock_);
    -[_CLLocationPlayer setPlayerActive:](self, "setPlayerActive:", 1);
  }
  objc_sync_exit(self);
}

- (void)stop
{
  NSObject *v3;
  uint8_t v4[16];

  objc_sync_enter(self);
  if (-[_CLLocationPlayer isPlayerActive](self, "isPlayerActive"))
  {
    -[_CLLocationPlayer setPlayerActive:](self, "setPlayerActive:", 0);
  }
  else
  {
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v3 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_210765000, v3, OS_LOG_TYPE_ERROR, "CLLP,stop,Player is already inactive - nothing to stop", v4, 2u);
    }
  }
  objc_sync_exit(self);
}

- (void)_updateARSessionState:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  objc_sync_enter(self);
  if (-[_CLLocationPlayer isPlayerActive](self, "isPlayerActive"))
  {
    if (a3 == 1)
    {
      if (-[_CLLocationPlayer isNotifierActive](self, "isNotifierActive"))
      {
        if (qword_254A70D38 != -1)
          dispatch_once(&qword_254A70D38, &unk_24CA68220);
        v5 = qword_254A70D40;
        if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_210765000, v5, OS_LOG_TYPE_DEBUG, "CLLP,_updateARSessionState:,New session has started without end notification of previous session", v7, 2u);
        }
        -[_CLLocationPlayer closeARSessionWithState:](self, "closeARSessionWithState:", 2);
      }
      -[_CLLocationPlayer startARSessionWithState:](self, "startARSessionWithState:", 1);
    }
    else
    {
      -[_CLLocationPlayer closeARSessionWithState:](self, "closeARSessionWithState:", a3);
    }
  }
  else
  {
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v6 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210765000, v6, OS_LOG_TYPE_ERROR, "CLLP,_updateARSessionState:,Player is inactive - need to start the player first", buf, 2u);
    }
  }
  objc_sync_exit(self);
}

- (void)_updateVIOEstimation:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  if (-[_CLLocationPlayer isPlayerActive](self, "isPlayerActive"))
  {
    if (a3)
    {
      objc_msgSend(a3, "timestamp");
      if (-[_CLLocationPlayer hasARSessionTimedOut:](self, "hasARSessionTimedOut:"))
      {
        if (qword_254A70D38 != -1)
          dispatch_once(&qword_254A70D38, &unk_24CA68220);
        v5 = qword_254A70D40;
        if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(a3, "timestamp");
          v7 = v6;
          -[_CLLocationPlayer notifierLastARKitUpdateTime](self, "notifierLastARKitUpdateTime");
          v12 = 134349312;
          v13 = v7;
          v14 = 2050;
          v15 = v8;
          _os_log_impl(&dword_210765000, v5, OS_LOG_TYPE_ERROR, "CLLP,_updateVIOEstimation,Session has timed out without end notification,nowMachAbsTime,%{public}.3lf,lastARKitUpdate,%{public}.3lf", (uint8_t *)&v12, 0x16u);
        }
        -[_CLLocationPlayer closeARSessionWithState:](self, "closeARSessionWithState:", 2);
      }
      if (!-[_CLLocationPlayer isNotifierActive](self, "isNotifierActive"))
      {
        if (qword_254A70D38 != -1)
          dispatch_once(&qword_254A70D38, &unk_24CA68220);
        v9 = qword_254A70D40;
        if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_210765000, v9, OS_LOG_TYPE_DEBUG, "CLLP,_updateVIOEstimation:,Payload was sent without start notification of current session", (uint8_t *)&v12, 2u);
        }
        -[_CLLocationPlayer startARSessionWithState:](self, "startARSessionWithState:", 1);
      }
      objc_msgSend(a3, "timestamp");
      -[_CLLocationPlayer setNotifierLastARKitUpdateTime:](self, "setNotifierLastARKitUpdateTime:");
      if (-[_CLLocationPlayer isFusionEnabled](self, "isFusionEnabled"))
        sub_21076CA60((unsigned __int8 *)&self->_locationFuser, a3);
      goto LABEL_26;
    }
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v10 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v11 = "CLLP,_updateVIOEstimation:,Input estimation is nil";
      goto LABEL_25;
    }
  }
  else
  {
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v10 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v11 = "CLLP,_updateVIOEstimation:,Player is inactive - need to start the player first";
LABEL_25:
      _os_log_impl(&dword_210765000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 2u);
    }
  }
LABEL_26:
  objc_sync_exit(self);
}

- (void)_updateVLLocalizationResult:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  if (-[_CLLocationPlayer isPlayerActive](self, "isPlayerActive"))
  {
    if (a3)
    {
      objc_msgSend(a3, "timestamp");
      if (-[_CLLocationPlayer hasARSessionTimedOut:](self, "hasARSessionTimedOut:"))
      {
        if (qword_254A70D38 != -1)
          dispatch_once(&qword_254A70D38, &unk_24CA68220);
        v5 = qword_254A70D40;
        if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(a3, "timestamp");
          v7 = v6;
          -[_CLLocationPlayer notifierLastARKitUpdateTime](self, "notifierLastARKitUpdateTime");
          v12 = 134349312;
          v13 = v7;
          v14 = 2050;
          v15 = v8;
          _os_log_impl(&dword_210765000, v5, OS_LOG_TYPE_ERROR, "CLLP,_updateVLLocalizationResult,Session has timed out without end notification,nowMachAbsTime,%{public}.3lf,lastARKitUpdate,%{public}.3lf", (uint8_t *)&v12, 0x16u);
        }
        -[_CLLocationPlayer closeARSessionWithState:](self, "closeARSessionWithState:", 2);
      }
      if (!-[_CLLocationPlayer isNotifierActive](self, "isNotifierActive"))
      {
        if (qword_254A70D38 != -1)
          dispatch_once(&qword_254A70D38, &unk_24CA68220);
        v9 = qword_254A70D40;
        if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_210765000, v9, OS_LOG_TYPE_DEBUG, "CLLP,_updateVLLocalizationResult:,Payload was sent without start notification of current session", (uint8_t *)&v12, 2u);
        }
        -[_CLLocationPlayer startARSessionWithState:](self, "startARSessionWithState:", 1);
      }
      objc_msgSend(a3, "timestamp");
      -[_CLLocationPlayer setNotifierLastARKitUpdateTime:](self, "setNotifierLastARKitUpdateTime:");
      if (-[_CLLocationPlayer isFusionEnabled](self, "isFusionEnabled"))
        sub_21076D320();
      goto LABEL_26;
    }
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v10 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v11 = "CLLP,_updateVLLocalizationResult:,Input localizationResult is nil";
      goto LABEL_25;
    }
  }
  else
  {
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v10 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v11 = "CLLP,_updateVLLocalizationResult:,Player is inactive - need to start the player first";
LABEL_25:
      _os_log_impl(&dword_210765000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 2u);
    }
  }
LABEL_26:
  objc_sync_exit(self);
}

- (id)_getFusedLocationFrom:(id)a3 machAbsTime:(double)a4
{
  double mach_abs;
  id v13;
  id v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  NSObject *v18;
  const char *v19;
  _BYTE v21[560];
  _OWORD v22[8];
  _OWORD v23[2];
  _OWORD __src[35];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];
  uint8_t buf[32];
  double v35;
  std::__shared_weak_count *v36;
  _BYTE v37[96];
  __int128 v38;
  __int128 v39;
  _BYTE v40[28];

  objc_sync_enter(self);
  if (!-[_CLLocationPlayer isPlayerActive](self, "isPlayerActive"))
  {
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v18 = qword_254A70D40;
    if (!os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v19 = "CLLP,_getFusedLocationFrom:machAbsTime:,Player is inactive - need to start the player first";
    goto LABEL_21;
  }
  if (!a3)
  {
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v18 = qword_254A70D40;
    if (!os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v19 = "CLLP,_getFusedLocationFrom:machAbsTime:,Input recordedLocation is nil";
LABEL_21:
    _os_log_impl(&dword_210765000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
LABEL_22:
    v14 = 0;
    goto LABEL_23;
  }
  *(_QWORD *)&v37[12] = 0;
  *(_QWORD *)&v37[4] = 0;
  *(_OWORD *)&v37[20] = xmmword_21077FB80;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&v37[36] = _Q0;
  *(_OWORD *)&v37[52] = _Q0;
  *(_OWORD *)&v37[68] = _Q0;
  *(_DWORD *)v37 = 0xFFFF;
  *(_DWORD *)&v37[84] = 0;
  v38 = 0uLL;
  *(_QWORD *)&v37[88] = 0xBFF0000000000000;
  *(_QWORD *)((char *)&v39 + 4) = 0xBFF0000000000000;
  LODWORD(v39) = 0;
  HIDWORD(v39) = 0x7FFFFFFF;
  memset(v40, 0, 25);
  sub_2107666FC((uint64_t)buf);
  -[_CLLocationPlayer convertCLLocation:machAbsTime:toDaemonLocation:daemonLocationPrivate:](self, "convertCLLocation:machAbsTime:toDaemonLocation:daemonLocationPrivate:", a3, v37, buf, a4);
  -[_CLLocationPlayer _updateLocation:locationPrivate:](self, "_updateLocation:locationPrivate:", v37, buf);
  if (-[_CLLocationPlayer isFusionEnabled](self, "isFusionEnabled"))
  {
    if (self->_locationFuser.activated_
      || (mach_abs = self->_locationFuser.lastValidVlf_.t.mach_abs, mach_abs > 0.0) && vabdd_f64(v35, mach_abs) <= 24.0)
    {
      sub_21076BD28((unsigned __int8 *)&self->_locationFuser, (uint64_t)v37, (uint64_t)buf);
    }
  }
  v31 = v38;
  v32 = v39;
  v33[0] = *(_OWORD *)v40;
  *(_OWORD *)((char *)v33 + 12) = *(_OWORD *)&v40[12];
  v27 = *(_OWORD *)&v37[32];
  v28 = *(_OWORD *)&v37[48];
  v29 = *(_OWORD *)&v37[64];
  v30 = *(_OWORD *)&v37[80];
  v25 = *(_OWORD *)v37;
  v26 = *(_OWORD *)&v37[16];
  memset(__src, 0, 512);
  sub_210766824((uint64_t)buf, __src);
  v13 = objc_alloc(MEMORY[0x24BDBFA80]);
  v22[6] = v31;
  v22[7] = v32;
  v23[0] = v33[0];
  *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)((char *)v33 + 12);
  v22[2] = v27;
  v22[3] = v28;
  v22[4] = v29;
  v22[5] = v30;
  v22[0] = v25;
  v22[1] = v26;
  memcpy(v21, __src, sizeof(v21));
  v14 = (id)objc_msgSend(v13, "initWithClientLocation:clientLocationPrivate:", v22, v21);
  v15 = v36;
  if (v36)
  {
    p_shared_owners = (unint64_t *)&v36->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
LABEL_23:
  objc_sync_exit(self);
  return v14;
}

- (void)startARSessionWithState:(unint64_t)a3
{
  -[_CLLocationPlayer setNotifierActive:](self, "setNotifierActive:", 1);
  -[_CLLocationPlayer setNotifierLastARKitUpdateTime:](self, "setNotifierLastARKitUpdateTime:", -1.0);
  -[_CLLocationPlayer setArSessionActive:](self, "setArSessionActive:", a3 == 1);
  if (-[_CLLocationPlayer isFusionEnabled](self, "isFusionEnabled"))
    sub_21076C650((unsigned __int8 *)&self->_locationFuser, a3);
}

- (void)closeARSessionWithState:(unint64_t)a3
{
  -[_CLLocationPlayer setNotifierActive:](self, "setNotifierActive:", 0);
  -[_CLLocationPlayer setNotifierLastARKitUpdateTime:](self, "setNotifierLastARKitUpdateTime:", -1.0);
  -[_CLLocationPlayer setArSessionActive:](self, "setArSessionActive:", a3 == 1);
  if (-[_CLLocationPlayer isFusionEnabled](self, "isFusionEnabled"))
    sub_21076C650((unsigned __int8 *)&self->_locationFuser, a3);
}

- (BOOL)hasARSessionTimedOut:(double)a3
{
  _BOOL4 v5;
  double v6;
  double v7;

  v5 = -[_CLLocationPlayer isNotifierActive](self, "isNotifierActive");
  if (v5)
  {
    -[_CLLocationPlayer notifierLastARKitUpdateTime](self, "notifierLastARKitUpdateTime");
    if (v6 <= 0.0)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      -[_CLLocationPlayer notifierLastARKitUpdateTime](self, "notifierLastARKitUpdateTime");
      LOBYTE(v5) = vabdd_f64(a3, v7) > 10.0;
    }
  }
  return v5;
}

- (void)convertCLLocation:(id)a3 machAbsTime:(double)a4 toDaemonLocation:(CLDaemonLocation *)a5 daemonLocationPrivate:(void *)a6
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  int v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  double v47;
  NSObject *v48;
  uint64_t v49;
  NSObject *v50;
  double v51;
  double v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  _BYTE v56[513];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  char v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  if (a3)
    objc_msgSend(a3, "clientLocation");
  else
    memset(v56, 0, 156);
  v10 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&v56[112];
  *(_OWORD *)&a5->var11 = *(_OWORD *)&v56[96];
  a5->var13 = v10;
  *(_OWORD *)&a5->var14 = *(_OWORD *)&v56[128];
  *(_OWORD *)&a5->var16 = *(_OWORD *)&v56[140];
  v11 = *(_OWORD *)&v56[48];
  *(_OWORD *)&a5->var3 = *(_OWORD *)&v56[32];
  *(_OWORD *)&a5->var5 = v11;
  v12 = *(_OWORD *)&v56[80];
  *(_OWORD *)&a5->var7 = *(_OWORD *)&v56[64];
  *(_OWORD *)&a5->var9 = v12;
  v13 = *(_OWORD *)&v56[16];
  *(_OWORD *)&a5->var0 = *(_OWORD *)v56;
  *(_OWORD *)&a5->var1.var1 = v13;
  sub_2107666FC((uint64_t)v56);
  memcpy(a6, v56, 0x201uLL);
  v14 = v57;
  v57 = 0u;
  v15 = (std::__shared_weak_count *)*((_QWORD *)a6 + 66);
  *(_OWORD *)((char *)a6 + 520) = v14;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  *((_BYTE *)a6 + 632) = v64;
  v18 = v63;
  *(_OWORD *)((char *)a6 + 600) = v62;
  *(_OWORD *)((char *)a6 + 616) = v18;
  v19 = v59;
  *(_OWORD *)((char *)a6 + 536) = v58;
  *(_OWORD *)((char *)a6 + 552) = v19;
  v20 = v61;
  *(_OWORD *)((char *)a6 + 568) = v60;
  *(_OWORD *)((char *)a6 + 584) = v20;
  v21 = (std::__shared_weak_count *)*((_QWORD *)&v57 + 1);
  if (*((_QWORD *)&v57 + 1))
  {
    v22 = (unint64_t *)(*((_QWORD *)&v57 + 1) + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  *((double *)a6 + 4) = a4;
  *((double *)a6 + 43) = a4;
  v24 = (void *)objc_msgSend(a3, "matchInfo", *(_QWORD *)v56);
  if (v24)
  {
    v25 = v24;
    *((_DWORD *)a6 + 14) = objc_msgSend(v24, "matchQuality");
    objc_msgSend(v25, "matchCoordinate");
    *((_QWORD *)a6 + 8) = v26;
    objc_msgSend(v25, "matchCoordinate");
    *((_QWORD *)a6 + 9) = v27;
    objc_msgSend(v25, "matchCourse");
    *((_QWORD *)a6 + 10) = v28;
    *((_DWORD *)a6 + 22) = objc_msgSend(v25, "matchFormOfWay");
    *((_DWORD *)a6 + 23) = objc_msgSend(v25, "matchRoadClass");
    *((_BYTE *)a6 + 96) = objc_msgSend(v25, "isMatchShifted");
    objc_msgSend((id)objc_msgSend(v25, "matchDataArray"), "getBytes:length:", (char *)a6 + 104, 64);
  }
  v29 = (void *)objc_msgSend(a3, "_groundAltitude");
  if (v29)
  {
    v30 = v29;
    objc_msgSend(v29, "estimate");
    *((_QWORD *)a6 + 47) = v31;
    objc_msgSend(v30, "uncertainty");
    *((_QWORD *)a6 + 48) = v32;
    objc_msgSend(v30, "undulation");
    *(float *)&v33 = v33;
    *((_DWORD *)a6 + 79) = LODWORD(v33);
    v34 = objc_msgSend(v30, "undulationModel");
  }
  else
  {
    if (!objc_msgSend(a3, "isAltitudeWgs84Available"))
      goto LABEL_21;
    *((_QWORD *)a6 + 47) = 0;
    *((_QWORD *)a6 + 48) = 0xBFF0000000000000;
    objc_msgSend(a3, "altitudeWgs84");
    v36 = v35;
    objc_msgSend(a3, "altitude");
    *(float *)&v37 = v36 - v37;
    *((_DWORD *)a6 + 79) = LODWORD(v37);
    v34 = 1;
  }
  *((_DWORD *)a6 + 78) = v34;
LABEL_21:
  objc_msgSend(a3, "rawHorizontalAccuracy");
  *((_QWORD *)a6 + 49) = v38;
  objc_msgSend(a3, "rawAltitude");
  *((_QWORD *)a6 + 50) = v39;
  objc_msgSend(a3, "rawVerticalAccuracy");
  *((_QWORD *)a6 + 51) = v40;
  objc_msgSend(a3, "rawCourseAccuracy");
  *((_QWORD *)a6 + 52) = v41;
  objc_msgSend(a3, "trustedTimestamp");
  *((_QWORD *)a6 + 3) = v42;
  objc_msgSend(a3, "rawHorizontalAccuracy");
  objc_msgSend(a3, "rawHorizontalAccuracy");
  if (v43 >= 0.0)
  {
    *(_OWORD *)(&a5->var0 + 1) = *(_OWORD *)((char *)&a5->var11 + 4);
    *(double *)((char *)&a5->var1.var1 + 4) = *((double *)a6 + 49);
    HIDWORD(a5->var14) = a5->var15;
  }
  else
  {
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v44 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a3, "rawHorizontalAccuracy");
      *(_DWORD *)v56 = 134349312;
      *(double *)&v56[4] = a4;
      *(_WORD *)&v56[12] = 2050;
      *(_QWORD *)&v56[14] = v45;
      _os_log_impl(&dword_210765000, v44, OS_LOG_TYPE_DEBUG, "CLLP,convertCLLocation:toDaemonLocation:daemonLocationPrivate:,Input does not have valid rawCoordinate,machAbsTime,%{public}.3f,rawHorzAcc,%{public}.3f", v56, 0x16u);
      if (qword_254A70D38 != -1)
        dispatch_once(&qword_254A70D38, &unk_24CA68220);
    }
    v46 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v56 = 0;
      _os_log_impl(&dword_210765000, v46, OS_LOG_TYPE_DEBUG, "CLLP,convertCLLocation:toDaemonLocation:daemonLocationPrivate:,Will use coordinate instead of rawCoordinate", v56, 2u);
    }
    *(_OWORD *)((char *)&a5->var11 + 4) = *(_OWORD *)(&a5->var0 + 1);
    *((_QWORD *)a6 + 49) = *(_QWORD *)((char *)&a5->var1.var1 + 4);
    a5->var15 = HIDWORD(a5->var14);
  }
  objc_msgSend(a3, "rawVerticalAccuracy");
  objc_msgSend(a3, "rawVerticalAccuracy");
  if (v47 >= 0.0)
  {
    *(_OWORD *)((char *)&a5->var2 + 4) = *((_OWORD *)a6 + 25);
  }
  else
  {
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v48 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a3, "rawVerticalAccuracy");
      *(_DWORD *)v56 = 134349312;
      *(double *)&v56[4] = a4;
      *(_WORD *)&v56[12] = 2050;
      *(_QWORD *)&v56[14] = v49;
      _os_log_impl(&dword_210765000, v48, OS_LOG_TYPE_DEBUG, "CLLP,convertCLLocation:toDaemonLocation:daemonLocationPrivate:,Input does not have valid rawAltitude,machAbsTime,%{public}.3f,rawVertAcc,%{public}.3f", v56, 0x16u);
      if (qword_254A70D38 != -1)
        dispatch_once(&qword_254A70D38, &unk_24CA68220);
    }
    v50 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v56 = 0;
      _os_log_impl(&dword_210765000, v50, OS_LOG_TYPE_DEBUG, "CLLP,convertCLLocation:toDaemonLocation:daemonLocationPrivate:,Will use altitude instead of rawAltitude", v56, 2u);
    }
    *((_OWORD *)a6 + 25) = *(_OWORD *)((char *)&a5->var2 + 4);
  }
  objc_msgSend(a3, "rawCourseAccuracy");
  objc_msgSend(a3, "rawCourseAccuracy");
  if (v51 >= 0.0 && (objc_msgSend(a3, "rawCourse"), objc_msgSend(a3, "rawCourse"), v52 >= 0.0))
  {
    *(double *)((char *)&a5->var6 + 4) = *(double *)((char *)&a5->var13.var0 + 4);
    *(double *)((char *)&a5->var7 + 4) = *((double *)a6 + 52);
  }
  else
  {
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v53 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a3, "rawCourseAccuracy");
      *(_DWORD *)v56 = 134349312;
      *(double *)&v56[4] = a4;
      *(_WORD *)&v56[12] = 2050;
      *(_QWORD *)&v56[14] = v54;
      _os_log_impl(&dword_210765000, v53, OS_LOG_TYPE_DEBUG, "CLLP,convertCLLocation:toDaemonLocation:daemonLocationPrivate:,Input does not have valid rawCourse,machAbsTime,%{public}.3f,rawCourseAcc,%{public}.3f", v56, 0x16u);
      if (qword_254A70D38 != -1)
        dispatch_once(&qword_254A70D38, &unk_24CA68220);
    }
    v55 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v56 = 0;
      _os_log_impl(&dword_210765000, v55, OS_LOG_TYPE_DEBUG, "CLLP,convertCLLocation:toDaemonLocation:daemonLocationPrivate:,Will use course instead of rawCourse", v56, 2u);
    }
    *(double *)((char *)&a5->var13.var0 + 4) = *(double *)((char *)&a5->var6 + 4);
    *((_QWORD *)a6 + 52) = *(_QWORD *)((char *)&a5->var7 + 4);
  }
  *((_WORD *)a6 + 212) = 0;
  *((_OWORD *)a6 + 27) = *(_OWORD *)(&a5->var0 + 1);
  *((_QWORD *)a6 + 56) = *(_QWORD *)((char *)&a5->var1.var1 + 4);
  *((_DWORD *)a6 + 114) = HIDWORD(a5->var14);
  *((_OWORD *)a6 + 29) = *(_OWORD *)((char *)&a5->var2 + 4);
  *((_OWORD *)a6 + 30) = *(_OWORD *)((char *)&a5->var6 + 4);
}

- (void)_updateLocation:(CLDaemonLocation *)a3 locationPrivate:(void *)a4
{
  double mach_abs;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  int8x16_t v12;
  double v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[_CLLocationPlayer isARSessionActive](self, "isARSessionActive")
    || -[_CLLocationPlayer isFusionEnabled](self, "isFusionEnabled")
    && (self->_locationFuser.activated_
     || ((mach_abs = self->_locationFuser.lastValidVlf_.t.mach_abs,
          v8 = vabdd_f64(*((double *)a4 + 4), mach_abs),
          mach_abs > 0.0)
       ? (v9 = v8 <= 24.0)
       : (v9 = 0),
         v9))
    || !-[_CLLocationPlayer isFusionEnabled](self, "isFusionEnabled")
    || self->_locationFuser.activated_
    || ((v13 = self->_locationFuser.lastValidVlf_.t.mach_abs, vabdd_f64(*((double *)a4 + 4), v13) <= 24.0)
      ? (v14 = v13 <= 0.0)
      : (v14 = 1),
        !v14 || v13 <= 0.0))
  {
    if (-[_CLLocationPlayer isFusionEnabled](self, "isFusionEnabled"))
      sub_210770324((unsigned __int8 *)&self->_locationFuser, (uint64_t)a3, (uint64_t)a4, v10, v11, v12);
  }
  else
  {
    sub_21076B6DC((unsigned __int8 *)&self->_locationFuser.visionLock_);
    sub_21076B718((uint64_t)&self->_locationFuser, 1);
    atomic_store(0, (unsigned __int8 *)&self->_locationFuser.visionLock_);
    if (qword_254A70D38 != -1)
      dispatch_once(&qword_254A70D38, &unk_24CA68220);
    v15 = qword_254A70D40;
    if (os_log_type_enabled((os_log_t)qword_254A70D40, OS_LOG_TYPE_DEBUG))
    {
      v16 = *((_QWORD *)a4 + 4);
      v17 = 134349056;
      v18 = v16;
      _os_log_impl(&dword_210765000, v15, OS_LOG_TYPE_DEBUG, "CLLP,_updateLocation:locationPrivate:,Manual location fuser reset,machAbsTime,%{public}.3lf", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (BOOL)isFusionEnabled
{
  return self->_fusionEnabled;
}

- (void)setFusionEnabled:(BOOL)a3
{
  self->_fusionEnabled = a3;
}

- (BOOL)isSimulationEnabled
{
  return self->_simulationEnabled;
}

- (void)setSimulationEnabled:(BOOL)a3
{
  self->_simulationEnabled = a3;
}

- (BOOL)isPlayerActive
{
  return self->_playerActive;
}

- (void)setPlayerActive:(BOOL)a3
{
  self->_playerActive = a3;
}

- (BOOL)isNotifierActive
{
  return self->_notifierActive;
}

- (void)setNotifierActive:(BOOL)a3
{
  self->_notifierActive = a3;
}

- (BOOL)isARSessionActive
{
  return self->_arSessionActive;
}

- (void)setArSessionActive:(BOOL)a3
{
  self->_arSessionActive = a3;
}

- (double)notifierLastARKitUpdateTime
{
  return self->_notifierLastARKitUpdateTime;
}

- (void)setNotifierLastARKitUpdateTime:(double)a3
{
  self->_notifierLastARKitUpdateTime = a3;
}

- (CLSimulationManager)simulationManager
{
  return self->_simulationManager;
}

- (void)setSimulationManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 13664);
}

- (void).cxx_destruct
{
  LocationFuserState *begin;
  void *v4;
  void *v5;
  VioData *v6;

  begin = self->_locationFuser.prevStates_.__begin_;
  if (begin)
  {
    self->_locationFuser.prevStates_.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_locationFuser.locBuffer_.__begin_;
  if (v4)
  {
    self->_locationFuser.locBuffer_.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_locationFuser.vlfBuffer_.__begin_;
  if (v5)
  {
    self->_locationFuser.vlfBuffer_.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_locationFuser.vioBuffer_.__begin_;
  if (v6)
  {
    self->_locationFuser.vioBuffer_.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  sub_21076B638((uint64_t)&self->_locationFuser);
  return self;
}

@end
