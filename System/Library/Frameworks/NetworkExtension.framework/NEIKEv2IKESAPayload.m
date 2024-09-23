@implementation NEIKEv2IKESAPayload

- (unint64_t)type
{
  return 33;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  const char *v9;
  SEL v10;
  id Property;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Payload Type"), v5, a4);

  if (self)
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v9, 32, 1), CFSTR("Rekey SPI"), v5, a4);
    Property = objc_getProperty(self, v10, 24, 1);
  }
  else
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("Rekey SPI"), v5, a4);
    Property = 0;
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("Proposals"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEIKEv2IKESAPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (BOOL)hasRequiredFields
{
  if (self)
    self = (NEIKEv2IKESAPayload *)objc_getProperty(self, a2, 24, 1);
  return -[NEIKEv2IKESAPayload count](self, "count") != 0;
}

- (BOOL)generatePayloadData
{
  NEIKEv2IKESAPayload *v2;
  const char *v3;
  id v4;
  unint64_t v6;
  const char *v7;
  id v8;
  id Property;
  const char *v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  id v22;
  id v23;
  const char *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  id v35;
  id v36;
  const char *v37;
  id v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  void *v55;
  id v56;
  id v57;
  const char *v58;
  id v59;
  id v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t ii;
  uint64_t v72;
  unint64_t v73;
  unsigned int v74;
  unint64_t v75;
  unsigned int v76;
  uint64_t v77;
  int v78;
  NSObject *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t k;
  void *v85;
  unsigned int v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  void *v90;
  id v91;
  id v92;
  const char *v93;
  id v94;
  id v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  unsigned int v104;
  uint64_t v105;
  NSObject *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  void *v113;
  uint8_t v114;
  void *v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t m;
  void *v121;
  unsigned int v122;
  uint64_t v123;
  uint64_t v124;
  unsigned __int8 v125;
  id v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unsigned __int8 v131;
  uint64_t n;
  void *v133;
  unsigned int v134;
  uint8_t v135;
  uint64_t v136;
  const char *v137;
  uint8_t v138;
  const char *v139;
  uint64_t v140;
  NSObject *v141;
  NSObject *v142;
  const char *v143;
  NSObject *v144;
  id v145;
  void *v146;
  unsigned int v147;
  void *v148;
  NEIKEv2IKESAPayload *v149;
  uint64_t v150;
  unsigned __int8 v151;
  NSObject *v152;
  uint64_t v153;
  unint64_t v154;
  _BYTE *selfa;
  uint64_t v156;
  id obj;
  NSObject *v158;
  void *v159;
  uint64_t v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  uint8_t buf[8];
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  id v202;
  _BYTE v203[128];
  _BYTE v204[128];
  id v205;
  void *v206;
  _BYTE v207[128];
  id v208;
  _BYTE v209[128];
  id v210;
  _BYTE v211[128];
  uint64_t v212;

  v2 = self;
  v212 = *MEMORY[0x1E0C80C00];
  if (self && objc_getProperty(self, a2, 16, 1))
    goto LABEL_3;
  if (-[NEIKEv2IKESAPayload hasRequiredFields](v2, "hasRequiredFields"))
  {
    v6 = 0x1E0C99000uLL;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    if (v2)
      Property = objc_getProperty(v2, v7, 24, 1);
    else
      Property = 0;
    v11 = objc_msgSend(Property, "count");
    v194 = 0u;
    v195 = 0u;
    v196 = 0u;
    v197 = 0u;
    if (v2)
      v12 = objc_getProperty(v2, v10, 24, 1);
    else
      v12 = 0;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v194, v211, 16);
    if (!v14)
    {
LABEL_170:

      if (!v2)
      {

        v4 = 0;
        return v4 != 0;
      }
      objc_setProperty_atomic(v2, v143, v8, 16);

LABEL_3:
      v4 = objc_getProperty(v2, v3, 16, 1);
      return v4 != 0;
    }
    v154 = v14;
    v15 = 0;
    v147 = v11;
    v16 = *(_QWORD *)v195;
    v17 = *(_QWORD *)v195;
    v151 = 1;
    v150 = *(_QWORD *)v195;
LABEL_12:
    if (v17 != v16)
    {
      v18 = v15;
      objc_enumerationMutation(v13);
      v15 = v18;
    }
    v153 = v15;
    v19 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * v15);
    objc_msgSend(v19, "encryptionProtocols");
    v21 = objc_claimAutoreleasedReturnValue();
    selfa = v19;
    if (v19)
      v22 = objc_getProperty(v19, v20, 88, 1);
    else
      v22 = 0;
    v23 = v22;

    if (v23)
    {
      v25 = selfa;
      if (selfa)
        v25 = objc_getProperty(selfa, v24, 88, 1);
      v26 = v25;
      v210 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v210, 1);
      v27 = objc_claimAutoreleasedReturnValue();

      v21 = v27;
    }
    if (-[NSObject count](v21, "count"))
    {
      v192 = 0u;
      v193 = 0u;
      v190 = 0u;
      v191 = 0u;
      v21 = v21;
      v28 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v190, v209, 16);
      if (!v28)
        goto LABEL_30;
      v29 = v28;
      v30 = *(_QWORD *)v191;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v191 != v30)
            objc_enumerationMutation(v21);
          v32 = *(_QWORD *)(*((_QWORD *)&v190 + 1) + 8 * i);
          if (v32 && (unint64_t)(*(_QWORD *)(v32 + 16) - 29) <= 2)
          {
            ne_log_obj();
            v142 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19BD16000, v142, OS_LOG_TYPE_ERROR, "IIV encryption algorithms only allowed in child SA proposals", buf, 2u);
            }

            v34 = v21;
            goto LABEL_167;
          }
        }
        v29 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v190, v209, 16);
      }
      while (v29);
LABEL_30:

      objc_msgSend(selfa, "prfProtocols");
      v34 = objc_claimAutoreleasedReturnValue();
      if (selfa)
        v35 = objc_getProperty(selfa, v33, 104, 1);
      else
        v35 = 0;
      v36 = v35;

      if (v36)
      {
        v38 = selfa;
        v39 = v34;
        if (selfa)
          v38 = objc_getProperty(selfa, v37, 104, 1);
        v40 = v38;
        v208 = v40;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v208, 1);
        v34 = objc_claimAutoreleasedReturnValue();

      }
      if (!-[NSObject count](v34, "count"))
      {
        ne_log_obj();
        v144 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BD16000, v144, OS_LOG_TYPE_ERROR, "IKE SA proposal missing PRF protocol", buf, 2u);
        }

        goto LABEL_167;
      }
      objc_msgSend(selfa, "additionalKEMProtocols");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](selfa);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v158 = v21;
      v152 = v34;
      v145 = v13;
      v146 = v8;
      v149 = v2;
      if (v41)
      {
        -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](selfa);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v42, "count"))
        {
          v43 = objc_alloc(MEMORY[0x1E0C99E08]);
          -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](selfa);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)objc_msgSend(v43, "initWithCapacity:", objc_msgSend(v44, "count"));

          v188 = 0u;
          v189 = 0u;
          v186 = 0u;
          v187 = 0u;
          v46 = v42;
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v186, v207, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v187;
            do
            {
              for (j = 0; j != v48; ++j)
              {
                if (*(_QWORD *)v187 != v49)
                  objc_enumerationMutation(v46);
                v51 = *(_QWORD *)(*((_QWORD *)&v186 + 1) + 8 * j);
                objc_msgSend(v46, "objectForKeyedSubscript:", v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v206 = v52;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v206, 1);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "setObject:forKeyedSubscript:", v53, v51);

              }
              v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v186, v207, 16);
            }
            while (v48);
          }

          v13 = v145;
          v8 = v146;
          v2 = v149;
          v21 = v158;
          v34 = v152;
        }
        else
        {
          v45 = (void *)MEMORY[0x1E0C9AA70];
        }

        v159 = v45;
        v6 = 0x1E0C99000uLL;
      }
      objc_msgSend(selfa, "kemProtocols");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (selfa)
        v56 = objc_getProperty(selfa, v54, 112, 1);
      else
        v56 = 0;
      v57 = v56;

      if (v57)
      {
        v59 = selfa;
        if (selfa)
          v59 = objc_getProperty(selfa, v58, 112, 1);
        v60 = v59;
        v205 = v60;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v205, 1);
        v61 = objc_claimAutoreleasedReturnValue();

        v62 = (void *)v61;
        v34 = v152;
      }
      else
      {
        v62 = v55;
      }
      v148 = v62;
      if (!objc_msgSend(v62, "count"))
      {
        ne_log_obj();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BD16000, v63, OS_LOG_TYPE_ERROR, "IKE SA proposal missing KE protocol", buf, 2u);
        }
        v78 = 0;
        goto LABEL_151;
      }
      v63 = objc_alloc_init(*(Class *)(v6 + 3568));
      v182 = 0u;
      v183 = 0u;
      v184 = 0u;
      v185 = 0u;
      v64 = v21;
      v65 = -[NSObject countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v182, v204, 16);
      if (!v65)
      {
        v67 = 0;
        LOBYTE(v68) = 0;
LABEL_84:

        v179 = 0u;
        v180 = 0u;
        v177 = 0u;
        v178 = 0u;
        v79 = v34;
        v80 = -[NSObject countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v177, v203, 16);
        if (v80)
        {
          v81 = v80;
          v82 = 0;
          v83 = *(_QWORD *)v178;
          for (k = *(_QWORD *)v178; ; k = *(_QWORD *)v178)
          {
            if (k != v83)
              objc_enumerationMutation(v79);
            v85 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * v82);
            *(_QWORD *)buf = 0;
            v86 = objc_msgSend(v85, "type");
            buf[0] = 3;
            buf[4] = 2;
            *(_WORD *)&buf[6] = bswap32(v86) >> 16;
            *(_WORD *)&buf[2] = 2048;
            -[NSObject appendBytes:length:](v63, "appendBytes:length:", buf, 8);
            LOBYTE(v68) = v68 + 1;
            if (++v82 >= v81)
            {
              v87 = -[NSObject countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v177, v203, 16);
              if (!v87)
                break;
              v81 = v87;
              v82 = 0;
            }
          }
        }

        if ((v67 & 1) != 0)
        {
          v88 = v159;
        }
        else
        {
          objc_msgSend(selfa, "integrityProtocols");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v149;
          if (selfa)
            v91 = objc_getProperty(selfa, v89, 96, 1);
          else
            v91 = 0;
          v92 = v91;

          if (v92)
          {
            v94 = selfa;
            if (selfa)
              v94 = objc_getProperty(selfa, v93, 96, 1);
            v95 = v94;
            v202 = v95;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v202, 1);
            v96 = objc_claimAutoreleasedReturnValue();

            v90 = (void *)v96;
          }
          if (!objc_msgSend(v90, "count"))
          {
            ne_log_obj();
            v106 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19BD16000, v106, OS_LOG_TYPE_ERROR, "IKE SA proposal missing integrity protocol", buf, 2u);
            }

            v78 = 0;
            v13 = v145;
            v8 = v146;
            v34 = v152;
            goto LABEL_151;
          }
          v175 = 0u;
          v176 = 0u;
          v173 = 0u;
          v174 = 0u;
          v97 = v90;
          v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v173, v201, 16);
          if (v98)
          {
            v99 = v98;
            v100 = 0;
            v101 = *(_QWORD *)v174;
            v102 = *(_QWORD *)v174;
            v88 = v159;
            while (1)
            {
              if (v102 != v101)
                objc_enumerationMutation(v97);
              v103 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * v100);
              *(_QWORD *)buf = 0;
              v104 = objc_msgSend(v103, "type");
              buf[0] = 3;
              buf[4] = 3;
              *(_WORD *)&buf[6] = bswap32(v104) >> 16;
              *(_WORD *)&buf[2] = 2048;
              -[NSObject appendBytes:length:](v63, "appendBytes:length:", buf, 8);
              LOBYTE(v68) = v68 + 1;
              if (++v100 >= v99)
              {
                v105 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v173, v201, 16);
                if (!v105)
                  goto LABEL_113;
                v99 = v105;
                v100 = 0;
              }
              v102 = *(_QWORD *)v174;
            }
          }
          v88 = v159;
LABEL_113:

        }
        if (objc_msgSend(v88, "count"))
        {
          objc_msgSend(v88, "allKeys");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "sortedArrayUsingSelector:", sel_compare_);
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          v171 = 0u;
          v172 = 0u;
          v169 = 0u;
          v170 = 0u;
          obj = v108;
          v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v200, 16);
          if (v109)
          {
            v110 = v109;
            v111 = 0;
            v112 = *(_QWORD *)v170;
            v156 = *(_QWORD *)v170;
            while (1)
            {
              if (v112 != v156)
                objc_enumerationMutation(obj);
              v113 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * v111);
              v114 = objc_msgSend(v113, "unsignedCharValue");
              v165 = 0u;
              v166 = 0u;
              v167 = 0u;
              v168 = 0u;
              objc_msgSend(v159, "objectForKeyedSubscript:", v113);
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v165, v199, 16);
              if (v116)
              {
                v117 = v116;
                v118 = 0;
                v119 = *(_QWORD *)v166;
                for (m = *(_QWORD *)v166; ; m = *(_QWORD *)v166)
                {
                  if (m != v119)
                    objc_enumerationMutation(v115);
                  v121 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * v118);
                  *(_QWORD *)buf = 0;
                  v122 = objc_msgSend(v121, "method");
                  buf[0] = 3;
                  buf[4] = v114;
                  *(_WORD *)&buf[6] = bswap32(v122) >> 16;
                  *(_WORD *)&buf[2] = 2048;
                  -[NSObject appendBytes:length:](v63, "appendBytes:length:", buf, 8);
                  LOBYTE(v68) = v68 + 1;
                  if (++v118 >= v117)
                  {
                    v123 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v165, v199, 16);
                    if (!v123)
                      break;
                    v117 = v123;
                    v118 = 0;
                  }
                }
              }

              ++v111;
              v21 = v158;
              if (v111 >= v110)
              {
                v124 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v200, 16);
                if (!v124)
                  break;
                v110 = v124;
                v111 = 0;
              }
              v112 = *(_QWORD *)v170;
            }
          }

        }
        v2 = v149;
        v125 = objc_msgSend(v148, "count");
        v161 = 0u;
        v162 = 0u;
        v163 = 0u;
        v164 = 0u;
        v126 = v148;
        v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v161, v198, 16);
        if (!v127)
          goto LABEL_144;
        v128 = v127;
        v129 = 0;
        v130 = *(_QWORD *)v162;
        v131 = 1;
        for (n = *(_QWORD *)v162; ; n = *(_QWORD *)v162)
        {
          if (n != v130)
            objc_enumerationMutation(v126);
          v133 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * v129);
          *(_QWORD *)buf = 0;
          v134 = objc_msgSend(v133, "method");
          if (v125 <= v131)
            v135 = 0;
          else
            v135 = 3;
          buf[0] = v135;
          buf[4] = 4;
          *(_WORD *)&buf[6] = bswap32(v134) >> 16;
          *(_WORD *)&buf[2] = 2048;
          -[NSObject appendBytes:length:](v63, "appendBytes:length:", buf, 8);
          LOBYTE(v68) = v68 + 1;
          if (++v129 >= v128)
          {
            v136 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v161, v198, 16);
            if (!v136)
            {
              v2 = v149;
              v21 = v158;
LABEL_144:

              *(_QWORD *)buf = 0x10000000000;
              buf[0] = 2 * (v147 > v151);
              v34 = v152;
              v138 = selfa;
              if (selfa)
                v138 = selfa[8];
              buf[4] = v138;
              if (v2 && objc_getProperty(v2, v137, 32, 1))
              {
                v160 = 0;
                v160 = objc_msgSend(objc_getProperty(v2, v139, 32, 1), "value");
                buf[6] = 8;
                -[NSObject replaceBytesInRange:withBytes:length:](v63, "replaceBytesInRange:withBytes:length:", 0, 0, &v160, 8);
              }
              else
              {
                buf[6] = 0;
              }
              buf[7] = v68;
              *(_WORD *)&buf[2] = bswap32(-[NSObject length](v63, "length") + 8) >> 16;
              v8 = v146;
              objc_msgSend(v146, "appendBytes:length:", buf, 8);
              objc_msgSend(v146, "appendData:", v63);
              ++v151;
              v78 = 1;
              v13 = v145;
LABEL_151:

              if (!v78)
                goto LABEL_168;
              v140 = v154;
              v15 = v153 + 1;
              v6 = 0x1E0C99000;
              if (v153 + 1 < v154)
                goto LABEL_155;
              v140 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v194, v211, 16);
              if (!v140)
                goto LABEL_170;
              v15 = 0;
LABEL_155:
              v154 = v140;
              v17 = *(_QWORD *)v195;
              v16 = v150;
              goto LABEL_12;
            }
            v128 = v136;
            v129 = 0;
          }
          ++v131;
        }
      }
      v66 = v65;
      v67 = 0;
      v68 = 0;
      v69 = 0;
      v70 = *(_QWORD *)v183;
      for (ii = *(_QWORD *)v183; ; ii = *(_QWORD *)v183)
      {
        if (ii != v70)
          objc_enumerationMutation(v64);
        v72 = *(_QWORD *)(*((_QWORD *)&v182 + 1) + 8 * v69);
        *(_QWORD *)buf = 0;
        LODWORD(v160) = 0;
        if (!v72)
          break;
        v73 = *(_QWORD *)(v72 + 16);
        if (v73 != 12 && (v73 > 0x1E || ((0x401C0000u >> v73) & 1) == 0))
          goto LABEL_65;
        if ((*(_BYTE *)(v72 + 8) & 1) != 0)
          v74 = 256;
        else
          v74 = 128;
        buf[0] = 3;
        buf[4] = 1;
        *(_WORD *)&buf[6] = bswap32(v73) >> 16;
        LOWORD(v160) = 3712;
        WORD1(v160) = __rev16(v74);
        *(_WORD *)&buf[2] = 3072;
        -[NSObject appendBytes:length:](v63, "appendBytes:length:", buf, 8);
        -[NSObject appendBytes:length:](v63, "appendBytes:length:", &v160, 4);
        ++v68;
LABEL_71:
        v75 = *(_QWORD *)(v72 + 16);
        if (v75 <= 0x1F)
        {
          v76 = (0xD01C0000 >> v75) & 1;
          goto LABEL_74;
        }
LABEL_73:
        LOBYTE(v76) = 0;
LABEL_74:
        v67 |= v76;
        if (++v69 >= v66)
        {
          v77 = -[NSObject countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v182, v204, 16);
          if (!v77)
          {
            v21 = v158;
            v34 = v152;
            goto LABEL_84;
          }
          v66 = v77;
          v69 = 0;
        }
      }
      LODWORD(v73) = 0;
LABEL_65:
      buf[0] = 3;
      buf[4] = 1;
      *(_WORD *)&buf[6] = bswap32(v73) >> 16;
      *(_WORD *)&buf[2] = 2048;
      -[NSObject appendBytes:length:](v63, "appendBytes:length:", buf, 8);
      ++v68;
      if (!v72)
        goto LABEL_73;
      goto LABEL_71;
    }
    ne_log_obj();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v34, OS_LOG_TYPE_ERROR, "IKE SA proposal missing encryption protocol", buf, 2u);
    }
LABEL_167:

LABEL_168:
  }
  else
  {
    ne_log_obj();
    v141 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v141, OS_LOG_TYPE_ERROR, "IKE SA payload missing required fields", buf, 2u);
    }

  }
  return 0;
}

- (BOOL)parsePayloadData
{
  NEIKEv2IKESAPayload *v2;
  const char *v3;
  NSObject *v4;
  BOOL v5;
  SEL v6;
  id v7;
  unsigned __int8 *v8;
  const char *v9;
  unsigned int v10;
  _UNKNOWN **v11;
  __int128 v12;
  unsigned int v13;
  unint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  NEIKEv2IKESPI *v17;
  SEL v18;
  void *v20;
  id v21;
  uint64_t v22;
  unsigned int v23;
  unsigned __int8 *v24;
  unsigned int v25;
  uint64_t v26;
  NEIKEv2PRFProtocol *v27;
  NEIKEv2KEMProtocol *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  int v40;
  void *v41;
  void *v43;
  const char *v44;
  void *v45;
  void *v46;
  int v47;
  int v48;
  int v49;
  NSObject *v50;
  const char *v51;
  NSObject *v52;
  uint32_t v53;
  __int128 v55;
  void *v56;
  NEIKEv2IKESAPayload *v57;
  unsigned int v58;
  NSObject *newValue;
  id v60;
  unint64_t v61;
  _BYTE *v62;
  unsigned int v63;
  NEIKEv2KEMProtocol *v64;
  NEIKEv2PRFProtocol *v65;
  NEIKEv2PRFProtocol *v66;
  NEIKEv2PRFProtocol *v67;
  NEIKEv2PRFProtocol *v68;
  uint8_t buf[4];
  _QWORD v70[3];

  *(_QWORD *)((char *)&v70[1] + 4) = *MEMORY[0x1E0C80C00];
  if (!self || (v2 = self, !objc_getProperty(self, a2, 16, 1)))
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v70[0] = "-[NEIKEv2IKESAPayload parsePayloadData]";
      _os_log_fault_impl(&dword_19BD16000, v4, OS_LOG_TYPE_FAULT, "%s called with null self.payloadData", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(objc_getProperty(v2, v3, 16, 1), "length") > 7)
  {
    newValue = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_getProperty(v2, v6, 16, 1);
    v8 = (unsigned __int8 *)objc_msgSend(v7, "bytes");
    v56 = v7;
    v10 = objc_msgSend(v7, "length");
    v11 = &off_1E3CBB000;
    *(_QWORD *)&v12 = 67109376;
    v55 = v12;
    v57 = v2;
    while (1)
    {
      if (v10 < 8)
      {
LABEL_79:
        v4 = newValue;
        objc_setProperty_atomic(v2, v9, newValue, 24);
        v5 = -[NEIKEv2IKESAPayload hasRequiredFields](v2, "hasRequiredFields");

        goto LABEL_80;
      }
      v13 = bswap32(*((unsigned __int16 *)v8 + 1));
      v14 = HIWORD(v13);
      if (v10 < HIWORD(v13))
      {
        ne_log_obj();
        v50 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
LABEL_78:

          goto LABEL_79;
        }
        *(_DWORD *)buf = v55;
        LODWORD(v70[0]) = v10;
        WORD2(v70[0]) = 1024;
        *(_DWORD *)((char *)v70 + 6) = v14;
        v51 = "Not enough bytes remaining (%u) to process proposal length %u";
        v52 = v50;
        v53 = 14;
LABEL_82:
        _os_log_error_impl(&dword_19BD16000, v52, OS_LOG_TYPE_ERROR, v51, buf, v53);
        goto LABEL_78;
      }
      if ((unint64_t)v8[6] + 8 > v14)
      {
        ne_log_obj();
        v50 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          goto LABEL_78;
        *(_DWORD *)buf = 67109120;
        LODWORD(v70[0]) = v14;
        v51 = "Proposal length %u is too short";
        v52 = v50;
        v53 = 8;
        goto LABEL_82;
      }
      v63 = v8[7];
      v15 = objc_alloc_init((Class)v11[330]);
      v16 = v8[6];
      if ((_DWORD)v16 == 8)
      {
        v17 = -[NEIKEv2IKESPI initWithValue:]([NEIKEv2IKESPI alloc], "initWithValue:", *((_QWORD *)v8 + 1));
        objc_setProperty_atomic(v2, v18, v17, 32);
      }
      else
      {
        if (!v8[6])
          goto LABEL_17;
        ne_log_obj();
        v17 = (NEIKEv2IKESPI *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v17->super.super, OS_LOG_TYPE_ERROR))
        {
          v48 = v8[4];
          v49 = v8[6];
          *(_DWORD *)buf = v55;
          LODWORD(v70[0]) = v48;
          WORD2(v70[0]) = 1024;
          *(_DWORD *)((char *)v70 + 6) = v49;
          _os_log_error_impl(&dword_19BD16000, &v17->super.super, OS_LOG_TYPE_ERROR, "SA proposal %u has wrong length %u", buf, 0xEu);
        }
      }

      v16 = v8[6];
LABEL_17:
      if (v16 + 16 > v14 || v63 == 0)
      {
        v20 = 0;
        v21 = 0;
        if (v15)
          v15[8] = v8[4];
      }
      else
      {
        v61 = v14;
        v62 = v15;
        v58 = v10;
        v21 = 0;
        v60 = 0;
        v22 = v16 + 8;
        v23 = 1;
        do
        {
          v24 = &v8[v22];
          v25 = bswap32(*(unsigned __int16 *)&v8[v22 + 2]) >> 16;
          v26 = v8[v22 + 4];
          switch(v8[v22 + 4])
          {
            case 1u:
              v32 = v25 >= 0xC && *((_WORD *)v24 + 4) == 3712 && *((_WORD *)v24 + 5) == 1;
              v27 = (NEIKEv2PRFProtocol *)-[NEIKEv2EncryptionProtocol initWithEncryptionWireType:is256Bit:]([NEIKEv2EncryptionProtocol alloc], bswap32(*((unsigned __int16 *)v24 + 3)) >> 16, v32);
              objc_msgSend(v62, "encryptionProtocols");
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              if (v41)
              {
                objc_msgSend(v62, "encryptionProtocols");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "arrayByAddingObject:", v27);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "setEncryptionProtocols:", v35);
                goto LABEL_50;
              }
              v68 = v27;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "setEncryptionProtocols:", v34);
              break;
            case 2u:
              v27 = -[NEIKEv2PRFProtocol initWithType:]([NEIKEv2PRFProtocol alloc], "initWithType:", bswap32(*((unsigned __int16 *)v24 + 3)) >> 16);
              objc_msgSend(v62, "prfProtocols");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                objc_msgSend(v62, "prfProtocols");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "arrayByAddingObject:", v27);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "setPrfProtocols:", v35);
                goto LABEL_50;
              }
              v67 = v27;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "setPrfProtocols:", v34);
              break;
            case 3u:
              v27 = -[NEIKEv2IntegrityProtocol initWithType:]([NEIKEv2IntegrityProtocol alloc], "initWithType:", bswap32(*((unsigned __int16 *)v24 + 3)) >> 16);
              objc_msgSend(v62, "integrityProtocols");
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (v36)
              {
                objc_msgSend(v62, "integrityProtocols");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "arrayByAddingObject:", v27);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "setIntegrityProtocols:", v35);
                goto LABEL_50;
              }
              v66 = v27;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "setIntegrityProtocols:", v34);
              break;
            case 4u:
              v27 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", bswap32(*((unsigned __int16 *)v24 + 3)) >> 16);
              objc_msgSend(v62, "kemProtocols");
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              if (v37)
              {
                objc_msgSend(v62, "kemProtocols");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "arrayByAddingObject:", v27);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "setKemProtocols:", v35);
LABEL_50:

              }
              else
              {
                v65 = v27;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "setKemProtocols:", v34);
              }
              break;
            case 5u:
              ne_log_obj();
              v27 = (NEIKEv2PRFProtocol *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v27->super, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_19BD16000, &v27->super, OS_LOG_TYPE_DEBUG, "Ignoring ESN transform found in IKE SA proposal", buf, 2u);
              }
              goto LABEL_52;
            case 6u:
            case 7u:
            case 8u:
            case 9u:
            case 0xAu:
            case 0xBu:
            case 0xCu:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
              v27 = (NEIKEv2PRFProtocol *)objc_claimAutoreleasedReturnValue();
              v28 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", bswap32(*((unsigned __int16 *)v24 + 3)) >> 16);
              if (!v21)
                v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(v21, "objectForKeyedSubscript:", v27, v55);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29)
              {
                objc_msgSend(v21, "objectForKeyedSubscript:", v27);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "arrayByAddingObject:", v28);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setObject:forKeyedSubscript:", v31, v27);

              }
              else
              {
                v64 = v28;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setObject:forKeyedSubscript:", v30, v27);
              }

              goto LABEL_52;
            default:
              v38 = v60;
              if (!v60)
              {
                v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                v26 = v24[4];
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v26, v55);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = v38;
              objc_msgSend(v38, "addObject:", v39);

              ne_log_obj();
              v27 = (NEIKEv2PRFProtocol *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v27->super, OS_LOG_TYPE_INFO))
              {
                v40 = v24[4];
                *(_DWORD *)buf = 67109120;
                LODWORD(v70[0]) = v40;
                _os_log_impl(&dword_19BD16000, &v27->super, OS_LOG_TYPE_INFO, "Found unsupported transform type %u in IKE SA proposal", buf, 8u);
              }
              goto LABEL_52;
          }

          v14 = v61;
LABEL_52:

          v22 += v25;
        }
        while (v22 + 8 <= v14 && v23++ < v63);
        v15 = v62;
        if (v62)
          v62[8] = v8[4];
        v2 = v57;
        v10 = v58;
        v11 = &off_1E3CBB000;
        if (v21)
        {
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v21);
          objc_msgSend(v62, "setAdditionalKEMProtocols:", v43);

        }
        if (v60)
        {
          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v60);
          if (v62)
            objc_setProperty_atomic(v62, v44, v45, 80);

          v20 = v60;
        }
        else
        {
          v20 = 0;
        }
      }
      -[NSObject addObject:](newValue, "addObject:", v15, v55);
      v46 = v15;
      v47 = *v8;
      v10 -= v14;
      v8 += v14;

      if (v47 != 2)
        goto LABEL_79;
    }
  }
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v70[0] = "-[NEIKEv2IKESAPayload parsePayloadData]";
    _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "BACKTRACE %s called with null (self.payloadData.length >= sizeof(ikev2_proposal_t))", buf, 0xCu);
  }
LABEL_8:
  v5 = 0;
LABEL_80:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rekeyIKESPI, 0);
  objc_storeStrong((id *)&self->_proposals, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("SA(IKE)");
}

@end
