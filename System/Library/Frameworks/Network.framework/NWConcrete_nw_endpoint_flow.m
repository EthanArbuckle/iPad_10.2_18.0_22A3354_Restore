@implementation NWConcrete_nw_endpoint_flow

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 616) = 0u;
  *(_OWORD *)((char *)self + 632) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *(_OWORD *)((char *)self + 600) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 536) = 0u;
  *((_OWORD *)self + 43) = 0u;
  *((_QWORD *)self + 90) = 0;
  *((_QWORD *)self + 97) = 0;
  return self;
}

- (void)updatePathWithHandler:(id)a3
{
  id v4;
  id v5;
  NWConcrete_nw_endpoint_handler *v6;
  uint64_t mode;
  NWConcrete_nw_endpoint_mode_handler *v8;
  void *v9;
  id v10;
  void *v11;
  const char *v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  const char *v16;
  char *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  const char *v20;
  NWConcrete_nw_endpoint_handler *v21;
  uint64_t v22;
  id *v23;
  int v24;
  os_unfair_lock_s *v25;
  int v26;
  NWConcrete_nw_endpoint_handler *v27;
  char v28;
  NSObject *v29;
  NWConcrete_nw_endpoint_handler *v30;
  NWConcrete_nw_endpoint_handler *v31;
  char v32;
  const char *v33;
  nw_endpoint_t v34;
  char *id_str;
  unsigned int *v36;
  unsigned int *v37;
  uint64_t v38;
  const char *v39;
  NWConcrete_nw_endpoint_handler *v40;
  NWConcrete_nw_endpoint_handler *v41;
  char v42;
  NWConcrete_nw_endpoint_handler *v43;
  char v44;
  NSObject *v45;
  char *v46;
  char *v47;
  char v48;
  const char *v49;
  nw_endpoint_t v50;
  char *v51;
  unsigned int *v52;
  unsigned int *v53;
  uint64_t v54;
  const char *v55;
  NWConcrete_nw_endpoint_handler *v56;
  char v57;
  NSObject *v58;
  char *v59;
  char *v60;
  char v61;
  const char *v62;
  nw_endpoint_t v63;
  const char *v64;
  unsigned int *v65;
  unsigned int *v66;
  uint64_t v67;
  const char *v68;
  void **v69;
  void **v70;
  const char *v71;
  os_log_type_t v72;
  const char *v73;
  const char *v74;
  void **v75;
  id v76;
  NWConcrete_nw_endpoint_handler *v77;
  BOOL v78;
  NWConcrete_nw_endpoint_handler *v79;
  int state;
  nw_protocol *output_handler;
  id v82;
  void *v83;
  nw_protocol_callbacks *callbacks;
  BOOL v85;
  int v86;
  id v87;
  void *handle;
  char v89;
  _DWORD *v90;
  int v91;
  NWConcrete_nw_endpoint_handler *v92;
  _BOOL4 v93;
  NSObject *v94;
  NWConcrete_nw_endpoint_handler *v95;
  char *v96;
  _BOOL4 v97;
  const char *v98;
  nw_endpoint_t v99;
  const char *v100;
  unsigned int *v101;
  unsigned int *v102;
  uint64_t v103;
  const char *v104;
  void **v105;
  const char *v106;
  nw_protocol_callbacks *v107;
  void *v108;
  char v109;
  char *v110;
  nw_protocol_callbacks *v111;
  void (*updated_path)(nw_protocol *, nw_flow_protocol *, id);
  void **v113;
  void **v114;
  const char *v115;
  void **v116;
  void **v117;
  const char *v118;
  void **v119;
  id v120;
  void **v121;
  id v122;
  id *v123;
  id v124;
  id *v125;
  NWConcrete_nw_endpoint_mode_handler *v126;
  void **v127;
  id v128;
  id *v129;
  void *v130;
  char *v131;
  NSObject *v132;
  os_log_type_t v133;
  char *backtrace_string;
  os_log_type_t v135;
  _BOOL4 v136;
  os_log_type_t v137;
  const char *v138;
  const char *v139;
  nw_endpoint_t v140;
  const char *v141;
  const char *v142;
  const char *v143;
  id v144;
  void *v145;
  const char *name;
  char *v147;
  NSObject *v148;
  os_log_type_t v149;
  const char *v150;
  const char *v151;
  const char *v152;
  nw_endpoint_t v153;
  const char *v154;
  const char *v155;
  const char *v156;
  id v157;
  void *v158;
  os_log_type_t v159;
  char *v160;
  NSObject *v161;
  _BOOL4 v162;
  const char *v163;
  const char *v164;
  nw_endpoint_t v165;
  const char *logging_description;
  const char *v167;
  const char *v168;
  id v169;
  char *v170;
  os_log_type_t v171;
  _BOOL4 v172;
  os_log_type_t v173;
  const char *v174;
  const char *v175;
  os_log_type_t v176;
  os_log_type_t v177[8];
  os_log_type_t v178;
  const char *v179;
  char *v180;
  NWConcrete_nw_endpoint_flow *v181;
  const char *v182;
  const char *v183;
  const char *v184;
  const char *id_string;
  void *v186;
  NWConcrete_nw_endpoint_handler *v187;
  id obj;
  NWConcrete_nw_endpoint_mode_handler *v189;
  _QWORD v190[4];
  id *v191;
  NWConcrete_nw_endpoint_mode_handler *v192;
  _QWORD v193[4];
  id *v194;
  char v195;
  os_log_type_t v196;
  nw_flow_protocol *p_shared_protocol;
  char v198;
  os_log_type_t type[8];
  char v200;
  uint8_t buf[4];
  const char *v202;
  __int16 v203;
  char *v204;
  __int16 v205;
  const char *v206;
  __int16 v207;
  void *v208;
  __int16 v209;
  const char *v210;
  __int16 v211;
  const char *v212;
  __int16 v213;
  id v214;
  __int16 v215;
  int v216;
  __int16 v217;
  int v218;
  uint64_t v219;

  v219 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
    v131 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(p_shared_protocol) = 0;
    if (__nwlog_fault(v131, type, &p_shared_protocol))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v132 = objc_claimAutoreleasedReturnValue();
        v133 = type[0];
        if (os_log_type_enabled(v132, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
          _os_log_impl(&dword_182FBE000, v132, v133, "%{public}s called with null handler", buf, 0xCu);
        }
      }
      else if ((_BYTE)p_shared_protocol)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v132 = objc_claimAutoreleasedReturnValue();
        v135 = type[0];
        v136 = os_log_type_enabled(v132, type[0]);
        if (backtrace_string)
        {
          if (v136)
          {
            *(_DWORD *)buf = 136446466;
            v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
            v203 = 2082;
            v204 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v132, v135, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_196;
        }
        if (v136)
        {
          *(_DWORD *)buf = 136446210;
          v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
          _os_log_impl(&dword_182FBE000, v132, v135, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v132 = objc_claimAutoreleasedReturnValue();
        v137 = type[0];
        if (os_log_type_enabled(v132, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
          _os_log_impl(&dword_182FBE000, v132, v137, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_196:
    if (v131)
      free(v131);
    v11 = 0;
    goto LABEL_174;
  }
  v6 = (NWConcrete_nw_endpoint_handler *)v4;
  mode = v6->mode;

  if ((_DWORD)mode == 2)
  {
    v187 = v6;
    v8 = nw_endpoint_handler_copy_flow(v6);
    v9 = (void *)*((_QWORD *)v8 + 104);
    v189 = v8;
    v181 = self;
    if (v9)
    {
      obj = (id)nw_path_flow_registration_copy_path(v9);
    }
    else
    {
      v21 = v6;
      os_unfair_lock_lock(&v21->lock);
      obj = v21->current_path;
      os_unfair_lock_unlock(&v21->lock);

    }
    v186 = v5;
    v23 = (id *)((char *)v8 + 16);
    v22 = *((_QWORD *)v8 + 2);
    if (v22)
      v24 = *(_DWORD *)(v22 + 272);
    else
      v24 = 0;
    v25 = (os_unfair_lock_s *)((char *)v8 + 880);
    os_unfair_lock_lock((os_unfair_lock_t)v8 + 220);
    objc_storeStrong((id *)v8 + 2, obj);
    os_unfair_lock_unlock((os_unfair_lock_t)v8 + 220);
    if (*((_QWORD *)v8 + 109))
      *((_BYTE *)v8 + 36) |= 2u;
    if (v22)
    {
      if ((*((_BYTE *)v8 + 32) & 0x40) != 0)
      {
        if (*v23)
        {
          v26 = *((_DWORD *)*v23 + 68);
          if (v26)
          {
            if (v24 != v26 && (v26 & 0x20000000) == 0)
            {
              if (nw_endpoint_handler_get_minimize_logging(v187))
              {
                if ((nw_endpoint_handler_get_logging_disabled(v187) & 1) != 0)
                  goto LABEL_171;
                if (__nwlog_connection_log::onceToken != -1)
                  dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
                v29 = (id)gconnectionLogObj;
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  id_string = nw_endpoint_handler_get_id_string(v187);
                  v164 = nw_endpoint_handler_dry_run_string(v187);
                  v165 = nw_endpoint_handler_copy_endpoint(v187);
                  logging_description = nw_endpoint_get_logging_description(v165);
                  v167 = nw_endpoint_handler_state_string(v187);
                  v168 = nw_endpoint_handler_mode_string(v187);
                  v169 = nw_endpoint_handler_copy_current_path(v187);
                  *(_DWORD *)buf = 136448258;
                  v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
                  v203 = 2082;
                  v204 = (char *)id_string;
                  v205 = 2082;
                  v206 = v164;
                  v207 = 2082;
                  v208 = (void *)logging_description;
                  v209 = 2082;
                  v210 = v167;
                  v211 = 2082;
                  v212 = v168;
                  v213 = 2114;
                  v214 = v169;
                  v215 = 1024;
                  v216 = v24;
                  v217 = 1024;
                  v218 = v26;
                  _os_log_impl(&dword_182FBE000, v29, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] filter state changed (%X --> %X), drop flow", buf, 0x54u);

                }
              }
              else
              {
                v27 = v187;
                v28 = *((_BYTE *)v27 + 268);

                if ((v28 & 0x20) != 0)
                {
LABEL_171:
                  v129 = v187;
                  v126 = (NWConcrete_nw_endpoint_mode_handler *)v129[5];

                  v193[0] = MEMORY[0x1E0C809B0];
                  v193[1] = 3221225472;
                  v193[2] = __53__NWConcrete_nw_endpoint_flow_updatePathWithHandler___block_invoke;
                  v193[3] = &unk_1E14ACFD0;
                  v194 = v129;
                  nw_queue_context_async(v126, v193);
                  v125 = (id *)&v194;
                  goto LABEL_172;
                }
                if (__nwlog_connection_log::onceToken != -1)
                  dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
                v29 = (id)gconnectionLogObj;
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  v30 = v27;

                  v31 = v30;
                  v32 = *((_BYTE *)v27 + 268);

                  if ((v32 & 1) != 0)
                    v33 = "dry-run ";
                  else
                    v33 = "";
                  v34 = nw_endpoint_handler_copy_endpoint(v31);
                  v179 = nw_endpoint_get_logging_description(v34);
                  v182 = v33;
                  id_str = v30->id_str;
                  v36 = v31;
                  v37 = v36;
                  v38 = v36[30];
                  if (v38 > 5)
                    v39 = "unknown-state";
                  else
                    v39 = off_1E149FC48[v38];

                  v116 = v37;
                  v117 = v116;
                  v118 = "path";
                  switch(v187->mode)
                  {
                    case 0:
                      break;
                    case 1:
                      v118 = "resolver";
                      break;
                    case 2:
                      v118 = nw_endpoint_flow_mode_string(v116[31]);
                      break;
                    case 3:
                      v118 = "proxy";
                      break;
                    case 4:
                      v118 = "fallback";
                      break;
                    case 5:
                      v118 = "transform";
                      break;
                    default:
                      v118 = "unknown-mode";
                      break;
                  }

                  v127 = v117;
                  os_unfair_lock_lock((os_unfair_lock_t)v127 + 28);
                  v128 = v127[8];
                  os_unfair_lock_unlock((os_unfair_lock_t)v127 + 28);

                  *(_DWORD *)buf = 136448258;
                  v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
                  v203 = 2082;
                  v204 = id_str;
                  v205 = 2082;
                  v206 = v182;
                  v207 = 2082;
                  v208 = (void *)v179;
                  v209 = 2082;
                  v210 = v39;
                  v211 = 2082;
                  v212 = v118;
                  v213 = 2114;
                  v214 = v128;
                  v215 = 1024;
                  v216 = v24;
                  v217 = 1024;
                  v218 = v26;
                  _os_log_impl(&dword_182FBE000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] filter state changed (%X --> %X), drop flow", buf, 0x54u);

                }
              }

              goto LABEL_171;
            }
          }
        }
      }
    }
    if ((*((_BYTE *)v189 + 33) & 4) != 0)
    {
      os_unfair_lock_lock(v25);
      objc_storeStrong((id *)v189 + 1, *((id *)v189 + 2));
      os_unfair_lock_unlock(v25);
      v40 = v187;
      nw_endpoint_flow_connected_path_change(v187);
    }
    else
    {
      v40 = v187;
      if ((*((_BYTE *)v189 + 34) & 0x40) == 0)
      {
        v41 = v187;
        v42 = *((_BYTE *)v41 + 268);

        if ((v42 & 8) != 0)
        {
          if (nw_endpoint_handler_get_minimize_logging(v41))
          {
            if ((nw_endpoint_handler_get_logging_disabled(v41) & 1) != 0)
              goto LABEL_163;
            if (__nwlog_connection_log::onceToken != -1)
              dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
            v45 = (id)gconnectionLogObj;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              v151 = nw_endpoint_handler_get_id_string(v41);
              v152 = nw_endpoint_handler_dry_run_string(v41);
              v153 = nw_endpoint_handler_copy_endpoint(v41);
              v154 = nw_endpoint_get_logging_description(v153);
              v155 = nw_endpoint_handler_state_string(v41);
              v156 = nw_endpoint_handler_mode_string(v41);
              v157 = nw_endpoint_handler_copy_current_path(v41);
              *(_DWORD *)buf = 136447746;
              v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
              v203 = 2082;
              v204 = (char *)v151;
              v205 = 2082;
              v206 = v152;
              v207 = 2082;
              v208 = (void *)v154;
              v209 = 2082;
              v210 = v155;
              v211 = 2082;
              v212 = v156;
              v213 = 2114;
              v214 = v157;
              _os_log_impl(&dword_182FBE000, v45, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] better path detected during establishment, will try to reset", buf, 0x48u);

            }
          }
          else
          {
            v43 = v41;
            v44 = *((_BYTE *)v41 + 268);

            if ((v44 & 0x20) != 0)
            {
LABEL_163:
              v123 = v41;
              v124 = v123[5];

              v190[0] = MEMORY[0x1E0C809B0];
              v190[1] = 3221225472;
              v190[2] = __53__NWConcrete_nw_endpoint_flow_updatePathWithHandler___block_invoke_5;
              v190[3] = &unk_1E14ACE68;
              v191 = v123;
              v192 = v189;
              nw_queue_context_async(v124, v190);

              v125 = (id *)&v191;
              v126 = v192;
LABEL_172:

              goto LABEL_173;
            }
            if (__nwlog_connection_log::onceToken != -1)
              dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
            v45 = (id)gconnectionLogObj;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              v46 = v43;

              v47 = v46;
              v48 = *((_BYTE *)v41 + 268);

              if ((v48 & 1) != 0)
                v49 = "dry-run ";
              else
                v49 = "";
              v50 = nw_endpoint_handler_copy_endpoint(v47);
              v183 = nw_endpoint_get_logging_description(v50);
              v51 = v46 + 168;
              v52 = v47;
              v53 = v52;
              v54 = v52[30];
              if (v54 > 5)
                v55 = "unknown-state";
              else
                v55 = off_1E149FC48[v54];

              v113 = v53;
              v114 = v113;
              v115 = "path";
              switch(v187->mode)
              {
                case 0:
                  break;
                case 1:
                  v115 = "resolver";
                  break;
                case 2:
                  v115 = nw_endpoint_flow_mode_string(v113[31]);
                  break;
                case 3:
                  v115 = "proxy";
                  break;
                case 4:
                  v115 = "fallback";
                  break;
                case 5:
                  v115 = "transform";
                  break;
                default:
                  v115 = "unknown-mode";
                  break;
              }

              v121 = v114;
              os_unfair_lock_lock((os_unfair_lock_t)v121 + 28);
              v122 = v121[8];
              os_unfair_lock_unlock((os_unfair_lock_t)v121 + 28);

              *(_DWORD *)buf = 136447746;
              v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
              v203 = 2082;
              v204 = v51;
              v205 = 2082;
              v206 = v49;
              v207 = 2082;
              v208 = (void *)v183;
              v209 = 2082;
              v210 = v55;
              v211 = 2082;
              v212 = v115;
              v213 = 2114;
              v214 = v122;
              _os_log_impl(&dword_182FBE000, v45, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] better path detected during establishment, will try to reset", buf, 0x48u);

            }
          }

          goto LABEL_163;
        }
      }
    }
    v56 = v40;
    v57 = *((_BYTE *)v56 + 268);

    if ((v57 & 0x20) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v58 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        v59 = v56;

        v60 = v59;
        v61 = *((_BYTE *)v56 + 268);

        if ((v61 & 1) != 0)
          v62 = "dry-run ";
        else
          v62 = "";
        v63 = nw_endpoint_handler_copy_endpoint(v60);
        v64 = nw_endpoint_get_logging_description(v63);
        v180 = v59 + 168;
        v65 = v60;
        v66 = v65;
        v67 = v65[30];
        if (v67 > 5)
          v68 = "unknown-state";
        else
          v68 = off_1E149FC48[v67];
        *(_QWORD *)v177 = v68;

        v69 = v66;
        v70 = v69;
        v71 = "path";
        switch(v187->mode)
        {
          case 0:
            break;
          case 1:
            v71 = "resolver";
            break;
          case 2:
            v71 = nw_endpoint_flow_mode_string(v69[31]);
            break;
          case 3:
            v71 = "proxy";
            break;
          case 4:
            v71 = "fallback";
            break;
          case 5:
            v71 = "transform";
            break;
          default:
            v71 = "unknown-mode";
            break;
        }

        v75 = v70;
        os_unfair_lock_lock((os_unfair_lock_t)v75 + 28);
        v76 = v75[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v75 + 28);

        *(_DWORD *)buf = 136447746;
        v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
        v203 = 2082;
        v204 = v180;
        v205 = 2082;
        v206 = v62;
        v207 = 2082;
        v208 = (void *)v64;
        v209 = 2082;
        v210 = *(const char **)v177;
        v211 = 2082;
        v212 = v71;
        v213 = 2114;
        v214 = v76;
        _os_log_impl(&dword_182FBE000, v58, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);

      }
    }
    v77 = v56;
    v78 = (*((_BYTE *)v56 + 268) & 1) == 0;

    if (v78)
    {
      v79 = v77;
      state = v79->state;

      if (state == 5)
        goto LABEL_135;
      output_handler = v181->shared_protocol.protocol.output_handler;
      v82 = *v23;
      v83 = v82;
      if (!output_handler)
        goto LABEL_134;
      callbacks = output_handler->callbacks;
      if (!callbacks)
        goto LABEL_134;
      if (callbacks->updated_path)
        v85 = v82 == 0;
      else
        v85 = 1;
      v86 = !v85;

      if (!v86)
      {
LABEL_135:
        if ((*((_BYTE *)v181 + 33) & 0x40) != 0)
          nw_endpoint_flow_setup_channel(v79);
        goto LABEL_173;
      }
      v87 = *v23;
      v83 = v87;
      handle = output_handler->handle;
      if (handle == &nw_protocol_ref_counted_handle)
      {
        v107 = output_handler[1].callbacks;
        if (v107)
          output_handler[1].callbacks = (nw_protocol_callbacks *)((char *)&v107->add_input_handler + 1);
        v89 = -1;
      }
      else
      {
        v89 = 0;
      }
      *(_QWORD *)type = output_handler;
      v200 = v89;
      v108 = v181->shared_protocol.protocol.handle;
      if (v108 == &nw_protocol_ref_counted_handle)
      {
        v110 = (char *)v181->shared_protocol.listen_protocol.handle;
        if (v110)
          v181->shared_protocol.listen_protocol.handle = v110 + 1;
        v109 = -1;
      }
      else
      {
        v109 = 0;
      }
      p_shared_protocol = &v181->shared_protocol;
      v198 = v109;
      if (v87)
      {
        v111 = output_handler->callbacks;
        if (v111)
        {
          updated_path = (void (*)(nw_protocol *, nw_flow_protocol *, id))v111->updated_path;
          if (updated_path)
          {
            updated_path(output_handler, &v181->shared_protocol, v87);
LABEL_130:
            if (v108 == &nw_protocol_ref_counted_handle)
              nw::release_if_needed<nw_protocol *>((uint64_t *)&p_shared_protocol);
            if (handle == &nw_protocol_ref_counted_handle)
              nw::release_if_needed<nw_protocol *>((uint64_t *)type);
LABEL_134:

            goto LABEL_135;
          }
        }
        __nwlog_obj();
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        name = output_handler->identifier->name;
        *(_DWORD *)buf = 136446722;
        v202 = "__nw_protocol_updated_path";
        if (!name)
          name = "invalid";
        v203 = 2082;
        v204 = (char *)name;
        v205 = 2048;
        v206 = (const char *)output_handler;
        v147 = (char *)_os_log_send_and_compose_impl();

        v196 = OS_LOG_TYPE_ERROR;
        v195 = 0;
        if (!__nwlog_fault(v147, &v196, &v195))
          goto LABEL_252;
        if (v196 == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v148 = objc_claimAutoreleasedReturnValue();
          v149 = v196;
          if (os_log_type_enabled(v148, v196))
          {
            v150 = output_handler->identifier->name;
            if (!v150)
              v150 = "invalid";
            *(_DWORD *)buf = 136446722;
            v202 = "__nw_protocol_updated_path";
            v203 = 2082;
            v204 = (char *)v150;
            v205 = 2048;
            v206 = (const char *)output_handler;
            _os_log_impl(&dword_182FBE000, v148, v149, "%{public}s protocol %{public}s (%p) has invalid updated_path callback", buf, 0x20u);
          }
        }
        else
        {
          if (v195)
          {
            v160 = (char *)__nw_create_backtrace_string();
            __nwlog_obj();
            v161 = objc_claimAutoreleasedReturnValue();
            v178 = v196;
            v162 = os_log_type_enabled(v161, v196);
            if (v160)
            {
              if (v162)
              {
                v163 = output_handler->identifier->name;
                if (!v163)
                  v163 = "invalid";
                *(_DWORD *)buf = 136446978;
                v202 = "__nw_protocol_updated_path";
                v203 = 2082;
                v204 = (char *)v163;
                v205 = 2048;
                v206 = (const char *)output_handler;
                v207 = 2082;
                v208 = v160;
                _os_log_impl(&dword_182FBE000, v161, v178, "%{public}s protocol %{public}s (%p) has invalid updated_path callback, dumping backtrace:%{public}s", buf, 0x2Au);
              }

              free(v160);
            }
            else
            {
              if (v162)
              {
                v175 = output_handler->identifier->name;
                if (!v175)
                  v175 = "invalid";
                *(_DWORD *)buf = 136446722;
                v202 = "__nw_protocol_updated_path";
                v203 = 2082;
                v204 = (char *)v175;
                v205 = 2048;
                v206 = (const char *)output_handler;
                _os_log_impl(&dword_182FBE000, v161, v178, "%{public}s protocol %{public}s (%p) has invalid updated_path callback, no backtrace", buf, 0x20u);
              }

            }
LABEL_252:
            if (!v147)
              goto LABEL_130;
LABEL_253:
            free(v147);
            goto LABEL_130;
          }
          __nwlog_obj();
          v148 = objc_claimAutoreleasedReturnValue();
          v173 = v196;
          if (os_log_type_enabled(v148, v196))
          {
            v174 = output_handler->identifier->name;
            if (!v174)
              v174 = "invalid";
            *(_DWORD *)buf = 136446722;
            v202 = "__nw_protocol_updated_path";
            v203 = 2082;
            v204 = (char *)v174;
            v205 = 2048;
            v206 = (const char *)output_handler;
            _os_log_impl(&dword_182FBE000, v148, v173, "%{public}s protocol %{public}s (%p) has invalid updated_path callback, backtrace limit exceeded", buf, 0x20u);
          }
        }
      }
      else
      {
        __nwlog_obj();
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446210;
        v202 = "__nw_protocol_updated_path";
        v147 = (char *)_os_log_send_and_compose_impl();

        v196 = OS_LOG_TYPE_ERROR;
        v195 = 0;
        if (!__nwlog_fault(v147, &v196, &v195))
          goto LABEL_252;
        if (v196 == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v148 = objc_claimAutoreleasedReturnValue();
          v159 = v196;
          if (os_log_type_enabled(v148, v196))
          {
            *(_DWORD *)buf = 136446210;
            v202 = "__nw_protocol_updated_path";
            _os_log_impl(&dword_182FBE000, v148, v159, "%{public}s called with null path", buf, 0xCu);
          }
        }
        else if (v195)
        {
          v170 = (char *)__nw_create_backtrace_string();
          __nwlog_obj();
          v148 = objc_claimAutoreleasedReturnValue();
          v171 = v196;
          v172 = os_log_type_enabled(v148, v196);
          if (v170)
          {
            if (v172)
            {
              *(_DWORD *)buf = 136446466;
              v202 = "__nw_protocol_updated_path";
              v203 = 2082;
              v204 = v170;
              _os_log_impl(&dword_182FBE000, v148, v171, "%{public}s called with null path, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(v170);
            if (!v147)
              goto LABEL_130;
            goto LABEL_253;
          }
          if (v172)
          {
            *(_DWORD *)buf = 136446210;
            v202 = "__nw_protocol_updated_path";
            _os_log_impl(&dword_182FBE000, v148, v171, "%{public}s called with null path, no backtrace", buf, 0xCu);
          }
        }
        else
        {
          __nwlog_obj();
          v148 = objc_claimAutoreleasedReturnValue();
          v176 = v196;
          if (os_log_type_enabled(v148, v196))
          {
            *(_DWORD *)buf = 136446210;
            v202 = "__nw_protocol_updated_path";
            _os_log_impl(&dword_182FBE000, v148, v176, "%{public}s called with null path, backtrace limit exceeded", buf, 0xCu);
          }
        }
      }

      goto LABEL_252;
    }
    if (*v23)
    {
      v90 = *v23;
      v91 = v90[94];

      if (v91 == 1)
      {
        v77->event = (nw_endpoint_handler_event_s)393219;
        nw_endpoint_handler_report(v77, 0, &v77->event.domain, 0);
LABEL_173:

        v11 = v186;
        goto LABEL_174;
      }
    }
    if (nw_endpoint_handler_get_minimize_logging(v77))
    {
      if ((nw_endpoint_handler_get_logging_disabled(v77) & 1) != 0)
        goto LABEL_155;
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v94 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
      {
        v138 = nw_endpoint_handler_get_id_string(v77);
        v139 = nw_endpoint_handler_dry_run_string(v77);
        v140 = nw_endpoint_handler_copy_endpoint(v77);
        v141 = nw_endpoint_get_logging_description(v140);
        v142 = nw_endpoint_handler_state_string(v77);
        v143 = nw_endpoint_handler_mode_string(v77);
        v144 = nw_endpoint_handler_copy_current_path(v77);
        *(_DWORD *)buf = 136447746;
        v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
        v203 = 2082;
        v204 = (char *)v138;
        v205 = 2082;
        v206 = v139;
        v207 = 2082;
        v208 = (void *)v141;
        v209 = 2082;
        v210 = v142;
        v211 = 2082;
        v212 = v143;
        v213 = 2114;
        v214 = v144;
        _os_log_impl(&dword_182FBE000, v94, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] path no longer satisfied, resetting", buf, 0x48u);

      }
    }
    else
    {
      v92 = v77;
      v93 = (*((_BYTE *)v56 + 268) & 0x20) == 0;

      if (!v93)
      {
LABEL_155:
        nw_endpoint_flow_failed_with_error(v77, 1, 0);
        goto LABEL_173;
      }
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v94 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        v95 = v92;

        v96 = v95;
        v97 = (*((_BYTE *)v56 + 268) & 1) == 0;

        if (v97)
          v98 = "";
        else
          v98 = "dry-run ";
        v99 = nw_endpoint_handler_copy_endpoint(v96);
        v100 = nw_endpoint_get_logging_description(v99);
        v101 = v96;
        v102 = v101;
        v103 = v101[30];
        if (v103 > 5)
          v104 = "unknown-state";
        else
          v104 = off_1E149FC48[v103];

        v105 = v102;
        v106 = "path";
        switch(v187->mode)
        {
          case 0:
            break;
          case 1:
            v106 = "resolver";
            break;
          case 2:
            v106 = nw_endpoint_flow_mode_string(v105[31]);
            break;
          case 3:
            v106 = "proxy";
            break;
          case 4:
            v106 = "fallback";
            break;
          case 5:
            v106 = "transform";
            break;
          default:
            v106 = "unknown-mode";
            break;
        }
        v184 = v106;

        v119 = v105;
        os_unfair_lock_lock((os_unfair_lock_t)v119 + 28);
        v120 = v119[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v119 + 28);

        *(_DWORD *)buf = 136447746;
        v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
        v203 = 2082;
        v204 = v95->id_str;
        v205 = 2082;
        v206 = v98;
        v207 = 2082;
        v208 = (void *)v100;
        v209 = 2082;
        v210 = v104;
        v211 = 2082;
        v212 = v184;
        v213 = 2114;
        v214 = v120;
        _os_log_impl(&dword_182FBE000, v94, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] path no longer satisfied, resetting", buf, 0x48u);

      }
    }

    goto LABEL_155;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v10 = (id)gLogObj;
  v11 = v5;
  if (mode > 5)
    v12 = "unknown-mode";
  else
    v12 = off_1E149FC18[mode];
  *(_DWORD *)buf = 136446722;
  v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
  v203 = 2082;
  v204 = (char *)v12;
  v205 = 2082;
  v206 = "flow";
  v13 = (char *)_os_log_send_and_compose_impl();

  type[0] = OS_LOG_TYPE_ERROR;
  LOBYTE(p_shared_protocol) = 0;
  if (__nwlog_fault(v13, type, &p_shared_protocol))
  {
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      v15 = type[0];
      if (os_log_type_enabled(v14, type[0]))
      {
        if (mode > 5)
          v16 = "unknown-mode";
        else
          v16 = off_1E149FC18[mode];
        *(_DWORD *)buf = 136446722;
        v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
        v203 = 2082;
        v204 = (char *)v16;
        v205 = 2082;
        v206 = "flow";
        _os_log_impl(&dword_182FBE000, v14, v15, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
      }
    }
    else if ((_BYTE)p_shared_protocol)
    {
      v17 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      v18 = type[0];
      v19 = os_log_type_enabled(v14, type[0]);
      if (v17)
      {
        if (v19)
        {
          if (mode > 5)
            v20 = "unknown-mode";
          else
            v20 = off_1E149FC18[mode];
          *(_DWORD *)buf = 136446978;
          v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
          v203 = 2082;
          v204 = (char *)v20;
          v205 = 2082;
          v206 = "flow";
          v207 = 2082;
          v208 = v17;
          _os_log_impl(&dword_182FBE000, v14, v18, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
        }

        free(v17);
        if (v13)
          goto LABEL_141;
        goto LABEL_174;
      }
      if (v19)
      {
        if (mode > 5)
          v74 = "unknown-mode";
        else
          v74 = off_1E149FC18[mode];
        *(_DWORD *)buf = 136446722;
        v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
        v203 = 2082;
        v204 = (char *)v74;
        v205 = 2082;
        v206 = "flow";
        _os_log_impl(&dword_182FBE000, v14, v18, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      v72 = type[0];
      if (os_log_type_enabled(v14, type[0]))
      {
        if (mode > 5)
          v73 = "unknown-mode";
        else
          v73 = off_1E149FC18[mode];
        *(_DWORD *)buf = 136446722;
        v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
        v203 = 2082;
        v204 = (char *)v73;
        v205 = 2082;
        v206 = "flow";
        _os_log_impl(&dword_182FBE000, v14, v72, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
      }
    }

  }
  if (v13)
LABEL_141:
    free(v13);
LABEL_174:

}

- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4
{
  id v6;
  uint64_t (**v7)(_QWORD);
  unsigned int *v8;
  uint64_t v9;
  char v10;
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
  os_log_type_t v32;
  _BOOL4 v33;
  os_log_type_t v34;
  os_log_type_t v35;
  char v36;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (**)(_QWORD))a4;
  if (!v6)
  {
    __nwlog_obj();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v36 = 0;
    if (!__nwlog_fault(v13, &type, &v36))
      goto LABEL_39;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v26 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v14, v26, "%{public}s called with null handler", buf, 0xCu);
      }
      goto LABEL_38;
    }
    if (!v36)
    {
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v34 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v14, v34, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_38;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    v30 = type;
    v31 = os_log_type_enabled(v14, type);
    if (!backtrace_string)
    {
      if (v31)
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v14, v30, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
      goto LABEL_38;
    }
    if (v31)
    {
      *(_DWORD *)buf = 136446466;
      v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
      v40 = 2082;
      v41 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v14, v30, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_62:

    free(backtrace_string);
    goto LABEL_39;
  }
  v8 = (unsigned int *)v6;
  v9 = v8[29];

  if ((_DWORD)v9 != 2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    if (v9 > 5)
      v12 = "unknown-mode";
    else
      v12 = off_1E149FC18[v9];
    *(_DWORD *)buf = 136446722;
    v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
    v40 = 2082;
    v41 = (void *)v12;
    v42 = 2082;
    v43 = "flow";
    v13 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v36 = 0;
    if (__nwlog_fault(v13, &type, &v36))
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
          v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
          v40 = 2082;
          v41 = (void *)v16;
          v42 = 2082;
          v43 = "flow";
          _os_log_impl(&dword_182FBE000, v14, v15, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v36)
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
            v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
            v40 = 2082;
            v41 = (void *)v20;
            v42 = 2082;
            v43 = "flow";
            v44 = 2082;
            v45 = v17;
            _os_log_impl(&dword_182FBE000, v14, v18, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v17);
          if (!v13)
            goto LABEL_41;
          goto LABEL_40;
        }
        if (v19)
        {
          if (v9 > 5)
            v23 = "unknown-mode";
          else
            v23 = off_1E149FC18[v9];
          *(_DWORD *)buf = 136446722;
          v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
          v40 = 2082;
          v41 = (void *)v23;
          v42 = 2082;
          v43 = "flow";
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
          v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
          v40 = 2082;
          v41 = (void *)v22;
          v42 = 2082;
          v43 = "flow";
          _os_log_impl(&dword_182FBE000, v14, v21, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_38;
    }
LABEL_39:
    if (!v13)
    {
LABEL_41:
      v10 = 1;
      goto LABEL_42;
    }
LABEL_40:
    free(v13);
    goto LABEL_41;
  }
  if (!v7)
  {
    __nwlog_obj();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v36 = 0;
    if (!__nwlog_fault(v13, &type, &v36))
      goto LABEL_39;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v28 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v14, v28, "%{public}s called with null applyBlock", buf, 0xCu);
      }
LABEL_38:

      goto LABEL_39;
    }
    if (!v36)
    {
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v35 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v14, v35, "%{public}s called with null applyBlock, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_38;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    v32 = type;
    v33 = os_log_type_enabled(v14, type);
    if (!backtrace_string)
    {
      if (v33)
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v14, v32, "%{public}s called with null applyBlock, no backtrace", buf, 0xCu);
      }
      goto LABEL_38;
    }
    if (v33)
    {
      *(_DWORD *)buf = 136446466;
      v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
      v40 = 2082;
      v41 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v14, v32, "%{public}s called with null applyBlock, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_62;
  }
  if (self->child_endpoint_handler)
    v10 = v7[2](v7);
  else
    v10 = 0;
LABEL_42:

  return v10;
}

- (void)dealloc
{
  id v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  id v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  id v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  tcp_info *tcp_info;
  tcp_connection_info *tcp_connection_info;
  nw_data_transfer_snapshot *data_transfer_snapshot;
  OS_nw_context *context;
  char *backtrace_string;
  os_log_type_t v20;
  _BOOL4 v21;
  char *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  char *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  os_log_type_t v28;
  os_log_type_t v29;
  os_log_type_t v30;
  objc_super v31;
  char v32;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (self->internally_retained_object)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
    v4 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v32 = 0;
    if (!__nwlog_fault(v4, &type, &v32))
      goto LABEL_7;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      v6 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
        _os_log_impl(&dword_182FBE000, v5, v6, "%{public}s over-release of nw_endpoint_flow_t! Object should not be internally retained and deallocating", buf, 0xCu);
      }
LABEL_6:

LABEL_7:
      if (!v4)
        goto LABEL_9;
      goto LABEL_8;
    }
    if (!v32)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      v28 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
        _os_log_impl(&dword_182FBE000, v5, v28, "%{public}s over-release of nw_endpoint_flow_t! Object should not be internally retained and deallocating, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_6;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    v20 = type;
    v21 = os_log_type_enabled(v5, type);
    if (!backtrace_string)
    {
      if (v21)
      {
        *(_DWORD *)buf = 136446210;
        v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
        _os_log_impl(&dword_182FBE000, v5, v20, "%{public}s over-release of nw_endpoint_flow_t! Object should not be internally retained and deallocating, no backtrace", buf, 0xCu);
      }
      goto LABEL_6;
    }
    if (v21)
    {
      *(_DWORD *)buf = 136446466;
      v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      v36 = 2082;
      v37 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v5, v20, "%{public}s over-release of nw_endpoint_flow_t! Object should not be internally retained and deallocating, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
    if (v4)
LABEL_8:
      free(v4);
  }
LABEL_9:
  if (!self->shared_protocol.read_requests)
    goto LABEL_17;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v7 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
  v8 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v32 = 0;
  if (!__nwlog_fault(v8, &type, &v32))
  {
LABEL_15:
    if (!v8)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    v10 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      _os_log_impl(&dword_182FBE000, v9, v10, "%{public}s read requests not drained", buf, 0xCu);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!v32)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    v29 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      _os_log_impl(&dword_182FBE000, v9, v29, "%{public}s read requests not drained, backtrace limit exceeded", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v22 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v9 = (id)gLogObj;
  v23 = type;
  v24 = os_log_type_enabled(v9, type);
  if (!v22)
  {
    if (v24)
    {
      *(_DWORD *)buf = 136446210;
      v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      _os_log_impl(&dword_182FBE000, v9, v23, "%{public}s read requests not drained, no backtrace", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (v24)
  {
    *(_DWORD *)buf = 136446466;
    v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
    v36 = 2082;
    v37 = v22;
    _os_log_impl(&dword_182FBE000, v9, v23, "%{public}s read requests not drained, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v22);
  if (v8)
LABEL_16:
    free(v8);
LABEL_17:
  if (!self->shared_protocol.write_requests)
    goto LABEL_25;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v11 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
  v12 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v32 = 0;
  if (!__nwlog_fault(v12, &type, &v32))
  {
LABEL_23:
    if (!v12)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    v14 = type;
    if (os_log_type_enabled(v13, type))
    {
      *(_DWORD *)buf = 136446210;
      v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      _os_log_impl(&dword_182FBE000, v13, v14, "%{public}s write requests not drained", buf, 0xCu);
    }
LABEL_22:

    goto LABEL_23;
  }
  if (!v32)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    v30 = type;
    if (os_log_type_enabled(v13, type))
    {
      *(_DWORD *)buf = 136446210;
      v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      _os_log_impl(&dword_182FBE000, v13, v30, "%{public}s write requests not drained, backtrace limit exceeded", buf, 0xCu);
    }
    goto LABEL_22;
  }
  v25 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v13 = (id)gLogObj;
  v26 = type;
  v27 = os_log_type_enabled(v13, type);
  if (!v25)
  {
    if (v27)
    {
      *(_DWORD *)buf = 136446210;
      v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      _os_log_impl(&dword_182FBE000, v13, v26, "%{public}s write requests not drained, no backtrace", buf, 0xCu);
    }
    goto LABEL_22;
  }
  if (v27)
  {
    *(_DWORD *)buf = 136446466;
    v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
    v36 = 2082;
    v37 = v25;
    _os_log_impl(&dword_182FBE000, v13, v26, "%{public}s write requests not drained, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v25);
  if (v12)
LABEL_24:
    free(v12);
LABEL_25:
  tcp_info = self->tcp_info;
  if (tcp_info)
  {
    free(tcp_info);
    self->tcp_info = 0;
  }
  tcp_connection_info = self->tcp_connection_info;
  if (tcp_connection_info)
  {
    free(tcp_connection_info);
    self->tcp_connection_info = 0;
  }
  data_transfer_snapshot = self->data_transfer_snapshot;
  if (data_transfer_snapshot)
  {
    free(data_transfer_snapshot);
    self->data_transfer_snapshot = 0;
  }
  context = self->shared_protocol.context;
  self->shared_protocol.context = 0;

  v31.receiver = self;
  v31.super_class = (Class)NWConcrete_nw_endpoint_flow;
  -[NWConcrete_nw_endpoint_flow dealloc](&v31, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->connection_wide_metadata, 0);
  objc_storeStrong((id *)&self->connected_metadata, 0);
  objc_storeStrong(&self->metadata_changed_event_handler, 0);
  objc_storeStrong(&self->keepalive_event_handler, 0);
  objc_storeStrong(&self->adaptive_write_event_handler, 0);
  objc_storeStrong(&self->adaptive_read_event_handler, 0);
  objc_storeStrong((id *)&self->saved_original_endpoint, 0);
  objc_storeStrong((id *)&self->flow_divert_endpoint, 0);
  objc_storeStrong((id *)&self->flow_divert_token, 0);
  objc_storeStrong((id *)&self->candidate_endpoint_handlers, 0);
  objc_storeStrong((id *)&self->connected_endpoint_handler, 0);
  objc_storeStrong((id *)&self->child_endpoint_handler, 0);
  objc_storeStrong((id *)&self->channel, 0);
  objc_storeStrong((id *)&self->connected_fd_wrapper, 0);
  objc_storeStrong((id *)&self->last_error, 0);
  objc_storeStrong(&self->write_close_handler, 0);
  objc_storeStrong(&self->read_close_handler, 0);
  objc_storeStrong((id *)&self->client_queue, 0);
  objc_storeStrong((id *)&self->flow_registration, 0);
  if ((*((_BYTE *)&self->multiplexed_message_protocol + 8) & 1) != 0)
    nw::release_if_needed<nw_protocol *>((uint64_t *)&self->multiplexed_message_protocol);
  self->multiplexed_message_protocol.m_obj = 0;
  objc_storeStrong((id *)&self->multiplexed_message_definition, 0);
  if ((*((_BYTE *)&self->transport_protocol + 8) & 1) != 0)
    nw::release_if_needed<nw_protocol *>((uint64_t *)&self->transport_protocol);
  self->transport_protocol.m_obj = 0;
  objc_storeStrong((id *)&self->new_flow_read_requests, 0);

  objc_storeStrong((id *)&self->clone_from_flow, 0);
  objc_storeStrong((id *)&self->internally_retained_object, 0);
  objc_storeStrong((id *)&self->flow_path, 0);
  objc_storeStrong((id *)&self->connected_path, 0);
}

- (void)startWithHandler:(id)a3
{
  id v4;
  unsigned int *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int *v9;
  char v10;
  os_unfair_lock_s *p_lock;
  OS_nw_path *flow_path;
  void *v13;
  int v14;
  id v15;
  const char *v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  char *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  const char *v24;
  unsigned int *v25;
  char v26;
  NSObject *v27;
  char *v28;
  char *v29;
  char v30;
  const char *v31;
  nw_endpoint_t v32;
  const char *logging_description;
  char *v34;
  char *v35;
  uint64_t v36;
  const char *v37;
  os_log_type_t v38;
  const char *v39;
  unsigned int *v40;
  NWConcrete_nw_path *v41;
  NWConcrete_nw_path *v42;
  char v43;
  id *v44;
  NWConcrete_nw_endpoint_handler *v45;
  double v46;
  double Helper_x8__ne_filter_protocol_identifier;
  uint64_t v48;
  uint64_t inited;
  const char *v50;
  BOOL v51;
  void **v52;
  void **v53;
  unsigned int v54;
  const char *v55;
  char v56;
  char v57;
  OS_nw_endpoint *flow_divert_endpoint;
  uint64_t v59;
  OS_xpc_object *flow_divert_token;
  OS_xpc_object *v61;
  NSObject *v62;
  const char *v63;
  const char *v64;
  nw_endpoint_t v65;
  const char *v66;
  const char *v67;
  const char *v68;
  OS_nw_path *v69;
  void **v70;
  OS_nw_path *v71;
  unsigned int *v72;
  NSObject *v73;
  nw_endpoint_t address;
  OS_nw_endpoint *v75;
  OS_nw_endpoint *v76;
  nw_endpoint_t v77;
  int minimize_logging;
  char logging_disabled;
  NSObject *v80;
  const char *v81;
  const char *v82;
  nw_endpoint_t v83;
  const char *v84;
  const char *v85;
  const char *v86;
  OS_nw_path *v87;
  int v88;
  char v89;
  NSObject *v90;
  const char *v91;
  const char *v92;
  nw_endpoint_t v93;
  const char *v94;
  const char *v95;
  const char *v96;
  OS_nw_path *v97;
  NWConcrete_nw_endpoint_handler *v98;
  NWConcrete_nw_endpoint_flow *clone_from_flow;
  NWConcrete_nw_endpoint_handler *v100;
  NWConcrete_nw_endpoint_handler *v101;
  uint64_t v102;
  nw_protocol *output_handler;
  id *v104;
  NSObject *v105;
  nw_protocol_identifier *identifier;
  nw_protocol_callbacks *callbacks;
  uint64_t (*get_remote_endpoint)(nw_protocol *);
  void *v109;
  void *v110;
  _BOOL8 v111;
  uint64_t v112;
  nw_protocol_identifier *v113;
  NSObject *v114;
  const char *v115;
  uint32_t v116;
  NWConcrete_nw_endpoint_handler *v117;
  BOOL v118;
  NWConcrete_nw_endpoint_handler *v119;
  NWConcrete_nw_endpoint_handler *v120;
  _BOOL4 v121;
  const char *v122;
  nw_endpoint_t v123;
  NWConcrete_nw_endpoint_handler *v124;
  NWConcrete_nw_endpoint_handler *v125;
  uint64_t v126;
  const char *v127;
  NWConcrete_nw_endpoint_handler *v128;
  const char *v129;
  uint64_t v130;
  nw_protocol_identifier *v131;
  const char *v132;
  const char *v133;
  NWConcrete_nw_endpoint_handler *v134;
  _BOOL4 v135;
  NWConcrete_nw_endpoint_handler *v136;
  NWConcrete_nw_endpoint_handler *v137;
  _BOOL4 v138;
  const char *v139;
  nw_endpoint_t v140;
  NWConcrete_nw_endpoint_handler *v141;
  NWConcrete_nw_endpoint_handler *v142;
  uint64_t v143;
  const char *v144;
  NWConcrete_nw_endpoint_handler *v145;
  const char *v146;
  NWConcrete_nw_endpoint_handler *v147;
  OS_nw_path *v148;
  NWConcrete_nw_endpoint_handler *v149;
  OS_nw_path *v150;
  _BOOL4 v151;
  void *v152;
  const char *v153;
  NWConcrete_nw_endpoint_handler *v154;
  NSObject *v155;
  const char *v156;
  const char *v157;
  nw_endpoint_t v158;
  const char *v159;
  const char *v160;
  const char *v161;
  OS_nw_path *v162;
  char *v163;
  NSObject *v164;
  os_log_type_t v165;
  const char *v166;
  char *v167;
  os_log_type_t v168;
  _BOOL4 v169;
  const char *v170;
  os_log_type_t v171;
  const char *v172;
  const char *v173;
  NSObject *v174;
  const char *v175;
  const char *v176;
  nw_endpoint_t v177;
  const char *v178;
  const char *v179;
  const char *v180;
  OS_nw_path *v181;
  NWConcrete_nw_endpoint_handler *child_endpoint_handler;
  id *v183;
  NWConcrete_nw_endpoint_mode_handler *v184;
  NWConcrete_nw_endpoint_mode_handler *v185;
  void *v186;
  os_log_type_t v187;
  NWConcrete_nw_endpoint_flow *v188;
  char *backtrace_string;
  os_log_type_t v190;
  _BOOL4 v191;
  os_log_type_t v192;
  const char *v193;
  const char *v194;
  nw_endpoint_t v195;
  const char *v196;
  const char *v197;
  const char *v198;
  OS_nw_path *v199;
  NSObject *v200;
  const char *id_string;
  const char *v202;
  const char *v203;
  const char *v204;
  const char *v205;
  OS_nw_path *v206;
  const char *v207;
  const char *v208;
  const char *v209;
  nw_endpoint_t v210;
  NWConcrete_nw_endpoint_flow *v211;
  os_unfair_lock_s *lock;
  NSObject *v213;
  os_log_t v214;
  os_log_t v215;
  NSObject *log;
  NSObject *logb;
  NSObject *loga;
  NWConcrete_nw_endpoint_handler *v219;
  NWConcrete_nw_endpoint_handler *v220;
  NWConcrete_nw_endpoint_handler *v221;
  unsigned int *v222;
  unsigned int *v223;
  NWConcrete_nw_endpoint_flow *v224;
  char *v225;
  void *v226;
  char v227;
  os_log_type_t type[8];
  os_log_type_t *v229;
  uint64_t v230;
  char v231;
  _BYTE buf[24];
  const char *v233;
  _BYTE v234[10];
  __int16 v235;
  const char *v236;
  __int16 v237;
  const char *v238;
  __int16 v239;
  OS_nw_path *v240;
  __int16 v241;
  nw_protocol_identifier *v242;
  uint64_t v243;

  v243 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v226 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
    v17 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v227 = 0;
    if (!__nwlog_fault(v17, type, &v227))
      goto LABEL_80;
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      v187 = type[0];
      if (os_log_type_enabled(v18, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        _os_log_impl(&dword_182FBE000, v18, v187, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v227)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      v190 = type[0];
      v191 = os_log_type_enabled(v18, type[0]);
      if (backtrace_string)
      {
        if (v191)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = backtrace_string;
          _os_log_impl(&dword_182FBE000, v18, v190, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_80;
      }
      if (v191)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        _os_log_impl(&dword_182FBE000, v18, v190, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      v192 = type[0];
      if (os_log_type_enabled(v18, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        _os_log_impl(&dword_182FBE000, v18, v192, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_79:

    goto LABEL_80;
  }
  v5 = (unsigned int *)v4;
  v6 = v5[29];

  if ((_DWORD)v6 != 2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    if (v6 > 5)
      v16 = "unknown-mode";
    else
      v16 = off_1E149FC18[v6];
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2082;
    v233 = "flow";
    v17 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v227 = 0;
    if (__nwlog_fault(v17, type, &v227))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        v19 = type[0];
        if (os_log_type_enabled(v18, type[0]))
        {
          if (v6 > 5)
            v20 = "unknown-mode";
          else
            v20 = off_1E149FC18[v6];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v20;
          *(_WORD *)&buf[22] = 2082;
          v233 = "flow";
          _os_log_impl(&dword_182FBE000, v18, v19, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v227)
      {
        v21 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        v22 = type[0];
        v23 = os_log_type_enabled(v18, type[0]);
        if (v21)
        {
          if (v23)
          {
            if (v6 > 5)
              v24 = "unknown-mode";
            else
              v24 = off_1E149FC18[v6];
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2082;
            v233 = "flow";
            *(_WORD *)v234 = 2082;
            *(_QWORD *)&v234[2] = v21;
            _os_log_impl(&dword_182FBE000, v18, v22, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v21);
          if (!v17)
            goto LABEL_235;
LABEL_81:
          free(v17);
          goto LABEL_235;
        }
        if (v23)
        {
          if (v6 > 5)
            v50 = "unknown-mode";
          else
            v50 = off_1E149FC18[v6];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v50;
          *(_WORD *)&buf[22] = 2082;
          v233 = "flow";
          _os_log_impl(&dword_182FBE000, v18, v22, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        v38 = type[0];
        if (os_log_type_enabled(v18, type[0]))
        {
          if (v6 > 5)
            v39 = "unknown-mode";
          else
            v39 = off_1E149FC18[v6];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v39;
          *(_WORD *)&buf[22] = 2082;
          v233 = "flow";
          _os_log_impl(&dword_182FBE000, v18, v38, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_79;
    }
LABEL_80:
    if (!v17)
      goto LABEL_235;
    goto LABEL_81;
  }
  v224 = self;
  objc_storeStrong((id *)&self->internally_retained_object, self);
  v7 = v5;
  v8 = v7[30];
  v223 = v7;

  if (v8 != 1)
    goto LABEL_235;
  v9 = v223;
  v10 = *((_BYTE *)v9 + 268);

  v222 = v9;
  if ((v10 & 1) != 0)
  {
    v25 = v9;
    v26 = *((_BYTE *)v9 + 268);

    if ((v26 & 0x20) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v27 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v28 = v25;

        v29 = v28;
        v30 = *((_BYTE *)v222 + 268);

        if ((v30 & 1) != 0)
          v31 = "dry-run ";
        else
          v31 = "";
        v32 = nw_endpoint_handler_copy_endpoint(v29);
        logging_description = nw_endpoint_get_logging_description(v32);
        v225 = v28 + 168;
        v34 = v29;
        v35 = v34;
        v36 = v223[30];
        if (v36 > 5)
          v37 = "unknown-state";
        else
          v37 = off_1E149FC48[v36];

        v52 = v35;
        v53 = v52;
        v54 = v5[29];
        v55 = "path";
        switch(v54)
        {
          case 0u:
            break;
          case 1u:
            v55 = "resolver";
            break;
          case 2u:
            v55 = nw_endpoint_flow_mode_string(v52[31]);
            break;
          case 3u:
            v55 = "proxy";
            break;
          case 4u:
            v55 = "fallback";
            break;
          case 5u:
            v55 = "transform";
            break;
          default:
            v55 = "unknown-mode";
            break;
        }

        v70 = v53;
        os_unfair_lock_lock((os_unfair_lock_t)v70 + 28);
        v71 = v70[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v70 + 28);

        *(_DWORD *)buf = 136447746;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v225;
        *(_WORD *)&buf[22] = 2082;
        v233 = v31;
        *(_WORD *)v234 = 2082;
        *(_QWORD *)&v234[2] = logging_description;
        v235 = 2082;
        v236 = v37;
        v237 = 2082;
        v238 = v55;
        v239 = 2114;
        v240 = v71;
        _os_log_impl(&dword_182FBE000, v27, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);

      }
    }
    v72 = v25;
    v223[30] = 3;

    v72[20] = 393219;
    nw_endpoint_handler_report(v72, 0, (_WORD *)v72 + 40, 0);
    goto LABEL_235;
  }
  *((_BYTE *)v224 + 32) |= 0x10u;
  *((_BYTE *)v224 + 35) &= ~4u;
  p_lock = &v224->lock;
  os_unfair_lock_lock(&v224->lock);
  flow_path = v224->flow_path;
  v224->flow_path = 0;

  os_unfair_lock_unlock(&v224->lock);
  nw_endpoint_flow_initialize_protocol(v9, (uint64_t)&v224->shared_protocol, *((_BYTE *)v224 + 32) & 1);
  if ((*((_BYTE *)v224 + 32) & 2) == 0)
  {
    *(_QWORD *)type = 0;
    v229 = type;
    v230 = 0x2020000000;
    v231 = 0;
    v13 = (void *)*((_QWORD *)v9 + 4);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __nw_endpoint_handler_has_persistent_application_protocols_block_invoke;
    v233 = (const char *)&unk_1E149FB50;
    *(_QWORD *)v234 = type;
    nw_parameters_internal_iterate_protocol_stack(v13, 5, 0, buf);
    v14 = *((unsigned __int8 *)v229 + 24);
    _Block_object_dispose(type, 8);
    *((_BYTE *)v224 + 32) = *((_BYTE *)v224 + 32) & 0xFB | (4 * (v14 == 0));
    goto LABEL_114;
  }
  *((_BYTE *)v224 + 32) &= ~4u;
  v40 = v9;
  os_unfair_lock_lock((os_unfair_lock_t)v40 + 28);
  v41 = (NWConcrete_nw_path *)*((id *)v40 + 8);
  os_unfair_lock_unlock((os_unfair_lock_t)v40 + 28);

  if (v41)
  {
    v42 = v41;
    v43 = *((_BYTE *)v42 + 473) & 0x20;

    *((_BYTE *)v224 + 34) = *((_BYTE *)v224 + 34) & 0xDF | v43;
    nw_path_assert_required_agents(v42);
  }
  v44 = v40;
  v45 = (NWConcrete_nw_endpoint_handler *)v44[4];

  if (nw_endpoint_flow_should_add_filter(v45, v41))
  {
    Helper_x8__ne_filter_protocol_identifier = gotLoadHelper_x8__ne_filter_protocol_identifier(v46);
    if (*(_QWORD *)(v48 + 1960))
      inited = ne_filter_protocol_identifier_delayInitStub(Helper_x8__ne_filter_protocol_identifier);
    else
      inited = 0;
    v51 = inited == 0;
  }
  else
  {
    v51 = 0;
  }
  v56 = 0;
  if (v224->pre_connected_fd < 0 && v41 && !v51)
  {
    if (nw_path_uses_nexus_internal(v41, 0))
      v56 = ~(32 * *((_BYTE *)v224 + 34)) & 0x40;
    else
      v56 = 0;
  }
  *((_BYTE *)v224 + 33) = *((_BYTE *)v224 + 33) & 0xBF | v56;
  os_unfair_lock_lock(p_lock);
  if (v41)
  {
    if (nw_path_allows_multipath(v41))
      v57 = 0x80;
    else
      v57 = 0;
  }
  else
  {
    v57 = 0;
  }
  *((_BYTE *)v224 + 33) = *((_BYTE *)v224 + 33) & 0x7F | v57;
  os_unfair_lock_unlock(p_lock);
  if ((*((_BYTE *)v224 + 33) & 0x40) != 0 || v224->clone_from_flow || !nw_path_is_flow_divert(v41))
    goto LABEL_103;
  flow_divert_endpoint = v224->flow_divert_endpoint;
  v224->flow_divert_endpoint = 0;

  v59 = nw_path_copy_flow_divert_token(v41);
  flow_divert_token = v224->flow_divert_token;
  v224->flow_divert_token = (OS_xpc_object *)v59;

  v61 = v224->flow_divert_token;
  v219 = v45;
  if (v61 && object_getClass(v61) == (Class)MEMORY[0x1E0C812E8])
  {
    v73 = nw_endpoint_handler_copy_endpoint(v44);
    v62 = v73;
    log = v73;
    if ((!v73 || nw_endpoint_get_type(v73) == nw_endpoint_type_host) && nw_path_get_flow_divert_unit(v41))
    {
      *(_OWORD *)buf = xmmword_183C6F0E8;
      address = nw_endpoint_create_address((const sockaddr *)buf);
      v75 = v224->flow_divert_endpoint;
      v224->flow_divert_endpoint = (OS_nw_endpoint *)address;

      v76 = v224->flow_divert_endpoint;
      v77 = nw_endpoint_handler_copy_endpoint(v44);
      nw_endpoint_set_parent_endpoint(v76, v77, 0);

      v62 = log;
    }
    os_unfair_lock_lock(p_lock);
    *((_BYTE *)v224 + 34) |= 4u;
    os_unfair_lock_unlock(p_lock);
    minimize_logging = nw_endpoint_handler_get_minimize_logging(v44);
    logging_disabled = nw_endpoint_handler_get_logging_disabled(v44);
    if (minimize_logging)
    {
      if ((logging_disabled & 1) != 0)
        goto LABEL_101;
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v200 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v200, OS_LOG_TYPE_DEBUG))
      {
        id_string = nw_endpoint_handler_get_id_string(v44);
        v202 = nw_endpoint_handler_dry_run_string(v44);
        v215 = nw_endpoint_handler_copy_endpoint(v44);
        v203 = nw_endpoint_get_logging_description(v215);
        v204 = nw_endpoint_handler_state_string(v44);
        v205 = nw_endpoint_handler_mode_string(v44);
        v206 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v44);
        *(_DWORD *)buf = 136447746;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = id_string;
        *(_WORD *)&buf[22] = 2082;
        v233 = v202;
        *(_WORD *)v234 = 2082;
        *(_QWORD *)&v234[2] = v203;
        v235 = 2082;
        v236 = v204;
        v237 = 2082;
        v238 = v205;
        v239 = 2114;
        v240 = v206;
        _os_log_impl(&dword_182FBE000, v200, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] using flow divert", buf, 0x48u);

      }
      v80 = v200;
    }
    else
    {
      if ((logging_disabled & 1) != 0)
      {
LABEL_102:

        v45 = v219;
        goto LABEL_103;
      }
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v80 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        v81 = nw_endpoint_handler_get_id_string(v44);
        v82 = nw_endpoint_handler_dry_run_string(v44);
        v213 = v80;
        v83 = nw_endpoint_handler_copy_endpoint(v44);
        v84 = nw_endpoint_get_logging_description(v83);
        v85 = nw_endpoint_handler_state_string(v44);
        v86 = nw_endpoint_handler_mode_string(v44);
        v87 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v44);
        *(_DWORD *)buf = 136447746;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v81;
        *(_WORD *)&buf[22] = 2082;
        v233 = v82;
        *(_WORD *)v234 = 2082;
        *(_QWORD *)&v234[2] = v84;
        v235 = 2082;
        v236 = v85;
        v237 = 2082;
        v238 = v86;
        v239 = 2114;
        v240 = v87;
        _os_log_impl(&dword_182FBE000, v213, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] using flow divert", buf, 0x48u);

        v80 = v213;
      }
    }

LABEL_101:
    v62 = log;
    goto LABEL_102;
  }
  if ((nw_endpoint_handler_get_logging_disabled(v44) & 1) == 0)
  {
    if (__nwlog_connection_log::onceToken != -1)
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
    v62 = (id)gconnectionLogObj;
    if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      goto LABEL_102;
    v63 = nw_endpoint_handler_get_id_string(v44);
    v64 = nw_endpoint_handler_dry_run_string(v44);
    log = v62;
    v65 = nw_endpoint_handler_copy_endpoint(v44);
    v66 = nw_endpoint_get_logging_description(v65);
    v67 = nw_endpoint_handler_state_string(v44);
    v68 = nw_endpoint_handler_mode_string(v44);
    v69 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v44);
    *(_DWORD *)buf = 136447746;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v63;
    *(_WORD *)&buf[22] = 2082;
    v233 = v64;
    *(_WORD *)v234 = 2082;
    *(_QWORD *)&v234[2] = v66;
    v235 = 2082;
    v236 = v67;
    v237 = 2082;
    v238 = v68;
    v239 = 2114;
    v240 = v69;
    _os_log_impl(&dword_182FBE000, log, OS_LOG_TYPE_ERROR, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] flow divert advertised, but failed to copy token", buf, 0x48u);

    goto LABEL_101;
  }
LABEL_103:
  if (!v41 || !nw_path_is_multilayer_packet_logging_enabled(v41))
    goto LABEL_113;
  v88 = nw_endpoint_handler_get_minimize_logging(v44);
  v89 = nw_endpoint_handler_get_logging_disabled(v44);
  v220 = v45;
  if (v88)
  {
    if ((v89 & 1) != 0)
      goto LABEL_112;
    if (__nwlog_connection_log::onceToken != -1)
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
    v90 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
    {
      v193 = nw_endpoint_handler_get_id_string(v44);
      v194 = nw_endpoint_handler_dry_run_string(v44);
      v195 = nw_endpoint_handler_copy_endpoint(v44);
      v196 = nw_endpoint_get_logging_description(v195);
      v197 = nw_endpoint_handler_state_string(v44);
      v198 = nw_endpoint_handler_mode_string(v44);
      v199 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v44);
      *(_DWORD *)buf = 136447746;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v193;
      *(_WORD *)&buf[22] = 2082;
      v233 = v194;
      *(_WORD *)v234 = 2082;
      *(_QWORD *)&v234[2] = v196;
      v235 = 2082;
      v236 = v197;
      v237 = 2082;
      v238 = v198;
      v239 = 2114;
      v240 = v199;
      _os_log_impl(&dword_182FBE000, v90, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Multilayer packet logging enabled", buf, 0x48u);

    }
    goto LABEL_111;
  }
  if ((v89 & 1) == 0)
  {
    if (__nwlog_connection_log::onceToken != -1)
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
    v90 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      v91 = nw_endpoint_handler_get_id_string(v44);
      v92 = nw_endpoint_handler_dry_run_string(v44);
      logb = v90;
      v93 = nw_endpoint_handler_copy_endpoint(v44);
      v94 = nw_endpoint_get_logging_description(v93);
      v95 = nw_endpoint_handler_state_string(v44);
      v96 = nw_endpoint_handler_mode_string(v44);
      v97 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v44);
      *(_DWORD *)buf = 136447746;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v91;
      *(_WORD *)&buf[22] = 2082;
      v233 = v92;
      *(_WORD *)v234 = 2082;
      *(_QWORD *)&v234[2] = v94;
      v235 = 2082;
      v236 = v95;
      v237 = 2082;
      v238 = v96;
      v239 = 2114;
      v240 = v97;
      _os_log_impl(&dword_182FBE000, logb, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Multilayer packet logging enabled", buf, 0x48u);

      v90 = logb;
    }
LABEL_111:

    v45 = v220;
  }
LABEL_112:
  *((_BYTE *)v224 + 34) |= 8u;
LABEL_113:

  v9 = v222;
LABEL_114:
  v98 = v9;
  v223[30] = 2;

  if (!nw_endpoint_flow_validate_delegation(v98))
    goto LABEL_235;
  clone_from_flow = v224->clone_from_flow;
  if (!clone_from_flow || (*((_BYTE *)v224 + 32) & 0x40) != 0)
  {
    if ((*((_BYTE *)v224 + 32) & 0x42) == 2 && (*((_BYTE *)v224 + 33) & 0x40) != 0)
    {
      if (!nw_endpoint_flow_expected_to_join(v98, v224) || !nw_endpoint_flow_setup_protocols(v98, 0, 0, 1, 1))
        nw_endpoint_flow_setup_channel(v98);
    }
    else
    {
      v151 = nw_endpoint_flow_expected_to_join(v98, v224);
      nw_endpoint_flow_setup_protocols(v98, 0, 0, 1, v151);
    }
    goto LABEL_235;
  }
  v100 = v98;
  v211 = clone_from_flow;
  v101 = v100;
  v102 = v5[29];
  v221 = v101;

  if ((_DWORD)v102 != 2)
  {
    __nwlog_obj();
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    if (v102 > 5)
      v153 = "unknown-mode";
    else
      v153 = off_1E149FC18[v102];
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v153;
    *(_WORD *)&buf[22] = 2082;
    v233 = "flow";
    v163 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v227 = 0;
    if (__nwlog_fault(v163, type, &v227))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v164 = objc_claimAutoreleasedReturnValue();
        v165 = type[0];
        if (os_log_type_enabled(v164, type[0]))
        {
          if (v102 > 5)
            v166 = "unknown-mode";
          else
            v166 = off_1E149FC18[v102];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v166;
          *(_WORD *)&buf[22] = 2082;
          v233 = "flow";
          _os_log_impl(&dword_182FBE000, v164, v165, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v227)
      {
        v167 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v164 = objc_claimAutoreleasedReturnValue();
        v168 = type[0];
        v169 = os_log_type_enabled(v164, type[0]);
        if (v167)
        {
          if (v169)
          {
            if (v102 > 5)
              v170 = "unknown-mode";
            else
              v170 = off_1E149FC18[v102];
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)&buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v170;
            *(_WORD *)&buf[22] = 2082;
            v233 = "flow";
            *(_WORD *)v234 = 2082;
            *(_QWORD *)&v234[2] = v167;
            _os_log_impl(&dword_182FBE000, v164, v168, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v167);
          goto LABEL_232;
        }
        if (v169)
        {
          if (v102 > 5)
            v173 = "unknown-mode";
          else
            v173 = off_1E149FC18[v102];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v173;
          *(_WORD *)&buf[22] = 2082;
          v233 = "flow";
          _os_log_impl(&dword_182FBE000, v164, v168, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        __nwlog_obj();
        v164 = objc_claimAutoreleasedReturnValue();
        v171 = type[0];
        if (os_log_type_enabled(v164, type[0]))
        {
          if (v102 > 5)
            v172 = "unknown-mode";
          else
            v172 = off_1E149FC18[v102];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v172;
          *(_WORD *)&buf[22] = 2082;
          v233 = "flow";
          _os_log_impl(&dword_182FBE000, v164, v171, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }

    }
LABEL_232:
    if (v163)
      free(v163);
    goto LABEL_234;
  }
  v210 = nw_endpoint_handler_copy_endpoint(v221);
  v214 = (os_log_t)nw_endpoint_handler_copy_parameters(v221);
  output_handler = v211->shared_protocol.protocol.output_handler;
  if (!output_handler)
  {
LABEL_174:
    v154 = v221;
    if ((nw_endpoint_handler_get_logging_disabled(v221) & 1) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v155 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
      {
        v156 = nw_endpoint_handler_get_id_string(v221);
        v157 = nw_endpoint_handler_dry_run_string(v221);
        v158 = nw_endpoint_handler_copy_endpoint(v221);
        v159 = nw_endpoint_get_logging_description(v158);
        v160 = nw_endpoint_handler_state_string(v221);
        v161 = nw_endpoint_handler_mode_string(v221);
        v162 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v221);
        *(_DWORD *)buf = 136447746;
        *(_QWORD *)&buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v156;
        *(_WORD *)&buf[22] = 2082;
        v233 = v157;
        *(_WORD *)v234 = 2082;
        *(_QWORD *)&v234[2] = v159;
        v235 = 2082;
        v236 = v160;
        v237 = 2082;
        v238 = v161;
        v239 = 2114;
        v240 = v162;
        _os_log_impl(&dword_182FBE000, v155, OS_LOG_TYPE_ERROR, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] could not find protocol to join in existing protocol stack", buf, 0x48u);

      }
      v154 = v221;
    }
    nw_endpoint_flow_failed_with_error(v154, 1, 0);
    goto LABEL_181;
  }
  lock = &v221->lock;
  v104 = (id *)&unk_1ECD84000;
  while (1)
  {
    identifier = output_handler->identifier;
    if (identifier->mapping != 2)
      goto LABEL_122;
    if (!nw_parameters_has_protocol_in_stack(v214, output_handler->identifier->name))
    {
      v117 = v221;
      v118 = (v222[67] & 0x20) == 0;

      if (!v118)
        goto LABEL_122;
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v105 = v104[416];
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
        goto LABEL_121;
      loga = v105;
      v119 = v117;

      v120 = v119;
      v121 = (v222[67] & 1) == 0;

      if (v121)
        v122 = "";
      else
        v122 = "dry-run ";
      v123 = nw_endpoint_handler_copy_endpoint(v120);
      v208 = nw_endpoint_get_logging_description(v123);
      v124 = v120;
      v125 = v124;
      v126 = v223[30];
      v127 = "unknown-state";
      if (v126 <= 5)
        v127 = off_1E149FC48[v126];
      v207 = v127;

      v128 = v125;
      v129 = "path";
      switch(v5[29])
      {
        case 0u:
          break;
        case 1u:
          v129 = "resolver";
          break;
        case 2u:
          v129 = nw_endpoint_flow_mode_string(v221->mode_handler);
          break;
        case 3u:
          v129 = "proxy";
          break;
        case 4u:
          v129 = "fallback";
          break;
        case 5u:
          v129 = "transform";
          break;
        default:
          v129 = "unknown-mode";
          break;
      }

      v147 = v128;
      os_unfair_lock_lock(lock);
      v148 = v221->current_path;
      os_unfair_lock_unlock(lock);

      v104 = (id *)&unk_1ECD84000;
      *(_DWORD *)buf = 136448002;
      *(_QWORD *)&buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v221->id_str;
      *(_WORD *)&buf[22] = 2082;
      v233 = v122;
      *(_WORD *)v234 = 2082;
      *(_QWORD *)&v234[2] = v208;
      v235 = 2082;
      v236 = v207;
      v237 = 2082;
      v238 = v129;
      v239 = 2114;
      v240 = v148;
      v241 = 2082;
      v242 = identifier;
      _os_log_impl(&dword_182FBE000, loga, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Cannot join protocol %{public}s (not in request stack)", buf, 0x52u);

      goto LABEL_120;
    }
    callbacks = output_handler->callbacks;
    get_remote_endpoint = (uint64_t (*)(nw_protocol *))callbacks->get_remote_endpoint;
    if (!get_remote_endpoint || !callbacks->get_parameters)
      goto LABEL_146;
    v109 = (void *)get_remote_endpoint(output_handler);
    v110 = (void *)((uint64_t (*)(nw_protocol *))output_handler->callbacks->get_parameters)(output_handler);
    if ((nw_endpoint_is_equal(v109, v210, 3) & 1) != 0)
      break;
    v111 = nw_endpoint_copy_proxy_original_endpoint(v210);
    if ((nw_endpoint_is_equal(v109, (void *)v111, 3) & 1) != 0)
      break;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v130 = gLogObj;
    if (os_log_type_enabled((os_log_t)gLogObj, OS_LOG_TYPE_DEBUG))
    {
      v131 = output_handler->identifier;
      v132 = nw_endpoint_get_logging_description(v210);
      v133 = nw_endpoint_get_logging_description(v109);
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "nw_protocol_can_join_existing";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v131;
      *(_WORD *)&buf[22] = 2082;
      v233 = v132;
      v104 = (id *)&unk_1ECD84000;
      *(_WORD *)v234 = 2082;
      *(_QWORD *)&v234[2] = v133;
      v114 = v130;
      v115 = "%{public}s Cannot join existing protocol %{public}s, endpoints do not match (%{public}s != %{public}s)";
      v116 = 42;
      goto LABEL_145;
    }
LABEL_146:
    v134 = v221;
    v135 = (v222[67] & 0x20) == 0;

    if (!v135)
      goto LABEL_122;
    if (__nwlog_connection_log::onceToken != -1)
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
    v105 = v104[416];
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
      goto LABEL_121;
    loga = v105;
    v136 = v134;

    v137 = v136;
    v138 = (v222[67] & 1) == 0;

    if (v138)
      v139 = "";
    else
      v139 = "dry-run ";
    v140 = nw_endpoint_handler_copy_endpoint(v137);
    v209 = nw_endpoint_get_logging_description(v140);
    v141 = v137;
    v142 = v141;
    v143 = v223[30];
    v144 = "unknown-state";
    if (v143 <= 5)
      v144 = off_1E149FC48[v143];

    v145 = v142;
    v146 = "path";
    switch(v5[29])
    {
      case 0u:
        break;
      case 1u:
        v146 = "resolver";
        break;
      case 2u:
        v146 = nw_endpoint_flow_mode_string(v221->mode_handler);
        break;
      case 3u:
        v146 = "proxy";
        break;
      case 4u:
        v146 = "fallback";
        break;
      case 5u:
        v146 = "transform";
        break;
      default:
        v146 = "unknown-mode";
        break;
    }

    v149 = v145;
    os_unfair_lock_lock(lock);
    v150 = v221->current_path;
    os_unfair_lock_unlock(lock);

    v104 = (id *)&unk_1ECD84000;
    *(_DWORD *)buf = 136448002;
    *(_QWORD *)&buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v221->id_str;
    *(_WORD *)&buf[22] = 2082;
    v233 = v139;
    *(_WORD *)v234 = 2082;
    *(_QWORD *)&v234[2] = v209;
    v235 = 2082;
    v236 = v144;
    v237 = 2082;
    v238 = v146;
    v239 = 2114;
    v240 = v150;
    v241 = 2082;
    v242 = identifier;
    _os_log_impl(&dword_182FBE000, loga, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Cannot join protocol %{public}s due to mismatch", buf, 0x52u);

LABEL_120:
    v105 = loga;
LABEL_121:

LABEL_122:
    output_handler = output_handler->output_handler;
    if (!output_handler)
      goto LABEL_174;
  }
  if (!nw_parameters_are_compatible(v214, -1, v110, (uint64_t)output_handler, 0))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v112 = gLogObj;
    if (os_log_type_enabled((os_log_t)gLogObj, OS_LOG_TYPE_DEBUG))
    {
      v113 = output_handler->identifier;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "nw_protocol_can_join_existing";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v113;
      v114 = v112;
      v115 = "%{public}s Cannot join existing protocol %{public}s, parameters do not match";
      v116 = 22;
LABEL_145:
      _os_log_impl(&dword_182FBE000, v114, OS_LOG_TYPE_DEBUG, v115, buf, v116);
      goto LABEL_146;
    }
    goto LABEL_146;
  }
  if ((nw_endpoint_handler_get_logging_disabled(v221) & 1) == 0)
  {
    if (__nwlog_connection_log::onceToken != -1)
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
    v174 = v104[416];
    if (os_log_type_enabled(v174, OS_LOG_TYPE_DEBUG))
    {
      v175 = nw_endpoint_handler_get_id_string(v221);
      v176 = nw_endpoint_handler_dry_run_string(v221);
      v177 = nw_endpoint_handler_copy_endpoint(v221);
      v178 = nw_endpoint_get_logging_description(v177);
      v179 = nw_endpoint_handler_state_string(v221);
      v180 = nw_endpoint_handler_mode_string(v221);
      v181 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v221);
      *(_DWORD *)buf = 136448002;
      *(_QWORD *)&buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v175;
      *(_WORD *)&buf[22] = 2082;
      v233 = v176;
      *(_WORD *)v234 = 2082;
      *(_QWORD *)&v234[2] = v178;
      v235 = 2082;
      v236 = v179;
      v237 = 2082;
      v238 = v180;
      v239 = 2114;
      v240 = v181;
      v241 = 2082;
      v242 = identifier;
      _os_log_impl(&dword_182FBE000, v174, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Joining protocol %{public}s", buf, 0x52u);

    }
  }
  child_endpoint_handler = v211->child_endpoint_handler;
  if (child_endpoint_handler)
  {
    nw_endpoint_handler_change_parent(child_endpoint_handler, v221);
    v183 = (id *)nw_endpoint_handler_copy_flow(v221);
    objc_storeStrong(v183 + 116, v211->child_endpoint_handler);

  }
  if (v211->bottom_protocol)
  {
    v184 = nw_endpoint_handler_copy_flow(v221);
    *((_QWORD *)v184 + 94) = v211->bottom_protocol;

  }
  if ((*((_BYTE *)v211 + 35) & 8) != 0)
  {
    v185 = nw_endpoint_handler_copy_flow(v221);
    *((_BYTE *)v185 + 35) |= 8u;

  }
  nw_endpoint_flow_setup_protocols(v221, 0, output_handler, 1, 1);
LABEL_181:

LABEL_234:
  v188 = v224->clone_from_flow;
  v224->clone_from_flow = 0;

LABEL_235:
}

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unsigned int *v8;
  uint64_t v9;
  nw_protocol *v10;
  int v11;
  OS_nw_path *connected_path;
  OS_nw_array *connected_metadata;
  OS_nw_array *connection_wide_metadata;
  NWConcrete_nw_endpoint_handler *connected_endpoint_handler;
  OS_nw_array *candidate_endpoint_handlers;
  OS_nw_read_request *new_flow_read_requests;
  _DWORD *v18;
  OS_nw_read_request *v19;
  NWConcrete_nw_endpoint_handler *child_endpoint_handler;
  NWConcrete_nw_endpoint_handler *v21;
  OS_nw_error *last_error;
  OS_xpc_object *flow_divert_token;
  OS_nw_endpoint *flow_divert_endpoint;
  OS_nw_endpoint *saved_original_endpoint;
  id v26;
  const char *v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  const char *v31;
  char *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  const char *v35;
  nw_flow_protocol *default_input_handler;
  const char *name;
  nw_protocol *output_handler;
  nw_protocol_callbacks *callbacks;
  uint64_t (*replace_input_handler)(nw_protocol *, nw_flow_protocol *, nw_flow_protocol *);
  void *handle;
  char v42;
  os_log_type_t v43;
  const char *v44;
  const char *v45;
  void *v46;
  char v47;
  nw_protocol_callbacks *v48;
  void *v49;
  char v50;
  char *v51;
  nw_protocol_callbacks *v52;
  void (*disconnect)(void);
  nw_protocol_callbacks *v54;
  void *v55;
  char v56;
  char *v57;
  void *v58;
  char v59;
  char *v60;
  int v61;
  nw_protocol *v62;
  nw_protocol *v63;
  NWConcrete_nw_endpoint_flow *retained_flow;
  NWConcrete_nw_endpoint_flow *v65;
  BOOL v67;
  nw_protocol_callbacks *v68;
  NSObject *v69;
  nw_endpoint_t v70;
  const char *logging_description;
  const char *v72;
  const char *v73;
  id v74;
  const char *id_string;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  id v81;
  void *v82;
  os_log_type_t v83;
  char *backtrace_string;
  os_log_type_t v85;
  _BOOL4 v86;
  os_log_type_t v87;
  nw_protocol *v88;
  void *v89;
  const char *v90;
  NSObject *v91;
  os_log_type_t v92;
  const char *v93;
  char *v94;
  _BOOL4 v95;
  const char *v96;
  os_log_type_t v97;
  const char *v98;
  const char *v99;
  os_log_type_t v100;
  void *v101;
  const char *v102;
  nw_endpoint_t v103;
  nw_protocol *v104;
  void *log;
  const char *logb;
  NSObject *logc;
  char *loga;
  char v109;
  os_log_type_t v110;
  nw_flow_protocol *p_shared_protocol;
  char v112;
  os_log_type_t type[8];
  char v114;
  _BYTE buf[12];
  __int16 v116;
  void *v117;
  __int16 v118;
  const char *v119;
  __int16 v120;
  void *v121;
  __int16 v122;
  const char *v123;
  __int16 v124;
  const char *v125;
  __int16 v126;
  id v127;
  uint64_t v128;

  v4 = a4;
  v128 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    __nwlog_obj();
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
    v28 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(p_shared_protocol) = 0;
    if (__nwlog_fault(v28, type, &p_shared_protocol))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        v83 = type[0];
        if (os_log_type_enabled(v29, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v29, v83, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_77;
      }
      if (!(_BYTE)p_shared_protocol)
      {
        __nwlog_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        v87 = type[0];
        if (os_log_type_enabled(v29, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v29, v87, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_77;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v29 = objc_claimAutoreleasedReturnValue();
      v85 = type[0];
      v86 = os_log_type_enabled(v29, type[0]);
      if (!backtrace_string)
      {
        if (v86)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v29, v85, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_77;
      }
      if (v86)
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
        v116 = 2082;
        v117 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v29, v85, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_78:
    if (!v28)
      goto LABEL_80;
LABEL_79:
    free(v28);
    goto LABEL_80;
  }
  v8 = (unsigned int *)v6;
  v9 = v8[29];

  if ((_DWORD)v9 == 2)
  {
    if ((*((_BYTE *)self + 32) & 1) == 0 && !self->multiplexed_message_definition)
    {
      default_input_handler = (nw_flow_protocol *)self->shared_protocol.protocol.default_input_handler;
      if (default_input_handler)
      {
        name = default_input_handler->protocol.identifier->name;
        if (!name
          || strcmp(default_input_handler->protocol.identifier->name, "endpoint_flow") && strcmp(name, "flow_replay"))
        {
          output_handler = self->shared_protocol.protocol.output_handler;
          if (output_handler)
          {
            callbacks = output_handler->callbacks;
            if (callbacks)
            {
              replace_input_handler = (uint64_t (*)(nw_protocol *, nw_flow_protocol *, nw_flow_protocol *))callbacks->replace_input_handler;
              if (replace_input_handler)
              {
                if ((nw_flow_protocol *)default_input_handler->protocol.output_handler == &self->shared_protocol)
                {
                  handle = output_handler->handle;
                  if (handle == &nw_protocol_ref_counted_handle)
                  {
                    v54 = output_handler[1].callbacks;
                    if (v54)
                      output_handler[1].callbacks = (nw_protocol_callbacks *)((char *)&v54->add_input_handler + 1);
                    v42 = -1;
                  }
                  else
                  {
                    v42 = 0;
                  }
                  *(_QWORD *)buf = output_handler;
                  buf[8] = v42;
                  v55 = self->shared_protocol.protocol.handle;
                  if (v55 == &nw_protocol_ref_counted_handle)
                  {
                    v57 = (char *)self->shared_protocol.listen_protocol.handle;
                    if (v57)
                      self->shared_protocol.listen_protocol.handle = v57 + 1;
                    v56 = -1;
                  }
                  else
                  {
                    v56 = 0;
                  }
                  *(_QWORD *)type = &self->shared_protocol;
                  v114 = v56;
                  v58 = default_input_handler->protocol.handle;
                  v101 = v55;
                  log = handle;
                  if (v58 == &nw_protocol_ref_counted_handle)
                  {
                    v60 = (char *)default_input_handler->listen_protocol.handle;
                    if (v60)
                      default_input_handler->listen_protocol.handle = v60 + 1;
                    v59 = -1;
                  }
                  else
                  {
                    v59 = 0;
                  }
                  p_shared_protocol = default_input_handler;
                  v112 = v59;
                  v61 = replace_input_handler(output_handler, &self->shared_protocol, default_input_handler);
                  if (v58 == &nw_protocol_ref_counted_handle)
                    nw::release_if_needed<nw_protocol *>((uint64_t *)&p_shared_protocol);
                  if (v101 == &nw_protocol_ref_counted_handle)
                    nw::release_if_needed<nw_protocol *>((uint64_t *)type);
                  if (log == &nw_protocol_ref_counted_handle)
                    nw::release_if_needed<nw_protocol *>((uint64_t *)buf);
                  if (v61)
                  {
                    v62 = self->shared_protocol.protocol.output_handler;
                    if (v62)
                    {
                      nw_protocol_release(v62);
                      self->shared_protocol.protocol.output_handler = 0;
                    }
                    v63 = self->shared_protocol.protocol.default_input_handler;
                    if (v63)
                    {
                      nw_protocol_release(v63);
                      self->shared_protocol.protocol.default_input_handler = 0;
                    }
                    retained_flow = self->shared_protocol.retained_flow;
                    self->shared_protocol.retained_flow = 0;

                    v65 = (NWConcrete_nw_endpoint_flow *)default_input_handler->protocol.output_handler;
                    v67 = v65 != (NWConcrete_nw_endpoint_flow *)&self->shared_protocol && v65 != 0;
                    if (v65 != (NWConcrete_nw_endpoint_flow *)output_handler && !v67)
                    {
                      nw_protocol_release(v65);
                      default_input_handler->protocol.output_handler = output_handler;
                      if (output_handler->handle == &nw_protocol_ref_counted_handle)
                      {
                        v68 = output_handler[1].callbacks;
                        if (v68)
                          output_handler[1].callbacks = (nw_protocol_callbacks *)((char *)&v68->add_input_handler + 1);
                      }
                    }
                    if (gLogDatapath && (nw_endpoint_handler_get_logging_disabled(v8) & 1) == 0)
                    {
                      if (__nwlog_connection_log::onceToken != -1)
                        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
                      v69 = (id)gconnectionLogObj;
                      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                      {
                        logb = nw_endpoint_handler_get_id_string(v8);
                        v102 = nw_endpoint_handler_dry_run_string(v8);
                        v70 = nw_endpoint_handler_copy_endpoint(v8);
                        logging_description = nw_endpoint_get_logging_description(v70);
                        v72 = nw_endpoint_handler_state_string(v8);
                        v73 = nw_endpoint_handler_mode_string(v8);
                        v74 = nw_endpoint_handler_copy_current_path(v8);
                        *(_DWORD *)buf = 136447746;
                        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
                        v116 = 2082;
                        v117 = (void *)logb;
                        v118 = 2082;
                        v119 = v102;
                        v120 = 2082;
                        v121 = (void *)logging_description;
                        v122 = 2082;
                        v123 = v72;
                        v124 = 2082;
                        v125 = v73;
                        v126 = 2114;
                        v127 = v74;
                        _os_log_impl(&dword_182FBE000, v69, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Removed passthrough protocol from the stack on cancellation", buf, 0x48u);

                      }
LABEL_127:

                    }
                  }
                  else if ((nw_endpoint_handler_get_logging_disabled(v8) & 1) == 0)
                  {
                    if (__nwlog_connection_log::onceToken != -1)
                      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
                    v69 = (id)gconnectionLogObj;
                    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                    {
                      id_string = nw_endpoint_handler_get_id_string(v8);
                      v76 = nw_endpoint_handler_dry_run_string(v8);
                      logc = v69;
                      v77 = id_string;
                      v103 = nw_endpoint_handler_copy_endpoint(v8);
                      v78 = nw_endpoint_get_logging_description(v103);
                      v79 = nw_endpoint_handler_state_string(v8);
                      v80 = nw_endpoint_handler_mode_string(v8);
                      v81 = nw_endpoint_handler_copy_current_path(v8);
                      *(_DWORD *)buf = 136447746;
                      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
                      v116 = 2082;
                      v117 = (void *)v77;
                      v118 = 2082;
                      v119 = v76;
                      v120 = 2082;
                      v121 = (void *)v78;
                      v122 = 2082;
                      v123 = v79;
                      v124 = 2082;
                      v125 = v80;
                      v126 = 2114;
                      v127 = v81;
                      v69 = logc;
                      _os_log_impl(&dword_182FBE000, logc, OS_LOG_TYPE_ERROR, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Failed to remove passthrough protocol from the stack on cancellation", buf, 0x48u);

                    }
                    goto LABEL_127;
                  }
                }
              }
            }
          }
        }
      }
    }
    v10 = self->shared_protocol.protocol.output_handler;
    v11 = 1;
    if (!v10 || v4 || (*((_WORD *)&self->shared_protocol + 166) & 0x800) != 0 || (*((_BYTE *)self + 35) & 6) != 0)
    {
      if ((*((_BYTE *)self + 34) & 0x10) == 0)
      {
LABEL_11:
        os_unfair_lock_lock(&self->lock);
        connected_path = self->connected_path;
        self->connected_path = 0;

        connected_metadata = self->connected_metadata;
        self->connected_metadata = 0;

        connection_wide_metadata = self->connection_wide_metadata;
        self->connection_wide_metadata = 0;

        connected_endpoint_handler = self->connected_endpoint_handler;
        self->connected_endpoint_handler = 0;

        os_unfair_lock_unlock(&self->lock);
        nw_endpoint_flow_cleanup_protocol(v8, (uint64_t)&self->shared_protocol, 0);
        os_unfair_lock_lock(&self->lock);
        candidate_endpoint_handlers = self->candidate_endpoint_handlers;
        self->candidate_endpoint_handlers = 0;

        os_unfair_lock_unlock(&self->lock);
        new_flow_read_requests = self->new_flow_read_requests;
        v18 = -[NWConcrete_nw_error initWithDomain:code:]([NWConcrete_nw_error alloc], 1, 89);
        nw_read_request_report_error_with_override(new_flow_read_requests, 0, v18);

        v19 = self->new_flow_read_requests;
        self->new_flow_read_requests = 0;

        if (v11)
          nw_endpoint_flow_failed_with_error(v8, 0, 0);
        if ((*((_BYTE *)self + 35) & 0x20) == 0)
        {
          child_endpoint_handler = self->child_endpoint_handler;
          if (child_endpoint_handler)
            nw_endpoint_handler_cancel(child_endpoint_handler, v4, 0);
        }
        v21 = self->child_endpoint_handler;
        self->child_endpoint_handler = 0;

        *((_BYTE *)self + 35) &= ~4u;
        last_error = self->last_error;
        self->last_error = 0;

        flow_divert_token = self->flow_divert_token;
        self->flow_divert_token = 0;

        flow_divert_endpoint = self->flow_divert_endpoint;
        self->flow_divert_endpoint = 0;

        saved_original_endpoint = self->saved_original_endpoint;
        self->saved_original_endpoint = 0;

        goto LABEL_80;
      }
LABEL_10:
      nw_endpoint_flow_reset_expected_progress_target(v8, 0, self->connection_uuid);
      goto LABEL_11;
    }
    v46 = v10->handle;
    if (v46 == &nw_protocol_ref_counted_handle)
    {
      v48 = v10[1].callbacks;
      if (v48)
        v10[1].callbacks = (nw_protocol_callbacks *)((char *)&v48->add_input_handler + 1);
      v47 = -1;
    }
    else
    {
      v47 = 0;
    }
    *(_QWORD *)type = v10;
    v114 = v47;
    v49 = self->shared_protocol.protocol.handle;
    if (v49 == &nw_protocol_ref_counted_handle)
    {
      v51 = (char *)self->shared_protocol.listen_protocol.handle;
      if (v51)
        self->shared_protocol.listen_protocol.handle = v51 + 1;
      v50 = -1;
    }
    else
    {
      v50 = 0;
    }
    p_shared_protocol = &self->shared_protocol;
    v112 = v50;
    v52 = v10->callbacks;
    if (v52)
    {
      disconnect = (void (*)(void))v52->disconnect;
      if (disconnect)
      {
        disconnect();
        goto LABEL_69;
      }
    }
    v88 = v10;
    __nwlog_obj();
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v88->identifier->name;
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "__nw_protocol_disconnect";
    if (!v90)
      v90 = "invalid";
    v116 = 2082;
    v117 = (void *)v90;
    v118 = 2048;
    v104 = v88;
    v119 = (const char *)v88;
    loga = (char *)_os_log_send_and_compose_impl();

    v110 = OS_LOG_TYPE_ERROR;
    v109 = 0;
    if (__nwlog_fault(loga, &v110, &v109))
    {
      if (v110 == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v91 = objc_claimAutoreleasedReturnValue();
        v92 = v110;
        if (os_log_type_enabled(v91, v110))
        {
          v93 = v104->identifier->name;
          if (!v93)
            v93 = "invalid";
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "__nw_protocol_disconnect";
          v116 = 2082;
          v117 = (void *)v93;
          v118 = 2048;
          v119 = (const char *)v104;
          _os_log_impl(&dword_182FBE000, v91, v92, "%{public}s protocol %{public}s (%p) has invalid disconnect callback", buf, 0x20u);
        }
      }
      else if (v109)
      {
        v94 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v91 = objc_claimAutoreleasedReturnValue();
        v100 = v110;
        v95 = os_log_type_enabled(v91, v110);
        if (v94)
        {
          if (v95)
          {
            v96 = v104->identifier->name;
            if (!v96)
              v96 = "invalid";
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)&buf[4] = "__nw_protocol_disconnect";
            v116 = 2082;
            v117 = (void *)v96;
            v118 = 2048;
            v119 = (const char *)v104;
            v120 = 2082;
            v121 = v94;
            _os_log_impl(&dword_182FBE000, v91, v100, "%{public}s protocol %{public}s (%p) has invalid disconnect callback, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v94);
          goto LABEL_170;
        }
        if (v95)
        {
          v99 = v104->identifier->name;
          if (!v99)
            v99 = "invalid";
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "__nw_protocol_disconnect";
          v116 = 2082;
          v117 = (void *)v99;
          v118 = 2048;
          v119 = (const char *)v104;
          _os_log_impl(&dword_182FBE000, v91, v100, "%{public}s protocol %{public}s (%p) has invalid disconnect callback, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        __nwlog_obj();
        v91 = objc_claimAutoreleasedReturnValue();
        v97 = v110;
        if (os_log_type_enabled(v91, v110))
        {
          v98 = v104->identifier->name;
          if (!v98)
            v98 = "invalid";
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "__nw_protocol_disconnect";
          v116 = 2082;
          v117 = (void *)v98;
          v118 = 2048;
          v119 = (const char *)v104;
          _os_log_impl(&dword_182FBE000, v91, v97, "%{public}s protocol %{public}s (%p) has invalid disconnect callback, backtrace limit exceeded", buf, 0x20u);
        }
      }

    }
LABEL_170:
    if (loga)
      free(loga);
LABEL_69:
    if (v49 == &nw_protocol_ref_counted_handle)
      nw::release_if_needed<nw_protocol *>((uint64_t *)&p_shared_protocol);
    if (v46 == &nw_protocol_ref_counted_handle)
      nw::release_if_needed<nw_protocol *>((uint64_t *)type);
    v11 = 0;
    if ((*((_BYTE *)self + 34) & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v26 = (id)gLogObj;
  if (v9 > 5)
    v27 = "unknown-mode";
  else
    v27 = off_1E149FC18[v9];
  *(_DWORD *)buf = 136446722;
  *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
  v116 = 2082;
  v117 = (void *)v27;
  v118 = 2082;
  v119 = "flow";
  v28 = (char *)_os_log_send_and_compose_impl();

  type[0] = OS_LOG_TYPE_ERROR;
  LOBYTE(p_shared_protocol) = 0;
  if (!__nwlog_fault(v28, type, &p_shared_protocol))
    goto LABEL_78;
  if (type[0] == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v29 = (id)gLogObj;
    v30 = type[0];
    if (os_log_type_enabled(v29, type[0]))
    {
      if (v9 > 5)
        v31 = "unknown-mode";
      else
        v31 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
      v116 = 2082;
      v117 = (void *)v31;
      v118 = 2082;
      v119 = "flow";
      _os_log_impl(&dword_182FBE000, v29, v30, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_77:

    goto LABEL_78;
  }
  if (!(_BYTE)p_shared_protocol)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v29 = (id)gLogObj;
    v43 = type[0];
    if (os_log_type_enabled(v29, type[0]))
    {
      if (v9 > 5)
        v44 = "unknown-mode";
      else
        v44 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
      v116 = 2082;
      v117 = (void *)v44;
      v118 = 2082;
      v119 = "flow";
      _os_log_impl(&dword_182FBE000, v29, v43, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_77;
  }
  v32 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v29 = (id)gLogObj;
  v33 = type[0];
  v34 = os_log_type_enabled(v29, type[0]);
  if (!v32)
  {
    if (v34)
    {
      if (v9 > 5)
        v45 = "unknown-mode";
      else
        v45 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
      v116 = 2082;
      v117 = (void *)v45;
      v118 = 2082;
      v119 = "flow";
      _os_log_impl(&dword_182FBE000, v29, v33, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_77;
  }
  if (v34)
  {
    if (v9 > 5)
      v35 = "unknown-mode";
    else
      v35 = off_1E149FC18[v9];
    *(_DWORD *)buf = 136446978;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
    v116 = 2082;
    v117 = (void *)v35;
    v118 = 2082;
    v119 = "flow";
    v120 = 2082;
    v121 = v32;
    _os_log_impl(&dword_182FBE000, v29, v33, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v32);
  if (v28)
    goto LABEL_79;
LABEL_80:

}

- (NWConcrete_nw_endpoint_flow)init
{
  NWConcrete_nw_endpoint_flow *v2;
  NWConcrete_nw_endpoint_flow *v3;
  NWConcrete_nw_endpoint_flow *v4;
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
  v16.super_class = (Class)NWConcrete_nw_endpoint_flow;
  v2 = -[NWConcrete_nw_endpoint_flow init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->pre_connected_fd = -1;
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_flow init]";
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
        v18 = "-[NWConcrete_nw_endpoint_flow init]";
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
          v18 = "-[NWConcrete_nw_endpoint_flow init]";
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
        v18 = "-[NWConcrete_nw_endpoint_flow init]";
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
        v18 = "-[NWConcrete_nw_endpoint_flow init]";
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

@end
