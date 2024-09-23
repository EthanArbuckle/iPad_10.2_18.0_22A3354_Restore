@implementation CHStrokeClutterFilter

- (CHStrokeClutterFilter)init
{
  CHStrokeClutterFilter *v2;
  uint64_t v3;
  NSDictionary *v4;
  NSDictionary *CHStrokeID2HeatmapItemID;
  NSDictionary *v6;
  NSDictionary *heatmapItemID2CHStrokeID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CHStrokeClutterFilter;
  v2 = -[CHStrokeClutterFilter init](&v9, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_OWORD *)(v3 + 8) = 0u;
    *(_OWORD *)(v3 + 24) = 0u;
    *(_OWORD *)(v3 + 48) = 0u;
    *(_DWORD *)(v3 + 40) = 1065353216;
    *(_OWORD *)(v3 + 64) = 0u;
    *(_DWORD *)(v3 + 80) = 1065353216;
    *(_OWORD *)(v3 + 88) = 0u;
    *(_OWORD *)(v3 + 104) = 0u;
    *(_DWORD *)(v3 + 120) = 1065353216;
    *(_OWORD *)(v3 + 128) = 0u;
    *(_OWORD *)(v3 + 144) = 0u;
    *(_QWORD *)(v3 + 160) = 0;
    *(_DWORD *)(v3 + 168) = 1065353216;
    CHCanvasHeatmap::cleanCanvasHeatmap((CHCanvasHeatmap *)v3);
    v2->_heatMap = (void *)v3;
    v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    CHStrokeID2HeatmapItemID = v2->_CHStrokeID2HeatmapItemID;
    v2->_CHStrokeID2HeatmapItemID = v4;

    v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    heatmapItemID2CHStrokeID = v2->_heatmapItemID2CHStrokeID;
    v2->_heatmapItemID2CHStrokeID = v6;

  }
  return v2;
}

- (void)dealloc
{
  _QWORD *heatMap;
  _QWORD *v4;
  objc_super v5;

  heatMap = self->_heatMap;
  if (heatMap)
  {
    v4 = sub_1BE758894(heatMap);
    MEMORY[0x1C3B812EC](v4, 0x10A0C402E9B2A30);
  }
  v5.receiver = self;
  v5.super_class = (Class)CHStrokeClutterFilter;
  -[CHStrokeClutterFilter dealloc](&v5, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v7;

  v7 = (_QWORD *)objc_msgSend_allocWithZone_(CHStrokeClutterFilter, a2, (uint64_t)a3, v3, v4, v5);
  return sub_1BE756FD0(v7, (const CHCanvasHeatmap *)self->_heatMap, self->_CHStrokeID2HeatmapItemID, self->_heatmapItemID2CHStrokeID);
}

- (id)clutterFilterByAddingStrokes:(id)a3 removingStrokeIdentifiers:(id)a4 affectedStrokeIdentifiers:(id *)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t i;
  void *v96;
  unint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  const void *v119;
  uint64_t v120;
  unint64_t v121;
  uint8x8_t v122;
  _QWORD *v123;
  _QWORD *v124;
  unint64_t v125;
  uint64_t v126;
  _QWORD *v127;
  int64_t v128;
  char *v129;
  char *v130;
  float v131;
  void **v132;
  void **v133;
  _BOOL8 v134;
  unint64_t v135;
  unint64_t v136;
  size_t prime;
  void *v138;
  void *v139;
  uint64_t v140;
  _QWORD **v141;
  size_t v142;
  size_t v143;
  size_t v144;
  _QWORD *j;
  size_t v146;
  uint64_t v147;
  unint64_t v148;
  uint8x8_t v149;
  uint64_t v150;
  _QWORD *v151;
  void *v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  size_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  NSObject *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  NSObject *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  _QWORD *v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  NSObject *v218;
  _QWORD *v219;
  _QWORD *v220;
  _QWORD *v221;
  _QWORD *v222;
  void *v223;
  _QWORD *v224;
  void *v225;
  _QWORD *v226;
  _QWORD *v227;
  void *v228;
  _QWORD *v230;
  void *v231;
  id v232;
  id v233;
  id v235;
  id obj;
  uint64_t v237;
  CHCanvasHeatmap *v238;
  void *v239;
  void *v240;
  void *v241[2];
  void *v242;
  uint64_t v243;
  _QWORD v244[5];
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  void *__p[2];
  void *v250[2];
  float v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  void *v256[2];
  void *v257[2];
  int v258;
  _BYTE buf[24];
  __n128 (*v260)(__n128 *, __n128 *);
  __int128 v261;
  void *v262;
  void *v263;
  uint64_t v264;
  _BYTE v265[128];
  _BYTE v266[128];
  uint64_t v267;

  v267 = *MEMORY[0x1E0C80C00];
  v232 = a3;
  v233 = a4;
  v240 = (void *)objc_msgSend_mutableCopy(self->_CHStrokeID2HeatmapItemID, v7, v8, v9, v10, v11);
  v239 = (void *)objc_msgSend_mutableCopy(self->_heatmapItemID2CHStrokeID, v12, v13, v14, v15, v16);
  v238 = (CHCanvasHeatmap *)operator new();
  CHCanvasHeatmap::CHCanvasHeatmap(v238, (const CHCanvasHeatmap *)self->_heatMap);
  *(_OWORD *)v256 = 0u;
  *(_OWORD *)v257 = 0u;
  v258 = 1065353216;
  v252 = 0u;
  v253 = 0u;
  v254 = 0u;
  v255 = 0u;
  obj = v233;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v252, (uint64_t)v266, 16, v18);
  if (v23)
  {
    v24 = *(_QWORD *)v253;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v253 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v252 + 1) + 8 * v25);
        objc_msgSend_objectForKey_(v240, v19, v26, v20, v21, v22, v232);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v33 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v26;
            _os_log_impl(&dword_1BE607000, v33, OS_LOG_TYPE_FAULT, "found an unknown stroke ID %@ to be removed in clutter filtering", buf, 0xCu);
          }

        }
        __p[0] = 0;
        __p[0] = (void *)objc_msgSend_unsignedLongValue(v32, v27, v28, v29, v30, v31);
        if (objc_msgSend_count(v240, v34, v35, v36, v37, v38)
          && (objc_msgSend_allKeys(v240, v39, v40, v41, v42, v43),
              v44 = (void *)objc_claimAutoreleasedReturnValue(),
              v49 = objc_msgSend_containsObject_(v44, v45, v26, v46, v47, v48),
              v44,
              v49))
        {
          objc_msgSend_removeObjectForKey_(v240, v50, v26, v51, v52, v53);
        }
        else
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v59 = (id)qword_1EF568E40;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            v65 = objc_msgSend_count(v240, v60, v61, v62, v63, v64);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v65;
            _os_log_impl(&dword_1BE607000, v59, OS_LOG_TYPE_ERROR, "removedStrokeID %@ doesn't exist in mutableCHStrokeID2HeatmapItemID with %lu entry", buf, 0x16u);
          }

        }
        if (objc_msgSend_count(v239, v54, v55, v56, v57, v58)
          && (objc_msgSend_allKeys(v239, v66, v67, v68, v69, v70),
              v71 = (void *)objc_claimAutoreleasedReturnValue(),
              v76 = objc_msgSend_containsObject_(v71, v72, (uint64_t)v32, v73, v74, v75),
              v71,
              v76))
        {
          objc_msgSend_removeObjectForKey_(v239, v77, (uint64_t)v32, v78, v79, v80);
        }
        else
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v81 = (id)qword_1EF568E40;
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            v87 = objc_msgSend_count(v240, v82, v83, v84, v85, v86);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v32;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v87;
            _os_log_impl(&dword_1BE607000, v81, OS_LOG_TYPE_ERROR, "removedHeatmapItemNSNumberID %@ doesn't exist in mutableHeatmapItemID2CHStrokeID with %lu entry", buf, 0x16u);
          }

        }
        sub_1BE7589BC((uint64_t)v256, (unint64_t *)__p, __p);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v252, (uint64_t)v266, 16, v22);
    }
    while (v23);
  }

  *(_OWORD *)__p = 0u;
  *(_OWORD *)v250 = 0u;
  v251 = 1.0;
  v245 = 0u;
  v246 = 0u;
  v247 = 0u;
  v248 = 0u;
  v235 = v232;
  v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v88, (uint64_t)&v245, (uint64_t)v265, 16, v89);
  if (v94)
  {
    v237 = *(_QWORD *)v246;
    do
    {
      for (i = 0; i != v94; ++i)
      {
        if (*(_QWORD *)v246 != v237)
          objc_enumerationMutation(v235);
        v96 = *(void **)(*((_QWORD *)&v245 + 1) + 8 * i);
        v97 = *((_QWORD *)v238 + 16);
        *((_QWORD *)v238 + 16) = v97 + 1;
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v90, v97, v91, v92, v93, v232);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_encodedStrokeIdentifier(v96, v99, v100, v101, v102, v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v240, v105, (uint64_t)v98, (uint64_t)v104, v106, v107);

        objc_msgSend_encodedStrokeIdentifier(v96, v108, v109, v110, v111, v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v239, v114, (uint64_t)v113, (uint64_t)v98, v115, v116);

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x4812000000;
        v260 = sub_1BE7581BC;
        *(_QWORD *)&v261 = sub_1BE7581E0;
        *((_QWORD *)&v261 + 1) = &unk_1BE94989A;
        v263 = 0;
        v264 = 0;
        v262 = 0;
        v117 = (void *)objc_opt_class();
        v244[0] = MEMORY[0x1E0C809B0];
        v244[1] = 3221225472;
        v244[2] = sub_1BE7581F8;
        v244[3] = &unk_1E77F2B80;
        v244[4] = buf;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v117, v118, (uint64_t)v96, 1, 1, (uint64_t)v244);
        v119 = *(const void **)(*(_QWORD *)&buf[8] + 48);
        v120 = *(_QWORD *)(*(_QWORD *)&buf[8] + 56);
        v121 = (unint64_t)__p[1];
        if (__p[1])
        {
          v122 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
          v122.i16[0] = vaddlv_u8(v122);
          if (v122.u32[0] > 1uLL)
          {
            v23 = v97;
            if (__p[1] <= (void *)v97)
              v23 = v97 % (unint64_t)__p[1];
          }
          else
          {
            v23 = ((unint64_t)__p[1] - 1) & v97;
          }
          v123 = (_QWORD *)*((_QWORD *)__p[0] + v23);
          if (v123)
          {
            v124 = (_QWORD *)*v123;
            if (v124)
            {
              if (v122.u32[0] < 2uLL)
              {
                while (1)
                {
                  v126 = v124[1];
                  if (v126 == v97)
                  {
                    if (v124[2] == v97)
                      goto LABEL_130;
                  }
                  else if ((v126 & ((uint64_t)__p[1] - 1)) != v23)
                  {
                    goto LABEL_55;
                  }
                  v124 = (_QWORD *)*v124;
                  if (!v124)
                    goto LABEL_55;
                }
              }
              do
              {
                v125 = v124[1];
                if (v125 == v97)
                {
                  if (v124[2] == v97)
                    goto LABEL_130;
                }
                else
                {
                  if ((void *)v125 >= __p[1])
                    v125 %= (unint64_t)__p[1];
                  if (v125 != v23)
                    break;
                }
                v124 = (_QWORD *)*v124;
              }
              while (v124);
            }
          }
        }
LABEL_55:
        v127 = operator new(0x30uLL);
        v241[0] = v127;
        v241[1] = v250;
        LOBYTE(v242) = 0;
        *v127 = 0;
        v127[1] = v97;
        v127[2] = v97;
        v127[3] = 0;
        v127[4] = 0;
        v127[5] = 0;
        v128 = v120 - (_QWORD)v119;
        if (v128)
        {
          if (v128 < 0)
            sub_1BE61F930();
          v129 = (char *)operator new(v128);
          v127[3] = v129;
          v130 = &v129[16 * (v128 >> 4)];
          v127[5] = v130;
          memcpy(v129, v119, v128);
          v127[4] = v130;
        }
        LOBYTE(v242) = 1;
        v131 = (float)((unint64_t)v250[1] + 1);
        if (!v121 || (float)(v251 * (float)v121) < v131)
        {
          v134 = (v121 & (v121 - 1)) != 0;
          if (v121 < 3)
            v134 = 1;
          v135 = v134 | (2 * v121);
          v136 = vcvtps_u32_f32(v131 / v251);
          if (v135 <= v136)
            prime = v136;
          else
            prime = v135;
          if (prime == 1)
          {
            prime = 2;
          }
          else if ((prime & (prime - 1)) != 0)
          {
            prime = std::__next_prime(prime);
            v121 = (unint64_t)__p[1];
          }
          if (prime <= v121)
          {
            if (prime >= v121)
              goto LABEL_108;
            v148 = vcvtps_u32_f32((float)(unint64_t)v250[1] / v251);
            if (v121 < 3
              || (v149 = (uint8x8_t)vcnt_s8((int8x8_t)v121), v149.i16[0] = vaddlv_u8(v149), v149.u32[0] > 1uLL))
            {
              v148 = std::__next_prime(v148);
            }
            else
            {
              v150 = 1 << -(char)__clz(v148 - 1);
              if (v148 >= 2)
                v148 = v150;
            }
            if (prime <= v148)
              prime = v148;
            if (prime >= v121)
            {
              v121 = (unint64_t)__p[1];
              v153 = (uint64_t)__p[1] - 1;
              if (((unint64_t)__p[1] & ((unint64_t)__p[1] - 1)) != 0)
                goto LABEL_121;
            }
            else
            {
              if (prime)
                goto LABEL_72;
              v152 = __p[0];
              __p[0] = 0;
              if (v152)
                operator delete(v152);
              v121 = 0;
              __p[1] = 0;
              v153 = -1;
            }
LABEL_109:
            v23 = v153 & v97;
            v132 = (void **)*((_QWORD *)__p[0] + (v153 & v97));
            v133 = (void **)v241[0];
            if (v132)
              goto LABEL_61;
            goto LABEL_110;
          }
LABEL_72:
          if (prime >> 61)
            sub_1BE61F100();
          v138 = operator new(8 * prime);
          v139 = __p[0];
          __p[0] = v138;
          if (v139)
            operator delete(v139);
          v140 = 0;
          __p[1] = (void *)prime;
          do
            *((_QWORD *)__p[0] + v140++) = 0;
          while (prime != v140);
          v141 = (_QWORD **)v250[0];
          if (!v250[0])
          {
LABEL_120:
            v121 = prime;
            v153 = prime - 1;
            if ((prime & (prime - 1)) == 0)
              goto LABEL_109;
            goto LABEL_121;
          }
          v142 = *((_QWORD *)v250[0] + 1);
          v143 = prime - 1;
          if ((prime & (prime - 1)) == 0)
          {
            v144 = v142 & v143;
            *((_QWORD *)__p[0] + v144) = v250;
            for (j = *v141; *v141; j = *v141)
            {
              v146 = j[1] & v143;
              if (v146 == v144)
              {
                v141 = (_QWORD **)j;
              }
              else if (*((_QWORD *)__p[0] + v146))
              {
                *v141 = (_QWORD *)*j;
                v147 = 8 * v146;
                *j = **(_QWORD **)((char *)__p[0] + v147);
                **(_QWORD **)((char *)__p[0] + v147) = j;
              }
              else
              {
                *((_QWORD *)__p[0] + v146) = v141;
                v141 = (_QWORD **)j;
                v144 = v146;
              }
            }
            goto LABEL_120;
          }
          if (v142 < prime)
          {
            *((_QWORD *)__p[0] + v142) = v250;
            v151 = *v141;
            if (*v141)
              goto LABEL_115;
LABEL_107:
            v121 = prime;
LABEL_108:
            v153 = v121 - 1;
            if ((v121 & (v121 - 1)) == 0)
              goto LABEL_109;
LABEL_121:
            if (v121 <= v97)
            {
              v23 = v97 % v121;
              v132 = (void **)*((_QWORD *)__p[0] + v97 % v121);
              v133 = (void **)v241[0];
              if (v132)
                goto LABEL_61;
            }
            else
            {
              v23 = v97;
              v132 = (void **)*((_QWORD *)__p[0] + v97);
              v133 = (void **)v241[0];
              if (v132)
                goto LABEL_61;
            }
LABEL_110:
            *v133 = v250[0];
            v250[0] = v241[0];
            *((_QWORD *)__p[0] + v23) = v250;
            if (*(_QWORD *)v241[0])
            {
              v154 = *(_QWORD *)(*(_QWORD *)v241[0] + 8);
              if ((v121 & (v121 - 1)) != 0)
              {
                if (v154 >= v121)
                  v154 %= v121;
              }
              else
              {
                v154 &= v121 - 1;
              }
              *((void **)__p[0] + v154) = v241[0];
            }
            goto LABEL_129;
          }
          v142 %= prime;
          *((_QWORD *)__p[0] + v142) = v250;
          v151 = *v141;
          if (!*v141)
            goto LABEL_107;
          while (1)
          {
LABEL_115:
            v156 = v151[1];
            if (v156 >= prime)
              v156 %= prime;
            if (v156 == v142)
              goto LABEL_114;
            if (*((_QWORD *)__p[0] + v156))
              break;
            *((_QWORD *)__p[0] + v156) = v141;
            v141 = (_QWORD **)v151;
            v151 = (_QWORD *)*v151;
            v142 = v156;
            if (!v151)
              goto LABEL_120;
          }
          *v141 = (_QWORD *)*v151;
          v155 = 8 * v156;
          *v151 = **(_QWORD **)((char *)__p[0] + v155);
          **(_QWORD **)((char *)__p[0] + v155) = v151;
          v151 = v141;
LABEL_114:
          v141 = (_QWORD **)v151;
          v151 = (_QWORD *)*v151;
          if (!v151)
            goto LABEL_120;
          goto LABEL_115;
        }
        v132 = (void **)*((_QWORD *)__p[0] + v23);
        v133 = (void **)v241[0];
        if (!v132)
          goto LABEL_110;
LABEL_61:
        *v133 = *v132;
        *v132 = v241[0];
LABEL_129:
        ++v250[1];
LABEL_130:
        _Block_object_dispose(buf, 8);
        if (v262)
        {
          v263 = v262;
          operator delete(v262);
        }

      }
      v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v90, (uint64_t)&v245, (uint64_t)v265, 16, v93);
    }
    while (v94);
  }

  v162 = objc_msgSend_count(v240, v157, v158, v159, v160, v161);
  if (v162 != objc_msgSend_count(v239, v163, v164, v165, v166, v167))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v168 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v168, OS_LOG_TYPE_FAULT))
    {
      v174 = objc_msgSend_count(v240, v169, v170, v171, v172, v173);
      v180 = objc_msgSend_count(v239, v175, v176, v177, v178, v179);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v174;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v180;
      _os_log_impl(&dword_1BE607000, v168, OS_LOG_TYPE_FAULT, "clutter filter inconsistent status: %lu <==> %lu", buf, 0x16u);
    }

  }
  sub_1BE81C510((int8x8_t *)v238, __p, (uint64_t)v256, (uint64_t)v241);
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v181 = (id)qword_1EF568E40;
  if (os_log_type_enabled(v181, OS_LOG_TYPE_DEBUG))
  {
    v187 = *((_QWORD *)v238 + 9);
    v188 = v243;
    v189 = objc_msgSend_count(v235, v182, v183, v184, v185, v186);
    v195 = objc_msgSend_count(obj, v190, v191, v192, v193, v194);
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)&buf[4] = v187;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v188;
    *(_WORD *)&buf[22] = 2048;
    v260 = (__n128 (*)(__n128 *, __n128 *))v189;
    LOWORD(v261) = 2048;
    *(_QWORD *)((char *)&v261 + 2) = v195;
    _os_log_impl(&dword_1BE607000, v181, OS_LOG_TYPE_DEBUG, "clutter strokes: %lu, affected strokes: %lu, added strokes: %lu, removed strokes: %lu", buf, 0x2Au);
  }

  if (a5)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v196, v197, v198, v199, v200);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = v242;
    if (v242)
    {
      do
      {
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v201, v207[2], v203, v204, v205, v232);
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v239, v209, (uint64_t)v208, v210, v211, v212);
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v217)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v218 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v218, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v208;
            _os_log_impl(&dword_1BE607000, v218, OS_LOG_TYPE_FAULT, "Cannot find corresponding stroke ID given the item ID: %@", buf, 0xCu);
          }

        }
        objc_msgSend_addObject_(v206, v213, (uint64_t)v217, v214, v215, v216);

        v207 = (_QWORD *)*v207;
      }
      while (v207);
    }
    *a5 = (id)objc_msgSend_copy(v206, v201, v202, v203, v204, v205, v232);

  }
  v219 = sub_1BE756FD0([CHStrokeClutterFilter alloc], v238, v240, v239);
  v220 = sub_1BE758894(v238);
  MEMORY[0x1C3B812EC](v220, 0x10A0C402E9B2A30);
  v221 = v242;
  if (v242)
  {
    do
    {
      v222 = (_QWORD *)*v221;
      operator delete(v221);
      v221 = v222;
    }
    while (v222);
  }
  v223 = v241[0];
  v241[0] = 0;
  if (v223)
    operator delete(v223);
  v224 = v250[0];
  if (v250[0])
  {
    do
    {
      v230 = (_QWORD *)*v224;
      v231 = (void *)v224[3];
      if (v231)
      {
        v224[4] = v231;
        operator delete(v231);
      }
      operator delete(v224);
      v224 = v230;
    }
    while (v230);
  }
  v225 = __p[0];
  __p[0] = 0;
  if (v225)
    operator delete(v225);
  v226 = v257[0];
  if (v257[0])
  {
    do
    {
      v227 = (_QWORD *)*v226;
      operator delete(v226);
      v226 = v227;
    }
    while (v227);
  }
  v228 = v256[0];
  v256[0] = 0;
  if (v228)
    operator delete(v228);

  return v219;
}

- (BOOL)isHighDensityStroke:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  int8x8_t *heatMap;
  int8x8_t v16;
  uint8x8_t v17;
  unint64_t v18;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  BOOL v24;

  objc_msgSend_objectForKey_(self->_CHStrokeID2HeatmapItemID, a2, (uint64_t)a3, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  if (v7)
  {
    v14 = objc_msgSend_unsignedLongValue(v7, v8, v9, v10, v11, v12);
    heatMap = (int8x8_t *)self->_heatMap;
    v16 = heatMap[7];
    if (v16)
    {
      v17 = (uint8x8_t)vcnt_s8(v16);
      v17.i16[0] = vaddlv_u8(v17);
      if (v17.u32[0] > 1uLL)
      {
        v18 = v14;
        if (*(_QWORD *)&v16 <= v14)
          v18 = v14 % *(_QWORD *)&v16;
      }
      else
      {
        v18 = (*(_QWORD *)&v16 - 1) & v14;
      }
      v20 = *(_QWORD **)(*(_QWORD *)&heatMap[6] + 8 * v18);
      if (v20)
      {
        v20 = (_QWORD *)*v20;
        if (v20)
        {
          if (v17.u32[0] < 2uLL)
          {
            v21 = *(_QWORD *)&v16 - 1;
            while (1)
            {
              v23 = v20[1];
              if (v23 == v14)
              {
                if (v20[2] == v14)
                  goto LABEL_24;
              }
              else if ((v23 & v21) != v18)
              {
                goto LABEL_23;
              }
              v20 = (_QWORD *)*v20;
              if (!v20)
                goto LABEL_24;
            }
          }
          do
          {
            v22 = v20[1];
            if (v22 == v14)
            {
              if (v20[2] == v14)
                break;
            }
            else
            {
              if (v22 >= *(_QWORD *)&v16)
                v22 %= *(_QWORD *)&v16;
              if (v22 != v18)
                goto LABEL_23;
            }
            v20 = (_QWORD *)*v20;
          }
          while (v20);
        }
      }
    }
    else
    {
LABEL_23:
      v20 = 0;
    }
LABEL_24:
    v24 = v20 != 0;

    return v24;
  }
  else
  {

    return 0;
  }
}

- (int64_t)highDensityStrokeCount
{
  return *((_QWORD *)self->_heatMap + 9);
}

- (BOOL)isEmpty
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend_count(self->_CHStrokeID2HeatmapItemID, a2, v2, v3, v4, v5) == 0;
}

- (id)strokeIDsWithinRectangleRegion:(CGRect *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unint64_t *heatMap;
  _QWORD *v39;
  CGRect *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  _QWORD *i;
  _QWORD *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  _QWORD *v59;
  _QWORD *v60;
  void *v61;
  __int128 v63;
  uint8_t v64[4];
  void *v65;
  uint8_t buf[32];
  int v67;
  uint64_t v68;
  CGRect v69;
  CGRect v70;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend_count(self->_CHStrokeID2HeatmapItemID, a2, (uint64_t)a3, v3, v4, v5);
  if (v8 != objc_msgSend_count(self->_heatmapItemID2CHStrokeID, v9, v10, v11, v12, v13))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v19 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v25 = objc_msgSend_count(self->_CHStrokeID2HeatmapItemID, v20, v21, v22, v23, v24);
      v31 = objc_msgSend_count(self->_heatmapItemID2CHStrokeID, v26, v27, v28, v29, v30);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v31;
      _os_log_impl(&dword_1BE607000, v19, OS_LOG_TYPE_FAULT, "calling strokeIDsWithinRegionOfInterest() while clutter filter being in inconsistent status: %lu <==> %lu", buf, 0x16u);
    }

  }
  objc_msgSend_set(MEMORY[0x1E0C99E20], v14, v15, v16, v17, v18);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_heatMap && objc_msgSend_count(self->_CHStrokeID2HeatmapItemID, v32, v33, v34, v35, v36))
  {
    heatMap = (unint64_t *)self->_heatMap;
    memset(buf, 0, sizeof(buf));
    v67 = 1065353216;
    v39 = (_QWORD *)heatMap[13];
    if (v39)
    {
      v40 = (CGRect *)MEMORY[0x1E0C9D648];
      do
      {
        v69.origin.x = (double)(uint64_t)(*heatMap * v39[2]);
        v69.origin.y = (double)(uint64_t)(*heatMap * v39[3]);
        v69.size.width = (double)*heatMap;
        v69.size.height = v69.size.width;
        v70 = CGRectIntersection(v69, *a3);
        if (!CGRectEqualToRect(v70, *v40))
        {
          for (i = (_QWORD *)v39[6]; i; i = (_QWORD *)*i)
            sub_1BE7589BC((uint64_t)buf, i + 2, i + 2);
        }
        v39 = (_QWORD *)*v39;
      }
      while (v39);
      v47 = *(_QWORD **)&buf[16];
      if (*(_QWORD *)&buf[16])
      {
        *(_QWORD *)&v45 = 138412290;
        v63 = v45;
        while (1)
        {
          objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v41, v47[2], v42, v43, v44, v63);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(self->_heatmapItemID2CHStrokeID, v49, (uint64_t)v48, v50, v51, v52);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v57)
            break;
LABEL_23:
          objc_msgSend_addObject_(v37, v53, (uint64_t)v57, v54, v55, v56);

          v47 = (_QWORD *)*v47;
          if (!v47)
          {
            v59 = *(_QWORD **)&buf[16];
            if (*(_QWORD *)&buf[16])
            {
              do
              {
                v60 = (_QWORD *)*v59;
                operator delete(v59);
                v59 = v60;
              }
              while (v60);
            }
            goto LABEL_29;
          }
        }
        if (qword_1EF568E88 == -1)
        {
          v58 = (id)qword_1EF568E18[0];
          if (!os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
          {
LABEL_22:

            goto LABEL_23;
          }
        }
        else
        {
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v58 = (id)qword_1EF568E18[0];
          if (!os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
            goto LABEL_22;
        }
        *(_DWORD *)v64 = v63;
        v65 = v48;
        _os_log_impl(&dword_1BE607000, v58, OS_LOG_TYPE_FAULT, "Cannot find corresponding stroke ID given the item ID: %@", v64, 0xCu);
        goto LABEL_22;
      }
LABEL_29:
      v61 = *(void **)buf;
      *(_QWORD *)buf = 0;
      if (v61)
        operator delete(v61);
    }
    else
    {
      *(_QWORD *)buf = 0;
    }
  }
  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heatmapItemID2CHStrokeID, 0);
  objc_storeStrong((id *)&self->_CHStrokeID2HeatmapItemID, 0);
}

@end
