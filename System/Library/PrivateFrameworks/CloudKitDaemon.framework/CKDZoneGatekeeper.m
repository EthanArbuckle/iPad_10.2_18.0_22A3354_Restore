@implementation CKDZoneGatekeeper

- (void)relinquishLocksForWaiter:(id)a3 deferRelinquish:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v4 = a4;
  v6 = a3;
  objc_msgSend_foreground(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_relinquishLocksForWaiter_deferRelinquish_(v9, v10, (uint64_t)v6, v4);

  objc_msgSend_background(self, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_relinquishLocksForWaiter_deferRelinquish_(v14, v13, (uint64_t)v6, v4);

}

- (id)initInternal
{
  CKDZoneGatekeeper *v2;
  uint64_t v3;
  CKDZoneGatekeeperImplementation *foreground;
  uint64_t v5;
  CKDZoneGatekeeperImplementation *background;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDZoneGatekeeper;
  v2 = -[CKDZoneGatekeeper init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    foreground = v2->_foreground;
    v2->_foreground = (CKDZoneGatekeeperImplementation *)v3;

    v5 = objc_opt_new();
    background = v2->_background;
    v2->_background = (CKDZoneGatekeeperImplementation *)v5;

  }
  return v2;
}

- (void)registerWaiter:(id)a3 forZoneIDs:(id)a4 expectDelayBeforeRequestBegins:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v7 = a5;
  v18 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend_foreground(self, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend_background(self, v14, v15);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  objc_msgSend_registerWaiter_forZoneIDs_completionHandler_(v16, v14, (uint64_t)v18, v10, v11);

}

- (CKDZoneGatekeeperImplementation)foreground
{
  return self->_foreground;
}

- (CKDZoneGatekeeperImplementation)background
{
  return self->_background;
}

+ (id)gatekeeperForContainerID:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  void *inited;
  CKDZoneGatekeeper *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;

  v6 = a3;
  v7 = a4;
  if (qword_1ED702770 != -1)
    dispatch_once(&qword_1ED702770, &unk_1E78307B8);
  v8 = objc_alloc(MEMORY[0x1E0C951F8]);
  v10 = (void *)objc_msgSend_initWithObject1_object2_(v8, v9, (uint64_t)v6, v7);
  v11 = a1;
  objc_sync_enter(v11);
  objc_msgSend_objectForKey_((void *)qword_1ED702778, v12, (uint64_t)v10);
  inited = (void *)objc_claimAutoreleasedReturnValue();
  if (!inited)
  {
    v14 = [CKDZoneGatekeeper alloc];
    inited = (void *)objc_msgSend_initInternal(v14, v15, v16);
    objc_msgSend_setObject_forKey_((void *)qword_1ED702778, v17, (uint64_t)inited, v10);
  }
  objc_sync_exit(v11);

  return inited;
}

- (BOOL)hasStatusToReport
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  char hasStatusToReport;
  void *v10;
  const char *v11;
  uint64_t v12;

  objc_msgSend_foreground(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasStatusToReport(v4, v5, v6) & 1) != 0)
  {
    hasStatusToReport = 1;
  }
  else
  {
    objc_msgSend_background(self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    hasStatusToReport = objc_msgSend_hasStatusToReport(v10, v11, v12);

  }
  return hasStatusToReport;
}

- (id)CKStatusReportArray
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  int hasStatusToReport;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;

  v3 = (void *)objc_opt_new();
  objc_msgSend_foreground(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  hasStatusToReport = objc_msgSend_hasStatusToReport(v6, v7, v8);

  if (hasStatusToReport)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("foregroundZoneGatekeeper {"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

    objc_msgSend_foreground(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKStatusReportArray(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v20, (uint64_t)v19);

    objc_msgSend_addObject_(v3, v21, (uint64_t)CFSTR("}"));
  }
  objc_msgSend_background(self, v10, v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_hasStatusToReport(v22, v23, v24);

  if (v25)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v26, (uint64_t)CFSTR("backgroundZoneGatekeeper {"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v28, (uint64_t)v27);

    objc_msgSend_background(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKStatusReportArray(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v35, (uint64_t)v34);

    objc_msgSend_addObject_(v3, v36, (uint64_t)CFSTR("}"));
  }
  return v3;
}

- (void)setForeground:(id)a3
{
  objc_storeStrong((id *)&self->_foreground, a3);
}

- (void)setBackground:(id)a3
{
  objc_storeStrong((id *)&self->_background, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_foreground, 0);
}

@end
