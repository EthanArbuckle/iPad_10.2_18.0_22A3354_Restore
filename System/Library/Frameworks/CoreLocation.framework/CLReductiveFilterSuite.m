@implementation CLReductiveFilterSuite

+ (double)rangeForReductiveFilterOptions:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double result;

  objc_msgSend_applyRangeEstimation(a3, a2, (uint64_t)a3, v3);
  if (v8 == 0.0)
    return 0.0;
  objc_msgSend_transmitPower(a3, v5, v6, v7);
  MEMORY[0x1E0DE7D20](CLReductiveFilterSuite, sel_rangeForTransmitPower_, v9, v10);
  return result;
}

+ (double)rangeForTransmitPower:(double)a3
{
  double v3;
  NSObject *v5;
  NSObject *v6;
  double v7;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (a3 < 4.0 || a3 > 20.0)
  {
    if (qword_1EE172108 != -1)
      dispatch_once(&qword_1EE172108, &unk_1E2990470);
    v5 = qword_1EE172110;
    if (os_log_type_enabled((os_log_t)qword_1EE172110, OS_LOG_TYPE_FAULT))
    {
      v9 = 68289282;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2050;
      v14 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"rangeForTransmitPower: invalid range of transmit power\", \"transmitPower_dBm\":\"%{public}.6f\"}", (uint8_t *)&v9, 0x1Cu);
      if (qword_1EE172108 != -1)
        dispatch_once(&qword_1EE172108, &unk_1E2990470);
    }
    v6 = qword_1EE172110;
    if (os_signpost_enabled((os_log_t)qword_1EE172110))
    {
      v9 = 68289282;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2050;
      v14 = v3;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "rangeForTransmitPower: invalid range of transmit power", "{\"msg%{public}.0s\":\"rangeForTransmitPower: invalid range of transmit power\", \"transmitPower_dBm\":\"%{public}.6f\"}", (uint8_t *)&v9, 0x1Cu);
    }
    v7 = 4.0;
    if (v3 >= 4.0)
      v7 = v3;
    v3 = fmin(v7, 20.0);
  }
  return sqrt(__exp10(v3 / 10.0) / 1000.0) * 199.526231;
}

+ (id)filterOutliers:(id)a3
{
  CLReductiveFilterOptions *v5;
  const char *v6;

  v5 = objc_alloc_init(CLReductiveFilterOptions);
  return (id)objc_msgSend_filterOutliers_options_(a1, v6, (uint64_t)a3, (uint64_t)v5);
}

+ (id)filterOutliers:(id)a3 options:(id)a4
{
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *Object;
  const char *v31;
  uint64_t v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  id v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t k;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  NSObject *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  void *obj;
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
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
  uint8_t v143[128];
  uint8_t buf[4];
  int v145;
  __int16 v146;
  const char *v147;
  __int16 v148;
  uint64_t v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v111 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v111, v112, (uint64_t)a2, (uint64_t)a1, CFSTR("CLReductiveFilterSuite.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));
  }
  objc_msgSend_rangeForReductiveFilterOptions_(a1, a2, (uint64_t)a4, (uint64_t)a4);
  v8 = v7;
  if (!objc_msgSend_count(a3, v9, v10, v11))
    return 0;
  v118 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  obj = (void *)objc_msgSend_reverseObjectEnumerator(a3, v12, v13, v14);
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v139, (uint64_t)v154, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v140;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v140 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * i);
        v135 = 0u;
        v136 = 0u;
        v137 = 0u;
        v138 = 0u;
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v17, (uint64_t)&v135, (uint64_t)v153, 16);
        if (!v22)
          goto LABEL_22;
        v25 = v22;
        v26 = 0;
        v27 = *(_QWORD *)v136;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v136 != v27)
              objc_enumerationMutation(v118);
            v29 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * j);
            Object = (void *)objc_msgSend_firstObject(v29, v17, v23, v24);
            objc_msgSend_distanceFromLocation_(v21, v31, (uint64_t)Object, v32);
            v34 = v33;
            objc_msgSend_horizontalAccuracy(v21, v35, v36, v37);
            v39 = v34 - v38;
            objc_msgSend_horizontalAccuracy(Object, v40, v41, v42);
            v44 = v39 - v43;
            v48 = (void *)objc_msgSend_timestamp(Object, v45, v46, v47);
            objc_msgSend_timeIntervalSince1970(v48, v49, v50, v51);
            v53 = v52;
            v57 = (void *)objc_msgSend_timestamp(v21, v54, v55, v56);
            objc_msgSend_timeIntervalSince1970(v57, v58, v59, v60);
            if (v44 <= v8)
              goto LABEL_18;
            v62 = v53 - v61;
            if (v62 < 5.0)
              v62 = 5.0;
            if (fmax(v44, 0.0) / v62 <= 250.0)
            {
LABEL_18:
              objc_msgSend_insertObject_atIndex_(v29, v17, (uint64_t)v21, 0);
              v26 = 1;
            }
          }
          v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v17, (uint64_t)&v135, (uint64_t)v153, 16);
        }
        while (v25);
        if ((v26 & 1) == 0)
        {
LABEL_22:
          v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend_addObject_(v63, v64, (uint64_t)v21, v65);
          objc_msgSend_addObject_(v118, v66, (uint64_t)v63, v67);
        }
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v139, (uint64_t)v154, 16);
    }
    while (v18);
  }
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v17, (uint64_t)&v131, (uint64_t)v152, 16);
  if (v68)
  {
    v72 = v68;
    v73 = 0;
    v74 = 0;
    v75 = *(_QWORD *)v132;
    do
    {
      for (k = 0; k != v72; ++k)
      {
        if (*(_QWORD *)v132 != v75)
          objc_enumerationMutation(v118);
        v77 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * k);
        if (objc_msgSend_count(v77, v69, v70, v71) > v74)
        {
          v74 = objc_msgSend_count(v77, v69, v70, v71);
          v73 = v77;
        }
      }
      v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v69, (uint64_t)&v131, (uint64_t)v152, 16);
    }
    while (v72);
  }
  else
  {
    v73 = 0;
  }
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v69, (uint64_t)&v127, (uint64_t)v151, 16);
  if (v114)
  {
    v113 = *(_QWORD *)v128;
    v116 = v73;
    do
    {
      v79 = 0;
      do
      {
        if (*(_QWORD *)v128 != v113)
          objc_enumerationMutation(v118);
        v115 = v79;
        v80 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * v79);
        if (v73 == v80)
        {
          v125 = 0uLL;
          v126 = 0uLL;
          v123 = 0uLL;
          v124 = 0uLL;
          v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v78, (uint64_t)&v123, (uint64_t)v150, 16);
          if (v95)
          {
            v96 = v95;
            v97 = *(_QWORD *)v124;
            do
            {
              v98 = 0;
              do
              {
                if (*(_QWORD *)v124 != v97)
                  objc_enumerationMutation(v116);
                v99 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v98);
                if (qword_1EE172108 != -1)
                  dispatch_once(&qword_1EE172108, &unk_1E2990470);
                v100 = qword_1EE172110;
                if (os_log_type_enabled((os_log_t)qword_1EE172110, OS_LOG_TYPE_DEBUG))
                {
                  v104 = (void *)objc_msgSend_description(v99, v101, v102, v103);
                  v108 = objc_msgSend_UTF8String(v104, v105, v106, v107);
                  *(_DWORD *)buf = 68289283;
                  v145 = 0;
                  v146 = 2082;
                  v147 = "";
                  v148 = 2081;
                  v149 = v108;
                  _os_log_impl(&dword_18F5B3000, v100, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Selected location\", \"loc\":%{private, location:escape_only}s}", buf, 0x1Cu);
                }
                ++v98;
              }
              while (v96 != v98);
              v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v116, v101, (uint64_t)&v123, (uint64_t)v150, 16);
            }
            while (v96);
          }
        }
        else
        {
          v121 = 0uLL;
          v122 = 0uLL;
          v119 = 0uLL;
          v120 = 0uLL;
          v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v78, (uint64_t)&v119, (uint64_t)v143, 16);
          if (v81)
          {
            v82 = v81;
            v83 = *(_QWORD *)v120;
            do
            {
              v84 = 0;
              do
              {
                if (*(_QWORD *)v120 != v83)
                  objc_enumerationMutation(v80);
                v85 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v84);
                if (qword_1EE172108 != -1)
                  dispatch_once(&qword_1EE172108, &unk_1E2990470);
                v86 = qword_1EE172110;
                if (os_log_type_enabled((os_log_t)qword_1EE172110, OS_LOG_TYPE_DEBUG))
                {
                  v90 = (void *)objc_msgSend_description(v85, v87, v88, v89);
                  v94 = objc_msgSend_UTF8String(v90, v91, v92, v93);
                  *(_DWORD *)buf = 68289283;
                  v145 = 0;
                  v146 = 2082;
                  v147 = "";
                  v148 = 2081;
                  v149 = v94;
                  _os_log_impl(&dword_18F5B3000, v86, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Removed location\", \"loc\":%{private, location:escape_only}s}", buf, 0x1Cu);
                }
                ++v84;
              }
              while (v82 != v84);
              v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v87, (uint64_t)&v119, (uint64_t)v143, 16);
            }
            while (v82);
          }
        }
        v79 = v115 + 1;
        v73 = v116;
      }
      while (v115 + 1 != v114);
      v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v78, (uint64_t)&v127, (uint64_t)v151, 16);
    }
    while (v114);
  }
  return v73;
}

+ (id)deriveLocationFromLocations:(id)a3
{
  CLReductiveFilterOptions *v5;
  const char *v6;

  v5 = objc_alloc_init(CLReductiveFilterOptions);
  return (id)objc_msgSend_deriveLocationFromLocations_options_(a1, v6, (uint64_t)a3, (uint64_t)v5);
}

+ (id)deriveLocationFromLocations:(id)a3 options:(id)a4
{
  id result;
  const char *v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  double v24;
  int v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  char v34;
  uint64_t v35;
  char v36;
  double v37;
  double v38;
  uint64_t j;
  void *v40;
  double v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  __double2 v49;
  __double2 v50;
  double v51;
  double v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  double v89;
  NSObject *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  id v95;
  const char *v96;
  uint64_t v97;
  NSObject *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  CLLocation *v115;
  const char *v116;
  uint64_t v117;
  void *v119;
  const char *v120;
  char *v121;
  id v122;
  double v123;
  uint64_t v124;
  int v125;
  id obj;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  uint64_t v135;
  double v136;
  double v137[2];
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint8_t buf[4];
  int v147;
  __int16 v148;
  const char *v149;
  __int16 v150;
  int v151;
  __int16 v152;
  int v153;
  __int16 v154;
  int v155;
  __int16 v156;
  uint64_t v157;
  __int16 v158;
  double v159;
  __int16 v160;
  double v161;
  __int16 v162;
  double v163;
  __int16 v164;
  double v165;
  __int16 v166;
  uint64_t v167;
  __int16 v168;
  int v169;
  __int16 v170;
  int v171;
  _BYTE v172[128];
  _BYTE v173[128];
  uint64_t v174;

  v174 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v119 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v119, v120, (uint64_t)a2, (uint64_t)a1, CFSTR("CLReductiveFilterSuite.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));
  }
  result = (id)objc_msgSend_count(a3, a2, (uint64_t)a3, (uint64_t)a4);
  if (!result)
    return result;
  objc_msgSend_rangeForReductiveFilterOptions_(a1, v8, (uint64_t)a4, v9);
  v11 = v10;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v15 = (void *)objc_msgSend_reverseObjectEnumerator(a3, v12, v13, v14);
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v142, (uint64_t)v173, 16);
  if (v17)
  {
    v21 = v17;
    v22 = *(_QWORD *)v143;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v143 != v22)
          objc_enumerationMutation(v15);
        objc_msgSend_horizontalAccuracy(*(void **)(*((_QWORD *)&v142 + 1) + 8 * i), v18, v19, v20);
        if (v24 <= 500.0)
        {
          v25 = 1;
          goto LABEL_14;
        }
      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v142, (uint64_t)v173, 16);
      if (v21)
        continue;
      break;
    }
  }
  v25 = 0;
LABEL_14:
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v122 = a3;
  obj = (id)objc_msgSend_reverseObjectEnumerator(a3, v18, v19, v20);
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v138, (uint64_t)v172, 16);
  if (!v27)
  {
    v125 = 0;
    v32 = 0;
    v33 = 0;
    v124 = 0;
    v37 = 0.0;
    v130 = 0.0;
    v131 = 0.0;
    v128 = 0.0;
    v129 = 0.0;
    v38 = 0.0;
    goto LABEL_41;
  }
  v31 = v27;
  v125 = 0;
  v32 = 0;
  v33 = 0;
  v124 = 0;
  v34 = 0;
  v35 = *(_QWORD *)v139;
  v36 = 1;
  v37 = 0.0;
  v130 = 0.0;
  v131 = 0.0;
  v128 = 0.0;
  v129 = 0.0;
  v38 = 0.0;
  v123 = v11;
  while (2)
  {
    for (j = 0; j != v31; ++j)
    {
      if (*(_QWORD *)v139 != v35)
        objc_enumerationMutation(obj);
      v40 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * j);
      if (v25)
      {
        objc_msgSend_horizontalAccuracy(*(void **)(*((_QWORD *)&v138 + 1) + 8 * j), v28, v29, v30);
        if (v41 > 500.0)
        {
          ++v125;
          continue;
        }
      }
      v134 = v38;
      objc_msgSend_coordinate(v40, v28, v29, v30);
      v43 = v42;
      objc_msgSend_coordinate(v40, v44, v45, v46);
      v48 = v47;
      v49 = __sincos_stret(v43 * 0.0174532925);
      v50 = __sincos_stret(v48 * 0.0174532925);
      v51 = 6378137.0 / sqrt(v49.__sinval * -0.00669437999 * v49.__sinval + 1.0);
      v52 = v49.__cosval * (v51 + 0.0);
      v53 = v50.__cosval * v52;
      v132 = v49.__sinval * (v51 * 0.99330562 + 0.0);
      v133 = v50.__sinval * v52;
      objc_msgSend_horizontalAccuracy(v40, v54, v55, v56);
      v58 = v57;
      objc_msgSend_biasRateInMeasurement(a4, v59, v60, v61);
      v63 = v62;
      objc_msgSend_horizontalAccuracy(v40, v64, v65, v66);
      v68 = v67;
      objc_msgSend_biasRateInMeasurement(a4, v69, v70, v71);
      v73 = v72;
      objc_msgSend_horizontalAccuracy(v40, v74, v75, v76);
      if ((v36 & 1) != 0)
      {
        v81 = v80;
        v124 = objc_msgSend_timestamp(v40, v77, v78, v79);
LABEL_27:
        v36 = 0;
        v34 = 0;
        v89 = 1.0 / ((v11 + v58) * (v11 + v58));
        ++v33;
        v128 = v128 + v53 * v89;
        v129 = v129 + v133 * v89;
        v130 = v130 + v132 * v89;
        v131 = v131 + v63 * v68 * v89;
        v37 = v37 + (1.0 - v73) * v81 * ((1.0 - v73) * v81) * (v89 * v89);
        v38 = v134 + v89;
        continue;
      }
      if (v134 <= 0.0)
      {
        if (qword_1EE172108 != -1)
          dispatch_once(&qword_1EE172108, &unk_1E2990470);
        v90 = qword_1EE172110;
        if (os_log_type_enabled((os_log_t)qword_1EE172110, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F5B3000, v90, OS_LOG_TYPE_FAULT, "Reductive filtering: Sum of weights <= 0 after at least one point added.", buf, 2u);
        }
        if (sub_18F5C4AE0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE172108 != -1)
            dispatch_once(&qword_1EE172108, &unk_1E2990470);
          LOWORD(v137[0]) = 0;
          v121 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 0, "+[CLReductiveFilterSuite deriveLocationFromLocations:options:]", "CoreLocation: %s\n", v121);
          if (v121 != (char *)buf)
            free(v121);
        }
        return 0;
      }
      v81 = v80;
      v127 = v37;
      v82 = v11 + v131 / v134 + sqrt(v37 / (v134 * v134));
      objc_msgSend_horizontalAccuracy(v40, v77, v78, v79);
      v84 = v83;
      objc_msgSend_horizontalAccuracy(v40, v85, v86, v87);
      if ((v133 - v129 / v134) * (v133 - v129 / v134)
         + (v53 - v128 / v134) * (v53 - v128 / v134)
         + (v132 - v130 / v134) * (v132 - v130 / v134) < (v82 * v82 + v84 * v88) * 2.9957)
      {
        v11 = v123;
        v37 = v127;
        goto LABEL_27;
      }
      ++v32;
      if ((v34 & 1) != 0)
      {
        v11 = v123;
        v37 = v127;
        v38 = v134;
        goto LABEL_41;
      }
      v36 = 0;
      v34 = 1;
      v11 = v123;
      v37 = v127;
      v38 = v134;
    }
    v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v138, (uint64_t)v172, 16);
    if (v31)
      continue;
    break;
  }
LABEL_41:
  v136 = 0.0;
  v137[0] = 0.0;
  v135 = 0;
  sub_18F6E65B4(v137, &v136, (double *)&v135, v128 / v38, v129 / v38, v130 / v38);
  v91 = v38;
  v93 = v136;
  v92 = v137[0];
  v94 = v131 / v91 + sqrt(v37 / (v91 * v91));
  v95 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend_setDateFormat_(v95, v96, (uint64_t)CFSTR("yyyy-MM-dd HH:mm:ss.SSSS"), v97);
  if (qword_1EE172108 != -1)
    dispatch_once(&qword_1EE172108, &unk_1E2990470);
  v98 = qword_1EE172110;
  if (os_log_type_enabled((os_log_t)qword_1EE172110, OS_LOG_TYPE_DEBUG))
  {
    v102 = objc_msgSend_count(v122, v99, v100, v101);
    objc_msgSend_transmitPower(a4, v103, v104, v105);
    v107 = v106;
    v110 = (void *)objc_msgSend_stringFromDate_(v95, v108, v124, v109);
    v114 = objc_msgSend_UTF8String(v110, v111, v112, v113);
    *(_DWORD *)buf = 68291843;
    v147 = 0;
    v148 = 2082;
    v149 = "";
    v150 = 1026;
    v151 = v102;
    v152 = 1026;
    v153 = v32;
    v154 = 1026;
    v155 = v33;
    v156 = 2050;
    v157 = v107;
    v158 = 2050;
    v159 = v11;
    v160 = 2049;
    v161 = v92;
    v162 = 2049;
    v163 = v93;
    v164 = 2049;
    v165 = v11 + v94;
    v166 = 2082;
    v167 = v114;
    v168 = 1026;
    v169 = v25;
    v170 = 1026;
    v171 = v125;
    _os_log_impl(&dword_18F5B3000, v98, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Reductive filtering\", \"input\":%{public}d, \"outliers\":%{public}d, \"used\":%{public}d, \"transmitPower\":\"%{public}.6f\", \"rangeOfBeacon\":\"%{public}.6f\", \"lat\":\"%{private}f\", \"lon\":\"%{private}f\", \"hunc\":\"%{private}f\", \"timestamp\":%{public, location:escape_only}s, \"isAccurateLocationAvailable\":%{public}hhd, \"filtered\":%{public}d}", buf, 0x6Cu);
  }
  v115 = [CLLocation alloc];
  return (id)objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_(v115, v116, v124, v117, v92, v93, 0.0, v11 + v94, -1.0);
}

+ (id)applyFilterToLocationObservations:(id)a3 options:(id)a4
{
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v53;
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  _BOOL4 v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_count(a3, a2, (uint64_t)a3, (uint64_t)a4))
    return 0;
  v65[0] = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v6, (uint64_t)CFSTR("timestamp"), 1);
  v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v65, 1);
  v11 = objc_msgSend_sortedArrayUsingDescriptors_(a3, v9, v8, v10);
  v15 = objc_msgSend_count(a3, v12, v13, v14);
  v17 = (void *)objc_msgSend_filterOutliers_options_(CLReductiveFilterSuite, v16, v11, (uint64_t)a4);
  v21 = objc_msgSend_count(v17, v18, v19, v20);
  v23 = (void *)objc_msgSend_deriveLocationFromLocations_options_(CLReductiveFilterSuite, v22, (uint64_t)v17, (uint64_t)a4);
  if (qword_1EE172108 != -1)
    dispatch_once(&qword_1EE172108, &unk_1E2990470);
  v24 = qword_1EE172110;
  if (os_log_type_enabled((os_log_t)qword_1EE172110, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_msgSend_beaconType(a4, v25, v26, v27);
    objc_msgSend_transmitPower(a4, v29, v30, v31);
    v33 = v32;
    objc_msgSend_biasRateInMeasurement(a4, v34, v35, v36);
    v38 = v37;
    objc_msgSend_applyRangeEstimation(a4, v39, v40, v41);
    v53 = 68290050;
    v54 = 0;
    v55 = 2082;
    v56 = "";
    v57 = 2050;
    v58 = v28;
    v59 = 2050;
    v60 = v33;
    v61 = 2050;
    v62 = v38;
    v63 = 1026;
    v64 = v42 != 0.0;
    _os_log_impl(&dword_18F5B3000, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Reductive filtering - options\", \"beaconType\":%{public}lu, \"transmitPower\":\"%{public}.6f\", \"biasRate\":\"%{public}.6f\", \"applyRangeEstimation\":%{public}hhd}", (uint8_t *)&v53, 0x36u);
    if (qword_1EE172108 != -1)
      dispatch_once(&qword_1EE172108, &unk_1E2990470);
  }
  v43 = qword_1EE172110;
  if (os_log_type_enabled((os_log_t)qword_1EE172110, OS_LOG_TYPE_DEFAULT))
  {
    v47 = (void *)objc_msgSend_description(v23, v44, v45, v46);
    v51 = objc_msgSend_UTF8String(v47, v48, v49, v50);
    v53 = 68289795;
    v54 = 0;
    v55 = 2082;
    v56 = "";
    v57 = 2050;
    v58 = v15;
    v59 = 2050;
    v60 = v21;
    v61 = 2081;
    v62 = v51;
    _os_log_impl(&dword_18F5B3000, v43, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Reductive filtering - location observations\", \"countInput\":%{public}lu, \"countFiltered\":%{public}lu, \"loc\":%{private, location:escape_only}s}", (uint8_t *)&v53, 0x30u);
  }
  return v23;
}

+ (id)applyFilterToLocationTrace:(id)a3 options:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v59;
  int v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  _BOOL4 v70;
  _QWORD v71[2];

  v71[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_count(a3, a2, (uint64_t)a3, (uint64_t)a4))
    return 0;
  objc_msgSend_setBiasRateInMeasurement_(a4, v6, v7, v8, 1.0);
  objc_msgSend_setApplyRangeEstimation_(a4, v9, v10, v11, 0.0);
  v71[0] = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v12, (uint64_t)CFSTR("timestamp"), 1);
  v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v13, (uint64_t)v71, 1);
  v17 = objc_msgSend_sortedArrayUsingDescriptors_(a3, v15, v14, v16);
  v21 = objc_msgSend_count(a3, v18, v19, v20);
  v23 = (void *)objc_msgSend_filterOutliers_options_(CLReductiveFilterSuite, v22, v17, (uint64_t)a4);
  v27 = objc_msgSend_count(v23, v24, v25, v26);
  v29 = (void *)objc_msgSend_deriveLocationFromLocations_options_(CLReductiveFilterSuite, v28, (uint64_t)v23, (uint64_t)a4);
  if (qword_1EE172108 != -1)
    dispatch_once(&qword_1EE172108, &unk_1E2990470);
  v30 = qword_1EE172110;
  if (os_log_type_enabled((os_log_t)qword_1EE172110, OS_LOG_TYPE_DEFAULT))
  {
    v34 = objc_msgSend_beaconType(a4, v31, v32, v33);
    objc_msgSend_transmitPower(a4, v35, v36, v37);
    v39 = v38;
    objc_msgSend_biasRateInMeasurement(a4, v40, v41, v42);
    v44 = v43;
    objc_msgSend_applyRangeEstimation(a4, v45, v46, v47);
    v59 = 68290050;
    v60 = 0;
    v61 = 2082;
    v62 = "";
    v63 = 2050;
    v64 = v34;
    v65 = 2050;
    v66 = v39;
    v67 = 2050;
    v68 = v44;
    v69 = 1026;
    v70 = v48 != 0.0;
    _os_log_impl(&dword_18F5B3000, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Reductive filtering - options\", \"beaconType\":%{public}lu, \"transmitPower\":\"%{public}.6f\", \"biasRate\":\"%{public}.6f\", \"applyRangeEstimation\":%{public}hhd}", (uint8_t *)&v59, 0x36u);
    if (qword_1EE172108 != -1)
      dispatch_once(&qword_1EE172108, &unk_1E2990470);
  }
  v49 = qword_1EE172110;
  if (os_log_type_enabled((os_log_t)qword_1EE172110, OS_LOG_TYPE_DEFAULT))
  {
    v53 = (void *)objc_msgSend_description(v29, v50, v51, v52);
    v57 = objc_msgSend_UTF8String(v53, v54, v55, v56);
    v59 = 68289795;
    v60 = 0;
    v61 = 2082;
    v62 = "";
    v63 = 2050;
    v64 = v21;
    v65 = 2050;
    v66 = v27;
    v67 = 2081;
    v68 = v57;
    _os_log_impl(&dword_18F5B3000, v49, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Reductive filtering - location trace\", \"countInput\":%{public}lu, \"countFiltered\":%{public}lu, \"loc\":%{private, location:escape_only}s}", (uint8_t *)&v59, 0x30u);
  }
  return v29;
}

@end
