@implementation CLIndoorSettings

- (BOOL)pipelinedEnabled
{
  return self->_pipelinedEnabled;
}

- (double)venueGroupDistance
{
  return self->_venueGroupDistance;
}

- (NSSet)forcedVenues
{
  return self->_forcedVenues;
}

- (CLGpsPosition)fakeLastFix
{
  return self->_fakeLastFix;
}

- (CLIndoorSettings)init
{
  return (CLIndoorSettings *)((uint64_t (*)(CLIndoorSettings *, char *, _QWORD))MEMORY[0x24BEDD108])(self, sel_initWithSettings_, MEMORY[0x24BDBD1B8]);
}

+ (id)settingToSet:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
    goto LABEL_15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v4, (uint64_t)v3, v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v8 = (id)v7;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend_setWithObject_(MEMORY[0x24BDBCF20], v9, (uint64_t)v3, v10, v11);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (qword_253E5C3A8 != -1)
      dispatch_once(&qword_253E5C3A8, &unk_24D56FE50);
    v12 = (id)qword_253E5C3A0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_description(v3, v13, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_216456000, v12, OS_LOG_TYPE_ERROR, "Cannot cast %{public}@ to a set", (uint8_t *)&v19, 0xCu);

    }
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  v8 = v3;
LABEL_16:

  return v8;
}

- (CLIndoorSettings)initWithSettings:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CLIndoorSettings *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  double v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  NSObject *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  NSString *indoorAvailabilityTilesServerUrl;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  CLGpsPosition *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  BOOL v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  unint64_t v200;
  CLGpsPosition *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  CLGpsPosition *fakeLastFix;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  double v212;
  CLIndoorSettings *v213;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  char v225[20];
  uint64_t v226;
  unint64_t v227;
  uint64_t v228;
  uint64_t v229;
  objc_super v230;
  uint8_t buf[4];
  NSString *v232;
  uint64_t v233;

  v233 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v230.receiver = self;
  v230.super_class = (Class)CLIndoorSettings;
  v8 = -[CLIndoorSettings init](&v230, sel_init);
  if (!v8)
    goto LABEL_53;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, qword_254E3E798, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v218 = v9;
  if (v9)
    v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);
  else
    v14 = 1;
  v8->_pipelinedEnabled = v14;
  objc_msgSend_objectForKeyedSubscript_(v4, v10, qword_254E3E7A0, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_settingToSet_(CLIndoorSettings, v16, (uint64_t)v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDisabledVenues_(v8, v20, (uint64_t)v19, v21, v22);

  objc_msgSend_objectForKeyedSubscript_(v4, v23, qword_254E3E7A8, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = v26;
  if (v26)
    objc_msgSend_doubleValue(v26, v27, v28, v29, v30);
  else
    v31 = 10.0;
  objc_msgSend_setDebounceInterval_(v8, v27, v28, v29, v30, v31);
  objc_msgSend_objectForKeyedSubscript_(v4, v32, qword_254E3E7B0, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v216 = v35;
  if (v35)
    objc_msgSend_doubleValue(v35, v36, v37, v38, v39);
  else
    v40 = 5.0;
  objc_msgSend_setErrorBackoffDuration_(v8, v36, (uint64_t)(v40 * 1000000000.0), v38, v39);
  objc_msgSend_objectForKeyedSubscript_(v4, v41, qword_254E3E810, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v215 = v44;
  if (v44)
    v49 = (int)objc_msgSend_intValue(v44, v45, v46, v47, v48);
  else
    v49 = 86400;
  v8->_tilePrefetchActivityInterval.__rep_ = v49;
  objc_msgSend_objectForKeyedSubscript_(v4, v45, qword_254E3E818, v47, v48);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  if (v224)
  {
    v8->_tilePrefetchPredictionActivityCycleAllowance.m_storage = objc_msgSend_unsignedIntValue(v224, v50, v51, v52, v53);
    v8->_tilePrefetchPredictionActivityCycleAllowance.m_initialized = 1;
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v50, qword_254E3E7B8, v52, v53);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  if (v223)
  {
    objc_msgSend_doubleValue(v223, v54, v55, v56, v57);
    objc_msgSend_setTilePrefetchRadius_(v8, v58, 1, v60, v59);
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v54, qword_254E3E7C0, v56, v57);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  if (v222)
  {
    objc_msgSend_doubleValue(v222, v61, v62, v63, v64);
    objc_msgSend_setTilePrefetchMaxCount_(v8, v66, 1, (unint64_t)v65, v67);
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v61, qword_254E3E7C8, v63, v64);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  if (v221)
  {
    objc_msgSend_doubleValue(v221, v68, v69, v70, v71);
    objc_msgSend_setPrefetchClusterMergeRadius_(v8, v72, 1, v74, v73);
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v68, qword_254E3E7D0, v70, v71);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  if (v220)
  {
    objc_msgSend_doubleValue(v220, v75, v76, v77, v78);
    objc_msgSend_setTilePrefetchRadius_(v8, v79, 1, v81, v80);
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v75, qword_254E3E7D8, v77, v78);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v82;
  if (v82)
  {
    objc_msgSend_doubleValue(v82, v83, v84, v85, v86);
    objc_msgSend_setTilePrefetchMaxCount_(v8, v89, 1, (unint64_t)v88, v90);
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v83, qword_254E3E7E0, v85, v86);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v91;
  if (v91)
  {
    objc_msgSend_doubleValue(v91, v92, v93, v94, v95);
    objc_msgSend_setPrefetchClusterMergeRadius_(v8, v97, 1, v99, v98);
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v92, qword_254E3E7E8, v94, v95);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v100;
  if (v100)
  {
    objc_msgSend_doubleValue(v100, v101, v102, v103, v104);
    objc_msgSend_setRegionalTilePrefetchRadius_(v8, v106, 1, v108, v107);
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v101, qword_254E3E7F0, v103, v104);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    objc_msgSend_doubleValue(v219, v109, v110, v111, v112);
    objc_msgSend_setRegionalTilePrefetchMaxCount_(v8, v114, 1, (unint64_t)v113, v115);
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v109, qword_254E3E7F8, v111, v112);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v116;
  if (v116)
  {
    objc_msgSend_doubleValue(v116, v117, v118, v119, v120);
    objc_msgSend_setRegionalPrefetchClusterMergeRadius_(v8, v122, 1, v124, v123);
  }
  v8->_tilePrefetchRelevancyWindow.__rep_ = 604800;
  objc_msgSend_objectForKeyedSubscript_(v4, v117, qword_254E3E790, v119, v120);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedConfiguration(MEMORY[0x24BE3CBB8], v126, v127, v128, v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultForKey_defaultValue_(v130, v131, (uint64_t)CFSTR("CLPipelineAvailabilityServer"), (uint64_t)CFSTR("https://cl4.apple.com/2/m2/a.1/"), v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  if (v125)
    objc_msgSend_setIndoorAvailabilityTilesServerUrl_(v8, v134, (uint64_t)v125, v135, v136);
  else
    objc_msgSend_setIndoorAvailabilityTilesServerUrl_(v8, v134, (uint64_t)v133, v135, v136);
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FE50);
    v137 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
      goto LABEL_40;
    goto LABEL_39;
  }
  v137 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
  {
LABEL_39:
    indoorAvailabilityTilesServerUrl = v8->_indoorAvailabilityTilesServerUrl;
    *(_DWORD *)buf = 138477827;
    v232 = indoorAvailabilityTilesServerUrl;
    _os_log_impl(&dword_216456000, v137, OS_LOG_TYPE_DEBUG, "indoorAvailabilityTilesServerUrl = %{private}@", buf, 0xCu);
  }
LABEL_40:
  objc_msgSend_objectForKeyedSubscript_(v4, v138, qword_254E3E800, v139, v140);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_settingToSet_(CLIndoorSettings, v143, (uint64_t)v142, v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setForcedVenues_(v8, v147, (uint64_t)v146, v148, v149);

  objc_msgSend_objectForKeyedSubscript_(v4, v150, qword_254E3E808, v151, v152);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v153;
  if (v153)
  {
    objc_msgSend_objectForKeyedSubscript_(v153, v154, (uint64_t)CFSTR("lat"), v155, v156);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v158, v159, v160, v161, v162);
    v228 = v163;

    objc_msgSend_objectForKeyedSubscript_(v157, v164, (uint64_t)CFSTR("lon"), v165, v166);
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue((void *)v167, v168, v169, v170, v171);
    v229 = v172;

    objc_msgSend_objectForKeyedSubscript_(v157, v173, (uint64_t)CFSTR("horizontalAccuracy"), v174, v175);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v167) = v176 == 0;

    if ((v167 & 1) != 0)
    {
      v226 = 0x4049000000000000;
    }
    else
    {
      objc_msgSend_objectForKeyedSubscript_(v157, v177, (uint64_t)CFSTR("horizontalAccuracy"), v178, v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v180, v181, v182, v183, v184);
      v226 = v185;

    }
    objc_msgSend_objectForKeyedSubscript_(v157, v177, (uint64_t)CFSTR("lifespan"), v178, v179);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = v190 == 0;

    if (v191)
    {
      v227 = 0xBFF0000000000000;
    }
    else
    {
      objc_msgSend_objectForKeyedSubscript_(v157, v192, (uint64_t)CFSTR("lifespan"), v193, v194);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v195, v196, v197, v198, v199);
      v227 = v200;

    }
    v201 = [CLGpsPosition alloc];
    v204 = objc_msgSend_initWithLocation_andPrivateLocation_(v201, v202, (uint64_t)v225, (uint64_t)buf, v203);
    fakeLastFix = v8->_fakeLastFix;
    v8->_fakeLastFix = (CLGpsPosition *)v204;

  }
  else
  {
    v186 = v8->_fakeLastFix;
    v8->_fakeLastFix = 0;

  }
  objc_msgSend_objectForKeyedSubscript_(v4, v187, qword_254E3E820, v188, v189);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v211 = v206;
  if (v206)
    objc_msgSend_doubleValue(v206, v207, v208, v209, v210);
  else
    v212 = 250.0;
  objc_msgSend_setVenueGroupDistance_(v8, v207, v208, v209, v210, v212);
  v213 = v8;

LABEL_53:
  return v8;
}

- (const)tilePrefetchRadius
{
  return &self->_tilePrefetchRadius;
}

- (const)tilePrefetchMaxCount
{
  return &self->_tilePrefetchMaxCount;
}

- (const)prefetchClusterMergeRadius
{
  return &self->_prefetchClusterMergeRadius;
}

- (void)setPipelinedEnabled:(BOOL)a3
{
  self->_pipelinedEnabled = a3;
}

- (NSSet)disabledVenues
{
  return self->_disabledVenues;
}

- (void)setDisabledVenues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)debounceInterval
{
  return *(double *)(a1 + 24);
}

- (uint64_t)setDebounceInterval:(uint64_t)result
{
  *(double *)(result + 24) = a2;
  return result;
}

- (duration<long)errorBackoffDuration
{
  return self->_errorBackoffDuration;
}

- (void)setErrorBackoffDuration:(duration<long)long
{
  self->_errorBackoffDuration = a3;
}

- (duration<long)tilePrefetchActivityInterval
{
  return self->_tilePrefetchActivityInterval;
}

- (void)setTilePrefetchActivityInterval:(duration<long)long
{
  self->_tilePrefetchActivityInterval = a3;
}

- (optional<unsigned)tilePrefetchPredictionActivityCycleAllowance
{
  return self->_tilePrefetchPredictionActivityCycleAllowance;
}

- (void)setTilePrefetchPredictionActivityCycleAllowance:(optional<unsigned int>)a3
{
  self->_tilePrefetchPredictionActivityCycleAllowance = a3;
}

- (void)setTilePrefetchRadius:(optional<double>)a3
{
  self->_tilePrefetchRadius = a3;
}

- (void)setTilePrefetchMaxCount:(optional<unsigned long>)a3
{
  self->_tilePrefetchMaxCount = a3;
}

- (void)setPrefetchClusterMergeRadius:(optional<double>)a3
{
  self->_prefetchClusterMergeRadius = a3;
}

- (optional<double>)indoorTilePrefetchRadius
{
  double m_storage;
  uint64_t v3;
  optional<double> result;

  m_storage = self->_indoorTilePrefetchRadius.m_storage;
  v3 = *(_QWORD *)&self->_indoorTilePrefetchRadius.m_initialized;
  result.m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setIndoorTilePrefetchRadius:(optional<double>)a3
{
  self->_indoorTilePrefetchRadius = a3;
}

- (optional<unsigned)indoorTilePrefetchMaxCount
{
  unint64_t m_storage;
  uint64_t v3;
  optional<unsigned long> result;

  m_storage = self->_indoorTilePrefetchMaxCount.m_storage;
  v3 = *(_QWORD *)&self->_indoorTilePrefetchMaxCount.m_initialized;
  result.m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setIndoorTilePrefetchMaxCount:(optional<unsigned long>)a3
{
  self->_indoorTilePrefetchMaxCount = a3;
}

- (optional<double>)indoorPrefetchClusterMergeRadius
{
  double m_storage;
  uint64_t v3;
  optional<double> result;

  m_storage = self->_indoorPrefetchClusterMergeRadius.m_storage;
  v3 = *(_QWORD *)&self->_indoorPrefetchClusterMergeRadius.m_initialized;
  result.m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setIndoorPrefetchClusterMergeRadius:(optional<double>)a3
{
  self->_indoorPrefetchClusterMergeRadius = a3;
}

- (optional<double>)regionalTilePrefetchRadius
{
  double m_storage;
  uint64_t v3;
  optional<double> result;

  m_storage = self->_regionalTilePrefetchRadius.m_storage;
  v3 = *(_QWORD *)&self->_regionalTilePrefetchRadius.m_initialized;
  result.m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setRegionalTilePrefetchRadius:(optional<double>)a3
{
  self->_regionalTilePrefetchRadius = a3;
}

- (optional<unsigned)regionalTilePrefetchMaxCount
{
  unint64_t m_storage;
  uint64_t v3;
  optional<unsigned long> result;

  m_storage = self->_regionalTilePrefetchMaxCount.m_storage;
  v3 = *(_QWORD *)&self->_regionalTilePrefetchMaxCount.m_initialized;
  result.m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setRegionalTilePrefetchMaxCount:(optional<unsigned long>)a3
{
  self->_regionalTilePrefetchMaxCount = a3;
}

- (optional<double>)regionalPrefetchClusterMergeRadius
{
  double m_storage;
  uint64_t v3;
  optional<double> result;

  m_storage = self->_regionalPrefetchClusterMergeRadius.m_storage;
  v3 = *(_QWORD *)&self->_regionalPrefetchClusterMergeRadius.m_initialized;
  result.m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setRegionalPrefetchClusterMergeRadius:(optional<double>)a3
{
  self->_regionalPrefetchClusterMergeRadius = a3;
}

- (duration<long)tilePrefetchRelevancyWindow
{
  return self->_tilePrefetchRelevancyWindow;
}

- (void)setTilePrefetchRelevancyWindow:(duration<long)long
{
  self->_tilePrefetchRelevancyWindow = a3;
}

- (NSString)indoorAvailabilityTilesServerUrl
{
  return self->_indoorAvailabilityTilesServerUrl;
}

- (void)setIndoorAvailabilityTilesServerUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setForcedVenues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setFakeLastFix:(id)a3
{
  objc_storeStrong((id *)&self->_fakeLastFix, a3);
}

- (void)setVenueGroupDistance:(double)a3
{
  self->_venueGroupDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeLastFix, 0);
  objc_storeStrong((id *)&self->_forcedVenues, 0);
  objc_storeStrong((id *)&self->_indoorAvailabilityTilesServerUrl, 0);
  objc_storeStrong((id *)&self->_disabledVenues, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 48) = 0;
  *((_BYTE *)self + 96) = 0;
  *((_BYTE *)self + 112) = 0;
  *((_BYTE *)self + 128) = 0;
  *((_BYTE *)self + 144) = 0;
  *((_BYTE *)self + 160) = 0;
  *((_BYTE *)self + 176) = 0;
  *((_BYTE *)self + 192) = 0;
  *((_BYTE *)self + 208) = 0;
  *((_BYTE *)self + 224) = 0;
  return self;
}

@end
