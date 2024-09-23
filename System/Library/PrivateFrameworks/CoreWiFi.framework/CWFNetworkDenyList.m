@implementation CWFNetworkDenyList

- (CWFNetworkDenyList)initWithDenyListDeviceProfile:(unint64_t)a3
{
  CWFNetworkDenyList *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CWFNetworkDenyList *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *v21;
  NSMutableArray *denyList;
  NSArray *v23;
  NSArray *SSIDThresholds;
  NSArray *v25;
  NSArray *BSSIDThresholds;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CWFNetworkDenyList *v31;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  objc_super v46;
  int v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)CWFNetworkDenyList;
  v4 = -[CWFNetworkDenyList init](&v46, sel_init);
  v8 = v4;
  if (!v4)
  {
    CWFGetOSLog();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      CWFGetOSLog();
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = MEMORY[0x1E0C81028];
      v38 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    v47 = 136446210;
    v48 = "-[CWFNetworkDenyList initWithDenyListDeviceProfile:]";
    goto LABEL_27;
  }
  objc_msgSend_setEnabled_(v4, v5, 0, v6, v7);
  objc_msgSend_setWowDenyListExpiry_(v8, v9, v10, v11, v12, 600.0);
  objc_msgSend_setNetworkDenyListExpiry_(v8, v13, v14, v15, v16, 300.0);
  objc_msgSend_setBSSDenyListExpiry_(v8, v17, v18, v19, v20, 300.0);
  v8->_profile = a3;
  v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  denyList = v8->_denyList;
  v8->_denyList = v21;

  if (!v8->_denyList)
  {
    CWFGetOSLog();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      CWFGetOSLog();
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = MEMORY[0x1E0C81028];
      v39 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    v47 = 136446210;
    v48 = "-[CWFNetworkDenyList initWithDenyListDeviceProfile:]";
    goto LABEL_27;
  }
  v23 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
  SSIDThresholds = v8->_SSIDThresholds;
  v8->_SSIDThresholds = v23;

  if (!v8->_SSIDThresholds)
  {
    CWFGetOSLog();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      CWFGetOSLog();
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = MEMORY[0x1E0C81028];
      v40 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    v47 = 136446210;
    v48 = "-[CWFNetworkDenyList initWithDenyListDeviceProfile:]";
    goto LABEL_27;
  }
  v25 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
  BSSIDThresholds = v8->_BSSIDThresholds;
  v8->_BSSIDThresholds = v25;

  if (!v8->_BSSIDThresholds)
  {
    CWFGetOSLog();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      CWFGetOSLog();
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = MEMORY[0x1E0C81028];
      v41 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    v47 = 136446210;
    v48 = "-[CWFNetworkDenyList initWithDenyListDeviceProfile:]";
LABEL_27:
    _os_log_send_and_compose_impl();
LABEL_28:

    objc_msgSend_removeAllObjects(v8->_denyList, v42, v43, v44, v45);
    v31 = 0;
    goto LABEL_6;
  }
  objc_msgSend_setDefaultDenyListThresholds(v8, v27, v28, v29, v30);
  v31 = v8;
LABEL_6:

  return v31;
}

- (void)setDefaultDenyListThresholds
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSArray *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  NSArray *SSIDThresholds;
  NSArray *BSSIDThresholds;
  NSArray *v110;

  v6 = (NSArray *)objc_msgSend_mutableCopy(self->_SSIDThresholds, a2, v2, v3, v4);
  v11 = (NSArray *)objc_msgSend_mutableCopy(self->_BSSIDThresholds, v7, v8, v9, v10);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v12, 1, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v16, (uint64_t)v15, 0, v17);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v18, 1, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v22, (uint64_t)v21, 1, v23);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v24, 1, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v28, (uint64_t)v27, 2, v29);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v30, 3, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v34, (uint64_t)v33, 3, v35);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v36, 3, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v40, (uint64_t)v39, 4, v41);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v42, 10, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v46, (uint64_t)v45, 5, v47);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v48, 1, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v52, (uint64_t)v51, 6, v53);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v54, 3, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v58, (uint64_t)v57, 7, v59);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v60, 1, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v64, (uint64_t)v63, 0, v65);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v66, 1, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v70, (uint64_t)v69, 1, v71);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v72, 1, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v76, (uint64_t)v75, 2, v77);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v78, 5, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v82, (uint64_t)v81, 3, v83);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v84, 5, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v88, (uint64_t)v87, 4, v89);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v90, 10, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v94, (uint64_t)v93, 5, v95);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v96, 1, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v100, (uint64_t)v99, 6, v101);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v102, 3, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v106, (uint64_t)v105, 7, v107);

  SSIDThresholds = self->_SSIDThresholds;
  self->_SSIDThresholds = v6;
  v110 = v6;

  BSSIDThresholds = self->_BSSIDThresholds;
  self->_BSSIDThresholds = v11;

}

- (void)setDenyListedStateExpiryIntervalInSec:(double)a3 state:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  if (a4 != 3)
  {
    if (a4 == 2)
    {
      if (a3 != 0.0 && a3 <= 300.0)
      {
        objc_msgSend_setBSSDenyListExpiry_(self, a2, 2, v4, v5, a3);
        return;
      }
      CWFGetOSLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        CWFGetOSLog();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = MEMORY[0x1E0C81028];
        v12 = MEMORY[0x1E0C81028];
      }

      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
    }
    else if (a4 == 1)
    {
      if (a3 != 0.0 && a3 <= 86400.0)
      {
        objc_msgSend_setNetworkDenyListExpiry_(self, a2, 1, v4, v5, a3);
        return;
      }
      CWFGetOSLog();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        CWFGetOSLog();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = MEMORY[0x1E0C81028];
        v14 = MEMORY[0x1E0C81028];
      }

      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
    }
    else
    {
      CWFGetOSLog();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        CWFGetOSLog();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = MEMORY[0x1E0C81028];
        v11 = MEMORY[0x1E0C81028];
      }

      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (a3 != 0.0 && a3 <= 3600.0)
  {
    objc_msgSend_setWowDenyListExpiry_(self, a2, 3, v4, v5, a3);
    return;
  }
  CWFGetOSLog();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CWFGetOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
LABEL_32:
    _os_log_send_and_compose_impl();
LABEL_33:

}

- (void)setDenyListingThresholds:(unint64_t)a3 value:(unsigned int)a4 forSSIDThresholds:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  if (a3 > 6 || a4 >= 0xFF)
  {
    CWFGetOSLog();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      CWFGetOSLog();
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = MEMORY[0x1E0C81028];
      v38 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      _os_log_send_and_compose_impl();

  }
  else
  {
    objc_msgSend_SSIDThresholds(self, a2, a3, *(uint64_t *)&a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (id)objc_msgSend_mutableCopy(v9, v10, v11, v12, v13);

    objc_msgSend_BSSIDThresholds(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend_mutableCopy(v18, v19, v20, v21, v22);

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v24, v6, v25, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend_setObject_atIndexedSubscript_(v39, v27, (uint64_t)v29, a3, v28);

      objc_msgSend_setSSIDThresholds_(self, v30, (uint64_t)v39, v31, v32);
    }
    else
    {
      objc_msgSend_setObject_atIndexedSubscript_(v23, v27, (uint64_t)v29, a3, v28);

      objc_msgSend_setBSSIDThresholds_(self, v35, (uint64_t)v23, v36, v37);
    }

  }
}

- (int64_t)denyListThresholdForReason:(unint64_t)a3 forSSIDThresholds:(BOOL)a4
{
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;

  if (a4)
    objc_msgSend_SSIDThresholds(self, a2, a3, a4, v4);
  else
    objc_msgSend_BSSIDThresholds(self, a2, a3, a4, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v6, v7, a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_integerValue(v10, v11, v12, v13, v14);

  return v15;
}

- (void)_setDenyListState:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6
{
  MEMORY[0x1E0DE7D20](a3, sel_addDenyListState_reason_reasonData_, a4, a5, a6);
}

- (void)setNetworkDenyListInfo:(id)a3 forScanResult:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  CWFNetworkDenyListItem *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  id v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  int v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  id v136;
  int *v137;
  int v138;
  void *v139;
  NSObject *v140;
  int v141;
  const char *v142;
  __int16 v143;
  const char *v144;
  __int16 v145;
  int v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  void *v150;
  __int16 v151;
  void *v152;
  __int16 v153;
  uint64_t v154;
  __int16 v155;
  uint64_t v156;
  __int16 v157;
  uint64_t v158;
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend_enabled(self, v8, v9, v10, v11) & 1) != 0)
  {
    objc_msgSend__findNetworkDenyListItem_(self, v12, (uint64_t)v7, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v20 = v15;
      v21 = 0;
    }
    else
    {
      v23 = [CWFNetworkDenyListItem alloc];
      v27 = (void *)objc_msgSend_initWithDenyListNetwork_(v23, v24, (uint64_t)v7, v25, v26);
      if (!v27)
      {
        CWFGetOSLog();
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        if (v135)
        {
          CWFGetOSLog();
          v134 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v134 = MEMORY[0x1E0C81028];
          v136 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled((os_log_t)v134, OS_LOG_TYPE_ERROR))
        {
          v141 = 136446210;
          v142 = "-[CWFNetworkDenyList setNetworkDenyListInfo:forScanResult:]";
          _os_log_send_and_compose_impl();
        }
        v21 = 0;
        v35 = 0;
        v20 = 0;
        goto LABEL_25;
      }
      v21 = v27;
      v20 = v21;
    }
    if (!objc_msgSend_state(v6, v16, v17, v18, v19))
      objc_msgSend_setState_(v6, v28, 5, v30, v31);
    v32 = objc_msgSend_reason(v6, v28, v29, v30, v31);
    if ((objc_msgSend__ignoreTriggersForDeviceProfile_denyListItem_(self, v33, v32, (uint64_t)v20, v34) & 1) != 0)
    {
      v35 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v36 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend_scanResultForNetworkDenyListItem(v20, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend_initWithData_encoding_(v36, v47, (uint64_t)v46, 4, v48);

    CWFGetOSLog();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      CWFGetOSLog();
      v50 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = MEMORY[0x1E0C81028];
      v52 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v57 = objc_msgSend_reason(v6, v53, v54, v55, v56);
      CWFStringFromDenyListAddReason(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_BSSID(v6, v59, v60, v61, v62);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = v21;
      objc_msgSend_redactedForWiFi(v139, v63, v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = 136448258;
      v142 = "-[CWFNetworkDenyList setNetworkDenyListInfo:forScanResult:]";
      v143 = 2082;
      v144 = "CWFNetworkDenyList.m";
      v145 = 1024;
      v146 = 189;
      v147 = 2114;
      v148 = v58;
      v149 = 2114;
      v150 = v35;
      v151 = 2114;
      v152 = v67;
      v153 = 2048;
      v154 = objc_msgSend_reason(v6, v68, v69, v70, v71);
      v155 = 2048;
      v156 = objc_msgSend_reasonData(v6, v72, v73, v74, v75);
      v157 = 2048;
      v158 = objc_msgSend_state(v6, v76, v77, v78, v79);
      v138 = 88;
      v137 = &v141;
      _os_log_send_and_compose_impl();

      v21 = v140;
    }

    v84 = objc_msgSend_reason(v6, v80, v81, v82, v83);
    v89 = objc_msgSend_reasonData(v6, v85, v86, v87, v88);
    objc_msgSend_BSSID(v6, v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addDenyListTrigger_reasonData_BSSID_(v20, v95, v84, v89, (uint64_t)v94);

    v100 = objc_msgSend_reason(v6, v96, v97, v98, v99);
    v105 = objc_msgSend_reasonData(v6, v101, v102, v103, v104);
    objc_msgSend_BSSID(v6, v106, v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend_state(v6, v111, v112, v113, v114);
    v117 = objc_msgSend__evaluateTriggersForDenyListing_reason_reasonData_BSSID_SSID_state_(self, v116, (uint64_t)v20, v100, v105, v110, v35, v115);

    if ((objc_msgSend_containsObject_(self->_denyList, v118, (uint64_t)v20, v119, v120) & 1) == 0)
      objc_msgSend_addObject_(self->_denyList, v121, (uint64_t)v20, v123, v124);
    objc_msgSend__printDenyList(self, v121, v122, v123, v124, v137, v138);
    if (!v117)
      goto LABEL_26;
    objc_msgSend_denyListDidUpdateHandler(self, v125, v126, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v129)
      goto LABEL_26;
    objc_msgSend_denyListDidUpdateHandler(self, v130, v131, v132, v133);
    v134 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v134 + 16))(v134, &unk_1E61327E0);
LABEL_25:

    goto LABEL_26;
  }
  CWFGetOSLog();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    CWFGetOSLog();
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = MEMORY[0x1E0C81028];
    v51 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v141 = 136446210;
    v142 = "-[CWFNetworkDenyList setNetworkDenyListInfo:forScanResult:]";
    _os_log_send_and_compose_impl();
  }
LABEL_27:

}

- (BOOL)_evaluateTriggersForDenyListing:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 BSSID:(id)a6 SSID:(id)a7 state:(unint64_t)a8
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  unsigned int v63;
  unsigned int v64;
  double v65;
  void *v66;
  NSObject *v67;
  id v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  NSObject *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  NSObject *v106;
  void *v107;
  id v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  unsigned int v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  id v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  id v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char v144;
  void *v146;
  NSObject *v147;
  id v148;
  int *v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t v153;
  id v154;
  char v155;
  char v157;
  id v158;
  unsigned int v159;
  unint64_t v160;
  id obj;
  unint64_t v162;
  unsigned int v164;
  uint64_t v165;
  uint64_t v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  int v171;
  const char *v172;
  __int16 v173;
  void *v174;
  __int16 v175;
  void *v176;
  __int16 v177;
  double v178;
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v154 = a7;
  if (!v12)
  {
    CWFGetOSLog();
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    if (v146)
    {
      CWFGetOSLog();
      v147 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v147 = MEMORY[0x1E0C81028];
      v148 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
    {
      v171 = 136446210;
      v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
      _os_log_send_and_compose_impl();
    }

    v144 = 0;
    goto LABEL_122;
  }
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  objc_msgSend_denyListTriggers(v12, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v167, (uint64_t)v179, 16);
  if (!v166)
  {

    v144 = 0;
    goto LABEL_121;
  }
  v152 = 0;
  v153 = 0;
  v162 = 0;
  v164 = 0;
  v159 = 0;
  v157 = 0;
  v155 = 0;
  v165 = *(_QWORD *)v168;
  v151 = a8 & 0xFFFFFFFFFFFFFFFELL;
  v158 = v13;
  v160 = a8;
  obj = v18;
  do
  {
    v24 = 0;
    do
    {
      if (*(_QWORD *)v168 != v165)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * v24);
      objc_msgSend_date(MEMORY[0x1E0C99D68], v20, v21, v22, v23, v149, v150);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSince1970(v26, v27, v28, v29, v30);
      v32 = v31;

      v37 = objc_msgSend_reason(v25, v33, v34, v35, v36);
      v42 = objc_msgSend_reasonData(v25, v38, v39, v40, v41);
      objc_msgSend_reasonTimestamp(v25, v43, v44, v45, v46);
      v48 = v47;
      if (!objc_msgSend_enterprisePolicy(v12, v49, v50, v51, v52)
        || a4 > 7
        || (v57 = v32 - v48, v32 - v48 > 300.0))
      {
        if (!objc_msgSend_enterprisePolicy(v12, v53, v54, v55, v56, v57))
          goto LABEL_29;
        CWFGetOSLog();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (v66)
        {
          CWFGetOSLog();
          v67 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v67 = MEMORY[0x1E0C81028];
          v68 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          CWFStringFromDenyListAddReason(v37);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_BSSID(v25, v70, v71, v72, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_redactedForWiFi(v74, v75, v76, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v171 = 136446978;
          v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
          v173 = 2114;
          v174 = v69;
          v175 = 2114;
          v176 = v79;
          v177 = 2048;
          v178 = v32 - v48;
          LODWORD(v150) = 42;
          v149 = &v171;
          _os_log_send_and_compose_impl();

          a8 = v160;
          goto LABEL_27;
        }
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend_BSSID(v25, v53, v54, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend_compare_options_(v58, v59, (uint64_t)v13, 1, v60);

      v62 = v61 == 0;
      v63 = v159;
      if (!v61)
        v63 = v159 + 1;
      if (v37 != a4)
        v62 = 0;
      v164 += v62;
      if (v37 == a4)
        v64 = v162 + 1;
      else
        v64 = v162;
      v162 = __PAIR64__(HIDWORD(v162), v64) + 0x100000000;
      v159 = v63;
      if (v63 > 0x12
        || (objc_msgSend__meetsThresholds_count_forSSIDThresholds_BSSID_SSID_(self, v20, a4, v164, 0, v13, v154) & 1) != 0
        || HIDWORD(v162) > 0x12
        || objc_msgSend__meetsThresholds_count_forSSIDThresholds_BSSID_SSID_(self, v20, a4, v162, 1, v13, v154))
      {
        if (a8 == 5 || a8 == 3)
        {
          objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 3, a4, a5);
          v155 = 1;
          goto LABEL_29;
        }
        CWFGetOSLog();
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        if (v87)
        {
          CWFGetOSLog();
          v67 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v67 = MEMORY[0x1E0C81028];
          v88 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          CWFStringFromDenyListAddReason(a4);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v89, v90, v91, v92, v32);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v171 = 136446722;
          v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
          v173 = 2114;
          v174 = v69;
          v175 = 2114;
          v176 = v74;
          LODWORD(v150) = 32;
          v149 = &v171;
          _os_log_send_and_compose_impl();
LABEL_27:

          v13 = v158;
        }
        goto LABEL_28;
      }
LABEL_29:
      if (v37 != a4)
      {
        CWFGetOSLog();
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (v82)
        {
          CWFGetOSLog();
          v83 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v83 = MEMORY[0x1E0C81028];
          v84 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
        {
          CWFStringFromDenyListAddReason(v37);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          CWFStringFromDenyListAddReason(a4);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v171 = 136446722;
          v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
          v173 = 2114;
          v174 = v85;
          v175 = 2114;
          v176 = v86;
          LODWORD(v150) = 32;
          v149 = &v171;
          goto LABEL_48;
        }
        goto LABEL_49;
      }
      if (a4 <= 3)
      {
        if (a8 != 1 && a8 != 5)
        {
          if (a8 == 3)
          {
            objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 3, a4, a5);
            CWFGetOSLog();
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            if (v80)
            {
              CWFGetOSLog();
              v81 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v81 = MEMORY[0x1E0C81028];
              v93 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
            {
              objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v94, v95, v96, v97, v32);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v171 = 136446466;
              v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
              v173 = 2114;
              v174 = v98;
              LODWORD(v150) = 22;
              v149 = &v171;
              _os_log_send_and_compose_impl();

            }
            v155 = 1;
          }
          CWFGetOSLog();
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          if (v99)
          {
            CWFGetOSLog();
            v83 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v83 = MEMORY[0x1E0C81028];
            v100 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
          {
LABEL_78:
            CWFStringFromDenyListAddReason(a4);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v101, v102, v103, v104, v32);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v171 = 136446722;
            v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
            v173 = 2114;
            v174 = v85;
            v175 = 2114;
            v176 = v86;
            LODWORD(v150) = 32;
            v149 = &v171;
            goto LABEL_48;
          }
LABEL_49:

          goto LABEL_50;
        }
        v157 = 1;
        objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 1, a4, v42, v149, v150);
        goto LABEL_50;
      }
      switch(a4)
      {
        case 7uLL:
          if (++HIDWORD(v153) <= 2u)
            goto LABEL_50;
LABEL_62:
          if ((a8 | 4) == 5)
          {
            objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 1, a4, v42);
            v157 = 1;
          }
          else
          {
            CWFGetOSLog();
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            if (v105)
            {
              CWFGetOSLog();
              v106 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v106 = MEMORY[0x1E0C81028];
              v108 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
            {
              CWFStringFromDenyListAddReason(a4);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v110, v111, v112, v113, v32);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              v171 = 136446722;
              v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
              v173 = 2114;
              v174 = v109;
              v175 = 2114;
              v176 = v114;
              LODWORD(v150) = 32;
              v149 = &v171;
              _os_log_send_and_compose_impl();

              a8 = v160;
            }

          }
          goto LABEL_87;
        case 5uLL:
          LODWORD(v153) = v153 + 1;
          if (v153 < 5)
            goto LABEL_50;
          goto LABEL_62;
        case 4uLL:
          v65 = v32 - v48;
          if (v32 - v48 <= 300.0)
          {
            LODWORD(v152) = v152 + 1;
            if (v152 >= 3)
            {
              if ((a8 | 4) != 5)
              {
                CWFGetOSLog();
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                if (v123)
                {
                  CWFGetOSLog();
                  v83 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v83 = MEMORY[0x1E0C81028];
                  v134 = MEMORY[0x1E0C81028];
                }

                if (!os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
                  goto LABEL_49;
                CWFStringFromDenyListAddReason(4uLL);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v135, v136, v137, v138, v32);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                v171 = 136446722;
                v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
                v173 = 2114;
                v174 = v85;
                v175 = 2114;
                v176 = v86;
                LODWORD(v150) = 32;
                v149 = &v171;
                goto LABEL_48;
              }
              objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 1, 4, v42, v65, v149, v150);
LABEL_91:
              v157 = 1;
              goto LABEL_50;
            }
          }
          goto LABEL_50;
      }
      if (a4 - 11 <= 1)
      {
        if (v151 != 4)
        {
          CWFGetOSLog();
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          if (v107)
          {
            CWFGetOSLog();
            v83 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v83 = MEMORY[0x1E0C81028];
            v122 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
            goto LABEL_78;
          goto LABEL_49;
        }
        objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 4, a4, v42, v149, v150);
LABEL_98:
        v157 = 1;
        goto LABEL_50;
      }
LABEL_87:
      if (a4 != 8)
      {
        if (a4 != 6)
          goto LABEL_50;
        if ((a8 | 4) != 5)
        {
          CWFGetOSLog();
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          if (v120)
          {
            CWFGetOSLog();
            v83 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v83 = MEMORY[0x1E0C81028];
            v124 = MEMORY[0x1E0C81028];
          }

          if (!os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
            goto LABEL_49;
          CWFStringFromDenyListAddReason(6uLL);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v125, v126, v127, v128, v32);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v171 = 136446722;
          v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
          v173 = 2114;
          v174 = v85;
          v175 = 2114;
          v176 = v86;
          LODWORD(v150) = 32;
          v149 = &v171;
          goto LABEL_48;
        }
        objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 1, 6, v42, v65, v149, v150);
        goto LABEL_91;
      }
      objc_msgSend_BSSID(v25, v20, v21, v22, v23);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend_compare_options_(v115, v116, (uint64_t)v13, 1, v117);

      if (v118)
        v119 = HIDWORD(v152);
      else
        v119 = HIDWORD(v152) + 1;
      HIDWORD(v152) = v119;
      if (v119 >= 3)
      {
        if (a8 != 2)
        {
          CWFGetOSLog();
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          if (v121)
          {
            CWFGetOSLog();
            v83 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v83 = MEMORY[0x1E0C81028];
            v129 = MEMORY[0x1E0C81028];
          }

          if (!os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
            goto LABEL_49;
          CWFStringFromDenyListAddReason(8uLL);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v130, v131, v132, v133, v32);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v171 = 136446722;
          v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
          v173 = 2114;
          v174 = v85;
          v175 = 2114;
          v176 = v86;
          LODWORD(v150) = 32;
          v149 = &v171;
LABEL_48:
          _os_log_send_and_compose_impl();

          a8 = v160;
          goto LABEL_49;
        }
        objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 2, 8, v42, v149, v150);
        goto LABEL_98;
      }
LABEL_50:
      ++v24;
    }
    while (v166 != v24);
    v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v167, (uint64_t)v179, 16, v65);
    v166 = v139;
  }
  while (v139);

  v144 = v157;
  if ((v155 & 1) != 0)
  {
    objc_msgSend_addDenyListStateHistory_state_reason_reasonData_(v12, v140, 0, a8, a4, a5);
    v144 = 1;
  }
LABEL_121:
  objc_msgSend__printDenyList(self, v140, v141, v142, v143, v149, v150);
LABEL_122:

  return v144 & 1;
}

- (BOOL)_ignoreTriggersForDeviceProfile:(unint64_t)a3 denyListItem:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int isProfileBased;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  unint64_t profile;
  BOOL v37;
  void *v38;
  id v39;
  _QWORD v41[6];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  int v46;
  const char *v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  unint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v11 = v6;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  if (self->_profile == 2)
  {
    CWFGetOSLog();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      CWFGetOSLog();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v35 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      profile = self->_profile;
      v46 = 136446722;
      v47 = "-[CWFNetworkDenyList _ignoreTriggersForDeviceProfile:denyListItem:]";
      v48 = 2048;
      v49 = a3;
      v50 = 2048;
      v51 = profile;
      _os_log_send_and_compose_impl();
    }

    v37 = 1;
  }
  else
  {
    if ((objc_msgSend_enterprisePolicy(v6, v7, v8, v9, v10) & 1) != 0
      || (objc_msgSend_scanResultForNetworkDenyListItem(v11, v14, v15, v16, v17),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_matchingKnownNetworkProfile(v18, v19, v20, v21, v22),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          isProfileBased = objc_msgSend_isProfileBased(v23, v24, v25, v26, v27),
          v23,
          v18,
          isProfileBased))
    {
      objc_msgSend_batteryInfoHandler(self, v14, v15, v16, v17);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend_batteryInfoHandler(self, v30, v31, v32, v33);
        v34 = objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = sub_1B06C4424;
        v41[3] = &unk_1E6134750;
        v41[4] = &v42;
        v41[5] = a3;
        (*(void (**)(uint64_t, _QWORD *))(v34 + 16))(v34, v41);
      }
      else
      {
        CWFGetOSLog();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          CWFGetOSLog();
          v34 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v34 = MEMORY[0x1E0C81028];
          v39 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
        {
          v46 = 136446210;
          v47 = "-[CWFNetworkDenyList _ignoreTriggersForDeviceProfile:denyListItem:]";
          _os_log_send_and_compose_impl();
        }
      }

    }
    v37 = *((_BYTE *)v43 + 24) != 0;
  }
  _Block_object_dispose(&v42, 8);

  return v37;
}

- (void)removeDenyListStateWithDenyListRemoveReason:(unint64_t)a3
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  int v9;
  id v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  double v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  double v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  double v121;
  uint64_t v122;
  void *v123;
  NSObject *v124;
  NSObject *v125;
  id v126;
  void *v127;
  NSObject *v128;
  id v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  NSObject *v134;
  id v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  int isNetworkInDenyListedState_scanResult;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t i;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  double v164;
  double v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  double v171;
  double v172;
  double v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  double v178;
  double v179;
  uint64_t v180;
  void *v181;
  NSObject *v182;
  NSObject *v183;
  id v184;
  void *v185;
  NSObject *v186;
  id v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  id v191;
  id v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  NSObject *v222;
  id v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  void (**v228)(_QWORD, _QWORD);
  void *v229;
  NSObject *v230;
  void *v231;
  id v232;
  id v233;
  int *v234;
  uint64_t v235;
  void *v236;
  NSMutableArray *obj;
  id v238;
  int v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  char *v243;
  CWFNetworkDenyList *v244;
  _QWORD v245[4];
  id v246;
  unint64_t v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  _QWORD v256[4];
  char *v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  int v262;
  const char *v263;
  __int16 v264;
  char *v265;
  __int16 v266;
  char *v267;
  _BYTE v268[128];
  _BYTE v269[128];
  _BYTE v270[128];
  uint64_t v271;

  v271 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v6;
  if (!v5)
  {
    CWFGetOSLog();
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    if (v229)
    {
      CWFGetOSLog();
      v230 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v230 = MEMORY[0x1E0C81028];
      v232 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v230, OS_LOG_TYPE_ERROR))
      goto LABEL_110;
    v262 = 136446210;
    v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
    goto LABEL_109;
  }
  if (!v6)
  {
    CWFGetOSLog();
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    if (v231)
    {
      CWFGetOSLog();
      v230 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v230 = MEMORY[0x1E0C81028];
      v233 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v230, OS_LOG_TYPE_ERROR))
      goto LABEL_110;
    v262 = 136446210;
    v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
LABEL_109:
    _os_log_send_and_compose_impl();
LABEL_110:

    goto LABEL_98;
  }
  v260 = 0u;
  v261 = 0u;
  v258 = 0u;
  v259 = 0u;
  obj = self->_denyList;
  v241 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v258, (uint64_t)v270, 16);
  v9 = 0;
  if (!v241)
    goto LABEL_87;
  v10 = 0;
  v240 = *(_QWORD *)v259;
  v236 = v7;
  v244 = self;
  do
  {
    v11 = 0;
    v12 = v10;
    do
    {
      if (*(_QWORD *)v259 != v240)
        objc_enumerationMutation(obj);
      v242 = v11;
      v10 = *(id *)(*((_QWORD *)&v258 + 1) + 8 * v11);

      if (a3 == 7)
      {
        objc_msgSend_denyListTriggers(v10, v13, v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeAllObjects(v17, v18, v19, v20, v21);

        objc_msgSend_statesCurrent(v10, v22, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v256[0] = MEMORY[0x1E0C809B0];
        v256[1] = 3221225472;
        v256[2] = sub_1B06C528C;
        v256[3] = &unk_1E6134778;
        v27 = (char *)v10;
        v257 = v27;
        objc_msgSend_enumerateObjectsUsingBlock_(v26, v28, (uint64_t)v256, v29, v30);

        objc_msgSend_statesCurrent(v27, v31, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeAllObjects(v35, v36, v37, v38, v39);

        objc_msgSend_addObject_(v7, v40, (uint64_t)v27, v41, v42);
        v9 = 1;
        v43 = v257;
        goto LABEL_84;
      }
      v44 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend_scanResultForNetworkDenyListItem(v10, v45, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_SSID(v49, v50, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (char *)objc_msgSend_initWithData_encoding_(v44, v55, (uint64_t)v54, 4, v56);

      objc_msgSend_scanResultForNetworkDenyListItem(v10, v57, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_BSSID(v61, v62, v63, v64, v65);
      v243 = (char *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_scanResultForNetworkDenyListItem(v10, v66, v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v49) = objc_msgSend_isNetworkInDenyListedState_scanResult_(self, v71, 1, (uint64_t)v70, v72);

      v77 = 0.0;
      v239 = v9;
      v238 = v10;
      if ((_DWORD)v49)
      {
        objc_msgSend_denyListTriggers(v10, v73, v74, v75, v76);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeAllObjects(v78, v79, v80, v81, v82);

        v254 = 0u;
        v255 = 0u;
        v252 = 0u;
        v253 = 0u;
        objc_msgSend_statesCurrent(v10, v83, v84, v85, v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v252, (uint64_t)v269, 16);
        if (!v89)
          goto LABEL_50;
        v94 = v89;
        v95 = *(_QWORD *)v253;
        while (1)
        {
          v96 = 0;
          do
          {
            if (*(_QWORD *)v253 != v95)
              objc_enumerationMutation(v87);
            v97 = *(void **)(*((_QWORD *)&v252 + 1) + 8 * v96);
            if (objc_msgSend_state(v97, v90, v91, v92, v93, v234, v235) != 1)
              goto LABEL_36;
            if (objc_msgSend_reason(v97, v98, v99, v100, v101) == 6)
              goto LABEL_43;
            if (a3 != 5)
              goto LABEL_30;
            objc_msgSend_stateTimestamp(v97, v90, v91, v92, v93);
            if (v106 > v77)
            {
              objc_msgSend_stateTimestamp(v97, v102, v103, v104, v105);
              v77 = v107;
            }
            objc_msgSend_date(MEMORY[0x1E0C99D68], v102, v103, v104, v105);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_timeIntervalSince1970(v108, v109, v110, v111, v112);
            v114 = v113;

            v115 = v114 - v77;
            objc_msgSend_networkDenyListExpiry(v244, v116, v117, v118, v119);
            v121 = v120;
            CWFGetOSLog();
            v122 = objc_claimAutoreleasedReturnValue();
            v123 = (void *)v122;
            if (v115 > v121)
            {
              if (v122)
              {
                CWFGetOSLog();
                v124 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v124 = MEMORY[0x1E0C81028];
                v126 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
              {
                v262 = 138543362;
                v263 = v43;
                LODWORD(v235) = 12;
                v234 = &v262;
                _os_log_send_and_compose_impl();
              }

LABEL_30:
              CWFGetOSLog();
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              if (v127)
              {
                CWFGetOSLog();
                v128 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v128 = MEMORY[0x1E0C81028];
                v129 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
              {
                v262 = 136446466;
                v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
                v264 = 2114;
                v265 = v43;
                LODWORD(v235) = 22;
                v234 = &v262;
                _os_log_send_and_compose_impl();
              }

              objc_msgSend_addObject_(v5, v130, (uint64_t)v97, v131, v132);
LABEL_36:
              if (objc_msgSend_state(v97, v98, v99, v100, v101, v234, v235) == 3)
              {
                CWFGetOSLog();
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                if (v133)
                {
                  CWFGetOSLog();
                  v134 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v134 = MEMORY[0x1E0C81028];
                  v135 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                {
                  v262 = 136446466;
                  v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
                  v264 = 2114;
                  v265 = v43;
                  LODWORD(v235) = 22;
                  v234 = &v262;
                  _os_log_send_and_compose_impl();
                }

                objc_msgSend_addObject_(v5, v136, (uint64_t)v97, v137, v138);
              }
              goto LABEL_43;
            }
            if (v122)
            {
              CWFGetOSLog();
              v125 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v125 = MEMORY[0x1E0C81028];
              v139 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
            {
              v262 = 138543362;
              v263 = v43;
              LODWORD(v235) = 12;
              v234 = &v262;
              _os_log_send_and_compose_impl();
            }

LABEL_43:
            ++v96;
          }
          while (v94 != v96);
          v140 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v90, (uint64_t)&v252, (uint64_t)v269, 16);
          v94 = v140;
          if (!v140)
          {
LABEL_50:

            v7 = v236;
            self = v244;
            v9 = v239;
            v10 = v238;
            break;
          }
        }
      }
      objc_msgSend_scanResultForNetworkDenyListItem(v10, v73, v74, v75, v76, v234, v235);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      isNetworkInDenyListedState_scanResult = objc_msgSend_isNetworkInDenyListedState_scanResult_(self, v142, 2, (uint64_t)v141, v143);

      if (!isNetworkInDenyListedState_scanResult)
        goto LABEL_83;
      v250 = 0u;
      v251 = 0u;
      v248 = 0u;
      v249 = 0u;
      objc_msgSend_statesCurrent(v10, v145, v146, v147, v148);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(v149, v150, (uint64_t)&v248, (uint64_t)v268, 16);
      if (!v151)
        goto LABEL_82;
      v156 = v151;
      v157 = *(_QWORD *)v249;
      do
      {
        for (i = 0; i != v156; ++i)
        {
          if (*(_QWORD *)v249 != v157)
            objc_enumerationMutation(v149);
          v159 = *(void **)(*((_QWORD *)&v248 + 1) + 8 * i);
          if (objc_msgSend_state(v159, v152, v153, v154, v155, v234, v235) == 2)
          {
            if (a3 != 5)
              goto LABEL_70;
            objc_msgSend_stateTimestamp(v159, v152, v153, v154, v155);
            if (v164 > v77)
            {
              objc_msgSend_stateTimestamp(v159, v160, v161, v162, v163);
              v77 = v165;
            }
            objc_msgSend_date(MEMORY[0x1E0C99D68], v160, v161, v162, v163);
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_timeIntervalSince1970(v166, v167, v168, v169, v170);
            v172 = v171;

            v173 = v172 - v77;
            objc_msgSend_BSSDenyListExpiry(v244, v174, v175, v176, v177);
            v179 = v178;
            CWFGetOSLog();
            v180 = objc_claimAutoreleasedReturnValue();
            v181 = (void *)v180;
            if (v173 > v179)
            {
              if (v180)
              {
                CWFGetOSLog();
                v182 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v182 = MEMORY[0x1E0C81028];
                v184 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
              {
                v262 = 138543618;
                v263 = v43;
                v264 = 2114;
                v265 = v243;
                LODWORD(v235) = 22;
                v234 = &v262;
                _os_log_send_and_compose_impl();
              }

LABEL_70:
              CWFGetOSLog();
              v185 = (void *)objc_claimAutoreleasedReturnValue();
              if (v185)
              {
                CWFGetOSLog();
                v186 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v186 = MEMORY[0x1E0C81028];
                v187 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
              {
                v262 = 136446722;
                v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
                v264 = 2114;
                v265 = v43;
                v266 = 2114;
                v267 = v243;
                LODWORD(v235) = 32;
                v234 = &v262;
                _os_log_send_and_compose_impl();
              }

              objc_msgSend_addObject_(v5, v188, (uint64_t)v159, v189, v190);
              continue;
            }
            if (v180)
            {
              CWFGetOSLog();
              v183 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v183 = MEMORY[0x1E0C81028];
              v191 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
            {
              v262 = 138543618;
              v263 = v43;
              v264 = 2114;
              v265 = v243;
              LODWORD(v235) = 22;
              v234 = &v262;
              _os_log_send_and_compose_impl();
            }

          }
        }
        v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v149, v152, (uint64_t)&v248, (uint64_t)v268, 16);
      }
      while (v156);
LABEL_82:

      v7 = v236;
      self = v244;
      v9 = v239;
      v10 = v238;
LABEL_83:
      v245[0] = MEMORY[0x1E0C809B0];
      v245[1] = 3221225472;
      v245[2] = sub_1B06C52A0;
      v245[3] = &unk_1E61347A0;
      v192 = v10;
      v246 = v192;
      v247 = a3;
      objc_msgSend_enumerateObjectsUsingBlock_(v5, v193, (uint64_t)v245, v194, v195);
      objc_msgSend_statesCurrent(v192, v196, v197, v198, v199);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectsInArray_(v200, v201, (uint64_t)v5, v202, v203);

      v9 |= objc_msgSend_count(v5, v204, v205, v206, v207) != 0;
      objc_msgSend_removeAllObjects(v5, v208, v209, v210, v211);

LABEL_84:
      v11 = v242 + 1;
      v12 = v10;
    }
    while (v242 + 1 != v241);
    v241 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v212, (uint64_t)&v258, (uint64_t)v270, 16);
  }
  while (v241);

LABEL_87:
  if (objc_msgSend_count(v7, v213, v214, v215, v216))
  {
    CWFGetOSLog();
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    if (v221)
    {
      CWFGetOSLog();
      v222 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v222 = MEMORY[0x1E0C81028];
      v223 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v222, OS_LOG_TYPE_ERROR))
    {
      v262 = 136446210;
      v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
      LODWORD(v235) = 12;
      v234 = &v262;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_removeObjectsInArray_(self->_denyList, v224, (uint64_t)v7, v225, v226);
  }
  if ((v9 & 1) != 0)
  {
    objc_msgSend_denyListDidUpdateHandler(self, v217, v218, v219, v220);
    v227 = (void *)objc_claimAutoreleasedReturnValue();

    if (v227)
    {
      objc_msgSend_denyListDidUpdateHandler(self, v217, v218, v219, v220);
      v228 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v228)[2](v228, &unk_1E6132080);

    }
  }
  objc_msgSend__printDenyList(self, v217, v218, v219, v220, v234, v235);
LABEL_98:

}

- (void)removeExpiredDenyListedState:(unint64_t)a3
{
  const char *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  double v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  void *v87;
  NSObject *v88;
  double v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  void *v95;
  NSObject *v96;
  id v97;
  id v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  double v104;
  double v105;
  void *v106;
  NSObject *v107;
  void *v108;
  id v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  double v123;
  void *v124;
  NSObject *v125;
  id v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  double v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  double v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  double v142;
  double v143;
  void *v144;
  NSObject *v145;
  id v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  double v159;
  double v160;
  void *v161;
  NSObject *v162;
  id v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
  uint64_t v173;
  NSObject *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  void (**v195)(_QWORD, _QWORD);
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  NSObject *v200;
  void *v201;
  id v202;
  void *v203;
  id v204;
  int *v205;
  int *v206;
  uint64_t v207;
  uint64_t v208;
  NSMutableArray *obj;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  NSObject *v213;
  void *v214;
  id v215;
  CWFNetworkDenyList *v216;
  _QWORD v217[4];
  NSObject *v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  int v231;
  const char *v232;
  __int16 v233;
  double v234;
  __int16 v235;
  double v236;
  __int16 v237;
  void *v238;
  __int16 v239;
  void *v240;
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  uint64_t v244;

  v244 = *MEMORY[0x1E0C80C00];
  v215 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v215)
  {
    v229 = 0u;
    v230 = 0u;
    v227 = 0u;
    v228 = 0u;
    obj = self->_denyList;
    v211 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v227, (uint64_t)v243, 16);
    v6 = 0;
    if (v211)
    {
      v210 = *(_QWORD *)v228;
      v216 = self;
LABEL_4:
      v7 = 0;
      v8 = v6;
      while (1)
      {
        if (*(_QWORD *)v228 != v210)
          objc_enumerationMutation(obj);
        v6 = *(id *)(*((_QWORD *)&v227 + 1) + 8 * v7);

        objc_msgSend_statesCurrent(v6, v9, v10, v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          break;
LABEL_88:
        ++v7;
        v8 = v6;
        if (v7 == v211)
        {
          v211 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v227, (uint64_t)v243, 16);
          if (!v211)
          {
            v200 = v6;
            v6 = 0;
            goto LABEL_91;
          }
          goto LABEL_4;
        }
      }
      objc_msgSend_scanResultForNetworkDenyListItem(v6, v14, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_SSID(v18, v19, v20, v21, v22);
      *(double *)&v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

      v214 = (void *)v23;
      if (*(double *)&v23 != 0.0)
      {
        objc_msgSend_statesHistory(v6, v24, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend_count(v28, v29, v30, v31, v32);

        v212 = v7;
        if (v33)
        {
          v225 = 0u;
          v226 = 0u;
          v223 = 0u;
          v224 = 0u;
          objc_msgSend_statesHistory(v6, v34, v35, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_reverseObjectEnumerator(v38, v39, v40, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v223, (uint64_t)v242, 16);
          v50 = 0.0;
          if (!v45)
            goto LABEL_22;
          v51 = v45;
          v52 = *(_QWORD *)v224;
          do
          {
            for (i = 0; i != v51; ++i)
            {
              if (*(_QWORD *)v224 != v52)
                objc_enumerationMutation(v43);
              v54 = *(void **)(*((_QWORD *)&v223 + 1) + 8 * i);
              if (v54
                && (objc_msgSend_state(*(void **)(*((_QWORD *)&v223 + 1) + 8 * i), v46, v47, v48, v49) == a3
                 || objc_msgSend_state(v54, v46, v47, v48, v49) == 5))
              {
                objc_msgSend_stateTimestamp(v54, v46, v47, v48, v49);
                v50 = v55;
                goto LABEL_22;
              }
            }
            v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v223, (uint64_t)v242, 16);
          }
          while (v51);
LABEL_22:

        }
        else
        {
          v50 = 0.0;
        }
        v221 = 0u;
        v222 = 0u;
        v219 = 0u;
        v220 = 0u;
        v213 = v6;
        objc_msgSend_statesCurrent(v6, v34, v35, v36, v37);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v219, (uint64_t)v241, 16);
        if (!v58)
          goto LABEL_84;
        v63 = v58;
        v64 = *(_QWORD *)v220;
LABEL_26:
        v65 = 0;
        while (1)
        {
          if (*(_QWORD *)v220 != v64)
            objc_enumerationMutation(v56);
          v66 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * v65);
          objc_msgSend_date(MEMORY[0x1E0C99D68], v59, v60, v61, v62, v205, v207);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSince1970(v67, v68, v69, v70, v71);
          v73 = v72;

          if (objc_msgSend_state(v66, v74, v75, v76, v77) == a3 && objc_msgSend_state(v66, v78, v79, v80, v81) == 3)
          {
            objc_msgSend_wowDenyListExpiry(v216, v78, v79, v80, v81);
            if (v50 == 0.0)
            {
              CWFGetOSLog();
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              if (v87)
              {
                CWFGetOSLog();
                v88 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v88 = MEMORY[0x1E0C81028];
                v97 = MEMORY[0x1E0C81028];
              }

              if (!os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                goto LABEL_77;
              v231 = 136446210;
              v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
              LODWORD(v207) = 12;
              v205 = &v231;
              goto LABEL_41;
            }
            v89 = v86;
            if (objc_msgSend_reason(v66, v82, v83, v84, v85) == 2)
            {
              objc_msgSend_stateTimestamp(v66, v90, v91, v92, v93);
              if (v73 - v94 <= 3600.0)
              {
                CWFGetOSLog();
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                if (v108)
                {
                  CWFGetOSLog();
                  v88 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v88 = MEMORY[0x1E0C81028];
                  v172 = MEMORY[0x1E0C81028];
                }

                if (!os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                  goto LABEL_77;
                v231 = 136446210;
                v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
                LODWORD(v207) = 12;
                v205 = &v231;
LABEL_41:
                _os_log_send_and_compose_impl();
                goto LABEL_77;
              }
            }
            CWFGetOSLog();
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            if (v95)
            {
              CWFGetOSLog();
              v96 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v96 = MEMORY[0x1E0C81028];
              v98 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
            {
              v231 = 136446722;
              v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
              v233 = 2048;
              v234 = v73 - v50;
              v235 = 2048;
              v236 = v89;
              LODWORD(v207) = 32;
              v205 = &v231;
              _os_log_send_and_compose_impl();
            }

            if (v73 - v50 > v89)
            {
              objc_msgSend_stateString(v66, v78, v79, v80, v81);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stateTimestamp(v66, v100, v101, v102, v103);
              v105 = v104;
              CWFGetOSLog();
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              if (v106)
              {
                CWFGetOSLog();
                v107 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v107 = MEMORY[0x1E0C81028];
                v109 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v110, v111, v112, v113, v105);
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                v231 = 136447234;
                v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
                v233 = 2114;
                v234 = *(double *)&v214;
                v235 = 2114;
                v236 = *(double *)&v99;
                v237 = 2114;
                v238 = v114;
                v239 = 2114;
                v240 = v214;
                LODWORD(v207) = 52;
                v205 = &v231;
                _os_log_send_and_compose_impl();

              }
              objc_msgSend_addObject_(v215, v115, (uint64_t)v66, v116, v117);

            }
          }
          if (objc_msgSend_state(v66, v78, v79, v80, v81, v205, v207) == a3
            && objc_msgSend_state(v66, v118, v119, v120, v121) == 2
            && objc_msgSend_reason(v66, v118, v119, v120, v121) == 8)
          {
            objc_msgSend_BSSDenyListExpiry(v216, v118, v119, v120, v121);
            v123 = v122;
            CWFGetOSLog();
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            if (v124)
            {
              CWFGetOSLog();
              v125 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v125 = MEMORY[0x1E0C81028];
              v126 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_stateTimestamp(v66, v127, v128, v129, v130);
              v231 = 136446722;
              v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
              v233 = 2048;
              v234 = v73 - v131;
              v235 = 2048;
              v236 = v123;
              LODWORD(v208) = 32;
              v206 = &v231;
              _os_log_send_and_compose_impl();
            }

            objc_msgSend_stateTimestamp(v66, v132, v133, v134, v135);
            if (v73 - v136 > v123)
            {
              objc_msgSend_stateString(v66, v118, v119, v120, v121);
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stateTimestamp(v66, v138, v139, v140, v141);
              v143 = v142;
              CWFGetOSLog();
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              if (v144)
              {
                CWFGetOSLog();
                v145 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v145 = MEMORY[0x1E0C81028];
                v146 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v147, v148, v149, v150, v143);
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                v231 = 136447234;
                v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
                v233 = 2114;
                v234 = *(double *)&v214;
                v235 = 2114;
                v236 = *(double *)&v137;
                v237 = 2114;
                v238 = v151;
                v239 = 2114;
                v240 = v214;
                LODWORD(v208) = 52;
                v206 = &v231;
                _os_log_send_and_compose_impl();

              }
              objc_msgSend_addObject_(v215, v152, (uint64_t)v66, v153, v154);

            }
          }
          if (objc_msgSend_state(v66, v118, v119, v120, v121, v206, v208) != a3
            || objc_msgSend_state(v66, v59, v60, v61, v62) != 4)
          {
            goto LABEL_78;
          }
          objc_msgSend_stateString(v66, v59, v60, v61, v62);
          v88 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_stateTimestamp(v66, v155, v156, v157, v158);
          v160 = v159;
          CWFGetOSLog();
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          if (v161)
          {
            CWFGetOSLog();
            v162 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v162 = MEMORY[0x1E0C81028];
            v163 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v164, v165, v166, v167, v160);
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            v231 = 136447234;
            v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
            v233 = 2114;
            v234 = *(double *)&v214;
            v235 = 2114;
            v236 = *(double *)&v88;
            v237 = 2114;
            v238 = v168;
            v239 = 2114;
            v240 = v214;
            LODWORD(v207) = 52;
            v205 = &v231;
            _os_log_send_and_compose_impl();

          }
          objc_msgSend_addObject_(v215, v169, (uint64_t)v66, v170, v171);
LABEL_77:

LABEL_78:
          if (v63 == ++v65)
          {
            v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v59, (uint64_t)&v219, (uint64_t)v241, 16);
            v63 = v173;
            if (!v173)
            {
LABEL_84:

              v217[0] = MEMORY[0x1E0C809B0];
              v217[1] = 3221225472;
              v217[2] = sub_1B06C5FB0;
              v217[3] = &unk_1E6134778;
              v6 = v213;
              v174 = v213;
              v218 = v174;
              objc_msgSend_enumerateObjectsUsingBlock_(v215, v175, (uint64_t)v217, v176, v177);
              objc_msgSend_statesCurrent(v174, v178, v179, v180, v181);
              v182 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_removeObjectsInArray_(v182, v183, (uint64_t)v215, v184, v185);

              if (objc_msgSend_count(v215, v186, v187, v188, v189))
              {
                objc_msgSend_denyListDidUpdateHandler(v216, v190, v191, v192, v193);
                v194 = (void *)objc_claimAutoreleasedReturnValue();

                if (v194)
                {
                  objc_msgSend_denyListDidUpdateHandler(v216, v190, v191, v192, v193);
                  v195 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                  ((void (**)(_QWORD, void *))v195)[2](v195, &unk_1E61314E0);

                }
              }
              objc_msgSend_removeAllObjects(v215, v190, v191, v192, v193, v205, v207);
              objc_msgSend__printDenyList(v216, v196, v197, v198, v199);

              v7 = v212;
              goto LABEL_88;
            }
            goto LABEL_26;
          }
        }
      }
      CWFGetOSLog();
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      if (v201)
      {
        CWFGetOSLog();
        v200 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v200 = MEMORY[0x1E0C81028];
        v202 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v200, OS_LOG_TYPE_ERROR))
      {
        v231 = 136446210;
        v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
        _os_log_send_and_compose_impl();
      }
LABEL_91:

    }
  }
  else
  {
    CWFGetOSLog();
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    if (v203)
    {
      CWFGetOSLog();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v204 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v231 = 136446210;
      v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
      _os_log_send_and_compose_impl();
    }
  }

}

- (void)removeAllDenyListedItems
{
  void *v3;
  NSObject *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void (**v43)(_QWORD, _QWORD);
  int *v44;
  int v45;
  NSMutableArray *obj;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  int v54;
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  CWFGetOSLog();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    CWFGetOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v54 = 136446210;
    v55 = "-[CWFNetworkDenyList removeAllDenyListedItems]";
    v45 = 12;
    v44 = &v54;
    _os_log_send_and_compose_impl();
  }

  if (objc_msgSend_count(self->_denyList, v6, v7, v8, v9))
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = self->_denyList;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v49, (uint64_t)v53, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v50;
      v20 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v50 != v19)
            objc_enumerationMutation(obj);
          v22 = *(id *)(*((_QWORD *)&v49 + 1) + 8 * i);

          objc_msgSend_addObject_(v14, v23, (uint64_t)v22, v24, v25);
          objc_msgSend_statesCurrent(v22, v26, v27, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = v20;
          v47[1] = 3221225472;
          v47[2] = sub_1B06C6348;
          v47[3] = &unk_1E6134778;
          v18 = v22;
          v48 = v18;
          objc_msgSend_enumerateObjectsUsingBlock_(v30, v31, (uint64_t)v47, v32, v33);

        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v49, (uint64_t)v53, 16);
      }
      while (v17);

    }
    objc_msgSend_removeObjectsInArray_(self->_denyList, v35, (uint64_t)v14, v36, v37);
    objc_msgSend_denyListDidUpdateHandler(self, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend_denyListDidUpdateHandler(self, v10, v11, v12, v13);
      v43 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v43)[2](v43, &unk_1E6131920);

    }
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend__printDenyList(self, v10, v11, v12, v13, v44, v45);

}

- (void)removeNetworkDenyListInfoWithReason:(unint64_t)a3 forScanResult:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t i;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  NSObject *v79;
  NSObject *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  double v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  double v114;
  double v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  NSObject *v153;
  id v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  double v167;
  void *v168;
  double v169;
  void *v170;
  double v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  double v176;
  void *v177;
  id v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  id v183;
  id v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  double v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t j;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  void (**v226)(_QWORD, _QWORD);
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  NSObject *v251;
  void *v252;
  void *v253;
  NSObject *v254;
  void *v255;
  NSObject *v256;
  void *v257;
  NSObject *v258;
  id v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  id v270;
  id v271;
  id v272;
  id v273;
  int *v274;
  int *v275;
  int *v276;
  int *v277;
  int v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  id v282;
  CWFNetworkDenyList *v283;
  void *v284;
  void *obj;
  id v287;
  void *v288;
  id v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  _BYTE v302[128];
  int v303;
  const char *v304;
  __int16 v305;
  void *v306;
  __int16 v307;
  void *v308;
  __int16 v309;
  void *v310;
  __int16 v311;
  void *v312;
  __int16 v313;
  unint64_t v314;
  _BYTE v315[128];
  _BYTE v316[128];
  uint64_t v317;

  v317 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (!v9)
  {
    objc_msgSend__printDenyList(self, v5, v6, v7, v8);
    CWFGetOSLog();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CWFGetOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v303 = 136446210;
      v304 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
      v278 = 12;
      v274 = &v303;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_removeAllDenyListedItems(self, v13, v14, v15, v16);
  }
  objc_msgSend__findNetworkDenyListItem_(self, v5, (uint64_t)v9, v7, v8, v274, v278);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    CWFGetOSLog();
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    if (v250)
    {
      CWFGetOSLog();
      v251 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v251 = MEMORY[0x1E0C81028];
      v259 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v251, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_SSID(v9, v260, v261, v262, v263);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_BSSID(v9, v265, v266, v267, v268);
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      v303 = 136446722;
      v304 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
      v305 = 2114;
      v306 = v264;
      v307 = 2114;
      v308 = v269;
      LODWORD(v279) = 32;
      v275 = &v303;
      _os_log_send_and_compose_impl();

    }
    goto LABEL_119;
  }
  v289 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v289)
  {
    CWFGetOSLog();
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    if (v252)
    {
      CWFGetOSLog();
      v251 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v251 = MEMORY[0x1E0C81028];
      v270 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v251, OS_LOG_TYPE_ERROR))
    {
      v303 = 136446210;
      v304 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
      LODWORD(v279) = 12;
      v275 = &v303;
      _os_log_send_and_compose_impl();
    }
LABEL_119:

    v287 = 0;
    v288 = 0;
    v31 = 0;
    v289 = 0;
    goto LABEL_102;
  }
  v287 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v287)
  {
    CWFGetOSLog();
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    if (v253)
    {
      CWFGetOSLog();
      v254 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v254 = MEMORY[0x1E0C81028];
      v271 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v254, OS_LOG_TYPE_ERROR))
    {
      v303 = 136446210;
      v304 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
      LODWORD(v279) = 12;
      v275 = &v303;
      _os_log_send_and_compose_impl();
    }

    v287 = 0;
    v288 = 0;
    goto LABEL_128;
  }
  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend_scanResultForNetworkDenyListItem(v17, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend_initWithData_encoding_(v18, v29, (uint64_t)v28, 4, v30);

  if (!v31)
  {
    CWFGetOSLog();
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    if (v255)
    {
      CWFGetOSLog();
      v256 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v256 = MEMORY[0x1E0C81028];
      v272 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR))
    {
      v303 = 136446210;
      v304 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
      LODWORD(v279) = 12;
      v275 = &v303;
      _os_log_send_and_compose_impl();
    }

    v288 = 0;
LABEL_128:
    v31 = 0;
    goto LABEL_102;
  }
  objc_msgSend_scanResultForNetworkDenyListItem(v17, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_BSSID(v36, v37, v38, v39, v40);
  v41 = objc_claimAutoreleasedReturnValue();

  v288 = (void *)v41;
  if (v41)
  {
    v283 = self;
    v284 = v17;
    v282 = v9;
    v300 = 0u;
    v301 = 0u;
    v298 = 0u;
    v299 = 0u;
    objc_msgSend_statesCurrent(v17, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v298, (uint64_t)v316, 16);
    if (v48)
    {
      v53 = v48;
      v54 = *(_QWORD *)v299;
      v55 = MEMORY[0x1E0C81028];
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v299 != v54)
            objc_enumerationMutation(v46);
          v57 = *(void **)(*((_QWORD *)&v298 + 1) + 8 * i);
          if (objc_msgSend_state(v57, v49, v50, v51, v52, v275, v279) == 1)
          {
            CWFGetOSLog();
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            if (v62)
            {
              CWFGetOSLog();
              v63 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v64 = v55;
              v63 = v55;
            }

            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              v303 = 136446722;
              v304 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
              v305 = 2114;
              v306 = v31;
              v307 = 2114;
              v308 = v288;
              LODWORD(v280) = 32;
              v276 = &v303;
              _os_log_send_and_compose_impl();
            }

            objc_msgSend_addObject_(v289, v65, (uint64_t)v57, v66, v67);
          }
          if (objc_msgSend_state(v57, v58, v59, v60, v61, v276, v280) == 3
            && objc_msgSend__evaluateTriggersForDenyListRemove_denyListRemoveReason_SSID_(v283, v68, (uint64_t)v17, a3, (uint64_t)v31))
          {
            CWFGetOSLog();
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            if (v72)
            {
              CWFGetOSLog();
              v73 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v74 = v55;
              v73 = v55;
            }

            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              v303 = 136446722;
              v304 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
              v305 = 2114;
              v306 = v31;
              v307 = 2114;
              v308 = v288;
              LODWORD(v281) = 32;
              v277 = &v303;
              _os_log_send_and_compose_impl();
            }

            objc_msgSend_addObject_(v289, v75, (uint64_t)v57, v76, v77);
          }
          if (objc_msgSend_state(v57, v68, v69, v70, v71, v277, v281) == 2)
          {
            CWFGetOSLog();
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            if (v78)
            {
              CWFGetOSLog();
              v79 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v80 = v55;
              v79 = v55;
            }

            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            {
              v303 = 136446722;
              v304 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
              v305 = 2114;
              v306 = v31;
              v307 = 2114;
              v308 = v288;
              LODWORD(v279) = 32;
              v275 = &v303;
              _os_log_send_and_compose_impl();
            }

            objc_msgSend_addObject_(v289, v81, (uint64_t)v57, v82, v83);
          }
        }
        v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v298, (uint64_t)v316, 16);
      }
      while (v53);
    }

    v296 = 0u;
    v297 = 0u;
    v294 = 0u;
    v295 = 0u;
    objc_msgSend_denyListTriggers(v17, v84, v85, v86, v87);
    obj = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v88, (uint64_t)&v294, (uint64_t)v315, 16);
    if (v89)
    {
      v94 = v89;
      v95 = *(_QWORD *)v295;
      do
      {
        v96 = 0;
        do
        {
          if (*(_QWORD *)v295 != v95)
            objc_enumerationMutation(obj);
          v97 = *(void **)(*((_QWORD *)&v294 + 1) + 8 * v96);
          objc_msgSend_reasonString(v97, v90, v91, v92, v93, v275, v279);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_reasonTimestamp(v97, v99, v100, v101, v102);
          v104 = v103;
          objc_msgSend_date(MEMORY[0x1E0C99D68], v105, v106, v107, v108);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSince1970(v109, v110, v111, v112, v113);
          v115 = v114;

          if (!objc_msgSend_reason(v97, v116, v117, v118, v119)
            || objc_msgSend_reason(v97, v120, v121, v122, v123) == 1
            || objc_msgSend_reason(v97, v124, v125, v126, v127) == 5
            || objc_msgSend_reason(v97, v128, v129, v130, v131) == 7
            || objc_msgSend_reason(v97, v132, v133, v134, v135) == 2
            || objc_msgSend_reason(v97, v136, v137, v138, v139) == 3
            || objc_msgSend_reason(v97, v140, v141, v142, v143) == 11
            || objc_msgSend_reason(v97, v144, v145, v146, v147) == 12)
          {
            CWFGetOSLog();
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            if (v152)
            {
              CWFGetOSLog();
              v153 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v153 = MEMORY[0x1E0C81028];
              v154 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
              goto LABEL_59;
            goto LABEL_61;
          }
          if (a3 == 1)
          {
            v167 = v115 - v104;
            if (objc_msgSend_reason(v97, v148, v149, v150, v151) == 4 && v104 != 0.0 && v167 > 300.0)
            {
              CWFGetOSLog();
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              if (v168)
              {
                CWFGetOSLog();
                v153 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v153 = MEMORY[0x1E0C81028];
                v183 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
              {
LABEL_59:
                objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v155, v156, v157, v158, v104);
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                v303 = 136447234;
                v304 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
                v305 = 2114;
                v306 = v98;
                v307 = 2114;
                v308 = v159;
                v309 = 2114;
                v310 = v31;
                v311 = 2114;
                v312 = v288;
                LODWORD(v279) = 52;
                v275 = &v303;
                goto LABEL_60;
              }
LABEL_61:

              objc_msgSend_addObject_(v287, v160, (uint64_t)v97, v161, v162);
              goto LABEL_62;
            }
            if (objc_msgSend_reason(v97, v163, v164, v165, v166) == 8 && v104 != 0.0)
            {
              objc_msgSend_BSSDenyListExpiry(v283, v148, v149, v150, v151);
              if (v167 > v169)
              {
                CWFGetOSLog();
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                if (v170)
                {
                  CWFGetOSLog();
                  v153 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v153 = MEMORY[0x1E0C81028];
                  v184 = MEMORY[0x1E0C81028];
                }

                if (!os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
                  goto LABEL_61;
                objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v185, v186, v187, v188, v104);
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_reasonTimestamp(v97, v189, v190, v191, v192);
                v303 = 136447490;
                v304 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
                v305 = 2114;
                v306 = v98;
                v307 = 2114;
                v308 = v159;
                v309 = 2114;
                v310 = v31;
                v311 = 2114;
                v312 = v288;
                v313 = 2048;
                v314 = (unint64_t)(v115 - v193);
                LODWORD(v279) = 62;
                v275 = &v303;
                goto LABEL_60;
              }
            }
          }
          v171 = dbl_1B0711BF0[objc_msgSend_reason(v97, v148, v149, v150, v151) == 2];
          objc_msgSend_reasonTimestamp(v97, v172, v173, v174, v175);
          if (v115 - v176 > v171)
          {
            CWFGetOSLog();
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            if (v177)
            {
              CWFGetOSLog();
              v153 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v153 = MEMORY[0x1E0C81028];
              v178 = MEMORY[0x1E0C81028];
            }

            if (!os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
              goto LABEL_61;
            objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v179, v180, v181, v182, v115);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            v303 = 136446978;
            v304 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
            v305 = 2114;
            v306 = v98;
            v307 = 2114;
            v308 = v159;
            v309 = 2114;
            v310 = v31;
            LODWORD(v279) = 42;
            v275 = &v303;
LABEL_60:
            _os_log_send_and_compose_impl();

            goto LABEL_61;
          }
LABEL_62:

          ++v96;
        }
        while (v94 != v96);
        v194 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v90, (uint64_t)&v294, (uint64_t)v315, 16);
        v94 = v194;
      }
      while (v194);
    }

    v292 = 0u;
    v293 = 0u;
    v290 = 0u;
    v291 = 0u;
    v289 = v289;
    v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v289, v195, (uint64_t)&v290, (uint64_t)v302, 16);
    v17 = v284;
    if (v196)
    {
      v198 = v196;
      v199 = *(_QWORD *)v291;
      do
      {
        for (j = 0; j != v198; ++j)
        {
          if (*(_QWORD *)v291 != v199)
            objc_enumerationMutation(v289);
          objc_msgSend_processDenyListStateMetric_denyListRemove_denyListRemoveReason_(v284, v197, *(_QWORD *)(*((_QWORD *)&v290 + 1) + 8 * j), 1, 1, v275, v279);
        }
        v198 = objc_msgSend_countByEnumeratingWithState_objects_count_(v289, v197, (uint64_t)&v290, (uint64_t)v302, 16);
      }
      while (v198);
    }

    objc_msgSend_statesCurrent(v284, v201, v202, v203, v204);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectsInArray_(v205, v206, (uint64_t)v289, v207, v208);

    objc_msgSend_denyListTriggers(v284, v209, v210, v211, v212);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectsInArray_(v213, v214, (uint64_t)v287, v215, v216);

    if (objc_msgSend_count(v289, v217, v218, v219, v220))
    {
      objc_msgSend_denyListDidUpdateHandler(v283, v221, v222, v223, v224);
      v225 = (void *)objc_claimAutoreleasedReturnValue();

      if (v225)
      {
        objc_msgSend_denyListDidUpdateHandler(v283, v221, v222, v223, v224);
        v226 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v226)[2](v226, &unk_1E6131520);

      }
    }
    objc_msgSend_statesCurrent(v284, v221, v222, v223, v224, v275, v279);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v282;
    if (objc_msgSend_count(v227, v228, v229, v230, v231))
    {

    }
    else
    {
      objc_msgSend_denyListTriggers(v284, v232, v233, v234, v235);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      v245 = objc_msgSend_count(v240, v241, v242, v243, v244);

      if (!v245)
        objc_msgSend_removeObject_(v283->_denyList, v236, (uint64_t)v284, v238, v239);
    }
  }
  else
  {
    CWFGetOSLog();
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    if (v257)
    {
      CWFGetOSLog();
      v258 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v258 = MEMORY[0x1E0C81028];
      v273 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v258, OS_LOG_TYPE_ERROR))
    {
      v303 = 136446210;
      v304 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
      LODWORD(v279) = 12;
      v275 = &v303;
      _os_log_send_and_compose_impl();
    }

    v288 = 0;
  }
LABEL_102:
  objc_msgSend_removeAllObjects(v289, v236, v237, v238, v239, v275, v279);
  objc_msgSend_removeAllObjects(v287, v246, v247, v248, v249);

}

- (BOOL)_evaluateTriggersForDenyListRemove:(id)a3 denyListRemoveReason:(unint64_t)a4 SSID:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (**v27)(_QWORD, _QWORD);
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  id v64;
  int *v66;
  uint64_t v67;
  id v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[5];
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  _BYTE v80[128];
  int v81;
  const char *v82;
  __int16 v83;
  const char *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v69 = a5;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  v70 = v7;
  objc_msgSend_statesHistory(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v12, v13, v14, v15, v16);

  objc_msgSend_isUserModeInteractiveHandler(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_isUserModeInteractiveHandler(self, v23, v24, v25, v26);
    v27 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = sub_1B06C78EC;
    v75[3] = &unk_1E61347C8;
    v75[4] = &v76;
    ((void (**)(_QWORD, _QWORD *))v27)[2](v27, v75);

    CWFGetOSLog();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      CWFGetOSLog();
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = MEMORY[0x1E0C81028];
      v32 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      if (*((_BYTE *)v77 + 24))
        v33 = "interactive";
      else
        v33 = "non-interactive";
      v81 = 136446466;
      v82 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListRemove:denyListRemoveReason:SSID:]";
      v83 = 2082;
      v84 = v33;
      LODWORD(v67) = 22;
      v66 = &v81;
      _os_log_send_and_compose_impl();
    }

    if (*((_BYTE *)v77 + 24))
    {
      LOBYTE(v38) = 1;
    }
    else
    {
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      objc_msgSend_statesHistory(v7, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v71, (uint64_t)v80, 16);
      if (v44)
      {
        v45 = 0;
        v46 = 0;
        v47 = *(_QWORD *)v72;
        v48 = v17 - 1;
        v49 = 13;
        do
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v72 != v47)
              objc_enumerationMutation(v38);
            v51 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
            if (objc_msgSend_state(v51, v40, v41, v42, v43, v66, v67) != 1)
            {
              if (objc_msgSend_reason(v51, v40, v41, v42, v43) == 2)
              {
                objc_msgSend_date(MEMORY[0x1E0C99D68], v40, v41, v42, v43);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_timeIntervalSince1970(v52, v53, v54, v55, v56);
                v58 = v57;

                objc_msgSend_stateTimestamp(v51, v59, v60, v61, v62);
                v46 |= v58 - v63 < 21600.0;
              }
              if (v45 == v48)
                v49 = objc_msgSend_reason(v51, v40, v41, v42, v43);
              ++v45;
            }
          }
          v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v40, (uint64_t)&v71, (uint64_t)v80, 16);
        }
        while (v44);
      }
      else
      {
        v46 = 0;
        v49 = 13;
      }

      LOBYTE(v38) = 0;
      if (!((a4 != 1) | v46 & 1) && v49 <= 7)
        LODWORD(v38) = (0xB0u >> v49) & 1;
    }
  }
  else
  {
    CWFGetOSLog();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      CWFGetOSLog();
      v31 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = MEMORY[0x1E0C81028];
      v64 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v81 = 136446210;
      v82 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListRemove:denyListRemoveReason:SSID:]";
      _os_log_send_and_compose_impl();
    }

    LOBYTE(v38) = 1;
    *((_BYTE *)v77 + 24) = 1;
  }
  _Block_object_dispose(&v76, 8);

  return (char)v38;
}

- (void)processDenyListedBSSForMetrics:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  NSObject *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  NSMutableArray *obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  int v68;
  const char *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    obj = self->_denyList;
    v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v64, (uint64_t)v74, 16);
    if (v6)
    {
      v7 = v6;
      v62 = v4;
      v8 = 0;
      v9 = *(_QWORD *)v65;
      do
      {
        v10 = 0;
        v11 = v8;
        do
        {
          if (*(_QWORD *)v65 != v9)
            objc_enumerationMutation(obj);
          v8 = *(id *)(*((_QWORD *)&v64 + 1) + 8 * v10);

          CWFGetOSLog();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            CWFGetOSLog();
            v13 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = MEMORY[0x1E0C81028];
            v14 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_scanResultForNetworkDenyListItem(v8, v15, v16, v17, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_SSID(v19, v20, v21, v22, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_scanResultForNetworkDenyListItem(v8, v25, v26, v27, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_BSSID(v29, v30, v31, v32, v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = 136446722;
            v69 = "-[CWFNetworkDenyList processDenyListedBSSForMetrics:]";
            v70 = 2114;
            v71 = v24;
            v72 = 2114;
            v73 = v34;
            _os_log_send_and_compose_impl();

          }
          ++v10;
          v11 = v8;
        }
        while (v7 != v10);
        v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v64, (uint64_t)v74, 16);
      }
      while (v7);

      v4 = v62;
    }

    CWFGetOSLog();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      CWFGetOSLog();
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = MEMORY[0x1E0C81028];
      v38 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_SSID(v4, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_BSSID(v4, v44, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 136446722;
      v69 = "-[CWFNetworkDenyList processDenyListedBSSForMetrics:]";
      v70 = 2114;
      v71 = v43;
      v72 = 2114;
      v73 = v48;
      _os_log_send_and_compose_impl();

    }
    objc_msgSend__findNetworkDenyListItem_(self, v49, (uint64_t)v4, v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      v57 = v52;
      objc_msgSend_processDenyListedBSSForMetrics(v52, v53, v54, v55, v56);
      goto LABEL_22;
    }
    CWFGetOSLog();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      CWFGetOSLog();
      v57 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = MEMORY[0x1E0C81028];
      v61 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v68 = 136446210;
      v69 = "-[CWFNetworkDenyList processDenyListedBSSForMetrics:]";
      goto LABEL_33;
    }
  }
  else
  {
    CWFGetOSLog();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      CWFGetOSLog();
      v57 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = MEMORY[0x1E0C81028];
      v60 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v68 = 136446210;
      v69 = "-[CWFNetworkDenyList processDenyListedBSSForMetrics:]";
LABEL_33:
      _os_log_send_and_compose_impl();
    }
  }
LABEL_22:

}

- (void)removeAllDenyListEntriesWithNetworkName:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int isEqualToString;
  const char *v32;
  void *v33;
  NSObject *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void (**v108)(_QWORD, _QWORD);
  CWFNetworkDenyList *v109;
  void *v110;
  NSMutableArray *obj;
  _QWORD v112[4];
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  int v118;
  const char *v119;
  __int16 v120;
  void *v121;
  __int16 v122;
  void *v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  obj = self->_denyList;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v114, (uint64_t)v124, 16);
  if (v7)
  {
    v8 = v7;
    v109 = self;
    v110 = v5;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v115;
    do
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v115 != v11)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v114 + 1) + 8 * v12);

        v14 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend_scanResultForNetworkDenyListItem(v10, v15, v16, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v19, v20, v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend_initWithData_encoding_(v14, v25, (uint64_t)v24, 4, v26);
        isEqualToString = objc_msgSend_isEqualToString_(v4, v28, (uint64_t)v27, v29, v30);

        if (isEqualToString)
        {
          CWFGetOSLog();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            CWFGetOSLog();
            v34 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v34 = MEMORY[0x1E0C81028];
            v35 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_scanResultForNetworkDenyListItem(v10, v36, v37, v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_SSID(v40, v41, v42, v43, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_scanResultForNetworkDenyListItem(v10, v46, v47, v48, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_SSID(v50, v51, v52, v53, v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v118 = 136446722;
            v119 = "-[CWFNetworkDenyList removeAllDenyListEntriesWithNetworkName:]";
            v120 = 2114;
            v121 = v45;
            v122 = 2114;
            v123 = v55;
            _os_log_send_and_compose_impl();

          }
          objc_msgSend_denyListTriggers(v10, v56, v57, v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeAllObjects(v60, v61, v62, v63, v64);

          objc_msgSend_statesCurrent(v10, v65, v66, v67, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v112[0] = MEMORY[0x1E0C809B0];
          v112[1] = 3221225472;
          v112[2] = sub_1B06C8104;
          v112[3] = &unk_1E6134778;
          v70 = v10;
          v113 = v70;
          objc_msgSend_enumerateObjectsUsingBlock_(v69, v71, (uint64_t)v112, v72, v73);

          objc_msgSend_statesCurrent(v70, v74, v75, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeAllObjects(v78, v79, v80, v81, v82);

          objc_msgSend_statesHistory(v70, v83, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeAllObjects(v87, v88, v89, v90, v91);

          objc_msgSend_addObject_(v110, v92, (uint64_t)v70, v93, v94);
          v9 = 1;
        }
        ++v12;
        v13 = v10;
      }
      while (v8 != v12);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v114, (uint64_t)v124, 16);
    }
    while (v8);

    v5 = v110;
    self = v109;
  }
  else
  {
    v9 = 0;
  }

  if (objc_msgSend_count(v5, v95, v96, v97, v98))
    objc_msgSend_removeObjectsInArray_(self->_denyList, v99, (uint64_t)v5, v101, v102);
  if ((v9 & 1) != 0)
  {
    objc_msgSend_denyListDidUpdateHandler(self, v99, v100, v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (v103)
    {
      objc_msgSend_denyListDidUpdateHandler(self, v104, v105, v106, v107);
      v108 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v108)[2](v108, &unk_1E6131A80);

    }
  }

}

- (void)removeNetworkDenyListInfoForTrigger:(unint64_t)a3 forNetwork:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  int isEqual;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  id v71;
  id v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t k;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int *v121;
  uint64_t v122;
  id v123;
  uint64_t v124;
  id v125;
  id v126;
  NSMutableArray *obj;
  uint64_t v128;
  uint64_t v129;
  CWFNetworkDenyList *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _BYTE v147[128];
  int v148;
  const char *v149;
  __int16 v150;
  void *v151;
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v123 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v126 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend_SSID(v6, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_initWithData_encoding_(v8, v14, (uint64_t)v13, 4, v15);

  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v130 = self;
  obj = self->_denyList;
  v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v143, (uint64_t)v154, 16);
  if (v128)
  {
    v22 = *(_QWORD *)v144;
    v124 = *(_QWORD *)v144;
    v125 = v6;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v144 != v22)
          objc_enumerationMutation(obj);
        v129 = v23;
        v24 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * v23);
        objc_msgSend_scanResultForNetworkDenyListItem(v24, v18, v19, v20, v21, v121, v122);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v25, v26, v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v6, v31, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v30, v36, (uint64_t)v35, v37, v38);

        if (isEqual)
        {
          v141 = 0u;
          v142 = 0u;
          v139 = 0u;
          v140 = 0u;
          objc_msgSend_denyListTriggers(v24, v18, v19, v20, v21);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v139, (uint64_t)v153, 16);
          if (v42)
          {
            v47 = v42;
            v48 = *(_QWORD *)v140;
            do
            {
              for (i = 0; i != v47; ++i)
              {
                if (*(_QWORD *)v140 != v48)
                  objc_enumerationMutation(v40);
                v50 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * i);
                if (objc_msgSend_reason(v50, v43, v44, v45, v46) == a3)
                  objc_msgSend_addObject_(v7, v43, (uint64_t)v50, v45, v46);
              }
              v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v139, (uint64_t)v153, 16);
            }
            while (v47);
          }

          v137 = 0u;
          v138 = 0u;
          v135 = 0u;
          v136 = 0u;
          objc_msgSend_statesCurrent(v24, v51, v52, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v135, (uint64_t)v152, 16);
          if (v57)
          {
            v62 = v57;
            v63 = *(_QWORD *)v136;
            do
            {
              for (j = 0; j != v62; ++j)
              {
                if (*(_QWORD *)v136 != v63)
                  objc_enumerationMutation(v55);
                v65 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * j);
                if (objc_msgSend_reason(v65, v58, v59, v60, v61, v121, v122) == a3)
                {
                  if (objc_msgSend_state(v65, v58, v59, v60, v61) == 3
                    && objc_msgSend__evaluateTriggersForDenyListRemove_denyListRemoveReason_SSID_(v130, v66, (uint64_t)v24, 1, (uint64_t)v16))
                  {
                    objc_msgSend_addObject_(v7, v66, (uint64_t)v65, v67, v68);
                    CWFGetOSLog();
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v69)
                    {
                      CWFGetOSLog();
                      v70 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v70 = MEMORY[0x1E0C81028];
                      v71 = MEMORY[0x1E0C81028];
                    }

                    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                    {
                      v148 = 136446466;
                      v149 = "-[CWFNetworkDenyList removeNetworkDenyListInfoForTrigger:forNetwork:]";
                      v150 = 2114;
                      v151 = v16;
                      LODWORD(v122) = 22;
                      v121 = &v148;
                      _os_log_send_and_compose_impl();
                    }

                  }
                  else
                  {
                    objc_msgSend_addObject_(v7, v66, (uint64_t)v65, v67, v68);
                  }
                }
              }
              v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v58, (uint64_t)&v135, (uint64_t)v152, 16);
            }
            while (v62);
          }

          v133 = 0u;
          v134 = 0u;
          v131 = 0u;
          v132 = 0u;
          v72 = v126;
          v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v131, (uint64_t)v147, 16);
          if (v74)
          {
            v76 = v74;
            v77 = *(_QWORD *)v132;
            do
            {
              for (k = 0; k != v76; ++k)
              {
                if (*(_QWORD *)v132 != v77)
                  objc_enumerationMutation(v72);
                objc_msgSend_processDenyListStateMetric_denyListRemove_denyListRemoveReason_(v24, v75, *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * k), 1, 1, v121, v122);
              }
              v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v131, (uint64_t)v147, 16);
            }
            while (v76);
          }

          objc_msgSend_statesCurrent(v24, v79, v80, v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectsInArray_(v83, v84, (uint64_t)v72, v85, v86);

          objc_msgSend_denyListTriggers(v24, v87, v88, v89, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectsInArray_(v91, v92, (uint64_t)v7, v93, v94);

          objc_msgSend_denyListTriggers(v24, v95, v96, v97, v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v99, v100, v101, v102, v103))
          {

            v22 = v124;
            v6 = v125;
          }
          else
          {
            objc_msgSend_statesCurrent(v24, v104, v105, v106, v107);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = objc_msgSend_count(v108, v109, v110, v111, v112);

            v22 = v124;
            v6 = v125;
            if (!v113)
              objc_msgSend_addObject_(v123, v18, (uint64_t)v24, v20, v21);
          }
        }
        v23 = v129 + 1;
      }
      while (v129 + 1 != v128);
      v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v143, (uint64_t)v154, 16);
    }
    while (v128);
  }

  objc_msgSend_removeObjectsInArray_(v130->_denyList, v114, (uint64_t)v123, v115, v116);
  objc_msgSend_removeAllObjects(v123, v117, v118, v119, v120);

}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    self->_enabled = 1;
  }
  else
  {
    self->_enabled = 0;
    objc_msgSend_removeAllDenyListedItems(self, a2, a3, v3, v4);
  }
}

- (BOOL)_meetsThresholds:(unint64_t)a3 count:(unsigned int)a4 forSSIDThresholds:(BOOL)a5 BSSID:(id)a6 SSID:(id)a7
{
  _BOOL4 v8;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  void *v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v8 = a5;
  v12 = a6;
  v17 = a7;
  if (v8)
  {
    objc_msgSend_SSIDThresholds(self, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v18, v19, a3, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = objc_msgSend_unsignedIntValue(v22, v23, v24, v25, v26) <= a4;

    CWFGetOSLog();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      CWFGetOSLog();
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = MEMORY[0x1E0C81028];
      v40 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_SSIDThresholds(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v45, v46, a3, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unsignedIntValue(v49, v50, v51, v52, v53);
LABEL_12:
      _os_log_send_and_compose_impl();

    }
  }
  else
  {
    objc_msgSend_BSSIDThresholds(self, v13, v14, v15, v16);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v30, v31, a3, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_unsignedIntValue(v34, v35, v36, v37, v38) <= a4;

    CWFGetOSLog();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      CWFGetOSLog();
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = MEMORY[0x1E0C81028];
      v54 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_BSSIDThresholds(self, v55, v56, v57, v58);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v45, v59, a3, v60, v61);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unsignedIntValue(v49, v62, v63, v64, v65);
      goto LABEL_12;
    }
  }

  return v27;
}

- (id)_findNetworkDenyListItem:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_denyList;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
LABEL_3:
    v11 = 0;
    v12 = v9;
    while (1)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v5);
      v9 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v11);

      if ((objc_msgSend_containsNetwork_(v9, v13, (uint64_t)v4, v14, v15, (_QWORD)v18) & 1) != 0)
        break;
      ++v11;
      v12 = v9;
      if (v8 == v11)
      {
        v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v16, (uint64_t)&v18, (uint64_t)v22, 16);
        if (v8)
          goto LABEL_3;

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v9 = 0;
  }

  return v9;
}

- (id)networksInDenyListedState:(unint64_t)a3
{
  id v5;
  NSMutableArray *v6;
  const char *v7;
  id v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v36;
  id v37;
  NSMutableArray *obj;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  int v51;
  const char *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v6 = self->_denyList;
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v45, (uint64_t)v50, 16);
    if (v40)
    {
      v8 = 0;
      obj = v6;
      v39 = *(_QWORD *)v46;
      do
      {
        v9 = 0;
        v10 = v8;
        do
        {
          if (*(_QWORD *)v46 != v39)
            objc_enumerationMutation(obj);
          v8 = *(id *)(*((_QWORD *)&v45 + 1) + 8 * v9);

          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          objc_msgSend_statesCurrent(v8, v11, v12, v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v41, (uint64_t)v49, 16);
          if (v17)
          {
            v22 = v17;
            v23 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v42 != v23)
                  objc_enumerationMutation(v15);
                if (objc_msgSend_state(*(void **)(*((_QWORD *)&v41 + 1) + 8 * i), v18, v19, v20, v21) == a3)
                {
                  objc_msgSend_scanResultForNetworkDenyListItem(v8, v18, v19, v20, v21);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v25)
                  {
                    objc_msgSend_scanResultForNetworkDenyListItem(v8, v18, v19, v20, v21);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = (void *)objc_msgSend_copyWithZone_(v26, v27, 0, v28, v29);

                    if (v30)
                      objc_msgSend_addObject_(v5, v31, (uint64_t)v30, v32, v33);

                  }
                }
              }
              v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v41, (uint64_t)v49, 16);
            }
            while (v22);
          }

          ++v9;
          v10 = v8;
        }
        while (v9 != v40);
        v6 = obj;
        v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v45, (uint64_t)v50, 16);
      }
      while (v40);

    }
  }
  else
  {
    CWFGetOSLog();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      CWFGetOSLog();
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (NSMutableArray *)MEMORY[0x1E0C81028];
      v37 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(&v6->super.super, OS_LOG_TYPE_ERROR))
    {
      v51 = 136446210;
      v52 = "-[CWFNetworkDenyList networksInDenyListedState:]";
      _os_log_send_and_compose_impl();
    }
  }

  return v5;
}

- (id)networksInDenyListedStateHistory:(unint64_t)a3
{
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  void *v39;
  id v40;
  id v41;
  NSMutableArray *obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  int v53;
  const char *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v41)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v5 = self->_denyList;
    v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v47, (uint64_t)v52, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v48;
      obj = v5;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          v12 = v9;
          if (*(_QWORD *)v48 != v10)
            objc_enumerationMutation(obj);
          v9 = *(id *)(*((_QWORD *)&v47 + 1) + 8 * i);

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend_statesHistory(v9, v13, v14, v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v43, (uint64_t)v51, 16);
          if (v19)
          {
            v24 = v19;
            v25 = *(_QWORD *)v44;
            while (2)
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v44 != v25)
                  objc_enumerationMutation(v17);
                v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
                if (objc_msgSend_state(v27, v20, v21, v22, v23) == a3
                  || objc_msgSend_state(v27, v20, v21, v22, v23) == 5)
                {
                  objc_msgSend_scanResultForNetworkDenyListItem(v9, v20, v21, v22, v23);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v28)
                  {
                    objc_msgSend_scanResultForNetworkDenyListItem(v9, v20, v21, v22, v23);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = (void *)objc_msgSend_copyWithZone_(v29, v30, 0, v31, v32);

                    if (v33)
                      objc_msgSend_addObject_(v41, v34, (uint64_t)v33, v35, v36);

                    goto LABEL_21;
                  }
                }
              }
              v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v43, (uint64_t)v51, 16);
              if (v24)
                continue;
              break;
            }
          }
LABEL_21:

        }
        v5 = obj;
        v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v47, (uint64_t)v52, 16);
      }
      while (v8);

    }
  }
  else
  {
    CWFGetOSLog();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      CWFGetOSLog();
      v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (NSMutableArray *)MEMORY[0x1E0C81028];
      v40 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_ERROR))
    {
      v53 = 136446210;
      v54 = "-[CWFNetworkDenyList networksInDenyListedStateHistory:]";
      _os_log_send_and_compose_impl();
    }
  }

  return v41;
}

- (id)denyListedReasonHistoryForNetwork:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v77;
  NSObject *v78;
  void *v79;
  NSObject *v80;
  id v81;
  id v82;
  int *v83;
  uint64_t v84;
  void *v85;
  id v86;
  id obj;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  int v94;
  const char *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!objc_msgSend_isNetworkInDenyListedState_scanResult_(self, v13, a4, (uint64_t)v10, v14))
  {
    v88 = 0;
    goto LABEL_41;
  }
  objc_msgSend__findNetworkDenyListItem_(self, v15, (uint64_t)v10, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v88 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v88)
    {
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      objc_msgSend_statesHistory(v18, v19, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v89, (uint64_t)v93, 16);
      if (!v25)
        goto LABEL_39;
      v30 = v25;
      v85 = v18;
      v86 = v10;
      v31 = *(_QWORD *)v90;
      obj = v23;
      while (1)
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v90 != v31)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v32);
          v34 = objc_msgSend_reason(v33, v26, v27, v28, v29, v83, v84);
          objc_msgSend_stateTimestamp(v33, v35, v36, v37, v38);
          v40 = v39;
          v45 = objc_msgSend_reasonData(v33, v41, v42, v43, v44);
          objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v46, v34, v47, v48);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v53)
          {
            CWFGetOSLog();
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (v67)
            {
              CWFGetOSLog();
              v68 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v68 = MEMORY[0x1E0C81028];
              v72 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              v94 = 136446210;
              v95 = "-[CWFNetworkDenyList denyListedReasonHistoryForNetwork:state:timestamps:reasonData:]";
              LODWORD(v84) = 12;
              v83 = &v94;
              goto LABEL_30;
            }
LABEL_31:

            v58 = 0;
LABEL_36:
            v63 = 0;
            goto LABEL_16;
          }
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v49, v50, v51, v52, v40);
          v54 = objc_claimAutoreleasedReturnValue();
          if (!v54)
          {
            CWFGetOSLog();
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            if (v69)
            {
              CWFGetOSLog();
              v68 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v68 = MEMORY[0x1E0C81028];
              v73 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              v94 = 136446210;
              v95 = "-[CWFNetworkDenyList denyListedReasonHistoryForNetwork:state:timestamps:reasonData:]";
              LODWORD(v84) = 12;
              v83 = &v94;
LABEL_30:
              _os_log_send_and_compose_impl();
            }
            goto LABEL_31;
          }
          v58 = (void *)v54;
          objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v55, v45, v56, v57);
          v59 = objc_claimAutoreleasedReturnValue();
          if (!v59)
          {
            CWFGetOSLog();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            if (v70)
            {
              CWFGetOSLog();
              v71 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v71 = MEMORY[0x1E0C81028];
              v74 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              v94 = 136446210;
              v95 = "-[CWFNetworkDenyList denyListedReasonHistoryForNetwork:state:timestamps:reasonData:]";
              LODWORD(v84) = 12;
              v83 = &v94;
              _os_log_send_and_compose_impl();
            }

            goto LABEL_36;
          }
          v63 = (void *)v59;
          objc_msgSend_addObject_(v88, v60, (uint64_t)v53, v61, v62);
          if (v11)
            objc_msgSend_addObject_(v11, v64, (uint64_t)v58, v65, v66);
          if (v12)
            objc_msgSend_addObject_(v12, v64, (uint64_t)v63, v65, v66);
LABEL_16:

          ++v32;
        }
        while (v30 != v32);
        v23 = obj;
        v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v89, (uint64_t)v93, 16);
        v30 = v75;
        if (!v75)
        {
          v18 = v85;
          v10 = v86;
          goto LABEL_39;
        }
      }
    }
    CWFGetOSLog();
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (v79)
    {
      CWFGetOSLog();
      v80 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v80 = MEMORY[0x1E0C81028];
      v82 = MEMORY[0x1E0C81028];
    }

    v23 = v80;
    if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    v94 = 136446210;
    v95 = "-[CWFNetworkDenyList denyListedReasonHistoryForNetwork:state:timestamps:reasonData:]";
    goto LABEL_52;
  }
  CWFGetOSLog();
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    CWFGetOSLog();
    v78 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v78 = MEMORY[0x1E0C81028];
    v81 = MEMORY[0x1E0C81028];
  }

  v23 = v78;
  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
  {
    v94 = 136446210;
    v95 = "-[CWFNetworkDenyList denyListedReasonHistoryForNetwork:state:timestamps:reasonData:]";
LABEL_52:
    _os_log_send_and_compose_impl();
  }
LABEL_53:
  v88 = 0;
LABEL_39:

LABEL_41:
  return v88;
}

- (id)reasonsForNetworkInDenyListedState:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  void *v80;
  void *v81;
  id v82;
  id v83;
  int *v84;
  uint64_t v85;
  void *v86;
  id v87;
  NSObject *obj;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  int v95;
  const char *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v89 = a5;
  v11 = a6;
  if (!objc_msgSend_isNetworkInDenyListedState_scanResult_(self, v12, a4, (uint64_t)v10, v13))
  {
    v23 = 0;
    goto LABEL_36;
  }
  objc_msgSend__findNetworkDenyListItem_(self, v14, (uint64_t)v10, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v18)
    {
      v23 = v18;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      objc_msgSend_denyListTriggers(v17, v19, v20, v21, v22);
      v24 = objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v90, (uint64_t)v94, 16);
      if (!v26)
        goto LABEL_34;
      v31 = v26;
      v87 = v10;
      obj = v24;
      v86 = v17;
      v32 = *(_QWORD *)v91;
      while (1)
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v91 != v32)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v33);
          v35 = objc_msgSend_reason(v34, v27, v28, v29, v30, v84, v85);
          objc_msgSend_reasonTimestamp(v34, v36, v37, v38, v39);
          v41 = v40;
          v46 = objc_msgSend_reasonData(v34, v42, v43, v44, v45);
          objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v47, v35, v48, v49);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (v54)
          {
            objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v50, v51, v52, v53, v41);
            v55 = objc_claimAutoreleasedReturnValue();
            if (v55)
            {
              v59 = v55;
              objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v56, v46, v57, v58);
              v60 = objc_claimAutoreleasedReturnValue();
              if (v60)
              {
                v64 = (void *)v60;
                objc_msgSend_addObject_(v23, v61, (uint64_t)v54, v62, v63);
                objc_msgSend_addObject_(v89, v65, (uint64_t)v59, v66, v67);
                objc_msgSend_addObject_(v11, v68, (uint64_t)v64, v69, v70);

              }
              else
              {
                CWFGetOSLog();
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                if (v73)
                {
                  CWFGetOSLog();
                  v74 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v74 = MEMORY[0x1E0C81028];
                  v77 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                {
                  v95 = 136446210;
                  v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
                  LODWORD(v85) = 12;
                  v84 = &v95;
                  _os_log_send_and_compose_impl();
                }

              }
            }
            else
            {
              CWFGetOSLog();
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              if (v72)
              {
                CWFGetOSLog();
                v59 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v59 = MEMORY[0x1E0C81028];
                v76 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                v95 = 136446210;
                v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
                LODWORD(v85) = 12;
                v84 = &v95;
                goto LABEL_27;
              }
            }
          }
          else
          {
            CWFGetOSLog();
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            if (v71)
            {
              CWFGetOSLog();
              v59 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v59 = MEMORY[0x1E0C81028];
              v75 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              v95 = 136446210;
              v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
              LODWORD(v85) = 12;
              v84 = &v95;
LABEL_27:
              _os_log_send_and_compose_impl();
            }
          }

          ++v33;
        }
        while (v31 != v33);
        v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v90, (uint64_t)v94, 16);
        v31 = v78;
        if (!v78)
        {
          v17 = v86;
          v10 = v87;
          v24 = obj;
          goto LABEL_34;
        }
      }
    }
    CWFGetOSLog();
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v81)
    {
      CWFGetOSLog();
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = MEMORY[0x1E0C81028];
      v83 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    v95 = 136446210;
    v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
    goto LABEL_47;
  }
  CWFGetOSLog();
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    CWFGetOSLog();
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = MEMORY[0x1E0C81028];
    v82 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v95 = 136446210;
    v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
LABEL_47:
    _os_log_send_and_compose_impl();
  }
LABEL_48:
  v23 = 0;
LABEL_34:

LABEL_36:
  return v23;
}

- (BOOL)isNetworkInDenyListedState:(unint64_t)a3 scanResult:(id)a4
{
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char hasDenyListState;

  objc_msgSend__findNetworkDenyListItem_(self, a2, (uint64_t)a4, (uint64_t)a4, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  if (v6)
    hasDenyListState = objc_msgSend_hasDenyListState_(v6, v7, a3, v8, v9);
  else
    hasDenyListState = 0;

  return hasDenyListState;
}

- (BOOL)isNetworkTemporarilyDenyListedForAutoJoin:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int isEqual;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  BOOL v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v5 = self->_denyList;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v47, (uint64_t)v52, 16);
  if (v7)
  {
    v12 = v7;
    v13 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v5);
        v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend_scanResultForNetworkDenyListItem(v15, v8, v9, v10, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v16, v17, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v4, v22, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v21, v27, (uint64_t)v26, v28, v29);

        if (isEqual && objc_msgSend_hasDenyListState_(v15, v8, 1, v10, v11))
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend_statesCurrent(v15, v8, v9, v10, v11, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v43, (uint64_t)v51, 16);
          if (v33)
          {
            v38 = v33;
            v39 = *(_QWORD *)v44;
            while (2)
            {
              for (j = 0; j != v38; ++j)
              {
                if (*(_QWORD *)v44 != v39)
                  objc_enumerationMutation(v31);
                if (!objc_msgSend_reason(*(void **)(*((_QWORD *)&v43 + 1) + 8 * j), v34, v35, v36, v37))
                {

                  v41 = 1;
                  goto LABEL_22;
                }
              }
              v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v43, (uint64_t)v51, 16);
              if (v38)
                continue;
              break;
            }
          }

        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v47, (uint64_t)v52, 16);
      v41 = 0;
    }
    while (v12);
  }
  else
  {
    v41 = 0;
  }
LABEL_22:

  return v41;
}

- (int64_t)RSSIWhenNetworkWasDenyListed:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;

  objc_msgSend__findNetworkDenyListItem_(self, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v5)
  {
    objc_msgSend_scanResultForNetworkDenyListItem(v5, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_RSSI(v11, v12, v13, v14, v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isNetworkDenyListedForAutoJoinDueToTrigDisc:(id)a3 RSSI:(int64_t *)a4 timestamp:(double *)a5
{
  NSMutableArray *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  int isEqual;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  BOOL v52;
  uint64_t v53;
  int64_t *v55;
  double *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v8 = self->_denyList;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v62, (uint64_t)v67, 16);
  if (v10)
  {
    v11 = v10;
    v55 = a4;
    v56 = a5;
    v12 = 0;
    v13 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        v15 = v12;
        if (*(_QWORD *)v63 != v13)
          objc_enumerationMutation(v8);
        v12 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * i);

        if (objc_msgSend_hasDenyListState_(v12, v16, 1, v17, v18))
        {
          objc_msgSend_scanResultForNetworkDenyListItem(v12, v19, v20, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_SSID(v23, v24, v25, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_SSID(v57, v29, v30, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v28, v34, (uint64_t)v33, v35, v36);

          if (isEqual)
          {
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            objc_msgSend_statesCurrent(v12, v19, v38, v39, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v58, (uint64_t)v66, 16);
            if (v43)
            {
              v48 = v43;
              v49 = *(_QWORD *)v59;
              while (2)
              {
                for (j = 0; j != v48; ++j)
                {
                  if (*(_QWORD *)v59 != v49)
                    objc_enumerationMutation(v41);
                  v51 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
                  if (objc_msgSend_reason(v51, v44, v45, v46, v47) == 6)
                  {
                    if (v55)
                      *v55 = (int)objc_msgSend_reasonData(v51, v44, v45, v46, v47);
                    if (v56)
                    {
                      objc_msgSend_stateTimestamp(v51, v44, v45, v46, v47);
                      *(_QWORD *)v56 = v53;
                    }
                    v52 = 1;
                    goto LABEL_25;
                  }
                }
                v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v58, (uint64_t)v66, 16);
                if (v48)
                  continue;
                break;
              }
            }

          }
        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v19, (uint64_t)&v62, (uint64_t)v67, 16);
    }
    while (v11);
    v52 = 0;
    v41 = v12;
    v12 = 0;
LABEL_25:

  }
  else
  {
    v12 = 0;
    v52 = 0;
  }

  return v52;
}

- (id)denyListedNetworkSSIDs:(unint64_t)a3
{
  id v5;
  const char *v6;
  id v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v42;
  id v43;
  NSMutableArray *obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  int v56;
  const char *v57;
  __int16 v58;
  id v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (v5)
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = self->_denyList;
    v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v52, (uint64_t)v61, 16);
    if (v46)
    {
      v7 = 0;
      v45 = *(_QWORD *)v53;
      do
      {
        v8 = 0;
        v9 = v7;
        do
        {
          if (*(_QWORD *)v53 != v45)
            objc_enumerationMutation(obj);
          v47 = v8;
          v7 = *(id *)(*((_QWORD *)&v52 + 1) + 8 * v8);

          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          objc_msgSend_statesCurrent(v7, v10, v11, v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v48, (uint64_t)v60, 16);
          if (v16)
          {
            v21 = v16;
            v22 = *(_QWORD *)v49;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v49 != v22)
                  objc_enumerationMutation(v14);
                if (objc_msgSend_state(*(void **)(*((_QWORD *)&v48 + 1) + 8 * i), v17, v18, v19, v20) == a3)
                {
                  objc_msgSend_scanResultForNetworkDenyListItem(v7, v17, v18, v19, v20);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_SSID(v24, v25, v26, v27, v28);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();

                  v30 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v33 = (void *)objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)v29, 4, v32);
                  objc_msgSend_appendFormat_(v5, v34, (uint64_t)CFSTR("%@ "), v35, v36, v33);

                }
              }
              v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v48, (uint64_t)v60, 16);
            }
            while (v21);
          }

          v8 = v47 + 1;
          v9 = v7;
        }
        while (v47 + 1 != v46);
        v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v52, (uint64_t)v61, 16);
      }
      while (v46);

    }
    CWFGetOSLog();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      CWFGetOSLog();
      v39 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = MEMORY[0x1E0C81028];
      v40 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v56 = 136446466;
      v57 = "-[CWFNetworkDenyList denyListedNetworkSSIDs:]";
      v58 = 2114;
      v59 = v5;
LABEL_24:
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    CWFGetOSLog();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      CWFGetOSLog();
      v39 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = MEMORY[0x1E0C81028];
      v43 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v56 = 136446210;
      v57 = "-[CWFNetworkDenyList denyListedNetworkSSIDs:]";
      goto LABEL_24;
    }
  }

  return v5;
}

- (unint64_t)denyListedNetworkCount
{
  NSMutableArray *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  NSObject *v27;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int v38;
  const char *v39;
  __int16 v40;
  unint64_t v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v2 = self->_denyList;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v34, (uint64_t)v43, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        v10 = v6;
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v2);
        v6 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * i);

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend_statesCurrent(v6, v11, v12, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v30, (uint64_t)v42, 16);
        if (v17)
        {
          v22 = v17;
          v23 = *(_QWORD *)v31;
LABEL_8:
          v24 = 0;
          while (1)
          {
            if (*(_QWORD *)v31 != v23)
              objc_enumerationMutation(v15);
            if (objc_msgSend_state(*(void **)(*((_QWORD *)&v30 + 1) + 8 * v24), v18, v19, v20, v21))
              break;
            if (v22 == ++v24)
            {
              v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v30, (uint64_t)v42, 16);
              if (v22)
                goto LABEL_8;
              break;
            }
          }
        }

      }
      v7 += v5;
      v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v25, (uint64_t)&v34, (uint64_t)v43, 16);
    }
    while (v5);

  }
  else
  {
    v7 = 0;
  }

  CWFGetOSLog();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    CWFGetOSLog();
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = MEMORY[0x1E0C81028];
    v28 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v38 = 136446466;
    v39 = "-[CWFNetworkDenyList denyListedNetworkCount]";
    v40 = 2048;
    v41 = v7;
    _os_log_send_and_compose_impl();
  }

  return v7;
}

- (void)_printDenyList
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  NSObject *v99;
  id v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t j;
  void *v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  NSObject *v143;
  id v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t k;
  void *v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  NSObject *v187;
  id v188;
  const char *v189;
  uint8_t *v190;
  uint64_t v191;
  void *v192;
  NSMutableArray *obj;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  void *v197;
  uint64_t v198;
  id v199;
  id v200;
  void *v201;
  void *v202;
  id v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  _BYTE v220[128];
  _BYTE v221[128];
  uint8_t v222[128];
  uint8_t buf[4];
  const char *v224;
  __int16 v225;
  uint64_t v226;
  __int16 v227;
  const char *v228;
  _BYTE v229[128];
  uint64_t v230;

  v230 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1B5E0A33C](self, a2);
  if (objc_msgSend_count(self->_denyList, v4, v5, v6, v7))
  {
    CWFGetOSLog();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      CWFGetOSLog();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    v192 = v3;

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      v224 = "-[CWFNetworkDenyList _printDenyList]";
      LODWORD(v191) = 12;
      v190 = buf;
      _os_log_send_and_compose_impl();
    }

    v203 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend_setDateFormat_(v203, v11, (uint64_t)CFSTR("MM/dd/yy HH:mm:ss.SSS"), v12, v13);
    v218 = 0u;
    v219 = 0u;
    v216 = 0u;
    v217 = 0u;
    obj = self->_denyList;
    v195 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v216, (uint64_t)v229, 16);
    if (v195)
    {
      v194 = *(_QWORD *)v217;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v217 != v194)
            objc_enumerationMutation(obj);
          v198 = v15;
          v16 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * v15);
          v17 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend_scanResultForNetworkDenyListItem(v16, v18, v19, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_SSID(v22, v23, v24, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend_initWithData_encoding_(v17, v28, (uint64_t)v27, 4, v29);

          objc_msgSend_scanResultForNetworkDenyListItem(v16, v31, v32, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_BSSID(v35, v36, v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend_copy(v40, v41, v42, v43, v44);

          objc_msgSend_statesCurrent(v16, v46, v47, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend_count(v50, v51, v52, v53, v54);

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v59 = "YES";
            if (!v55)
              v59 = "NO";
            v224 = (const char *)v30;
            v225 = 2112;
            v226 = v45;
            v227 = 2080;
            v228 = v59;
            _os_log_impl(&dword_1B0621000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Network '%@' BSSID \"%@\" isDenyListed:%s ", buf, 0x20u);
          }
          v196 = (void *)v45;
          v197 = (void *)v30;
          objc_msgSend_stringWithString_(MEMORY[0x1E0CB37A0], v56, (uint64_t)CFSTR(" DenyListHistory: "), v57, v58, v190, v191);
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          v212 = 0u;
          v213 = 0u;
          v214 = 0u;
          v215 = 0u;
          v199 = v16;
          objc_msgSend_statesHistory(v16, v60, v61, v62, v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v212, (uint64_t)v222, 16);
          if (v66)
          {
            v71 = v66;
            v72 = 0;
            v73 = *(_QWORD *)v213;
            do
            {
              for (i = 0; i != v71; ++i)
              {
                if (*(_QWORD *)v213 != v73)
                  objc_enumerationMutation(v64);
                v75 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * i);
                objc_msgSend_stateString(v75, v67, v68, v69, v70);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stateTimestamp(v75, v77, v78, v79, v80);
                v81 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v82, v83, v84, v85);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringFromDate_(v203, v87, (uint64_t)v86, v88, v89);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringWithFormat_(v81, v91, (uint64_t)CFSTR("[%d] %@ @ %@, "), v92, v93, v72 + i, v76, v90);
                v94 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_appendString_(v202, v95, (uint64_t)v94, v96, v97);
              }
              v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v67, (uint64_t)&v212, (uint64_t)v222, 16);
              v72 = (v72 + i);
            }
            while (v71);
          }

          CWFGetOSLog();
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          if (v98)
          {
            CWFGetOSLog();
            v99 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v99 = MEMORY[0x1E0C81028];
            v100 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v224 = (const char *)v202;
            LODWORD(v191) = 12;
            v190 = buf;
            _os_log_send_and_compose_impl();
          }

          objc_msgSend_stringWithString_(MEMORY[0x1E0CB37A0], v101, (uint64_t)CFSTR(" States: "), v102, v103);
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          v208 = 0u;
          v209 = 0u;
          v210 = 0u;
          v211 = 0u;
          objc_msgSend_statesCurrent(v199, v104, v105, v106, v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v109, (uint64_t)&v208, (uint64_t)v221, 16);
          if (v110)
          {
            v115 = v110;
            v116 = 0;
            v117 = *(_QWORD *)v209;
            do
            {
              for (j = 0; j != v115; ++j)
              {
                if (*(_QWORD *)v209 != v117)
                  objc_enumerationMutation(v108);
                v119 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * j);
                objc_msgSend_stateString(v119, v111, v112, v113, v114, v190, v191);
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stateTimestamp(v119, v121, v122, v123, v124);
                v125 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v126, v127, v128, v129);
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringFromDate_(v203, v131, (uint64_t)v130, v132, v133);
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringWithFormat_(v125, v135, (uint64_t)CFSTR("[%d] %@ @ %@, "), v136, v137, v116 + j, v120, v134);
                v138 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_appendString_(v201, v139, (uint64_t)v138, v140, v141);
              }
              v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v111, (uint64_t)&v208, (uint64_t)v221, 16);
              v116 = (v116 + j);
            }
            while (v115);
          }

          CWFGetOSLog();
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          if (v142)
          {
            CWFGetOSLog();
            v143 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v143 = MEMORY[0x1E0C81028];
            v144 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v224 = (const char *)v201;
            LODWORD(v191) = 12;
            v190 = buf;
            _os_log_send_and_compose_impl();
          }

          objc_msgSend_stringWithString_(MEMORY[0x1E0CB37A0], v145, (uint64_t)CFSTR(" Triggers: "), v146, v147);
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v204 = 0u;
          v205 = 0u;
          v206 = 0u;
          v207 = 0u;
          objc_msgSend_denyListTriggers(v199, v149, v150, v151, v152);
          v200 = (id)objc_claimAutoreleasedReturnValue();
          v154 = objc_msgSend_countByEnumeratingWithState_objects_count_(v200, v153, (uint64_t)&v204, (uint64_t)v220, 16);
          if (v154)
          {
            v159 = v154;
            v160 = 0;
            v161 = *(_QWORD *)v205;
            do
            {
              for (k = 0; k != v159; ++k)
              {
                if (*(_QWORD *)v205 != v161)
                  objc_enumerationMutation(v200);
                v163 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * k);
                objc_msgSend_reasonString(v163, v155, v156, v157, v158, v190, v191);
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_reasonTimestamp(v163, v165, v166, v167, v168);
                v169 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v170, v171, v172, v173);
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringFromDate_(v203, v175, (uint64_t)v174, v176, v177);
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringWithFormat_(v169, v179, (uint64_t)CFSTR("[%d] %@ @ %@, "), v180, v181, v160 + k, v164, v178);
                v182 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_appendString_(v148, v183, (uint64_t)v182, v184, v185);
              }
              v159 = objc_msgSend_countByEnumeratingWithState_objects_count_(v200, v155, (uint64_t)&v204, (uint64_t)v220, 16);
              v160 = (v160 + k);
            }
            while (v159);
          }

          CWFGetOSLog();
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          if (v186)
          {
            CWFGetOSLog();
            v187 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v187 = MEMORY[0x1E0C81028];
            v188 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v224 = (const char *)v148;
            LODWORD(v191) = 12;
            v190 = buf;
            _os_log_send_and_compose_impl();
          }

          v15 = v198 + 1;
        }
        while (v198 + 1 != v195);
        v195 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v189, (uint64_t)&v216, (uint64_t)v229, 16);
      }
      while (v195);
    }

    v3 = v192;
  }
  objc_autoreleasePoolPop(v3);
}

- (id)denyList
{
  return self->_denyList;
}

- (id)batteryInfoHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setBatteryInfoHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)isUserModeInteractiveHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setIsUserModeInteractiveHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)denyListDidUpdateHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setDenyListDidUpdateHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSArray)SSIDThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSSIDThresholds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)BSSIDThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBSSIDThresholds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (double)wowDenyListExpiry
{
  return self->_wowDenyListExpiry;
}

- (void)setWowDenyListExpiry:(double)a3
{
  self->_wowDenyListExpiry = a3;
}

- (double)networkDenyListExpiry
{
  return self->_networkDenyListExpiry;
}

- (void)setNetworkDenyListExpiry:(double)a3
{
  self->_networkDenyListExpiry = a3;
}

- (double)BSSDenyListExpiry
{
  return self->_BSSDenyListExpiry;
}

- (void)setBSSDenyListExpiry:(double)a3
{
  self->_BSSDenyListExpiry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_BSSIDThresholds, 0);
  objc_storeStrong((id *)&self->_SSIDThresholds, 0);
  objc_storeStrong(&self->_denyListDidUpdateHandler, 0);
  objc_storeStrong(&self->_isUserModeInteractiveHandler, 0);
  objc_storeStrong(&self->_batteryInfoHandler, 0);
  objc_storeStrong((id *)&self->_denyList, 0);
}

@end
