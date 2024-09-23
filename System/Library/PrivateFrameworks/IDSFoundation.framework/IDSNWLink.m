@implementation IDSNWLink

- (IDSNWLink)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  id v7;
  id v8;
  IDSNWLink *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  IDSNWLink *v13;
  const char *v14;
  double v15;
  NSMutableArray *v16;
  NSMutableArray *recentQRServerList;
  NSMutableArray *v18;
  NSMutableArray *tokensForUDPConnectionInProgress;
  NSMutableArray *v20;
  NSMutableArray *cellularPortList;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary *queuedPeelOffs;
  CFMutableDictionaryRef v24;
  NSMutableDictionary *tokenToNWLinkConnection;
  CFMutableDictionaryRef v26;
  NSMutableDictionary *tokenToChildConnectionEvaluator;
  CFMutableDictionaryRef v28;
  NSMutableDictionary *interfaceIndexToNAT64LocalAddress;
  CFMutableDictionaryRef v30;
  NSMutableDictionary *portToExtraListener;
  NSMutableSet *v32;
  NSMutableSet *rootConnections;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  NSObject *v38;
  objc_super v40;
  uint8_t buf[4];
  IDSNWLink *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v40.receiver = self;
  v40.super_class = (Class)IDSNWLink;
  v9 = -[IDSNWLink init](&v40, sel_init);
  v13 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cbuuid, a4);
    v13->_isDefaultPairedDevice = objc_msgSend_isEqualToString_(v13->_cbuuid, v14, (uint64_t)CFSTR("12345678-7654-DADA-DADA-DADADADADADA"), v15);
    objc_storeStrong((id *)&v13->_deviceUniqueID, a3);
    v13->_lock._os_unfair_lock_opaque = 0;
    if (!v13->_recentQRServerList)
    {
      v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      recentQRServerList = v13->_recentQRServerList;
      v13->_recentQRServerList = v16;

    }
    if (!v13->_tokensForUDPConnectionInProgress)
    {
      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      tokensForUDPConnectionInProgress = v13->_tokensForUDPConnectionInProgress;
      v13->_tokensForUDPConnectionInProgress = v18;

    }
    if (!v13->_cellularPortList)
    {
      v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      cellularPortList = v13->_cellularPortList;
      v13->_cellularPortList = v20;

    }
    if (!v13->_queuedPeelOffs)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      queuedPeelOffs = v13->_queuedPeelOffs;
      v13->_queuedPeelOffs = (NSMutableDictionary *)Mutable;

    }
    if (!v13->_tokenToNWLinkConnection)
    {
      v24 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      tokenToNWLinkConnection = v13->_tokenToNWLinkConnection;
      v13->_tokenToNWLinkConnection = (NSMutableDictionary *)v24;

    }
    if (!v13->_tokenToChildConnectionEvaluator)
    {
      v26 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      tokenToChildConnectionEvaluator = v13->_tokenToChildConnectionEvaluator;
      v13->_tokenToChildConnectionEvaluator = (NSMutableDictionary *)v26;

    }
    if (!v13->_interfaceIndexToNAT64LocalAddress)
    {
      v28 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      interfaceIndexToNAT64LocalAddress = v13->_interfaceIndexToNAT64LocalAddress;
      v13->_interfaceIndexToNAT64LocalAddress = (NSMutableDictionary *)v28;

    }
    if (!v13->_portToExtraListener)
    {
      v30 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      portToExtraListener = v13->_portToExtraListener;
      v13->_portToExtraListener = (NSMutableDictionary *)v30;

    }
    if (!v13->_rootConnections)
    {
      v32 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      rootConnections = v13->_rootConnections;
      v13->_rootConnections = v32;

    }
    v13->_state = 0;
    if (IMGetDomainBoolForKey())
    {
      objc_msgSend_IDSNWLink(IDSFoundationLog, v10, v11, v12);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "NWLinkChaos on", buf, 2u);
      }

      v13->_shouldFailConnectionsRandomly = 1;
      objc_msgSend__failConnectionsRandomly(v13, v35, v36, v37);
    }
  }
  objc_msgSend_IDSNWLink(IDSFoundationLog, v10, v11, v12);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v42 = v13;
    _os_log_impl(&dword_19B949000, v38, OS_LOG_TYPE_DEFAULT, "created %p", buf, 0xCu);
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v2;
  double v3;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  objc_super v10;
  uint8_t buf[4];
  IDSNWLink *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend_IDSNWLink(IDSFoundationLog, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("YES");
    if (!self->_isInvalidated)
      v6 = CFSTR("NO");
    *(_DWORD *)buf = 134218242;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "deallocating... %p invalidated: %@", buf, 0x16u);
  }

  if (!self->_isInvalidated)
    objc_msgSend_invalidate(self, v7, v8, v9);
  v10.receiver = self;
  v10.super_class = (Class)IDSNWLink;
  -[IDSNWLink dealloc](&v10, sel_dealloc);
}

- (void)cleanup
{
  double v2;

  objc_msgSend__cleanup_(self, a2, 0, v2);
}

- (void)_cleanup:(BOOL)a3
{
  double v3;
  _BOOL4 v4;
  NSObject *v6;
  const __CFString *v7;
  NSObject *listener;
  NSObject *cellularListener;
  NSMutableArray *recentQRServerList;
  NSMutableArray *tokensForUDPConnectionInProgress;
  NSMutableArray *cellularPortList;
  NSMutableDictionary *queuedPeelOffs;
  id v14;
  NSMutableDictionary *tokenToNWLinkConnection;
  uint64_t v16;
  id v17;
  const char *v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  id v40;
  const char *v41;
  double v42;
  OS_nw_listener *v43;
  OS_nw_listener *v44;
  id v45;
  const char *v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  double v53;
  id v54;
  const char *v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  double v62;
  id v63;
  const char *v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  double v71;
  const char *v72;
  double v73;
  NSMutableSet *rootConnections;
  const char *v75;
  uint64_t v76;
  double v77;
  NSMutableSet *v78;
  OS_nw_listener *v79;
  OS_nw_listener *v80;
  _QWORD v81[5];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t buf[4];
  IDSNWLink *v100;
  __int16 v101;
  const __CFString *v102;
  uint64_t v103;

  v4 = a3;
  v103 = *MEMORY[0x1E0C80C00];
  objc_msgSend_IDSNWLink(IDSFoundationLog, a2, a3, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 134218242;
    v100 = self;
    v101 = 2112;
    v102 = v7;
    _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "cleaning up... %p invalidate: %@", buf, 0x16u);
  }

  listener = self->_listener;
  if (listener)
    nw_listener_cancel(listener);
  cellularListener = self->_cellularListener;
  if (cellularListener)
    nw_listener_cancel(cellularListener);
  os_unfair_lock_lock(&self->_lock);
  self->_isInvalidated = v4;
  recentQRServerList = self->_recentQRServerList;
  self->_recentQRServerList = 0;

  tokensForUDPConnectionInProgress = self->_tokensForUDPConnectionInProgress;
  self->_tokensForUDPConnectionInProgress = 0;

  cellularPortList = self->_cellularPortList;
  self->_cellularPortList = 0;

  queuedPeelOffs = self->_queuedPeelOffs;
  self->_queuedPeelOffs = 0;

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  tokenToNWLinkConnection = self->_tokenToNWLinkConnection;
  v16 = MEMORY[0x1E0C809B0];
  v94[0] = MEMORY[0x1E0C809B0];
  v94[1] = 3221225472;
  v94[2] = sub_19B98A8B8;
  v94[3] = &unk_1E3C1F208;
  v17 = v14;
  v95 = v17;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(tokenToNWLinkConnection, v18, (uint64_t)v94, v19);
  objc_msgSend_removeAllObjects(self->_tokenToNWLinkConnection, v20, v21, v22);
  objc_msgSend_removeAllObjects(self->_interfaceIndexToNAT64LocalAddress, v23, v24, v25);
  objc_msgSend_allValues(self->_tokenToChildConnectionEvaluator, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(self->_tokenToChildConnectionEvaluator, v30, v31, v32);
  objc_msgSend_allValues(self->_portToExtraListener, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (id)objc_msgSend_mutableCopy(v36, v37, v38, v39);

  if (!v40)
    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = self->_listener;
  if (v43)
    objc_msgSend_addObject_(v40, v41, (uint64_t)v43, v42);
  v44 = self->_cellularListener;
  if (v44)
    objc_msgSend_addObject_(v40, v41, (uint64_t)v44, v42);
  objc_msgSend_removeAllObjects(self->_portToExtraListener, v41, (uint64_t)v44, v42);
  os_unfair_lock_unlock(&self->_lock);
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v45 = v17;
  v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v90, v47, v98, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v91;
    do
    {
      v51 = 0;
      do
      {
        if (*(_QWORD *)v91 != v50)
          objc_enumerationMutation(v45);
        nw_connection_cancel(*(nw_connection_t *)(*((_QWORD *)&v90 + 1) + 8 * v51++));
      }
      while (v49 != v51);
      v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v52, (uint64_t)&v90, v53, v98, 16);
    }
    while (v49);
  }

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v54 = v29;
  v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v86, v56, v97, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v87;
    do
    {
      v60 = 0;
      do
      {
        if (*(_QWORD *)v87 != v59)
          objc_enumerationMutation(v54);
        nw_path_evaluator_cancel();
        ++v60;
      }
      while (v58 != v60);
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v61, (uint64_t)&v86, v62, v97, 16);
    }
    while (v58);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v63 = v40;
  v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v82, v65, v96, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v83;
    do
    {
      v69 = 0;
      do
      {
        if (*(_QWORD *)v83 != v68)
          objc_enumerationMutation(v63);
        nw_listener_cancel(*(nw_listener_t *)(*((_QWORD *)&v82 + 1) + 8 * v69++));
      }
      while (v67 != v69);
      v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v70, (uint64_t)&v82, v71, v96, 16);
    }
    while (v67);
  }

  rootConnections = self->_rootConnections;
  if (rootConnections)
  {
    v81[0] = v16;
    v81[1] = 3221225472;
    v81[2] = sub_19B98A8FC;
    v81[3] = &unk_1E3C1F230;
    v81[4] = self;
    objc_msgSend_enumerateObjectsUsingBlock_(rootConnections, v72, (uint64_t)v81, v73);
    objc_msgSend_removeAllObjects(self->_rootConnections, v75, v76, v77);
    v78 = self->_rootConnections;
    self->_rootConnections = 0;

  }
  v79 = self->_listener;
  self->_listener = 0;

  v80 = self->_cellularListener;
  self->_cellularListener = 0;

  if (v4)
    objc_storeWeak((id *)&self->_delegate, 0);

}

- (void)invalidate
{
  uint64_t v2;
  double v3;
  NSObject *v5;
  const char *v6;
  double v7;
  int v8;
  IDSNWLink *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend_IDSNWLink(IDSFoundationLog, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = self;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "invalidating... %p", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend__cleanup_(self, v6, 1, v7);
}

- (unint64_t)headerOverhead
{
  return 0;
}

- (NSString)linkTypeString
{
  return (NSString *)CFSTR("NWConnection");
}

- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4
{
  return 0;
}

- (id)copyLinkStatsDict
{
  return 0;
}

- (void)setWiFiAssistState:(BOOL)a3
{
  double v3;
  _BOOL8 v4;
  NSObject *v6;
  const __CFString *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  id v12;
  const char *v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const __CFString *v27;
  uint64_t v28;

  v4 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend_IDSNWLink(IDSFoundationLog, a2, a3, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "NWLink setWiFiAssistState(%@) called", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_allValues(self->_tokenToNWLinkConnection, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v11;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v21, v14, v25, 16);
  if (v15)
  {
    v18 = v15;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v12);
        objc_msgSend__setWiFiAssistStateForCellularLink_isEnabled_(self, v16, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++), v17, v4, (_QWORD)v21);
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v16, (uint64_t)&v21, v17, v25, 16);
    }
    while (v18);
  }

  self->_wifiAssistEnabled = v4;
}

- (BOOL)hasListener
{
  return self->_listener != 0;
}

- (void)_failConnectionsRandomly
{
  uint64_t v2;
  double v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  NSMutableDictionary *v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  double v44;
  uint32_t v45;
  uint32_t v46;
  const char *v47;
  double v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  double v56;
  const char *v57;
  uint64_t v58;
  double v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  _QWORD v65[5];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  uint64_t v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  if (!self->_isInvalidated)
  {
    objc_msgSend_IDSNWLink(IDSFoundationLog, a2, v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "NWLinkChaos: logging connection tree", buf, 2u);
    }

    objc_msgSend_logConnectionTree(self, v6, v7, v8);
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v13 = self->_tokenToNWLinkConnection;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v66, v15, v72, 16);
    if (v16)
    {
      v19 = v16;
      v20 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v67 != v20)
            objc_enumerationMutation(v13);
          objc_msgSend_objectForKeyedSubscript_(self->_tokenToNWLinkConnection, v17, *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i), v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_type(v22, v23, v24, v25) == 2 || objc_msgSend_type(v22, v26, v27, v28) == 4)
            && objc_msgSend_state(v22, v26, v27, v28) == 1)
          {
            objc_msgSend_addObject_(v12, v29, (uint64_t)v22, v30);
          }

        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v66, v18, v72, 16);
      }
      while (v19);
    }

    objc_msgSend_IDSNWLink(IDSFoundationLog, v31, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v38 = objc_msgSend_count(v12, v35, v36, v37);
      *(_DWORD *)buf = 134217984;
      v71 = v38;
      _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "NWLinkChaos: collected %lu possible connections to cancel", buf, 0xCu);
    }

    if (objc_msgSend_count(v12, v39, v40, v41))
    {
      v45 = objc_msgSend_count(v12, v42, v43, v44);
      v46 = arc4random_uniform(v45);
      objc_msgSend_objectAtIndexedSubscript_(v12, v47, v46, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      sub_19B98AE78(v49, 1, (uint64_t)"NWLinkChaos failing connection", v50, v51, v52, v53, v54, v64);
      objc_msgSend__failNWLinkConnection_(self, v55, (uint64_t)v49, v56);
      objc_msgSend_IDSNWLink(IDSFoundationLog, v57, v58, v59);
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v60, OS_LOG_TYPE_DEFAULT, "NWLinkChaos: new connection tree", buf, 2u);
      }

      objc_msgSend_logConnectionTree(self, v61, v62, v63);
    }
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = sub_19B98B118;
    v65[3] = &unk_1E3C1F258;
    v65[4] = self;
    IDSTransportThreadAddBlockAfter(v65, 5.0);

  }
}

- (BOOL)_shouldFail
{
  uint32_t v2;
  const char *v3;
  uint64_t v4;
  double v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  unint64_t v10;
  NSObject *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_shouldFailConnectionsRandomly)
    return 0;
  v2 = arc4random();
  objc_msgSend_IDSNWLink(IDSFoundationLog, v3, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v2;
    _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "NWLinkChaos _shouldFail: rnd = %u", (uint8_t *)v13, 8u);
  }

  HIDWORD(v10) = -1030792151 * v2;
  LODWORD(v10) = -1030792151 * v2;
  if ((v10 >> 2) > 0x28F5C28)
    return 0;
  objc_msgSend_IDSNWLink(IDSFoundationLog, v7, v8, v9);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "NWLinkChaos _shouldFail: returning YES; something should break (and hopefully retry)...",
      (uint8_t *)v13,
      2u);
  }

  return 1;
}

- (id)copyCurrentNetworkInterfaces
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  id v7;
  const char *v8;
  double v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  double v32;
  uint64_t v33;
  id v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend__createNetworkInterfaceArrayWithIPVersion_wantsWiFi_wantsCellular_(self, a2, 0, v2, self->_wantsWiFi, self->_wantsCellular);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__createNetworkInterfaceArrayWithIPVersion_wantsWiFi_wantsCellular_(self, v5, 1, v6, self->_wantsWiFi, self->_wantsCellular);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = v4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v41, v9, v49, 16);
  if (v10)
  {
    v13 = v10;
    v14 = 0;
    v15 = *(_QWORD *)v42;
    v16 = 67109378;
    for (i = *(_QWORD *)v42; ; i = *(_QWORD *)v42)
    {
      if (i != v15)
        objc_enumerationMutation(v7);
      v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v14);
      objc_msgSend_address(v18, v11, v12, *(double *)&v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_sa(v19, v20, v21, v22);

      v27 = (const char *)objc_msgSend_index(v18, v24, v25, v26);
      if (_supportsNAT64(v23, v27, v28))
      {
        objc_msgSend_IDSNWLink(IDSFoundationLog, v11, v12, *(double *)&v16);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          SAToIPString(v23);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          v46 = (int)v27;
          v47 = 2112;
          v48 = v30;
          _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEFAULT, "NAT64: if:%u -> %@", buf, 0x12u);

        }
        objc_msgSend__addInterfaceIndex_NAT64LocalAddress_(self, v31, (uint64_t)v27, v32, bswap32(*(_DWORD *)(v23 + 4)));
      }
      if (++v14 >= v13)
      {
        v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, (uint64_t)&v41, *(double *)&v16, v49, 16);
        if (!v33)
          break;
        v13 = v33;
        v14 = 0;
      }
    }
  }

  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_addObjectsFromArray_(v34, v35, (uint64_t)v7, v36);
  objc_msgSend_addObjectsFromArray_(v34, v37, (uint64_t)v40, v38);

  return v34;
}

- (id)newListenerWithClientUUID:(unsigned __int8)a3[16] wantsWiFi:(BOOL)a4 wantsCellular:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  __int128 v8;
  NSObject *v9;
  const __CFString *v10;
  int port;
  int cellularPort;
  const __CFString *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  OS_nw_listener *v17;
  OS_nw_listener *listener;
  OS_nw_listener *v19;
  OS_nw_listener *cellularListener;
  NSObject *v21;
  int v22;
  OS_nw_listener *v23;
  OS_nw_listener *v24;
  int v25;
  const char *v26;
  uint64_t v27;
  double v28;
  NSObject *v30;
  NSObject *v31;
  OS_nw_listener *v32;
  _BYTE v33[12];
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v5 = a5;
  v6 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = *(_OWORD *)a3;
  *(_OWORD *)self->_clientUUID = *(_OWORD *)a3;
  self->_wantsWiFi = a4;
  self->_wantsCellular = a5;
  objc_msgSend_IDSNWLink(IDSFoundationLog, a2, (uint64_t)a3, *(double *)&v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    port = self->_port;
    cellularPort = self->_cellularPort;
    if (v6)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    *(_DWORD *)v33 = 138413058;
    if (v5)
      v10 = CFSTR("YES");
    *(_QWORD *)&v33[4] = v13;
    v34 = 1024;
    v35 = port;
    v36 = 2112;
    v37 = (void *)v10;
    v38 = 1024;
    v39 = cellularPort;
    _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "setting up listeners (wantsWiFi:%@ on port %u, wantsCellular:%@ on port %u)", v33, 0x22u);
  }

  if (v6)
  {
    objc_msgSend__createNewListenerWithLocalPort_(self, v14, (uint64_t)&self->_port, v16);
    v17 = (OS_nw_listener *)objc_claimAutoreleasedReturnValue();
    listener = self->_listener;
    self->_listener = v17;

    if (!self->_listener)
    {
      objc_msgSend_IDSNWLink(IDSFoundationLog, v14, v15, v16);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_19BAEF47C();
      goto LABEL_21;
    }
  }
  if (v5)
  {
    objc_msgSend__createNewListenerWithLocalPort_(self, v14, (uint64_t)&self->_cellularPort, v16);
    v19 = (OS_nw_listener *)objc_claimAutoreleasedReturnValue();
    cellularListener = self->_cellularListener;
    self->_cellularListener = v19;

    if (!self->_cellularListener)
    {
      v31 = self->_listener;
      if (v31)
      {
        nw_listener_cancel(v31);
        v32 = self->_listener;
        self->_listener = 0;

      }
      objc_msgSend_IDSNWLink(IDSFoundationLog, v14, v15, v16, *(_QWORD *)v33);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_19BAEF4A8();
LABEL_21:

      return 0;
    }
  }
  objc_msgSend_IDSNWLink(IDSFoundationLog, v14, v15, v16, *(_QWORD *)v33);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = self->_port;
    v23 = self->_listener;
    v24 = self->_cellularListener;
    v25 = self->_cellularPort;
    *(_DWORD *)v33 = 134218752;
    *(_QWORD *)&v33[4] = v23;
    v34 = 1024;
    v35 = v22;
    v36 = 2048;
    v37 = v24;
    v38 = 1024;
    v39 = v25;
    _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "created listeners default %p port %d cellular %p cellularPort %d", v33, 0x22u);
  }

  return (id)objc_msgSend_copyCurrentNetworkInterfaces(self, v26, v27, v28);
}

+ (id)derivePSKFromSessionKey:(id)a3 salt:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  id v16;
  const char *v17;
  double v18;
  NSObject *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t Hkdf;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v38;
  const char *v39;
  uint64_t v40;
  double v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  const char *v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  double v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend_length(v5, v7, v8, v9) == 20)
  {
    if (objc_msgSend_length(v6, v10, v11, v12) == 12)
    {
      v16 = objc_alloc(MEMORY[0x1E0C99DF0]);
      v19 = objc_msgSend_initWithLength_(v16, v17, 32, v18);
      v20 = objc_retainAutorelease(v6);
      objc_msgSend_bytes(v20, v21, v22, v23, 0, *(_QWORD *)"QR-QUIC-V0", 12374, v60);
      Hkdf = CCKDFParametersCreateHkdf();
      if ((_DWORD)Hkdf)
      {
        v28 = Hkdf;
        objc_msgSend_IDSNWLink(IDSFoundationLog, v25, v26, v27);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_19BAEF538(v28, v29, v30, v31, v32, v33, v34, v35);

      }
      else
      {
        v38 = objc_retainAutorelease(v5);
        objc_msgSend_bytes(v38, v39, v40, v41);
        v42 = objc_retainAutorelease(v19);
        objc_msgSend_mutableBytes(v42, v43, v44, v45);
        objc_msgSend_length(v42, v46, v47, v48);
        v49 = CCDeriveKey();
        CCKDFParametersDestroy();
        if (!(_DWORD)v49)
        {
          v36 = v42;
          goto LABEL_12;
        }
        objc_msgSend_IDSNWLink(IDSFoundationLog, v50, v51, v52);
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          sub_19BAEF4D4(v49, v53, v54, v55, v56, v57, v58, v59);

      }
    }
    else
    {
      objc_msgSend_IDSNWLink(IDSFoundationLog, v13, v14, v15);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_19BAEF59C();
    }
  }
  else
  {
    objc_msgSend_IDSNWLink(IDSFoundationLog, v10, v11, v12);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_19BAEF5C8();
  }
  v36 = 0;
LABEL_12:

  return v36;
}

+ (BOOL)isSkywalkDemuxSupported
{
  return 1;
}

- (id)_dictionaryFromPSKParameters:(id)a3
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t i;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  NSObject *v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  const char *v38;
  double v39;
  unint64_t v40;
  int *v41;
  void *v42;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  NSObject *v49;
  uint64_t v50;
  id v51;
  os_log_t log;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  NSObject *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v4, v5, v6);
  v51 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (unint64_t)objc_msgSend_length(v3, v7, v8, v9) > 2)
  {
    objc_msgSend_componentsSeparatedByString_(v3, v7, (uint64_t)CFSTR(","), v9);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(log, v10, (uint64_t)&v53, 0.0, v57, 16);
    if (v11)
    {
      v14 = v11;
      v49 = v3;
      v15 = *(_QWORD *)v54;
      v16 = 0x1E3C19000uLL;
      v17 = &dword_19B949000;
      v18 = 138412290;
      v50 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v54 != v15)
            objc_enumerationMutation(log);
          v20 = *(NSObject **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if (v20
            && (unint64_t)objc_msgSend_length(*(void **)(*((_QWORD *)&v53 + 1) + 8 * i), v12, v13, *(double *)&v18) > 2)
          {
            objc_msgSend_componentsSeparatedByString_(v20, v12, (uint64_t)CFSTR(":"), *(double *)&v18);
            v22 = objc_claimAutoreleasedReturnValue();
            v21 = v22;
            if (v22 && objc_msgSend_count(v22, v23, v24, v25) == 2)
            {
              objc_msgSend_objectAtIndexedSubscript_(v21, v23, 0, v25);
              v26 = objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v21, v27, 1, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend_longLongValue(v26, v30, v31, v32);
              v37 = objc_msgSend_longLongValue(v29, v34, v35, v36);
              objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v38, v37, v39);
              v40 = v16;
              v41 = v17;
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v43, v33, v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v51, v46, (uint64_t)v42, v47, v45);

              v17 = v41;
              v16 = v40;
              v15 = v50;

            }
            else
            {
              objc_msgSend_IDSNWLink(*(void **)(v16 + 2856), v23, v24, v25);
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v59 = v21;
                _os_log_impl(v17, v26, OS_LOG_TYPE_DEFAULT, "_dictionaryFromPSKParameters: parameter pair has wrong number of parts: %@", buf, 0xCu);
              }
            }

          }
          else
          {
            objc_msgSend_IDSNWLink(*(void **)(v16 + 2856), v12, v13, *(double *)&v18);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v20;
              _os_log_impl(v17, v21, OS_LOG_TYPE_DEFAULT, "_dictionaryFromPSKParameters: parameter pair is not long enough: %@", buf, 0xCu);
            }
          }

        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(log, v12, (uint64_t)&v53, *(double *)&v18, v57, 16);
      }
      while (v14);
      v3 = v49;
    }
  }
  else
  {
    objc_msgSend_IDSNWLink(IDSFoundationLog, v7, v8, v9);
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v3;
      _os_log_impl(&dword_19B949000, log, OS_LOG_TYPE_DEFAULT, "_dictionaryFromPSKParameters: rawStr not long enough: %@", buf, 0xCu);
    }
  }

  return v51;
}

- (BOOL)connect:(int)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 clientUUID:(unsigned __int8)a6[16] sessionID:(id)a7 relaySessionToken:(id)a8 relaySessionKey:(id)a9 randomSaltBlock:(id)a10 pskTransportParameters:(id)a11 pskH3Settings:(id)a12 newLocalPort:(unsigned __int16 *)a13 disconnectAfterUse:(BOOL)a14 holdUntilFirstPacketReady:(BOOL)a15 readyHandler:(id)a16
{
  id v20;
  id v21;
  const sockaddr *v22;
  void (**v23)(_QWORD);
  id v24;
  id v25;
  nw_endpoint_t address;
  nw_endpoint_t v27;
  const char *v28;
  double v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  double v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  double v56;
  void *v57;
  NWLinkConnection *v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  double v67;
  const char *v68;
  double v69;
  const char *v70;
  double v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *secure_udp;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  double v82;
  NSObject *v83;
  dispatch_data_t v84;
  NSObject *options;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  nw_protocol_options_t v96;
  uint64_t v97;
  NSObject *v98;
  const char *v99;
  double v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  double v104;
  void *v105;
  void *v106;
  uint64_t v107;
  id v108;
  const char *v109;
  double v110;
  const char *v111;
  uint64_t v112;
  double v113;
  void *v114;
  char *v115;
  id v116;
  const char *v117;
  uint64_t v118;
  double v119;
  uint64_t v120;
  int v121;
  id v122;
  const char *v123;
  uint64_t v124;
  double v125;
  const void *v126;
  const char *v127;
  uint64_t v128;
  double v129;
  size_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  const char *v137;
  uint64_t v138;
  double v139;
  const void *v140;
  NSObject *v141;
  NSObject *v142;
  const char *v143;
  double v144;
  void *v145;
  double v146;
  uint64_t v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  NSObject *v159;
  double v160;
  void *v161;
  double v162;
  uint64_t v163;
  double v164;
  double v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  double v172;
  void *v173;
  const char *v174;
  double v175;
  const char *v176;
  double v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  NSObject *v183;
  BOOL v184;
  uint64_t v185;
  id *v186;
  id v187;
  id v188;
  id v189;
  const char *v190;
  double v191;
  const char *v192;
  double v193;
  const char *v194;
  double v195;
  NSObject *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  double v204;
  void (**v205)(_QWORD);
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  double v214;
  const char *v215;
  double v216;
  NSObject *v217;
  void *v218;
  void *v219;
  NSObject *v220;
  NSObject *v221;
  void *v222;
  NSObject *v223;
  const char *v224;
  double v225;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  NSObject *v230;
  id v231;
  void *v232;
  void (**v233)(_QWORD);
  void *v234;
  NSObject *v235;
  void *v236;
  NSObject *v237;
  NSObject *v238;
  NSObject *v239;
  dispatch_data_t v240;
  NSObject *queue;
  NSObject *protocol;
  uint64_t v243;
  void *v244;
  void *v245;
  const char *stack;
  NSObject *stacka;
  NSObject *v248;
  NSObject *endpoint;
  id v250;
  id v251;
  id v252;
  uint64_t v253;
  IDSNWLink *v254;
  void *v256;
  _QWORD v257[4];
  id v258;
  id v259;
  _QWORD handler[4];
  _QWORD v261[2];
  id v262;
  id v263;
  BOOL v264;
  _QWORD v265[4];
  id v266;
  _QWORD v267[4];
  id v268;
  int v269;
  char v270;
  char v271;
  unsigned int v272;
  unsigned int buffer;
  _QWORD v274[4];
  NSObject *v275;
  _QWORD v276[4];
  id v277;
  _QWORD v278[4];
  id v279;
  _QWORD v280[5];
  _QWORD v281[5];
  id v282;
  id v283;
  unint64_t __buf;
  __int16 v285;
  uint8_t buf[4];
  nw_endpoint_t v287;
  __int16 v288;
  NSObject *v289;
  uint64_t v290;

  stack = *(const char **)&a3;
  v290 = *MEMORY[0x1E0C80C00];
  v20 = a7;
  v251 = a8;
  v21 = v20;
  v22 = a4;
  v252 = a9;
  v23 = (void (**)(_QWORD))a10;
  v24 = a11;
  v25 = a12;
  v250 = a16;
  *(_OWORD *)self->_clientUUID = *(_OWORD *)a6;
  address = nw_endpoint_create_address(a4);
  v27 = nw_endpoint_create_address(a5);
  v283 = 0;
  v254 = self;
  v256 = v21;
  LODWORD(v21) = objc_msgSend__findExistingCollidingQRConnection_remoteEndpoint_sessionID_localEndpointToUse_(self, v28, (uint64_t)address, v29, v27, v21, &v283);
  v30 = v283;
  v253 = (uint64_t)v25;
  endpoint = v27;
  if (!(_DWORD)v21)
  {
    v248 = v30;
    goto LABEL_8;
  }
  if (v30
    || (objc_msgSend__findNewLocalEndpointForQRConnection_(self, v31, (uint64_t)address, v33),
        (v30 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v34 = v30;
    objc_msgSend_IDSNWLink(IDSFoundationLog, v31, v32, v33);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v287 = address;
      v288 = 2112;
      v289 = v34;
      _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "COLLISION MITIGATED: local endpoint %@ -> %@", buf, 0x16u);
    }

    v280[0] = MEMORY[0x1E0C809B0];
    v280[1] = 3221225472;
    v280[2] = sub_19B98CBAC;
    v280[3] = &unk_1E3C1F258;
    v280[4] = self;
    IDSTransportThreadAddBlock(v280);
    *a13 = nw_endpoint_get_port(v34);
    v36 = v34;

    v248 = v36;
    address = v36;
LABEL_8:
    _tokenWithParameters(address, v27, v256, 5uLL, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__NWLinkConnectionForToken_(self, v38, (uint64_t)v37, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v41 = ids_monotonic_time();
      if (objc_msgSend_disconnectionState(v40, v42, v43, v41) != 1
        || (objc_msgSend_scheduledDisconnectTime(v40, v44, v45, v46), v46 >= v41))
      {
        if (objc_msgSend_disconnectionState(v40, v44, v45, v46) == 3)
        {
          sub_19B98AE78(v40, 1, (uint64_t)"this QUIC connection cannot be reused", v206, v207, v208, v209, v210, v227);
          v278[0] = MEMORY[0x1E0C809B0];
          v278[1] = 3221225472;
          v278[2] = sub_19B98CC4C;
          v278[3] = &unk_1E3C1F2A8;
          v211 = v250;
          v279 = v250;
          IDSTransportThreadAddBlock(v278);
          v184 = 0;
          v57 = v279;
        }
        else
        {
          sub_19B98AE78(v40, 1, (uint64_t)"%@ already exists", v206, v207, v208, v209, v210, (uint64_t)v37);
          if (a14)
          {
            v211 = v250;
            if (objc_msgSend_disconnectionState(v40, v212, v213, v214) == 1)
              objc_msgSend_setDisconnectionState_(v40, v215, 0, v216);
          }
          else
          {
            v211 = v250;
            objc_msgSend_setDisconnectionState_(v40, v212, 2, v214);
          }
          v276[0] = MEMORY[0x1E0C809B0];
          v276[1] = 3221225472;
          v276[2] = sub_19B98CC64;
          v276[3] = &unk_1E3C1F2A8;
          v277 = v211;
          IDSTransportThreadAddBlock(v276);
          v184 = 1;
          v57 = v277;
        }
        goto LABEL_46;
      }
      objc_msgSend_scheduledDisconnectTime(v40, v44, v45, v46);
      sub_19B98AE78(v40, 1, (uint64_t)"existing connection %@ already timed out (%.1f < %.1f) - reconnecting...", v47, v48, v49, v50, v51, (uint64_t)v37);
      objc_msgSend_disconnectWithSessionID_localAddress_remoteAddress_waitTime_final_(self, v52, (uint64_t)v256, 0.0, a4, a5, 0);
    }
    v23[2](v23);
    v53 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)v53;
    if (v53)
    {
      v244 = (void *)v53;
      v58 = [NWLinkConnection alloc];
      v61 = (void *)objc_msgSend_initWithType_interfaceIndex_localEndpoint_remoteEndpoint_(v58, v59, 5, v60, stack, address, v27);

      objc_msgSend_setHasRequiredInterface_(v61, v62, 1, v63);
      v65 = _supportsNAT64((uint64_t)v22, stack, v64);
      objc_msgSend_setSupportsNAT64_(v61, v66, v65, v67);
      objc_msgSend_setSessionID_(v61, v68, (uint64_t)v256, v69);
      if (!a14)
        objc_msgSend_setDisconnectionState_(v61, v70, 2, v71);
      v243 = (uint64_t)v24;
      v72 = (void *)nw_interface_create_with_index();
      sub_19B98AE78(v61, 1, (uint64_t)"connecting on if:%@(%u) for %@", v73, v74, v75, v76, v77, (uint64_t)v72);

      NWLinkQueue();
      queue = objc_claimAutoreleasedReturnValue();
      secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
      v79 = nw_parameters_copy_default_protocol_stack(secure_udp);
      LODWORD(__buf) = -1431655766;
      arc4random_buf(&__buf, 4uLL);
      LODWORD(__buf) = __buf & 0xFF7FFFFF;
      objc_msgSend_IDSNWLink(IDSFoundationLog, v80, v81, v82);
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v287) = __buf;
        _os_log_impl(&dword_19B949000, v83, OS_LOG_TYPE_DEFAULT, "_generateQUICConnectionID: %08x", buf, 8u);
      }

      buffer = __buf;
      v84 = dispatch_data_create(&buffer, 4uLL, 0, 0);
      options = nw_demux_create_options();
      v271 = 64;
      v272 = bswap32(buffer);
      sub_19B98AE78(v61, 1, (uint64_t)"connect: adding demux rule with pattern: %02x%02x%02x%02x%02x (%08x)", v86, v87, v88, v89, v90, 64);
      v270 = -1;
      v269 = -32;
      LOWORD(v287) = 0;
      *(_DWORD *)buf = 192;
      *(_DWORD *)((char *)&v287 + 2) = bswap32(buffer);
      sub_19B98AE78(v61, 1, (uint64_t)"connect: adding demux rule with pattern: %02x%02x%02x%02x%02x%02x%02x%02x%02x%02x (%08x)", v91, v92, v93, v94, v95, 192);
      v285 = -1;
      __buf = 0xFFFF0000000000E0;
      nw_demux_options_add_pattern();
      nw_demux_options_add_pattern();
      v239 = options;
      nw_protocol_stack_prepend_application_protocol(v79, options);
      v96 = nw_quic_create_options();
      v97 = nw_quic_stream_copy_shared_connection_options();
      nw_quic_connection_set_force_version_negotiation();
      nw_quic_connection_set_keepalive_count();
      v98 = nw_quic_connection_copy_sec_protocol_options();
      protocol = v96;
      v240 = v84;
      nw_quic_set_source_connection_id();
      stacka = v79;
      objc_msgSend_derivePSKFromSessionKey_salt_(IDSNWLink, v99, (uint64_t)v252, v100, v244);
      v101 = objc_claimAutoreleasedReturnValue();
      v245 = v61;
      v237 = v98;
      v238 = address;
      v236 = (void *)v101;
      if (v101)
      {
        v105 = (void *)v101;
        v106 = v61;
        v234 = v37;
        v235 = secure_udp;
        v233 = v23;
        v107 = objc_msgSend_length(v251, v102, v103, v104) + 13;
        v108 = objc_alloc(MEMORY[0x1E0C99DF0]);
        v231 = objc_retainAutorelease((id)objc_msgSend_initWithLength_(v108, v109, v107, v110));
        v114 = v105;
        v115 = (char *)objc_msgSend_mutableBytes(v231, v111, v112, v113);
        *v115 = 0;
        v116 = objc_retainAutorelease(v244);
        v120 = objc_msgSend_bytes(v116, v117, v118, v119);
        v121 = *(_DWORD *)(v120 + 8);
        *(_QWORD *)(v115 + 1) = *(_QWORD *)v120;
        *(_DWORD *)(v115 + 9) = v121;
        v122 = objc_retainAutorelease(v251);
        v126 = (const void *)objc_msgSend_bytes(v122, v123, v124, v125);
        v130 = objc_msgSend_length(v122, v127, v128, v129);
        memcpy(v115 + 13, v126, v130);
        sub_19B98AE78(v106, 1, (uint64_t)"PSK transport parameters: %@, h3 settings: %@", v131, v132, v133, v134, v135, v243);
        v136 = objc_retainAutorelease(v114);
        v140 = (const void *)objc_msgSend_bytes(v136, v137, v138, v139);
        v141 = dispatch_data_create(v140, 0x20uLL, 0, 0);
        v142 = dispatch_data_create(v115, v107, 0, 0);
        sec_protocol_options_add_pre_shared_key(v98, v141, v142);

        sec_protocol_options_add_tls_application_protocol(v98, "h3");
        nw_quic_connection_add_h3_alpn();
        nw_quic_connection_set_disable_spin_bit();
        objc_msgSend__dictionaryFromPSKParameters_(v254, v143, v243, v144);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v147 = sub_19B98CCAC(v145, byte_1E3C867D8, 0x2000, v146);
        sub_19B98CCAC(v145, byte_1E3C867F0, 0x2000, v148);
        sub_19B98CCAC(v145, byte_1E3C86808, 0x2000, v149);
        sub_19B98CCAC(v145, byte_1E3C86820, 0x2000, v150);
        sub_19B98CCAC(v145, byte_1E3C86838, 16, v151);
        sub_19B98CCAC(v145, byte_1E3C86850, 16, v152);
        sub_19B98AE78(v245, 1, (uint64_t)"PSK transport parameters:\n    initialMaxStreamDataBidiLocal: %lld\n    initialMaxStreamDataBidiRemote: %lld\n    initialMaxData: %lld\n    initialMaxStreamDataUni: %lld\n    initialMaxStreamsBidi: %lld\n    initialMaxStreamsUni: %lld", v153, v154, v155, v156, v157, v147);
        nw_quic_set_remote_transport_parameters();
        v232 = (void *)v97;
        nw_quic_connection_set_pmtud_for_non_transport();
        nw_protocol_stack_prepend_application_protocol(stacka, protocol);
        v159 = nw_http3_create_options();
        if (a15)
          nw_http3_set_0rtt_enabled();
        objc_msgSend__dictionaryFromPSKParameters_(v254, v158, v253, v160);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = sub_19B98CCAC(v161, byte_1E3C867F0, 0x10000, v162);
        v229 = v161;
        sub_19B98CCAC(v161, byte_1E3C86868, 0x3FFFLL, v164);
        sub_19B98CCAC(v161, byte_1E3C86820, 100, v165);
        sub_19B98AE78(v245, 1, (uint64_t)"PSK H3 parameters:\n    maxFieldSectionSize: %lld\n    maxTableCapacity: %lld\n    blockedStreams: %lld", v166, v167, v168, v169, v170, v163);
        nw_http3_set_initial_remote_settings();
        v230 = v159;
        nw_protocol_stack_prepend_application_protocol(stacka, v159);
        objc_msgSend_protocolStackDescriptionFor_(v254, v171, (uint64_t)stacka, v172);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setProtocolStackDescription_(v245, v174, (uint64_t)v173, v175);

        objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(v254, v176, (uint64_t)v235, v177, v245, 1, 0);
        v183 = nw_connection_create(endpoint, v235);
        v184 = v183 != 0;
        if (v183)
        {
          v185 = MEMORY[0x1E0C809B0];
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = sub_19B98CD08;
          handler[3] = &unk_1E3C1F320;
          v186 = (id *)v261;
          v187 = v245;
          v261[0] = v187;
          v261[1] = v254;
          v188 = v250;
          v263 = v188;
          v264 = a15;
          v189 = v234;
          v262 = v189;
          nw_connection_set_state_changed_handler(v183, handler);
          objc_msgSend_setConnection_(v187, v190, (uint64_t)v183, v191);
          objc_msgSend_setName_(v187, v192, (uint64_t)CFSTR("Main QUIC QR connection"), v193);
          objc_msgSend__addNWLinkConnection_token_(v254, v194, (uint64_t)v187, v195, v189);
          v196 = queue;
          nw_connection_set_queue(v183, queue);
          if (a15)
          {
            v202 = v185;
            sub_19B98AE78(v187, 1, (uint64_t)"start: holding until first packet ready", v197, v198, v199, v200, v201, v228);
            objc_msgSend_setHasQUICStarted_(v187, v203, 0, v204);
            v205 = v233;
            if (v188)
            {
              v257[0] = v202;
              v257[1] = 3221225472;
              v257[2] = sub_19B98D0C0;
              v257[3] = &unk_1E3C1F348;
              v258 = v187;
              v259 = v188;
              IDSTransportThreadAddBlock(v257);

            }
          }
          else
          {
            sub_19B98AE78(v187, 1, (uint64_t)"start: starting immediately", v197, v198, v199, v200, v201, v228);
            objc_msgSend_setHasQUICStarted_(v187, v224, 1, v225);
            nw_connection_start(v183);
            v205 = v233;
          }

          v37 = v234;
        }
        else
        {
          v37 = v234;
          sub_19B98AE78(v245, 2, (uint64_t)"couldn't create QUIC connection for %@", v178, v179, v180, v181, v182, (uint64_t)v234);
          v265[0] = MEMORY[0x1E0C809B0];
          v265[1] = 3221225472;
          v265[2] = sub_19B98CCF0;
          v265[3] = &unk_1E3C1F2A8;
          v186 = &v266;
          v266 = v250;
          IDSTransportThreadAddBlock(v265);
          v205 = v233;
          v196 = queue;
        }

        v220 = protocol;
        v219 = (void *)v243;
        v211 = v250;
        secure_udp = v235;
        v222 = v231;
        v218 = v232;
      }
      else
      {
        v218 = (void *)v97;
        v205 = v23;
        v220 = v96;
        v219 = (void *)v243;
        objc_msgSend_IDSNWLink(IDSFoundationLog, v102, v103, v104);
        v221 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v221, OS_LOG_TYPE_ERROR))
          sub_19BAEF620();

        v267[0] = MEMORY[0x1E0C809B0];
        v267[1] = 3221225472;
        v267[2] = sub_19B98CC94;
        v267[3] = &unk_1E3C1F2A8;
        v211 = v250;
        v268 = v250;
        IDSTransportThreadAddBlock(v267);
        v184 = 0;
        v222 = v268;
        v196 = queue;
      }

      v57 = v244;
      v40 = v245;
      v24 = v219;
      v23 = v205;
      address = v238;
    }
    else
    {
      objc_msgSend_IDSNWLink(IDSFoundationLog, v54, v55, v56);
      v217 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR))
        sub_19BAEF5F4();

      v274[0] = MEMORY[0x1E0C809B0];
      v274[1] = 3221225472;
      v274[2] = sub_19B98CC7C;
      v274[3] = &unk_1E3C1F2A8;
      v211 = v250;
      v275 = v250;
      IDSTransportThreadAddBlock(v274);
      v184 = 0;
      v196 = v275;
    }

LABEL_46:
    v25 = (id)v253;

    goto LABEL_47;
  }
  objc_msgSend_IDSNWLink(IDSFoundationLog, v31, v32, v33);
  v223 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v223, OS_LOG_TYPE_DEFAULT, "COLLISION MITIGATION failed", buf, 2u);
  }

  v281[0] = MEMORY[0x1E0C809B0];
  v281[1] = 3221225472;
  v281[2] = sub_19B98CAF4;
  v281[3] = &unk_1E3C1F280;
  v211 = v250;
  v281[4] = self;
  v282 = v250;
  IDSTransportThreadAddBlock(v281);
  v184 = 0;

LABEL_47:
  return v184;
}

- (BOOL)connectTCP:(int)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 clientUUID:(unsigned __int8)a6[16] sessionID:(id)a7 relaySessionToken:(id)a8 relaySessionKey:(id)a9 randomSaltBlock:(id)a10 newLocalPort:(unsigned __int16 *)a11 disconnectAfterUse:(BOOL)a12 readyHandler:(id)a13
{
  const char *v17;
  id v19;
  nw_endpoint_t address;
  const char *v21;
  double v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  NWLinkConnection *v48;
  const char *v49;
  double v50;
  uint64_t isH2Connection;
  void *v52;
  const char *v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  double v58;
  const char *v59;
  double v60;
  const char *v61;
  double v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  NSObject *secure_tcp;
  NSObject *v73;
  NSObject *options;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  double v81;
  void *v82;
  const char *v83;
  double v84;
  const char *v85;
  double v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  BOOL v93;
  const char *v94;
  double v95;
  const char *v96;
  double v97;
  const char *v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  double v109;
  void *v110;
  const char *v111;
  double v112;
  NSObject *v113;
  NSObject *v114;
  NSObject *v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *queue;
  void *v120;
  id v121;
  id v122;
  void (**v123)(void);
  id v124;
  void *v125;
  NSObject *endpoint;
  _QWORD handler[5];
  id v128;
  uint64_t *v129;
  _BYTE *v130;
  _QWORD v131[4];
  id v132;
  _QWORD configure_tls[4];
  id v134;
  id v135;
  id v136;
  id v137;
  _QWORD v138[4];
  NSObject *v139;
  _QWORD v140[5];
  id v141;
  uint64_t *v142;
  _QWORD v143[4];
  id v144;
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t (*v148)(uint64_t, uint64_t);
  void (*v149)(uint64_t);
  id v150;
  _QWORD v151[4];
  NSObject *v152;
  uint64_t v153;
  _BYTE buf[24];
  uint64_t (*v155)(uint64_t, uint64_t);
  void (*v156)(uint64_t);
  id v157;
  uint64_t v158;

  v17 = *(const char **)&a3;
  v158 = *MEMORY[0x1E0C80C00];
  v19 = a7;
  v121 = a8;
  v122 = a9;
  v123 = (void (**)(void))a10;
  v124 = a13;
  *(_OWORD *)self->_clientUUID = *(_OWORD *)a6;
  address = nw_endpoint_create_address(a4);
  v153 = 0;
  v125 = v19;
  endpoint = nw_endpoint_create_address(a5);
  LODWORD(a8) = objc_msgSend__findExistingCollidingQRConnection_remoteEndpoint_sessionID_localEndpointToUse_(self, v21, (uint64_t)address, v22);
  v23 = 0;
  v27 = v23;
  if (!(_DWORD)a8)
    goto LABEL_7;
  if (v23
    || (objc_msgSend__findNewLocalEndpointForQRConnection_(self, v24, (uint64_t)address, v26),
        (v27 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_IDSNWLink(IDSFoundationLog, v24, v25, v26);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = address;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v27;
      _os_log_impl(&dword_19B949000, v28, OS_LOG_TYPE_DEFAULT, "connectTCP: COLLISION MITIGATED: local endpoint %@ -> %@", buf, 0x16u);
    }

    *a11 = nw_endpoint_get_port(v27);
    v27 = v27;

    address = v27;
LABEL_7:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v155 = sub_19B98DA08;
    v156 = sub_19B98DA18;
    v157 = (id)0xAAAAAAAAAAAAAAAALL;
    _tokenWithParameters(address, endpoint, v125, 5uLL, 0);
    v157 = (id)objc_claimAutoreleasedReturnValue();
    v145 = 0;
    v146 = &v145;
    v147 = 0x3032000000;
    v148 = sub_19B98DA08;
    v149 = sub_19B98DA18;
    v150 = (id)0xAAAAAAAAAAAAAAAALL;
    objc_msgSend__NWLinkConnectionForToken_(self, v29, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v30);
    v150 = (id)objc_claimAutoreleasedReturnValue();
    if (v146[5])
    {
      v31 = ids_monotonic_time();
      if (objc_msgSend_disconnectionState((void *)v146[5], v32, v33, v31) != 1
        || (objc_msgSend_scheduledDisconnectTime((void *)v146[5], v34, v35, v36), v36 >= v31))
      {
        v105 = objc_msgSend_disconnectionState((void *)v146[5], v34, v35, v36);
        v106 = (void *)v146[5];
        if (v105 == 3)
        {
          sub_19B98AE78(v106, 1, (uint64_t)"this H/2 connection cannot be reused", v100, v101, v102, v103, v104, v117);
          v143[0] = MEMORY[0x1E0C809B0];
          v143[1] = 3221225472;
          v143[2] = sub_19B98DA20;
          v143[3] = &unk_1E3C1F2A8;
          v144 = v124;
          IDSTransportThreadAddBlock(v143);

          v93 = 0;
        }
        else
        {
          sub_19B98AE78(v106, 1, (uint64_t)"connectTCP: %@ already exists", v100, v101, v102, v103, v104, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          v110 = (void *)v146[5];
          if (a12)
          {
            if (objc_msgSend_disconnectionState(v110, v107, v108, v109) == 1)
              objc_msgSend_setDisconnectionState_((void *)v146[5], v111, 0, v112);
          }
          else
          {
            objc_msgSend_setDisconnectionState_(v110, v107, 2, v109);
          }
          v140[0] = MEMORY[0x1E0C809B0];
          v140[1] = 3221225472;
          v140[2] = sub_19B98DA3C;
          v140[3] = &unk_1E3C1F370;
          v140[4] = self;
          v142 = &v145;
          v141 = v124;
          IDSTransportThreadAddBlock(v140);

          v93 = 1;
        }
        goto LABEL_29;
      }
      v37 = (void *)v146[5];
      v38 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      objc_msgSend_scheduledDisconnectTime(v37, v34, v35, v36);
      sub_19B98AE78(v37, 1, (uint64_t)"existing connection %@ already timed out (%.1f < %.1f) - reconnecting...", v39, v40, v41, v42, v43, v38);
      objc_msgSend_disconnectWithSessionID_localAddress_remoteAddress_waitTime_final_(self, v44, (uint64_t)v125, 0.0, a4, a5, 0);
    }
    v123[2]();
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (v120)
    {
      v48 = [NWLinkConnection alloc];
      isH2Connection = objc_msgSend_initWithType_interfaceIndex_localEndpoint_remoteEndpoint_isH2Connection_(v48, v49, 5, v50, v17, address, endpoint, 1);
      v52 = (void *)v146[5];
      v146[5] = isH2Connection;

      objc_msgSend_setHasRequiredInterface_((void *)v146[5], v53, 1, v54);
      v56 = _supportsNAT64((uint64_t)a4, v17, v55);
      objc_msgSend_setSupportsNAT64_((void *)v146[5], v57, v56, v58);
      objc_msgSend_setSessionID_((void *)v146[5], v59, (uint64_t)v125, v60);
      if (!a12)
        objc_msgSend_setDisconnectionState_((void *)v146[5], v61, 2, v62);
      v63 = (void *)v146[5];
      v64 = (void *)nw_interface_create_with_index();
      sub_19B98AE78(v63, 1, (uint64_t)"connectTCP: connecting on if:%@(%u) for %@", v65, v66, v67, v68, v69, (uint64_t)v64);

      NWLinkQueue();
      queue = objc_claimAutoreleasedReturnValue();
      v70 = MEMORY[0x1E0C809B0];
      configure_tls[0] = MEMORY[0x1E0C809B0];
      configure_tls[1] = 3221225472;
      configure_tls[2] = sub_19B98DAA0;
      configure_tls[3] = &unk_1E3C1F398;
      v134 = v122;
      v135 = v120;
      v71 = v124;
      v137 = v71;
      v136 = v121;
      secure_tcp = nw_parameters_create_secure_tcp(configure_tls, (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
      v73 = nw_parameters_copy_default_protocol_stack(secure_tcp);
      options = nw_http2_create_options();
      sub_19B98AE78((void *)v146[5], 1, (uint64_t)"disabling nw capsule handling", v75, v76, v77, v78, v79, v118);
      nw_http2_set_capsule_handling_disabled();
      nw_protocol_stack_prepend_application_protocol(v73, options);
      objc_msgSend_protocolStackDescriptionFor_(self, v80, (uint64_t)v73, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setProtocolStackDescription_((void *)v146[5], v83, (uint64_t)v82, v84);

      objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(self, v85, (uint64_t)secure_tcp, v86, v146[5], 0, 1);
      v92 = nw_connection_create(endpoint, secure_tcp);
      v93 = v92 != 0;
      if (v92)
      {
        handler[0] = v70;
        handler[1] = 3221225472;
        handler[2] = sub_19B98DCA8;
        handler[3] = &unk_1E3C1F410;
        v129 = &v145;
        handler[4] = self;
        v130 = buf;
        v128 = v71;
        nw_connection_set_state_changed_handler(v92, handler);
        objc_msgSend_setConnection_((void *)v146[5], v94, (uint64_t)v92, v95);
        objc_msgSend_setName_((void *)v146[5], v96, (uint64_t)CFSTR("Main TCP QR connection"), v97);
        nw_connection_set_queue(v92, queue);
        nw_connection_start(v92);
        objc_msgSend_setHasQUICStarted_((void *)v146[5], v98, 1, v99);

      }
      else
      {
        sub_19B98AE78((void *)v146[5], 2, (uint64_t)"connectTCP: couldn't create TCPH2 connection for %@", v87, v88, v89, v90, v91, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        v131[0] = v70;
        v131[1] = 3221225472;
        v131[2] = sub_19B98DC8C;
        v131[3] = &unk_1E3C1F2A8;
        v132 = v71;
        IDSTransportThreadAddBlock(v131);

      }
      v114 = queue;
    }
    else
    {
      objc_msgSend_IDSNWLink(IDSFoundationLog, v45, v46, v47);
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        sub_19BAEF5F4();

      v138[0] = MEMORY[0x1E0C809B0];
      v138[1] = 3221225472;
      v138[2] = sub_19B98DA84;
      v138[3] = &unk_1E3C1F2A8;
      v139 = v124;
      IDSTransportThreadAddBlock(v138);
      v93 = 0;
      v114 = v139;
    }

LABEL_29:
    _Block_object_dispose(&v145, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_30;
  }
  objc_msgSend_IDSNWLink(IDSFoundationLog, v24, v25, v26);
  v116 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v116, OS_LOG_TYPE_DEFAULT, "connectTCP: COLLISION MITIGATION failed", buf, 2u);
  }

  v151[0] = MEMORY[0x1E0C809B0];
  v151[1] = 3221225472;
  v151[2] = sub_19B98D9EC;
  v151[3] = &unk_1E3C1F2A8;
  v152 = v124;
  IDSTransportThreadAddBlock(v151);
  v93 = 0;
  v27 = v152;
LABEL_30:

  return v93;
}

- (unsigned)_getConnectedLocalPortAndSetLocalEndpointForConnection:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int port;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  double v21;
  uint64_t v23;

  v3 = a3;
  objc_msgSend_connection(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = nw_connection_copy_connected_local_endpoint();

  if (v8)
  {
    port = nw_endpoint_get_port(v8);
    sub_19B98AE78(v3, 1, (uint64_t)"connectTCP: got local endpoint: %u", v15, v16, v17, v18, v19, port);
  }
  else
  {
    sub_19B98AE78(v3, 2, (uint64_t)"connectTCP: unable to get local endpoint from the connected connection!", v9, v10, v11, v12, v13, v23);
    LOWORD(port) = 0;
  }
  objc_msgSend_setLocalEndpoint_(v3, v20, (uint64_t)v8, v21);

  return port;
}

- (void)peelOffReliableUnicastConnectionforLocalAddress:(const sockaddr *)a3 remoteAddress:(const sockaddr *)a4 sessionID:(id)a5 localQUICConnectionID:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSObject *address;
  double v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  double v23;
  NSObject *v24;
  const char *v25;
  double v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  double v30;
  NSObject *v31;

  v10 = a5;
  v11 = a6;
  v15 = v11;
  if (a3)
  {
    if (a4)
    {
      if (v10)
      {
        if (v11)
        {
          address = nw_endpoint_create_address(a3);
          if (address)
          {
            v22 = nw_endpoint_create_address(a4);
            if (v22)
            {
              _tokenWithParameters(address, v22, v10, 5uLL, 0);
              v24 = objc_claimAutoreleasedReturnValue();
              objc_msgSend__NWLinkConnectionForToken_(self, v25, (uint64_t)v24, v26);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                objc_msgSend__createReliableUnicastConnection_localQUICConnectionID_(self, v27, (uint64_t)v29, v30, v15);
              }
              else
              {
                objc_msgSend_IDSNWLink(IDSFoundationLog, v27, v28, v30);
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                  sub_19BAEF780();

              }
            }
            else
            {
              objc_msgSend_IDSNWLink(IDSFoundationLog, v20, v21, v23);
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                sub_19BAEF754();
            }

          }
          else
          {
            objc_msgSend_IDSNWLink(IDSFoundationLog, v16, v17, v19);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              sub_19BAEF728();
          }

        }
        else
        {
          objc_msgSend_IDSNWLink(IDSFoundationLog, v12, v13, v14);
          address = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(address, OS_LOG_TYPE_ERROR))
            sub_19BAEF6FC();
        }
      }
      else
      {
        objc_msgSend_IDSNWLink(IDSFoundationLog, v12, v13, v14);
        address = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(address, OS_LOG_TYPE_ERROR))
          sub_19BAEF6D0();
      }
    }
    else
    {
      objc_msgSend_IDSNWLink(IDSFoundationLog, v12, v13, v14);
      address = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(address, OS_LOG_TYPE_ERROR))
        sub_19BAEF6A4();
    }
  }
  else
  {
    objc_msgSend_IDSNWLink(IDSFoundationLog, v12, v13, v14);
    address = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(address, OS_LOG_TYPE_ERROR))
      sub_19BAEF678();
  }

}

- (void)disconnectWithSessionID:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 waitTime:(double)a6 final:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  nw_endpoint_t address;
  nw_endpoint_t v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  void (**v37)(void *, uint64_t);
  const char *v38;
  uint64_t v39;
  double v40;
  NSObject *v41;
  _BOOL4 v42;
  _QWORD v43[4];
  void (**v44)(void *, uint64_t);
  _QWORD aBlock[5];
  NSObject *v46;
  NSObject *v47;
  id v48;
  uint8_t buf[4];
  double v50;
  uint64_t v51;

  v7 = a7;
  v51 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  address = nw_endpoint_create_address(a4);
  v14 = nw_endpoint_create_address(a5);
  _tokenWithParameters(address, v14, v12, 5uLL, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__NWLinkConnectionForToken_(self, v16, (uint64_t)v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v18;
  if (v18 && objc_msgSend_disconnectionState(v18, v19, v20, v21) != 3)
  {
    if (v7)
    {
      objc_msgSend_setDisconnectionState_(v22, v23, 3, v25);
      objc_msgSend_setState_(v22, v26, 2, v27);
    }
    else if (objc_msgSend_disconnectionState(v22, v23, v24, v25) != 2)
    {
      objc_msgSend_setDisconnectionState_(v22, v28, 1, v29);
    }
    v30 = ids_monotonic_time();
    objc_msgSend_setScheduledDisconnectTime_(v22, v31, v32, v30 + a6);
  }
  v33 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19B98E6CC;
  aBlock[3] = &unk_1E3C1F438;
  aBlock[4] = self;
  v34 = address;
  v46 = v34;
  v35 = v14;
  v47 = v35;
  v36 = v12;
  v48 = v36;
  v37 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  objc_msgSend_IDSNWLink(IDSFoundationLog, v38, v39, v40);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
  if (a6 == 0.0)
  {
    if (v42)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v41, OS_LOG_TYPE_DEFAULT, "disconnectWithSessionID cleanup immediately", buf, 2u);
    }

    v37[2](v37, 1);
  }
  else
  {
    if (v42)
    {
      *(_DWORD *)buf = 134217984;
      v50 = a6;
      _os_log_impl(&dword_19B949000, v41, OS_LOG_TYPE_DEFAULT, "disconnectWithSessionID scheduled disconnections in %.1f seconds", buf, 0xCu);
    }

    v43[0] = v33;
    v43[1] = 3221225472;
    v43[2] = sub_19B98EA28;
    v43[3] = &unk_1E3C1F2A8;
    v44 = v37;
    IDSTransportThreadAddBlockAfter(v43, a6);

  }
}

- (void)disconnectP2PWithSessionID:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5
{
  id v8;
  nw_endpoint_t address;
  const char *v10;
  uint64_t v11;
  nw_endpoint_t v12;
  double v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  uint8_t v24[16];

  v8 = a3;
  address = nw_endpoint_create_address(a4);
  v12 = nw_endpoint_create_address(a5);
  if (self->_isInvalidated)
  {
    objc_msgSend_IDSNWLink(IDSFoundationLog, v10, v11, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_19B949000, v14, OS_LOG_TYPE_DEFAULT, "disconnectWithSessionID alread invalidated", v24, 2u);
    }

  }
  else
  {
    _tokenWithParameters(address, v12, v8, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__cancelNWLinkConnectionWithToken_removeNWLinkConnectionNow_(self, v16, (uint64_t)v15, v17, 0);
    _tokenWithParameters(address, v12, v8, 9uLL, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend__cancelNWLinkConnectionWithToken_removeNWLinkConnectionNow_(self, v19, (uint64_t)v18, v20, 0);
    _tokenWithParameters(address, v12, v8, 0xAuLL, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend__cancelNWLinkConnectionWithToken_removeNWLinkConnectionNow_(self, v22, (uint64_t)v21, v23, 0);
  }

}

- (void)_cancelNWLinkConnectionWithToken:(id)a3 removeNWLinkConnectionNow:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  double v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend__NWLinkConnectionForToken_(self, v7, (uint64_t)v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend__cancelNWLinkConnection_remove_(self, v9, (uint64_t)v11, v12, v4);
  }
  else
  {
    objc_msgSend_IDSNWLink(IDSFoundationLog, v9, v10, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "_cancelNWLinkConnectionWithToken: cannot find connection to disconnect for %@", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (BOOL)createQUICPodQRConnectionsForSession:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 quicConnectionIDs:(id)a6 channelNumber:(unsigned __int16)a7
{
  uint64_t v7;
  id v12;
  id v13;
  nw_endpoint_t address;
  nw_endpoint_t v15;
  uint64_t v16;
  const char *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  double v22;
  NSObject *v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  double v42;
  int isLocalEndpointCellular;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  BOOL v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  double v56;
  uint64_t v57;
  const char *v58;
  double v59;
  const char *v60;
  uint64_t v61;
  double v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  double v70;
  void *v71;
  const char *v72;
  double v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  const char *v82;
  uint64_t v83;
  double v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  double v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  double v92;
  void *v93;
  const char *v94;
  double v95;
  void *v96;
  const char *v97;
  double v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint8_t buf[16];

  v7 = a7;
  v12 = a3;
  v13 = a6;
  address = nw_endpoint_create_address(a4);
  v15 = nw_endpoint_create_address(a5);
  _tokenWithParameters(address, v15, v12, 5uLL, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend__NWLinkConnectionForToken_(self, v17, v16, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend_IDSNWLink(IDSFoundationLog, v19, v20, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "Connection subtree for QUIC connection:", buf, 2u);
    }

    os_unfair_lock_lock(&self->_lock);
    objc_msgSend_logConnectionSubtree_indentation_(self, v24, (uint64_t)v21, v25, &stru_1E3C2E4E8);
    os_unfair_lock_unlock(&self->_lock);
  }
  _tokenWithParameters(address, v15, v12, 1uLL, 0);
  v109 = objc_claimAutoreleasedReturnValue();
  objc_msgSend__NWLinkConnectionForToken_(self, v26, v109, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v28;
  v110 = (void *)v16;
  if (!self->_disallowQUICPodForCellular)
    goto LABEL_8;
  objc_msgSend_localEndpoint(v28, v29, v30, v31);
  v33 = v12;
  v34 = v21;
  v35 = v15;
  v36 = address;
  v37 = v13;
  v38 = v7;
  v39 = v32;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  isLocalEndpointCellular = objc_msgSend__isLocalEndpointCellular_(self, v41, (uint64_t)v40, v42);

  v32 = v39;
  v7 = v38;
  v13 = v37;
  address = v36;
  v15 = v35;
  v21 = v34;
  v12 = v33;
  v49 = v110;
  if (isLocalEndpointCellular)
  {
    sub_19B98AE78(v32, 1, (uint64_t)"NOT setting up QUICPod because it's disallowed for cellular connections", v44, v45, v46, v47, v48, v105);
    v50 = 0;
    v51 = (void *)v109;
  }
  else
  {
LABEL_8:
    v108 = v32;
    v52 = v12;
    v53 = v7;
    _tokenWithParameters(address, v15, v52, 7uLL, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__cancelNWLinkConnectionWithToken_removeNWLinkConnectionNow_(self, v55, (uint64_t)v54, v56, 1);
    v106 = v52;
    _tokenWithParameters(address, v15, v52, 8uLL, 0);
    v57 = objc_claimAutoreleasedReturnValue();

    objc_msgSend__cancelNWLinkConnectionWithToken_removeNWLinkConnectionNow_(self, v58, v57, v59, 1);
    objc_msgSend_localAVCConnectionIDDispatchData(v13, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend_localAVCConnectionID(v13, v64, v65, v66);
    objc_msgSend_remoteAVCConnectionIDDispatchData(v13, v68, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__createQUICPodConnectionWithType_quicNWLinkConnection_clientQUICConnectionID_clientQUICConnectionIDAsNumber_serverQUICConnectionID_(self, v72, 0, v73, v21, v63, v67, v71);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    v107 = (void *)v57;
    if (v74)
    {
      objc_msgSend_setChannelNumber_(v74, v75, v53, v81);
      objc_msgSend_localIDSConnectionIDDispatchData(v13, v82, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend_localIDSConnectionID(v13, v86, v87, v88);
      objc_msgSend_remoteIDSConnectionIDDispatchData(v13, v90, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__createQUICPodConnectionWithType_quicNWLinkConnection_clientQUICConnectionID_clientQUICConnectionIDAsNumber_serverQUICConnectionID_(self, v94, 1, v95, v21, v85, v89, v93);
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = v96 != 0;
      if (v96)
      {
        objc_msgSend_setChannelNumber_(v96, v97, v53, v98);
      }
      else
      {
        objc_msgSend__cancelNWLinkConnection_remove_(self, v97, (uint64_t)v74, v98, 0);
        sub_19B98AE78(v21, 2, (uint64_t)"failed to create IDS QUICPod connection", v99, v100, v101, v102, v103, v105);
      }
      v12 = v106;
      v51 = (void *)v109;

      v49 = v110;
    }
    else
    {
      sub_19B98AE78(v21, 2, (uint64_t)"failed to create AVC QUICPod connection", v76, v77, v78, v79, v80, v105);
      v50 = 0;
      v51 = (void *)v109;
      v49 = v110;
      v12 = v106;
    }

    v32 = v108;
  }

  return v50;
}

- (BOOL)createQUICPodP2PConnectionsForSession:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 quicConnectionIDs:(id)a6 negotiatedKeys:(id)a7 channelNumber:(unsigned __int16)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  nw_endpoint_t address;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  const char *v26;
  double v27;
  int isLocalEndpointCellular;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  NSObject *v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  id v42;
  const char *v43;
  uint64_t v44;
  double v45;
  const void *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  double v57;
  size_t v58;
  const char *v59;
  uint64_t v60;
  double v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  double v65;
  id v66;
  const char *v67;
  uint64_t v68;
  double v69;
  const void *v70;
  const char *v71;
  uint64_t v72;
  double v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  double v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  double v81;
  size_t v82;
  const char *v83;
  uint64_t v84;
  double v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  double v89;
  id v90;
  const char *v91;
  uint64_t v92;
  double v93;
  const void *v94;
  const char *v95;
  uint64_t v96;
  double v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  double v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  double v105;
  size_t v106;
  dispatch_data_t v107;
  const char *v108;
  uint64_t v109;
  double v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  double v114;
  id v115;
  const char *v116;
  uint64_t v117;
  double v118;
  const void *v119;
  const char *v120;
  uint64_t v121;
  double v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  double v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  double v130;
  size_t v131;
  const char *v132;
  uint64_t v133;
  double v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  double v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  double v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  double v146;
  id v147;
  id v148;
  const char *v149;
  double v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  double v158;
  const char *v159;
  uint64_t v160;
  double v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  double v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  double v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  double v173;
  id v174;
  void (**v175)(id, _QWORD);
  const char *v176;
  double v177;
  void *v178;
  const char *v179;
  double v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v187;
  unsigned int v188;
  dispatch_data_t v189;
  void *v190;
  nw_endpoint_t v191;
  nw_endpoint_t v192;
  void *v193;
  void *v194;
  void *v195;
  dispatch_data_t v196;
  dispatch_data_t v197;
  id v198;
  void *v199;
  void *v200;
  uint8_t buf[8];
  _QWORD v202[3];
  char v203;
  _QWORD v204[3];
  char v205;
  _QWORD v206[3];
  char v207;

  v188 = a8;
  v14 = a3;
  v198 = a6;
  v15 = a7;
  v16 = (void (**)(id, _QWORD))a9;
  v206[0] = 0;
  v206[1] = v206;
  v206[2] = 0x2020000000;
  v207 = 1;
  v204[0] = 0;
  v204[1] = v204;
  v204[2] = 0x2020000000;
  v205 = 0;
  v202[0] = 0;
  v202[1] = v202;
  v202[2] = 0x2020000000;
  v203 = 0;
  address = nw_endpoint_create_address(a4);
  v191 = nw_endpoint_create_address(a5);
  v192 = address;
  v193 = v14;
  _tokenWithParameters(address, v191, v14, 1uLL, 0);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__NWLinkConnectionForToken_(self, v18, (uint64_t)v190, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v20;
  if (self->_disallowQUICPodForCellular
    && (objc_msgSend_localEndpoint(v20, v21, v22, v23),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        isLocalEndpointCellular = objc_msgSend__isLocalEndpointCellular_(self, v26, (uint64_t)v25, v27),
        v25,
        isLocalEndpointCellular))
  {
    sub_19B98AE78(v24, 1, (uint64_t)"NOT setting up QUICPod because it's disallowed for cellular connections", v29, v30, v31, v32, v33, v187);
    v16[2](v16, 0);
    v34 = 0;
  }
  else
  {
    if (v24)
    {
      objc_msgSend_IDSNWLink(IDSFoundationLog, v21, v22, v23);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "Connection subtree for ChannelData connection:", buf, 2u);
      }

      os_unfair_lock_lock(&self->_lock);
      objc_msgSend_logConnectionSubtree_indentation_(self, v36, (uint64_t)v24, v37, &stru_1E3C2E4E8);
      os_unfair_lock_unlock(&self->_lock);
    }
    objc_msgSend_avc(v15, v21, v22, v23);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientSecret(v38, v39, v40, v41);
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v46 = (const void *)objc_msgSend_bytes(v42, v43, v44, v45);
    objc_msgSend_avc(v15, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientSecret(v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend_length(v54, v55, v56, v57);
    v197 = dispatch_data_create(v46, v58, 0, 0);

    objc_msgSend_avc(v15, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serverSecret(v62, v63, v64, v65);
    v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v70 = (const void *)objc_msgSend_bytes(v66, v67, v68, v69);
    objc_msgSend_avc(v15, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serverSecret(v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend_length(v78, v79, v80, v81);
    v196 = dispatch_data_create(v70, v82, 0, 0);

    objc_msgSend_ids(v15, v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientSecret(v86, v87, v88, v89);
    v90 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v94 = (const void *)objc_msgSend_bytes(v90, v91, v92, v93);
    objc_msgSend_ids(v15, v95, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientSecret(v98, v99, v100, v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend_length(v102, v103, v104, v105);
    v194 = v24;
    v195 = v16;
    v107 = dispatch_data_create(v94, v106, 0, 0);

    objc_msgSend_ids(v15, v108, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serverSecret(v111, v112, v113, v114);
    v115 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v119 = (const void *)objc_msgSend_bytes(v115, v116, v117, v118);
    objc_msgSend_ids(v15, v120, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serverSecret(v123, v124, v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = objc_msgSend_length(v127, v128, v129, v130);
    v189 = dispatch_data_create(v119, v131, 0, 0);

    objc_msgSend_localAVCConnectionIDDispatchData(v198, v132, v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteAVCConnectionIDDispatchData(v198, v136, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = objc_msgSend_localAVCConnectionID(v198, v140, v141, v142);
    objc_msgSend_isServer(v15, v144, v145, v146);
    v147 = v194;
    v199 = v147;
    v148 = v195;
    v200 = v148;
    objc_msgSend__createP2PQUICPodConnectionWithType_udpNWLinkConnection_clientQUICConnectionID_serverQUICConnectionID_clientQUICConnectionIDNumber_clientSecret_serverSecret_isServer_completionHandler_(self, v149, 0, v150, v147, v135, v139, v143, v197);
    v151 = (void *)objc_claimAutoreleasedReturnValue();

    if (v151)
    {
      objc_msgSend_setChannelNumber_(v151, v152, v188, v158);
      objc_msgSend_localIDSConnectionIDDispatchData(v198, v159, v160, v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_remoteIDSConnectionIDDispatchData(v198, v163, v164, v165);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = objc_msgSend_localIDSConnectionID(v198, v167, v168, v169);
      objc_msgSend_isServer(v15, v171, v172, v173);
      v174 = v147;
      v175 = (void (**)(id, _QWORD))v148;
      objc_msgSend__createP2PQUICPodConnectionWithType_udpNWLinkConnection_clientQUICConnectionID_serverQUICConnectionID_clientQUICConnectionIDNumber_clientSecret_serverSecret_isServer_completionHandler_(self, v176, 1, v177, v174, v162, v166, v170, v107);
      v178 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = v178 != 0;
      if (v178)
      {
        objc_msgSend_setChannelNumber_(v178, v179, v188, v180);
      }
      else
      {
        objc_msgSend__cancelNWLinkConnection_remove_(self, v179, (uint64_t)v151, v180, 0);
        sub_19B98AE78(v174, 2, (uint64_t)"failed to create IDS QUICPod connection", v181, v182, v183, v184, v185, (uint64_t)v189);
        v175[2](v175, 0);
      }

    }
    else
    {
      sub_19B98AE78(v147, 2, (uint64_t)"failed to create AVC QUICPod connection", v153, v154, v155, v156, v157, (uint64_t)v196);
      (*((void (**)(id, _QWORD))v148 + 2))(v148, 0);
      v34 = 0;
    }

    v24 = v194;
    v16 = (void (**)(id, _QWORD))v195;
  }

  _Block_object_dispose(v202, 8);
  _Block_object_dispose(v204, 8);
  _Block_object_dispose(v206, 8);

  return v34;
}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  double v5;
  $D38D7C82BC04D962879521F520F2ED6C *v7;

  v7 = a3;
  return objc_msgSend_sendPacketBufferArray_arraySize_toDeviceUniqueID_cbuuid_(self, a2, (uint64_t)&v7, v5, 1, a4, a5);
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  double v13;
  void *v14;
  double v15;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  nw_endpoint_t address;
  const char *v18;
  nw_endpoint_t v19;
  double v20;
  void *v21;
  nw_endpoint_t v22;
  nw_endpoint_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  double v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  double v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  id v40;
  const char *v41;
  double v42;
  const char *v43;
  void *v44;
  double v45;
  uint64_t v46;
  const void *v47;
  size_t v48;
  id v49;
  dispatch_data_t v50;
  NSObject *v51;
  uint64_t v52;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v53;
  _QWORD *v54;
  NSObject *v55;
  dispatch_data_t concat;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  const char *v73;
  uint64_t v74;
  double v75;
  const char *v76;
  uint64_t v77;
  double v78;
  NSObject *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t (**v86)(void *, NSObject *);
  const char *v87;
  const char *v89;
  double v90;
  const char *v91;
  uint64_t v92;
  double v93;
  const char *v94;
  uint64_t v95;
  double v96;
  void *v97;
  nw_endpoint_t v98;
  nw_endpoint_t v99;
  unint64_t v100;
  const char *v101;
  NWLinkConnection *v102;
  const char *v103;
  double v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  double v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  double v115;
  const char *v116;
  double v117;
  int shouldAllowP2PConnectionTo_anotherRemoteEndpoint;
  const char *v119;
  double v120;
  void *v121;
  const char *v122;
  double v123;
  uint64_t v124;
  const char *v125;
  double v126;
  uint64_t v127;
  uint64_t v128;
  const sockaddr *v129;
  void *v130;
  int v131;
  nw_endpoint_t v132;
  void *v133;
  id v134;
  nw_endpoint_t v135;
  IDSNWLink *v136;
  _QWORD aBlock[5];
  NSObject *v138;
  id v139;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v140;
  char v141;
  _BYTE destructor[24];
  void *v143;
  id v144;
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v14 = v11;
  if (v11 && (objc_msgSend_isEqualToString_(v11, v12, (uint64_t)self->_cbuuid, v13) & 1) == 0)
  {
    if (a4 < 1)
    {
      v26 = 10;
    }
    else
    {
      v25 = a4;
      v26 = 10;
      do
      {
        v27 = (uint64_t)*a3++;
        _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSNWLink.m", (const char *)0x6BF, v27, v15);
        --v25;
      }
      while (v25);
    }
  }
  else
  {
    if (a4 >= 1)
    {
      v16 = *a3;
      v129 = (const sockaddr *)((char *)*a3 + 56);
      address = nw_endpoint_create_address(v129);
      v19 = nw_endpoint_create_address((const sockaddr *)((char *)v16 + 184));
      v136 = self;
      v131 = *((unsigned __int8 *)v16 + 44);
      v134 = v10;
      if (*((_BYTE *)v16 + 44))
      {
        v21 = (void *)*((_QWORD *)v16 + 158);
        v22 = address;
        v23 = v19;
        v24 = 5;
      }
      else
      {
        if (!*((_BYTE *)v16 + 45) && !*((_BYTE *)v16 + 46))
        {
          if (*((_BYTE *)v16 + 43))
          {
            v97 = (void *)*((_QWORD *)v16 + 158);
            v98 = address;
            v99 = v19;
            v100 = 0;
          }
          else
          {
            shouldAllowP2PConnectionTo_anotherRemoteEndpoint = objc_msgSend__shouldAllowP2PConnectionTo_anotherRemoteEndpoint_(self, v18, (uint64_t)v19, v20, 0);
            v97 = (void *)*((_QWORD *)v16 + 158);
            if (shouldAllowP2PConnectionTo_anotherRemoteEndpoint)
            {
              v98 = address;
              v99 = v19;
              v100 = 10;
            }
            else
            {
              v98 = address;
              v99 = v19;
              v100 = 8;
            }
          }
          _tokenWithParameters(v98, v99, v97, v100, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__NWLinkConnectionForToken_(self, v119, (uint64_t)v28, v120);
          v31 = objc_claimAutoreleasedReturnValue();
          if (v31)
            goto LABEL_16;
          _tokenWithParameters(address, v19, v14, 2uLL, 0);
          v121 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend__NWLinkConnectionForToken_(self, v122, (uint64_t)v121, v123);
          v124 = objc_claimAutoreleasedReturnValue();
          if (v124)
          {
            v35 = v124;
            v28 = v121;
LABEL_17:
            v133 = v14;
            v135 = v19;
            v132 = address;
            if (objc_msgSend_type(v35, v32, v33, v34) == 7)
              v39 = 4;
            else
              v39 = 4 * (objc_msgSend_type(v35, v36, v37, v38) == 8);
            v40 = objc_alloc(MEMORY[0x1E0CB3868]);
            v44 = (void *)objc_msgSend_initWithOptions_(v40, v41, 2, v42);
            v46 = 0;
            do
              objc_msgSend_addPointer_(v44, v43, (uint64_t)a3[v46++], v45);
            while (a4 != v46);
            v130 = v28;
            v47 = (const void *)(*(_QWORD *)*a3 + v39);
            v48 = *((_QWORD *)*a3 + 2) - v39;
            *(_QWORD *)destructor = MEMORY[0x1E0C809B0];
            *(_QWORD *)&destructor[8] = 3221225472;
            *(_QWORD *)&destructor[16] = sub_19B998B68;
            v143 = &unk_1E3C1F898;
            v49 = v44;
            v144 = v49;
            v50 = dispatch_data_create(v47, v48, 0, destructor);
            v51 = v50;
            if (a4 < 2)
            {
              concat = v50;
            }
            else
            {
              v52 = a4 - 1;
              v53 = a3 + 1;
              do
              {
                v54 = *v53++;
                v55 = dispatch_data_create((const void *)(*v54 + v39), v54[2] - v39, 0, &unk_1E3C1F8B8);
                concat = dispatch_data_create_concat(v51, v55);

                v51 = concat;
                --v52;
              }
              while (v52);
            }

            sub_19B98AE78(v35, 3, (uint64_t)"sendPacketBufferArray: token %@, isQRControlPacket: %@, isSTUNPacket: %@, isReliableUnicast: %@, isClientQUIC: %@", v57, v58, v59, v60, v61, (uint64_t)v130);
            if (objc_msgSend_type(v35, v62, v63, v64) == 7
              || objc_msgSend_type(v35, v65, v66, v72) == 8
              || objc_msgSend_type(v35, v73, v74, v75) == 9
              || objc_msgSend_type(v35, v76, v77, v78) == 10)
            {
              sub_19B98AE78(v35, 3, (uint64_t)"sendPacketBufferArray: sending QUICPod", v67, v68, v69, v70, v71, v127);
            }
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = sub_19B98FFA8;
            aBlock[3] = &unk_1E3C1F488;
            aBlock[4] = v136;
            v79 = concat;
            v138 = v79;
            v140 = v16;
            v141 = v131;
            v80 = v130;
            v139 = v80;
            v86 = (uint64_t (**)(void *, NSObject *))_Block_copy(aBlock);
            v14 = v133;
            if (v131)
            {
              v87 = "qr control packet";
            }
            else
            {
              sub_19B98AE78(v35, 3, (uint64_t)"non-qr control packet", v81, v82, v83, v84, v85, v127);
              if (!v35)
              {
                sub_19B98AE78(0, 3, (uint64_t)"NO existing NWLinkConnection", v81, v82, v83, v84, v85, v127);
                if ((objc_msgSend__shouldAllowP2PConnectionTo_anotherRemoteEndpoint_(v136, v89, (uint64_t)v135, v90, 0) & 1) != 0)
                {
                  if (objc_msgSend__doesUDPConnectionInProgressExist_(v136, v91, (uint64_t)v80, v93))
                  {
                    objc_msgSend_IDSNWLink(IDSFoundationLog, v94, v95, v96);
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)destructor = 0;
                      _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "existing UDP connection in progress - return", destructor, 2u);
                    }
                    v26 = 14;
                  }
                  else
                  {
                    v101 = (const char *)*((unsigned int *)v16 + 12);
                    v102 = [NWLinkConnection alloc];
                    v35 = objc_msgSend_initWithType_interfaceIndex_localEndpoint_remoteEndpoint_(v102, v103, 0, v104, v101, v132, v135);
                    sub_19B98AE78(v35, 3, (uint64_t)"created NWLinkConnection", v105, v106, v107, v108, v109, v128);
                    objc_msgSend_setHasRequiredInterface_(v35, v110, 1, v111);
                    v113 = _supportsNAT64((uint64_t)v129, v101, v112);
                    objc_msgSend_setSupportsNAT64_(v35, v114, v113, v115);
                    objc_msgSend__createUDPConnectionForNWLinkConnection_readyHandler_(v136, v116, (uint64_t)v35, v117, v86);
                    v26 = 0;
                  }
                }
                else
                {
                  objc_msgSend_IDSNWLink(IDSFoundationLog, v91, v92, v93);
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)destructor = 138412546;
                    *(_QWORD *)&destructor[4] = v132;
                    *(_WORD *)&destructor[12] = 2112;
                    *(_QWORD *)&destructor[14] = v135;
                    _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "no direct UDP connection allowed from %@ to QR server %@", destructor, 0x16u);
                  }
                  v26 = 6;
                }
                goto LABEL_37;
              }
              v87 = "have existing NWLinkConnection";
            }
            sub_19B98AE78(v35, 3, (uint64_t)v87, v81, v82, v83, v84, v85, v127);
            v26 = v86[2](v86, v35);
LABEL_37:

            v10 = v134;
            goto LABEL_39;
          }
          _tokenWithParameters(address, v19, *((void **)v16 + 158), 0, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend__NWLinkConnectionForToken_(self, v125, (uint64_t)v28, v126);
LABEL_15:
          v31 = objc_claimAutoreleasedReturnValue();
LABEL_16:
          v35 = v31;
          goto LABEL_17;
        }
        v21 = (void *)*((_QWORD *)v16 + 158);
        v22 = address;
        v23 = v19;
        v24 = 0;
      }
      _tokenWithParameters(v22, v23, v21, v24, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__NWLinkConnectionForToken_(self, v29, (uint64_t)v28, v30);
      goto LABEL_15;
    }
    v26 = 9;
  }
LABEL_39:

  return v26;
}

- (id)connectionInfoForLocalAddress:(const sockaddr *)a3 remoteAddress:(const sockaddr *)a4 clientUniquePID:(unint64_t)a5 sessionID:(id)a6 type:(unint64_t)a7 isRelay:(BOOL)a8 isCellular:(BOOL)a9
{
  _BOOL8 v9;
  id v15;
  IDSNWConnectionInfo *v16;
  nw_endpoint_t address;
  nw_endpoint_t v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  _BOOL8 v27;
  uint64_t v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  const char *v43;
  uint64_t v44;
  double v45;
  NSObject *v46;
  void *v47;
  const char *v48;
  double v49;
  const char *v50;
  double v51;
  void *isQUICPod;
  const char *v53;
  double v54;
  const char *v55;
  uint64_t v56;
  double v57;
  void *v58;
  const char *v59;
  double v60;
  IDSNWConnectionInfo *v61;
  NSObject *v62;
  NSObject *v64;
  IDSNWLink *v65;
  uint8_t buf[4];
  void *v67;
  uint64_t v68;

  v9 = a8;
  v68 = *MEMORY[0x1E0C80C00];
  v15 = a6;
  v16 = objc_alloc_init(IDSNWConnectionInfo);
  address = nw_endpoint_create_address(a3);
  v18 = nw_endpoint_create_address(a4);
  _tokenWithParameters(address, v18, v15, a7, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = self;
  objc_msgSend__NWLinkConnectionForToken_(self, v20, (uint64_t)v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v22;
  if (v22)
  {
    v27 = a7 - 7 < 4;
    v28 = objc_msgSend_connectionID(v22, v23, v24, v25);
    objc_msgSend_setConnectionID_(v16, v29, v28, v30);
    objc_msgSend_setIsQUICPod_(v16, v31, v27, v32);
    objc_msgSend_setIsValid_(v16, v33, 1, v34);
    objc_msgSend_setIsCellular_(v16, v35, a9, v36);
    objc_msgSend_setClientUniquePID_(v16, v37, a5, v38);
    objc_msgSend_setSessionID_(v16, v39, (uint64_t)v15, v40);
    objc_msgSend_setToken_(v16, v41, (uint64_t)v19, v42);
    objc_msgSend_connection(v26, v43, v44, v45);
    v64 = v18;
    v46 = address;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setConnection_(v16, v48, (uint64_t)v47, v49);

    isQUICPod = (void *)objc_msgSend__copyChildConnectionIDFor_clientUniquePID_sessionID_isRelay_isCellular_isQUICPod_(v65, v50, (uint64_t)v26, v51, a5, v15, v9, a9, v27);
    objc_msgSend_setChildConnectionID_(v16, v53, (uint64_t)isQUICPod, v54);

    objc_msgSend_protocolStackDescription(v26, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtocolStackDescription_(v16, v59, (uint64_t)v58, v60);

    address = v46;
    v18 = v64;
    v61 = v16;
  }
  else
  {
    objc_msgSend_IDSNWLink(IDSFoundationLog, v23, v24, v25);
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v19;
      _os_log_impl(&dword_19B949000, v62, OS_LOG_TYPE_DEFAULT, "Did not find NWLinkConnection for token %@", buf, 0xCu);
    }

    v61 = 0;
  }

  return v61;
}

- ($EF6EC642B48E9BFC073294F479749444)demuxPatternForQPodConnectionWithID:(unsigned int)a3 forNWLinkConnection:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  __int16 v10;
  $EF6EC642B48E9BFC073294F479749444 result;

  v8 = bswap32(a3);
  sub_19B98AE78(a4, 1, (uint64_t)"copyChildConnectionIDFor: adding demux rule with pattern: %02x%02x%02x%02x%02x (%08x)", (uint64_t)a4, v4, v5, v6, v7, 64);
  v9 = (HIWORD(v8) << 24) | ((unint64_t)HIBYTE(v8) << 32) | (v8 << 8) & 0xFF0000 | (unint64_t)((v8 << 8) & 0xFF00) | 0xFFFFE00000000040;
  v10 = -1;
  *(_DWORD *)result.var0 = v9;
  result.var0[4] = BYTE4(v9);
  *(_WORD *)result.var1 = *(_WORD *)((char *)&v9 + 5);
  result.var1[2] = HIBYTE(v9);
  *(_WORD *)&result.var1[3] = v10;
  return result;
}

- (id)_copyChildConnectionIDFor:(id)a3 clientUniquePID:(unint64_t)a4 sessionID:(id)a5 isRelay:(BOOL)a6 isCellular:(BOOL)a7 isQUICPod:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  double v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  NSObject *v39;
  _BOOL4 v40;
  const char *v41;
  uint64_t v42;
  double v43;
  id v44;
  const char *v45;
  double v46;
  void *v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  double v52;
  const char *v53;
  uint64_t v54;
  double v55;
  const char *v56;
  uint64_t v57;
  double v58;
  id v59;
  const char *v60;
  double v61;
  const char *v62;
  uint64_t v63;
  double v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  double v68;
  NSObject *v69;
  const char *v70;
  double v71;
  NSObject *v72;
  const char *v73;
  uint8_t *v74;
  NSObject *v75;
  uint32_t v76;
  NSObject *v78;
  const char *v79;
  double v80;
  const char *v81;
  uint64_t v82;
  double v83;
  uint64_t options;
  const char *v85;
  uint64_t v86;
  double v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  double v91;
  __int16 v92;
  NSObject *v93;
  NSObject *v94;
  NSObject *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  double v105;
  NSObject *v106;
  nw_endpoint_t v107;
  nw_endpoint_t v108;
  NSObject *v109;
  nw_endpoint_t v110;
  const char *v111;
  uint64_t v112;
  void *evaluator_for_endpoint;
  double v114;
  const char *v115;
  uint64_t v116;
  double v117;
  id v118;
  const char *v119;
  double v120;
  const char *v121;
  double v122;
  const char *v123;
  uint64_t v124;
  double v125;
  NSObject *v126;
  NSObject *v127;
  uint64_t v128;
  NSObject *v129;
  void *v130;
  NSObject *v131;
  nw_parameters_t secure_udp;
  void *v133;
  void *v134;
  uint64_t v135;
  uint8_t v136[16];
  __int128 v137;
  _QWORD v138[2];
  _BYTE buf[22];
  __int16 v140;
  uint64_t v141;
  uint64_t v142;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v142 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v17 = v13;
  if (a4)
  {
    objc_msgSend_localEndpoint(v13, v14, v15, v16);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteEndpoint(v17, v19, v20, v21);
    v135 = objc_claimAutoreleasedReturnValue();
    _tokenForNWLinkConnection(v17);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_IDSNWLink(IDSFoundationLog, v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v22;
      _os_log_impl(&dword_19B949000, v26, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress token = %@", buf, 0xCu);
    }

    objc_msgSend_connection(v17, v27, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v30;
    v134 = (void *)v22;
    if (!v30)
    {
      objc_msgSend_IDSNWLink(IDSFoundationLog, v31, v32, v33);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        v48 = (void *)v135;
        *(_QWORD *)&buf[14] = v135;
        _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress no QUIC or UDP connection found for %@ / %@", buf, 0x16u);
        v47 = 0;
        goto LABEL_36;
      }
LABEL_35:
      v47 = 0;
      v48 = (void *)v135;
      goto LABEL_36;
    }
    v133 = (void *)v30;
    objc_msgSend__childConnectionEvaluatorForToken_(self, v31, v22, v33);
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_IDSNWLink(IDSFoundationLog, v36, v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    if (v35)
    {
      if (v40)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v133;
        _os_log_impl(&dword_19B949000, v39, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress found existing parent connection: %@", buf, 0xCu);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      if ((nw_path_evaluator_get_client_id() & 1) != 0)
      {
        v44 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v47 = (void *)objc_msgSend_initWithUUIDBytes_(v44, v45, (uint64_t)buf, v46);
        v48 = (void *)v135;
        v34 = v133;
LABEL_36:

        goto LABEL_37;
      }
      objc_msgSend_IDSNWLink(IDSFoundationLog, v41, v42, v43);
      v72 = objc_claimAutoreleasedReturnValue();
      v34 = v133;
      if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      LOWORD(v138[0]) = 0;
      v73 = "copyChildConnectionIDForLocalAddress: failed to get existing client id";
      v74 = (uint8_t *)v138;
      v75 = v72;
      v76 = 2;
    }
    else
    {
      if (v40)
      {
        v49 = "P2P";
        *(_DWORD *)buf = 136315650;
        if (v10)
          v49 = "QUIC";
        *(_QWORD *)&buf[4] = v49;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        v140 = 2112;
        v141 = v135;
        _os_log_impl(&dword_19B949000, v39, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress %s connection found for %@ / %@", buf, 0x20u);
      }

      v34 = v133;
      v35 = nw_connection_copy_connected_path();
      if (v35)
      {
        if ((nw_path_uses_nexus() & 1) != 0)
        {
          v138[0] = 0xAAAAAAAAAAAAAAAALL;
          v138[1] = 0xAAAAAAAAAAAAAAAALL;
          if ((nw_path_get_client_id() & 1) != 0)
          {
            v59 = objc_alloc(MEMORY[0x1E0CB3A28]);
            v131 = objc_msgSend_initWithUUIDBytes_(v59, v60, (uint64_t)v138, v61);
            objc_msgSend_IDSNWLink(IDSFoundationLog, v62, v63, v64);
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v131;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v133;
              _os_log_impl(&dword_19B949000, v65, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress got %@ from %@", buf, 0x16u);
            }

            if (v8)
            {
              objc_msgSend_quicPodParamaters(v17, v66, v67, v68);
              v69 = objc_claimAutoreleasedReturnValue();
              secure_udp = nw_parameters_copy(v69);

            }
            else
            {
              secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
            }
            v34 = v133;
            memset(buf, 170, 16);
            objc_msgSend_getUUIDBytes_(v131, v70, (uint64_t)buf, v71);
            nw_parameters_set_parent_id();
            objc_msgSend__findListenerWithLocalEndpoint_(self, v79, (uint64_t)v18, v80);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            if (v130)
            {
              nw_parameters_allow_sharing_port_with_listener();
              options = nw_demux_create_options();
              if (v8)
              {
                v88 = options;
                v89 = objc_msgSend_localQUICConnectionID(v17, v85, v86, v87);
                *(_QWORD *)&v137 = objc_msgSend_demuxPatternForQPodConnectionWithID_forNWLinkConnection_(self, v90, v89, v91, v17);
                WORD4(v137) = v92;
                nw_demux_options_add_pattern();
                v93 = secure_udp;
                v94 = v88;
              }
              else
              {
                if (v10)
                {
                  v94 = options;
                  nw_demux_options_add_pattern();
                  *(_QWORD *)&v137 = 0x8000000060;
                  *(_QWORD *)v136 = 0x10000080000000F0;
                }
                else
                {
                  LOBYTE(v137) = 0x80;
                  v136[0] = -64;
                  v96 = options;
                  nw_demux_options_add_pattern();
                  v94 = v96;
                }
                nw_demux_options_add_pattern();
                v93 = secure_udp;
                if (v9)
                {
                  sub_19B98AE78(v17, 1, (uint64_t)"copyChildConnectionIDFor: adding demux rule for baseband notification packets", v97, v98, v99, v100, v101, v128);
                  LODWORD(v137) = -272716322;
                  *(_DWORD *)v136 = -1;
                  nw_demux_options_add_pattern();
                }
              }
              v129 = v94;
              nw_parameters_set_channel_demux_options();
              IDSRealTimeContext();
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              nw_parameters_set_context();

              nw_parameters_set_delegated_unique_pid();
              if (!uuid_is_null(self->_clientUUID))
                nw_parameters_set_e_proc_uuid();
              objc_msgSend_IDSNWLink(IDSFoundationLog, v103, v104, v105);
              v106 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(v137) = 138412290;
                *(_QWORD *)((char *)&v137 + 4) = v131;
                _os_log_impl(&dword_19B949000, v106, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress: create evaluator with parent connection ID %@", (uint8_t *)&v137, 0xCu);
              }

              v107 = nw_path_copy_effective_local_endpoint(v35);
              v108 = v107;
              if (v107)
                v109 = v107;
              else
                v109 = v18;
              nw_parameters_set_local_endpoint(v93, v109);
              v110 = nw_path_copy_effective_remote_endpoint(v35);
              evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
              if (evaluator_for_endpoint)
              {
                v137 = 0uLL;
                if ((nw_path_evaluator_get_client_id() & 1) != 0)
                {
                  v118 = objc_alloc(MEMORY[0x1E0CB3A28]);
                  v47 = (void *)objc_msgSend_initWithUUIDBytes_(v118, v119, (uint64_t)&v137, v120);
                  objc_msgSend__addChildConnectionEvaluator_token_(self, v121, (uint64_t)evaluator_for_endpoint, v122, v134);
                  objc_msgSend_IDSNWLink(IDSFoundationLog, v123, v124, v125);
                  v126 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v136 = 138412290;
                    *(_QWORD *)&v136[4] = v47;
                    _os_log_impl(&dword_19B949000, v126, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress: created child connection ID %@", v136, 0xCu);
                  }
                }
                else
                {
                  objc_msgSend_IDSNWLink(IDSFoundationLog, v115, v116, v117);
                  v126 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)v136 = 0;
                    _os_log_impl(&dword_19B949000, v126, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress: failed to get client id", v136, 2u);
                  }
                  v47 = 0;
                }
                v78 = v131;

              }
              else
              {
                objc_msgSend_IDSNWLink(IDSFoundationLog, v111, v112, v114);
                v127 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v137) = 0;
                  _os_log_impl(&dword_19B949000, v127, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress: failed to create evaluator for", (uint8_t *)&v137, 2u);
                }

                v47 = 0;
                v34 = v133;
                v78 = v131;
              }

              v48 = (void *)v135;
            }
            else
            {
              objc_msgSend_IDSNWLink(IDSFoundationLog, v81, v82, v83);
              v95 = objc_claimAutoreleasedReturnValue();
              v129 = v95;
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(v137) = 138412290;
                *(_QWORD *)((char *)&v137 + 4) = v133;
                _os_log_impl(&dword_19B949000, v95, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress failed to find the listener for %@", (uint8_t *)&v137, 0xCu);
              }
              v47 = 0;
              v48 = (void *)v135;
              v78 = v131;
            }

          }
          else
          {
            objc_msgSend_IDSNWLink(IDSFoundationLog, v56, v57, v58);
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v133;
              _os_log_impl(&dword_19B949000, v78, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress failed to get client id for %@", buf, 0xCu);
            }
            v47 = 0;
            v48 = (void *)v135;
          }

          goto LABEL_36;
        }
        objc_msgSend_IDSNWLink(IDSFoundationLog, v53, v54, v55);
        v72 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          goto LABEL_34;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v133;
        v73 = "copyChildConnectionIDForLocalAddress this connection doesn't support nexus: %@";
      }
      else
      {
        objc_msgSend_IDSNWLink(IDSFoundationLog, v50, v51, v52);
        v72 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
LABEL_34:

          goto LABEL_35;
        }
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v133;
        v73 = "copyChildConnectionIDForLocalAddress failed to copy path for %@";
      }
      v74 = buf;
      v75 = v72;
      v76 = 12;
    }
    _os_log_impl(&dword_19B949000, v75, OS_LOG_TYPE_DEFAULT, v73, v74, v76);
    goto LABEL_34;
  }
  objc_msgSend_IDSNWLink(IDSFoundationLog, v14, v15, v16);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v18, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress client uniquePID is 0 - skip for now", buf, 2u);
  }
  v47 = 0;
LABEL_37:

  return v47;
}

- (void)removeChildConnectionEvaluatorForSessionID:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 isRelay:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  nw_endpoint_t address;
  nw_endpoint_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSMutableDictionary *tokenToChildConnectionEvaluator;
  NSMutableDictionary *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  NSObject *v22;
  NSMutableDictionary *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  NSMutableDictionary *v29;
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  address = nw_endpoint_create_address(a4);
  v12 = nw_endpoint_create_address(a5);
  if (v6)
    v13 = 5;
  else
    v13 = 0;
  if (v6)
    v14 = 7;
  else
    v14 = 9;
  _tokenWithParameters(address, v12, v10, v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _tokenWithParameters(address, v12, v10, v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  if (v15)
  {
    tokenToChildConnectionEvaluator = self->_tokenToChildConnectionEvaluator;
    if (tokenToChildConnectionEvaluator)
      CFDictionaryRemoveValue((CFMutableDictionaryRef)tokenToChildConnectionEvaluator, v15);
  }
  if (v16)
  {
    v18 = self->_tokenToChildConnectionEvaluator;
    if (v18)
      CFDictionaryRemoveValue((CFMutableDictionaryRef)v18, v16);
  }
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend_IDSNWLink(IDSFoundationLog, v19, v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = self->_tokenToChildConnectionEvaluator;
    v24 = 138412802;
    v25 = v15;
    v26 = 2112;
    v27 = v16;
    v28 = 2112;
    v29 = v23;
    _os_log_impl(&dword_19B949000, v22, OS_LOG_TYPE_DEFAULT, "Removed Child Connection Evaluator for token:%@(%@), remaining Child Connection Evaluators:%@", (uint8_t *)&v24, 0x20u);
  }

}

- (BOOL)getEffectiveSourceAddress:(sockaddr_storage *)a3 fromSourceAddress:(const sockaddr *)a4 effectiveDestinationAddress:(sockaddr_storage *)a5 fromDestinationAddress:(const sockaddr *)a6 sessionID:(id)a7 isQRConnection:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  nw_endpoint_t address;
  nw_endpoint_t v16;
  unint64_t v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  nw_endpoint_t v29;
  NSObject *v30;
  const sockaddr *v31;
  const sockaddr *v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  const __CFString *v40;
  const sockaddr *__src;
  void *v43;
  uint8_t buf[4];
  nw_endpoint_t v45;
  __int16 v46;
  nw_endpoint_t v47;
  __int16 v48;
  id v49;
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v8 = a8;
  v52 = *MEMORY[0x1E0C80C00];
  v14 = a7;
  if (a4->sa_family == 2)
  {
    address = nw_endpoint_create_address(a4);
    v16 = nw_endpoint_create_address(a6);
    if (v8)
      v17 = 5;
    else
      v17 = 0;
    _tokenWithParameters(address, v16, v14, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__NWLinkConnectionForToken_(self, v19, (uint64_t)v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v21;
    if (v21)
    {
      objc_msgSend_connection(v21, v22, v23, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = nw_connection_copy_connected_path();

      if (v27)
      {
        v43 = v18;
        v28 = nw_path_copy_effective_local_endpoint(v27);
        v29 = nw_path_copy_effective_remote_endpoint(v27);
        v30 = v29;
        if (v28)
        {
          if (v29)
          {
            __src = nw_endpoint_get_address(v28);
            v31 = nw_endpoint_get_address(v30);
            if (__src)
            {
              if (v31)
              {
                v32 = v31;
                memcpy(a3, __src, __src->sa_len);
                memcpy(a5, v32, v32->sa_len);
                v33 = 1;
                sub_19B98AE78(v25, 1, (uint64_t)"Found effective addresses: %@-%@ -> %@-%@", v34, v35, v36, v37, v38, (uint64_t)address);

                v18 = v43;
LABEL_20:

                goto LABEL_21;
              }
            }
          }
        }

        v18 = v43;
      }

    }
    objc_msgSend_IDSNWLink(IDSFoundationLog, v22, v23, v24);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v45 = address;
      v46 = 2112;
      if (v8)
        v40 = CFSTR("YES");
      v47 = v16;
      v48 = 2112;
      v49 = v14;
      v50 = 2112;
      v51 = v40;
      _os_log_impl(&dword_19B949000, v39, OS_LOG_TYPE_DEFAULT, "Found no effective addresses: local %@, remote %@, sessionID %@, isQR %@", buf, 0x2Au);
    }

    v33 = 0;
    goto LABEL_20;
  }
  v33 = 0;
LABEL_21:

  return v33;
}

- (id)_createNewListenerWithLocalPort:(unsigned __int16 *)a3
{
  __int128 v5;
  NSObject *secure_udp;
  NSObject *host;
  void *v8;
  void *options;
  void *v10;
  nw_protocol_stack_t v11;
  const char *v12;
  double v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  double v17;
  uint64_t v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_time_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v38;
  _QWORD v39[4];
  NSObject *v40;
  NSObject *v41;
  uint64_t *v42;
  uint64_t *v43;
  unsigned __int16 *v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  _QWORD handler[5];
  id v53;
  char v54;
  char __str[16];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v61 = v5;
  v62 = v5;
  v59 = v5;
  v60 = v5;
  v57 = v5;
  v58 = v5;
  *(_OWORD *)__str = v5;
  v56 = v5;
  snprintf(__str, 0x80uLL, "%u", *a3);
  secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
  host = nw_endpoint_create_host("::", __str);
  nw_parameters_set_local_endpoint(secure_udp, host);

  if (!uuid_is_null(self->_clientUUID))
    nw_parameters_set_e_proc_uuid();
  IDSRealTimeContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_context();

  options = (void *)nw_demux_create_options();
  v54 = 0;
  v10 = (void *)nw_demux_create_options();
  nw_demux_options_add_pattern();
  nw_demux_options_add_pattern();
  nw_parameters_set_channel_demux_options();
  v11 = nw_parameters_copy_default_protocol_stack(secure_udp);
  nw_protocol_stack_append_application_protocol();
  objc_msgSend_protocolStackDescriptionFor_(self, v12, (uint64_t)v11, v13);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = nw_listener_create(secure_udp);
  if (v16)
  {
    v18 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_19B991548;
    handler[3] = &unk_1E3C1F4D8;
    handler[4] = self;
    v53 = v38;
    nw_listener_set_new_connection_handler(v16, handler);
    v19 = dispatch_semaphore_create(0);
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    v45 = 0;
    v46[0] = &v45;
    v46[1] = 0x3032000000;
    v46[2] = sub_19B98DA08;
    v46[3] = sub_19B98DA18;
    v47 = 0;
    v39[0] = v18;
    v39[1] = 3221225472;
    v39[2] = sub_19B991B20;
    v39[3] = &unk_1E3C1F500;
    v20 = v16;
    v44 = a3;
    v40 = v20;
    v42 = &v48;
    v21 = v19;
    v41 = v21;
    v43 = &v45;
    nw_listener_set_state_changed_handler(v20, v39);
    NWLinkQueue();
    v22 = objc_claimAutoreleasedReturnValue();
    nw_listener_set_queue(v20, v22);

    nw_listener_start(v20);
    v23 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v21, v23);
    if (*((_BYTE *)v49 + 24))
    {
      if (!*a3)
      {
        v27 = nw_listener_copy_local_endpoint();
        *a3 = nw_endpoint_get_port(v27);

      }
      v28 = v20;
    }
    else
    {
      objc_msgSend_IDSNWLink(IDSFoundationLog, v24, v25, v26);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_19BAEF8A8((uint64_t)v20, (uint64_t)v46, v36);

      nw_listener_cancel(v20);
      v28 = 0;
    }

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v48, 8);

  }
  else
  {
    objc_msgSend_IDSNWLink(IDSFoundationLog, v14, v15, v17);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_19BAEF840((uint64_t)a3, v29, v30, v31, v32, v33, v34, v35);

    v28 = 0;
  }

  return v28;
}

- (void)_createUDPConnectionForNWLinkConnection:(id)a3 readyHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  NSObject *secure_udp;
  NSObject *v22;
  NSObject *options;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  const char *v43;
  double v44;
  const char *v45;
  double v46;
  const char *v47;
  double v48;
  NSObject *v49;
  _QWORD handler[4];
  id v51;
  IDSNWLink *v52;
  id v53;
  id v54;
  uint8_t buf[4];
  IDSNWLink *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _tokenForNWLinkConnection(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceIndex(v6, v9, v10, v11);
  v12 = (void *)nw_interface_create_with_index();
  sub_19B98AE78(v6, 1, (uint64_t)"connecting on if:%@(%u) for %@", v13, v14, v15, v16, v17, (uint64_t)v12);

  if ((IMGetDomainBoolForKey() & 1) != 0 || (IMGetDomainBoolForKeyWithDefaultValue() & 1) != 0 || self->_disableP2P)
  {
    objc_msgSend_IDSNWLink(IDSFoundationLog, v18, v19, v20);
    secure_udp = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(secure_udp, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v56 = self;
      _os_log_impl(&dword_19B949000, secure_udp, OS_LOG_TYPE_DEFAULT, "<%p> _createUDPConnectionWithLocalEndpoint - disabled by forceQuickRelay or disableP2PLinks", buf, 0xCu);
    }
  }
  else
  {
    secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
    v22 = nw_parameters_copy_default_protocol_stack(secure_udp);
    options = nw_demux_create_options();
    buf[0] = 0;
    nw_demux_options_add_pattern();
    nw_protocol_stack_prepend_application_protocol(v22, options);
    objc_msgSend_protocolStackDescriptionFor_(self, v24, (uint64_t)v22, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtocolStackDescription_(v6, v27, (uint64_t)v26, v28);

    if (objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(self, v29, (uint64_t)secure_udp, v30, v6, 1, 0))
    {
      objc_msgSend_remoteEndpoint(v6, v31, v32, v33);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = nw_connection_create(v34, secure_udp);

      if (v35)
      {
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = sub_19B992068;
        handler[3] = &unk_1E3C1F528;
        v41 = v6;
        v51 = v41;
        v52 = self;
        v42 = v8;
        v53 = v42;
        v54 = v7;
        nw_connection_set_state_changed_handler(v35, handler);
        objc_msgSend_setName_(v41, v43, (uint64_t)CFSTR("UDP connection"), v44);
        objc_msgSend_setConnection_(v41, v45, (uint64_t)v35, v46);
        objc_msgSend__addUDPConnectionInProgress_(self, v47, (uint64_t)v42, v48);
        NWLinkQueue();
        v49 = objc_claimAutoreleasedReturnValue();
        nw_connection_set_queue(v35, v49);

        nw_connection_start(v35);
      }
      else
      {
        sub_19B98AE78(v6, 2, (uint64_t)"could NOT create UDP connection for %@", v36, v37, v38, v39, v40, (uint64_t)v8);
      }

    }
  }

}

- (void)_scheduleRetryConnectionIfNeeded:(id)a3 baseConnection:(id)a4 kind:(const char *)a5 retryIndex:(unsigned __int8)a6 retryBlock:(id)a7
{
  unsigned int v8;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  id v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  _QWORD v46[4];
  id v47;
  IDSNWLink *v48;
  id v49;
  const char *v50;
  char v51;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v16 = a7;
  if (!v12)
  {
    v23 = v13;
    sub_19B98AE78(v23, 1, (uint64_t)"_sheduleRetryConnectionIfNeeded(%s): connection could not be created", v35, v36, v37, v38, v39, (uint64_t)a5);
    goto LABEL_6;
  }
  if ((objc_msgSend_hasFailed(v12, v14, v15, v17) & 1) != 0)
  {
    v23 = v12;
    if (objc_msgSend_shouldTreatNextTryAsFirstTry(v23, v24, v25, v26))
    {
      sub_19B98AE78(v23, 1, (uint64_t)"_sheduleRetryConnectionIfNeeded(%s): treating as first try", v29, v30, v31, v32, v33, (uint64_t)a5);
      v8 = 0;
      goto LABEL_7;
    }
LABEL_6:
    if (v8 > 4)
    {
      sub_19B98AE78(v23, 2, (uint64_t)"_sheduleRetryConnectionIfNeeded(%s): failed, and out of retries.", v29, v30, v31, v32, v33, (uint64_t)a5);
LABEL_12:

      goto LABEL_13;
    }
LABEL_7:
    if (objc_msgSend_isConnected(v13, v27, v28, v34))
    {
      v45 = dbl_19BB12758[v8];
      sub_19B98AE78(v23, 1, (uint64_t)"_sheduleRetryConnectionIfNeeded(%s): failed, but scheduling retry %d for %f seconds", v40, v41, v42, v43, v44, (uint64_t)a5);
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = sub_19B992330;
      v46[3] = &unk_1E3C1F550;
      v23 = v23;
      v47 = v23;
      v50 = a5;
      v51 = v8;
      v48 = self;
      v49 = v16;
      IDSTransportThreadAddBlockAfter(v46, v45);

    }
    else
    {
      sub_19B98AE78(v23, 1, (uint64_t)"_sheduleRetryConnectionIfNeeded(%s): failed, and would retry, but base connection is disconnected", v40, v41, v42, v43, v44, (uint64_t)a5);
    }
    goto LABEL_12;
  }
  sub_19B98AE78(v12, 1, (uint64_t)"_sheduleRetryConnectionIfNeeded(%s): no need to retry: connection didn't fail", v18, v19, v20, v21, v22, (uint64_t)a5);
LABEL_13:

}

- (void)_createChannelDataConnectionForH2:(id)a3
{
  ((void (*)(IDSNWLink *, char *, id))MEMORY[0x1E0DE7D20])(self, sel__createChannelDataConnectionForH2_retryIndex_, a3);
}

- (void)_createChannelDataConnectionForH2:(id)a3 retryIndex:(unsigned __int8)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  const char *v19;
  double v20;
  uint64_t v21[5];
  id v22;
  id v23;
  unsigned __int8 v24;
  _QWORD v25[5];
  id v26;
  id v27;
  unsigned __int8 v28;
  _QWORD aBlock[5];
  id v30;

  v6 = a3;
  if (objc_msgSend_hasDisconnected(v6, v7, v8, v9))
  {
    sub_19B98AE78(v6, 1, (uint64_t)"_createChannelDataConnectionForH2: base connection has disconnected. Not creating ChannelData connection.", v10, v11, v12, v13, v14, v21[0]);
  }
  else
  {
    v15 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_19B99251C;
    aBlock[3] = &unk_1E3C1F578;
    aBlock[4] = self;
    v16 = v6;
    v30 = v16;
    v17 = _Block_copy(aBlock);
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = sub_19B99252C;
    v25[3] = &unk_1E3C1F5C8;
    v25[4] = self;
    v26 = v16;
    v28 = a4;
    v27 = v17;
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = (uint64_t)sub_19B99277C;
    v21[3] = (uint64_t)&unk_1E3C1F5C8;
    v21[4] = (uint64_t)self;
    v24 = a4;
    v22 = v26;
    v23 = v27;
    v18 = v27;
    objc_msgSend__peelOffQUICConnection_type_readyHandler_cancelHandler_(self, v19, (uint64_t)v22, v20, 2, v25, v21);

  }
}

- (void)_tryReadH2Header:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  _QWORD completion[5];
  id v18;
  id v19;

  v4 = a3;
  sub_19B98AE78(v4, 1, (uint64_t)"_tryReadH2Header...", v5, v6, v7, v8, v9, v16);
  objc_msgSend_connection(v4, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  completion[0] = MEMORY[0x1E0C809B0];
  completion[1] = 3221225472;
  completion[2] = sub_19B992890;
  completion[3] = &unk_1E3C1F618;
  completion[4] = self;
  v18 = v4;
  v19 = v13;
  v14 = v13;
  v15 = v4;
  nw_connection_receive(v14, 0, 0, completion);

}

- (BOOL)_createChannelDataConnection:(id)a3
{
  return ((uint64_t (*)(IDSNWLink *, char *, id))MEMORY[0x1E0DE7D20])(self, sel__createChannelDataConnection_retryIndex_, a3);
}

- (BOOL)_createChannelDataConnection:(id)a3 retryIndex:(unsigned __int8)a4
{
  unsigned int v4;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  NWLinkConnection *v16;
  const char *v17;
  double v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *secure_udp;
  NSObject *v24;
  NSObject *options;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  double v50;
  id v51;
  id v52;
  const char *v53;
  double v54;
  const char *v55;
  double v56;
  const char *v57;
  double v58;
  const char *v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  double v69;
  NSObject *v70;
  uint64_t v72;
  id v73;
  unsigned int v74;
  NSObject *v75;
  void *v76;
  _QWORD handler[4];
  id v78;
  IDSNWLink *v79;
  id v80;
  id v81;
  id v82;
  char v83;
  int v84;
  int v85;
  char v86;
  char v87;
  char v88;
  char v89;
  _QWORD aBlock[5];
  id v91;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend_hasDisconnected(v6, v7, v8, v9))
  {
    sub_19B98AE78(v6, 1, (uint64_t)"_createChannelDataConnection: base connection has disconnected. Not creating ChannelData connection.", v10, v11, v12, v13, v14, v72);
    v15 = 0;
  }
  else
  {
    v74 = v4;
    v16 = [NWLinkConnection alloc];
    v19 = (void *)objc_msgSend_initWithBaseNWLinkConnection_type_(v16, v17, (uint64_t)v6, v18, 1);
    v20 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_19B992F3C;
    aBlock[3] = &unk_1E3C1F578;
    aBlock[4] = self;
    v21 = v6;
    v91 = v21;
    v76 = _Block_copy(aBlock);
    _tokenForNWLinkConnection(v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
    v24 = nw_parameters_copy_default_protocol_stack(secure_udp);
    options = nw_demux_create_options();
    v89 = 96;
    v88 = -16;
    v87 = 0;
    v86 = -64;
    v85 = -272716322;
    v84 = -1;
    nw_demux_options_add_pattern();
    nw_demux_options_add_pattern();
    nw_demux_options_add_pattern();
    nw_protocol_stack_prepend_application_protocol(v24, options);
    v75 = v24;
    objc_msgSend_protocolStackDescriptionFor_(self, v26, (uint64_t)v24, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtocolStackDescription_(v19, v29, (uint64_t)v28, v30);

    objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(self, v31, (uint64_t)secure_udp, v32, v19, 0, 0);
    objc_msgSend_connection(v21, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = nw_connection_create_with_connection();

    if (v37 && !objc_msgSend__shouldFail(self, v38, v39, v40))
    {
      handler[0] = v20;
      handler[1] = 3221225472;
      handler[2] = sub_19B992F4C;
      handler[3] = &unk_1E3C1F640;
      v51 = v19;
      v78 = v51;
      v79 = self;
      v42 = v22;
      v73 = v22;
      v80 = v73;
      v52 = v21;
      v81 = v52;
      v83 = v74;
      v82 = v76;
      nw_connection_set_state_changed_handler(v37, handler);
      objc_msgSend_setParent_(v51, v53, (uint64_t)v52, v54);
      objc_msgSend_setConnection_(v51, v55, (uint64_t)v37, v56);
      objc_msgSend_setName_(v51, v57, (uint64_t)CFSTR("Channel Data connection"), v58);
      v62 = objc_msgSend_connectionID(v52, v59, v60, v61);
      v15 = 1;
      sub_19B98AE78(v51, 1, (uint64_t)"peeled off [C%llu]", v63, v64, v65, v66, v67, v62);
      objc_msgSend__addNWLinkConnection_token_(self, v68, (uint64_t)v51, v69, v73);
      NWLinkQueue();
      v70 = objc_claimAutoreleasedReturnValue();
      nw_connection_set_queue(v37, v70);

      v48 = v76;
      nw_connection_start(v37);

    }
    else
    {
      v41 = objc_msgSend_connectionID(v21, v38, v39, v40);
      v42 = v22;
      sub_19B98AE78(v19, 2, (uint64_t)"couldn't create ChannelData connection from [C%llu] for %@", v43, v44, v45, v46, v47, v41);
      v48 = v76;
      objc_msgSend__scheduleRetryConnectionIfNeeded_baseConnection_kind_retryIndex_retryBlock_(self, v49, 0, v50, v21, "CD", v74, v76);
      v15 = 0;
    }

  }
  return v15;
}

- (BOOL)_createReliableUnicastConnection:(id)a3 localQUICConnectionID:(id)a4
{
  id v6;
  id v7;
  NWLinkConnection *v8;
  const char *v9;
  double v10;
  void *v11;
  void *v12;
  NSObject *secure_udp;
  NSObject *v14;
  NSObject *options;
  const char *v16;
  uint64_t v17;
  double v18;
  id v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  uint64_t isH2Connection;
  const char *v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  id v37;
  id v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  const char *v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  double v53;
  const char *v54;
  double v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD handler[4];
  id v65;
  IDSNWLink *v66;
  id v67;

  v6 = a3;
  v7 = a4;
  v8 = [NWLinkConnection alloc];
  v11 = (void *)objc_msgSend_initWithBaseNWLinkConnection_type_(v8, v9, (uint64_t)v6, v10, 3);
  _tokenForNWLinkConnection(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
  v14 = nw_parameters_copy_default_protocol_stack(secure_udp);
  options = nw_demux_create_options();
  objc_msgSend_length(v7, v16, v17, v18);
  v19 = objc_retainAutorelease(v7);
  objc_msgSend_bytes(v19, v20, v21, v22);

  nw_demux_options_add_pattern();
  nw_protocol_stack_prepend_application_protocol(v14, options);
  isH2Connection = objc_msgSend_isH2Connection(v6, v23, v24, v25);
  objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(self, v27, (uint64_t)secure_udp, v28, v11, 0, isH2Connection);
  objc_msgSend_connection(v6, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = nw_connection_create_with_connection();

  if (v33)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_19B9932AC;
    handler[3] = &unk_1E3C1F4B0;
    v37 = v11;
    v65 = v37;
    v66 = self;
    v38 = v12;
    v67 = v38;
    nw_connection_set_state_changed_handler(v33, handler);
    objc_msgSend_setConnection_(v37, v39, (uint64_t)v33, v40);
    objc_msgSend_setName_(v37, v41, (uint64_t)CFSTR("Reliable Unicast connection"), v42);
    v46 = objc_msgSend_connectionID(v6, v43, v44, v45);
    sub_19B98AE78(v37, 1, (uint64_t)"peeled off RU [C%llu]", v47, v48, v49, v50, v51, v46);
    objc_msgSend_setParent_(v37, v52, (uint64_t)v6, v53);
    objc_msgSend__addNWLinkConnection_token_(self, v54, (uint64_t)v37, v55, v38);
    NWLinkQueue();
    v56 = objc_claimAutoreleasedReturnValue();
    nw_connection_set_queue(v33, v56);

    nw_connection_start(v33);
  }
  else
  {
    v57 = objc_msgSend_connectionID(v6, v34, v35, v36);
    sub_19B98AE78(v11, 2, (uint64_t)"couldn't create reliable unicast connection from [C%llu] for %@", v58, v59, v60, v61, v62, v57);
  }

  return v33 != 0;
}

- (void)_failNWLinkConnection:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  id WeakRetained;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  unint64_t v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  id v23;

  v23 = a3;
  v7 = objc_msgSend_state(v23, v4, v5, v6);
  v9 = v23;
  if (v7 != 4)
  {
    objc_msgSend__cancelNWLinkConnection_remove_(self, (const char *)v23, (uint64_t)v23, v8, 0);
    objc_msgSend_setState_(v23, v10, 4, v11);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_msgSend_type(v23, v14, v15, v16);
    if (v17 > 0xA)
      objc_msgSend_stringWithCString_encoding_(v13, v18, (uint64_t)"??", v19, 4);
    else
      objc_msgSend_stringWithCString_encoding_(v13, v18, (uint64_t)off_1E3C1F918[v17], v19, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_link_didFailConnectionOfType_(WeakRetained, v21, (uint64_t)self, v22, v20);

    v9 = v23;
  }

}

- (void)_cancelNWLinkConnection:(id)a3 remove:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  id v27;

  v4 = a4;
  v27 = a3;
  _tokenForNWLinkConnection(v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19B98AE78(v27, 1, (uint64_t)"_cancelNWLinkConnectionWithToken: disconnecting %@", v7, v8, v9, v10, v11, (uint64_t)v6);
  if (objc_msgSend_state(v27, v12, v13, v14) != 3 && objc_msgSend_state(v27, v15, v16, v17) != 4)
  {
    objc_msgSend_connection(v27, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    nw_connection_cancel(v21);

    objc_msgSend_setState_(v27, v22, 3, v23);
    if (v4)
    {
      _tokenForNWLinkConnection(v27);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__removeNWLinkConnection_token_(self, v25, (uint64_t)v27, v26, v24);

    }
  }

}

- (void)_createIndicationConnection:(id)a3
{
  ((void (*)(IDSNWLink *, char *, id))MEMORY[0x1E0DE7D20])(self, sel__createIndicationConnection_retryIndex_, a3);
}

- (void)_createIndicationConnection:(id)a3 retryIndex:(unsigned __int8)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  double v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unsigned __int8 v20;
  _QWORD v21[5];
  id v22;
  id v23;
  unsigned __int8 v24;
  _QWORD aBlock[5];
  id v26;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19B99368C;
  aBlock[3] = &unk_1E3C1F578;
  aBlock[4] = self;
  v8 = v6;
  v26 = v8;
  v9 = _Block_copy(aBlock);
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = sub_19B99369C;
  v21[3] = &unk_1E3C1F5C8;
  v21[4] = self;
  v10 = v8;
  v22 = v10;
  v24 = a4;
  v11 = v9;
  v23 = v11;
  v12 = _Block_copy(v21);
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = sub_19B993BC0;
  v17[3] = &unk_1E3C1F5C8;
  v17[4] = self;
  v18 = v10;
  v20 = a4;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  objc_msgSend__peelOffQUICConnection_type_readyHandler_cancelHandler_(self, v15, (uint64_t)v14, v16, 4, v12, v17);

}

- (void)_peelOffQUICConnection:(id)a3 type:(unint64_t)a4 readyHandler:(id)a5
{
  double v5;

  objc_msgSend__peelOffQUICConnection_type_readyHandler_cancelHandler_(self, a2, (uint64_t)a3, v5, a4, a5, 0);
}

- (void)_peelOffQUICConnection:(id)a3 type:(unint64_t)a4 readyHandler:(id)a5 cancelHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  os_unfair_lock_s *p_lock;
  const char *v19;
  uint64_t v20;
  double v21;
  int isConnected;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  const char *v41;
  double v42;
  id v43;
  const char *v44;
  double v45;
  void *v46;
  void *v47;
  const char *v48;
  double v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD aBlock[4];
  id v55;
  IDSNWLink *v56;
  id v57;
  id v58;
  unint64_t v59;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19B993E10;
  aBlock[3] = &unk_1E3C1F6B8;
  v59 = a4;
  v14 = v10;
  v55 = v14;
  v56 = self;
  v15 = v11;
  v57 = v15;
  v16 = v12;
  v58 = v16;
  v17 = _Block_copy(aBlock);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  isConnected = objc_msgSend_isConnected(v14, v19, v20, v21);
  v28 = CFSTR("NO");
  if (isConnected)
    v28 = CFSTR("YES");
  sub_19B98AE78(v14, 1, (uint64_t)"peeling off; isConnected: %@", v23, v24, v25, v26, v27, (uint64_t)v28);
  if (objc_msgSend_isConnected(v14, v29, v30, v31))
  {
    v51[0] = v13;
    v51[1] = 3221225472;
    v51[2] = sub_19B994204;
    v51[3] = &unk_1E3C1F280;
    v53 = v17;
    v52 = v14;
    IDSTransportThreadAddBlock(v51);

    v37 = v53;
  }
  else
  {
    sub_19B98AE78(v14, 1, (uint64_t)"not peeling off yet: not connected", v32, v33, v34, v35, v36, v50);
    _tokenForNWLinkConnection(v14);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(self->_queuedPeelOffs, v38, (uint64_t)v37, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
    {
      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend_setObject_forKeyedSubscript_(self->_queuedPeelOffs, v44, (uint64_t)v43, v45, v37);

    }
    objc_msgSend_objectForKeyedSubscript_(self->_queuedPeelOffs, v41, (uint64_t)v37, v42);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = _Block_copy(v17);
    objc_msgSend_addObject_(v46, v48, (uint64_t)v47, v49);

  }
  os_unfair_lock_unlock(p_lock);

}

- (id)_findNewLocalEndpointForQRConnection:(id)a3
{
  NSObject *v4;
  const char *v5;
  int port;
  double v7;
  unsigned __int16 v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  nw_endpoint_t address;
  __int128 v14;
  const char *v15;
  uint64_t v16;
  double v17;
  NSObject *v18;
  unsigned __int16 v20;
  uint8_t v21[4];
  int v22;
  __int16 v23;
  int v24;
  uint8_t buf[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  port = nw_endpoint_get_port(v4);
  v8 = 1;
  do
  {
    v20 = v8 + port;
    objc_msgSend__createNewListenerWithLocalPort_(self, v5, (uint64_t)&v20, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v12 = v9;
      goto LABEL_9;
    }
    v10 = v8++;
  }
  while (v10 <= 8);
  v20 = 0;
  objc_msgSend__createNewListenerWithLocalPort_(self, v5, (uint64_t)&v20, v7);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend_IDSNWLink(IDSFoundationLog, v5, v11, v7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = port + 1;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = port + 9;
      _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "failed to create an extra listener for ports [%u-%u] and 0", buf, 0xEu);
    }
    address = 0;
    goto LABEL_12;
  }
LABEL_9:
  objc_msgSend__addExtraListener_port_isCellular_(self, v5, (uint64_t)v12, v7, v20, port == self->_cellularPort);
  nw_endpoint_get_address(v4);
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32 = v14;
  v30 = v14;
  v31 = v14;
  v28 = v14;
  v29 = v14;
  v26 = v14;
  v27 = v14;
  *(_OWORD *)buf = v14;
  __memcpy_chk();
  SASetPort((uint64_t)buf, v20);
  address = nw_endpoint_create_address((const sockaddr *)buf);
  objc_msgSend_IDSNWLink(IDSFoundationLog, v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v21 = 67109376;
    v22 = port;
    v23 = 1024;
    v24 = v20;
    _os_log_impl(&dword_19B949000, v18, OS_LOG_TYPE_DEFAULT, "replacing local port %u with new local port %u", v21, 0xEu);
  }

LABEL_12:
  return address;
}

- (id)_createP2PQUICPodConnectionWithType:(unsigned int)a3 udpNWLinkConnection:(id)a4 clientQUICConnectionID:(id)a5 serverQUICConnectionID:(id)a6 clientQUICConnectionIDNumber:(unsigned int)a7 clientSecret:(id)a8 serverSecret:(id)a9 isServer:(BOOL)a10 completionHandler:(id)a11
{
  uint64_t v12;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(id, uint64_t);
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  NWLinkConnection *v31;
  const char *v32;
  double v33;
  void *v34;
  void *v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  NSObject *qpod;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  double v59;
  void *v60;
  const char *v61;
  double v62;
  const char *v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  double v71;
  id v72;
  const char *v73;
  double v74;
  const char *v75;
  double v76;
  const char *v77;
  double v78;
  void *v79;
  const char *v80;
  double v81;
  const char *v82;
  double v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  double v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  double v99;
  NSObject *v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  double v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  nw_protocol_stack_t v118;
  void *options;
  const char *v120;
  NSObject *connection;
  void *v122;
  void *v123;
  void *v124;
  id v126;
  _QWORD handler[4];
  id v128;
  IDSNWLink *v129;
  id v130;
  void (**v131)(id, uint64_t);
  _QWORD *v132;
  _QWORD v133[3];
  char v134;
  uint64_t v135;
  uint64_t v136;
  void (*v137)(uint64_t, void *);
  void *v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  uint64_t *v144;
  BOOL v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  char v149;
  int v150;
  char v151;
  char v152;
  unsigned int v153;

  v12 = *(_QWORD *)&a7;
  v15 = *(_QWORD *)&a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v126 = a8;
  v19 = a9;
  v25 = (void (**)(id, uint64_t))a11;
  if (!(_DWORD)v15)
  {
    v124 = v19;
    v120 = "AVC";
    v26 = 9;
    goto LABEL_5;
  }
  if ((_DWORD)v15 == 1)
  {
    v124 = v19;
    v120 = "IDS";
    v26 = 10;
LABEL_5:
    v152 = 64;
    v153 = bswap32(v12);
    v116 = HIBYTE(v153);
    v114 = BYTE1(v153);
    v115 = BYTE2(v153);
    v113 = v153;
    sub_19B98AE78(v16, 1, (uint64_t)"_createQUICPodConnectionWithType: adding demux rule with pattern: %02x%02x%02x%02x%02x (%08x)", v20, v21, v22, v23, v24, 64);
    v151 = -1;
    v150 = -32;
    objc_msgSend_connection(v16, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = [NWLinkConnection alloc];
    v34 = (void *)objc_msgSend_initWithBaseNWLinkConnection_type_(v31, v32, (uint64_t)v16, v33, v26);
    _tokenForNWLinkConnection(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__NWLinkConnectionForToken_(self, v36, (uint64_t)v35, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v38;
    if (v38 && objc_msgSend_isConnected(v38, v39, v40, v41))
    {
      sub_19B98AE78(v42, 1, (uint64_t)"not setting up new P2P QUICPod connection because one already exists for token %@", v43, v44, v45, v46, v47, (uint64_t)v35);
      v25[2](v25, 1);
      v48 = v42;
LABEL_19:

      v19 = v124;
      goto LABEL_20;
    }
    v122 = v35;
    v123 = v30;
    v146 = 0;
    v147 = &v146;
    v148 = 0x2020000000;
    v149 = 0;
    v135 = MEMORY[0x1E0C809B0];
    v136 = 3221225472;
    v137 = sub_19B9949EC;
    v138 = &unk_1E3C1F6E0;
    v144 = &v146;
    v139 = v126;
    v140 = v124;
    v145 = a10;
    v49 = v34;
    v50 = v34;
    v141 = v50;
    v142 = v17;
    v143 = v18;
    qpod = nw_parameters_create_qpod();
    v57 = qpod;
    if (*((_BYTE *)v147 + 24))
    {
      if (qpod)
      {
        v118 = nw_parameters_copy_default_protocol_stack(qpod);
        options = (void *)nw_demux_create_options();
        nw_demux_options_add_pattern();
        nw_protocol_stack_append_application_protocol();
        objc_msgSend_protocolStackDescriptionFor_(self, v58, (uint64_t)v118, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setProtocolStackDescription_(v50, v61, (uint64_t)v60, v62);

        objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(self, v63, (uint64_t)v57, v64, v50, 0, 0);
        sub_19B98AE78(v16, 1, (uint64_t)"creating QUICPod connection with connection", v65, v66, v67, v68, v69, v112);
        connection = nw_connection_create_with_connection();
        if (connection)
        {
          objc_msgSend_setQuicPodParamaters_(v50, v70, (uint64_t)v57, v71);
          v133[0] = 0;
          v133[1] = v133;
          v133[2] = 0x2020000000;
          v134 = 0;
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = sub_19B994A7C;
          handler[3] = &unk_1E3C1F708;
          v132 = v133;
          v131 = v25;
          v72 = v50;
          v128 = v72;
          v129 = self;
          v117 = v122;
          v130 = v117;
          nw_connection_set_state_changed_handler(connection, handler);
          objc_msgSend_setParent_(v72, v73, (uint64_t)v16, v74);
          objc_msgSend_setConnection_(v72, v75, (uint64_t)connection, v76);
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v77, (uint64_t)CFSTR("%s qpod connection"), v78, v120, v113, v114, v115, v116, v12);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setName_(v72, v80, (uint64_t)v79, v81);

          objc_msgSend_setLocalQUICConnectionID_(v72, v82, v12, v83);
          sub_19B98AE78(v72, 1, (uint64_t)"QUICPod local QUIC connection ID: %lu", v84, v85, v86, v87, v88, v12);
          v92 = objc_msgSend_connectionID(v16, v89, v90, v91);
          sub_19B98AE78(v72, 1, (uint64_t)"QUICPod peeled off [C%llu]", v93, v94, v95, v96, v97, v92);
          objc_msgSend__addNWLinkConnection_token_(self, v98, (uint64_t)v72, v99, v117);
          NWLinkQueue();
          v100 = objc_claimAutoreleasedReturnValue();
          nw_connection_set_queue(connection, v100);

          nw_connection_start(connection);
          v48 = v72;

          _Block_object_dispose(v133, 8);
        }
        else
        {
          v25[2](v25, 0);
          v105 = objc_msgSend_connectionID(v16, v102, v103, v104);
          sub_19B98AE78(v50, 2, (uint64_t)"couldn't create QUICPod connection from [C%llu] for %@", v106, v107, v108, v109, v110, v105);
          v48 = 0;
        }

        goto LABEL_18;
      }
      v101 = "nw_parameters_create_qpod failed";
    }
    else
    {
      v101 = "nw_qpod_setup_secrets failed";
    }
    sub_19B98AE78(v50, 2, (uint64_t)v101, v52, v53, v54, v55, v56, v112);
    v25[2](v25, 0);
    v48 = 0;
LABEL_18:
    v35 = v122;
    v30 = v123;

    _Block_object_dispose(&v146, 8);
    v34 = v49;
    goto LABEL_19;
  }
  sub_19B98AE78(v16, 2, (uint64_t)"Unexpected P2P TLE connection type %u", v20, v21, v22, v23, v24, v15);
  v25[2](v25, 0);
  v48 = 0;
LABEL_20:

  return v48;
}

- (id)_createQUICPodConnectionWithType:(unsigned int)a3 quicNWLinkConnection:(id)a4 clientQUICConnectionID:(id)a5 clientQUICConnectionIDAsNumber:(unsigned int)a6 serverQUICConnectionID:(id)a7
{
  uint64_t v8;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  double v23;
  NSObject *v24;
  NSObject *v25;
  nw_protocol_metadata_t v26;
  NWLinkConnection *v27;
  const char *v28;
  double v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  NSObject *qpod;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  const char *v46;
  double v47;
  const char *v48;
  uint64_t v49;
  NSObject *v50;
  double v51;
  id v52;
  const char *v53;
  double v54;
  const char *v55;
  double v56;
  void *v57;
  const char *v58;
  double v59;
  const char *v60;
  double v61;
  const char *v62;
  double v63;
  const char *v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  double v74;
  NSObject *v75;
  id v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  nw_protocol_stack_t v91;
  void *options;
  id v93;
  void *v94;
  NSObject *v95;
  _QWORD handler[4];
  id v98;
  IDSNWLink *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(uint64_t, void *);
  void *v104;
  NSObject *v105;
  id v106;
  id v107;
  id v108;
  uint64_t *v109;
  const char *v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  char v114;
  int v115;
  char v116;
  char v117;
  unsigned int v118;

  v8 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a3;
  v11 = a4;
  v12 = a5;
  v18 = a7;
  if (!(_DWORD)v10)
  {
    v19 = "AVC";
    v20 = 7;
LABEL_5:
    v117 = 64;
    v118 = bswap32(v8);
    v89 = HIBYTE(v118);
    v87 = BYTE1(v118);
    v88 = BYTE2(v118);
    v86 = v118;
    sub_19B98AE78(v11, 1, (uint64_t)"_createQUICPodConnectionWithType: adding demux rule with pattern: %02x%02x%02x%02x%02x (%08x)", v13, v14, v15, v16, v17, 64);
    v116 = -1;
    v115 = -32;
    objc_msgSend_connection(v11, v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = nw_protocol_copy_quic_connection_definition();
    v95 = v24;
    v26 = nw_connection_copy_protocol_metadata(v24, v25);

    v27 = [NWLinkConnection alloc];
    v30 = (void *)objc_msgSend_initWithBaseNWLinkConnection_type_(v27, v28, (uint64_t)v11, v29, v20);
    _tokenForNWLinkConnection(v30);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = 0;
    v112 = &v111;
    v113 = 0x2020000000;
    v31 = MEMORY[0x1E0C809B0];
    v114 = 0;
    v101 = MEMORY[0x1E0C809B0];
    v102 = 3221225472;
    v103 = sub_19B995070;
    v104 = &unk_1E3C1F730;
    v109 = &v111;
    v32 = v26;
    v105 = v32;
    v110 = v19;
    v33 = v30;
    v106 = v33;
    v93 = v12;
    v107 = v12;
    v108 = v18;
    qpod = nw_parameters_create_qpod();
    v40 = qpod;
    if (*((_BYTE *)v112 + 24))
    {
      if (qpod)
      {
        v91 = nw_parameters_copy_default_protocol_stack(qpod);
        options = (void *)nw_demux_create_options();
        nw_demux_options_add_pattern();
        nw_protocol_stack_append_application_protocol();
        objc_msgSend_protocolStackDescriptionFor_(self, v41, (uint64_t)v91, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setProtocolStackDescription_(v33, v44, (uint64_t)v43, v45);

        objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(self, v46, (uint64_t)v40, v47, v33, 0, 0);
        v50 = nw_connection_create_with_connection();
        if (v50)
        {
          objc_msgSend_setQuicPodParamaters_(v33, v48, (uint64_t)v40, v51);
          handler[0] = v31;
          handler[1] = 3221225472;
          handler[2] = sub_19B995100;
          handler[3] = &unk_1E3C1F4B0;
          v52 = v33;
          v98 = v52;
          v99 = self;
          v90 = v94;
          v100 = v90;
          nw_connection_set_state_changed_handler(v50, handler);
          objc_msgSend_setConnection_(v52, v53, (uint64_t)v50, v54);
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v55, (uint64_t)CFSTR("%s qpod connection"), v56, v19, v86, v87, v88, v89, v8);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setName_(v52, v58, (uint64_t)v57, v59);

          objc_msgSend_setParent_(v52, v60, (uint64_t)v11, v61);
          objc_msgSend_setLocalQUICConnectionID_(v52, v62, v8, v63);
          v67 = objc_msgSend_connectionID(v11, v64, v65, v66);
          sub_19B98AE78(v52, 1, (uint64_t)"QUICPod peeled off [C%llu]", v68, v69, v70, v71, v72, v67);
          objc_msgSend__addNWLinkConnection_token_(self, v73, (uint64_t)v52, v74, v90);
          NWLinkQueue();
          v75 = objc_claimAutoreleasedReturnValue();
          nw_connection_set_queue(v50, v75);

          nw_connection_start(v50);
          v76 = v52;

        }
        else
        {
          v78 = objc_msgSend_connectionID(v11, v48, v49, v51);
          sub_19B98AE78(v33, 2, (uint64_t)"couldn't create QUICPod connection from [C%llu] for %@", v79, v80, v81, v82, v83, v78);
          v76 = 0;
        }

        goto LABEL_15;
      }
      v77 = "nw_parameters_create_qpod failed";
    }
    else
    {
      v77 = "nw_qpod_setup_secrets failed";
    }
    sub_19B98AE78(v33, 2, (uint64_t)v77, v35, v36, v37, v38, v39, v85);
    v76 = 0;
LABEL_15:

    _Block_object_dispose(&v111, 8);
    v12 = v93;
    goto LABEL_16;
  }
  if ((_DWORD)v10 == 1)
  {
    v19 = "IDS";
    v20 = 8;
    goto LABEL_5;
  }
  sub_19B98AE78(v11, 2, (uint64_t)"Unexpected TLE connection type %u", v13, v14, v15, v16, v17, v10);
  v76 = 0;
LABEL_16:

  return v76;
}

- (unint64_t)_sendData:(id)a3 withPacketBuffer:(id *)a4 NWLinkConnection:(id)a5
{
  NSObject *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  int v16;
  int var32;
  unint64_t var30;
  id v19;
  const char *v20;
  void (**v21)(void *, id);
  double v22;
  NSObject *v23;
  int is_null;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  unint64_t size;
  int v38;
  nw_content_context_t v39;
  nw_content_context_t v40;
  uint64_t var29;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *concat;
  const char *v47;
  uint64_t v48;
  double v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  NSObject *v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  IDSNWLink *v58;
  unint64_t v59;
  _QWORD completion[4];
  id v61;
  IDSNWLink *v62;
  _QWORD aBlock[4];
  NSObject *v64;
  id v65;
  IDSNWLink *v66;
  unint64_t v67;
  int v68;
  int buffer;
  unint64_t v70;
  int v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend_type(v9, v10, v11, v12) == 4
    || objc_msgSend_type(v9, v13, v14, v15) == 5
    || objc_msgSend_type(v9, v13, v14, v15) == 6)
  {
    v16 = objc_msgSend_peelOffNewConnection(v9, v13, v14, v15);
    var32 = a4->var32;
    var30 = a4->var30;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_19B9955E8;
    aBlock[3] = &unk_1E3C1F758;
    v68 = var32;
    v67 = var30;
    v64 = v8;
    v19 = v9;
    v65 = v19;
    v66 = self;
    v21 = (void (**)(void *, id))_Block_copy(aBlock);
    if (v16)
    {
      objc_msgSend__peelOffQUICConnection_type_readyHandler_(self, v20, (uint64_t)v19, v22, 6, v21);
    }
    else
    {
      objc_msgSend_setPeelOffNewConnection_(v19, v20, 1, v22);
      v21[2](v21, v19);
    }

    v23 = v64;
    goto LABEL_8;
  }
  v23 = (id)*MEMORY[0x1E0CCECE8];
  is_null = uuid_is_null(a4->var28);
  if ((objc_msgSend_isH2Connection(v9, v26, v27, v28) & 1) == 0)
  {
    if (is_null)
    {
      if (!a4->var29 && !a4->var20)
      {
LABEL_24:
        objc_msgSend_connection(v9, v29, v30, v36);
        v44 = objc_claimAutoreleasedReturnValue();
        completion[0] = MEMORY[0x1E0C809B0];
        completion[1] = 3221225472;
        completion[2] = sub_19B9958A4;
        completion[3] = &unk_1E3C1F780;
        v61 = v9;
        v62 = self;
        nw_connection_send(v44, v8, v23, 1, completion);

        goto LABEL_8;
      }
      v39 = nw_content_context_create("NWLink packet metadata");

      v23 = v39;
    }
    else
    {
      v40 = nw_content_context_create("NWLink packet metadata");

      nw_content_context_set_packet_id();
      v23 = v40;
    }
    var29 = a4->var29;
    if (var29)
      nw_content_context_set_expiration_milliseconds(v23, var29);
    _nwProtocolMetaDataForTrafficClass(a4->var20);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v42)
    {
      nw_ip_metadata_set_ecn_flag(v42, (nw_ip_ecn_flag_t)(a4->var21 & 3));
      nw_content_context_set_metadata_for_protocol(v23, v43);
    }

    goto LABEL_24;
  }
  sub_19B98AE78(v9, 3, (uint64_t)"_sendData: h2 sending", v31, v32, v33, v34, v35, v55);
  v71 = -1431655766;
  v70 = 0xAAAAAAAAAAAAAAAALL;
  buffer = -1523056768;
  size = dispatch_data_get_size(v8);
  if (size >= 0x40)
  {
    if (size >> 14)
    {
      if (size >> 30)
      {
        if (size >> 62)
          abort();
        size = bswap64(size | 0xC000000000000000);
        v38 = 8;
      }
      else
      {
        size = bswap32(size | 0x80000000);
        v38 = 4;
      }
    }
    else
    {
      size = bswap32(size | 0x4000) >> 16;
      v38 = 2;
    }
  }
  else
  {
    v38 = 1;
  }
  v59 = size;
  __memcpy_chk();
  v45 = dispatch_data_create(&buffer, (v38 + 4), 0, 0);
  concat = dispatch_data_create_concat(v45, v8);
  objc_msgSend_connection(v9, v47, v48, v49);
  v50 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentContext(v9, v51, v52, v53);
  v54 = objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = sub_19B9958EC;
  v56[3] = &unk_1E3C1F780;
  v57 = v9;
  v58 = self;
  nw_connection_send(v50, concat, v54, 0, v56);

LABEL_8:
  return 0;
}

- (void)_handleIncomingMessage:(id)a3 keepWaiting:(BOOL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  _BOOL4 v17;
  int v18;
  uint64_t v19;
  id v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  _QWORD v36[4];
  id v37;
  IDSNWLink *v38;
  id v39;
  BOOL v40;
  _QWORD aBlock[4];
  id v42;
  IDSNWLink *v43;
  int v44;
  BOOL v45;
  BOOL v46;

  v6 = a3;
  objc_msgSend_connection(v6, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_type(v6, v11, v12, v13) == 4
     || objc_msgSend_type(v6, v14, v15, v16) == 5
     || objc_msgSend_type(v6, v14, v15, v16) == 6;
  v18 = objc_msgSend_messageType(v6, v14, v15, v16);
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19B995AD0;
  aBlock[3] = &unk_1E3C1F7F8;
  v20 = v6;
  v44 = v18;
  v42 = v20;
  v43 = self;
  v45 = v17;
  v46 = a4;
  v21 = _Block_copy(aBlock);
  if (!objc_msgSend_isH2Connection(v20, v22, v23, v24) || v17)
  {
    sub_19B98AE78(v20, 3, (uint64_t)"calling nw_connection_receive_message on %@", v27, v28, v29, v30, v31, (uint64_t)v10);
    nw_connection_receive_message(v10, v21);
  }
  else
  {
    objc_msgSend_capsuleParser(v20, v25, v26, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v19;
    v36[1] = 3221225472;
    v36[2] = sub_19B996520;
    v36[3] = &unk_1E3C1F820;
    v37 = v20;
    v38 = self;
    v40 = a4;
    v39 = v21;
    objc_msgSend_readCapsuleWithCompletionHandler_(v33, v34, (uint64_t)v36, v35);

  }
}

- (void)_handleIncomingIndicationMessage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD completion[4];
  id v12;
  IDSNWLink *v13;
  id v14;

  v4 = a3;
  objc_msgSend_connection(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  completion[0] = MEMORY[0x1E0C809B0];
  completion[1] = 3221225472;
  completion[2] = sub_19B996644;
  completion[3] = &unk_1E3C1F618;
  v12 = v4;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v4;
  nw_connection_receive(v9, 4u, 4u, completion);

}

- (id)protocolStackDescriptionFor:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  _QWORD iterate_block[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  __CFString *v22;

  v3 = a3;
  v4 = nw_protocol_stack_copy_internet_protocol(v3);
  v5 = nw_protocol_stack_copy_transport_protocol(v3);
  v6 = (void *)MEMORY[0x1E0CB3940];
  sub_19B996A84(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19B996A84(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v9, (uint64_t)CFSTR("%@.%@"), v10, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_19B98DA08;
  v21 = sub_19B98DA18;
  v22 = &stru_1E3C2E4E8;
  iterate_block[0] = MEMORY[0x1E0C809B0];
  iterate_block[1] = 3221225472;
  iterate_block[2] = sub_19B996C2C;
  iterate_block[3] = &unk_1E3C1F870;
  iterate_block[4] = &v17;
  nw_protocol_stack_iterate_application_protocols(v3, iterate_block);
  objc_msgSend_stringByAppendingString_(v11, v12, v18[5], v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v17, 8);

  return v14;
}

- (BOOL)_setParameters:(id)a3 NWLinkConnection:(id)a4 sharePortWithListener:(BOOL)a5 isTCP:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  int v25;
  const char *v26;
  uint64_t v27;
  double v28;
  __int128 v29;
  NSObject *v30;
  int port;
  __int128 v32;
  int v33;
  NSObject *host;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  const char *v39;
  uint64_t v40;
  double v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *options;
  const char *v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v64;
  char __str[16];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;

  v6 = a6;
  v7 = a5;
  v73 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend_localEndpoint(v11, v12, v13, v14);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = CFSTR("NO");
  if (v7)
    v21 = CFSTR("YES");
  sub_19B98AE78(v11, 1, (uint64_t)"_setParameters, sharePortWithListener: %@", v15, v16, v17, v18, v19, (uint64_t)v21);
  v25 = objc_msgSend_supportsNAT64(v11, v22, v23, v24);
  if (v6)
  {
    if (!v25)
    {
      objc_msgSend_cachedH2LocalEndpoint(v11, v26, v27, v28);
      host = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v71 = v29;
    v72 = v29;
    v69 = v29;
    v70 = v29;
    v67 = v29;
    v68 = v29;
    *(_OWORD *)__str = v29;
    v66 = v29;
    objc_msgSend_cachedH2LocalEndpoint(v11, v26, v27, -3.72066208e-103);
    v30 = objc_claimAutoreleasedReturnValue();
    port = nw_endpoint_get_port(v30);
    snprintf(__str, 0x80uLL, "%u", port);

LABEL_8:
    host = nw_endpoint_create_host("::", __str);
LABEL_10:
    v35 = host;
    nw_parameters_set_local_endpoint(v10, host);

    goto LABEL_12;
  }
  if (v25)
  {
    *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v71 = v32;
    v72 = v32;
    v69 = v32;
    v70 = v32;
    v67 = v32;
    v68 = v32;
    *(_OWORD *)__str = v32;
    v66 = v32;
    v33 = nw_endpoint_get_port(v20);
    snprintf(__str, 0x80uLL, "%u", v33);
    goto LABEL_8;
  }
  nw_parameters_set_local_endpoint(v10, v20);
LABEL_12:
  if (objc_msgSend_hasRequiredInterface(v11, v36, v37, v38))
  {
    objc_msgSend_interfaceIndex(v11, v39, v40, v41);
    v42 = nw_interface_create_with_index();
    nw_parameters_require_interface(v10, v42);

  }
  nw_parameters_set_reuse_local_address(v10, 1);
  if (!uuid_is_null(self->_clientUUID))
    nw_parameters_set_e_proc_uuid();
  IDSRealTimeContext();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_context();

  if (v6)
  {
    LOBYTE(v49) = 1;
    sub_19B98AE78(v11, 1, (uint64_t)"TCP: no need to have demux logic", v44, v45, v46, v47, v48, v64);
  }
  else
  {
    __str[0] = 0;
    options = (void *)nw_demux_create_options();
    nw_demux_options_add_pattern();
    nw_parameters_set_channel_demux_options();
    if (v7)
    {
      objc_msgSend__findListenerWithLocalEndpoint_(self, v51, (uint64_t)v20, v52);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v49)
      {
        sub_19B98AE78(v11, 2, (uint64_t)"couldn't find the listener for %@", v53, v54, v55, v56, v57, (uint64_t)v20);

        goto LABEL_22;
      }
      nw_parameters_allow_sharing_port_with_listener();
      sub_19B98AE78(v11, 1, (uint64_t)"sharing local port with listener %p", v58, v59, v60, v61, v62, (uint64_t)v49);

    }
    LOBYTE(v49) = 1;
  }
LABEL_22:

  return (char)v49;
}

- (BOOL)_findExistingCollidingQRConnection:(id)a3 remoteEndpoint:(id)a4 sessionID:(id)a5 localEndpointToUse:(id *)a6
{
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t i;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  const sockaddr *address;
  const sockaddr *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  NSObject *v45;
  os_unfair_lock_t lock;
  NSObject *v49;
  id v50;
  NSObject *endpoint;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  endpoint = a3;
  v49 = a4;
  v50 = a5;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_allValues(self->_tokenToNWLinkConnection, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v52, 0.0, v60, 16);
  if (v14)
  {
    v17 = v14;
    v18 = 0;
    v19 = *(_QWORD *)v53;
    v20 = 138412546;
    v21 = v49;
    while (1)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v53 != v19)
          objc_enumerationMutation(v12);
        v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        if (objc_msgSend_type(v23, v15, v16, *(double *)&v20) == 5)
        {
          objc_msgSend_localEndpoint(v23, v15, v16, *(double *)&v20);
          v24 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_remoteEndpoint(v23, v25, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_sessionID(v23, v29, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (sub_19B99724C(v21, v28))
          {
            if (objc_msgSend_isEqualToString_(v50, v33, (uint64_t)v32, v34))
            {
              address = nw_endpoint_get_address(endpoint);
              v36 = nw_endpoint_get_address(v24);
              if (IsSameIP((uint64_t)address, (uint64_t)v36))
              {
                objc_msgSend_localEndpoint(v23, v37, v38, v39);
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              goto LABEL_15;
            }
            if (sub_19B99724C(endpoint, v24))
            {
              _tokenWithParameters(endpoint, v21, v50, 5uLL, 0);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              _tokenWithParameters(v24, v28, v32, 5uLL, 0);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_IDSNWLink(IDSFoundationLog, v42, v43, v44);
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v57 = v40;
                v58 = 2112;
                v59 = v41;
                _os_log_impl(&dword_19B949000, v45, OS_LOG_TYPE_DEFAULT, "COLLISION DETECTED: new %@, existing %@", buf, 0x16u);
              }

              v18 = 1;
LABEL_15:
              v21 = v49;
            }
          }

          continue;
        }
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v52, *(double *)&v20, v60, 16);
      if (!v17)
        goto LABEL_21;
    }
  }
  v18 = 0;
  v21 = v49;
LABEL_21:
  os_unfair_lock_unlock(lock);

  return v18 & 1;
}

- (void)_setWiFiAssistStateForCellularLink:(id)a3 isEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  NSObject *v16;
  nw_path_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uuid_t dst;
  _BOOL4 v32;
  unsigned __int8 src[16];
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_localEndpoint(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend__isLocalEndpointCellular_(self, v11, (uint64_t)v10, v12);

  if ((_DWORD)self)
  {
    objc_msgSend_connection(v6, v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = nw_connection_copy_current_path(v16);

    memset(src, 170, sizeof(src));
    nw_path_get_flow_registration_id();
    v18 = socket(2, 2, 17);
    memset(dst, 0, sizeof(dst));
    v32 = v4;
    uuid_copy(dst, src);
    v19 = setsockopt(v18, 0xFFFF, 4402, dst, 0x14u);
    if (v4)
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    if (v19)
    {
      __error();
      sub_19B98AE78(v6, 2, (uint64_t)"_setWiFiAssistStateForCellularLink(%@) failed with errno %d", v26, v27, v28, v29, v30, (uint64_t)v25);
    }
    else
    {
      sub_19B98AE78(v6, 1, (uint64_t)"_setWiFiAssistStateForCellularLink(%@) succeeded", v20, v21, v22, v23, v24, (uint64_t)v25);
    }
    close(v18);

  }
}

- (void)_addNWLinkConnection:(id)a3 token:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  const char *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableDictionary *tokenToNWLinkConnection;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  double v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  double v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  double v70;
  void *v71;
  const char *v72;
  double v73;
  const char *v74;
  double v75;
  unint64_t v76;
  const char *v77;
  uint64_t v78;
  double v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  double v86;
  const char *v87;
  double v88;
  const char *v89;
  uint64_t v90;
  double v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id value;

  value = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_isInvalidated)
  {
    if (objc_msgSend_connectionID(value, v8, v9, v15))
    {
      if (!v6)
        goto LABEL_14;
    }
    else
    {
      sub_19B98AE78(value, 2, (uint64_t)"WARNING! Storing nwLinkConnection with connectionID 0", v18, v19, v20, v21, v22, v98);
      if (!v6)
        goto LABEL_14;
    }
    tokenToNWLinkConnection = self->_tokenToNWLinkConnection;
    if (tokenToNWLinkConnection)
    {
      v24 = (id)CFDictionaryGetValue((CFDictionaryRef)tokenToNWLinkConnection, v6);
      if (v24)
      {
        v28 = v24;
        if ((objc_msgSend_hasFailed(v24, v25, v26, v27) & 1) != 0
          || objc_msgSend_hasDisconnected(v28, v29, v30, v31))
        {
          objc_msgSend_connection(v28, v29, v30, v31);
          v32 = objc_claimAutoreleasedReturnValue();
          nw_connection_set_state_changed_handler(v32, 0);

          v37 = value;
          if (value)
          {
            CFDictionarySetValue((CFMutableDictionaryRef)self->_tokenToNWLinkConnection, v6, value);
            v37 = value;
          }
          sub_19B98AE78(v37, 1, (uint64_t)"_addNWLinkConnection: replaced old %@ for %@ due to old being disconnected", (uint64_t)v37, v33, v34, v35, v36, (uint64_t)v6);
        }
        else
        {
          v76 = objc_msgSend_connectionID(v28, v29, v30, v31);
          if (v76 < objc_msgSend_connectionID(value, v77, v78, v79))
          {
            sub_19B98AE78(value, 1, (uint64_t)"new connection being cancelled due to existing earlier connection [C%llu < C%llu]", v80, v81, v82, v83, v84, v76);
            objc_msgSend__cancelNWLinkConnection_remove_(self, v85, (uint64_t)value, v86, 0);
LABEL_20:
            os_unfair_lock_unlock(p_lock);

            goto LABEL_21;
          }
          sub_19B98AE78(value, 1, (uint64_t)"old connection being cancelled because new connection started earlier [C%llu >= C%llu]", v80, v81, v82, v83, v84, v76);
          objc_msgSend__cancelNWLinkConnection_remove_(self, v87, (uint64_t)v28, v88, 0);
          objc_msgSend_connection(v28, v89, v90, v91);
          v92 = objc_claimAutoreleasedReturnValue();
          nw_connection_set_state_changed_handler(v92, 0);

          if (value)
            CFDictionarySetValue((CFMutableDictionaryRef)self->_tokenToNWLinkConnection, v6, value);
          sub_19B98AE78(value, 1, (uint64_t)"_addNWLinkConnection: replaced old %@ for %@", v93, v94, v95, v96, v97, (uint64_t)v6);
        }
LABEL_17:
        objc_msgSend_parent(value, v38, v39, v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          v51 = objc_msgSend_connectionID(value, v43, v44, v50);
          objc_msgSend_parent(value, v52, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_connectionID(v55, v56, v57, v58);
          sub_19B98AE78(value, 1, (uint64_t)"_addNWLinkConnection: [C%llu] has parent [C%llu], adding as child", v59, v60, v61, v62, v63, v51);

          objc_msgSend_parent(value, v64, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_children(v67, v68, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v71, v72, (uint64_t)value, v73);

        }
        else
        {
          sub_19B98AE78(value, 1, (uint64_t)"_addNWLinkConnection: added to rootConnections", v45, v46, v47, v48, v49, v99);
          objc_msgSend_addObject_(self->_rootConnections, v74, (uint64_t)value, v75);
        }
        goto LABEL_20;
      }
    }
LABEL_14:
    v41 = value;
    if (value)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_tokenToNWLinkConnection, v6, value);
      v41 = value;
    }
    sub_19B98AE78(v41, 1, (uint64_t)"_addNWLinkConnection: added %@ for %@", (uint64_t)v41, v19, v20, v21, v22, (uint64_t)v6);
    v28 = 0;
    goto LABEL_17;
  }
  sub_19B98AE78(value, 1, (uint64_t)"late after NWLink %p invalidated", v10, v11, v12, v13, v14, (uint64_t)self);
  objc_msgSend__cancelNWLinkConnection_remove_(self, v16, (uint64_t)value, v17, 0);
  os_unfair_lock_unlock(&self->_lock);
LABEL_21:

}

- (id)_NWLinkConnectionForToken:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *Value;
  id v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  Value = 0;
  if (v4 && self->_tokenToNWLinkConnection)
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_tokenToNWLinkConnection, v4);
  v7 = Value;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)_removeNWLinkConnection:(id)a3 token:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  uint64_t v22;
  double v23;
  NSMutableDictionary *tokenToNWLinkConnection;
  void *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  double v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;

  v58 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_isInvalidated)
  {
    objc_msgSend_parent(v58, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    if (v11)
    {
      objc_msgSend_children(v11, v12, v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObject_(v16, v17, (uint64_t)v58, v18);

      objc_msgSend_setParent_(v58, v19, 0, v20);
      if (!v6)
        goto LABEL_11;
    }
    else
    {
      objc_msgSend_removeObject_(self->_rootConnections, v12, (uint64_t)v58, v14);
      if (!v6)
        goto LABEL_11;
    }
    tokenToNWLinkConnection = self->_tokenToNWLinkConnection;
    if (tokenToNWLinkConnection)
    {
      v25 = (id)CFDictionaryGetValue((CFDictionaryRef)tokenToNWLinkConnection, v6);
      if (v25)
      {
        v26 = v25;
        v27 = objc_msgSend_connectionID(v25, v21, v22, v23);
        if (v27 == objc_msgSend_connectionID(v58, v28, v29, v30))
        {
          objc_msgSend_removeObjectForKey_(self->_tokenToNWLinkConnection, v31, (uint64_t)v6, v33);
          sub_19B98AE78(v58, 1, (uint64_t)"_removeNWLinkConnection: removed %@", v34, v35, v36, v37, v38, (uint64_t)v6);
          objc_msgSend_connection(v58, v39, v40, v41);
          v42 = objc_claimAutoreleasedReturnValue();
          nw_connection_set_state_changed_handler(v42, 0);

        }
        else
        {
          v49 = objc_msgSend_connectionID(v26, v31, v32, v33);
          objc_msgSend_connectionID(v58, v50, v51, v52);
          sub_19B98AE78(v58, 1, (uint64_t)"_removeNWLinkConnection: not removed because it doesn't match to what's stored (%llu != %llu)", v53, v54, v55, v56, v57, v49);
        }

        goto LABEL_14;
      }
    }
LABEL_11:
    v43 = objc_msgSend_connectionID(v58, v21, v22, v23);
    sub_19B98AE78(v58, 1, (uint64_t)"_removeNWLinkConnection: not removed because it's not stored (%llu)", v44, v45, v46, v47, v48, v43);
LABEL_14:
    os_unfair_lock_unlock(p_lock);

    goto LABEL_15;
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_15:

}

- (void)_addChildConnectionEvaluator:(id)a3 token:(id)a4
{
  id v6;
  id value;

  value = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (value)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_tokenToChildConnectionEvaluator, v6, value);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)_childConnectionEvaluatorForToken:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *Value;
  id v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  Value = 0;
  if (v4 && self->_tokenToChildConnectionEvaluator)
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_tokenToChildConnectionEvaluator, v4);
  v7 = Value;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)_addInterfaceIndex:(unsigned int)a3 NAT64LocalAddress:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *p_lock;
  const char *v8;
  double v9;
  const char *v10;
  void *v11;
  double v12;
  NSMutableDictionary *interfaceIndexToNAT64LocalAddress;
  const void *v14;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v8, v4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    interfaceIndexToNAT64LocalAddress = self->_interfaceIndexToNAT64LocalAddress;
    v14 = (const void *)objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v10, v5, v12);
    CFDictionarySetValue((CFMutableDictionaryRef)interfaceIndexToNAT64LocalAddress, v14, v11);
  }

  os_unfair_lock_unlock(p_lock);
}

- (unsigned)_NAT64LocalAddressForInterfaceIndex:(unsigned int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  const char *v6;
  double v7;
  const char *v8;
  void *v9;
  double v10;
  NSMutableDictionary *interfaceIndexToNAT64LocalAddress;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  unsigned int v17;

  v3 = *(_QWORD *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_interfaceIndexToNAT64LocalAddress)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, v3, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      interfaceIndexToNAT64LocalAddress = self->_interfaceIndexToNAT64LocalAddress;
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v8, v3, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)CFDictionaryGetValue((CFDictionaryRef)interfaceIndexToNAT64LocalAddress, v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  v17 = objc_msgSend_unsignedIntValue(v13, v14, v15, v16);

  return v17;
}

- (void)_addExtraListener:(id)a3 port:(unsigned __int16)a4 isCellular:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  os_unfair_lock_s *p_lock;
  id v10;
  const char *v11;
  double v12;
  NSMutableDictionary *portToExtraListener;
  const void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  NSMutableArray *cellularPortList;
  void *v21;
  void *value;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v10 = v8;
  value = v10;
  if (v10)
  {
    portToExtraListener = self->_portToExtraListener;
    v14 = (const void *)objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v11, v6, v12);
    CFDictionarySetValue((CFMutableDictionaryRef)portToExtraListener, v14, value);
    v10 = value;
  }

  if (v5)
  {
    if (self->_cellularPortList)
    {
      objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v15, v6, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        cellularPortList = self->_cellularPortList;
        objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v18, v6, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        CFArrayAppendValue((CFMutableArrayRef)cellularPortList, v21);

      }
    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (id)_extraListenerForPort:(unsigned __int16)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  const char *v6;
  double v7;
  const char *v8;
  void *v9;
  double v10;
  NSMutableDictionary *portToExtraListener;
  void *v12;
  void *v13;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_portToExtraListener)
  {
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v6, v3, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      portToExtraListener = self->_portToExtraListener;
      objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v8, v3, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)CFDictionaryGetValue((CFDictionaryRef)portToExtraListener, v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (void)_removeExtraListener:(unsigned __int16)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  const char *v6;
  double v7;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *portToExtraListener;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  const char *v14;
  double v15;
  NSMutableArray *cellularPortList;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  NSMutableArray *v22;
  void *v23;
  const char *v24;
  double v25;
  nw_listener_t listener;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_portToExtraListener)
    goto LABEL_5;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v6, v3, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_5;
  v9 = (void *)v8;
  portToExtraListener = self->_portToExtraListener;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v6, v3, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  listener = (id)CFDictionaryGetValue((CFDictionaryRef)portToExtraListener, v11);

  if (listener)
  {
    v12 = self->_portToExtraListener;
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v6, v3, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v12, v14, (uint64_t)v13, v15);

    cellularPortList = self->_cellularPortList;
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v17, v3, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(cellularPortList, v20, (uint64_t)v19, v21);

    os_unfair_lock_unlock(p_lock);
    nw_listener_cancel(listener);

  }
  else
  {
LABEL_5:
    v22 = self->_cellularPortList;
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v6, v3, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(v22, v24, (uint64_t)v23, v25);

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_addToRecentQRServerList:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  nw_endpoint_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  nw_endpoint_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableArray *recentQRServerList;
  NSMutableArray *v34;
  id v35;

  v35 = a3;
  objc_msgSend_remoteEndpoint(v35, v4, v5, v6);
  v7 = (nw_endpoint_t)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connection(v35, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = nw_connection_copy_connected_path();

  if (v12)
  {
    v16 = nw_path_copy_effective_remote_endpoint(v12);
  }
  else
  {
    v17 = objc_msgSend_connectionID(v35, v13, v14, v15);
    sub_19B98AE78(v35, 2, (uint64_t)"failed to copy path for [C%llu]", v18, v19, v20, v21, v22, v17);
    v16 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  sub_19B98AE78(v35, 1, (uint64_t)"adding %@ to recent QR server list %@", v23, v24, v25, v26, v27, (uint64_t)v7);
  recentQRServerList = self->_recentQRServerList;
  if (recentQRServerList && v7)
    CFArrayAppendValue((CFMutableArrayRef)recentQRServerList, v7);
  if (v16)
  {
    if (v16 != v7)
    {
      sub_19B98AE78(v35, 1, (uint64_t)"adding %@ to recent QR server list %@", v28, v29, v30, v31, v32, (uint64_t)v16);
      v34 = self->_recentQRServerList;
      if (v34)
        CFArrayAppendValue((CFMutableArrayRef)v34, v16);
    }
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)_shouldAllowP2PConnectionTo:(id)a3 anotherRemoteEndpoint:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  NSMutableArray *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  const char *v17;
  double v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_connectedToQR)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = self->_recentQRServerList;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v21, v11, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v9);
          v16 = *(NSObject **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (sub_19B99724C(v16, v6) || v7 && sub_19B99724C(v16, v7))
          {
            v19 = 0;
            goto LABEL_16;
          }
        }
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v17, (uint64_t)&v21, v18, v25, 16);
        v19 = 1;
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      v19 = 1;
    }
LABEL_16:

  }
  else
  {
    v19 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v19;
}

- (void)_addUDPConnectionInProgress:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  double v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_addObject_(self->_tokensForUDPConnectionInProgress, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_doesUDPConnectionInProgressExist:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  const char *v6;
  double v7;
  int v8;
  const char *v9;
  uint64_t v10;
  double v11;
  NSObject *v12;
  const __CFString *v13;
  int v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = objc_msgSend_containsObject_(self->_tokensForUDPConnectionInProgress, v6, (uint64_t)v4, v7);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend_IDSNWLink(IDSFoundationLog, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("NO");
    if (v8)
      v13 = CFSTR("YES");
    v15 = 138412546;
    v16 = v4;
    v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "UDP connection %@ in progress = %@", (uint8_t *)&v15, 0x16u);
  }

  return v8;
}

- (void)_removeUDPConnectionInProgress:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  double v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_removeObject_(self->_tokensForUDPConnectionInProgress, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
}

- (id)_createNetworkInterfaceArrayWithIPVersion:(unint64_t)a3 wantsWiFi:(BOOL)a4 wantsCellular:(BOOL)a5
{
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int isCellular;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  double v23;
  uint64_t v24;
  const char *v25;
  double v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  GLUCreateNetworkInterfaceArrayWithOptions(a3, 0, a4, a5, 0, self->_useDefaultInterfaceOnly, self->_isDefaultPairedDevice, 0, self->_cellInterfaceName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v28, 0.0, v32, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        isCellular = objc_msgSend_isCellular(v15, v9, v10, v11);
        objc_msgSend_address(v15, v17, v18, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (isCellular)
          v24 = objc_msgSend_cellularPort(self, v20, v21, v23);
        else
          v24 = objc_msgSend_port(self, v20, v21, v23);
        objc_msgSend_updateLocalPort_(v22, v25, v24, v26);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v28, v11, v32, 16);
    }
    while (v12);
  }
  return v6;
}

- (void)logConnectionTree
{
  uint64_t v2;
  double v3;
  NSObject *v5;
  NSMutableSet *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  const char *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  IDSNWLink *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend_IDSNWLink(IDSFoundationLog, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = self;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "NWLink Connection Tree %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_rootConnections;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v15, v8, v19, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v6);
        objc_msgSend_logConnectionSubtree_indentation_(self, v10, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), v11, &stru_1E3C2E4E8, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v15, v11, v19, 16);
    }
    while (v12);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)logConnectionSubtree:(id)a3 indentation:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  unint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  __CFString *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  void *v39;
  const char *v40;
  double v41;
  __CFString *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  const char *v47;
  uint64_t v48;
  double v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  double v57;
  void *v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  double v66;
  uint64_t v67;
  const char *v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[4];
  id v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  __CFString *v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  __CFString *v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11 = objc_msgSend_type(v6, v8, v9, v10);
  if (v11 > 0xA)
    v15 = "??";
  else
    v15 = off_1E3C1F918[v11];
  objc_msgSend_sessionID(v6, v12, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16
    && (v20 = (void *)v16,
        objc_msgSend_sessionID(v6, v17, v18, v19),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend_length(v21, v22, v23, v24),
        v21,
        v20,
        v25 >= 8))
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_sessionID(v6, v17, v18, v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringToIndex_(v27, v28, 8, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v26, v31, (uint64_t)CFSTR(" %@"), v32, v30);
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = &stru_1E3C2E4E8;
  }
  objc_msgSend_protocolStackDescription(v6, v17, v18, v19);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v38 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_protocolStackDescription(v6, v35, v36, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v38, v40, (uint64_t)CFSTR(" — %@"), v41, v39);
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v42 = &stru_1E3C2E4E8;
  }
  objc_msgSend_IDSNWLink(IDSFoundationLog, v35, v36, v37);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v73 = v15;
    v74 = objc_msgSend_connectionID(v6, v44, v45, v46);
    objc_msgSend_name(v6, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localEndpoint(v6, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteEndpoint(v6, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414082;
    v81 = v7;
    v82 = 2080;
    v83 = v73;
    v84 = 2112;
    v85 = v33;
    v86 = 2048;
    v87 = v74;
    v88 = 2112;
    v89 = v50;
    v90 = 2112;
    v91 = v42;
    v92 = 2112;
    v93 = v54;
    v94 = 2112;
    v95 = v58;
    _os_log_impl(&dword_19B949000, v43, OS_LOG_TYPE_DEFAULT, "%@ - %-3s %@ [C%llu] %@%@ %@/%@", buf, 0x52u);

  }
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v59, (uint64_t)CFSTR("%@    "), v60, v7);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend_children(v6, v62, v63, 0.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v75, v66, v79, 16);
  if (v67)
  {
    v70 = v67;
    v71 = *(_QWORD *)v76;
    do
    {
      v72 = 0;
      do
      {
        if (*(_QWORD *)v76 != v71)
          objc_enumerationMutation(v64);
        objc_msgSend_logConnectionSubtree_indentation_(self, v68, *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v72++), v69, v61);
      }
      while (v70 != v72);
      v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v68, (uint64_t)&v75, v69, v79, 16);
    }
    while (v70);
  }

}

- (id)_findListenerWithLocalEndpoint:(id)a3
{
  uint64_t port;
  const char *v5;
  double v6;
  id v7;
  uint64_t v8;

  port = nw_endpoint_get_port((nw_endpoint_t)a3);
  objc_msgSend__extraListenerForPort_(self, v5, port, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if ((_DWORD)port == self->_cellularPort)
    {
      v8 = 80;
    }
    else
    {
      if ((_DWORD)port != self->_port)
      {
        v7 = 0;
        return v7;
      }
      v8 = 72;
    }
    v7 = *(id *)((char *)&self->super.isa + v8);
  }
  return v7;
}

- (BOOL)_isLocalEndpointCellular:(id)a3
{
  uint64_t port;
  os_unfair_lock_s *p_lock;
  const char *v6;
  double v7;
  char v8;
  NSMutableArray *cellularPortList;
  void *v10;
  const char *v11;
  double v12;

  port = nw_endpoint_get_port((nw_endpoint_t)a3);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((_DWORD)port == self->_cellularPort)
  {
    v8 = 1;
  }
  else
  {
    cellularPortList = self->_cellularPortList;
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v6, port, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend_containsObject_(cellularPortList, v11, (uint64_t)v10, v12);

  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)cbuuid
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCbuuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSString)deviceUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDeviceUniqueID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (IDSLinkDelegate)delegate
{
  return (IDSLinkDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IDSLinkDelegate)alternateDelegate
{
  return (IDSLinkDelegate *)objc_loadWeakRetained((id *)&self->_alternateDelegate);
}

- (void)setAlternateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_alternateDelegate, a3);
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (unsigned)cellularPort
{
  return self->_cellularPort;
}

- (void)setCellularPort:(unsigned __int16)a3
{
  self->_cellularPort = a3;
}

- (NSString)cellInterfaceName
{
  return self->_cellInterfaceName;
}

- (void)setCellInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_cellInterfaceName, a3);
}

- (BOOL)useDefaultInterfaceOnly
{
  return self->_useDefaultInterfaceOnly;
}

- (void)setUseDefaultInterfaceOnly:(BOOL)a3
{
  self->_useDefaultInterfaceOnly = a3;
}

- (NSIndexSet)cellularInterfaceIndices
{
  return self->_cellularInterfaceIndices;
}

- (void)setCellularInterfaceIndices:(id)a3
{
  objc_storeStrong((id *)&self->_cellularInterfaceIndices, a3);
}

- (BOOL)wifiAssistEnabled
{
  return self->_wifiAssistEnabled;
}

- (void)setWifiAssistEnabled:(BOOL)a3
{
  self->_wifiAssistEnabled = a3;
}

- (BOOL)connectedToQR
{
  return self->_connectedToQR;
}

- (void)setConnectedToQR:(BOOL)a3
{
  self->_connectedToQR = a3;
}

- (BOOL)disallowQUICPodForCellular
{
  return self->_disallowQUICPodForCellular;
}

- (void)setDisallowQUICPodForCellular:(BOOL)a3
{
  self->_disallowQUICPodForCellular = a3;
}

- (BOOL)disableP2P
{
  return self->_disableP2P;
}

- (void)setDisableP2P:(BOOL)a3
{
  self->_disableP2P = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularInterfaceIndices, 0);
  objc_destroyWeak((id *)&self->_alternateDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
  objc_storeStrong((id *)&self->_cbuuid, 0);
  objc_storeStrong((id *)&self->_portToExtraListener, 0);
  objc_storeStrong((id *)&self->_interfaceIndexToNAT64LocalAddress, 0);
  objc_storeStrong((id *)&self->_rootConnections, 0);
  objc_storeStrong((id *)&self->_tokenToChildConnectionEvaluator, 0);
  objc_storeStrong((id *)&self->_tokenToNWLinkConnection, 0);
  objc_storeStrong((id *)&self->_queuedPeelOffs, 0);
  objc_storeStrong((id *)&self->_cellularPortList, 0);
  objc_storeStrong((id *)&self->_tokensForUDPConnectionInProgress, 0);
  objc_storeStrong((id *)&self->_recentQRServerList, 0);
  objc_storeStrong((id *)&self->_cellularListener, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_cellInterfaceName, 0);
}

@end
