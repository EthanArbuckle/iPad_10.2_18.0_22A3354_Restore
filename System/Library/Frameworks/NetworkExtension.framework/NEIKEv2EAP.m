@implementation NEIKEv2EAP

- (void)dealloc
{
  __CFDictionary *properties;
  __SecIdentity *sec_identity;
  __CFData *encryptedEAPIdentity;
  char *username;
  char *password;
  objc_super v8;

  if (self && self->_module)
  {
    EAPClientModulePluginFree();
    self->_module = 0;
  }
  properties = self->_pluginData.properties;
  if (properties)
  {
    CFRelease(properties);
    self->_pluginData.properties = 0;
  }
  sec_identity = self->_pluginData.sec_identity;
  if (sec_identity)
  {
    CFRelease(sec_identity);
    self->_pluginData.sec_identity = 0;
  }
  encryptedEAPIdentity = self->_pluginData.encryptedEAPIdentity;
  if (encryptedEAPIdentity)
  {
    CFRelease(encryptedEAPIdentity);
    self->_pluginData.encryptedEAPIdentity = 0;
  }
  username = self->_pluginData.username;
  if (username)
  {
    free(username);
    self->_pluginData.username = 0;
  }
  password = self->_pluginData.password;
  if (password)
  {
    memset_s(password, self->_pluginData.password_length, 0, self->_pluginData.password_length);
    free(self->_pluginData.password);
    self->_pluginData.password = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2EAP;
  -[NEIKEv2EAP dealloc](&v8, sel_dealloc);
}

- (NEIKEv2EAP)init
{
  NEIKEv2EAP *v2;
  char *v3;
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  if (MEMORY[0x1E0D1DAA8])
  {
    v7.receiver = self;
    v7.super_class = (Class)NEIKEv2EAP;
    v3 = -[NEIKEv2EAP init](&v7, sel_init);
    if (v3)
    {
      *((_QWORD *)v3 + 19) = 0;
      *(_OWORD *)(v3 + 136) = 0u;
      *(_OWORD *)(v3 + 120) = 0u;
      *(_OWORD *)(v3 + 104) = 0u;
      *(_OWORD *)(v3 + 88) = 0u;
      *(_OWORD *)(v3 + 72) = 0u;
      *(_OWORD *)(v3 + 56) = 0u;
      *(_OWORD *)(v3 + 40) = 0u;
      *(_OWORD *)(v3 + 24) = 0u;
      *(_OWORD *)(v3 + 8) = 0u;
      self = v3;
      v2 = self;
      goto LABEL_5;
    }
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, "[super init] failed", v6, 2u);
    }

    self = 0;
  }
  v2 = 0;
LABEL_5:

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
}

uint64_t __26__NEIKEv2EAP_getAKAModule__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __26__NEIKEv2EAP_getSIMModule__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __31__NEIKEv2EAP_getMSCHAPv2Module__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __26__NEIKEv2EAP_getGTCModule__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __26__NEIKEv2EAP_getTLSModule__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __27__NEIKEv2EAP_getPEAPModule__block_invoke()
{
  uint64_t result;

  result = EAPClientModuleAddBuiltinModule();
  if (!(_DWORD)result)
    return EAPClientModuleAddBuiltinModule();
  return result;
}

+ (uint64_t)codeForPayload:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if ((unint64_t)objc_msgSend(v2, "length") <= 3)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = 136315138;
      v7 = "+[NEIKEv2EAP codeForPayload:]";
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, "%s called with null (payload.length >= sizeof(EAPPacket))", (uint8_t *)&v6, 0xCu);
    }

    v3 = 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)objc_msgSend(v2, "bytes");
  }

  return v3;
}

+ (uint64_t)typeForPayload:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    if ((unint64_t)objc_msgSend(v2, "length") >= 5
      && +[NEIKEv2EAP codeForPayload:]((uint64_t)NEIKEv2EAP, v2) - 3 >= 0xFFFFFFFE)
    {
      v3 = *(unsigned __int8 *)(objc_msgSend(v2, "bytes") + 4);
      goto LABEL_6;
    }
  }
  else
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = 136315138;
      v7 = "+[NEIKEv2EAP typeForPayload:]";
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, "%s called with null payload", (uint8_t *)&v6, 0xCu);
    }

  }
  v3 = 0;
LABEL_6:

  return v3;
}

- (id)createPayloadResponseForRequest:(void *)a1 type:(char)a2 typeData:(void *)a3 typeString:(void *)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  _BYTE v13[2];
  __int16 v14;
  char v15;

  v7 = a1;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v7, "bytes");
  if (!v8 && v9)
  {
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = 2;
  v14 = bswap32(objc_msgSend(v8, "length") + 5) >> 16;
  v13[1] = *(_BYTE *)(v10 + 1);
  v15 = a2;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v11, "appendBytes:length:", v13, 5);
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v11, "appendData:", v8);

  return v11;
}

+ (uint64_t)loadModuleForType:(uint64_t)a1
{
  BOOL v3;
  dispatch_once_t *v5;
  void *v6;

  objc_opt_self();
  switch(a2)
  {
    case 18:
      objc_opt_self();
      if (!MEMORY[0x1E0D1DAE8])
        return 0;
      if (getSIMModule_onceToken == -1)
        return EAPClientModuleLookup();
      v5 = &getSIMModule_onceToken;
      v6 = &__block_literal_global_1;
      goto LABEL_32;
    case 19:
    case 20:
    case 21:
    case 22:
    case 24:
      return 0;
    case 23:
      objc_opt_self();
      if (!MEMORY[0x1E0D1DAD0])
        return 0;
      if (getAKAModule_onceToken == -1)
        return EAPClientModuleLookup();
      v5 = &getAKAModule_onceToken;
      v6 = &__block_literal_global_8585;
      goto LABEL_32;
    case 25:
      objc_opt_self();
      if (MEMORY[0x1E0D1DAF8])
        v3 = MEMORY[0x1E0D1DAE0] == 0;
      else
        v3 = 1;
      if (v3)
        return 0;
      if (getPEAPModule_onceToken == -1)
        return EAPClientModuleLookup();
      v5 = &getPEAPModule_onceToken;
      v6 = &__block_literal_global_5;
      goto LABEL_32;
    case 26:
      objc_opt_self();
      if (!MEMORY[0x1E0D1DAE0])
        return 0;
      if (getMSCHAPv2Module_onceToken == -1)
        return EAPClientModuleLookup();
      v5 = &getMSCHAPv2Module_onceToken;
      v6 = &__block_literal_global_2;
      goto LABEL_32;
    default:
      if (a2 != 6)
      {
        if (a2 == 13)
        {
          objc_opt_self();
          if (MEMORY[0x1E0D1DAF0])
          {
            if (getTLSModule_onceToken == -1)
              return EAPClientModuleLookup();
            v5 = &getTLSModule_onceToken;
            v6 = &__block_literal_global_4;
            goto LABEL_32;
          }
        }
        return 0;
      }
      objc_opt_self();
      if (!MEMORY[0x1E0D1DAD8])
        return 0;
      if (getGTCModule_onceToken != -1)
      {
        v5 = &getGTCModule_onceToken;
        v6 = &__block_literal_global_3;
LABEL_32:
        dispatch_once(v5, v6);
      }
      return EAPClientModuleLookup();
  }
}

- (id)createPayloadResponseForRequest:(void *)a3 ikeSA:(BOOL *)a4 success:(BOOL *)a5 reportEAPError:
{
  id v9;
  _BYTE *v10;
  id v11;
  int v12;
  int v13;
  const char *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  int v26;
  id v27;
  _BYTE *v28;
  id v29;
  int v30;
  int v31;
  void *v32;
  int v33;
  SEL v34;
  NSObject *v35;
  BOOL *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  const char *v45;
  unint64_t v46;
  NSObject *v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  int v51;
  id v52;
  id v53;
  void *v54;
  const char *v55;
  id v56;
  id v57;
  void *v58;
  uint64_t v59;
  BOOL v60;
  SEL v61;
  uint64_t v62;
  const char *v63;
  NSObject *v64;
  id v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  const char *v69;
  id v70;
  const char *v71;
  void *v72;
  _BOOL4 v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  _BYTE *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  SEL v82;
  id v83;
  void *v84;
  const char *v85;
  size_t v86;
  void *v87;
  id v88;
  void *v89;
  const char *v90;
  id v91;
  id v92;
  const char *v93;
  void *v94;
  const char *v95;
  const char *v96;
  void *v97;
  const char *v98;
  void *v99;
  NSObject *v100;
  SEL v101;
  SEL v102;
  NSObject *v103;
  const char *v104;
  id v105;
  void *v106;
  uint64_t v107;
  void *v108;
  CFDataRef v109;
  SEL v110;
  NSObject *v111;
  NSObject *v112;
  _BYTE *v113;
  _BYTE *v114;
  id v115;
  NSObject *v116;
  NSObject *v117;
  uint64_t v118;
  id v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  BOOL v123;
  uint64_t v124;
  id v125;
  id v126;
  NSObject *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t j;
  CFDataRef v132;
  NSObject *v133;
  NSObject *v134;
  NSObject *v135;
  const char *v137;
  NSObject *v138;
  const char *v139;
  void *v140;
  id v141;
  const char *v142;
  id v143;
  void *v144;
  const char *v145;
  id v146;
  void *v147;
  const char *v148;
  const char *v149;
  id v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  const char *v155;
  NSObject *v156;
  id v157;
  void *v158;
  const char *v159;
  id v160;
  void *v161;
  id v162;
  void *v163;
  const char *v164;
  id v165;
  void *v166;
  id v167;
  int v168;
  NSObject *v169;
  const char *v170;
  SEL v171;
  NSObject *v172;
  uint64_t v173;
  id Property;
  id v175;
  void *v176;
  id v177;
  void *v178;
  char isKindOfClass;
  const char *v180;
  NSObject *v181;
  uint64_t v182;
  NSObject *v183;
  BOOL *v184;
  void *v185;
  NSObject *v186;
  id v187;
  id v188;
  id v189;
  _BYTE *v190;
  _BYTE *v191;
  _BYTE *v192;
  BOOL *v193;
  id self;
  NSObject *log;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  uint8_t v200[8];
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  int v205;
  _BYTE v206[128];
  _DWORD v207[32];
  _BYTE buf[14];
  int v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  uint64_t v214;

  v214 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  if (!a1)
    goto LABEL_184;
  if (a4)
    *a4 = 0;
  if (!v9)
  {
    ne_log_obj();
    v172 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v172, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[NEIKEv2EAP createPayloadResponseForRequest:ikeSA:success:reportEAPError:]";
      _os_log_fault_impl(&dword_19BD16000, v172, OS_LOG_TYPE_FAULT, "%s called with null request", buf, 0xCu);
    }

    goto LABEL_184;
  }
  if (*(_QWORD *)(a1 + 168))
  {
    v11 = 0;
    goto LABEL_7;
  }
  v27 = v9;
  v28 = v10;
  self = v28;
  if (v28)
  {
    v29 = v28;
    v205 = 0;
    v30 = +[NEIKEv2EAP codeForPayload:]((uint64_t)NEIKEv2EAP, v27);
    if (v30 != 1)
    {
      v51 = v30;
      ne_log_obj();
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v51;
        _os_log_error_impl(&dword_19BD16000, log, OS_LOG_TYPE_ERROR, "error: received EAP packet with code %u", buf, 8u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_179;
    }
    v193 = a4;
    v31 = +[NEIKEv2EAP typeForPayload:]((uint64_t)NEIKEv2EAP, v27);
    v32 = v29;
    v33 = v31;
    v35 = objc_getProperty(v32, v34, 96, 1);
    log = v35;
    if (v33 != 1)
    {
      -[NSObject eapProtocols](v35, "eapProtocols");
      v36 = a5;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");

      a5 = v36;
      if (v38)
      {
        v188 = v27;
        v190 = v10;
        v203 = 0u;
        v204 = 0u;
        v201 = 0u;
        v202 = 0u;
        -[NSObject eapProtocols](log, "eapProtocols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v201, v207, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v202;
          while (2)
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v202 != v42)
                objc_enumerationMutation(v39);
              v44 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * i);
              if (v44)
              {
                v46 = objc_msgSend(*(id *)(*((_QWORD *)&v201 + 1) + 8 * i), "method") - 2;
                if (v46 <= 5 && dword_19BED70F0[v46] == v33)
                {
                  objc_setProperty_atomic((id)a1, v45, v44, 160);
                  goto LABEL_74;
                }
              }
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v201, v207, 16);
            if (v41)
              continue;
            break;
          }
        }
LABEL_74:

        v27 = v188;
        v10 = v190;
        a5 = v36;
        if (!objc_getProperty((id)a1, v61, 160, 1))
        {
          -[NSObject eapProtocols](log, "eapProtocols");
          v64 = objc_claimAutoreleasedReturnValue();
          v11 = -[NSObject copy](v64, "copy");
LABEL_178:

          a4 = v193;
LABEL_179:

          goto LABEL_180;
        }
      }
    }
    v62 = +[NEIKEv2EAP loadModuleForType:]((uint64_t)NEIKEv2EAP, v33);
    *(_QWORD *)(a1 + 168) = v62;
    if (v33 != 1 && !v62)
    {
      ne_log_obj();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v33;
        _os_log_error_impl(&dword_19BD16000, v64, OS_LOG_TYPE_ERROR, "error: module is null for type %u", buf, 8u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_178;
    }
    switch((char)v33)
    {
      case 18:
        v65 = v27;
        objc_msgSend(objc_getProperty((id)a1, v63, 160, 1), "properties");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v66;
        v68 = CFSTR("EAPSIMProperties");
        goto LABEL_92;
      case 19:
      case 20:
      case 21:
      case 22:
      case 24:
        goto LABEL_86;
      case 23:
        v65 = v27;
        objc_msgSend(objc_getProperty((id)a1, v63, 160, 1), "properties");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v66;
        v68 = CFSTR("EAPAKAProperties");
        goto LABEL_92;
      case 25:
        v65 = v27;
        objc_msgSend(objc_getProperty((id)a1, v63, 160, 1), "properties");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v66;
        v68 = CFSTR("EAPPEAPProperties");
        goto LABEL_92;
      case 26:
        v65 = v27;
        objc_msgSend(objc_getProperty((id)a1, v63, 160, 1), "properties");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v66;
        v68 = CFSTR("EAPMSCHAPv2Properties");
        goto LABEL_92;
      default:
        if (v33 == 6)
        {
          v65 = v27;
          objc_msgSend(objc_getProperty((id)a1, v63, 160, 1), "properties");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v66;
          v68 = CFSTR("EAPGTCProperties");
        }
        else
        {
          if (v33 != 13)
          {
LABEL_86:
            if (!v62)
            {
              v64 = 0;
              v11 = 0;
              goto LABEL_178;
            }
            *(_OWORD *)(a1 + 8) = 0u;
            *(_QWORD *)(a1 + 152) = 0;
            *(_OWORD *)(a1 + 120) = 0u;
            *(_OWORD *)(a1 + 136) = 0u;
            *(_OWORD *)(a1 + 88) = 0u;
            *(_OWORD *)(a1 + 104) = 0u;
            *(_OWORD *)(a1 + 56) = 0u;
            *(_OWORD *)(a1 + 72) = 0u;
            *(_OWORD *)(a1 + 24) = 0u;
            *(_OWORD *)(a1 + 40) = 0u;
            goto LABEL_96;
          }
          v65 = v27;
          objc_msgSend(objc_getProperty((id)a1, v63, 160, 1), "properties");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v66;
          v68 = CFSTR("EAPTLSProperties");
        }
LABEL_92:
        objc_msgSend(v66, "objectForKeyedSubscript:", v68);
        v64 = objc_claimAutoreleasedReturnValue();

        if (!*(_QWORD *)(a1 + 168))
        {
          v11 = 0;
          v27 = v65;
          goto LABEL_178;
        }
        *(_OWORD *)(a1 + 8) = 0u;
        *(_QWORD *)(a1 + 152) = 0;
        *(_OWORD *)(a1 + 120) = 0u;
        *(_OWORD *)(a1 + 136) = 0u;
        *(_OWORD *)(a1 + 88) = 0u;
        *(_OWORD *)(a1 + 104) = 0u;
        *(_OWORD *)(a1 + 56) = 0u;
        *(_OWORD *)(a1 + 72) = 0u;
        *(_OWORD *)(a1 + 24) = 0u;
        *(_OWORD *)(a1 + 40) = 0u;
        v27 = v65;
        if (v64)
        {
          v191 = v10;
          v187 = -[NSObject mutableCopy](v64, "mutableCopy");
          goto LABEL_97;
        }
LABEL_96:
        v191 = v10;
        v187 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v64 = 0;
LABEL_97:
        v186 = v64;
        v70 = objc_getProperty((id)a1, v69, 160, 1);
        v72 = v70;
        v184 = a5;
        v189 = v27;
        if (v70
          && (objc_msgSend(v70, "method") == 4 || objc_msgSend(v72, "method") == 5 || objc_msgSend(v72, "method") == 7))
        {
          v73 = 1;
        }
        else
        {
          v73 = 0;
          if (v33 != 23 && v33 != 18)
            goto LABEL_106;
        }
        v27 = objc_getProperty(self, v71, 88, 1);
        objc_msgSend(v27, "username");
        v64 = objc_claimAutoreleasedReturnValue();
        v74 = -[NSObject length](v64, "length");
        if (v73)
        {
          v75 = v74;

          v77 = self;
          if (v75)
          {
LABEL_104:
            v78 = objc_getProperty(v77, v76, 88, 1);
            objc_msgSend(v78, "username");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v191;
            goto LABEL_116;
          }
LABEL_113:
          v80 = objc_getProperty(v77, v76, 88, 1);
          objc_msgSend(v80, "localPrivateEAPIdentity");
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          v83 = objc_getProperty(v77, v82, 88, 1);
          v78 = v83;
          v10 = v191;
          if (v81)
          {
            objc_msgSend(v83, "localPrivateEAPIdentity");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v83, "localIdentifier");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "stringValue");
            v79 = (void *)objc_claimAutoreleasedReturnValue();

          }
LABEL_116:

          if (v79)
          {
            v86 = objc_msgSend(v79, "maximumLengthOfBytesUsingEncoding:", 4);
            v87 = malloc_type_malloc(v86, 0x6DA5E840uLL);
            *(_QWORD *)(a1 + 48) = v87;
            objc_msgSend(v79, "getCString:maxLength:encoding:", v87, v86, 4);
            *(_DWORD *)(a1 + 56) = strnlen(*(const char **)(a1 + 48), v86);
          }
          v185 = v79;
          v88 = objc_getProperty(v77, v85, 88, 1);
          objc_msgSend(v88, "localEncryptedEAPIdentity");
          v89 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = v189;
          if (v89)
          {
            v91 = objc_getProperty(v77, v90, 88, 1);
            objc_msgSend(v91, "localEncryptedEAPIdentity");
            *(_QWORD *)(a1 + 64) = objc_claimAutoreleasedReturnValue();

          }
          v92 = objc_getProperty((id)a1, v90, 160, 1);
          if (v92)
          {
            v94 = v92;
            if (objc_msgSend(v92, "method") == 4 || objc_msgSend(v94, "method") == 5)
            {

              goto LABEL_124;
            }
            v118 = objc_msgSend(v94, "method");

            if (v118 == 7)
            {
LABEL_124:
              if (!objc_getProperty(v77, v93, 88, 1))
              {
                v115 = v189;
                ne_log_obj();
                v116 = objc_claimAutoreleasedReturnValue();
                a5 = v184;
                if (os_log_type_enabled(v116, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  *(_QWORD *)&buf[4] = "-[NEIKEv2IKESA password]";
                  _os_log_fault_impl(&dword_19BD16000, v116, OS_LOG_TYPE_FAULT, "%s called with null self.sessionConfiguration", buf, 0xCu);
                }

                v117 = 0;
                goto LABEL_174;
              }
              if (!objc_getProperty(v77, v95, 512, 1))
              {
                objc_msgSend(objc_getProperty(v77, v96, 88, 1), "passwordReference");
                v97 = (void *)objc_claimAutoreleasedReturnValue();

                if (v97)
                {
                  objc_msgSend(objc_getProperty(v77, v98, 88, 1), "passwordReference");
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  v100 = +[NEIKEv2Crypto copyDataFromPersistentReference:]((uint64_t)NEIKEv2Crypto, v99);
                  objc_setProperty_atomic(v77, v101, v100, 512);

                  if (!objc_getProperty(v77, v102, 512, 1))
                  {
                    ne_log_obj();
                    v103 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v77;
                      _os_log_error_impl(&dword_19BD16000, v103, OS_LOG_TYPE_ERROR, "%@ Failed to retrieve password by reference", buf, 0xCu);
                    }

                  }
                }
                v105 = objc_getProperty(v77, v98, 512, 1);
                if (v105)
                  goto LABEL_134;
                objc_msgSend(objc_getProperty(v77, v104, 88, 1), "password");
                v106 = (void *)objc_claimAutoreleasedReturnValue();

                if (v106)
                {
                  v107 = MEMORY[0x1E0C99D50];
                  objc_msgSend(objc_getProperty(v77, v96, 88, 1), "password");
                  v105 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v105, "dataUsingEncoding:", 4);
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  v109 = +[NSData sensitiveDataWithData:](v107, v108);
                  objc_setProperty_atomic(v77, v110, v109, 512);

                  v27 = v189;
LABEL_134:

                }
              }
              v111 = objc_getProperty(v77, v96, 512, 1);
              if (v111)
              {
                v112 = v111;
                v113 = malloc_type_malloc(-[NSObject length](v111, "length") + 1, 0x31382A17uLL);
                if (!v113)
                {
                  v117 = v112;
                  v115 = v27;
                  ne_log_obj();
                  v135 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v135, OS_LOG_TYPE_FAULT))
                  {
                    v173 = -[NSObject length](v117, "length");
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)&buf[4] = v173 + 1;
                    _os_log_fault_impl(&dword_19BD16000, v135, OS_LOG_TYPE_FAULT, "malloc(%zu) failed", buf, 0xCu);
                  }
                  a5 = v184;
                  v64 = v186;
                  goto LABEL_175;
                }
                v114 = v113;
                memcpy(v113, (const void *)-[NSObject bytes](v112, "bytes"), -[NSObject length](v112, "length"));
                v114[-[NSObject length](v112, "length")] = 0;
                *(_QWORD *)(a1 + 72) = v114;
                *(_DWORD *)(a1 + 80) = -[NSObject length](v112, "length");
                if (v185)
                {

                  goto LABEL_143;
                }
                v117 = v112;
                v115 = v27;
              }
              else
              {
                v115 = v27;
                v117 = 0;
              }
              a5 = v184;
LABEL_174:
              v64 = v186;
              ne_log_obj();
              v135 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
              {
                v137 = "password";
                if (!v185)
                  v137 = "username";
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = v137;
                _os_log_error_impl(&dword_19BD16000, v135, OS_LOG_TYPE_ERROR, "EAP plugin data initialization failed, missing %s", buf, 0xCu);
              }
LABEL_175:

              v27 = v115;
              v134 = v117;
LABEL_176:

              v11 = (id)MEMORY[0x1E0C9AA60];
LABEL_177:

              goto LABEL_178;
            }
          }
LABEL_143:
          v119 = objc_getProperty((id)a1, v93, 160, 1);
          v64 = v186;
          if (!v119)
            goto LABEL_219;
          v120 = v119;
          if (objc_msgSend(v119, "method") == 6)
          {

          }
          else
          {
            v122 = objc_msgSend(v120, "method");

            v123 = v122 == 7;
            v64 = v186;
            if (!v123)
              goto LABEL_219;
          }
          v124 = -[NEIKEv2IKESA copyLocalSecIdentity](v77, v121);
          *(_QWORD *)(a1 + 104) = v124;
          if (!v124)
          {
            ne_log_obj();
            v134 = objc_claimAutoreleasedReturnValue();
            a5 = v184;
            if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19BD16000, v134, OS_LOG_TYPE_ERROR, "EAP plugin data initialization failed, missing identity certificate", buf, 2u);
            }
            goto LABEL_176;
          }
          objc_msgSend(v187, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9AE50], CFSTR("TLSCertificateIsRequired"));
          v125 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v192 = v10;
          if (v125)
          {
            v126 = -[NEIKEv2IKESA copyRemoteCertificateAuthorityArray](self);
            if (v126)
            {
              v212 = 0u;
              v213 = 0u;
              v210 = 0u;
              v211 = 0u;
              v127 = v126;
              v128 = -[NSObject countByEnumeratingWithState:objects:count:](v127, "countByEnumeratingWithState:objects:count:", &v210, buf, 16);
              if (v128)
              {
                v129 = v128;
                v130 = *(_QWORD *)v211;
                do
                {
                  for (j = 0; j != v129; ++j)
                  {
                    if (*(_QWORD *)v211 != v130)
                      objc_enumerationMutation(v127);
                    v132 = SecCertificateCopyData(*(SecCertificateRef *)(*((_QWORD *)&v210 + 1) + 8 * j));
                    if (v132)
                    {
                      objc_msgSend(v125, "addObject:", v132);
                    }
                    else
                    {
                      ne_log_obj();
                      v133 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v133, OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)v200 = 0;
                        _os_log_fault_impl(&dword_19BD16000, v133, OS_LOG_TYPE_FAULT, "SecCertificateCopyData failed", v200, 2u);
                      }

                    }
                  }
                  v129 = -[NSObject countByEnumeratingWithState:objects:count:](v127, "countByEnumeratingWithState:objects:count:", &v210, buf, 16);
                }
                while (v129);
              }

              v134 = v125;
              v27 = v189;
LABEL_199:

              if (-[NSObject count](v134, "count"))
              {
                objc_msgSend(v187, "setObject:forKeyedSubscript:", v134, CFSTR("TLSTrustedCertificates"));
                v140 = 0;
                v10 = v192;
                goto LABEL_209;
              }
              v141 = objc_getProperty(self, v139, 88, 1);
              objc_msgSend(v141, "remoteCertificateHostname");
              v140 = (void *)objc_claimAutoreleasedReturnValue();

              v10 = v192;
              if (v140)
              {
LABEL_208:
                *(_QWORD *)&v210 = v140;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v210, 1, v182);
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v187, "setObject:forKeyedSubscript:", v153, CFSTR("TLSTrustedServerNames"));

                goto LABEL_209;
              }
              v183 = v134;
              v143 = objc_getProperty(self, v142, 88, 1);
              objc_msgSend(v143, "remoteIdentifier");
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v144, "identifierType") != 2)
              {
                v146 = objc_getProperty(self, v145, 88, 1);
                objc_msgSend(v146, "remoteIdentifier");
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v147, "identifierType") != 1)
                {
                  v175 = objc_getProperty(self, v148, 88, 1);
                  objc_msgSend(v175, "remoteIdentifier");
                  v176 = (void *)objc_claimAutoreleasedReturnValue();
                  v182 = objc_msgSend(v176, "identifierType");

                  if (v182 != 5)
                  {
                    v177 = objc_getProperty(self, v149, 80, 1);
                    objc_msgSend(v177, "remoteEndpoint");
                    v178 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    isKindOfClass = objc_opt_isKindOfClass();

                    if ((isKindOfClass & 1) == 0)
                    {
                      v140 = 0;
                      v10 = v192;
                      v27 = v189;
                      v134 = v183;
LABEL_209:
                      v154 = -[NSObject count](v134, "count", v182);
                      if (!v140 && !v154)
                      {
                        ne_log_obj();
                        v156 = objc_claimAutoreleasedReturnValue();
                        a5 = v184;
                        if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_error_impl(&dword_19BD16000, v156, OS_LOG_TYPE_ERROR, "EAP plugin data initialization failed, missing server certificate validation info", buf, 2u);
                        }

                        v64 = v186;
                        goto LABEL_176;
                      }
                      v157 = objc_getProperty(self, v155, 88, 1);
                      objc_msgSend(v157, "tlsMinimumVersion");
                      v158 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v158)
                      {
                        v160 = objc_getProperty(self, v159, 88, 1);
                        objc_msgSend(v160, "tlsMinimumVersion");
                        v161 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v187, "setObject:forKeyedSubscript:", v161, CFSTR("TLSMinimumVersion"));

                      }
                      v162 = objc_getProperty(self, v159, 88, 1);
                      objc_msgSend(v162, "tlsMaximumVersion");
                      v163 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v163)
                      {
                        v165 = objc_getProperty(self, v164, 88, 1);
                        objc_msgSend(v165, "tlsMaximumVersion");
                        v166 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v187, "setObject:forKeyedSubscript:", v166, CFSTR("TLSMaximumVersion"));

                      }
                      v64 = v186;
LABEL_219:
                      v167 = v27;
                      *(_DWORD *)(a1 + 24) = 1024;
                      *(_QWORD *)(a1 + 88) = v187;
                      *(_QWORD *)v200 = 0;
                      v168 = EAPClientModulePluginInit();
                      if (*(_QWORD *)v200)
                      {
                        CFRelease(*(CFTypeRef *)v200);
                        *(_QWORD *)v200 = 0;
                      }
                      a5 = v184;
                      if (v168)
                      {
                        ne_log_obj();
                        v169 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
                        {
                          Property = objc_getProperty((id)a1, v170, 160, 1);
                          *(_DWORD *)buf = 138412546;
                          *(_QWORD *)&buf[4] = Property;
                          *(_WORD *)&buf[12] = 1024;
                          v209 = v168;
                          _os_log_error_impl(&dword_19BD16000, v169, OS_LOG_TYPE_ERROR, "%@ EAP client module init failed with status %u", buf, 0x12u);
                        }

                        objc_setProperty_atomic((id)a1, v171, 0, 160);
                        *(_QWORD *)(a1 + 168) = 0;
                        v11 = (id)MEMORY[0x1E0C9AA60];
                      }
                      else
                      {
                        v11 = 0;
                      }
                      v27 = v167;
                      goto LABEL_177;
                    }
                    v150 = objc_getProperty(self, v180, 80, 1);
                    objc_msgSend(v150, "remoteEndpoint");
                    v151 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v151, "hostname");
                    v152 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_207;
                  }
LABEL_206:
                  v150 = objc_getProperty(self, v149, 88, 1);
                  objc_msgSend(v150, "remoteIdentifier");
                  v151 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v151, "stringValue");
                  v152 = objc_claimAutoreleasedReturnValue();
LABEL_207:
                  v140 = (void *)v152;
                  v10 = v192;

                  v27 = v189;
                  v134 = v183;
                  if (!v140)
                    goto LABEL_209;
                  goto LABEL_208;
                }

              }
              goto LABEL_206;
            }
            ne_log_obj();
            v138 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v138, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_19BD16000, v138, OS_LOG_TYPE_FAULT, "[self copyRemoteCertificateAuthorityArray] failed", buf, 2u);
            }

            v127 = 0;
          }
          else
          {
            ne_log_obj();
            v127 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v127, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_19BD16000, v127, OS_LOG_TYPE_FAULT, "[[NSMutableArray alloc] init] failed", buf, 2u);
            }
          }
          v134 = 0;
          goto LABEL_199;
        }
        v73 = v74 != 0;
LABEL_106:
        if ((v33 == 23 || v33 == 18)
          && ((v64, v33 == 23) || v33 == 18))
        {

          v77 = self;
          if (v73)
            goto LABEL_104;
        }
        else
        {

          v77 = self;
          if (v73)
            goto LABEL_104;
        }
        goto LABEL_113;
    }
  }
  ne_log_obj();
  v181 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v181, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[NEIKEv2EAP selectModuleForPayload:ikeSA:]";
    _os_log_fault_impl(&dword_19BD16000, v181, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
  }

  v11 = (id)MEMORY[0x1E0C9AA60];
LABEL_180:

  if (v11 && !objc_msgSend(v11, "count"))
  {
    ne_log_obj();
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
LABEL_183:

LABEL_184:
      v24 = 0;
      goto LABEL_185;
    }
    *(_WORD *)buf = 0;
    v48 = "Failed to select EAP module";
    v49 = v47;
    v50 = 2;
LABEL_187:
    _os_log_error_impl(&dword_19BD16000, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
    goto LABEL_183;
  }
LABEL_7:
  v12 = +[NEIKEv2EAP codeForPayload:]((uint64_t)NEIKEv2EAP, v9);
  if (v12 != 1)
  {
    v25 = 0;
LABEL_23:
    if (*(_QWORD *)(a1 + 168))
    {
      *(_QWORD *)buf = 0;
      v207[0] = 0;
      LODWORD(v210) = 0;
      objc_msgSend(v9, "bytes");
      v26 = EAPClientModulePluginProcess();
      if (*(_QWORD *)buf)
      {
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:");
        if (!a5)
          goto LABEL_60;
      }
      else
      {
        v24 = 0;
        if (!a5)
          goto LABEL_60;
      }
      if ((_DWORD)v210)
        *a5 = (_DWORD)v210 == 19;
LABEL_60:
      if (v26 == 1)
      {
        if (v10)
        {
          v10[18] = 1;
          v10[20] = 1;
        }
        if (!a4)
          goto LABEL_72;
        v60 = 1;
        goto LABEL_71;
      }
      if (v26 || v207[0])
      {
        if (a4)
        {
          v60 = 0;
LABEL_71:
          *a4 = v60;
        }
      }
      else if (a4)
      {
        v60 = *(_QWORD *)buf != 0;
        goto LABEL_71;
      }
LABEL_72:
      EAPClientModulePluginFreePacket();

      goto LABEL_185;
    }
    ne_log_obj();
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_183;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v12;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v25;
    v48 = "EAP payload could not be processed (code %d type %d)\n";
    v49 = v47;
    v50 = 14;
    goto LABEL_187;
  }
  v13 = +[NEIKEv2EAP typeForPayload:]((uint64_t)NEIKEv2EAP, v9);
  if (v11)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v196 = 0u;
    v197 = 0u;
    v198 = 0u;
    v199 = 0u;
    v16 = v11;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v196, v206, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v197;
      do
      {
        for (k = 0; k != v18; ++k)
        {
          if (*(_QWORD *)v197 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * k);
          buf[0] = 0;
          if (v21)
          {
            v22 = objc_msgSend(v21, "method") - 2;
            if (v22 <= 5)
            {
              buf[0] = 0x190D061A1712uLL >> (8 * v22);
              objc_msgSend(v15, "appendBytes:length:", buf, 1);
            }
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v196, v206, 16);
      }
      while (v18);
    }

    -[NEIKEv2EAP createPayloadResponseForRequest:type:typeData:typeString:](v9, 3, v15, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (a4)
      *a4 = v23 != 0;

    goto LABEL_185;
  }
  v25 = v13;
  if (v13 != 1)
    goto LABEL_23;
  if (v10)
    v52 = objc_getProperty(v10, v14, 88, 1);
  else
    v52 = 0;
  v53 = v52;
  objc_msgSend(v53, "username");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v54)
  {
    if (v10)
      v56 = objc_getProperty(v10, v55, 88, 1);
    else
      v56 = 0;
    v57 = v56;
    objc_msgSend(v57, "localIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "stringValue");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NEIKEv2EAP createPayloadResponseForRequest:type:typeData:typeString:](v9, 1, 0, v54);
  v59 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v59;
  if (a4)
    *a4 = v59 != 0;

LABEL_185:
  return v24;
}

- (CFDataRef)sessionKey
{
  int v1;
  rsize_t v2;
  const __CFAllocator *v3;
  CFDataRef v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a1)
    goto LABEL_8;
  if (!*(_QWORD *)(a1 + 168))
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7 = 136315138;
      v8 = "-[NEIKEv2EAP sessionKey]";
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, "%s called with null self.module", (uint8_t *)&v7, 0xCu);
    }

    goto LABEL_8;
  }
  v1 = EAPClientModulePluginMasterSessionKeyCopyBytes();
  if (v1 < 1)
  {
LABEL_8:
    v4 = 0;
    return v4;
  }
  v2 = v1;
  objc_opt_self();
  v3 = (const __CFAllocator *)SecCFAllocatorZeroize();
  v4 = CFDataCreate(v3, (const UInt8 *)&v7, v2);
  memset_s(&v7, 0x40uLL, 0, v2);
  return v4;
}

@end
