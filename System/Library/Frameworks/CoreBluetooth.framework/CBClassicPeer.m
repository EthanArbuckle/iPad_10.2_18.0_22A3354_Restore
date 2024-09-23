@implementation CBClassicPeer

- (CBClassicPeer)initWithInfo:(id)a3 manager:(id)a4
{
  id v6;
  CBClassicPeer *v7;
  CBClassicPeer *v8;
  uint64_t v9;
  NSHashTable *L2CAPChannels;
  uint64_t v11;
  NSHashTable *RFCOMMChannels;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CBClassicPeer;
  v7 = -[CBPeer initWithInfo:manager:](&v14, sel_initWithInfo_manager_, v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_state = 0;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    L2CAPChannels = v8->_L2CAPChannels;
    v8->_L2CAPChannels = (NSHashTable *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    RFCOMMChannels = v8->_RFCOMMChannels;
    v8->_RFCOMMChannels = (NSHashTable *)v11;

    -[CBPeer setMtuLength:](v8, "setMtuLength:", 672);
    -[CBClassicPeer handlePeerUpdated:](v8, "handlePeerUpdated:", v6);
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CBClassicPeer addressString](self, "addressString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  NSHashTable *L2CAPChannels;
  NSHashTable *RFCOMMChannels;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  CBClassicPeer *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v3 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CBClassicPeer dealloc]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1A82A2000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  L2CAPChannels = self->_L2CAPChannels;
  if (L2CAPChannels)
    -[NSHashTable removeAllObjects](L2CAPChannels, "removeAllObjects");
  RFCOMMChannels = self->_RFCOMMChannels;
  if (RFCOMMChannels)
    -[NSHashTable removeAllObjects](RFCOMMChannels, "removeAllObjects");
  v6.receiver = self;
  v6.super_class = (Class)CBClassicPeer;
  -[CBClassicPeer dealloc](&v6, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_opt_class();
  -[CBPeer identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBClassicPeer name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeer peerStateToString:](self, "peerStateToString:", -[CBClassicPeer internalState](self, "internalState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CBPeer pairingState](self, "pairingState"))
    v7 = CFSTR("Paired");
  else
    v7 = CFSTR("Unpaired");
  -[CBClassicPeer addressString](self, "addressString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CBClassicPeer deviceType](self, "deviceType");
  v10 = -[CBClassicPeer productID](self, "productID");
  v11 = -[CBClassicPeer vendorID](self, "vendorID");
  if (-[CBClassicPeer isAppleDevice](self, "isAppleDevice"))
    v12 = CFSTR(", Apple");
  else
    v12 = &stru_1E5403C08;
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p %@, %@, %@, %@, %@, devType: %d, PID: 0x%04X, VID: 0x%04X%@>"), v15, self, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)importServices:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPSM"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRFCOMMChannelID"));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v9)
        {
          v28[0] = CFSTR("kCBMsgArgServiceUUID");
          objc_msgSend(v8, "objectForKeyedSubscript:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[CBUUID UUIDWithData:](CBUUID, "UUIDWithData:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v28[1] = CFSTR("kCBMsgArgPSM");
          v29[0] = v13;
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPSM"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v29[1] = v14;
          v15 = (void *)MEMORY[0x1E0C99D80];
          v16 = v29;
          v17 = v28;
LABEL_7:
          objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v18);

          goto LABEL_8;
        }
        if (v10)
        {
          v26[0] = CFSTR("kCBMsgArgServiceUUID");
          objc_msgSend(v8, "objectForKeyedSubscript:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[CBUUID UUIDWithData:](CBUUID, "UUIDWithData:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v26[1] = CFSTR("kCBMsgArgRFCOMMChannelID");
          v27[0] = v13;
          objc_msgSend(v8, "objectForKeyedSubscript:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v27[1] = v14;
          v15 = (void *)MEMORY[0x1E0C99D80];
          v16 = v27;
          v17 = v26;
          goto LABEL_7;
        }
LABEL_8:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v5);
  }

  return v21;
}

- (void)sendMsg:(int)a3 args:(id)a4
{
  -[CBClassicPeer sendMsg:requiresConnected:args:](self, "sendMsg:requiresConnected:args:", *(_QWORD *)&a3, 1, a4);
}

- (void)sendMsg:(int)a3 requiresConnected:(BOOL)a4 args:(id)a5
{
  _BOOL4 v5;
  unsigned __int16 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[CBPeer manager](self, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (-[CBClassicPeer state](self, "state") != 2 && v5)
    {
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        -[CBClassicPeer sendMsg:requiresConnected:args:].cold.2();
    }
    if (!v8)
      v8 = (id)MEMORY[0x1E0C9AA70];
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    -[CBPeer identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("kCBMsgArgDeviceUUID"));

    -[CBPeer manager](self, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendMsg:args:", v6, v10);

LABEL_11:
    return;
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    goto LABEL_11;
  -[CBClassicPeer sendMsg:requiresConnected:args:].cold.1();

}

- (void)handleMsg:(int)a3 args:(id)a4
{
  uint64_t v4;
  id v6;
  char v7;
  char **v8;
  const char *v9;
  int64_t v10;
  objc_super v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = 1;
  v8 = &selRef_handleGetPeerState_;
  switch((int)v4)
  {
    case 23:
      v9 = sel_handleL2CAPChannelOpened_;
      v10 = -[CBClassicPeer internalState](self, "internalState");
      goto LABEL_8;
    case 24:
      v9 = sel_handleL2CAPChannelClosed_;
      v10 = -[CBClassicPeer internalState](self, "internalState");
      goto LABEL_8;
    case 41:
      goto LABEL_7;
    case 45:
      -[CBClassicPeer internalState](self, "internalState");
      -[CBClassicPeer handlePeerUpdated:](self, sel_handlePeerUpdated_, v6);
      break;
    case 56:
      v7 = 0;
      v8 = &selRef_handleRFCOMMChannelOpened_;
LABEL_7:
      v9 = *v8;
      v10 = -[CBClassicPeer internalState](self, "internalState");
      if ((v7 & 1) == 0)
        goto LABEL_8;
      goto LABEL_14;
    case 57:
      v9 = sel_handleRFCOMMChannelClosed_;
      v10 = -[CBClassicPeer internalState](self, "internalState");
LABEL_8:
      if (v10 == 2)
      {
LABEL_14:
        objc_msgSend(self, v9, v6);
      }
      else
      {
        if (CBLogInitOnce != -1)
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
          -[CBClassicPeer handleMsg:args:].cold.1();
      }
      break;
    default:
      v11.receiver = self;
      v11.super_class = (Class)CBClassicPeer;
      -[CBPeer handleMsg:args:](&v11, sel_handleMsg_args_, v4, v6);
      break;
  }

}

- (void)handleGetPeerState:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgState"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBClassicPeer handlePeerUpdated:](self, "handlePeerUpdated:", v4);

}

- (void)handlePeerUpdated:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  unsigned __int16 v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  unsigned __int16 v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  unsigned __int16 v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  unsigned __int16 v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  int v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  int v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  int v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  int v70;
  void *v71;
  unsigned int v72;
  uint64_t v73;
  void *v74;
  unsigned int v75;
  void *v76;
  int v77;
  uint64_t v78;
  void *v79;
  int v80;
  void *v81;
  int v82;
  uint64_t v83;
  void *v84;
  int v85;
  void *v86;
  int v87;
  uint64_t v88;
  void *v89;
  int v90;
  void *v91;
  int v92;
  uint64_t v93;
  void *v94;
  int v95;
  void *v96;
  int v97;
  uint64_t v98;
  void *v99;
  int v100;
  void *v101;
  int v102;
  uint64_t v103;
  void *v104;
  int v105;
  void *v106;
  int v107;
  uint64_t v108;
  void *v109;
  int v110;
  void *v111;
  int v112;
  uint64_t v113;
  void *v114;
  int v115;
  void *v116;
  int v117;
  uint64_t v118;
  void *v119;
  int v120;
  void *v121;
  void *v122;
  __int16 v123;
  void *v124;
  unsigned int v125;
  uint64_t v126;
  void *v127;
  unsigned int v128;
  void *v129;
  unsigned int v130;
  uint64_t v131;
  void *v132;
  unsigned int v133;
  void *v134;
  int v135;
  uint64_t v136;
  void *v137;
  int v138;
  void *v139;
  int v140;
  uint64_t v141;
  void *v142;
  int v143;
  void *v144;
  void *v145;
  int v146;
  void *v147;
  void *v148;
  unsigned int v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  int v154;
  void *v155;
  int v156;
  uint64_t v157;
  void *v158;
  int v159;
  void *v160;
  int v161;
  uint64_t v162;
  void *v163;
  int v164;
  void *v165;
  int v166;
  uint64_t v167;
  void *v168;
  int v169;
  void *v170;
  int v171;
  uint64_t v172;
  void *v173;
  int v174;
  void *v175;
  int v176;
  uint64_t v177;
  void *v178;
  int v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  int v184;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  int v189;
  uint64_t v190;
  void *v191;
  uint64_t v192;
  uint64_t v193;
  NSObject *v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  unsigned int v199;
  void *v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  unint64_t v204;
  uint64_t v205;
  void *v206;
  char v207;
  void *v208;
  void *v209;
  char v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  char v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  int v221;
  void *v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  int64_t v226;
  void *v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  int v231;
  uint64_t v232;
  void *v233;
  char v234;
  void *v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  int v239;
  void *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  void *v245;
  NSObject *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  void *v254;
  char v255;
  void *v256;
  void *v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  int v261;
  void *v262;
  uint64_t v263;
  uint64_t v264;
  int v265;
  uint64_t v266;
  uint64_t i;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  _BYTE v289[128];
  uint64_t v290;

  v290 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceType"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[CBClassicPeer deviceType](self, "deviceType");

    if (v9 != v6)
      -[CBClassicPeer setDeviceType:](self, "setDeviceType:", v6);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPID"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = -[CBClassicPeer productID](self, "productID");

    if (v14 != v11)
      -[CBClassicPeer setProductID:](self, "setProductID:", v11);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgVID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgVID"));
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    v19 = -[CBClassicPeer vendorID](self, "vendorID");

    if (v19 != v16)
      -[CBClassicPeer setVendorID:](self, "setVendorID:", v16);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgVIDSource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgVIDSource"));
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    v24 = -[CBClassicPeer vendorIDSource](self, "vendorIDSource");

    if (v24 != v21)
      -[CBClassicPeer setVendorIDSource:](self, "setVendorIDSource:", v21);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgVersion"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "unsignedIntValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgVersion"));
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    v29 = -[CBClassicPeer version](self, "version");

    if (v29 != v26)
      -[CBClassicPeer setVersion:](self, "setVersion:", v26);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsDevFused"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsDevFused"));
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    v34 = -[CBClassicPeer isDevFused](self, "isDevFused");

    if ((_DWORD)v31 != v34)
      -[CBClassicPeer setIsDevFused:](self, "setIsDevFused:", v31);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgColorID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgColorID"));
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    v39 = -[CBClassicPeer colorID](self, "colorID");

    if (v39 != (_DWORD)v36)
      -[CBClassicPeer setColorID:](self, "setColorID:", v36);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgBatteryPercent"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgBatteryPercent"));
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    v44 = -[CBClassicPeer batteryPercentSingle](self, "batteryPercentSingle");

    if (v44 != v41)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgBatteryPercent"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBClassicPeer setBatteryPercentSingle:](self, "setBatteryPercentSingle:", objc_msgSend(v45, "unsignedCharValue"));

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgBatteryPercentLeft"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgBatteryPercentLeft"));
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    v50 = -[CBClassicPeer batteryPercentLeft](self, "batteryPercentLeft");

    if (v50 != (_DWORD)v47)
      -[CBClassicPeer setBatteryPercentLeft:](self, "setBatteryPercentLeft:", v47);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgBatteryPercentRight"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgBatteryPercentRight"));
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    v55 = -[CBClassicPeer batteryPercentRight](self, "batteryPercentRight");

    if (v55 != (_DWORD)v52)
      -[CBClassicPeer setBatteryPercentRight:](self, "setBatteryPercentRight:", v52);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgBatteryPercentCase"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgBatteryPercentCase"));
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    v60 = -[CBClassicPeer batteryPercentCase](self, "batteryPercentCase");

    if (v60 != (_DWORD)v57)
      -[CBClassicPeer setBatteryPercentCase:](self, "setBatteryPercentCase:", v57);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgBatteryPercentCombined"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgBatteryPercentCombined"));
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    v65 = -[CBClassicPeer batteryPercentCombined](self, "batteryPercentCombined");

    if (v65 != (_DWORD)v62)
      -[CBClassicPeer setBatteryPercentCombined:](self, "setBatteryPercentCombined:", v62);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgListeningMode"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgListeningMode"));
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    v70 = -[CBClassicPeer listeningMode](self, "listeningMode");

    if (v70 != v67)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("listeningMode"));
      self->_listeningMode = v67;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("listeningMode"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgListeningConfigs"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "unsignedIntValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgListeningConfigs"));
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    v75 = -[CBClassicPeer listeningModeConfigs](self, "listeningModeConfigs");

    if (v75 != v72)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("listeningModeConfigs"));
      self->_listeningModeConfigs = v72;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("listeningModeConfigs"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgLRDetectionModeEnabled"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgLRDetectionModeEnabled"));
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    v80 = -[CBClassicPeer LRDetectionEnabled](self, "LRDetectionEnabled");

    if (v77 != v80)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("LRDetectionEnabled"));
      self->_LRDetectionEnabled = v77;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("LRDetectionEnabled"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgEQModeEnabled"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgEQModeEnabled"));
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    v85 = -[CBClassicPeer EQConfigEnabled](self, "EQConfigEnabled");

    if (v82 != v85)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("EQConfigEnabled"));
      self->_EQConfigEnabled = v82;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("EQConfigEnabled"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgEQTreble"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v86, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgEQTreble"));
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    v90 = -[CBClassicPeer EQConfigTreble](self, "EQConfigTreble");

    if (v90 != v87)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("EQConfigTreble"));
      self->_EQConfigTreble = v87;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("EQConfigTreble"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgEQMid"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgEQMid"));
  v93 = objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v94 = (void *)v93;
    v95 = -[CBClassicPeer EQConfigMid](self, "EQConfigMid");

    if (v95 != v92)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("EQConfigMid"));
      self->_EQConfigMid = v92;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("EQConfigMid"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgEQBass"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgEQBass"));
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    v99 = (void *)v98;
    v100 = -[CBClassicPeer EQConfigBass](self, "EQConfigBass");

    if (v100 != v97)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("EQConfigBass"));
      self->_EQConfigBass = v97;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("EQConfigBass"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAutoAnswerCalls"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v101, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAutoAnswerCalls"));
  v103 = objc_claimAutoreleasedReturnValue();
  if (v103)
  {
    v104 = (void *)v103;
    v105 = -[CBClassicPeer autoAnswerCalls](self, "autoAnswerCalls");

    if (v102 != v105)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("autoAnswerCalls"));
      self->_autoAnswerCalls = v102;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("autoAnswerCalls"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCrownRotationDirection"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCrownRotationDirection"));
  v108 = objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    v109 = (void *)v108;
    v110 = -[CBClassicPeer crownRotationDirection](self, "crownRotationDirection");

    if (v110 != v107)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("crownRotationDirection"));
      self->_crownRotationDirection = v107;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("crownRotationDirection"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSingleClickMode"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v111, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSingleClickMode"));
  v113 = objc_claimAutoreleasedReturnValue();
  if (v113)
  {
    v114 = (void *)v113;
    v115 = -[CBClassicPeer singleClickMode](self, "singleClickMode");

    if (v115 != v112)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("singleClickMode"));
      self->_singleClickMode = v112;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("singleClickMode"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDoubleClickMode"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend(v116, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDoubleClickMode"));
  v118 = objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v119 = (void *)v118;
    v120 = -[CBClassicPeer doubleClickMode](self, "doubleClickMode");

    if (v120 != v117)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("doubleClickMode"));
      self->_doubleClickMode = v117;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("doubleClickMode"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgClickHoldMode"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  if (v121)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgClickHoldMode"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v122, "unsignedIntValue");

    if (-[CBClassicPeer clickHoldModeLeft](self, "clickHoldModeLeft") != HIBYTE(v123))
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("clickHoldModeLeft"));
      self->_clickHoldModeLeft = HIBYTE(v123);
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("clickHoldModeLeft"));
    }
    if (-[CBClassicPeer clickHoldModeRight](self, "clickHoldModeRight") != v123)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("clickHoldModeRight"));
      self->_clickHoldModeRight = v123;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("clickHoldModeRight"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDoubleClickInterval"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v124, "unsignedIntValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDoubleClickInterval"));
  v126 = objc_claimAutoreleasedReturnValue();
  if (v126)
  {
    v127 = (void *)v126;
    v128 = -[CBClassicPeer doubleClickInterval](self, "doubleClickInterval");

    if (v128 != v125)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("doubleClickInterval"));
      self->_doubleClickInterval = v125;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("doubleClickInterval"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgClickHoldInterval"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = objc_msgSend(v129, "unsignedIntValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgClickHoldInterval"));
  v131 = objc_claimAutoreleasedReturnValue();
  if (v131)
  {
    v132 = (void *)v131;
    v133 = -[CBClassicPeer clickHoldInterval](self, "clickHoldInterval");

    if (v133 != v130)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("clickHoldInterval"));
      self->_clickHoldInterval = v130;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("clickHoldInterval"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgOneBudANCMode"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = objc_msgSend(v134, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgOneBudANCMode"));
  v136 = objc_claimAutoreleasedReturnValue();
  if (v136)
  {
    v137 = (void *)v136;
    v138 = -[CBClassicPeer oneBudANCMode](self, "oneBudANCMode");

    if (v138 != v135)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("oneBudANCMode"));
      self->_oneBudANCMode = v135;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("oneBudANCMode"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSwitchControlMode"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = objc_msgSend(v139, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSwitchControlMode"));
  v141 = objc_claimAutoreleasedReturnValue();
  if (v141)
  {
    v142 = (void *)v141;
    v143 = -[CBClassicPeer switchControlMode](self, "switchControlMode");

    if (v143 != v140)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("switchControlMode"));
      self->_switchControlMode = v140;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("switchControlMode"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDoubleTapAction"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  if (v144)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDoubleTapAction"));
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = objc_msgSend(v145, "unsignedIntValue");

    if (v146 != -[CBClassicPeer doubleTapAction](self, "doubleTapAction"))
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("doubleTapAction"));
      self->_doubleTapAction = v146;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("doubleTapAction"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDoubleTapActionEx"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  if (v147)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDoubleTapActionEx"));
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v148, "unsignedIntValue");

    if (-[CBClassicPeer doubleTapActionLeft](self, "doubleTapActionLeft") != (unsigned __int16)(v149 >> 8))
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("doubleTapActionLeft"));
      self->_doubleTapActionLeft = v149 >> 8;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("doubleTapActionLeft"));
    }
    if (-[CBClassicPeer doubleTapActionRight](self, "doubleTapActionRight") != v149)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("doubleTapActionRight"));
      self->_doubleTapActionRight = v149;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("doubleTapActionRight"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDoubleTapCapability"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = objc_msgSend(v150, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDoubleTapCapability"));
  v152 = objc_claimAutoreleasedReturnValue();
  if (v152)
  {
    v153 = (void *)v152;
    v154 = -[CBClassicPeer doubleTapCapability](self, "doubleTapCapability");

    if (v154 != (_DWORD)v151)
      -[CBClassicPeer setDoubleTapCapability:](self, "setDoubleTapCapability:", v151);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgMicMode"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = objc_msgSend(v155, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgMicMode"));
  v157 = objc_claimAutoreleasedReturnValue();
  if (v157)
  {
    v158 = (void *)v157;
    v159 = -[CBClassicPeer micMode](self, "micMode");

    if (v159 != v156)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("micMode"));
      self->_micMode = v156;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("micMode"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgInEarDetectionEnabled"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = objc_msgSend(v160, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgInEarDetectionEnabled"));
  v162 = objc_claimAutoreleasedReturnValue();
  if (v162)
  {
    v163 = (void *)v162;
    v164 = -[CBClassicPeer inEarDetectionEnabled](self, "inEarDetectionEnabled");

    if (v161 != v164)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inEarDetectionEnabled"));
      self->_inEarDetectionEnabled = v161;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inEarDetectionEnabled"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSmartRoutingSupported"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = objc_msgSend(v165, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSmartRoutingSupported"));
  v167 = objc_claimAutoreleasedReturnValue();
  if (v167)
  {
    v168 = (void *)v167;
    v169 = -[CBClassicPeer smartRoutingSupported](self, "smartRoutingSupported");

    if (v166 != v169)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("smartRoutingSupported"));
      self->_smartRoutingSupported = v166;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("smartRoutingSupported"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSmartRoutingEnabled"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = objc_msgSend(v170, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSmartRoutingEnabled"));
  v172 = objc_claimAutoreleasedReturnValue();
  if (v172)
  {
    v173 = (void *)v172;
    v174 = -[CBClassicPeer smartRoutingEnabled](self, "smartRoutingEnabled");

    if (v174 != v171)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("smartRoutingEnabled"));
      self->_smartRoutingEnabled = v171;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("smartRoutingEnabled"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRemoteTimeSyncEnabled"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = objc_msgSend(v175, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRemoteTimeSyncEnabled"));
  v177 = objc_claimAutoreleasedReturnValue();
  if (v177)
  {
    v178 = (void *)v177;
    v179 = -[CBClassicPeer remoteTimeSyncEnabled](self, "remoteTimeSyncEnabled");

    if (v176 != v179)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("remoteTimeSyncEnabled"));
      self->_remoteTimeSyncEnabled = v176;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("remoteTimeSyncEnabled"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPrimaryInEarStatus"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = objc_msgSend(v180, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPrimaryInEarStatus"));
  v182 = objc_claimAutoreleasedReturnValue();
  if (v182)
  {
    v183 = (void *)v182;
    v184 = -[CBClassicPeer primaryInEarStatus](self, "primaryInEarStatus");

    if (v184 != (_DWORD)v181)
      -[CBClassicPeer setPrimaryInEarStatus:](self, "setPrimaryInEarStatus:", v181);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSecondaryInEarStatus"));
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = objc_msgSend(v185, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSecondaryInEarStatus"));
  v187 = objc_claimAutoreleasedReturnValue();
  if (v187)
  {
    v188 = (void *)v187;
    v189 = -[CBClassicPeer secondaryInEarStatus](self, "secondaryInEarStatus");

    if (v189 != (_DWORD)v186)
      -[CBClassicPeer setSecondaryInEarStatus:](self, "setSecondaryInEarStatus:", v186);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServices"));
  v190 = objc_claimAutoreleasedReturnValue();
  if (v190)
  {
    -[CBClassicPeer importServices:](self, "importServices:", v190);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer setServices:](self, "setServices:", v191);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSDPRecordData"));
  v192 = objc_claimAutoreleasedReturnValue();
  if (v192)
    -[CBClassicPeer setSdpRecordData:](self, "setSdpRecordData:", v192);
  v283 = (void *)v192;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAACPCapabilityBits"));
  v193 = objc_claimAutoreleasedReturnValue();
  if (v193)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v194 = (id)CBLogComponent;
    if (os_log_type_enabled(v194, OS_LOG_TYPE_DEBUG))
      -[CBClassicPeer handlePeerUpdated:].cold.2(self, v193, v194);

    -[CBClassicPeer setAacpCapabilityBits:](self, "setAacpCapabilityBits:", v193);
  }
  v282 = (void *)v193;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAppleFeatureBitMask"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = objc_msgSend(v195, "unsignedLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAppleFeatureBitMask"));
  v197 = objc_claimAutoreleasedReturnValue();
  if (v197)
  {
    v198 = (void *)v197;
    v199 = -[CBClassicPeer appleFeatureBitMask](self, "appleFeatureBitMask");

    if (v199 != (_DWORD)v196)
      -[CBClassicPeer setAppleFeatureBitMask:](self, "setAppleFeatureBitMask:", v196);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgExtendedAppleFeatureBitMask"));
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = objc_msgSend(v200, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgExtendedAppleFeatureBitMask"));
  v202 = objc_claimAutoreleasedReturnValue();
  if (v202)
  {
    v203 = (void *)v202;
    v204 = -[CBClassicPeer appleExtendedFeatureBitMask](self, "appleExtendedFeatureBitMask");

    if (v204 != v201)
      -[CBClassicPeer setAppleExtendedFeatureBitMask:](self, "setAppleExtendedFeatureBitMask:", v201);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRssi"));
  v205 = objc_claimAutoreleasedReturnValue();
  if (v205)
  {
    -[CBClassicPeer RSSI](self, "RSSI");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = objc_msgSend(v206, "isEqualToNumber:", v205);

    if ((v207 & 1) == 0)
      -[CBClassicPeer setRSSI:](self, "setRSSI:", v205);
  }
  v281 = (void *)v205;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSerialNumber"));
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  if (v208)
  {
    -[CBClassicPeer serialNumber](self, "serialNumber");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    v210 = objc_msgSend(v208, "isEqualToString:", v209);

    if ((v210 & 1) == 0)
      -[CBClassicPeer setSerialNumber:](self, "setSerialNumber:", v208);
  }
  v280 = v208;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgTrustedUID"));
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = v211;
  if (v211)
  {
    objc_msgSend(v211, "UUIDString");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer trustedUID](self, "trustedUID");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "UUIDString");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    v216 = objc_msgSend(v213, "isEqualToString:", v215);

    if ((v216 & 1) == 0)
      -[CBClassicPeer setTrustedUID:](self, "setTrustedUID:", v212);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsIncoming"));
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v218 = objc_msgSend(v217, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsIncoming"));
  v219 = objc_claimAutoreleasedReturnValue();
  if (v219)
  {
    v220 = (void *)v219;
    v221 = -[CBClassicPeer isIncoming](self, "isIncoming");

    if ((_DWORD)v218 != v221)
      -[CBClassicPeer setIsIncoming:](self, "setIsIncoming:", v218);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgInternalState"));
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v223 = objc_msgSend(v222, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgInternalState"));
  v224 = objc_claimAutoreleasedReturnValue();
  if (v224)
  {
    v225 = (void *)v224;
    v226 = -[CBClassicPeer internalState](self, "internalState");

    if (v226 != v223)
      -[CBClassicPeer setInternalState:](self, "setInternalState:", v223);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionHandle"));
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v228 = objc_msgSend(v227, "unsignedShortValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionHandle"));
  v229 = objc_claimAutoreleasedReturnValue();
  if (v229)
  {
    v230 = (void *)v229;
    v231 = -[CBClassicPeer connectionHandle](self, "connectionHandle");

    if (v231 != (_DWORD)v228)
      -[CBClassicPeer setConnectionHandle:](self, "setConnectionHandle:", v228);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAddressString"));
  v232 = objc_claimAutoreleasedReturnValue();
  if (v232)
  {
    -[CBClassicPeer addressString](self, "addressString");
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    v234 = objc_msgSend(v233, "isEqualToString:", v232);

    if ((v234 & 1) == 0)
      -[CBClassicPeer setAddressString:](self, "setAddressString:", v232);
  }
  v278 = (void *)v232;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgModesSupported"));
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v236 = objc_msgSend(v235, "unsignedCharValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgModesSupported"));
  v237 = objc_claimAutoreleasedReturnValue();
  if (v237)
  {
    v238 = (void *)v237;
    v239 = -[CBClassicPeer modeSupported](self, "modeSupported");

    if (v239 != (_DWORD)v236)
      -[CBClassicPeer setModeSupported:](self, "setModeSupported:", v236);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgName"));
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v241 = (uint64_t)v240;
  v284 = (void *)v190;
  if (v240 && !objc_msgSend(v240, "length"))
  {

    v241 = 0;
    -[CBClassicPeer name](self, "name");
    v245 = (void *)objc_claimAutoreleasedReturnValue();

    if (v245)
    {
LABEL_165:
      if (!v241)
        goto LABEL_174;
      goto LABEL_172;
    }
  }
  else
  {
    -[CBClassicPeer name](self, "name");
    v242 = objc_claimAutoreleasedReturnValue();
    v243 = v241 | v242;

    if (v243)
      goto LABEL_165;
  }
  -[CBClassicPeer addressString](self, "addressString");
  v244 = (void *)objc_claimAutoreleasedReturnValue();

  if (v244)
  {
    -[CBClassicPeer addressString](self, "addressString");
    v241 = objc_claimAutoreleasedReturnValue();
    goto LABEL_165;
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v246 = (id)CBLogComponent;
  if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
    -[CBClassicPeer handlePeerUpdated:].cold.1(v246, v247, v248, v249, v250, v251, v252, v253);

  v241 = (uint64_t)&stru_1E5403C08;
LABEL_172:
  -[CBClassicPeer name](self, "name");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v255 = objc_msgSend((id)v241, "isEqual:", v254);

  if ((v255 & 1) == 0)
  {
    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("name"));
    objc_storeStrong((id *)&self->_name, (id)v241);
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("name"));
  }
LABEL_174:
  v277 = (void *)v241;
  objc_msgSend(v4, "objectForKey:", CFSTR("kCBMsgArgModelIdentifier"));
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  if (v256)
  {
    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("appleModelIdentifier"));
    objc_storeStrong((id *)&self->_appleModelIdentifier, v256);
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("appleModelIdentifier"));
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsConnectedOverUSB"));
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v258 = objc_msgSend(v257, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsConnectedOverUSB"));
  v259 = objc_claimAutoreleasedReturnValue();
  if (v259)
  {
    v260 = (void *)v259;
    v261 = -[CBClassicPeer isConnectedOverUSB](self, "isConnectedOverUSB");

    if ((_DWORD)v258 != v261)
      -[CBClassicPeer setIsConnectedOverUSB:](self, "setIsConnectedOverUSB:", v258);
  }
  v279 = v212;
  v287 = 0u;
  v288 = 0u;
  v285 = 0u;
  v286 = 0u;
  -[CBClassicPeer services](self, "services", v256);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v263 = objc_msgSend(v262, "countByEnumeratingWithState:objects:count:", &v285, v289, 16);
  if (v263)
  {
    v264 = v263;
    v265 = 0;
    v266 = *(_QWORD *)v286;
    do
    {
      for (i = 0; i != v264; ++i)
      {
        if (*(_QWORD *)v286 != v266)
          objc_enumerationMutation(v262);
        objc_msgSend(*(id *)(*((_QWORD *)&v285 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceUUID"));
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v268, "UUIDString");
        v269 = (void *)objc_claimAutoreleasedReturnValue();

        v265 |= objc_msgSend(CFSTR("7221EC74-0BAD-4D01-8F77-997B2BE0722A"), "isEqualToString:", v269);
      }
      v264 = objc_msgSend(v262, "countByEnumeratingWithState:objects:count:", &v285, v289, 16);
    }
    while (v264);
  }
  else
  {
    LOBYTE(v265) = 0;
  }

  -[CBClassicPeer setIsAppleAccessoryServer:](self, "setIsAppleAccessoryServer:", v265 & 1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRemotePANStatus"));
  v270 = (void *)objc_claimAutoreleasedReturnValue();

  if (v270)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRemotePANStatus"));
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer setPanEnabled:](self, "setPanEnabled:", objc_msgSend(v271, "BOOLValue"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgFileBrowsingStatus"));
  v272 = (void *)objc_claimAutoreleasedReturnValue();

  if (v272)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgFileBrowsingStatus"));
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer setBrowsingEnabled:](self, "setBrowsingEnabled:", objc_msgSend(v273, "BOOLValue"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgObjectPushStatus"));
  v274 = (void *)objc_claimAutoreleasedReturnValue();

  if (v274)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgObjectPushStatus"));
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer setObjectPushEnabled:](self, "setObjectPushEnabled:", objc_msgSend(v275, "BOOLValue"));

  }
}

- (void)handleSuccessfulConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsLinkEncrypted"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionTransport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsIncoming"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSDPRecordData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[CBClassicPeer setSdpRecordData:](self, "setSdpRecordData:", v8);
  if (v7)
  {
    -[CBClassicPeer importServices:](self, "importServices:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer setServices:](self, "setServices:", v9);

  }
  -[CBPeer setIsLinkEncrypted:](self, "setIsLinkEncrypted:", objc_msgSend(v10, "BOOLValue"));
  -[CBPeer setConnectedTransport:](self, "setConnectedTransport:", objc_msgSend(v5, "unsignedIntegerValue"));
  -[CBClassicPeer setIsIncoming:](self, "setIsIncoming:", objc_msgSend(v6, "BOOLValue"));
  -[CBClassicPeer setState:](self, "setState:", 2);

}

- (void)handleFailedConnection
{
  -[CBClassicPeer setState:](self, "setState:", 0);
}

- (void)handleDisconnection
{
  -[CBClassicPeer setRSSI:](self, "setRSSI:", 0);
  -[CBClassicPeer setState:](self, "setState:", 0);
  -[CBPeer setIsLinkEncrypted:](self, "setIsLinkEncrypted:", 0);
}

- (void)handleL2CAPChannelOpened:(id)a3
{
  id v4;
  void *v5;
  CBL2CAPChannel *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  CBL2CAPChannel *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    {
      -[CBClassicPeer handleL2CAPChannelOpened:].cold.1();
      v6 = 0;
      -[CBClassicPeer connectL2CAPCallback](self, "connectL2CAPCallback");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_13;
    }
    else
    {
      v6 = 0;
      -[CBClassicPeer connectL2CAPCallback](self, "connectL2CAPCallback");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_13;
    }
    goto LABEL_12;
  }
  v6 = -[CBL2CAPChannel initWithPeer:info:]([CBL2CAPChannel alloc], "initWithPeer:info:", self, v4);
  objc_msgSend(v4, "objectForKey:", CFSTR("kCBMsgArgPSM"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedCharValue");

  -[CBClassicPeer serviceForPSM:](self, "serviceForPSM:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBL2CAPChannel setServiceUUID:](v6, "setServiceUUID:", v11);

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v12 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315394;
    v18 = "-[CBClassicPeer handleL2CAPChannelOpened:]";
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1A82A2000, v12, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v17, 0x16u);
  }
  -[CBClassicPeer L2CAPChannels](self, "L2CAPChannels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v6);

  -[CBClassicPeer connectL2CAPCallback](self, "connectL2CAPCallback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
LABEL_12:
    -[CBClassicPeer connectL2CAPCallback](self, "connectL2CAPCallback");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CBL2CAPChannel *, uint64_t))v15)[2](v15, v6, objc_msgSend(v5, "code"));

  }
LABEL_13:

}

- (void)handleL2CAPChannelClosed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(v4, "errorWithInfo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kCBMsgArgPSM"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedShortValue");
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v9 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBClassicPeer handleL2CAPChannelClosed:].cold.1(v8, (uint64_t)v6, v9);
  -[CBClassicPeer channelWithPSM:](self, "channelWithPSM:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBClassicPeer disconnectL2CAPCallback](self, "disconnectL2CAPCallback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CBClassicPeer disconnectL2CAPCallback](self, "disconnectL2CAPCallback");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v10, objc_msgSend(v6, "code"));

  }
  -[CBClassicPeer L2CAPChannels](self, "L2CAPChannels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObject:", v10);

}

- (id)channelWithPSM:(unsigned __int16)a3
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CBClassicPeer L2CAPChannels](self, "L2CAPChannels", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "PSM") == v3)
        {
          v11 = v9;

          return v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    -[CBClassicPeer channelWithPSM:].cold.1();
  return 0;
}

- (void)handleRFCOMMChannelOpened:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CBRFCOMMChannel *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  CBRFCOMMChannel *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v6 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    {
      -[CBClassicPeer handleRFCOMMChannelOpened:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
      v14 = 0;
      -[CBClassicPeer connectRFCOMMCallback](self, "connectRFCOMMCallback");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_13;
    }
    else
    {
      v14 = 0;
      -[CBClassicPeer connectRFCOMMCallback](self, "connectRFCOMMCallback");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_13;
    }
    goto LABEL_12;
  }
  v14 = -[CBRFCOMMChannel initWithPeer:info:]([CBRFCOMMChannel alloc], "initWithPeer:info:", self, v4);
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v16 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315394;
    v22 = "-[CBClassicPeer handleRFCOMMChannelOpened:]";
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_1A82A2000, v16, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v21, 0x16u);
  }
  -[CBClassicPeer RFCOMMChannels](self, "RFCOMMChannels");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v14);

  -[CBClassicPeer connectRFCOMMCallback](self, "connectRFCOMMCallback");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
LABEL_12:
    -[CBClassicPeer connectRFCOMMCallback](self, "connectRFCOMMCallback");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CBRFCOMMChannel *, uint64_t))v19)[2](v19, v14, objc_msgSend(v5, "code"));

  }
LABEL_13:

}

- (void)handleRFCOMMChannelClosed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(v4, "errorWithInfo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kCBMsgArgRFCOMMChannelID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedCharValue");
  -[CBClassicPeer channelWithID:](self, "channelWithID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v10 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315650;
    v15 = "-[CBClassicPeer handleRFCOMMChannelClosed:]";
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1A82A2000, v10, OS_LOG_TYPE_DEFAULT, "%s %@ and result: %@", (uint8_t *)&v14, 0x20u);
  }
  -[CBClassicPeer disconnectRFCOMMCallback](self, "disconnectRFCOMMCallback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CBClassicPeer disconnectRFCOMMCallback](self, "disconnectRFCOMMCallback");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v9, objc_msgSend(v6, "code"));

  }
  -[CBClassicPeer RFCOMMChannels](self, "RFCOMMChannels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObject:", v9);

}

- (id)channelWithID:(unsigned __int8)a3
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CBClassicPeer RFCOMMChannels](self, "RFCOMMChannels", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "channelID") == v3)
        {
          v11 = v9;

          return v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    -[CBClassicPeer channelWithID:].cold.1();
  return 0;
}

- (void)setOrphan
{
  -[CBPeer setManager:](self, "setManager:", 0);
}

- (id)service:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CBClassicPeer services](self, "services", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceUUID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v13 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)serviceForPSM:(unsigned __int16)a3
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CBClassicPeer services](self, "services", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPSM"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedShortValue");

        if (v11 == v3)
        {
          v12 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (unsigned)psmForService:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int16 v6;

  -[CBClassicPeer service:](self, "service:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPSM"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedShortValue");

    return v6;
  }
  else
  {

    return 0;
  }
}

- (id)serviceForRFCOMMChannelID:(unsigned __int8)a3
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CBClassicPeer services](self, "services", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRFCOMMChannelID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedCharValue");

        if (v11 == v3)
        {
          v12 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (unsigned)rfcommChannelIDForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  if (v4
    && (-[CBClassicPeer service:](self, "service:", v4), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRFCOMMChannelID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedShortValue");

    return v8;
  }
  else
  {

    return 0;
  }
}

- (void)setListeningMode:(unsigned __int8)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer listeningMode](self, "listeningMode") != a3)
  {
    v7 = CFSTR("kCBMsgArgListeningMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", (char)a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("listeningMode"));
    self->_listeningMode = a3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("listeningMode"));
  }
}

- (void)setListeningModeConfigs:(unsigned int)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer listeningModeConfigs](self, "listeningModeConfigs") != a3)
  {
    v7 = CFSTR("kCBMsgArgListeningConfigs");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", (char)a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("listeningModeConfigs"));
    self->_listeningModeConfigs = a3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("listeningModeConfigs"));
  }
}

- (void)setLRDetectionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer LRDetectionEnabled](self, "LRDetectionEnabled") != a3)
  {
    v7 = CFSTR("kCBMsgArgLRDetectionModeEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("LRDetectionEnabled"));
    self->_LRDetectionEnabled = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("LRDetectionEnabled"));
  }
}

- (void)setEQConfigEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v3 = a3;
  v11[4] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer EQConfigEnabled](self, "EQConfigEnabled") != a3)
  {
    v10[0] = CFSTR("kCBMsgArgEQModeEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v10[1] = CFSTR("kCBMsgArgEQTreble");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigTreble](self, "EQConfigTreble"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    v10[2] = CFSTR("kCBMsgArgEQMid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigMid](self, "EQConfigMid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    v10[3] = CFSTR("kCBMsgArgEQBass");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigBass](self, "EQConfigBass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v9);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("EQConfigEnabled"));
    self->_EQConfigEnabled = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("EQConfigEnabled"));
  }
}

- (void)setEQConfigTreble:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v3 = a3;
  v11[4] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer EQConfigTreble](self, "EQConfigTreble") != a3)
  {
    v10[0] = CFSTR("kCBMsgArgEQModeEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CBClassicPeer EQConfigEnabled](self, "EQConfigEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v10[1] = CFSTR("kCBMsgArgEQTreble");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    v10[2] = CFSTR("kCBMsgArgEQMid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigMid](self, "EQConfigMid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    v10[3] = CFSTR("kCBMsgArgEQBass");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigBass](self, "EQConfigBass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v9);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("EQConfigTreble"));
    self->_EQConfigTreble = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("EQConfigTreble"));
  }
}

- (void)setEQConfigMid:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v3 = a3;
  v11[4] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer EQConfigMid](self, "EQConfigMid") != a3)
  {
    v10[0] = CFSTR("kCBMsgArgEQModeEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CBClassicPeer EQConfigEnabled](self, "EQConfigEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v10[1] = CFSTR("kCBMsgArgEQTreble");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigTreble](self, "EQConfigTreble"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    v10[2] = CFSTR("kCBMsgArgEQMid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    v10[3] = CFSTR("kCBMsgArgEQBass");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigBass](self, "EQConfigBass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v9);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("EQConfigMid"));
    self->_EQConfigMid = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("EQConfigMid"));
  }
}

- (void)setEQConfigBass:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v3 = a3;
  v11[4] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer EQConfigBass](self, "EQConfigBass") != a3)
  {
    v10[0] = CFSTR("kCBMsgArgEQModeEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CBClassicPeer EQConfigEnabled](self, "EQConfigEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v10[1] = CFSTR("kCBMsgArgEQTreble");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigTreble](self, "EQConfigTreble"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    v10[2] = CFSTR("kCBMsgArgEQMid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigMid](self, "EQConfigMid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    v10[3] = CFSTR("kCBMsgArgEQBass");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v9);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("EQConfigBass"));
    self->_EQConfigBass = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("EQConfigBass"));
  }
}

- (void)setAutoAnswerCalls:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer autoAnswerCalls](self, "autoAnswerCalls") != a3)
  {
    v7 = CFSTR("kCBMsgArgAutoAnswerCalls");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("autoAnswerCalls"));
    self->_autoAnswerCalls = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("autoAnswerCalls"));
  }
}

- (void)setCrownRotationDirection:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer crownRotationDirection](self, "crownRotationDirection") != a3)
  {
    v7 = CFSTR("kCBMsgArgCrownRotationDirection");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("crownRotationDirection"));
    self->_crownRotationDirection = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("crownRotationDirection"));
  }
}

- (void)setSingleClickMode:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer singleClickMode](self, "singleClickMode") != a3)
  {
    v7 = CFSTR("kCBMsgArgSingleClickMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("singleClickMode"));
    self->_singleClickMode = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("singleClickMode"));
  }
}

- (void)setDoubleClickMode:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer doubleClickMode](self, "doubleClickMode") != a3)
  {
    v7 = CFSTR("kCBMsgArgDoubleClickMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("doubleClickMode"));
    self->_doubleClickMode = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("doubleClickMode"));
  }
}

- (void)setClickHoldModeLeft:(unsigned __int8)a3
{
  int v3;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer clickHoldModeLeft](self, "clickHoldModeLeft") != a3)
  {
    v5 = -[CBClassicPeer clickHoldModeRight](self, "clickHoldModeRight");
    v8 = CFSTR("kCBMsgArgClickHoldMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5 | (v3 << 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v7);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("clickHoldModeLeft"));
    self->_clickHoldModeLeft = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("clickHoldModeLeft"));
  }
}

- (void)setClickHoldModeRight:(unsigned __int8)a3
{
  int v3;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer clickHoldModeRight](self, "clickHoldModeRight") != a3)
  {
    v5 = -[CBClassicPeer clickHoldModeLeft](self, "clickHoldModeLeft");
    v8 = CFSTR("kCBMsgArgClickHoldMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3 | (v5 << 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v7);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("clickHoldModeRight"));
    self->_clickHoldModeRight = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("clickHoldModeRight"));
  }
}

- (void)setDoubleClickInterval:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = *(_QWORD *)&a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer doubleClickInterval](self, "doubleClickInterval") != a3)
  {
    v7 = CFSTR("kCBMsgArgDoubleClickInterval");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("doubleClickInterval"));
    self->_doubleClickInterval = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("doubleClickInterval"));
  }
}

- (void)setClickHoldInterval:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = *(_QWORD *)&a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer clickHoldInterval](self, "clickHoldInterval") != a3)
  {
    v7 = CFSTR("kCBMsgArgClickHoldInterval");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("clickHoldInterval"));
    self->_clickHoldInterval = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("clickHoldInterval"));
  }
}

- (void)setOneBudANCMode:(unsigned __int8)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer oneBudANCMode](self, "oneBudANCMode") != a3)
  {
    v7 = CFSTR("kCBMsgArgOneBudANCMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", (char)a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("oneBudANCMode"));
    self->_oneBudANCMode = a3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("oneBudANCMode"));
  }
}

- (void)setSwitchControlMode:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer switchControlMode](self, "switchControlMode") != a3)
  {
    v7 = CFSTR("kCBMsgArgSwitchControlMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("switchControlMode"));
    self->_switchControlMode = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("switchControlMode"));
  }
}

- (void)setDoubleTapAction:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer doubleTapAction](self, "doubleTapAction") != a3)
  {
    v7 = CFSTR("kCBMsgArgDoubleTapAction");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("doubleTapAction"));
    self->_doubleTapAction = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("doubleTapAction"));
  }
}

- (void)setDoubleTapActionLeft:(unsigned __int16)a3
{
  int v3;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer doubleTapActionLeft](self, "doubleTapActionLeft") != a3)
  {
    v5 = -[CBClassicPeer doubleTapActionRight](self, "doubleTapActionRight");
    v8 = CFSTR("kCBMsgArgDoubleTapActionEx");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5 | (v3 << 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v7);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("doubleTapActionLeft"));
    self->_doubleTapActionLeft = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("doubleTapActionLeft"));
  }
}

- (void)setDoubleTapActionRight:(unsigned __int16)a3
{
  int v3;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer doubleTapActionRight](self, "doubleTapActionRight") != a3)
  {
    v5 = -[CBClassicPeer doubleTapActionLeft](self, "doubleTapActionLeft");
    v8 = CFSTR("kCBMsgArgDoubleTapActionEx");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3 | (v5 << 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v7);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("doubleTapActionRight"));
    self->_doubleTapActionRight = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("doubleTapActionRight"));
  }
}

- (void)setMicMode:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer micMode](self, "micMode") != a3)
  {
    v7 = CFSTR("kCBMsgArgMicMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("micMode"));
    self->_micMode = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("micMode"));
  }
}

- (void)setInEarDetectionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer inEarDetectionEnabled](self, "inEarDetectionEnabled") != a3)
  {
    v7 = CFSTR("kCBMsgArgInEarDetectionEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inEarDetectionEnabled"));
    self->_inEarDetectionEnabled = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inEarDetectionEnabled"));
  }
}

- (void)setSmartRoutingEnabled:(unsigned __int8)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer smartRoutingEnabled](self, "smartRoutingEnabled") != a3)
  {
    v7 = CFSTR("kCBMsgArgSmartRoutingEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", (char)a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("smartRoutingEnabled"));
    self->_smartRoutingEnabled = a3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("smartRoutingEnabled"));
  }
}

- (void)setSmartRoutingSupported:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer smartRoutingSupported](self, "smartRoutingSupported") != a3)
  {
    v7 = CFSTR("kCBMsgArgSmartRoutingSupported");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("smartRoutingSupported"));
    self->_smartRoutingSupported = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("smartRoutingSupported"));
  }
}

- (void)setRemoteTimeSyncEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer remoteTimeSyncEnabled](self, "remoteTimeSyncEnabled") != a3)
  {
    v7 = CFSTR("kCBMsgArgRemoteTimeSyncEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("remoteTimeSyncEnabled"));
    self->_remoteTimeSyncEnabled = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("remoteTimeSyncEnabled"));
  }
}

- (unsigned)getConnectedServices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (-[CBClassicPeer internalState](self, "internalState") == 2)
  {
    -[CBPeer manager](self, "manager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("kCBMsgArgDeviceUUID");
    -[CBPeer identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendSyncMsg:args:", 58, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectedServices"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntValue");

  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v9 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBClassicPeer getConnectedServices].cold.1(v9, self);
    return 0;
  }
  return v8;
}

- (BOOL)isAppleDevice
{
  if (-[CBClassicPeer vendorIDSource](self, "vendorIDSource") == 2
    && -[CBClassicPeer vendorID](self, "vendorID") == 1452)
  {
    return 1;
  }
  if (-[CBClassicPeer vendorID](self, "vendorID") == 76)
    return 1;
  if (-[CBPeer pairingState](self, "pairingState") == 2)
    return 1;
  return -[CBPeer pairingState](self, "pairingState") == 3;
}

- (BOOL)isiPhone
{
  int v3;

  v3 = -[CBClassicPeer deviceType](self, "deviceType");
  return (v3 == 12 || v3 == 2) && -[CBClassicPeer isAppleDevice](self, "isAppleDevice");
}

- (BOOL)isiPad
{
  _BOOL4 v3;

  v3 = -[CBClassicPeer isAppleDevice](self, "isAppleDevice");
  if (v3)
    LOBYTE(v3) = -[CBClassicPeer deviceType](self, "deviceType") == 29;
  return v3;
}

- (BOOL)isMac
{
  int v3;

  v3 = -[CBClassicPeer deviceType](self, "deviceType");
  return ((v3 - 7) < 4 || v3 == 1) && -[CBClassicPeer isAppleDevice](self, "isAppleDevice");
}

- (BOOL)isMultiBatteryDevice
{
  unsigned int v3;
  BOOL result;

  result = 0;
  if (-[CBClassicPeer isAppleDevice](self, "isAppleDevice"))
  {
    v3 = -[CBClassicPeer productID](self, "productID") - 8194;
    if (v3 < 0x15 && ((0x11B201u >> v3) & 1) != 0)
      return 1;
    if (!-[CBClassicPeer batteryPercentSingle](self, "batteryPercentSingle")
      && (-[CBClassicPeer batteryPercentCase](self, "batteryPercentCase")
       || -[CBClassicPeer batteryPercentLeft](self, "batteryPercentLeft")
       || -[CBClassicPeer batteryPercentRight](self, "batteryPercentRight")))
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)isReportingBatteryPercent
{
  if (!-[CBClassicPeer isMultiBatteryDevice](self, "isMultiBatteryDevice"))
    return -[CBClassicPeer batteryPercentSingle](self, "batteryPercentSingle") != 0;
  if (-[CBClassicPeer batteryPercentLeft](self, "batteryPercentLeft"))
    return 1;
  if (-[CBClassicPeer batteryPercentRight](self, "batteryPercentRight"))
    return 1;
  return -[CBClassicPeer batteryPercentCase](self, "batteryPercentCase") != 0;
}

- (BOOL)isGameController
{
  return -[CBClassicPeer deviceType](self, "deviceType") == 26
      || -[CBClassicPeer isSonyGameController](self, "isSonyGameController")
      || -[CBClassicPeer isXboxGameController](self, "isXboxGameController");
}

- (BOOL)isSonyGameController
{
  if (-[CBClassicPeer vendorIDSource](self, "vendorIDSource") != 2
    || -[CBClassicPeer vendorID](self, "vendorID") != 1356)
  {
    return 0;
  }
  if (-[CBClassicPeer productID](self, "productID") == 1476
    || -[CBClassicPeer productID](self, "productID") == 2508
    || -[CBClassicPeer productID](self, "productID") == 3302
    || -[CBClassicPeer productID](self, "productID") == 3570
    || -[CBClassicPeer productID](self, "productID") == 3653)
  {
    return 1;
  }
  return -[CBClassicPeer productID](self, "productID") == 3654;
}

- (BOOL)isXboxGameController
{
  if (-[CBClassicPeer vendorIDSource](self, "vendorIDSource") != 2
    || -[CBClassicPeer vendorID](self, "vendorID") != 1118)
  {
    return 0;
  }
  if (-[CBClassicPeer productID](self, "productID") == 765
    || -[CBClassicPeer productID](self, "productID") == 2828
    || -[CBClassicPeer productID](self, "productID") == 2818)
  {
    return 1;
  }
  return -[CBClassicPeer productID](self, "productID") == 2821;
}

- (BOOL)isNintendoGameController
{
  if (-[CBClassicPeer vendorIDSource](self, "vendorIDSource") != 2
    || -[CBClassicPeer vendorID](self, "vendorID") != 1406)
  {
    return 0;
  }
  if (-[CBClassicPeer productID](self, "productID") == 8198)
    return 1;
  if (-[CBClassicPeer productID](self, "productID") == 8199)
    return 1;
  return -[CBClassicPeer productID](self, "productID") == 8201;
}

- (BOOL)isAppleFeatureSupported:(unsigned int)a3
{
  return (a3 & ~-[CBClassicPeer appleFeatureBitMask](self, "appleFeatureBitMask")) == 0;
}

- (BOOL)isAACPCapabilityBit:(unsigned int)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unsigned __int8 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[CBClassicPeer aacpCapabilityBits](self, "aacpCapabilityBits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CBClassicPeer aacpCapabilityBits](self, "aacpCapabilityBits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7 <= a3 >> 3)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      v15 = 0;
      -[CBClassicPeer aacpCapabilityBits](self, "aacpCapabilityBits");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "getBytes:range:", &v15, a3 >> 3, 1);

      v8 = (1 << (a3 & 7)) & v15;
      LOBYTE(v5) = v8 != 0;
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v9 = (void *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        v10 = v8 != 0;
        v11 = v9;
        -[CBClassicPeer name](self, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBClassicPeer aacpCapabilityBits](self, "aacpCapabilityBits");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316930;
        v17 = "-[CBClassicPeer isAACPCapabilityBit:]";
        v18 = 2112;
        v19 = v12;
        v20 = 2112;
        v21 = v13;
        v22 = 1024;
        v23 = a3;
        v24 = 1024;
        v25 = a3 & 7;
        v26 = 1024;
        v27 = a3 >> 3;
        v28 = 1024;
        v29 = v15;
        v30 = 1024;
        v31 = v10;
        _os_log_debug_impl(&dword_1A82A2000, v11, OS_LOG_TYPE_DEBUG, "%s - “%@” - aacpCapabilityBits=%@ bit #%d is bit %d of byte %d (%2X) bitIsOn:%d", buf, 0x3Eu);

      }
    }
  }
  return (char)v5;
}

- (void)openRFCOMMChannel:(unsigned __int8)a3 options:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  v6 = a4;
  if ((_DWORD)v4)
  {
    v7 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)MEMORY[0x1E0C9AA70];
    if (v6)
      v9 = v6;
    objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("kCBMsgArgRFCOMMChannelID"), v9, CFSTR("kCBMsgArgOptions"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 53, v10);

LABEL_5:
    return;
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    goto LABEL_5;
  -[CBClassicPeer openRFCOMMChannel:options:].cold.1();

}

- (void)configureRFCOMMPortParams:(id)a3
{
  -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 55, a3);
}

- (BOOL)isServiceSupported:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CBClassicPeer service:](self, "service:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPSM"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

    return v6;
  }
  else
  {

    return 0;
  }
}

- (void)openL2CAPChannel:(unsigned __int16)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v6, CFSTR("kCBMsgArgPSM"), MEMORY[0x1E0C9AA70], CFSTR("kCBMsgArgOptions"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 25, v5);

}

- (void)closeL2CAPChannel:(unsigned __int16)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v6, CFSTR("kCBMsgArgPSM"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 26, v5);

  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBClassicPeer closeL2CAPChannel:].cold.1();
  }
}

- (void)openRFCOMMChannel:(unsigned __int8)a3
{
  -[CBClassicPeer openRFCOMMChannel:options:](self, "openRFCOMMChannel:options:", a3, MEMORY[0x1E0C9AA70]);
}

- (void)closeRFCOMMChannel:(unsigned __int8)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v6, CFSTR("kCBMsgArgRFCOMMChannelID"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 54, v5);

  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBClassicPeer openRFCOMMChannel:options:].cold.1();
  }
}

- (void)setName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicPeer.m"), 1210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E08];
  -[CBPeer identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("kCBMsgArgDeviceUUID"), v13, CFSTR("kCBMsgArgName"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42, v11);

}

- (BOOL)isRFCOMMServiceSupported:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CBClassicPeer service:](self, "service:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRFCOMMChannelID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

    return v6;
  }
  else
  {

    return 0;
  }
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned __int8)a3
{
  self->_deviceType = a3;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)name
{
  return self->_name;
}

- (id)connectL2CAPCallback
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setConnectL2CAPCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (id)disconnectL2CAPCallback
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setDisconnectL2CAPCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (id)connectRFCOMMCallback
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setConnectRFCOMMCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (id)disconnectRFCOMMCallback
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setDisconnectRFCOMMCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned __int16)a3
{
  self->_productID = a3;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(unsigned __int16)a3
{
  self->_vendorID = a3;
}

- (unsigned)vendorIDSource
{
  return self->_vendorIDSource;
}

- (void)setVendorIDSource:(unsigned __int16)a3
{
  self->_vendorIDSource = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int16)a3
{
  self->_version = a3;
}

- (BOOL)isDevFused
{
  return self->_isDevFused;
}

- (void)setIsDevFused:(BOOL)a3
{
  self->_isDevFused = a3;
}

- (unsigned)colorID
{
  return self->_colorID;
}

- (void)setColorID:(unsigned __int8)a3
{
  self->_colorID = a3;
}

- (NSString)appleModelIdentifier
{
  return self->_appleModelIdentifier;
}

- (void)setAppleModelIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BOOL)isConnectedOverUSB
{
  return self->_isConnectedOverUSB;
}

- (void)setIsConnectedOverUSB:(BOOL)a3
{
  self->_isConnectedOverUSB = a3;
}

- (BOOL)isAppleAccessoryServer
{
  return self->_isAppleAccessoryServer;
}

- (void)setIsAppleAccessoryServer:(BOOL)a3
{
  self->_isAppleAccessoryServer = a3;
}

- (NSArray)syncGroups
{
  return self->_syncGroups;
}

- (void)setSyncGroups:(id)a3
{
  objc_storeStrong((id *)&self->_syncGroups, a3);
}

- (unsigned)syncSettings
{
  return self->_syncSettings;
}

- (void)setSyncSettings:(unsigned __int16)a3
{
  self->_syncSettings = a3;
}

- (unsigned)batteryPercentSingle
{
  return self->_batteryPercentSingle;
}

- (void)setBatteryPercentSingle:(unsigned __int8)a3
{
  self->_batteryPercentSingle = a3;
}

- (unsigned)batteryPercentLeft
{
  return self->_batteryPercentLeft;
}

- (void)setBatteryPercentLeft:(unsigned __int8)a3
{
  self->_batteryPercentLeft = a3;
}

- (unsigned)batteryPercentRight
{
  return self->_batteryPercentRight;
}

- (void)setBatteryPercentRight:(unsigned __int8)a3
{
  self->_batteryPercentRight = a3;
}

- (unsigned)batteryPercentCase
{
  return self->_batteryPercentCase;
}

- (void)setBatteryPercentCase:(unsigned __int8)a3
{
  self->_batteryPercentCase = a3;
}

- (unsigned)batteryPercentCombined
{
  return self->_batteryPercentCombined;
}

- (void)setBatteryPercentCombined:(unsigned __int8)a3
{
  self->_batteryPercentCombined = a3;
}

- (BOOL)panEnabled
{
  return self->_panEnabled;
}

- (void)setPanEnabled:(BOOL)a3
{
  self->_panEnabled = a3;
}

- (BOOL)browsingEnabled
{
  return self->_browsingEnabled;
}

- (void)setBrowsingEnabled:(BOOL)a3
{
  self->_browsingEnabled = a3;
}

- (BOOL)objectPushEnabled
{
  return self->_objectPushEnabled;
}

- (void)setObjectPushEnabled:(BOOL)a3
{
  self->_objectPushEnabled = a3;
}

- (unsigned)listeningMode
{
  return self->_listeningMode;
}

- (unsigned)listeningModeConfigs
{
  return self->_listeningModeConfigs;
}

- (BOOL)LRDetectionEnabled
{
  return self->_LRDetectionEnabled;
}

- (BOOL)EQConfigEnabled
{
  return self->_EQConfigEnabled;
}

- (unsigned)EQConfigTreble
{
  return self->_EQConfigTreble;
}

- (unsigned)EQConfigMid
{
  return self->_EQConfigMid;
}

- (unsigned)EQConfigBass
{
  return self->_EQConfigBass;
}

- (BOOL)autoAnswerCalls
{
  return self->_autoAnswerCalls;
}

- (unsigned)crownRotationDirection
{
  return self->_crownRotationDirection;
}

- (unsigned)singleClickMode
{
  return self->_singleClickMode;
}

- (unsigned)doubleClickMode
{
  return self->_doubleClickMode;
}

- (unsigned)clickHoldModeLeft
{
  return self->_clickHoldModeLeft;
}

- (unsigned)clickHoldModeRight
{
  return self->_clickHoldModeRight;
}

- (unsigned)doubleClickInterval
{
  return self->_doubleClickInterval;
}

- (unsigned)clickHoldInterval
{
  return self->_clickHoldInterval;
}

- (unsigned)oneBudANCMode
{
  return self->_oneBudANCMode;
}

- (unsigned)switchControlMode
{
  return self->_switchControlMode;
}

- (unsigned)doubleTapAction
{
  return self->_doubleTapAction;
}

- (unsigned)doubleTapActionLeft
{
  return self->_doubleTapActionLeft;
}

- (unsigned)doubleTapActionRight
{
  return self->_doubleTapActionRight;
}

- (unsigned)doubleTapCapability
{
  return self->_doubleTapCapability;
}

- (void)setDoubleTapCapability:(unsigned __int8)a3
{
  self->_doubleTapCapability = a3;
}

- (unsigned)micMode
{
  return self->_micMode;
}

- (BOOL)inEarDetectionEnabled
{
  return self->_inEarDetectionEnabled;
}

- (BOOL)smartRoutingSupported
{
  return self->_smartRoutingSupported;
}

- (unsigned)smartRoutingEnabled
{
  return self->_smartRoutingEnabled;
}

- (BOOL)remoteTimeSyncEnabled
{
  return self->_remoteTimeSyncEnabled;
}

- (unsigned)primaryInEarStatus
{
  return self->_primaryInEarStatus;
}

- (void)setPrimaryInEarStatus:(unsigned __int8)a3
{
  self->_primaryInEarStatus = a3;
}

- (unsigned)secondaryInEarStatus
{
  return self->_secondaryInEarStatus;
}

- (void)setSecondaryInEarStatus:(unsigned __int8)a3
{
  self->_secondaryInEarStatus = a3;
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_storeStrong((id *)&self->_services, a3);
}

- (NSData)sdpRecordData
{
  return self->_sdpRecordData;
}

- (void)setSdpRecordData:(id)a3
{
  objc_storeStrong((id *)&self->_sdpRecordData, a3);
}

- (NSData)aacpCapabilityBits
{
  return self->_aacpCapabilityBits;
}

- (void)setAacpCapabilityBits:(id)a3
{
  objc_storeStrong((id *)&self->_aacpCapabilityBits, a3);
}

- (unsigned)appleFeatureBitMask
{
  return self->_appleFeatureBitMask;
}

- (void)setAppleFeatureBitMask:(unsigned int)a3
{
  self->_appleFeatureBitMask = a3;
}

- (unint64_t)appleExtendedFeatureBitMask
{
  return self->_appleExtendedFeatureBitMask;
}

- (void)setAppleExtendedFeatureBitMask:(unint64_t)a3
{
  self->_appleExtendedFeatureBitMask = a3;
}

- (NSUUID)trustedUID
{
  return self->_trustedUID;
}

- (void)setTrustedUID:(id)a3
{
  objc_storeStrong((id *)&self->_trustedUID, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSNumber)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(id)a3
{
  objc_storeStrong((id *)&self->_RSSI, a3);
}

- (NSHashTable)L2CAPChannels
{
  return self->_L2CAPChannels;
}

- (void)setL2CAPChannels:(id)a3
{
  objc_storeStrong((id *)&self->_L2CAPChannels, a3);
}

- (NSHashTable)RFCOMMChannels
{
  return self->_RFCOMMChannels;
}

- (void)setRFCOMMChannels:(id)a3
{
  objc_storeStrong((id *)&self->_RFCOMMChannels, a3);
}

- (BOOL)isIncoming
{
  return self->_isIncoming;
}

- (void)setIsIncoming:(BOOL)a3
{
  self->_isIncoming = a3;
}

- (int64_t)internalState
{
  return self->_internalState;
}

- (void)setInternalState:(int64_t)a3
{
  self->_internalState = a3;
}

- (unsigned)connectionHandle
{
  return self->_connectionHandle;
}

- (void)setConnectionHandle:(unsigned __int16)a3
{
  self->_connectionHandle = a3;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (void)setAddressString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (unsigned)modeSupported
{
  return self->_modeSupported;
}

- (void)setModeSupported:(unsigned __int8)a3
{
  self->_modeSupported = a3;
}

- (BOOL)traceLogging
{
  return self->_traceLogging;
}

- (void)setTraceLogging:(BOOL)a3
{
  self->_traceLogging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressString, 0);
  objc_storeStrong((id *)&self->_RFCOMMChannels, 0);
  objc_storeStrong((id *)&self->_L2CAPChannels, 0);
  objc_storeStrong((id *)&self->_RSSI, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_trustedUID, 0);
  objc_storeStrong((id *)&self->_aacpCapabilityBits, 0);
  objc_storeStrong((id *)&self->_sdpRecordData, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_syncGroups, 0);
  objc_storeStrong((id *)&self->_appleModelIdentifier, 0);
  objc_storeStrong(&self->_disconnectRFCOMMCallback, 0);
  objc_storeStrong(&self->_connectRFCOMMCallback, 0);
  objc_storeStrong(&self->_disconnectL2CAPCallback, 0);
  objc_storeStrong(&self->_connectL2CAPCallback, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)sendMsg:requiresConnected:args:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "WARNING: %@ is not a valid peer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)sendMsg:requiresConnected:args:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "API MISUSE: %@ can only accept commands while in the connected state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMsg:args:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_1A82A2000, v1, OS_LOG_TYPE_DEBUG, "%@ is not connected, ignoring message: %u", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)handlePeerUpdated:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1A82A2000, a1, a3, "No name or address", a5, a6, a7, a8, 0);
}

- (void)handlePeerUpdated:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315650;
  v7 = "-[CBClassicPeer handlePeerUpdated:]";
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = a2;
  _os_log_debug_impl(&dword_1A82A2000, a3, OS_LOG_TYPE_DEBUG, "%s - Received capability bits for “%@”: %@", (uint8_t *)&v6, 0x20u);

}

- (void)handleL2CAPChannelOpened:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "Failed to open L2CAP channel: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleL2CAPChannelClosed:(os_log_t)log .cold.1(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[CBClassicPeer handleL2CAPChannelClosed:]";
  v5 = 1024;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1A82A2000, log, OS_LOG_TYPE_DEBUG, "%s PSM: %u and result: %@", (uint8_t *)&v3, 0x1Cu);
}

- (void)channelWithPSM:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1A82A2000, v0, v1, "No known channel on %@ with psm %u");
  OUTLINED_FUNCTION_1();
}

- (void)handleRFCOMMChannelOpened:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1A82A2000, a1, a3, "Failed to open RFCOMM channel", a5, a6, a7, a8, 0);
}

- (void)channelWithID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1A82A2000, v0, v1, "No known channel on %@ with cid %u");
  OUTLINED_FUNCTION_1();
}

- (void)getConnectedServices
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2048;
  v8 = objc_msgSend(a2, "internalState");
  _os_log_error_impl(&dword_1A82A2000, v3, OS_LOG_TYPE_ERROR, "Peer: %@ is not connected %ld", (uint8_t *)&v5, 0x16u);

}

- (void)openRFCOMMChannel:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "API MISUSE: %@ Invalid RFCOMM CID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)closeL2CAPChannel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "API MISUSE: %@ Invalid L2CAP PSM", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
