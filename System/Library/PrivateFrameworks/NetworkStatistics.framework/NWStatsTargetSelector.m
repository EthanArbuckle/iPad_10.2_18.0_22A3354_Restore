@implementation NWStatsTargetSelector

- (BOOL)_applySelection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  int v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_suppliedParams, a3);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectFlowEvents"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectFlowEvents"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectFlowEvents"));
      v9 = objc_claimAutoreleasedReturnValue();
      self->_events |= -[NSObject unsignedLongLongValue](v9, "unsignedLongLongValue");
    }
    else
    {
      NStatGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectFlowEvents"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = 138412290;
        v92 = v10;
        _os_log_impl(&dword_211429000, v9, OS_LOG_TYPE_ERROR, "Incorrect class for configuration item %@", (uint8_t *)&v91, 0xCu);

      }
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectConnEvents"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectConnEvents"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = objc_opt_isKindOfClass();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectConnEvents"));
      v14 = objc_claimAutoreleasedReturnValue();
      self->_events |= -[NSObject unsignedLongLongValue](v14, "unsignedLongLongValue");
    }
    else
    {
      NStatGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectConnEvents"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = 138412290;
        v92 = v15;
        _os_log_impl(&dword_211429000, v14, OS_LOG_TYPE_ERROR, "Incorrect class for configuration item %@", (uint8_t *)&v91, 0xCu);

      }
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceCellular"));
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceCellular"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    if (v19)
      self->_filter |= 4uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceWiFi"));
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceWiFi"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");

    if (v23)
      self->_filter |= 8uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceWired"));
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceWired"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");

    if (v27)
      self->_filter |= 0x10uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceCompanionLink"));
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceCompanionLink"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "BOOLValue");

    if (v31)
      self->_filter |= 0x200uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceCompanionLinkBluetooth"));
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceCompanionLinkBluetooth"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "BOOLValue");

    if (v35)
      self->_filter |= 0x400000040000uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceLoopback"));
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceLoopback"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "BOOLValue");

    if (v39)
      self->_filter |= 2uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceExpensive"));
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceExpensive"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "BOOLValue");

    if (v43)
      self->_filter |= 0x40uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceCellularViaFallback"));
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceCellularViaFallback"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "BOOLValue");

    if (v47)
      self->_filter |= 0x100uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceAWDL"));
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceAWDL"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "BOOLValue");

    if (v51)
      self->_filter |= 0x20uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceUnknown"));
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceUnknown"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "BOOLValue");

    if (v55)
      self->_filter |= 1uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceRouteValueError"));
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    v57 = (void *)v56;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceRouteValueError"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "BOOLValue");

    if (v59)
      self->_filter |= 0x2000uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceFlowswitchValueError"));
  v60 = objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v61 = (void *)v60;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectInterfaceFlowswitchValueError"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "BOOLValue");

    if (v63)
      self->_filter |= 0x4000uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectAllFlowsAndSubFlows"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectAllFlowsAndSubFlows"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "BOOLValue");
    self->_hasExplicitTCP = 1;
    self->_explicitTCPValue = v66;
    self->_hasExplicitUDP = 1;
    self->_explicitUDPValue = v66;
    self->_hasExplicitQUIC = 1;
    self->_explicitQUICValue = v66;
    self->_hasExplicitUDPSubFlows = 1;
    self->_explicitUDPSubFlowsValue = v66;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectAllFlows"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectAllFlows"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "BOOLValue");
    self->_hasExplicitTCP = 1;
    self->_explicitTCPValue = v69;
    self->_hasExplicitUDP = 1;
    self->_explicitUDPValue = v69;
    self->_hasExplicitQUIC = 1;
    self->_explicitQUICValue = v69;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectTCP"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectTCP"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitTCP = 1;
    self->_explicitTCPValue = objc_msgSend(v71, "BOOLValue");

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectUDP"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectUDP"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitUDP = 1;
    self->_explicitUDPValue = objc_msgSend(v73, "BOOLValue");

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectUDPSubFlows"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectUDPSubFlows"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitUDPSubFlows = 1;
    self->_explicitUDPSubFlowsValue = objc_msgSend(v75, "BOOLValue");

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectQUIC"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectQUIC"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitQUIC = 1;
    self->_explicitQUICValue = objc_msgSend(v77, "BOOLValue");

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectFlowUsesChannels"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectFlowUsesChannels"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitChannels = 1;
    self->_explicitChannelsValue = objc_msgSend(v79, "BOOLValue");

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectFlowUsesSockets"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectFlowUsesSockets"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitSockets = 1;
    self->_explicitSocketsValue = objc_msgSend(v81, "BOOLValue");

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectUserlandConnections"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectUserlandConnections"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitUserlandConnections = 1;
    self->_explicitUserlandConnectionsValue = objc_msgSend(v83, "BOOLValue");

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectConnHasNetAccess"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectConnHasNetAccess"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v85, "BOOLValue"))
      self->_connFilter |= 0x1000000uLL;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectStartupConnHasNetAccess"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectStartupConnHasNetAccess"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v87, "BOOLValue"))
      self->_connFilter |= 0x1001000000uLL;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectTuneSkipNoChangeConnOnRefresh"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectTuneSkipNoChangeConnOnRefresh"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v89, "BOOLValue"))
      self->_connFilter |= 0x20000000uLL;

  }
  return 1;
}

- (NWStatsTargetSelector)initWithSelection:(id)a3
{
  id v4;
  NWStatsTargetSelector *v5;
  NWStatsTargetSelector *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NWStatsTargetSelector;
  v5 = -[NWStatsTargetSelector init](&v8, sel_init);
  v6 = v5;
  if (v5 && !-[NWStatsTargetSelector _applySelection:](v5, "_applySelection:", v4))
  {

    v6 = 0;
  }

  return v6;
}

- (NWStatsTargetSelector)initWithMultipleSelections:(id)a3
{
  id v4;
  NWStatsTargetSelector *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NWStatsTargetSelector;
  v5 = -[NWStatsTargetSelector init](&v16, sel_init);
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          if (!-[NWStatsTargetSelector _applySelection:](v5, "_applySelection:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12))
          {

            v5 = 0;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v5;
}

- (BOOL)shouldAddProvider:(int)a3
{
  BOOL explicitTCPValue;
  BOOL hasExplicitUDP;
  char v5;
  BOOL v6;
  BOOL explicitQUICValue;
  char v8;
  BOOL hasExplicitUserlandConnections;
  BOOL explicitSocketsValue;
  BOOL explicitChannelsValue;
  BOOL result;

  if (self->_hasExplicitTCP)
  {
    explicitTCPValue = self->_explicitTCPValue;
    hasExplicitUDP = self->_hasExplicitUDP;
    if (!hasExplicitUDP)
    {
      v5 = 0;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (self->_hasExplicitUDP)
  {
    explicitTCPValue = 0;
LABEL_6:
    hasExplicitUDP = self->_explicitUDPValue;
    v5 = 1;
    goto LABEL_7;
  }
  explicitTCPValue = !self->_hasExplicitQUIC && !self->_hasExplicitUDPSubFlows && !self->_hasExplicitUserlandConnections;
  if (self->_hasExplicitQUIC || self->_hasExplicitUDPSubFlows)
  {
    v5 = 0;
    hasExplicitUDP = 0;
  }
  else
  {
    v5 = 0;
    hasExplicitUDP = !self->_hasExplicitUserlandConnections;
  }
LABEL_7:
  v6 = self->_hasExplicitUDPSubFlows && self->_explicitUDPSubFlowsValue;
  if (self->_hasExplicitQUIC)
  {
    explicitQUICValue = self->_explicitQUICValue;
    goto LABEL_29;
  }
  if (self->_hasExplicitTCP)
    v8 = 1;
  else
    v8 = v5;
  if ((v8 & 1) != 0)
    goto LABEL_16;
  if (!self->_hasExplicitSockets)
  {
    if (self->_hasExplicitUDPSubFlows)
    {
LABEL_16:
      explicitQUICValue = 0;
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  explicitQUICValue = 0;
  if (!self->_hasExplicitUDPSubFlows && self->_hasExplicitChannels)
LABEL_28:
    explicitQUICValue = !self->_hasExplicitUserlandConnections;
LABEL_29:
  hasExplicitUserlandConnections = self->_hasExplicitUserlandConnections;
  if (hasExplicitUserlandConnections)
    hasExplicitUserlandConnections = self->_explicitUserlandConnectionsValue;
  explicitSocketsValue = !self->_hasExplicitChannels;
  if (self->_hasExplicitChannels)
  {
    explicitChannelsValue = self->_explicitChannelsValue;
    if (!self->_hasExplicitSockets)
      goto LABEL_34;
    goto LABEL_33;
  }
  explicitChannelsValue = !self->_hasExplicitSockets;
  if (self->_hasExplicitSockets)
LABEL_33:
    explicitSocketsValue = self->_explicitSocketsValue;
LABEL_34:
  result = 0;
  switch(a3)
  {
    case 2:
      result = explicitTCPValue && explicitSocketsValue;
      break;
    case 3:
      result = explicitTCPValue && explicitChannelsValue;
      break;
    case 4:
      result = hasExplicitUDP && explicitSocketsValue;
      break;
    case 5:
      result = hasExplicitUDP && explicitChannelsValue;
      break;
    case 8:
      result = explicitQUICValue;
      break;
    case 9:
      result = hasExplicitUserlandConnections;
      break;
    case 10:
      result = v6;
      break;
    default:
      return result;
  }
  return result;
}

- (id)description
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("NWStatsTargetSelector at %p, filter 0x%llx connFilter 0x%llx events 0x%llx cfg UDP %d val %d cfg TCP %d val %d cfg QUIC %d val %d cfg subflows %d val %d cfg conns %d val %d cfg channels %d val %d cfg sockets %d val %d params %@"), self, self->_filter, self->_connFilter, self->_events, self->_hasExplicitUDP, self->_explicitUDPValue, self->_hasExplicitTCP, self->_explicitTCPValue, self->_hasExplicitQUIC, self->_explicitQUICValue, self->_hasExplicitUDPSubFlows, self->_explicitUDPSubFlowsValue, self->_hasExplicitUserlandConnections, self->_explicitUserlandConnectionsValue, self->_hasExplicitChannels, self->_explicitChannelsValue,
                                           self->_hasExplicitSockets,
                                           self->_explicitSocketsValue,
                                           self->_suppliedParams));
}

- (NSDictionary)suppliedParams
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSuppliedParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)filter
{
  return self->_filter;
}

- (void)setFilter:(unint64_t)a3
{
  self->_filter = a3;
}

- (unint64_t)connFilter
{
  return self->_connFilter;
}

- (void)setConnFilter:(unint64_t)a3
{
  self->_connFilter = a3;
}

- (unint64_t)events
{
  return self->_events;
}

- (void)setEvents:(unint64_t)a3
{
  self->_events = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppliedParams, 0);
}

@end
