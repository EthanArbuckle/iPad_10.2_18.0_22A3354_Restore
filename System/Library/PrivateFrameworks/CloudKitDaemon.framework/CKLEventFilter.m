@implementation CKLEventFilter

- (BOOL)hasLogType:(unint64_t)a3
{
  return (a3 & ~objc_msgSend_logTypes(self, a2, a3)) == 0;
}

- (BOOL)hasOnlyLogType:(unint64_t)a3
{
  unint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_logTypes(self, a2, a3) & a3;
  return v4 == objc_msgSend_logTypes(self, v5, v6);
}

- (void)_initFilterDict
{
  uint64_t v2;
  NSDictionary *v4;
  const char *v5;
  uint64_t v6;
  int v7;
  __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  void *v53;
  const char *v54;
  const char *v55;
  const __CFString *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  void *v67;
  const char *v68;
  NSDictionary *categoriesBySubsystem;
  __CFString *v70;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_simulatorMessagesOnly(self, v5, v6);
  v8 = CFSTR("com.apple.cloudkit");
  if (v7)
    v8 = CFSTR("com.apple.cloudkit.sim");
  v70 = v8;
  v11 = objc_msgSend_simulatorMessagesOnly(self, v9, v10);
  v12 = CFSTR("com.apple.cloudkit.test");
  if (v11)
    v12 = CFSTR("com.apple.cloudkit.test.sim");
  v13 = v12;
  objc_msgSend_set(MEMORY[0x1E0C99E20], v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v17, (uint64_t)&unk_1E78AF450);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasLogType_(self, v19, 1))
  {
    objc_msgSend_addObject_(v16, v20, (uint64_t)CFSTR("CK"));
    objc_msgSend_addObject_(v16, v21, (uint64_t)CFSTR("LogFacilityCK"));
  }
  if (objc_msgSend_hasLogType_(self, v20, 4))
  {
    objc_msgSend_addObject_(v16, v22, (uint64_t)CFSTR("PCS"));
    objc_msgSend_addObject_(v16, v23, (uint64_t)CFSTR("LogFacilityPCS"));
  }
  if (objc_msgSend_hasLogType_(self, v22, 8))
  {
    objc_msgSend_addObject_(v16, v24, (uint64_t)CFSTR("SQL"));
    objc_msgSend_addObject_(v16, v25, (uint64_t)CFSTR("LogFacilitySQL"));
  }
  if (objc_msgSend_hasLogType_(self, v24, 16))
  {
    objc_msgSend_addObject_(v16, v26, (uint64_t)CFSTR("STAT"));
    objc_msgSend_addObject_(v16, v27, (uint64_t)CFSTR("LogFacilitySTAT"));
  }
  if (objc_msgSend_hasLogType_(self, v26, 32))
  {
    objc_msgSend_addObject_(v16, v28, (uint64_t)CFSTR("Request"));
    objc_msgSend_addObject_(v16, v29, (uint64_t)CFSTR("LogFacilityRequest"));
  }
  if (objc_msgSend_hasLogType_(self, v28, 128))
  {
    objc_msgSend_addObject_(v16, v30, (uint64_t)CFSTR("OP"));
    objc_msgSend_addObject_(v16, v31, (uint64_t)CFSTR("LogFacilityOP"));
  }
  if (objc_msgSend_hasLogType_(self, v30, 2))
  {
    objc_msgSend_addObject_(v16, v32, (uint64_t)CFSTR("Traffic"));
    objc_msgSend_addObject_(v16, v33, (uint64_t)CFSTR("LogFacilityTraffic"));
  }
  if (objc_msgSend_hasLogType_(self, v32, 256))
  {
    objc_msgSend_addObject_(v16, v34, (uint64_t)CFSTR("TrafficBinary"));
    objc_msgSend_addObject_(v16, v35, (uint64_t)CFSTR("LogFacilityTrafficBinary"));
  }
  if (objc_msgSend_hasLogType_(self, v34, 0x10000))
  {
    objc_msgSend_addObject_(v16, v36, (uint64_t)CFSTR("TrafficCompressed"));
    objc_msgSend_addObject_(v16, v37, (uint64_t)CFSTR("LogFacilityTrafficCompressed"));
  }
  if (objc_msgSend_hasLogType_(self, v36, 512))
  {
    objc_msgSend_addObject_(v16, v38, (uint64_t)CFSTR("LogStats"));
    objc_msgSend_addObject_(v16, v39, (uint64_t)CFSTR("LogFacilityLogStats"));
  }
  if (objc_msgSend_hasLogType_(self, v38, 1024))
  {
    objc_msgSend_addObject_(v16, v40, (uint64_t)CFSTR("Scheduler"));
    objc_msgSend_addObject_(v16, v41, (uint64_t)CFSTR("LogFacilityScheduler"));
  }
  if (objc_msgSend_hasLogType_(self, v40, 2048))
  {
    objc_msgSend_addObject_(v16, v42, (uint64_t)CFSTR("NotificationListener"));
    objc_msgSend_addObject_(v16, v43, (uint64_t)CFSTR("LogFacilityNotificationListener"));
  }
  if (objc_msgSend_hasLogType_(self, v42, 4096))
  {
    objc_msgSend_addObject_(v16, v44, (uint64_t)CFSTR("Engine"));
    objc_msgSend_addObject_(v16, v45, (uint64_t)CFSTR("LogFacilityEngine"));
  }
  if (objc_msgSend_hasLogType_(self, v44, 0x2000))
  {
    objc_msgSend_addObject_(v16, v46, (uint64_t)CFSTR("DataRepair"));
    objc_msgSend_addObject_(v16, v47, (uint64_t)CFSTR("LogFacilityDataRepair"));
  }
  if (objc_msgSend_hasLogType_(self, v46, 0x4000))
  {
    objc_msgSend_addObject_(v16, v48, (uint64_t)CFSTR("DiscretionaryDaemon"));
    objc_msgSend_addObject_(v16, v49, (uint64_t)CFSTR("LogFacilityDiscretionaryDaemon"));
  }
  if (objc_msgSend_hasLogType_(self, v48, 0x8000))
  {
    objc_msgSend_addObject_(v16, v50, (uint64_t)CFSTR("MockServer"));
    objc_msgSend_addObject_(v16, v51, (uint64_t)CFSTR("LogFacilityMockServer"));
  }
  if (objc_msgSend_hasOnlyLogType_(self, v50, 64))
  {
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v52, (uint64_t)&unk_1E78AF468);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v16, v54, (uint64_t)CFSTR("LogFacilityCK"));
    objc_msgSend_addObject_(v16, v55, (uint64_t)CFSTR("LogFacilityMMCS"));
    v56 = CFSTR("MMCS");
    objc_msgSend_addObject_(v16, v57, (uint64_t)CFSTR("CK"));
  }
  else
  {
    v53 = 0;
    if (!objc_msgSend_hasLogType_(self, v52, 64))
      goto LABEL_42;
    v56 = CFSTR("LogFacilityMMCS");
    objc_msgSend_addObject_(v16, v59, (uint64_t)CFSTR("MMCS"));
  }
  objc_msgSend_addObject_(v16, v58, (uint64_t)v56);
LABEL_42:
  if (objc_msgSend_count(v16, v59, v60))
  {
    if ((objc_msgSend_onlyTestLogs(self, v61, v62) & 1) == 0)
      objc_msgSend_setObject_forKeyedSubscript_(v4, v63, (uint64_t)v16, v70);
    objc_msgSend_setObject_forKeyedSubscript_(v4, v63, (uint64_t)v16, v13);
  }
  if (objc_msgSend_count(v53, v61, v62))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v64, (uint64_t)v18, CFSTR("com.apple.c2"));
    objc_msgSend_setObject_forKeyedSubscript_(v4, v65, (uint64_t)v53, CFSTR("com.apple.mmcs"));
    objc_msgSend_setWithObject_(MEMORY[0x1E0C99E60], v66, (uint64_t)CFSTR("default"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v4, v68, (uint64_t)v67, CFSTR("com.apple.chunkinglibrary"));

  }
  categoriesBySubsystem = self->_categoriesBySubsystem;
  self->_categoriesBySubsystem = v4;

}

- (CKLEventFilter)initWithLogTypes:(unint64_t)a3
{
  CKLEventFilter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKLEventFilter;
  result = -[CKLEventFilter init](&v5, sel_init);
  if (result)
    result->_logTypes = a3;
  return result;
}

- (BOOL)matchesEvent:(id)a3
{
  id v4;
  CKLEventFilter *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSDictionary *categoriesBySubsystem;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  int v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  char isEqualToString;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_categoriesBySubsystem)
    objc_msgSend__initFilterDict(v5, v6, v7);
  objc_sync_exit(v5);

  if (!v5->_categoriesBySubsystem)
    __assert_rtn("-[CKLEventFilter matchesEvent:]", "CKLEventFilter.m", 99, "_categoriesBySubsystem && \"_categoriesBySubsystem\");
  if (objc_msgSend_type(v4, v8, v9) == 1024)
  {
    categoriesBySubsystem = v5->_categoriesBySubsystem;
    objc_msgSend_subsystem(v4, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(categoriesBySubsystem, v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15 || !objc_msgSend_count(v15, v16, v17))
    {
      isEqualToString = 0;
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend_category(v4, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_containsObject_(v15, v21, (uint64_t)v20);

    if (v22)
    {
      objc_msgSend_processName(v5, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        isEqualToString = 1;
        goto LABEL_13;
      }
      objc_msgSend_process(v4, v26, v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_processName(v5, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v15, v31, (uint64_t)v30);

      goto LABEL_12;
    }
  }
  isEqualToString = 0;
LABEL_13:

  return isEqualToString;
}

- (unint64_t)logTypes
{
  return self->_logTypes;
}

- (void)setLogTypes:(unint64_t)a3
{
  self->_logTypes = a3;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (BOOL)simulatorMessagesOnly
{
  return self->_simulatorMessagesOnly;
}

- (void)setSimulatorMessagesOnly:(BOOL)a3
{
  self->_simulatorMessagesOnly = a3;
}

- (BOOL)onlyTestLogs
{
  return self->_onlyTestLogs;
}

- (void)setOnlyTestLogs:(BOOL)a3
{
  self->_onlyTestLogs = a3;
}

- (NSDictionary)categoriesBySubsystem
{
  return self->_categoriesBySubsystem;
}

- (void)setCategoriesBySubsystem:(id)a3
{
  objc_storeStrong((id *)&self->_categoriesBySubsystem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoriesBySubsystem, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end
