@implementation NWCandidatePathMonitor

- (NWCandidatePathMonitor)initWithParameters:(id)a3
{
  id v4;
  NWCandidatePathMonitor *v5;
  NSObject *v6;
  NSObject *v7;
  NWConcrete_nw_path_evaluator *evaluator_for_endpoint;
  id v9;
  NWCandidatePathMonitor *v10;
  void *v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  const char *v16;
  char *backtrace_string;
  _BOOL4 v18;
  char v19;
  os_log_type_t type;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NWCandidatePathMonitor;
  v5 = -[NWCandidatePathMonitor init](&v21, sel_init);
  if (v5)
  {
    if (v4)
      v6 = objc_msgSend(v4, "copyCParameters");
    else
      v6 = nw_parameters_create();
    v7 = v6;
    nw_parameters_set_multipath_service(v6, nw_multipath_service_handover);
    evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(0, v7);
    -[NWCandidatePathMonitor setPrimaryEvaluator:](v5, "setPrimaryEvaluator:", evaluator_for_endpoint);

    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NWCandidatePathMonitor setCandidatePathEvaluators:](v5, "setCandidatePathEvaluators:", v9);

    v5->lock._os_unfair_lock_opaque = 0;
    v10 = v5;

    goto LABEL_6;
  }
  __nwlog_obj();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v23 = "-[NWCandidatePathMonitor initWithParameters:]";
  v13 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v19 = 0;
  if (__nwlog_fault(v13, &type, &v19))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v23 = "-[NWCandidatePathMonitor initWithParameters:]";
        v16 = "%{public}s [super init] failed";
LABEL_20:
        _os_log_impl(&dword_182FBE000, v14, v15, v16, buf, 0xCu);
      }
    }
    else
    {
      if (v19)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = type;
        v18 = os_log_type_enabled(v14, type);
        if (backtrace_string)
        {
          if (v18)
          {
            *(_DWORD *)buf = 136446466;
            v23 = "-[NWCandidatePathMonitor initWithParameters:]";
            v24 = 2082;
            v25 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v14, v15, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_22;
        }
        if (!v18)
          goto LABEL_21;
        *(_DWORD *)buf = 136446210;
        v23 = "-[NWCandidatePathMonitor initWithParameters:]";
        v16 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_20;
      }
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v23 = "-[NWCandidatePathMonitor initWithParameters:]";
        v16 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_20;
      }
    }
LABEL_21:

  }
LABEL_22:
  if (v13)
    free(v13);
LABEL_6:

  return v5;
}

- (NWCandidatePathMonitor)init
{
  return -[NWCandidatePathMonitor initWithParameters:](self, "initWithParameters:", 0);
}

- (void)cancelCandidatePathEvaluators
{
  os_unfair_lock_s *p_lock;
  NWCandidatePathMonitor *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__NWCandidatePathMonitor_cancelCandidatePathEvaluators__block_invoke;
  v4[3] = &unk_1E14ACFD0;
  v4[4] = self;
  p_lock = &self->lock;
  v3 = self;
  os_unfair_lock_lock(p_lock);
  __55__NWCandidatePathMonitor_cancelCandidatePathEvaluators__block_invoke((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[NWCandidatePathMonitor cancelCandidatePathEvaluators](self, "cancelCandidatePathEvaluators");
  -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    nw_path_evaluator_cancel(v4);

    -[NWCandidatePathMonitor setPrimaryEvaluator:](self, "setPrimaryEvaluator:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)NWCandidatePathMonitor;
  -[NWCandidatePathMonitor dealloc](&v5, sel_dealloc);
}

- (id)cParameters
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  id *v4;
  id v5;
  id v6;

  -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    os_unfair_lock_lock(v3 + 24);
    v5 = v4[6];
    os_unfair_lock_unlock(v3 + 24);

  }
  else
  {
    v5 = 0;
  }

  v6 = nw_path_copy_parameters(v5);
  return v6;
}

- (NWParameters)parameters
{
  NWParameters *v3;
  void *v4;
  NWParameters *v5;

  v3 = [NWParameters alloc];
  -[NWCandidatePathMonitor cParameters](self, "cParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NWParameters initWithParameters:](v3, "initWithParameters:", v4);

  return v5;
}

- (void)resetCandidatePathEvaluators
{
  os_unfair_lock_s *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NWConcrete_nw_path_evaluator *evaluator_for_endpoint;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t ii;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t kk;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  NWConcrete_nw_path_evaluator *v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t mm;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  BOOL v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t nn;
  void *v92;
  NSObject *v93;
  void *v94;
  NSObject *v95;
  id v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t jj;
  id obj;
  id v107;
  id v108;
  uint64_t v109;
  void *v110;
  id k;
  id v112;
  id v113;
  uint64_t v114;
  id v115;
  id n;
  id v117;
  void *v118;
  NSObject *parameters;
  NWCandidatePathMonitor *val;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[4];
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _QWORD v147[4];
  id v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  id location;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _QWORD enumerate_block[4];
  id v167;
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  uint8_t v173[128];
  uint8_t buf[4];
  const char *v175;
  __int16 v176;
  void *v177;
  __int16 v178;
  void *v179;
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  uint64_t v184;

  v184 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->lock);
  val = self;
  -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
  v3 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v4 = nw_path_evaluator_copy_path(v3);

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  enumerate_block[0] = MEMORY[0x1E0C809B0];
  enumerate_block[1] = 3221225472;
  enumerate_block[2] = __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke;
  enumerate_block[3] = &unk_1E149E170;
  v98 = v5;
  v167 = v98;
  v95 = v4;
  nw_path_enumerate_interfaces(v4, enumerate_block);
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[NWCandidatePathMonitor candidatePathEvaluators](val, "candidatePathEvaluators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v9 = (id)gLogObj;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {

  }
  else
  {
    v10 = gLogFDOverride;

    if (v10 == -1)
      goto LABEL_23;
  }
  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  v11 = v98;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v162, v183, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v163;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v163 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * i);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v16 = (id)gLogObj;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v15, "internalInterface");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          v176 = 2112;
          v177 = v17;
          _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_DEBUG, "%{public}s Current interface: %@", buf, 0x16u);

        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v162, v183, 16);
    }
    while (v12);
  }

  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v18 = v97;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v158, v182, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v159;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v159 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * j);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v23 = (id)gLogObj;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v22, "internalInterface");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          v176 = 2112;
          v177 = v24;
          _os_log_impl(&dword_182FBE000, v23, OS_LOG_TYPE_DEBUG, "%{public}s Existing interface: %@", buf, 0x16u);

        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v158, v182, 16);
    }
    while (v19);
  }

LABEL_23:
  v25 = (void *)objc_msgSend(v98, "mutableCopy");
  objc_msgSend(v25, "minusSet:", v97);
  v103 = (void *)objc_msgSend(v97, "mutableCopy");
  objc_msgSend(v103, "minusSet:", v98);
  v101 = (void *)objc_msgSend(v97, "mutableCopy");
  objc_msgSend(v101, "intersectSet:", v98);
  objc_initWeak(&location, val);
  -[NWCandidatePathMonitor cParameters](val, "cParameters");
  parameters = objc_claimAutoreleasedReturnValue();
  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  obj = v25;
  v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v181, 16);
  if (v109)
  {
    v107 = *(id *)v154;
    do
    {
      for (k = 0; k != (id)v109; k = (char *)k + 1)
      {
        if (*(id *)v154 != v107)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * (_QWORD)k);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v26, "internalInterface");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          v176 = 2112;
          v177 = v28;
          _os_log_impl(&dword_182FBE000, v27, OS_LOG_TYPE_DEBUG, "%{public}s Adding interface %@", buf, 0x16u);

        }
        v117 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v151 = 0u;
        v152 = 0u;
        v149 = 0u;
        v150 = 0u;
        -[NWCandidatePathMonitor remoteEndpoints](val, "remoteEndpoints");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v149, v180, 16);
        if (v30)
        {
          v31 = *(_QWORD *)v150;
          v115 = v29;
          do
          {
            for (m = 0; m != v30; ++m)
            {
              if (*(_QWORD *)v150 != v31)
                objc_enumerationMutation(v115);
              v33 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * m);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v34 = (id)gLogObj;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v26, "internalInterface");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                v176 = 2112;
                v177 = v33;
                v178 = 2112;
                v179 = v35;
                _os_log_impl(&dword_182FBE000, v34, OS_LOG_TYPE_DEBUG, "%{public}s Adding %@ over interface %@", buf, 0x20u);

              }
              objc_msgSend(v33, "internalEndpoint");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = nw_parameters_copy(parameters);
              objc_msgSend(v26, "internalInterface");
              v38 = objc_claimAutoreleasedReturnValue();
              nw_parameters_require_interface(v37, v38);

              evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(v36, v37);
              -[NWCandidatePathMonitor queue](val, "queue");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v147[0] = MEMORY[0x1E0C809B0];
              v147[1] = 3221225472;
              v147[2] = __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke_8;
              v147[3] = &unk_1E14AC8E0;
              objc_copyWeak(&v148, &location);
              nw_path_evaluator_set_update_handler(evaluator_for_endpoint, v40, v147);

              objc_msgSend(v117, "setObject:forKeyedSubscript:", evaluator_for_endpoint, v33);
              objc_destroyWeak(&v148);

            }
            v29 = v115;
            v30 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v149, v180, 16);
          }
          while (v30);
        }

        -[NWCandidatePathMonitor candidatePathEvaluators](val, "candidatePathEvaluators");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v117, v26);

      }
      v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v181, 16);
    }
    while (v109);
  }

  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v108 = v103;
  v114 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v143, v173, 16);
  if (v114)
  {
    v112 = *(id *)v144;
    do
    {
      for (n = 0; n != (id)v114; n = (char *)n + 1)
      {
        if (*(id *)v144 != v112)
          objc_enumerationMutation(v108);
        v42 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * (_QWORD)n);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v43 = (id)gLogObj;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v42, "internalInterface");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          v176 = 2112;
          v177 = v44;
          _os_log_impl(&dword_182FBE000, v43, OS_LOG_TYPE_DEBUG, "%{public}s Removing interface %@", buf, 0x16u);

        }
        -[NWCandidatePathMonitor candidatePathEvaluators](val, "candidatePathEvaluators");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKeyedSubscript:", v42);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v141 = 0u;
        v142 = 0u;
        v139 = 0u;
        v140 = 0u;
        objc_msgSend(v46, "allKeys");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v139, v172, 16);
        if (v48)
        {
          v49 = *(_QWORD *)v140;
          do
          {
            for (ii = 0; ii != v48; ++ii)
            {
              if (*(_QWORD *)v140 != v49)
                objc_enumerationMutation(v47);
              v51 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * ii);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v52 = (id)gLogObj;
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v42, "internalInterface");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                v176 = 2112;
                v177 = v51;
                v178 = 2112;
                v179 = v53;
                _os_log_impl(&dword_182FBE000, v52, OS_LOG_TYPE_DEBUG, "%{public}s Removing %@ from interface %@", buf, 0x20u);

              }
              objc_msgSend(v46, "objectForKeyedSubscript:", v51);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              nw_path_evaluator_cancel(v54);
              objc_msgSend(v46, "setObject:forKeyedSubscript:", 0, v51);

            }
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v139, v172, 16);
          }
          while (v48);
        }

        -[NWCandidatePathMonitor candidatePathEvaluators](val, "candidatePathEvaluators");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", 0, v42);

      }
      v114 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v143, v173, 16);
    }
    while (v114);
  }

  v56 = (void *)MEMORY[0x1E0C99E60];
  -[NWCandidatePathMonitor remoteEndpoints](val, "remoteEndpoints");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setWithArray:", v57);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v96 = v101;
  v100 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v135, v171, 16);
  if (v100)
  {
    v99 = *(_QWORD *)v136;
    do
    {
      for (jj = 0; jj != v100; ++jj)
      {
        if (*(_QWORD *)v136 != v99)
          objc_enumerationMutation(v96);
        v118 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * jj);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v58 = (id)gLogObj;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v118, "internalInterface");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          v176 = 2112;
          v177 = v59;
          _os_log_impl(&dword_182FBE000, v58, OS_LOG_TYPE_DEBUG, "%{public}s Keeping interface %@", buf, 0x16u);

        }
        -[NWCandidatePathMonitor candidatePathEvaluators](val, "candidatePathEvaluators");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectForKeyedSubscript:", v118);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v61, "allKeys");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setWithArray:", v63);
        v110 = (void *)objc_claimAutoreleasedReturnValue();

        v64 = (void *)objc_msgSend(v104, "mutableCopy");
        objc_msgSend(v64, "minusSet:", v110);
        v65 = (void *)objc_msgSend(v110, "mutableCopy");
        objc_msgSend(v65, "minusSet:", v104);
        v102 = v65;
        v133 = 0u;
        v134 = 0u;
        v131 = 0u;
        v132 = 0u;
        v113 = v64;
        v66 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v131, v170, 16);
        if (v66)
        {
          v67 = *(_QWORD *)v132;
          do
          {
            for (kk = 0; kk != v66; ++kk)
            {
              if (*(_QWORD *)v132 != v67)
                objc_enumerationMutation(v113);
              v69 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * kk);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v70 = (id)gLogObj;
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v118, "internalInterface");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                v176 = 2112;
                v177 = v69;
                v178 = 2112;
                v179 = v71;
                _os_log_impl(&dword_182FBE000, v70, OS_LOG_TYPE_DEBUG, "%{public}s Adding %@ over interface %@", buf, 0x20u);

              }
              objc_msgSend(v69, "internalEndpoint");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = nw_parameters_copy(parameters);
              objc_msgSend(v118, "internalInterface");
              v74 = objc_claimAutoreleasedReturnValue();
              nw_parameters_require_interface(v73, v74);

              v75 = nw_path_create_evaluator_for_endpoint(v72, v73);
              -[NWCandidatePathMonitor queue](val, "queue");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v129[0] = MEMORY[0x1E0C809B0];
              v129[1] = 3221225472;
              v129[2] = __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke_10;
              v129[3] = &unk_1E14AC8E0;
              objc_copyWeak(&v130, &location);
              nw_path_evaluator_set_update_handler(v75, v76, v129);

              objc_msgSend(v61, "setObject:forKeyedSubscript:", v75, v69);
              objc_destroyWeak(&v130);

            }
            v66 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v131, v170, 16);
          }
          while (v66);
        }

        v127 = 0u;
        v128 = 0u;
        v125 = 0u;
        v126 = 0u;
        v77 = v102;
        v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v125, v169, 16);
        if (v78)
        {
          v79 = *(_QWORD *)v126;
          do
          {
            for (mm = 0; mm != v78; ++mm)
            {
              if (*(_QWORD *)v126 != v79)
                objc_enumerationMutation(v77);
              v81 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * mm);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v82 = (id)gLogObj;
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v118, "internalInterface");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                v176 = 2112;
                v177 = v81;
                v178 = 2112;
                v179 = v83;
                _os_log_impl(&dword_182FBE000, v82, OS_LOG_TYPE_DEBUG, "%{public}s Removing %@ from interface %@", buf, 0x20u);

              }
              objc_msgSend(v61, "objectForKeyedSubscript:", v81);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              nw_path_evaluator_cancel(v84);
              objc_msgSend(v61, "setObject:forKeyedSubscript:", 0, v81);

            }
            v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v125, v169, 16);
          }
          while (v78);
        }

        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v85 = (id)gLogObj;
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
        {

        }
        else
        {
          v86 = gLogFDOverride == -1;

          if (v86)
            goto LABEL_97;
        }
        v87 = (void *)objc_msgSend(v110, "mutableCopy");
        objc_msgSend(v87, "intersectSet:", v104);
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        v88 = v87;
        v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v121, v168, 16);
        if (v89)
        {
          v90 = *(_QWORD *)v122;
          do
          {
            for (nn = 0; nn != v89; ++nn)
            {
              if (*(_QWORD *)v122 != v90)
                objc_enumerationMutation(v88);
              v92 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * nn);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v93 = (id)gLogObj;
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v118, "internalInterface");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                v176 = 2112;
                v177 = v92;
                v178 = 2112;
                v179 = v94;
                _os_log_impl(&dword_182FBE000, v93, OS_LOG_TYPE_DEBUG, "%{public}s Keeping %@ on interface %@", buf, 0x20u);

              }
            }
            v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v121, v168, 16);
          }
          while (v89);
        }

LABEL_97:
      }
      v100 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v135, v171, 16);
    }
    while (v100);
  }

  objc_destroyWeak(&location);
}

- (void)startWithQueue:(id)a3 updateHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  os_log_type_t v16;
  char *backtrace_string;
  os_log_type_t v18;
  _BOOL4 v19;
  char *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  os_log_type_t v23;
  os_log_type_t v24;
  _QWORD v25[4];
  id v26;
  char v27;
  os_log_type_t type;
  _BYTE location[12];
  __int16 v30;
  char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    __nwlog_obj();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 136446210;
    *(_QWORD *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
    v12 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v27 = 0;
    if (!__nwlog_fault(v12, &type, &v27))
      goto LABEL_38;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)location = 136446210;
        *(_QWORD *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
        _os_log_impl(&dword_182FBE000, v13, v14, "%{public}s called with null queue", location, 0xCu);
      }
    }
    else if (v27)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v18 = type;
      v19 = os_log_type_enabled(v13, type);
      if (backtrace_string)
      {
        if (v19)
        {
          *(_DWORD *)location = 136446466;
          *(_QWORD *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
          v30 = 2082;
          v31 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v13, v18, "%{public}s called with null queue, dumping backtrace:%{public}s", location, 0x16u);
        }

        free(backtrace_string);
LABEL_38:
        if (!v12)
          goto LABEL_4;
LABEL_39:
        free(v12);
        goto LABEL_4;
      }
      if (v19)
      {
        *(_DWORD *)location = 136446210;
        *(_QWORD *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
        _os_log_impl(&dword_182FBE000, v13, v18, "%{public}s called with null queue, no backtrace", location, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v23 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)location = 136446210;
        *(_QWORD *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
        _os_log_impl(&dword_182FBE000, v13, v23, "%{public}s called with null queue, backtrace limit exceeded", location, 0xCu);
      }
    }
LABEL_37:

    goto LABEL_38;
  }
  if (v7)
  {
    -[NWCandidatePathMonitor setQueue:](self, "setQueue:", v6);
    -[NWCandidatePathMonitor setUpdateHandler:](self, "setUpdateHandler:", v8);
    objc_initWeak((id *)location, self);
    -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke;
    v25[3] = &unk_1E14AC8E0;
    objc_copyWeak(&v26, (id *)location);
    nw_path_evaluator_set_update_handler(v9, v6, v25);

    -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    nw_path_evaluator_call_update_handler(v10);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)location);
    goto LABEL_4;
  }
  __nwlog_obj();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)location = 136446210;
  *(_QWORD *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v27 = 0;
  if (!__nwlog_fault(v12, &type, &v27))
    goto LABEL_38;
  if (type == OS_LOG_TYPE_FAULT)
  {
    __nwlog_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    v16 = type;
    if (os_log_type_enabled(v13, type))
    {
      *(_DWORD *)location = 136446210;
      *(_QWORD *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
      _os_log_impl(&dword_182FBE000, v13, v16, "%{public}s called with null updateHandler", location, 0xCu);
    }
    goto LABEL_37;
  }
  if (!v27)
  {
    __nwlog_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    v24 = type;
    if (os_log_type_enabled(v13, type))
    {
      *(_DWORD *)location = 136446210;
      *(_QWORD *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
      _os_log_impl(&dword_182FBE000, v13, v24, "%{public}s called with null updateHandler, backtrace limit exceeded", location, 0xCu);
    }
    goto LABEL_37;
  }
  v20 = (char *)__nw_create_backtrace_string();
  __nwlog_obj();
  v13 = objc_claimAutoreleasedReturnValue();
  v21 = type;
  v22 = os_log_type_enabled(v13, type);
  if (!v20)
  {
    if (v22)
    {
      *(_DWORD *)location = 136446210;
      *(_QWORD *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
      _os_log_impl(&dword_182FBE000, v13, v21, "%{public}s called with null updateHandler, no backtrace", location, 0xCu);
    }
    goto LABEL_37;
  }
  if (v22)
  {
    *(_DWORD *)location = 136446466;
    *(_QWORD *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
    v30 = 2082;
    v31 = v20;
    _os_log_impl(&dword_182FBE000, v13, v21, "%{public}s called with null updateHandler, dumping backtrace:%{public}s", location, 0x16u);
  }

  free(v20);
  if (v12)
    goto LABEL_39;
LABEL_4:

}

- (void)cancelWithHandler:(id)a3
{
  void *v4;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_block_t block;

  block = a3;
  -[NWCandidatePathMonitor cancelCandidatePathEvaluators](self, "cancelCandidatePathEvaluators");
  -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (block)
    {
      -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
      v5 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      nw_path_evaluator_set_cancel_handler(v5, block);

    }
    -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    nw_path_evaluator_cancel(v6);

    -[NWCandidatePathMonitor setPrimaryEvaluator:](self, "setPrimaryEvaluator:", 0);
    goto LABEL_8;
  }
  -[NWCandidatePathMonitor queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = block;
  if (block && v7)
  {
    -[NWCandidatePathMonitor queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v9, block);

LABEL_8:
    v8 = block;
  }

}

- (id)interfacesLocked
{
  id v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  id *v6;
  NSObject *v7;
  id v8;
  _QWORD enumerate_block[4];
  id v11;

  os_unfair_lock_assert_owner(&self->lock);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
  v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    os_unfair_lock_lock(v5 + 24);
    v7 = v6[6];
    os_unfair_lock_unlock(v5 + 24);

  }
  else
  {
    v7 = 0;
  }

  enumerate_block[0] = MEMORY[0x1E0C809B0];
  enumerate_block[1] = 3221225472;
  enumerate_block[2] = __42__NWCandidatePathMonitor_interfacesLocked__block_invoke;
  enumerate_block[3] = &unk_1E149E170;
  v8 = v3;
  v11 = v8;
  nw_path_enumerate_interfaces(v7, enumerate_block);

  return v8;
}

- (NSArray)interfaces
{
  NWCandidatePathMonitor *v2;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  NWCandidatePathMonitor *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__26751;
  v15 = __Block_byref_object_dispose__26752;
  v16 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __36__NWCandidatePathMonitor_interfaces__block_invoke;
  v8 = &unk_1E14ACE40;
  v9 = self;
  v10 = &v11;
  v2 = self;
  v3 = v6;
  os_unfair_lock_lock(&v2->lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(&v2->lock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v4;
}

- (NSArray)candidatePaths
{
  id v3;
  id v4;
  os_unfair_lock_s *p_lock;
  NWCandidatePathMonitor *v6;
  NSArray *v7;
  _QWORD v9[6];

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__NWCandidatePathMonitor_candidatePaths__block_invoke;
  v9[3] = &unk_1E14ACE68;
  v9[4] = self;
  v4 = v3;
  v9[5] = v4;
  p_lock = &self->lock;
  v6 = self;
  os_unfair_lock_lock(p_lock);
  __40__NWCandidatePathMonitor_candidatePaths__block_invoke((uint64_t)v9);
  os_unfair_lock_unlock(p_lock);

  v7 = (NSArray *)v4;
  return v7;
}

- (void)updateRemoteEndpoints:(id)a3
{
  id v4;
  void *v5;
  id v6;
  os_unfair_lock_s *p_lock;
  NWCandidatePathMonitor *v8;
  void *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  char *backtrace_string;
  _BOOL4 v15;
  _QWORD v16[6];
  char v17;
  os_log_type_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __48__NWCandidatePathMonitor_updateRemoteEndpoints___block_invoke;
    v16[3] = &unk_1E14ACE68;
    v16[4] = self;
    v6 = v4;
    v16[5] = v6;
    p_lock = &self->lock;
    v8 = self;
    os_unfair_lock_lock(p_lock);
    __48__NWCandidatePathMonitor_updateRemoteEndpoints___block_invoke((uint64_t)v16);
    os_unfair_lock_unlock(p_lock);

    goto LABEL_3;
  }
  __nwlog_obj();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  v18 = OS_LOG_TYPE_ERROR;
  v17 = 0;
  if (__nwlog_fault(v10, &v18, &v17))
  {
    if (v18 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v18;
      if (os_log_type_enabled(v11, v18))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
        v13 = "%{public}s called with null remoteEndpoints";
LABEL_17:
        _os_log_impl(&dword_182FBE000, v11, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v17)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v18;
        v15 = os_log_type_enabled(v11, v18);
        if (backtrace_string)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136446466;
            v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
            v21 = 2082;
            v22 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v11, v12, "%{public}s called with null remoteEndpoints, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v15)
          goto LABEL_18;
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
        v13 = "%{public}s called with null remoteEndpoints, no backtrace";
        goto LABEL_17;
      }
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v18;
      if (os_log_type_enabled(v11, v18))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
        v13 = "%{public}s called with null remoteEndpoints, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:

  }
LABEL_19:
  if (v10)
    free(v10);
LABEL_3:

}

- (OS_nw_path_evaluator)primaryEvaluator
{
  return self->_primaryEvaluator;
}

- (void)setPrimaryEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_primaryEvaluator, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSArray)remoteEndpoints
{
  return self->_remoteEndpoints;
}

- (void)setRemoteEndpoints:(id)a3
{
  objc_storeStrong((id *)&self->_remoteEndpoints, a3);
}

- (NSMutableDictionary)candidatePathEvaluators
{
  return self->_candidatePathEvaluators;
}

- (void)setCandidatePathEvaluators:(id)a3
{
  objc_storeStrong((id *)&self->_candidatePathEvaluators, a3);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_candidatePathEvaluators, 0);
  objc_storeStrong((id *)&self->_remoteEndpoints, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_primaryEvaluator, 0);
}

uint64_t __48__NWCandidatePathMonitor_updateRemoteEndpoints___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRemoteEndpoints:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "resetCandidatePathEvaluators");
}

void __40__NWCandidatePathMonitor_candidatePaths__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  os_unfair_lock_s *v11;
  os_unfair_lock_s *v12;
  id *v13;
  NSObject *v14;
  void *v15;
  NWPath *v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "interfacesLocked");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
        {
          v3 = v2;
          objc_enumerationMutation(obj);
          v2 = v3;
        }
        v20 = v2;
        v4 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v2);
        objc_msgSend(*(id *)(a1 + 32), "candidatePathEvaluators");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          objc_msgSend(v6, "allKeys");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v8)
          {
            v9 = *(_QWORD *)v22;
            do
            {
              for (i = 0; i != v8; ++i)
              {
                if (*(_QWORD *)v22 != v9)
                  objc_enumerationMutation(v7);
                objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
                v11 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
                v12 = v11;
                if (v11)
                {
                  v13 = v11;
                  os_unfair_lock_lock(v12 + 24);
                  v14 = v13[6];
                  os_unfair_lock_unlock(v12 + 24);

                }
                else
                {
                  v14 = 0;
                }
                if (nw_path_get_status(v14) != nw_path_status_unsatisfied)
                {
                  v15 = *(void **)(a1 + 40);
                  v16 = -[NWPath initWithPath:]([NWPath alloc], "initWithPath:", v14);
                  objc_msgSend(v15, "addObject:", v16);

                }
              }
              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v8);
          }

        }
        v2 = v20 + 1;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v19);
  }

}

void __36__NWCandidatePathMonitor_interfaces__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "interfacesLocked");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __42__NWCandidatePathMonitor_interfacesLocked__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  NWInterface *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[NWInterface initWithInterface:]([NWInterface alloc], "initWithInterface:", v3);

  objc_msgSend(v2, "addObject:", v4);
  return 1;
}

void __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  os_unfair_lock_s *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke_2;
    v6[3] = &unk_1E14ACFD0;
    v3 = (os_unfair_lock_s *)WeakRetained;
    v6[4] = v3;
    os_unfair_lock_lock(v3 + 2);
    __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke_2((uint64_t)v6);
    os_unfair_lock_unlock(v3 + 2);
    -[os_unfair_lock_s updateHandler](v3, "updateHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[os_unfair_lock_s updateHandler](v3, "updateHandler");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v5[2](v5, 0);

    }
  }

}

uint64_t __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetCandidatePathEvaluators");
}

uint64_t __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  NWInterface *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[NWInterface initWithInterface:]([NWInterface alloc], "initWithInterface:", v3);

  objc_msgSend(v2, "addObject:", v4);
  return 1;
}

void __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "updateHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v4;
    if (v2)
    {
      objc_msgSend(v4, "updateHandler");
      v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v3[2](v3, 0);

      WeakRetained = v4;
    }
  }

}

void __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "updateHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v4;
    if (v2)
    {
      objc_msgSend(v4, "updateHandler");
      v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v3[2](v3, 0);

      WeakRetained = v4;
    }
  }

}

void __55__NWCandidatePathMonitor_cancelCandidatePathEvaluators__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "candidatePathEvaluators");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v3;
  v18 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "candidatePathEvaluators");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v8, "allKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
              objc_msgSend(v8, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              nw_path_evaluator_cancel(v15);
              objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v14);

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v11);
        }

        objc_msgSend(*(id *)(a1 + 32), "candidatePathEvaluators");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v18);
  }

}

@end
