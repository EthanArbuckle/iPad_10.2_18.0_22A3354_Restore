@implementation CWFBSS

- (BOOL)isEqual:(id)a3
{
  CWFBSS *v4;
  CWFBSS *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToBSS;

  v4 = (CWFBSS *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToBSS = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToBSS = objc_msgSend_isEqualToBSS_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToBSS = 0;
  }

  return isEqualToBSS;
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
  CWFBSS *v45;
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
          objc_msgSend_supportedOSSpecificKeys(CWFBSS, v13, v14, v15, v16, v43, v44);
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
              v52 = "-[CWFBSS setOSSpecificAttributes:]";
              v53 = 2082;
              v54 = "CWFBSS.m";
              v55 = 1024;
              v56 = 684;
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
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v5, (uint64_t)v31, (uint64_t)&unk_1E615E760, v8, v43, v44);
  else
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v5, (uint64_t)v9, (uint64_t)&unk_1E615E760, v8, v43, v44);

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
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
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
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_BSSID(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v17, (uint64_t)CFSTR("bssid=%@, "), v18, v19, v16);

  objc_msgSend_channel(self, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v25, (uint64_t)CFSTR("channel=%@"), v26, v27, v24);

  objc_msgSend_channel(self, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_is6GHz(v32, v33, v34, v35, v36) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend_colocated2GHzRNRChannel(self, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    objc_msgSend_colocated5GHzRNRChannel(self, v42, v43, v44, v45);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
      goto LABEL_7;
LABEL_5:
    objc_msgSend_appendString_(v6, v46, (uint64_t)CFSTR(", "), v47, v48);
    goto LABEL_14;
  }

LABEL_7:
  objc_msgSend_appendString_(v6, v46, (uint64_t)CFSTR(" ("), v47, v48);
  objc_msgSend_colocated2GHzRNRChannel(self, v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend_colocated2GHzRNRChannel(self, v59, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v64, (uint64_t)CFSTR("%@, "), v65, v66, v63);

  }
  objc_msgSend_colocated5GHzRNRChannel(self, v59, v60, v61, v62);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    objc_msgSend_colocated5GHzRNRChannel(self, v68, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v73, (uint64_t)CFSTR("%@, "), v74, v75, v72);

  }
  if (objc_msgSend_hasSuffix_(v6, v68, (uint64_t)CFSTR(", "), v70, v71))
  {
    v80 = objc_msgSend_length(v6, v76, v77, v78, v79);
    objc_msgSend_deleteCharactersInRange_(v6, v81, v80 - 2, 2, v82);
  }
  objc_msgSend_appendString_(v6, v76, (uint64_t)CFSTR("), "), v78, v79);
LABEL_14:
  objc_msgSend_lastAssociatedAt(self, v49, v50, v51, v52);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    objc_msgSend_lastAssociatedAt(self, v84, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0630E50(v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v90, (uint64_t)CFSTR("assoc=%@, "), v91, v92, v89);

  }
  if (objc_msgSend_hasSuffix_(v6, v84, (uint64_t)CFSTR(", "), v86, v87))
  {
    v97 = objc_msgSend_length(v6, v93, v94, v95, v96);
    objc_msgSend_deleteCharactersInRange_(v6, v98, v97 - 2, 2, v99);
  }
  return (NSString *)v6;
}

- (NSDate)lastAssociatedAt
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E778, v2, v3);
}

- (CWFChannel)channel
{
  uint64_t v2;
  uint64_t v3;

  return (CWFChannel *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E748, v2, v3);
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
  unint64_t v21;

  objc_msgSend_BSSID(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_hash(v6, v7, v8, v9, v10);
  objc_msgSend_internal(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_hash(v16, v17, v18, v19, v20) ^ v11;

  return v21;
}

- (void)setCoreWiFiSpecificAttributes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CWFBSS *v9;
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
  v9 = [CWFBSS alloc];
  v13 = (void *)objc_msgSend_initWithExternalForm_(v9, v10, (uint64_t)v4, v11, v12);

  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v14, (uint64_t)v34, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E60], v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___filteredBSSWithProperties_includeRequiredProperties_OSSpecificKeys_(v13, v23, (uint64_t)v17, 0, (uint64_t)v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  internal = self->_internal;
  objc_msgSend_internal(v24, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(internal, v31, (uint64_t)v30, v32, v33);

}

- (NSMutableDictionary)internal
{
  return self->_internal;
}

- (id)__filteredBSSWithProperties:(id)a3 includeRequiredProperties:(BOOL)a4 OSSpecificKeys:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  CWFBSS *v10;
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
  CWFBSS *v96;
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
  v10 = objc_alloc_init(CWFBSS);
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
  v52 = objc_msgSend_containsObject_(v8, v49, (uint64_t)&unk_1E615E760, v50, v51);
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

- (CWFBSS)initWithExternalForm:(id)a3
{
  uint64_t v3;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CWFBSS *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  CWFChannel *v40;
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
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
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
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const __CFString *v131;
  id obj;
  uint64_t v133;
  uint64_t v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = (CWFBSS *)objc_msgSend_init(self, v6, v7, v8, v9);
  if (v14)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v10, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    objc_msgSend_allKeys(v5, v16, v17, v18, v19);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v135, (uint64_t)v139, 16);
    if (v134)
    {
      v133 = *(_QWORD *)v136;
      v131 = CFSTR("ChannelFlags");
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v136 != v133)
            objc_enumerationMutation(obj);
          v25 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * v24);
          v26 = objc_msgSend___propertyForKey_(v14, v21, v25, v22, v23, v131);
          if (v26)
          {
            v27 = v26;
            v28 = v3;
            objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v21, v26, v22, v23);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v15, v30, (uint64_t)v29, v31, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              v3 = v28;
            }
            else
            {
              v3 = v28;
              switch(v27)
              {
                case 2:
                  objc_msgSend_objectForKeyedSubscript_(v5, v21, (uint64_t)CFSTR("Channel"), v22, v23);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v5, v35, (uint64_t)v131, v36, v37);
                  v38 = objc_claimAutoreleasedReturnValue();
                  v39 = (void *)v38;
                  if (!v34 || !v38)
                    goto LABEL_26;
                  v40 = objc_alloc_init(CWFChannel);
                  v45 = objc_msgSend_unsignedIntegerValue(v34, v41, v42, v43, v44);
                  objc_msgSend_setChannel_(v40, v46, v45, v47, v48);
                  v53 = objc_msgSend_unsignedIntValue(v39, v49, v50, v51, v52);
                  objc_msgSend_setFlags_(v40, v54, v53, v55, v56);
                  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v57, 2, v58, v59);
                  break;
                case 4:
                  objc_msgSend_objectForKeyedSubscript_(v5, v21, (uint64_t)CFSTR("Location"), v22, v23);
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend___locationFromInfo_(v14, v84, (uint64_t)v83, v85, v86);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v34
                    || (objc_msgSend___locationFromInfo_(v14, v87, (uint64_t)v5, v88, v89),
                        (v34 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                  {
                    objc_msgSend___infoForLocation_(v14, v87, (uint64_t)v34, v88, v89);
                    v28 = objc_claimAutoreleasedReturnValue();
                    v90 = 0;
                    v91 = v28;
                  }
                  else
                  {
                    v91 = 0;
                    v90 = 1;
                  }
                  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v87, 4, v88, v89);
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setObject_forKeyedSubscript_(v15, v93, v91, (uint64_t)v92, v94);

                  v39 = (void *)v28;
                  v3 = v28;
                  if ((v90 & 1) != 0)
                    goto LABEL_27;
                  goto LABEL_26;
                case 10:
                  objc_msgSend_objectForKeyedSubscript_(v5, v21, (uint64_t)CFSTR("colocated2GHzRNRChannel"), v22, v23);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v5, v60, (uint64_t)CFSTR("colocated2GHzRNRChannelFlags"), v61, v62);
                  v63 = objc_claimAutoreleasedReturnValue();
                  v39 = (void *)v63;
                  if (!v34 || !v63)
                    goto LABEL_26;
                  v40 = objc_alloc_init(CWFChannel);
                  v68 = objc_msgSend_unsignedIntegerValue(v34, v64, v65, v66, v67);
                  objc_msgSend_setChannel_(v40, v69, v68, v70, v71);
                  v76 = objc_msgSend_unsignedIntValue(v39, v72, v73, v74, v75);
                  objc_msgSend_setFlags_(v40, v77, v76, v78, v79);
                  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v80, 10, v81, v82);
                  break;
                case 11:
                  objc_msgSend_objectForKeyedSubscript_(v5, v21, (uint64_t)CFSTR("colocated5GHzRNRChannel"), v22, v23);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v5, v95, (uint64_t)CFSTR("colocated5GHzRNRChannelFlags"), v96, v97);
                  v98 = objc_claimAutoreleasedReturnValue();
                  v39 = (void *)v98;
                  if (!v34 || !v98)
                    goto LABEL_26;
                  v40 = objc_alloc_init(CWFChannel);
                  v103 = objc_msgSend_unsignedIntegerValue(v34, v99, v100, v101, v102);
                  objc_msgSend_setChannel_(v40, v104, v103, v105, v106);
                  v111 = objc_msgSend_unsignedIntValue(v39, v107, v108, v109, v110);
                  objc_msgSend_setFlags_(v40, v112, v111, v113, v114);
                  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v115, 11, v116, v117);
                  break;
                default:
                  objc_msgSend_objectForKeyedSubscript_(v5, v21, v25, v22, v23);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v121, v27, v122, v123);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setObject_forKeyedSubscript_(v15, v124, (uint64_t)v34, (uint64_t)v39, v125);
                  goto LABEL_26;
              }
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v15, v119, (uint64_t)v40, (uint64_t)v118, v120);

              v3 = v28;
LABEL_26:

LABEL_27:
            }
          }
          ++v24;
        }
        while (v134 != v24);
        v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v135, (uint64_t)v139, 16);
        v134 = v126;
      }
      while (v126);
    }

    objc_msgSend_setInternal_(v14, v127, (uint64_t)v15, v128, v129);
  }

  return v14;
}

- (CWFBSS)init
{
  CWFBSS *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *internal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CWFBSS;
  v2 = -[CWFBSS init](&v6, sel_init);
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

- (void)setInternal:(id)a3
{
  objc_storeStrong((id *)&self->_internal, a3);
}

- (id)__coreWiFiSpecificProperties
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)isEqualToBSS:(id)a3
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
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
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
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
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  char isEqual;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;

  v4 = a3;
  objc_msgSend_BSSID(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_BSSID(v4, v10, v11, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != v18)
  {
    objc_msgSend_BSSID(self, v14, v15, v16, v17);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      isEqual = 0;
      goto LABEL_20;
    }
    v24 = (void *)v19;
    objc_msgSend_BSSID(v4, v20, v21, v22, v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      isEqual = 0;
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend_BSSID(self, v25, v26, v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_BSSID(v4, v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v30, v36, (uint64_t)v35, v37, v38))
    {
      isEqual = 0;
LABEL_18:

      goto LABEL_19;
    }
    v72 = v35;
    v74 = v30;
    v76 = v29;
    v78 = v24;
  }
  objc_msgSend_internal(self, v14, v15, v16, v17, v72, v74, v76, v78);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_internal(v4, v40, v41, v42, v43);
  v44 = objc_claimAutoreleasedReturnValue();
  if (v39 == (void *)v44)
  {

    isEqual = 1;
  }
  else
  {
    v49 = (void *)v44;
    objc_msgSend_internal(self, v45, v46, v47, v48);
    v50 = objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      v55 = (void *)v50;
      objc_msgSend_internal(v4, v51, v52, v53, v54);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        objc_msgSend_internal(self, v56, v57, v58, v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_internal(v4, v62, v63, v64, v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v61, v67, (uint64_t)v66, v68, v69);

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
  }
  v29 = v77;
  v24 = v79;
  v35 = v73;
  v30 = v75;
  if (v9 != v18)
    goto LABEL_18;
LABEL_20:

  return isEqual;
}

- (NSString)BSSID
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E730, v2, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

- (void)setLastAssociatedAt:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E778, v3);
}

- (void)setIPv6NetworkSignature:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E838, v3);
}

- (void)setIPv4NetworkSignature:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E820, v3);
}

- (void)setDHCPv6ServerID:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E808, v3);
}

- (void)setDHCPServerID:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E7F0, v3);
}

- (void)setChannel:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E748, v3);
}

- (void)setBSSID:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E730, v3);
}

- (void)setAWDLRealTimeModeTimestamp:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E790, v3);
}

+ (id)supportedOSSpecificKeys
{
  if (qword_1ECFD6AA0 != -1)
    dispatch_once(&qword_1ECFD6AA0, &unk_1E6132760);
  return (id)qword_1ECFD6A98;
}

- (void)setLocation:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend___infoForLocation_(self, a2, (uint64_t)a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1E615E7A8, v7);

}

- (id)__keyForProperty:(int64_t)a3
{
  int64_t v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 0xB && ((0x9FDu >> v3) & 1) != 0)
    v4 = *off_1E6133CD8[v3];
  else
    v4 = 0;
  return v4;
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
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

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("BSSID"), v5, v6) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("Channel"), v8, v9) & 1) != 0
         || (objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("ChannelFlags"), v12, v13) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v14, (uint64_t)CFSTR("LastAssociatedAt"), v15, v16) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v18, (uint64_t)CFSTR("Location"), v19, v20) & 1) != 0
         || (objc_msgSend_isEqualToString_(v3, v21, (uint64_t)CFSTR("LocationLatitude"), v22, v23) & 1) != 0
         || (objc_msgSend_isEqualToString_(v3, v24, (uint64_t)CFSTR("LocationLongitude"), v25, v26) & 1) != 0
         || (objc_msgSend_isEqualToString_(v3, v27, (uint64_t)CFSTR("LocationAccuracy"), v28, v29) & 1) != 0
         || (objc_msgSend_isEqualToString_(v3, v30, (uint64_t)CFSTR("LocationTimestamp"), v31, v32) & 1) != 0)
  {
    v10 = 4;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v33, (uint64_t)CFSTR("AWDLRealTimeModeTimestamp"), v34, v35) & 1) != 0)
  {
    v10 = 5;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v36, (uint64_t)CFSTR("DHCPServerID"), v37, v38) & 1) != 0)
  {
    v10 = 6;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v39, (uint64_t)CFSTR("DHCPv6ServerID"), v40, v41) & 1) != 0)
  {
    v10 = 7;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v42, (uint64_t)CFSTR("IPv4NetworkSignature"), v43, v44) & 1) != 0)
  {
    v10 = 8;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v45, (uint64_t)CFSTR("IPv6NetworkSignature"), v46, v47) & 1) != 0)
  {
    v10 = 9;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v48, (uint64_t)CFSTR("colocated2GHzRNRChannel"), v49, v50) & 1) != 0
         || (objc_msgSend_isEqualToString_(v3, v51, (uint64_t)CFSTR("colocated2GHzRNRChannelFlags"), v52, v53) & 1) != 0)
  {
    v10 = 10;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v54, (uint64_t)CFSTR("colocated5GHzRNRChannel"), v55, v56) & 1) != 0
         || (objc_msgSend_isEqualToString_(v3, v57, (uint64_t)CFSTR("colocated5GHzRNRChannelFlags"), v58, v59) & 1) != 0)
  {
    v10 = 11;
  }
  else if (objc_msgSend_isEqualToString_(v3, v60, (uint64_t)CFSTR("__OSSpecific__"), v61, v62))
  {
    v10 = 12;
  }
  else
  {
    v10 = 0;
  }

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
  uint64_t i;
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
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const __CFString *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  objc_msgSend_allKeys(self->_internal, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v122, (uint64_t)v126, 16);
  if (v13)
  {
    v18 = v13;
    v19 = *(_QWORD *)v123;
    v121 = CFSTR("ChannelFlags");
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v123 != v19)
          objc_enumerationMutation(v11);
        v21 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * i);
        v22 = objc_msgSend_integerValue(v21, v14, v15, v16, v17, v121);
        objc_msgSend___keyForProperty_(self, v23, v22, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend_integerValue(v21, v27, v28, v29, v30);
        v35 = v31;
        if (v26)
        {
          objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v36;
          if (v35 != 12 || objc_msgSend_count(v36, v37, v38, v39, v40))
            objc_msgSend_setObject_forKeyedSubscript_(v6, v37, (uint64_t)v41, (uint64_t)v26, v40);
          goto LABEL_20;
        }
        switch(v31)
        {
          case 11:
            objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v91;
            if (v91)
            {
              v96 = (void *)MEMORY[0x1E0CB37E8];
              v97 = objc_msgSend_channel(v91, v92, v93, v94, v95);
              objc_msgSend_numberWithUnsignedInteger_(v96, v98, v97, v99, v100);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v6, v102, (uint64_t)v101, (uint64_t)CFSTR("colocated5GHzRNRChannel"), v103);

              v104 = (void *)MEMORY[0x1E0CB37E8];
              v109 = objc_msgSend_flags(v41, v105, v106, v107, v108);
              objc_msgSend_numberWithUnsignedInt_(v104, v110, v109, v111, v112);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v6, v113, (uint64_t)v64, (uint64_t)CFSTR("colocated5GHzRNRChannelFlags"), v114);
              goto LABEL_19;
            }
            break;
          case 10:
            objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v67;
            if (v67)
            {
              v72 = (void *)MEMORY[0x1E0CB37E8];
              v73 = objc_msgSend_channel(v67, v68, v69, v70, v71);
              objc_msgSend_numberWithUnsignedInteger_(v72, v74, v73, v75, v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v6, v78, (uint64_t)v77, (uint64_t)CFSTR("colocated2GHzRNRChannel"), v79);

              v80 = (void *)MEMORY[0x1E0CB37E8];
              v85 = objc_msgSend_flags(v41, v81, v82, v83, v84);
              objc_msgSend_numberWithUnsignedInt_(v80, v86, v85, v87, v88);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v6, v89, (uint64_t)v64, (uint64_t)CFSTR("colocated2GHzRNRChannelFlags"), v90);
              goto LABEL_19;
            }
            break;
          case 2:
            objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v42;
            if (v42)
            {
              v47 = (void *)MEMORY[0x1E0CB37E8];
              v48 = objc_msgSend_channel(v42, v43, v44, v45, v46);
              objc_msgSend_numberWithUnsignedInteger_(v47, v49, v48, v50, v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v52, (uint64_t)CFSTR("Channel"), v54);

              v55 = (void *)MEMORY[0x1E0CB37E8];
              v60 = objc_msgSend_flags(v41, v56, v57, v58, v59);
              objc_msgSend_numberWithUnsignedInt_(v55, v61, v60, v62, v63);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v6, v65, (uint64_t)v64, (uint64_t)v121, v66);
LABEL_19:

            }
            break;
          default:
            goto LABEL_21;
        }
LABEL_20:

LABEL_21:
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v122, (uint64_t)v126, 16);
    }
    while (v18);
  }

  v119 = (void *)objc_msgSend_copy(v6, v115, v116, v117, v118);
  return v119;
}

- (void)mergeWithBSS:(id)a3
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
  for (i = 0; i != 13; ++i)
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

  return (id)objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], a2, (uint64_t)&unk_1E61608D8, v2, v3);
}

- (id)filteredBSSWithProperties:(id)a3
{
  return (id)objc_msgSend___filteredBSSWithProperties_includeRequiredProperties_OSSpecificKeys_(self, a2, (uint64_t)a3, 1, 0);
}

- (id)filteredBSSWithProperties:(id)a3 OSSpecificKeys:(id)a4
{
  return (id)objc_msgSend___filteredBSSWithProperties_includeRequiredProperties_OSSpecificKeys_(self, a2, (uint64_t)a3, 1, (uint64_t)a4);
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
  objc_msgSend___filteredBSSWithProperties_includeRequiredProperties_OSSpecificKeys_(self, v16, (uint64_t)v10, 0, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_externalForm(v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSDate)AWDLRealTimeModeTimestamp
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E790, v2, v3);
}

- (id)__infoForLocation:(id)a3
{
  void *v3;
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
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  _QWORD v43[4];
  _QWORD v44[5];

  v44[4] = *MEMORY[0x1E0C80C00];
  v43[0] = CFSTR("LocationLatitude");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend_coordinate(v4, v5, v6, v7, v8);
  objc_msgSend_numberWithDouble_(v3, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v13;
  v43[1] = CFSTR("LocationLongitude");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_coordinate(v4, v15, v16, v17, v18);
  objc_msgSend_numberWithDouble_(v14, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v24;
  v43[2] = CFSTR("LocationAccuracy");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_horizontalAccuracy(v4, v26, v27, v28, v29);
  objc_msgSend_numberWithDouble_(v25, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v34;
  v43[3] = CFSTR("LocationTimestamp");
  objc_msgSend_timestamp(v4, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v44[3] = v39;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v40, (uint64_t)v44, (uint64_t)v43, 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)__locationFromInfo:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
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
  BOOL v25;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  void *v75;
  id result;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  char *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  const char *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  void *v92;

  v3 = a3;
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("LocationLatitude"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v8, (uint64_t)CFSTR("LocationLongitude"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v12, (uint64_t)CFSTR("LocationAccuracy"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v16, (uint64_t)CFSTR("LocationTimestamp"), v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v19;
  if (v7)
    v25 = v11 == 0;
  else
    v25 = 1;
  if (v25 || v15 == 0 || v19 == 0)
    goto LABEL_19;
  objc_msgSend_doubleValue(v7, v20, v21, v22, v23);
  v29 = v28;
  v34 = objc_msgSend_doubleValue(v11, v30, v31, v32, v33);
  v40 = v39;
  v89 = 0;
  v90 = &v89;
  v91 = 0x2020000000;
  v41 = off_1ECFD6AA8;
  v92 = off_1ECFD6AA8;
  if (!off_1ECFD6AA8)
  {
    v42 = sub_1B067DB7C(v34, v35, v36, v37, v38);
    v41 = dlsym(v42, "CLLocationCoordinate2DMake");
    v90[3] = (uint64_t)v41;
    off_1ECFD6AA8 = v41;
  }
  _Block_object_dispose(&v89, 8);
  if (v41)
  {
    v52 = ((double (*)(double, double))v41)(v29, v40);
    v54 = v53;
    v89 = 0;
    v90 = &v89;
    v91 = 0x2020000000;
    v55 = off_1ECFD6AB0;
    v92 = off_1ECFD6AB0;
    if (!off_1ECFD6AB0)
    {
      v56 = sub_1B067DB7C(v47, v48, v49, v50, v51);
      v55 = dlsym(v56, "CLLocationCoordinate2DIsValid");
      v90[3] = (uint64_t)v55;
      off_1ECFD6AB0 = v55;
    }
    _Block_object_dispose(&v89, 8);
    if (v55)
    {
      v61 = ((uint64_t (*)(double, double))v55)(v52, v54);
      if ((_DWORD)v61)
      {
        v66 = objc_alloc((Class)sub_1B067D314(v61, v62, v63, v64, v65));
        objc_msgSend_doubleValue(v15, v67, v68, v69, v70);
        v75 = (void *)objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_(v66, v71, (uint64_t)v24, v72, v73, v52, v54, 0.0, v74, 0.0);
LABEL_20:

        return v75;
      }
LABEL_19:
      v75 = 0;
      goto LABEL_20;
    }
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v57, v58, v59, v60);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v84, (uint64_t)"BOOL soft_CLLocationCoordinate2DIsValid(CLLocationCoordinate2D)", v85, v86);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v77, v88, (uint64_t)v81, (uint64_t)CFSTR("CWFBSS.m"), 40, CFSTR("%s"), v87);
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v43, v44, v45, v46);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v78, (uint64_t)"CLLocationCoordinate2D soft_CLLocationCoordinate2DMake(CLLocationDegrees, CLLocationDegrees)", v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v77, v83, (uint64_t)v81, (uint64_t)CFSTR("CWFBSS.m"), 34, CFSTR("%s"), v82);
  }

  __break(1u);
  return result;
}

- (CLLocation)location
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E7A8, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___locationFromInfo_(self, v6, (uint64_t)v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLLocation *)v9;
}

- (CWFChannel)colocated2GHzRNRChannel
{
  uint64_t v2;
  uint64_t v3;

  return (CWFChannel *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E7C0, v2, v3);
}

- (void)setColocated2GHzRNRChannel:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E7C0, v3);
}

- (CWFChannel)colocated5GHzRNRChannel
{
  uint64_t v2;
  uint64_t v3;

  return (CWFChannel *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E7D8, v2, v3);
}

- (void)setColocated5GHzRNRChannel:(id)a3
{
  uint64_t v3;

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1E615E7D8, v3);
}

- (NSData)DHCPServerID
{
  uint64_t v2;
  uint64_t v3;

  return (NSData *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E7F0, v2, v3);
}

- (NSData)DHCPv6ServerID
{
  uint64_t v2;
  uint64_t v3;

  return (NSData *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E808, v2, v3);
}

- (NSString)IPv4NetworkSignature
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E820, v2, v3);
}

- (NSString)IPv6NetworkSignature
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E838, v2, v3);
}

- (NSDictionary)OSSpecificAttributes
{
  uint64_t v2;
  uint64_t v3;

  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1E615E760, v2, v3);
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
    && (objc_msgSend_supportedOSSpecificKeys(CWFBSS, v7, v8, v9, v10),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend_containsObject_(v12, v13, (uint64_t)v11, v14, v15),
        v12,
        v16))
  {
    objc_msgSend_objectForKeyedSubscript_(self->_internal, v17, (uint64_t)&unk_1E615E760, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && !v20)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v26, (uint64_t)v25, (uint64_t)&unk_1E615E760, v27);

    }
    objc_msgSend_objectForKeyedSubscript_(self->_internal, v21, (uint64_t)&unk_1E615E760, v23, v24);
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
    objc_msgSend_objectForKeyedSubscript_(internal, v5, (uint64_t)&unk_1E615E760, v6, v7);
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
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
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
  void *v41;
  const char *v42;
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
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
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
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v6, v12, (uint64_t)v11, v13, v14);

  objc_msgSend_appendString_(v6, v15, (uint64_t)CFSTR(", "), v16, v17);
  objc_msgSend_IPv4NetworkSignature(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_IPv4NetworkSignature(self, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v28, (uint64_t)CFSTR("ipv4=%@, "), v29, v30, v27);

  }
  objc_msgSend_DHCPServerID(self, v23, v24, v25, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend_DHCPServerID(self, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    CWFHexadecimalStringFromData(v36, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v42, (uint64_t)CFSTR("dhcp=%@, "), v43, v44, v41);

  }
  objc_msgSend_IPv6NetworkSignature(self, v32, v33, v34, v35);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend_IPv6NetworkSignature(self, v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v51, (uint64_t)CFSTR("ipv6=%@, "), v52, v53, v50);

  }
  objc_msgSend_DHCPv6ServerID(self, v46, v47, v48, v49);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    objc_msgSend_DHCPv6ServerID(self, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    CWFHexadecimalStringFromData(v59, v60, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v65, (uint64_t)CFSTR("dhcpv6=%@, "), v66, v67, v64);

  }
  if (objc_msgSend_logRedactionDisabled(CWFInterface, v55, v56, v57, v58))
  {
    objc_msgSend_location(self, v68, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
    {
      objc_msgSend_location(self, v68, v73, v70, v71);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v6, v75, (uint64_t)CFSTR("location=%@, "), v76, v77, v74);

    }
  }
  if (objc_msgSend_hasSuffix_(v6, v68, (uint64_t)CFSTR(", "), v70, v71))
  {
    v82 = objc_msgSend_length(v6, v78, v79, v80, v81);
    objc_msgSend_deleteCharactersInRange_(v6, v83, v82 - 2, 2, v84);
  }
  return (NSString *)v6;
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

  v6 = (void *)objc_msgSend_allocWithZone_(CWFBSS, a2, (uint64_t)a3, v3, v4);
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

- (CWFBSS)initWithCoder:(id)a3
{
  id v4;
  CWFBSS *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
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
  NSMutableDictionary *internal;
  objc_super v31;
  _QWORD v32[8];
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CWFBSS;
  v5 = -[CWFBSS init](&v31, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E20];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v32[2] = objc_opt_class();
    v32[3] = objc_opt_class();
    v32[4] = objc_opt_class();
    v32[5] = objc_opt_class();
    v32[6] = objc_opt_class();
    v32[7] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v32, 8, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v6, v10, (uint64_t)v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!qword_1ECFD69F8)
    {
      v33 = xmmword_1E6133CC0;
      v34 = 0;
      v14 = _sl_dlopen();
      qword_1ECFD69F8 = v14;
    }
    if (qword_1ECFD69F8)
    {
      sub_1B067D314(v14, v15, v16, v17, v18);
      v19 = objc_opt_class();
      objc_msgSend_addObject_(v13, v20, v19, v21, v22);
    }
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v13, (uint64_t)CFSTR("_internal"), v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_mutableCopy(v23, v24, v25, v26, v27);
    internal = v5->_internal;
    v5->_internal = (NSMutableDictionary *)v28;

  }
  return v5;
}

- (id)JSONCompatibleKeyValueMap
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

  objc_msgSend_externalForm(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B06475A8(v5, 0, 1u);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v7, (uint64_t)v6, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
