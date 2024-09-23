@implementation CKNotification

+ (id)_realNotificationFromRemoteNotificationDictionary:(id)a3
{
  id v3;
  objc_class *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend_objectForKeyedSubscript_(v3, v5, (uint64_t)CFSTR("ck"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)CFSTR("qry"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10
        || (objc_msgSend_objectForKeyedSubscript_(v7, v11, (uint64_t)CFSTR("fet"), v12),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v14,
            v14)
        || (objc_msgSend_objectForKeyedSubscript_(v7, v15, (uint64_t)CFSTR("met"), v16),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v17,
            v17))
      {
        v4 = (objc_class *)objc_opt_class();
      }
    }
    v18 = [v4 alloc];
    v13 = (void *)objc_msgSend_initWithRemoteNotificationDictionary_(v18, v19, (uint64_t)v3, v20);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (CKNotification)initWithRemoteNotificationDictionary:(id)a3
{
  id v4;
  CKNotification *v5;
  const char *v6;
  uint64_t v7;
  CKNotification *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  CKNotificationID *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CKContainerID *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  CKRecordID *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  objc_super v133;

  v4 = a3;
  v133.receiver = self;
  v133.super_class = (Class)CKNotification;
  v5 = -[CKNotification init](&v133, sel_init);
  v8 = v5;
  if (v5)
  {
    objc_msgSend_setNotificationType_(v5, v6, 0, v7);
    objc_msgSend_objectForKeyedSubscript_(v4, v9, (uint64_t)CFSTR("ck"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)CFSTR("nid"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = [CKNotificationID alloc];
        v20 = (void *)objc_msgSend_initWithNotificationUUID_(v17, v18, (uint64_t)v14, v19);
        objc_msgSend_setNotificationID_(v8, v21, (uint64_t)v20, v22);

      }
      objc_msgSend_objectForKeyedSubscript_(v11, v15, (uint64_t)CFSTR("p"), v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        objc_msgSend_setIsPruned_(v8, v24, 1, v25);
      objc_msgSend_objectForKeyedSubscript_(v11, v24, (uint64_t)CFSTR("cid"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v26;
      else
        v29 = CFSTR("Unknown Container");
      objc_msgSend_objectForKeyedSubscript_(v11, v27, (uint64_t)CFSTR("ce"), v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v34 = objc_msgSend_integerValue(v30, v31, v32, v33);
      else
        v34 = 1;
      v35 = [CKContainerID alloc];
      v37 = (void *)objc_msgSend_initWithContainerIdentifier_environment_(v35, v36, (uint64_t)v29, v34);
      objc_msgSend_setContainerID_(v8, v38, (uint64_t)v37, v39);

      objc_msgSend_objectForKeyedSubscript_(v11, v40, (uint64_t)CFSTR("ckuserid"), v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = [CKRecordID alloc];
        v46 = (void *)objc_msgSend_initWithRecordName_(v43, v44, (uint64_t)v42, v45);
        objc_msgSend_setSubscriptionOwnerUserRecordID_(v8, v47, (uint64_t)v46, v48);

      }
    }
    objc_msgSend_objectForKeyedSubscript_(v4, v12, (uint64_t)CFSTR("aps"), v13);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v49, v50, (uint64_t)CFSTR("alert"), v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_setAlertBody_(v8, v53, (uint64_t)v52, v54);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_objectForKeyedSubscript_(v52, v55, (uint64_t)CFSTR("body"), v56);
          v57 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setAlertBody_(v8, v58, v57, v59);
          v130 = (void *)v57;
          objc_msgSend_objectForKeyedSubscript_(v52, v58, (uint64_t)CFSTR("loc-key"), v59);
          v60 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setAlertLocalizationKey_(v8, v61, v60, v62);
          v129 = (void *)v60;
          objc_msgSend_objectForKeyedSubscript_(v52, v61, (uint64_t)CFSTR("loc-args"), v62);
          v63 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setAlertLocalizationArgs_(v8, v64, v63, v65);
          objc_msgSend_objectForKeyedSubscript_(v52, v64, (uint64_t)CFSTR("title"), v65);
          v66 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setTitle_(v8, v67, v66, v68);
          v128 = (void *)v63;
          objc_msgSend_objectForKeyedSubscript_(v52, v67, (uint64_t)CFSTR("title-loc-key"), v68);
          v69 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setTitleLocalizationKey_(v8, v70, v69, v71);
          objc_msgSend_objectForKeyedSubscript_(v52, v70, (uint64_t)CFSTR("title-loc-args"), v71);
          v72 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v132 = (void *)v72;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setTitleLocalizationArgs_(v8, v73, v72, v74);
          objc_msgSend_objectForKeyedSubscript_(v52, v73, (uint64_t)CFSTR("subtitle"), v74);
          v75 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setSubtitle_(v8, v76, v75, v77);
          objc_msgSend_objectForKeyedSubscript_(v52, v76, (uint64_t)CFSTR("subtitle-loc-key"), v77);
          v78 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v131 = (void *)v78;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setSubtitleLocalizationKey_(v8, v79, v78, v80);
          v126 = (void *)v69;
          objc_msgSend_objectForKeyedSubscript_(v52, v79, (uint64_t)CFSTR("subtitle-loc-args"), v80);
          v81 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setSubtitleLocalizationArgs_(v8, v82, v81, v83);
          v125 = (void *)v75;
          objc_msgSend_objectForKeyedSubscript_(v52, v82, (uint64_t)CFSTR("action-loc-key"), v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setAlertActionLocalizationKey_(v8, v85, (uint64_t)v84, v86);
          v124 = (void *)v81;
          v127 = (void *)v66;
          objc_msgSend_objectForKeyedSubscript_(v52, v85, (uint64_t)CFSTR("launch-image"), v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setAlertLaunchImage_(v8, v88, (uint64_t)v87, v89);
          objc_msgSend_objectForKeyedSubscript_(v52, v88, (uint64_t)CFSTR("badge"), v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v94 = objc_msgSend_intValue(v90, v91, v92, v93);
            objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v95, v94, v96);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setBadge_(v8, v98, (uint64_t)v97, v99);

          }
          objc_msgSend_objectForKeyedSubscript_(v52, v91, (uint64_t)CFSTR("sound"), v93);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setSoundName_(v8, v101, (uint64_t)v100, v102);

        }
      }
      objc_msgSend_objectForKeyedSubscript_(v49, v55, (uint64_t)CFSTR("category"), v56);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend_setCategory_(v8, v104, (uint64_t)v103, v105);

    }
    objc_msgSend_objectForKeyedSubscript_(v4, v50, (uint64_t)CFSTR("ckt"), v51);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v106, v107, (uint64_t)CFSTR("sn"), v108);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend_setTestServerName_(v8, v110, (uint64_t)v109, v111);
      objc_msgSend_objectForKeyedSubscript_(v106, v110, (uint64_t)CFSTR("surl"), v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_setTestServerURL_(v8, v113, (uint64_t)v112, v114);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v115, (uint64_t)v112, v116);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setTestServerURL_(v8, v118, (uint64_t)v117, v119);

        }
      }
      objc_msgSend_objectForKeyedSubscript_(v106, v115, (uint64_t)CFSTR("did"), v116);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend_setTestDeviceID_(v8, v121, (uint64_t)v120, v122);

    }
  }

  return v8;
}

+ (void)initialize
{
  objc_class *v3;
  const char *v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v6, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5CEF4C((uint64_t)a1, v3, v5, 0, 0);

}

- (CKNotification)init
{
  objc_class *v2;
  uint64_t v3;
  CKException *v4;
  const char *v5;
  id v6;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = [CKException alloc];
  v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("%@ is not meant for direct instantiation"), v3);
  objc_exception_throw(v6);
}

- (id)initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKNotification;
  return -[CKNotification init](&v3, sel_init);
}

+ (CKNotification)notificationFromRemoteNotificationDictionary:(NSDictionary *)notificationDictionary
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v5 = (void *)objc_msgSend_copy(notificationDictionary, a2, (uint64_t)notificationDictionary, v3);
  objc_msgSend__realNotificationFromRemoteNotificationDictionary_(a1, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKNotification *)v8;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  int isPruned;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  __CFString *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  __CFString *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  const __CFString *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  __CFString *v82;
  void *v83;
  void *v84;

  v78 = (void *)MEMORY[0x1E0CB3940];
  v77 = objc_msgSend_notificationType(self, a2, v2, v3);
  objc_msgSend_notificationID(self, v5, v6, v7);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_notificationUUID(v81, v8, v9, v10);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(self, v11, v12, v13);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckShortDescription(v80, v14, v15, v16);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subscriptionOwnerUserRecordID(self, v17, v18, v19);
  v20 = &stru_1E1F66ED0;
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_subscriptionOwnerUserRecordID(self, v21, v22, v23);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(v75, v25, v26, v27);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v24, v28, (uint64_t)CFSTR(", subscriptionOwnerUserRecordID=%@"), v29, v74);
    v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v82 = &stru_1E1F66ED0;
  }
  isPruned = objc_msgSend_isPruned(self, v21, v22, v23);
  v34 = CFSTR(", isPruned");
  if (!isPruned)
    v34 = &stru_1E1F66ED0;
  v76 = v34;
  objc_msgSend_subscriptionID(self, v31, v32, v33);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_subscriptionID(self, v35, v36, v37);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v39, v40, (uint64_t)CFSTR(", subscriptionID=%@"), v41, v73);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_testServerName(self, v35, v36, v37);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_testServerName(self, v42, v43, v44);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v46, v47, (uint64_t)CFSTR(", testServerName=%@"), v48, v72);
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v49 = &stru_1E1F66ED0;
  }
  objc_msgSend_testServerURL(self, v42, v43, v44);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_testServerURL(self, v50, v51, v52);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v54, v55, (uint64_t)CFSTR(", testServerURL=%@"), v56, v71);
    v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v57 = &stru_1E1F66ED0;
  }
  objc_msgSend_testDeviceID(self, v50, v51, v52);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    v62 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_testDeviceID(self, v58, v59, v60);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v62, v64, (uint64_t)CFSTR(", testDeviceID=%@"), v65, v63);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v78, v67, (uint64_t)CFSTR("notificationType=%ld, notificationID=%@, containerID=%@%@%@%@%@%@%@"), v68, v77, v84, v83, v82, v76, v20, v49, v57, v66);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_stringWithFormat_(v78, v58, (uint64_t)CFSTR("notificationType=%ld, notificationID=%@, containerID=%@%@%@%@%@%@%@"), v60, v77, v84, v83, v82, v76, v20, v49, v57, &stru_1E1F66ED0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v53)
  {

  }
  if (v45)
  {

  }
  if (v38)
  {

  }
  if (v79)
  {

  }
  return v69;
}

- (id)description
{
  return (id)((uint64_t (*)(CKNotification *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (BOOL)isRead
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_notificationType(self, a2, v2, v3) == 3;
}

- (NSString)containerIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_containerID(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setContainerIdentifier:(id)a3
{
  id v4;
  CKContainerID *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;

  v4 = a3;
  v5 = [CKContainerID alloc];
  objc_msgSend_containerID(self, v6, v7, v8);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_environment(v17, v9, v10, v11);
  v14 = (void *)objc_msgSend_initWithContainerIdentifier_environment_(v5, v13, (uint64_t)v4, v12);

  objc_msgSend_setContainerID_(self, v15, (uint64_t)v14, v16);
}

- (void)setSubscriptionID:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionID, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t isPruned;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  id v123;

  v123 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  v8 = objc_msgSend_notificationType(self, v5, v6, v7);
  objc_msgSend_encodeInt64_forKey_(v123, v9, v8, (uint64_t)CFSTR("Type"));
  objc_msgSend_notificationID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v14, (uint64_t)v13, (uint64_t)CFSTR("ID"));

  objc_msgSend_containerID(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v19, (uint64_t)v18, (uint64_t)CFSTR("containerID"));

  objc_msgSend_subscriptionOwnerUserRecordID(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v24, (uint64_t)v23, (uint64_t)CFSTR("subscriptionOwnerUserRecordID"));

  isPruned = objc_msgSend_isPruned(self, v25, v26, v27);
  objc_msgSend_encodeBool_forKey_(v123, v29, isPruned, (uint64_t)CFSTR("IsPruned"));
  objc_msgSend_subscriptionID(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v34, (uint64_t)v33, (uint64_t)CFSTR("SubscriptionID"));

  objc_msgSend_testServerName(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_testServerName);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v40, (uint64_t)v38, (uint64_t)v39);

  objc_msgSend_testServerURL(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_testServerURL);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v46, (uint64_t)v44, (uint64_t)v45);

  objc_msgSend_testDeviceID(self, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_testDeviceID);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v52, (uint64_t)v50, (uint64_t)v51);

  objc_msgSend_alertBody(self, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v57, (uint64_t)v56, (uint64_t)CFSTR("AlertBody"));

  objc_msgSend_alertLocalizationKey(self, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v62, (uint64_t)v61, (uint64_t)CFSTR("AlertLocalizationKey"));

  objc_msgSend_alertLocalizationArgs(self, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v67, (uint64_t)v66, (uint64_t)CFSTR("AlertLocalizationArgs"));

  objc_msgSend_title(self, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v72, (uint64_t)v71, (uint64_t)CFSTR("Title"));

  objc_msgSend_titleLocalizationKey(self, v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v77, (uint64_t)v76, (uint64_t)CFSTR("TitleLocalizationKey"));

  objc_msgSend_titleLocalizationArgs(self, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v82, (uint64_t)v81, (uint64_t)CFSTR("TitleLocalizationArgs"));

  objc_msgSend_subtitle(self, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v87, (uint64_t)v86, (uint64_t)CFSTR("Subtitle"));

  objc_msgSend_subtitleLocalizationKey(self, v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v92, (uint64_t)v91, (uint64_t)CFSTR("SubtitleLocalizationKey"));

  objc_msgSend_subtitleLocalizationArgs(self, v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v97, (uint64_t)v96, (uint64_t)CFSTR("SubtitleLocalizationArgs"));

  objc_msgSend_alertActionLocalizationKey(self, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v102, (uint64_t)v101, (uint64_t)CFSTR("AlertActionLocalizationKey"));

  objc_msgSend_alertLaunchImage(self, v103, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v107, (uint64_t)v106, (uint64_t)CFSTR("LaunchImage"));

  objc_msgSend_badge(self, v108, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v112, (uint64_t)v111, (uint64_t)CFSTR("Badge"));

  objc_msgSend_soundName(self, v113, v114, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v117, (uint64_t)v116, (uint64_t)CFSTR("SoundName"));

  objc_msgSend_category(self, v118, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v122, (uint64_t)v121, (uint64_t)CFSTR("Category"));

  objc_autoreleasePoolPop(v4);
}

- (CKNotification)initWithCoder:(id)a3
{
  id v4;
  CKNotification *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  CKNotificationID *notificationID;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  CKContainerID *containerID;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  CKRecordID *subscriptionOwnerUserRecordID;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSString *subscriptionID;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  NSString *testServerName;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  NSURL *testServerURL;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  NSString *testDeviceID;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  NSString *alertBody;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  NSString *alertLocalizationKey;
  void *v50;
  const char *v51;
  uint64_t v52;
  NSArray *alertLocalizationArgs;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  NSString *title;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  NSString *titleLocalizationKey;
  void *v62;
  const char *v63;
  uint64_t v64;
  NSArray *titleLocalizationArgs;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  NSString *subtitle;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  NSString *subtitleLocalizationKey;
  void *v74;
  const char *v75;
  uint64_t v76;
  NSArray *subtitleLocalizationArgs;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  NSString *alertActionLocalizationKey;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  NSString *alertLaunchImage;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  NSNumber *badge;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  NSString *soundName;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  NSString *category;
  objc_super v99;

  v4 = a3;
  v99.receiver = self;
  v99.super_class = (Class)CKNotification;
  v5 = -[CKNotification init](&v99, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v5->_notificationType = objc_msgSend_decodeInt64ForKey_(v4, v7, (uint64_t)CFSTR("Type"), v8);
    v9 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, (uint64_t)CFSTR("ID"));
    v11 = objc_claimAutoreleasedReturnValue();
    notificationID = v5->_notificationID;
    v5->_notificationID = (CKNotificationID *)v11;

    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("containerID"));
    v15 = objc_claimAutoreleasedReturnValue();
    containerID = v5->_containerID;
    v5->_containerID = (CKContainerID *)v15;

    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("subscriptionOwnerUserRecordID"));
    v19 = objc_claimAutoreleasedReturnValue();
    subscriptionOwnerUserRecordID = v5->_subscriptionOwnerUserRecordID;
    v5->_subscriptionOwnerUserRecordID = (CKRecordID *)v19;

    v5->_isPruned = objc_msgSend_decodeBoolForKey_(v4, v21, (uint64_t)CFSTR("IsPruned"), v22);
    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("SubscriptionID"));
    v25 = objc_claimAutoreleasedReturnValue();
    subscriptionID = v5->_subscriptionID;
    v5->_subscriptionID = (NSString *)v25;

    v27 = objc_opt_class();
    NSStringFromSelector(sel_testServerName);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v27, (uint64_t)v28);
    v30 = objc_claimAutoreleasedReturnValue();
    testServerName = v5->_testServerName;
    v5->_testServerName = (NSString *)v30;

    v32 = objc_opt_class();
    NSStringFromSelector(sel_testServerURL);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v32, (uint64_t)v33);
    v35 = objc_claimAutoreleasedReturnValue();
    testServerURL = v5->_testServerURL;
    v5->_testServerURL = (NSURL *)v35;

    v37 = objc_opt_class();
    NSStringFromSelector(sel_testDeviceID);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v37, (uint64_t)v38);
    v40 = objc_claimAutoreleasedReturnValue();
    testDeviceID = v5->_testDeviceID;
    v5->_testDeviceID = (NSString *)v40;

    v42 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, (uint64_t)CFSTR("AlertBody"));
    v44 = objc_claimAutoreleasedReturnValue();
    alertBody = v5->_alertBody;
    v5->_alertBody = (NSString *)v44;

    v46 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, (uint64_t)CFSTR("AlertLocalizationKey"));
    v48 = objc_claimAutoreleasedReturnValue();
    alertLocalizationKey = v5->_alertLocalizationKey;
    v5->_alertLocalizationKey = (NSString *)v48;

    CKAcceptableValueClasses();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v51, (uint64_t)v50, (uint64_t)CFSTR("AlertLocalizationArgs"));
    v52 = objc_claimAutoreleasedReturnValue();
    alertLocalizationArgs = v5->_alertLocalizationArgs;
    v5->_alertLocalizationArgs = (NSArray *)v52;

    v54 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, (uint64_t)CFSTR("Title"));
    v56 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v56;

    v58 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v58, (uint64_t)CFSTR("TitleLocalizationKey"));
    v60 = objc_claimAutoreleasedReturnValue();
    titleLocalizationKey = v5->_titleLocalizationKey;
    v5->_titleLocalizationKey = (NSString *)v60;

    CKAcceptableValueClasses();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v63, (uint64_t)v62, (uint64_t)CFSTR("TitleLocalizationArgs"));
    v64 = objc_claimAutoreleasedReturnValue();
    titleLocalizationArgs = v5->_titleLocalizationArgs;
    v5->_titleLocalizationArgs = (NSArray *)v64;

    v66 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, (uint64_t)CFSTR("Subtitle"));
    v68 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v68;

    v70 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v71, v70, (uint64_t)CFSTR("SubtitleLocalizationKey"));
    v72 = objc_claimAutoreleasedReturnValue();
    subtitleLocalizationKey = v5->_subtitleLocalizationKey;
    v5->_subtitleLocalizationKey = (NSString *)v72;

    CKAcceptableValueClasses();
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v75, (uint64_t)v74, (uint64_t)CFSTR("SubtitleLocalizationArgs"));
    v76 = objc_claimAutoreleasedReturnValue();
    subtitleLocalizationArgs = v5->_subtitleLocalizationArgs;
    v5->_subtitleLocalizationArgs = (NSArray *)v76;

    v78 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v79, v78, (uint64_t)CFSTR("AlertActionLocalizationKey"));
    v80 = objc_claimAutoreleasedReturnValue();
    alertActionLocalizationKey = v5->_alertActionLocalizationKey;
    v5->_alertActionLocalizationKey = (NSString *)v80;

    v82 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v83, v82, (uint64_t)CFSTR("LaunchImage"));
    v84 = objc_claimAutoreleasedReturnValue();
    alertLaunchImage = v5->_alertLaunchImage;
    v5->_alertLaunchImage = (NSString *)v84;

    v86 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v87, v86, (uint64_t)CFSTR("Badge"));
    v88 = objc_claimAutoreleasedReturnValue();
    badge = v5->_badge;
    v5->_badge = (NSNumber *)v88;

    v90 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v91, v90, (uint64_t)CFSTR("SoundName"));
    v92 = objc_claimAutoreleasedReturnValue();
    soundName = v5->_soundName;
    v5->_soundName = (NSString *)v92;

    v94 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v95, v94, (uint64_t)CFSTR("Category"));
    v96 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v96;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CKNotificationType)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(int64_t)a3
{
  self->_notificationType = a3;
}

- (CKNotificationID)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CKRecordID)subscriptionOwnerUserRecordID
{
  return self->_subscriptionOwnerUserRecordID;
}

- (void)setSubscriptionOwnerUserRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isPruned
{
  return self->_isPruned;
}

- (void)setIsPruned:(BOOL)a3
{
  self->_isPruned = a3;
}

- (CKSubscriptionID)subscriptionID
{
  return self->_subscriptionID;
}

- (NSString)alertBody
{
  return self->_alertBody;
}

- (void)setAlertBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)alertLocalizationKey
{
  return self->_alertLocalizationKey;
}

- (void)setAlertLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)alertLocalizationArgs
{
  return self->_alertLocalizationArgs;
}

- (void)setAlertLocalizationArgs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)titleLocalizationKey
{
  return self->_titleLocalizationKey;
}

- (void)setTitleLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)titleLocalizationArgs
{
  return self->_titleLocalizationArgs;
}

- (void)setTitleLocalizationArgs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)subtitleLocalizationKey
{
  return self->_subtitleLocalizationKey;
}

- (void)setSubtitleLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)subtitleLocalizationArgs
{
  return self->_subtitleLocalizationArgs;
}

- (void)setSubtitleLocalizationArgs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)alertActionLocalizationKey
{
  return self->_alertActionLocalizationKey;
}

- (void)setAlertActionLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)alertLaunchImage
{
  return self->_alertLaunchImage;
}

- (void)setAlertLaunchImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)soundName
{
  return self->_soundName;
}

- (void)setSoundName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)testServerName
{
  return self->_testServerName;
}

- (void)setTestServerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSURL)testServerURL
{
  return self->_testServerURL;
}

- (void)setTestServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)testDeviceID
{
  return self->_testDeviceID;
}

- (void)setTestDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDeviceID, 0);
  objc_storeStrong((id *)&self->_testServerURL, 0);
  objc_storeStrong((id *)&self->_testServerName, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_soundName, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_alertLaunchImage, 0);
  objc_storeStrong((id *)&self->_alertActionLocalizationKey, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizationArgs, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleLocalizationArgs, 0);
  objc_storeStrong((id *)&self->_titleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alertLocalizationArgs, 0);
  objc_storeStrong((id *)&self->_alertLocalizationKey, 0);
  objc_storeStrong((id *)&self->_alertBody, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);
  objc_storeStrong((id *)&self->_subscriptionOwnerUserRecordID, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
}

@end
