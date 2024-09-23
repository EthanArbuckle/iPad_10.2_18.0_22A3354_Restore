@implementation XRFrameActivityManager

+ (BOOL)enableConcurrentActivities
{
  return 0;
}

+ (BOOL)supportsQoS
{
  return 0;
}

+ (unsigned)_activityQoS
{
  return 25;
}

+ (int)_identifierForSignposting
{
  return -1;
}

+ (BOOL)_establishesAffinity
{
  return 1;
}

+ (void)initialize
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v2, v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    byte_25583C8E8 = objc_msgSend_BOOLForKey_(v6, v7, (uint64_t)CFSTR("XREnableInternalSignposts"), v8, v9);

    if (byte_25583C8E8)
    {
      sub_22636AF60();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)qword_25583C470;
      qword_25583C470 = v10;

    }
  }
}

- (XRFrameActivityManager)initWithRing:(id)a3
{
  id v4;
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  int v62;
  __int128 v64;
  __int128 v65;
  unsigned __int8 v66;
  __int128 v67;
  __int128 v68;
  unsigned int v69;
  unsigned __int8 v70;
  objc_super v71;

  v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)XRFrameActivityManager;
  v5 = -[XRFrameActivityManager init](&v71, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    v70 = objc_msgSend__establishesAffinity(v6, v7, v8, v9, v10);
    v11 = (void *)objc_opt_class();
    v69 = objc_msgSend_enableConcurrentActivities(v11, v12, v13, v14, v15);
    if (v4)
      objc_msgSend__parent(v4, v16, v17, v18, v19);
    else
      v67 = 0uLL;
    sub_2263647B8(&v67, &v70, (int *)&v69, &v68);
    sub_22634F31C((uint64_t)v5 + 8, &v68);
    v20 = (std::__shared_weak_count *)*((_QWORD *)&v68 + 1);
    if (*((_QWORD *)&v68 + 1))
    {
      v21 = (unint64_t *)(*((_QWORD *)&v68 + 1) + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    v23 = (std::__shared_weak_count *)*((_QWORD *)&v67 + 1);
    if (*((_QWORD *)&v67 + 1))
    {
      v24 = (unint64_t *)(*((_QWORD *)&v67 + 1) + 8);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    sub_22636BD58(*((_QWORD *)v5 + 1), (uint64_t)v5);
    v26 = (void *)objc_opt_class();
    if (objc_msgSend_supportsQoS(v26, v27, v28, v29, v30))
    {
      if (v4)
        objc_msgSend__parent(v4, v31, v32, v33, v34);
      else
        v67 = 0uLL;
      v66 = 0;
      sub_226364968(&v67, &v66, (int *)&v69, &v68);
      sub_22634F31C((uint64_t)v5 + 24, &v68);
      v35 = (std::__shared_weak_count *)*((_QWORD *)&v68 + 1);
      if (*((_QWORD *)&v68 + 1))
      {
        v36 = (unint64_t *)(*((_QWORD *)&v68 + 1) + 8);
        do
          v37 = __ldaxr(v36);
        while (__stlxr(v37 - 1, v36));
        if (!v37)
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          std::__shared_weak_count::__release_weak(v35);
        }
      }
      v38 = (std::__shared_weak_count *)*((_QWORD *)&v67 + 1);
      if (*((_QWORD *)&v67 + 1))
      {
        v39 = (unint64_t *)(*((_QWORD *)&v67 + 1) + 8);
        do
          v40 = __ldaxr(v39);
        while (__stlxr(v40 - 1, v39));
        if (!v40)
        {
          ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
          std::__shared_weak_count::__release_weak(v38);
        }
      }
      sub_22636BD58(*((_QWORD *)v5 + 3), (uint64_t)v5);
      sub_226364ACC(&v69, &v68);
      v41 = *((_QWORD *)v5 + 1);
      v65 = v68;
      if (*((_QWORD *)&v68 + 1))
      {
        v42 = (unint64_t *)(*((_QWORD *)&v68 + 1) + 8);
        do
          v43 = __ldxr(v42);
        while (__stxr(v43 + 1, v42));
      }
      sub_22636C078(v41, (uint64_t *)&v65);
      v44 = (std::__shared_weak_count *)*((_QWORD *)&v65 + 1);
      if (*((_QWORD *)&v65 + 1))
      {
        v45 = (unint64_t *)(*((_QWORD *)&v65 + 1) + 8);
        do
          v46 = __ldaxr(v45);
        while (__stlxr(v46 - 1, v45));
        if (!v46)
        {
          ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
          std::__shared_weak_count::__release_weak(v44);
        }
      }
      v47 = *((_QWORD *)v5 + 3);
      v64 = v68;
      if (*((_QWORD *)&v68 + 1))
      {
        v48 = (unint64_t *)(*((_QWORD *)&v68 + 1) + 8);
        do
          v49 = __ldxr(v48);
        while (__stxr(v49 + 1, v48));
      }
      sub_22636C078(v47, (uint64_t *)&v64);
      v50 = (std::__shared_weak_count *)*((_QWORD *)&v64 + 1);
      if (*((_QWORD *)&v64 + 1))
      {
        v51 = (unint64_t *)(*((_QWORD *)&v64 + 1) + 8);
        do
          v52 = __ldaxr(v51);
        while (__stlxr(v52 - 1, v51));
        if (!v52)
        {
          ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
          std::__shared_weak_count::__release_weak(v50);
        }
      }
      v53 = (std::__shared_weak_count *)*((_QWORD *)&v68 + 1);
      if (*((_QWORD *)&v68 + 1))
      {
        v54 = (unint64_t *)(*((_QWORD *)&v68 + 1) + 8);
        do
          v55 = __ldaxr(v54);
        while (__stlxr(v55 - 1, v54));
        if (!v55)
        {
          ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
          std::__shared_weak_count::__release_weak(v53);
        }
      }
    }
    else
    {
      sub_226363FE8((_QWORD *)v5 + 3, (uint64_t *)v5 + 1);
    }
    if (byte_25583C8E8)
    {
      v56 = (void *)objc_opt_class();
      v61 = objc_msgSend__identifierForSignposting(v56, v57, v58, v59, v60);
      v62 = 10 * v61 + 500;
      if (v61 < 0)
        v62 = -1;
      *((_DWORD *)v5 + 12) = v62;
      *((_QWORD *)v5 + 7) = os_signpost_id_make_with_pointer((os_log_t)qword_25583C470, v5);
      *((_QWORD *)v5 + 8) = os_signpost_id_make_with_pointer((os_log_t)qword_25583C470, v4);
    }
    else
    {
      *((_DWORD *)v5 + 12) = -1;
    }
  }

  return (XRFrameActivityManager *)v5;
}

- (XRFrameActivityManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)XRFrameActivityManager;
  return -[XRFrameActivityManager init](&v3, sel_init);
}

- (void)dealloc
{
  ActivityManager *ptr;
  ActivityManager *v4;
  objc_super v5;

  ptr = self->_managerImpl.__ptr_;
  if (ptr)
    sub_22636BD58((uint64_t)ptr, 0);
  v4 = self->_secondTierManagerImpl.__ptr_;
  if (v4 && v4 != self->_managerImpl.__ptr_)
    sub_22636BD58((uint64_t)v4, 0);
  v5.receiver = self;
  v5.super_class = (Class)XRFrameActivityManager;
  -[XRFrameActivityManager dealloc](&v5, sel_dealloc);
}

- (int)agentStopDiagnosticsTypeCode
{
  return 10;
}

- (void)performDuringMinorFrame:(id)a3
{
  sub_22636BAC8((uint64_t)self->_managerImpl.__ptr_, a3);
}

- (void)performOutsideMinorFrame:(id)a3
{
  sub_22636BD60((uint64_t)self->_managerImpl.__ptr_, a3);
}

- (id)scheduleActivityAsOperation:(id)a3
{
  id v4;
  XRFrameActivityBlockAgent *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  v5 = [XRFrameActivityBlockAgent alloc];
  v9 = (void *)objc_msgSend_initWithBlock_(v5, v6, (uint64_t)v4, v7, v8);
  objc_msgSend_activateAtStop_activationTicket_finalDestination_finalTicket_(v9, v10, (uint64_t)self, 0, 0, 0);
  objc_msgSend_operationRepresentation(v9, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)scheduleActivity:(id)a3
{
  sub_22636B81C((uint64_t)self->_managerImpl.__ptr_, a3);
}

- (void)scheduleInactivity:(id)a3
{
  sub_22636B978((uint64_t)self->_managerImpl.__ptr_, a3);
}

- (void)setupVisitDuringMinorFrame:(id)a3 agent:(id)a4 mode:(id)a5 ticket:(id)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;

  v23 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend_holdsItinerary_(v11, v14, (uint64_t)v23, v15, v16) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("XRFrameActivityManager.mm"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[agent holdsItinerary:itinerary]"));

  }
  objc_msgSend_setNextStop_mode_ticket_(v23, v17, (uint64_t)self, (uint64_t)v12, (uint64_t)v13);

}

- (void)receiveMobileAgent:(id)a3
{
  ((void (*)(XRFrameActivityManager *, char *, id))MEMORY[0x24BEDD108])(self, sel__reevaluateArrivingAgent_, a3);
}

- (void)_reevaluateArrivingAgent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v9 = objc_msgSend_desiredQoS(v4, v5, v6, v7, v8);
  v10 = 24;
  if (v9 > 0x18)
    v10 = 8;
  v11 = *(uint64_t *)((char *)&self->super.isa + v10);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_2263643C4;
  v13[3] = &unk_24EDC4448;
  v13[4] = self;
  v12 = v4;
  v14 = v12;
  sub_22636B81C(v11, v13);

}

- (void)_needsScheduling
{
  sub_22636B980((uint64_t)self->_managerImpl.__ptr_);
}

- (void)activateNextMajorFrame
{
  sub_22636BA48((uint64_t)self->_managerImpl.__ptr_);
}

- (void)_acquiredMinorFrame:(unsigned __int8)a3
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t ringSignpostID;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD v15[2];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  self->_currentSlot = a3;
  v5 = (id)qword_25583C470;
  v6 = v5;
  ringSignpostID = self->_ringSignpostID;
  if (ringSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v15[0] = 67109120;
    v15[1] = objc_msgSend_agentStopDiagnosticsTypeCode(self, v8, v9, v10, v11);
    _os_signpost_emit_with_name_impl(&dword_22634C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, ringSignpostID, "Manager Active", "Stop kind: %d", (uint8_t *)v15, 8u);
  }

  objc_msgSend_enteringMinorFrame_(self, v12, v3, v13, v14);
}

- (void)_yieldingMinorFrame:(unsigned __int8)a3
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t ringSignpostID;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD v15[2];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (id)qword_25583C470;
  v6 = v5;
  ringSignpostID = self->_ringSignpostID;
  if (ringSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v15[0] = 67109120;
    v15[1] = objc_msgSend_agentStopDiagnosticsTypeCode(self, v8, v9, v10, v11);
    _os_signpost_emit_with_name_impl(&dword_22634C000, v6, OS_SIGNPOST_INTERVAL_END, ringSignpostID, "Manager Active", "Stop kind: %d", (uint8_t *)v15, 8u);
  }

  objc_msgSend_yieldingMinorFrame_(self, v12, v3, v13, v14);
}

- (void)_underrunMinorFrame:(unsigned __int8)a3
{
  self->_currentSlot = a3;
  ((void (*)(XRFrameActivityManager *, char *, _QWORD))MEMORY[0x24BEDD108])(self, sel_underrunMinorFrame_, a3);
}

- (void)_extendingMinorFrame:(unsigned __int8)a3
{
  self->_currentSlot = a3;
  ((void (*)(XRFrameActivityManager *, char *, _QWORD))MEMORY[0x24BEDD108])(self, sel_extendingMinorFrame_, a3);
}

- (void)_startingMajorFrame
{
  ((void (*)(XRFrameActivityManager *, char *))MEMORY[0x24BEDD108])(self, sel_startingMajorFrame);
}

- (void)_shutdown
{
  ((void (*)(XRFrameActivityManager *, char *))MEMORY[0x24BEDD108])(self, sel__finalShutdown);
}

- (void)_managerImplPtr
{
  return &self->_managerImpl;
}

- (void)_secondTierManagerImplPtr
{
  return &self->_secondTierManagerImpl;
}

- (BOOL)holdBackRevisitingAgent:(id)a3
{
  return 0;
}

- (BOOL)holdBackArrivingAgent:(id)a3
{
  return 0;
}

- (unsigned)currentSlot
{
  return self->_currentSlot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncActivity, 0);
  sub_22634FAC8((uint64_t)&self->_secondTierManagerImpl);
  sub_22634FAC8((uint64_t)&self->_managerImpl);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
