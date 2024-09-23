@implementation CHPatternNetwork

+ (id)rootCursorForContentType:(int)a3 inNetwork:(id)a4 forFirstSegmentGroup:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  void **v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NetworkCursor *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NetworkCursor *v31;
  NetworkCursor *v32;
  unint64_t *begin;
  unint64_t v34;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v7 = (void **)a4;
  v12 = v7;
  if (v7
    && (v13 = v7[4],
        objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v8, v6, v9, v10, v11),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKey_(v13, v15, (uint64_t)v14, v16, v17, v18),
        v19 = (NetworkCursor *)objc_claimAutoreleasedReturnValue(),
        v14,
        v19))
  {
    if ((_DWORD)v6 || !v5)
    {
      v32 = v19;
    }
    else
    {
      objc_msgSend_objectForKey_(v12[3], v20, (uint64_t)&unk_1E7829618, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend_unsignedLongValue(v24, v25, v26, v27, v28, v29);

      v31 = v19;
      objc_opt_self();
      v32 = objc_alloc_init(NetworkCursor);
      begin = v31->_nodeIndexes.__begin_;
      if (v31->_nodeIndexes.__end_ != begin)
      {
        v34 = 0;
        do
        {
          sub_1BE897408(v32, begin[v34++], v31->_stateType);
          begin = v31->_nodeIndexes.__begin_;
        }
        while (v34 < v31->_nodeIndexes.__end_ - begin);
      }
      sub_1BE897408(v32, v30, 0);

    }
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (id)rootCursorForPatternType:(int64_t)a3 inNetwork:(id)a4 forFirstSegmentGroup:(BOOL)a5
{
  _QWORD *v6;
  NetworkCursor *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(NetworkCursor);
    v8 = (void *)v6[3];
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v9, a3, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v8, v14, (uint64_t)v13, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_unsignedLongValue(v18, v19, v20, v21, v22, v23);

    sub_1BE897408(v7, v24, 0);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)newCursorByAdvancingWithString:(id)a3 fromCursor:(id)a4 inNetwork:(id)a5
{
  id v7;
  _QWORD *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  NetworkCursor *v38;
  const char *v39;
  uint64_t v40;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15 = v9;
  v16 = 0;
  if (v8 && v9)
  {
    if (v8[2] != v8[1])
    {
      if (!objc_msgSend_length(v7, v10, v11, v12, v13, v14))
      {
        v16 = v8;
        goto LABEL_9;
      }
      v21 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v7, v17, 0, v18, v19, v20);
      v25 = v22;
      if ((unint64_t)v22 <= 1)
      {
        v26 = v21;
        objc_msgSend_substringWithRange_(v7, v22, v21, (uint64_t)v22, v23, v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringFromIndex_(v7, v28, (uint64_t)&v25[v26], v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend_characterAtIndex_(v27, v33, 0, v34, v35, v36);
        v38 = sub_1BE897A3C((uint64_t)v15, v8, v37);
        v16 = (_QWORD *)objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v39, (uint64_t)v32, (uint64_t)v38, (uint64_t)v15, v40);

        goto LABEL_9;
      }
    }
    v16 = 0;
  }
LABEL_9:

  return v16;
}

+ (id)newCursorByAdvancingWithSymbol:(unint64_t)a3 fromCursor:(id)a4 inNetwork:(id)a5
{
  _QWORD *v7;
  id v8;
  void *v9;
  NetworkCursor *v10;
  NetworkCursor *v11;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    if (v7[2] == v7[1])
    {
LABEL_7:
      v10 = 0;
      goto LABEL_8;
    }
    v11 = sub_1BE897A3C((uint64_t)v8, v7, a3);
    v10 = v11;
    if (!v11 || v11->_nodeIndexes.__end_ == v11->_nodeIndexes.__begin_)
    {

      goto LABEL_7;
    }
  }
LABEL_8:

  return v10;
}

- (CHPatternNetwork)initWithFile:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *network;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  NSDictionary *symbols;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t j;
  uint64_t v116;
  NetworkCursor *v117;
  uint64_t v118;
  void *v119;
  BOOL v120;
  uint64_t v121;
  void *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t *value;
  char *end;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unint64_t v137;
  _BYTE *v138;
  uint64_t *v139;
  int64_t v140;
  unint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  _OWORD *v146;
  char *v147;
  uint64_t v148;
  __int128 v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t k;
  uint64_t v155;
  void *v156;
  BOOL v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  NSDictionary *startCursorForContentTypes;
  id v167;
  id v168;
  void *v169;
  CHPatternNetwork *v170;
  uint64_t v171;
  NSDictionary *v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  id v177;
  void **p_begin;
  id v179;
  void *v180;
  uint64_t v181;
  NetworkCursor *v182;
  id obj;
  void **obja;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  unsigned int v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  objc_super v198;
  _BYTE v199[128];
  _BYTE v200[128];
  char v201[128];
  char __s[1024];
  uint64_t v203;

  v203 = *MEMORY[0x1E0C80C00];
  v198.receiver = self;
  v198.super_class = (Class)CHPatternNetwork;
  v167 = a3;
  v170 = -[CHPatternNetwork init](&v198, sel_init);
  v168 = objc_retainAutorelease(v167);
  v8 = (const char *)objc_msgSend_UTF8String(v168, v3, v4, v5, v6, v7);
  if (pathForResource(v8, 0, (UInt8 *)__s))
  {
    v14 = operator new();
    sub_1BE81B52C(v14, __s, 1);
    v170->_network = (void *)v14;
  }
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12, v13);
  v177 = (id)objc_claimAutoreleasedReturnValue();
  v196 = 0u;
  v197 = 0u;
  v194 = 0u;
  v195 = 0u;
  objc_opt_self();
  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E0C99D80], v15, (uint64_t)&unk_1E78295B8, v16, v17, v18, CFSTR("0x61a649a"), &unk_1E78294B0, CFSTR("0x34f55ec"), &unk_1E7829510, CFSTR("0x7f7446f"), &unk_1E78295E8, CFSTR("0xe6b391a"), &unk_1E78294C8, CFSTR("0x08d4b39"), &unk_1E78294E0, CFSTR("0xbdde29e"), &unk_1E7829480, CFSTR("0x633a6c7"),
    &unk_1E7829498,
    CFSTR("0x346ff32"),
    &unk_1E7829540,
    CFSTR("0xf9be5b7"),
    &unk_1E78294F8,
    CFSTR("0xf9dd946"),
    &unk_1E7829588,
    CFSTR("0x27087b3"),
    &unk_1E7829618,
    CFSTR("0x5fb9dc5"),
    &unk_1E7829630,
    CFSTR("0xcf06682"),
    &unk_1E7829648,
    CFSTR("0xcff9621"),
    0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v19;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v194, (uint64_t)v201, 16, v21);
  if (v26)
  {
    v27 = *(_QWORD *)v195;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v195 != v27)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v194 + 1) + 8 * i);
        objc_msgSend_scannerWithString_(MEMORY[0x1E0CB3900], v22, v29, v23, v24, v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v193 = 0;
        objc_msgSend_scanHexInt_(v30, v31, (uint64_t)&v193, v32, v33, v34);
        objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v35, v193, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E0C99D80], v40, (uint64_t)&unk_1E78295B8, v41, v42, v43, CFSTR("0x61a649a"), &unk_1E78294B0, CFSTR("0x34f55ec"), &unk_1E7829510, CFSTR("0x7f7446f"), &unk_1E78295E8, CFSTR("0xe6b391a"), &unk_1E78294C8, CFSTR("0x08d4b39"), &unk_1E78294E0, CFSTR("0xbdde29e"), &unk_1E7829480, CFSTR("0x633a6c7"),
          &unk_1E7829498,
          CFSTR("0x346ff32"),
          &unk_1E7829540,
          CFSTR("0xf9be5b7"),
          &unk_1E78294F8,
          CFSTR("0xf9dd946"),
          &unk_1E7829588,
          CFSTR("0x27087b3"),
          &unk_1E7829618,
          CFSTR("0x5fb9dc5"),
          &unk_1E7829630,
          CFSTR("0xcf06682"),
          &unk_1E7829648,
          CFSTR("0xcff9621"),
          0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v44, v45, v29, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v177, v50, (uint64_t)v49, (uint64_t)v39, v51, v52);

      }
      v19 = obj;
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v194, (uint64_t)v201, 16, v25);
    }
    while (v26);
  }

  objc_storeStrong((id *)&v170->_symbols, v177);
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v53, v54, v55, v56, v57);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  network = v170->_network;
  v63 = network[10];
  if (network[11] != v63)
  {
    v64 = 0;
    v65 = 0;
    do
    {
      v66 = (_QWORD *)(v63 + v64);
      v67 = v66[2];
      if (v67 == v66[3])
      {
        v68 = v66[1];
        symbols = v170->_symbols;
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v58, v67, v59, v60, v61);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(symbols, v71, (uint64_t)v70, v72, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (v75)
        {
          objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v76, v68, v77, v78, v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v169, v81, (uint64_t)v80, (uint64_t)v75, v82, v83);

        }
        network = v170->_network;
      }
      ++v65;
      v63 = network[10];
      v64 += 72;
    }
    while (v65 < 0x8E38E38E38E38E39 * ((network[11] - v63) >> 3));
  }
  obja = (void **)&v170->_startNodes;
  objc_storeStrong((id *)&v170->_startNodes, v169);
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v84, v85, v86, v87, v88);
  v172 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E0C99D80], v89, (uint64_t)&unk_1E7828070, v90, v91, v92, &unk_1E7829528, &unk_1E7828088, &unk_1E7829558, &unk_1E78280A0, &unk_1E7829570, &unk_1E78280B8, &unk_1E78295A0, &unk_1E78280D0, &unk_1E78295D0, &unk_1E78280E8, &unk_1E7829600, 0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  objc_msgSend_allKeys(v93, v94, v95, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v100, (uint64_t)&v189, (uint64_t)v200, 16, v101);
  if (v106)
  {
    v171 = *(_QWORD *)v190;
    v180 = v93;
    do
    {
      v176 = 0;
      v173 = v106;
      do
      {
        if (*(_QWORD *)v190 != v171)
          objc_enumerationMutation(v99);
        v107 = *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * v176);
        objc_msgSend_objectForKey_(v93, v102, v107, v103, v104, v105);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = v107;
        v182 = objc_alloc_init(NetworkCursor);
        v187 = 0u;
        v188 = 0u;
        v185 = 0u;
        v186 = 0u;
        v179 = v175;
        v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v179, v108, (uint64_t)&v185, (uint64_t)v199, 16, v109);
        if (v114)
        {
          v181 = *(_QWORD *)v186;
          p_begin = (void **)&v182->_nodeIndexes.__begin_;
          if (v182)
          {
            while (1)
            {
              for (j = 0; j != v114; ++j)
              {
                if (*(_QWORD *)v186 != v181)
                  objc_enumerationMutation(v179);
                v118 = *(_QWORD *)(*((_QWORD *)&v185 + 1) + 8 * j);
                objc_msgSend_objectForKey_(*obja, v110, v118, v111, v112, v113);
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                v120 = v119 == 0;

                if (!v120)
                {
                  v121 = v114;
                  v122 = v99;
                  objc_msgSend_objectForKey_(*obja, v110, v118, v111, v112, v113);
                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                  v129 = objc_msgSend_unsignedLongValue(v123, v124, v125, v126, v127, v128);

                  end = (char *)v182->_nodeIndexes.__end_;
                  value = v182->_nodeIndexes.__end_cap_.__value_;
                  if (end >= (char *)value)
                  {
                    v132 = (char *)*p_begin;
                    v133 = end - (_BYTE *)*p_begin;
                    v134 = v133 >> 3;
                    v135 = (v133 >> 3) + 1;
                    if (v135 >> 61)
                      sub_1BE61F930();
                    v136 = (char *)value - v132;
                    if (v136 >> 2 > v135)
                      v135 = v136 >> 2;
                    if ((unint64_t)v136 >= 0x7FFFFFFFFFFFFFF8)
                      v137 = 0x1FFFFFFFFFFFFFFFLL;
                    else
                      v137 = v135;
                    if (v137)
                    {
                      if (v137 >> 61)
                        sub_1BE61F100();
                      v138 = operator new(8 * v137);
                      v139 = (uint64_t *)&v138[8 * v134];
                      *v139 = v129;
                      v116 = (uint64_t)(v139 + 1);
                      v140 = end - v132;
                      if (end != v132)
                      {
LABEL_41:
                        v141 = v140 - 8;
                        v117 = v182;
                        if (v141 < 0x58)
                        {
                          v114 = v121;
                          goto LABEL_49;
                        }
                        v142 = end - v138 - v133;
                        v114 = v121;
                        if (v142 < 0x20)
                          goto LABEL_70;
                        v143 = (v141 >> 3) + 1;
                        v144 = 8 * (v143 & 0x3FFFFFFFFFFFFFFCLL);
                        v145 = &end[-v144];
                        v139 = (uint64_t *)((char *)v139 - v144);
                        v146 = &v138[8 * v134 - 16];
                        v147 = end - 16;
                        v148 = v143 & 0x3FFFFFFFFFFFFFFCLL;
                        do
                        {
                          v149 = *(_OWORD *)v147;
                          *(v146 - 1) = *((_OWORD *)v147 - 1);
                          *v146 = v149;
                          v146 -= 2;
                          v147 -= 32;
                          v148 -= 4;
                        }
                        while (v148);
                        end = v145;
                        if (v143 != (v143 & 0x3FFFFFFFFFFFFFFCLL))
                        {
LABEL_70:
                          do
                          {
LABEL_49:
                            v150 = *((_QWORD *)end - 1);
                            end -= 8;
                            *--v139 = v150;
                          }
                          while (end != v132);
                        }
LABEL_50:
                        v117->_nodeIndexes.__begin_ = (unint64_t *)v139;
                        v117->_nodeIndexes.__end_ = (unint64_t *)v116;
                        v117->_nodeIndexes.__end_cap_.__value_ = (unint64_t *)&v138[8 * v137];
                        if (v132)
                          operator delete(v132);
                        v99 = v122;
LABEL_26:
                        v117->_nodeIndexes.__end_ = (unint64_t *)v116;
                        v93 = v180;
                        continue;
                      }
                    }
                    else
                    {
                      v138 = 0;
                      v139 = (uint64_t *)(8 * v134);
                      *(_QWORD *)(8 * v134) = v129;
                      v116 = 8 * v134 + 8;
                      v140 = end - v132;
                      if (end != v132)
                        goto LABEL_41;
                    }
                    v114 = v121;
                    v117 = v182;
                    goto LABEL_50;
                  }
                  *(_QWORD *)end = v129;
                  v116 = (uint64_t)(end + 8);
                  v117 = v182;
                  goto LABEL_26;
                }
              }
              v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v179, v110, (uint64_t)&v185, (uint64_t)v199, 16, v113);
              if (!v114)
                goto LABEL_54;
            }
          }
          do
          {
            for (k = 0; k != v114; ++k)
            {
              if (*(_QWORD *)v186 != v181)
                objc_enumerationMutation(v179);
              v155 = *(_QWORD *)(*((_QWORD *)&v185 + 1) + 8 * k);
              objc_msgSend_objectForKey_(*obja, v110, v155, v111, v112, v113);
              v156 = (void *)objc_claimAutoreleasedReturnValue();
              v157 = v156 == 0;

              if (!v157)
              {
                objc_msgSend_objectForKey_(*obja, v110, v155, v111, v112, v113);
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_unsignedLongValue(v158, v159, v160, v161, v162, v163);

              }
            }
            v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v179, v110, (uint64_t)&v185, (uint64_t)v199, 16, v113);
          }
          while (v114);
        }
LABEL_54:

        objc_msgSend_setObject_forKey_(v172, v151, (uint64_t)v182, v174, v152, v153);
        ++v176;
      }
      while (v176 != v173);
      v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v102, (uint64_t)&v189, (uint64_t)v200, 16, v105);
      v106 = v164;
    }
    while (v164);
  }

  startCursorForContentTypes = v170->_startCursorForContentTypes;
  v170->_startCursorForContentTypes = v172;

  return v170;
}

+ (BOOL)isString:(id)a3 fullPattern:(int64_t)a4 inNetwork:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a3;
  v8 = a5;
  objc_msgSend_rootCursorForPatternType_inNetwork_forFirstSegmentGroup_(CHPatternNetwork, v9, a4, (uint64_t)v8, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v12, (uint64_t)v7, (uint64_t)v11, (uint64_t)v8, v13);

  LOBYTE(v11) = objc_msgSend_isCompletePattern(v14, v15, v16, v17, v18, v19);
  return (char)v11;
}

- (void)dealloc
{
  void *network;
  uint64_t v4;
  NSDictionary *symbols;
  NSDictionary *startNodes;
  NSDictionary *startCursorForContentTypes;
  objc_super v8;

  network = self->_network;
  if (network)
  {
    v4 = sub_1BE66A0DC((uint64_t)network);
    MEMORY[0x1C3B812EC](v4, 0x10B2C40ACD43ABBLL);
    self->_network = 0;
  }
  symbols = self->_symbols;
  if (symbols)
  {
    self->_symbols = 0;

  }
  startNodes = self->_startNodes;
  if (startNodes)
  {
    self->_startNodes = 0;

  }
  startCursorForContentTypes = self->_startCursorForContentTypes;
  if (startCursorForContentTypes)
  {
    self->_startCursorForContentTypes = 0;

  }
  v8.receiver = self;
  v8.super_class = (Class)CHPatternNetwork;
  -[CHPatternNetwork dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startCursorForContentTypes, 0);
  objc_storeStrong((id *)&self->_startNodes, 0);
  objc_storeStrong((id *)&self->_symbols, 0);
}

@end
