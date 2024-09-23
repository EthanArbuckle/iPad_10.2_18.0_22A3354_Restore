@implementation DSNavigationManager

- (DSNavigationManager)init
{
  DSNavigationManager *v2;
  os_log_t v3;
  void *v4;
  uint64_t v5;
  NSArray *panesRequiringNetwork;
  uint64_t v7;
  NSArray *safetyResetNavigationOrder;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *safetyResetChapters;
  uint64_t v17;
  NSArray *sharingActivityNavigationOrder;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  uint64_t v38;
  NSDictionary *sharingActivityChapters;
  uint64_t v40;
  NSArray *safetyResetNavigationOrderDTO;
  objc_class *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  uint64_t v52;
  NSDictionary *safetyResetChaptersDTO;
  uint64_t v54;
  NSArray *sharingActivityNavigationOrderDTO;
  objc_class *v56;
  objc_class *v57;
  objc_class *v58;
  objc_class *v59;
  void *v60;
  objc_class *v61;
  void *v62;
  objc_class *v63;
  void *v64;
  objc_class *v65;
  void *v66;
  objc_class *v67;
  void *v68;
  objc_class *v69;
  void *v70;
  objc_class *v71;
  void *v72;
  objc_class *v73;
  void *v74;
  uint64_t v75;
  NSDictionary *sharingActivityChaptersDTO;
  NSDictionary *safetyCheckChaptersWifiSync;
  uint64_t v78;
  NSArray *safetyCheckNavigationOrderWifiSync;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  objc_super v87;
  _QWORD v88[2];
  _QWORD v89[11];
  _QWORD v90[11];
  _QWORD v91[16];
  _QWORD v92[5];
  _QWORD v93[5];
  _QWORD v94[8];
  _QWORD v95[11];
  _QWORD v96[11];
  _QWORD v97[16];
  _QWORD v98[3];
  _QWORD v99[3];
  _QWORD v100[8];
  _QWORD v101[6];

  v101[4] = *MEMORY[0x24BDAC8D0];
  v87.receiver = self;
  v87.super_class = (Class)DSNavigationManager;
  v2 = -[DSNavigationManager init](&v87, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.DigitalSeparation", "DSNavigationManager");
    v4 = (void *)DSLog_8;
    DSLog_8 = (uint64_t)v3;

    v101[0] = objc_opt_class();
    v101[1] = objc_opt_class();
    v101[2] = objc_opt_class();
    v101[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v101, 4);
    v5 = objc_claimAutoreleasedReturnValue();
    panesRequiringNetwork = v2->_panesRequiringNetwork;
    v2->_panesRequiringNetwork = (NSArray *)v5;

    v100[0] = objc_opt_class();
    v100[1] = objc_opt_class();
    v100[2] = objc_opt_class();
    v100[3] = objc_opt_class();
    v100[4] = objc_opt_class();
    v100[5] = objc_opt_class();
    v100[6] = objc_opt_class();
    v100[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 8);
    v7 = objc_claimAutoreleasedReturnValue();
    safetyResetNavigationOrder = v2->_safetyResetNavigationOrder;
    v2->_safetyResetNavigationOrder = (NSArray *)v7;

    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v10;
    v99[0] = &unk_24F00B388;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v12;
    v99[1] = &unk_24F00B3A0;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2] = v14;
    v99[2] = &unk_24F00B3B8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v99, v98, 3);
    v15 = objc_claimAutoreleasedReturnValue();
    safetyResetChapters = v2->_safetyResetChapters;
    v2->_safetyResetChapters = (NSDictionary *)v15;

    v97[0] = objc_opt_class();
    v97[1] = objc_opt_class();
    v97[2] = objc_opt_class();
    v97[3] = objc_opt_class();
    v97[4] = objc_opt_class();
    v97[5] = objc_opt_class();
    v97[6] = objc_opt_class();
    v97[7] = objc_opt_class();
    v97[8] = objc_opt_class();
    v97[9] = objc_opt_class();
    v97[10] = objc_opt_class();
    v97[11] = objc_opt_class();
    v97[12] = objc_opt_class();
    v97[13] = objc_opt_class();
    v97[14] = objc_opt_class();
    v97[15] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 16);
    v17 = objc_claimAutoreleasedReturnValue();
    sharingActivityNavigationOrder = v2->_sharingActivityNavigationOrder;
    v2->_sharingActivityNavigationOrder = (NSArray *)v17;

    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v85;
    v96[0] = &unk_24F00B388;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v83;
    v96[1] = &unk_24F00B388;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v95[2] = v81;
    v96[2] = &unk_24F00B3A0;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v95[3] = v23;
    v96[3] = &unk_24F00B3B8;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v95[4] = v25;
    v96[4] = &unk_24F00B3B8;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v95[5] = v27;
    v96[5] = &unk_24F00B3B8;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v95[6] = v29;
    v96[6] = &unk_24F00B3B8;
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v95[7] = v31;
    v96[7] = &unk_24F00B3B8;
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v95[8] = v33;
    v96[8] = &unk_24F00B3B8;
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v95[9] = v35;
    v96[9] = &unk_24F00B3B8;
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v95[10] = v37;
    v96[10] = &unk_24F00B3B8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v96, v95, 11);
    v38 = objc_claimAutoreleasedReturnValue();
    sharingActivityChapters = v2->_sharingActivityChapters;
    v2->_sharingActivityChapters = (NSDictionary *)v38;

    v94[0] = objc_opt_class();
    v94[1] = objc_opt_class();
    v94[2] = objc_opt_class();
    v94[3] = objc_opt_class();
    v94[4] = objc_opt_class();
    v94[5] = objc_opt_class();
    v94[6] = objc_opt_class();
    v94[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 8);
    v40 = objc_claimAutoreleasedReturnValue();
    safetyResetNavigationOrderDTO = v2->_safetyResetNavigationOrderDTO;
    v2->_safetyResetNavigationOrderDTO = (NSArray *)v40;

    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v43;
    v93[0] = &unk_24F00B388;
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v45;
    v93[1] = &unk_24F00B3A0;
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v92[2] = v47;
    v93[2] = &unk_24F00B3A0;
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v92[3] = v49;
    v93[3] = &unk_24F00B3B8;
    v50 = (objc_class *)objc_opt_class();
    NSStringFromClass(v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v92[4] = v51;
    v93[4] = &unk_24F00B3B8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v93, v92, 5);
    v52 = objc_claimAutoreleasedReturnValue();
    safetyResetChaptersDTO = v2->_safetyResetChaptersDTO;
    v2->_safetyResetChaptersDTO = (NSDictionary *)v52;

    v91[0] = objc_opt_class();
    v91[1] = objc_opt_class();
    v91[2] = objc_opt_class();
    v91[3] = objc_opt_class();
    v91[4] = objc_opt_class();
    v91[5] = objc_opt_class();
    v91[6] = objc_opt_class();
    v91[7] = objc_opt_class();
    v91[8] = objc_opt_class();
    v91[9] = objc_opt_class();
    v91[10] = objc_opt_class();
    v91[11] = objc_opt_class();
    v91[12] = objc_opt_class();
    v91[13] = objc_opt_class();
    v91[14] = objc_opt_class();
    v91[15] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v91, 16);
    v54 = objc_claimAutoreleasedReturnValue();
    sharingActivityNavigationOrderDTO = v2->_sharingActivityNavigationOrderDTO;
    v2->_sharingActivityNavigationOrderDTO = (NSArray *)v54;

    v56 = (objc_class *)objc_opt_class();
    NSStringFromClass(v56);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v86;
    v90[0] = &unk_24F00B388;
    v57 = (objc_class *)objc_opt_class();
    NSStringFromClass(v57);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v89[1] = v84;
    v90[1] = &unk_24F00B388;
    v58 = (objc_class *)objc_opt_class();
    NSStringFromClass(v58);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v89[2] = v82;
    v90[2] = &unk_24F00B3A0;
    v59 = (objc_class *)objc_opt_class();
    NSStringFromClass(v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v89[3] = v60;
    v90[3] = &unk_24F00B3B8;
    v61 = (objc_class *)objc_opt_class();
    NSStringFromClass(v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v89[4] = v62;
    v90[4] = &unk_24F00B3B8;
    v63 = (objc_class *)objc_opt_class();
    NSStringFromClass(v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v89[5] = v64;
    v90[5] = &unk_24F00B3B8;
    v65 = (objc_class *)objc_opt_class();
    NSStringFromClass(v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v89[6] = v66;
    v90[6] = &unk_24F00B3B8;
    v67 = (objc_class *)objc_opt_class();
    NSStringFromClass(v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v89[7] = v68;
    v90[7] = &unk_24F00B3B8;
    v69 = (objc_class *)objc_opt_class();
    NSStringFromClass(v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v89[8] = v70;
    v90[8] = &unk_24F00B3B8;
    v71 = (objc_class *)objc_opt_class();
    NSStringFromClass(v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v89[9] = v72;
    v90[9] = &unk_24F00B3B8;
    v73 = (objc_class *)objc_opt_class();
    NSStringFromClass(v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v89[10] = v74;
    v90[10] = &unk_24F00B3B8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, v89, 11);
    v75 = objc_claimAutoreleasedReturnValue();
    sharingActivityChaptersDTO = v2->_sharingActivityChaptersDTO;
    v2->_sharingActivityChaptersDTO = (NSDictionary *)v75;

    safetyCheckChaptersWifiSync = v2->_safetyCheckChaptersWifiSync;
    v2->_safetyCheckChaptersWifiSync = (NSDictionary *)MEMORY[0x24BDBD1B8];

    v88[0] = objc_opt_class();
    v88[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 2);
    v78 = objc_claimAutoreleasedReturnValue();
    safetyCheckNavigationOrderWifiSync = v2->_safetyCheckNavigationOrderWifiSync;
    v2->_safetyCheckNavigationOrderWifiSync = (NSArray *)v78;

  }
  return v2;
}

- (id)navigationOrderForFlowType:(int64_t)a3
{
  void *v5;

  if (objc_msgSend(MEMORY[0x24BE2CC98], "shouldShowBioRatchetFlow"))
  {
    if (a3)
      -[DSNavigationManager sharingActivityNavigationOrderDTO](self, "sharingActivityNavigationOrderDTO");
    else
      -[DSNavigationManager safetyResetNavigationOrderDTO](self, "safetyResetNavigationOrderDTO");
  }
  else if (a3)
  {
    -[DSNavigationManager sharingActivityNavigationOrder](self, "sharingActivityNavigationOrder");
  }
  else
  {
    -[DSNavigationManager safetyResetNavigationOrder](self, "safetyResetNavigationOrder");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)navigationChaptersForFlowType:(int64_t)a3
{
  void *v5;

  if (objc_msgSend(MEMORY[0x24BE2CC98], "shouldShowBioRatchetFlow"))
  {
    if (a3)
      -[DSNavigationManager sharingActivityChaptersDTO](self, "sharingActivityChaptersDTO");
    else
      -[DSNavigationManager safetyResetChaptersDTO](self, "safetyResetChaptersDTO");
  }
  else if (a3)
  {
    -[DSNavigationManager sharingActivityChapters](self, "sharingActivityChapters");
  }
  else
  {
    -[DSNavigationManager safetyResetChapters](self, "safetyResetChapters");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (BOOL)shouldIngestURL:(id)a3
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length")
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("/")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("SAFETY_CHECK")) & 1) == 0
    && -[DSNavigationManager startingClassForURL:](self, "startingClassForURL:", v4) != 0;

  return v5;
}

- (id)deepLinkToPane:(Class)a3 inFlow:(int64_t)a4
{
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/SAFETY_CHECK/"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4)
    v8 = CFSTR("MANAGE_SHARING");
  else
    v8 = CFSTR("EMERGENCY_RESET");
  objc_msgSend(v6, "appendString:", v8);
  if ((Class)objc_opt_class() == a3)
  {
    v9 = CFSTR("PASSCODE");
LABEL_12:
    objc_msgSend(v7, "appendString:", v9);
    return v7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v9 = CFSTR("FACEID");
    goto LABEL_12;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v9 = CFSTR("TOUCHID");
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)DSLog_8, OS_LOG_TYPE_ERROR))
    -[DSNavigationManager deepLinkToPane:inFlow:].cold.1();
  return v7;
}

- (id)navigationForURL:(id)a3
{
  void *v4;
  int v5;
  char v6;
  uint64_t v7;
  objc_class *v8;
  char v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  DSDeepLinkRepresentation *v15;

  objc_msgSend(a3, "objectForKey:", CFSTR("path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", CFSTR("EMERGENCY_RESET"));
  v6 = v5;
  v7 = v5 ^ 1u;
  v8 = -[DSNavigationManager startingClassForURL:](self, "startingClassForURL:", v4);
  v9 = objc_msgSend(MEMORY[0x24BE2CC98], "shouldShowBioRatchetFlow");
  if (v8 == (objc_class *)objc_opt_class())
  {
    -[DSNavigationManager safetyCheckNavigationOrderWifiSync](self, "safetyCheckNavigationOrderWifiSync");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSNavigationManager safetyCheckChaptersWifiSync](self, "safetyCheckChaptersWifiSync");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("Sharing Reminder");
LABEL_16:
    v14 = 1;
    goto LABEL_17;
  }
  if (v8 == (objc_class *)objc_opt_class())
  {
    if ((v9 & 1) != 0)
    {
      -[DSNavigationManager safetyResetNavigationOrderDTO](self, "safetyResetNavigationOrderDTO");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSNavigationManager safetyResetChaptersDTO](self, "safetyResetChaptersDTO");
    }
    else
    {
      -[DSNavigationManager safetyResetNavigationOrder](self, "safetyResetNavigationOrder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSNavigationManager safetyResetChapters](self, "safetyResetChapters");
    }
    goto LABEL_9;
  }
  if (v8 == (objc_class *)objc_opt_class())
  {
    if ((v9 & 1) != 0)
    {
      -[DSNavigationManager sharingActivityNavigationOrderDTO](self, "sharingActivityNavigationOrderDTO");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSNavigationManager sharingActivityChaptersDTO](self, "sharingActivityChaptersDTO");
    }
    else
    {
      -[DSNavigationManager sharingActivityNavigationOrder](self, "sharingActivityNavigationOrder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSNavigationManager sharingActivityChapters](self, "sharingActivityChapters");
    }
LABEL_9:
    v13 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v13;
    v12 = CFSTR("Apple Intelligence");
    goto LABEL_16;
  }
  -[DSNavigationManager restoredDTONavigationOrder:withPath:](self, "restoredDTONavigationOrder:withPath:", v7, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) != 0)
    -[DSNavigationManager safetyResetChaptersDTO](self, "safetyResetChaptersDTO");
  else
    -[DSNavigationManager sharingActivityChaptersDTO](self, "sharingActivityChaptersDTO");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v12 = CFSTR("SDP Delay");
LABEL_17:
  v15 = -[DSDeepLinkRepresentation initWithOrder:chapters:requiresAuth:flowType:entrypointAnalytic:path:]([DSDeepLinkRepresentation alloc], "initWithOrder:chapters:requiresAuth:flowType:entrypointAnalytic:path:", v10, v11, v14, v7, v12, v4);

  return v15;
}

- (id)restoredDTONavigationOrder:(int64_t)a3 withPath:(id)a4
{
  id v6;
  objc_class *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  v7 = -[DSNavigationManager startingClassForURL:](self, "startingClassForURL:", v6);
  if (v7)
  {
    v8 = v7;
    if (a3)
      -[DSNavigationManager sharingActivityNavigationOrderDTO](self, "sharingActivityNavigationOrderDTO");
    else
      -[DSNavigationManager safetyResetNavigationOrderDTO](self, "safetyResetNavigationOrderDTO");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexOfObject:", v8);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)DSLog_8, OS_LOG_TYPE_ERROR))
        -[DSNavigationManager restoredDTONavigationOrder:withPath:].cold.2();
      v9 = (void *)MEMORY[0x24BDBD1A8];
    }
    else
    {
      v12 = v11;
      v9 = (void *)objc_opt_new();
      if (v8 == (objc_class *)objc_opt_class())
        objc_msgSend(v9, "addObject:", objc_opt_class());
      objc_msgSend(v10, "subarrayWithRange:", v12, objc_msgSend(v10, "count") - v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v13);

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DSLog_8, OS_LOG_TYPE_ERROR))
      -[DSNavigationManager restoredDTONavigationOrder:withPath:].cold.1();
    v9 = 0;
  }

  return v9;
}

- (Class)startingClassForURL:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;

  v3 = a3;
  if (objc_msgSend(v3, "containsString:", CFSTR("PASSCODE"))
    || objc_msgSend(v3, "containsString:", CFSTR("FACEID"))
    || objc_msgSend(v3, "containsString:", CFSTR("TOUCHID"))
    || objc_msgSend(v3, "containsString:", CFSTR("apple.com"))
    || objc_msgSend(v3, "containsString:", CFSTR("reminders/wifisync"))
    || objc_msgSend(v3, "containsString:", CFSTR("EMERGENCY_RESET"))
    || objc_msgSend(v3, "containsString:", CFSTR("MANAGE_SHARING")))
  {
    v4 = (void *)objc_opt_class();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DSLog_8, OS_LOG_TYPE_ERROR))
      -[DSNavigationManager restoredDTONavigationOrder:withPath:].cold.1();
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (NSArray)panesRequiringNetwork
{
  return self->_panesRequiringNetwork;
}

- (void)setPanesRequiringNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_panesRequiringNetwork, a3);
}

- (NSDictionary)safetyResetChapters
{
  return self->_safetyResetChapters;
}

- (void)setSafetyResetChapters:(id)a3
{
  objc_storeStrong((id *)&self->_safetyResetChapters, a3);
}

- (NSDictionary)sharingActivityChapters
{
  return self->_sharingActivityChapters;
}

- (void)setSharingActivityChapters:(id)a3
{
  objc_storeStrong((id *)&self->_sharingActivityChapters, a3);
}

- (NSArray)safetyResetNavigationOrder
{
  return self->_safetyResetNavigationOrder;
}

- (void)setSafetyResetNavigationOrder:(id)a3
{
  objc_storeStrong((id *)&self->_safetyResetNavigationOrder, a3);
}

- (NSArray)sharingActivityNavigationOrder
{
  return self->_sharingActivityNavigationOrder;
}

- (void)setSharingActivityNavigationOrder:(id)a3
{
  objc_storeStrong((id *)&self->_sharingActivityNavigationOrder, a3);
}

- (NSDictionary)safetyResetChaptersDTO
{
  return self->_safetyResetChaptersDTO;
}

- (void)setSafetyResetChaptersDTO:(id)a3
{
  objc_storeStrong((id *)&self->_safetyResetChaptersDTO, a3);
}

- (NSDictionary)sharingActivityChaptersDTO
{
  return self->_sharingActivityChaptersDTO;
}

- (void)setSharingActivityChaptersDTO:(id)a3
{
  objc_storeStrong((id *)&self->_sharingActivityChaptersDTO, a3);
}

- (NSArray)safetyResetNavigationOrderDTO
{
  return self->_safetyResetNavigationOrderDTO;
}

- (void)setSafetyResetNavigationOrderDTO:(id)a3
{
  objc_storeStrong((id *)&self->_safetyResetNavigationOrderDTO, a3);
}

- (NSArray)sharingActivityNavigationOrderDTO
{
  return self->_sharingActivityNavigationOrderDTO;
}

- (void)setSharingActivityNavigationOrderDTO:(id)a3
{
  objc_storeStrong((id *)&self->_sharingActivityNavigationOrderDTO, a3);
}

- (NSDictionary)safetyCheckChaptersWifiSync
{
  return self->_safetyCheckChaptersWifiSync;
}

- (void)setSafetyCheckChaptersWifiSync:(id)a3
{
  objc_storeStrong((id *)&self->_safetyCheckChaptersWifiSync, a3);
}

- (NSArray)safetyCheckNavigationOrderWifiSync
{
  return self->_safetyCheckNavigationOrderWifiSync;
}

- (void)setSafetyCheckNavigationOrderWifiSync:(id)a3
{
  objc_storeStrong((id *)&self->_safetyCheckNavigationOrderWifiSync, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safetyCheckNavigationOrderWifiSync, 0);
  objc_storeStrong((id *)&self->_safetyCheckChaptersWifiSync, 0);
  objc_storeStrong((id *)&self->_sharingActivityNavigationOrderDTO, 0);
  objc_storeStrong((id *)&self->_safetyResetNavigationOrderDTO, 0);
  objc_storeStrong((id *)&self->_sharingActivityChaptersDTO, 0);
  objc_storeStrong((id *)&self->_safetyResetChaptersDTO, 0);
  objc_storeStrong((id *)&self->_sharingActivityNavigationOrder, 0);
  objc_storeStrong((id *)&self->_safetyResetNavigationOrder, 0);
  objc_storeStrong((id *)&self->_sharingActivityChapters, 0);
  objc_storeStrong((id *)&self->_safetyResetChapters, 0);
  objc_storeStrong((id *)&self->_panesRequiringNetwork, 0);
}

- (void)deepLinkToPane:inFlow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Pointing to Safety Check landing page because Class %@ is not handled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)restoredDTONavigationOrder:withPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Couldn't parse a DTO entry configuration from URL path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)restoredDTONavigationOrder:withPath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_2278DF000, v1, OS_LOG_TYPE_ERROR, "Current pane type: %@ not found in DTO navigation order: %@", v2, 0x16u);
  OUTLINED_FUNCTION_0_0();
}

@end
