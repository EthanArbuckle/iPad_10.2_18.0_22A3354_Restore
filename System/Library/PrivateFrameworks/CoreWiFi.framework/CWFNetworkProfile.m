@implementation CWFNetworkProfile

- (int64_t)disable6EMode
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DE60, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSSet)properties
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_allKeys(self->_internal, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v10;
}

- (int64_t)hiddenState
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E028, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isCarPlay
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;

  if ((objc_msgSend_isCarPlayNetwork(self, a2, v2, v3, v4) & 1) != 0)
    return 1;
  objc_msgSend_carplayUUID(self, v6, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11 != 0;

  return v10;
}

- (int64_t)WAPISubtype
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DFF8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)wasRecently6GHzOnlyOnAnyDevice
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  BOOL v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;

  objc_msgSend_was6GHzOnlyOnAnyDeviceAt(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_lastJoinedByUserAt(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    v17 = v16;
    objc_msgSend_was6GHzOnlyOnAnyDeviceAt(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    if (v17 >= v31)
    {
      objc_msgSend_lastJoinedByUserAt(self, v27, v28, v29, v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v33, v34, v35, v36, v37);
      v39 = v38;
      objc_msgSend_was6GHzOnlyOnAnyDeviceAt(self, v40, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v44, v45, v46, v47, v48);
      v32 = v39 - v49 <= 1209600.0;

    }
    else
    {
      v32 = 1;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BOOL)isAutoJoinDisabled
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E010, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)lowDataMode
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E1C0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isPersonalHotspot
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E118, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isPasspoint
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend_domainName(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (BOOL)isStandalone6G
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E178, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isPublicAirPlayNetwork
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E370, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int)transitionDisabledFlags
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E160, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setBSSList:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend_count(v4, v5, v6, v7, v8) < 0xB)
  {
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v9, (uint64_t)v4, (uint64_t)&unk_1E615E328, v10);
  }
  else
  {
    objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v9, (uint64_t)CFSTR("lastAssociatedAt"), 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v11;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v28, 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingDescriptors_(v4, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subarrayWithRange_(v18, v19, 0, 10, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v22, (uint64_t)v21, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v26, (uint64_t)v25, (uint64_t)&unk_1E615E328, v27);

  }
}

- (int64_t)WEPSubtype
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DFE0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CWFNetworkProfile *v4;
  CWFNetworkProfile *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToNetworkProfile;

  v4 = (CWFNetworkProfile *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToNetworkProfile = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToNetworkProfile = objc_msgSend_isEqualToNetworkProfile_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToNetworkProfile = 0;
  }

  return isEqualToNetworkProfile;
}

- (unint64_t)shortSSID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  if ((objc_msgSend_useCachedShortSSID(self, a2, v2, v3, v4) & 1) == 0)
  {
    objc_msgSend_SSID(self, v6, v7, v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      Apple80211CalculateShortSSIDCopy();
    objc_msgSend_setCachedShortSSID_(self, v10, 0, v11, v12);
    objc_msgSend_setUseCachedShortSSID_(self, v14, 1, v15, v16);

  }
  return objc_msgSend_cachedShortSSID(self, v6, v7, v8, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedNetworkName, 0);
  objc_storeStrong((id *)&self->_cachedIdentifier, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

- (BOOL)isCaptive
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  if (!qword_1ECFD6A58)
    qword_1ECFD6A58 = _sl_dlopen();
  if (!qword_1ECFD6A58)
    return 0;
  objc_msgSend_captiveProfile(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B063EC94((uint64_t)v6, v7, v8, v9, v10);
  objc_msgSend_objectForKeyedSubscript_(v6, v12, v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_BOOLValue(v15, v16, v17, v18, v19);

  return v20;
}

- (unint64_t)was6GHzOnlyAtWeek
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  unint64_t v21;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DEA8, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_unsignedIntegerValue(v5, v6, v7, v8, v9);

  objc_msgSend_was6GHzOnlyAt(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v15, v16, v17, v18, v19);
  v21 = vcvtmd_u64_f64(v20 / 86400.0 / 7.0);

  if (v10 <= v21)
    return v21;
  else
    return v10;
}

- (BOOL)wasCaptive
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
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
  char v23;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char *v30;
  const char *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!qword_1ECFD6A58)
  {
    v32 = xmmword_1E61335D8;
    v33 = 0;
    qword_1ECFD6A58 = _sl_dlopen();
  }
  if (!qword_1ECFD6A58)
    return 0;
  objc_msgSend_captiveProfile(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v6;
  *(_QWORD *)&v32 = 0;
  *((_QWORD *)&v32 + 1) = &v32;
  v33 = 0x2020000000;
  v12 = (uint64_t *)qword_1ECFD6A60;
  v34 = qword_1ECFD6A60;
  if (!qword_1ECFD6A60)
  {
    v13 = sub_1B0665488(v6, v7, v8, v9, v10);
    v12 = (uint64_t *)dlsym(v13, "kCNSNetworkWasCaptiveProperty");
    *(_QWORD *)(*((_QWORD *)&v32 + 1) + 24) = v12;
    qword_1ECFD6A60 = (uint64_t)v12;
  }
  _Block_object_dispose(&v32, 8);
  if (!v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15, v16, v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v26, (uint64_t)"CFStringRef getkCNSNetworkWasCaptiveProperty(void)", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v25, v31, (uint64_t)v29, (uint64_t)CFSTR("CWFNetworkProfile.m"), 32, CFSTR("%s"), v30);

    __break(1u);
  }
  objc_msgSend_objectForKeyedSubscript_(v11, v14, *v12, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_BOOLValue(v18, v19, v20, v21, v22);

  return v23;
}

- (NSString)networkName
{
  CWFNetworkProfile *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend_useCachedNetworkName(v2, v3, v4, v5, v6) & 1) == 0)
  {
    objc_msgSend_SSID(v2, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CWFHumanReadableStringFromData(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCachedNetworkName_(v2, v13, (uint64_t)v12, v14, v15);

    objc_msgSend_setUseCachedNetworkName_(v2, v16, 1, v17, v18);
  }
  objc_msgSend_cachedNetworkName(v2, v7, v8, v9, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSString *)v19;
}

- (CWFNetworkProfile)initWithExternalForm:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CWFNetworkProfile *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t i;
  uint64_t v101;
  CWFBSS *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  id v145;
  CWFNetworkProfile *v146;
  id obj;
  uint64_t v148;
  uint64_t v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[128];
  _BYTE v159[128];
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = (CWFNetworkProfile *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v13)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    objc_msgSend_allKeys(v4, v15, v16, v17, v18);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v154, (uint64_t)v159, 16);
    if (!v149)
      goto LABEL_60;
    v148 = *(_QWORD *)v155;
    v145 = v4;
    v146 = v13;
    while (1)
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v155 != v148)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * v23);
        v25 = objc_msgSend___propertyForKey_(v13, v20, v24, v21, v22);
        if (v25)
        {
          v26 = v25;
          objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v20, v25, v21, v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v14, v28, (uint64_t)v27, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            if (v26 <= 24)
            {
              switch(v26)
              {
                case 2:
                  v41 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = sub_1B064196C(v32);
                  objc_msgSend_numberWithUnsignedInteger_(v41, v43, v42, v44, v45);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v47, 2, v48, v49);
                  goto LABEL_31;
                case 3:
                  v58 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = sub_1B0641BF8(v32);
                  objc_msgSend_numberWithInteger_(v58, v60, v59, v61, v62);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v63, 3, v64, v65);
                  goto LABEL_31;
                case 4:
                  v66 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v67 = sub_1B0641D50(v32);
                  objc_msgSend_numberWithInteger_(v66, v68, v67, v69, v70);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v71, 4, v72, v73);
                  goto LABEL_31;
                case 6:
                  objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend_BOOLValue(v32, v74, v75, v76, v77))
                    v40 = &unk_1E615DE00;
                  else
                    v40 = &unk_1E615DE48;
                  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v78, 6, v79, v80);
                  goto LABEL_52;
                case 11:
                  v81 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v82 = sub_1B0641E54(v32);
                  objc_msgSend_numberWithInteger_(v81, v83, v82, v84, v85);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v86, 11, v87, v88);
                  goto LABEL_31;
                default:
                  goto LABEL_56;
              }
            }
            if (v26 > 38)
            {
              if (v26 != 39)
              {
                if (v26 != 86 && v26 != 88)
                  goto LABEL_56;
                v50 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = sub_1B064360C(v32);
                objc_msgSend_numberWithInteger_(v50, v52, v51, v53, v54);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v55, v26, v56, v57);
LABEL_31:
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v14, v90, (uint64_t)v46, (uint64_t)v89, v91);

LABEL_53:
                goto LABEL_54;
              }
              objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_BOOLValue(v32, v119, v120, v121, v122))
                v40 = &unk_1E615DE00;
              else
                v40 = &unk_1E615DE48;
              objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v123, 39, v124, v125);
            }
            else
            {
              if (v26 != 25)
              {
                if (v26 == 35)
                {
                  objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v150 = 0u;
                  v151 = 0u;
                  v152 = 0u;
                  v153 = 0u;
                  v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v92, (uint64_t)&v150, (uint64_t)v158, 16);
                  if (v93)
                  {
                    v98 = v93;
                    v32 = 0;
                    v99 = *(_QWORD *)v151;
                    do
                    {
                      for (i = 0; i != v98; ++i)
                      {
                        if (*(_QWORD *)v151 != v99)
                          objc_enumerationMutation(v46);
                        v101 = *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * i);
                        v102 = [CWFBSS alloc];
                        v110 = (void *)objc_msgSend_initWithExternalForm_(v102, v103, v101, v104, v105);
                        if (v110)
                        {
                          if (!v32)
                          {
                            objc_msgSend_set(MEMORY[0x1E0C99E20], v106, v107, v108, v109);
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                          }
                          objc_msgSend_addObject_(v32, v106, (uint64_t)v110, v108, v109);
                        }

                      }
                      v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v111, (uint64_t)&v150, (uint64_t)v158, 16);
                    }
                    while (v98);
                  }
                  else
                  {
                    v32 = 0;
                  }
                  v133 = (void *)objc_msgSend_copy(v32, v94, v95, v96, v97);
                  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v134, 35, v135, v136);
                  v137 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setObject_forKeyedSubscript_(v14, v138, (uint64_t)v133, (uint64_t)v137, v139);

                  v4 = v145;
                  v13 = v146;
                }
                else
                {
                  if (v26 == 38)
                  {
                    objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend_BOOLValue(v32, v33, v34, v35, v36))
                      v40 = &unk_1E615DE00;
                    else
                      v40 = &unk_1E615DE48;
                    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v37, 38, v38, v39);
                    goto LABEL_52;
                  }
LABEL_56:
                  objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v128, v26, v129, v130);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setObject_forKeyedSubscript_(v14, v131, (uint64_t)v32, (uint64_t)v46, v132);
                }
                goto LABEL_53;
              }
              objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_BOOLValue(v32, v112, v113, v114, v115))
                v40 = &unk_1E615DE00;
              else
                v40 = &unk_1E615DE48;
              objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v116, 25, v117, v118);
            }
LABEL_52:
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v14, v126, (uint64_t)v40, (uint64_t)v46, v127);
            goto LABEL_53;
          }
        }
LABEL_54:
        ++v23;
      }
      while (v23 != v149);
      v140 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v154, (uint64_t)v159, 16);
      v149 = v140;
      if (!v140)
      {
LABEL_60:

        objc_msgSend_setInternal_(v13, v141, (uint64_t)v14, v142, v143);
        break;
      }
    }
  }

  return v13;
}

- (CWFNetworkProfile)init
{
  CWFNetworkProfile *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *internal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CWFNetworkProfile;
  v2 = -[CWFNetworkProfile init](&v6, sel_init);
  if (!v2
    || (v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]),
        internal = v2->_internal,
        v2->_internal = v3,
        internal,
        !v2->_internal))
  {

    return 0;
  }
  return v2;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___basicDescription(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v6, v12, (uint64_t)v11, v13, v14);

  objc_msgSend_appendString_(v6, v15, (uint64_t)CFSTR(", "), v16, v17);
  objc_msgSend___descriptionForBSSListWithLimit_(self, v18, 3, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v6, v22, (uint64_t)v21, v23, v24);

  if (objc_msgSend_hasSuffix_(v6, v25, (uint64_t)CFSTR(", "), v26, v27))
  {
    v32 = objc_msgSend_length(v6, v28, v29, v30, v31);
    objc_msgSend_deleteCharactersInRange_(v6, v33, v32 - 2, 2, v34);
  }
  return (NSString *)v6;
}

- (NSDate)lastJoinedAt
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  void *v29;
  NSDate *v30;

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], a2, v2, v3, v4);
  v7 = v6;
  objc_msgSend_lastJoinedBySystemAt(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v12, v13, v14, v15, v16);
  if (v21 <= v7)
    v22 = v21;
  else
    v22 = 0.0;
  objc_msgSend_lastJoinedByUserAt(self, v17, v18, v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v23, v24, v25, v26, v27);
  if (v28 > v7)
    v28 = 0.0;
  if (v22 <= v28)
    v29 = v23;
  else
    v29 = v12;
  v30 = v29;

  return v30;
}

- (BOOL)wasMoreRecentlyJoinedByUser
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  BOOL v23;

  objc_msgSend_lastJoinedByUserAt(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v6, v7, v8, v9, v10);
  v12 = v11;
  objc_msgSend_lastJoinedBySystemAt(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v17, v18, v19, v20, v21);
  v23 = v12 > v22;

  return v23;
}

- (NSDate)was6GHzOnlyOnAnyDeviceAt
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  NSDate *v33;

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], a2, v2, v3, v4);
  v7 = v6;
  objc_msgSend_was6GHzOnlyAt(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v12, v13, v14, v15, v16);
  if (v21 <= v7)
    v22 = v21;
  else
    v22 = 0.0;
  v23 = objc_msgSend_was6GHzOnlyAtWeek(self, v17, v18, v19, v20);
  if (v7 >= (double)(unint64_t)(604800 * v23))
  {
    v28 = (double)(unint64_t)(604800 * v23);
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v24, v25, v26, v27, v28);
  }
  else
  {
    v28 = 0.0;
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v24, v25, v26, v27, 0.0);
  }
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v22 > 0.0 || v28 > 0.0)
  {
    if (v22 <= v28)
      v32 = (void *)v29;
    else
      v32 = v12;
    v31 = v32;
  }
  else
  {
    v31 = 0;
  }
  v33 = (NSDate *)v31;

  return v33;
}

- (void)setCoreWiFiSpecificAttributes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CWFNetworkProfile *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  NSMutableDictionary *internal;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;

  v4 = a3;
  objc_msgSend___coreWiFiSpecificProperties(self, v5, v6, v7, v8);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v9 = [CWFNetworkProfile alloc];
  v13 = (void *)objc_msgSend_initWithExternalForm_(v9, v10, (uint64_t)v4, v11, v12);

  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v14, (uint64_t)v34, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E60], v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___filteredNetworkProfileWithProperties_includeRequiredProperties_OSSpecificKeys_(v13, v23, (uint64_t)v17, 0, (uint64_t)v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  internal = self->_internal;
  objc_msgSend_internal(v24, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(internal, v31, (uint64_t)v30, v32, v33);

}

- (id)__filteredNetworkProfileWithProperties:(id)a3 includeRequiredProperties:(BOOL)a4 OSSpecificKeys:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  CWFNetworkProfile *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
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
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v94;
  void *v95;
  CWFNetworkProfile *v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  uint64_t v103;

  v6 = a4;
  v103 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(CWFNetworkProfile);
  v15 = (void *)objc_msgSend_mutableCopy(self->_internal, v11, v12, v13, v14);
  objc_msgSend_properties(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend_mutableCopy(v20, v21, v22, v23, v24);

  if (v6)
  {
    objc_msgSend___requiredProperties(self, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_minusSet_(v25, v31, (uint64_t)v30, v32, v33);

  }
  if (v8)
  {
    objc_msgSend_minusSet_(v25, v26, (uint64_t)v8, v28, v29);
  }
  else
  {
    objc_msgSend___defaultProperties(self, v26, v27, v28, v29);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_minusSet_(v25, v39, (uint64_t)v38, v40, v41);

  }
  objc_msgSend_allObjects(v25, v34, v35, v36, v37);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectsForKeys_(v15, v43, (uint64_t)v42, v44, v45);

  objc_msgSend_setInternal_(v10, v46, (uint64_t)v15, v47, v48);
  v52 = objc_msgSend_containsObject_(v8, v49, (uint64_t)&unk_1E615DE30, v50, v51);
  if (v9 && v52)
  {
    v94 = v25;
    v95 = v15;
    v96 = v10;
    v97 = v8;
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    objc_msgSend_OSSpecificAttributes(self, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v62, v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v98, (uint64_t)v102, 16);
    if (v69)
    {
      v73 = v69;
      v74 = *(_QWORD *)v99;
      do
      {
        for (i = 0; i != v73; ++i)
        {
          if (*(_QWORD *)v99 != v74)
            objc_enumerationMutation(v67);
          v76 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * i);
          if (objc_msgSend_containsObject_(v9, v70, v76, v71, v72))
          {
            objc_msgSend_OSSpecificAttributes(self, v70, v77, v71, v72);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v78, v79, v76, v80, v81);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v57, v83, (uint64_t)v82, v76, v84);

          }
        }
        v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v70, (uint64_t)&v98, (uint64_t)v102, 16);
      }
      while (v73);
    }

    v89 = (void *)objc_msgSend_copy(v57, v85, v86, v87, v88);
    v10 = v96;
    objc_msgSend_setOSSpecificAttributes_(v96, v90, (uint64_t)v89, v91, v92);

    v8 = v97;
    v25 = v94;
    v15 = v95;
  }

  return v10;
}

- (id)__descriptionForBSSListWithLimit:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _QWORD v68[2];

  v68[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v8, (uint64_t)CFSTR("lastAssociatedAt"), 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_BSSList(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)v68, 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingDescriptors_(v15, v19, (uint64_t)v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v22, v23, v24, v25, v26))
  {
    objc_msgSend_appendString_(v7, v27, (uint64_t)CFSTR("bssList=["), v28, v29);
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v34 = objc_msgSend_count(v22, v30, v31, v32, v33);
    v38 = a3;
    if (v34 <= a3)
      v38 = objc_msgSend_count(v22, v35, v36, a3, v37);
    objc_msgSend_subarrayWithRange_(v22, v35, 0, v38, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v63, (uint64_t)v67, 16);
    if (v41)
    {
      v45 = v41;
      v46 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v64 != v46)
            objc_enumerationMutation(v39);
          objc_msgSend_appendFormat_(v7, v42, (uint64_t)CFSTR("(%@), "), v43, v44, *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
        }
        v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v42, (uint64_t)&v63, (uint64_t)v67, 16);
      }
      while (v45);
    }

    if (objc_msgSend_count(v22, v48, v49, v50, v51) > a3)
      objc_msgSend_appendString_(v7, v52, (uint64_t)CFSTR("..., "), v54, v55);
    v56 = objc_msgSend_length(v7, v52, v53, v54, v55);
    objc_msgSend_deleteCharactersInRange_(v7, v57, v56 - 2, 2, v58);
    objc_msgSend_appendString_(v7, v59, (uint64_t)CFSTR("], "), v60, v61);
  }

  return v7;
}

- (void)setOSSpecificAttributes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  int *v43;
  uint64_t v44;
  CWFNetworkProfile *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  int v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = v4;
  if (v4)
  {
    v45 = self;
    v46 = v4;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend_allKeys(v4, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v47, (uint64_t)v59, 16);
    if (v12)
    {
      v17 = v12;
      v18 = 0;
      v19 = *(_QWORD *)v48;
      v20 = MEMORY[0x1E0C81028];
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v48 != v19)
            objc_enumerationMutation(v10);
          v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend_supportedOSSpecificKeys(CWFNetworkProfile, v13, v14, v15, v16, v43, v44);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend_containsObject_(v23, v24, v22, v25, v26);

          if ((v27 & 1) == 0)
          {
            if (!v18)
            {
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15, v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend_addObject_(v18, v13, v22, v15, v16);
            CWFGetOSLog();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              CWFGetOSLog();
              v29 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v30 = v20;
              v29 = v20;
            }

            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              v51 = 136446978;
              v52 = "-[CWFNetworkProfile setOSSpecificAttributes:]";
              v53 = 2082;
              v54 = "CWFNetworkProfile.m";
              v55 = 1024;
              v56 = 2387;
              v57 = 2112;
              v58 = v22;
              LODWORD(v44) = 38;
              v43 = &v51;
              _os_log_send_and_compose_impl();
            }

          }
        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v47, (uint64_t)v59, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }

    if (objc_msgSend_count(v18, v32, v33, v34, v35))
    {
      v9 = v46;
      v31 = (void *)objc_msgSend_mutableCopy(v46, v36, v37, v38, v39);
      objc_msgSend_removeObjectsForKeys_(v31, v40, (uint64_t)v18, v41, v42);
    }
    else
    {
      v31 = 0;
      v9 = v46;
    }
    self = v45;

  }
  else
  {
    v31 = 0;
  }
  if (v31)
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v5, (uint64_t)v31, (uint64_t)&unk_1E615DE30, v8, v43, v44);
  else
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v5, (uint64_t)v9, (uint64_t)&unk_1E615DE30, v8, v43, v44);

}

+ (id)supportedOSSpecificKeys
{
  if (qword_1ECFD6A50 != -1)
    dispatch_once(&qword_1ECFD6A50, &unk_1E6132700);
  return (id)qword_1ECFD6A48;
}

- (void)setSupportedSecurityTypes:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615DE48, v7);

}

- (id)__basicDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
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
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
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
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
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
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t DisconnectReason;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_networkName(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_hasPrefix_(v16, v17, (uint64_t)CFSTR(" "), v18, v19) & 1) != 0
    || objc_msgSend_hasSuffix_(v16, v20, (uint64_t)CFSTR(" "), v21, v22))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("'%@'"), v21, v22, v16);
    v23 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v23;
  }
  objc_msgSend_appendFormat_(v6, v20, (uint64_t)CFSTR("%@ - "), v21, v22, v16);
  objc_msgSend_SSID(self, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  CWFHexadecimalStringFromData(v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v33, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_shortSSID(self, v39, v40, v41, v42);
  objc_msgSend_appendFormat_(v6, v44, (uint64_t)CFSTR("ssid=%@ (%lu), "), v45, v46, v38, v43);

  v51 = objc_msgSend_effectiveSupportedSecurityTypes(self, v47, v48, v49, v50);
  v56 = (const char *)objc_msgSend_WEPSubtype(self, v52, v53, v54, v55);
  v61 = objc_msgSend_WAPISubtype(self, v57, v58, v59, v60);
  sub_1B06248F4(v51, v56, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v65, (uint64_t)CFSTR("security=%@, "), v66, v67, v64);

  objc_msgSend___descriptionForPrivateMAC(self, v68, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v73, (uint64_t)CFSTR("privateMAC=[%@], "), v74, v75, v72);

  if (objc_msgSend_isPasspoint(self, v76, v77, v78, v79))
  {
    objc_msgSend_domainName(self, v80, v81, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_displayedOperatorName(self, v85, v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isServiceProviderRoamingEnabled(self, v90, v91, v92, v93))
      objc_msgSend_appendFormat_(v6, v94, (uint64_t)CFSTR("hs20=[domain=%@, display=%@, sproam=%s], "), v95, v96, v84, v89, "yes");
    else
      objc_msgSend_appendFormat_(v6, v94, (uint64_t)CFSTR("hs20=[domain=%@, display=%@, sproam=%s], "), v95, v96, v84, v89, "no");

  }
  if (objc_msgSend_isAutoJoinDisabled(self, v80, v81, v82, v83))
    objc_msgSend_appendString_(v6, v97, (uint64_t)CFSTR("disabled=yes, "), v99, v100);
  if (objc_msgSend_hiddenState(self, v97, v98, v99, v100) == 1)
    objc_msgSend_appendString_(v6, v101, (uint64_t)CFSTR("hidden=yes, "), v103, v104);
  if ((objc_msgSend_isCaptive(self, v101, v102, v103, v104) & 1) != 0
    || objc_msgSend_wasCaptive(self, v105, v106, v107, v108))
  {
    objc_msgSend___descriptionForCaptiveFlags(self, v105, v106, v107, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v110, (uint64_t)CFSTR("captive=%@, "), v111, v112, v109);

  }
  if (objc_msgSend_isPersonalHotspot(self, v105, v106, v107, v108))
    objc_msgSend_appendString_(v6, v113, (uint64_t)CFSTR("ph=yes, "), v115, v116);
  if (objc_msgSend_isCarPlay(self, v113, v114, v115, v116))
    objc_msgSend_appendString_(v6, v117, (uint64_t)CFSTR("carplay=yes, "), v119, v120);
  if (objc_msgSend_lowDataMode(self, v117, v118, v119, v120) == 1)
    objc_msgSend_appendString_(v6, v121, (uint64_t)CFSTR("lowDataMode=on, "), v123, v124);
  if (objc_msgSend_isStandalone6G(self, v121, v122, v123, v124))
    objc_msgSend_appendString_(v6, v125, (uint64_t)CFSTR("6g-split=yes, "), v127, v128);
  if (objc_msgSend_disable6EMode(self, v125, v126, v127, v128) == 2)
  {
    objc_msgSend_disable6EModeTimestamp(self, v129, v130, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0630E50(v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v135, (uint64_t)CFSTR("6g-mode=[off (%@)], "), v136, v137, v134);

  }
  if (objc_msgSend_wasRecently6GHzOnlyOnAnyDevice(self, v129, v130, v131, v132))
  {
    objc_msgSend_was6GHzOnlyAt(self, v138, v139, v140, v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v143, (uint64_t)CFSTR("6g-only=[yes, (%@)], "), v144, v145, v142);

  }
  objc_msgSend_lastJoinedAt(self, v138, v139, v140, v141);
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  if (v146)
  {
    objc_msgSend_lastJoinedAt(self, v147, v148, v149, v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0630E50(v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_wasMoreRecentlyJoinedByUser(self, v153, v154, v155, v156))
      objc_msgSend_appendFormat_(v6, v157, (uint64_t)CFSTR("assoc=%@ (%s), "), v158, v159, v152, "user");
    else
      objc_msgSend_appendFormat_(v6, v157, (uint64_t)CFSTR("assoc=%@ (%s), "), v158, v159, v152, "auto");

  }
  objc_msgSend_lastDisconnectTimestamp(self, v147, v148, v149, v150);
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  if (v160)
  {
    objc_msgSend_lastDisconnectTimestamp(self, v161, v162, v163, v164);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0630E50(v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    DisconnectReason = objc_msgSend_lastDisconnectReason(self, v167, v168, v169, v170);
    objc_msgSend_appendFormat_(v6, v172, (uint64_t)CFSTR("disassoc=%@ (%d), "), v173, v174, v166, DisconnectReason);

  }
  if (objc_msgSend_isPublicAirPlayNetwork(self, v161, v162, v163, v164))
    objc_msgSend_appendString_(v6, v175, (uint64_t)CFSTR("publicAirPlayNetwork=yes, "), v177, v178);
  objc_msgSend_wasHiddenBefore(self, v175, v176, v177, v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  if (v179)
  {
    objc_msgSend_wasHiddenBefore(self, v180, v181, v182, v183);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0630E50(v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v186, (uint64_t)CFSTR("wasHiddenBefore=%@"), v187, v188, v185);

  }
  if (objc_msgSend_hasSuffix_(v6, v180, (uint64_t)CFSTR(", "), v182, v183))
  {
    v193 = objc_msgSend_length(v6, v189, v190, v191, v192);
    objc_msgSend_deleteCharactersInRange_(v6, v194, v193 - 2, 2, v195);
  }

  return v6;
}

- (unint64_t)supportedSecurityTypes
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DE48, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isEqualToNetworkProfile:(id)a3
{
  void *v3;
  id v5;
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
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
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
  char isEqual;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;

  v5 = a3;
  objc_msgSend_SSID(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v5, v11, v12, v13, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 != v19)
  {
    objc_msgSend_SSID(self, v15, v16, v17, v18);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v108)
    {
      isEqual = 0;
      goto LABEL_32;
    }
    objc_msgSend_SSID(v5, v20, v21, v22, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      isEqual = 0;
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend_SSID(self, v24, v25, v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v5, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v29, v35, (uint64_t)v34, v36, v37))
    {
      isEqual = 0;
LABEL_30:

      goto LABEL_31;
    }
    v105 = v34;
    v106 = v29;
    v107 = v28;
  }
  objc_msgSend_domainName(self, v15, v16, v17, v18);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_domainName(v5, v39, v40, v41, v42);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 != v47)
  {
    objc_msgSend_domainName(self, v43, v44, v45, v46);
    v48 = objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v53 = (void *)v48;
      objc_msgSend_domainName(v5, v49, v50, v51, v52);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        objc_msgSend_domainName(self, v54, v55, v56, v57);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_domainName(v5, v59, v60, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v3, v64, (uint64_t)v63, v65, v66) & 1) != 0)
        {
          v101 = v63;
          v102 = v58;
          v103 = v53;
          goto LABEL_12;
        }

      }
    }

    isEqual = 0;
    goto LABEL_29;
  }
LABEL_12:
  objc_msgSend_internal(self, v43, v44, v45, v46);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_internal(v5, v69, v70, v71, v72);
  v73 = objc_claimAutoreleasedReturnValue();
  if (v68 == (void *)v73)
  {

    isEqual = 1;
    if (v38 == v47)
      goto LABEL_28;
  }
  else
  {
    v78 = (void *)v73;
    v104 = v3;
    objc_msgSend_internal(self, v74, v75, v76, v77);
    v79 = objc_claimAutoreleasedReturnValue();
    if (v79)
    {
      v84 = (void *)v79;
      objc_msgSend_internal(v5, v80, v81, v82, v83);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      if (v85)
      {
        v100 = v85;
        objc_msgSend_internal(self, v86, v87, v88, v89);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_internal(v5, v90, v91, v92, v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v99, v95, (uint64_t)v94, v96, v97);

        v85 = v100;
      }
      else
      {
        isEqual = 0;
      }

    }
    else
    {

      isEqual = 0;
    }
    v3 = v104;
    if (v38 == v47)
      goto LABEL_28;
  }

LABEL_28:
LABEL_29:
  v29 = v106;
  v28 = v107;
  v34 = v105;
  if (v10 != v19)
    goto LABEL_30;
LABEL_32:

  return isEqual;
}

- (NSMutableDictionary)internal
{
  return self->_internal;
}

- (NSData)SSID
{
  uint64_t v2;
  uint64_t v3;

  return (NSData *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DE00, v2, v3);
}

- (NSString)domainName
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DE18, v2, v3);
}

- (NSDate)was6GHzOnlyAt
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DE90, v2, v3);
}

- (BOOL)useCachedShortSSID
{
  return self->_useCachedShortSSID;
}

- (BOOL)useCachedNetworkName
{
  return self->_useCachedNetworkName;
}

- (void)setUserPreferredPasspointDomains:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E2C8, v3);
}

- (void)setUserPreferredNetworkNames:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E2B0, v3);
}

- (void)setUseCachedShortSSID:(BOOL)a3
{
  self->_useCachedShortSSID = a3;
}

- (void)setUseCachedNetworkName:(BOOL)a3
{
  self->_useCachedNetworkName = a3;
}

- (void)setUpdatedAt:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E268, v3);
}

- (void)setTransitionDisabledFlags:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], a2, *(uint64_t *)&a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E160, v7);

}

- (void)setStandalone6G:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E178, v7);

}

- (void)setServiceProviderRoamingEnabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E250, v7);

}

- (void)setSSID:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615DE00, v3);
  *(_WORD *)&self->_useCachedIdentifier = 0;
  self->_useCachedShortSSID = 0;
}

- (void)setRoamingConsortiumList:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E208, v3);
}

- (void)setPublicAttribute:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E3B8, v7);

}

- (void)setPublicAirPlayNetwork:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E370, v7);

}

- (void)setPrivacyProxyEnabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E340, v7);

}

- (void)setPrivacyProxyBlockedReason:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E388, v3);
}

- (void)setPersonalHotspot:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E118, v7);

}

- (void)setPayloadUUID:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E088, v3);
}

- (void)setNetworkGroupPriority:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E2F8, v7);

}

- (void)setNetworkGroupID:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E2E0, v3);
}

- (void)setNANServiceID:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E3E8, v3);
}

- (void)setNAIRealmNameList:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E220, v3);
}

- (void)setMovingAttribute:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E3A0, v7);

}

- (void)setLowDataMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E1C0, v7);

}

- (void)setLastJoinedByUserAt:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E0D0, v3);
}

- (void)setLastJoinedBySystemAt:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E0E8, v3);
}

- (void)setLastDiscoveredAt:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E310, v3);
}

- (void)setInternal:(id)a3
{
  objc_storeStrong((id *)&self->_internal, a3);
}

- (void)setHiddenState:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E028, v7);

}

- (void)setEAPProfile:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E1D8, v3);
}

- (void)setDomainName:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615DE18, v3);
  self->_useCachedIdentifier = 0;
}

- (void)setDisplayedOperatorName:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E1F0, v3);
}

- (void)setDNSHeuristicsFilteredNetwork:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E478, v7);

}

- (void)setDNSHeuristicsFailureStateInfo:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E490, v3);
}

- (void)setCellularNetworkInfo:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E238, v3);
}

- (void)setCarplayUUID:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E280, v3);
}

- (void)setCarplayNetwork:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E298, v7);

}

- (void)setCaptiveProfile:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E058, v3);
}

- (void)setCachedShortSSID:(unint64_t)a3
{
  self->_cachedShortSSID = a3;
}

- (void)setCachedNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_cachedNetworkName, a3);
}

- (void)setBundleID:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E100, v3);
}

- (void)setAutoJoinDisabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E010, v7);

}

- (void)setAddedAt:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E0B8, v3);
}

- (void)setAddReason:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E0A0, v7);

}

- (NSString)payloadUUID
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E088, v2, v3);
}

- (NSDate)lastJoinedByUserAt
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E0D0, v2, v3);
}

- (NSDate)lastJoinedBySystemAt
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E0E8, v2, v3);
}

- (unint64_t)effectiveSupportedSecurityTypes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  void *v15;
  NSObject *v16;
  id v17;

  v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  if (v6 == 16)
    v11 = 80;
  else
    v11 = v6;
  if (v11 == 512)
    v12 = 768;
  else
    v12 = v11;
  v13 = objc_msgSend_transitionDisabledFlags(self, v7, v8, v9, v10);
  if ((v12 & 0x50) != 0 && (v13 & 1) != 0)
  {
    CWFGetOSLog();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      CWFGetOSLog();
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      _os_log_send_and_compose_impl();

    return 64;
  }
  return v12;
}

- (NSString)carplayUUID
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E280, v2, v3);
}

- (NSDictionary)captiveProfile
{
  uint64_t v2;
  uint64_t v3;

  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E058, v2, v3);
}

- (unint64_t)cachedShortSSID
{
  return self->_cachedShortSSID;
}

- (NSString)cachedNetworkName
{
  return self->_cachedNetworkName;
}

- (NSString)bundleID
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E100, v2, v3);
}

- (id)__coreWiFiSpecificProperties
{
  return &unk_1E6160890;
}

- (NSSet)BSSList
{
  uint64_t v2;
  uint64_t v3;

  return (NSSet *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E328, v2, v3);
}

- (id)JSONCompatibleKeyValueMap
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;

  objc_msgSend_externalForm(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_mutableCopy(v6, v7, v8, v9, v10);

  objc_msgSend_networkName(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, (uint64_t)CFSTR("networkName"), v18);

  sub_1B06475A8(v11, 0, 1u);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v19, (uint64_t)v22, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)__defaultProperties
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_set(MEMORY[0x1E0C99E20], a2, v2, v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 93; ++i)
  {
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v5, i, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v11, (uint64_t)v10, v12, v13);

  }
  v15 = (void *)objc_msgSend_copy(v8, v5, v14, v6, v7);

  return v15;
}

- (id)__requiredProperties
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], a2, (uint64_t)&unk_1E6160878, v2, v3);
}

- (id)filteredNetworkProfileWithProperties:(id)a3
{
  return (id)objc_msgSend___filteredNetworkProfileWithProperties_includeRequiredProperties_OSSpecificKeys_(self, a2, (uint64_t)a3, 1, 0);
}

- (id)filteredNetworkProfileWithProperties:(id)a3 OSSpecificKeys:(id)a4
{
  return (id)objc_msgSend___filteredNetworkProfileWithProperties_includeRequiredProperties_OSSpecificKeys_(self, a2, (uint64_t)a3, 1, (uint64_t)a4);
}

- (int64_t)compareSupportedSecurityTypes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v4 = a3;
  v9 = objc_msgSend_weakestSupportedSecurityType(self, v5, v6, v7, v8);
  v14 = objc_msgSend_weakestSupportedSecurityType(v4, v10, v11, v12, v13);
  v19 = objc_msgSend_strongestSupportedSecurityType(self, v15, v16, v17, v18);
  v24 = objc_msgSend_strongestSupportedSecurityType(v4, v20, v21, v22, v23);
  v29 = objc_msgSend_WAPISubtype(self, v25, v26, v27, v28);
  v34 = objc_msgSend_WAPISubtype(v4, v30, v31, v32, v33);
  v39 = objc_msgSend_WEPSubtype(self, v35, v36, v37, v38);
  v44 = objc_msgSend_WEPSubtype(v4, v40, v41, v42, v43);

  if (v9 == v14)
  {
    if (v19 == v24)
      return 0;
    v46 = v19;
    v47 = v39;
    v48 = v29;
    v49 = v24;
  }
  else
  {
    v46 = v9;
    v47 = v39;
    v48 = v29;
    v49 = v14;
  }
  return CWFCompareSecurityType(v46, v47, v48, v49, v44, v34);
}

- (int64_t)compareUserPriority:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int64_t v77;
  uint64_t v78;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;

  v4 = a3;
  objc_msgSend_userPreferredNetworkNames(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userPreferredNetworkNames(v4, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userPreferredPasspointDomains(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userPreferredPasspointDomains(v4, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_domainName(self, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_domainName(v4, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_networkName(self, v35, v36, v37, v38);
  v39 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_networkName(v4, v40, v41, v42, v43);
  v44 = objc_claimAutoreleasedReturnValue();

  v80 = v24;
  objc_msgSend_objectForKeyedSubscript_(v24, v45, (uint64_t)v29, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v19, v49, (uint64_t)v34, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)v39;
  v83 = v14;
  objc_msgSend_objectForKeyedSubscript_(v14, v53, v39, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)v44;
  objc_msgSend_objectForKeyedSubscript_(v9, v57, v44, v58, v59);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v9;
  if (v56 && v48)
  {
    objc_msgSend_laterDate_(v56, v60, (uint64_t)v48, v61, v62);
    v64 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v56)
      v68 = v56;
    else
      v68 = v48;
    v64 = v68;
  }
  v69 = v64;
  v84 = v19;
  if (v63 && v52)
  {
    objc_msgSend_laterDate_(v63, v65, (uint64_t)v52, v66, v67);
    v70 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v63)
      v74 = v63;
    else
      v74 = v52;
    v70 = v74;
  }
  v75 = v70;
  if (v69 && v70)
  {
    v76 = v80;
    v77 = objc_msgSend_compare_(v69, v71, (uint64_t)v70, v72, v73);
  }
  else
  {
    v76 = v80;
    if (v70)
      v78 = -1;
    else
      v78 = 0;
    if (v69)
      v77 = 1;
    else
      v77 = v78;
  }

  return v77;
}

- (id)matchingKnownBSS:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  int isEqual;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend_BSSList(self, v5, v6, v7, v8);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        objc_msgSend_BSSID(v17, v10, v11, v12, v13);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          objc_msgSend_BSSID(v4, v10, v11, v12, v13);
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v25 = (void *)v20;
            objc_msgSend_BSSID(v17, v21, v22, v23, v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_BSSID(v4, v27, v28, v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            isEqual = objc_msgSend_isEqual_(v26, v32, (uint64_t)v31, v33, v34);

            if (isEqual)
            {
              v14 = v17;
              goto LABEL_13;
            }
          }
          else
          {

          }
        }
      }
      v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v38, (uint64_t)v42, 16);
    }
    while (v14);
  }
LABEL_13:

  return v14;
}

- (id)__keyForProperty:(int64_t)a3
{
  __CFString *v3;
  __CFString **v4;

  v3 = 0;
  v4 = CWFNetworkProfilePropertySSIDKey;
  switch(a3)
  {
    case 1:
      goto LABEL_90;
    case 2:
      v4 = CWFNetworkProfilePropertySupportedSecurityTypesKey;
      goto LABEL_90;
    case 3:
      v4 = CWFNetworkProfilePropertyWEPSubtypeKey;
      goto LABEL_90;
    case 4:
      v4 = CWFNetworkProfilePropertyWAPISubtypeKey;
      goto LABEL_90;
    case 5:
      v4 = CWFNetworkProfilePropertyCaptiveProfileKey;
      goto LABEL_90;
    case 6:
      v4 = CWFNetworkProfilePropertyHiddenStateKey;
      goto LABEL_90;
    case 7:
      v4 = CWFNetworkProfilePropertyAutoJoinDisabledKey;
      goto LABEL_90;
    case 8:
      v4 = CWFNetworkProfilePropertyPasswordSharingDisabledKey;
      goto LABEL_90;
    case 9:
      v4 = CWFNetworkProfilePropertyPayloadUUIDKey;
      goto LABEL_90;
    case 10:
      v4 = CWFNetworkProfilePropertyBundleIDKey;
      goto LABEL_90;
    case 11:
      v4 = CWFNetworkProfilePropertyAddReasonKey;
      goto LABEL_90;
    case 12:
      v4 = CWFNetworkProfilePropertyAddedAtKey;
      goto LABEL_90;
    case 13:
      v4 = CWFNetworkProfilePropertyLastJoinedByUserAtKey;
      goto LABEL_90;
    case 14:
      v4 = CWFNetworkProfilePropertyLastJoinedBySystemAtKey;
      goto LABEL_90;
    case 15:
      v4 = CWFNetworkProfilePropertyPersonalHotspotKey;
      goto LABEL_90;
    case 16:
      v4 = CWFNetworkProfilePropertySystemModeKey;
      goto LABEL_90;
    case 18:
      v4 = CWFNetworkProfilePropertyEAPProfileKey;
      goto LABEL_90;
    case 19:
      v4 = CWFNetworkProfilePropertyPasspointDomainNameKey;
      goto LABEL_90;
    case 20:
      v4 = CWFNetworkProfilePropertyPasspointNAIRealmNameListKey;
      goto LABEL_90;
    case 21:
      v4 = CWFNetworkProfilePropertyPasspointRoamingConsortiumListKey;
      goto LABEL_90;
    case 22:
      v4 = CWFNetworkProfilePropertyPasspointCellularNetworkInfoKey;
      goto LABEL_90;
    case 23:
      v4 = CWFNetworkProfilePropertyPasspointServiceProviderRoamingEnabledKey;
      goto LABEL_90;
    case 24:
      v4 = CWFNetworkProfilePropertyPasspointDisplayedOperatorNameKey;
      goto LABEL_90;
    case 25:
      v4 = CWFNetworkProfilePropertyLowDataModeKey;
      goto LABEL_90;
    case 26:
      v4 = CWFNetworkProfilePropertyOSSpecificAttributesKey;
      goto LABEL_90;
    case 27:
      v4 = CWFNetworkProfilePropertyUpdatedAtKey;
      goto LABEL_90;
    case 28:
      v4 = CWFNetworkProfilePropertyCarPlayUUIDKey;
      goto LABEL_90;
    case 29:
      v4 = CWFNetworkProfilePropertyCarPlayNetworkKey;
      goto LABEL_90;
    case 30:
      v4 = CWFNetworkProfilePropertyUserPreferredNetworkNamesKey;
      goto LABEL_90;
    case 31:
      v4 = CWFNetworkProfilePropertyUserPreferredPasspointDomainsKey;
      goto LABEL_90;
    case 32:
      v4 = CWFNetworkProfilePropertyNetworkGroupIDKey;
      goto LABEL_90;
    case 33:
      v4 = CWFNetworkProfilePropertyNetworkGroupPriorityKey;
      goto LABEL_90;
    case 34:
      v4 = CWFNetworkProfilePropertyLastDiscoveredAtKey;
      goto LABEL_90;
    case 35:
      v4 = CWFNetworkProfilePropertyBSSListKey;
      goto LABEL_90;
    case 36:
      v4 = CWFNetworkProfilePropertyPrivacyProxyEnabledKey;
      goto LABEL_90;
    case 37:
      v4 = CWFNetworkProfilePropertyPrivacyProxyBlockedReasonKey;
      goto LABEL_90;
    case 38:
      v4 = CWFNetworkProfilePropertyMovingKey;
      goto LABEL_90;
    case 39:
      v4 = CWFNetworkProfilePropertyPublicKey;
      goto LABEL_90;
    case 40:
      v4 = CWFNetworkProfilePropertyTransitionDisabledFlagsKey;
      goto LABEL_90;
    case 41:
      v4 = CWFNetworkProfilePropertyNearbyShareableStatusKey;
      goto LABEL_90;
    case 42:
      v4 = CWFNetworkProfilePropertyStandalone6GKey;
      goto LABEL_90;
    case 43:
      v4 = CWFNetworkProfilePropertyDisable6EModeKey;
      goto LABEL_90;
    case 44:
      v4 = CWFNetworkProfilePropertyDisable6EModeTimestampKey;
      goto LABEL_90;
    case 45:
      v4 = CWFNetworkProfilePropertyDisableAutojoinUntilFirstUserJoinKey;
      goto LABEL_90;
    case 46:
      v4 = CWFNetworkProfilePropertyNetworkDisabledUntilDateKey;
      goto LABEL_90;
    case 47:
      v4 = CWFNetworkProfilePropertyPasspointHomeOperatorNetworkKey;
      goto LABEL_90;
    case 48:
      v4 = CWFNetworkProfilePropertyPasspointProvisionedNetworkKey;
      goto LABEL_90;
    case 49:
      v4 = CWFNetworkProfilePropertyPasspointAccountNameKey;
      goto LABEL_90;
    case 50:
      v4 = CWFNetworkProfilePropertyHighPopularityKey;
      goto LABEL_90;
    case 51:
      v4 = CWFNetworkProfilePropertyHighQualityKey;
      goto LABEL_90;
    case 52:
      v4 = CWFNetworkProfilePropertyPotentiallyCaptiveKey;
      goto LABEL_90;
    case 53:
      v4 = CWFNetworkProfilePropertyPotentiallyMovingKey;
      goto LABEL_90;
    case 54:
      v4 = CWFNetworkProfilePropertySuspiciousKey;
      goto LABEL_90;
    case 55:
      v4 = CWFNetworkProfilePropertyTCPGoodKey;
      goto LABEL_90;
    case 56:
      v4 = CWFNetworkProfilePropertyLowPopularityKey;
      goto LABEL_90;
    case 57:
      v4 = CWFNetworkProfilePropertyLowQualityKey;
      goto LABEL_90;
    case 58:
      v4 = CWFNetworkProfilePropertyProminentDisplayKey;
      goto LABEL_90;
    case 59:
      v4 = CWFNetworkProfilePropertyPopularityScoreKey;
      goto LABEL_90;
    case 60:
      v4 = CWFNetworkProfilePropertyQualityScoreKey;
      goto LABEL_90;
    case 61:
      v4 = CWFNetworkProfilePropertyTotalNetworkUsageKey;
      goto LABEL_90;
    case 62:
      v4 = CWFNetworkProfilePropertyExpirationDateKey;
      goto LABEL_90;
    case 63:
    case 65:
      v4 = CWFNetworkProfilePropertyNetworkOfInterestHomeStateKey;
      goto LABEL_90;
    case 66:
      v4 = CWFNetworkProfilePropertyNetworkOfInterestWorkStateKey;
      goto LABEL_90;
    case 67:
      v4 = CWFNetworkProfilePropertySSIDHarvestStatusKey;
      goto LABEL_90;
    case 68:
      v4 = CWFNetworkProfilePropertyWalletIdentifierKey;
      goto LABEL_90;
    case 69:
      v4 = CWFNetworkProfilePropertyOTASystemInfoBeaconProbeListKey;
      goto LABEL_90;
    case 70:
      v4 = CWFNetworkProfilePropertySIMIdentifiersKey;
      goto LABEL_90;
    case 71:
      v4 = CWFNetworkProfilePropertyNetworkQualityResponsivenessKey;
      goto LABEL_90;
    case 72:
      v4 = CWFNetworkProfilePropertyNetworkQualityDateKey;
      goto LABEL_90;
    case 73:
      v4 = CWFNetworkProfilePropertyLastDisconnectReasonKey;
      goto LABEL_90;
    case 74:
      v4 = CWFNetworkProfilePropertyLastDisconnectTimestampKey;
      goto LABEL_90;
    case 75:
      v4 = CWFNetworkProfilePropertyNANServiceIDKey;
      goto LABEL_90;
    case 76:
      v4 = CWFNetworkProfilePropertyBlueAtlasNetworkKey;
      goto LABEL_90;
    case 77:
      v4 = CWFNetworkProfilePropertyPublicAirPlayNetworkKey;
      goto LABEL_90;
    case 78:
      v4 = CWFNetworkProfilePropertyLastJoinedBySystemAtWeekKey;
      goto LABEL_90;
    case 79:
      v4 = CWFNetworkProfilePropertyWas6GHzOnlyAtKey;
      goto LABEL_90;
    case 80:
      v4 = CWFNetworkProfilePropertyWas6GHzOnlyAtWeekKey;
      goto LABEL_90;
    case 81:
      v4 = CWFNetworkProfilePropertySeamlessSSIDListKey;
      goto LABEL_90;
    case 82:
      v4 = CWFNetworkProfilePropertyDNSHeuristicsFilteredNetworkKey;
      goto LABEL_90;
    case 83:
      v4 = CWFNetworkProfilePropertyDNSHeuristicsFailureStateInfoKey;
      goto LABEL_90;
    case 84:
      v4 = CWFNetworkProfilePropertyCachedPrivateMACAddressKey;
      goto LABEL_90;
    case 85:
      v4 = CWFNetworkProfilePropertyCachedPrivateMACAddressUpdatedAtKey;
      goto LABEL_90;
    case 86:
      v4 = CWFNetworkProfilePropertyPrivateMACAddressModeUserSettingKey;
      goto LABEL_90;
    case 87:
      v4 = CWFNetworkProfilePropertyPrivateMACAddressModeUserSettingUpdatedAtKey;
      goto LABEL_90;
    case 88:
      v4 = CWFNetworkProfilePropertyPrivateMACAddressModeConfigurationProfileSettingKey;
      goto LABEL_90;
    case 89:
      v4 = CWFNetworkProfilePropertyPrivateMACAddressEvaluationStateKey;
      goto LABEL_90;
    case 90:
      v4 = CWFNetworkProfilePropertyPrivateMACAddressEvaluatedAtKey;
      goto LABEL_90;
    case 91:
      v4 = CWFNetworkProfilePropertyWasHiddenBeforeKey;
      goto LABEL_90;
    case 92:
      v4 = CWFNetworkProfilePropertyDiscoveredDevicesKey;
LABEL_90:
      v3 = *v4;
      break;
    default:
      return v3;
  }
  return v3;
}

- (int64_t)__propertyForKey:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("SSID"), v5, v6) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("SupportedSecurityTypes"), v8, v9) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("WEPSubtype"), v12, v13) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v14, (uint64_t)CFSTR("WAPISubtype"), v15, v16) & 1) != 0)
  {
    v10 = 4;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v17, (uint64_t)CFSTR("CaptiveProfile"), v18, v19) & 1) != 0)
  {
    v10 = 5;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v20, (uint64_t)CFSTR("Hidden"), v21, v22) & 1) != 0)
  {
    v10 = 6;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v23, (uint64_t)CFSTR("AutoJoinDisabled"), v24, v25) & 1) != 0)
  {
    v10 = 7;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v26, (uint64_t)CFSTR("PasswordSharingDisabled"), v27, v28) & 1) != 0)
  {
    v10 = 8;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v29, (uint64_t)CFSTR("PayloadUUID"), v30, v31) & 1) != 0)
  {
    v10 = 9;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v32, (uint64_t)CFSTR("BundleID"), v33, v34) & 1) != 0)
  {
    v10 = 10;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v35, (uint64_t)CFSTR("AddReason"), v36, v37) & 1) != 0)
  {
    v10 = 11;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v38, (uint64_t)CFSTR("AddedAt"), v39, v40) & 1) != 0)
  {
    v10 = 12;
  }
  else
  {
    if ((objc_msgSend_isEqualToString_(v3, v41, (uint64_t)CFSTR("JoinedByUserAt"), v42, v43) & 1) != 0)
      goto LABEL_26;
    if ((objc_msgSend_isEqualToString_(v3, v44, (uint64_t)CFSTR("JoinedBySystemAt"), v45, v46) & 1) != 0)
    {
      v10 = 14;
      goto LABEL_29;
    }
    if ((objc_msgSend_isEqualToString_(v3, v47, (uint64_t)CFSTR("JoinedByUserAt"), v48, v49) & 1) != 0)
    {
LABEL_26:
      v10 = 13;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v51, (uint64_t)CFSTR("PersonalHotspot"), v52, v53) & 1) != 0)
    {
      v10 = 15;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v54, (uint64_t)CFSTR("SystemMode"), v55, v56) & 1) != 0)
    {
      v10 = 16;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v57, (uint64_t)CFSTR("EAPProfile"), v58, v59) & 1) != 0)
    {
      v10 = 18;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v60, (uint64_t)CFSTR("PasspointDomain"), v61, v62) & 1) != 0)
    {
      v10 = 19;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v63, (uint64_t)CFSTR("PasspointNAIRealmList"), v64, v65) & 1) != 0)
    {
      v10 = 20;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v66, (uint64_t)CFSTR("PasspointRCList"), v67, v68) & 1) != 0)
    {
      v10 = 21;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v69, (uint64_t)CFSTR("PasspointCellularNetworkInfo"), v70, v71) & 1) != 0)
    {
      v10 = 22;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v72, (uint64_t)CFSTR("PasspointSPRoamingEnabled"), v73, v74) & 1) != 0)
    {
      v10 = 23;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v75, (uint64_t)CFSTR("PasspointDisplayName"), v76, v77) & 1) != 0)
    {
      v10 = 24;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v78, (uint64_t)CFSTR("LowDataMode"), v79, v80) & 1) != 0)
    {
      v10 = 25;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v81, (uint64_t)CFSTR("__OSSpecific__"), v82, v83) & 1) != 0)
    {
      v10 = 26;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v84, (uint64_t)CFSTR("UpdatedAt"), v85, v86) & 1) != 0)
    {
      v10 = 27;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v87, (uint64_t)CFSTR("CarPlayUUID"), v88, v89) & 1) != 0)
    {
      v10 = 28;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v90, (uint64_t)CFSTR("CarPlayNetwork"), v91, v92) & 1) != 0)
    {
      v10 = 29;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v93, (uint64_t)CFSTR("UserPreferredNetworkNames"), v94, v95) & 1) != 0)
    {
      v10 = 30;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v96, (uint64_t)CFSTR("UserPreferredPasspointDomains"), v97, v98) & 1) != 0)
    {
      v10 = 31;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v99, (uint64_t)CFSTR("NetworkGroupID"), v100, v101) & 1) != 0)
    {
      v10 = 32;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v102, (uint64_t)CFSTR("NetworkGroupPriority"), v103, v104) & 1) != 0)
    {
      v10 = 33;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v105, (uint64_t)CFSTR("LastDiscoveredAt"), v106, v107) & 1) != 0)
    {
      v10 = 34;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v108, (uint64_t)CFSTR("BSSList"), v109, v110) & 1) != 0)
    {
      v10 = 35;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v111, (uint64_t)CFSTR("PrivacyProxyEnabled"), v112, v113) & 1) != 0)
    {
      v10 = 36;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v114, (uint64_t)CFSTR("PrivacyProxyBlockedReason"), v115, v116) & 1) != 0)
    {
      v10 = 37;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v117, (uint64_t)CFSTR("Moving"), v118, v119) & 1) != 0)
    {
      v10 = 38;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v120, (uint64_t)CFSTR("Public"), v121, v122) & 1) != 0)
    {
      v10 = 39;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v123, (uint64_t)CFSTR("BlueAtlasNetwork"), v124, v125) & 1) != 0)
    {
      v10 = 76;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v126, (uint64_t)CFSTR("PublicAirPlayNetwork"), v127, v128) & 1) != 0)
    {
      v10 = 77;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v129, (uint64_t)CFSTR("TransitionDisabledFlags"), v130, v131) & 1) != 0)
    {
      v10 = 40;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v132, (uint64_t)CFSTR("NearbyShareableStatus"), v133, v134) & 1) != 0)
    {
      v10 = 41;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v135, (uint64_t)CFSTR("Standalone6G"), v136, v137) & 1) != 0)
    {
      v10 = 42;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v138, (uint64_t)CFSTR("Disable6EMode"), v139, v140) & 1) != 0)
    {
      v10 = 43;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v141, (uint64_t)CFSTR("Disable6EModeTimestamp"), v142, v143) & 1) != 0)
    {
      v10 = 44;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v144, (uint64_t)CFSTR("DisableAutojoinUntilFirstUserJoin"), v145, v146) & 1) != 0)
    {
      v10 = 45;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v147, (uint64_t)CFSTR("NetworkDisabledUntilDate"), v148, v149) & 1) != 0)
    {
      v10 = 46;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v150, (uint64_t)CFSTR("PasspointHomeOperatorNetwork"), v151, v152) & 1) != 0)
    {
      v10 = 47;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v153, (uint64_t)CFSTR("PasspointProvisionedNetwork"), v154, v155) & 1) != 0)
    {
      v10 = 48;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v156, (uint64_t)CFSTR("PasspointAccountName"), v157, v158) & 1) != 0)
    {
      v10 = 49;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v159, (uint64_t)CFSTR("HighPopularity"), v160, v161) & 1) != 0)
    {
      v10 = 50;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v162, (uint64_t)CFSTR("HighQuality"), v163, v164) & 1) != 0)
    {
      v10 = 51;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v165, (uint64_t)CFSTR("PotentiallyCaptive"), v166, v167) & 1) != 0)
    {
      v10 = 52;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v168, (uint64_t)CFSTR("PotentiallyMoving"), v169, v170) & 1) != 0)
    {
      v10 = 53;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v171, (uint64_t)CFSTR("TCPGood"), v172, v173) & 1) != 0)
    {
      v10 = 55;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v174, (uint64_t)CFSTR("LowPopularity"), v175, v176) & 1) != 0)
    {
      v10 = 56;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v177, (uint64_t)CFSTR("LowQuality"), v178, v179) & 1) != 0)
    {
      v10 = 57;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v180, (uint64_t)CFSTR("ProminentDisplay"), v181, v182) & 1) != 0)
    {
      v10 = 58;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v183, (uint64_t)CFSTR("PopularityScore"), v184, v185) & 1) != 0)
    {
      v10 = 59;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v186, (uint64_t)CFSTR("QualityScore"), v187, v188) & 1) != 0)
    {
      v10 = 60;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v189, (uint64_t)CFSTR("TotalNetworkUsage"), v190, v191) & 1) != 0)
    {
      v10 = 61;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v192, (uint64_t)CFSTR("ExpirationDate"), v193, v194) & 1) != 0)
    {
      v10 = 62;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v195, (uint64_t)CFSTR("HomeForceFixDate"), v196, v197) & 1) != 0)
    {
      v10 = 63;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v198, (uint64_t)CFSTR("LocationOfInterestType"), v199, v200) & 1) != 0)
    {
      v10 = 64;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v201, (uint64_t)CFSTR("NetworkOfInterestHomeState"), v202, v203) & 1) != 0)
    {
      v10 = 65;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v204, (uint64_t)CFSTR("NetworkOfInterestWorkState"), v205, v206) & 1) != 0)
    {
      v10 = 66;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v207, (uint64_t)CFSTR("SSIDHarvestStatus"), v208, v209) & 1) != 0)
    {
      v10 = 67;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v210, (uint64_t)CFSTR("WalletIdentifier"), v211, v212) & 1) != 0)
    {
      v10 = 68;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v213, (uint64_t)CFSTR("OTASystemInfoBeaconProbeList"), v214, v215) & 1) != 0)
    {
      v10 = 69;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v216, (uint64_t)CFSTR("SIMIdentifiers"), v217, v218) & 1) != 0)
    {
      v10 = 70;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v219, (uint64_t)CFSTR("NetworkQualityResponsiveness"), v220, v221) & 1) != 0)
    {
      v10 = 71;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v222, (uint64_t)CFSTR("NetworkQualityDate"), v223, v224) & 1) != 0)
    {
      v10 = 72;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v225, (uint64_t)CFSTR("LastDisconnectReason"), v226, v227) & 1) != 0)
    {
      v10 = 73;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v228, (uint64_t)CFSTR("LastDisconnectTimestamp"), v229, v230) & 1) != 0)
    {
      v10 = 74;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v231, (uint64_t)CFSTR("NANServiceID"), v232, v233) & 1) != 0)
    {
      v10 = 75;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v234, (uint64_t)CFSTR("JoinedBySystemAtWeek"), v235, v236) & 1) != 0)
    {
      v10 = 78;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v237, (uint64_t)CFSTR("Was6GHzOnlyAt"), v238, v239) & 1) != 0)
    {
      v10 = 79;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v240, (uint64_t)CFSTR("Was6GHzOnlyAtWeek"), v241, v242) & 1) != 0)
    {
      v10 = 80;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v243, (uint64_t)CFSTR("SeamlessSSIDList"), v244, v245) & 1) != 0)
    {
      v10 = 81;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v246, (uint64_t)CFSTR("DNSHeuristicsFilteredNetwork"), v247, v248) & 1) != 0
           || (objc_msgSend_isEqualToString_(v3, v249, (uint64_t)CFSTR("FilteredNetwork"), v250, v251) & 1) != 0)
    {
      v10 = 82;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v252, (uint64_t)CFSTR("DNSHeuristicsFailureStateInfo"), v253, v254) & 1) != 0
           || (objc_msgSend_isEqualToString_(v3, v255, (uint64_t)CFSTR("DNSFailures"), v256, v257) & 1) != 0)
    {
      v10 = 83;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v258, (uint64_t)CFSTR("CachedPrivateMACAddress"), v259, v260) & 1) != 0)
    {
      v10 = 84;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v261, (uint64_t)CFSTR("CachedPrivateMACAddressUpdatedAt"), v262, v263) & 1) != 0)
    {
      v10 = 85;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v264, (uint64_t)CFSTR("PrivateMACAddressModeUserSetting"), v265, v266) & 1) != 0)
    {
      v10 = 86;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v267, (uint64_t)CFSTR("PrivateMACAddressModeUserSettingUpdatedAt"), v268, v269) & 1) != 0)
    {
      v10 = 87;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v270, (uint64_t)CFSTR("PrivateMACAddressEvaluationState"), v271, v272) & 1) != 0)
    {
      v10 = 89;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v273, (uint64_t)CFSTR("PrivateMACAddressModeConfigurationProfileSetting"), v274, v275) & 1) != 0)
    {
      v10 = 88;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v276, (uint64_t)CFSTR("PrivateMACAddressEvaluatedAt"), v277, v278) & 1) != 0)
    {
      v10 = 90;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v279, (uint64_t)CFSTR("WasHiddenBefore"), v280, v281) & 1) != 0)
    {
      v10 = 91;
    }
    else if (objc_msgSend_isEqualToString_(v3, v282, (uint64_t)CFSTR("DiscoveredDevices"), v283, v284))
    {
      v10 = 92;
    }
    else
    {
      v10 = 0;
    }
  }
LABEL_29:

  return v10;
}

- (id)externalForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
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
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t i;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  uint64_t v162;
  _BYTE v163[128];
  _BYTE v164[128];
  uint64_t v165;

  v165 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  objc_msgSend_allKeys(self->_internal, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v158, (uint64_t)v164, 16);
  if (v13)
  {
    v18 = v13;
    v19 = MEMORY[0x1E0C9AAA0];
    v153 = *(_QWORD *)v159;
    v149 = v11;
    v150 = v6;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v159 != v153)
          objc_enumerationMutation(v11);
        v21 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * v20);
        v22 = objc_msgSend_integerValue(v21, v14, v15, v16, v17);
        objc_msgSend___keyForProperty_(self, v23, v22, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend_integerValue(v21, v27, v28, v29, v30);
        if (v26)
        {
          switch(v31)
          {
            case 2:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = objc_msgSend_unsignedIntegerValue(v35, v70, v71, v72, v73);
              sub_1B06417B8(v74, v75, v76, v77, v78);
              v67 = objc_claimAutoreleasedReturnValue();
              goto LABEL_28;
            case 3:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = objc_msgSend_integerValue(v35, v79, v80, v81, v82);
              sub_1B0641BA0(v83, v84, v85, v86, v87);
              v67 = objc_claimAutoreleasedReturnValue();
              goto LABEL_28;
            case 4:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = objc_msgSend_integerValue(v35, v88, v89, v90, v91);
              sub_1B0641CF8(v92, v93, v94, v95, v96);
              v67 = objc_claimAutoreleasedReturnValue();
              goto LABEL_28;
            case 6:
            case 25:
            case 38:
            case 39:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend_integerValue(v50, v51, v52, v53, v54);

              if (v55)
              {
                if (v55 == 1)
                  objc_msgSend_setObject_forKeyedSubscript_(v6, v56, MEMORY[0x1E0C9AAB0], (uint64_t)v26, v57);
                else
                  objc_msgSend_setObject_forKeyedSubscript_(v6, v56, v19, (uint64_t)v26, v57);
              }
              break;
            case 7:
            case 8:
            case 15:
            case 16:
            case 29:
            case 42:
            case 45:
            case 47:
            case 48:
            case 50:
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
            case 56:
            case 57:
            case 58:
            case 76:
            case 77:
            case 82:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend_BOOLValue(v35, v36, v37, v38, v39))
                goto LABEL_14;
              goto LABEL_13;
            case 11:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = objc_msgSend_integerValue(v35, v97, v98, v99, v100);
              sub_1B0641DFC(v101, v102, v103, v104, v105);
              v67 = objc_claimAutoreleasedReturnValue();
              goto LABEL_28;
            case 20:
            case 21:
            case 22:
            case 26:
            case 30:
            case 31:
            case 69:
            case 70:
            case 81:
            case 83:
            case 92:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_count(v35, v46, v47, v48, v49))
                goto LABEL_13;
              goto LABEL_14;
            case 23:
            case 36:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend_BOOLValue(v35, v58, v59, v60, v61) & 1) != 0)
                goto LABEL_14;
              goto LABEL_13;
            case 33:
            case 40:
            case 41:
            case 43:
            case 59:
            case 60:
            case 61:
            case 64:
            case 65:
            case 66:
            case 67:
            case 73:
            case 78:
            case 80:
            case 89:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend_unsignedIntegerValue(v35, v42, v43, v44, v45))
                goto LABEL_14;
LABEL_13:
              objc_msgSend_setObject_forKeyedSubscript_(v6, v40, (uint64_t)v35, (uint64_t)v26, v41);
              goto LABEL_14;
            case 35:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v108, (uint64_t)CFSTR("BSSID"), 0, v109);
              v110 = objc_claimAutoreleasedReturnValue();
              v154 = 0u;
              v155 = 0u;
              v156 = 0u;
              v157 = 0u;
              v151 = (void *)v110;
              v162 = v110;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v111, (uint64_t)&v162, 1, v112);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              v152 = v107;
              objc_msgSend_sortedArrayUsingDescriptors_(v107, v114, (uint64_t)v113, v115, v116);
              v117 = (void *)objc_claimAutoreleasedReturnValue();

              v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v118, (uint64_t)&v154, (uint64_t)v163, 16);
              if (v119)
              {
                v124 = v119;
                v125 = 0;
                v126 = *(_QWORD *)v155;
                do
                {
                  for (i = 0; i != v124; ++i)
                  {
                    if (*(_QWORD *)v155 != v126)
                      objc_enumerationMutation(v117);
                    objc_msgSend_externalForm(*(void **)(*((_QWORD *)&v154 + 1) + 8 * i), v120, v121, v122, v123);
                    v132 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v132)
                    {
                      if (!v125)
                      {
                        objc_msgSend_array(MEMORY[0x1E0C99DE8], v128, v129, v130, v131);
                        v125 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      objc_msgSend_addObject_(v125, v128, (uint64_t)v132, v130, v131);
                    }

                  }
                  v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v120, (uint64_t)&v154, (uint64_t)v163, 16);
                }
                while (v124);
              }
              else
              {
                v125 = 0;
              }

              v139 = (void *)objc_msgSend_copy(v125, v135, v136, v137, v138);
              v6 = v150;
              objc_msgSend_setObject_forKeyedSubscript_(v150, v140, (uint64_t)v139, (uint64_t)v26, v141);

              v11 = v149;
              v19 = MEMORY[0x1E0C9AAA0];
              break;
            case 86:
            case 88:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend_integerValue(v35, v62, v63, v64, v65);
              sub_1B06435E8(v66);
              v67 = objc_claimAutoreleasedReturnValue();
LABEL_28:
              v106 = (void *)v67;
              objc_msgSend_setObject_forKeyedSubscript_(v6, v68, v67, (uint64_t)v26, v69);

              goto LABEL_14;
            default:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v6, v133, (uint64_t)v35, (uint64_t)v26, v134);
LABEL_14:

              break;
          }
        }

        ++v20;
      }
      while (v20 != v18);
      v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v158, (uint64_t)v164, 16);
      v18 = v142;
    }
    while (v142);
  }

  v147 = (void *)objc_msgSend_copy(v6, v143, v144, v145, v146);
  return v147;
}

- (void)mergeWithNetworkProfile:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSMutableDictionary *internal;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  internal = self->_internal;
  objc_msgSend_internal(a3, a2, (uint64_t)a3, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(internal, v6, (uint64_t)v9, v7, v8);

}

- (id)coreWiFiSpecificAttributes
{
  uint64_t v2;
  uint64_t v3;
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
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  objc_msgSend___coreWiFiSpecificProperties(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E60], v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___filteredNetworkProfileWithProperties_includeRequiredProperties_OSSpecificKeys_(self, v16, (uint64_t)v10, 0, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_externalForm(v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)changedPropertiesFromNetworkProfile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CWFNetworkProfile *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CWFNetworkProfile *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
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
  uint64_t i;
  uint64_t v45;
  void *v46;
  const char *v47;
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
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  char isEqual;
  id v144;
  id obj;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _BYTE v154[128];
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_externalForm(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = [CWFNetworkProfile alloc];
  v137 = (void *)v9;
  v14 = (void *)objc_msgSend_initWithExternalForm_(v10, v11, v9, v12, v13);
  v138 = v4;
  objc_msgSend_externalForm(v4, v15, v16, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = [CWFNetworkProfile alloc];
  v136 = (void *)v19;
  v24 = (void *)objc_msgSend_initWithExternalForm_(v20, v21, v19, v22, v23);
  objc_msgSend_set(MEMORY[0x1E0C99E20], v25, v26, v27, v28);
  v144 = (id)objc_claimAutoreleasedReturnValue();
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  objc_msgSend_internal(v14, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v33, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v38;
  v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v150, (uint64_t)v154, 16);
  if (v148)
  {
    v147 = *(_QWORD *)v151;
    v139 = v24;
    v140 = v14;
    do
    {
      for (i = 0; i != v148; ++i)
      {
        if (*(_QWORD *)v151 != v147)
          objc_enumerationMutation(obj);
        v45 = *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * i);
        objc_msgSend_internal(v14, v40, v41, v42, v43);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v46, v47, v45, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_internal(v24, v51, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v55, v56, v45, v57, v58);
        v59 = objc_claimAutoreleasedReturnValue();
        if (v50 == (void *)v59)
        {

          continue;
        }
        v64 = (void *)v59;
        v149 = v46;
        objc_msgSend_internal(v14, v60, v61, v62, v63);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v65, v66, v45, v67, v68);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v73)
          goto LABEL_13;
        v74 = v24;
        objc_msgSend_internal(v24, v69, v70, v71, v72);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v146, v75, v45, v76, v77);
        v78 = objc_claimAutoreleasedReturnValue();
        if (!v78)
        {

LABEL_13:
LABEL_14:
          objc_msgSend_addObject_(v144, v40, v45, v42, v43);
          continue;
        }
        v142 = (void *)v78;
        objc_msgSend_internal(v14, v79, v80, v81, v82);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v141, v83, v45, v84, v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_internal(v74, v87, v88, v89, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v91, v92, v45, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v86, v96, (uint64_t)v95, v97, v98);

        v14 = v140;
        v24 = v139;
        if ((isEqual & 1) == 0)
          goto LABEL_14;
      }
      v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v150, (uint64_t)v154, 16);
    }
    while (v148);
  }

  v99 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend_internal(v24, v100, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v104, v105, v106, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v99, v110, (uint64_t)v109, v111, v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  v114 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend_internal(v14, v115, v116, v117, v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v119, v120, v121, v122, v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v114, v125, (uint64_t)v124, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v113, v129, (uint64_t)v128, v130, v131);

  objc_msgSend_unionSet_(v144, v132, (uint64_t)v113, v133, v134);
  return v144;
}

- (id)changedOSSpecificKeysFromNetworkProfile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CWFNetworkProfile *v15;
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
  uint64_t v28;
  CWFNetworkProfile *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
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
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  char isEqual;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_set(MEMORY[0x1E0C99E20], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_externalForm(self, v10, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = [CWFNetworkProfile alloc];
  v109 = (void *)v14;
  v108 = (void *)objc_msgSend_initWithExternalForm_(v15, v16, v14, v17, v18);
  objc_msgSend_OSSpecificAttributes(v108, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v4;
  objc_msgSend_externalForm(v4, v24, v25, v26, v27);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = [CWFNetworkProfile alloc];
  v107 = (void *)v28;
  v106 = (void *)objc_msgSend_initWithExternalForm_(v29, v30, v28, v31, v32);
  objc_msgSend_OSSpecificAttributes(v106, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  objc_msgSend_allKeys(v23, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v116, (uint64_t)v120, 16);
  if (v115)
  {
    v47 = *(_QWORD *)v117;
    v111 = v42;
    v112 = v37;
    v113 = *(_QWORD *)v117;
    do
    {
      for (i = 0; i != v115; ++i)
      {
        if (*(_QWORD *)v117 != v47)
          objc_enumerationMutation(v42);
        v49 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v23, v44, v49, v45, v46);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v37, v51, v49, v52, v53);
        v54 = objc_claimAutoreleasedReturnValue();
        if (v50 == (void *)v54)
        {

          continue;
        }
        v58 = (void *)v54;
        objc_msgSend_objectForKeyedSubscript_(v23, v55, v49, v56, v57);
        v59 = objc_claimAutoreleasedReturnValue();
        if (!v59)
          goto LABEL_13;
        v63 = (void *)v59;
        objc_msgSend_objectForKeyedSubscript_(v37, v60, v49, v61, v62);
        v64 = objc_claimAutoreleasedReturnValue();
        if (!v64)
        {

          v47 = v113;
LABEL_13:

LABEL_14:
          objc_msgSend_addObject_(v9, v44, v49, v45, v46);
          continue;
        }
        v68 = (void *)v64;
        objc_msgSend_objectForKeyedSubscript_(v23, v65, v49, v66, v67);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v37, v70, v49, v71, v72);
        v73 = v23;
        v74 = v9;
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v69, v76, (uint64_t)v75, v77, v78);

        v9 = v74;
        v23 = v73;
        v37 = v112;

        v42 = v111;
        v47 = v113;
        if ((isEqual & 1) == 0)
          goto LABEL_14;
      }
      v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v44, (uint64_t)&v116, (uint64_t)v120, 16);
    }
    while (v115);
  }

  v79 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend_allKeys(v37, v80, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v79, v85, (uint64_t)v84, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend_allKeys(v23, v90, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v89, v95, (uint64_t)v94, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v88, v99, (uint64_t)v98, v100, v101);

  objc_msgSend_unionSet_(v9, v102, (uint64_t)v88, v103, v104);
  return v9;
}

- (void)setDisable6EMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615DE60, v7);

}

- (NSDate)disable6EModeTimestamp
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DE78, v2, v3);
}

- (void)setDisable6EModeTimestamp:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615DE78, v3);
}

- (BOOL)isAmbiguousNetworkName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;

  objc_msgSend_networkName(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = sub_1B06428B0(v5, v6, v7, v8, v9);

  return v10;
}

- (void)setWEPSubtype:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615DFE0, v7);

}

- (void)setWAPISubtype:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615DFF8, v7);

}

- (BOOL)isOpen
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((unint64_t)objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) >> 9) & 1;
}

- (BOOL)isOWE
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((unint64_t)objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) >> 8) & 1;
}

- (BOOL)isWEP
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 1;
}

- (BOOL)isWAPI
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((unint64_t)objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) >> 1) & 1;
}

- (BOOL)isWPA
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0xC) != 0;
}

- (BOOL)isWPA2
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0x30) != 0;
}

- (BOOL)isWPA3
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0xC0) != 0;
}

- (BOOL)isPSK
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  BOOL result;
  uint64_t v13;

  v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  v11 = v6;
  if ((v6 & 1) == 0)
  {
    if ((v6 & 2) != 0)
      return 1;
    return (v11 & 0x14) != 0 || (v11 & 0x40) != 0;
  }
  v13 = objc_msgSend_WEPSubtype(self, v7, v8, v9, v10);
  result = 1;
  if ((v11 & 2) == 0 && v13 == 5)
    return (v11 & 0x14) != 0 || (v11 & 0x40) != 0;
  return result;
}

- (BOOL)isEAP
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  BOOL result;
  uint64_t v13;

  v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  v11 = v6;
  if ((v6 & 1) == 0)
  {
    if ((v6 & 8) != 0)
      return 1;
    return (v11 & 0x20) != 0 || v11 < 0;
  }
  v13 = objc_msgSend_WEPSubtype(self, v7, v8, v9, v10);
  result = 1;
  if ((v11 & 8) == 0 && v13 != 5)
    return (v11 & 0x20) != 0 || v11 < 0;
  return result;
}

- (unint64_t)strongestSupportedSecurityType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  v11 = objc_msgSend_WAPISubtype(self, v7, v8, v9, v10);
  v16 = objc_msgSend_WEPSubtype(self, v12, v13, v14, v15);
  return CWFStrongestSecurityType(v6, v11, v16);
}

- (unint64_t)weakestSupportedSecurityType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  v11 = objc_msgSend_WAPISubtype(self, v7, v8, v9, v10);
  v16 = objc_msgSend_WEPSubtype(self, v12, v13, v14, v15);
  return CWFWeakestSecurityType(v6, v11, v16);
}

- (NSDate)wasHiddenBefore
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E040, v2, v3);
}

- (void)setWasHiddenBefore:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E040, v3);
}

- (BOOL)isCaptiveStateDetermined
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;

  if (!qword_1ECFD6A58)
    qword_1ECFD6A58 = _sl_dlopen();
  if (!qword_1ECFD6A58)
    return 0;
  objc_msgSend_captiveProfile(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B063EC94((uint64_t)v6, v7, v8, v9, v10);
  objc_msgSend_objectForKeyedSubscript_(v6, v12, v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 != 0;

  return v16;
}

- (BOOL)bypassCaptive
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
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
  char v23;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char *v30;
  const char *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!qword_1ECFD6A58)
  {
    v32 = xmmword_1E61335D8;
    v33 = 0;
    qword_1ECFD6A58 = _sl_dlopen();
  }
  if (!qword_1ECFD6A58)
    return 0;
  objc_msgSend_captiveProfile(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v6;
  *(_QWORD *)&v32 = 0;
  *((_QWORD *)&v32 + 1) = &v32;
  v33 = 0x2020000000;
  v12 = (uint64_t *)qword_1ECFD6A68;
  v34 = qword_1ECFD6A68;
  if (!qword_1ECFD6A68)
  {
    v13 = sub_1B0665488(v6, v7, v8, v9, v10);
    v12 = (uint64_t *)dlsym(v13, "kCNSCaptiveBypassProperty");
    *(_QWORD *)(*((_QWORD *)&v32 + 1) + 24) = v12;
    qword_1ECFD6A68 = (uint64_t)v12;
  }
  _Block_object_dispose(&v32, 8);
  if (!v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15, v16, v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v26, (uint64_t)"CFStringRef getkCNSCaptiveBypassProperty(void)", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v25, v31, (uint64_t)v29, (uint64_t)CFSTR("CWFNetworkProfile.m"), 33, CFSTR("%s"), v30);

    __break(1u);
  }
  objc_msgSend_objectForKeyedSubscript_(v11, v14, *v12, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_BOOLValue(v18, v19, v20, v21, v22);

  return v23;
}

- (NSDate)captiveWebsheetLoginDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char *v25;
  const char *v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!qword_1ECFD6A58)
  {
    v27 = xmmword_1E61335D8;
    v28 = 0;
    qword_1ECFD6A58 = _sl_dlopen();
  }
  if (qword_1ECFD6A58)
  {
    objc_msgSend_captiveProfile(self, a2, v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v6;
    *(_QWORD *)&v27 = 0;
    *((_QWORD *)&v27 + 1) = &v27;
    v28 = 0x2020000000;
    v12 = (uint64_t *)qword_1ECFD6A70;
    v29 = qword_1ECFD6A70;
    if (!qword_1ECFD6A70)
    {
      v13 = sub_1B0665488(v6, v7, v8, v9, v10);
      v12 = (uint64_t *)dlsym(v13, "kCNSCaptiveNetworkWebSheetLoginDateProperty");
      *(_QWORD *)(*((_QWORD *)&v27 + 1) + 24) = v12;
      qword_1ECFD6A70 = (uint64_t)v12;
    }
    _Block_object_dispose(&v27, 8);
    if (!v12)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15, v16, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v21, (uint64_t)"CFStringRef getkCNSCaptiveNetworkWebSheetLoginDateProperty(void)", v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = dlerror();
      objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v20, v26, (uint64_t)v24, (uint64_t)CFSTR("CWFNetworkProfile.m"), 34, CFSTR("%s"), v25);

      __break(1u);
    }
    objc_msgSend_objectForKeyedSubscript_(v11, v14, *v12, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  return (NSDate *)v18;
}

- (BOOL)isPasswordSharingSupported
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  return (objc_msgSend_isOpen(self, a2, v2, v3, v4) & 1) == 0
      && (objc_msgSend_isWAPI(self, v6, v7, v8, v9) & 1) == 0
      && (objc_msgSend_isWEP(self, v10, v11, v12, v13) & 1) == 0
      && (objc_msgSend_isEAP(self, v14, v15, v16, v17) & 1) == 0
      && (objc_msgSend_isProfileBased(self, v18, v19, v20, v21) & 1) == 0
      && !objc_msgSend_isOWE(self, v22, v23, v24, v25);
}

- (BOOL)isPasswordSharingDisabled
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E070, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPasswordSharingDisabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E070, v7);

}

- (BOOL)isProfileBased
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend_payloadUUID(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (int64_t)addReason
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E0A0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSDate)addedAt
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E0B8, v2, v3);
}

- (NSDate)lastJoinedOnAnyDeviceAt
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v34;
  id v35;
  uint64_t JoinedBySystemAtWeek;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  NSDate *v46;

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], a2, v2, v3, v4);
  v7 = v6;
  objc_msgSend_lastJoinedAt(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v12, v13, v14, v15, v16);
  v18 = v17;
  objc_msgSend_lastDisconnectTimestamp(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v23, v24, v25, v26, v27);
  if (v18 <= v7 && v32 <= v7)
  {
    v34 = v32;
    if (v32 <= v18)
    {
      v34 = v18;
    }
    else
    {
      v35 = v23;

      v12 = v35;
    }
  }
  else
  {
    v34 = 0.0;
  }
  JoinedBySystemAtWeek = objc_msgSend_lastJoinedBySystemAtWeek(self, v28, v29, v30, v31);
  if (v7 >= (double)(unint64_t)(604800 * JoinedBySystemAtWeek))
  {
    v41 = (double)(unint64_t)(604800 * JoinedBySystemAtWeek);
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v37, v38, v39, v40, v41);
  }
  else
  {
    v41 = 0.0;
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v37, v38, v39, v40, 0.0);
  }
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v42;
  if (v34 > 0.0 || v41 > 0.0)
  {
    if (v34 <= v41)
      v45 = (void *)v42;
    else
      v45 = v12;
    v44 = v45;
  }
  else
  {
    v44 = 0;
  }
  v46 = (NSDate *)v44;

  return v46;
}

- (BOOL)isAppBased
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend_bundleID(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (BOOL)isHotspot
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  if ((objc_msgSend_isCaptive(self, a2, v2, v3, v4) & 1) != 0
    || (objc_msgSend_isPasspoint(self, v6, v7, v8, v9) & 1) != 0)
  {
    return 1;
  }
  objc_msgSend_acceptedEAPTypes(self, v10, v11, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_containsObject_(v15, v16, (uint64_t)&unk_1E615E130, v17, v18) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend_acceptedEAPTypes(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_containsObject_(v23, v24, (uint64_t)&unk_1E615E148, v25, v26);

  }
  return v14;
}

- (BOOL)isSystemMode
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E190, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setSystemMode:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E190, v7);

}

- (BOOL)isSessionBased
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E1A8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setSessionBased:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E1A8, v7);

}

- (NSDictionary)EAPProfile
{
  uint64_t v2;
  uint64_t v3;

  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E1D8, v2, v3);
}

- (NSArray)acceptedEAPTypes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_EAPProfile(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("AcceptEAPTypes"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (NSArray)innerAcceptedEAPTypes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_EAPProfile(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("InnerAcceptEAPTypes"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (BOOL)isTLSCertificateRequired
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  objc_msgSend_EAPProfile(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("TLSCertificateIsRequired"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

- (NSArray)TLSTrustedServerNames
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_EAPProfile(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("TLSTrustedServerNames"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (NSString)displayedOperatorName
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E1F0, v2, v3);
}

- (NSArray)roamingConsortiumList
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E208, v2, v3);
}

- (NSArray)NAIRealmNameList
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E220, v2, v3);
}

- (NSArray)cellularNetworkInfo
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E238, v2, v3);
}

- (BOOL)isServiceProviderRoamingEnabled
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E250, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  if (v4)
    v10 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);
  else
    v10 = 1;

  return v10;
}

- (void)setOSSpecificValue:(id)a3 forKey:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  id v32;

  v6 = a3;
  v11 = a4;
  if (v11
    && (objc_msgSend_supportedOSSpecificKeys(CWFNetworkProfile, v7, v8, v9, v10),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend_containsObject_(v12, v13, (uint64_t)v11, v14, v15),
        v12,
        v16))
  {
    objc_msgSend_objectForKeyedSubscript_(self->_internal, v17, (uint64_t)&unk_1E615DE30, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && !v20)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v26, (uint64_t)v25, (uint64_t)&unk_1E615DE30, v27);

    }
    objc_msgSend_objectForKeyedSubscript_(self->_internal, v21, (uint64_t)&unk_1E615DE30, v23, v24);
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v28, v29, (uint64_t)v6, (uint64_t)v11, v30);
  }
  else
  {
    CWFGetOSLog();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      CWFGetOSLog();
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = MEMORY[0x1E0C81028];
      v32 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      _os_log_send_and_compose_impl();
  }

}

- (id)OSSpecificValueForKey:(id)a3
{
  NSMutableDictionary *internal;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if (a3)
  {
    internal = self->_internal;
    v4 = a3;
    objc_msgSend_objectForKeyedSubscript_(internal, v5, (uint64_t)&unk_1E615DE30, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (NSDictionary)OSSpecificAttributes
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DE30, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_copy(v4, v5, v6, v7, v8);

  return (NSDictionary *)v9;
}

- (id)identifier
{
  CWFNetworkProfile *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;

  v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend_useCachedIdentifier(v2, v3, v4, v5, v6) & 1) == 0)
  {
    if (objc_msgSend_isPasspoint(v2, v7, v8, v9, v10))
    {
      objc_msgSend_domainName(v2, v11, v12, v13, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
LABEL_11:

        objc_msgSend_setUseCachedIdentifier_(v2, v44, 1, v45, v46);
        goto LABEL_12;
      }
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("wifi.network.passpoint.%@"), v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCachedIdentifier_(v2, v20, (uint64_t)v19, v21, v22);
    }
    else
    {
      objc_msgSend_networkName(v2, v11, v12, v13, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v23, (uint64_t)CFSTR("wifi.network.ssid.%@"), v25, v26, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCachedIdentifier_(v2, v27, (uint64_t)v19, v28, v29);
      }
      else
      {
        objc_msgSend_SSID(v2, v23, v24, v25, v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v30;
        if (v30)
        {
          v35 = (void *)MEMORY[0x1E0CB3940];
          CWFHexadecimalStringFromData(v30, v31, v32, v33, v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v35, v37, (uint64_t)CFSTR("wifi.network.ssid.%@"), v38, v39, v36);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setCachedIdentifier_(v2, v41, (uint64_t)v40, v42, v43);

        }
        v18 = 0;
      }
    }

    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend_cachedIdentifier(v2, v7, v8, v9, v10);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v47;
}

- (NSDate)updatedAt
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E268, v2, v3);
}

- (BOOL)isCarPlayNetwork
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E298, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSDictionary)userPreferredNetworkNames
{
  uint64_t v2;
  uint64_t v3;

  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E2B0, v2, v3);
}

- (NSDictionary)userPreferredPasspointDomains
{
  uint64_t v2;
  uint64_t v3;

  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E2C8, v2, v3);
}

- (NSString)networkGroupID
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E2E0, v2, v3);
}

- (unint64_t)networkGroupPriority
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E2F8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSDate)lastDiscoveredAt
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E310, v2, v3);
}

- (BOOL)isPrivacyProxyEnabled
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E340, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  if (v4)
    v10 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);
  else
    v10 = 1;

  return v10;
}

- (void)setBlueAtlasNetwork:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E358, v7);

}

- (BOOL)isBlueAtlasNetwork
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E358, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)privacyProxyBlockedReason
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E388, v2, v3);
}

- (int64_t)movingAttribute
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E3A0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)publicAttribute
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E3B8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)nearbyShareableStatus
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E3D0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setNearbyShareableStatus:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E3D0, v7);

}

- (NSString)NANServiceID
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E3E8, v2, v3);
}

- (BOOL)isAllowedInLockdownMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  return (objc_msgSend_isOpen(self, a2, v2, v3, v4) & 1) == 0
      && (objc_msgSend_isOWE(self, v6, v7, v8, v9) & 1) == 0
      && (!objc_msgSend_isWEP(self, v10, v11, v12, v13)
       || (objc_msgSend_isPSK(self, v14, v15, v16, v17) & 1) == 0)
      && (!objc_msgSend_isWPA(self, v14, v15, v16, v17)
       || (objc_msgSend_isPSK(self, v18, v19, v20, v21) & 1) == 0)
      && (objc_msgSend_isWAPI(self, v18, v19, v20, v21) & 1) == 0
      && (objc_msgSend_isPasspoint(self, v22, v23, v24, v25) & 1) == 0
      && !objc_msgSend_isCaptive(self, v26, v27, v28, v29);
}

- (BOOL)isAutojoinDisabledUntilFirstUserJoin
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E400, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setDisableAutojoinUntilFirstUserJoin:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E400, v7);

}

- (id)networkDisabledUntilDate
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E418, v2, v3);
}

- (void)setNetworkDisabledUntilDate:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E418, v3);
}

- (BOOL)isPasspointHomeOperatorNetwork
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E430, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPasspointHomeOperatorNetwork:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E430, v7);

}

- (BOOL)isPasspointProvisionedNetwork
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E448, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPasspointProvisionedNetwork:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E448, v7);

}

- (id)passpointAccountName
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E460, v2, v3);
}

- (void)setPasspointAccountName:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E460, v3);
}

- (unint64_t)lastJoinedBySystemAtWeek
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  unint64_t v21;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DEC0, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_unsignedIntegerValue(v5, v6, v7, v8, v9);

  objc_msgSend_lastJoinedBySystemAt(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v15, v16, v17, v18, v19);
  v21 = vcvtmd_u64_f64(v20 / 86400.0 / 7.0);

  if (v10 <= v21)
    return v21;
  else
    return v10;
}

- (void)setLastJoinedBySystemAtWeek:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615DEC0, v7);

}

- (void)setWas6GHzOnlyAt:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615DE90, v3);
}

- (void)setWas6GHzOnlyAtWeek:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615DEA8, v7);

}

- (NSArray)seamlessSSIDList
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DED8, v2, v3);
}

- (void)setSeamlessSSIDList:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615DED8, v3);
}

- (BOOL)isDNSHeuristicsFilteredNetwork
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E478, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSDictionary)DNSHeuristicsFailureStateInfo
{
  uint64_t v2;
  uint64_t v3;

  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E490, v2, v3);
}

- (BOOL)isHighPopularity
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E4A8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setHighPopularity:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E4A8, v7);

}

- (BOOL)isPotentiallyCaptive
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E4C0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPotentiallyCaptive:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E4C0, v7);

}

- (BOOL)isPotentiallyMoving
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E4D8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPotentiallyMoving:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E4D8, v7);

}

- (BOOL)isHighQuality
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E4F0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setHighQuality:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E4F0, v7);

}

- (BOOL)isSuspicious
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E508, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setIsSuspicious:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E508, v7);

}

- (BOOL)isTCPGood
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E520, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setIsTCPGood:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E520, v7);

}

- (BOOL)isLowPopularity
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E538, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setLowPopularity:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E538, v7);

}

- (BOOL)isLowQuality
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E550, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setLowQuality:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E550, v7);

}

- (BOOL)isProminentDisplay
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E568, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setProminentDisplay:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E568, v7);

}

- (unint64_t)popularityScore
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E580, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPopularityScore:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E580, v7);

}

- (unint64_t)qualityScore
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E598, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setQualityScore:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E598, v7);

}

- (unint64_t)totalNetworkUsage
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E5B0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setTotalNetworkUsage:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E5B0, v7);

}

- (id)expirationDate
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E5C8, v2, v3);
}

- (void)setExpirationDate:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E5C8, v3);
}

- (id)lastHomeForceFixDate
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E5E0, v2, v3);
}

- (void)setLastHomeForceFixDate:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E5E0, v3);
}

- (int64_t)locationOfInterest
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E5F8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setLocationOfInterest:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E5F8, v7);

}

- (int64_t)networkOfInterestHomeState
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E610, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setNetworkOfInterestHomeState:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E610, v7);

}

- (int64_t)networkOfInterestWorkState
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E628, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setNetworkOfInterestWorkState:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E628, v7);

}

- (int64_t)ssidHarvestStatus
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E640, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setSSIDHarvestStatus:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E640, v7);

}

- (id)walletIdentifier
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E658, v2, v3);
}

- (void)setWalletIdentifier:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E658, v3);
}

- (id)OTASystemInfoBeaconProbeList
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E670, v2, v3);
}

- (void)setOTASystemInfoBeaconProbeList:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E670, v3);
}

- (id)SIMIdentifiers
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E688, v2, v3);
}

- (void)setSIMIdentifiers:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E688, v3);
}

- (double)networkQualityResponsiveness
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E6A0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v4, v5, v6, v7, v8);
  v10 = v9;

  return v10;
}

- (void)setNetworkQualityResponsiveness:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  id v9;

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v3, v4, v5, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v7, (uint64_t)v9, (uint64_t)&unk_1E615E6A0, v8);

}

- (id)networkQualityDate
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E6B8, v2, v3);
}

- (void)setNetworkQualityDate:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E6B8, v3);
}

- (int)lastDisconnectReason
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DF08, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setLastDisconnectReason:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], a2, *(uint64_t *)&a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615DF08, v7);

}

- (id)lastDisconnectTimestamp
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DEF0, v2, v3);
}

- (void)setLastDisconnectTimestamp:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615DEF0, v3);
}

- (NSString)cachedPrivateMACAddress
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DF20, v2, v3);
}

- (void)setCachedPrivateMACAddress:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615DF20, v3);
}

- (NSDate)cachedPrivateMACAddressUpdatedAt
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DF38, v2, v3);
}

- (void)setCachedPrivateMACAddressUpdatedAt:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615DF38, v3);
}

- (int64_t)privateMACAddressModeUserSetting
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DF50, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPrivateMACAddressModeUserSetting:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615DF50, v7);

}

- (NSDate)privateMACAddressModeUserSettingUpdatedAt
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DF68, v2, v3);
}

- (void)setPrivateMACAddressModeUserSettingUpdatedAt:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615DF68, v3);
}

- (int64_t)privateMACAddressModeConfigurationProfileSetting
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DF80, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPrivateMACAddressModeConfigurationProfileSetting:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615DF80, v7);

}

- (int64_t)privateMACAddressEvaluationState
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DF98, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPrivateMACAddressEvaluationState:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615DF98, v7);

}

- (BOOL)privateMACAddressEnabledForEvaluation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  return !objc_msgSend_privateMACAddressModeUserSetting(self, a2, v2, v3, v4)
      && !objc_msgSend_privateMACAddressModeConfigurationProfileSetting(self, v6, v7, v8, v9)
      && objc_msgSend_privateMACAddressEvaluationState(self, v10, v11, v12, v13) == 1;
}

- (BOOL)privateMACAddressDisabledByEvaluation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  return (objc_msgSend_isPersonalHotspot(self, a2, v2, v3, v4) & 1) == 0
      && !objc_msgSend_privateMACAddressModeUserSetting(self, v6, v7, v8, v9)
      && !objc_msgSend_privateMACAddressModeConfigurationProfileSetting(self, v10, v11, v12, v13)
      && (unint64_t)(objc_msgSend_privateMACAddressEvaluationState(self, v14, v15, v16, v17) - 2) < 4;
}

- (NSDate)privateMACAddressEvaluatedAt
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DFB0, v2, v3);
}

- (void)setPrivateMACAddressEvaluatedAt:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615DFB0, v3);
}

- (void)setDiscoveredDevices:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615DFC8, v3);
}

- (NSDictionary)discoveredDevices
{
  uint64_t v2;
  uint64_t v3;

  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615DFC8, v2, v3);
}

- (id)__descriptionForLowDataMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v5 = objc_msgSend_lowDataMode(self, a2, v2, v3, v4);
  if (v5 > 2)
    return CFSTR("?");
  else
    return off_1E61335F0[v5];
}

- (id)__descriptionForCaptiveFlags
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  const __CFString *v20;
  int v21;
  const __CFString *v22;

  v6 = objc_msgSend_bypassCaptive(self, a2, v2, v3, v4);
  if (!objc_msgSend_isCaptiveStateDetermined(self, v7, v8, v9, v10))
  {
    v19 = CFSTR("?");
    v20 = CFSTR("? (bypass)");
LABEL_5:
    if (v6)
      v19 = (__CFString *)v20;
    return v19;
  }
  if (objc_msgSend_isCaptive(self, v11, v12, v13, v14))
  {
    v19 = CFSTR("yes");
    v20 = CFSTR("yes (bypass)");
    goto LABEL_5;
  }
  v21 = objc_msgSend_wasCaptive(self, v15, v16, v17, v18);
  v19 = CFSTR("no");
  if (v6)
    v19 = CFSTR("no (bypass)");
  v22 = CFSTR("was (bypass)");
  if (!v6)
    v22 = CFSTR("was");
  if (v21)
    v19 = (__CFString *)v22;
  return v19;
}

- (id)__descriptionForHiddenState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;

  v5 = objc_msgSend_hiddenState(self, a2, v2, v3, v4);
  v6 = CFSTR("?");
  if (v5 == 2)
    v6 = CFSTR("no");
  if (v5 == 1)
    return CFSTR("yes");
  else
    return (id)v6;
}

- (id)__descriptionForMovingAttribute
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;

  v5 = objc_msgSend_movingAttribute(self, a2, v2, v3, v4);
  v6 = CFSTR("?");
  if (v5 == 1)
    v6 = CFSTR("moving");
  if (v5 == 2)
    return CFSTR("stationary");
  else
    return (id)v6;
}

- (id)__descriptionForPublicAttribute
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;

  v5 = objc_msgSend_publicAttribute(self, a2, v2, v3, v4);
  v6 = CFSTR("?");
  if (v5 == 2)
    v6 = CFSTR("private");
  if (v5 == 1)
    return CFSTR("public");
  else
    return (id)v6;
}

- (id)__descriptionForNearbyShareableStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = objc_msgSend_nearbyShareableStatus(self, a2, v2, v3, v4);
  if ((unint64_t)(v5 - 1) > 8)
    return CFSTR("?");
  else
    return off_1E6133608[v5 - 1];
}

- (id)__descriptionFor6EMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend_disable6EMode(self, a2, v2, v3, v4);
  if (v5 < 3)
    return off_1E6133650[v5];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("? (%ld)"), v7, v8, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)__descriptionForPrivateMAC
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cachedPrivateMACAddress(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cachedPrivateMACAddressUpdatedAt(self, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B0630E50(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v23, (uint64_t)CFSTR("%@ (%@), "), v24, v25, v16, v22);

  if (objc_msgSend_privateMACAddressModeUserSetting(self, v26, v27, v28, v29))
  {
    v34 = objc_msgSend_privateMACAddressModeUserSetting(self, v30, v31, v32, v33);
    sub_1B06435E8(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privateMACAddressModeUserSettingUpdatedAt(self, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0630E50(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v42, (uint64_t)CFSTR("user=%@ (%@), "), v43, v44, v35, v41);

  }
  if (objc_msgSend_privateMACAddressEvaluationState(self, v30, v31, v32, v33))
  {
    v49 = objc_msgSend_privateMACAddressEvaluationState(self, v45, v46, v47, v48);
    sub_1B0643598(v49, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privateMACAddressEvaluatedAt(self, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0630E50(v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v61, (uint64_t)CFSTR("eval=%@ (%@), "), v62, v63, v54, v60);

  }
  if (objc_msgSend_privateMACAddressModeConfigurationProfileSetting(self, v45, v46, v47, v48))
  {
    v68 = objc_msgSend_privateMACAddressModeConfigurationProfileSetting(self, v64, v65, v66, v67);
    sub_1B06435E8(v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v70, (uint64_t)CFSTR("prof=%@, "), v71, v72, v69);

  }
  if (objc_msgSend_hasSuffix_(v6, v64, (uint64_t)CFSTR(", "), v66, v67))
  {
    v77 = objc_msgSend_length(v6, v73, v74, v75, v76);
    objc_msgSend_deleteCharactersInRange_(v6, v78, v77 - 2, 2, v79);
  }
  return v6;
}

- (NSString)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
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
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
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
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  double v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  id v265;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___basicDescription(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v6, v12, (uint64_t)v11, v13, v14);

  objc_msgSend_appendString_(v6, v15, (uint64_t)CFSTR(", "), v16, v17);
  if (objc_msgSend_isEAP(self, v18, v19, v20, v21)
    && objc_msgSend_isSystemMode(self, v22, v23, v24, v25))
  {
    objc_msgSend_appendString_(v6, v22, (uint64_t)CFSTR("systemMode=yes, "), v24, v25);
  }
  if (objc_msgSend_transitionDisabledFlags(self, v22, v23, v24, v25))
  {
    v30 = objc_msgSend_transitionDisabledFlags(self, v26, v27, v28, v29);
    sub_1B06429A8(v30, v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v36, (uint64_t)CFSTR("transitionDisabledFlags=%@, "), v37, v38, v35);

  }
  if (objc_msgSend_movingAttribute(self, v26, v27, v28, v29))
  {
    objc_msgSend___descriptionForMovingAttribute(self, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v44, (uint64_t)CFSTR("moving=%@, "), v45, v46, v43);

  }
  if (objc_msgSend_publicAttribute(self, v39, v40, v41, v42))
  {
    objc_msgSend___descriptionForPublicAttribute(self, v47, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v52, (uint64_t)CFSTR("public=%@, "), v53, v54, v51);

  }
  if (objc_msgSend_nearbyShareableStatus(self, v47, v48, v49, v50))
  {
    objc_msgSend___descriptionForNearbyShareableStatus(self, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v60, (uint64_t)CFSTR("nearbyShareStatus=%@, "), v61, v62, v59);

  }
  if ((objc_msgSend_isPrivacyProxyEnabled(self, v55, v56, v57, v58) & 1) == 0)
    objc_msgSend_appendString_(v6, v63, (uint64_t)CFSTR("privacyProxy=no, "), v65, v66);
  if (objc_msgSend_isAutojoinDisabledUntilFirstUserJoin(self, v63, v64, v65, v66))
    objc_msgSend_appendString_(v6, v67, (uint64_t)CFSTR("disableAutojoinUntilFirstUserJoin=yes, "), v69, v70);
  objc_msgSend_networkDisabledUntilDate(self, v67, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    objc_msgSend_networkDisabledUntilDate(self, v72, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0630E50(v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v78, (uint64_t)CFSTR("networkDisabledUntilDate=%@, "), v79, v80, v77);

  }
  if (objc_msgSend_isPasspointHomeOperatorNetwork(self, v72, v73, v74, v75))
    objc_msgSend_appendString_(v6, v81, (uint64_t)CFSTR("passpointHomeOperatorNetwork=yes, "), v83, v84);
  if (objc_msgSend_isPasspointProvisionedNetwork(self, v81, v82, v83, v84))
    objc_msgSend_appendString_(v6, v85, (uint64_t)CFSTR("passpointProvisionedNetwork=yes, "), v87, v88);
  objc_msgSend_passpointAccountName(self, v85, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    objc_msgSend_passpointAccountName(self, v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v95, (uint64_t)CFSTR("passpointAccountName=%@, "), v96, v97, v94);

  }
  if (objc_msgSend_isHighPopularity(self, v90, v91, v92, v93))
    objc_msgSend_appendString_(v6, v98, (uint64_t)CFSTR("highPopularity=yes, "), v100, v101);
  if (objc_msgSend_isHighQuality(self, v98, v99, v100, v101))
    objc_msgSend_appendString_(v6, v102, (uint64_t)CFSTR("highQuality=yes, "), v104, v105);
  if (objc_msgSend_isPotentiallyCaptive(self, v102, v103, v104, v105))
    objc_msgSend_appendString_(v6, v106, (uint64_t)CFSTR("potentiallyCaptive=yes, "), v108, v109);
  if (objc_msgSend_isPotentiallyMoving(self, v106, v107, v108, v109))
    objc_msgSend_appendString_(v6, v110, (uint64_t)CFSTR("potentiallyMoving=yes, "), v112, v113);
  if (objc_msgSend_isSuspicious(self, v110, v111, v112, v113))
    objc_msgSend_appendString_(v6, v114, (uint64_t)CFSTR("suspicious=yes, "), v116, v117);
  if (objc_msgSend_isTCPGood(self, v114, v115, v116, v117))
    objc_msgSend_appendString_(v6, v118, (uint64_t)CFSTR("tcpGood=yes, "), v120, v121);
  if (objc_msgSend_isLowPopularity(self, v118, v119, v120, v121))
    objc_msgSend_appendString_(v6, v122, (uint64_t)CFSTR("lowPopularity=yes, "), v124, v125);
  if (objc_msgSend_isLowQuality(self, v122, v123, v124, v125))
    objc_msgSend_appendString_(v6, v126, (uint64_t)CFSTR("lowQuality=yes, "), v128, v129);
  if (objc_msgSend_isProminentDisplay(self, v126, v127, v128, v129))
    objc_msgSend_appendString_(v6, v130, (uint64_t)CFSTR("prominentDisplay=yes, "), v132, v133);
  if (objc_msgSend_popularityScore(self, v130, v131, v132, v133))
  {
    v138 = objc_msgSend_popularityScore(self, v134, v135, v136, v137);
    objc_msgSend_appendFormat_(v6, v139, (uint64_t)CFSTR("popularityScore=%lu, "), v140, v141, v138);
  }
  if (objc_msgSend_qualityScore(self, v134, v135, v136, v137))
  {
    v146 = objc_msgSend_qualityScore(self, v142, v143, v144, v145);
    objc_msgSend_appendFormat_(v6, v147, (uint64_t)CFSTR("qualityScore=%lu, "), v148, v149, v146);
  }
  if (objc_msgSend_totalNetworkUsage(self, v142, v143, v144, v145))
  {
    v154 = objc_msgSend_totalNetworkUsage(self, v150, v151, v152, v153);
    objc_msgSend_appendFormat_(v6, v155, (uint64_t)CFSTR("totalNetworkUsage=%lu, "), v156, v157, v154);
  }
  objc_msgSend_expirationDate(self, v150, v151, v152, v153);
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  if (v158)
  {
    objc_msgSend_expirationDate(self, v159, v160, v161, v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0630E50(v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v165, (uint64_t)CFSTR("expirationDate=%@, "), v166, v167, v164);

  }
  objc_msgSend_lastHomeForceFixDate(self, v159, v160, v161, v162);
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  if (v168)
  {
    objc_msgSend_lastHomeForceFixDate(self, v169, v170, v171, v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0630E50(v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v175, (uint64_t)CFSTR("lastHomeForceFixDate=%@, "), v176, v177, v174);

  }
  if (objc_msgSend_locationOfInterest(self, v169, v170, v171, v172))
  {
    v182 = objc_msgSend_locationOfInterest(self, v178, v179, v180, v181);
    objc_msgSend_appendFormat_(v6, v183, (uint64_t)CFSTR("locationOfInterest=%lu, "), v184, v185, v182);
  }
  if (objc_msgSend_networkOfInterestHomeState(self, v178, v179, v180, v181))
    objc_msgSend_appendString_(v6, v186, (uint64_t)CFSTR("networkOfInterestHomeState=yes, "), v188, v189);
  if (objc_msgSend_networkOfInterestWorkState(self, v186, v187, v188, v189))
    objc_msgSend_appendString_(v6, v190, (uint64_t)CFSTR("networkOfInterestWorkState=yes, "), v192, v193);
  if (objc_msgSend_ssidHarvestStatus(self, v190, v191, v192, v193))
  {
    v198 = objc_msgSend_ssidHarvestStatus(self, v194, v195, v196, v197);
    objc_msgSend_appendFormat_(v6, v199, (uint64_t)CFSTR("ssidHarvestStatus=%lu, "), v200, v201, v198);
  }
  objc_msgSend_walletIdentifier(self, v194, v195, v196, v197);
  v202 = (void *)objc_claimAutoreleasedReturnValue();

  if (v202)
  {
    objc_msgSend_walletIdentifier(self, v203, v204, v205, v206);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v208, (uint64_t)CFSTR("walletIdentifier=%@, "), v209, v210, v207);

  }
  objc_msgSend_OTASystemInfoBeaconProbeList(self, v203, v204, v205, v206);
  v211 = (void *)objc_claimAutoreleasedReturnValue();

  if (v211)
  {
    objc_msgSend_OTASystemInfoBeaconProbeList(self, v212, v213, v214, v215);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v217, (uint64_t)CFSTR("OTASystemInfoBeaconProbeList=%@, "), v218, v219, v216);

  }
  objc_msgSend_SIMIdentifiers(self, v212, v213, v214, v215);
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  if (v220)
  {
    objc_msgSend_SIMIdentifiers(self, v221, v222, v223, v224);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v226, (uint64_t)CFSTR("SIMIdentifiers=%@, "), v227, v228, v225);

  }
  objc_msgSend_networkQualityResponsiveness(self, v221, v222, v223, v224);
  if (v233 > 0.0)
  {
    objc_msgSend_networkQualityResponsiveness(self, v229, v230, v231, v232);
    objc_msgSend_appendFormat_(v6, v234, (uint64_t)CFSTR("networkQualityResponsiveness=%f, "), v235, v236, v237);
  }
  objc_msgSend_networkQualityDate(self, v229, v230, v231, v232);
  v238 = (void *)objc_claimAutoreleasedReturnValue();

  if (v238)
  {
    objc_msgSend_networkQualityDate(self, v239, v240, v241, v242);
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0630E50(v243);
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v245, (uint64_t)CFSTR("networkQualityDate=%@, "), v246, v247, v244);

  }
  if (objc_msgSend_isPublicAirPlayNetwork(self, v239, v240, v241, v242))
    objc_msgSend_appendString_(v6, v248, (uint64_t)CFSTR("publicAirPlayNetwork=yes, "), v249, v250);
  objc_msgSend___descriptionForBSSListWithLimit_(self, v248, -1, v249, v250);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v6, v252, (uint64_t)v251, v253, v254);

  if (objc_msgSend_hasSuffix_(v6, v255, (uint64_t)CFSTR(", "), v256, v257))
  {
    v262 = objc_msgSend_length(v6, v258, v259, v260, v261);
    objc_msgSend_deleteCharactersInRange_(v6, v263, v262 - 2, 2, v264);
  }
  v265 = v6;

  return (NSString *)v265;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;

  objc_msgSend_SSID(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_hash(v6, v7, v8, v9, v10);
  objc_msgSend_domainName(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_hash(v16, v17, v18, v19, v20) ^ v11;
  objc_msgSend_internal(self, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v21 ^ objc_msgSend_hash(v26, v27, v28, v29, v30);

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
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
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFNetworkProfile, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  v16 = (void *)objc_msgSend_mutableCopy(self->_internal, v12, v13, v14, v15);
  objc_msgSend_setInternal_(v11, v17, (uint64_t)v16, v18, v19);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_internal, (uint64_t)CFSTR("_internal"), v3);
}

- (CWFNetworkProfile)initWithCoder:(id)a3
{
  id v4;
  CWFNetworkProfile *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableDictionary *internal;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CWFNetworkProfile;
  v5 = -[CWFNetworkProfile init](&v29, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v15, v7, v16, v17, v8, v9, v10, v11, v12, v13, v14, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, (uint64_t)CFSTR("_internal"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_mutableCopy(v21, v22, v23, v24, v25);
    internal = v5->_internal;
    v5->_internal = (NSMutableDictionary *)v26;

  }
  return v5;
}

- (BOOL)useCachedIdentifier
{
  return self->_useCachedIdentifier;
}

- (void)setUseCachedIdentifier:(BOOL)a3
{
  self->_useCachedIdentifier = a3;
}

- (NSString)cachedIdentifier
{
  return self->_cachedIdentifier;
}

- (void)setCachedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedIdentifier, a3);
}

- (BOOL)_shouldDisplayDeviceNames
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  return (objc_msgSend_isOpen(self, a2, v2, v3, v4) & 1) == 0
      && objc_msgSend_publicAttribute(self, v6, v7, v8, v9) != 1
      && (objc_msgSend_isPublicAirPlayNetwork(self, v10, v11, v12, v13) & 1) == 0
      && (objc_msgSend_isEAP(self, v14, v15, v16, v17) & 1) == 0
      && objc_msgSend_addReason(self, v18, v19, v20, v21) != 10;
}

- (id)_location
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend_BSSList(self, a2, v2, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend_location(v14, v7, v8, v9, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend_location(v14, v7, v8, v9, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v11 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  return v11;
}

- (BOOL)_isHomeNetwork
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  if (objc_msgSend_networkOfInterestHomeState(self, a2, v2, v3, v4) == 1)
    return 1;
  objc_msgSend_OSSpecificAttributes(self, v6, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)CFSTR("NetworkOfInterestHomeState"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_integerValue(v15, v16, v17, v18, v19) == 1)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend_OSSpecificAttributes(self, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v24, v25, (uint64_t)CFSTR("NetworkAtLocationOfInterestType"), v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_integerValue(v28, v29, v30, v31, v32) == 2)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend_OSSpecificAttributes(self, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v37, v38, (uint64_t)CFSTR("NetworkAtLocationOfInterestType"), v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend_integerValue(v41, v42, v43, v44, v45) == 4;

    }
  }

  return v10;
}

@end
