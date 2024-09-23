@implementation CWFKnownNetworkPreparer

- (CWFKnownNetworkPreparer)initWithNetworkProfiles:(id)a3
{
  id v4;
  CWFKnownNetworkPreparer *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  NSObject *v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(CWFKnownNetworkPreparer);
    objc_msgSend_setProfiles_(v5, v6, (uint64_t)v4, v7, v8);
    objc_msgSend_setMaxResults_(v5, v9, 4, v10, v11);
  }
  else
  {
    CWFGetOSLog();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      CWFGetOSLog();
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      _os_log_send_and_compose_impl();

    v5 = 0;
  }

  return v5;
}

- (id)localNetworkPromptProfiles
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t i;
  void *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  id v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t j;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  NSObject *v111;
  id v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  id v118;
  int *v120;
  int *v121;
  int v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  CWFKnownNetworkPreparer *v127;
  void *v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  int v134;
  uint64_t v135;
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  objc_msgSend_profiles(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__localNetworkFilter(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v6, v12, (uint64_t)v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  CWFGetOSLog();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    CWFGetOSLog();
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v134 = 138412290;
    v135 = (uint64_t)v15;
    v122 = 12;
    v120 = &v134;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend__lastJoinedComparator(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v15, v24, (uint64_t)v23, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  CWFGetOSLog();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    CWFGetOSLog();
    v29 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = MEMORY[0x1E0C81028];
    v30 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v134 = 138412290;
    v135 = (uint64_t)v27;
    v122 = 12;
    v120 = &v134;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_profiles(self, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__filterForPrimaryHomeNetworkProfile_(self, v36, (uint64_t)v35, v37, v38);
  v39 = objc_claimAutoreleasedReturnValue();

  v128 = v15;
  v126 = (void *)v39;
  if (v39)
  {
    if ((objc_msgSend_containsObject_(v27, v40, v39, v41, v42) & 1) == 0)
    {
      v47 = (void *)objc_msgSend_mutableCopy(v27, v43, v44, v45, v46);
      objc_msgSend_addObject_(v47, v48, v39, v49, v50);

      v27 = v47;
    }
    CWFGetOSLog();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      CWFGetOSLog();
      v52 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = MEMORY[0x1E0C81028];
      v53 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v134 = 138412290;
      v135 = v39;
      v122 = 12;
      v120 = &v134;
      _os_log_send_and_compose_impl();
    }

  }
  v127 = self;
  objc_msgSend__removeProfilesAtSimilarLocations_(self, v40, (uint64_t)v27, v41, v42, v120, v122);
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v27;
  objc_msgSend_differenceFromArray_(v124, v54, (uint64_t)v27, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v129, (uint64_t)v133, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v130;
    v62 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v60; ++i)
      {
        if (*(_QWORD *)v130 != v61)
          objc_enumerationMutation(v57);
        v64 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
        CWFGetOSLog();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (v65)
        {
          CWFGetOSLog();
          v66 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v67 = v62;
          v66 = v62;
        }

        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_object(v64, v68, v69, v70, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v134 = 138412290;
          v135 = (uint64_t)v72;
          LODWORD(v123) = 12;
          v121 = &v134;
          _os_log_send_and_compose_impl();

        }
      }
      v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v73, (uint64_t)&v129, (uint64_t)v133, 16);
    }
    while (v60);
  }

  v74 = v124;
  v79 = (void *)objc_msgSend_mutableCopy(v74, v75, v76, v77, v78);
  objc_msgSend_set(MEMORY[0x1E0C99E20], v80, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = objc_msgSend_count(v84, v85, v86, v87, v88);
        j < objc_msgSend_maxResults(v127, v89, v90, v91, v92, v121, v123) && objc_msgSend_count(v79, v94, v95, v96, v97);
        j = objc_msgSend_count(v84, v105, v106, v107, v108))
  {
    objc_msgSend_firstObject(v79, v94, v95, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v84, v99, (uint64_t)v98, v100, v101);

    objc_msgSend_removeObjectAtIndex_(v79, v102, 0, v103, v104);
  }
  objc_msgSend_allObjects(v84, v94, v95, v96, v97);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  CWFGetOSLog();
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (v110)
  {
    CWFGetOSLog();
    v111 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v111 = MEMORY[0x1E0C81028];
    v112 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
  {
    v134 = 138412290;
    v135 = (uint64_t)v109;
    _os_log_send_and_compose_impl();
  }

  if (objc_msgSend_count(v109, v113, v114, v115, v116))
    v117 = v109;
  else
    v117 = 0;
  v118 = v117;

  return v118;
}

- (id)prepareLocalNetworkProfilesForPresentation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  id v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  id v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  id v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i;
  void *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  NSObject *v119;
  void *v120;
  void *v121;
  NSObject *v122;
  id v123;
  id v124;
  id v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  NSObject *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  id v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  double v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  double v177;
  void *v178;
  const char *v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  NSObject *v187;
  double v188;
  void *v189;
  NSObject *v190;
  id v191;
  id v192;
  void *v193;
  void *v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  void *v198;
  id v199;
  void *v201;
  NSObject *v202;
  id v203;
  int *v204;
  int *v205;
  int v206;
  uint64_t v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  id obj;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  _QWORD v218[2];
  _QWORD v219[2];
  int v220;
  uint64_t v221;
  __int16 v222;
  double v223;
  _BYTE v224[128];
  uint64_t v225;
  NSRange v226;

  v225 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = v4;
  if (v4 && objc_msgSend_count(v4, v5, v6, v7, v8))
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v10, v11, v12, v13);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v14, v15, v16, v17);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__presentationSortComparator(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingComparator_(v9, v23, (uint64_t)v22, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend__filterProfilesForHomeNetworksExceedingMaximumDistance_(self, v27, (uint64_t)v26, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v210 = v9;
    v208 = (void *)v30;
    if (v30)
    {
      v35 = v30;
      CWFGetOSLog();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        CWFGetOSLog();
        v37 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v37 = MEMORY[0x1E0C81028];
        v39 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v220 = 138412290;
        v221 = v35;
        v206 = 12;
        v204 = &v220;
        _os_log_send_and_compose_impl();
      }

      v44 = (void *)objc_msgSend_mutableCopy(v26, v40, v41, v42, v43);
      objc_msgSend_removeObjectsInArray_(v44, v45, v35, v46, v47);
      if ((unint64_t)objc_msgSend_count(v44, v48, v49, v50, v51) >= 3)
      {
        v56 = objc_msgSend_count(v44, v52, v53, v54, v55) - 2;
        CWFGetOSLog();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          CWFGetOSLog();
          v58 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v58 = MEMORY[0x1E0C81028];
          v59 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v226.location = 2;
          v226.length = v56;
          NSStringFromRange(v226);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v220 = 138412290;
          v221 = (uint64_t)v60;
          v206 = 12;
          v204 = &v220;
          _os_log_send_and_compose_impl();

        }
        objc_msgSend_removeObjectsInRange_(v44, v61, 2, v56, v62);
      }
      v38 = v44;

      CWFGetOSLog();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (v63)
      {
        CWFGetOSLog();
        v64 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v64 = MEMORY[0x1E0C81028];
        v65 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        v220 = 138412290;
        v221 = (uint64_t)v38;
        v206 = 12;
        v204 = &v220;
        _os_log_send_and_compose_impl();
      }

      objc_msgSend_firstObject(v38, v66, v67, v68, v69, v204, v206);
    }
    else
    {
      v38 = v26;
      objc_msgSend_firstObject(v26, v31, v32, v33, v34);
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__location(v70, v71, v72, v73, v74);
    v212 = (void *)objc_claimAutoreleasedReturnValue();

    v216 = 0u;
    v217 = 0u;
    v214 = 0u;
    v215 = 0u;
    obj = v38;
    v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v75, (uint64_t)&v214, (uint64_t)v224, 16);
    if (v76)
    {
      v81 = v76;
      v82 = *(_QWORD *)v215;
      do
      {
        for (i = 0; i != v81; ++i)
        {
          if (*(_QWORD *)v215 != v82)
            objc_enumerationMutation(obj);
          v84 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * i);
          objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v77, v78, v79, v80, v205, v207);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_networkName(v84, v86, v87, v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          if (v90)
          {
            objc_msgSend_networkName(v84, v91, v92, v93, v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v85, v96, (uint64_t)v95, (uint64_t)CFSTR("mapLabelCalloutTitleKey"), v97);

            objc_msgSend_discoveredDevices(v84, v98, v99, v100, v101);
            v102 = (void *)objc_claimAutoreleasedReturnValue();

            if (v102)
            {
              objc_msgSend_discoveredDevices(v84, v103, v104, v105, v106);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v107, v108, (uint64_t)CFSTR("DevicesCount"), v109, v110);
              v111 = objc_claimAutoreleasedReturnValue();

              if (v111)
              {
                objc_msgSend_setObject_forKey_(v85, v112, (uint64_t)v111, (uint64_t)CFSTR("mapLabelCalloutDeviceCountKey"), v113);
              }
              else
              {
                CWFGetOSLog();
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                if (v121)
                {
                  CWFGetOSLog();
                  v122 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v122 = MEMORY[0x1E0C81028];
                  v125 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
                {
                  v220 = 138412290;
                  v221 = (uint64_t)v84;
                  LODWORD(v207) = 12;
                  v205 = &v220;
                  _os_log_send_and_compose_impl();
                }

              }
              objc_msgSend_discoveredDevices(v84, v114, v115, v116, v117, v205, v207);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v126, v127, (uint64_t)CFSTR("DevicesNames"), v128, v129);
              v130 = (void *)objc_claimAutoreleasedReturnValue();

              if (v130 && objc_msgSend__shouldDisplayDeviceNames(v84, v131, v132, v133, v134))
              {
                objc_msgSend__shuffled(v130, v135, v136, v137, v138);
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend__removeBackslashAndSpaceCharacter(v130, v140, v141, v142, v143);
                v144 = objc_claimAutoreleasedReturnValue();

                objc_msgSend_setObject_forKey_(v85, v145, (uint64_t)v144, (uint64_t)CFSTR("mapLabelCalloutDeviceNamesKey"), v146);
              }
              else
              {
                CWFGetOSLog();
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                if (v147)
                {
                  CWFGetOSLog();
                  v144 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v144 = MEMORY[0x1E0C81028];
                  v148 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
                {
                  v220 = 138412290;
                  v221 = (uint64_t)v84;
                  LODWORD(v207) = 12;
                  v205 = &v220;
                  _os_log_send_and_compose_impl();
                }
              }

            }
            else
            {
              CWFGetOSLog();
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              if (v120)
              {
                CWFGetOSLog();
                v111 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v111 = MEMORY[0x1E0C81028];
                v124 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
              {
                v220 = 138412290;
                v221 = (uint64_t)v84;
                LODWORD(v207) = 12;
                v205 = &v220;
                _os_log_send_and_compose_impl();
              }
            }

            objc_msgSend__location(v84, v149, v150, v151, v152);
            v153 = objc_claimAutoreleasedReturnValue();
            if (v153)
            {
              v119 = v153;
              objc_msgSend_distanceFromLocation_(v212, v154, v153, v155, v156);
              if (v161 >= 4000000.0)
              {
                v188 = v161;
                CWFGetOSLog();
                v189 = (void *)objc_claimAutoreleasedReturnValue();
                if (v189)
                {
                  CWFGetOSLog();
                  v190 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v190 = MEMORY[0x1E0C81028];
                  v192 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
                {
                  v220 = 138412546;
                  v221 = (uint64_t)v84;
                  v222 = 2048;
                  v223 = v188;
                  LODWORD(v207) = 22;
                  v205 = &v220;
                  _os_log_send_and_compose_impl();
                }

              }
              else
              {
                v218[0] = CFSTR("mapLabelCalloutLatKey");
                v162 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend_coordinate(v119, v157, v158, v159, v160);
                objc_msgSend_numberWithDouble_(v162, v163, v164, v165, v166);
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                v218[1] = CFSTR("mapLabelCalloutLngKey");
                v219[0] = v167;
                v168 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend_coordinate(v119, v169, v170, v171, v172);
                objc_msgSend_numberWithDouble_(v168, v173, v174, v175, v176, v177);
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                v219[1] = v178;
                objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v179, (uint64_t)v219, (uint64_t)v218, 2);
                v180 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_setObject_forKey_(v85, v181, (uint64_t)v180, (uint64_t)CFSTR("mapLabelCalloutLocationKey"), v182);
                objc_msgSend_addObject_(v211, v183, (uint64_t)v85, v184, v185);
              }
            }
            else
            {
              CWFGetOSLog();
              v186 = (void *)objc_claimAutoreleasedReturnValue();
              if (v186)
              {
                CWFGetOSLog();
                v187 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v187 = MEMORY[0x1E0C81028];
                v191 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
              {
                v220 = 138412290;
                v221 = (uint64_t)v84;
                LODWORD(v207) = 12;
                v205 = &v220;
                _os_log_send_and_compose_impl();
              }

              v119 = 0;
            }
          }
          else
          {
            CWFGetOSLog();
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            if (v118)
            {
              CWFGetOSLog();
              v119 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v119 = MEMORY[0x1E0C81028];
              v123 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
            {
              v220 = 138412290;
              v221 = (uint64_t)v84;
              LODWORD(v207) = 12;
              v205 = &v220;
              _os_log_send_and_compose_impl();
            }
          }

        }
        v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v77, (uint64_t)&v214, (uint64_t)v224, 16);
      }
      while (v81);
    }
    v193 = obj;

    v194 = v209;
    v195 = v211;
    objc_msgSend_setObject_forKey_(v209, v196, (uint64_t)v211, (uint64_t)CFSTR("mapLabelArrayForCalloutsKey"), v197);
    v9 = v210;
    v198 = v208;
  }
  else
  {
    CWFGetOSLog();
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    if (v201)
    {
      CWFGetOSLog();
      v202 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v202 = MEMORY[0x1E0C81028];
      v203 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v202, OS_LOG_TYPE_INFO))
    {
      LOWORD(v220) = 0;
      _os_log_send_and_compose_impl();
    }

    v212 = 0;
    v198 = 0;
    v195 = 0;
    v194 = 0;
    v193 = 0;
  }
  v199 = v194;

  return v199;
}

- (id)_filterProfilesForHomeNetworksExceedingMaximumDistance:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  void *v55;
  NSObject *v56;
  id v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  int *v68;
  uint64_t v69;
  id v70;
  id v71;
  id obj;
  void *v73;
  uint64_t v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  int v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  double v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = sub_1B0677BE4;
  v84[3] = &unk_1E6133B40;
  v9 = v8;
  v85 = v9;
  objc_msgSend_enumerateObjectsUsingBlock_(v3, v10, (uint64_t)v84, v11, v12);
  if (objc_msgSend_count(v9, v13, v14, v15, v16))
  {
    v71 = v3;
    v75 = (void *)objc_msgSend_mutableCopy(v3, v17, v18, v19, v20);
    objc_msgSend_removeObjectsInArray_(v75, v21, (uint64_t)v9, v22, v23);
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v24, v25, v26, v27);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v70 = v9;
    obj = v9;
    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v80, (uint64_t)v93, 16);
    if (v29)
    {
      v30 = v29;
      v74 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v81 != v74)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v79 = 0u;
          v33 = v75;
          v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v76, (uint64_t)v92, 16);
          if (v35)
          {
            v40 = v35;
            v41 = *(_QWORD *)v77;
            while (2)
            {
              for (j = 0; j != v40; ++j)
              {
                if (*(_QWORD *)v77 != v41)
                  objc_enumerationMutation(v33);
                v43 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
                objc_msgSend__location(v32, v36, v37, v38, v39, v68, v69);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend__location(v43, v45, v46, v47, v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_distanceFromLocation_(v44, v50, (uint64_t)v49, v51, v52);
                v54 = v53;

                if (v54 >= 4000000.0)
                {
                  CWFGetOSLog();
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v55)
                  {
                    CWFGetOSLog();
                    v56 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v56 = MEMORY[0x1E0C81028];
                    v57 = MEMORY[0x1E0C81028];
                  }

                  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                  {
                    v86 = 138412802;
                    v87 = v32;
                    v88 = 2112;
                    v89 = v43;
                    v90 = 2048;
                    v91 = v54;
                    LODWORD(v69) = 32;
                    v68 = &v86;
                    _os_log_send_and_compose_impl();
                  }

                  objc_msgSend_addObject_(v73, v58, (uint64_t)v32, v59, v60);
                  goto LABEL_22;
                }
              }
              v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v76, (uint64_t)v92, 16);
              if (v40)
                continue;
              break;
            }
          }
LABEL_22:

        }
        v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v61, (uint64_t)&v80, (uint64_t)v93, 16);
      }
      while (v30);
    }

    if (objc_msgSend_count(v73, v62, v63, v64, v65))
      v66 = v73;
    else
      v66 = 0;
    v9 = v70;
    v3 = v71;

  }
  else
  {
    v66 = 0;
  }

  return v66;
}

- (BOOL)profilesContainsHomeProfile:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a3;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v3);
        if ((objc_msgSend__isHomeNetwork(*(void **)(*((_QWORD *)&v13 + 1) + 8 * i), v5, v6, v7, v8, (_QWORD)v13) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v13, (uint64_t)v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)_filterForPrimaryHomeNetworkProfile:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;

  objc_msgSend_profiles(self, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__homeNetworkFilter(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v6, v12, (uint64_t)v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend_count(v15, v16, v17, v18, v19);
  if (v20)
  {
    objc_msgSend__networkProfileUsageComparator(self, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingComparator_(v15, v26, (uint64_t)v25, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_firstObject(v29, v30, v31, v32, v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
  v34 = v20;

  return v34;
}

- (id)_removeProfilesAtSimilarLocations:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  NSObject *v100;
  id v101;
  id v103;
  uint64_t v104;
  id v105;
  CWFKnownNetworkPreparer *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  __int128 v125;
  uint64_t v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!qword_1ECFD69F0)
  {
    v125 = xmmword_1E6133C10;
    v126 = 0;
    qword_1ECFD69F0 = _sl_dlopen();
  }
  if (qword_1ECFD69F0)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v10, v11, v12, v13);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v103 = v8;
    v14 = v8;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v118, (uint64_t)v124, 16);
    if (v16)
    {
      v20 = v16;
      v21 = *(_QWORD *)v119;
      v105 = v14;
      v106 = self;
      v104 = *(_QWORD *)v119;
      do
      {
        v22 = 0;
        v107 = v20;
        do
        {
          if (*(_QWORD *)v119 != v21)
            objc_enumerationMutation(v14);
          v23 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v22);
          if ((objc_msgSend_containsObject_(v9, v17, (uint64_t)v23, v18, v19) & 1) == 0)
          {
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v17, v24, v18, v19);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend__location(v23, v26, v27, v28, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              v108 = v22;
              v116 = 0u;
              v117 = 0u;
              v114 = 0u;
              v115 = 0u;
              v31 = v14;
              v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v114, (uint64_t)v123, 16);
              if (v33)
              {
                v37 = v33;
                v38 = *(_QWORD *)v115;
                do
                {
                  for (i = 0; i != v37; ++i)
                  {
                    if (*(_QWORD *)v115 != v38)
                      objc_enumerationMutation(v31);
                    v40 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
                    if ((objc_msgSend_isEqual_(v40, v34, (uint64_t)v23, v35, v36) & 1) == 0
                      && (objc_msgSend_containsObject_(v9, v34, (uint64_t)v40, v35, v36) & 1) == 0)
                    {
                      objc_msgSend__location(v40, v34, v41, v35, v36);
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v46 = v42;
                      if (v42)
                      {
                        objc_msgSend_distanceFromLocation_(v42, v43, (uint64_t)v30, v44, v45);
                        if (v50 <= 5000.0)
                        {
                          objc_msgSend_addObject_(v25, v47, (uint64_t)v40, v48, v49);
                          objc_msgSend_addObject_(v9, v51, (uint64_t)v40, v52, v53);
                        }
                      }

                    }
                  }
                  v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v114, (uint64_t)v123, 16);
                }
                while (v37);
              }

              objc_msgSend_setObject_forKey_(v109, v54, (uint64_t)v25, (uint64_t)v23, v55);
              v14 = v105;
              self = v106;
              v21 = v104;
              v20 = v107;
              v22 = v108;
            }

          }
          ++v22;
        }
        while (v22 != v20);
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v118, (uint64_t)v124, 16);
      }
      while (v20);
    }

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v56, v57, v58, v59);
    v60 = (id)objc_claimAutoreleasedReturnValue();
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    objc_msgSend_allKeys(v109, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v110, (uint64_t)v122, 16);
    if (v67)
    {
      v71 = v67;
      v72 = *(_QWORD *)v111;
      do
      {
        for (j = 0; j != v71; ++j)
        {
          if (*(_QWORD *)v111 != v72)
            objc_enumerationMutation(v65);
          v74 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * j);
          objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v68, v74, v69, v70);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v109, v76, v74, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v75, v80, (uint64_t)v79, v81, v82);

          objc_msgSend__similarLocationComparator(self, v83, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_sortUsingComparator_(v75, v88, (uint64_t)v87, v89, v90);

          objc_msgSend_firstObject(v75, v91, v92, v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v60, v96, (uint64_t)v95, v97, v98);

        }
        v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v68, (uint64_t)&v110, (uint64_t)v122, 16);
      }
      while (v71);
    }

    v8 = v103;
  }
  else
  {
    CWFGetOSLog();
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (v99)
    {
      CWFGetOSLog();
      v100 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v100 = MEMORY[0x1E0C81028];
      v101 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v125) = 0;
      _os_log_send_and_compose_impl();
    }

    v60 = v8;
  }

  return v60;
}

- (id)_homeNetworkFilter
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_predicateWithBlock_(MEMORY[0x1E0CB3880], a2, (uint64_t)&unk_1E6132720, v2, v3);
}

- (id)_localNetworkFilter
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  objc_msgSend_now(MEMORY[0x1E0C99D68], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__dateByAddingDays_(v5, v6, -2, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3880];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1B0678330;
  v17[3] = &unk_1E6133B88;
  v18 = v9;
  v11 = v9;
  objc_msgSend_predicateWithBlock_(v10, v12, (uint64_t)v17, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_similarLocationComparator
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1B0678484;
  v3[3] = &unk_1E6133BB0;
  v3[4] = self;
  return (id)MEMORY[0x1B5E0A4F8](v3, a2);
}

- (id)_lastJoinedComparator
{
  return &unk_1E61314C0;
}

- (id)_networkProfileUsageComparator
{
  return &unk_1E6133BF0;
}

- (id)_homeNetworkComparator
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1B06788A4;
  v3[3] = &unk_1E6133BB0;
  v3[4] = self;
  return (id)MEMORY[0x1B5E0A4F8](v3, a2);
}

- (unint64_t)maxResults
{
  return self->_maxResults;
}

- (void)setMaxResults:(unint64_t)a3
{
  self->_maxResults = a3;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_profiles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profiles, 0);
}

@end
