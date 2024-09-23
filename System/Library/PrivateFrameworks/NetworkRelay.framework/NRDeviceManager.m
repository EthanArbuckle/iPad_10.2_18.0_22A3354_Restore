@implementation NRDeviceManager

- (void)registerDevice:(id)a3 properties:(id)a4 operationalproperties:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  int v51;
  char v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  id v57;
  NSObject *v58;
  NSObject *v59;
  _BOOL4 v60;
  NSObject *v61;
  NSObject *v62;
  _BOOL4 v63;
  NSObject *v64;
  NSObject *v65;
  _BOOL4 v66;
  NSObject *v67;
  NSObject *v68;
  _BOOL4 v69;
  NSObject *v70;
  NSObject *v71;
  _BOOL4 v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  NSObject *v105;
  NSObject *v106;
  _BOOL4 v107;
  NSObject *v108;
  NSObject *v109;
  _BOOL4 v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  NSObject *v124;
  NSObject *v125;
  _BOOL4 v126;
  NSObject *v127;
  NSObject *v128;
  _BOOL4 v129;
  NSObject *v130;
  NSObject *v131;
  _BOOL4 v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  NSObject *v140;
  NSObject *v141;
  _BOOL4 v142;
  id v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  id v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  id v165;
  char v166;
  unsigned int v167;
  int64_t v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  id v175;
  void *v176;
  _QWORD v177[4];
  id v178;
  id v179;
  id v180;
  id v181[3];

  v181[1] = *(id *)MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v11)
  {
    v58 = nrCopyLogObj_1436();
    v59 = v58;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v60 = os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);

      if (!v60)
        goto LABEL_59;
    }
    v73 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v73, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v74, v75, v76, v77, v78, (uint64_t)");

LABEL_59:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v103 = _os_log_pack_fill();
    *(_DWORD *)v103 = 136446466;
    *(_QWORD *)(v103 + 4) = "-[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:]";
    *(_WORD *)(v103 + 12) = 2080;
    *(_QWORD *)(v103 + 14) = "-[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:]";
    goto LABEL_60;
  }
  if (!v12)
  {
    v61 = nrCopyLogObj_1436();
    v62 = v61;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
        goto LABEL_59;
    }
    v79 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v79, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL properties", v80, v81, v82, v83, v84, (uint64_t)");

    goto LABEL_59;
  }
  if (!v13)
  {
    v64 = nrCopyLogObj_1436();
    v65 = v64;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v66 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);

      if (!v66)
        goto LABEL_59;
    }
    v85 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v85, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL operationalproperties", v86, v87, v88, v89, v90, (uint64_t)");

    goto LABEL_59;
  }
  if (!v14)
  {
    v67 = nrCopyLogObj_1436();
    v68 = v67;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v69 = os_log_type_enabled(v67, OS_LOG_TYPE_ERROR);

      if (!v69)
        goto LABEL_59;
    }
    v91 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v91, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL queue", v92, v93, v94, v95, v96, (uint64_t)");

    goto LABEL_59;
  }
  v16 = v15;
  if (!v15)
  {
    v70 = nrCopyLogObj_1436();
    v71 = v70;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v72 = os_log_type_enabled(v70, OS_LOG_TYPE_ERROR);

      if (!v72)
        goto LABEL_59;
    }
    v97 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v97, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL completionBlock", v98, v99, v100, v101, v102, (uint64_t)");

    goto LABEL_59;
  }
  v17 = (void *)objc_msgSend(v11, "copy");
  v23 = (void *)objc_msgSend(v12, "copy");
  v174 = v16;
  v176 = v13;
  if (nrCopyLogObj_onceToken_1440 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 0, (uint64_t)"%s%.30s:%-4d Registering device %@ with properties %@", v18, v19, v20, v21, v22, (uint64_t)");
  if ((objc_msgSend(v23, "wasInitiallySetupUsingIDSPairing") & 1) == 0)
  {
    objc_msgSend(v23, "outOfBandKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v130 = nrCopyLogObj_1436();
      v131 = v130;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v132 = os_log_type_enabled(v130, OS_LOG_TYPE_ERROR);

        if (!v132)
          goto LABEL_59;
      }
      v153 = nrCopyLogObj_1436();
      _NRLogWithArgs((uint64_t)v153, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with Device pairing properties must either have wasInitiallySetupUsingIDSPairing or outOfBandKey", v154, v155, v156, v157, v158, (uint64_t)");

      goto LABEL_59;
    }
  }
  v173 = v14;
  if (objc_msgSend(v23, "pairingProtocolVersion") < 0)
  {
    v124 = nrCopyLogObj_1436();
    v125 = v124;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v126 = os_log_type_enabled(v124, OS_LOG_TYPE_ERROR);

      if (!v126)
        goto LABEL_85;
    }
    v133 = nrCopyLogObj_1436();
    objc_msgSend(v23, "pairingProtocolVersion");
    _NRLogWithArgs((uint64_t)v133, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with Device pairing protocol version %llu is too large", v134, v135, v136, v137, v138, (uint64_t)");

LABEL_85:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v139 = _os_log_pack_fill();
    __os_log_helper_1_2_3_8_34_8_32_8_0(v139, objc_msgSend(v23, "pairingProtocolVersion"));
    goto LABEL_92;
  }
  objc_msgSend(v23, "peerNetworkRelayVersion");
  objc_msgSend(v23, "outOfBandKey");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    objc_msgSend(v23, "outOfBandKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length");

    if (!v28)
    {
      if (nrCopyLogObj_onceToken_1440 == -1)
      {
        if (!sNRCopyLogToStdErr)
          goto LABEL_18;
      }
      else
      {
        dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
        if (!sNRCopyLogToStdErr)
        {
LABEL_18:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_ERROR))
            goto LABEL_20;
        }
      }
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 16, (uint64_t)"%s%.30s:%-4d Received empty out of band key, using generic key for device %@ with properties %@", v29, v30, v31, v32, v33, (uint64_t)");
LABEL_20:
      objc_msgSend(CFSTR("Apple Watch Pairing Bluetooth PIN!"), "dataUsingEncoding:", 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setOutOfBandKey:", v34);

      objc_msgSend(v23, "outOfBandKey");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(v23, "outOfBandKey");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "length");

        if (v37 == 34)
          goto LABEL_22;
        v108 = nrCopyLogObj_1436();
        v109 = v108;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v110 = os_log_type_enabled(v108, OS_LOG_TYPE_ERROR);

          if (!v110)
            goto LABEL_73;
        }
        v117 = nrCopyLogObj_1436();
        _NRLogWithArgs((uint64_t)v117, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: propertiesCopy.outOfBandKey.length == 34", v118, v119, v120, v121, v122, (uint64_t)");

      }
      else
      {
        v105 = nrCopyLogObj_1436();
        v106 = v105;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v107 = os_log_type_enabled(v105, OS_LOG_TYPE_ERROR);

          if (!v107)
            goto LABEL_73;
        }
        v111 = nrCopyLogObj_1436();
        _NRLogWithArgs((uint64_t)v111, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (propertiesCopy.outOfBandKey) != ((void *)0)", v112, v113, v114, v115, v116, (uint64_t)");

      }
LABEL_73:
      _os_log_pack_size();
      MEMORY[0x1E0C80A78]();
      __error();
      v123 = _os_log_pack_fill();
      *(_DWORD *)v123 = 136446210;
      *(_QWORD *)(v123 + 4) = "-[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:]";
LABEL_60:
      v104 = nrCopyLogObj_1436();
      _NRLogAbortWithPack(v104);
    }
  }
LABEL_22:
  if (objc_msgSend(v23, "pairWithSPPLink"))
  {
    objc_msgSend(v23, "bluetoothMACAddress");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      v140 = nrCopyLogObj_1436();
      v141 = v140;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v142 = os_log_type_enabled(v140, OS_LOG_TYPE_ERROR);

        if (!v142)
          goto LABEL_59;
      }
      v159 = nrCopyLogObj_1436();
      _NRLogWithArgs((uint64_t)v159, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with Device pairing properties has pairWithSPPLink but no bluetoothMACAddress", v160, v161, v162, v163, v164, (uint64_t)");

      goto LABEL_59;
    }
  }
  objc_msgSend(v23, "bluetoothMACAddress");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    objc_msgSend(v23, "bluetoothMACAddress");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "length");

    if (v42 != 6)
    {
      v127 = nrCopyLogObj_1436();
      v128 = v127;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v129 = os_log_type_enabled(v127, OS_LOG_TYPE_ERROR);

        if (!v129)
          goto LABEL_91;
      }
      v143 = nrCopyLogObj_1436();
      objc_msgSend(v23, "bluetoothMACAddress");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "length");
      _NRLogWithArgs((uint64_t)v143, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with Device pairing bluetoothMACAddress length %lu != 6", v145, v146, v147, v148, v149, (uint64_t)");

LABEL_91:
      _os_log_pack_size();
      MEMORY[0x1E0C80A78]();
      __error();
      v150 = _os_log_pack_fill();
      objc_msgSend(v23, "bluetoothMACAddress");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      __os_log_helper_1_2_3_8_34_8_32_8_0(v150, objc_msgSend(v151, "length"));

LABEL_92:
      v152 = nrCopyLogObj_1436();
      _NRLogAbortWithPack(v152);
    }
  }
  v171 = v12;
  v172 = v11;
  v181[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v176, 1, v181);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v181[0];
  if (v48)
  {
    if (nrCopyLogObj_onceToken_1440 == -1)
    {
      if (sNRCopyLogToStdErr)
      {
LABEL_30:
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 16, (uint64_t)"%s%.30s:%-4d Failed to archive operational properties %@", v43, v44, v45, v46, v47, (uint64_t)");
        goto LABEL_31;
      }
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
      if (sNRCopyLogToStdErr)
        goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
  }
LABEL_31:
  objc_msgSend(v17, "nrDeviceIdentifier");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = objc_msgSend(v23, "pairingProtocolVersion");
  v167 = objc_msgSend(v23, "peerNetworkRelayVersion");
  v166 = objc_msgSend(v23, "wasInitiallySetupUsingIDSPairing");
  objc_msgSend(v23, "outOfBandKey");
  v169 = v48;
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v23, "pairWithSPPLink");
  v52 = objc_msgSend(v23, "isAltAccountPairing");
  objc_msgSend(v23, "bluetoothMACAddress");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "peerEndpointDictionary");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v17, "isEphemeral");
  objc_msgSend(v23, "candidateService");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v177[0] = MEMORY[0x1E0C809B0];
  v177[1] = 3221225472;
  v177[2] = __89__NRDeviceManager_registerDevice_properties_operationalproperties_queue_completionBlock___block_invoke;
  v177[3] = &unk_1EA3F7510;
  v178 = v17;
  v179 = v23;
  v180 = v174;
  v175 = v174;
  v165 = v23;
  v57 = v17;
  nrXPCRegisterDeviceByNRUUID(v49, v168, v167, v166, v50, v51, v52, v53, v173, v170, v54, v55, v56, v177);

}

- (void)registerDevice:(id)a3 properties:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = +[NRDeviceOperationalProperties copyPropertiesForDefaultPairedPhone](NRDeviceOperationalProperties, "copyPropertiesForDefaultPairedPhone");
  -[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:](self, "registerDevice:properties:operationalproperties:queue:completionBlock:", v13, v12, v14, v11, v10);

}

- (void)unregisterDevice:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v7 = nrCopyLogObj_1436();
    v8 = v7;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (!v9)
      {
LABEL_10:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v16 = _os_log_pack_fill();
        *(_DWORD *)v16 = 136446466;
        *(_QWORD *)(v16 + 4) = "-[NRDeviceManager unregisterDevice:]";
        *(_WORD *)(v16 + 12) = 2080;
        *(_QWORD *)(v16 + 14) = "-[NRDeviceManager unregisterDevice:]";
        v17 = nrCopyLogObj_1436();
        _NRLogAbortWithPack(v17);
      }
    }
    v10 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v10, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v11, v12, v13, v14, v15, (uint64_t)");

    goto LABEL_10;
  }
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __36__NRDeviceManager_unregisterDevice___block_invoke;
  v18[3] = &unk_1EA3F7538;
  v19 = v4;
  v6 = v4;
  -[NRDeviceManager unregisterDevice:queue:completionBlock:](self, "unregisterDevice:queue:completionBlock:", v6, queue, v18);

}

- (void)enableDevice:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v7 = nrCopyLogObj_1436();
    v8 = v7;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (!v9)
      {
LABEL_10:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v16 = _os_log_pack_fill();
        *(_DWORD *)v16 = 136446466;
        *(_QWORD *)(v16 + 4) = "-[NRDeviceManager enableDevice:]";
        *(_WORD *)(v16 + 12) = 2080;
        *(_QWORD *)(v16 + 14) = "-[NRDeviceManager enableDevice:]";
        v17 = nrCopyLogObj_1436();
        _NRLogAbortWithPack(v17);
      }
    }
    v10 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v10, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v11, v12, v13, v14, v15, (uint64_t)");

    goto LABEL_10;
  }
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __32__NRDeviceManager_enableDevice___block_invoke;
  v18[3] = &unk_1EA3F7538;
  v19 = v4;
  v6 = v4;
  -[NRDeviceManager enableDevice:queue:completionBlock:](self, "enableDevice:queue:completionBlock:", v6, queue, v18);

}

- (void)disableDevice:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v7 = nrCopyLogObj_1436();
    v8 = v7;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (!v9)
      {
LABEL_10:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v16 = _os_log_pack_fill();
        *(_DWORD *)v16 = 136446466;
        *(_QWORD *)(v16 + 4) = "-[NRDeviceManager disableDevice:]";
        *(_WORD *)(v16 + 12) = 2080;
        *(_QWORD *)(v16 + 14) = "-[NRDeviceManager disableDevice:]";
        v17 = nrCopyLogObj_1436();
        _NRLogAbortWithPack(v17);
      }
    }
    v10 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v10, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v11, v12, v13, v14, v15, (uint64_t)");

    goto LABEL_10;
  }
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __33__NRDeviceManager_disableDevice___block_invoke;
  v18[3] = &unk_1EA3F7538;
  v19 = v4;
  v6 = v4;
  -[NRDeviceManager disableDevice:queue:completionBlock:](self, "disableDevice:queue:completionBlock:", v6, queue, v18);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __33__NRDeviceManager_disableDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  _BOOL4 v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr
      || (v7 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_ERROR), v8 = v10, v7))
    {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 16, (uint64_t)"%s%.30s:%-4d Failed to disable device %@: %@", v2, v3, v4, v5, v6, (uint64_t)");
LABEL_12:
      v8 = v10;
    }
  }
  else
  {
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr
      || (v9 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_DEFAULT), v8 = 0, v9))
    {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 0, (uint64_t)"%s%.30s:%-4d Disabled device %@", v2, v3, v4, v5, v6, (uint64_t)");
      goto LABEL_12;
    }
  }

}

void __32__NRDeviceManager_enableDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  _BOOL4 v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr
      || (v7 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_ERROR), v8 = v10, v7))
    {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 16, (uint64_t)"%s%.30s:%-4d Failed to enable device %@: %@", v2, v3, v4, v5, v6, (uint64_t)");
LABEL_12:
      v8 = v10;
    }
  }
  else
  {
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr
      || (v9 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_DEFAULT), v8 = 0, v9))
    {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 0, (uint64_t)"%s%.30s:%-4d Enabled device %@", v2, v3, v4, v5, v6, (uint64_t)");
      goto LABEL_12;
    }
  }

}

void __36__NRDeviceManager_unregisterDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  _BOOL4 v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr
      || (v7 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_ERROR), v8 = v10, v7))
    {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 16, (uint64_t)"%s%.30s:%-4d Failed to unregister device %@: %@", v2, v3, v4, v5, v6, (uint64_t)");
LABEL_12:
      v8 = v10;
    }
  }
  else
  {
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr
      || (v9 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_DEFAULT), v8 = 0, v9))
    {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 0, (uint64_t)"%s%.30s:%-4d Unregistered device %@", v2, v3, v4, v5, v6, (uint64_t)");
      goto LABEL_12;
    }
  }

}

void __89__NRDeviceManager_registerDevice_properties_operationalproperties_queue_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = v5;
  if (a2)
  {
    if (v5)
    {
      v19 = *MEMORY[0x1E0CB2D50];
      v20[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NRDeviceManagerErrorDomain"), a2, v12);
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 16, (uint64_t)"%s%.30s:%-4d Failed to register device %@ with properties %@: %@", v13, v14, v15, v16, v17, (uint64_t)");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_DEFAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 0, (uint64_t)"%s%.30s:%-4d Registered device %@ with properties %@", v6, v7, v8, v9, v10, (uint64_t)");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

+ (id)copySharedDeviceManager
{
  if (copySharedDeviceManager_onceToken != -1)
    dispatch_once(&copySharedDeviceManager_onceToken, &__block_literal_global_1484);
  return (id)copySharedDeviceManager_sharedDeviceManager;
}

void __42__NRDeviceManager_copySharedDeviceManager__block_invoke()
{
  id *v0;
  void *v1;

  v0 = -[NRDeviceManager initInternal]([NRDeviceManager alloc]);
  v1 = (void *)copySharedDeviceManager_sharedDeviceManager;
  copySharedDeviceManager_sharedDeviceManager = (uint64_t)v0;

}

- (id)initInternal
{
  id *v1;
  id *v2;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  objc_super v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v24.receiver = a1;
  v24.super_class = (Class)NRDeviceManager;
  v1 = (id *)objc_msgSendSuper2(&v24, sel_init);
  if (!v1)
  {
    v4 = nrCopyLogObj_1436();
    v5 = v4;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

      if (!v6)
        goto LABEL_17;
    }
    v10 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v10, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v11, v12, v13, v14, v15, (uint64_t)");

    goto LABEL_17;
  }
  v2 = v1;
  if (nrXPCCopyQueue_onceToken != -1)
    dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2127);
  objc_storeStrong(v2 + 1, (id)nrXPCCopyQueue_nrXPCQueue);
  if (!v2[1])
  {
    v7 = nrCopyLogObj_1436();
    v8 = v7;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (!v9)
      {
LABEL_17:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v22 = _os_log_pack_fill();
        *(_DWORD *)v22 = 136446210;
        *(_QWORD *)(v22 + 4) = "-[NRDeviceManager initInternal]";
        v23 = nrCopyLogObj_1436();
        _NRLogAbortWithPack(v23);
      }
    }
    v16 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v16, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (self.queue) != ((void *)0)", v17, v18, v19, v20, v21, (uint64_t)");

    goto LABEL_17;
  }
  return v2;
}

- (void)unregisterDevice:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    v19 = nrCopyLogObj_1436();
    v20 = v19;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v21)
      {
LABEL_21:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v32 = _os_log_pack_fill();
        *(_DWORD *)v32 = 136446466;
        *(_QWORD *)(v32 + 4) = "-[NRDeviceManager(Internal) unregisterDevice:queue:completionBlock:]";
        *(_WORD *)(v32 + 12) = 2080;
        *(_QWORD *)(v32 + 14) = "-[NRDeviceManager(Internal) unregisterDevice:queue:completionBlock:]";
        v33 = nrCopyLogObj_1436();
        _NRLogAbortWithPack(v33);
      }
    }
    v26 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v26, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v27, v28, v29, v30, v31, (uint64_t)");

    goto LABEL_21;
  }
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      v16 = (void *)objc_msgSend(v7, "copy");
      if (nrCopyLogObj_onceToken_1440 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_DEFAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 0, (uint64_t)"%s%.30s:%-4d Unregistering device %@", v11, v12, v13, v14, v15, (uint64_t)");
      objc_msgSend(v16, "nrDeviceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __68__NRDeviceManager_Internal__unregisterDevice_queue_completionBlock___block_invoke;
      v46[3] = &unk_1EA3F7560;
      v47 = v16;
      v48 = v10;
      v18 = v16;
      nrXPCUnregisterDeviceByNRUUID(v17, v8, v46);

    }
    else
    {
      v24 = nrCopyLogObj_1436();
      v25 = v24;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v40 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

        if (!v40)
          goto LABEL_11;
      }
      v18 = nrCopyLogObj_1436();
      _NRLogWithArgs((uint64_t)v18, 17, (uint64_t)"%s called with null completionBlock", v41, v42, v43, v44, v45, (uint64_t)"-[NRDeviceManager(Internal) unregisterDevice:queue:completionBlock:]");
    }
  }
  else
  {
    v22 = nrCopyLogObj_1436();
    v23 = v22;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v34 = os_log_type_enabled(v22, OS_LOG_TYPE_FAULT);

      if (!v34)
        goto LABEL_11;
    }
    v18 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v18, 17, (uint64_t)"%s called with null queue", v35, v36, v37, v38, v39, (uint64_t)"-[NRDeviceManager(Internal) unregisterDevice:queue:completionBlock:]");
  }

LABEL_11:
}

- (void)unregisterAllDevicesWithQueue:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;

  v5 = a3;
  v6 = a4;
  v12 = v6;
  if (!v5)
  {
    v13 = nrCopyLogObj_1436();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v15 = v13;
      v16 = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);

      if (!v16)
        goto LABEL_9;
    }
    v17 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v17, 17, (uint64_t)"%s called with null queue", v18, v19, v20, v21, v22, (uint64_t)"-[NRDeviceManager(Internal) unregisterAllDevicesWithQueue:completionBlock:]");
LABEL_18:

    goto LABEL_9;
  }
  if (!v6)
  {
    v14 = nrCopyLogObj_1436();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v23 = v14;
      v24 = os_log_type_enabled(v14, OS_LOG_TYPE_FAULT);

      if (!v24)
        goto LABEL_9;
    }
    v17 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v17, 17, (uint64_t)"%s called with null completionBlock", v25, v26, v27, v28, v29, (uint64_t)"-[NRDeviceManager(Internal) unregisterAllDevicesWithQueue:completionBlock:]");
    goto LABEL_18;
  }
  if (nrCopyLogObj_onceToken_1440 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 0, (uint64_t)"%s%.30s:%-4d Unregistering all devices", v7, v8, v9, v10, v11, (uint64_t)");
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __75__NRDeviceManager_Internal__unregisterAllDevicesWithQueue_completionBlock___block_invoke;
  v30[3] = &unk_1EA3F7588;
  v31 = v12;
  nrXPCUnregisterAllDevices(v5, v30);

LABEL_9:
}

- (void)enableDevice:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    v19 = nrCopyLogObj_1436();
    v20 = v19;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v21)
      {
LABEL_21:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v32 = _os_log_pack_fill();
        *(_DWORD *)v32 = 136446466;
        *(_QWORD *)(v32 + 4) = "-[NRDeviceManager(Internal) enableDevice:queue:completionBlock:]";
        *(_WORD *)(v32 + 12) = 2080;
        *(_QWORD *)(v32 + 14) = "-[NRDeviceManager(Internal) enableDevice:queue:completionBlock:]";
        v33 = nrCopyLogObj_1436();
        _NRLogAbortWithPack(v33);
      }
    }
    v26 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v26, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v27, v28, v29, v30, v31, (uint64_t)");

    goto LABEL_21;
  }
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      v16 = (void *)objc_msgSend(v7, "copy");
      if (nrCopyLogObj_onceToken_1440 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_DEFAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 0, (uint64_t)"%s%.30s:%-4d Enabling device %@", v11, v12, v13, v14, v15, (uint64_t)");
      objc_msgSend(v16, "nrDeviceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __64__NRDeviceManager_Internal__enableDevice_queue_completionBlock___block_invoke;
      v46[3] = &unk_1EA3F7560;
      v47 = v16;
      v48 = v10;
      v18 = v16;
      nrXPCEnableDeviceByNRUUID(v17, v8, v46);

    }
    else
    {
      v24 = nrCopyLogObj_1436();
      v25 = v24;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v40 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

        if (!v40)
          goto LABEL_11;
      }
      v18 = nrCopyLogObj_1436();
      _NRLogWithArgs((uint64_t)v18, 17, (uint64_t)"%s called with null completionBlock", v41, v42, v43, v44, v45, (uint64_t)"-[NRDeviceManager(Internal) enableDevice:queue:completionBlock:]");
    }
  }
  else
  {
    v22 = nrCopyLogObj_1436();
    v23 = v22;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v34 = os_log_type_enabled(v22, OS_LOG_TYPE_FAULT);

      if (!v34)
        goto LABEL_11;
    }
    v18 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v18, 17, (uint64_t)"%s called with null queue", v35, v36, v37, v38, v39, (uint64_t)"-[NRDeviceManager(Internal) enableDevice:queue:completionBlock:]");
  }

LABEL_11:
}

- (void)disableDevice:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    v19 = nrCopyLogObj_1436();
    v20 = v19;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v21)
      {
LABEL_21:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v32 = _os_log_pack_fill();
        *(_DWORD *)v32 = 136446466;
        *(_QWORD *)(v32 + 4) = "-[NRDeviceManager(Internal) disableDevice:queue:completionBlock:]";
        *(_WORD *)(v32 + 12) = 2080;
        *(_QWORD *)(v32 + 14) = "-[NRDeviceManager(Internal) disableDevice:queue:completionBlock:]";
        v33 = nrCopyLogObj_1436();
        _NRLogAbortWithPack(v33);
      }
    }
    v26 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v26, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v27, v28, v29, v30, v31, (uint64_t)");

    goto LABEL_21;
  }
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      v16 = (void *)objc_msgSend(v7, "copy");
      if (nrCopyLogObj_onceToken_1440 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_DEFAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 0, (uint64_t)"%s%.30s:%-4d Disabling device %@", v11, v12, v13, v14, v15, (uint64_t)");
      objc_msgSend(v16, "nrDeviceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __65__NRDeviceManager_Internal__disableDevice_queue_completionBlock___block_invoke;
      v46[3] = &unk_1EA3F7560;
      v47 = v16;
      v48 = v10;
      v18 = v16;
      nrXPCDisableDeviceByNRUUID(v17, v8, v46);

    }
    else
    {
      v24 = nrCopyLogObj_1436();
      v25 = v24;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v40 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

        if (!v40)
          goto LABEL_11;
      }
      v18 = nrCopyLogObj_1436();
      _NRLogWithArgs((uint64_t)v18, 17, (uint64_t)"%s called with null completionBlock", v41, v42, v43, v44, v45, (uint64_t)"-[NRDeviceManager(Internal) disableDevice:queue:completionBlock:]");
    }
  }
  else
  {
    v22 = nrCopyLogObj_1436();
    v23 = v22;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v34 = os_log_type_enabled(v22, OS_LOG_TYPE_FAULT);

      if (!v34)
        goto LABEL_11;
    }
    v18 = nrCopyLogObj_1436();
    _NRLogWithArgs((uint64_t)v18, 17, (uint64_t)"%s called with null queue", v35, v36, v37, v38, v39, (uint64_t)"-[NRDeviceManager(Internal) disableDevice:queue:completionBlock:]");
  }

LABEL_11:
}

- (id)copyIDSDeviceID
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1501;
  v9 = __Block_byref_object_dispose__1502;
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NRDeviceManager_Internal__copyIDSDeviceID__block_invoke;
  block[3] = &unk_1EA3F75B0;
  block[4] = &v5;
  if (copyIDSDeviceID_onceToken != -1)
    dispatch_once(&copyIDSDeviceID_onceToken, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __44__NRDeviceManager_Internal__copyIDSDeviceID__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  void *v4;

  v2 = nrXPCCopyIDSDeviceID();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __65__NRDeviceManager_Internal__disableDevice_queue_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = v5;
  if (a2)
  {
    if (v5)
    {
      v19 = *MEMORY[0x1E0CB2D50];
      v20[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NRDeviceManagerErrorDomain"), a2, v12);
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 16, (uint64_t)"%s%.30s:%-4d Failed to disable device %@: %@", v13, v14, v15, v16, v17, (uint64_t)");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_DEFAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 0, (uint64_t)"%s%.30s:%-4d Disabled device %@", v6, v7, v8, v9, v10, (uint64_t)");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __64__NRDeviceManager_Internal__enableDevice_queue_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = v5;
  if (a2)
  {
    if (v5)
    {
      v19 = *MEMORY[0x1E0CB2D50];
      v20[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NRDeviceManagerErrorDomain"), a2, v12);
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 16, (uint64_t)"%s%.30s:%-4d Failed to enable device %@: %@", v13, v14, v15, v16, v17, (uint64_t)");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_DEFAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 0, (uint64_t)"%s%.30s:%-4d Enabled device %@", v6, v7, v8, v9, v10, (uint64_t)");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __75__NRDeviceManager_Internal__unregisterAllDevicesWithQueue_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = v5;
  if (a2)
  {
    if (v5)
    {
      v19 = *MEMORY[0x1E0CB2D50];
      v20[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NRDeviceManagerErrorDomain"), a2, v12);
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 16, (uint64_t)"%s%.30s:%-4d Failed to unregister all devices: %@", v13, v14, v15, v16, v17, (uint64_t)");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_DEFAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 0, (uint64_t)"%s%.30s:%-4d Unregistered all devices", v6, v7, v8, v9, v10, (uint64_t)");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __68__NRDeviceManager_Internal__unregisterDevice_queue_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = v5;
  if (a2)
  {
    if (v5)
    {
      v19 = *MEMORY[0x1E0CB2D50];
      v20[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NRDeviceManagerErrorDomain"), a2, v12);
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 16, (uint64_t)"%s%.30s:%-4d Failed to unregister device %@: %@", v13, v14, v15, v16, v17, (uint64_t)");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    if (nrCopyLogObj_onceToken_1440 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1441, OS_LOG_TYPE_DEFAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1441, 0, (uint64_t)"%s%.30s:%-4d Unregistered device %@", v6, v7, v8, v9, v10, (uint64_t)");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
