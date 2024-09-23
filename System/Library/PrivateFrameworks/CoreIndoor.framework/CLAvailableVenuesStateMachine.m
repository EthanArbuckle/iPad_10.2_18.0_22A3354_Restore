@implementation CLAvailableVenuesStateMachine

- (id)getNearbyLocationGroups:(id)a3 withUpdatedPos:(id)a4
{
  objc_msgSend_getNearbyLocationGroups_withUpdatedPos_nearLocationsOfInterest_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)computeAvailableVenues:(id)a3 nearCoordinates:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  id result;
  char v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  objc_msgSend_computeAvailableVenues_nearCoordinates_withError_(self, v8, (uint64_t)v6, (uint64_t)v7, (uint64_t)&v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_7;
  sub_21649FF18();
  objc_msgSend_computeAvailableVenues_nearCoordinates_withError_(self, v10, (uint64_t)v6, (uint64_t)v7, (uint64_t)&v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v9 = v11;
    goto LABEL_7;
  }
  sub_21649FF18();
  objc_msgSend_computeAvailableVenues_nearCoordinates_withError_(self, v12, (uint64_t)v6, (uint64_t)v7, (uint64_t)&v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_7:

    return v9;
  }
  sub_21649FF18();
  objc_msgSend_computeAvailableVenues_nearCoordinates_withError_(self, v13, (uint64_t)v6, (uint64_t)v7, (uint64_t)&v16);
  v14 = objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v9 = (void *)v14;
    goto LABEL_7;
  }
  sub_2164B0790();

  result = (id)abort_report_np();
  __break(1u);
  return result;
}

- (id)getNearbyLocationGroups:(id)a3 withUpdatedPos:(id)a4 nearLocationsOfInterest:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  void *v15;

  v8 = a4;
  v9 = a5;
  objc_msgSend_openTileParserAtPath_(self, v10, (uint64_t)a3, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_getNearbyLocationGroupsForTile_withUpdatedPos_nearLocationsOfInterest_(self, v13, (uint64_t)v14, (uint64_t)v8, (uint64_t)v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)getNearbyLocationGroupsForTile:(id)a3 withUpdatedPos:(id)a4 nearLocationsOfInterest:(id)a5
{
  id v8;
  id v9;
  id v10;
  CLIndoorAvailabilityTileParams *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t AvlTile;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  CLIndoorAvailabilityTileParams *v20;
  CLIndoorAvailabilityTileParams *availabilityTileParams;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  NSObject *v37;
  int v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [CLIndoorAvailabilityTileParams alloc];
  AvlTile = objc_msgSend_getAvlTile(v8, v12, v13, v14, v15);
  v20 = (CLIndoorAvailabilityTileParams *)objc_msgSend_initWithAvailabilityTile_(v11, v17, AvlTile, v18, v19);
  availabilityTileParams = self->_availabilityTileParams;
  self->_availabilityTileParams = v20;

  if (!self->_lastFix)
  {
    if (qword_253E5C3A8 == -1)
    {
      v37 = qword_253E5C3A0;
      if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
    }
    else
    {
      dispatch_once(&qword_253E5C3A8, &unk_24D570038);
      v37 = qword_253E5C3A0;
      if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
    }
    LOWORD(v39) = 0;
    _os_log_impl(&dword_216456000, v37, OS_LOG_TYPE_DEBUG, "No previous location stored in state, we should definitely recompute", (uint8_t *)&v39, 2u);
    goto LABEL_11;
  }
  if (qword_253E5C3A8 != -1)
    dispatch_once(&qword_253E5C3A8, &unk_24D570038);
  v22 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_latitude(self->_lastFix, v23, v24, v25, v26);
    v28 = v27;
    objc_msgSend_longitude(self->_lastFix, v29, v30, v31, v32);
    v39 = 134283777;
    v40 = v28;
    v41 = 2049;
    v42 = v33;
    _os_log_impl(&dword_216456000, v22, OS_LOG_TYPE_DEBUG, "Previous load occurred at %{private}.7lf, %{private}.7lf", (uint8_t *)&v39, 0x16u);
  }

LABEL_11:
  objc_msgSend_recomputeIfNecessary_withGlobalAvailabilityTile_andAdditionalLOIs_(self, v34, (uint64_t)v9, (uint64_t)v8, (uint64_t)v10);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)recomputeIfNecessary:(id)a3 withGlobalAvailabilityTile:(id)a4 andAdditionalLOIs:(id)a5
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL4 v30;
  NSObject *v32;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15 = v11;
  if (v9)
  {
    if (v11)
    {
      if (qword_253E5C3A8 != -1)
      {
        dispatch_once(&qword_253E5C3A8, &unk_24D570038);
        v16 = qword_253E5C3A0;
        if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
          goto LABEL_15;
        goto LABEL_5;
      }
      v16 = qword_253E5C3A0;
      if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:
        LOWORD(v34) = 0;
        v17 = "Have to recompute because we have locations of interest";
LABEL_14:
        _os_log_impl(&dword_216456000, v16, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v34, 2u);
      }
LABEL_15:
      objc_storeStrong((id *)&self->_lastFix, a3);
      goto LABEL_16;
    }
    if (objc_msgSend_shouldRecompute_(self, v12, (uint64_t)v9, v13, v14))
    {
      if (qword_253E5C3A8 == -1)
      {
        v16 = qword_253E5C3A0;
        if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
          goto LABEL_15;
      }
      else
      {
        dispatch_once(&qword_253E5C3A8, &unk_24D570038);
        v16 = qword_253E5C3A0;
        if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
          goto LABEL_15;
      }
      LOWORD(v34) = 0;
      v17 = "Have to recompute nearby location groups because we moved far enough away";
      goto LABEL_14;
    }
    if (qword_253E5C3A8 == -1)
    {
      v32 = qword_253E5C3A0;
      if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
      {
LABEL_24:
        v28 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&qword_253E5C3A8, &unk_24D570038);
      v32 = qword_253E5C3A0;
      if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
        goto LABEL_24;
    }
    v30 = self->_lastFix == 0;
    LODWORD(v34) = 67109120;
    HIDWORD(v34) = v30;
    _os_log_impl(&dword_216456000, v32, OS_LOG_TYPE_DEBUG, "No need to recompute nearby location groups, (_lastFix==nil) = %d", (uint8_t *)&v34, 8u);
    goto LABEL_24;
  }
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570038);
    v18 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    goto LABEL_8;
  }
  v18 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
  {
LABEL_8:
    LOWORD(v34) = 0;
    _os_log_impl(&dword_216456000, v18, OS_LOG_TYPE_DEBUG, "Have to recompute nearby location groups because newCoordinate was not nil?", (uint8_t *)&v34, 2u);
  }
LABEL_16:
  v19 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v23 = (void *)objc_msgSend_initWithArray_(v19, v20, (uint64_t)v15, v21, v22);
  v27 = v23;
  if (v9)
    objc_msgSend_addObject_(v23, v24, (uint64_t)v9, v25, v26);
  objc_msgSend_computeAvailableVenues_nearCoordinates_(self, v24, (uint64_t)v10, (uint64_t)v27, v26, v34, v35);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v28;
}

- (BOOL)shouldRecompute:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  GeographicCoordinate *lastFix;
  double v8;
  double v9;
  NSObject *v10;
  BOOL v11;
  int v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  lastFix = self->_lastFix;
  if (!lastFix)
  {
    v11 = 1;
    goto LABEL_7;
  }
  objc_msgSend_distBetweenLatLon_latlon1_(CLAvailableVenuesStateMachine, v4, (uint64_t)lastFix, (uint64_t)v6, v5);
  v9 = v8;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570038);
    v10 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
      goto LABEL_5;
    goto LABEL_4;
  }
  v10 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
  {
LABEL_4:
    v13 = 134217984;
    v14 = v9;
    _os_log_impl(&dword_216456000, v10, OS_LOG_TYPE_DEBUG, "@IndoorAvl, load, CLAvailableVenuesStateMachine, shouldRecompute, moveDist, %lf", (uint8_t *)&v13, 0xCu);
  }
LABEL_5:
  v11 = v9 >= self->_maxLoadRadius * 0.5;
LABEL_7:

  return v11;
}

- (id)openTileParserAtPath:(id)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  CLAvailabilityTileParser *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  int v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (qword_253E5C3A8 != -1)
    dispatch_once(&qword_253E5C3A8, &unk_24D570038);
  v4 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_absoluteString(v3, v5, v6, v7, v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v47 = 136315138;
    v48 = objc_msgSend_UTF8String(v9, v10, v11, v12, v13);
    _os_log_impl(&dword_216456000, v4, OS_LOG_TYPE_INFO, "Request to get nearby location groups from availability tile at %s", (uint8_t *)&v47, 0xCu);

  }
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v3, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_fileExistsAtPath_(v18, v24, (uint64_t)v23, v25, v26);

  if ((v27 & 1) == 0)
  {
    if (qword_253E5C3A8 == -1)
    {
      v33 = (id)qword_253E5C3A0;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
LABEL_11:
        v34 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      dispatch_once(&qword_253E5C3A8, &unk_24D570038);
      v33 = (id)qword_253E5C3A0;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        goto LABEL_11;
    }
    objc_msgSend_path(v3, v35, v36, v37, v38);
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v44 = objc_msgSend_UTF8String(v39, v40, v41, v42, v43);
    v47 = 136315138;
    v48 = v44;
    _os_log_impl(&dword_216456000, v33, OS_LOG_TYPE_INFO, "#warning, cannot find file %s on-disk", (uint8_t *)&v47, 0xCu);

    goto LABEL_11;
  }
  v28 = [CLAvailabilityTileParser alloc];
  v32 = objc_msgSend_initWithTilePathIncrementalIO_(v28, v29, (uint64_t)v3, v30, v31);
  v33 = v32;
  if (!v32)
  {
    if (qword_253E5C3A8 == -1)
    {
      v45 = qword_253E5C3A0;
      if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:
        v34 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      dispatch_once(&qword_253E5C3A8, &unk_24D570038);
      v45 = qword_253E5C3A0;
      if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
    }
    LOWORD(v47) = 0;
    _os_log_impl(&dword_216456000, v45, OS_LOG_TYPE_DEFAULT, "#Warning Couldn't load availability tile - ignoring request for nearby locations", (uint8_t *)&v47, 2u);
    goto LABEL_15;
  }
  v33 = v32;
  v34 = v33;
LABEL_16:

  return v34;
}

- (id)computeAvailableVenues:(id)a3 nearCoordinates:(id)a4 withError:(BOOL *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  ECEFCoordinate *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t AvlTile;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  _QWORD *v62;
  _QWORD **i;
  _QWORD *v64;
  int v65;
  _QWORD *v66;
  _QWORD *v67;
  BOOL v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  _BYTE *v72;
  int v73;
  uint64_t v74;
  int v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  NSObject *v81;
  void **v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  id v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t LocationContextFromVenueBounds;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  _QWORD **v124;
  _QWORD *v125;
  _QWORD **v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t *v129;
  uint64_t **j;
  uint64_t **v131;
  unint64_t v132;
  uint64_t *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  ECEFCoordinate *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  NSObject *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  id v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t k;
  id v194;
  const char *v195;
  uint64_t v196;
  double v197;
  double v198;
  BOOL v199;
  const char *v200;
  NSObject *v201;
  void **v202;
  int v203;
  int v204;
  double maxLoadRadius;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  CLLocationGroup *v209;
  const char *v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  double ***Vertices;
  const char *v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  _QWORD *v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  unint64_t v238;
  _QWORD *v239;
  _QWORD *v240;
  _QWORD *v241;
  uint64_t v242;
  unint64_t v243;
  uint64_t v244;
  unint64_t v245;
  char *v246;
  char *v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void **v258;
  NSObject *v259;
  os_log_type_t v260;
  const char *v261;
  NSObject *v262;
  id v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  NSObject *v269;
  void **v270;
  uint64_t v271;
  void **v272;
  NSObject *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  NSObject *v277;
  NSObject *v278;
  id v279;
  NSObject *v281;
  NSObject *v282;
  NSObject *v283;
  NSObject *v284;
  int v285;
  NSObject *v286;
  int v287;
  NSObject *v288;
  int v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  uint64_t v294;
  id v295;
  BOOL *v296;
  uint64_t *v297;
  ECEFCoordinate *v298;
  BOOL v299;
  uint64_t *v300;
  int v301;
  GeographicCoordinate *v302;
  void *v303;
  uint64_t v304;
  id v305;
  void *v306;
  GeographicCoordinate *v307;
  id obj;
  uint64_t v310;
  void *v311;
  void *v312;
  ENUCoordinate *v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  _QWORD *v322;
  _QWORD *v323;
  uint64_t v324;
  uint64_t **v325;
  uint64_t *v326;
  uint64_t v327;
  void *__p[2];
  char v329;
  _BYTE v330[128];
  uint8_t v331[128];
  _BYTE v332[88];
  uint8_t buf[4];
  uint64_t v334;
  __int16 v335;
  _BYTE v336[10];
  int v337;
  uint64_t *v338;
  int v339;
  uint64_t v340;
  char v341;
  uint64_t v342;

  v342 = *MEMORY[0x24BDAC8D0];
  v305 = a3;
  v295 = a4;
  v296 = a5;
  *a5 = 0;
  v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v11 = (void *)objc_msgSend_initWithCapacity_(v7, v8, 120, v9, v10);
  v12 = 120;
  do
  {
    v13 = objc_alloc_init(ECEFCoordinate);
    objc_msgSend_addObject_(v11, v14, (uint64_t)v13, v15, v16);

    --v12;
  }
  while (v12);
  v17 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v306 = (void *)objc_msgSend_initWithCapacity_(v17, v18, 120, v19, v20);
  v312 = v11;
  v307 = objc_alloc_init(GeographicCoordinate);
  v313 = objc_alloc_init(ENUCoordinate);
  v298 = objc_alloc_init(ECEFCoordinate);
  v302 = objc_alloc_init(GeographicCoordinate);
  v25 = objc_msgSend_numVenuesExpected(v305, v21, v22, v23, v24);
  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v26, v25, v27, v28);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_numTotalExpectedExteriorsInVenues(v305, v29, v30, v31, v32);
  v301 = v25;
  if (qword_253E5C3A8 != -1)
    dispatch_once(&qword_253E5C3A8, &unk_24D570038);
  v34 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v334 = v33;
    _os_log_impl(&dword_216456000, v34, OS_LOG_TYPE_INFO, "@IndoorAvl, load, Reserving %zu entries for AvailabilityTile entries in result", buf, 0xCu);
  }

  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v35, v33, v36, v37);
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_253E5C3A8 != -1)
    dispatch_once(&qword_253E5C3A8, &unk_24D570038);
  v38 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v334) = v301;
    _os_log_impl(&dword_216456000, v38, OS_LOG_TYPE_INFO, "@IndoorAvl, load, iterating over %d venues in the availability tile", buf, 8u);
  }

  if (v301 >= 1)
  {
    v292 = 0;
    MEMORY[0x2199F91F4]();
    sub_216467224((uint64_t)buf);
    if (!objc_msgSend_tileIsOpenForIncrementalIO(v305, v43, v44, v45, v46))
    {
      AvlTile = objc_msgSend_getAvlTile(v305, v47, v48, v49, v50);
      sub_2164A6020(AvlTile, 0, (uint64_t)v332);
      sub_2164AB648((uint64_t)buf, (uint64_t)v332);
      sub_2164636CC(v332);
    }
    if ((objc_msgSend_getNextVenueBoundsIncrementally_(v305, v47, (uint64_t)buf, v49, v50) & 1) == 0)
    {
      if (qword_253E5C3A8 == -1)
      {
        v51 = qword_253E5C3A0;
        if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
        {
LABEL_17:
          *v296 = 1;
          goto LABEL_211;
        }
      }
      else
      {
        dispatch_once(&qword_253E5C3A8, &unk_24D570038);
        v51 = qword_253E5C3A0;
        if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
          goto LABEL_17;
      }
      *(_WORD *)v332 = 0;
      _os_log_impl(&dword_216456000, v51, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, failed to incrementally read venue bounds from tile", v332, 2u);
      goto LABEL_17;
    }
    sub_216464214(&v336[2], ", ", (uint64_t)__p);
    if (v339)
    {
      v326 = 0;
      v327 = 0;
      v325 = &v326;
      v323 = 0;
      v324 = 0;
      v322 = &v323;
      if ((v341 & 4) != 0)
      {
        v57 = v340;
        if (!v340)
          v57 = *(_QWORD *)(qword_253E5C8A0 + 64);
        sub_216464E0C(v332, v57);
        v58 = *(unsigned int *)&v332[24];
        if (*(int *)&v332[24] < 1)
          goto LABEL_70;
        v59 = 0;
        v60 = v324;
LABEL_29:
        v61 = *(_DWORD *)(*(_QWORD *)&v332[16] + 4 * v59);
        v62 = v323;
        for (i = &v323; ; v62 = *i)
        {
          v64 = i;
          if (!v62)
            break;
          while (1)
          {
            i = (_QWORD **)v62;
            v65 = *((_DWORD *)v62 + 7);
            if (v61 < v65)
              break;
            if (v65 >= v61)
              goto LABEL_28;
            v62 = i[1];
            if (!v62)
            {
              v64 = i + 1;
              goto LABEL_36;
            }
          }
        }
LABEL_36:
        v66 = operator new(0x20uLL);
        *((_DWORD *)v66 + 7) = v61;
        *v66 = 0;
        v66[1] = 0;
        v66[2] = i;
        *v64 = v66;
        if (*v322)
        {
          v322 = (_QWORD *)*v322;
          v66 = (_QWORD *)*v64;
        }
        v67 = v323;
        v68 = v66 == v323;
        *((_BYTE *)v66 + 24) = v66 == v323;
        if (v68)
          goto LABEL_27;
        while (1)
        {
          v69 = v66[2];
          if (*(_BYTE *)(v69 + 24))
            goto LABEL_27;
          v70 = *(_QWORD **)(v69 + 16);
          v71 = *v70;
          if (*v70 == v69)
          {
            v74 = v70[1];
            if (!v74 || (v75 = *(unsigned __int8 *)(v74 + 24), v72 = (_BYTE *)(v74 + 24), v75))
            {
              if (*(_QWORD **)v69 == v66)
              {
                *(_BYTE *)(v69 + 24) = 1;
                *((_BYTE *)v70 + 24) = 0;
                v78 = *(_QWORD *)(v69 + 8);
                *v70 = v78;
                if (v78)
                  goto LABEL_53;
              }
              else
              {
                v76 = *(uint64_t **)(v69 + 8);
                v77 = *v76;
                *(_QWORD *)(v69 + 8) = *v76;
                if (v77)
                {
                  *(_QWORD *)(v77 + 16) = v69;
                  v70 = *(_QWORD **)(v69 + 16);
                }
                v76[2] = (uint64_t)v70;
                *(_QWORD *)(*(_QWORD *)(v69 + 16) + 8 * (**(_QWORD **)(v69 + 16) != v69)) = v76;
                *v76 = v69;
                *(_QWORD *)(v69 + 16) = v76;
                v70 = (_QWORD *)v76[2];
                v69 = *v70;
                *((_BYTE *)v76 + 24) = 1;
                *((_BYTE *)v70 + 24) = 0;
                v78 = *(_QWORD *)(v69 + 8);
                *v70 = v78;
                if (v78)
LABEL_53:
                  *(_QWORD *)(v78 + 16) = v70;
              }
              *(_QWORD *)(v69 + 16) = v70[2];
              *(_QWORD *)(v70[2] + 8 * (*(_QWORD *)v70[2] != (_QWORD)v70)) = v69;
              *(_QWORD *)(v69 + 8) = v70;
LABEL_26:
              v70[2] = v69;
LABEL_27:
              v324 = ++v60;
LABEL_28:
              if (++v59 != v58)
                goto LABEL_29;
LABEL_70:
              sub_216464CA0(v332);
            }
          }
          else if (!v71 || (v73 = *(unsigned __int8 *)(v71 + 24), v72 = (_BYTE *)(v71 + 24), v73))
          {
            if (*(_QWORD **)v69 == v66)
            {
              v79 = v66[1];
              *(_QWORD *)v69 = v79;
              if (v79)
              {
                *(_QWORD *)(v79 + 16) = v69;
                v70 = *(_QWORD **)(v69 + 16);
              }
              v66[2] = v70;
              *(_QWORD *)(*(_QWORD *)(v69 + 16) + 8 * (**(_QWORD **)(v69 + 16) != v69)) = v66;
              v66[1] = v69;
              *(_QWORD *)(v69 + 16) = v66;
              v70 = (_QWORD *)v66[2];
            }
            else
            {
              v66 = (_QWORD *)v66[2];
            }
            *((_BYTE *)v66 + 24) = 1;
            *((_BYTE *)v70 + 24) = 0;
            v69 = v70[1];
            v80 = *(_QWORD **)v69;
            v70[1] = *(_QWORD *)v69;
            if (v80)
              v80[2] = v70;
            *(_QWORD *)(v69 + 16) = v70[2];
            *(_QWORD *)(v70[2] + 8 * (*(_QWORD *)v70[2] != (_QWORD)v70)) = v69;
            *(_QWORD *)v69 = v70;
            goto LABEL_26;
          }
          *(_BYTE *)(v69 + 24) = 1;
          v66 = v70;
          *((_BYTE *)v70 + 24) = v70 == v67;
          *v72 = 1;
          if (v70 == v67)
            goto LABEL_27;
        }
      }
      objc_msgSend_removeAllObjects(v303, v53, v54, v55, v56);
      if (v337 < 1)
        goto LABEL_203;
      v86 = 0;
      v87 = 0;
      while (1)
      {
        v88 = *(_QWORD *)(*(_QWORD *)&v336[2] + 8 * v86);
        if (*(char *)(v88 + 23) < 0)
          v88 = *(_QWORD *)v88;
        objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v83, v88, v84, v85);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_hasPrefix_(v89, v90, (uint64_t)CFSTR("G"), v91, v92))
        {
          if (!v87)
          {
            if (!objc_msgSend_isVenueDisabled_locationId_(self, v93, (uint64_t)v89, 0, v95))
            {
              v87 = v89;
              goto LABEL_91;
            }
            if (qword_253E5C3A8 != -1)
              dispatch_once(&qword_253E5C3A8, &unk_24D570038);
            v262 = (id)qword_253E5C3A0;
            if (os_log_type_enabled(v262, OS_LOG_TYPE_DEBUG))
            {
              v263 = objc_retainAutorelease(v89);
              v268 = objc_msgSend_UTF8String(v263, v264, v265, v266, v267);
              *(_DWORD *)v332 = 136315138;
              *(_QWORD *)&v332[4] = v268;
              _os_log_impl(&dword_216456000, v262, OS_LOG_TYPE_DEBUG, "%s in availability tile is disabled by settings", v332, 0xCu);
            }

LABEL_203:
            if (qword_253E5C3A8 == -1)
            {
              v269 = qword_253E5C3A0;
              if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEFAULT))
              {
LABEL_205:
                v270 = __p;
                if (v329 < 0)
                  v270 = (void **)__p[0];
                *(_DWORD *)v332 = 136315138;
                *(_QWORD *)&v332[4] = v270;
                _os_log_impl(&dword_216456000, v269, OS_LOG_TYPE_DEFAULT, "#Warning Cannot find location group in venue [%s]", v332, 0xCu);
              }
            }
            else
            {
              dispatch_once(&qword_253E5C3A8, &unk_24D570038);
              v269 = qword_253E5C3A0;
              if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEFAULT))
                goto LABEL_205;
            }
            v87 = 0;
            goto LABEL_209;
          }

          if (qword_253E5C3A8 == -1)
          {
            v257 = qword_253E5C3A0;
            if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
              goto LABEL_209;
            goto LABEL_195;
          }
          dispatch_once(&qword_253E5C3A8, &unk_24D570038);
          v257 = qword_253E5C3A0;
          if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
          {
LABEL_195:
            v258 = __p;
            if (v329 < 0)
              v258 = (void **)__p[0];
            *(_DWORD *)v332 = 136446210;
            *(_QWORD *)&v332[4] = v258;
            v259 = v257;
            v260 = OS_LOG_TYPE_ERROR;
            v261 = "Multiple groups associated with venue [%{public}s].  Ignoring from availability tile";
            goto LABEL_217;
          }
LABEL_209:
          sub_216463914((uint64_t)&v322, v323);
          sub_216463914((uint64_t)&v325, v326);

          if ((v329 & 0x80000000) == 0)
            goto LABEL_211;
          goto LABEL_210;
        }
        if (!objc_msgSend_hasPrefix_(v89, v93, (uint64_t)CFSTR("L"), v94, v95))
        {
          if (qword_253E5C3A8 != -1)
            dispatch_once(&qword_253E5C3A8, &unk_24D570038);
          v101 = (id)qword_253E5C3A0;
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
          {
            v108 = objc_retainAutorelease(v89);
            v113 = objc_msgSend_UTF8String(v108, v109, v110, v111, v112);
            *(_DWORD *)v332 = 136315138;
            *(_QWORD *)&v332[4] = v113;
            _os_log_impl(&dword_216456000, v101, OS_LOG_TYPE_DEFAULT, "#Warning Encountered invalid venue id %s in availability tile. Skipping", v332, 0xCu);
          }
          goto LABEL_90;
        }
        if (objc_msgSend_isVenueDisabled_locationId_(self, v96, 0, (uint64_t)v89, v97))
        {
          if (qword_253E5C3A8 != -1)
            dispatch_once(&qword_253E5C3A8, &unk_24D570038);
          v101 = (id)qword_253E5C3A0;
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
          {
            v102 = objc_retainAutorelease(v89);
            v107 = objc_msgSend_UTF8String(v102, v103, v104, v105, v106);
            *(_DWORD *)v332 = 136315138;
            *(_QWORD *)&v332[4] = v107;
            _os_log_impl(&dword_216456000, v101, OS_LOG_TYPE_DEBUG, "%s in availability tile is disabled by settings", v332, 0xCu);
          }
LABEL_90:

          goto LABEL_91;
        }
        objc_msgSend_addObject_(v303, v98, (uint64_t)v89, v99, v100);
        if (v86 >= v337)
        {
          sub_2164B0A04();
          abort_report_np();
          goto LABEL_268;
        }
        if ((v341 & 4) != 0)
        {
          v123 = v323;
          if (!v323)
            goto LABEL_91;
          v124 = &v323;
          do
          {
            v125 = v123;
            v126 = v124;
            v127 = *((int *)v123 + 7);
            if (v86 <= v127)
              v124 = (_QWORD **)v123;
            else
              ++v123;
            v123 = (_QWORD *)*v123;
          }
          while (v123);
          if (v124 == &v323)
            goto LABEL_91;
          if (v86 > v127)
            v125 = v126;
          if (v86 < *((int *)v125 + 7))
            goto LABEL_91;
        }
        else
        {
          LocationContextFromVenueBounds = objc_msgSend_getLocationContextFromVenueBounds_(CLAvailableVenuesStateMachine, v115, (uint64_t)buf, v117, v118);
          if (!objc_msgSend_isRegional_(CLLocationContextUtil, v120, LocationContextFromVenueBounds, v121, v122))goto LABEL_91;
        }
        v128 = objc_msgSend_count(v303, v115, v116, v117, v118) - 1;
        v129 = v326;
        for (j = &v326; ; v129 = *j)
        {
          v131 = j;
          if (!v129)
            goto LABEL_114;
LABEL_110:
          j = (uint64_t **)v129;
          v132 = v129[4];
          if (v128 >= v132)
            break;
        }
        if (v132 >= v128)
          goto LABEL_91;
        v129 = j[1];
        if (v129)
          goto LABEL_110;
        v131 = j + 1;
LABEL_114:
        v133 = (uint64_t *)operator new(0x28uLL);
        v133[4] = v128;
        *v133 = 0;
        v133[1] = 0;
        v133[2] = (uint64_t)j;
        *v131 = v133;
        if (*v325)
        {
          v325 = (uint64_t **)*v325;
          v133 = *v131;
        }
        sub_21649FFE0(v326, v133);
        ++v327;
LABEL_91:

        if (++v86 >= v337)
        {
          if (!v87)
            goto LABEL_203;
          if (!objc_msgSend_count(v303, v83, v114, v84, v85) || !v303)
          {
            if (qword_253E5C3A8 == -1)
            {
              v271 = qword_253E5C3A0;
              if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEFAULT))
                goto LABEL_209;
            }
            else
            {
              dispatch_once(&qword_253E5C3A8, &unk_24D570038);
              v271 = qword_253E5C3A0;
              if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEFAULT))
                goto LABEL_209;
            }
            v272 = __p;
            if (v329 < 0)
              v272 = (void **)__p[0];
            *(_DWORD *)v332 = 136315138;
            *(_QWORD *)&v332[4] = v272;
            v259 = v271;
            v260 = OS_LOG_TYPE_DEFAULT;
            v261 = "#Warning No venues associated with availability tile [%s]";
LABEL_217:
            _os_log_impl(&dword_216456000, v259, v260, v261, v332, 0xCu);
            goto LABEL_209;
          }
          v138 = objc_msgSend_count(v303, v134, v135, v136, v137);
          objc_msgSend_substringFromIndex_(v87, v139, 1, v140, v141);
          v291 = objc_claimAutoreleasedReturnValue();

          v290 = objc_msgSend_getLocationContextFromVenueBounds_(CLAvailableVenuesStateMachine, v142, (uint64_t)buf, v143, v144);
          v294 = v138;
          if (!v339)
          {
LABEL_218:
            v87 = (id)v291;
            goto LABEL_209;
          }
          v299 = 0;
          v300 = v338;
          v297 = &v338[v339];
          while (2)
          {
            if (v299)
            {
              v299 = 1;
              goto LABEL_123;
            }
            v149 = *(unsigned int *)(*v300 + 24);
            v304 = *v300;
            if ((_DWORD)v149 == *(_DWORD *)(*v300 + 48))
            {
              if ((v149 & 0x80000000) == 0)
              {
                if (objc_msgSend_count(v11, v145, v146, v147, v148) < v149)
                {
                  v154 = objc_msgSend_count(v11, v150, v151, v152, v153);
                  if (v149 != v154)
                  {
                    if (v149 - v154 <= 1)
                      v155 = 1;
                    else
                      v155 = v149 - v154;
                    do
                    {
                      v156 = objc_alloc_init(ECEFCoordinate);
                      objc_msgSend_addObject_(v11, v157, (uint64_t)v156, v158, v159);

                      --v155;
                    }
                    while (v155);
                  }
                  if (qword_253E5C3A8 == -1)
                  {
                    v160 = qword_253E5C3A0;
                    if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_FAULT))
                      goto LABEL_135;
                  }
                  else
                  {
                    dispatch_once(&qword_253E5C3A8, &unk_24D570038);
                    v160 = qword_253E5C3A0;
                    if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_FAULT))
                    {
LABEL_135:
                      *(_DWORD *)v332 = 67109120;
                      *(_DWORD *)&v332[4] = v149;
                      _os_log_impl(&dword_216456000, v160, OS_LOG_TYPE_FAULT, "@IndoorAvl, load, Needed to allocate additional ECEFCoordinates for the pool: total required %d", v332, 8u);
                    }
                  }
                }
                if ((int)v149 >= 1)
                {
                  v161 = 0;
                  v162 = 8 * v149;
                  do
                  {
                    objc_msgSend_setFromLatitude_longitude_andAltitude_(v307, v150, v151, v152, v153, *(double *)(*(_QWORD *)(v304 + 16) + v161), *(double *)(*(_QWORD *)(v304 + 40) + v161), 0.0);
                    objc_msgSend_lastObject(v11, v163, v164, v165, v166);
                    v167 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_removeLastObject(v11, v168, v169, v170, v171);
                    objc_msgSend_setFromLatLon_(v167, v172, (uint64_t)v307, v173, v174);
                    objc_msgSend_addObject_(v306, v175, (uint64_t)v167, v176, v177);

                    v161 += 8;
                  }
                  while (v162 != v161);
                }
                objc_msgSend_storeAverage_ofVertices_(CLLocationGroup, v150, (uint64_t)v298, (uint64_t)v306, v153);
                objc_msgSend_setFromECEFCoordinate_(v302, v178, (uint64_t)v298, v179, v180);
                if (objc_msgSend_count(v295, v181, v182, v183, v184))
                {
                  v320 = 0u;
                  v321 = 0u;
                  v318 = 0u;
                  v319 = 0u;
                  v189 = v295;
                  v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(v189, v190, (uint64_t)&v318, (uint64_t)v331, 16);
                  if (v191)
                  {
                    v192 = *(_QWORD *)v319;
                    do
                    {
                      for (k = 0; k != v191; ++k)
                      {
                        if (*(_QWORD *)v319 != v192)
                          objc_enumerationMutation(v189);
                        v194 = *(id *)(*((_QWORD *)&v318 + 1) + 8 * k);
                        objc_msgSend_distBetweenLatLon_latlon1_(CLAvailableVenuesStateMachine, v195, (uint64_t)v302, (uint64_t)v194, v196);
                        v198 = v197;
                        v199 = v197 >= self->_maxLoadRadius;

                        if (!v199)
                          goto LABEL_156;
                      }
                      v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(v189, v200, (uint64_t)&v318, (uint64_t)v331, 16);
                    }
                    while (v191);
                  }
                  else
                  {
                    v198 = 1.79769313e308;
                  }
LABEL_156:

                }
                else
                {
                  v198 = 0.0;
                }
                maxLoadRadius = self->_maxLoadRadius;
                v299 = v198 > maxLoadRadius;
                if (v198 > maxLoadRadius)
                {
                  v294 -= objc_msgSend_count(v303, v185, v186, v187, v188);
                }
                else
                {
                  v209 = [CLLocationGroup alloc];
                  v211 = (void *)objc_msgSend_initWithGroupId_locationIds_center_wifiOnlyDownloadLocIdxs_locationContext_andTolerance_(v209, v210, v291, (uint64_t)v303, (uint64_t)v298, &v325, v290, *(double *)(v304 + 64));
                  v311 = v211;
                  Vertices = (double ***)objc_msgSend_getVertices(v211, v212, v213, v214, v215);
                  v316 = 0u;
                  v317 = 0u;
                  v314 = 0u;
                  v315 = 0u;
                  obj = v306;
                  v218 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v217, (uint64_t)&v314, (uint64_t)v330, 16);
                  v223 = v218;
                  if (v218)
                  {
                    v310 = *(_QWORD *)v315;
                    do
                    {
                      v224 = 0;
                      do
                      {
                        if (*(_QWORD *)v315 != v310)
                          objc_enumerationMutation(obj);
                        v225 = *(void **)(*((_QWORD *)&v314 + 1) + 8 * v224);
                        v226 = *Vertices;
                        objc_msgSend_centerLatLon(v211, v219, v220, v221, v222);
                        v227 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_centerECEF(v211, v228, v229, v230, v231);
                        v232 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_toBoostEnuWithLatLonOrigin_andEcefOrigin_usingENU_(v225, v233, (uint64_t)v227, (uint64_t)v232, (uint64_t)v313);
                        v236 = v234;
                        v237 = v235;
                        v239 = (_QWORD *)v226[1];
                        v238 = v226[2];
                        if ((unint64_t)v239 < v238)
                        {
                          *v239 = v234;
                          v239[1] = v235;
                          v240 = v239 + 2;
                          v11 = v312;
                          goto LABEL_180;
                        }
                        v241 = (_QWORD *)*v226;
                        v242 = ((uint64_t)v239 - *v226) >> 4;
                        v243 = v242 + 1;
                        if ((unint64_t)(v242 + 1) >> 60)
                          sub_2164A0194();
                        v244 = v238 - (_QWORD)v241;
                        if (v244 >> 3 > v243)
                          v243 = v244 >> 3;
                        if ((unint64_t)v244 >= 0x7FFFFFFFFFFFFFF0)
                          v245 = 0xFFFFFFFFFFFFFFFLL;
                        else
                          v245 = v243;
                        if (v245)
                        {
                          if (v245 >> 60)
                            sub_21646B534();
                          v246 = (char *)operator new(16 * v245);
                          v247 = &v246[16 * v242];
                          *(_QWORD *)v247 = v236;
                          *((_QWORD *)v247 + 1) = v237;
                          v248 = (uint64_t)v247;
                          if (v239 == v241)
                          {
LABEL_183:
                            v11 = v312;
                            v240 = v247 + 16;
                            *v226 = v248;
                            v226[1] = v247 + 16;
                            v226[2] = &v246[16 * v245];
                            if (v239)
                              goto LABEL_179;
                            goto LABEL_180;
                          }
                        }
                        else
                        {
                          v246 = 0;
                          v247 = (char *)(16 * v242);
                          *(_QWORD *)v247 = v234;
                          *((_QWORD *)v247 + 1) = v235;
                          v248 = 16 * v242;
                          if (v239 == v241)
                            goto LABEL_183;
                        }
                        v11 = v312;
                        do
                        {
                          *(_OWORD *)(v248 - 16) = *((_OWORD *)v239 - 1);
                          v248 -= 16;
                          v239 -= 2;
                        }
                        while (v239 != v241);
                        v239 = (_QWORD *)*v226;
                        v240 = v247 + 16;
                        *v226 = v248;
                        v226[1] = v247 + 16;
                        v226[2] = &v246[16 * v245];
                        if (v239)
LABEL_179:
                          operator delete(v239);
LABEL_180:
                        v226[1] = v240;

                        v211 = v311;
                        ++v224;
                      }
                      while (v224 != v223);
                      v249 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v219, (uint64_t)&v314, (uint64_t)v330, 16, *((*Vertices)[1] - 1));
                      v223 = v249;
                    }
                    while (v249);
                  }

                  if (*(_DWORD *)(v304 + 48) != ((char *)(*Vertices)[1] - (char *)**Vertices) >> 4)
                  {
                    sub_2164B08AC();

                    abort_report_np();
                    goto LABEL_268;
                  }
                  sub_216465B44(*Vertices);
                  objc_msgSend_addObject_(v293, v250, (uint64_t)v311, v251, v252);

                  ++v292;
                }
                objc_msgSend_addObjectsFromArray_(v11, v206, (uint64_t)v306, v207, v208);
                objc_msgSend_removeAllObjects(v306, v253, v254, v255, v256);
LABEL_123:
                if (++v300 == v297)
                  goto LABEL_218;
                continue;
              }
              sub_21649FECC();
              v284 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v284, OS_LOG_TYPE_FAULT))
              {
                v285 = *(_DWORD *)(v304 + 48);
                *(_DWORD *)v332 = 68289795;
                *(_DWORD *)&v332[4] = 0;
                *(_WORD *)&v332[8] = 2082;
                *(_QWORD *)&v332[10] = "";
                *(_WORD *)&v332[18] = 1026;
                *(_DWORD *)&v332[20] = v285;
                *(_WORD *)&v332[24] = 2082;
                *(_QWORD *)&v332[26] = "assert";
                *(_WORD *)&v332[34] = 2081;
                *(_QWORD *)&v332[36] = "exterior.longitude_size() >= 0";
                _os_log_impl(&dword_216456000, v284, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"@IndoorAvl, load, exterior longitude_size() returned a negative value?!\", \"longitude_size\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v332, 0x2Cu);
              }

              sub_21649FECC();
              v286 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v286))
              {
                v287 = *(_DWORD *)(v304 + 48);
                *(_DWORD *)v332 = 68289795;
                *(_DWORD *)&v332[4] = 0;
                *(_WORD *)&v332[8] = 2082;
                *(_QWORD *)&v332[10] = "";
                *(_WORD *)&v332[18] = 1026;
                *(_DWORD *)&v332[20] = v287;
                *(_WORD *)&v332[24] = 2082;
                *(_QWORD *)&v332[26] = "assert";
                *(_WORD *)&v332[34] = 2081;
                *(_QWORD *)&v332[36] = "exterior.longitude_size() >= 0";
                _os_signpost_emit_with_name_impl(&dword_216456000, v286, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "@IndoorAvl, load, exterior longitude_size() returned a negative value?!", "{\"msg%{public}.0s\":\"@IndoorAvl, load, exterior longitude_size() returned a negative value?!\", \"longitude_size\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v332, 0x2Cu);
              }

              sub_21649FECC();
              v288 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v288, OS_LOG_TYPE_INFO))
              {
                v289 = *(_DWORD *)(v304 + 48);
                *(_DWORD *)v332 = 68289795;
                *(_DWORD *)&v332[4] = 0;
                *(_WORD *)&v332[8] = 2082;
                *(_QWORD *)&v332[10] = "";
                *(_WORD *)&v332[18] = 1026;
                *(_DWORD *)&v332[20] = v289;
                *(_WORD *)&v332[24] = 2082;
                *(_QWORD *)&v332[26] = "assert";
                *(_WORD *)&v332[34] = 2081;
                *(_QWORD *)&v332[36] = "exterior.longitude_size() >= 0";
                _os_log_impl(&dword_216456000, v288, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"@IndoorAvl, load, exterior longitude_size() returned a negative value?!\", \"longitude_size\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v332, 0x2Cu);
              }

              abort_report_np();
LABEL_268:
              while (2)
              {
                __break(1u);
                dispatch_once(&qword_253E5C3A8, &unk_24D570038);
                v281 = (id)qword_253E5C3A0;
                if (os_log_type_enabled(v281, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)v332 = 68289539;
                  *(_DWORD *)&v332[4] = 0;
                  *(_WORD *)&v332[8] = 2082;
                  *(_QWORD *)&v332[10] = "";
                  *(_WORD *)&v332[18] = 2082;
                  *(_QWORD *)&v332[20] = "assert";
                  *(_WORD *)&v332[28] = 2081;
                  *(_QWORD *)&v332[30] = "!std::isnan(vertexENU.x())";
                  _os_log_impl(&dword_216456000, v281, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"vertexENU.x() must not be NaN\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v332, 0x26u);
                }

                if (qword_253E5C3A8 == -1)
                {
                  v282 = (id)qword_253E5C3A0;
                  if (os_signpost_enabled(v282))
                    goto LABEL_251;
                }
                else
                {
                  dispatch_once(&qword_253E5C3A8, &unk_24D570038);
                  v282 = (id)qword_253E5C3A0;
                  if (os_signpost_enabled(v282))
                  {
LABEL_251:
                    *(_DWORD *)v332 = 68289539;
                    *(_DWORD *)&v332[4] = 0;
                    *(_WORD *)&v332[8] = 2082;
                    *(_QWORD *)&v332[10] = "";
                    *(_WORD *)&v332[18] = 2082;
                    *(_QWORD *)&v332[20] = "assert";
                    *(_WORD *)&v332[28] = 2081;
                    *(_QWORD *)&v332[30] = "!std::isnan(vertexENU.x())";
                    _os_signpost_emit_with_name_impl(&dword_216456000, v282, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "vertexENU.x() must not be NaN", "{\"msg%{public}.0s\":\"vertexENU.x() must not be NaN\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v332, 0x26u);
                  }
                }

                if (qword_253E5C3A8 != -1)
                  dispatch_once(&qword_253E5C3A8, &unk_24D570038);
                v283 = (id)qword_253E5C3A0;
                if (os_log_type_enabled(v283, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v332 = 68289539;
                  *(_DWORD *)&v332[4] = 0;
                  *(_WORD *)&v332[8] = 2082;
                  *(_QWORD *)&v332[10] = "";
                  *(_WORD *)&v332[18] = 2082;
                  *(_QWORD *)&v332[20] = "assert";
                  *(_WORD *)&v332[28] = 2081;
                  *(_QWORD *)&v332[30] = "!std::isnan(vertexENU.x())";
                  _os_log_impl(&dword_216456000, v283, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"vertexENU.x() must not be NaN\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v332, 0x26u);
                }

                abort_report_np();
                continue;
              }
            }
            break;
          }
          if (qword_253E5C3A8 == -1)
          {
            v201 = qword_253E5C3A0;
            if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
            {
LABEL_151:
              v202 = __p;
              if (v329 < 0)
                v202 = (void **)__p[0];
              v203 = *(_DWORD *)(v304 + 24);
              v204 = *(_DWORD *)(v304 + 48);
              *(_DWORD *)v332 = 136446722;
              *(_QWORD *)&v332[4] = v202;
              *(_WORD *)&v332[12] = 1026;
              *(_DWORD *)&v332[14] = v203;
              *(_WORD *)&v332[18] = 1026;
              *(_DWORD *)&v332[20] = v204;
              _os_log_impl(&dword_216456000, v201, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, exterior polygon of venue [%{public}s] is corrupt.  %{public}d latitudes, %{public}d longitudes", v332, 0x18u);
              v299 = 0;
              goto LABEL_123;
            }
          }
          else
          {
            dispatch_once(&qword_253E5C3A8, &unk_24D570038);
            v201 = qword_253E5C3A0;
            if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
              goto LABEL_151;
          }
          v299 = 0;
          goto LABEL_123;
        }
      }
    }
    if (qword_253E5C3A8 == -1)
    {
      v81 = qword_253E5C3A0;
      if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
        goto LABEL_66;
    }
    else
    {
      dispatch_once(&qword_253E5C3A8, &unk_24D570038);
      v81 = qword_253E5C3A0;
      if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
      {
LABEL_66:
        v82 = __p;
        if (v329 < 0)
          v82 = (void **)__p[0];
        *(_DWORD *)v332 = 136446210;
        *(_QWORD *)&v332[4] = v82;
        _os_log_impl(&dword_216456000, v81, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, venue [%{public}s] is missing exterior", v332, 0xCu);
        if (v329 < 0)
          goto LABEL_210;
        goto LABEL_211;
      }
    }
    if (v329 < 0)
LABEL_210:
      operator delete(__p[0]);
LABEL_211:
    sub_2164636CC(buf);
  }
  if (objc_msgSend_tileIsOpenForIncrementalIO(v305, v39, v40, v41, v42))
  {
    sub_216467224((uint64_t)buf);
    if (qword_253E5C3A8 != -1)
      dispatch_once(&qword_253E5C3A8, &unk_24D570038);
    v273 = (id)qword_253E5C3A0;
    if (os_log_type_enabled(v273, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v332 = 0;
      _os_log_impl(&dword_216456000, v273, OS_LOG_TYPE_INFO, "@IndoorAvl, load, make sure we have no more venue bounds to read", v332, 2u);
    }

    if (objc_msgSend_getNextVenueBoundsIncrementally_(v305, v274, (uint64_t)buf, v275, v276))
    {
      if (qword_253E5C3A8 != -1)
        dispatch_once(&qword_253E5C3A8, &unk_24D570038);
      v277 = (id)qword_253E5C3A0;
      if (os_log_type_enabled(v277, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v332 = 0;
        _os_log_impl(&dword_216456000, v277, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, had venues left over after iterating over all venues in tile. why?", v332, 2u);
      }

    }
    sub_2164636CC(buf);
  }
  if (qword_253E5C3A8 != -1)
    dispatch_once(&qword_253E5C3A8, &unk_24D570038);
  v278 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v278, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v334 = 0;
    v335 = 2048;
    *(_QWORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v278, OS_LOG_TYPE_DEBUG, "Found %zu floors across %zu venues", buf, 0x16u);
  }

  v279 = v293;
  return v279;
}

- (BOOL)isVenueDisabled:(id)a3 locationId:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSSet *disabledVenues;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;

  v6 = a3;
  v10 = a4;
  disabledVenues = self->_disabledVenues;
  if (disabledVenues)
  {
    objc_msgSend_member_(disabledVenues, v7, (uint64_t)v6, v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = 1;
    }
    else
    {
      objc_msgSend_member_(self->_disabledVenues, v12, (uint64_t)v10, v13, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v17 != 0;

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (double)distBetweenLatLon:(id)a3 latlon1:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  long double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  long double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  long double v47;
  long double v48;
  long double v49;
  long double v50;
  double v51;
  long double v52;
  long double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  uint8_t buf[4];
  int v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  const char *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v11 = v6;
  if (!v5)
  {
    sub_21649FECC();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      v70 = 2082;
      v71 = "assert";
      v72 = 2081;
      v73 = "latlon0 != nullptr";
      _os_log_impl(&dword_216456000, v61, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"distBetweenLatLon: first coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_21649FECC();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v62))
    {
      *(_DWORD *)buf = 68289539;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      v70 = 2082;
      v71 = "assert";
      v72 = 2081;
      v73 = "latlon0 != nullptr";
      _os_signpost_emit_with_name_impl(&dword_216456000, v62, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "distBetweenLatLon: first coordinate must be valid!", "{\"msg%{public}.0s\":\"distBetweenLatLon: first coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_21649FECC();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      v70 = 2082;
      v71 = "assert";
      v72 = 2081;
      v73 = "latlon0 != nullptr";
      _os_log_impl(&dword_216456000, v63, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"distBetweenLatLon: first coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_17:

    abort_report_np();
    __break(1u);
  }
  if (!v6)
  {
    sub_21649FECC();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      v70 = 2082;
      v71 = "assert";
      v72 = 2081;
      v73 = "latlon1 != nullptr";
      _os_log_impl(&dword_216456000, v64, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"distBetweenLatLon: second coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_21649FECC();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v65))
    {
      *(_DWORD *)buf = 68289539;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      v70 = 2082;
      v71 = "assert";
      v72 = 2081;
      v73 = "latlon1 != nullptr";
      _os_signpost_emit_with_name_impl(&dword_216456000, v65, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "distBetweenLatLon: second coordinate must be valid!", "{\"msg%{public}.0s\":\"distBetweenLatLon: second coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_21649FECC();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      v70 = 2082;
      v71 = "assert";
      v72 = 2081;
      v73 = "latlon1 != nullptr";
      _os_log_impl(&dword_216456000, v63, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"distBetweenLatLon: second coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_17;
  }
  objc_msgSend_latitude(v5, v7, v8, v9, v10);
  objc_msgSend_deg2rad_(CLAvailableVenuesStateMachine, v12, v13, v14, v15);
  v17 = v16;
  objc_msgSend_longitude(v5, v18, v19, v20, v21);
  objc_msgSend_deg2rad_(CLAvailableVenuesStateMachine, v22, v23, v24, v25);
  v27 = v26;
  objc_msgSend_latitude(v11, v28, v29, v30, v31);
  objc_msgSend_deg2rad_(CLAvailableVenuesStateMachine, v32, v33, v34, v35);
  v37 = v36;
  objc_msgSend_longitude(v11, v38, v39, v40, v41);
  objc_msgSend_deg2rad_(CLAvailableVenuesStateMachine, v42, v43, v44, v45);
  v47 = sin((v27 - v46) * 0.5);
  v48 = v47 * v47;
  v49 = sin((v17 - v37) * 0.5);
  v50 = v49 * v49;
  v51 = cos(v17);
  v52 = cos(v37);
  v53 = asin(sqrt(v50 + v51 * v52 * v48));
  objc_msgSend_metersFromGreatCircleDistance_(CLAvailableVenuesStateMachine, v54, v55, v56, v57, (double)(v53 + v53));
  v59 = v58;

  return v59;
}

+ (double)deg2rad:(double)a3
{
  return a3 * 3.14159265 / 180.0;
}

+ (double)metersFromGreatCircleDistance:(double)a3
{
  return a3 * 180.0 / 3.14159265 * 60.0 * 1852.0;
}

+ (int64_t)getLocationContextFromVenueBounds:(const void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int hasPrefix;

  if ((*((_BYTE *)a3 + 104) & 8) != 0)
    return *((_DWORD *)a3 + 24) != 1;
  v5 = *((int *)a3 + 6);
  if (!(_DWORD)v5)
    return 0;
  v6 = *((_QWORD *)a3 + 2);
  v7 = 8 * v5;
  while (1)
  {
    v8 = *(_QWORD **)v6;
    if (*(char *)(*(_QWORD *)v6 + 23) < 0)
      v8 = (_QWORD *)*v8;
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, (uint64_t)v8, v3, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_hasPrefix_(v9, v10, (uint64_t)CFSTR("G"), v11, v12) & 1) == 0)
      break;

    v6 += 8;
    v7 -= 8;
    if (!v7)
      return 0;
  }
  hasPrefix = objc_msgSend_hasPrefix_(v9, v13, (uint64_t)CFSTR("LR"), v14, v15);

  return hasPrefix;
}

- (GeographicCoordinate)lastFix
{
  return (GeographicCoordinate *)objc_getProperty(self, a2, 8, 1);
}

- (CLIndoorAvailabilityTileParams)availabilityTileParams
{
  return (CLIndoorAvailabilityTileParams *)objc_getProperty(self, a2, 32, 1);
}

- (void)clearLastFix
{
  GeographicCoordinate *lastFix;

  lastFix = self->_lastFix;
  self->_lastFix = 0;

}

- (CLAvailableVenuesStateMachine)init
{
  CLAvailableVenuesStateMachine *v2;
  CLAvailableVenuesStateMachine *v3;
  GeographicCoordinate *lastFix;
  NSSet *disabledVenues;
  CLIndoorAvailabilityTileParams *availabilityTileParams;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLAvailableVenuesStateMachine;
  v2 = -[CLAvailableVenuesStateMachine init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    lastFix = v2->_lastFix;
    v2->_lastFix = 0;

    disabledVenues = v3->_disabledVenues;
    v3->_maxLoadRadius = 100000.0;
    v3->_disabledVenues = 0;

    availabilityTileParams = v3->_availabilityTileParams;
    v3->_availabilityTileParams = 0;

  }
  return v3;
}

- (id)getNearbyLocationGroupsForTile:(id)a3 withUpdatedPos:(id)a4
{
  objc_msgSend_getNearbyLocationGroupsForTile_withUpdatedPos_nearLocationsOfInterest_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)maxLoadRadius
{
  return self->_maxLoadRadius;
}

- (void)setMaxLoadRadius:(double)a3
{
  self->_maxLoadRadius = a3;
}

- (NSSet)disabledVenues
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisabledVenues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityTileParams, 0);
  objc_storeStrong((id *)&self->_disabledVenues, 0);
  objc_storeStrong((id *)&self->_lastFix, 0);
}

@end
