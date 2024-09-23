@implementation IMAVController

- (BOOL)_shouldObserveConferences
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (*MEMORY[0x24BE503F0] & objc_msgSend_capabilities(v5, v6, v7, v8, v9)) != 0;

  return v10;
}

+ (id)sharedInstance
{
  if (qword_253DE94A8 != -1)
    dispatch_once(&qword_253DE94A8, &unk_24DA57448);
  return (id)qword_253DE94D8;
}

- (BOOL)_shouldRunConferences
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (*MEMORY[0x24BE50400] & objc_msgSend_capabilities(v5, v6, v7, v8, v9)) != 0;

  return v10;
}

- (BOOL)_shouldRunACConferences
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (*MEMORY[0x24BE503F8] & objc_msgSend_capabilities(v5, v6, v7, v8, v9)) != 0;

  return v10;
}

- (void)setupIMAVController
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (qword_253DE94A0 != -1)
    dispatch_once(&qword_253DE94A0, &unk_24DA57468);
  v5 = (id)objc_msgSend_sharedInstance(IMAVTelephonyManager, a2, v2, v3, v4);
  v10 = (id)objc_msgSend_sharedInstance(IMAVInterface, v6, v7, v8, v9);
}

- (IMAVController)init
{
  IMAVController *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  IMAVController *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *delegates;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)IMAVController;
  v2 = -[IMAVController init](&v20, sel_init);
  v6 = v2;
  if (v2)
  {
    objc_msgSend_setBlockIncomingInvitationsDuringCall_(v2, v3, 1, v4, v5);
    objc_msgSend_setBlockMultipleIncomingInvitations_(v6, v7, 1, v8, v9);
    objc_msgSend_setBlockOutgoingInvitationsDuringCall_(v6, v10, 1, v11, v12);
    objc_msgSend_nonRetainingArray(MEMORY[0x24BDBCEB8], v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    delegates = v6->_delegates;
    v6->_delegates = (NSMutableArray *)v17;

  }
  return v6;
}

- (void)declineVCRequestWithBuddy:(id)a3 response:(unsigned int)a4 vcProps:(id)a5 conferenceID:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  id v18;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend_account(v12, v13, v14, v15, v16);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(self, v17, (uint64_t)v12, v7, (uint64_t)v11, v18, v10);

}

- (id)vcResponseInfoWithSessionID:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], a2, *(uint64_t *)&a3, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObject_forKey_(v5, v7, (uint64_t)v6, *MEMORY[0x24BE504F0], v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)declineVCRequestWithBuddy:(id)a3 response:(unsigned int)a4 vcProps:(id)a5 forAccount:(id)a6 conferenceID:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  __CFString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __CFString *v53;
  NSObject *v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __CFString *v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const __CFString *v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const __CFString *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint8_t buf[4];
  const __CFString *v95;
  __int16 v96;
  id v97;
  __int16 v98;
  id v99;
  uint64_t v100;

  v10 = *(_QWORD *)&a4;
  v100 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = (__CFString *)a7;
  objc_msgSend_objectForKey_(a5, v15, *MEMORY[0x24BE50468], v16, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend_dictionaryWithPlistData_(MEMORY[0x24BDBCE70], v18, (uint64_t)v22, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_4;
    goto LABEL_3;
  }
  v23 = 0;
  if (!v13)
  {
LABEL_3:
    objc_msgSend_account(v12, v18, v19, v20, v21);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  objc_msgSend_objectForKey_(v23, v18, *MEMORY[0x24BE504F0], v20, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_unsignedIntValue(v24, v25, v26, v27, v28);

  objc_msgSend_vcResponseInfoWithSessionID_(self, v30, v29, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_plistData(v33, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_alloc(MEMORY[0x24BDBCE70]);
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v40, v10, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend_initWithObjectsAndKeys_(v39, v44, (uint64_t)v43, v45, v46, *MEMORY[0x24BE504D8], v38, *MEMORY[0x24BE504E0], 0);

  sub_2190076D0();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_ID(v12, v49, v50, v51, v52);
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v95 = v53;
    _os_log_impl(&dword_218FEA000, v48, OS_LOG_TYPE_DEFAULT, "Sending decline to service for: %@", buf, 0xCu);

  }
  sub_2190076D0();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v95 = v14;
    v96 = 2112;
    v97 = v13;
    v98 = 2112;
    v99 = v12;
    _os_log_impl(&dword_218FEA000, v54, OS_LOG_TYPE_DEFAULT, "Conference ID: %@     Account: %@    Handle: %@", buf, 0x20u);
  }

  sub_2190076D0();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_loginStatusMessage(v13, v56, v57, v58, v59);
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v95 = v60;
    _os_log_impl(&dword_218FEA000, v55, OS_LOG_TYPE_DEFAULT, "        Account login status: %@", buf, 0xCu);

  }
  sub_2190076D0();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_isActive(v13, v62, v63, v64, v65))
      v66 = CFSTR("YES");
    else
      v66 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v95 = v66;
    _os_log_impl(&dword_218FEA000, v61, OS_LOG_TYPE_DEFAULT, "        Account active: %@", buf, 0xCu);
  }

  sub_2190076D0();
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v68, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isConnected(v72, v73, v74, v75, v76))
      v77 = CFSTR("YES");
    else
      v77 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v95 = v77;
    _os_log_impl(&dword_218FEA000, v67, OS_LOG_TYPE_DEFAULT, "        Daemon Connected: %@", buf, 0xCu);

  }
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v78, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ID(v12, v83, v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueID(v13, v88, v89, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_respondToVCInvitationWithPerson_properties_conference_account_(v82, v93, (uint64_t)v87, (uint64_t)v47, (uint64_t)v14, v92);

}

- (void)cancelVCRequestWithBuddy:(id)a3 vcProps:(id)a4 forAccount:(id)a5 conferenceID:(id)a6 reason:(id)a7
{
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const __CFString *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  id v79;
  unsigned int v80;
  uint8_t buf[4];
  const __CFString *v83;
  __int16 v84;
  id v85;
  __int16 v86;
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (__CFString *)a6;
  v79 = a7;
  if (!v13)
  {
    objc_msgSend_account(v11, v15, v16, v17, v18);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectForKey_(v12, v15, *MEMORY[0x24BE504F0], v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend_unsignedIntValue(v19, v20, v21, v22, v23);

  sub_2190076D0();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_ID(v11, v25, v26, v27, v28);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v83 = v29;
    _os_log_impl(&dword_218FEA000, v24, OS_LOG_TYPE_DEFAULT, "Sending cancel to service for: %@", buf, 0xCu);

  }
  sub_2190076D0();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v83 = v14;
    v84 = 2112;
    v85 = v13;
    v86 = 2112;
    v87 = v11;
    _os_log_impl(&dword_218FEA000, v30, OS_LOG_TYPE_DEFAULT, "Conference ID: %@     Account: %@    Handle: %@", buf, 0x20u);
  }

  sub_2190076D0();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_loginStatusMessage(v13, v32, v33, v34, v35);
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v83 = v36;
    _os_log_impl(&dword_218FEA000, v31, OS_LOG_TYPE_DEFAULT, "        Account login status: %@", buf, 0xCu);

  }
  sub_2190076D0();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_isActive(v13, v38, v39, v40, v41))
      v42 = CFSTR("YES");
    else
      v42 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v83 = v42;
    _os_log_impl(&dword_218FEA000, v37, OS_LOG_TYPE_DEFAULT, "        Account active: %@", buf, 0xCu);
  }

  sub_2190076D0();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isConnected(v48, v49, v50, v51, v52))
      v53 = CFSTR("YES");
    else
      v53 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v83 = v53;
    _os_log_impl(&dword_218FEA000, v43, OS_LOG_TYPE_DEFAULT, "        Daemon Connected: %@", buf, 0xCu);

  }
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ID(v11, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vcResponseInfoWithSessionID_(self, v64, v80, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v11, v68, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueID(v72, v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelVCRequestWithPerson_properties_conference_reason_account_(v58, v78, (uint64_t)v63, (uint64_t)v67, (uint64_t)v14, v79, v77);

}

- (NSArray)delegates
{
  return (NSArray *)self->_delegates;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v9 = a4;
  if (v13 && (objc_msgSend_containsObjectIdenticalTo_(self->_delegates, v6, (uint64_t)v13, v7, v8) & 1) == 0)
    objc_msgSend_addObject_(self->_delegates, v10, (uint64_t)v13, v11, v12);

}

- (void)removeDelegate:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
    objc_msgSend_removeObjectIdenticalTo_(self->_delegates, a2, (uint64_t)a3, v3, v4);
}

- (IMAVControllerDelegate)delegate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (IMAVControllerDelegate *)objc_msgSend___imFirstObject(self->_delegates, a2, v2, v3, v4);
}

- (void)setDelegate:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend_delegate(self, v4, v5, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v11 = v12;
  if (v8 != v12)
  {
    objc_msgSend_addDelegate_queue_(self, v9, (uint64_t)v12, MEMORY[0x24BDAC9B8], v10);
    v11 = v12;
  }

}

- (void)_dumpCaps
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  int v39;
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_hasRunningConference(self, v4, v5, v6, v7))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v39 = 138412290;
    v40 = v8;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "     has running conference: %@", (uint8_t *)&v39, 0xCu);
  }

  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_hasActiveConference(self, v10, v11, v12, v13))
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v39 = 138412290;
    v40 = v14;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "      has active conference: %@", (uint8_t *)&v39, 0xCu);
  }

  sub_2190076D0();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_cameraConnected(self, v16, v17, v18, v19))
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v39 = 138412290;
    v40 = v20;
    _os_log_impl(&dword_218FEA000, v15, OS_LOG_TYPE_DEFAULT, "           camera connected: %@", (uint8_t *)&v39, 0xCu);
  }

  sub_2190076D0();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_cameraCapable(self, v22, v23, v24, v25))
      v26 = CFSTR("YES");
    else
      v26 = CFSTR("NO");
    v39 = 138412290;
    v40 = v26;
    _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "             camera capable: %@", (uint8_t *)&v39, 0xCu);
  }

  sub_2190076D0();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_microphoneCapable(self, v28, v29, v30, v31))
      v32 = CFSTR("YES");
    else
      v32 = CFSTR("NO");
    v39 = 138412290;
    v40 = v32;
    _os_log_impl(&dword_218FEA000, v27, OS_LOG_TYPE_DEFAULT, "         microphone capable: %@", (uint8_t *)&v39, 0xCu);
  }

  sub_2190076D0();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_microphoneConnected(self, v34, v35, v36, v37))
      v38 = CFSTR("YES");
    else
      v38 = CFSTR("NO");
    v39 = 138412290;
    v40 = v38;
    _os_log_impl(&dword_218FEA000, v33, OS_LOG_TYPE_DEFAULT, "       microphone connected: %@", (uint8_t *)&v39, 0xCu);
  }

}

- (void)_setServiceVCCaps:(unint64_t)a3 toCaps:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v5 = (qword_253DE9490 & ~(_DWORD)a3 | a4) & 0x1F0000 | 0x100000020000;
  qword_253DE9490 = v5;
  if (!qword_253DE9498)
    qword_253DE9498 = v5;
  objc_msgSend__dumpCaps(self, a2, a3, a4, v4);
  objc_msgSend__nonFinalChat(IMAVChat, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    qword_253DE9490 = qword_253DE9490 & 0xFFFFFFFFFFEEFFFFLL | 0x100000;
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v11, v12, v13, v14);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVCCapabilities_(v18, v15, qword_253DE9490, v16, v17);

}

- (void)setIMAVCapabilities:(int64_t)a3 toCaps:(int64_t)a4
{
  uint64_t v4;
  uint64x2_t v5;
  int8x16_t v6;
  uint64x2_t v7;
  uint64_t v8;
  int8x16_t v9;

  v5 = (uint64x2_t)vdupq_n_s64(a3);
  v6 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_2190277B0), (int8x16_t)xmmword_2190277E0), vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_2190277C0), (int8x16_t)xmmword_2190277D0));
  v7 = (uint64x2_t)vdupq_n_s64(a4);
  v8 = (uint64_t)vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL));
  v9 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(v7, (uint64x2_t)xmmword_2190277B0), (int8x16_t)xmmword_2190277E0), vandq_s8((int8x16_t)vshlq_u64(v7, (uint64x2_t)xmmword_2190277C0), (int8x16_t)xmmword_2190277D0));
  objc_msgSend__setServiceVCCaps_toCaps_(self, a2, v8, *(_QWORD *)&vorr_s8(*(int8x8_t *)v9.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)), v4);
}

- (void)vcCapabilitiesChanged:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  id v34;

  if ((objc_msgSend__shouldRunConferences(self, a2, a3, v3, v4) & 1) != 0)
    LOBYTE(v11) = 0;
  else
    v11 = objc_msgSend__shouldRunACConferences(self, v7, v8, v9, v10) ^ 1;
  if (objc_msgSend__shouldObserveConferences(self, v7, v8, v9, v10))
  {
    if (qword_253DE9490)
      v16 = v11;
    else
      v16 = 1;
    if ((v16 & 1) != 0)
      goto LABEL_9;
  }
  else if (!qword_253DE9490)
  {
LABEL_9:
    qword_253DE9490 = a3;
  }
  if (qword_253DE9498 != a3)
  {
    qword_253DE9498 = a3;
    if ((objc_msgSend__shouldRunConferences(self, v12, v13, v14, v15) & 1) != 0
      || (objc_msgSend__shouldRunACConferences(self, v17, v18, v19, v20) & 1) != 0
      || objc_msgSend__shouldObserveConferences(self, v17, v18, v19, v20))
    {
      objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v22, qword_253DE9490 | 0x100000, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v21, v26, (uint64_t)v25, (uint64_t)CFSTR("CachedVCCaps"), v27);

    }
    objc_msgSend__dumpCaps(self, v17, v18, v19, v20);
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v28, v29, v30, v31);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v34, v32, (uint64_t)CFSTR("VideoCapabilitesChangedNotification"), 0, v33);

  }
}

- (void)pushCachedVCCapsToDaemon
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, v2, v3, v4);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v32, v6, (uint64_t)CFSTR("CachedVCCaps"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  v15 = qword_253DE9490;
  if (qword_253DE9490)
    v16 = 1;
  else
    v16 = v9 == 0;
  if (!v16)
  {
    v15 = objc_msgSend_unsignedLongLongValue(v9, v10, v11, v12, v13) | 0x100000;
LABEL_7:
    objc_msgSend__setServiceVCCaps_toCaps_(self, v10, 2031616, v15, v13);
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v21, v22, (uint64_t)CFSTR("VideoCapabilitesChangedNotification"), 0, v23);

    objc_msgSend_sharedInstance(IMAVController, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vcCapabilitiesChanged_(v28, v29, v15, v30, v31);

    goto LABEL_8;
  }
  if (qword_253DE9490)
    goto LABEL_7;
LABEL_8:

}

- (unsigned)overallChatState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend__callState(v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)cameraConnected
{
  return (BYTE2(qword_253DE9490) >> 2) & 1;
}

- (BOOL)microphoneConnected
{
  return (BYTE2(qword_253DE9490) >> 3) & 1;
}

- (BOOL)hasActiveConference
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__hasActiveFaceTimeCall(v5, v6, v7, v8, v9) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend_sharedInstance(IMAVCallManager, v10, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend__hasActiveAudioCall(v15, v16, v17, v18, v19);

  }
  return v14;
}

- (BOOL)hasRunningConference
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend__callState(v5, v6, v7, v8, v9);

  return v10 > 1 && v10 != 5;
}

- (BOOL)cameraCapable
{
  return (BYTE2(qword_253DE9498) >> 2) & 1;
}

- (BOOL)microphoneCapable
{
  return (BYTE2(qword_253DE9498) >> 3) & 1;
}

- (void)requestPendingVCInvitations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  if (objc_msgSend__shouldRunConferences(self, a2, v2, v3, v4))
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v5, v6, v7, v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestPendingVCInvites(v13, v9, v10, v11, v12);

  }
}

- (void)requestPendingACInvitations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  if (objc_msgSend__shouldRunACConferences(self, a2, v2, v3, v4))
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v5, v6, v7, v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestPendingACInvites(v13, v9, v10, v11, v12);

  }
}

- (BOOL)_ready
{
  return qword_253DE9490 != 0;
}

- (void)_receivedPendingACRequests
{
  NSObject *v2;
  uint8_t v3[16];

  byte_25503B8A8 = 1;
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "Got pending AC requests flushed", v3, 2u);
  }

}

- (void)_receivedPendingVCRequests
{
  NSObject *v2;
  uint8_t v3[16];

  byte_25503B8A9 = 1;
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "Got pending VC requests flushed", v3, 2u);
  }

}

- (void)blockOnPendingVCInvitationsWithCapabilities:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char isConnected;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int shouldRunACConferences;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int shouldRunConferences;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  int v37;
  void *v38;
  const char *v39;
  void *v40;
  id v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  int v59;
  int v60;
  int v61;
  int v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  int v66;
  double v67;
  NSObject *v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  NSObject *v73;
  IMAVController *v74;
  uint8_t v75[16];
  uint8_t v76[16];
  uint8_t buf[16];

  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], a2, a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isConnected = objc_msgSend_isConnected(v6, v7, v8, v9, v10);

  if ((isConnected & 1) == 0)
  {
    shouldRunACConferences = objc_msgSend__shouldRunACConferences(self, v12, v13, v14, v15);
    shouldRunConferences = objc_msgSend__shouldRunConferences(self, v17, v18, v19, v20);
    objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_blockUntilConnected(v26, v27, v28, v29, v30);

    if (shouldRunACConferences)
    {
      objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v31, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObserver_selector_name_object_(v35, v36, (uint64_t)self, (uint64_t)sel__receivedPendingACRequests, (uint64_t)CFSTR("__kIMAVControllerPendingACInvitationRequestComplete"), 0);

    }
    v37 = shouldRunACConferences;
    if (shouldRunConferences)
    {
      objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v31, v32, v33, v34);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObserver_selector_name_object_(v38, v39, (uint64_t)self, (uint64_t)sel__receivedPendingVCRequests, (uint64_t)CFSTR("__kIMAVControllerPendingAVInvitationRequestComplete"), 0);

      v37 = 1;
    }
    objc_msgSend_currentRunLoop(MEMORY[0x24BDBCF18], v31, v32, v33, v34);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    sub_2190076D0();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v42, OS_LOG_TYPE_DEFAULT, "Starting block for VC invitations", buf, 2u);
    }

    byte_25503B8A8 = 0;
    byte_25503B8A9 = 0;
    if (shouldRunACConferences)
    {
      objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v43, v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_requestPendingACInvites(v47, v48, v49, v50, v51);

    }
    v74 = self;
    if (shouldRunConferences)
    {
      objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v43, v44, v45, v46);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_requestPendingVCInvites(v52, v53, v54, v55, v56);

    }
    v57 = v37 ^ 1;
    v58 = *MEMORY[0x24BE501D8];
    v59 = shouldRunConferences ^ 1;
    while (1)
    {
      v60 = shouldRunACConferences & (byte_25503B8A8 ^ 1);
      if (((v60 | v59) & 1) != 0)
      {
        v61 = v60 | shouldRunConferences;
      }
      else
      {
        v61 = shouldRunConferences;
        if ((byte_25503B8A9 & 1) != 0)
          break;
      }
      v62 = v61 ^ 1;
      if (((v62 | v57) & 1) == 0)
      {
        objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x24BDBCE60], v43, v44, v45, v46, 2.0);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_runMode_beforeDate_(v40, v64, v58, (uint64_t)v63, v65);

        v66 = shouldRunACConferences & (byte_25503B8A8 ^ 1);
        if (((v66 | v59) & 1) != 0)
        {
          v62 = (v66 | shouldRunConferences) ^ 1;
        }
        else
        {
          if ((byte_25503B8A9 & 1) != 0)
            break;
          v62 = 0;
        }
      }
      if (((v62 | v57) & 1) != 0)
        break;
      objc_msgSend_timeIntervalSinceNow(v41, v43, v44, v45, v46);
      if (v67 <= -2.0)
      {
        sub_2190076D0();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v76 = 0;
          _os_log_impl(&dword_218FEA000, v68, OS_LOG_TYPE_DEFAULT, "Timed out blocking for VC invitiations", v76, 2u);
        }

        break;
      }
    }
    if (shouldRunACConferences)
    {
      objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v43, v44, v45, v46);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObserver_name_object_(v69, v70, (uint64_t)v74, (uint64_t)CFSTR("__kIMAVControllerPendingACInvitationRequestComplete"), 0);

    }
    if (shouldRunConferences)
    {
      objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v43, v44, v45, v46);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObserver_name_object_(v71, v72, (uint64_t)v74, (uint64_t)CFSTR("__kIMAVControllerPendingAVInvitationRequestComplete"), 0);

    }
    sub_2190076D0();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v75 = 0;
      _os_log_impl(&dword_218FEA000, v73, OS_LOG_TYPE_DEFAULT, "Complete block for VC invitations", v75, 2u);
    }

  }
}

- (NSMutableArray)_delegates
{
  return self->_delegates;
}

- (void)set_delegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (BOOL)blockMultipleIncomingInvitations
{
  return self->_blockMultipleIncomingInvitations;
}

- (void)setBlockMultipleIncomingInvitations:(BOOL)a3
{
  self->_blockMultipleIncomingInvitations = a3;
}

- (BOOL)blockOutgoingInvitationsDuringCall
{
  return self->_blockOutgoingInvitationsDuringCall;
}

- (void)setBlockOutgoingInvitationsDuringCall:(BOOL)a3
{
  self->_blockOutgoingInvitationsDuringCall = a3;
}

- (BOOL)blockIncomingInvitationsDuringCall
{
  return self->_blockIncomingInvitationsDuringCall;
}

- (void)setBlockIncomingInvitationsDuringCall:(BOOL)a3
{
  self->_blockIncomingInvitationsDuringCall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end
