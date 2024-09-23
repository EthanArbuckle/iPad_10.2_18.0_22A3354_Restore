@implementation NEIKEv2ChildSAPayload

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
  id Property;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Payload Type"), v5, a4);

  if (self)
    Property = objc_getProperty(self, v9, 24, 1);
  else
    Property = 0;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("Proposals"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEIKEv2ChildSAPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (BOOL)hasRequiredFields
{
  if (self)
    self = (NEIKEv2ChildSAPayload *)objc_getProperty(self, a2, 24, 1);
  return -[NEIKEv2ChildSAPayload count](self, "count") != 0;
}

- (BOOL)generatePayloadData
{
  NEIKEv2ChildSAPayload *v2;
  const char *v3;
  id Property;
  const char *v6;
  id v7;
  id v8;
  const char *v9;
  unsigned __int8 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  unint64_t v32;
  unsigned int v33;
  unint64_t v34;
  unsigned int v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  id v40;
  id v41;
  const char *v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  unsigned int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint8_t v76;
  void *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t m;
  void *v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  void *v88;
  id v89;
  id v90;
  const char *v91;
  id v92;
  id v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t n;
  void *v101;
  unsigned int v102;
  uint64_t v103;
  const char *v104;
  id v105;
  id v106;
  const char *v107;
  id v108;
  id v109;
  int v110;
  NSObject *v111;
  const char *v112;
  NSObject *v113;
  NEIKEv2ChildSAPayload *v114;
  id v115;
  int v116;
  uint64_t v117;
  id obj;
  unint64_t v119;
  uint64_t v120;
  unsigned __int8 v121;
  _BYTE *selfa;
  void *v123;
  void *v124;
  uint64_t v125;
  id v126;
  id v127;
  void *v128;
  int v129;
  uint64_t v130;
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
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  uint8_t buf[16];
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _BYTE v160[128];
  id v161;
  _BYTE v162[128];
  _BYTE v163[128];
  void *v164;
  _BYTE v165[128];
  _BYTE v166[128];
  id v167;
  _BYTE v168[128];
  id v169;
  _BYTE v170[128];
  uint64_t v171;

  v2 = self;
  v171 = *MEMORY[0x1E0C80C00];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
LABEL_3:
    Property = objc_getProperty(v2, v3, 16, 1);
    return Property != 0;
  }
  if (!-[NEIKEv2ChildSAPayload hasRequiredFields](v2, "hasRequiredFields"))
  {
    ne_log_obj();
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v111, OS_LOG_TYPE_ERROR, "Child SA payload missing required fields", buf, 2u);
    }

    return 0;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (v2)
    v8 = objc_getProperty(v2, v6, 24, 1);
  else
    v8 = 0;
  v10 = objc_msgSend(v8, "count");
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v114 = v2;
  if (v2)
    v11 = objc_getProperty(v2, v9, 24, 1);
  else
    v11 = 0;
  obj = v11;
  v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v170, 16);
  if (!v119)
    goto LABEL_128;
  v121 = 0;
  v12 = 0;
  v115 = v7;
  v116 = v10 - 1;
  v117 = *(_QWORD *)v157;
  v13 = *(_QWORD *)v157;
  while (2)
  {
    if (v13 != v117)
      objc_enumerationMutation(obj);
    v14 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * v12);
    objc_msgSend(v14, "encryptionProtocols", v114);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    selfa = v14;
    if (v14)
      v17 = objc_getProperty(v14, v15, 96, 1);
    else
      v17 = 0;
    v18 = v17;

    if (v18)
    {
      v20 = selfa;
      if (selfa)
        v20 = objc_getProperty(selfa, v19, 96, 1);
      v21 = v20;
      v169 = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v169, 1);
      v22 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v22;
    }
    if (!objc_msgSend(v16, "count"))
    {
      ne_log_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v23, OS_LOG_TYPE_ERROR, "Child SA proposal missing encryption protocol", buf, 2u);
      }
      goto LABEL_135;
    }
    v120 = v12;
    v23 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v152 = 0u;
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v16 = v16;
    v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v152, v168, 16);
    v128 = v16;
    if (!v24)
    {

      LOBYTE(v26) = 0;
      v37 = selfa;
      goto LABEL_45;
    }
    v25 = v24;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = *(_QWORD *)v153;
    for (i = *(_QWORD *)v153; ; i = *(_QWORD *)v153)
    {
      if (i != v29)
        objc_enumerationMutation(v16);
      v31 = *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * v28);
      *(_QWORD *)buf = 0;
      LODWORD(v130) = 0;
      if (!v31)
      {
        LODWORD(v32) = 0;
LABEL_33:
        buf[0] = 3;
        buf[4] = 1;
        *(_WORD *)&buf[6] = bswap32(v32) >> 16;
        *(_WORD *)&buf[2] = 2048;
        -[NSObject appendBytes:length:](v23, "appendBytes:length:", buf, 8);
        ++v26;
        if (!v31)
          goto LABEL_36;
        goto LABEL_34;
      }
      v32 = *(_QWORD *)(v31 + 16);
      if (v32 != 12 && (v32 > 0x1E || ((0x401C0000u >> v32) & 1) == 0))
        goto LABEL_33;
      v33 = (*(_BYTE *)(v31 + 8) & 1) != 0 ? 256 : 128;
      buf[0] = 3;
      buf[4] = 1;
      *(_WORD *)&buf[6] = bswap32(v32) >> 16;
      LOWORD(v130) = 3712;
      WORD1(v130) = __rev16(v33);
      *(_WORD *)&buf[2] = 3072;
      -[NSObject appendBytes:length:](v23, "appendBytes:length:", buf, 8);
      -[NSObject appendBytes:length:](v23, "appendBytes:length:", &v130, 4);
      ++v26;
LABEL_34:
      v34 = *(_QWORD *)(v31 + 16);
      if (v34 <= 0x1F)
      {
        v35 = (0xD01C0000 >> v34) & 1;
        goto LABEL_37;
      }
LABEL_36:
      LOBYTE(v35) = 0;
LABEL_37:
      v16 = v128;
      v27 |= v35;
      if (++v28 < v25)
        continue;
      v36 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v152, v168, 16);
      if (!v36)
        break;
      v25 = v36;
      v28 = 0;
    }

    v37 = selfa;
    if ((v27 & 1) != 0)
      goto LABEL_61;
LABEL_45:
    objc_msgSend(v37, "integrityProtocols");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
      v40 = objc_getProperty(v37, v38, 104, 1);
    else
      v40 = 0;
    v41 = v40;

    if (v41)
    {
      if (v37)
        v43 = objc_getProperty(v37, v42, 104, 1);
      else
        v43 = 0;
      v44 = v43;
      v167 = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v167, 1);
      v45 = objc_claimAutoreleasedReturnValue();

      v39 = (void *)v45;
    }
    if (!objc_msgSend(v39, "count"))
    {
      ne_log_obj();
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v113, OS_LOG_TYPE_ERROR, "Child SA proposal missing integrity protocol", buf, 2u);
      }

LABEL_135:
      return 0;
    }
    v149 = 0u;
    v150 = 0u;
    v147 = 0u;
    v148 = 0u;
    v46 = v39;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v147, v166, 16);
    if (v47)
    {
      v48 = v47;
      v49 = 0;
      v50 = *(_QWORD *)v148;
      for (j = *(_QWORD *)v148; ; j = *(_QWORD *)v148)
      {
        if (j != v50)
          objc_enumerationMutation(v46);
        v52 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * v49);
        *(_QWORD *)buf = 0;
        v53 = objc_msgSend(v52, "type");
        buf[0] = 3;
        buf[4] = 3;
        *(_WORD *)&buf[6] = bswap32(v53) >> 16;
        *(_WORD *)&buf[2] = 2048;
        -[NSObject appendBytes:length:](v23, "appendBytes:length:", buf, 8);
        LOBYTE(v26) = v26 + 1;
        if (++v49 >= v48)
        {
          v54 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v147, v166, 16);
          if (!v54)
            break;
          v48 = v54;
          v49 = 0;
        }
      }
    }

LABEL_61:
    objc_msgSend(v37, "additionalKEMProtocols");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v37);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v37);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v57, "count"))
      {
        v123 = v55;
        v58 = objc_alloc(MEMORY[0x1E0C99E08]);
        -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v37);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)objc_msgSend(v58, "initWithCapacity:", objc_msgSend(v59, "count"));

        v145 = 0u;
        v146 = 0u;
        v143 = 0u;
        v144 = 0u;
        v126 = v57;
        v61 = v57;
        v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v143, v165, 16);
        if (v62)
        {
          v63 = v62;
          v64 = *(_QWORD *)v144;
          do
          {
            for (k = 0; k != v63; ++k)
            {
              if (*(_QWORD *)v144 != v64)
                objc_enumerationMutation(v61);
              v66 = *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * k);
              objc_msgSend(v61, "objectForKeyedSubscript:", v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v164 = v67;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v164, 1);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "setObject:forKeyedSubscript:", v68, v66);

            }
            v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v143, v165, 16);
          }
          while (v63);
        }

        v7 = v115;
        v55 = v123;
        v57 = v126;
      }
      else
      {
        v60 = (void *)MEMORY[0x1E0C9AA70];
      }

      v55 = v60;
      v37 = selfa;
    }
    if (!objc_msgSend(v55, "count"))
      goto LABEL_94;
    objc_msgSend(v55, "allKeys");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "sortedArrayUsingSelector:", sel_compare_);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    v127 = v70;
    v71 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v139, v163, 16);
    if (!v71)
      goto LABEL_93;
    v72 = v71;
    v73 = 0;
    v74 = *(_QWORD *)v140;
    v124 = v55;
    v125 = *(_QWORD *)v140;
    while (2)
    {
      if (v74 != v125)
        objc_enumerationMutation(v127);
      v75 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v73);
      v76 = objc_msgSend(v75, "unsignedCharValue");
      v135 = 0u;
      v136 = 0u;
      v137 = 0u;
      v138 = 0u;
      objc_msgSend(v55, "objectForKeyedSubscript:", v75);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v135, v162, 16);
      if (v78)
      {
        v79 = v78;
        v80 = 0;
        v81 = *(_QWORD *)v136;
        for (m = *(_QWORD *)v136; ; m = *(_QWORD *)v136)
        {
          if (m != v81)
            objc_enumerationMutation(v77);
          v83 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v80);
          *(_QWORD *)buf = 0;
          v84 = objc_msgSend(v83, "method");
          buf[0] = 3;
          buf[4] = v76;
          *(_WORD *)&buf[6] = bswap32(v84) >> 16;
          *(_WORD *)&buf[2] = 2048;
          -[NSObject appendBytes:length:](v23, "appendBytes:length:", buf, 8);
          LOBYTE(v26) = v26 + 1;
          if (++v80 >= v79)
          {
            v85 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v135, v162, 16);
            if (!v85)
            {
              v55 = v124;
              break;
            }
            v79 = v85;
            v80 = 0;
          }
        }
      }

      if (++v73 < v72)
      {
LABEL_91:
        v74 = *(_QWORD *)v140;
        continue;
      }
      break;
    }
    v86 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v139, v163, 16);
    if (v86)
    {
      v72 = v86;
      v73 = 0;
      goto LABEL_91;
    }
    v7 = v115;
    v37 = selfa;
LABEL_93:

LABEL_94:
    objc_msgSend(v37, "kemProtocols");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
      v89 = objc_getProperty(v37, v87, 112, 1);
    else
      v89 = 0;
    v90 = v89;

    if (v90)
    {
      if (v37)
        v92 = objc_getProperty(v37, v91, 112, 1);
      else
        v92 = 0;
      v93 = v92;
      v161 = v93;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v161, 1);
      v94 = objc_claimAutoreleasedReturnValue();

      v88 = (void *)v94;
    }
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v95 = v88;
    v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v131, v160, 16);
    if (v96)
    {
      v97 = v96;
      v98 = 0;
      v99 = *(_QWORD *)v132;
      for (n = *(_QWORD *)v132; ; n = *(_QWORD *)v132)
      {
        if (n != v99)
          objc_enumerationMutation(v95);
        v101 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v98);
        *(_QWORD *)buf = 0;
        v102 = objc_msgSend(v101, "method");
        buf[0] = 3;
        buf[4] = 4;
        *(_WORD *)&buf[6] = bswap32(v102) >> 16;
        *(_WORD *)&buf[2] = 2048;
        -[NSObject appendBytes:length:](v23, "appendBytes:length:", buf, 8);
        LOBYTE(v26) = v26 + 1;
        if (++v98 >= v97)
        {
          v103 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v131, v160, 16);
          if (!v103)
            break;
          v97 = v103;
          v98 = 0;
        }
      }
    }

    *(_QWORD *)buf = 0x508000000;
    -[NSObject appendBytes:length:](v23, "appendBytes:length:", buf, 8);
    v130 = (2 * (v116 > v121));
    v105 = selfa;
    if (selfa)
    {
      BYTE4(v130) = selfa[8];
      BYTE5(v130) = 3;
      v105 = objc_getProperty(selfa, v104, 80, 1);
    }
    else
    {
      WORD2(v130) = 768;
    }
    v106 = v105;

    if (v106)
    {
      v129 = 0;
      v108 = selfa;
      if (selfa)
        v108 = objc_getProperty(selfa, v107, 80, 1);
      v109 = v108;
      v110 = objc_msgSend(v109, "value");

      v129 = v110;
      BYTE6(v130) = 4;
      -[NSObject replaceBytesInRange:withBytes:length:](v23, "replaceBytesInRange:withBytes:length:", 0, 0, &v129, 4);
    }
    else
    {
      BYTE6(v130) = 0;
    }
    HIBYTE(v130) = v26 + 1;
    WORD1(v130) = bswap32(-[NSObject length](v23, "length") + 8) >> 16;
    objc_msgSend(v7, "appendBytes:length:", &v130, 8);
    objc_msgSend(v7, "appendData:", v23);

    v12 = v120 + 1;
    if (v120 + 1 < v119)
    {
LABEL_118:
      ++v121;
      v13 = *(_QWORD *)v157;
      continue;
    }
    break;
  }
  v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v170, 16);
  if (v119)
  {
    v12 = 0;
    goto LABEL_118;
  }
LABEL_128:

  v2 = v114;
  if (v114)
  {
    objc_setProperty_atomic(v114, v112, v7, 16);

    goto LABEL_3;
  }

  Property = 0;
  return Property != 0;
}

- (BOOL)parsePayloadData
{
  const char *v3;
  NSObject *v4;
  const char *v5;
  BOOL v6;
  SEL v7;
  id v8;
  unsigned __int8 *v9;
  const char *v10;
  unsigned int v11;
  __int128 v12;
  unsigned int v13;
  unint64_t v14;
  NEIKEv2ChildSAProposal *v15;
  const char *v16;
  NEIKEv2ESPSPI *v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  const char *v21;
  void *v22;
  NEIKEv2ChildSAProposal *v23;
  int v24;
  id v25;
  uint64_t v26;
  unsigned int v27;
  unsigned __int8 *v28;
  unsigned int v29;
  uint64_t v30;
  NEIKEv2IntegrityProtocol *v31;
  NEIKEv2KEMProtocol *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  NSObject *v43;
  int v44;
  void *v45;
  int v47;
  int v48;
  NSObject *v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  __int128 v54;
  void *v55;
  NEIKEv2ChildSAPayload *selfa;
  NSObject *v57;
  unsigned int v58;
  char v59;
  void *v60;
  NEIKEv2ChildSAProposal *v61;
  unsigned int v62;
  NEIKEv2KEMProtocol *v63;
  NEIKEv2IntegrityProtocol *v64;
  NEIKEv2IntegrityProtocol *v65;
  NEIKEv2IntegrityProtocol *v66;
  uint8_t buf[4];
  _QWORD v68[3];

  *(_QWORD *)((char *)&v68[1] + 4) = *MEMORY[0x1E0C80C00];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v68[0] = "-[NEIKEv2ChildSAPayload parsePayloadData]";
      v5 = "%s called with null self.payloadData";
      goto LABEL_69;
    }
LABEL_7:
    v6 = 0;
    goto LABEL_75;
  }
  if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") <= 7)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v68[0] = "-[NEIKEv2ChildSAPayload parsePayloadData]";
      v5 = "%s called with null (self.payloadData.length >= sizeof(ikev2_proposal_t))";
LABEL_69:
      _os_log_fault_impl(&dword_19BD16000, v4, OS_LOG_TYPE_FAULT, v5, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  selfa = self;
  v8 = objc_getProperty(self, v7, 16, 1);
  v9 = (unsigned __int8 *)objc_msgSend(v8, "bytes");
  v55 = v8;
  v11 = objc_msgSend(v8, "length");
  *(_QWORD *)&v12 = 67109376;
  v54 = v12;
  v57 = v4;
  while (v11 >= 8)
  {
    v13 = bswap32(*((unsigned __int16 *)v9 + 1));
    v14 = HIWORD(v13);
    if (v11 < HIWORD(v13))
    {
      ne_log_obj();
      v49 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
LABEL_73:

        break;
      }
      *(_DWORD *)buf = v54;
      LODWORD(v68[0]) = v11;
      WORD2(v68[0]) = 1024;
      *(_DWORD *)((char *)v68 + 6) = v14;
      v50 = "Not enough bytes remaining (%u) to process proposal length %u";
      v51 = v49;
      v52 = 14;
LABEL_77:
      _os_log_error_impl(&dword_19BD16000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);
      goto LABEL_73;
    }
    if ((unint64_t)v9[6] + 8 > v14)
    {
      ne_log_obj();
      v49 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        goto LABEL_73;
      *(_DWORD *)buf = 67109120;
      LODWORD(v68[0]) = v14;
      v50 = "Proposal length %u is too short";
      v51 = v49;
      v52 = 8;
      goto LABEL_77;
    }
    v62 = v9[7];
    v15 = objc_alloc_init(NEIKEv2ChildSAProposal);
    if (v9[6] == 4)
    {
      v17 = -[NEIKEv2ESPSPI initWithValue:]([NEIKEv2ESPSPI alloc], "initWithValue:", *((unsigned int *)v9 + 2));
      if (v15)
        objc_setProperty_atomic(v15, v16, v17, 80);
    }
    else
    {
      ne_log_obj();
      v17 = (NEIKEv2ESPSPI *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v17->super.super, OS_LOG_TYPE_ERROR))
      {
        v47 = v9[4];
        v48 = v9[6];
        *(_DWORD *)buf = v54;
        LODWORD(v68[0]) = v47;
        WORD2(v68[0]) = 1024;
        *(_DWORD *)((char *)v68 + 6) = v48;
        _os_log_error_impl(&dword_19BD16000, &v17->super.super, OS_LOG_TYPE_ERROR, "SA proposal %u has wrong length %u", buf, 0xEu);
      }
    }
    v58 = v11;

    v18 = v9[6];
    v19 = v18 + 16 > v14 || v62 == 0;
    v61 = v15;
    if (v19)
    {
      v60 = 0;
      v59 = 0;
      v25 = 0;
    }
    else
    {
      v25 = 0;
      v59 = 0;
      v60 = 0;
      v26 = v18 + 8;
      v27 = 1;
      do
      {
        v28 = &v9[v26];
        v29 = bswap32(*(unsigned __int16 *)&v9[v26 + 2]) >> 16;
        v30 = v9[v26 + 4];
        switch(v9[v26 + 4])
        {
          case 1u:
            v36 = v29 >= 0xC && *((_WORD *)v28 + 4) == 3712 && *((_WORD *)v28 + 5) == 1;
            v31 = (NEIKEv2IntegrityProtocol *)-[NEIKEv2EncryptionProtocol initWithEncryptionWireType:is256Bit:]([NEIKEv2EncryptionProtocol alloc], bswap32(*((unsigned __int16 *)v28 + 3)) >> 16, v36);
            -[NEIKEv2ChildSAProposal encryptionProtocols](v15, "encryptionProtocols");
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            if (v45)
            {
              -[NEIKEv2ChildSAProposal encryptionProtocols](v15, "encryptionProtocols");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "arrayByAddingObject:", v31);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[NEIKEv2ChildSAProposal setEncryptionProtocols:](v15, "setEncryptionProtocols:", v39);
              goto LABEL_56;
            }
            v66 = v31;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[NEIKEv2ChildSAProposal setEncryptionProtocols:](v15, "setEncryptionProtocols:", v38);
            break;
          case 3u:
            v31 = -[NEIKEv2IntegrityProtocol initWithType:]([NEIKEv2IntegrityProtocol alloc], "initWithType:", bswap32(*((unsigned __int16 *)v28 + 3)) >> 16);
            -[NEIKEv2ChildSAProposal integrityProtocols](v15, "integrityProtocols");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              -[NEIKEv2ChildSAProposal integrityProtocols](v15, "integrityProtocols");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "arrayByAddingObject:", v31);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[NEIKEv2ChildSAProposal setIntegrityProtocols:](v15, "setIntegrityProtocols:", v39);
              goto LABEL_56;
            }
            v65 = v31;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[NEIKEv2ChildSAProposal setIntegrityProtocols:](v15, "setIntegrityProtocols:", v38);
            break;
          case 4u:
            v31 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", bswap32(*((unsigned __int16 *)v28 + 3)) >> 16);
            -[NEIKEv2ChildSAProposal kemProtocols](v15, "kemProtocols");
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (v40)
            {
              -[NEIKEv2ChildSAProposal kemProtocols](v15, "kemProtocols");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "arrayByAddingObject:", v31);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[NEIKEv2ChildSAProposal setKemProtocols:](v15, "setKemProtocols:", v39);
LABEL_56:

            }
            else
            {
              v64 = v31;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[NEIKEv2ChildSAProposal setKemProtocols:](v15, "setKemProtocols:", v38);
            }
            break;
          case 5u:
            v59 |= *((_WORD *)v28 + 3) == 0;
            goto LABEL_59;
          case 6u:
          case 7u:
          case 8u:
          case 9u:
          case 0xAu:
          case 0xBu:
          case 0xCu:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
            v31 = (NEIKEv2IntegrityProtocol *)objc_claimAutoreleasedReturnValue();
            v32 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", bswap32(*((unsigned __int16 *)v28 + 3)) >> 16);
            if (!v25)
              v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v25, "objectForKeyedSubscript:", v31, v54);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              objc_msgSend(v25, "objectForKeyedSubscript:", v31);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "arrayByAddingObject:", v32);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v35, v31);

              v15 = v61;
            }
            else
            {
              v63 = v32;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v34, v31);
            }

            goto LABEL_58;
          default:
            v41 = v60;
            if (!v60)
            {
              v41 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              v30 = v28[4];
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v30, v54);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = v41;
            objc_msgSend(v41, "addObject:", v42);

            ne_log_obj();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              v44 = v28[4];
              *(_DWORD *)buf = 67109120;
              LODWORD(v68[0]) = v44;
              _os_log_impl(&dword_19BD16000, v43, OS_LOG_TYPE_INFO, "Found unsupported transform type %u in Child SA proposal", buf, 8u);
            }

            v15 = v61;
            goto LABEL_59;
        }

LABEL_58:
LABEL_59:
        v26 += v29;
      }
      while (v26 + 8 <= v14 && v27++ < v62);
    }
    if (v15)
    {
      v15->_proposalNumber = v9[4];
      v15->_noESNTransformPresent = v59 & 1;
    }
    v4 = v57;
    if (v25)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v25);
      -[NEIKEv2ChildSAProposal setAdditionalKEMProtocols:](v61, "setAdditionalKEMProtocols:", v20);

      v15 = v61;
    }
    if (v60)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v60);
      if (v15)
        objc_setProperty_atomic(v15, v21, v22, 72);

    }
    -[NSObject addObject:](v57, "addObject:", v15, v54);
    v23 = v15;
    v24 = *v9;
    v11 = v58 - v14;
    v9 += v14;

    if (v24 != 2)
      break;
  }
  objc_setProperty_atomic(selfa, v10, v4, 24);
  v6 = -[NEIKEv2ChildSAPayload hasRequiredFields](selfa, "hasRequiredFields");

LABEL_75:
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposals, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("SA(CHILD)");
}

@end
