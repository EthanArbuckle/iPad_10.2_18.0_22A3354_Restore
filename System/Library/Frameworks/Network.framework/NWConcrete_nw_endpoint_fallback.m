@implementation NWConcrete_nw_endpoint_fallback

- (NWConcrete_nw_endpoint_fallback)init
{
  NWConcrete_nw_endpoint_fallback *v2;
  NWConcrete_nw_endpoint_fallback *v3;
  NWConcrete_nw_endpoint_fallback *v4;
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
  v16.super_class = (Class)NWConcrete_nw_endpoint_fallback;
  v2 = -[NWConcrete_nw_endpoint_fallback init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_fallback init]";
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
        v18 = "-[NWConcrete_nw_endpoint_fallback init]";
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
          v18 = "-[NWConcrete_nw_endpoint_fallback init]";
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
        v18 = "-[NWConcrete_nw_endpoint_fallback init]";
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
        v18 = "-[NWConcrete_nw_endpoint_fallback init]";
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
  v2.super_class = (Class)NWConcrete_nw_endpoint_fallback;
  -[NWConcrete_nw_endpoint_fallback dealloc](&v2, sel_dealloc);
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
  const char *v41;
  void **v42;
  id v43;
  NWConcrete_nw_endpoint_handler *primary_child;
  NWConcrete_nw_endpoint_handler *fallback_child;
  OS_nw_interface *primary_interface;
  OS_nw_interface *fallback_interface;
  char *v48;
  _BYTE *v49;
  char v50;
  char v51;
  char v52;
  char v53;
  id *v54;
  _QWORD *v55;
  int v56;
  id *v57;
  _BOOL4 v58;
  NSObject *v59;
  id *v60;
  id *v61;
  _BOOL4 v62;
  const char *v63;
  nw_endpoint_t v64;
  const char *v65;
  id *v66;
  id *v67;
  uint64_t v68;
  const char *v69;
  void **v70;
  const char *v71;
  id *v72;
  nw_endpoint_t v73;
  void **v74;
  id v75;
  id v76;
  id v77;
  OS_nw_interface *v78;
  OS_nw_interface *v79;
  id *v80;
  unsigned int fallback_interface_index;
  unsigned int v82;
  id v83;
  OS_nw_interface *v84;
  OS_nw_interface *v85;
  OS_nw_interface *v86;
  OS_nw_interface *v87;
  int v88;
  char v89;
  NWConcrete_nw_parameters *v90;
  char v91;
  NWConcrete_nw_endpoint_handler *inner;
  id *v93;
  _BOOL4 v94;
  NSObject *v95;
  id *v96;
  char *v97;
  _BOOL4 v98;
  const char *v99;
  nw_endpoint_t v100;
  const char *v101;
  char *v102;
  char *v103;
  uint64_t v104;
  const char *v105;
  NWConcrete_nw_endpoint_handler *v106;
  NWConcrete_nw_endpoint_handler *v107;
  NWConcrete_nw_endpoint_handler *v108;
  NWConcrete_nw_endpoint_handler *v109;
  uint64_t v110;
  NWConcrete_nw_endpoint_mode_handler *v111;
  uint64_t v112;
  NWConcrete_nw_endpoint_mode_handler *v113;
  int64_t *v114;
  char **v115;
  int64_t v116;
  NSObject *v117;
  const char *v118;
  const char *v119;
  nw_endpoint_t v120;
  int64_t v121;
  const char *v122;
  const char *v123;
  const char *v124;
  id v125;
  void *v126;
  char v127;
  const char *v128;
  int64_t *v129;
  int minimize_logging;
  char logging_disabled;
  NSObject *v132;
  const char *v133;
  const char *v134;
  nw_endpoint_t v135;
  const char *v136;
  const char *v137;
  const char *v138;
  id v139;
  unint64_t v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  dispatch_time_t v145;
  uint64_t v146;
  void **v147;
  void **v148;
  unsigned int v149;
  const char *v150;
  id v151;
  char *v152;
  NSObject *v153;
  os_log_type_t v154;
  int64_t v155;
  unint64_t v156;
  unint64_t v157;
  int64_t v158;
  unint64_t v159;
  char *v160;
  NSObject *v161;
  os_log_type_t v162;
  _BOOL4 v163;
  void **v164;
  id v165;
  NWConcrete_nw_endpoint_handler *v166;
  NWConcrete_nw_endpoint_handler *v167;
  unint64_t int64_with_default;
  unint64_t v169;
  os_log_type_t v170;
  id *v171;
  unint64_t v172;
  NSObject *v173;
  const char *v174;
  const char *v175;
  const char *v176;
  const char *v177;
  const char *v178;
  const char *v179;
  id v180;
  unint64_t v181;
  unint64_t v182;
  uint64_t v183;
  NSObject *v184;
  const char *v185;
  const char *v186;
  nw_endpoint_t v187;
  const char *v188;
  const char *v189;
  const char *v190;
  const char *v191;
  id v192;
  void *v193;
  char *v194;
  NSObject *v195;
  os_log_type_t v196;
  char *backtrace_string;
  os_log_type_t v198;
  _BOOL4 v199;
  os_log_type_t v200;
  void *v201;
  char *v202;
  NSObject *v203;
  os_log_type_t v204;
  const char *v205;
  const char *v206;
  nw_endpoint_t v207;
  const char *v208;
  const char *v209;
  const char *v210;
  id v211;
  char *v212;
  nw_endpoint_t v213;
  const char *v214;
  const char *v215;
  const char *v216;
  id v217;
  const char *v218;
  const char *v219;
  nw_endpoint_t v220;
  const char *v221;
  const char *v222;
  const char *v223;
  id v224;
  unint64_t v225;
  char *v226;
  os_log_type_t v227;
  _BOOL4 v228;
  os_log_type_t v229;
  nw_endpoint_t v230;
  int64_t v231;
  unint64_t v232;
  NWConcrete_nw_endpoint_handler *v233;
  NWConcrete_nw_endpoint_mode_handler *v234;
  int64_t *v235;
  const char *v236;
  os_unfair_lock_s *lock;
  NWConcrete_nw_endpoint_handler *locka;
  void *v239;
  const char *v240;
  void *v241;
  id v242;
  unsigned int *v243;
  nw_endpoint_t v244;
  const char *v245;
  _BOOL8 v246;
  const char *v247;
  unsigned int *v248;
  const char *v249;
  NWConcrete_nw_parameters *v250;
  const char *id_string;
  id *v252;
  NWConcrete_nw_endpoint_fallback *v253;
  id *v254;
  char v255;
  os_log_type_t v256;
  __int128 v257;
  os_log_type_t type[4];
  const char *v259;
  __int16 v260;
  void *v261;
  __int16 v262;
  const char *v263;
  __int16 v264;
  const char *v265;
  __int16 v266;
  const char *v267;
  __int16 v268;
  const char *v269;
  __int16 v270;
  id v271;
  __int16 v272;
  uint64_t v273;
  __int16 v274;
  unint64_t v275;
  uint8_t buf[64];
  _BYTE v277[32];
  __int128 v278;
  uint64_t v279;

  v279 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
    v194 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v257) = 0;
    if (__nwlog_fault(v194, type, &v257))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v195 = objc_claimAutoreleasedReturnValue();
        v196 = type[0];
        if (os_log_type_enabled(v195, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          _os_log_impl(&dword_182FBE000, v195, v196, "%{public}s called with null handler", buf, 0xCu);
        }
      }
      else if ((_BYTE)v257)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v195 = objc_claimAutoreleasedReturnValue();
        v198 = type[0];
        v199 = os_log_type_enabled(v195, type[0]);
        if (backtrace_string)
        {
          if (v199)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v195, v198, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_258;
        }
        if (v199)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          _os_log_impl(&dword_182FBE000, v195, v198, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v195 = objc_claimAutoreleasedReturnValue();
        v200 = type[0];
        if (os_log_type_enabled(v195, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          _os_log_impl(&dword_182FBE000, v195, v200, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_258:
    if (v194)
      free(v194);
    v5 = 0;
    goto LABEL_206;
  }
  v6 = (unsigned int *)v4;
  v7 = v6[29];

  if ((_DWORD)v7 != 4)
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
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2082;
    *(_QWORD *)&buf[24] = "fallback";
    v27 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v257) = 0;
    if (__nwlog_fault(v27, type, &v257))
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
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2082;
          *(_QWORD *)&buf[24] = "fallback";
          _os_log_impl(&dword_182FBE000, v28, v29, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if ((_BYTE)v257)
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
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v34;
            *(_WORD *)&buf[22] = 2082;
            *(_QWORD *)&buf[24] = "fallback";
            *(_WORD *)&buf[32] = 2082;
            *(_QWORD *)&buf[34] = v31;
            _os_log_impl(&dword_182FBE000, v28, v32, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v31);
          if (!v27)
            goto LABEL_34;
          goto LABEL_33;
        }
        if (v33)
        {
          if (v7 > 5)
            v41 = "unknown-mode";
          else
            v41 = off_1E149FC18[v7];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v41;
          *(_WORD *)&buf[22] = 2082;
          *(_QWORD *)&buf[24] = "fallback";
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
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2082;
          *(_QWORD *)&buf[24] = "fallback";
          _os_log_impl(&dword_182FBE000, v28, v35, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }

    }
    if (!v27)
    {
LABEL_34:
      v5 = v25;
      goto LABEL_206;
    }
LABEL_33:
    free(v27);
    goto LABEL_34;
  }
  v8 = v6;
  v9 = v8[30];

  if (v9 == 1)
  {
    v239 = v5;
    v243 = v8;
    v10 = v8;
    v11 = *((_BYTE *)v10 + 268);
    v248 = v10;

    if ((v11 & 0x20) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v12 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = v248;

        v14 = v13;
        v15 = *((_BYTE *)v248 + 268);

        if ((v15 & 1) != 0)
          v16 = "dry-run ";
        else
          v16 = "";
        v17 = nw_endpoint_handler_copy_endpoint(v14);
        logging_description = nw_endpoint_get_logging_description(v17);
        v19 = v13 + 168;
        v20 = v14;
        v21 = v20;
        v22 = v8[30];
        if (v22 > 5)
          v23 = "unknown-state";
        else
          v23 = off_1E149FC48[v22];
        v253 = self;

        v37 = v21;
        v38 = v37;
        v39 = logging_description;
        v40 = "path";
        switch(v6[29])
        {
          case 0u:
            break;
          case 1u:
            v40 = "resolver";
            break;
          case 2u:
            v40 = nw_endpoint_flow_mode_string(v37[31]);
            break;
          case 3u:
            v40 = "proxy";
            break;
          case 4u:
            v40 = "fallback";
            break;
          case 5u:
            v40 = "transform";
            break;
          default:
            v40 = "unknown-mode";
            break;
        }

        v42 = v38;
        os_unfair_lock_lock((os_unfair_lock_t)v42 + 28);
        v43 = v42[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v42 + 28);

        *(_DWORD *)buf = 136447746;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2082;
        *(_QWORD *)&buf[24] = v16;
        *(_WORD *)&buf[32] = 2082;
        *(_QWORD *)&buf[34] = v39;
        *(_WORD *)&buf[42] = 2082;
        *(_QWORD *)&buf[44] = v23;
        *(_WORD *)&buf[52] = 2082;
        *(_QWORD *)&buf[54] = v40;
        *(_WORD *)&buf[62] = 2114;
        *(_QWORD *)v277 = v43;
        _os_log_impl(&dword_182FBE000, v12, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);

        self = v253;
      }

    }
    primary_child = self->primary_child;
    self->primary_child = 0;

    fallback_child = self->fallback_child;
    self->fallback_child = 0;

    primary_interface = self->primary_interface;
    self->primary_interface = 0;

    fallback_interface = self->fallback_interface;
    self->fallback_interface = 0;

    v244 = nw_endpoint_handler_copy_endpoint(v248);
    v48 = v248;
    os_unfair_lock_lock((os_unfair_lock_t)v48 + 28);
    v254 = (id *)*((id *)v48 + 8);
    lock = (os_unfair_lock_s *)(v48 + 112);
    os_unfair_lock_unlock((os_unfair_lock_t)v48 + 28);

    v49 = (char *)self + 108;
    if (nw_path_fallback_is_weak(v254))
      v50 = 2;
    else
      v50 = 0;
    *v49 = *((_BYTE *)self + 108) & 0xFD | v50;
    if (nw_path_fallback_should_not_use_timer(v254))
      v51 = 4;
    else
      v51 = 0;
    *v49 = *v49 & 0xFB | v51;
    if (nw_path_fallback_is_forced(v254))
      v52 = 8;
    else
      v52 = 0;
    *v49 = *v49 & 0xF7 | v52;
    if (nw_path_fallback_is_preferred(v254))
      v53 = 16;
    else
      v53 = 0;
    *v49 = *v49 & 0xEF | v53;
    v54 = v48;
    v242 = v54[4];
    v252 = v54;

    if ((*v49 & 2) != 0)
      goto LABEL_94;
    v55 = v242;
    if (v55)
    {
      v56 = *(_DWORD *)(v55[13] + 72);

      if (v56 != 200 && v56 != 100)
        goto LABEL_94;
      *((_BYTE *)self + 108) |= 2u;
      if (!nw_endpoint_handler_get_minimize_logging(v54))
      {
        v57 = v54;
        v58 = (v248[67] & 0x20) == 0;

        if (!v58)
          goto LABEL_94;
        if (__nwlog_connection_log::onceToken != -1)
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
        v59 = (id)gconnectionLogObj;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v60 = v57;

          v61 = v60;
          v62 = (v248[67] & 1) == 0;

          if (v62)
            v63 = "";
          else
            v63 = "dry-run ";
          v64 = nw_endpoint_handler_copy_endpoint(v61);
          v65 = nw_endpoint_get_logging_description(v64);
          v66 = v61;
          v67 = v66;
          v68 = v243[30];
          v249 = v65;
          if (v68 > 5)
            v69 = "unknown-state";
          else
            v69 = off_1E149FC48[v68];
          v245 = v69;

          v70 = v67;
          v71 = "path";
          switch(v6[29])
          {
            case 0u:
              break;
            case 1u:
              v71 = "resolver";
              break;
            case 2u:
              v71 = nw_endpoint_flow_mode_string(v70[31]);
              break;
            case 3u:
              v71 = "proxy";
              break;
            case 4u:
              v71 = "fallback";
              break;
            case 5u:
              v71 = "transform";
              break;
            default:
              v71 = "unknown-mode";
              break;
          }
          v240 = v71;

          v72 = v60;
          v73 = v64;
          v74 = v70;
          os_unfair_lock_lock(lock);
          v75 = *((id *)v48 + 8);
          os_unfair_lock_unlock(lock);

          *(_DWORD *)buf = 136447746;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v72 + 21;
          *(_WORD *)&buf[22] = 2082;
          *(_QWORD *)&buf[24] = v63;
          *(_WORD *)&buf[32] = 2082;
          *(_QWORD *)&buf[34] = v249;
          *(_WORD *)&buf[42] = 2082;
          *(_QWORD *)&buf[44] = v245;
          *(_WORD *)&buf[52] = 2082;
          *(_QWORD *)&buf[54] = v240;
          *(_WORD *)&buf[62] = 2114;
          *(_QWORD *)v277 = v75;
          _os_log_impl(&dword_182FBE000, v59, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Overriding strong fallback to weak fallback for background traffic", buf, 0x48u);

        }
        goto LABEL_93;
      }
      if ((nw_endpoint_handler_get_logging_disabled(v54) & 1) == 0)
      {
        v212 = v48;
        if (__nwlog_connection_log::onceToken != -1)
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
        v59 = (id)gconnectionLogObj;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          id_string = nw_endpoint_handler_get_id_string(v54);
          v247 = nw_endpoint_handler_dry_run_string(v54);
          v213 = nw_endpoint_handler_copy_endpoint(v54);
          v214 = nw_endpoint_get_logging_description(v213);
          v215 = nw_endpoint_handler_state_string(v252);
          v216 = nw_endpoint_handler_mode_string(v252);
          v217 = nw_endpoint_handler_copy_current_path(v252);
          *(_DWORD *)buf = 136447746;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = id_string;
          *(_WORD *)&buf[22] = 2082;
          *(_QWORD *)&buf[24] = v247;
          *(_WORD *)&buf[32] = 2082;
          *(_QWORD *)&buf[34] = v214;
          *(_WORD *)&buf[42] = 2082;
          *(_QWORD *)&buf[44] = v215;
          *(_WORD *)&buf[52] = 2082;
          *(_QWORD *)&buf[54] = v216;
          *(_WORD *)&buf[62] = 2114;
          *(_QWORD *)v277 = v217;
          _os_log_impl(&dword_182FBE000, v59, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Overriding strong fallback to weak fallback for background traffic", buf, 0x48u);

          v48 = v212;
        }
LABEL_93:

      }
LABEL_94:
      v76 = v242;
      v250 = (NWConcrete_nw_parameters *)-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v76, 0, 0);

      v77 = v76;
      v246 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v77, 0, 0);
      v241 = v77;

      if (v254)
        v78 = (OS_nw_interface *)v254[12];
      else
        v78 = 0;
      v79 = self->primary_interface;
      self->primary_interface = v78;

      v80 = v254;
      fallback_interface_index = nw_path_get_fallback_interface_index((uint64_t)v254);
      if (fallback_interface_index)
      {
        v82 = fallback_interface_index;
        if (nw_context_copy_implicit_context::onceToken[0] != -1)
          dispatch_once(nw_context_copy_implicit_context::onceToken, &__block_literal_global_14);
        v83 = (id)nw_context_copy_implicit_context::implicit_context;
        v84 = (OS_nw_interface *)nw_path_copy_interface_with_generation(v83, v82, 0);

        v85 = self->fallback_interface;
        self->fallback_interface = v84;

        v86 = self->fallback_interface;
        if (v86)
        {
          v87 = v86;
          v88 = *((_DWORD *)v87 + 24);

          LOBYTE(v86) = 8 * (v88 == 2);
        }
        v89 = *((_BYTE *)self + 109) & 0xF7 | v86;
        *((_BYTE *)self + 109) = v89;
        v80 = v254;
        v90 = (NWConcrete_nw_parameters *)v246;
        if ((v89 & 8) == 0)
          goto LABEL_106;
      }
      else
      {
        v90 = (NWConcrete_nw_parameters *)v246;
        if ((*((_BYTE *)self + 109) & 8) == 0)
          goto LABEL_106;
      }
      if ((*((_BYTE *)self + 108) & 0x18) == 0)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        nw_parameters_get_e_proc_uuid(v241, buf);
        nw_parameters_get_pid(v241);
        nw_parameters_get_effective_bundle_id(v241);
        self->fallback_disposition = _symptoms_daemon_fallback_initial_disposition();
        v90 = (NWConcrete_nw_parameters *)v246;
LABEL_107:
        if ((nw_path_update_parameters_for_fallback(v80, v90) & 1) == 0)
        {
          nw_parameters_set_required_interface_type(&v90->super, nw_interface_type_cellular);
          nw_parameters_set_only_primary_requires_type(v90, 1);
          *((_BYTE *)self + 108) |= 0x22u;
        }
        nw_parameters_set_fallback_applied(v250, 1);
        nw_parameters_set_fallback_applied(v90, 1);
        nw_parameters_set_is_fallback(v90, 1);
        if ((*((_BYTE *)self + 108) & 0x10) != 0)
        {
          v91 = 4;
        }
        else if ((*((_BYTE *)self + 108) & 4) != 0)
        {
          v91 = 1;
        }
        else if ((*((_BYTE *)self + 108) & 2) != 0)
        {
          v91 = 2;
        }
        else
        {
          v91 = 3;
        }
        nw_parameters_set_fallback_mode(v90, v91);
        v257 = 0uLL;
        if (nw_path_get_client_id(v80, &v257))
        {
          nw_parameters_set_parent_id_inner(v250, (const unsigned __int8 *)&v257, 0);
          nw_parameters_set_parent_id_inner(v90, (const unsigned __int8 *)&v257, 0);
        }
        if ((*((_BYTE *)self + 108) & 8) == 0)
        {
          if ((*((_BYTE *)self + 108) & 0x10) != 0)
          {
            inner = (NWConcrete_nw_endpoint_handler *)nw_endpoint_handler_create_inner(v244, v90, nw_endpoint_fallback_receive_report, v252, v252, 0, 0);
            v90 = v250;
          }
          else
          {
            inner = (NWConcrete_nw_endpoint_handler *)nw_endpoint_handler_create_inner(v244, v250, nw_endpoint_fallback_receive_report, v252, v252, 0, 0);
          }
          v106 = self->primary_child;
          self->primary_child = inner;

          v107 = (NWConcrete_nw_endpoint_handler *)nw_endpoint_handler_create_inner(v244, v90, nw_endpoint_fallback_receive_report, v252, v252, 0, 0);
          v108 = self->fallback_child;
          self->fallback_child = v107;

          v109 = v252;
          v111 = nw_endpoint_handler_copy_fallback(v109);
          v112 = *((_QWORD *)v111 + 9);
          v235 = (int64_t *)v111;
          if (v112)
          {
            nw_queue_cancel_source(v112, v110);
            *((_QWORD *)v111 + 9) = 0;
          }
          if ((*((_BYTE *)v111 + 108) & 4) != 0)
            goto LABEL_204;
          locka = v109;
          v233 = v109;
          v113 = nw_endpoint_handler_copy_fallback(locka);
          v234 = v113;
          if ((*((_BYTE *)v113 + 108) & 0x10) != 0)
          {
            v114 = &nw_fallback_delay_max_limit_ms;
            v115 = &nw_setting_tcpconn_fallback_delay_cap_ms;
          }
          else
          {
            if ((*((_BYTE *)v113 + 108) & 2) != 0)
            {
              if ((*((_BYTE *)v113 + 108) & 0x20) != 0)
              {
                int64_with_default = networkd_settings_get_int64_with_default((const char *)nw_setting_tcpconn_weak_fallback_delay, 200);
                v169 = networkd_settings_get_int64_with_default(nw_setting_tcpconn_fallback_delay_cap_ms, 500);
                v116 = v169;
                if (int64_with_default <= 0x7FFFFFFFFFFFFFFELL && 2 * int64_with_default < v169)
                  v116 = 2 * int64_with_default;
              }
              else
              {
                v116 = networkd_settings_get_int64_with_default((const char *)nw_setting_tcpconn_weak_fallback_delay, 0);
                if ((unint64_t)(v116 - 0x8637BD05AF6) < 0xFFFFF79C842FA50BLL)
                {
                  v155 = networkd_settings_get_int64_with_default((const char *)nw_setting_tcpconn_fallback_wifi_advantage_per_rtt_ms, 175);
                  if (v155 <= 0)
                    v156 = 175;
                  else
                    v156 = v155;
                  v157 = 500;
                  v158 = networkd_settings_get_int64_with_default(nw_setting_tcpconn_fallback_delay_cap_ms, 500);
                  *(_OWORD *)&v277[16] = 0u;
                  v278 = 0u;
                  if ((unint64_t)(v158 - 1) < 0x8637BD05AF5)
                    v157 = v158;
                  *(_OWORD *)v277 = 0uLL;
                  memset(buf, 0, sizeof(buf));
                  if (nw_endpoint_handler_fillout_route_stats(locka, (uint64_t)buf))
                    v159 = (DWORD2(v278) + 2 * (unint64_t)HIDWORD(v278)) >> 5;
                  else
                    v159 = 0;
                  v232 = v159;
                  if (nw_endpoint_handler_fillout_route_stats(*((void **)v234 + 5), (uint64_t)buf)
                    && (v172 = DWORD2(v278) + 2 * HIDWORD(v278), v172 > 0x1F))
                  {
                    v181 = v172 >> 5;
                  }
                  else if ((nw_endpoint_handler_get_logging_disabled(locka) & 1) != 0)
                  {
                    v181 = 200;
                  }
                  else
                  {
                    if (__nwlog_connection_log::onceToken != -1)
                      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
                    v173 = (id)gconnectionLogObj;
                    if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
                    {
                      v174 = nw_endpoint_handler_get_id_string(locka);
                      v175 = nw_endpoint_handler_dry_run_string(locka);
                      v176 = v174;
                      v230 = nw_endpoint_handler_copy_endpoint(locka);
                      v177 = nw_endpoint_get_logging_description(v230);
                      v178 = nw_endpoint_handler_state_string(locka);
                      v179 = nw_endpoint_handler_mode_string(locka);
                      v180 = nw_endpoint_handler_copy_current_path(locka);
                      *(_DWORD *)type = 136448002;
                      v259 = "nw_endpoint_fallback_get_timeout_nanos";
                      v260 = 2082;
                      v261 = (void *)v176;
                      v262 = 2082;
                      v263 = v175;
                      v264 = 2082;
                      v265 = v177;
                      v266 = 2082;
                      v267 = v178;
                      v268 = 2082;
                      v269 = v179;
                      v270 = 2114;
                      v271 = v180;
                      v272 = 2048;
                      v273 = 200;
                      _os_log_impl(&dword_182FBE000, v173, OS_LOG_TYPE_ERROR, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] No RTT information for fallback interface, will use a default value %llums", (uint8_t *)type, 0x52u);

                      v109 = v233;
                    }

                    v181 = 200;
                    v159 = v232;
                  }
                  v182 = v159 - v181;
                  if (v159 - v181 <= v156)
                    v182 = v156;
                  if (v159 <= v181)
                    v182 = v156;
                  v183 = 2 * v182;
                  if (2 * v182 >= v157)
                    v183 = v157;
                  if (v182 >= 0x7FFFFFFFFFFFFFFFLL)
                    v116 = v157;
                  else
                    v116 = v183;
                  if ((nw_endpoint_handler_get_logging_disabled(locka) & 1) == 0)
                  {
                    if (__nwlog_connection_log::onceToken != -1)
                      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
                    v184 = (id)gconnectionLogObj;
                    if (os_log_type_enabled(v184, OS_LOG_TYPE_DEBUG))
                    {
                      v231 = v116;
                      v185 = nw_endpoint_handler_get_id_string(locka);
                      v186 = nw_endpoint_handler_dry_run_string(locka);
                      v187 = nw_endpoint_handler_copy_endpoint(locka);
                      v188 = v186;
                      v189 = nw_endpoint_get_logging_description(v187);
                      v190 = nw_endpoint_handler_state_string(locka);
                      v191 = nw_endpoint_handler_mode_string(locka);
                      v192 = nw_endpoint_handler_copy_current_path(locka);
                      *(_DWORD *)type = 136448258;
                      v259 = "nw_endpoint_fallback_get_timeout_nanos";
                      v260 = 2082;
                      v261 = (void *)v185;
                      v262 = 2082;
                      v263 = v188;
                      v264 = 2082;
                      v265 = v189;
                      v266 = 2082;
                      v267 = v190;
                      v268 = 2082;
                      v269 = v191;
                      v270 = 2114;
                      v271 = v192;
                      v272 = 2048;
                      v273 = v232;
                      v274 = 2048;
                      v275 = v181;
                      _os_log_impl(&dword_182FBE000, v184, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Primary RTT: %llums, fallback RTT: %llums", (uint8_t *)type, 0x5Cu);

                      v109 = v233;
                      v116 = v231;

                    }
                  }
                }
              }
LABEL_141:
              if ((nw_endpoint_handler_get_logging_disabled(locka) & 1) == 0)
              {
                if (__nwlog_connection_log::onceToken != -1)
                  dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
                v117 = (id)gconnectionLogObj;
                if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
                {
                  v118 = nw_endpoint_handler_get_id_string(locka);
                  v119 = nw_endpoint_handler_dry_run_string(locka);
                  v120 = nw_endpoint_handler_copy_endpoint(locka);
                  v121 = v116;
                  v122 = nw_endpoint_get_logging_description(v120);
                  v123 = nw_endpoint_handler_state_string(locka);
                  v124 = nw_endpoint_handler_mode_string(locka);
                  v125 = nw_endpoint_handler_copy_current_path(locka);
                  v126 = v125;
                  v127 = *((_BYTE *)v234 + 108);
                  v128 = ", weak";
                  *(_DWORD *)buf = 136448258;
                  *(_QWORD *)&buf[4] = "nw_endpoint_fallback_get_timeout_nanos";
                  *(_WORD *)&buf[12] = 2082;
                  if ((v127 & 2) == 0)
                    v128 = ", strong";
                  *(_QWORD *)&buf[14] = v118;
                  *(_WORD *)&buf[22] = 2082;
                  *(_QWORD *)&buf[24] = v119;
                  *(_WORD *)&buf[32] = 2082;
                  *(_QWORD *)&buf[34] = v122;
                  *(_WORD *)&buf[42] = 2082;
                  *(_QWORD *)&buf[44] = v123;
                  *(_WORD *)&buf[52] = 2082;
                  *(_QWORD *)&buf[54] = v124;
                  *(_WORD *)&buf[62] = 2114;
                  *(_QWORD *)v277 = v125;
                  *(_WORD *)&v277[8] = 2048;
                  v116 = v121;
                  *(_QWORD *)&v277[10] = v121;
                  *(_WORD *)&v277[18] = 2082;
                  *(_QWORD *)&v277[20] = v128;
                  _os_log_impl(&dword_182FBE000, v117, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Setting %llums fallback timer%{public}s", buf, 0x5Cu);

                  v109 = v233;
                }

              }
              v129 = v235;
              v235[3] = 1000000 * v116;
              minimize_logging = nw_endpoint_handler_get_minimize_logging(locka);
              logging_disabled = nw_endpoint_handler_get_logging_disabled(locka);
              if (minimize_logging)
              {
                if ((logging_disabled & 1) != 0)
                {
LABEL_156:
                  v141 = nw_endpoint_handler_copy_context(locka);
                  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = ___ZL32nw_endpoint_fallback_start_timerP30NWConcrete_nw_endpoint_handler_block_invoke;
                  *(_QWORD *)&buf[24] = &unk_1E14ACFD0;
                  *(_QWORD *)&buf[32] = locka;
                  v129[9] = nw_queue_context_create_source(v141, 2, 3, 0, buf, 0);

                  if (v129[9])
                  {
                    v142 = mach_continuous_time();
                    if (v142 <= 1)
                      v143 = 1;
                    else
                      v143 = v142;
                    v235[12] = v143;
                    v144 = v235[9];
                    v145 = dispatch_time(0x8000000000000000, v235[3]);
                    nw_queue_set_timer_values(v144, v145, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
                    nw_queue_activate_source(v235[9], v146);
LABEL_203:

                    v111 = (NWConcrete_nw_endpoint_mode_handler *)v235;
LABEL_204:

                    goto LABEL_205;
                  }
                  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                  networkd_settings_init();
                  v151 = (id)gLogObj;
                  *(_DWORD *)type = 136446210;
                  v259 = "nw_endpoint_fallback_start_timer";
                  v152 = (char *)_os_log_send_and_compose_impl();

                  v256 = OS_LOG_TYPE_ERROR;
                  v255 = 0;
                  if ((__nwlog_fault(v152, &v256, &v255) & 1) != 0)
                  {
                    if (v256 == OS_LOG_TYPE_FAULT)
                    {
                      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                      networkd_settings_init();
                      v153 = (id)gLogObj;
                      v154 = v256;
                      if (os_log_type_enabled(v153, v256))
                      {
                        *(_DWORD *)type = 136446210;
                        v259 = "nw_endpoint_fallback_start_timer";
                        _os_log_impl(&dword_182FBE000, v153, v154, "%{public}s nw_queue_context_create_source(timer) failed", (uint8_t *)type, 0xCu);
                      }
                    }
                    else
                    {
                      if (v255)
                      {
                        v160 = (char *)__nw_create_backtrace_string();
                        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                        networkd_settings_init();
                        v161 = (id)gLogObj;
                        v162 = v256;
                        v163 = os_log_type_enabled(v161, v256);
                        if (v160)
                        {
                          if (v163)
                          {
                            *(_DWORD *)type = 136446466;
                            v259 = "nw_endpoint_fallback_start_timer";
                            v260 = 2082;
                            v261 = v160;
                            _os_log_impl(&dword_182FBE000, v161, v162, "%{public}s nw_queue_context_create_source(timer) failed, dumping backtrace:%{public}s", (uint8_t *)type, 0x16u);
                          }

                          free(v160);
                        }
                        else
                        {
                          if (v163)
                          {
                            *(_DWORD *)type = 136446210;
                            v259 = "nw_endpoint_fallback_start_timer";
                            _os_log_impl(&dword_182FBE000, v161, v162, "%{public}s nw_queue_context_create_source(timer) failed, no backtrace", (uint8_t *)type, 0xCu);
                          }

                        }
                        goto LABEL_201;
                      }
                      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                      networkd_settings_init();
                      v153 = (id)gLogObj;
                      v170 = v256;
                      if (os_log_type_enabled(v153, v256))
                      {
                        *(_DWORD *)type = 136446210;
                        v259 = "nw_endpoint_fallback_start_timer";
                        _os_log_impl(&dword_182FBE000, v153, v170, "%{public}s nw_queue_context_create_source(timer) failed, backtrace limit exceeded", (uint8_t *)type, 0xCu);
                      }
                    }

                  }
LABEL_201:
                  if (v152)
                    free(v152);
                  goto LABEL_203;
                }
                if (__nwlog_connection_log::onceToken != -1)
                  dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
                v132 = (id)gconnectionLogObj;
                if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
                {
                  v218 = nw_endpoint_handler_get_id_string(locka);
                  v219 = nw_endpoint_handler_dry_run_string(locka);
                  v220 = nw_endpoint_handler_copy_endpoint(locka);
                  v221 = nw_endpoint_get_logging_description(v220);
                  v222 = nw_endpoint_handler_state_string(locka);
                  v223 = nw_endpoint_handler_mode_string(locka);
                  v224 = nw_endpoint_handler_copy_current_path(locka);
                  *(_QWORD *)&buf[4] = "nw_endpoint_fallback_start_timer";
                  v225 = v235[3];
                  *(_DWORD *)buf = 136448002;
                  *(_QWORD *)&buf[14] = v218;
                  *(_WORD *)&buf[12] = 2082;
                  *(_WORD *)&buf[22] = 2082;
                  *(_QWORD *)&buf[24] = v219;
                  *(_WORD *)&buf[32] = 2082;
                  *(_QWORD *)&buf[34] = v221;
                  *(_WORD *)&buf[42] = 2082;
                  *(_QWORD *)&buf[44] = v222;
                  *(_WORD *)&buf[52] = 2082;
                  *(_QWORD *)&buf[54] = v223;
                  *(_WORD *)&buf[62] = 2114;
                  *(_QWORD *)v277 = v224;
                  *(_WORD *)&v277[8] = 2048;
                  *(_QWORD *)&v277[10] = v225 / 0xF4240;
                  _os_log_impl(&dword_182FBE000, v132, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] starting fallback endpoint in %llums", buf, 0x52u);

                  v109 = v233;
                }
                else
                {
                  v109 = v233;
                }
              }
              else
              {
                if ((logging_disabled & 1) != 0)
                  goto LABEL_156;
                if (__nwlog_connection_log::onceToken != -1)
                  dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
                v132 = (id)gconnectionLogObj;
                if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
                {
                  v133 = nw_endpoint_handler_get_id_string(locka);
                  v134 = nw_endpoint_handler_dry_run_string(locka);
                  v135 = nw_endpoint_handler_copy_endpoint(locka);
                  v136 = nw_endpoint_get_logging_description(v135);
                  v137 = nw_endpoint_handler_state_string(locka);
                  v138 = nw_endpoint_handler_mode_string(locka);
                  v139 = nw_endpoint_handler_copy_current_path(locka);
                  *(_QWORD *)&buf[4] = "nw_endpoint_fallback_start_timer";
                  v140 = v235[3];
                  *(_DWORD *)buf = 136448002;
                  *(_QWORD *)&buf[14] = v133;
                  *(_WORD *)&buf[12] = 2082;
                  *(_WORD *)&buf[22] = 2082;
                  *(_QWORD *)&buf[24] = v134;
                  *(_WORD *)&buf[32] = 2082;
                  *(_QWORD *)&buf[34] = v136;
                  *(_WORD *)&buf[42] = 2082;
                  *(_QWORD *)&buf[44] = v137;
                  *(_WORD *)&buf[52] = 2082;
                  *(_QWORD *)&buf[54] = v138;
                  *(_WORD *)&buf[62] = 2114;
                  *(_QWORD *)v277 = v139;
                  *(_WORD *)&v277[8] = 2048;
                  *(_QWORD *)&v277[10] = v140 / 0xF4240;
                  _os_log_impl(&dword_182FBE000, v132, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] starting fallback endpoint in %llums", buf, 0x52u);

                  v109 = v233;
                }
              }

              v129 = v235;
              goto LABEL_156;
            }
            v114 = &nw_default_strong_fallback_delay_ms;
            v115 = &nw_setting_tcpconn_strong_fallback_delay;
          }
          v116 = networkd_settings_get_int64_with_default(*v115, *v114);
          goto LABEL_141;
        }
        if (nw_endpoint_handler_get_minimize_logging(v252))
        {
          if ((nw_endpoint_handler_get_logging_disabled(v252) & 1) != 0)
            goto LABEL_190;
          if (__nwlog_connection_log::onceToken != -1)
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
          v95 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
          {
            v205 = nw_endpoint_handler_get_id_string(v252);
            v206 = nw_endpoint_handler_dry_run_string(v252);
            v207 = nw_endpoint_handler_copy_endpoint(v252);
            v208 = nw_endpoint_get_logging_description(v207);
            v209 = nw_endpoint_handler_state_string(v252);
            v210 = nw_endpoint_handler_mode_string(v252);
            v211 = nw_endpoint_handler_copy_current_path(v252);
            *(_DWORD *)buf = 136447746;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v205;
            *(_WORD *)&buf[22] = 2082;
            *(_QWORD *)&buf[24] = v206;
            *(_WORD *)&buf[32] = 2082;
            *(_QWORD *)&buf[34] = v208;
            *(_WORD *)&buf[42] = 2082;
            *(_QWORD *)&buf[44] = v209;
            *(_WORD *)&buf[52] = 2082;
            *(_QWORD *)&buf[54] = v210;
            *(_WORD *)&buf[62] = 2114;
            *(_QWORD *)v277 = v211;
            _os_log_impl(&dword_182FBE000, v95, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] fallback advisory is forced", buf, 0x48u);

          }
        }
        else
        {
          v93 = v252;
          v94 = (v248[67] & 0x20) == 0;

          if (!v94)
          {
LABEL_190:
            v166 = (NWConcrete_nw_endpoint_handler *)nw_endpoint_handler_create_inner(v244, (void *)v246, nw_endpoint_fallback_receive_report, v252, v252, 0, 0);
            v167 = self->primary_child;
            self->primary_child = v166;

LABEL_205:
            v171 = v252;
            v243[30] = 2;

            *((_DWORD *)v171 + 20) = 65541;
            nw_endpoint_handler_report(v171, 0, (_WORD *)v171 + 40, 0);
            nw_endpoint_handler_start(self->primary_child);

            v5 = v239;
            goto LABEL_206;
          }
          if (__nwlog_connection_log::onceToken != -1)
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
          v95 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
          {
            v96 = v93;

            v97 = v96;
            v98 = (v248[67] & 1) == 0;

            if (v98)
              v99 = "";
            else
              v99 = "dry-run ";
            v100 = nw_endpoint_handler_copy_endpoint(v97);
            v101 = nw_endpoint_get_logging_description(v100);
            v102 = v97;
            v103 = v102;
            v104 = v243[30];
            if (v104 > 5)
              v105 = "unknown-state";
            else
              v105 = off_1E149FC48[v104];
            v236 = v105;

            v147 = v103;
            v148 = v147;
            v149 = v6[29];
            v150 = "path";
            switch(v149)
            {
              case 0u:
                break;
              case 1u:
                v150 = "resolver";
                break;
              case 2u:
                v150 = nw_endpoint_flow_mode_string(v147[31]);
                break;
              case 3u:
                v150 = "proxy";
                break;
              case 4u:
                v150 = "fallback";
                break;
              case 5u:
                v150 = "transform";
                break;
              default:
                v150 = "unknown-mode";
                break;
            }

            v164 = v148;
            os_unfair_lock_lock(lock);
            v165 = *((id *)v48 + 8);
            os_unfair_lock_unlock(lock);

            *(_DWORD *)buf = 136447746;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v96 + 21;
            *(_WORD *)&buf[22] = 2082;
            *(_QWORD *)&buf[24] = v99;
            *(_WORD *)&buf[32] = 2082;
            *(_QWORD *)&buf[34] = v101;
            *(_WORD *)&buf[42] = 2082;
            *(_QWORD *)&buf[44] = v236;
            *(_WORD *)&buf[52] = 2082;
            *(_QWORD *)&buf[54] = v150;
            *(_WORD *)&buf[62] = 2114;
            *(_QWORD *)v277 = v165;
            _os_log_impl(&dword_182FBE000, v95, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] fallback advisory is forced", buf, 0x48u);

          }
        }

        goto LABEL_190;
      }
LABEL_106:
      self->fallback_disposition = 1;
      goto LABEL_107;
    }
    __nwlog_obj();
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_parameters_traffic_class_is_background";
    v202 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v257) = 0;
    if (__nwlog_fault(v202, type, &v257))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v203 = objc_claimAutoreleasedReturnValue();
        v204 = type[0];
        if (os_log_type_enabled(v203, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_parameters_traffic_class_is_background";
          _os_log_impl(&dword_182FBE000, v203, v204, "%{public}s called with null parameters", buf, 0xCu);
        }
      }
      else if ((_BYTE)v257)
      {
        v226 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v203 = objc_claimAutoreleasedReturnValue();
        v227 = type[0];
        v228 = os_log_type_enabled(v203, type[0]);
        if (v226)
        {
          if (v228)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "nw_parameters_traffic_class_is_background";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v226;
            _os_log_impl(&dword_182FBE000, v203, v227, "%{public}s called with null parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v226);
          goto LABEL_284;
        }
        if (v228)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_parameters_traffic_class_is_background";
          _os_log_impl(&dword_182FBE000, v203, v227, "%{public}s called with null parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v203 = objc_claimAutoreleasedReturnValue();
        v229 = type[0];
        if (os_log_type_enabled(v203, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_parameters_traffic_class_is_background";
          _os_log_impl(&dword_182FBE000, v203, v229, "%{public}s called with null parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_284:
    if (v202)
      free(v202);
    v59 = 0;
    goto LABEL_93;
  }
LABEL_206:

}

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unsigned int *v8;
  uint64_t v9;
  uint64_t v10;
  void *fallback_timer;
  void *post_transport_timer;
  void *usage_cap_timer;
  NWConcrete_nw_endpoint_handler *primary_child;
  NWConcrete_nw_endpoint_handler *fallback_child;
  NWConcrete_nw_endpoint_handler *v16;
  NWConcrete_nw_endpoint_handler *v17;
  OS_nw_interface *primary_interface;
  OS_nw_interface *fallback_interface;
  id v20;
  const char *v21;
  char *v22;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  char *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  const char *v29;
  os_log_type_t v30;
  const char *v31;
  const char *v32;
  void *v33;
  os_log_type_t v34;
  char *backtrace_string;
  os_log_type_t v36;
  _BOOL4 v37;
  os_log_type_t v38;
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

  v4 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    __nwlog_obj();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v39 = 0;
    if (__nwlog_fault(v22, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        v34 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v23, v34, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_45;
      }
      if (!v39)
      {
        __nwlog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        v38 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v23, v38, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_45;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v36 = type;
      v37 = os_log_type_enabled(v23, type);
      if (!backtrace_string)
      {
        if (v37)
        {
          *(_DWORD *)buf = 136446210;
          v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v23, v36, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_45;
      }
      if (v37)
      {
        *(_DWORD *)buf = 136446466;
        v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
        v43 = 2082;
        v44 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v23, v36, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_46:
    if (!v22)
      goto LABEL_48;
LABEL_47:
    free(v22);
    goto LABEL_48;
  }
  v8 = (unsigned int *)v6;
  v9 = v8[29];

  if ((_DWORD)v9 == 4)
  {
    fallback_timer = self->fallback_timer;
    if (fallback_timer)
    {
      nw_queue_cancel_source((uint64_t)fallback_timer, v10);
      self->fallback_timer = 0;
    }
    post_transport_timer = self->post_transport_timer;
    if (post_transport_timer)
    {
      nw_queue_cancel_source((uint64_t)post_transport_timer, v10);
      self->post_transport_timer = 0;
    }
    usage_cap_timer = self->usage_cap_timer;
    if (usage_cap_timer)
    {
      nw_queue_cancel_source((uint64_t)usage_cap_timer, v10);
      self->usage_cap_timer = 0;
    }
    primary_child = self->primary_child;
    if (primary_child)
      nw_endpoint_handler_cancel(primary_child, v4, 0);
    fallback_child = self->fallback_child;
    if (fallback_child)
      nw_endpoint_handler_cancel(fallback_child, v4, 0);
    v16 = self->primary_child;
    self->primary_child = 0;

    v17 = self->fallback_child;
    self->fallback_child = 0;

    primary_interface = self->primary_interface;
    self->primary_interface = 0;

    fallback_interface = self->fallback_interface;
    self->fallback_interface = 0;

    goto LABEL_48;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v20 = (id)gLogObj;
  if (v9 > 5)
    v21 = "unknown-mode";
  else
    v21 = off_1E149FC18[v9];
  *(_DWORD *)buf = 136446722;
  v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
  v43 = 2082;
  v44 = (void *)v21;
  v45 = 2082;
  v46 = "fallback";
  v22 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v39 = 0;
  if (!__nwlog_fault(v22, &type, &v39))
    goto LABEL_46;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v23 = (id)gLogObj;
    v24 = type;
    if (os_log_type_enabled(v23, type))
    {
      if (v9 > 5)
        v25 = "unknown-mode";
      else
        v25 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
      v43 = 2082;
      v44 = (void *)v25;
      v45 = 2082;
      v46 = "fallback";
      _os_log_impl(&dword_182FBE000, v23, v24, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_45:

    goto LABEL_46;
  }
  if (!v39)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v23 = (id)gLogObj;
    v30 = type;
    if (os_log_type_enabled(v23, type))
    {
      if (v9 > 5)
        v31 = "unknown-mode";
      else
        v31 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
      v43 = 2082;
      v44 = (void *)v31;
      v45 = 2082;
      v46 = "fallback";
      _os_log_impl(&dword_182FBE000, v23, v30, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_45;
  }
  v26 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v23 = (id)gLogObj;
  v27 = type;
  v28 = os_log_type_enabled(v23, type);
  if (!v26)
  {
    if (v28)
    {
      if (v9 > 5)
        v32 = "unknown-mode";
      else
        v32 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
      v43 = 2082;
      v44 = (void *)v32;
      v45 = 2082;
      v46 = "fallback";
      _os_log_impl(&dword_182FBE000, v23, v27, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_45;
  }
  if (v28)
  {
    if (v9 > 5)
      v29 = "unknown-mode";
    else
      v29 = off_1E149FC18[v9];
    *(_DWORD *)buf = 136446978;
    v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
    v43 = 2082;
    v44 = (void *)v29;
    v45 = 2082;
    v46 = "fallback";
    v47 = 2082;
    v48 = v26;
    _os_log_impl(&dword_182FBE000, v23, v27, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v26);
  if (v22)
    goto LABEL_47;
LABEL_48:

}

- (void)updatePathWithHandler:(id)a3
{
  id v4;
  void *v5;
  unsigned int *v6;
  uint64_t v7;
  NWConcrete_nw_endpoint_handler *v8;
  os_unfair_lock_s *p_lock;
  OS_nw_path *v10;
  int fallback_interface_index;
  uint64_t v12;
  OS_nw_interface *fallback_interface;
  void *fallback_timer;
  NWConcrete_nw_endpoint_handler *v15;
  char v16;
  NSObject *v17;
  NWConcrete_nw_endpoint_handler *v18;
  NWConcrete_nw_endpoint_handler *v19;
  char v20;
  const char *v21;
  nw_endpoint_t v22;
  unsigned int *v23;
  unsigned int *v24;
  uint64_t v25;
  const char *v26;
  id v27;
  const char *v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  const char *v32;
  char *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  const char *v36;
  os_log_type_t v37;
  const char *v38;
  const char *v39;
  NWConcrete_nw_endpoint_handler *v40;
  char v41;
  NSObject *v42;
  const char *id_string;
  const char *v44;
  nw_endpoint_t v45;
  const char *v46;
  const char *v47;
  const char *v48;
  OS_nw_path *v49;
  void **v50;
  void **v51;
  unsigned int v52;
  const char *v53;
  void **v54;
  OS_nw_path *v55;
  _QWORD *v56;
  id *v57;
  NWConcrete_nw_endpoint_handler *v58;
  _BOOL4 v59;
  NSObject *v60;
  const char *v61;
  const char *v62;
  nw_endpoint_t v63;
  const char *v64;
  const char *v65;
  const char *v66;
  OS_nw_path *v67;
  NWConcrete_nw_endpoint_handler *v68;
  _BOOL4 v69;
  NSObject *v70;
  const char *v71;
  const char *v72;
  nw_endpoint_t v73;
  const char *v74;
  const char *v75;
  const char *v76;
  OS_nw_path *v77;
  void *v78;
  os_log_type_t v79;
  char *backtrace_string;
  os_log_type_t v81;
  _BOOL4 v82;
  os_log_type_t v83;
  const char *v84;
  nw_endpoint_t v85;
  const char *v86;
  const char *v87;
  const char *v88;
  OS_nw_path *v89;
  const char *v90;
  nw_endpoint_t v91;
  const char *v92;
  const char *v93;
  const char *v94;
  OS_nw_path *v95;
  NSObject *v96;
  const char *v97;
  nw_endpoint_t v98;
  const char *logging_description;
  const char *v100;
  const char *v101;
  OS_nw_path *v102;
  const char *v103;
  const char *v104;
  nw_endpoint_t v105;
  const char *v106;
  const char *v107;
  const char *v108;
  OS_nw_path *v109;
  char *id_str;
  const char *v111;
  const char *log;
  NSObject *loga;
  NSObject *logb;
  const char *logc;
  const char *logd;
  const char *loge;
  OS_nw_path *v118;
  char v119;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v122;
  __int16 v123;
  void *v124;
  __int16 v125;
  const char *v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  const char *v130;
  __int16 v131;
  const char *v132;
  __int16 v133;
  OS_nw_path *v134;
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
    v29 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v119 = 0;
    if (!__nwlog_fault(v29, &type, &v119))
      goto LABEL_65;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      v79 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
        _os_log_impl(&dword_182FBE000, v30, v79, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v119)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      v81 = type;
      v82 = os_log_type_enabled(v30, type);
      if (backtrace_string)
      {
        if (v82)
        {
          *(_DWORD *)buf = 136446466;
          v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
          v123 = 2082;
          v124 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v30, v81, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_65;
      }
      if (v82)
      {
        *(_DWORD *)buf = 136446210;
        v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
        _os_log_impl(&dword_182FBE000, v30, v81, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      v83 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
        _os_log_impl(&dword_182FBE000, v30, v83, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_64:

    goto LABEL_65;
  }
  v6 = (unsigned int *)v4;
  v7 = v6[29];

  if ((_DWORD)v7 != 4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v27 = (id)gLogObj;
    if (v7 > 5)
      v28 = "unknown-mode";
    else
      v28 = off_1E149FC18[v7];
    *(_DWORD *)buf = 136446722;
    v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
    v123 = 2082;
    v124 = (void *)v28;
    v125 = 2082;
    v126 = "fallback";
    v29 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v119 = 0;
    if (__nwlog_fault(v29, &type, &v119))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v30 = (id)gLogObj;
        v31 = type;
        if (os_log_type_enabled(v30, type))
        {
          if (v7 > 5)
            v32 = "unknown-mode";
          else
            v32 = off_1E149FC18[v7];
          *(_DWORD *)buf = 136446722;
          v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
          v123 = 2082;
          v124 = (void *)v32;
          v125 = 2082;
          v126 = "fallback";
          _os_log_impl(&dword_182FBE000, v30, v31, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v119)
      {
        v33 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v30 = (id)gLogObj;
        v34 = type;
        v35 = os_log_type_enabled(v30, type);
        if (v33)
        {
          if (v35)
          {
            if (v7 > 5)
              v36 = "unknown-mode";
            else
              v36 = off_1E149FC18[v7];
            *(_DWORD *)buf = 136446978;
            v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
            v123 = 2082;
            v124 = (void *)v36;
            v125 = 2082;
            v126 = "fallback";
            v127 = 2082;
            v128 = v33;
            _os_log_impl(&dword_182FBE000, v30, v34, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v33);
          if (!v29)
            goto LABEL_93;
LABEL_66:
          free(v29);
          goto LABEL_93;
        }
        if (v35)
        {
          if (v7 > 5)
            v39 = "unknown-mode";
          else
            v39 = off_1E149FC18[v7];
          *(_DWORD *)buf = 136446722;
          v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
          v123 = 2082;
          v124 = (void *)v39;
          v125 = 2082;
          v126 = "fallback";
          _os_log_impl(&dword_182FBE000, v30, v34, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v30 = (id)gLogObj;
        v37 = type;
        if (os_log_type_enabled(v30, type))
        {
          if (v7 > 5)
            v38 = "unknown-mode";
          else
            v38 = off_1E149FC18[v7];
          *(_DWORD *)buf = 136446722;
          v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
          v123 = 2082;
          v124 = (void *)v38;
          v125 = 2082;
          v126 = "fallback";
          _os_log_impl(&dword_182FBE000, v30, v37, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_64;
    }
LABEL_65:
    if (!v29)
      goto LABEL_93;
    goto LABEL_66;
  }
  if ((*((_BYTE *)self + 108) & 0x20) == 0 && self->fallback_interface)
  {
    v8 = v6;
    p_lock = &v8->lock;
    os_unfair_lock_lock(&v8->lock);
    v10 = v8->current_path;
    os_unfair_lock_unlock(&v8->lock);

    v118 = v10;
    fallback_interface_index = nw_path_get_fallback_interface_index((uint64_t)v10);
    if (!fallback_interface_index
      || (fallback_interface = self->fallback_interface) == 0
      || fallback_interface_index != *((_DWORD *)fallback_interface + 2))
    {
      fallback_timer = self->fallback_timer;
      if (fallback_timer)
      {
        nw_queue_cancel_source((uint64_t)fallback_timer, v12);
        self->fallback_timer = 0;
      }
      if (!self->result && self->fallback_child)
      {
        if (nw_endpoint_handler_get_minimize_logging(v8))
        {
          if ((nw_endpoint_handler_get_logging_disabled(v8) & 1) != 0)
            goto LABEL_51;
          if (__nwlog_connection_log::onceToken != -1)
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
          v96 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
          {
            loge = nw_endpoint_handler_get_id_string(v8);
            v97 = nw_endpoint_handler_dry_run_string(v8);
            v98 = nw_endpoint_handler_copy_endpoint(v8);
            logging_description = nw_endpoint_get_logging_description(v98);
            v100 = nw_endpoint_handler_state_string(v8);
            v101 = nw_endpoint_handler_mode_string(v8);
            v102 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v8);
            *(_DWORD *)buf = 136447746;
            v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
            v123 = 2082;
            v124 = (void *)loge;
            v125 = 2082;
            v126 = v97;
            v127 = 2082;
            v128 = (void *)logging_description;
            v129 = 2082;
            v130 = v100;
            v131 = 2082;
            v132 = v101;
            v133 = 2114;
            v134 = v102;
            v42 = v96;
            _os_log_impl(&dword_182FBE000, v96, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Fallback advisory removed, cancelling fallback attempt", buf, 0x48u);

          }
          else
          {
            v42 = v96;
          }
        }
        else
        {
          v40 = v8;
          v41 = *((_BYTE *)v40 + 268);

          if ((v41 & 0x20) != 0)
          {
LABEL_51:
            nw_endpoint_handler_cancel(self->fallback_child, 0, 1);
            goto LABEL_74;
          }
          if (__nwlog_connection_log::onceToken != -1)
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
          v42 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            id_string = nw_endpoint_handler_get_id_string(v40);
            v44 = nw_endpoint_handler_dry_run_string(v40);
            loga = v42;
            v45 = nw_endpoint_handler_copy_endpoint(v40);
            v46 = nw_endpoint_get_logging_description(v45);
            v47 = nw_endpoint_handler_state_string(v40);
            v48 = nw_endpoint_handler_mode_string(v40);
            v49 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v40);
            *(_DWORD *)buf = 136447746;
            v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
            v123 = 2082;
            v124 = (void *)id_string;
            v125 = 2082;
            v126 = v44;
            v127 = 2082;
            v128 = (void *)v46;
            v129 = 2082;
            v130 = v47;
            v131 = 2082;
            v132 = v48;
            v133 = 2114;
            v134 = v49;
            v42 = loga;
            _os_log_impl(&dword_182FBE000, loga, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Fallback advisory removed, cancelling fallback attempt", buf, 0x48u);

          }
        }

        goto LABEL_51;
      }
      if (nw_endpoint_handler_get_minimize_logging(v8))
      {
        if ((nw_endpoint_handler_get_logging_disabled(v8) & 1) != 0)
          goto LABEL_74;
        if (__nwlog_connection_log::onceToken != -1)
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
        v17 = (id)gconnectionLogObj;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logc = nw_endpoint_handler_get_id_string(v8);
          v84 = nw_endpoint_handler_dry_run_string(v8);
          v85 = nw_endpoint_handler_copy_endpoint(v8);
          v86 = nw_endpoint_get_logging_description(v85);
          v87 = nw_endpoint_handler_state_string(v8);
          v88 = nw_endpoint_handler_mode_string(v8);
          v89 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v8);
          *(_DWORD *)buf = 136447746;
          v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
          v123 = 2082;
          v124 = (void *)logc;
          v125 = 2082;
          v126 = v84;
          v127 = 2082;
          v128 = (void *)v86;
          v129 = 2082;
          v130 = v87;
          v131 = 2082;
          v132 = v88;
          v133 = 2114;
          v134 = v89;
          _os_log_impl(&dword_182FBE000, v17, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Fallback advisory removed", buf, 0x48u);

        }
        goto LABEL_73;
      }
      v15 = v8;
      v16 = *((_BYTE *)v15 + 268);

      if ((v16 & 0x20) == 0)
      {
        if (__nwlog_connection_log::onceToken != -1)
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
        v17 = (id)gconnectionLogObj;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = v15;

          v19 = v18;
          v20 = *((_BYTE *)v15 + 268);

          if ((v20 & 1) != 0)
            v21 = "dry-run ";
          else
            v21 = "";
          v22 = nw_endpoint_handler_copy_endpoint(v19);
          log = nw_endpoint_get_logging_description(v22);
          id_str = v18->id_str;
          v111 = v21;
          v23 = v19;
          v24 = v23;
          v25 = v23[30];
          if (v25 > 5)
            v26 = "unknown-state";
          else
            v26 = off_1E149FC48[v25];

          v50 = v24;
          v51 = v50;
          v52 = v6[29];
          v53 = "path";
          switch(v52)
          {
            case 0u:
              break;
            case 1u:
              v53 = "resolver";
              break;
            case 2u:
              v53 = nw_endpoint_flow_mode_string(v50[31]);
              break;
            case 3u:
              v53 = "proxy";
              break;
            case 4u:
              v53 = "fallback";
              break;
            case 5u:
              v53 = "transform";
              break;
            default:
              v53 = "unknown-mode";
              break;
          }

          v54 = v51;
          os_unfair_lock_lock(p_lock);
          v55 = v8->current_path;
          os_unfair_lock_unlock(p_lock);

          *(_DWORD *)buf = 136447746;
          v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
          v123 = 2082;
          v124 = id_str;
          v125 = 2082;
          v126 = v111;
          v127 = 2082;
          v128 = (void *)log;
          v129 = 2082;
          v130 = v26;
          v131 = 2082;
          v132 = v53;
          v133 = 2114;
          v134 = v55;
          _os_log_impl(&dword_182FBE000, v17, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Fallback advisory removed", buf, 0x48u);

        }
LABEL_73:

      }
    }
LABEL_74:
    if (!nw_path_fallback_is_forced(v118) || (*((_BYTE *)self + 108) & 8) != 0)
      goto LABEL_92;
    v56 = &unk_1ECD84000;
    v57 = (id *)&unk_1ECD84000;
    if (nw_endpoint_handler_get_minimize_logging(v8))
    {
      if ((nw_endpoint_handler_get_logging_disabled(v8) & 1) != 0)
      {
LABEL_83:
        *((_BYTE *)self + 108) |= 8u;
        if (!self->result)
        {
          nw_endpoint_fallback_start_fallback_child(v8);
          nw_endpoint_handler_cancel(self->primary_child, 0, 1);
          goto LABEL_92;
        }
        if (nw_endpoint_handler_get_minimize_logging(v8))
        {
          if ((nw_endpoint_handler_get_logging_disabled(v8) & 1) != 0)
            goto LABEL_92;
          if (v56[413] != -1)
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
          v70 = v57[416];
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
          {
            v103 = nw_endpoint_handler_get_id_string(v8);
            v104 = nw_endpoint_handler_dry_run_string(v8);
            v105 = nw_endpoint_handler_copy_endpoint(v8);
            v106 = nw_endpoint_get_logging_description(v105);
            v107 = nw_endpoint_handler_state_string(v8);
            v108 = nw_endpoint_handler_mode_string(v8);
            v109 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v8);
            *(_DWORD *)buf = 136447746;
            v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
            v123 = 2082;
            v124 = (void *)v103;
            v125 = 2082;
            v126 = v104;
            v127 = 2082;
            v128 = (void *)v106;
            v129 = 2082;
            v130 = v107;
            v131 = 2082;
            v132 = v108;
            v133 = 2114;
            v134 = v109;
            _os_log_impl(&dword_182FBE000, v70, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Ignoring immediate fallback request since race is complete", buf, 0x48u);

          }
        }
        else
        {
          v68 = v8;
          v69 = (*((_BYTE *)v68 + 268) & 0x20) == 0;

          if (!v69)
          {
LABEL_92:

            goto LABEL_93;
          }
          if (v56[413] != -1)
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
          v70 = v57[416];
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            v71 = nw_endpoint_handler_get_id_string(v68);
            v72 = nw_endpoint_handler_dry_run_string(v68);
            v73 = nw_endpoint_handler_copy_endpoint(v68);
            v74 = nw_endpoint_get_logging_description(v73);
            v75 = nw_endpoint_handler_state_string(v68);
            v76 = nw_endpoint_handler_mode_string(v68);
            v77 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v68);
            *(_DWORD *)buf = 136447746;
            v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
            v123 = 2082;
            v124 = (void *)v71;
            v125 = 2082;
            v126 = v72;
            v127 = 2082;
            v128 = (void *)v74;
            v129 = 2082;
            v130 = v75;
            v131 = 2082;
            v132 = v76;
            v133 = 2114;
            v134 = v77;
            _os_log_impl(&dword_182FBE000, v70, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Ignoring immediate fallback request since race is complete", buf, 0x48u);

          }
        }

        goto LABEL_92;
      }
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v60 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        logd = nw_endpoint_handler_get_id_string(v8);
        v90 = nw_endpoint_handler_dry_run_string(v8);
        v91 = nw_endpoint_handler_copy_endpoint(v8);
        v92 = nw_endpoint_get_logging_description(v91);
        v93 = nw_endpoint_handler_state_string(v8);
        v94 = nw_endpoint_handler_mode_string(v8);
        v95 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v8);
        *(_DWORD *)buf = 136447746;
        v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
        v123 = 2082;
        v124 = (void *)logd;
        v125 = 2082;
        v126 = v90;
        v127 = 2082;
        v128 = (void *)v92;
        v129 = 2082;
        v130 = v93;
        v131 = 2082;
        v132 = v94;
        v133 = 2114;
        v134 = v95;
        _os_log_impl(&dword_182FBE000, v60, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Immediate fallback requested", buf, 0x48u);

        v57 = (id *)&unk_1ECD84000;
        v56 = (_QWORD *)&unk_1ECD84000;

      }
    }
    else
    {
      v58 = v8;
      v59 = (*((_BYTE *)v58 + 268) & 0x20) == 0;

      if (!v59)
        goto LABEL_83;
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v60 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        v61 = nw_endpoint_handler_get_id_string(v58);
        v62 = nw_endpoint_handler_dry_run_string(v58);
        logb = v60;
        v63 = nw_endpoint_handler_copy_endpoint(v58);
        v64 = nw_endpoint_get_logging_description(v63);
        v65 = nw_endpoint_handler_state_string(v58);
        v66 = nw_endpoint_handler_mode_string(v58);
        v67 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v58);
        *(_DWORD *)buf = 136447746;
        v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
        v123 = 2082;
        v124 = (void *)v61;
        v125 = 2082;
        v126 = v62;
        v127 = 2082;
        v128 = (void *)v64;
        v129 = 2082;
        v130 = v65;
        v131 = 2082;
        v132 = v66;
        v133 = 2114;
        v134 = v67;
        v60 = logb;
        _os_log_impl(&dword_182FBE000, logb, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Immediate fallback requested", buf, 0x48u);

        v57 = (id *)&unk_1ECD84000;
        v56 = &unk_1ECD84000;

      }
    }

    goto LABEL_83;
  }
LABEL_93:

}

- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4
{
  id v6;
  unsigned int (**v7)(_QWORD);
  unsigned int *v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  const char *v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  const char *v16;
  char *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  const char *v20;
  os_log_type_t v21;
  const char *v22;
  const char *v23;
  void *v25;
  os_log_type_t v26;
  void *v27;
  os_log_type_t v28;
  char *backtrace_string;
  os_log_type_t v30;
  _BOOL4 v31;
  char *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  os_log_type_t v35;
  os_log_type_t v36;
  char v37;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (unsigned int (**)(_QWORD))a4;
  if (!v6)
  {
    __nwlog_obj();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v37 = 0;
    if (!__nwlog_fault(v13, &type, &v37))
      goto LABEL_41;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v26 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v14, v26, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v37)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v30 = type;
      v31 = os_log_type_enabled(v14, type);
      if (backtrace_string)
      {
        if (v31)
        {
          *(_DWORD *)buf = 136446466;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          v41 = 2082;
          v42 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v14, v30, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_41;
      }
      if (v31)
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v14, v30, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v35 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v14, v35, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_40:

    goto LABEL_41;
  }
  v8 = (unsigned int *)v6;
  v9 = v8[29];

  if ((_DWORD)v9 != 4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    if (v9 > 5)
      v12 = "unknown-mode";
    else
      v12 = off_1E149FC18[v9];
    *(_DWORD *)buf = 136446722;
    v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
    v41 = 2082;
    v42 = (void *)v12;
    v43 = 2082;
    v44 = "fallback";
    v13 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v37 = 0;
    if (__nwlog_fault(v13, &type, &v37))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v14 = (id)gLogObj;
        v15 = type;
        if (os_log_type_enabled(v14, type))
        {
          if (v9 > 5)
            v16 = "unknown-mode";
          else
            v16 = off_1E149FC18[v9];
          *(_DWORD *)buf = 136446722;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          v41 = 2082;
          v42 = (void *)v16;
          v43 = 2082;
          v44 = "fallback";
          _os_log_impl(&dword_182FBE000, v14, v15, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v37)
      {
        v17 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v14 = (id)gLogObj;
        v18 = type;
        v19 = os_log_type_enabled(v14, type);
        if (v17)
        {
          if (v19)
          {
            if (v9 > 5)
              v20 = "unknown-mode";
            else
              v20 = off_1E149FC18[v9];
            *(_DWORD *)buf = 136446978;
            v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
            v41 = 2082;
            v42 = (void *)v20;
            v43 = 2082;
            v44 = "fallback";
            v45 = 2082;
            v46 = v17;
            _os_log_impl(&dword_182FBE000, v14, v18, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v17);
          if (!v13)
            goto LABEL_43;
          goto LABEL_42;
        }
        if (v19)
        {
          if (v9 > 5)
            v23 = "unknown-mode";
          else
            v23 = off_1E149FC18[v9];
          *(_DWORD *)buf = 136446722;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          v41 = 2082;
          v42 = (void *)v23;
          v43 = 2082;
          v44 = "fallback";
          _os_log_impl(&dword_182FBE000, v14, v18, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v14 = (id)gLogObj;
        v21 = type;
        if (os_log_type_enabled(v14, type))
        {
          if (v9 > 5)
            v22 = "unknown-mode";
          else
            v22 = off_1E149FC18[v9];
          *(_DWORD *)buf = 136446722;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          v41 = 2082;
          v42 = (void *)v22;
          v43 = 2082;
          v44 = "fallback";
          _os_log_impl(&dword_182FBE000, v14, v21, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  if (!v7)
  {
    __nwlog_obj();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v37 = 0;
    if (__nwlog_fault(v13, &type, &v37))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        v28 = type;
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          _os_log_impl(&dword_182FBE000, v14, v28, "%{public}s called with null applyBlock", buf, 0xCu);
        }
      }
      else if (v37)
      {
        v32 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        v33 = type;
        v34 = os_log_type_enabled(v14, type);
        if (v32)
        {
          if (v34)
          {
            *(_DWORD *)buf = 136446466;
            v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
            v41 = 2082;
            v42 = v32;
            _os_log_impl(&dword_182FBE000, v14, v33, "%{public}s called with null applyBlock, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v32);
          if (!v13)
            goto LABEL_43;
          goto LABEL_42;
        }
        if (v34)
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          _os_log_impl(&dword_182FBE000, v14, v33, "%{public}s called with null applyBlock, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        v36 = type;
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          _os_log_impl(&dword_182FBE000, v14, v36, "%{public}s called with null applyBlock, backtrace limit exceeded", buf, 0xCu);
        }
      }
      goto LABEL_40;
    }
LABEL_41:
    if (!v13)
    {
LABEL_43:
      v10 = 1;
      goto LABEL_44;
    }
LABEL_42:
    free(v13);
    goto LABEL_43;
  }
  if ((!self->primary_child || v7[2](v7)) && (!self->fallback_child || v7[2](v7)))
    goto LABEL_43;
  v10 = 0;
LABEL_44:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fallback_interface, 0);
  objc_storeStrong((id *)&self->primary_interface, 0);
  objc_storeStrong((id *)&self->fallback_child, 0);
  objc_storeStrong((id *)&self->primary_child, 0);
}

@end
