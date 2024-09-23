@implementation CLIndoorCommonHooks

+ (id)nearestVenues:()time_point<std:(std:()std:(1000000000>>>)a3 :(id)a4 ratio<1 :(id)a5 chrono:(double)a6 :(const NearestVenueSettings *)a7 duration<long)long :(BOOL)a8 chrono::steady_clock availableVenues:latestPosition:availabilityZScoreConfidenceInterval:settings:isAllowedMultipleVenues:
{
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id var2;
  GeographicCoordinate *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  id v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  uint64_t j;
  void *v86;
  uint64_t v87;
  double v88;
  double v89;
  uint64_t v90;
  double v91;
  id v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v108;
  id v109;
  id v110;
  const NearestVenueSettings *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  void *__p[2];
  uint64_t v123;
  _OWORD v124[10];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v110 = a4;
  v109 = a5;
  if (!a7->var0)
  {
    if (!a7->var2 && (objc_msgSend_isStaleFix_(v109, v13, a3.var0.__rep_, v14, v15) & 1) != 0)
    {
      v16 = 0;
      goto LABEL_45;
    }
    v111 = a7;
    objc_msgSend_filterLocationGroups_isRegionalSupported_(CLIndoorCommonHooks, v13, (uint64_t)v110, a7->var3, v15);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_count(v108, v17, v18, v19, v20))
    {
      v16 = 0;
LABEL_44:

      goto LABEL_45;
    }
    var2 = a7->var2;
    if (var2 || (var2 = v109) != 0)
      objc_msgSend_gpsLocation(var2, v21, v22, v23, v24);
    else
      memset(v124, 0, 156);
    v26 = [GeographicCoordinate alloc];
    v31 = (void *)objc_msgSend_initWithLatitude_longitude_andAltitude_(v26, v27, v28, v29, v30, *(_OWORD *)((char *)v124 + 4), 0.0);
    objc_msgSend_fromLatLon_(ECEFCoordinate, v32, (uint64_t)v31, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = *(double *)((char *)&v124[1] + 4) * a6;
    if (a8)
    {
      v37 = objc_alloc(MEMORY[0x24BDBCEF0]);
      v42 = objc_msgSend_count(v108, v38, v39, v40, v41);
      v16 = (id)objc_msgSend_initWithCapacity_(v37, v43, v42, v44, v45);
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v46 = v108;
      v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v112, (uint64_t)v125, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v113;
        do
        {
          for (i = 0; i != v52; ++i)
          {
            if (*(_QWORD *)v113 != v53)
              objc_enumerationMutation(v46);
            v55 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
            objc_msgSend_groupId(v55, v48, v49, v50, v51);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByAppendingString_(CFSTR("G"), v57, (uint64_t)v56, v58, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend_containsObject_(v16, v61, (uint64_t)v60, v62, v63) & 1) == 0)
            {
              objc_msgSend_distance_(v55, v64, (uint64_t)v35, v65, v66);
              v68 = v67;
              objc_msgSend_tolerance(v55, v69, v70, v71, v72);
              if (v68 - v36 - v76 < v111->var1)
                objc_msgSend_addObject_(v16, v73, (uint64_t)v60, v74, v75);
            }

          }
          v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v48, (uint64_t)&v112, (uint64_t)v125, 16);
        }
        while (v52);
      }

      goto LABEL_43;
    }
    __p[0] = 0;
    __p[1] = 0;
    v123 = 0;
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v77 = v108;
    v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v78, (uint64_t)&v118, (uint64_t)v126, 16);
    if (v82)
    {
      v83 = *(_QWORD *)v119;
      v84 = INFINITY;
      do
      {
        for (j = 0; j != v82; ++j)
        {
          if (*(_QWORD *)v119 != v83)
            objc_enumerationMutation(v77);
          v86 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * j);
          objc_msgSend_distance_(v86, v79, (uint64_t)v35, v80, v81);
          v89 = v88;
          if (v88 < v84)
          {
            objc_msgSend_tolerance(v86, v79, v87, v80, v81);
            if (v89 <= v36 + v91)
            {
              objc_msgSend_groupId(v86, v79, v90, v80, v81);
              v92 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v97 = objc_msgSend_UTF8String(v92, v93, v94, v95, v96);
              MEMORY[0x2199F8ED0](__p, v97);

              v84 = v89;
            }
          }
        }
        v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v79, (uint64_t)&v118, (uint64_t)v126, 16);
      }
      while (v82);
    }

    v98 = (void *)HIBYTE(v123);
    if (v123 < 0)
      v98 = __p[1];
    if (v98)
    {
      std::operator+<char>();
      if (SHIBYTE(v123) < 0)
        operator delete(__p[0]);
      *(_OWORD *)__p = v116;
      v123 = v117;
      v102 = (void *)MEMORY[0x24BDBCF20];
      if (v117 >= 0)
        objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v99, (uint64_t)__p, v100, v101);
      else
        objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v99, v116, v100, v101);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithObject_(v102, v104, (uint64_t)v103, v105, v106);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if ((v123 & 0x8000000000000000) == 0)
        goto LABEL_43;
    }
    else
    {
      v16 = 0;
      if ((v123 & 0x8000000000000000) == 0)
        goto LABEL_43;
    }
    operator delete(__p[0]);
LABEL_43:

    goto LABEL_44;
  }
  v16 = a7->var0;
LABEL_45:

  return v16;
}

+ (id)filterLocationGroups:(id)a3 isRegionalSupported:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v10 = v5;
  if (v4)
  {
    v11 = (id)objc_msgSend_copy(v5, v6, v7, v8, v9);
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v12 = v10;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v31, (uint64_t)v35, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v32;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v12);
          v17 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * v16);
          v22 = objc_msgSend_locationContext(v17, v18, v19, v20, v21, (_QWORD)v31);
          if ((objc_msgSend_isRegional_(CLLocationContextUtil, v23, v22, v24, v25) & 1) == 0)
            objc_msgSend_addObject_(v11, v26, (uint64_t)v17, v27, v28);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v29, (uint64_t)&v31, (uint64_t)v35, 16);
      }
      while (v14);
    }

  }
  return v11;
}

@end
