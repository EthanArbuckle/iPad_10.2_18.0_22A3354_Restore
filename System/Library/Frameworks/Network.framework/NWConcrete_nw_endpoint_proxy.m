@implementation NWConcrete_nw_endpoint_proxy

- (NWConcrete_nw_endpoint_proxy)init
{
  NWConcrete_nw_endpoint_proxy *v2;
  NWConcrete_nw_endpoint_proxy *v3;
  NWConcrete_nw_endpoint_proxy *v4;
  void *v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  os_log_type_t v13;
  char v14;
  os_log_type_t type;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_endpoint_proxy;
  v2 = -[NWConcrete_nw_endpoint_proxy init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_proxy init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_endpoint_proxy init]";
        _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v11 = type;
      v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_endpoint_proxy init]";
          v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_endpoint_proxy init]";
        _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_endpoint_proxy init]";
        _os_log_impl(&dword_182FBE000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_20:
  if (v7)
    free(v7);
LABEL_3:

  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_endpoint_proxy;
  -[NWConcrete_nw_endpoint_proxy dealloc](&v2, sel_dealloc);
}

- (void)startWithHandler:(id)a3
{
  id v4;
  void *v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int *v10;
  char v11;
  NSObject *v12;
  char *v13;
  char *v14;
  char v15;
  const char *v16;
  nw_endpoint_t v17;
  const char *logging_description;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  const char *v23;
  id v24;
  void *v25;
  const char *v26;
  char *v27;
  NSObject *v28;
  os_log_type_t v29;
  const char *v30;
  char *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  const char *v34;
  os_log_type_t v35;
  const char *v36;
  void **v37;
  void **v38;
  const char *v39;
  const char *v40;
  void **v41;
  id v42;
  OS_nw_array *custom_proxy_configs;
  OS_nw_array *path_proxy_configs;
  NSObject *v45;
  unsigned int *v46;
  NWConcrete_nw_path *v47;
  int v48;
  int v49;
  int minimize_logging;
  char logging_disabled;
  NSObject *v52;
  const char *v53;
  const char *v54;
  nw_endpoint_t v55;
  const char *v56;
  const char *v57;
  const char *v58;
  id v59;
  const __CFArray *v60;
  NSObject *v61;
  int v62;
  CFIndex Count;
  CFIndex v64;
  BOOL v65;
  const __CFURL *ValueAtIndex;
  const __CFString *v67;
  NSObject *v68;
  const char *v69;
  const __CFString *v70;
  _BOOL4 v71;
  SInt32 v72;
  NSObject *v73;
  unsigned int v74;
  NSObject *v75;
  const char *v76;
  id v77;
  char *v78;
  NSObject *v79;
  os_log_type_t v80;
  CFIndex i;
  const __CFURL *v82;
  CFStringRef v83;
  char *v84;
  os_log_type_t v85;
  _BOOL4 v86;
  os_log_type_t v87;
  char v88;
  id *v89;
  char v90;
  char v91;
  id *v92;
  OS_nw_array *v93;
  OS_nw_array *v94;
  unsigned __int8 *v95;
  _BOOL8 v96;
  unsigned __int8 *v97;
  OS_nw_array *v98;
  OS_nw_array *v99;
  OS_nw_array *v100;
  id *v101;
  id v102;
  OS_nw_array *v103;
  OS_nw_array *v104;
  NWConcrete_nw_endpoint_proxy *v105;
  _BOOL8 v106;
  unsigned __int8 *v107;
  OS_nw_array *v108;
  OS_nw_array *v109;
  OS_nw_array *v110;
  char v111;
  id *v112;
  NWConcrete_nw_endpoint_handler *v113;
  NWConcrete_nw_endpoint_mode_handler *v114;
  NWConcrete_nw_endpoint_mode_handler *v115;
  uint64_t v116;
  id v117;
  NWConcrete_nw_endpoint_mode_handler *v118;
  NWConcrete_nw_endpoint_mode_handler *v119;
  NWConcrete_nw_endpoint_handler *v120;
  _BOOL4 v121;
  NSObject *v122;
  NWConcrete_nw_endpoint_handler *v123;
  char *v124;
  _BOOL4 v125;
  const char *v126;
  nw_endpoint_t v127;
  const char *v128;
  char *v129;
  char *v130;
  uint64_t v131;
  const char *v132;
  void **v133;
  void **v134;
  const char *v135;
  void **v136;
  id v137;
  BOOL v138;
  const char *v139;
  NWConcrete_nw_endpoint_handler *v140;
  NWConcrete_nw_endpoint_mode_handler *v141;
  const void *v142;
  NWConcrete_nw_endpoint_handler *v143;
  id v144;
  id v145;
  void *v146;
  const __CFURL *v147;
  nw_endpoint_t v148;
  char v149;
  CFURLRef v150;
  BOOL v151;
  NWConcrete_nw_endpoint_handler *v152;
  char v153;
  NSObject *v154;
  NWConcrete_nw_endpoint_handler *v155;
  char *v156;
  _BOOL4 v157;
  const char *v158;
  nw_endpoint_t v159;
  char *v160;
  char *v161;
  uint64_t v162;
  const char *v163;
  NSObject *v164;
  const char *v165;
  const char *v166;
  const char *v167;
  const char *v168;
  id v169;
  void **v170;
  void **v171;
  const char *v172;
  void **v173;
  id v174;
  const char *v175;
  const __CFString *v176;
  const __CFString *v177;
  char v178;
  uint64_t v179;
  _BOOL8 v180;
  void *v181;
  NWConcrete_nw_endpoint_handler *v182;
  NWConcrete_nw_proxy_config *direct;
  int no_proxy;
  _BOOL4 prefer_no_proxy;
  _BOOL8 v186;
  id v187;
  void *v188;
  NWConcrete_nw_endpoint_handler *v189;
  id v190;
  id v191;
  char v192;
  NWConcrete_nw_proxy_config *v193;
  NWConcrete_nw_proxy_config *v194;
  NWConcrete_nw_endpoint_handler *v195;
  id *v196;
  unsigned __int8 *v197;
  NWConcrete_nw_endpoint_handler *v198;
  id *v199;
  void *v200;
  void *v201;
  char *v202;
  NSObject *v203;
  os_log_type_t v204;
  char *backtrace_string;
  os_log_type_t v206;
  _BOOL4 v207;
  void *v208;
  char *v209;
  NSObject *v210;
  os_log_type_t v211;
  os_log_type_t v212;
  char *v213;
  os_log_type_t v214;
  _BOOL4 v215;
  os_log_type_t v216;
  const char *id_string;
  const char *v218;
  nw_endpoint_t v219;
  const char *v220;
  const char *v221;
  const char *v222;
  id v223;
  uint64_t (*v224)(uint64_t, uint64_t);
  const char *v225;
  NSObject *v226;
  os_log_t log;
  const char *v228;
  NSObject *v229;
  os_unfair_lock_s *lock;
  void *v231;
  unsigned int *v232;
  const char *v233;
  _BOOL4 v234;
  id *v235;
  const char *v236;
  id v237;
  _WORD *v238;
  unsigned int *v239;
  nw_endpoint_t v240;
  const char *v241;
  id *v242;
  NSObject *v243;
  id *v244;
  NWConcrete_nw_endpoint_handler *v245;
  const char *v246;
  id v247;
  const __CFAllocator *alloc;
  id alloca;
  unsigned int *v250;
  NWConcrete_nw_endpoint_proxy *object;
  unsigned __int8 *objecta;
  _QWORD v253[4];
  id v254;
  NSObject *v255;
  OS_nw_array *v256;
  _QWORD v257[4];
  OS_nw_array *v258;
  id v259;
  _QWORD v260[5];
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  NWConcrete_nw_endpoint_handler *v265;
  NWConcrete_nw_proxy_config *v266;
  id v267;
  id v268;
  os_log_type_t type[8];
  uint64_t v270;
  uint64_t v271;
  uint64_t (*v272)(uint64_t, uint64_t);
  void (*v273)(uint64_t);
  NWConcrete_nw_proxy_config *v274;
  id v275;
  id v276;
  _QWORD aBlock[4];
  id v278;
  _BYTE buf[24];
  uint64_t (*v280)(uint64_t, uint64_t);
  _BYTE v281[32];
  id v282;
  __int16 v283;
  const char *v284;
  __int16 v285;
  _BOOL4 v286;
  __int16 v287;
  int v288;
  uint64_t v289;

  v289 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
    v202 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v261) = 0;
    if (__nwlog_fault(v202, type, &v261))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v203 = objc_claimAutoreleasedReturnValue();
        v204 = type[0];
        if (os_log_type_enabled(v203, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          _os_log_impl(&dword_182FBE000, v203, v204, "%{public}s called with null handler", buf, 0xCu);
        }
      }
      else if ((_BYTE)v261)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v203 = objc_claimAutoreleasedReturnValue();
        v206 = type[0];
        v207 = os_log_type_enabled(v203, type[0]);
        if (backtrace_string)
        {
          if (v207)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v203, v206, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_253;
        }
        if (v207)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          _os_log_impl(&dword_182FBE000, v203, v206, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v203 = objc_claimAutoreleasedReturnValue();
        v212 = type[0];
        if (os_log_type_enabled(v203, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          _os_log_impl(&dword_182FBE000, v203, v212, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_253:
    if (v202)
      free(v202);
    v5 = 0;
    goto LABEL_231;
  }
  v6 = (unsigned int *)v4;
  v7 = v6[29];

  if ((_DWORD)v7 != 3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v24 = (id)gLogObj;
    v25 = v5;
    if (v7 > 5)
      v26 = "unknown-mode";
    else
      v26 = off_1E149FC18[v7];
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2082;
    v280 = (uint64_t (*)(uint64_t, uint64_t))"proxy";
    v27 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v261) = 0;
    if (__nwlog_fault(v27, type, &v261))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v28 = (id)gLogObj;
        v29 = type[0];
        if (os_log_type_enabled(v28, type[0]))
        {
          if (v7 > 5)
            v30 = "unknown-mode";
          else
            v30 = off_1E149FC18[v7];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2082;
          v280 = (uint64_t (*)(uint64_t, uint64_t))"proxy";
          _os_log_impl(&dword_182FBE000, v28, v29, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if ((_BYTE)v261)
      {
        v31 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v28 = (id)gLogObj;
        v32 = type[0];
        v33 = os_log_type_enabled(v28, type[0]);
        if (v31)
        {
          if (v33)
          {
            if (v7 > 5)
              v34 = "unknown-mode";
            else
              v34 = off_1E149FC18[v7];
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v34;
            *(_WORD *)&buf[22] = 2082;
            v280 = (uint64_t (*)(uint64_t, uint64_t))"proxy";
            *(_WORD *)v281 = 2082;
            *(_QWORD *)&v281[2] = v31;
            _os_log_impl(&dword_182FBE000, v28, v32, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v31);
          if (!v27)
            goto LABEL_111;
          goto LABEL_110;
        }
        if (v33)
        {
          if (v7 > 5)
            v40 = "unknown-mode";
          else
            v40 = off_1E149FC18[v7];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v40;
          *(_WORD *)&buf[22] = 2082;
          v280 = (uint64_t (*)(uint64_t, uint64_t))"proxy";
          _os_log_impl(&dword_182FBE000, v28, v32, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v28 = (id)gLogObj;
        v35 = type[0];
        if (os_log_type_enabled(v28, type[0]))
        {
          if (v7 > 5)
            v36 = "unknown-mode";
          else
            v36 = off_1E149FC18[v7];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2082;
          v280 = (uint64_t (*)(uint64_t, uint64_t))"proxy";
          _os_log_impl(&dword_182FBE000, v28, v35, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }

    }
    if (!v27)
    {
LABEL_111:
      v5 = v25;
      goto LABEL_231;
    }
LABEL_110:
    free(v27);
    goto LABEL_111;
  }
  v8 = v6;
  v9 = v8[30];

  if (v9 == 1)
  {
    v231 = v5;
    v232 = v6;
    v239 = v8;
    v10 = v8;
    v11 = *((_BYTE *)v10 + 268);
    v250 = v10;

    object = self;
    if ((v11 & 0x20) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v12 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = v250;

        v14 = v13;
        v15 = *((_BYTE *)v250 + 268);

        if ((v15 & 1) != 0)
          v16 = "dry-run ";
        else
          v16 = "";
        v17 = nw_endpoint_handler_copy_endpoint(v14);
        logging_description = nw_endpoint_get_logging_description(v17);
        v19 = v13 + 168;
        v20 = v14;
        v21 = v20;
        v22 = v239[30];
        if (v22 > 5)
          v23 = "unknown-state";
        else
          v23 = off_1E149FC48[v22];

        v37 = v21;
        v38 = v37;
        v39 = "path";
        switch(v232[29])
        {
          case 0u:
            break;
          case 1u:
            v39 = "resolver";
            break;
          case 2u:
            v39 = nw_endpoint_flow_mode_string(v37[31]);
            break;
          case 3u:
            v39 = "proxy";
            break;
          case 4u:
            v39 = "fallback";
            break;
          case 5u:
            v39 = "transform";
            break;
          default:
            v39 = "unknown-mode";
            break;
        }

        v41 = v38;
        os_unfair_lock_lock((os_unfair_lock_t)v41 + 28);
        v42 = v41[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v41 + 28);

        *(_DWORD *)buf = 136447746;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2082;
        v280 = (uint64_t (*)(uint64_t, uint64_t))v16;
        *(_WORD *)v281 = 2082;
        *(_QWORD *)&v281[2] = logging_description;
        *(_WORD *)&v281[10] = 2082;
        *(_QWORD *)&v281[12] = v23;
        *(_WORD *)&v281[20] = 2082;
        *(_QWORD *)&v281[22] = v39;
        *(_WORD *)&v281[30] = 2114;
        v282 = v42;
        _os_log_impl(&dword_182FBE000, v12, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);

      }
      self = object;
    }
    custom_proxy_configs = self->custom_proxy_configs;
    self->custom_proxy_configs = 0;

    path_proxy_configs = object->path_proxy_configs;
    object->path_proxy_configs = 0;

    *((_BYTE *)object + 96) &= 0xC6u;
    v45 = nw_endpoint_handler_copy_endpoint(v250);
    v229 = v45;
    if (nw_endpoint_get_type(v45) == nw_endpoint_type_host)
    {
      v46 = v250;
      os_unfair_lock_lock((os_unfair_lock_t)v46 + 28);
      v47 = (NWConcrete_nw_path *)*((id *)v46 + 8);
      os_unfair_lock_unlock((os_unfair_lock_t)v46 + 28);

      *(_DWORD *)type = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      if (nw_path_get_vpn_config_uuid(v47, (unsigned __int8 (*)[16])buf, (int *)type, 1, 1))
      {
        type[0] = OS_LOG_TYPE_DEFAULT;
        v48 = nw_path_voluntary_agent_matches_address(v47, (uint64_t)&xmmword_183C6F0E8);
        v49 = type[0] ? v48 : 0;
        if (v49 == 1 && nw_endpoint_handler_trigger_agents(v46, 1))
        {
          minimize_logging = nw_endpoint_handler_get_minimize_logging(v46);
          logging_disabled = nw_endpoint_handler_get_logging_disabled(v46);
          if (minimize_logging)
          {
            if ((logging_disabled & 1) != 0)
              goto LABEL_66;
            if (__nwlog_connection_log::onceToken != -1)
              dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
            v52 = (id)gconnectionLogObj;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              id_string = nw_endpoint_handler_get_id_string(v46);
              v218 = nw_endpoint_handler_dry_run_string(v46);
              v219 = nw_endpoint_handler_copy_endpoint(v46);
              v220 = nw_endpoint_get_logging_description(v219);
              v221 = nw_endpoint_handler_state_string(v46);
              v222 = nw_endpoint_handler_mode_string(v46);
              v223 = nw_endpoint_handler_copy_current_path(v46);
              *(_DWORD *)buf = 136447746;
              *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = id_string;
              *(_WORD *)&buf[22] = 2082;
              v280 = (uint64_t (*)(uint64_t, uint64_t))v218;
              *(_WORD *)v281 = 2082;
              *(_QWORD *)&v281[2] = v220;
              *(_WORD *)&v281[10] = 2082;
              *(_QWORD *)&v281[12] = v221;
              *(_WORD *)&v281[20] = 2082;
              *(_QWORD *)&v281[22] = v222;
              *(_WORD *)&v281[30] = 2114;
              v282 = v223;
              _os_log_impl(&dword_182FBE000, v52, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] proxy requires agent trigger before attempting to connect", buf, 0x48u);

            }
          }
          else
          {
            if ((logging_disabled & 1) != 0)
            {
LABEL_66:
              nw_endpoint_handler_reset_mode(v46, 0);

LABEL_230:
              v5 = v231;
              goto LABEL_231;
            }
            if (__nwlog_connection_log::onceToken != -1)
              dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
            v52 = (id)gconnectionLogObj;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              v53 = nw_endpoint_handler_get_id_string(v46);
              v54 = nw_endpoint_handler_dry_run_string(v46);
              v55 = nw_endpoint_handler_copy_endpoint(v46);
              v56 = nw_endpoint_get_logging_description(v55);
              v57 = nw_endpoint_handler_state_string(v46);
              v58 = nw_endpoint_handler_mode_string(v46);
              v59 = nw_endpoint_handler_copy_current_path(v46);
              *(_DWORD *)buf = 136447746;
              *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = v53;
              *(_WORD *)&buf[22] = 2082;
              v280 = (uint64_t (*)(uint64_t, uint64_t))v54;
              *(_WORD *)v281 = 2082;
              *(_QWORD *)&v281[2] = v56;
              *(_WORD *)&v281[10] = 2082;
              *(_QWORD *)&v281[12] = v57;
              *(_WORD *)&v281[20] = 2082;
              *(_QWORD *)&v281[22] = v58;
              *(_WORD *)&v281[30] = 2114;
              v282 = v59;
              _os_log_impl(&dword_182FBE000, v52, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] proxy requires agent trigger before attempting to connect", buf, 0x48u);

            }
          }

          goto LABEL_66;
        }
      }

      v45 = v229;
    }
    v243 = v45;
    if (v243)
    {
      pthread_mutex_lock(&sOutstandingPacURLMutex);
      if (nw_get_outstanding_pac_urls(void)::onceToken != -1)
        dispatch_once(&nw_get_outstanding_pac_urls(void)::onceToken, &__block_literal_global_31421);
      v60 = (const __CFArray *)nw_get_outstanding_pac_urls(void)::gPACURLs;
      if (nw_get_outstanding_pac_urls(void)::gPACURLs)
      {
        v61 = v243;
        v62 = -[NSObject type](v61, "type");

        Count = CFArrayGetCount(v60);
        if (Count >= 1)
        {
          if (v62 == 2)
          {
            v64 = 0;
            alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            v65 = 1;
            while (1)
            {
              ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v60, v64);
              v67 = CFURLCopyHostName(ValueAtIndex);
              if (v67)
              {
                v68 = v61;
                v69 = (const char *)-[NSObject hostname](v68, "hostname");

                if (v69 && (v70 = CFStringCreateWithCString(alloc, v69, 0x8000100u)) != 0)
                {
                  v71 = CFStringCompare(v67, v70, 0) == kCFCompareEqualTo;
                  CFRelease(v70);
                }
                else
                {
                  v71 = 0;
                }
                CFRelease(v67);
                if (v71)
                {
                  v72 = CFURLGetPortNumber(ValueAtIndex);
                  v73 = v68;
                  v74 = -[NSObject port](v73, "port");

                  if (v74)
                  {
                    if (v72 && v72 == __rev16(v74))
                      break;
                  }
                }
              }
              v65 = ++v64 < Count;
              if (Count == v64)
                goto LABEL_118;
            }
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v75 = (id)gLogObj;
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              v76 = nw_endpoint_get_logging_description(v73);
              *(_DWORD *)buf = 136446722;
              *(_QWORD *)&buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = v76;
              *(_WORD *)&buf[22] = 2114;
              v280 = (uint64_t (*)(uint64_t, uint64_t))ValueAtIndex;
              _os_log_impl(&dword_182FBE000, v75, OS_LOG_TYPE_DEBUG, "%{public}s Endpoint %{public}s matched PAC URL %{public}@", buf, 0x20u);
            }

            goto LABEL_118;
          }
          for (i = 0; i != Count; ++i)
          {
            v82 = (const __CFURL *)CFArrayGetValueAtIndex(v60, i);
            v83 = CFURLCopyHostName(v82);
            if (v83)
              CFRelease(v83);
          }
        }
LABEL_117:
        v65 = 0;
LABEL_118:
        pthread_mutex_unlock(&sOutstandingPacURLMutex);

        if (v65)
          v88 = 64;
        else
          v88 = 0;
        goto LABEL_121;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v77 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
      v78 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      LOBYTE(v261) = 0;
      if (__nwlog_fault(v78, type, &v261))
      {
        if (type[0] == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v79 = (id)gLogObj;
          v80 = type[0];
          if (os_log_type_enabled(v79, type[0]))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
            _os_log_impl(&dword_182FBE000, v79, v80, "%{public}s nw_get_outstanding_pac_urls failed", buf, 0xCu);
          }
        }
        else if ((_BYTE)v261)
        {
          v84 = (char *)__nw_create_backtrace_string();
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v79 = (id)gLogObj;
          v85 = type[0];
          v86 = os_log_type_enabled(v79, type[0]);
          if (v84)
          {
            if (v86)
            {
              *(_DWORD *)buf = 136446466;
              *(_QWORD *)&buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = v84;
              _os_log_impl(&dword_182FBE000, v79, v85, "%{public}s nw_get_outstanding_pac_urls failed, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(v84);
            if (!v78)
              goto LABEL_117;
            goto LABEL_116;
          }
          if (v86)
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
            _os_log_impl(&dword_182FBE000, v79, v85, "%{public}s nw_get_outstanding_pac_urls failed, no backtrace", buf, 0xCu);
          }
        }
        else
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v79 = (id)gLogObj;
          v87 = type[0];
          if (os_log_type_enabled(v79, type[0]))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
            _os_log_impl(&dword_182FBE000, v79, v87, "%{public}s nw_get_outstanding_pac_urls failed, backtrace limit exceeded", buf, 0xCu);
          }
        }

      }
      if (!v78)
        goto LABEL_117;
LABEL_116:
      free(v78);
      goto LABEL_117;
    }
    __nwlog_obj();
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
    v209 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v261) = 0;
    if (__nwlog_fault(v209, type, &v261))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v210 = objc_claimAutoreleasedReturnValue();
        v211 = type[0];
        if (os_log_type_enabled(v210, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
          _os_log_impl(&dword_182FBE000, v210, v211, "%{public}s called with null endpoint", buf, 0xCu);
        }
      }
      else if ((_BYTE)v261)
      {
        v213 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v210 = objc_claimAutoreleasedReturnValue();
        v214 = type[0];
        v215 = os_log_type_enabled(v210, type[0]);
        if (v213)
        {
          if (v215)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v213;
            _os_log_impl(&dword_182FBE000, v210, v214, "%{public}s called with null endpoint, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v213);
          goto LABEL_267;
        }
        if (v215)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
          _os_log_impl(&dword_182FBE000, v210, v214, "%{public}s called with null endpoint, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v210 = objc_claimAutoreleasedReturnValue();
        v216 = type[0];
        if (os_log_type_enabled(v210, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
          _os_log_impl(&dword_182FBE000, v210, v216, "%{public}s called with null endpoint, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_267:
    if (v209)
      free(v209);
    v88 = 0;
LABEL_121:
    *((_BYTE *)object + 97) = *((_BYTE *)object + 97) & 0xBF | v88;
    v89 = v250;
    alloca = v89[4];
    v242 = v89;

    if (nw_parameters_get_privacy_proxy_fail_closed(alloca))
      v90 = 2;
    else
      v90 = 0;
    *((_BYTE *)object + 96) = *((_BYTE *)object + 96) & 0xFD | v90;
    if (nw_parameters_get_privacy_proxy_fail_closed_for_unreachable_hosts(alloca))
      v91 = 4;
    else
      v91 = 0;
    *((_BYTE *)object + 96) = *((_BYTE *)object + 96) & 0xFB | v91;
    if (nw_parameters_get_prohibit_privacy_proxy(alloca))
      *((_BYTE *)object + 96) |= 8u;
    v92 = v89;
    v237 = v92[5];

    v93 = (OS_nw_array *)nw_parameters_copy_custom_proxy_configs(alloca);
    v94 = object->custom_proxy_configs;
    object->custom_proxy_configs = v93;

    v95 = (unsigned __int8 *)object->custom_proxy_configs;
    if (v95)
    {
      *((_BYTE *)object + 97) |= 0x20u;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v280) = 0;
      v260[0] = MEMORY[0x1E0C809B0];
      v260[1] = 3221225472;
      v260[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke;
      v260[3] = &unk_1E14A8DC0;
      v260[4] = buf;
      nw_array_apply(v95, (uint64_t)v260);
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        v96 = nw_array_create();
        v97 = (unsigned __int8 *)object->custom_proxy_configs;
        v257[0] = MEMORY[0x1E0C809B0];
        v257[1] = 3221225472;
        v257[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_2;
        v257[3] = &unk_1E14A8D20;
        v98 = (OS_nw_array *)(id)v96;
        v258 = v98;
        v259 = v237;
        nw_array_apply(v97, (uint64_t)v257);
        v99 = object->custom_proxy_configs;
        object->custom_proxy_configs = v98;
        v100 = v98;

      }
      _Block_object_dispose(buf, 8);
    }
    v101 = v92;
    os_unfair_lock_lock((os_unfair_lock_t)v101 + 28);
    v102 = v101[8];
    lock = (os_unfair_lock_s *)(v101 + 14);
    os_unfair_lock_unlock((os_unfair_lock_t)v101 + 28);
    v235 = v101;

    v103 = (OS_nw_array *)nw_path_copy_proxy_configs(v102);
    v104 = object->path_proxy_configs;
    object->path_proxy_configs = v103;

    v105 = object;
    if (!object->custom_proxy_configs && object->path_proxy_configs)
    {
      v106 = nw_array_create();
      v107 = (unsigned __int8 *)object->path_proxy_configs;
      v253[0] = MEMORY[0x1E0C809B0];
      v253[1] = 3221225472;
      v253[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_3;
      v253[3] = &unk_1E14AA9F0;
      v254 = v237;
      v255 = v243;
      v108 = (OS_nw_array *)(id)v106;
      v256 = v108;
      nw_array_apply(v107, (uint64_t)v253);
      v109 = object->path_proxy_configs;
      object->path_proxy_configs = v108;
      v110 = v108;

      v105 = object;
    }
    if (nw_parameters_get_is_known_tracker(alloca))
      v111 = 16;
    else
      v111 = 0;
    *((_BYTE *)v105 + 97) = *((_BYTE *)v105 + 97) & 0xEF | v111;
    v112 = v235;
    v239[30] = 2;
    v244 = v112;

    *((_DWORD *)v244 + 20) = 65540;
    v238 = v244 + 10;
    nw_endpoint_handler_report(v244, 0, (_WORD *)v244 + 40, 0);
    v113 = v244;
    v114 = nw_endpoint_handler_copy_proxy(v113);
    v115 = v114;
    v116 = 40;
    if (!*((_QWORD *)v114 + 5))
      v116 = 48;
    v117 = *(id *)((char *)v114 + v116);
    v245 = v113;
    objecta = (unsigned __int8 *)v117;
    v118 = nw_endpoint_handler_copy_proxy(v245);
    v119 = v118;
    v261 = 0;
    v262 = (uint64_t)&v261;
    v263 = 0x2020000000;
    LOBYTE(v264) = 0;
    if (objecta && v118)
    {
      *(_QWORD *)type = MEMORY[0x1E0C809B0];
      v270 = 3221225472;
      v271 = (uint64_t)___ZL31nw_endpoint_proxy_check_for_pacP30NWConcrete_nw_endpoint_handlerPU22objcproto11OS_nw_array8NSObject_block_invoke;
      v272 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E14AB5F0;
      v273 = v118;
      v274 = (NWConcrete_nw_proxy_config *)&v261;
      nw_array_apply(objecta, (uint64_t)type);

    }
    v120 = v245;
    v121 = (v250[67] & 0x20) == 0;

    if (v121)
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v122 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
      {
        v123 = v120;

        v124 = v123;
        v125 = (v250[67] & 1) == 0;

        if (v125)
          v126 = "";
        else
          v126 = "dry-run ";
        v127 = nw_endpoint_handler_copy_endpoint(v124);
        v128 = nw_endpoint_get_logging_description(v127);
        v129 = v124;
        v130 = v129;
        v131 = v239[30];
        if (v131 > 5)
          v132 = "unknown-state";
        else
          v132 = off_1E149FC48[v131];
        v228 = v132;

        v133 = v130;
        v134 = v133;
        v246 = "path";
        switch(v232[29])
        {
          case 0u:
            goto LABEL_162;
          case 1u:
            v135 = "resolver";
            goto LABEL_161;
          case 2u:
            v246 = nw_endpoint_flow_mode_string(v133[31]);
            goto LABEL_162;
          case 3u:
            v135 = "proxy";
            goto LABEL_161;
          case 4u:
            v135 = "fallback";
            goto LABEL_161;
          case 5u:
            v135 = "transform";
            goto LABEL_161;
          default:
            v135 = "unknown-mode";
LABEL_161:
            v246 = v135;
LABEL_162:

            v136 = v134;
            os_unfair_lock_lock(lock);
            v137 = v235[8];
            os_unfair_lock_unlock(lock);

            v138 = *(_BYTE *)(v262 + 24) == 0;
            *(_DWORD *)buf = 136448002;
            *(_QWORD *)&buf[4] = "nw_endpoint_proxy_check_for_pac";
            if (v138)
              v139 = "does not have";
            else
              v139 = "has";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v123->id_str;
            *(_WORD *)&buf[22] = 2082;
            v280 = (uint64_t (*)(uint64_t, uint64_t))v126;
            *(_WORD *)v281 = 2082;
            *(_QWORD *)&v281[2] = v128;
            *(_WORD *)&v281[10] = 2082;
            *(_QWORD *)&v281[12] = v228;
            *(_WORD *)&v281[20] = 2082;
            *(_QWORD *)&v281[22] = v246;
            *(_WORD *)&v281[30] = 2114;
            v282 = v137;
            v283 = 2080;
            v284 = v139;
            _os_log_impl(&dword_182FBE000, v122, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] proxy %s PAC", buf, 0x52u);

            break;
        }
      }

    }
    _Block_object_dispose(&v261, 8);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v280 = __Block_byref_object_copy__26313;
    *(_QWORD *)v281 = __Block_byref_object_dispose__26314;
    *(_QWORD *)&v281[8] = 0;
    *(_QWORD *)type = MEMORY[0x1E0C809B0];
    v270 = 3221225472;
    v271 = (uint64_t)___ZL43nw_endpoint_proxy_check_for_companion_proxyPU22objcproto11OS_nw_array8NSObject_block_invoke;
    v272 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E14A8DC0;
    v273 = (void (*)(uint64_t))buf;
    nw_array_apply(objecta, (uint64_t)type);
    v247 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    v140 = v120;
    v141 = nw_endpoint_handler_copy_proxy(v140);
    v142 = (const void *)*((_QWORD *)v141 + 8);
    if (v142)
    {
      CFRelease(v142);
      *((_QWORD *)v141 + 8) = 0;
    }
    v143 = v140;
    v144 = v242[4];

    v145 = nw_parameters_copy_url_endpoint(v144);
    v146 = v145;
    if (v145)
    {
      v147 = (const __CFURL *)nw_endpoint_copy_cfurl(v145);
      *((_QWORD *)v141 + 8) = v147;
      if (!v147)
        goto LABEL_209;
    }
    else
    {
      v148 = nw_endpoint_handler_copy_endpoint(v143);
      v149 = *((_BYTE *)v141 + 97);
      type[0] = OS_LOG_TYPE_DEFAULT;
      log = v148;
      v150 = nw_endpoint_proxy_copy_synthesized_url(v148, v144, (v149 & 2) == 0, type);
      *((_QWORD *)v141 + 8) = v150;
      v151 = v150 == 0;
      v152 = v143;
      v153 = *((_BYTE *)v250 + 268);

      if (v151)
      {
        if ((v153 & 0x20) == 0)
        {
          if (__nwlog_connection_log::onceToken != -1)
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
          v164 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v164, OS_LOG_TYPE_DEBUG))
          {
            v165 = nw_endpoint_handler_get_id_string(v152);
            v233 = nw_endpoint_handler_dry_run_string(v152);
            v236 = v165;
            v240 = nw_endpoint_handler_copy_endpoint(v152);
            v166 = nw_endpoint_get_logging_description(v240);
            v167 = nw_endpoint_handler_state_string(v152);
            v168 = nw_endpoint_handler_mode_string(v152);
            v169 = nw_endpoint_handler_copy_current_path(v152);
            *(_DWORD *)buf = 136447746;
            *(_QWORD *)&buf[4] = "nw_endpoint_proxy_fillout_url";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v236;
            *(_WORD *)&buf[22] = 2082;
            v280 = (uint64_t (*)(uint64_t, uint64_t))v233;
            *(_WORD *)v281 = 2082;
            *(_QWORD *)&v281[2] = v166;
            *(_WORD *)&v281[10] = 2082;
            *(_QWORD *)&v281[12] = v167;
            *(_WORD *)&v281[20] = 2082;
            *(_QWORD *)&v281[22] = v168;
            *(_WORD *)&v281[30] = 2114;
            v282 = v169;
            _os_log_impl(&dword_182FBE000, v164, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Failed to synthesize URL", buf, 0x48u);

          }
        }
      }
      else
      {
        if ((v153 & 0x20) == 0)
        {
          if (__nwlog_connection_log::onceToken != -1)
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
          v154 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
          {
            v226 = v154;
            v155 = v152;

            v156 = v155;
            v157 = (v250[67] & 1) == 0;

            if (v157)
              v158 = "";
            else
              v158 = "dry-run ";
            v159 = nw_endpoint_handler_copy_endpoint(v156);
            v225 = nw_endpoint_get_logging_description(v159);
            v160 = v156;
            v161 = v160;
            v162 = v239[30];
            v224 = (uint64_t (*)(uint64_t, uint64_t))v158;
            if (v162 > 5)
              v163 = "unknown-state";
            else
              v163 = off_1E149FC48[v162];
            v241 = v163;

            v170 = v161;
            v171 = v170;
            v172 = "path";
            switch(v232[29])
            {
              case 0u:
                break;
              case 1u:
                v172 = "resolver";
                break;
              case 2u:
                v172 = nw_endpoint_flow_mode_string(v170[31]);
                break;
              case 3u:
                v172 = "proxy";
                break;
              case 4u:
                v172 = "fallback";
                break;
              case 5u:
                v172 = "transform";
                break;
              default:
                v172 = "unknown-mode";
                break;
            }
            v234 = (v149 & 2) == 0;

            v173 = v171;
            os_unfair_lock_lock(lock);
            v174 = v235[8];
            os_unfair_lock_unlock(lock);

            v175 = (const char *)*((_QWORD *)v141 + 8);
            *(_DWORD *)buf = 136448514;
            *(_QWORD *)&buf[4] = "nw_endpoint_proxy_fillout_url";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v155->id_str;
            *(_WORD *)&buf[22] = 2082;
            v280 = v224;
            *(_WORD *)v281 = 2082;
            *(_QWORD *)&v281[2] = v225;
            *(_WORD *)&v281[10] = 2082;
            *(_QWORD *)&v281[12] = v241;
            *(_WORD *)&v281[20] = 2082;
            *(_QWORD *)&v281[22] = v172;
            *(_WORD *)&v281[30] = 2114;
            v282 = v174;
            v283 = 2114;
            v284 = v175;
            v285 = 1024;
            v286 = v234;
            v287 = 1024;
            v288 = type[0];
            _os_log_impl(&dword_182FBE000, v226, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Synthesized URL %{public}@ (allowed to override scheme: %u, overrode scheme %u)", buf, 0x5Eu);

            v154 = v226;
          }

        }
        *((_BYTE *)v141 + 96) |= 0x40u;
        *((_BYTE *)v141 + 97) = *((_BYTE *)v141 + 97) & 0xFE | type[0];
      }

      v147 = (const __CFURL *)*((_QWORD *)v141 + 8);
      if (!v147)
        goto LABEL_209;
    }
    v176 = CFURLCopyScheme(v147);
    v177 = v176;
    if (!v176)
    {
LABEL_209:

      v180 = nw_array_create();
      v181 = (void *)*((_QWORD *)v115 + 7);
      *((_QWORD *)v115 + 7) = v180;

      *((_BYTE *)v115 + 96) &= ~0x20u;
      *((_DWORD *)v115 + 6) = 0;
      if ((*((_BYTE *)v115 + 97) & 0x40) != 0)
      {
        direct = nw_proxy_config_create_direct();
        if (direct)
          nw_array_append(*((_QWORD *)v115 + 7), direct);
      }
      else
      {
        v182 = v143;
        direct = (NWConcrete_nw_proxy_config *)v242[4];

        no_proxy = nw_parameters_get_no_proxy(direct);
        prefer_no_proxy = nw_parameters_get_prefer_no_proxy(&direct->super);
        v186 = nw_array_create();
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = ___ZL32nw_endpoint_proxy_process_configP30NWConcrete_nw_endpoint_handler_block_invoke;
        aBlock[3] = &unk_1E14AC200;
        v187 = (id)v186;
        v278 = v187;
        v188 = _Block_copy(aBlock);
        nw_array_apply(*((unsigned __int8 **)v115 + 6), (uint64_t)v188);
        nw_array_apply(*((unsigned __int8 **)v115 + 5), (uint64_t)v188);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = ___ZL32nw_endpoint_proxy_process_configP30NWConcrete_nw_endpoint_handler_block_invoke_2;
        v280 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E14A5260;
        v189 = v182;
        *(_QWORD *)v281 = v189;
        *(_QWORD *)&v281[8] = direct;
        v190 = v187;
        *(_QWORD *)&v281[16] = v190;
        v191 = v247;
        *(_QWORD *)&v281[24] = v191;
        nw_array_apply(objecta, (uint64_t)buf);
        v192 = prefer_no_proxy | no_proxy;
        if ((prefer_no_proxy | no_proxy) == 1)
        {
          v193 = nw_proxy_config_create_direct();
          if (v193)
            nw_array_append(*((_QWORD *)v115 + 7), v193);

        }
        if ((no_proxy & 1) == 0)
        {
          *(_QWORD *)type = MEMORY[0x1E0C809B0];
          v270 = 3221225472;
          v271 = (uint64_t)___ZL32nw_endpoint_proxy_process_configP30NWConcrete_nw_endpoint_handler_block_invoke_3;
          v272 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E14A5260;
          v273 = v189;
          v274 = direct;
          v275 = v190;
          v276 = v191;
          nw_array_apply(objecta, (uint64_t)type);

        }
        if ((v192 & 1) == 0 && ((*((_BYTE *)v115 + 96) & 0x20) == 0 || nw_array_is_empty(*((_QWORD *)v115 + 7))))
        {
          v194 = nw_proxy_config_create_direct();
          if (v194)
            nw_array_append(*((_QWORD *)v115 + 7), v194);

        }
        if ((no_proxy & 1) == 0)
        {
          v261 = MEMORY[0x1E0C809B0];
          v262 = 3221225472;
          v263 = (uint64_t)___ZL32nw_endpoint_proxy_process_configP30NWConcrete_nw_endpoint_handler_block_invoke_4;
          v264 = &unk_1E14A5260;
          v265 = v189;
          v266 = direct;
          v267 = v190;
          v268 = v191;
          nw_array_apply(objecta, (uint64_t)&v261);

        }
      }

      *((_DWORD *)v244 + 20) = 131076;
      nw_endpoint_handler_report(v143, 0, v238, 0);

      v195 = v143;
      v196 = (id *)nw_endpoint_handler_copy_proxy(v195);
      *((_DWORD *)v244 + 20) = 196612;
      nw_endpoint_handler_report(v195, 0, v238, 0);
      *(_QWORD *)type = 0;
      v270 = (uint64_t)type;
      v271 = 0x3032000000;
      v272 = __Block_byref_object_copy__26313;
      v273 = __Block_byref_object_dispose__26314;
      v274 = 0;
      v197 = (unsigned __int8 *)v196[7];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___ZL32nw_endpoint_proxy_resolve_configP30NWConcrete_nw_endpoint_handler_block_invoke;
      v280 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E14A51E8;
      v198 = v195;
      *(_QWORD *)v281 = v198;
      v199 = v196;
      *(_QWORD *)&v281[8] = v199;
      *(_QWORD *)&v281[16] = type;
      nw_array_apply(v197, (uint64_t)buf);
      v200 = *(void **)(v270 + 40);
      if (v200)
        objc_storeStrong(v196 + 7, v200);
      nw_endpoint_proxy_complete_resolve(v198);

      _Block_object_dispose(type, 8);
      goto LABEL_230;
    }
    if (CFStringCompare(v176, CFSTR("https"), 1uLL) && CFStringCompare(v177, CFSTR("wss"), 1uLL))
    {
      if (CFStringCompare(v177, CFSTR("http"), 1uLL) && CFStringCompare(v177, CFSTR("ws"), 1uLL))
        goto LABEL_208;
      v178 = 0x80;
      v179 = 97;
    }
    else
    {
      v178 = 1;
      v179 = 98;
    }
    *((_BYTE *)v141 + v179) |= v178;
LABEL_208:
    CFRelease(v177);
    goto LABEL_209;
  }
LABEL_231:

}

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  id v6;
  void *v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned int *v10;
  char v11;
  NSObject *v12;
  unsigned int *v13;
  unsigned int *v14;
  char v15;
  const char *v16;
  nw_endpoint_t v17;
  const char *logging_description;
  unsigned int *v19;
  unsigned int *v20;
  uint64_t v21;
  const char *v22;
  id v23;
  const char *v24;
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  const char *v28;
  char *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  const char *v32;
  void **v33;
  void **v34;
  unsigned int v35;
  const char *v36;
  os_log_type_t v37;
  const char *v38;
  const char *v39;
  void **v40;
  id v41;
  unsigned __int8 *child_endpoint_handlers;
  OS_nw_array *v43;
  OS_nw_array *failed_child_endpoint_handlers;
  OS_nw_array *pac_resolvers;
  OS_nw_array *custom_proxy_configs;
  OS_nw_array *path_proxy_configs;
  OS_nw_array *parsed_proxy_configs;
  uint64_t v49;
  __CFURL *url;
  void *child_timer;
  void *v52;
  os_log_type_t v53;
  char *backtrace_string;
  os_log_type_t v55;
  _BOOL4 v56;
  os_log_type_t v57;
  const char *v58;
  char *v59;
  void *v60;
  _QWORD v61[4];
  BOOL v62;
  char v63;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    __nwlog_obj();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
    v25 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v63 = 0;
    if (__nwlog_fault(v25, &type, &v63))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v26 = objc_claimAutoreleasedReturnValue();
        v53 = type;
        if (os_log_type_enabled(v26, type))
        {
          *(_DWORD *)buf = 136446210;
          v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v26, v53, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_57;
      }
      if (!v63)
      {
        __nwlog_obj();
        v26 = objc_claimAutoreleasedReturnValue();
        v57 = type;
        if (os_log_type_enabled(v26, type))
        {
          *(_DWORD *)buf = 136446210;
          v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v26, v57, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_57;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v26 = objc_claimAutoreleasedReturnValue();
      v55 = type;
      v56 = os_log_type_enabled(v26, type);
      if (!backtrace_string)
      {
        if (v56)
        {
          *(_DWORD *)buf = 136446210;
          v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v26, v55, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_57;
      }
      if (v56)
      {
        *(_DWORD *)buf = 136446466;
        v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
        v67 = 2082;
        v68 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v26, v55, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_58:
    if (!v25)
      goto LABEL_60;
LABEL_59:
    free(v25);
    goto LABEL_60;
  }
  v8 = (unsigned int *)v6;
  v9 = v8[29];

  if ((_DWORD)v9 == 3)
  {
    v10 = v8;
    v11 = *((_BYTE *)v10 + 268);

    if ((v11 & 0x20) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v12 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v60 = v7;
        v13 = v10;

        v14 = v13;
        v15 = *((_BYTE *)v10 + 268);

        if ((v15 & 1) != 0)
          v16 = "dry-run ";
        else
          v16 = "";
        v17 = nw_endpoint_handler_copy_endpoint(v14);
        logging_description = nw_endpoint_get_logging_description(v17);
        v59 = (char *)(v13 + 42);
        v19 = v14;
        v20 = v19;
        v21 = v19[30];
        if (v21 > 5)
          v22 = "unknown-state";
        else
          v22 = off_1E149FC48[v21];
        v58 = v22;

        v33 = v20;
        v34 = v33;
        v35 = v8[29];
        v36 = "path";
        switch(v35)
        {
          case 0u:
            break;
          case 1u:
            v36 = "resolver";
            break;
          case 2u:
            v36 = nw_endpoint_flow_mode_string(v33[31]);
            break;
          case 3u:
            v36 = "proxy";
            break;
          case 4u:
            v36 = "fallback";
            break;
          case 5u:
            v36 = "transform";
            break;
          default:
            v36 = "unknown-mode";
            break;
        }

        v40 = v34;
        os_unfair_lock_lock((os_unfair_lock_t)v40 + 28);
        v41 = v40[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v40 + 28);

        *(_DWORD *)buf = 136447746;
        v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
        v67 = 2082;
        v68 = v59;
        v69 = 2082;
        v70 = v16;
        v71 = 2082;
        v72 = (void *)logging_description;
        v73 = 2082;
        v74 = v58;
        v75 = 2082;
        v76 = v36;
        v77 = 2114;
        v78 = v41;
        _os_log_impl(&dword_182FBE000, v12, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);

        v7 = v60;
      }

    }
    child_endpoint_handlers = (unsigned __int8 *)self->child_endpoint_handlers;
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __57__NWConcrete_nw_endpoint_proxy_cancelWithHandler_forced___block_invoke;
    v61[3] = &__block_descriptor_33_e35_B24__0Q8__NSObject_OS_nw_object__16l;
    v62 = a4;
    nw_array_apply(child_endpoint_handlers, (uint64_t)v61);
    v43 = self->child_endpoint_handlers;
    self->child_endpoint_handlers = 0;

    failed_child_endpoint_handlers = self->failed_child_endpoint_handlers;
    self->failed_child_endpoint_handlers = 0;

    pac_resolvers = self->pac_resolvers;
    self->pac_resolvers = 0;

    custom_proxy_configs = self->custom_proxy_configs;
    self->custom_proxy_configs = 0;

    path_proxy_configs = self->path_proxy_configs;
    self->path_proxy_configs = 0;

    parsed_proxy_configs = self->parsed_proxy_configs;
    self->parsed_proxy_configs = 0;

    url = self->url;
    if (url)
    {
      CFRelease(url);
      self->url = 0;
    }
    child_timer = self->child_timer;
    if (child_timer)
    {
      nw_queue_cancel_source((uint64_t)child_timer, v49);
      self->child_timer = 0;
    }
    goto LABEL_60;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v23 = (id)gLogObj;
  if (v9 > 5)
    v24 = "unknown-mode";
  else
    v24 = off_1E149FC18[v9];
  *(_DWORD *)buf = 136446722;
  v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
  v67 = 2082;
  v68 = (void *)v24;
  v69 = 2082;
  v70 = "proxy";
  v25 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v63 = 0;
  if (!__nwlog_fault(v25, &type, &v63))
    goto LABEL_58;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v26 = (id)gLogObj;
    v27 = type;
    if (os_log_type_enabled(v26, type))
    {
      if (v9 > 5)
        v28 = "unknown-mode";
      else
        v28 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
      v67 = 2082;
      v68 = (void *)v28;
      v69 = 2082;
      v70 = "proxy";
      _os_log_impl(&dword_182FBE000, v26, v27, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_57:

    goto LABEL_58;
  }
  if (!v63)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v26 = (id)gLogObj;
    v37 = type;
    if (os_log_type_enabled(v26, type))
    {
      if (v9 > 5)
        v38 = "unknown-mode";
      else
        v38 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
      v67 = 2082;
      v68 = (void *)v38;
      v69 = 2082;
      v70 = "proxy";
      _os_log_impl(&dword_182FBE000, v26, v37, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_57;
  }
  v29 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v26 = (id)gLogObj;
  v30 = type;
  v31 = os_log_type_enabled(v26, type);
  if (!v29)
  {
    if (v31)
    {
      if (v9 > 5)
        v39 = "unknown-mode";
      else
        v39 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
      v67 = 2082;
      v68 = (void *)v39;
      v69 = 2082;
      v70 = "proxy";
      _os_log_impl(&dword_182FBE000, v26, v30, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_57;
  }
  if (v31)
  {
    if (v9 > 5)
      v32 = "unknown-mode";
    else
      v32 = off_1E149FC18[v9];
    *(_DWORD *)buf = 136446978;
    v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
    v67 = 2082;
    v68 = (void *)v32;
    v69 = 2082;
    v70 = "proxy";
    v71 = 2082;
    v72 = v29;
    _os_log_impl(&dword_182FBE000, v26, v30, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v29);
  if (v25)
    goto LABEL_59;
LABEL_60:

}

- (void)updatePathWithHandler:(id)a3
{
  id v4;
  void *v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned int *v8;
  os_unfair_lock_s *v9;
  id v10;
  BOOL should_use_proxy;
  unsigned int *v12;
  id v13;
  id v14;
  OS_nw_array *v15;
  OS_nw_array *v16;
  OS_nw_array *v17;
  OS_nw_array *v18;
  _BOOL4 v19;
  id v20;
  const char *v21;
  char *v22;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  unsigned int *v26;
  char v27;
  NSObject *v28;
  char *v29;
  char *v30;
  char v31;
  const char *v32;
  nw_endpoint_t v33;
  char *v34;
  unsigned int *v35;
  unsigned int *v36;
  uint64_t v37;
  const char *v38;
  char *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  const char *v42;
  os_log_type_t v43;
  const char *v44;
  void **v45;
  void **v46;
  unsigned int v47;
  const char *v48;
  const char *v49;
  unsigned int *v50;
  unsigned int *v51;
  char v52;
  NSObject *v53;
  const char *v54;
  const char *v55;
  nw_endpoint_t v56;
  const char *v57;
  const char *v58;
  const char *v59;
  id v60;
  void **v61;
  id v62;
  unsigned int *v63;
  int minimize_logging;
  char logging_disabled;
  NSObject *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  id v73;
  unsigned int *v74;
  void *v75;
  os_log_type_t v76;
  char *backtrace_string;
  os_log_type_t v78;
  _BOOL4 v79;
  const char *id_string;
  const char *v81;
  nw_endpoint_t v82;
  const char *logging_description;
  const char *v84;
  const char *v85;
  id v86;
  os_log_type_t v87;
  const char *v88;
  nw_endpoint_t v89;
  const char *v90;
  const char *v91;
  const char *v92;
  id v93;
  NSObject *v94;
  nw_endpoint_t v95;
  const char *v96;
  const char *v97;
  const char *v98;
  id v99;
  nw_endpoint_t v100;
  const char *v101;
  os_log_t log;
  NSObject *loga;
  NSObject *logb;
  const char *logc;
  const char *logd;
  const char *v107;
  id v108;
  id v109;
  char v110;
  os_log_type_t type[8];
  os_log_type_t *v112;
  uint64_t v113;
  char v114;
  _BYTE buf[24];
  const char *v116;
  _BYTE v117[20];
  __int16 v118;
  const char *v119;
  __int16 v120;
  id v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v110 = 0;
    if (!__nwlog_fault(v22, type, &v110))
      goto LABEL_85;
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v76 = type[0];
      if (os_log_type_enabled(v23, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        _os_log_impl(&dword_182FBE000, v23, v76, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v110)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v78 = type[0];
      v79 = os_log_type_enabled(v23, type[0]);
      if (backtrace_string)
      {
        if (v79)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = backtrace_string;
          _os_log_impl(&dword_182FBE000, v23, v78, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_85;
      }
      if (v79)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        _os_log_impl(&dword_182FBE000, v23, v78, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v87 = type[0];
      if (os_log_type_enabled(v23, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        _os_log_impl(&dword_182FBE000, v23, v87, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_84:

    goto LABEL_85;
  }
  v6 = (unsigned int *)v4;
  v7 = v6[29];

  if ((_DWORD)v7 != 3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v20 = (id)gLogObj;
    if (v7 > 5)
      v21 = "unknown-mode";
    else
      v21 = off_1E149FC18[v7];
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2082;
    v116 = "proxy";
    v22 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v110 = 0;
    if (__nwlog_fault(v22, type, &v110))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v23 = (id)gLogObj;
        v24 = type[0];
        if (os_log_type_enabled(v23, type[0]))
        {
          if (v7 > 5)
            v25 = "unknown-mode";
          else
            v25 = off_1E149FC18[v7];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v25;
          *(_WORD *)&buf[22] = 2082;
          v116 = "proxy";
          _os_log_impl(&dword_182FBE000, v23, v24, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v110)
      {
        v39 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v23 = (id)gLogObj;
        v40 = type[0];
        v41 = os_log_type_enabled(v23, type[0]);
        if (v39)
        {
          if (v41)
          {
            if (v7 > 5)
              v42 = "unknown-mode";
            else
              v42 = off_1E149FC18[v7];
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v42;
            *(_WORD *)&buf[22] = 2082;
            v116 = "proxy";
            *(_WORD *)v117 = 2082;
            *(_QWORD *)&v117[2] = v39;
            _os_log_impl(&dword_182FBE000, v23, v40, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v39);
          if (!v22)
            goto LABEL_87;
LABEL_86:
          free(v22);
          goto LABEL_87;
        }
        if (v41)
        {
          if (v7 > 5)
            v49 = "unknown-mode";
          else
            v49 = off_1E149FC18[v7];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v49;
          *(_WORD *)&buf[22] = 2082;
          v116 = "proxy";
          _os_log_impl(&dword_182FBE000, v23, v40, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v23 = (id)gLogObj;
        v43 = type[0];
        if (os_log_type_enabled(v23, type[0]))
        {
          if (v7 > 5)
            v44 = "unknown-mode";
          else
            v44 = off_1E149FC18[v7];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v44;
          *(_WORD *)&buf[22] = 2082;
          v116 = "proxy";
          _os_log_impl(&dword_182FBE000, v23, v43, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_84;
    }
LABEL_85:
    if (!v22)
      goto LABEL_87;
    goto LABEL_86;
  }
  v8 = v6;
  v9 = (os_unfair_lock_s *)(v8 + 28);
  os_unfair_lock_lock((os_unfair_lock_t)v8 + 28);
  v10 = *((id *)v8 + 8);
  os_unfair_lock_unlock((os_unfair_lock_t)v8 + 28);

  should_use_proxy = nw_endpoint_proxy_unsatisfied_handler_should_use_proxy(v10);
  if (!should_use_proxy)
  {
    if (nw_endpoint_handler_get_minimize_logging(v8))
    {
      if ((nw_endpoint_handler_get_logging_disabled(v8) & 1) != 0)
        goto LABEL_70;
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v28 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        id_string = nw_endpoint_handler_get_id_string(v8);
        v81 = nw_endpoint_handler_dry_run_string(v8);
        v82 = nw_endpoint_handler_copy_endpoint(v8);
        logging_description = nw_endpoint_get_logging_description(v82);
        v84 = nw_endpoint_handler_state_string(v8);
        v85 = nw_endpoint_handler_mode_string(v8);
        v86 = nw_endpoint_handler_copy_current_path(v8);
        *(_DWORD *)buf = 136447746;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = id_string;
        *(_WORD *)&buf[22] = 2082;
        v116 = v81;
        *(_WORD *)v117 = 2082;
        *(_QWORD *)&v117[2] = logging_description;
        *(_WORD *)&v117[10] = 2082;
        *(_QWORD *)&v117[12] = v84;
        v118 = 2082;
        v119 = v85;
        v120 = 2114;
        v121 = v86;
        _os_log_impl(&dword_182FBE000, v28, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] resetting due to disallowed proxy settings", buf, 0x48u);

      }
    }
    else
    {
      v26 = v8;
      v27 = *((_BYTE *)v26 + 268);

      if ((v27 & 0x20) != 0)
      {
LABEL_70:
        nw_endpoint_handler_reset_mode(v8, 1);
        goto LABEL_87;
      }
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v28 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = v26;

        v30 = v29;
        v31 = *((_BYTE *)v26 + 268);

        if ((v31 & 1) != 0)
          v32 = "dry-run ";
        else
          v32 = "";
        v33 = nw_endpoint_handler_copy_endpoint(v30);
        v107 = nw_endpoint_get_logging_description(v33);
        log = (os_log_t)v32;
        v34 = v29 + 168;
        v35 = v30;
        v36 = v35;
        v37 = v35[30];
        if (v37 > 5)
          v38 = "unknown-state";
        else
          v38 = off_1E149FC48[v37];

        v45 = v36;
        v46 = v45;
        v47 = v6[29];
        v48 = "path";
        switch(v47)
        {
          case 0u:
            break;
          case 1u:
            v48 = "resolver";
            break;
          case 2u:
            v48 = nw_endpoint_flow_mode_string(v45[31]);
            break;
          case 3u:
            v48 = "proxy";
            break;
          case 4u:
            v48 = "fallback";
            break;
          case 5u:
            v48 = "transform";
            break;
          default:
            v48 = "unknown-mode";
            break;
        }

        v61 = v46;
        os_unfair_lock_lock(v9);
        v62 = *((id *)v8 + 8);
        os_unfair_lock_unlock(v9);

        *(_DWORD *)buf = 136447746;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v34;
        *(_WORD *)&buf[22] = 2082;
        v116 = (const char *)log;
        *(_WORD *)v117 = 2082;
        *(_QWORD *)&v117[2] = v107;
        *(_WORD *)&v117[10] = 2082;
        *(_QWORD *)&v117[12] = v38;
        v118 = 2082;
        v119 = v48;
        v120 = 2114;
        v121 = v62;
        _os_log_impl(&dword_182FBE000, v28, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] resetting due to disallowed proxy settings", buf, 0x48u);

      }
    }

    goto LABEL_70;
  }
  if ((*((_BYTE *)self + 97) & 8) == 0 && (*((_BYTE *)self + 97) & 0x20) == 0 && !self->connected_child)
  {
    v12 = v8;
    os_unfair_lock_lock(v9);
    v13 = *((id *)v8 + 8);
    os_unfair_lock_unlock(v9);

    v14 = nw_path_copy_proxy_configs(v13);
    if (v14)
    {
      v15 = self->path_proxy_configs;
      v16 = (OS_nw_array *)v14;
      v17 = v16;
      if (v15 == v16)
      {

        goto LABEL_81;
      }
      if (!v15 || v15[3].super.super.isa - v15[2].super.super.isa != v16[3].super.super.isa - v16[2].super.super.isa)
      {

        goto LABEL_72;
      }
      *(_QWORD *)type = 0;
      v112 = type;
      v113 = 0x2020000000;
      v114 = 1;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___ZL35nw_endpoint_proxy_configs_are_equalPU22objcproto11OS_nw_array8NSObjectS1__block_invoke;
      v116 = (const char *)&unk_1E14AB5F0;
      v18 = v16;
      *(_QWORD *)v117 = v18;
      *(_QWORD *)&v117[8] = type;
      nw_array_apply((unsigned __int8 *)v15, (uint64_t)buf);
      v19 = *((_BYTE *)v112 + 24) == 0;

      _Block_object_dispose(type, 8);
      if (v19)
      {
LABEL_72:
        v63 = v12;
        v63[66] = 0;

        v63[20] = 393220;
        nw_endpoint_handler_report(v63, 0, (_WORD *)v63 + 40, 0);
        minimize_logging = nw_endpoint_handler_get_minimize_logging(v63);
        logging_disabled = nw_endpoint_handler_get_logging_disabled(v63);
        if (minimize_logging)
        {
          if ((logging_disabled & 1) != 0)
            goto LABEL_79;
          v109 = v14;
          if (__nwlog_connection_log::onceToken != -1)
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
          v94 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            logd = nw_endpoint_handler_get_id_string(v63);
            v101 = nw_endpoint_handler_dry_run_string(v63);
            v95 = nw_endpoint_handler_copy_endpoint(v63);
            v96 = nw_endpoint_get_logging_description(v95);
            v97 = nw_endpoint_handler_state_string(v63);
            v98 = nw_endpoint_handler_mode_string(v63);
            v99 = nw_endpoint_handler_copy_current_path(v63);
            *(_DWORD *)buf = 136447746;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = logd;
            *(_WORD *)&buf[22] = 2082;
            v116 = v101;
            *(_WORD *)v117 = 2082;
            *(_QWORD *)&v117[2] = v96;
            *(_WORD *)&v117[10] = 2082;
            *(_QWORD *)&v117[12] = v97;
            v118 = 2082;
            v119 = v98;
            v120 = 2114;
            v121 = v99;
            v66 = v94;
            _os_log_impl(&dword_182FBE000, v94, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] restarting due to changing proxy settings", buf, 0x48u);

            v14 = v109;
          }
          else
          {
            v66 = v94;
          }
        }
        else
        {
          if ((logging_disabled & 1) != 0)
          {
LABEL_79:
            v74 = v63;
            v74[30] = 1;

            -[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:](self, "cancelWithHandler:forced:", v74, 1);
            -[NWConcrete_nw_endpoint_proxy startWithHandler:](self, "startWithHandler:", v74);
            goto LABEL_81;
          }
          if (__nwlog_connection_log::onceToken != -1)
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
          v66 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            v67 = nw_endpoint_handler_get_id_string(v63);
            v68 = nw_endpoint_handler_dry_run_string(v63);
            logb = v66;
            v108 = v14;
            v69 = v67;
            v100 = nw_endpoint_handler_copy_endpoint(v63);
            v70 = nw_endpoint_get_logging_description(v100);
            v71 = nw_endpoint_handler_state_string(v63);
            v72 = nw_endpoint_handler_mode_string(v63);
            v73 = nw_endpoint_handler_copy_current_path(v63);
            *(_DWORD *)buf = 136447746;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v69;
            *(_WORD *)&buf[22] = 2082;
            v116 = v68;
            *(_WORD *)v117 = 2082;
            *(_QWORD *)&v117[2] = v70;
            *(_WORD *)&v117[10] = 2082;
            *(_QWORD *)&v117[12] = v71;
            v118 = 2082;
            v119 = v72;
            v120 = 2114;
            v121 = v73;
            v66 = logb;
            _os_log_impl(&dword_182FBE000, logb, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] restarting due to changing proxy settings", buf, 0x48u);

            v14 = v108;
          }
        }

        goto LABEL_79;
      }
LABEL_81:

      goto LABEL_87;
    }
    v50 = v12;
    v50[66] = 1;

    v50[20] = 393220;
    nw_endpoint_handler_report(v50, 0, (_WORD *)v50 + 40, 0);
    if (nw_endpoint_handler_get_minimize_logging(v50))
    {
      if ((nw_endpoint_handler_get_logging_disabled(v50) & 1) != 0)
        goto LABEL_59;
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v53 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        v88 = nw_endpoint_handler_get_id_string(v50);
        logc = nw_endpoint_handler_dry_run_string(v50);
        v89 = nw_endpoint_handler_copy_endpoint(v50);
        v90 = nw_endpoint_get_logging_description(v89);
        v91 = nw_endpoint_handler_state_string(v50);
        v92 = nw_endpoint_handler_mode_string(v50);
        v93 = nw_endpoint_handler_copy_current_path(v50);
        *(_DWORD *)buf = 136447746;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v88;
        *(_WORD *)&buf[22] = 2082;
        v116 = logc;
        *(_WORD *)v117 = 2082;
        *(_QWORD *)&v117[2] = v90;
        *(_WORD *)&v117[10] = 2082;
        *(_QWORD *)&v117[12] = v91;
        v118 = 2082;
        v119 = v92;
        v120 = 2114;
        v121 = v93;
        _os_log_impl(&dword_182FBE000, v53, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] resetting due to losing proxy settings", buf, 0x48u);

        v14 = 0;
      }
    }
    else
    {
      v51 = v50;
      v52 = *((_BYTE *)v51 + 268);

      if ((v52 & 0x20) != 0)
      {
LABEL_59:
        nw_endpoint_handler_reset_mode(v50, 1);
        goto LABEL_81;
      }
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v53 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        v54 = nw_endpoint_handler_get_id_string(v51);
        v55 = nw_endpoint_handler_dry_run_string(v51);
        loga = v53;
        v56 = nw_endpoint_handler_copy_endpoint(v51);
        v57 = nw_endpoint_get_logging_description(v56);
        v58 = nw_endpoint_handler_state_string(v51);
        v59 = nw_endpoint_handler_mode_string(v51);
        v60 = nw_endpoint_handler_copy_current_path(v51);
        *(_DWORD *)buf = 136447746;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v54;
        *(_WORD *)&buf[22] = 2082;
        v116 = v55;
        *(_WORD *)v117 = 2082;
        *(_QWORD *)&v117[2] = v57;
        *(_WORD *)&v117[10] = 2082;
        *(_QWORD *)&v117[12] = v58;
        v118 = 2082;
        v119 = v59;
        v120 = 2114;
        v121 = v60;
        v53 = loga;
        _os_log_impl(&dword_182FBE000, loga, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] resetting due to losing proxy settings", buf, 0x48u);

        v14 = 0;
      }
    }

    goto LABEL_59;
  }
LABEL_87:

}

- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4
{
  id v6;
  id v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned __int8 *child_endpoint_handlers;
  BOOL v11;
  id v12;
  const char *v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  char *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  const char *v21;
  os_log_type_t v22;
  const char *v23;
  const char *v24;
  void *v26;
  os_log_type_t v27;
  void *v28;
  os_log_type_t v29;
  char *backtrace_string;
  os_log_type_t v31;
  _BOOL4 v32;
  os_log_type_t v33;
  _BOOL4 v34;
  os_log_type_t v35;
  os_log_type_t v36;
  _QWORD v37[4];
  id v38;
  char v39;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    __nwlog_obj();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
    v14 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v39 = 0;
    if (!__nwlog_fault(v14, &type, &v39))
      goto LABEL_37;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v27 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v27, "%{public}s called with null handler", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (!v39)
    {
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v35 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v35, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    v31 = type;
    v32 = os_log_type_enabled(v15, type);
    if (!backtrace_string)
    {
      if (v32)
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v31, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v32)
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
      v43 = 2082;
      v44 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v15, v31, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_60:

    free(backtrace_string);
    goto LABEL_37;
  }
  v8 = (unsigned int *)v6;
  v9 = v8[29];

  if ((_DWORD)v9 != 3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    if (v9 > 5)
      v13 = "unknown-mode";
    else
      v13 = off_1E149FC18[v9];
    *(_DWORD *)buf = 136446722;
    v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
    v43 = 2082;
    v44 = (void *)v13;
    v45 = 2082;
    v46 = "proxy";
    v14 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v39 = 0;
    if (__nwlog_fault(v14, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v16 = type;
        if (os_log_type_enabled(v15, type))
        {
          if (v9 > 5)
            v17 = "unknown-mode";
          else
            v17 = off_1E149FC18[v9];
          *(_DWORD *)buf = 136446722;
          v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
          v43 = 2082;
          v44 = (void *)v17;
          v45 = 2082;
          v46 = "proxy";
          _os_log_impl(&dword_182FBE000, v15, v16, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v39)
      {
        v18 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v19 = type;
        v20 = os_log_type_enabled(v15, type);
        if (v18)
        {
          if (v20)
          {
            if (v9 > 5)
              v21 = "unknown-mode";
            else
              v21 = off_1E149FC18[v9];
            *(_DWORD *)buf = 136446978;
            v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
            v43 = 2082;
            v44 = (void *)v21;
            v45 = 2082;
            v46 = "proxy";
            v47 = 2082;
            v48 = v18;
            _os_log_impl(&dword_182FBE000, v15, v19, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v18);
          if (!v14)
            goto LABEL_39;
          goto LABEL_38;
        }
        if (v20)
        {
          if (v9 > 5)
            v24 = "unknown-mode";
          else
            v24 = off_1E149FC18[v9];
          *(_DWORD *)buf = 136446722;
          v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
          v43 = 2082;
          v44 = (void *)v24;
          v45 = 2082;
          v46 = "proxy";
          _os_log_impl(&dword_182FBE000, v15, v19, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v22 = type;
        if (os_log_type_enabled(v15, type))
        {
          if (v9 > 5)
            v23 = "unknown-mode";
          else
            v23 = off_1E149FC18[v9];
          *(_DWORD *)buf = 136446722;
          v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
          v43 = 2082;
          v44 = (void *)v23;
          v45 = 2082;
          v46 = "proxy";
          _os_log_impl(&dword_182FBE000, v15, v22, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_36;
    }
LABEL_37:
    if (!v14)
    {
LABEL_39:
      v11 = 1;
      goto LABEL_40;
    }
LABEL_38:
    free(v14);
    goto LABEL_39;
  }
  if (!v7)
  {
    __nwlog_obj();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
    v14 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v39 = 0;
    if (!__nwlog_fault(v14, &type, &v39))
      goto LABEL_37;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v29 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v29, "%{public}s called with null applyBlock", buf, 0xCu);
      }
LABEL_36:

      goto LABEL_37;
    }
    if (!v39)
    {
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v36 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v36, "%{public}s called with null applyBlock, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    v33 = type;
    v34 = os_log_type_enabled(v15, type);
    if (!backtrace_string)
    {
      if (v34)
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v33, "%{public}s called with null applyBlock, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v34)
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
      v43 = 2082;
      v44 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v15, v33, "%{public}s called with null applyBlock, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_60;
  }
  child_endpoint_handlers = (unsigned __int8 *)self->child_endpoint_handlers;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __60__NWConcrete_nw_endpoint_proxy_applyWithHandler_toChildren___block_invoke;
  v37[3] = &unk_1E14AC278;
  v38 = v7;
  v11 = nw_array_apply(child_endpoint_handlers, (uint64_t)v37);

LABEL_40:
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->child_error, 0);
  objc_storeStrong((id *)&self->pac_resolvers, 0);
  objc_storeStrong((id *)&self->parsed_proxy_configs, 0);
  objc_storeStrong((id *)&self->path_proxy_configs, 0);
  objc_storeStrong((id *)&self->custom_proxy_configs, 0);
  objc_storeStrong((id *)&self->connected_child, 0);
  objc_storeStrong((id *)&self->failed_child_endpoint_handlers, 0);
  objc_storeStrong((id *)&self->child_endpoint_handlers, 0);
}

@end
