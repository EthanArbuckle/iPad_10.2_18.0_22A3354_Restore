@implementation CUPairingDaemon

- (CUPairingDaemon)init
{
  CUPairingDaemon *v2;
  CUPairingDaemon *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUPairingDaemon;
  v2 = -[CUPairingDaemon init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_rpIdentityNotifier = -1;
    objc_storeStrong((id *)&gPairingDaemon, v2);
    v3 = v2;
  }

  return v2;
}

- (id)initStandalone
{
  CUPairingDaemon *v2;
  CUPairingDaemon *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUPairingDaemon;
  v2 = -[CUPairingDaemon init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_rpIdentityNotifier = -1;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  if (self->_xpcListener)
    FatalErrorF((uint64_t)"XPC listener still active during dealloc", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)v8.receiver);
  v8.receiver = self;
  v8.super_class = (Class)CUPairingDaemon;
  -[CUPairingDaemon dealloc](&v8, sel_dealloc);
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  -[NSMutableSet count](self->_xpcConnections, "count");
  return (NSString *)NSPrintF((uint64_t)"CUPairingManager %{ptr} <%ld XPC>", v3, v4, v5, v6, v7, v8, v9, (uint64_t)self);
}

- (id)detailedDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  CFMutableStringRef *v18;
  __CFString *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFMutableStringRef *v27;
  __CFString *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CFMutableStringRef *v36;
  __CFString *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CFMutableStringRef *v45;
  __CFString *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  CFMutableStringRef *v54;
  __CFString *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  CFMutableStringRef *v63;
  __CFString *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __CFString *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  __CFString *v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  __CFString *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  __CFString *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t j;
  __CFString *v118;
  void *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  __CFString *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  __CFString *v150;
  NSMutableSet *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  __CFString *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  CUPairingDaemon *v176;
  CFMutableStringRef v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  CFMutableStringRef v182;
  CFMutableStringRef v183;
  CFMutableStringRef v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  CFMutableStringRef v189;
  CFMutableStringRef v190;
  CFMutableStringRef v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  CFMutableStringRef v196;
  CFMutableStringRef v197;
  CFMutableStringRef v198;
  CFMutableStringRef v199;
  CFMutableStringRef v200;
  CFMutableStringRef v201;
  CFMutableStringRef v202;
  CFMutableStringRef v203;
  CFMutableStringRef v204;
  CFMutableStringRef v205;
  CFMutableStringRef v206;
  CFMutableStringRef v207;
  CFMutableStringRef v208;
  CFMutableStringRef v209;
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  uint64_t v213;

  v213 = *MEMORY[0x1E0C80C00];
  v209 = 0;
  NSAppendPrintF(&v209, (uint64_t)"=== CUPairingManager ===\n", v2, v3, v4, v5, v6, v7, v166);
  v9 = v209;
  v10 = -[CUPairingDaemon copyIdentityWithOptions:error:](self, "copyIdentityWithOptions:error:", 2, 0);
  v17 = v10;
  if (v10)
  {
    v208 = v9;
    v18 = &v208;
    NSAppendPrintF(&v208, (uint64_t)"Per-account:      %@\n", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  }
  else
  {
    v207 = v9;
    v18 = &v207;
    NSAppendPrintF(&v207, (uint64_t)"Per-account:      No identity\n", v11, v12, v13, v14, v15, v16, v167);
  }
  v19 = *v18;

  v20 = -[CUPairingDaemon copyIdentityWithOptions:error:](self, "copyIdentityWithOptions:error:", 6, 0);
  if (v20)
  {
    v206 = v19;
    v27 = &v206;
    NSAppendPrintF(&v206, (uint64_t)"Per-device:       %@\n", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
  }
  else
  {
    v205 = v19;
    v27 = &v205;
    NSAppendPrintF(&v205, (uint64_t)"Per-device:       No identity\n", v21, v22, v23, v24, v25, v26, v168);
  }
  v28 = *v27;

  v29 = -[CUPairingDaemon copyIdentityWithOptions:error:](self, "copyIdentityWithOptions:error:", 10, 0);
  if (v29)
  {
    v204 = v28;
    v36 = &v204;
    NSAppendPrintF(&v204, (uint64_t)"HomeKitHAP:       %@\n", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
  }
  else
  {
    v203 = v28;
    v36 = &v203;
    NSAppendPrintF(&v203, (uint64_t)"HomeKitHAP:       No identity\n", v30, v31, v32, v33, v34, v35, v169);
  }
  v37 = *v36;

  if (GestaltGetDeviceClass_sOnce != -1)
    dispatch_once(&GestaltGetDeviceClass_sOnce, &__block_literal_global_13066);
  if (GestaltGetDeviceClass_deviceClass == 7 || GestaltGetDeviceClass_deviceClass == 4)
  {
    v38 = -[CUPairingDaemon copyIdentityWithOptions:error:](self, "copyIdentityWithOptions:error:", 18, 0);

    if (v38)
    {
      v202 = v37;
      v45 = &v202;
      NSAppendPrintF(&v202, (uint64_t)"HomeKitAccessory: %@\n", v39, v40, v41, v42, v43, v44, (uint64_t)v38);
      v29 = v38;
    }
    else
    {
      v201 = v37;
      v45 = &v201;
      NSAppendPrintF(&v201, (uint64_t)"HomeKitAccessory: No identity\n", v39, v40, v41, v42, v43, v44, v170);
      v29 = 0;
    }
    v46 = *v45;

    v37 = v46;
  }
  v47 = -[CUPairingDaemon copyIdentityWithOptions:error:](self, "copyIdentityWithOptions:error:", 34, 0);

  if (v47)
  {
    v200 = v37;
    v54 = &v200;
    NSAppendPrintF(&v200, (uint64_t)"HomeKitUser:      %@\n", v48, v49, v50, v51, v52, v53, (uint64_t)v47);
  }
  else
  {
    v199 = v37;
    v54 = &v199;
    NSAppendPrintF(&v199, (uint64_t)"HomeKitUser:      No identity\n", v48, v49, v50, v51, v52, v53, v170);
  }
  v55 = *v54;

  v56 = -[CUPairingDaemon copyIdentityWithOptions:error:](self, "copyIdentityWithOptions:error:", 258, 0);
  v175 = v56;
  if (v56)
  {
    v198 = v55;
    v172 = (uint64_t)v56;
    v63 = &v198;
    NSAppendPrintF(&v198, (uint64_t)"HomeKitLegacy:    %@\n", v57, v58, v59, v60, v61, v62, v172);
  }
  else
  {
    v197 = v55;
    v63 = &v197;
    NSAppendPrintF(&v197, (uint64_t)"HomeKitLegacy:    No identity\n", v57, v58, v59, v60, v61, v62, v171);
  }
  v64 = *v63;

  v176 = self;
  v65 = -[CUPairingDaemon copyPairedPeersWithOptions:error:](self, "copyPairedPeersWithOptions:error:", 2, 0);
  v196 = v64;
  v66 = objc_msgSend(v65, "count");
  NSAppendPrintF(&v196, (uint64_t)"\n--- Per-account Peers (%ld) ---\n", v67, v68, v69, v70, v71, v72, v66);
  v73 = v196;

  v194 = 0u;
  v195 = 0u;
  v192 = 0u;
  v193 = 0u;
  v74 = v65;
  v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v192, v212, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v193;
    do
    {
      for (i = 0; i != v76; ++i)
      {
        v79 = v73;
        if (*(_QWORD *)v193 != v77)
          objc_enumerationMutation(v74);
        v80 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * i);
        v191 = v73;
        v81 = v80;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v81, "detailedDescription");
          v82 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v81, "descriptionWithLevel:", 20);
          else
            NSPrintF((uint64_t)"%@\n", v83, v84, v85, v86, v87, v88, v89, (uint64_t)v81);
          v82 = objc_claimAutoreleasedReturnValue();
        }
        v90 = (void *)v82;

        NSAppendPrintF(&v191, (uint64_t)"%@", v91, v92, v93, v94, v95, v96, (uint64_t)v90);
        v73 = v191;

      }
      v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v192, v212, 16);
    }
    while (v76);
  }

  if (!objc_msgSend(v74, "count"))
  {
    v190 = v73;
    NSAppendPrintF(&v190, (uint64_t)"No per-account peers\n", v97, v98, v99, v100, v101, v102, v173);
    v103 = v190;

    v73 = v103;
  }
  v104 = -[CUPairingDaemon copyPairedPeersWithOptions:error:](v176, "copyPairedPeersWithOptions:error:", 6, 0);

  v189 = v73;
  v105 = objc_msgSend(v104, "count");
  NSAppendPrintF(&v189, (uint64_t)"\n--- Per-device Peers (%ld) ---\n", v106, v107, v108, v109, v110, v111, v105);
  v112 = v189;

  v187 = 0u;
  v188 = 0u;
  v185 = 0u;
  v186 = 0u;
  v113 = v104;
  v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v185, v211, 16);
  if (v114)
  {
    v115 = v114;
    v116 = *(_QWORD *)v186;
    do
    {
      for (j = 0; j != v115; ++j)
      {
        v118 = v112;
        if (*(_QWORD *)v186 != v116)
          objc_enumerationMutation(v113);
        v119 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * j);
        v184 = v112;
        v120 = v119;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v120, "detailedDescription");
          v121 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v120, "descriptionWithLevel:", 20);
          else
            NSPrintF((uint64_t)"%@\n", v122, v123, v124, v125, v126, v127, v128, (uint64_t)v120);
          v121 = objc_claimAutoreleasedReturnValue();
        }
        v129 = (void *)v121;

        NSAppendPrintF(&v184, (uint64_t)"%@", v130, v131, v132, v133, v134, v135, (uint64_t)v129);
        v112 = v184;

      }
      v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v185, v211, 16);
    }
    while (v115);
  }

  if (!objc_msgSend(v113, "count"))
  {
    v183 = v112;
    NSAppendPrintF(&v183, (uint64_t)"No per-device peers\n", v136, v137, v138, v139, v140, v141, v174);
    v142 = v183;

    v112 = v142;
  }
  v182 = v112;
  v143 = -[NSMutableSet count](v176->_xpcConnections, "count");
  NSAppendPrintF(&v182, (uint64_t)"\n--- XPC connections (%ld) ---\n", v144, v145, v146, v147, v148, v149, v143);
  v150 = v182;

  v180 = 0u;
  v181 = 0u;
  v178 = 0u;
  v179 = 0u;
  v151 = v176->_xpcConnections;
  v152 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v151, "countByEnumeratingWithState:objects:count:", &v178, v210, 16);
  if (v152)
  {
    v153 = v152;
    v154 = *(_QWORD *)v179;
    do
    {
      v155 = 0;
      v156 = v150;
      do
      {
        if (*(_QWORD *)v179 != v154)
          objc_enumerationMutation(v151);
        v157 = *(_QWORD *)(*((_QWORD *)&v178 + 1) + 8 * v155);
        v177 = v156;
        v158 = objc_msgSend(*(id *)(v157 + 40), "processIdentifier");
        NSAppendPrintF(&v177, (uint64_t)"%#{pid}\n", v159, v160, v161, v162, v163, v164, v158);
        v150 = v177;

        ++v155;
        v156 = v150;
      }
      while (v153 != v155);
      v153 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v151, "countByEnumeratingWithState:objects:count:", &v178, v210, 16);
    }
    while (v153);
  }

  return v150;
}

- (void)activate
{
  NSXPCListener *v3;
  NSXPCListener *xpcListener;
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (self->_testMode && !self->_xpcListener)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CUPairingDaemon_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CUHomeKitManager *v7;
  CUHomeKitManager *homeKitManager;
  dispatch_queue_t v9;
  NSObject *dispatchQueue;
  NSXPCListener *v11;
  NSXPCListener *xpcListener;
  uint64_t v13;
  _QWORD handler[5];

  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _activate]", 0x1Eu, (uint64_t)"Activate\n", v2, v3, v4, v5, v13);
  }
  if (!self->_homeKitManager)
  {
    v7 = objc_alloc_init(CUHomeKitManager);
    homeKitManager = self->_homeKitManager;
    self->_homeKitManager = v7;

    v9 = dispatch_queue_create("CUPairingDaemonHomeKit", 0);
    -[CUHomeKitManager setDispatchQueue:](self->_homeKitManager, "setDispatchQueue:", v9);

    -[CUHomeKitManager setFlags:](self->_homeKitManager, "setFlags:", 516);
    if (GestaltGetDeviceClass_sOnce != -1)
      dispatch_once(&GestaltGetDeviceClass_sOnce, &__block_literal_global_13066);
    if (GestaltGetDeviceClass_deviceClass == 7 || GestaltGetDeviceClass_deviceClass == 4)
      -[CUHomeKitManager setFlags:](self->_homeKitManager, "setFlags:", -[CUHomeKitManager flags](self->_homeKitManager, "flags") | 2);
    -[CUHomeKitManager activate](self->_homeKitManager, "activate");
  }
  if (self->_rpIdentityNotifier == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __28__CUPairingDaemon__activate__block_invoke;
    handler[3] = &unk_1E25DE468;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.identitiesChanged", &self->_rpIdentityNotifier, dispatchQueue, handler);
    -[CUPairingDaemon _rpIdentityUpdate](self, "_rpIdentityUpdate");
  }
  if (!self->_stateHandle)
    self->_stateHandle = os_state_add_handler();
  if (!self->_xpcListener)
  {
    v11 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.PairingManager"));
    xpcListener = self->_xpcListener;
    self->_xpcListener = v11;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CUPairingDaemon_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSXPCListener *xpcListener;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableSet *xpcConnections;
  int rpIdentityNotifier;
  NSData *rpSelfIRK;
  CUHomeKitManager *homeKitManager;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v17);
  }
  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i) + 40), "invalidate", (_QWORD)v17);
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  -[NSMutableSet removeAllObjects](self->_xpcConnections, "removeAllObjects");
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0;
  }
  rpIdentityNotifier = self->_rpIdentityNotifier;
  if (rpIdentityNotifier != -1)
  {
    notify_cancel(rpIdentityNotifier);
    self->_rpIdentityNotifier = -1;
  }
  rpSelfIRK = self->_rpSelfIRK;
  self->_rpSelfIRK = 0;

  -[CUHomeKitManager invalidate](self->_homeKitManager, "invalidate");
  homeKitManager = self->_homeKitManager;
  self->_homeKitManager = 0;

  if ((CUPairingDaemon *)gPairingDaemon == self)
  {
    gPairingDaemon = 0;

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  CUPairingXPCConnection *v7;
  NSMutableSet *xpcConnections;
  NSMutableSet *v9;
  NSMutableSet *v10;
  void *v11;
  CUPairingXPCConnection *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[5];
  CUPairingXPCConnection *v21;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = objc_alloc_init(CUPairingXPCConnection);
  objc_storeStrong((id *)&v7->_daemon, self);
  objc_storeStrong((id *)&v7->_dispatchQueue, self->_dispatchQueue);
  objc_storeStrong((id *)&v7->_xpcCnx, a4);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = self->_xpcConnections;
    self->_xpcConnections = v9;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v7);
  objc_msgSend(v6, "_setQueue:", self->_dispatchQueue);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0758F0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v11);

  objc_msgSend(v6, "setExportedObject:", v7);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__CUPairingDaemon_listener_shouldAcceptNewConnection___block_invoke;
  v20[3] = &unk_1E25DE628;
  v20[4] = self;
  v12 = v7;
  v21 = v12;
  objc_msgSend(v6, "setInvalidationHandler:", v20);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE075A80);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v13);

  objc_msgSend(v6, "resume");
  if (gLogCategory_CUPairingDaemon <= 20
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x14u)))
  {
    v14 = objc_msgSend(v6, "processIdentifier");
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon listener:shouldAcceptNewConnection:]", 0x14u, (uint64_t)"XPC connection started from %#{pid}\n", v15, v16, v17, v18, v14);
  }

  return 1;
}

- (void)_connectionInvalidated:(id)a3
{
  NSObject *dispatchQueue;
  id v5;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  objc_msgSend(v5, "connectionInvalidated");
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v5);

}

- (void)reset
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;
  uint64_t v29;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_testMode)
  {
    -[CUPairingDaemon deleteIdentityWithOptions:](self, "deleteIdentityWithOptions:", 0);
    -[CUPairingDaemon deleteIdentityWithOptions:](self, "deleteIdentityWithOptions:", 4);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = -[CUPairingDaemon copyPairedPeersWithOptions:error:](self, "copyPairedPeersWithOptions:error:", 0, 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          -[CUPairingDaemon removePairedPeer:options:removeAdminAllowed:](self, "removePairedPeer:options:removeAdminAllowed:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), 0, 1);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }

    v12 = -[CUPairingDaemon copyPairedPeersWithOptions:error:](self, "copyPairedPeersWithOptions:error:", 4, 0);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          -[CUPairingDaemon removePairedPeer:options:removeAdminAllowed:](self, "removePairedPeer:options:removeAdminAllowed:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), 4, 1, (_QWORD)v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v15);
    }

  }
  else if (gLogCategory_CUPairingDaemon <= 90
         && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x5Au)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon reset]", 0x5Au, (uint64_t)"### Reset only allowed in test mode\n", v2, v3, v4, v5, v29);
  }
}

- (void)_rpIdentityUpdate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v7;
  id v8;
  uint64_t v9[4];
  id v10;
  CUPairingDaemon *v11;

  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]", 0x1Eu, (uint64_t)"Self RPIdentity get start\n", v2, v3, v4, v5, v9[0]);
  }
  v7 = objc_alloc_init((Class)getRPClientClass[0]());
  objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = (uint64_t)__36__CUPairingDaemon__rpIdentityUpdate__block_invoke;
  v9[3] = (uint64_t)&unk_1E25DCFE8;
  v10 = v7;
  v11 = self;
  v8 = v7;
  objc_msgSend(v8, "getIdentitiesWithFlags:completion:", 1, v9);

}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return -[NSXPCListener endpoint](self->_xpcListener, "endpoint");
}

- (id)copyIdentityWithOptions:(unint64_t)a3 error:(int *)a4
{
  CUPairingDaemon *v6;
  uint64_t v7;
  void *v8;

  v6 = self;
  objc_sync_enter(v6);
  if ((a3 & 8) != 0)
  {
    v7 = -[CUPairingDaemon _copyHomeKitWithOptions:error:](v6, "_copyHomeKitWithOptions:error:", a3, a4);
  }
  else if ((a3 & 0x138) != 0)
  {
    v7 = -[CUPairingDaemon _copyHomeKitExWithOptions:error:](v6, "_copyHomeKitExWithOptions:error:", a3, a4);
  }
  else
  {
    v7 = -[CUPairingDaemon _copyOrCreateWithOptions:error:](v6, "_copyOrCreateWithOptions:error:", a3, a4);
  }
  v8 = (void *)v7;
  objc_sync_exit(v6);

  return v8;
}

- (void)getIdentityWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  void *v4;
  void *v5;
  void (**v8)(id, void *, void *);
  CUPairingDaemon *v9;
  CUHomeKitManager *homeKitManager;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, void *, void *);
  int v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *, void *))a4;
  v9 = self;
  objc_sync_enter(v9);
  if ((a3 & 8) != 0)
  {
    v24 = 0;
    v11 = -[CUPairingDaemon _copyHomeKitWithOptions:error:](v9, "_copyHomeKitWithOptions:error:", a3, &v24);
    if (v8)
    {
      v12 = v24;
      if (v24)
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        v27 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v24, 0, 0));
        v14 = objc_claimAutoreleasedReturnValue();
        v4 = (void *)v14;
        v15 = CFSTR("?");
        if (v14)
          v15 = (const __CFString *)v14;
        v28[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v12, v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      v8[2](v8, v11, v16);
      if ((_DWORD)v12)
      {

      }
    }
    goto LABEL_21;
  }
  if ((a3 & 0x138) == 0)
  {
    v24 = 0;
    v11 = -[CUPairingDaemon _copyOrCreateWithOptions:error:](v9, "_copyOrCreateWithOptions:error:", a3, &v24);
    if (v8)
    {
      v17 = v24;
      if (v24)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v24, 0, 0));
        v19 = objc_claimAutoreleasedReturnValue();
        v4 = (void *)v19;
        v20 = CFSTR("?");
        if (v19)
          v20 = (const __CFString *)v19;
        v26 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v17, v5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      v8[2](v8, v11, v21);
      if ((_DWORD)v17)
      {

      }
    }
LABEL_21:

    goto LABEL_22;
  }
  homeKitManager = v9->_homeKitManager;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__CUPairingDaemon_getIdentityWithOptions_completionHandler___block_invoke;
  v22[3] = &unk_1E25DD010;
  v23 = v8;
  -[CUHomeKitManager getPairingIdentityWithOptions:completion:](homeKitManager, "getPairingIdentityWithOptions:completion:", a3, v22);

LABEL_22:
  objc_sync_exit(v9);

}

- (id)_copyHomeKitWithOptionsHAP:(unint64_t)a3 error:(int *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CUPairingIdentity *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  CUPairingIdentity *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v26;
  id v27;

  v11 = -[CUPairingDaemon _copyHomeKitLocalPairingIDWithOptions:error:](self, "_copyHomeKitLocalPairingIDWithOptions:error:");
  if (v11)
    return v11;
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsHAP:error:]", 0x1Eu, (uint64_t)"No HomeKit Local Pairing ID, trying HAP directly", v7, v8, v9, v10, v26);
  }
  -[objc_class systemStore](getHAPSystemKeychainStoreClass_5705(), "systemStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    v27 = 0;
    objc_msgSend(v12, "getLocalPairingIdentity:", &v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v27;
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v14, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v17);
        if (v18)
        {
          v19 = objc_alloc_init(CUPairingIdentity);
          -[CUPairingIdentity setIdentifier:](v19, "setIdentifier:", v18);
          objc_msgSend(v14, "publicKey");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "data");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CUPairingIdentity setPublicKey:](v19, "setPublicKey:", v21);

          if ((a3 & 2) != 0)
          {
            objc_msgSend(v14, "privateKey");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "data");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CUPairingIdentity setSecretKey:](v19, "setSecretKey:", v23);

          }
          v24 = 0;
          goto LABEL_13;
        }
        v19 = 0;
      }
      else
      {
        v19 = 0;
        v18 = 0;
      }
      v24 = -6708;
    }
    else
    {
      v24 = NSErrorToOSStatusEx(v15, 0);
      v19 = 0;
      v17 = 0;
      v18 = 0;
    }
LABEL_13:
    if (a4)
      *a4 = v24;
    v11 = v19;

    return v11;
  }
  return -[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:](self, "_copyHomeKitWithOptionsKeychain:error:", a3, a4);
}

- (id)_copyHomeKitLocalPairingIDWithOptions:(unint64_t)a3 error:(int *)a4
{
  dispatch_semaphore_t v7;
  CUHomeKitManager *homeKitManager;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5672;
  v28 = __Block_byref_object_dispose__5673;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5672;
  v22 = __Block_byref_object_dispose__5673;
  v23 = 0;
  v7 = dispatch_semaphore_create(0);
  homeKitManager = self->_homeKitManager;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__CUPairingDaemon__copyHomeKitLocalPairingIDWithOptions_error___block_invoke;
  v14[3] = &unk_1E25DEEB8;
  v16 = &v24;
  v17 = &v18;
  v9 = v7;
  v15 = v9;
  -[CUHomeKitManager getHomeKitLocalPairingIdentityWithOptions:completion:](homeKitManager, "getHomeKitLocalPairingIdentityWithOptions:completion:", a3, v14);
  v10 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    LODWORD(v11) = -6722;
  }
  else
  {
    v11 = (void *)v19[5];
    if (v11)
      LODWORD(v11) = NSErrorToOSStatusEx(v11, 0);
  }
  if (a4)
    *a4 = (int)v11;
  v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (id)_copyHomeKitWithOptionsKeychain:(unint64_t)a3 error:(int *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const void *v26;
  CFTypeID TypeID;
  void *v28;
  int *v29;
  void *v30;
  const void *v31;
  CFTypeID v32;
  void *v33;
  id v34;
  char *v35;
  size_t v36;
  char *v37;
  char *v38;
  char *v39;
  int64_t v40;
  uint64_t v41;
  CUPairingIdentity *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  CUPairingIdentity *v47;
  uint64_t v49;
  uint64_t v50;
  char v51;
  int64_t v53;
  size_t v54;
  unsigned int v55;
  _BYTE v56[32];
  _BYTE v57[32];
  uint64_t v58;

  v51 = a3;
  v58 = *MEMORY[0x1E0C80C00];
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]", 0x1Eu, (uint64_t)"Get HomeKit Local key", v4, v5, v6, v7, v49);
  }
  v55 = 0;
  v53 = 0;
  v54 = 0;
  v8 = *MEMORY[0x1E0CD6C98];
  v15 = (const __CFDictionary *)KeychainCopyMatchingFormatted(&v55, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}", a3, (uint64_t)a4, v4, v5, v6, v7, *MEMORY[0x1E0CD6C98]);
  if (!v15)
  {
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]", 0x1Eu, (uint64_t)"No HomeKit Local key, try v2 key: %#m", v11, v12, v13, v14, v55);
    }
    v15 = (const __CFDictionary *)KeychainCopyMatchingFormatted(&v55, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}", v9, v10, v11, v12, v13, v14, v8);
    if (!v15)
    {
      if (gLogCategory_CUPairingDaemon <= 30
        && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]", 0x1Eu, (uint64_t)"No HomeKit v2 key, try v0 key: %#m", v18, v19, v20, v21, v55);
      }
      v15 = (const __CFDictionary *)KeychainCopyMatchingFormatted(&v55, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}", v16, v17, v18, v19, v20, v21, v8);
      if (!v15)
      {
        v42 = 0;
        v28 = 0;
        v30 = 0;
        v34 = 0;
        v29 = a4;
        goto LABEL_31;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v29 = a4;
    if (gLogCategory_CUPairingDaemon <= 90
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]", 0x5Au, (uint64_t)"Bad HomeKit key type", v22, v23, v24, v25, v50);
    }
    v34 = 0;
    v30 = 0;
    v28 = 0;
    v42 = 0;
    v41 = 4294960540;
    goto LABEL_51;
  }
  v26 = (const void *)*MEMORY[0x1E0CD68F8];
  TypeID = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v15, v26, TypeID, (int *)&v55);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = a4;
  if (!v28)
  {
    v42 = 0;
    v30 = 0;
LABEL_47:
    v34 = 0;
    goto LABEL_31;
  }
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v28);
  if (!v30)
  {
    v34 = 0;
    v42 = 0;
    v41 = 4294960588;
    goto LABEL_51;
  }
  v31 = (const void *)*MEMORY[0x1E0CD70D8];
  v32 = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v15, v31, v32, (int *)&v55);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    v42 = 0;
    goto LABEL_47;
  }
  v34 = objc_retainAutorelease(v33);
  v35 = (char *)objc_msgSend(v34, "bytes");
  v36 = objc_msgSend(v34, "length");
  v54 = v36;
  v37 = (char *)memchr(v35, 43, v36);
  if (!v37)
  {
    v42 = 0;
    v41 = 4294960554;
    goto LABEL_51;
  }
  v38 = &v35[v36];
  v39 = v37 + 1;
  v40 = v38 - (v37 + 1);
  v53 = v40;
  v54 = v37 - v35;
  v41 = HexToData(v35, v37 - v35, 22, (uint64_t)v57, 0x20uLL, &v54, 0, 0);
  v55 = v41;
  if ((_DWORD)v41)
    goto LABEL_39;
  if (v54 != 32)
  {
LABEL_40:
    v42 = 0;
    v41 = 4294960553;
LABEL_51:
    v55 = v41;
    goto LABEL_32;
  }
  v41 = HexToData(v39, v40, 22, (uint64_t)v56, 0x20uLL, (unint64_t *)&v53, 0, 0);
  v55 = v41;
  if ((_DWORD)v41)
  {
LABEL_39:
    v42 = 0;
    goto LABEL_32;
  }
  if (v53 != 32)
    goto LABEL_40;
  v42 = objc_alloc_init(CUPairingIdentity);
  -[CUPairingIdentity setIdentifier:](v42, "setIdentifier:", v30);
  v43 = objc_alloc(MEMORY[0x1E0C99D50]);
  v44 = (void *)objc_msgSend(v43, "initWithBytes:length:", v57, v54);
  -[CUPairingIdentity setPublicKey:](v42, "setPublicKey:", v44);

  if ((v51 & 2) != 0)
  {
    v45 = objc_alloc(MEMORY[0x1E0C99D50]);
    v46 = (void *)objc_msgSend(v45, "initWithBytes:length:", v56, v53);
    -[CUPairingIdentity setSecretKey:](v42, "setSecretKey:", v46);

  }
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]", 0x1Eu, (uint64_t)"Got HomeKit key: %@", v22, v23, v24, v25, (uint64_t)v42);
  }
LABEL_31:
  v41 = v55;
  if (!v55)
    goto LABEL_36;
LABEL_32:
  if (gLogCategory_CUPairingDaemon > 90)
    goto LABEL_36;
  if (gLogCategory_CUPairingDaemon != -1)
    goto LABEL_34;
  if (_LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x5Au))
  {
    v41 = v55;
LABEL_34:
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]", 0x5Au, (uint64_t)"### Get HomeKit key failed: %#m", v22, v23, v24, v25, v41);
  }
LABEL_36:
  if (v29)
    *v29 = v55;
  v47 = v42;

  return v47;
}

- (id)_copyHomeKitExWithOptions:(unint64_t)a3 error:(int *)a4
{
  dispatch_semaphore_t v7;
  CUHomeKitManager *homeKitManager;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5672;
  v28 = __Block_byref_object_dispose__5673;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5672;
  v22 = __Block_byref_object_dispose__5673;
  v23 = 0;
  v7 = dispatch_semaphore_create(0);
  homeKitManager = self->_homeKitManager;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__CUPairingDaemon__copyHomeKitExWithOptions_error___block_invoke;
  v14[3] = &unk_1E25DEEB8;
  v16 = &v24;
  v17 = &v18;
  v9 = v7;
  v15 = v9;
  -[CUHomeKitManager getPairingIdentityWithOptions:completion:](homeKitManager, "getPairingIdentityWithOptions:completion:", a3, v14);
  v10 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    LODWORD(v11) = -6722;
  }
  else
  {
    v11 = (void *)v19[5];
    if (v11)
      LODWORD(v11) = NSErrorToOSStatusEx(v11, 0);
  }
  if (a4)
    *a4 = (int)v11;
  v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (id)_copyOrCreateWithOptions:(unint64_t)a3 error:(int *)a4
{
  CUPairingIdentity *v7;
  CUPairingIdentity *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  CUPairingIdentity *v13;
  CUPairingIdentity *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CUPairingIdentity *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v39;
  _BYTE __s[32];
  _BYTE bytes[32];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v7 = -[CUPairingDaemon _copyIdentityWithOptions:error:](self, "_copyIdentityWithOptions:error:", a3, &v39);
  v8 = v7;
  if (v7 && !v39)
  {
    if ((a3 & 2) != 0)
    {
      -[CUPairingIdentity altIRK](v7, "altIRK");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        if ((a3 & 4) == 0)
          goto LABEL_30;
        goto LABEL_21;
      }
      v10 = v9;
      if ((a3 & 4) != 0 && self->_rpSelfIRK)
      {
        -[CUPairingIdentity altIRK](v8, "altIRK");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", self->_rpSelfIRK);

        if ((v12 & 1) != 0)
          goto LABEL_38;
LABEL_21:
        if (self->_rpSelfIRK)
        {
          -[CUPairingIdentity setAltIRK:](v8, "setAltIRK:");
          if (gLogCategory_CUPairingDaemon <= 30
            && (gLogCategory_CUPairingDaemon != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
          {
            LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyOrCreateWithOptions:error:]", 0x1Eu, (uint64_t)"Updating identity for RP IRK: %@\n", v23, v24, v25, v26, (uint64_t)v8);
          }
          goto LABEL_37;
        }
LABEL_30:
        RandomBytes(bytes, 0x10uLL);
        CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, (uint64_t)bytes, 16, "AltIRKSalt", 0xAuLL, (uint64_t)"AltIRKInfo", 10, 0x10uLL, (uint64_t)bytes);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", bytes, 16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUPairingIdentity setAltIRK:](v8, "setAltIRK:", v28);

        if (gLogCategory_CUPairingDaemon <= 30
          && (gLogCategory_CUPairingDaemon != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyOrCreateWithOptions:error:]", 0x1Eu, (uint64_t)"Updating identity for missing IRK: %@\n", v29, v30, v31, v32, (uint64_t)v8);
        }
LABEL_37:
        v39 = -[CUPairingDaemon _saveIdentity:options:](self, "_saveIdentity:options:", v8, a3);
        if (v39)
        {
          v13 = 0;
          goto LABEL_40;
        }
        goto LABEL_38;
      }

    }
LABEL_38:
    v27 = v8;
LABEL_39:
    v13 = v27;
    v8 = v27;
    goto LABEL_40;
  }
  v13 = 0;
  if (!v39)
  {
    v39 = -6762;
    goto LABEL_40;
  }
  if ((a3 & 1) != 0 && v39 != -25293)
  {
    v14 = objc_alloc_init(CUPairingIdentity);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingIdentity setIdentifier:](v14, "setIdentifier:", v15);

    if ((a3 & 4) != 0 && self->_rpSelfIRK)
    {
      -[CUPairingIdentity setAltIRK:](v14, "setAltIRK:");
    }
    else
    {
      RandomBytes(bytes, 0x10uLL);
      CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, (uint64_t)bytes, 16, "AltIRKSalt", 0xAuLL, (uint64_t)"AltIRKInfo", 10, 0x10uLL, (uint64_t)bytes);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", bytes, 16);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUPairingIdentity setAltIRK:](v14, "setAltIRK:", v16);

    }
    cced25519_make_key_pair_compat();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", bytes, 32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingIdentity setPublicKey:](v14, "setPublicKey:", v17);

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s, 32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingIdentity setSecretKey:](v14, "setSecretKey:", v18);

    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyOrCreateWithOptions:error:]", 0x1Eu, (uint64_t)"Created %@\n", v19, v20, v21, v22, (uint64_t)v14);
    }
    v39 = -[CUPairingDaemon _saveIdentity:options:](self, "_saveIdentity:options:", v14, a3);
    if (v39)
    {
      v13 = 0;
      v8 = v14;
      goto LABEL_40;
    }
    if ((a3 & 2) == 0)
    {
      -[CUPairingIdentity setAltIRK:](v14, "setAltIRK:", 0);
      -[CUPairingIdentity setSecretKey:](v14, "setSecretKey:", 0);
    }
    v27 = v14;
    goto LABEL_39;
  }
LABEL_40:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  v37 = v39;
  if (v39 != -25300 && v39 && gLogCategory_CUPairingDaemon <= 60)
  {
    if (gLogCategory_CUPairingDaemon != -1)
    {
LABEL_44:
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyOrCreateWithOptions:error:]", 0x3Cu, (uint64_t)"### CopyIdentity failed: %#m\n", v33, v34, v35, v36, v37);
      goto LABEL_46;
    }
    if (_LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu))
    {
      v37 = v39;
      goto LABEL_44;
    }
  }
LABEL_46:
  if (a4)
    *a4 = v39;

  return v13;
}

- (id)_copyIdentityWithOptions:(unint64_t)a3 error:(int *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  const __CFDictionary *v10;
  int v11;
  CUPairingIdentity *v12;
  __CFString *Value;
  void *v14;
  const void *v15;
  CFTypeID TypeID;
  const __CFData *v17;
  __CFString *v18;
  CFTypeID v19;
  const __CFData *v20;
  CFTypeID v21;
  void *v22;
  CFTypeID v23;
  CUPairingIdentity *v24;
  CUPairingIdentity *v25;
  int v27;
  _BYTE v28[64];
  uint64_t v29;

  v9 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v10 = (const __CFDictionary *)KeychainCopyMatchingFormatted(&v27, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", a3, (uint64_t)a4, v4, v5, v6, v7, *MEMORY[0x1E0CD6C98]);
  v11 = v27;
  if (v27)
  {
    v24 = 0;
    v12 = 0;
    goto LABEL_27;
  }
  if (!v10)
  {
    v24 = 0;
    v12 = 0;
    v17 = 0;
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = 0;
    v12 = 0;
    v17 = 0;
    v18 = 0;
LABEL_36:
    v11 = -6756;
    goto LABEL_40;
  }
  v12 = objc_alloc_init(CUPairingIdentity);
  Value = (__CFString *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x1E0CD68F8]);
  if (Value)
  {
    v11 = CFGetUUIDEx(Value, 0, (uint64_t)v28);
    v27 = v11;
    if (!v11)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v28);
      -[CUPairingIdentity setIdentifier:](v12, "setIdentifier:", v14);

      v15 = (const void *)*MEMORY[0x1E0CD70D8];
      TypeID = CFDataGetTypeID();
      CFDictionaryGetTypedValue(v10, v15, TypeID, &v27);
      v17 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v11 = v27;
      if (!v27)
      {
        if (v17)
        {
          v18 = (__CFString *)OPACKDecodeData(v17, 0, &v27);
          v11 = v27;
          if (v27)
            goto LABEL_24;
          if (!v18)
          {
LABEL_25:
            v24 = 0;
LABEL_39:
            v11 = -6762;
            goto LABEL_40;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = CFDataGetTypeID();
            CFDictionaryGetTypedValue((const __CFDictionary *)v18, CFSTR("pk"), v19, &v27);
            v20 = (const __CFData *)objc_claimAutoreleasedReturnValue();

            v11 = v27;
            if (v27)
            {
              v24 = 0;
              v17 = v20;
              goto LABEL_21;
            }
            if (!v20)
            {
              v24 = 0;
              v17 = 0;
              goto LABEL_39;
            }
            -[CUPairingIdentity setPublicKey:](v12, "setPublicKey:", v20);
            if ((v9 & 2) == 0)
            {
              v17 = v20;
LABEL_20:
              v24 = v12;
              v11 = 0;
              v27 = 0;
              v12 = v24;
              goto LABEL_21;
            }
            v21 = CFDataGetTypeID();
            CFDictionaryGetTypedValue((const __CFDictionary *)v18, CFSTR("altIRK"), v21, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
              -[CUPairingIdentity setAltIRK:](v12, "setAltIRK:", v22);
            v23 = CFDataGetTypeID();
            CFDictionaryGetTypedValue((const __CFDictionary *)v18, CFSTR("sk"), v23, &v27);
            v17 = (const __CFData *)objc_claimAutoreleasedReturnValue();

            v11 = v27;
            if (!v27)
            {
              if (v17)
              {
                -[CUPairingIdentity setSecretKey:](v12, "setSecretKey:", v17);
                goto LABEL_20;
              }
              goto LABEL_25;
            }
LABEL_24:
            v24 = 0;
            goto LABEL_21;
          }
          v24 = 0;
          goto LABEL_36;
        }
        v24 = 0;
LABEL_34:
        v18 = 0;
        goto LABEL_39;
      }
      v24 = 0;
LABEL_32:
      v18 = 0;
      goto LABEL_21;
    }
    v24 = 0;
LABEL_27:
    v17 = 0;
    goto LABEL_32;
  }
  v24 = 0;
  v17 = 0;
  v18 = 0;
  v11 = -6727;
LABEL_40:
  v27 = v11;
LABEL_21:
  if (a4)
    *a4 = v11;
  v25 = v24;

  return v25;
}

- (int)deleteIdentityWithOptions:(unint64_t)a3
{
  CUPairingDaemon *v4;

  v4 = self;
  objc_sync_enter(v4);
  LODWORD(a3) = -[CUPairingDaemon _deleteIdentityWithOptions:](v4, "_deleteIdentityWithOptions:", a3);
  objc_sync_exit(v4);

  return a3;
}

- (int)_deleteIdentityWithOptions:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSMutableSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v14 = KeychainDeleteFormatted((uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O}", (uint64_t)a2, a3, v3, v4, v5, v6, v7, *MEMORY[0x1E0CD6C98]);
  if (!v14)
  {
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _deleteIdentityWithOptions:]", 0x1Eu, (uint64_t)"Deleted identity\n", v10, v11, v12, v13, v23);
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = self->_xpcConnections;
    v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (*(_BYTE *)(v20 + 32))
          {
            objc_msgSend(*(id *)(v20 + 40), "remoteObjectProxy");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "pairingIdentityDeletedWithOptions:", a3);

          }
        }
        v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    notify_post("com.apple.pairing.identityChanged");
  }
  return v14;
}

- (int)_saveIdentity:(id)a3 options:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __objc2_class **p_superclass;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  CFMutableDataRef v24;
  const __CFDictionary *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int updated;
  uint64_t v30;
  uint64_t v31;
  NSMutableSet *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  int v39;
  int v40;
  int v42;
  void *v43;
  void *v44;
  __CFData *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  int v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  p_superclass = CUNetInterfaceMonitor.superclass;
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _saveIdentity:options:]", 0x1Eu, (uint64_t)"Save %@\n", v6, v7, v8, v9, (uint64_t)v10);
  }
  v50 = 0;
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v21 = 0;
    v24 = 0;
    v18 = 0;
    v25 = 0;
    v42 = -6708;
LABEL_50:
    v50 = v42;
    goto LABEL_41;
  }
  v18 = (__CFString *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "altIRK");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    -[__CFString setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v19, CFSTR("altIRK"));
  objc_msgSend(v10, "publicKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    -[__CFString setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v20, CFSTR("pk"));
  objc_msgSend(v10, "secretKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    -[__CFString setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v21, CFSTR("sk"));
  v24 = OPACKEncoderCreateDataMutable(v18, 0, &v50);
  if (v50)
  {
    v25 = 0;
    goto LABEL_41;
  }
  if (!v24)
  {
    v25 = 0;
    v42 = -6762;
    goto LABEL_50;
  }
  v43 = v21;
  v45 = v24;
  v26 = *MEMORY[0x1E0CD6C98];
  v44 = v13;
  v25 = (const __CFDictionary *)CFCreateF(&v50, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v22, v23, v14, v15, v16, v17, *MEMORY[0x1E0CD6C98]);
  if (!v50)
  {
    updated = KeychainUpdateFormatted(v25, (uint64_t)"{%kO=%O%kO=%O%kO=%O}", v27, v28, v14, v15, v16, v17, *MEMORY[0x1E0CD69A0]);
    v50 = updated;
    if (updated)
    {
      if (updated != -25300)
      {
        p_superclass = (__objc2_class **)(CUNetInterfaceMonitor + 8);
        v21 = v43;
        goto LABEL_41;
      }
      v50 = KeychainAddFormatted(0, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v30, v31, v14, v15, v16, v17, v26);
      v21 = v43;
      if (v50)
      {
        p_superclass = (__objc2_class **)(CUNetInterfaceMonitor + 8);
        goto LABEL_41;
      }
      if (gLogCategory_CUPairingDaemon <= 30
        && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _saveIdentity:options:]", 0x1Eu, (uint64_t)"Saved %@\n", v14, v15, v16, v17, (uint64_t)v10);
      }
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v32 = self->_xpcConnections;
      v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v47 != v35)
              objc_enumerationMutation(v32);
            v37 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
            if (*(_BYTE *)(v37 + 32))
            {
              objc_msgSend(*(id *)(v37 + 40), "remoteObjectProxy");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "pairingIdentityCreated:options:", v10, a4);

            }
          }
          v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v34);
      }

      notify_post("com.apple.pairing.identityChanged");
      v13 = v44;
      v24 = v45;
      p_superclass = CUNetInterfaceMonitor.superclass;
    }
    else
    {
      p_superclass = CUNetInterfaceMonitor.superclass;
      v21 = v43;
      if (gLogCategory_CUPairingDaemon > 30)
        goto LABEL_45;
      if (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu))
        LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _saveIdentity:options:]", 0x1Eu, (uint64_t)"Updated %@\n", v14, v15, v16, v17, (uint64_t)v10);
    }
    if (!v50)
      goto LABEL_45;
    goto LABEL_41;
  }
  p_superclass = (__objc2_class **)(CUNetInterfaceMonitor + 8);
  v21 = v43;
LABEL_41:
  v39 = *((_DWORD *)p_superclass + 134);
  if (v39 <= 60 && (v39 != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _saveIdentity:options:]", 0x3Cu, (uint64_t)"### Save %@ failed: %#m\n", v14, v15, v16, v17, (uint64_t)v10);
LABEL_45:
  if (v25)
    CFRelease(v25);
  v40 = v50;

  return v40;
}

- (id)copyPairedPeersWithOptions:(unint64_t)a3 error:(int *)a4
{
  CUPairingDaemon *v6;
  id v7;

  v6 = self;
  objc_sync_enter(v6);
  v7 = -[CUPairingDaemon _copyPairedPeersWithOptions:error:](v6, "_copyPairedPeersWithOptions:error:", a3, a4);
  objc_sync_exit(v6);

  return v7;
}

- (id)_copyPairedPeersWithOptions:(unint64_t)a3 error:(int *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  CFTypeRef v10;
  void *v11;
  const void *v12;
  uint64_t i;
  const __CFDictionary *v14;
  CUPairedPeer *v15;
  CFTypeID TypeID;
  void *v17;
  id v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  CFTypeID v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFTypeRef v31;
  void *v32;
  const __CFString *v33;
  __CFString *v34;
  CFTypeID v35;
  void *v36;
  CFTypeID v37;
  void *v38;
  CFTypeID v39;
  void *v40;
  CFTypeID v41;
  const __CFData *v42;
  __CFString *v43;
  CFTypeID v44;
  void *v45;
  void *v46;
  CFTypeID v47;
  uint64_t v48;
  id v49;
  int v50;
  int v52;
  CUPairingDaemon *v53;
  void *v54;
  int *v55;
  id obj;
  const void *v57;
  const void *v58;
  const void *v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  id v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  int v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v8 = a4;
  v72 = *MEMORY[0x1E0C80C00];
  v69 = 0;
  v62 = a3;
  v61 = *MEMORY[0x1E0CD6C98];
  v10 = KeychainCopyMatchingFormatted(&v69, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", a3, (uint64_t)a4, v4, v5, v6, v7, *MEMORY[0x1E0CD6C98]);
  v11 = (void *)v10;
  if (v69)
  {
    v49 = 0;
    v63 = 0;
    if (v69 == -25300)
    {
      v63 = 0;
      v69 = 0;
      v49 = (id)MEMORY[0x1E0C9AA60];
    }
    goto LABEL_60;
  }
  if (!v10)
  {
    v49 = 0;
    v63 = 0;
    v52 = -6762;
LABEL_67:
    v69 = v52;
    goto LABEL_60;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v49 = 0;
    v63 = 0;
    v52 = -6756;
    goto LABEL_67;
  }
  v53 = self;
  v55 = v8;
  v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v54 = v11;
  obj = v11;
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (!v64)
    goto LABEL_39;
  v60 = *(_QWORD *)v66;
  v12 = (const void *)*MEMORY[0x1E0CD68F8];
  v59 = (const void *)*MEMORY[0x1E0CD6A98];
  v58 = (const void *)*MEMORY[0x1E0CD6A90];
  v57 = (const void *)*MEMORY[0x1E0CD69B0];
  while (2)
  {
    for (i = 0; i != v64; ++i)
    {
      if (*(_QWORD *)v66 != v60)
        objc_enumerationMutation(obj);
      v14 = *(const __CFDictionary **)(*((_QWORD *)&v65 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v69 = -6756;
LABEL_58:
        v11 = v54;
        v8 = v55;
        goto LABEL_59;
      }
      v15 = objc_alloc_init(CUPairedPeer);
      TypeID = CFStringGetTypeID();
      CFDictionaryGetTypedValue(v14, v12, TypeID, &v69);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v69)
        goto LABEL_42;
      if (!v17)
      {
        v69 = -6762;
        goto LABEL_57;
      }
      v18 = objc_retainAutorelease(v17);
      v19 = (char *)objc_msgSend(v18, "UTF8String");
      v69 = StringToUUIDEx(v19, 0xFFFFFFFFFFFFFFFFLL, 0, 0, &v70, v20, v21, v22);
      if (v69)
      {
LABEL_42:
        v32 = 0;
LABEL_43:
        v36 = 0;
        v34 = 0;
LABEL_54:
        v11 = v54;
        v8 = v55;

LABEL_59:
        v49 = 0;
        goto LABEL_60;
      }
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v70);
      -[CUPairedPeer setIdentifier:](v15, "setIdentifier:", v23);

      v24 = CFDateGetTypeID();
      -[CUPairedPeer setDateModified:](v15, "setDateModified:", CFDictionaryGetTypedValue(v14, v59, v24, 0));
      v31 = KeychainCopyMatchingFormatted(&v69, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v25, v26, v27, v28, v29, v30, v61);
      v32 = (void *)v31;
      if (v69)
        goto LABEL_43;
      if (!v31)
      {
        v69 = -6762;
        goto LABEL_56;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v50 = -6756;
        goto LABEL_50;
      }
      v33 = OPACKDecodeData((const __CFData *)v32, 0, &v69);
      v34 = (__CFString *)v33;
      if (v69)
      {
        v36 = 0;
        goto LABEL_54;
      }
      if (!v33)
      {
        v50 = -6762;
LABEL_50:
        v69 = v50;
LABEL_52:

LABEL_56:
LABEL_57:

        goto LABEL_58;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v69 = -6756;

        goto LABEL_52;
      }
      v35 = CFDictionaryGetTypeID();
      CFDictionaryGetTypedValue((const __CFDictionary *)v34, CFSTR("acl"), v35, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        -[CUPairedPeer setAcl:](v15, "setAcl:", v36);
      v37 = CFDataGetTypeID();
      CFDictionaryGetTypedValue((const __CFDictionary *)v34, CFSTR("pk"), v37, &v69);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v69)
      {
        v32 = v38;
        goto LABEL_54;
      }
      if (!v38)
      {
        v69 = -6762;

        goto LABEL_56;
      }
      -[CUPairedPeer setPublicKey:](v15, "setPublicKey:", v38);
      v39 = CFStringGetTypeID();
      CFDictionaryGetTypedValue(v14, v58, v39, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
        -[CUPairedPeer setName:](v15, "setName:", v40);
      v41 = CFDataGetTypeID();
      CFDictionaryGetTypedValue(v14, v57, v41, 0);
      v42 = (const __CFData *)objc_claimAutoreleasedReturnValue();

      if (!v42)
      {
        v43 = 0;
LABEL_32:
        v45 = v40;
        goto LABEL_33;
      }
      v43 = (__CFString *)OPACKDecodeData(v42, 0, 0);
      if (!v43)
        goto LABEL_32;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_32;
      v44 = CFStringGetTypeID();
      CFDictionaryGetTypedValue((const __CFDictionary *)v43, CFSTR("model"), v44, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
        -[CUPairedPeer setModel:](v15, "setModel:", v45);
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v43);
      objc_msgSend(v46, "removeObjectForKey:", CFSTR("model"));
      -[CUPairedPeer setInfo:](v15, "setInfo:", v46);

LABEL_33:
      if ((v62 & 2) != 0)
      {
        v47 = CFDataGetTypeID();
        CFDictionaryGetTypedValue((const __CFDictionary *)v34, CFSTR("altIRK"), v47, 0);
        v48 = objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          -[CUPairedPeer setAltIRK:](v15, "setAltIRK:", v48);
          v42 = (const __CFData *)v48;
        }
        else
        {
          v42 = 0;
        }
      }
      objc_msgSend(v63, "addObject:", v15);

    }
    v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (v64)
      continue;
    break;
  }
LABEL_39:

  if (v62 < 0)
    -[CUPairingDaemon _removeDups:](v53, "_removeDups:", v63);
  v49 = v63;
  v69 = 0;
  v63 = v49;
  v11 = v54;
  v8 = v55;
LABEL_60:
  if (v8)
    *v8 = v69;

  return v49;
}

- (void)_removeDups:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  unint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  id v17;

  v17 = a3;
  v3 = objc_msgSend(v17, "count");
  if (!v3)
    goto LABEL_20;
  v4 = v3;
  for (i = 0; i < v4; ++i)
  {
    objc_msgSend(v17, "objectAtIndexedSubscript:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "info");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mac"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_17;
    objc_msgSend(v6, "dateModified");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_16;
    v10 = 0;
    v15 = v4 - 1;
    v16 = v4;
    if (v4 <= 1)
      v4 = 1;
    while (i == v10)
    {
LABEL_14:
      if (v4 == ++v10)
      {
        v4 = v16;
        goto LABEL_16;
      }
    }
    objc_msgSend(v17, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "info");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("mac"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13 || !objc_msgSend(v13, "isEqual:", v8))
      goto LABEL_13;
    objc_msgSend(v11, "dateModified");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14 || objc_msgSend(v9, "compare:", v14) >= 1)
    {

LABEL_13:
      goto LABEL_14;
    }
    objc_msgSend(v17, "removeObjectAtIndex:", i--);

    v4 = v15;
LABEL_16:

LABEL_17:
  }
LABEL_20:

}

- (id)findPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  id v8;
  CUPairingDaemon *v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  if ((a4 & 8) != 0)
  {
    -[CUPairingDaemon _findHomeKitPairedPeer:options:error:](v9, "_findHomeKitPairedPeer:options:error:", v8, a4, a5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((a4 & 0x138) != 0)
      -[CUPairingDaemon _findHomeKitExPairedPeer:options:error:](v9, "_findHomeKitExPairedPeer:options:error:", v8, a4, a5);
    else
      -[CUPairingDaemon _findPairedPeer:options:error:](v9, "_findPairedPeer:options:error:", v8, a4, a5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  objc_sync_exit(v9);

  return v11;
}

- (id)_findHomeKitPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  CUPairedPeer *v14;
  int v15;
  CUPairedPeer *v16;

  objc_msgSend(a3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v14 = 0;
    v10 = 0;
    v13 = 0;
    v15 = -6708;
    if (!a5)
      goto LABEL_10;
    goto LABEL_9;
  }
  v9 = -[CUPairingDaemon _copyHomeKitWithOptions:error:](self, "_copyHomeKitWithOptions:error:", a4, 0);
  v10 = v9;
  if (v9
    && (objc_msgSend(v9, "identifier"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqual:", v8),
        v11,
        v12))
  {
    objc_msgSend(v10, "publicKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = objc_alloc_init(CUPairedPeer);
      -[CUPairedPeer setIdentifier:](v14, "setIdentifier:", v8);
      -[CUPairedPeer setPublicKey:](v14, "setPublicKey:", v13);
      v15 = 0;
      if (!a5)
        goto LABEL_10;
      goto LABEL_9;
    }
    v14 = 0;
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }
  v15 = -25300;
  if (a5)
LABEL_9:
    *a5 = v15;
LABEL_10:
  v16 = v14;

  return v16;
}

- (id)_findHomeKitExPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  id v8;
  dispatch_semaphore_t v9;
  CUHomeKitManager *homeKitManager;
  NSObject *v11;
  dispatch_time_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__5672;
  v30 = __Block_byref_object_dispose__5673;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5672;
  v24 = __Block_byref_object_dispose__5673;
  v25 = 0;
  v9 = dispatch_semaphore_create(0);
  homeKitManager = self->_homeKitManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__CUPairingDaemon__findHomeKitExPairedPeer_options_error___block_invoke;
  v16[3] = &unk_1E25DEE90;
  v18 = &v26;
  v19 = &v20;
  v11 = v9;
  v17 = v11;
  -[CUHomeKitManager findPairedPeer:options:completion:](homeKitManager, "findPairedPeer:options:completion:", v8, a4, v16);
  v12 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    LODWORD(v13) = -6722;
  }
  else
  {
    v13 = (void *)v21[5];
    if (v13)
      LODWORD(v13) = NSErrorToOSStatusEx(v13, 0);
  }
  if (a5)
    *a5 = (int)v13;
  v14 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (id)_findPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  CUPairedPeer *v19;
  const void *v20;
  CFTypeID TypeID;
  void *v22;
  const void *v23;
  CFTypeID v24;
  const __CFData *v25;
  const __CFData *v26;
  __CFString *v27;
  CFTypeID v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  CUPairedPeer *v42;
  int v43;
  const void *v44;
  CFTypeID v45;
  const __CFData *v46;
  const __CFString *v47;
  const __CFDictionary *v48;
  CFTypeID v49;
  void *v50;
  CFTypeID v51;
  const __CFData *v52;
  CFTypeID v53;
  uint64_t v54;
  CUPairedPeer *v55;
  int v57;
  int v58;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  int v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v66 = 0;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v8;
  v61 = v7;
  if (!v8)
  {
    objc_msgSend(v7, "publicKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = -[CUPairingDaemon _copyPairedPeersWithOptions:error:](self, "_copyPairedPeersWithOptions:error:", a4, &v66);
      v33 = v32;
      if (v66)
      {
        v42 = 0;
        goto LABEL_44;
      }
      if (v32)
      {
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v33 = v32;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        if (v34)
        {
          v35 = v34;
          v36 = 0;
          v37 = *(_QWORD *)v63;
LABEL_19:
          v38 = 0;
          v39 = v36;
          while (1)
          {
            if (*(_QWORD *)v63 != v37)
              objc_enumerationMutation(v33);
            v36 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * v38);

            objc_msgSend(v36, "publicKey");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isEqual:", v31);

            if ((v41 & 1) != 0)
              break;
            ++v38;
            v39 = v36;
            if (v35 == v38)
            {
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
              if (v35)
                goto LABEL_19;

              goto LABEL_26;
            }
          }
          v42 = (CUPairedPeer *)v36;

          if (!v42)
            goto LABEL_27;
          goto LABEL_44;
        }
LABEL_26:

LABEL_27:
        v42 = 0;
        v43 = -25300;
      }
      else
      {
        v42 = 0;
        v43 = -6762;
      }
    }
    else
    {
      v42 = 0;
      v33 = 0;
      v43 = -6708;
    }
    v66 = v43;
LABEL_44:

    v16 = 0;
    v29 = 0;
    v18 = 0;
    v46 = 0;
    v50 = 0;
    v27 = 0;
    v48 = 0;
    v19 = v42;
    goto LABEL_48;
  }
  v9 = v8;
  objc_msgSend(v8, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (const __CFDictionary *)KeychainCopyMatchingFormatted(&v66, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v10, v11, v12, v13, v14, v15, *MEMORY[0x1E0CD6C98]);
    v18 = v17;
    if (v66)
    {
      v42 = 0;
      v29 = 0;
      v19 = 0;
      v46 = 0;
      v50 = 0;
      v27 = 0;
      v48 = 0;
      goto LABEL_48;
    }
    if (!v17)
    {
      v42 = 0;
      v29 = 0;
      v19 = 0;
      v46 = 0;
      v50 = 0;
      v27 = 0;
      v48 = 0;
LABEL_65:
      v57 = -6762;
      goto LABEL_66;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v42 = 0;
      v29 = 0;
      v19 = 0;
      v46 = 0;
      v50 = 0;
      v27 = 0;
      v48 = 0;
LABEL_61:
      v58 = -6756;
      goto LABEL_62;
    }
    v19 = objc_alloc_init(CUPairedPeer);
    -[CUPairedPeer setIdentifier:](v19, "setIdentifier:", v9);
    v20 = (const void *)*MEMORY[0x1E0CD6A90];
    TypeID = CFStringGetTypeID();
    CFDictionaryGetTypedValue(v18, v20, TypeID, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      -[CUPairedPeer setName:](v19, "setName:", v22);
    v23 = (const void *)*MEMORY[0x1E0CD69B0];
    v24 = CFDataGetTypeID();
    CFDictionaryGetTypedValue(v18, v23, v24, 0);
    v25 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = (__CFString *)OPACKDecodeData(v25, 0, 0);
      if (v27)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = CFStringGetTypeID();
          CFDictionaryGetTypedValue((const __CFDictionary *)v27, CFSTR("model"), v28, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
            -[CUPairedPeer setModel:](v19, "setModel:", v29);
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v27);
          objc_msgSend(v30, "removeObjectForKey:", CFSTR("model"));
          -[CUPairedPeer setInfo:](v19, "setInfo:", v30);

LABEL_31:
          v44 = (const void *)*MEMORY[0x1E0CD70D8];
          v45 = CFDataGetTypeID();
          CFDictionaryGetTypedValue(v18, v44, v45, &v66);
          v46 = (const __CFData *)objc_claimAutoreleasedReturnValue();

          if (v66)
          {
            v42 = 0;
            v50 = 0;
            v48 = 0;
            goto LABEL_48;
          }
          if (v46)
          {
            v47 = OPACKDecodeData(v46, 0, &v66);
            v48 = (const __CFDictionary *)v47;
            if (v66)
            {
              v42 = 0;
              v50 = 0;
              goto LABEL_48;
            }
            if (v47)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v49 = CFDictionaryGetTypeID();
                CFDictionaryGetTypedValue(v48, CFSTR("acl"), v49, 0);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                if (v50)
                  -[CUPairedPeer setAcl:](v19, "setAcl:", v50);
                v51 = CFDataGetTypeID();
                CFDictionaryGetTypedValue(v48, CFSTR("pk"), v51, &v66);
                v52 = (const __CFData *)objc_claimAutoreleasedReturnValue();

                if (v66)
                {
                  v42 = 0;
LABEL_47:
                  v46 = v52;
                  goto LABEL_48;
                }
                if (v52)
                {
                  -[CUPairedPeer setPublicKey:](v19, "setPublicKey:", v52);
                  if ((a4 & 2) != 0)
                  {
                    v53 = CFDataGetTypeID();
                    CFDictionaryGetTypedValue(v48, CFSTR("altIRK"), v53, 0);
                    v54 = objc_claimAutoreleasedReturnValue();

                    if (v54)
                    {
                      -[CUPairedPeer setAltIRK:](v19, "setAltIRK:", v54);
                      v52 = (const __CFData *)v54;
                    }
                    else
                    {
                      v52 = 0;
                    }
                  }
                  v42 = v19;
                  v19 = v42;
                  goto LABEL_47;
                }
                v42 = 0;
                v46 = 0;
                goto LABEL_65;
              }
              v42 = 0;
              v50 = 0;
              goto LABEL_61;
            }
            v42 = 0;
            v50 = 0;
          }
          else
          {
            v42 = 0;
            v50 = 0;
            v48 = 0;
          }
          v58 = -6762;
LABEL_62:
          v66 = v58;
          goto LABEL_48;
        }
      }
    }
    else
    {
      v27 = 0;
    }
    v29 = v22;
    goto LABEL_31;
  }
  v42 = 0;
  v29 = 0;
  v18 = 0;
  v19 = 0;
  v46 = 0;
  v50 = 0;
  v27 = 0;
  v48 = 0;
  v57 = -6708;
LABEL_66:
  v66 = v57;
LABEL_48:
  if (a5)
    *a5 = v66;
  v55 = v42;

  return v55;
}

- (int)savePairedPeer:(id)a3 options:(unint64_t)a4
{
  id v6;
  CUPairingDaemon *v7;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  LODWORD(a4) = -[CUPairingDaemon _savePairedPeer:options:removeAdminAllowed:](v7, "_savePairedPeer:options:removeAdminAllowed:", v6, a4, 0);
  objc_sync_exit(v7);

  return a4;
}

- (int)savePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5
{
  uint64_t v5;
  id v8;
  CUPairingDaemon *v9;

  v5 = a5;
  v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  LODWORD(v5) = -[CUPairingDaemon _savePairedPeer:options:removeAdminAllowed:](v9, "_savePairedPeer:options:removeAdminAllowed:", v8, a4, v5);
  objc_sync_exit(v9);

  return v5;
}

- (int)_savePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5
{
  id v7;
  CUPairedPeer *v8;
  CUPairedPeer *v9;
  CUPairedPeer *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  const __CFDictionary *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  char v33;
  unint64_t v34;
  __CFString *v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  uint64_t v39;
  CFMutableDataRef v40;
  void *v41;
  __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  CFMutableDataRef v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const __CFDictionary *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const __CFDictionary *v62;
  int updated;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSMutableSet *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t m;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t k;
  uint64_t v86;
  void *v87;
  int v88;
  const __CFDictionary *v90;
  CUPairingDaemon *v91;
  uint64_t v92;
  BOOL v93;
  __CFData *v94;
  unint64_t Int64;
  CUPairedPeer *v96;
  void *v97;
  void *v98;
  CUPairedPeer *v99;
  CUPairedPeer *v100;
  __CFString *v101;
  void *v102;
  CUPairedPeer *v103;
  CUPairedPeer *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  int v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v122 = 0;
  objc_msgSend(v7, "identifier");
  v8 = (CUPairedPeer *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v99 = v8;
  if (!v8)
  {
    v103 = 0;
    v100 = 0;
    v35 = 0;
    v40 = 0;
    v97 = 0;
    v98 = 0;
    v13 = 0;
    v41 = 0;
    v42 = 0;
    v24 = 0;
    v38 = 0;
LABEL_102:
    v45 = -6708;
    goto LABEL_109;
  }
  -[CUPairedPeer UUIDString](v8, "UUIDString");
  v8 = (CUPairedPeer *)objc_claimAutoreleasedReturnValue();
  v103 = v8;
  if (!v8)
  {
    v103 = 0;
    v100 = 0;
    v35 = 0;
    v40 = 0;
    v97 = 0;
    v98 = 0;
    v13 = 0;
    v41 = 0;
    v42 = 0;
    v24 = 0;
    v38 = 0;
    v9 = 0;
    goto LABEL_102;
  }
  v93 = a5;
  v91 = self;
  -[CUPairingDaemon _findPairedPeer:options:error:](self, "_findPairedPeer:options:error:", v7);
  v10 = (CUPairedPeer *)(id)objc_claimAutoreleasedReturnValue();
  v100 = v10;
  if (!v10)
  {
    v10 = objc_alloc_init(CUPairedPeer);
    -[CUPairedPeer setIdentifier:](v10, "setIdentifier:", v9);
  }
  v11 = (__CFString *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CUPairedPeer info](v10, "info");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (__CFString *)objc_msgSend(v12, "mutableCopy");

  if (!v13)
    v13 = (__CFString *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v101 = v11;
  v105 = v10;
  objc_msgSend(v7, "info");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    -[__CFString addEntriesFromDictionary:](v13, "addEntriesFromDictionary:", v14);
  v98 = (void *)v14;
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  -[__CFString allKeys](v13, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v119;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v119 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i);
        -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          -[__CFString removeObjectForKey:](v13, "removeObjectForKey:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
    }
    while (v17);
  }

  -[CUPairedPeer acl](v105, "acl");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (const __CFDictionary *)objc_msgSend(v23, "mutableCopy");

  Int64 = CFDictionaryGetInt64(v24, CFSTR("com.apple.admin"), 0);
  if (!v24)
    v24 = (const __CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v102 = v7;
  objc_msgSend(v7, "acl");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
    -[__CFDictionary addEntriesFromDictionary:](v24, "addEntriesFromDictionary:", v25);
  v97 = (void *)v25;
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  -[__CFDictionary allKeys](v24, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v114, v125, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v115;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v115 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * j);
        -[__CFDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v33 = objc_opt_isKindOfClass();

        if ((v33 & 1) != 0)
          -[__CFDictionary removeObjectForKey:](v24, "removeObjectForKey:", v31);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v114, v125, 16);
    }
    while (v28);
  }

  v34 = CFDictionaryGetInt64(v24, CFSTR("com.apple.admin"), 0);
  if (Int64 && !v34 && !v93)
  {
    v8 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v38 = 0;
    v122 = -6773;
    v35 = v101;
    v7 = v102;
    v9 = v105;
    goto LABEL_99;
  }
  v35 = v101;
  v7 = v102;
  v9 = v105;
  if (-[__CFDictionary count](v24, "count"))
    -[__CFString setObject:forKeyedSubscript:](v101, "setObject:forKeyedSubscript:", v24, CFSTR("acl"));
  else
    -[__CFString removeObjectForKey:](v101, "removeObjectForKey:", CFSTR("acl"));
  objc_msgSend(v102, "altIRK");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[CUPairedPeer setAltIRK:](v105, "setAltIRK:", v36);
  }
  else
  {
    -[CUPairedPeer altIRK](v105, "altIRK");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
      goto LABEL_41;
  }
  -[__CFString setObject:forKeyedSubscript:](v101, "setObject:forKeyedSubscript:", v37, CFSTR("altIRK"));

LABEL_41:
  objc_msgSend(v102, "model");
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("model"));
    v39 = objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v38 = (__CFString *)v39;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0;
LABEL_52:
        v45 = -6756;
LABEL_109:
        v122 = v45;
        goto LABEL_99;
      }
    }
    else
    {
      -[CUPairedPeer model](v105, "model");
      v43 = objc_claimAutoreleasedReturnValue();
      if (v43)
        v38 = (__CFString *)v43;
      else
        v38 = &stru_1E25DF9F8;
    }
  }
  -[CUPairedPeer setModel:](v105, "setModel:", v38);
  -[__CFString setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v38, CFSTR("model"));
  objc_msgSend(v102, "name");
  v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("name"));
    v44 = objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      v42 = (__CFString *)v44;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = 0;
        v40 = 0;
        v41 = 0;
        goto LABEL_52;
      }
    }
    else
    {
      -[CUPairedPeer name](v105, "name");
      v46 = objc_claimAutoreleasedReturnValue();
      if (v46)
        v42 = (__CFString *)v46;
      else
        v42 = &stru_1E25DF9F8;
    }
  }
  -[CUPairedPeer setName:](v105, "setName:", v42);
  -[__CFString removeObjectForKey:](v13, "removeObjectForKey:", CFSTR("name"));
  objc_msgSend(v102, "publicKey");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v41 = (void *)v47;
    -[CUPairedPeer setPublicKey:](v105, "setPublicKey:", v47);
  }
  else
  {
    -[CUPairedPeer publicKey](v105, "publicKey");
    v8 = (CUPairedPeer *)objc_claimAutoreleasedReturnValue();
    v41 = v8;
    if (!v8)
    {
      v40 = 0;
      if (v100)
        v45 = -6768;
      else
        v45 = -25300;
      goto LABEL_109;
    }
  }
  -[__CFString setObject:forKeyedSubscript:](v101, "setObject:forKeyedSubscript:", v41, CFSTR("pk"));
  -[CUPairedPeer setInfo:](v105, "setInfo:", v13);
  v48 = OPACKEncoderCreateDataMutable(v13, 0, &v122);
  v40 = v48;
  if (v122)
  {
    v8 = 0;
    goto LABEL_99;
  }
  if (!v48)
  {
    v8 = 0;
    goto LABEL_108;
  }
  v8 = (CUPairedPeer *)OPACKEncoderCreateDataMutable(v101, 0, &v122);
  if (v122)
    goto LABEL_99;
  v96 = v8;
  if (!v8)
  {
LABEL_108:
    v45 = -6762;
    goto LABEL_109;
  }
  v94 = v40;
  v92 = *MEMORY[0x1E0CD6C98];
  v55 = (const __CFDictionary *)CFCreateF(&v122, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v49, v50, v51, v52, v53, v54, *MEMORY[0x1E0CD6C98]);
  v62 = v55;
  if (!v122)
  {
    v90 = v55;
    updated = KeychainUpdateFormatted(v55, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O}", v56, v57, v58, v59, v60, v61, *MEMORY[0x1E0CD69A0]);
    v122 = updated;
    if (updated)
    {
      v62 = v90;
      if (updated != -25300)
        goto LABEL_96;
      v70 = KeychainAddFormatted(0, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v64, v65, v66, v67, v68, v69, v92);
      v62 = v90;
      v122 = v70;
      if (v70)
        goto LABEL_96;
      if (gLogCategory_CUPairingDaemon <= 30
        && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _savePairedPeer:options:removeAdminAllowed:]", 0x1Eu, (uint64_t)"Saved %@\n", v71, v72, v73, v74, (uint64_t)v102);
      }
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v75 = v91->_xpcConnections;
      v82 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
      if (v82)
      {
        v83 = v82;
        v84 = *(_QWORD *)v107;
        do
        {
          for (k = 0; k != v83; ++k)
          {
            if (*(_QWORD *)v107 != v84)
              objc_enumerationMutation(v75);
            v86 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * k);
            if (*(_BYTE *)(v86 + 32))
            {
              objc_msgSend(*(id *)(v86 + 40), "remoteObjectProxy");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "pairedPeerAdded:options:", v105, a4);

            }
          }
          v83 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
        }
        while (v83);
      }
    }
    else
    {
      if (gLogCategory_CUPairingDaemon <= 30
        && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _savePairedPeer:options:removeAdminAllowed:]", 0x1Eu, (uint64_t)"Updated %@\n", v66, v67, v68, v69, (uint64_t)v105);
      }
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v75 = v91->_xpcConnections;
      v76 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
      if (v76)
      {
        v77 = v76;
        v78 = *(_QWORD *)v111;
        do
        {
          for (m = 0; m != v77; ++m)
          {
            if (*(_QWORD *)v111 != v78)
              objc_enumerationMutation(v75);
            v80 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * m);
            if (*(_BYTE *)(v80 + 32))
            {
              objc_msgSend(*(id *)(v80 + 40), "remoteObjectProxy");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "pairedPeerChanged:options:", v105, a4);

            }
          }
          v77 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
        }
        while (v77);
      }
    }

    notify_post("com.apple.pairing.peerChanged");
    v62 = v90;
  }
LABEL_96:
  v9 = v105;
  v35 = v101;
  if (v62)
    CFRelease(v62);
  v7 = v102;
  v40 = v94;
  v8 = v96;
LABEL_99:
  v88 = v122;

  return v88;
}

- (int)removePairedPeer:(id)a3 options:(unint64_t)a4
{
  id v6;
  CUPairingDaemon *v7;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  LODWORD(a4) = -[CUPairingDaemon _removePairedPeer:options:removeAdminAllowed:](v7, "_removePairedPeer:options:removeAdminAllowed:", v6, a4, 0);
  objc_sync_exit(v7);

  return a4;
}

- (int)removePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5
{
  uint64_t v5;
  id v8;
  CUPairingDaemon *v9;

  v5 = a5;
  v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  LODWORD(v5) = -[CUPairingDaemon _removePairedPeer:options:removeAdminAllowed:](v9, "_removePairedPeer:options:removeAdminAllowed:", v8, a4, v5);
  objc_sync_exit(v9);

  return v5;
}

- (int)_removePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableSet *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  int v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[CUPairingDaemon _findPairedPeer:options:error:](self, "_findPairedPeer:options:error:", v7, a4 & 0xFFFFFFFFFFFFFFFDLL, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = v7;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v18 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v9, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
LABEL_22:
    v31 = -6708;
    goto LABEL_20;
  }
  v19 = KeychainDeleteFormatted((uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v11, v12, v13, v14, v15, v16, v17, *MEMORY[0x1E0CD6C98]);
  if (v19)
  {
    v31 = v19;
  }
  else
  {
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _removePairedPeer:options:removeAdminAllowed:]", 0x1Eu, (uint64_t)"Removed %@\n", v20, v21, v22, v23, (uint64_t)v8);
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v24 = self->_xpcConnections;
    v25 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (*(_BYTE *)(v29 + 32))
          {
            objc_msgSend(*(id *)(v29 + 40), "remoteObjectProxy");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "pairedPeerRemoved:options:", v8, a4);

          }
        }
        v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v26);
    }

    notify_post("com.apple.pairing.peerChanged");
    v31 = 0;
  }
LABEL_20:

  return v31;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_rpSelfIRK, 0);
  objc_storeStrong((id *)&self->_homeKitManager, 0);
}

void __58__CUPairingDaemon__findHomeKitExPairedPeer_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__CUPairingDaemon__copyHomeKitExWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __63__CUPairingDaemon__copyHomeKitLocalPairingIDWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __60__CUPairingDaemon_getIdentityWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __36__CUPairingDaemon__rpIdentityUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  int v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v6)
  {
    if (gLogCategory_CUPairingDaemon <= 90
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]_block_invoke", 0x5Au, (uint64_t)"### Self RPIdentity get failed: %{error}\n", v7, v8, v9, v10, (uint64_t)v6);
    }
    goto LABEL_40;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
LABEL_7:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v15);
      if (objc_msgSend(v16, "type") == 1)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v13)
          goto LABEL_7;
        goto LABEL_13;
      }
    }
    v21 = v16;

    if (!v21)
      goto LABEL_20;
    v22 = *(id *)(*(_QWORD *)(a1 + 40) + 24);
    objc_msgSend(v21, "deviceIRKData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v23;
    if (v23)
    {
      v29 = v23;
      v30 = v22;
      v31 = v30;
      if (v29 == v30)
      {

      }
      else
      {
        if (!v30)
        {

          goto LABEL_32;
        }
        v32 = objc_msgSend(v29, "isEqual:", v30);

        if (!v32)
        {
LABEL_32:
          if (gLogCategory_CUPairingDaemon <= 30
            && (gLogCategory_CUPairingDaemon != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
          {
            LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]_block_invoke", 0x1Eu, (uint64_t)"Self RPIdentity IRK changed: %{mask} -> %{mask}\n", v24, v25, v26, v27, (uint64_t)v31);
          }
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), v28);
          notify_post("com.apple.pairing.identityChanged");
LABEL_39:

          goto LABEL_40;
        }
      }
    }
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]_block_invoke", 0x1Eu, (uint64_t)"Self RPIdentity IRK unchanged: %{mask} -> %{mask}\n", v24, v25, v26, v27, (uint64_t)v22);
    }
    goto LABEL_39;
  }
LABEL_13:

LABEL_20:
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]_block_invoke", 0x1Eu, (uint64_t)"Self RPIdentity get failed: no self identity\n", v17, v18, v19, v20, v33);
  }
LABEL_40:

}

uint64_t __54__CUPairingDaemon_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionInvalidated:", *(_QWORD *)(a1 + 40));
}

uint64_t __29__CUPairingDaemon_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __28__CUPairingDaemon__activate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  if (*(_DWORD *)(*(_QWORD *)(result + 32) + 16) != -1)
  {
    v8 = result;
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _activate]_block_invoke", 0x1Eu, (uint64_t)"RPIdentities changed\n", a5, a6, a7, a8, v9);
    }
    return objc_msgSend(*(id *)(v8 + 32), "_rpIdentityUpdate");
  }
  return result;
}

CFMutableStringRef __28__CUPairingDaemon__activate__block_invoke_2(uint64_t a1)
{
  return CUStateDumpWithObject((uint64_t)"CUPairingDaemon", *(void **)(a1 + 32), &gLogCategory_CUPairingDaemon);
}

uint64_t __27__CUPairingDaemon_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

+ (id)sharedPairingDaemon
{
  return (id)gPairingDaemon;
}

@end
