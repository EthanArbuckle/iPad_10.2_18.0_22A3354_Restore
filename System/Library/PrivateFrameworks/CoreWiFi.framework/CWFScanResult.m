@implementation CWFScanResult

- (int64_t)beaconInterval
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EE38, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (unint64_t)shortSSID
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F438, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)RSSI
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EDF0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int)APMode
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EEF8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

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

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EF28, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isAppleSWAP
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EEB0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsCarPlay
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F0C0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (unint64_t)age
{
  __uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  return (v3 - objc_msgSend_timestamp(self, v4, v5, v6, v7)) / 0xF4240;
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

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EE98, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int)supportedPHYModes
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EE68, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (unint64_t)RSNBroadcastCipher
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F390, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)airPortBaseStationModel
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EF58, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (CWFScanResult)scanResultWithMatchingKnownNetworkProfile:(id)a3
{
  id v4;
  CWFScanResult *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = objc_alloc_init(CWFScanResult);
  v10 = (void *)objc_msgSend_mutableCopy(self->_internal, v6, v7, v8, v9);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v11, (uint64_t)v4, (uint64_t)&unk_1E615F3F0, v12);

  objc_msgSend_setInternal_(v5, v13, (uint64_t)v10, v14, v15);
  return v5;
}

- (NSString)networkName
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EDA8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CWFHumanReadableStringFromData(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  CWFScanResult *v4;
  CWFScanResult *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToScanResult;

  v4 = (CWFScanResult *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToScanResult = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToScanResult = objc_msgSend_isEqualToScanResult_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToScanResult = 0;
  }

  return isEqualToScanResult;
}

- (BOOL)isWiFi6E
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
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
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char isColocatedAP;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend_channel(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_is6GHz(v6, v7, v8, v9, v10);

  if ((v11 & 1) != 0)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend_RNRBSSList(self, v12, v13, v14, v15, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v37, (uint64_t)v41, 16);
    if (v16)
    {
      v23 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v17);
          v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend_channel(v25, v19, v20, v21, v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_is6GHz(v26, v27, v28, v29, v30))
          {
            isColocatedAP = objc_msgSend_isColocatedAP(v25, v31, v32, v33, v34);

            if ((isColocatedAP & 1) != 0)
            {
              LOBYTE(v16) = 1;
              goto LABEL_14;
            }
          }
          else
          {

          }
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v37, (uint64_t)v41, 16);
      }
      while (v16);
    }
LABEL_14:

  }
  return v16;
}

- (CWFScanResult)initWithScanRecord:(id)a3 knownNetworkProfile:(id)a4 includeProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  CWFScanResult *v11;
  const char *v12;
  CWFScanResult *v13;
  uint64_t v14;
  NSMutableDictionary *internal;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CWFScanResult;
  v11 = -[CWFScanResult init](&v17, sel_init);
  v13 = v11;
  if (!v8
    || !v11
    || (objc_msgSend___internalDictionaryFromScanRecord_knownNetworkProfile_includeProperties_(v11, v12, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10), v14 = objc_claimAutoreleasedReturnValue(), internal = v13->_internal, v13->_internal = (NSMutableDictionary *)v14, internal, !v13->_internal))
  {

    v13 = 0;
  }

  return v13;
}

- (id)__descriptionForWPAIE
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
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int isSubsetOfSet;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
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
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
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
  id v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  id v112;
  void *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  objc_msgSend_scanRecord(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CFSTR("WPA_IE"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    || (objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v11, (uint64_t)&unk_1E6160A88, v12, v13),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_properties(self, v15, v16, v17, v18),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v14, v20, (uint64_t)v19, v21, v22),
        v19,
        v14,
        isSubsetOfSet))
  {
    objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)CFSTR("IE_KEY_WPA_MCIPHER"), v12, v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      v29 = (void *)MEMORY[0x1E0CB37E8];
      v30 = objc_msgSend_WPAMulticastCipher(self, v24, v25, v26, v27);
      objc_msgSend_numberWithUnsignedLongLong_(v29, v31, v30, v32, v33);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_objectForKeyedSubscript_(v10, v24, (uint64_t)CFSTR("IE_KEY_WPA_UCIPHERS"), v26, v27);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      objc_msgSend_WPAUnicastCiphers(self, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_objectForKeyedSubscript_(v10, v34, (uint64_t)CFSTR("IE_KEY_WPA_AUTHSELS"), v36, v37);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
      objc_msgSend_WPAAuthSelectors(self, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_string(MEMORY[0x1E0CB37A0], v39, v40, v41, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v44, v45, (uint64_t)CFSTR("["), v46, v47);
    v114 = v28;
    v52 = objc_msgSend_intValue(v28, v48, v49, v50, v51);
    objc_msgSend___descriptionForWPACipher_(self, v53, v52, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v44, v57, (uint64_t)CFSTR("mcast=%@, "), v58, v59, v56);

    objc_msgSend_appendString_(v44, v60, (uint64_t)CFSTR("ucast={ "), v61, v62);
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v63 = v38;
    v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v119, (uint64_t)v124, 16);
    if (v65)
    {
      v70 = v65;
      v71 = *(_QWORD *)v120;
      do
      {
        v72 = 0;
        do
        {
          if (*(_QWORD *)v120 != v71)
            objc_enumerationMutation(v63);
          v73 = objc_msgSend_intValue(*(void **)(*((_QWORD *)&v119 + 1) + 8 * v72), v66, v67, v68, v69);
          objc_msgSend___descriptionForWPACipher_(self, v74, v73, v75, v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendFormat_(v44, v78, (uint64_t)CFSTR("%@ "), v79, v80, v77);

          ++v72;
        }
        while (v70 != v72);
        v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v66, (uint64_t)&v119, (uint64_t)v124, 16);
      }
      while (v70);
    }

    objc_msgSend_appendString_(v44, v81, (uint64_t)CFSTR("}, "), v82, v83);
    objc_msgSend_appendString_(v44, v84, (uint64_t)CFSTR("auths={ "), v85, v86);
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v87 = v43;
    v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v115, (uint64_t)v123, 16);
    if (v89)
    {
      v94 = v89;
      v95 = *(_QWORD *)v116;
      do
      {
        v96 = 0;
        do
        {
          if (*(_QWORD *)v116 != v95)
            objc_enumerationMutation(v87);
          v97 = objc_msgSend_intValue(*(void **)(*((_QWORD *)&v115 + 1) + 8 * v96), v90, v91, v92, v93);
          objc_msgSend___descriptionForWPAAuthSel_(self, v98, v97, v99, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendFormat_(v44, v102, (uint64_t)CFSTR("%@ "), v103, v104, v101);

          ++v96;
        }
        while (v94 != v96);
        v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v90, (uint64_t)&v115, (uint64_t)v123, 16);
      }
      while (v94);
    }

    objc_msgSend_appendString_(v44, v105, (uint64_t)CFSTR("}"), v106, v107);
    objc_msgSend_appendString_(v44, v108, (uint64_t)CFSTR("]"), v109, v110);
    v111 = v114;
  }
  else
  {
    v63 = 0;
    v87 = 0;
    v111 = 0;
    v44 = 0;
  }
  v112 = v44;

  return v112;
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
  for (i = 0; i != 78; ++i)
  {
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v5, i, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v11, (uint64_t)v10, v12, v13);

  }
  v15 = (void *)objc_msgSend_copy(v8, v5, v14, v6, v7);

  return v15;
}

- (id)__descriptionForRSNIE
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
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int isSubsetOfSet;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
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
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  int v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  void *v175;
  id v176;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  _BYTE v190[128];
  _BYTE v191[128];
  uint64_t v192;

  v192 = *MEMORY[0x1E0C80C00];
  objc_msgSend_scanRecord(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CFSTR("RSN_IE"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    || (objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v11, (uint64_t)&unk_1E6160AA0, v12, v13),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_properties(self, v15, v16, v17, v18),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v14, v20, (uint64_t)v19, v21, v22),
        v19,
        v14,
        isSubsetOfSet))
  {
    objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)CFSTR("IE_KEY_RSN_MCIPHER"), v12, v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      v29 = (void *)MEMORY[0x1E0CB37E8];
      v30 = objc_msgSend_RSNMulticastCipher(self, v24, v25, v26, v27);
      objc_msgSend_numberWithUnsignedLongLong_(v29, v31, v30, v32, v33);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_objectForKeyedSubscript_(v10, v24, (uint64_t)CFSTR("IE_KEY_RSN_BCIPHER"), v26, v27);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      v39 = (void *)MEMORY[0x1E0CB37E8];
      v40 = objc_msgSend_RSNBroadcastCipher(self, v34, v35, v36, v37);
      objc_msgSend_numberWithUnsignedLongLong_(v39, v41, v40, v42, v43);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_objectForKeyedSubscript_(v10, v34, (uint64_t)CFSTR("IE_KEY_RSN_UCIPHERS"), v36, v37);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v48)
    {
      objc_msgSend_RSNUnicastCiphers(self, v44, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_objectForKeyedSubscript_(v10, v44, (uint64_t)CFSTR("IE_KEY_RSN_AUTHSELS"), v46, v47);
    v49 = objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      objc_msgSend_RSNAuthSelectors(self, v50, v51, v52, v53);
      v49 = objc_claimAutoreleasedReturnValue();
    }
    v178 = (void *)v49;
    objc_msgSend_objectForKeyedSubscript_(v10, v50, (uint64_t)CFSTR("IE_KEY_RSN_CAPS"), v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v54, v55, (uint64_t)CFSTR("RSN_CAPABILITIES"), v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v58)
    {
      v63 = (void *)MEMORY[0x1E0CB37E8];
      v64 = objc_msgSend_RSNCapabilities(self, v59, v60, v61, v62);
      objc_msgSend_numberWithUnsignedInt_(v63, v65, v64, v66, v67);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_string(MEMORY[0x1E0CB37A0], v59, v60, v61, v62);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v68, v69, (uint64_t)CFSTR("["), v70, v71);
    v180 = v28;
    v76 = objc_msgSend_intValue(v28, v72, v73, v74, v75);
    objc_msgSend___descriptionForRSNCipher_(self, v77, v76, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v68, v81, (uint64_t)CFSTR("mcast=%@, "), v82, v83, v80);

    v179 = v38;
    v88 = objc_msgSend_intValue(v38, v84, v85, v86, v87);
    objc_msgSend___descriptionForRSNCipher_(self, v89, v88, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v68, v93, (uint64_t)CFSTR("bip=%@, "), v94, v95, v92);

    objc_msgSend_appendString_(v68, v96, (uint64_t)CFSTR("ucast={ "), v97, v98);
    v188 = 0u;
    v189 = 0u;
    v186 = 0u;
    v187 = 0u;
    v99 = v48;
    v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v100, (uint64_t)&v186, (uint64_t)v191, 16);
    if (v101)
    {
      v106 = v101;
      v107 = *(_QWORD *)v187;
      do
      {
        v108 = 0;
        do
        {
          if (*(_QWORD *)v187 != v107)
            objc_enumerationMutation(v99);
          v109 = objc_msgSend_intValue(*(void **)(*((_QWORD *)&v186 + 1) + 8 * v108), v102, v103, v104, v105);
          objc_msgSend___descriptionForRSNCipher_(self, v110, v109, v111, v112);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendFormat_(v68, v114, (uint64_t)CFSTR("%@ "), v115, v116, v113);

          ++v108;
        }
        while (v106 != v108);
        v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v102, (uint64_t)&v186, (uint64_t)v191, 16);
      }
      while (v106);
    }
    v181 = v10;

    objc_msgSend_appendString_(v68, v117, (uint64_t)CFSTR("}, "), v118, v119);
    objc_msgSend_appendString_(v68, v120, (uint64_t)CFSTR("auths={ "), v121, v122);
    v184 = 0u;
    v185 = 0u;
    v182 = 0u;
    v183 = 0u;
    v123 = v178;
    v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(v123, v124, (uint64_t)&v182, (uint64_t)v190, 16);
    if (v125)
    {
      v130 = v125;
      v131 = *(_QWORD *)v183;
      do
      {
        v132 = 0;
        do
        {
          if (*(_QWORD *)v183 != v131)
            objc_enumerationMutation(v123);
          v133 = objc_msgSend_intValue(*(void **)(*((_QWORD *)&v182 + 1) + 8 * v132), v126, v127, v128, v129);
          objc_msgSend___descriptionForRSNAuthSel_(self, v134, v133, v135, v136);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendFormat_(v68, v138, (uint64_t)CFSTR("%@ "), v139, v140, v137);

          ++v132;
        }
        while (v130 != v132);
        v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(v123, v126, (uint64_t)&v182, (uint64_t)v190, 16);
      }
      while (v130);
    }

    objc_msgSend_appendString_(v68, v141, (uint64_t)CFSTR("}, "), v142, v143);
    v148 = objc_msgSend_unsignedIntValue(v58, v144, v145, v146, v147);
    v153 = objc_msgSend_unsignedIntValue(v58, v149, v150, v151, v152);
    v157 = "capable";
    if ((v148 & 0x80) == 0)
      v157 = "no";
    if ((v153 & 0x40) != 0)
      v157 = "required";
    objc_msgSend_appendFormat_(v68, v154, (uint64_t)CFSTR("mfp=%s, "), v155, v156, v157);
    if (v58)
    {
      v162 = (void *)MEMORY[0x1E0CB3940];
      v163 = objc_msgSend_shortValue(v58, v158, v159, v160, v161);
      objc_msgSend_stringWithFormat_(v162, v164, (uint64_t)CFSTR("0x%X"), v165, v166, v163);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v68, v168, (uint64_t)CFSTR("caps=%@"), v169, v170, v167);

    }
    else
    {
      objc_msgSend_appendFormat_(v68, v158, (uint64_t)CFSTR("caps=%@"), v160, v161, CFSTR("n/a"));
    }
    v174 = v180;
    v10 = v181;
    v175 = v179;
    objc_msgSend_appendString_(v68, v171, (uint64_t)CFSTR("]"), v172, v173);
  }
  else
  {
    v175 = 0;
    v99 = 0;
    v123 = 0;
    v58 = 0;
    v174 = 0;
    v68 = 0;
  }
  v176 = v68;

  return v176;
}

- (id)__descriptionForRSNCipher:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  if (a3 < 0xE && ((0x3B7Fu >> a3) & 1) != 0)
  {
    v5 = off_1E61352D0[a3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<%i>"), v3, v4, a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
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
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
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
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
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
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
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
  int v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  unsigned int v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
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
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  id v226;
  const char *v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  id v261;
  const char *v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  id v290;
  const char *v291;
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  const char *v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  id v317;
  const char *v318;
  uint64_t v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  id v345;
  const char *v346;
  uint64_t v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  const char *v359;
  uint64_t v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  const char *v369;
  uint64_t v370;
  uint64_t v371;
  void *v372;
  id v373;
  const char *v374;
  uint64_t v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  const char *v387;
  uint64_t v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  const char *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  void *v405;
  const char *v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  void *v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  const char *v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  const char *v419;
  uint64_t v420;
  id v421;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  _BYTE v456[128];
  _BYTE v457[128];
  _BYTE v458[128];
  _BYTE v459[128];
  _BYTE v460[128];
  _BYTE v461[128];
  _BYTE v462[128];
  uint64_t v463;

  v463 = *MEMORY[0x1E0C80C00];
  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_networkName(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_hasPrefix_(v21, v22, (uint64_t)CFSTR(" "), v23, v24) & 1) != 0
      || objc_msgSend_hasSuffix_(v21, v25, (uint64_t)CFSTR(" "), v26, v27))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v25, (uint64_t)CFSTR("'%@'"), v26, v27, v21);
      v28 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v28;
    }
    objc_msgSend_appendFormat_(v6, v25, (uint64_t)CFSTR("%@ - "), v26, v27, v21);
    objc_msgSend_SSID(self, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    CWFHexadecimalStringFromData(v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v38, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_shortSSID(self, v44, v45, v46, v47);
    objc_msgSend_appendFormat_(v6, v49, (uint64_t)CFSTR("ssid=%@ (%lu), "), v50, v51, v43, v48);

  }
  objc_msgSend_BSSID(self, v12, v13, v14, v15);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend_BSSID(self, v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v57, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v63, (uint64_t)CFSTR("bssid=%@, "), v64, v65, v62);

  }
  if (objc_msgSend_supportedSecurityTypes(self, v53, v54, v55, v56))
  {
    v70 = objc_msgSend_supportedSecurityTypes(self, v66, v67, v68, v69);
    v75 = objc_msgSend_WAPISubtype(self, v71, v72, v73, v74);
    sub_1B06248F4(v70, 0, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v79, (uint64_t)CFSTR("security=%@, "), v80, v81, v78);

  }
  objc_msgSend___descriptionForRSNIE(self, v66, v67, v68, v69);
  v82 = objc_claimAutoreleasedReturnValue();
  v87 = (void *)v82;
  if (v82)
    objc_msgSend_appendFormat_(v6, v83, (uint64_t)CFSTR("rsn=%@, "), v85, v86, v82);
  objc_msgSend___descriptionForWPAIE(self, v83, v84, v85, v86);
  v88 = objc_claimAutoreleasedReturnValue();
  v93 = (void *)v88;
  if (v88)
    objc_msgSend_appendFormat_(v6, v89, (uint64_t)CFSTR("wpa=%@, "), v91, v92, v88);
  objc_msgSend_channel(self, v89, v90, v91, v92);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (v94)
  {
    objc_msgSend_channel(self, v95, v96, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v100, (uint64_t)CFSTR("channel=%@"), v101, v102, v99);

    objc_msgSend_RNRChannelList(self, v103, v104, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v107, v108, v109, v110, v111))
    {
      objc_msgSend_appendString_(v6, v112, (uint64_t)CFSTR(" ("), v113, v114);
      v454 = 0u;
      v455 = 0u;
      v452 = 0u;
      v453 = 0u;
      v115 = v107;
      v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v116, (uint64_t)&v452, (uint64_t)v462, 16);
      if (v117)
      {
        v121 = v117;
        v122 = *(_QWORD *)v453;
        do
        {
          v123 = 0;
          do
          {
            if (*(_QWORD *)v453 != v122)
              objc_enumerationMutation(v115);
            objc_msgSend_appendFormat_(v6, v118, (uint64_t)CFSTR("%@, "), v119, v120, *(_QWORD *)(*((_QWORD *)&v452 + 1) + 8 * v123++));
          }
          while (v121 != v123);
          v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v118, (uint64_t)&v452, (uint64_t)v462, 16);
        }
        while (v121);
      }

      v128 = objc_msgSend_length(v6, v124, v125, v126, v127);
      objc_msgSend_deleteCharactersInRange_(v6, v129, v128 - 2, 2, v130);
      objc_msgSend_appendString_(v6, v131, (uint64_t)CFSTR("), "), v132, v133);
    }
    else
    {
      objc_msgSend_appendString_(v6, v112, (uint64_t)CFSTR(", "), v113, v114);
    }

  }
  objc_msgSend_countryCode(self, v95, v96, v97, v98);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  if (v134)
  {
    objc_msgSend_countryCode(self, v135, v136, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v140, (uint64_t)CFSTR("cc=%@, "), v141, v142, v139);

  }
  if (objc_msgSend_supportedPHYModes(self, v135, v136, v137, v138))
  {
    v147 = objc_msgSend_supportedPHYModes(self, v143, v144, v145, v146);
    sub_1B0625874(v147, v148, v149, v150, v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v153, (uint64_t)CFSTR("phy=%@, "), v154, v155, v152);

  }
  if (objc_msgSend_RSSI(self, v143, v144, v145, v146))
  {
    v160 = objc_msgSend_RSSI(self, v156, v157, v158, v159);
    objc_msgSend_appendFormat_(v6, v161, (uint64_t)CFSTR("rssi=%li, "), v162, v163, v160);
  }
  v164 = objc_msgSend_wasConnectedDuringSleep(self, v156, v157, v158, v159);
  objc_msgSend_appendFormat_(v6, v165, (uint64_t)CFSTR("wasConnectedDuringSleep=%li, "), v166, v167, v164);
  if (objc_msgSend_beaconInterval(self, v168, v169, v170, v171))
  {
    v176 = objc_msgSend_beaconInterval(self, v172, v173, v174, v175);
    objc_msgSend_appendFormat_(v6, v177, (uint64_t)CFSTR("bi=%li, "), v178, v179, v176);
  }
  if (objc_msgSend_isPasspoint(self, v172, v173, v174, v175))
    objc_msgSend_appendString_(v6, v180, (uint64_t)CFSTR("hs20=yes, "), v182, v183);
  if (objc_msgSend_isIBSS(self, v180, v181, v182, v183))
    objc_msgSend_appendString_(v6, v184, (uint64_t)CFSTR("ibss=yes, "), v186, v187);
  if (objc_msgSend_isPersonalHotspot(self, v184, v185, v186, v187))
    objc_msgSend_appendString_(v6, v188, (uint64_t)CFSTR("ph=yes, "), v190, v191);
  if (objc_msgSend_isAppleSWAP(self, v188, v189, v190, v191))
    objc_msgSend_appendString_(v6, v192, (uint64_t)CFSTR("swap=yes, "), v194, v195);
  if (objc_msgSend_supportsCarPlay(self, v192, v193, v194, v195))
    objc_msgSend_appendString_(v6, v196, (uint64_t)CFSTR("carplay=yes, "), v198, v199);
  v200 = objc_msgSend_airPortBaseStationModel(self, v196, v197, v198, v199);
  if (v200)
  {
    objc_msgSend___descriptionForAirPortBaseStationModel_(self, v201, v200, v203, v204);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v206, (uint64_t)CFSTR("airport=[%@], "), v207, v208, v205);

  }
  if (objc_msgSend_isWiFi6E(self, v201, v202, v203, v204))
    objc_msgSend_appendString_(v6, v209, (uint64_t)CFSTR("6e=yes, "), v211, v212);
  if (objc_msgSend_isFILSDiscoveryFrame(self, v209, v210, v211, v212))
    objc_msgSend_appendString_(v6, v213, (uint64_t)CFSTR("filsd=yes, "), v215, v216);
  objc_msgSend_RNRBSSList(self, v213, v214, v215, v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v217, v218, v219, v220, v221))
  {
    objc_msgSend_appendString_(v6, v222, (uint64_t)CFSTR("rnr=["), v224, v225);
    v450 = 0u;
    v451 = 0u;
    v448 = 0u;
    v449 = 0u;
    v226 = v217;
    v228 = objc_msgSend_countByEnumeratingWithState_objects_count_(v226, v227, (uint64_t)&v448, (uint64_t)v461, 16);
    if (v228)
    {
      v232 = v228;
      v233 = *(_QWORD *)v449;
      do
      {
        v234 = 0;
        do
        {
          if (*(_QWORD *)v449 != v233)
            objc_enumerationMutation(v226);
          objc_msgSend_appendFormat_(v6, v229, (uint64_t)CFSTR("(%@), "), v230, v231, *(_QWORD *)(*((_QWORD *)&v448 + 1) + 8 * v234++));
        }
        while (v232 != v234);
        v232 = objc_msgSend_countByEnumeratingWithState_objects_count_(v226, v229, (uint64_t)&v448, (uint64_t)v461, 16);
      }
      while (v232);
    }

    v239 = objc_msgSend_length(v6, v235, v236, v237, v238);
    objc_msgSend_deleteCharactersInRange_(v6, v240, v239 - 2, 2, v241);
    objc_msgSend_appendString_(v6, v242, (uint64_t)CFSTR("], "), v243, v244);
  }
  if (objc_msgSend_isBackgroundScanResult(self, v222, v223, v224, v225))
    objc_msgSend_appendString_(v6, v245, (uint64_t)CFSTR("bgscan=yes, "), v247, v248);
  if (objc_msgSend_isPasspoint(self, v245, v246, v247, v248))
  {
    objc_msgSend_domainNameList(self, v249, v250, v251, v252);
    v427 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v427, v253, v254, v255, v256))
    {
      objc_msgSend_appendString_(v6, v257, (uint64_t)CFSTR("hs20-domains=["), v259, v260);
      v446 = 0u;
      v447 = 0u;
      v444 = 0u;
      v445 = 0u;
      v261 = v427;
      v263 = objc_msgSend_countByEnumeratingWithState_objects_count_(v261, v262, (uint64_t)&v444, (uint64_t)v460, 16);
      if (v263)
      {
        v267 = v263;
        v268 = *(_QWORD *)v445;
        do
        {
          v269 = 0;
          do
          {
            if (*(_QWORD *)v445 != v268)
              objc_enumerationMutation(v261);
            objc_msgSend_appendFormat_(v6, v264, (uint64_t)CFSTR("%@, "), v265, v266, *(_QWORD *)(*((_QWORD *)&v444 + 1) + 8 * v269++));
          }
          while (v267 != v269);
          v267 = objc_msgSend_countByEnumeratingWithState_objects_count_(v261, v264, (uint64_t)&v444, (uint64_t)v460, 16);
        }
        while (v267);
      }

      v274 = objc_msgSend_length(v6, v270, v271, v272, v273);
      objc_msgSend_deleteCharactersInRange_(v6, v275, v274 - 2, 2, v276);
      objc_msgSend_appendString_(v6, v277, (uint64_t)CFSTR("], "), v278, v279);
    }
    objc_msgSend_NAIRealmNameList(self, v257, v258, v259, v260);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    v424 = v93;
    if (objc_msgSend_count(v280, v281, v282, v283, v284))
    {
      objc_msgSend_appendString_(v6, v285, (uint64_t)CFSTR("hs20-nai=["), v287, v288);
      v442 = 0u;
      v443 = 0u;
      v440 = 0u;
      v441 = 0u;
      v289 = v280;
      v290 = v280;
      v292 = objc_msgSend_countByEnumeratingWithState_objects_count_(v290, v291, (uint64_t)&v440, (uint64_t)v459, 16);
      if (v292)
      {
        v296 = v292;
        v297 = *(_QWORD *)v441;
        do
        {
          v298 = 0;
          do
          {
            if (*(_QWORD *)v441 != v297)
              objc_enumerationMutation(v290);
            objc_msgSend_appendFormat_(v6, v293, (uint64_t)CFSTR("%@, "), v294, v295, *(_QWORD *)(*((_QWORD *)&v440 + 1) + 8 * v298++));
          }
          while (v296 != v298);
          v296 = objc_msgSend_countByEnumeratingWithState_objects_count_(v290, v293, (uint64_t)&v440, (uint64_t)v459, 16);
        }
        while (v296);
      }

      v303 = objc_msgSend_length(v6, v299, v300, v301, v302);
      objc_msgSend_deleteCharactersInRange_(v6, v304, v303 - 2, 2, v305);
      objc_msgSend_appendString_(v6, v306, (uint64_t)CFSTR("], "), v307, v308);
      v280 = v289;
    }
    v425 = v87;
    objc_msgSend_roamingConsortiumList(self, v285, v286, v287, v288);
    v426 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v426, v309, v310, v311, v312))
    {
      objc_msgSend_appendString_(v6, v313, (uint64_t)CFSTR("hs20-rc=["), v315, v316);
      v438 = 0u;
      v439 = 0u;
      v436 = 0u;
      v437 = 0u;
      v317 = v426;
      v319 = objc_msgSend_countByEnumeratingWithState_objects_count_(v317, v318, (uint64_t)&v436, (uint64_t)v458, 16);
      if (v319)
      {
        v323 = v319;
        v324 = *(_QWORD *)v437;
        do
        {
          v325 = 0;
          do
          {
            if (*(_QWORD *)v437 != v324)
              objc_enumerationMutation(v317);
            objc_msgSend_appendFormat_(v6, v320, (uint64_t)CFSTR("%@, "), v321, v322, *(_QWORD *)(*((_QWORD *)&v436 + 1) + 8 * v325++));
          }
          while (v323 != v325);
          v323 = objc_msgSend_countByEnumeratingWithState_objects_count_(v317, v320, (uint64_t)&v436, (uint64_t)v458, 16);
        }
        while (v323);
      }

      v330 = objc_msgSend_length(v6, v326, v327, v328, v329);
      objc_msgSend_deleteCharactersInRange_(v6, v331, v330 - 2, 2, v332);
      objc_msgSend_appendString_(v6, v333, (uint64_t)CFSTR("], "), v334, v335);
    }
    objc_msgSend_operatorFriendlyNameList(self, v313, v314, v315, v316);
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v336, v337, v338, v339, v340))
    {
      objc_msgSend_appendString_(v6, v341, (uint64_t)CFSTR("hs20-friend=["), v343, v344);
      v434 = 0u;
      v435 = 0u;
      v432 = 0u;
      v433 = 0u;
      v345 = v336;
      v347 = objc_msgSend_countByEnumeratingWithState_objects_count_(v345, v346, (uint64_t)&v432, (uint64_t)v457, 16);
      if (v347)
      {
        v351 = v347;
        v352 = *(_QWORD *)v433;
        do
        {
          v353 = 0;
          do
          {
            if (*(_QWORD *)v433 != v352)
              objc_enumerationMutation(v345);
            objc_msgSend_appendFormat_(v6, v348, (uint64_t)CFSTR("%@, "), v349, v350, *(_QWORD *)(*((_QWORD *)&v432 + 1) + 8 * v353++));
          }
          while (v351 != v353);
          v351 = objc_msgSend_countByEnumeratingWithState_objects_count_(v345, v348, (uint64_t)&v432, (uint64_t)v457, 16);
        }
        while (v351);
      }

      v358 = objc_msgSend_length(v6, v354, v355, v356, v357);
      objc_msgSend_deleteCharactersInRange_(v6, v359, v358 - 2, 2, v360);
      objc_msgSend_appendString_(v6, v361, (uint64_t)CFSTR("], "), v362, v363);
    }
    objc_msgSend_cellularNetworkInfo(self, v341, v342, v343, v344);
    v364 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v364, v365, v366, v367, v368))
    {
      v423 = v280;
      v372 = v217;
      objc_msgSend_appendString_(v6, v369, (uint64_t)CFSTR("hs20-cell=["), v370, v371);
      v430 = 0u;
      v431 = 0u;
      v428 = 0u;
      v429 = 0u;
      v373 = v364;
      v375 = objc_msgSend_countByEnumeratingWithState_objects_count_(v373, v374, (uint64_t)&v428, (uint64_t)v456, 16);
      if (v375)
      {
        v379 = v375;
        v380 = *(_QWORD *)v429;
        do
        {
          v381 = 0;
          do
          {
            if (*(_QWORD *)v429 != v380)
              objc_enumerationMutation(v373);
            objc_msgSend_appendFormat_(v6, v376, (uint64_t)CFSTR("%@, "), v377, v378, *(_QWORD *)(*((_QWORD *)&v428 + 1) + 8 * v381++));
          }
          while (v379 != v381);
          v379 = objc_msgSend_countByEnumeratingWithState_objects_count_(v373, v376, (uint64_t)&v428, (uint64_t)v456, 16);
        }
        while (v379);
      }

      v386 = objc_msgSend_length(v6, v382, v383, v384, v385);
      objc_msgSend_deleteCharactersInRange_(v6, v387, v386 - 2, 2, v388);
      objc_msgSend_appendString_(v6, v389, (uint64_t)CFSTR("], "), v390, v391);
      v217 = v372;
      v280 = v423;
    }

    v93 = v424;
    v87 = v425;
  }
  v392 = objc_msgSend_age(self, v249, v250, v251, v252);
  v397 = objc_msgSend_timestamp(self, v393, v394, v395, v396);
  objc_msgSend_appendFormat_(v6, v398, (uint64_t)CFSTR("age=%lums (%llu), "), v399, v400, v392, v397);
  objc_msgSend_matchingKnownNetworkProfile(self, v401, v402, v403, v404);
  v405 = (void *)objc_claimAutoreleasedReturnValue();

  if (v405)
  {
    objc_msgSend_matchingKnownNetworkProfile(self, v406, v407, v408, v409);
    v410 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v411, (uint64_t)CFSTR("match=[%@], "), v412, v413, v410);

  }
  if (objc_msgSend_hasSuffix_(v6, v406, (uint64_t)CFSTR(", "), v408, v409))
  {
    v418 = objc_msgSend_length(v6, v414, v415, v416, v417);
    objc_msgSend_deleteCharactersInRange_(v6, v419, v418 - 2, 2, v420);
  }
  v421 = v6;

  return (NSString *)v421;
}

- (BOOL)isPasspoint
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EE80, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (id)__internalDictionaryFromScanRecord:(id)a3 knownNetworkProfile:(id)a4 includeProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t isPasspoint;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t isPersonalHotspot;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t isAppleSWAP;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  uint64_t isInternetAccessible;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  uint64_t isEmergencyServicesReachable;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  uint64_t isUnconfiguredDevice;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  uint64_t v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
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
  const char *v245;
  uint64_t v246;
  void *v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  int hasFILSDiscoveryInformation;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  void *v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  uint64_t isUnconfiguredAirPortBaseStation;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  void *v286;
  uint64_t v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  uint64_t isAdditionalStepRequiredForAccess;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  void *v315;
  uint64_t isUnauthenticatedEmergencyServiceAccessible;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  void *v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  void *v331;
  uint64_t v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  void *v345;
  uint64_t v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  uint64_t v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  void *v359;
  uint64_t v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  void *v373;
  uint64_t v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  void *v380;
  uint64_t v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  const char *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  const char *v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  const char *v407;
  uint64_t v408;
  int v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  void *v414;
  uint64_t v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  void *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  void *v431;
  void *v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  _BYTE v438[128];
  uint64_t v439;

  v439 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend___requiredProperties(self, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithSet_(v16, v22, (uint64_t)v21, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_unionSet_(v25, v26, (uint64_t)v10, v28, v29, v10);
  }
  else
  {
    objc_msgSend___defaultProperties(self, v26, v27, v28, v29, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionSet_(v25, v31, (uint64_t)v30, v32, v33);

  }
  v436 = 0u;
  v437 = 0u;
  v434 = 0u;
  v435 = 0u;
  v34 = v25;
  v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v434, (uint64_t)v438, 16);
  if (v36)
  {
    v41 = v36;
    v42 = *(_QWORD *)v435;
    while (1)
    {
      v43 = 0;
      while (2)
      {
        if (*(_QWORD *)v435 != v42)
          objc_enumerationMutation(v34);
        switch(objc_msgSend_integerValue(*(void **)(*((_QWORD *)&v434 + 1) + 8 * v43), v37, v38, v39, v40))
        {
          case 1:
            objc_msgSend_setObject_forKeyedSubscript_(v15, v37, (uint64_t)v8, (uint64_t)&unk_1E615ED90, v40);
            goto LABEL_222;
          case 2:
            v44 = (void *)MEMORY[0x1E0CB37E8];
            v45 = objc_msgSend_timestamp(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithUnsignedLongLong_(v44, v46, v45, v47, v48);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615F408;
            goto LABEL_207;
          case 3:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
              objc_msgSend_FILSSSID(v8, v53, v54, v55, v56);
            else
              objc_msgSend_SSID(v8, v53, v54, v55, v56);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EDA8;
            goto LABEL_207;
          case 4:
            objc_msgSend_BSSID(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615ED78;
            goto LABEL_207;
          case 5:
            objc_msgSend_channelInfo(v8, v37, v38, v39, v40);
            v248 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v15, v249, (uint64_t)v248, (uint64_t)&unk_1E615EDC0, v250);

            if (!objc_msgSend_hasFILSDiscoveryInformation(v8, v251, v252, v253, v254))
              goto LABEL_222;
            objc_msgSend_FILSPrimaryChannelInfo(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v51)
              goto LABEL_208;
            v52 = &unk_1E615EDC0;
            goto LABEL_207;
          case 6:
            objc_msgSend_countryCode(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EDD8;
            goto LABEL_207;
          case 7:
            v57 = (void *)MEMORY[0x1E0CB37E8];
            v58 = objc_msgSend_RSSI(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithInteger_(v57, v59, v58, v60, v61);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EDF0;
            goto LABEL_207;
          case 8:
            v62 = (void *)MEMORY[0x1E0CB37E8];
            v63 = objc_msgSend_wasConnectedDuringSleep(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithBool_(v62, v64, v63, v65, v66);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EE08;
            goto LABEL_207;
          case 9:
            v255 = (void *)MEMORY[0x1E0CB37E8];
            v256 = objc_msgSend_noise(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithInteger_(v255, v257, v256, v258, v259);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EE20;
            goto LABEL_207;
          case 10:
            hasFILSDiscoveryInformation = objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40);
            v265 = (void *)MEMORY[0x1E0CB37E8];
            if (hasFILSDiscoveryInformation)
              v266 = objc_msgSend_FILSBeaconInterval(v8, v261, v262, v263, v264);
            else
              v266 = objc_msgSend_beaconInterval(v8, v261, v262, v263, v264);
            objc_msgSend_numberWithInteger_(v265, v267, v266, v268, v269);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EE38;
            goto LABEL_207;
          case 11:
            v67 = (void *)MEMORY[0x1E0CB37E8];
            isPasspoint = objc_msgSend_isPasspoint(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithBool_(v67, v69, isPasspoint, v70, v71);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EE80;
            goto LABEL_207;
          case 12:
            v72 = (void *)MEMORY[0x1E0CB37E8];
            isPersonalHotspot = objc_msgSend_isPersonalHotspot(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithBool_(v72, v74, isPersonalHotspot, v75, v76);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EE98;
            goto LABEL_207;
          case 13:
            v77 = (void *)MEMORY[0x1E0CB37E8];
            isAppleSWAP = objc_msgSend_isAppleSWAP(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithBool_(v77, v79, isAppleSWAP, v80, v81);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EEB0;
            goto LABEL_207;
          case 14:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if (objc_msgSend_hasFILSCaps(v8, v82, v83, v84, v85))
              {
                if (objc_msgSend_FILSIsESS(v8, v86, v87, v88, v89))
                  v90 = &unk_1E615EEC8;
                else
                  v90 = &unk_1E615EEE0;
              }
              else
              {
                v90 = 0;
              }
              v247 = &unk_1E615EEF8;
LABEL_219:
              objc_msgSend_setObject_forKeyedSubscript_(v15, v86, (uint64_t)v90, (uint64_t)v247, v89);
              goto LABEL_222;
            }
            v419 = objc_msgSend_APMode(v8, v82, v83, v84, v85);
            if (!(_DWORD)v419)
              goto LABEL_222;
            objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v37, v419, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EEF8;
            goto LABEL_207;
          case 15:
            v270 = (void *)MEMORY[0x1E0CB37E8];
            isUnconfiguredAirPortBaseStation = objc_msgSend_isUnconfiguredAirPortBaseStation(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithBool_(v270, v272, isUnconfiguredAirPortBaseStation, v273, v274);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EF40;
            goto LABEL_207;
          case 16:
            v275 = (void *)MEMORY[0x1E0CB37E8];
            v276 = objc_msgSend_airPortBaseStationModel(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithInteger_(v275, v277, v276, v278, v279);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EF58;
            goto LABEL_207;
          case 17:
            objc_msgSend_informationElementData(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EF10;
            goto LABEL_207;
          case 18:
            if (!objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              v286 = (void *)MEMORY[0x1E0CB37E8];
              v287 = objc_msgSend_supportedPHYModes(v8, v280, v281, v282, v283);
              goto LABEL_181;
            }
            if ((objc_msgSend_hasFILSCaps(v8, v280, v281, v282, v283) & 1) != 0)
            {
              v286 = (void *)MEMORY[0x1E0CB37E8];
              v287 = objc_msgSend_FILSSupportedPHYModes(v8, v101, v284, v285, v104);
LABEL_181:
              objc_msgSend_numberWithUnsignedInt_(v286, v288, v287, v289, v290);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615EE68;
              goto LABEL_207;
            }
            v420 = &unk_1E615EE68;
LABEL_221:
            objc_msgSend_setObject_forKeyedSubscript_(v15, v101, 0, (uint64_t)v420, v104);
LABEL_222:
            if (v41 != ++v43)
              continue;
            v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v434, (uint64_t)v438, 16);
            if (!v41)
              goto LABEL_224;
            break;
          case 19:
            v91 = (void *)MEMORY[0x1E0CB37E8];
            v92 = objc_msgSend_supportedSecurityTypes(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithUnsignedInteger_(v91, v93, v92, v94, v95);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EE50;
            goto LABEL_207;
          case 20:
            v96 = (void *)MEMORY[0x1E0CB37E8];
            v97 = objc_msgSend_WAPISubtype(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithInteger_(v96, v98, v97, v99, v100);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615EF28;
            goto LABEL_207;
          case 21:
            objc_msgSend_WPAUnicastCiphers(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615F318;
            goto LABEL_207;
          case 22:
            if ((objc_msgSend_hasWPAIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v105 = (void *)MEMORY[0x1E0CB37E8];
              v106 = objc_msgSend_WPAMulticastCipher(v8, v101, v102, v103, v104);
              objc_msgSend_numberWithUnsignedLongLong_(v105, v107, v106, v108, v109);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F330;
              goto LABEL_207;
            }
            v420 = &unk_1E615F330;
            goto LABEL_221;
          case 23:
            objc_msgSend_WPAAuthSelectors(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615F348;
            goto LABEL_207;
          case 24:
            objc_msgSend_RSNUnicastCiphers(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615F360;
            goto LABEL_207;
          case 25:
            if ((objc_msgSend_hasRSNIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v112 = (void *)MEMORY[0x1E0CB37E8];
              v113 = objc_msgSend_RSNMulticastCipher(v8, v101, v110, v111, v104);
              objc_msgSend_numberWithUnsignedLongLong_(v112, v114, v113, v115, v116);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F378;
              goto LABEL_207;
            }
            v420 = &unk_1E615F378;
            goto LABEL_221;
          case 26:
            if ((objc_msgSend_hasRSNIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v119 = (void *)MEMORY[0x1E0CB37E8];
              v120 = objc_msgSend_RSNBroadcastCipher(v8, v101, v117, v118, v104);
              objc_msgSend_numberWithUnsignedLongLong_(v119, v121, v120, v122, v123);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F390;
              goto LABEL_207;
            }
            v420 = &unk_1E615F390;
            goto LABEL_221;
          case 27:
            objc_msgSend_RSNAuthSelectors(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615F3A8;
            goto LABEL_207;
          case 28:
            if ((objc_msgSend_hasRSNIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v293 = (void *)MEMORY[0x1E0CB37E8];
              v294 = objc_msgSend_RSNCapabilities(v8, v101, v291, v292, v104);
              objc_msgSend_numberWithUnsignedInt_(v293, v295, v294, v296, v297);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F3C0;
              goto LABEL_207;
            }
            v420 = &unk_1E615F3C0;
            goto LABEL_221;
          case 31:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if ((objc_msgSend_hasFILSAccessNetworkOptions(v8, v124, v125, v126, v127) & 1) != 0)
              {
                v130 = (void *)MEMORY[0x1E0CB37E8];
                v131 = objc_msgSend_FILSAccessNetworkType(v8, v101, v128, v129, v104);
LABEL_156:
                objc_msgSend_numberWithUnsignedInt_(v130, v132, v131, v133, v134);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = &unk_1E615EF70;
                goto LABEL_207;
              }
            }
            else if ((objc_msgSend_hasInterworkingIE(v8, v124, v125, v126, v127) & 1) != 0)
            {
              v130 = (void *)MEMORY[0x1E0CB37E8];
              v131 = objc_msgSend_accessNetworkType(v8, v101, v421, v422, v104);
              goto LABEL_156;
            }
            v420 = &unk_1E615EF70;
            goto LABEL_221;
          case 32:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if ((objc_msgSend_hasFILSAccessNetworkOptions(v8, v135, v136, v137, v138) & 1) != 0)
              {
                v141 = (void *)MEMORY[0x1E0CB37E8];
                isInternetAccessible = objc_msgSend_FILSIsInternetAccessible(v8, v101, v139, v140, v104);
LABEL_159:
                objc_msgSend_numberWithBool_(v141, v143, isInternetAccessible, v144, v145);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = &unk_1E615EF88;
                goto LABEL_207;
              }
            }
            else if ((objc_msgSend_hasInterworkingIE(v8, v135, v136, v137, v138) & 1) != 0)
            {
              v141 = (void *)MEMORY[0x1E0CB37E8];
              isInternetAccessible = objc_msgSend_isInternetAccessible(v8, v101, v423, v424, v104);
              goto LABEL_159;
            }
            v420 = &unk_1E615EF88;
            goto LABEL_221;
          case 33:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if ((objc_msgSend_hasFILSAccessNetworkOptions(v8, v298, v299, v300, v301) & 1) != 0)
              {
                v304 = (void *)MEMORY[0x1E0CB37E8];
                isAdditionalStepRequiredForAccess = objc_msgSend_FILSIsAdditionalStepRequiredForAccess(v8, v101, v302, v303, v104);
LABEL_185:
                objc_msgSend_numberWithBool_(v304, v306, isAdditionalStepRequiredForAccess, v307, v308);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = &unk_1E615EFA0;
                goto LABEL_207;
              }
            }
            else if ((objc_msgSend_hasInterworkingIE(v8, v298, v299, v300, v301) & 1) != 0)
            {
              v304 = (void *)MEMORY[0x1E0CB37E8];
              isAdditionalStepRequiredForAccess = objc_msgSend_isAdditionalStepRequiredForAccess(v8, v101, v427, v428, v104);
              goto LABEL_185;
            }
            v420 = &unk_1E615EFA0;
            goto LABEL_221;
          case 34:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if ((objc_msgSend_hasFILSAccessNetworkOptions(v8, v146, v147, v148, v149) & 1) != 0)
              {
                v152 = (void *)MEMORY[0x1E0CB37E8];
                isEmergencyServicesReachable = objc_msgSend_FILSIsEmergencyServicesReachable(v8, v101, v150, v151, v104);
LABEL_162:
                objc_msgSend_numberWithBool_(v152, v154, isEmergencyServicesReachable, v155, v156);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = &unk_1E615EFB8;
                goto LABEL_207;
              }
            }
            else if ((objc_msgSend_hasInterworkingIE(v8, v146, v147, v148, v149) & 1) != 0)
            {
              v152 = (void *)MEMORY[0x1E0CB37E8];
              isEmergencyServicesReachable = objc_msgSend_isEmergencyServicesReachable(v8, v101, v425, v426, v104);
              goto LABEL_162;
            }
            v420 = &unk_1E615EFB8;
            goto LABEL_221;
          case 35:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if ((objc_msgSend_hasFILSAccessNetworkOptions(v8, v309, v310, v311, v312) & 1) != 0)
              {
                v315 = (void *)MEMORY[0x1E0CB37E8];
                isUnauthenticatedEmergencyServiceAccessible = objc_msgSend_FILSIsUnauthenticatedEmergencyServiceAccessible(v8, v101, v313, v314, v104);
LABEL_188:
                objc_msgSend_numberWithBool_(v315, v317, isUnauthenticatedEmergencyServiceAccessible, v318, v319);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = &unk_1E615EFD0;
                goto LABEL_207;
              }
            }
            else if ((objc_msgSend_hasInterworkingIE(v8, v309, v310, v311, v312) & 1) != 0)
            {
              v315 = (void *)MEMORY[0x1E0CB37E8];
              isUnauthenticatedEmergencyServiceAccessible = objc_msgSend_isUnauthenticatedEmergencyServiceAccessible(v8, v101, v429, v430, v104);
              goto LABEL_188;
            }
            v420 = &unk_1E615EFD0;
            goto LABEL_221;
          case 36:
            if ((objc_msgSend_hasInterworkingIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v159 = (void *)MEMORY[0x1E0CB37E8];
              v160 = objc_msgSend_venueGroup(v8, v101, v157, v158, v104);
              objc_msgSend_numberWithInteger_(v159, v161, v160, v162, v163);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615EFE8;
              goto LABEL_207;
            }
            v420 = &unk_1E615EFE8;
            goto LABEL_221;
          case 37:
            if ((objc_msgSend_hasInterworkingIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v322 = (void *)MEMORY[0x1E0CB37E8];
              v323 = objc_msgSend_venueType(v8, v101, v320, v321, v104);
              objc_msgSend_numberWithInteger_(v322, v324, v323, v325, v326);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F000;
              goto LABEL_207;
            }
            v420 = &unk_1E615F000;
            goto LABEL_221;
          case 38:
            if ((objc_msgSend_hasInterworkingIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              objc_msgSend_HESSID(v8, v101, v327, v328, v104);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F018;
              goto LABEL_207;
            }
            v420 = &unk_1E615F018;
            goto LABEL_221;
          case 39:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v166 = (void *)MEMORY[0x1E0CB37E8];
              isUnconfiguredDevice = objc_msgSend_isUnconfiguredDevice(v8, v101, v164, v165, v104);
              objc_msgSend_numberWithBool_(v166, v168, isUnconfiguredDevice, v169, v170);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F030;
              goto LABEL_207;
            }
            v420 = &unk_1E615F030;
            goto LABEL_221;
          case 40:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v331 = (void *)MEMORY[0x1E0CB37E8];
              v332 = objc_msgSend_providesInternetAccess(v8, v101, v329, v330, v104);
              objc_msgSend_numberWithBool_(v331, v333, v332, v334, v335);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F048;
              goto LABEL_207;
            }
            v420 = &unk_1E615F048;
            goto LABEL_221;
          case 41:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v173 = (void *)MEMORY[0x1E0CB37E8];
              v174 = objc_msgSend_supportsWPS(v8, v101, v171, v172, v104);
              objc_msgSend_numberWithBool_(v173, v175, v174, v176, v177);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F060;
              goto LABEL_207;
            }
            v420 = &unk_1E615F060;
            goto LABEL_221;
          case 42:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v180 = (void *)MEMORY[0x1E0CB37E8];
              v181 = objc_msgSend_supportsiAPOverWiFi(v8, v101, v178, v179, v104);
              objc_msgSend_numberWithBool_(v180, v182, v181, v183, v184);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F078;
              goto LABEL_207;
            }
            v420 = &unk_1E615F078;
            goto LABEL_221;
          case 43:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v187 = (void *)MEMORY[0x1E0CB37E8];
              v188 = objc_msgSend_supports2GHzNetworks(v8, v101, v185, v186, v104);
              objc_msgSend_numberWithBool_(v187, v189, v188, v190, v191);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F090;
              goto LABEL_207;
            }
            v420 = &unk_1E615F090;
            goto LABEL_221;
          case 44:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v194 = (void *)MEMORY[0x1E0CB37E8];
              v195 = objc_msgSend_supports5GHzNetworks(v8, v101, v192, v193, v104);
              objc_msgSend_numberWithBool_(v194, v196, v195, v197, v198);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F0A8;
              goto LABEL_207;
            }
            v420 = &unk_1E615F0A8;
            goto LABEL_221;
          case 45:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v338 = (void *)MEMORY[0x1E0CB37E8];
              v339 = objc_msgSend_supportsCarPlay(v8, v101, v336, v337, v104);
              objc_msgSend_numberWithBool_(v338, v340, v339, v341, v342);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F0C0;
              goto LABEL_207;
            }
            v420 = &unk_1E615F0C0;
            goto LABEL_221;
          case 46:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v201 = (void *)MEMORY[0x1E0CB37E8];
              v202 = objc_msgSend_supportsHomeKit(v8, v101, v199, v200, v104);
              objc_msgSend_numberWithBool_(v201, v203, v202, v204, v205);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F0D8;
              goto LABEL_207;
            }
            v420 = &unk_1E615F0D8;
            goto LABEL_221;
          case 47:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v208 = (void *)MEMORY[0x1E0CB37E8];
              v209 = objc_msgSend_supportsHomeKit2(v8, v101, v206, v207, v104);
              objc_msgSend_numberWithBool_(v208, v210, v209, v211, v212);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F0F0;
              goto LABEL_207;
            }
            v420 = &unk_1E615F0F0;
            goto LABEL_221;
          case 48:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v345 = (void *)MEMORY[0x1E0CB37E8];
              v346 = objc_msgSend_supportsAirPlay(v8, v101, v343, v344, v104);
              objc_msgSend_numberWithBool_(v345, v347, v346, v348, v349);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F108;
              goto LABEL_207;
            }
            v420 = &unk_1E615F108;
            goto LABEL_221;
          case 49:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v352 = (void *)MEMORY[0x1E0CB37E8];
              v353 = objc_msgSend_supportsAirPlay2(v8, v101, v350, v351, v104);
              objc_msgSend_numberWithBool_(v352, v354, v353, v355, v356);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F120;
              goto LABEL_207;
            }
            v420 = &unk_1E615F120;
            goto LABEL_221;
          case 50:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v359 = (void *)MEMORY[0x1E0CB37E8];
              v360 = objc_msgSend_supportsAirPrint(v8, v101, v357, v358, v104);
              objc_msgSend_numberWithBool_(v359, v361, v360, v362, v363);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F138;
              goto LABEL_207;
            }
            v420 = &unk_1E615F138;
            goto LABEL_221;
          case 51:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v366 = (void *)MEMORY[0x1E0CB37E8];
              v367 = objc_msgSend_supportsMFi(v8, v101, v364, v365, v104);
              objc_msgSend_numberWithBool_(v366, v368, v367, v369, v370);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F150;
              goto LABEL_207;
            }
            v420 = &unk_1E615F150;
            goto LABEL_221;
          case 52:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v215 = (void *)MEMORY[0x1E0CB37E8];
              v216 = objc_msgSend_supportsMFiHardwareAuth(v8, v101, v213, v214, v104);
              objc_msgSend_numberWithBool_(v215, v217, v216, v218, v219);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F168;
              goto LABEL_207;
            }
            v420 = &unk_1E615F168;
            goto LABEL_221;
          case 53:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v222 = (void *)MEMORY[0x1E0CB37E8];
              v223 = objc_msgSend_supportsSoftwareTokenAuth(v8, v101, v220, v221, v104);
              objc_msgSend_numberWithBool_(v222, v224, v223, v225, v226);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F180;
              goto LABEL_207;
            }
            v420 = &unk_1E615F180;
            goto LABEL_221;
          case 54:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v373 = (void *)MEMORY[0x1E0CB37E8];
              v374 = objc_msgSend_supportsSoftwareCertAuth(v8, v101, v371, v372, v104);
              objc_msgSend_numberWithBool_(v373, v375, v374, v376, v377);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F198;
              goto LABEL_207;
            }
            v420 = &unk_1E615F198;
            goto LABEL_221;
          case 55:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v380 = (void *)MEMORY[0x1E0CB37E8];
              v381 = objc_msgSend_supportsSecureWAC(v8, v101, v378, v379, v104);
              objc_msgSend_numberWithBool_(v380, v382, v381, v383, v384);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F1B0;
              goto LABEL_207;
            }
            v420 = &unk_1E615F1B0;
            goto LABEL_221;
          case 56:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              v229 = (void *)MEMORY[0x1E0CB37E8];
              v230 = objc_msgSend_supportsWoW(v8, v101, v227, v228, v104);
              objc_msgSend_numberWithBool_(v229, v231, v230, v232, v233);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F1C8;
              goto LABEL_207;
            }
            v420 = &unk_1E615F1C8;
            goto LABEL_221;
          case 57:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              objc_msgSend_friendlyName(v8, v101, v385, v386, v104);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F1E0;
              goto LABEL_207;
            }
            v420 = &unk_1E615F1E0;
            goto LABEL_221;
          case 58:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              objc_msgSend_manufacturerName(v8, v101, v387, v388, v104);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F1F8;
              goto LABEL_207;
            }
            v420 = &unk_1E615F1F8;
            goto LABEL_221;
          case 59:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              objc_msgSend_modelName(v8, v101, v234, v235, v104);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F210;
              goto LABEL_207;
            }
            v420 = &unk_1E615F210;
            goto LABEL_221;
          case 60:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              objc_msgSend_displayName(v8, v101, v389, v390, v104);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F228;
              goto LABEL_207;
            }
            v420 = &unk_1E615F228;
            goto LABEL_221;
          case 61:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              objc_msgSend_primaryMAC(v8, v101, v391, v392, v104);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F240;
              goto LABEL_207;
            }
            v420 = &unk_1E615F240;
            goto LABEL_221;
          case 62:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) != 0)
            {
              objc_msgSend_bluetoothMAC(v8, v101, v393, v394, v104);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_1E615F258;
              goto LABEL_207;
            }
            v420 = &unk_1E615F258;
            goto LABEL_221;
          case 63:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) == 0)
            {
              v420 = &unk_1E615F270;
              goto LABEL_221;
            }
            objc_msgSend_deviceID(v8, v101, v395, v396, v104);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615F270;
LABEL_207:
            objc_msgSend_setObject_forKeyedSubscript_(v15, v49, (uint64_t)v51, (uint64_t)v52, v50);
            goto LABEL_208;
          case 64:
            objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615F288;
            goto LABEL_207;
          case 65:
            objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              objc_msgSend_cellularNetworkInfo(v8, v236, v397, v398, v239);
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v15, v399, (uint64_t)v240, (uint64_t)&unk_1E615F2A0, v400);
              goto LABEL_140;
            }
            v431 = &unk_1E615F2A0;
            goto LABEL_216;
          case 66:
            objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              objc_msgSend_NAIRealmNameList(v8, v236, v401, v402, v239);
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v15, v403, (uint64_t)v240, (uint64_t)&unk_1E615F2B8, v404);
              goto LABEL_140;
            }
            v431 = &unk_1E615F2B8;
            goto LABEL_216;
          case 67:
            objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              objc_msgSend_roamingConsortiumList(v8, v236, v237, v238, v239);
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v15, v241, (uint64_t)v240, (uint64_t)&unk_1E615F2D0, v242);
              goto LABEL_140;
            }
            v431 = &unk_1E615F2D0;
            goto LABEL_216;
          case 68:
            objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              objc_msgSend_operatorFriendlyNameList(v8, v236, v405, v406, v239);
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v15, v407, (uint64_t)v240, (uint64_t)&unk_1E615F2E8, v408);
              goto LABEL_140;
            }
            v431 = &unk_1E615F2E8;
            goto LABEL_216;
          case 69:
            objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              objc_msgSend_domainNameList(v8, v236, v243, v244, v239);
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v15, v245, (uint64_t)v240, (uint64_t)&unk_1E615F300, v246);
LABEL_140:

            }
            else
            {
              v431 = &unk_1E615F300;
LABEL_216:
              objc_msgSend_setObject_forKeyedSubscript_(v15, v236, 0, (uint64_t)v431, v239);
            }
LABEL_208:

            goto LABEL_222;
          case 70:
            objc_msgSend_objectForKeyedSubscript_(v8, v37, (uint64_t)CFSTR("__OSSpecific__"), v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615F3D8;
            goto LABEL_207;
          case 71:
            objc_msgSend_setObject_forKeyedSubscript_(v15, v37, (uint64_t)v9, (uint64_t)&unk_1E615F3F0, v40);
            goto LABEL_222;
          case 72:
            objc_msgSend_networkFlags(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615F420;
            goto LABEL_207;
          case 73:
            v409 = objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40);
            v414 = (void *)MEMORY[0x1E0CB37E8];
            if (v409)
              v415 = objc_msgSend_FILSShortSSID(v8, v410, v411, v412, v413);
            else
              v415 = objc_msgSend_shortSSID(v8, v410, v411, v412, v413);
            objc_msgSend_numberWithUnsignedInteger_(v414, v416, v415, v417, v418);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615F438;
            goto LABEL_207;
          case 74:
            objc_msgSend_RNRBSSList(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615F450;
            goto LABEL_207;
          case 75:
            if (objc_msgSend_associationDisallowedReason(v8, v37, v38, v39, v40))
              v90 = (void *)MEMORY[0x1E0C9AAB0];
            else
              v90 = (void *)MEMORY[0x1E0C9AAA0];
            v247 = &unk_1E615F468;
            goto LABEL_219;
          case 76:
            objc_msgSend_RNRChannelList(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615F480;
            goto LABEL_207;
          case 77:
            objc_msgSend_privateMACAddress(v8, v37, v38, v39, v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_1E615F498;
            goto LABEL_207;
          default:
            goto LABEL_222;
        }
        break;
      }
    }
  }
LABEL_224:

  return v15;
}

- (BOOL)isEqualToScanResult:(id)a3
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
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  BOOL v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int isFILSDiscoveryFrame;

  v4 = a3;
  objc_msgSend_SSID(self, v5, v6, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend_SSID(v4, v9, v10, v11, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend_SSID(self, v14, v15, v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_SSID(v4, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v19, v25, (uint64_t)v24, v26, v27))
      {
        objc_msgSend_BSSID(self, v28, v29, v30, v31);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          objc_msgSend_BSSID(v4, v32, v33, v34, v35);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            objc_msgSend_BSSID(self, v37, v38, v39, v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_BSSID(v4, v43, v44, v45, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_isEqual_(v42, v48, (uint64_t)v47, v49, v50)
              && (isFILSDiscoveryFrame = objc_msgSend_isFILSDiscoveryFrame(self, v51, v52, v53, v54),
                  isFILSDiscoveryFrame == objc_msgSend_isFILSDiscoveryFrame(v4, v55, v56, v57, v58)))
            {
              v64 = objc_msgSend_supportedSecurityTypes(self, v59, v60, v61, v62);
              v63 = v64 == objc_msgSend_supportedSecurityTypes(v4, v65, v66, v67, v68);
            }
            else
            {
              v63 = 0;
            }

          }
          else
          {
            v63 = 0;
          }

        }
        else
        {
          v63 = 0;
        }

      }
      else
      {
        v63 = 0;
      }

    }
    else
    {
      v63 = 0;
    }

  }
  else
  {
    v63 = 0;
  }

  return v63;
}

- (NSData)SSID
{
  uint64_t v2;
  uint64_t v3;

  return (NSData *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EDA8, v2, v3);
}

- (NSString)BSSID
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615ED78, v2, v3);
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

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EE50, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isFILSDiscoveryFrame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_networkFlags(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_containsObject_(v5, v6, (uint64_t)&unk_1E615EEC8, v7, v8);

  return v9;
}

- (NSArray)networkFlags
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F420, v2, v3);
}

- (CWFChannel)channel
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  CWFChannel *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EDC0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("CHANNEL"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v9, (uint64_t)CFSTR("CHANNEL_FLAGS"), v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v8)
    v14 = v12 == 0;
  else
    v14 = 1;
  if (v14)
  {
    v15 = 0;
  }
  else
  {
    v15 = objc_alloc_init(CWFChannel);
    v20 = objc_msgSend_unsignedIntegerValue(v8, v16, v17, v18, v19);
    objc_msgSend_setChannel_(v15, v21, v20, v22, v23);
    v28 = objc_msgSend_intValue(v13, v24, v25, v26, v27);
    objc_msgSend_setFlags_(v15, v29, v28, v30, v31);
  }

  return v15;
}

- (CWFNetworkProfile)matchingKnownNetworkProfile
{
  uint64_t v2;
  uint64_t v3;

  return (CWFNetworkProfile *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F3F0, v2, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

- (void)setInternal:(id)a3
{
  objc_storeStrong((id *)&self->_internal, a3);
}

- (NSDictionary)scanRecord
{
  uint64_t v2;
  uint64_t v3;

  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615ED90, v2, v3);
}

- (BOOL)isIBSS
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_APMode(self, a2, v2, v3, v4) == 1;
}

- (CWFScanResult)initWithScanRecord:(id)a3 includeProperties:(id)a4
{
  return (CWFScanResult *)objc_msgSend_initWithScanRecord_knownNetworkProfile_includeProperties_(self, a2, (uint64_t)a3, 0, (uint64_t)a4);
}

- (NSString)countryCode
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EDD8, v2, v3);
}

- (id)__requiredProperties
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], a2, (uint64_t)&unk_1E6160A58, v2, v3);
}

- (id)__descriptionForRSNAuthSel:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  if (a3 < 0x1A && ((0x30033FFu >> a3) & 1) != 0)
  {
    v5 = off_1E6135340[a3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<%i>"), v3, v4, a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (NSArray)RNRChannelList
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F480, v2, v3);
}

- (NSArray)RNRBSSList
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F450, v2, v3);
}

+ (id)supportedOSSpecificKeys
{
  if (qword_1ECFD6AE0 != -1)
    dispatch_once(&qword_1ECFD6AE0, &unk_1E6132820);
  return (id)qword_1ECFD6AD8;
}

- (id)JSONCompatibleKeyValueMap
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
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
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
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
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t isUnconfiguredAirPortBaseStation;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t isPasspoint;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t isPersonalHotspot;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t isAppleSWAP;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t isIBSS;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t isWEP;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t isWAPI;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t isWPA;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t isWPA2;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t isWPA3;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t isEAP;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t isPSK;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  int v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  int v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t isInternetAccessible;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t isAdditionalStepRequiredForAccess;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t isEmergencyServicesReachable;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t isUnauthenticatedEmergencyServiceAccessible;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  void *v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t isUnconfiguredDevice;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  void *v316;
  const char *v317;
  uint64_t v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  void *v328;
  const char *v329;
  uint64_t v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  void *v340;
  const char *v341;
  uint64_t v342;
  void *v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  uint64_t v354;
  void *v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  void *v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  void *v376;
  const char *v377;
  uint64_t v378;
  void *v379;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  void *v388;
  const char *v389;
  uint64_t v390;
  void *v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  void *v400;
  const char *v401;
  uint64_t v402;
  void *v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  void *v412;
  const char *v413;
  uint64_t v414;
  void *v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  void *v424;
  const char *v425;
  uint64_t v426;
  void *v427;
  const char *v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  void *v436;
  const char *v437;
  uint64_t v438;
  void *v439;
  const char *v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  void *v448;
  const char *v449;
  uint64_t v450;
  void *v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  void *v460;
  const char *v461;
  uint64_t v462;
  void *v463;
  const char *v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  const char *v469;
  uint64_t v470;
  uint64_t v471;
  void *v472;
  const char *v473;
  uint64_t v474;
  void *v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  const char *v481;
  uint64_t v482;
  uint64_t v483;
  void *v484;
  const char *v485;
  uint64_t v486;
  void *v487;
  const char *v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  const char *v493;
  uint64_t v494;
  uint64_t v495;
  void *v496;
  const char *v497;
  uint64_t v498;
  void *v499;
  const char *v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  const char *v505;
  uint64_t v506;
  uint64_t v507;
  void *v508;
  const char *v509;
  uint64_t v510;
  void *v511;
  const char *v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  const char *v517;
  uint64_t v518;
  uint64_t v519;
  void *v520;
  const char *v521;
  uint64_t v522;
  void *v523;
  const char *v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  const char *v529;
  uint64_t v530;
  uint64_t v531;
  void *v532;
  const char *v533;
  uint64_t v534;
  void *v535;
  const char *v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  const char *v541;
  uint64_t v542;
  uint64_t v543;
  void *v544;
  const char *v545;
  uint64_t v546;
  void *v547;
  const char *v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  const char *v553;
  uint64_t v554;
  uint64_t v555;
  void *v556;
  const char *v557;
  uint64_t v558;
  const char *v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  void *v563;
  const char *v564;
  uint64_t v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  void *v570;
  const char *v571;
  uint64_t v572;
  const char *v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  void *v577;
  const char *v578;
  uint64_t v579;
  const char *v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  void *v584;
  const char *v585;
  uint64_t v586;
  const char *v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  void *v591;
  const char *v592;
  uint64_t v593;
  const char *v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  void *v598;
  const char *v599;
  uint64_t v600;
  const char *v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  void *v605;
  const char *v606;
  uint64_t v607;
  const char *v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  void *v612;
  const char *v613;
  uint64_t v614;
  const char *v615;
  uint64_t v616;
  uint64_t v617;
  uint64_t v618;
  void *v619;
  const char *v620;
  uint64_t v621;
  const char *v622;
  uint64_t v623;
  uint64_t v624;
  uint64_t v625;
  void *v626;
  const char *v627;
  uint64_t v628;
  const char *v629;
  uint64_t v630;
  uint64_t v631;
  uint64_t v632;
  void *v633;
  const char *v634;
  uint64_t v635;
  const char *v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  void *v640;
  const char *v641;
  uint64_t v642;
  const char *v643;
  uint64_t v644;
  uint64_t v645;
  uint64_t v646;
  void *v647;
  const char *v648;
  uint64_t v649;
  const char *v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  void *v654;
  const char *v655;
  uint64_t v656;
  const char *v657;
  uint64_t v658;
  uint64_t v659;
  uint64_t v660;
  void *v661;
  const char *v662;
  uint64_t v663;
  const char *v664;
  uint64_t v665;
  uint64_t v666;
  uint64_t v667;
  void *v668;
  const char *v669;
  uint64_t v670;
  void *v671;
  const char *v672;
  uint64_t v673;
  uint64_t v674;
  uint64_t v675;
  uint64_t isWiFi6E;
  const char *v677;
  uint64_t v678;
  uint64_t v679;
  void *v680;
  const char *v681;
  uint64_t v682;
  void *v683;
  const char *v684;
  uint64_t v685;
  uint64_t v686;
  uint64_t v687;
  uint64_t isFILSDiscoveryFrame;
  const char *v689;
  uint64_t v690;
  uint64_t v691;
  void *v692;
  const char *v693;
  uint64_t v694;
  void *v695;
  const char *v696;
  uint64_t v697;
  uint64_t v698;
  uint64_t v699;
  uint64_t v700;
  const char *v701;
  uint64_t v702;
  uint64_t v703;
  void *v704;
  const char *v705;
  uint64_t v706;
  void *v707;
  const char *v708;
  uint64_t v709;
  uint64_t v710;
  uint64_t v711;
  uint64_t isAssociationDisallowed;
  const char *v713;
  uint64_t v714;
  uint64_t v715;
  void *v716;
  const char *v717;
  uint64_t v718;
  const char *v719;
  uint64_t v720;
  uint64_t v721;
  uint64_t v722;
  void *v723;
  const char *v724;
  uint64_t v725;
  const char *v726;
  uint64_t v727;
  uint64_t v728;
  uint64_t v729;
  uint64_t v730;
  void *v731;
  uint64_t v732;
  uint64_t i;
  void *v734;
  void *v735;
  const char *v736;
  uint64_t v737;
  uint64_t v738;
  const char *v739;
  uint64_t v740;
  const char *v741;
  uint64_t v742;
  uint64_t v743;
  uint64_t v744;
  void *v745;
  const char *v746;
  uint64_t v747;
  const char *v748;
  uint64_t v749;
  uint64_t v750;
  uint64_t v751;
  uint64_t v752;
  void *v753;
  uint64_t v754;
  uint64_t j;
  void *v756;
  void *v757;
  const char *v758;
  uint64_t v759;
  uint64_t v760;
  const char *v761;
  uint64_t v762;
  const char *v763;
  uint64_t v764;
  uint64_t v765;
  void *v766;
  void *v767;
  __int128 v769;
  __int128 v770;
  __int128 v771;
  __int128 v772;
  __int128 v773;
  __int128 v774;
  __int128 v775;
  __int128 v776;
  _BYTE v777[128];
  _BYTE v778[128];
  uint64_t v779;

  v779 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend_age(self, v5, v6, v7, v8);
  objc_msgSend_numberWithUnsignedInteger_(v4, v10, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("cache_age"), v15);

  objc_msgSend_channel(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_JSONCompatibleKeyValueMap(v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v26, (uint64_t)v25, (uint64_t)CFSTR("channel"), v27);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  v33 = objc_msgSend_RSSI(self, v29, v30, v31, v32);
  objc_msgSend_numberWithInteger_(v28, v34, v33, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, (uint64_t)CFSTR("rssi"), v39);

  v40 = (void *)MEMORY[0x1E0CB37E8];
  v45 = objc_msgSend_wasConnectedDuringSleep(self, v41, v42, v43, v44);
  objc_msgSend_numberWithBool_(v40, v46, v45, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v50, (uint64_t)v49, (uint64_t)CFSTR("wasConnectedDuringSleep"), v51);

  v52 = (void *)MEMORY[0x1E0CB37E8];
  v57 = objc_msgSend_noise(self, v53, v54, v55, v56);
  objc_msgSend_numberWithInteger_(v52, v58, v57, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v62, (uint64_t)v61, (uint64_t)CFSTR("noise"), v63);

  v64 = (void *)MEMORY[0x1E0CB37E8];
  v69 = objc_msgSend_beaconInterval(self, v65, v66, v67, v68);
  objc_msgSend_numberWithInteger_(v64, v70, v69, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v74, (uint64_t)v73, (uint64_t)CFSTR("beacon_interval"), v75);

  v76 = (void *)MEMORY[0x1E0CB37E8];
  isUnconfiguredAirPortBaseStation = objc_msgSend_isUnconfiguredAirPortBaseStation(self, v77, v78, v79, v80);
  objc_msgSend_numberWithBool_(v76, v82, isUnconfiguredAirPortBaseStation, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v86, (uint64_t)v85, (uint64_t)CFSTR("unconfigured_airport_base_station"), v87);

  v88 = (void *)MEMORY[0x1E0CB37E8];
  isPasspoint = objc_msgSend_isPasspoint(self, v89, v90, v91, v92);
  objc_msgSend_numberWithBool_(v88, v94, isPasspoint, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v98, (uint64_t)v97, (uint64_t)CFSTR("is_passpoint"), v99);

  v100 = (void *)MEMORY[0x1E0CB37E8];
  isPersonalHotspot = objc_msgSend_isPersonalHotspot(self, v101, v102, v103, v104);
  objc_msgSend_numberWithBool_(v100, v106, isPersonalHotspot, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v110, (uint64_t)v109, (uint64_t)CFSTR("is_personal_hotspot"), v111);

  v112 = (void *)MEMORY[0x1E0CB37E8];
  isAppleSWAP = objc_msgSend_isAppleSWAP(self, v113, v114, v115, v116);
  objc_msgSend_numberWithBool_(v112, v118, isAppleSWAP, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v122, (uint64_t)v121, (uint64_t)CFSTR("is_apple_swap"), v123);

  v124 = (void *)MEMORY[0x1E0CB37E8];
  isIBSS = objc_msgSend_isIBSS(self, v125, v126, v127, v128);
  objc_msgSend_numberWithBool_(v124, v130, isIBSS, v131, v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v134, (uint64_t)v133, (uint64_t)CFSTR("is_ibss"), v135);

  v136 = (void *)MEMORY[0x1E0CB37E8];
  isWEP = objc_msgSend_isWEP(self, v137, v138, v139, v140);
  objc_msgSend_numberWithBool_(v136, v142, isWEP, v143, v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v146, (uint64_t)v145, (uint64_t)CFSTR("is_wep"), v147);

  v148 = (void *)MEMORY[0x1E0CB37E8];
  isWAPI = objc_msgSend_isWAPI(self, v149, v150, v151, v152);
  objc_msgSend_numberWithBool_(v148, v154, isWAPI, v155, v156);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v158, (uint64_t)v157, (uint64_t)CFSTR("is_wapi"), v159);

  v160 = (void *)MEMORY[0x1E0CB37E8];
  isWPA = objc_msgSend_isWPA(self, v161, v162, v163, v164);
  objc_msgSend_numberWithBool_(v160, v166, isWPA, v167, v168);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v170, (uint64_t)v169, (uint64_t)CFSTR("is_wpa"), v171);

  v172 = (void *)MEMORY[0x1E0CB37E8];
  isWPA2 = objc_msgSend_isWPA2(self, v173, v174, v175, v176);
  objc_msgSend_numberWithBool_(v172, v178, isWPA2, v179, v180);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v182, (uint64_t)v181, (uint64_t)CFSTR("is_wpa2"), v183);

  v184 = (void *)MEMORY[0x1E0CB37E8];
  isWPA3 = objc_msgSend_isWPA3(self, v185, v186, v187, v188);
  objc_msgSend_numberWithBool_(v184, v190, isWPA3, v191, v192);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v194, (uint64_t)v193, (uint64_t)CFSTR("is_wpa3"), v195);

  v196 = (void *)MEMORY[0x1E0CB37E8];
  isEAP = objc_msgSend_isEAP(self, v197, v198, v199, v200);
  objc_msgSend_numberWithBool_(v196, v202, isEAP, v203, v204);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v206, (uint64_t)v205, (uint64_t)CFSTR("is_eap"), v207);

  v208 = (void *)MEMORY[0x1E0CB37E8];
  isPSK = objc_msgSend_isPSK(self, v209, v210, v211, v212);
  objc_msgSend_numberWithBool_(v208, v214, isPSK, v215, v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v218, (uint64_t)v217, (uint64_t)CFSTR("is_psk"), v219);

  v224 = objc_msgSend_strongestSupportedSecurityType(self, v220, v221, v222, v223);
  v229 = objc_msgSend_WAPISubtype(self, v225, v226, v227, v228);
  sub_1B06248F4(v224, 0, v229, v230, v231);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v233, (uint64_t)v232, (uint64_t)CFSTR("strongest_supported_security_type"), v234);

  v239 = objc_msgSend_supportedPHYModes(self, v235, v236, v237, v238);
  sub_1B0625874(v239, v240, v241, v242, v243);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v245, (uint64_t)v244, (uint64_t)CFSTR("supported_phy_modes"), v246);

  v251 = objc_msgSend_fastestSupportedPHYMode(self, v247, v248, v249, v250);
  sub_1B0625874(v251, v252, v253, v254, v255);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v257, (uint64_t)v256, (uint64_t)CFSTR("fastest_supported_phy_mode"), v258);

  v259 = (void *)MEMORY[0x1E0CB37E8];
  isInternetAccessible = objc_msgSend_isInternetAccessible(self, v260, v261, v262, v263);
  objc_msgSend_numberWithBool_(v259, v265, isInternetAccessible, v266, v267);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v269, (uint64_t)v268, (uint64_t)CFSTR("is_internet_accessible"), v270);

  v271 = (void *)MEMORY[0x1E0CB37E8];
  isAdditionalStepRequiredForAccess = objc_msgSend_isAdditionalStepRequiredForAccess(self, v272, v273, v274, v275);
  objc_msgSend_numberWithBool_(v271, v277, isAdditionalStepRequiredForAccess, v278, v279);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v281, (uint64_t)v280, (uint64_t)CFSTR("is_additional_step_required_for_access"), v282);

  v283 = (void *)MEMORY[0x1E0CB37E8];
  isEmergencyServicesReachable = objc_msgSend_isEmergencyServicesReachable(self, v284, v285, v286, v287);
  objc_msgSend_numberWithBool_(v283, v289, isEmergencyServicesReachable, v290, v291);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v293, (uint64_t)v292, (uint64_t)CFSTR("is_emergency_services_reachable"), v294);

  v295 = (void *)MEMORY[0x1E0CB37E8];
  isUnauthenticatedEmergencyServiceAccessible = objc_msgSend_isUnauthenticatedEmergencyServiceAccessible(self, v296, v297, v298, v299);
  objc_msgSend_numberWithBool_(v295, v301, isUnauthenticatedEmergencyServiceAccessible, v302, v303);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v305, (uint64_t)v304, (uint64_t)CFSTR("is_unauthenticated_emergency_services_accessible"), v306);

  v307 = (void *)MEMORY[0x1E0CB37E8];
  isUnconfiguredDevice = objc_msgSend_isUnconfiguredDevice(self, v308, v309, v310, v311);
  objc_msgSend_numberWithBool_(v307, v313, isUnconfiguredDevice, v314, v315);
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v317, (uint64_t)v316, (uint64_t)CFSTR("is_unconfigured_device"), v318);

  v319 = (void *)MEMORY[0x1E0CB37E8];
  v324 = objc_msgSend_providesInternetAccess(self, v320, v321, v322, v323);
  objc_msgSend_numberWithBool_(v319, v325, v324, v326, v327);
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v329, (uint64_t)v328, (uint64_t)CFSTR("provides_internet_access"), v330);

  v331 = (void *)MEMORY[0x1E0CB37E8];
  v336 = objc_msgSend_venueType(self, v332, v333, v334, v335);
  objc_msgSend_numberWithInteger_(v331, v337, v336, v338, v339);
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v341, (uint64_t)v340, (uint64_t)CFSTR("venue_type"), v342);

  v343 = (void *)MEMORY[0x1E0CB37E8];
  v348 = objc_msgSend_venueGroup(self, v344, v345, v346, v347);
  objc_msgSend_numberWithInteger_(v343, v349, v348, v350, v351);
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v353, (uint64_t)v352, (uint64_t)CFSTR("venue_group"), v354);

  v355 = (void *)MEMORY[0x1E0CB37E8];
  v360 = objc_msgSend_supportsWPS(self, v356, v357, v358, v359);
  objc_msgSend_numberWithBool_(v355, v361, v360, v362, v363);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v365, (uint64_t)v364, (uint64_t)CFSTR("supports_wps"), v366);

  v367 = (void *)MEMORY[0x1E0CB37E8];
  v372 = objc_msgSend_supportsiAPOverWiFi(self, v368, v369, v370, v371);
  objc_msgSend_numberWithBool_(v367, v373, v372, v374, v375);
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v377, (uint64_t)v376, (uint64_t)CFSTR("supports_iap_over_wifi"), v378);

  v379 = (void *)MEMORY[0x1E0CB37E8];
  v384 = objc_msgSend_supports2GHzNetworks(self, v380, v381, v382, v383);
  objc_msgSend_numberWithBool_(v379, v385, v384, v386, v387);
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v389, (uint64_t)v388, (uint64_t)CFSTR("supports_2ghz_networks"), v390);

  v391 = (void *)MEMORY[0x1E0CB37E8];
  v396 = objc_msgSend_supports5GHzNetworks(self, v392, v393, v394, v395);
  objc_msgSend_numberWithBool_(v391, v397, v396, v398, v399);
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v401, (uint64_t)v400, (uint64_t)CFSTR("supports_5ghz_networks"), v402);

  v403 = (void *)MEMORY[0x1E0CB37E8];
  v408 = objc_msgSend_supportsCarPlay(self, v404, v405, v406, v407);
  objc_msgSend_numberWithBool_(v403, v409, v408, v410, v411);
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v413, (uint64_t)v412, (uint64_t)CFSTR("supports_carplay"), v414);

  v415 = (void *)MEMORY[0x1E0CB37E8];
  v420 = objc_msgSend_supportsHomeKit(self, v416, v417, v418, v419);
  objc_msgSend_numberWithBool_(v415, v421, v420, v422, v423);
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v425, (uint64_t)v424, (uint64_t)CFSTR("supports_homekit"), v426);

  v427 = (void *)MEMORY[0x1E0CB37E8];
  v432 = objc_msgSend_supportsHomeKit2(self, v428, v429, v430, v431);
  objc_msgSend_numberWithBool_(v427, v433, v432, v434, v435);
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v437, (uint64_t)v436, (uint64_t)CFSTR("supports_homekit2"), v438);

  v439 = (void *)MEMORY[0x1E0CB37E8];
  v444 = objc_msgSend_supportsAirPlay(self, v440, v441, v442, v443);
  objc_msgSend_numberWithBool_(v439, v445, v444, v446, v447);
  v448 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v449, (uint64_t)v448, (uint64_t)CFSTR("supports_airplay"), v450);

  v451 = (void *)MEMORY[0x1E0CB37E8];
  v456 = objc_msgSend_supportsAirPlay2(self, v452, v453, v454, v455);
  objc_msgSend_numberWithBool_(v451, v457, v456, v458, v459);
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v461, (uint64_t)v460, (uint64_t)CFSTR("supports_airplay2"), v462);

  v463 = (void *)MEMORY[0x1E0CB37E8];
  v468 = objc_msgSend_supportsAirPrint(self, v464, v465, v466, v467);
  objc_msgSend_numberWithBool_(v463, v469, v468, v470, v471);
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v473, (uint64_t)v472, (uint64_t)CFSTR("supports_airprint"), v474);

  v475 = (void *)MEMORY[0x1E0CB37E8];
  v480 = objc_msgSend_supportsMFi(self, v476, v477, v478, v479);
  objc_msgSend_numberWithBool_(v475, v481, v480, v482, v483);
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v485, (uint64_t)v484, (uint64_t)CFSTR("supports_mfi"), v486);

  v487 = (void *)MEMORY[0x1E0CB37E8];
  v492 = objc_msgSend_supportsMFi(self, v488, v489, v490, v491);
  objc_msgSend_numberWithBool_(v487, v493, v492, v494, v495);
  v496 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v497, (uint64_t)v496, (uint64_t)CFSTR("supports_mfi"), v498);

  v499 = (void *)MEMORY[0x1E0CB37E8];
  v504 = objc_msgSend_supportsMFiHardwareAuth(self, v500, v501, v502, v503);
  objc_msgSend_numberWithBool_(v499, v505, v504, v506, v507);
  v508 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v509, (uint64_t)v508, (uint64_t)CFSTR("supports_mfi_hardware_auth"), v510);

  v511 = (void *)MEMORY[0x1E0CB37E8];
  v516 = objc_msgSend_supportsMFiSoftwareTokenAuth(self, v512, v513, v514, v515);
  objc_msgSend_numberWithBool_(v511, v517, v516, v518, v519);
  v520 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v521, (uint64_t)v520, (uint64_t)CFSTR("supports_mfi_software_token_auth"), v522);

  v523 = (void *)MEMORY[0x1E0CB37E8];
  v528 = objc_msgSend_supportsMFiSoftwareCertAuth(self, v524, v525, v526, v527);
  objc_msgSend_numberWithBool_(v523, v529, v528, v530, v531);
  v532 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v533, (uint64_t)v532, (uint64_t)CFSTR("supports_mfi_software_cert_auth"), v534);

  v535 = (void *)MEMORY[0x1E0CB37E8];
  v540 = objc_msgSend_supportsSecureWAC(self, v536, v537, v538, v539);
  objc_msgSend_numberWithBool_(v535, v541, v540, v542, v543);
  v544 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v545, (uint64_t)v544, (uint64_t)CFSTR("supports_secure_wac"), v546);

  v547 = (void *)MEMORY[0x1E0CB37E8];
  v552 = objc_msgSend_supportsWoW(self, v548, v549, v550, v551);
  objc_msgSend_numberWithBool_(v547, v553, v552, v554, v555);
  v556 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v557, (uint64_t)v556, (uint64_t)CFSTR("supports_wow"), v558);

  objc_msgSend_countryCode(self, v559, v560, v561, v562);
  v563 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v564, (uint64_t)v563, (uint64_t)CFSTR("country_code"), v565);

  objc_msgSend_networkName(self, v566, v567, v568, v569);
  v570 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v571, (uint64_t)v570, (uint64_t)CFSTR("networkName"), v572);

  objc_msgSend_BSSID(self, v573, v574, v575, v576);
  v577 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v578, (uint64_t)v577, (uint64_t)CFSTR("bssid"), v579);

  objc_msgSend_HESSID(self, v580, v581, v582, v583);
  v584 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v585, (uint64_t)v584, (uint64_t)CFSTR("hessid"), v586);

  objc_msgSend_friendlyName(self, v587, v588, v589, v590);
  v591 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v592, (uint64_t)v591, (uint64_t)CFSTR("friendly_name"), v593);

  objc_msgSend_manufacturerName(self, v594, v595, v596, v597);
  v598 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v599, (uint64_t)v598, (uint64_t)CFSTR("manufacturer_name"), v600);

  objc_msgSend_modelName(self, v601, v602, v603, v604);
  v605 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v606, (uint64_t)v605, (uint64_t)CFSTR("model_name"), v607);

  objc_msgSend_displayName(self, v608, v609, v610, v611);
  v612 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v613, (uint64_t)v612, (uint64_t)CFSTR("display_name"), v614);

  objc_msgSend_primaryMAC(self, v615, v616, v617, v618);
  v619 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v620, (uint64_t)v619, (uint64_t)CFSTR("primary_mac"), v621);

  objc_msgSend_bluetoothMAC(self, v622, v623, v624, v625);
  v626 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v627, (uint64_t)v626, (uint64_t)CFSTR("bluetooth_name"), v628);

  objc_msgSend_deviceID(self, v629, v630, v631, v632);
  v633 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v634, (uint64_t)v633, (uint64_t)CFSTR("device_id"), v635);

  objc_msgSend_cellularNetworkInfo(self, v636, v637, v638, v639);
  v640 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v641, (uint64_t)v640, (uint64_t)CFSTR("cellular_network_info"), v642);

  objc_msgSend_NAIRealmNameList(self, v643, v644, v645, v646);
  v647 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v648, (uint64_t)v647, (uint64_t)CFSTR("nai_realm_name_list"), v649);

  objc_msgSend_roamingConsortiumList(self, v650, v651, v652, v653);
  v654 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v655, (uint64_t)v654, (uint64_t)CFSTR("roaming_consortium_list"), v656);

  objc_msgSend_operatorFriendlyNameList(self, v657, v658, v659, v660);
  v661 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v662, (uint64_t)v661, (uint64_t)CFSTR("operator_friendly_name_list"), v663);

  objc_msgSend_domainNameList(self, v664, v665, v666, v667);
  v668 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v669, (uint64_t)v668, (uint64_t)CFSTR("domain_name_list"), v670);

  v671 = (void *)MEMORY[0x1E0CB37E8];
  isWiFi6E = objc_msgSend_isWiFi6E(self, v672, v673, v674, v675);
  objc_msgSend_numberWithBool_(v671, v677, isWiFi6E, v678, v679);
  v680 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v681, (uint64_t)v680, (uint64_t)CFSTR("is_6e"), v682);

  v683 = (void *)MEMORY[0x1E0CB37E8];
  isFILSDiscoveryFrame = objc_msgSend_isFILSDiscoveryFrame(self, v684, v685, v686, v687);
  objc_msgSend_numberWithBool_(v683, v689, isFILSDiscoveryFrame, v690, v691);
  v692 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v693, (uint64_t)v692, (uint64_t)CFSTR("is_filsd"), v694);

  v695 = (void *)MEMORY[0x1E0CB37E8];
  v700 = objc_msgSend_shortSSID(self, v696, v697, v698, v699);
  objc_msgSend_numberWithUnsignedInteger_(v695, v701, v700, v702, v703);
  v704 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v705, (uint64_t)v704, (uint64_t)CFSTR("short_ssid"), v706);

  v707 = (void *)MEMORY[0x1E0CB37E8];
  isAssociationDisallowed = objc_msgSend_isAssociationDisallowed(self, v708, v709, v710, v711);
  objc_msgSend_numberWithBool_(v707, v713, isAssociationDisallowed, v714, v715);
  v716 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v717, (uint64_t)v716, (uint64_t)CFSTR("is_assoc_disallowed"), v718);

  v775 = 0u;
  v776 = 0u;
  v773 = 0u;
  v774 = 0u;
  objc_msgSend_RNRBSSList(self, v719, v720, v721, v722);
  v723 = (void *)objc_claimAutoreleasedReturnValue();
  v725 = objc_msgSend_countByEnumeratingWithState_objects_count_(v723, v724, (uint64_t)&v773, (uint64_t)v778, 16);
  if (v725)
  {
    v730 = v725;
    v731 = 0;
    v732 = *(_QWORD *)v774;
    do
    {
      for (i = 0; i != v730; ++i)
      {
        if (*(_QWORD *)v774 != v732)
          objc_enumerationMutation(v723);
        v734 = *(void **)(*((_QWORD *)&v773 + 1) + 8 * i);
        if (!v731)
        {
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v726, v727, v728, v729);
          v731 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_JSONCompatibleKeyValueMap(v734, v726, v727, v728, v729);
        v735 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v731, v736, (uint64_t)v735, v737, v738);

      }
      v730 = objc_msgSend_countByEnumeratingWithState_objects_count_(v723, v726, (uint64_t)&v773, (uint64_t)v778, 16);
    }
    while (v730);
  }
  else
  {
    v731 = 0;
  }

  objc_msgSend_setObject_forKeyedSubscript_(v3, v739, (uint64_t)v731, (uint64_t)CFSTR("rnr_bss_list"), v740);
  v771 = 0u;
  v772 = 0u;
  v769 = 0u;
  v770 = 0u;
  objc_msgSend_RNRChannelList(self, v741, v742, v743, v744, 0);
  v745 = (void *)objc_claimAutoreleasedReturnValue();
  v747 = objc_msgSend_countByEnumeratingWithState_objects_count_(v745, v746, (uint64_t)&v769, (uint64_t)v777, 16);
  if (v747)
  {
    v752 = v747;
    v753 = 0;
    v754 = *(_QWORD *)v770;
    do
    {
      for (j = 0; j != v752; ++j)
      {
        if (*(_QWORD *)v770 != v754)
          objc_enumerationMutation(v745);
        v756 = *(void **)(*((_QWORD *)&v769 + 1) + 8 * j);
        if (!v753)
        {
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v748, v749, v750, v751);
          v753 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_JSONCompatibleKeyValueMap(v756, v748, v749, v750, v751);
        v757 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v753, v758, (uint64_t)v757, v759, v760);

      }
      v752 = objc_msgSend_countByEnumeratingWithState_objects_count_(v745, v748, (uint64_t)&v769, (uint64_t)v777, 16);
    }
    while (v752);
  }
  else
  {
    v753 = 0;
  }

  objc_msgSend_setObject_forKeyedSubscript_(v3, v761, (uint64_t)v753, (uint64_t)CFSTR("rnr_channel_list"), v762);
  sub_1B06475A8(v3, 0, 1u);
  v766 = (void *)objc_claimAutoreleasedReturnValue();
  if (v766)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v763, (uint64_t)v766, v764, v765);
    v767 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v767 = 0;
  }

  return v767;
}

- (id)filteredScanResultWithProperties:(id)a3
{
  id v4;
  CWFScanResult *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
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
  const char *v45;
  uint64_t v46;
  uint64_t v47;

  v4 = a3;
  v5 = objc_alloc_init(CWFScanResult);
  v10 = (void *)objc_msgSend_mutableCopy(self->_internal, v6, v7, v8, v9);
  objc_msgSend_properties(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend_mutableCopy(v15, v16, v17, v18, v19);

  objc_msgSend___requiredProperties(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v20, v26, (uint64_t)v25, v27, v28);

  if (v4)
  {
    objc_msgSend_minusSet_(v20, v29, (uint64_t)v4, v31, v32);
  }
  else
  {
    objc_msgSend___defaultProperties(self, v29, v30, v31, v32);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_minusSet_(v20, v38, (uint64_t)v37, v39, v40);

  }
  objc_msgSend_allObjects(v20, v33, v34, v35, v36);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectsForKeys_(v10, v42, (uint64_t)v41, v43, v44);

  objc_msgSend_setInternal_(v5, v45, (uint64_t)v10, v46, v47);
  return v5;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v4 = a3;
  v9 = objc_msgSend_weakestSupportedSecurityType(self, v5, v6, v7, v8);
  v14 = objc_msgSend_weakestSupportedSecurityType(v4, v10, v11, v12, v13);
  v19 = objc_msgSend_strongestSupportedSecurityType(self, v15, v16, v17, v18);
  v24 = objc_msgSend_strongestSupportedSecurityType(v4, v20, v21, v22, v23);
  v29 = objc_msgSend_WAPISubtype(self, v25, v26, v27, v28);
  v34 = objc_msgSend_WAPISubtype(v4, v30, v31, v32, v33);

  if (v9 == v14)
  {
    if (v19 == v24)
      return 0;
    v36 = v19;
    v37 = v29;
    v38 = v24;
  }
  else
  {
    v36 = v9;
    v37 = v29;
    v38 = v14;
  }
  return CWFCompareSecurityType(v36, 0, v37, v38, 0, v34);
}

- (int64_t)compareSupportedPHYModes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v26;
  int v27;

  v4 = a3;
  v9 = objc_msgSend_fastestSupportedPHYMode(self, v5, v6, v7, v8);
  v14 = objc_msgSend_slowestSupportedPHYMode(self, v10, v11, v12, v13);
  v19 = objc_msgSend_fastestSupportedPHYMode(v4, v15, v16, v17, v18);
  v24 = objc_msgSend_slowestSupportedPHYMode(v4, v20, v21, v22, v23);

  if (v9 == v19)
  {
    if (v14 == v24)
      return 0;
    v26 = v14;
    v27 = v24;
  }
  else
  {
    v26 = v9;
    v27 = v19;
  }
  return CWFComparePHYMode(v26, v27);
}

- (int64_t)compareLowDataModes:(id)a3
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;

  v4 = a3;
  objc_msgSend_matchingKnownNetworkProfile(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_lowDataMode(v9, v10, v11, v12, v13);

  objc_msgSend_matchingKnownNetworkProfile(v4, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend_lowDataMode(v19, v20, v21, v22, v23);
  v25 = v24 == 1;
  if (v14 == 1)
    v25 = -1;
  if (v14 == v24)
    return 0;
  else
    return v25;
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

  v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  v11 = objc_msgSend_WAPISubtype(self, v7, v8, v9, v10);
  return CWFStrongestSecurityType(v6, v11, 0);
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

  v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  v11 = objc_msgSend_WAPISubtype(self, v7, v8, v9, v10);
  return CWFWeakestSecurityType(v6, v11, 0);
}

- (id)networkProfile
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CWFNetworkProfile *v6;
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
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t isPersonalHotspot;
  const char *v44;
  uint64_t v45;
  uint64_t v46;

  objc_msgSend_matchingKnownNetworkProfile(self, a2, v2, v3, v4);
  v6 = (CWFNetworkProfile *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(CWFNetworkProfile);
    objc_msgSend_SSID(self, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSSID_(v6, v12, (uint64_t)v11, v13, v14);

    v19 = objc_msgSend_supportedSecurityTypes(self, v15, v16, v17, v18);
    objc_msgSend_setSupportedSecurityTypes_(v6, v20, v19, v21, v22);
    v27 = objc_msgSend_WAPISubtype(self, v23, v24, v25, v26);
    objc_msgSend_setWAPISubtype_(v6, v28, v27, v29, v30);
    v35 = objc_msgSend_supportsCarPlay(self, v31, v32, v33, v34);
    objc_msgSend_setCarplayNetwork_(v6, v36, v35, v37, v38);
    isPersonalHotspot = objc_msgSend_isPersonalHotspot(self, v39, v40, v41, v42);
    objc_msgSend_setPersonalHotspot_(v6, v44, isPersonalHotspot, v45, v46);
  }
  return v6;
}

- (int)fastestSupportedPHYMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  int v7;
  int v8;
  int v9;

  v5 = objc_msgSend_supportedPHYModes(self, a2, v2, v3, v4);
  v6 = v5 & 4;
  if ((v5 & 8) != 0)
    v6 = 8;
  if ((v5 & 2) != 0)
    v7 = 2;
  else
    v7 = v6;
  if ((v5 & 0x10) != 0)
    v8 = 16;
  else
    v8 = v7;
  if ((v5 & 0x80) != 0)
    v9 = 128;
  else
    v9 = v8;
  if ((v5 & 0x100) != 0)
    return 256;
  else
    return v9;
}

- (int)slowestSupportedPHYMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  int v7;
  int v8;
  int v9;

  v5 = objc_msgSend_supportedPHYModes(self, a2, v2, v3, v4);
  v6 = v5 & 0x100;
  if ((v5 & 0x80) != 0)
    v6 = 128;
  if ((v5 & 0x10) != 0)
    v7 = 16;
  else
    v7 = v6;
  if ((v5 & 2) != 0)
    v8 = 2;
  else
    v8 = v7;
  if ((v5 & 8) != 0)
    v9 = 8;
  else
    v9 = v8;
  if ((v5 & 4) != 0)
    return 4;
  else
    return v9;
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

- (BOOL)wasConnectedDuringSleep
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EE08, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)noise
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EE20, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isESS
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_APMode(self, a2, v2, v3, v4) == 2;
}

- (BOOL)isHotspot
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
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
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v24;

  objc_msgSend_matchingKnownNetworkProfile(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isHotspot(v6, v7, v8, v9, v10) & 1) != 0
    || (objc_msgSend_isPasspoint(self, v11, v12, v13, v14) & 1) != 0
    || objc_msgSend_accessNetworkType(self, v15, v16, v17, v18) == 2)
  {

    return 1;
  }
  v24 = objc_msgSend_accessNetworkType(self, v19, v20, v21, v22);

  return v24 == 3;
}

- (BOOL)isUnconfiguredAirPortBaseStation
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EF40, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSData)informationElementData
{
  uint64_t v2;
  uint64_t v3;

  return (NSData *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EF10, v2, v3);
}

- (unint64_t)timestamp
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F408, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
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

  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0x57) != 0;
}

- (BOOL)isEAP
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0xA8) != 0;
}

- (void)setOSSpecificAttributes:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
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
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  id v37;
  int *v38;
  uint64_t v39;
  CWFScanResult *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  int v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    v40 = self;
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend_allKeys(v8, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v41, (uint64_t)v53, 16);
    if (v16)
    {
      v21 = v16;
      v22 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v14);
          v24 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend_supportedOSSpecificKeys(CWFScanResult, v17, v18, v19, v20, v38, v39);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend_containsObject_(v25, v26, v24, v27, v28);

          if (v29)
          {
            objc_msgSend_objectForKeyedSubscript_(v8, v30, v24, v31, v32);
            v33 = objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v9, v34, (uint64_t)v33, v24, v35);
          }
          else
          {
            CWFGetOSLog();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              CWFGetOSLog();
              v33 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v33 = MEMORY[0x1E0C81028];
              v37 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            {
              v45 = 136446978;
              v46 = "-[CWFScanResult setOSSpecificAttributes:]";
              v47 = 2082;
              v48 = "CWFScanResult.m";
              v49 = 1024;
              v50 = 1083;
              v51 = 2112;
              v52 = v24;
              LODWORD(v39) = 38;
              v38 = &v45;
              _os_log_send_and_compose_impl();
            }
          }

        }
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v41, (uint64_t)v53, 16);
      }
      while (v21);
    }

    self = v40;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v4, (uint64_t)v9, (uint64_t)&unk_1E615F3D8, v7, v38, v39);

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

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F3D8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_copy(v4, v5, v6, v7, v8);

  return (NSDictionary *)v9;
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
    && (objc_msgSend_supportedOSSpecificKeys(CWFScanResult, v7, v8, v9, v10),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend_containsObject_(v12, v13, (uint64_t)v11, v14, v15),
        v12,
        v16))
  {
    objc_msgSend_objectForKeyedSubscript_(self->_internal, v17, (uint64_t)&unk_1E615F3D8, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && !v20)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v26, (uint64_t)v25, (uint64_t)&unk_1E615F3D8, v27);

    }
    objc_msgSend_objectForKeyedSubscript_(self->_internal, v21, (uint64_t)&unk_1E615F3D8, v23, v24);
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
    objc_msgSend_objectForKeyedSubscript_(internal, v5, (uint64_t)&unk_1E615F3D8, v6, v7);
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

- (void)setMatchingKnownNetworkProfile:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  v8 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615F3F0, v7);

}

- (BOOL)isMetered
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
  BOOL v14;
  void *v15;
  const char *v16;
  uint64_t v17;
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
  int v28;

  if ((objc_msgSend_isPasspoint(self, a2, v2, v3, v4) & 1) != 0)
  {
    v14 = objc_msgSend_accessNetworkType(self, v6, v7, v8, v9) == 2;
  }
  else
  {
    objc_msgSend_matchingKnownNetworkProfile(self, v6, v7, v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isCaptive(v15, v16, v17, v18, v19))
      v14 = objc_msgSend_accessNetworkType(self, v20, v21, v22, v23) == 2;
    else
      v14 = 0;

  }
  if ((objc_msgSend_isPersonalHotspot(self, v10, v11, v12, v13) & 1) != 0
    || v14
    || (v28 = objc_msgSend_supportsCarPlay(self, v24, v25, v26, v27)) != 0)
  {
    LOBYTE(v28) = 1;
  }
  return v28;
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
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  return (objc_msgSend_isOpen(self, a2, v2, v3, v4) & 1) == 0
      && (objc_msgSend_isOWE(self, v6, v7, v8, v9) & 1) == 0
      && (!objc_msgSend_isWEP(self, v10, v11, v12, v13)
       || (objc_msgSend_isPSK(self, v14, v15, v16, v17) & 1) == 0)
      && (!objc_msgSend_isWPA(self, v14, v15, v16, v17)
       || (objc_msgSend_isPSK(self, v18, v19, v20, v21) & 1) == 0)
      && (objc_msgSend_isWAPI(self, v18, v19, v20, v21) & 1) == 0
      && (objc_msgSend_isPasspoint(self, v22, v23, v24, v25) & 1) == 0
      && (objc_msgSend_hasWEP40Cipher(self, v26, v27, v28, v29) & 1) == 0
      && (objc_msgSend_hasWEP104Cipher(self, v30, v31, v32, v33) & 1) == 0
      && !objc_msgSend_hasTKIPCipher(self, v34, v35, v36, v37);
}

- (NSArray)WPAUnicastCiphers
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F318, v2, v3);
}

- (unint64_t)WPAMulticastCipher
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F330, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSArray)WPAAuthSelectors
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F348, v2, v3);
}

- (NSArray)RSNUnicastCiphers
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F360, v2, v3);
}

- (unint64_t)RSNMulticastCipher
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F378, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSArray)RSNAuthSelectors
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F3A8, v2, v3);
}

- (int)RSNCapabilities
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F3C0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isMFPCapable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (objc_msgSend_RSNCapabilities(self, a2, v2, v3, v4) >> 7) & 1;
}

- (BOOL)isMFPRequired
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (objc_msgSend_RSNCapabilities(self, a2, v2, v3, v4) >> 6) & 1;
}

- (BOOL)hasWEP40Cipher
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
  uint64_t v14;
  id v15;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_WPAMulticastCipher(self, a2, v2, v3, v4) != 1
    && objc_msgSend_RSNMulticastCipher(self, v6, v7, v8, v9) != 1)
  {
    objc_msgSend_WPAUnicastCiphers(self, v10, v11, v12, v13);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v17)
    {
      v22 = v17;
      v23 = *(_QWORD *)v43;
LABEL_6:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v23)
          objc_enumerationMutation(v15);
        if (objc_msgSend_intValue(*(void **)(*((_QWORD *)&v42 + 1) + 8 * v24), v18, v19, v20, v21) == 1)
          break;
        if (v22 == ++v24)
        {
          v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v42, (uint64_t)v47, 16);
          if (v22)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      objc_msgSend_RSNUnicastCiphers(self, v25, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v15 = v29;
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v30, (uint64_t)&v38, (uint64_t)v46, 16);
      if (!v14)
      {
LABEL_22:

        return v14;
      }
      v35 = *(_QWORD *)v39;
LABEL_14:
      v36 = 0;
      while (1)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(v15);
        if (objc_msgSend_intValue(*(void **)(*((_QWORD *)&v38 + 1) + 8 * v36), v31, v32, v33, v34, (_QWORD)v38) == 1)break;
        if (v14 == ++v36)
        {
          v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v31, (uint64_t)&v38, (uint64_t)v46, 16);
          if (v14)
            goto LABEL_14;
          goto LABEL_22;
        }
      }
    }
    LOBYTE(v14) = 1;
    goto LABEL_22;
  }
  LOBYTE(v14) = 1;
  return v14;
}

- (BOOL)hasWEP104Cipher
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
  uint64_t v14;
  id v15;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_WPAMulticastCipher(self, a2, v2, v3, v4) != 5
    && objc_msgSend_RSNMulticastCipher(self, v6, v7, v8, v9) != 5)
  {
    objc_msgSend_WPAUnicastCiphers(self, v10, v11, v12, v13);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v17)
    {
      v22 = v17;
      v23 = *(_QWORD *)v43;
LABEL_6:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v23)
          objc_enumerationMutation(v15);
        if (objc_msgSend_intValue(*(void **)(*((_QWORD *)&v42 + 1) + 8 * v24), v18, v19, v20, v21) == 5)
          break;
        if (v22 == ++v24)
        {
          v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v42, (uint64_t)v47, 16);
          if (v22)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      objc_msgSend_RSNUnicastCiphers(self, v25, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v15 = v29;
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v30, (uint64_t)&v38, (uint64_t)v46, 16);
      if (!v14)
      {
LABEL_22:

        return v14;
      }
      v35 = *(_QWORD *)v39;
LABEL_14:
      v36 = 0;
      while (1)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(v15);
        if (objc_msgSend_intValue(*(void **)(*((_QWORD *)&v38 + 1) + 8 * v36), v31, v32, v33, v34, (_QWORD)v38) == 5)break;
        if (v14 == ++v36)
        {
          v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v31, (uint64_t)&v38, (uint64_t)v46, 16);
          if (v14)
            goto LABEL_14;
          goto LABEL_22;
        }
      }
    }
    LOBYTE(v14) = 1;
    goto LABEL_22;
  }
  LOBYTE(v14) = 1;
  return v14;
}

- (BOOL)hasTKIPCipher
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
  uint64_t v14;
  id v15;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_WPAMulticastCipher(self, a2, v2, v3, v4) != 2
    && objc_msgSend_RSNMulticastCipher(self, v6, v7, v8, v9) != 2)
  {
    objc_msgSend_WPAUnicastCiphers(self, v10, v11, v12, v13);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v17)
    {
      v22 = v17;
      v23 = *(_QWORD *)v43;
LABEL_6:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v23)
          objc_enumerationMutation(v15);
        if (objc_msgSend_intValue(*(void **)(*((_QWORD *)&v42 + 1) + 8 * v24), v18, v19, v20, v21) == 2)
          break;
        if (v22 == ++v24)
        {
          v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v42, (uint64_t)v47, 16);
          if (v22)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      objc_msgSend_RSNUnicastCiphers(self, v25, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v15 = v29;
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v30, (uint64_t)&v38, (uint64_t)v46, 16);
      if (!v14)
      {
LABEL_22:

        return v14;
      }
      v35 = *(_QWORD *)v39;
LABEL_14:
      v36 = 0;
      while (1)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(v15);
        if (objc_msgSend_intValue(*(void **)(*((_QWORD *)&v38 + 1) + 8 * v36), v31, v32, v33, v34, (_QWORD)v38) == 2)break;
        if (v14 == ++v36)
        {
          v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v31, (uint64_t)&v38, (uint64_t)v46, 16);
          if (v14)
            goto LABEL_14;
          goto LABEL_22;
        }
      }
    }
    LOBYTE(v14) = 1;
    goto LABEL_22;
  }
  LOBYTE(v14) = 1;
  return v14;
}

- (int)accessNetworkType
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EF70, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isInternetAccessible
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EF88, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isAdditionalStepRequiredForAccess
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EFA0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isEmergencyServicesReachable
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EFB8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isUnauthenticatedEmergencyServiceAccessible
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EFD0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)venueGroup
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615EFE8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)venueType
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F000, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)HESSID
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F018, v2, v3);
}

- (BOOL)isUnconfiguredDevice
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F030, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)providesInternetAccess
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F048, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsWPS
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F060, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsiAPOverWiFi
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F078, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supports2GHzNetworks
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F090, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supports5GHzNetworks
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F0A8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsMFi
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F150, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsMFiHardwareAuth
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F168, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsMFiSoftwareTokenAuth
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F180, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsMFiSoftwareCertAuth
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F198, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsHomeKit
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F0D8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsHomeKit2
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F0F0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsAirPrint
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F138, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsWoW
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F1C8, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsSecureWAC
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F1B0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsAirPlay
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F108, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsAirPlay2
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F120, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)friendlyName
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F1E0, v2, v3);
}

- (NSString)manufacturerName
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F1F8, v2, v3);
}

- (NSString)modelName
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F210, v2, v3);
}

- (NSString)displayName
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F228, v2, v3);
}

- (NSString)primaryMAC
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F240, v2, v3);
}

- (NSString)bluetoothMAC
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F258, v2, v3);
}

- (NSString)deviceID
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F270, v2, v3);
}

- (NSDictionary)ANQPResponse
{
  uint64_t v2;
  uint64_t v3;

  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F288, v2, v3);
}

- (NSArray)cellularNetworkInfo
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F2A0, v2, v3);
}

- (NSArray)NAIRealmNameList
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F2B8, v2, v3);
}

- (NSArray)roamingConsortiumList
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F2D0, v2, v3);
}

- (NSArray)operatorFriendlyNameList
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F2E8, v2, v3);
}

- (NSArray)domainNameList
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F300, v2, v3);
}

- (BOOL)hasNon6GHzRNRChannel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend_RNRChannelList(self, a2, v2, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v7)
  {
    v12 = v7;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v5);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend_is2GHz(v15, v8, v9, v10, v11) & 1) != 0
          || (objc_msgSend_is5GHz(v15, v16, v17, v18, v19) & 1) != 0)
        {
          v20 = 1;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v22, (uint64_t)v26, 16);
      v20 = 0;
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_13:

  return v20;
}

- (BOOL)isAssociationDisallowed
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F468, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isBackgroundScanResult
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_networkFlags(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_containsObject_(v5, v6, (uint64_t)&unk_1E615F4B0, v7, v8);

  return v9;
}

- (NSString)privateMACAddress
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615F498, v2, v3);
}

- (id)__descriptionForWPACipher:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  if (a3 < 6 && ((0x37u >> a3) & 1) != 0)
  {
    v5 = off_1E6135288[a3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<%i>"), v3, v4, a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)__descriptionForWPAAuthSel:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 < 3)
    return off_1E61352B8[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<%i>"), v3, v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)__descriptionForAirPortBaseStationModel:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  switch(a3)
  {
    case 'f':
      v5 = CFSTR("AirPort Express (802.11 b/g)");
      return v5;
    case 'g':
    case 'n':
    case 'o':
    case 'p':
    case 'v':
      goto LABEL_8;
    case 'h':
      return CFSTR("AirPort Extreme 802.11n (1st Generation)");
    case 'i':
      return CFSTR("AirPort Extreme 802.11n w/ Gigabit Ethernet (2nd Generation)");
    case 'j':
      return CFSTR("Time Capsule (1st Generation)");
    case 'k':
      return CFSTR("AirPort Express 802.11n (1st Generation)");
    case 'l':
      return CFSTR("AirPort Extreme 802.11n w/ Simultaneous Dual-Band (3rd Generation)");
    case 'm':
      return CFSTR("Time Capsule w/ Simultaneous Dual-Band (2nd Generation)");
    case 'q':
      return CFSTR("Time Capsule w/ Simultaneous Dual-Band (3rd Generation)");
    case 'r':
      return CFSTR("AirPort Extreme 802.11n w/ Simultaneous Dual-Band (4th Generation)");
    case 's':
      return CFSTR("AirPort Express 802.11n w/ Simultaneous Dual-Band (2nd Generation)");
    case 't':
      return CFSTR("Time Capsule w/ Simultaneous Dual-Band (4th Generation)");
    case 'u':
      return CFSTR("AirPort Extreme 802.11n w/ Simultaneous Dual-Band (5th Generation)");
    case 'w':
      return CFSTR("Time Capsule 802.11ac (5th Generation)");
    case 'x':
      return CFSTR("AirPort Extreme 802.11ac (6th Generation)");
    default:
      if (!a3)
        return 0;
      if (a3 == 3)
        return CFSTR("AirPort Extreme (802.11 b/g)");
LABEL_8:
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("? (%ld)"), v3, v4, a3);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v5;
  }
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
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;

  objc_msgSend_SSID(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_hash(v6, v7, v8, v9, v10);
  objc_msgSend_BSSID(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_hash(v16, v17, v18, v19, v20) ^ v11;
  v26 = v21 ^ objc_msgSend_isFILSDiscoveryFrame(self, v22, v23, v24, v25);
  v31 = v26 ^ objc_msgSend_supportedSecurityTypes(self, v27, v28, v29, v30);

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

  v6 = (void *)objc_msgSend_allocWithZone_(CWFScanResult, a2, (uint64_t)a3, v3, v4);
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

- (CWFScanResult)initWithCoder:(id)a3
{
  id v4;
  CWFScanResult *v5;
  uint64_t v6;
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
  void *v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CWFScanResult;
  v5 = -[CWFScanResult init](&v30, sel_init);
  if (v5)
  {
    v29 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend_setWithObjects_(v29, v15, v6, v16, v17, v7, v8, v9, v10, v11, v12, v13, v14, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, (uint64_t)CFSTR("_internal"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_mutableCopy(v21, v22, v23, v24, v25);
    internal = v5->_internal;
    v5->_internal = (NSMutableDictionary *)v26;

  }
  return v5;
}

- (NSMutableDictionary)internal
{
  return self->_internal;
}

@end
