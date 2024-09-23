@implementation NWConcrete_nw_path

- (NSString)description
{
  os_unfair_lock_s *p_description_lock;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  NWConcrete_nw_path *v7;
  NWConcrete_nw_path *v8;
  char *direct;
  char *v10;
  int v11;
  const char *v12;
  OS_nw_interface *v13;
  OS_nw_interface *v14;
  int v15;
  _BOOL4 is_viable;
  const char *v17;
  NWConcrete_nw_path *v18;
  NWConcrete_nw_path *v19;
  unsigned int routing_result;
  unsigned int tunnel_interface_index;
  const char *v22;
  NWConcrete_nw_path *v23;
  _BOOL4 v24;
  const char *v25;
  NWConcrete_nw_path *v26;
  _BOOL4 v27;
  const char *v28;
  NWConcrete_nw_path *v29;
  os_unfair_lock_s *v30;
  uint64_t v31;
  _BOOL4 v32;
  const char *v33;
  _BOOL4 is_expensive;
  const char *v35;
  _BOOL4 is_constrained;
  const char *v37;
  int is_ultra_constrained;
  const char *v39;
  _BOOL4 v40;
  const char *v41;
  _BOOL4 v42;
  const char *v43;
  os_unfair_lock_s *v44;
  os_unfair_lock_s *v45;
  BOOL v46;
  const char *v47;
  os_unfair_lock_s *v48;
  int v49;
  char *v50;
  unint64_t v51;
  BOOL v52;
  unint64_t v53;
  uint64_t *v54;
  char *v55;
  char *v56;
  int v57;
  char *v58;
  unint64_t v59;
  unint64_t v60;
  os_unfair_lock_s *v61;
  os_unfair_lock_s *v62;
  int os_unfair_lock_opaque;
  int v64;
  unsigned int os_unfair_lock_opaque_high;
  uint64_t v66;
  unsigned int os_unfair_lock_opaque_low;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  os_unfair_lock_s *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  char *v76;
  __CFString *v77;
  uint64_t v78;
  int v79;
  char *v80;
  unint64_t v81;
  unint64_t v82;
  void *v83;
  const char *v84;
  int v85;
  char *v86;
  unint64_t v87;
  unint64_t v88;
  void *v89;
  const char *v90;
  int v91;
  char *v92;
  unint64_t v93;
  unint64_t v94;
  char v95;
  const char *v96;
  int v97;
  char *v98;
  unint64_t v99;
  unint64_t v100;
  const char *v101;
  int v102;
  char *v103;
  unint64_t v104;
  unint64_t v105;
  char *v106;
  const char *v107;
  int v108;
  char *v109;
  unint64_t v110;
  unint64_t v111;
  char *v112;
  const char *v113;
  int v114;
  char *v115;
  unint64_t v116;
  unint64_t v117;
  void *v118;
  int v119;
  char *v120;
  unint64_t v121;
  unint64_t v122;
  void *v123;
  int v124;
  char *v125;
  unint64_t v126;
  unint64_t v127;
  BOOL v128;
  const char *v129;
  char *v130;
  const char *v131;
  int v132;
  unint64_t v133;
  unint64_t v134;
  int v135;
  unint64_t v136;
  unint64_t v137;
  void *v138;
  char *v139;
  NSObject *v140;
  os_log_type_t v141;
  char *backtrace_string;
  os_log_type_t v143;
  _BOOL4 v144;
  os_log_type_t v145;
  __CFString *v146;
  const char *v148;
  const char *v149;
  const char *v150;
  const char *v151;
  const char *v152;
  const char *v153;
  const char *v154;
  const char *v155;
  const char *v156;
  const char *v157;
  const char *v158;
  _QWORD v159[6];
  _QWORD v160[6];
  uint64_t v161;
  uint64_t *v162;
  uint64_t v163;
  uint64_t (*v164)(uint64_t, uint64_t);
  void (*v165)(uint64_t);
  id v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  char v170;
  char *v171;
  char **v172;
  uint64_t v173;
  char v174;
  uint8_t buf[32];
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  char v182[22];
  char __str[40];
  char applier[8];
  uint64_t v185;
  uint64_t (*v186)(_QWORD *, int, xpc_object_t);
  void *v187;
  char *v188;
  char *v189;
  uint64_t *v190;
  char **v191;
  char out[16];
  _BYTE v193[24];
  char *v194;
  uint64_t *v195;
  char **v196;
  char v197[8];
  char *v198;
  uint64_t v199;
  uint64_t v200;
  char v201[8];
  char *v202;
  uint64_t v203;
  uint8_t *v204;
  uint64_t v205;

  v205 = *MEMORY[0x1E0C80C00];
  v161 = 0;
  v162 = &v161;
  v163 = 0x3032000000;
  v164 = __Block_byref_object_copy__67271;
  v165 = __Block_byref_object_dispose__67272;
  v166 = 0;
  p_description_lock = &self->description_lock;
  v4 = MEMORY[0x1E0C809B0];
  v160[0] = MEMORY[0x1E0C809B0];
  v160[1] = 3221225472;
  v160[2] = __33__NWConcrete_nw_path_description__block_invoke;
  v160[3] = &unk_1E14ACE40;
  v160[4] = self;
  v160[5] = &v161;
  os_unfair_lock_lock(&self->description_lock);
  __33__NWConcrete_nw_path_description__block_invoke((uint64_t)v160);
  os_unfair_lock_unlock(p_description_lock);
  v5 = (void *)v162[5];
  if (!v5)
  {
    v7 = self;
    v8 = v7;
    if (v7)
    {
      direct = (char *)v7->direct;
      if (direct)
      {
        v10 = direct;
        v11 = v10[84];

        if (v11)
        {
          v12 = nw_interface_radio_type_to_string(v11);
        }
        else
        {
          v13 = v8->direct;
          if (v13)
          {
            v14 = v13;
            v15 = *((_DWORD *)v14 + 24);

            if (v15 == 1)
              v12 = "802.11";
            else
              v12 = 0;
          }
          else
          {
            v12 = 0;
          }
        }
        snprintf(__str, 0x28uLL, ", interface: %s", direct + 104);
      }
      else
      {
        v12 = 0;
        __str[0] = 0;
      }
      is_viable = nw_path_is_viable(v8);
      v17 = ", viable";
      if (!is_viable)
        v17 = "";
      v158 = v17;
      v18 = v8;
      v19 = v18;
      routing_result = v18->policy_result.routing_result;
      if (routing_result == 6 || routing_result == 12)
      {
        tunnel_interface_index = v18->policy_result.routing_result_parameter.tunnel_interface_index;

        if (tunnel_interface_index)
        {
          v22 = ", scoped";
          goto LABEL_22;
        }
      }
      else
      {

      }
      v22 = "";
LABEL_22:
      v157 = v22;
      v23 = v19;
      v24 = (*((_BYTE *)v23 + 473) & 0x40) == 0;

      v25 = ", ipv4";
      if (v24)
        v25 = "";
      v156 = v25;
      v26 = v23;
      v27 = *((char *)v23 + 473) < 0;

      v28 = ", ipv6";
      if (!v27)
        v28 = "";
      v155 = v28;
      v29 = v26;
      *(_QWORD *)buf = v4;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___ZL18nw_path_update_dnsP18NWConcrete_nw_path_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E14ACFD0;
      v30 = v29;
      *(_QWORD *)&v176 = v30;
      os_unfair_lock_lock(v30 + 2);
      (*(void (**)(uint8_t *))&buf[16])(buf);
      os_unfair_lock_unlock(v30 + 2);

      v31 = *(_QWORD *)&v30[46]._os_unfair_lock_opaque;
      if (v31)
      {
        v32 = *(_QWORD *)(v31 + 24) - *(_QWORD *)(v31 + 16) < 8uLL;

        if (v32)
          v33 = "";
        else
          v33 = ", dns";
      }
      else
      {

        v33 = "";
      }
      is_expensive = nw_path_is_expensive((nw_path_t)v30);
      v35 = ", expensive";
      if (!is_expensive)
        v35 = "";
      v154 = v35;
      is_constrained = nw_path_is_constrained((nw_path_t)v30);
      v37 = ", constrained";
      if (!is_constrained)
        v37 = "";
      v153 = v37;
      is_ultra_constrained = nw_path_is_ultra_constrained(v30);
      v39 = ", ultra constrained";
      if (!is_ultra_constrained)
        v39 = "";
      v152 = v39;
      v40 = nw_path_uses_interface_type((nw_path_t)v30, nw_interface_type_wifi);
      v41 = ", uses wifi";
      if (!v40)
        v41 = "";
      v151 = v41;
      v42 = nw_path_uses_interface_type((nw_path_t)v30, nw_interface_type_cellular);
      v43 = ", uses cell";
      if (!v42)
        v43 = "";
      v149 = v43;
      v150 = v33;
      v44 = v30;
      v45 = v44;
      if (*(_QWORD *)&v44[60]._os_unfair_lock_opaque)
      {

      }
      else
      {
        v46 = *(_QWORD *)&v44[58]._os_unfair_lock_opaque == 0;

        if (v46)
        {
          v47 = "";
LABEL_45:
          v181 = 0u;
          memset(v182, 0, sizeof(v182));
          v179 = 0u;
          v180 = 0u;
          v177 = 0u;
          v178 = 0u;
          v176 = 0u;
          memset(buf, 0, sizeof(buf));
          v148 = v47;
          if (!nw_path_should_fallback(v45, 0))
            goto LABEL_61;
          v48 = v45;
          *(_QWORD *)v201 = 0;
          v202 = v201;
          v203 = 0x2020000000;
          v204 = buf;
          *(_QWORD *)v197 = 0;
          v198 = v197;
          v199 = 0x2020000000;
          v200 = 150;
          v171 = 0;
          v172 = &v171;
          v173 = 0x2020000000;
          v174 = 0;
          v167 = 0;
          v168 = &v167;
          v169 = 0x2020000000;
          v170 = 1;
          v49 = snprintf((char *)buf, 0x96uLL, "%sfallback: {", ", ");
          v50 = v198;
          v51 = *((_QWORD *)v198 + 3);
          v52 = v51 > v49;
          v53 = v51 - v49;
          if (v52)
          {
            if (v49 >= 1)
            {
              *((_QWORD *)v202 + 3) += v49;
              *((_QWORD *)v50 + 3) = v53;
            }
          }
          else
          {
            **((_BYTE **)v202 + 3) = 0;
            *((_BYTE *)v172 + 24) = 1;
          }
          *((_BYTE *)v168 + 24) = 0;
          if (!*((_BYTE *)v172 + 24))
          {
            v78 = *(_QWORD *)&v48[28]._os_unfair_lock_opaque;
            if (!v78)
              goto LABEL_200;
            v79 = snprintf(*((char **)v202 + 3), *((_QWORD *)v198 + 3), "%sinterface: %s", ", (const char *)(v78 + 104));
            v80 = v198;
            v81 = *((_QWORD *)v198 + 3);
            v52 = v81 > v79;
            v82 = v81 - v79;
            if (v52)
            {
              if (v79 >= 1)
              {
                *((_QWORD *)v202 + 3) += v79;
                *((_QWORD *)v80 + 3) = v82;
              }
            }
            else
            {
              **((_BYTE **)v202 + 3) = 0;
              *((_BYTE *)v172 + 24) = 1;
            }
            *((_BYTE *)v168 + 24) = 1;
            if (!*((_BYTE *)v172 + 24))
            {
LABEL_200:
              if (!uuid_is_null((const unsigned __int8 *)&v48[38]))
              {
                *(_OWORD *)out = 0u;
                memset(v193, 0, 21);
                uuid_unparse((const unsigned __int8 *)&v48[38], out);
                v101 = ", ";
                if (!*((_BYTE *)v168 + 24))
                  v101 = "";
                v102 = snprintf(*((char **)v202 + 3), *((_QWORD *)v198 + 3), "%sagent: %s", v101, out);
                v103 = v198;
                v104 = *((_QWORD *)v198 + 3);
                v52 = v104 > v102;
                v105 = v104 - v102;
                if (v52)
                {
                  if (v102 >= 1)
                  {
                    *((_QWORD *)v202 + 3) += v102;
                    *((_QWORD *)v103 + 3) = v105;
                  }
                }
                else
                {
                  **((_BYTE **)v202 + 3) = 0;
                  *((_BYTE *)v172 + 24) = 1;
                }
                *((_BYTE *)v168 + 24) = 1;
              }
            }
          }
          if (!*((_BYTE *)v172 + 24))
          {
            v83 = *(void **)&v48[42]._os_unfair_lock_opaque;
            if (v83)
            {
              if (xpc_array_get_count(v83)
                && *xpc_array_get_string(*(xpc_object_t *)&v48[42]._os_unfair_lock_opaque, 0))
              {
                v84 = ", ";
                if (!*((_BYTE *)v168 + 24))
                  v84 = "";
                v85 = snprintf(*((char **)v202 + 3), *((_QWORD *)v198 + 3), "%sagent_domains: {", v84);
                v86 = v198;
                v87 = *((_QWORD *)v198 + 3);
                v52 = v87 > v85;
                v88 = v87 - v85;
                if (v52)
                {
                  if (v85 >= 1)
                  {
                    *((_QWORD *)v202 + 3) += v85;
                    *((_QWORD *)v86 + 3) = v88;
                  }
                }
                else
                {
                  **((_BYTE **)v202 + 3) = 0;
                  *((_BYTE *)v172 + 24) = 1;
                }
                *((_BYTE *)v168 + 24) = 0;
                v118 = *(void **)&v48[42]._os_unfair_lock_opaque;
                *(_QWORD *)out = v4;
                *(_QWORD *)&out[8] = 3221225472;
                *(_QWORD *)v193 = ___ZL28nw_path_fallback_descriptionP18NWConcrete_nw_pathPcm_block_invoke;
                *(_QWORD *)&v193[8] = &unk_1E14A91A0;
                *(_QWORD *)&v193[16] = v201;
                v194 = v197;
                v195 = &v167;
                v196 = &v171;
                xpc_array_apply(v118, out);
                *((_BYTE *)v168 + 24) = 0;
                v119 = snprintf(*((char **)v202 + 3), *((_QWORD *)v198 + 3), "%s}", ");
                v120 = v198;
                v121 = *((_QWORD *)v198 + 3);
                v52 = v121 > v119;
                v122 = v121 - v119;
                if (v52)
                {
                  if (v119 >= 1)
                  {
                    *((_QWORD *)v202 + 3) += v119;
                    *((_QWORD *)v120 + 3) = v122;
                  }
                }
                else
                {
                  **((_BYTE **)v202 + 3) = 0;
                  *((_BYTE *)v172 + 24) = 1;
                }
                *((_BYTE *)v168 + 24) = 1;
              }
            }
          }
          if (!*((_BYTE *)v172 + 24))
          {
            v89 = *(void **)&v48[44]._os_unfair_lock_opaque;
            if (v89)
            {
              if (xpc_array_get_count(v89)
                && *xpc_array_get_string(*(xpc_object_t *)&v48[44]._os_unfair_lock_opaque, 0))
              {
                v90 = ", ";
                if (!*((_BYTE *)v168 + 24))
                  v90 = "";
                v91 = snprintf(*((char **)v202 + 3), *((_QWORD *)v198 + 3), "%sagent_types: {", v90);
                v92 = v198;
                v93 = *((_QWORD *)v198 + 3);
                v52 = v93 > v91;
                v94 = v93 - v91;
                if (v52)
                {
                  if (v91 >= 1)
                  {
                    *((_QWORD *)v202 + 3) += v91;
                    *((_QWORD *)v92 + 3) = v94;
                  }
                }
                else
                {
                  **((_BYTE **)v202 + 3) = 0;
                  *((_BYTE *)v172 + 24) = 1;
                }
                *((_BYTE *)v168 + 24) = 0;
                v123 = *(void **)&v48[44]._os_unfair_lock_opaque;
                *(_QWORD *)applier = v4;
                v185 = 3221225472;
                v186 = ___ZL28nw_path_fallback_descriptionP18NWConcrete_nw_pathPcm_block_invoke_2;
                v187 = &unk_1E14A91A0;
                v188 = v201;
                v189 = v197;
                v190 = &v167;
                v191 = &v171;
                xpc_array_apply(v123, applier);
                *((_BYTE *)v168 + 24) = 0;
                v124 = snprintf(*((char **)v202 + 3), *((_QWORD *)v198 + 3), "%s}", ");
                v125 = v198;
                v126 = *((_QWORD *)v198 + 3);
                v52 = v126 > v124;
                v127 = v126 - v124;
                if (v52)
                {
                  if (v124 >= 1)
                  {
                    *((_QWORD *)v202 + 3) += v124;
                    *((_QWORD *)v125 + 3) = v127;
                  }
                }
                else
                {
                  **((_BYTE **)v202 + 3) = 0;
                  *((_BYTE *)v172 + 24) = 1;
                }
                *((_BYTE *)v168 + 24) = 1;
              }
            }
          }
          if (*((_BYTE *)v172 + 24))
          {
            v54 = v168;
            v55 = v202;
LABEL_55:
            v56 = v198;
            goto LABEL_56;
          }
          v95 = *((_BYTE *)v23 + 473);
          v54 = v168;
          v55 = v202;
          if ((v95 & 1) != 0)
          {
            v96 = ", ";
            if (!*((_BYTE *)v168 + 24))
              v96 = "";
            v97 = snprintf(*((char **)v202 + 3), *((_QWORD *)v198 + 3), "%sweak", v96);
            v98 = v198;
            v99 = *((_QWORD *)v198 + 3);
            v100 = v99 - v97;
            if (v99 <= v97)
            {
              **((_BYTE **)v202 + 3) = 0;
              *((_BYTE *)v172 + 24) = 1;
              v55 = v202;
            }
            else
            {
              v55 = v202;
              if (v97 >= 1)
              {
                *((_QWORD *)v202 + 3) += v97;
                *((_QWORD *)v98 + 3) = v100;
              }
            }
            v54 = v168;
            *((_BYTE *)v168 + 24) = 1;
            if (*((_BYTE *)v172 + 24))
              goto LABEL_55;
            v95 = *((_BYTE *)v23 + 473);
          }
          if ((v95 & 2) != 0)
          {
            v106 = (char *)*((_QWORD *)v55 + 3);
            v107 = ", ";
            if (!*((_BYTE *)v54 + 24))
              v107 = "";
            v108 = snprintf(v106, *((_QWORD *)v198 + 3), "%sno fallback timer", v107);
            v109 = v198;
            v110 = *((_QWORD *)v198 + 3);
            v111 = v110 - v108;
            if (v110 <= v108)
            {
              **((_BYTE **)v202 + 3) = 0;
              *((_BYTE *)v172 + 24) = 1;
              v55 = v202;
            }
            else
            {
              v55 = v202;
              if (v108 >= 1)
              {
                *((_QWORD *)v202 + 3) += v108;
                *((_QWORD *)v109 + 3) = v111;
              }
            }
            v54 = v168;
            *((_BYTE *)v168 + 24) = 1;
            if (*((_BYTE *)v172 + 24))
              goto LABEL_55;
            v95 = *((_BYTE *)v23 + 473);
          }
          if ((v95 & 4) != 0)
          {
            v112 = (char *)*((_QWORD *)v55 + 3);
            v113 = ", ";
            if (!*((_BYTE *)v54 + 24))
              v113 = "";
            v114 = snprintf(v112, *((_QWORD *)v198 + 3), "%sforced", v113);
            v115 = v198;
            v116 = *((_QWORD *)v198 + 3);
            v117 = v116 - v114;
            if (v116 <= v114)
            {
              **((_BYTE **)v202 + 3) = 0;
              *((_BYTE *)v172 + 24) = 1;
              v55 = v202;
            }
            else
            {
              v55 = v202;
              if (v114 >= 1)
              {
                *((_QWORD *)v202 + 3) += v114;
                *((_QWORD *)v115 + 3) = v117;
              }
            }
            v54 = v168;
            *((_BYTE *)v168 + 24) = 1;
            if (*((_BYTE *)v172 + 24))
              goto LABEL_55;
            v95 = *((_BYTE *)v23 + 473);
          }
          if ((v95 & 8) != 0)
          {
            v130 = (char *)*((_QWORD *)v55 + 3);
            v131 = ", ";
            if (!*((_BYTE *)v54 + 24))
              v131 = "";
            v132 = snprintf(v130, *((_QWORD *)v198 + 3), "%spreferred", v131);
            v56 = v198;
            v133 = *((_QWORD *)v198 + 3);
            v134 = v133 - v132;
            if (v133 <= v132)
            {
              **((_BYTE **)v202 + 3) = 0;
              *((_BYTE *)v172 + 24) = 1;
              v55 = v202;
              v56 = v198;
            }
            else
            {
              v55 = v202;
              if (v132 >= 1)
              {
                *((_QWORD *)v202 + 3) += v132;
                *((_QWORD *)v56 + 3) = v134;
              }
            }
            v54 = v168;
            *((_BYTE *)v168 + 24) = 1;
            if (*((_BYTE *)v172 + 24))
              goto LABEL_56;
            v129 = ", ";
          }
          else
          {
            v56 = v198;
            v128 = *((_BYTE *)v54 + 24) == 0;
            v129 = ", ";
            if (v128)
              v129 = "";
          }
          v135 = snprintf(*((char **)v55 + 3), *((_QWORD *)v56 + 3), "%sgeneration: %u", v129, v48[93]._os_unfair_lock_opaque);
          v56 = v198;
          v136 = *((_QWORD *)v198 + 3);
          v137 = v136 - v135;
          if (v136 <= v135)
          {
            **((_BYTE **)v202 + 3) = 0;
            *((_BYTE *)v172 + 24) = 1;
            v55 = v202;
            v56 = v198;
          }
          else
          {
            v55 = v202;
            if (v135 >= 1)
            {
              *((_QWORD *)v202 + 3) += v135;
              *((_QWORD *)v56 + 3) = v137;
            }
          }
          v54 = v168;
          *((_BYTE *)v168 + 24) = 1;
LABEL_56:
          *((_BYTE *)v54 + 24) = 0;
          v57 = snprintf(*((char **)v55 + 3), *((_QWORD *)v56 + 3), "%s}", ");
          v58 = v198;
          v59 = *((_QWORD *)v198 + 3);
          v52 = v59 > v57;
          v60 = v59 - v57;
          if (v52)
          {
            if (v57 >= 1)
            {
              *((_QWORD *)v202 + 3) += v57;
              *((_QWORD *)v58 + 3) = v60;
            }
          }
          else
          {
            **((_BYTE **)v202 + 3) = 0;
            *((_BYTE *)v172 + 24) = 1;
          }
          *((_BYTE *)v168 + 24) = 1;
          _Block_object_dispose(&v167, 8);
          _Block_object_dispose(&v171, 8);
          _Block_object_dispose(v197, 8);
          _Block_object_dispose(v201, 8);

LABEL_61:
          v61 = v45;
          v62 = v61;
          if (v19->policy_result.routing_result == 4)
          {
            os_unfair_lock_opaque = v61[67]._os_unfair_lock_opaque;

            if (os_unfair_lock_opaque)
            {
              snprintf(v197, 0x18uLL, ", flow divert: %u", os_unfair_lock_opaque);
              v64 = v62[88]._os_unfair_lock_opaque;
              if (!v64)
              {
LABEL_64:
                v201[0] = 0;
                goto LABEL_68;
              }
LABEL_67:
              snprintf(v201, 0x1FuLL, ", flow divert agg: %x", v64);
LABEL_68:
              os_unfair_lock_opaque_high = HIBYTE(v62[96]._os_unfair_lock_opaque);
              v66 = 0x8000 << os_unfair_lock_opaque_high;
              if (os_unfair_lock_opaque_high > 0x30)
                v66 = -1;
              if (HIBYTE(v62[96]._os_unfair_lock_opaque) && v66)
                snprintf(applier, 0x31uLL, ", estimated upload: %lluBps", v66);
              else
                applier[0] = 0;
              os_unfair_lock_opaque_low = LOBYTE(v62[97]._os_unfair_lock_opaque);
              v68 = 0x8000 << os_unfair_lock_opaque_low;
              if (os_unfair_lock_opaque_low > 0x30)
                v68 = -1;
              if (LOBYTE(v62[97]._os_unfair_lock_opaque) && v68)
                snprintf(out, 0x33uLL, ", estimated download: %lluBps", v68);
              else
                out[0] = 0;
              v171 = 0;
              v69 = v62[94]._os_unfair_lock_opaque;
              if (v69 > 3)
                v70 = "unknown";
              else
                v70 = off_1E14A9340[v69];
              v71 = v62;
              v72 = *(const char **)&v71[62]._os_unfair_lock_opaque;

              v73 = "[";
              if (v12)
              {
                v74 = v12;
              }
              else
              {
                v73 = "";
                v74 = "";
              }
              v75 = "]";
              if (!v12)
                v75 = "";
              asprintf(&v171, "%s (%s)%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", v70, v72, v158, __str, v73, v74, v75, v157, v156, v155, v150, v148, v154, v153, v152, (const char *)buf, v197,
                v201,
                applier,
                out,
                v151,
                v149);
              v76 = v171;

              if (v76)
              {
                v77 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v76, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
LABEL_196:
                v159[0] = v4;
                v159[1] = 3221225472;
                v159[2] = __33__NWConcrete_nw_path_description__block_invoke_2;
                v159[3] = &unk_1E14ACE68;
                v159[4] = v8;
                v146 = v77;
                v159[5] = v146;
                os_unfair_lock_lock(p_description_lock);
                __33__NWConcrete_nw_path_description__block_invoke_2((uint64_t)v159);
                os_unfair_lock_unlock(p_description_lock);
                v6 = v146;

                goto LABEL_197;
              }
LABEL_195:
              v77 = 0;
              goto LABEL_196;
            }
          }
          else
          {

          }
          v197[0] = 0;
          v64 = v62[88]._os_unfair_lock_opaque;
          if (!v64)
            goto LABEL_64;
          goto LABEL_67;
        }
      }
      v47 = ", proxy";
      goto LABEL_45;
    }
    __nwlog_obj();
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_path_create_description";
    v139 = (char *)_os_log_send_and_compose_impl();

    out[0] = 16;
    applier[0] = 0;
    if (__nwlog_fault(v139, out, applier))
    {
      if (out[0] == 17)
      {
        __nwlog_obj();
        v140 = objc_claimAutoreleasedReturnValue();
        v141 = out[0];
        if (os_log_type_enabled(v140, (os_log_type_t)out[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_path_create_description";
          _os_log_impl(&dword_182FBE000, v140, v141, "%{public}s called with null path", buf, 0xCu);
        }
      }
      else if (applier[0])
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v140 = objc_claimAutoreleasedReturnValue();
        v143 = out[0];
        v144 = os_log_type_enabled(v140, (os_log_type_t)out[0]);
        if (backtrace_string)
        {
          if (v144)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "nw_path_create_description";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v140, v143, "%{public}s called with null path, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_193;
        }
        if (v144)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_path_create_description";
          _os_log_impl(&dword_182FBE000, v140, v143, "%{public}s called with null path, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v140 = objc_claimAutoreleasedReturnValue();
        v145 = out[0];
        if (os_log_type_enabled(v140, (os_log_type_t)out[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_path_create_description";
          _os_log_impl(&dword_182FBE000, v140, v145, "%{public}s called with null path, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_193:
    if (v139)
      free(v139);
    goto LABEL_195;
  }
  v6 = v5;
LABEL_197:
  _Block_object_dispose(&v161, 8);

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->description, 0);
  objc_storeStrong((id *)&self->proxy_settings, 0);
  objc_storeStrong((id *)&self->proxy_configs, 0);
  objc_storeStrong((id *)&self->network_agent_dictionary, 0);
  objc_storeStrong((id *)&self->group_members, 0);
  objc_storeStrong((id *)&self->gateways, 0);
  objc_storeStrong((id *)&self->override_extra_interface_options, 0);
  objc_storeStrong((id *)&self->override_resolver_configs, 0);
  objc_storeStrong((id *)&self->resolver_configs, 0);
  objc_storeStrong((id *)&self->fallback_agent_types, 0);
  objc_storeStrong((id *)&self->fallback_agent_domains, 0);
  objc_storeStrong((id *)&self->fallback_interface, 0);
  objc_storeStrong((id *)&self->delegate, 0);
  objc_storeStrong((id *)&self->direct, 0);
  objc_storeStrong((id *)&self->override_interface, 0);
  objc_storeStrong((id *)&self->override_local_endpoint, 0);
  objc_storeStrong((id *)&self->flows, 0);
  objc_storeStrong((id *)&self->resolved_endpoints, 0);
  objc_storeStrong((id *)&self->discovered_endpoints, 0);
  objc_storeStrong((id *)&self->advertise_descriptor, 0);
  objc_storeStrong((id *)&self->browse_descriptor, 0);
  objc_storeStrong((id *)&self->group_descriptor, 0);
  objc_storeStrong((id *)&self->endpoint, 0);
  objc_storeStrong((id *)&self->parameters, 0);
}

- (NWConcrete_nw_path)init
{
  NWConcrete_nw_path *v2;
  NWConcrete_nw_path *v3;
  NWConcrete_nw_path *v4;
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
  v16.super_class = (Class)NWConcrete_nw_path;
  v2 = -[NWConcrete_nw_path init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->lock._os_unfair_lock_opaque = 0;
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_path init]";
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
        v18 = "-[NWConcrete_nw_path init]";
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
          v18 = "-[NWConcrete_nw_path init]";
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
        v18 = "-[NWConcrete_nw_path init]";
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
        v18 = "-[NWConcrete_nw_path init]";
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

- (id)copyWithZone:(_NSZone *)a3
{
  NWConcrete_nw_path *v4;
  NWConcrete_nw_path *v5;
  NWConcrete_nw_path *v6;
  NWConcrete_nw_path *v7;
  _QWORD v9[4];
  NWConcrete_nw_path *v10;
  NWConcrete_nw_path *v11;

  v4 = objc_alloc_init(NWConcrete_nw_path);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__NWConcrete_nw_path_copyWithZone___block_invoke;
  v9[3] = &unk_1E14ACE68;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = self;
  os_unfair_lock_lock(&v6->lock);
  __35__NWConcrete_nw_path_copyWithZone___block_invoke((uint64_t)v9);
  os_unfair_lock_unlock(&v6->lock);

  v7 = v5;
  return v7;
}

- (void)dealloc
{
  char *reason_description;
  necp_client_result_netagent *netagents;
  necp_client_interface_option *interface_options;
  objc_super v6;

  reason_description = self->reason_description;
  if (reason_description)
  {
    free(reason_description);
    self->reason_description = 0;
  }
  netagents = self->policy_result.netagents;
  if (netagents)
  {
    free(netagents);
    self->policy_result.netagents = 0;
  }
  interface_options = self->policy_result.interface_options;
  if (interface_options)
  {
    free(interface_options);
    self->policy_result.interface_options = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_path;
  -[NWConcrete_nw_path dealloc](&v6, sel_dealloc);
}

@end
