@implementation CLHidEventManager

- (CLHidEventManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5 type:(int64_t)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  _QWORD v53[5];
  objc_super v54;
  int v55;
  uint64_t v56;
  uint8_t buf[4];
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)CLHidEventManager;
  v10 = -[CLHidEventManager init](&v54, sel_init);
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0D27CB0]);
    v15 = objc_msgSend_initWithType_(v11, v12, a6, v13, v14);
    *((_QWORD *)v10 + 2) = a4;
    *((_QWORD *)v10 + 3) = v15;
    *((_QWORD *)v10 + 1) = a3;
    v16 = (void *)objc_opt_new();
    *((_QWORD *)v10 + 4) = v16;
    objc_msgSend_addObject_(v16, v17, (uint64_t)a5, v18, v19);
    objc_msgSend_setMatching_(*((void **)v10 + 3), v20, *((_QWORD *)v10 + 4), v21, v22);
    v23 = (void *)*((_QWORD *)v10 + 3);
    v28 = objc_msgSend_delegateQueue(v10, v24, v25, v26, v27);
    objc_msgSend_setDispatchQueue_(v23, v29, v28, v30, v31);
    v32 = (void *)*((_QWORD *)v10 + 3);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = sub_18F44E070;
    v53[3] = &unk_1E2958218;
    v53[4] = v10;
    objc_msgSend_setEventHandler_(v32, v33, (uint64_t)v53, v34, v35);
    objc_msgSend_activate(*((void **)v10 + 3), v36, v37, v38, v39);
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2953B08);
    v40 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_DEBUG))
    {
      v45 = objc_msgSend_services(*((void **)v10 + 3), v41, v42, v43, v44);
      *(_DWORD *)buf = 138412290;
      v58 = v45;
      _os_log_impl(&dword_18F1DC000, v40, OS_LOG_TYPE_DEBUG, "[CLHidManager] enumerated these devices: %@", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE98 != -1)
        dispatch_once(&qword_1ECEDEE98, &unk_1E2953B08);
      v51 = objc_msgSend_services(*((void **)v10 + 3), v47, v48, v49, v50);
      v55 = 138412290;
      v56 = v51;
      v52 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CLHidEventManager initWithDelegate:queue:matching:type:]", "CoreLocation: %s\n", v52);
      if (v52 != (char *)buf)
        free(v52);
    }
  }
  return (CLHidEventManager *)v10;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  objc_msgSend_cancel(self->_manager, a2, v2, v3, v4);

  objc_msgSend_removeAllObjects(self->_matching, v6, v7, v8, v9);
  v10.receiver = self;
  v10.super_class = (Class)CLHidEventManager;
  -[CLHidEventManager dealloc](&v10, sel_dealloc);
}

- (CLHidEventManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLHidEventManagerDelegate *)a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HIDEventSystemClient)manager
{
  return self->_manager;
}

- (NSMutableArray)matching
{
  return self->_matching;
}

- (void)setMatching:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
