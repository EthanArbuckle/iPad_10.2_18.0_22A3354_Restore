@implementation GDKTSDataRepresentation

- (GDKTSDataRepresentation)initWithStartTime:(id)a3 endTime:(id)a4 distanceInMeters:(id)a5 elevationGainInMeters:(id)a6 distanceBuckets:(id)a7 durationInSeconds:(id)a8 expectedDurationInSecondsNoTraffic:(id)a9 distanceSpentInTrafficBuckets:(id)a10 timeSpentInTrafficBuckets:(id)a11 distanceSpentAtSpeedBuckets:(id)a12 timeSpentAtSpeedBuckets:(id)a13 distanceSpentAtRelativeSpeeds:(id)a14 timeSpentAtRelativeSpeeds:(id)a15 distancePerRoadType:(id)a16 timePerRoadType:(id)a17 distancePerWeatherType:(id)a18 timePerWeatherType:(id)a19 distancePerTerrainType:(id)a20 timePerTerrainType:(id)a21 averageSpeedInMetersPerSecond:(id)a22 score:(double)a23 usageKwh:(id)a24 optimalUsageKwh:(id)a25 numBrakingEvents:(int)a26 numAccelEvents:(int)a27 numHighSpeedEvents:(int)a28 roadDistancesInMeters:(id)a29 roadSpeedBuckets:(id)a30 roadRelativeSpeedBuckets:(id)a31 roadTimes:(id)a32 route:(id)a33 lifeEventIds:(id)a34 ktsSegmentIds:(id)a35
{
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  const char *v50;
  uint64_t v51;
  GDKTSDataRepresentation *v52;
  uint64_t v53;
  NSDate *startTime;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  NSDate *endTime;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  NSArray *distanceBuckets;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  NSMeasurement *durationInSeconds;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSMeasurement *expectedDurationInSecondsNoTraffic;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  NSArray *distanceSpentInTrafficBuckets;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  NSArray *timeSpentInTrafficBuckets;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  NSArray *distanceSpentAtSpeedBuckets;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  NSArray *timeSpentAtSpeedBuckets;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  NSArray *distanceSpentAtRelativeSpeeds;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  NSArray *timeSpentAtRelativeSpeeds;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  NSMeasurement *averageSpeedInMetersPerSecond;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  NSDictionary *roadDistancesInMeters;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  NSDictionary *roadSpeedBuckets;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  NSDictionary *roadRelativeSpeedBuckets;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  NSDictionary *roadTimes;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  NSArray *distancePerRoadType;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  NSArray *timePerRoadType;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  NSArray *distancePerWeatherType;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  NSArray *timePerWeatherType;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  NSArray *distancePerTerrainType;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  NSArray *timePerTerrainType;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  NSArray *route;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  NSArray *lifeEventIds;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  NSArray *ktsSegmentIds;
  id obj;
  id v153;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  objc_super v175;

  v164 = a3;
  v165 = a4;
  obj = a5;
  v158 = a5;
  v153 = a6;
  v157 = a6;
  v174 = a7;
  v173 = a8;
  v172 = a9;
  v171 = a10;
  v170 = a11;
  v169 = a12;
  v168 = a13;
  v167 = a14;
  v166 = a15;
  v41 = a16;
  v42 = a17;
  v43 = a18;
  v44 = a19;
  v45 = a20;
  v46 = a21;
  v163 = a22;
  v156 = a24;
  v155 = a25;
  v162 = a29;
  v161 = a30;
  v160 = a31;
  v159 = a32;
  v47 = a33;
  v48 = a34;
  v49 = a35;
  v175.receiver = self;
  v175.super_class = (Class)GDKTSDataRepresentation;
  v52 = -[GDKTSDataRepresentation init](&v175, sel_init);
  if (v52)
  {
    v53 = objc_msgSend_copy(v164, v50, v51);
    startTime = v52->_startTime;
    v52->_startTime = (NSDate *)v53;

    v57 = objc_msgSend_copy(v165, v55, v56);
    endTime = v52->_endTime;
    v52->_endTime = (NSDate *)v57;

    objc_storeStrong((id *)&v52->_distanceInMeters, obj);
    objc_storeStrong((id *)&v52->_elevationGainInMeters, v153);
    v61 = objc_msgSend_copy(v174, v59, v60);
    distanceBuckets = v52->_distanceBuckets;
    v52->_distanceBuckets = (NSArray *)v61;

    v65 = objc_msgSend_copy(v173, v63, v64);
    durationInSeconds = v52->_durationInSeconds;
    v52->_durationInSeconds = (NSMeasurement *)v65;

    v69 = objc_msgSend_copy(v172, v67, v68);
    expectedDurationInSecondsNoTraffic = v52->_expectedDurationInSecondsNoTraffic;
    v52->_expectedDurationInSecondsNoTraffic = (NSMeasurement *)v69;

    v73 = objc_msgSend_copy(v171, v71, v72);
    distanceSpentInTrafficBuckets = v52->_distanceSpentInTrafficBuckets;
    v52->_distanceSpentInTrafficBuckets = (NSArray *)v73;

    v77 = objc_msgSend_copy(v170, v75, v76);
    timeSpentInTrafficBuckets = v52->_timeSpentInTrafficBuckets;
    v52->_timeSpentInTrafficBuckets = (NSArray *)v77;

    v81 = objc_msgSend_copy(v169, v79, v80);
    distanceSpentAtSpeedBuckets = v52->_distanceSpentAtSpeedBuckets;
    v52->_distanceSpentAtSpeedBuckets = (NSArray *)v81;

    v85 = objc_msgSend_copy(v168, v83, v84);
    timeSpentAtSpeedBuckets = v52->_timeSpentAtSpeedBuckets;
    v52->_timeSpentAtSpeedBuckets = (NSArray *)v85;

    v89 = objc_msgSend_copy(v167, v87, v88);
    distanceSpentAtRelativeSpeeds = v52->_distanceSpentAtRelativeSpeeds;
    v52->_distanceSpentAtRelativeSpeeds = (NSArray *)v89;

    v93 = objc_msgSend_copy(v166, v91, v92);
    timeSpentAtRelativeSpeeds = v52->_timeSpentAtRelativeSpeeds;
    v52->_timeSpentAtRelativeSpeeds = (NSArray *)v93;

    v97 = objc_msgSend_copy(v163, v95, v96);
    averageSpeedInMetersPerSecond = v52->_averageSpeedInMetersPerSecond;
    v52->_averageSpeedInMetersPerSecond = (NSMeasurement *)v97;

    v52->_score = a23;
    objc_storeStrong((id *)&v52->_usageKwh, a24);
    objc_storeStrong((id *)&v52->_optimalUsageKwh, a25);
    v52->_numBrakingEvents = a26;
    v52->_numAccelEvents = a27;
    v52->_numHighSpeedEvents = a28;
    v101 = objc_msgSend_copy(v162, v99, v100);
    roadDistancesInMeters = v52->_roadDistancesInMeters;
    v52->_roadDistancesInMeters = (NSDictionary *)v101;

    v105 = objc_msgSend_copy(v161, v103, v104);
    roadSpeedBuckets = v52->_roadSpeedBuckets;
    v52->_roadSpeedBuckets = (NSDictionary *)v105;

    v109 = objc_msgSend_copy(v160, v107, v108);
    roadRelativeSpeedBuckets = v52->_roadRelativeSpeedBuckets;
    v52->_roadRelativeSpeedBuckets = (NSDictionary *)v109;

    v113 = objc_msgSend_copy(v159, v111, v112);
    roadTimes = v52->_roadTimes;
    v52->_roadTimes = (NSDictionary *)v113;

    v117 = objc_msgSend_copy(v41, v115, v116);
    distancePerRoadType = v52->_distancePerRoadType;
    v52->_distancePerRoadType = (NSArray *)v117;

    v121 = objc_msgSend_copy(v42, v119, v120);
    timePerRoadType = v52->_timePerRoadType;
    v52->_timePerRoadType = (NSArray *)v121;

    v125 = objc_msgSend_copy(v43, v123, v124);
    distancePerWeatherType = v52->_distancePerWeatherType;
    v52->_distancePerWeatherType = (NSArray *)v125;

    v129 = objc_msgSend_copy(v44, v127, v128);
    timePerWeatherType = v52->_timePerWeatherType;
    v52->_timePerWeatherType = (NSArray *)v129;

    v133 = objc_msgSend_copy(v45, v131, v132);
    distancePerTerrainType = v52->_distancePerTerrainType;
    v52->_distancePerTerrainType = (NSArray *)v133;

    v137 = objc_msgSend_copy(v46, v135, v136);
    timePerTerrainType = v52->_timePerTerrainType;
    v52->_timePerTerrainType = (NSArray *)v137;

    v141 = objc_msgSend_copy(v47, v139, v140);
    route = v52->_route;
    v52->_route = (NSArray *)v141;

    v145 = objc_msgSend_copy(v48, v143, v144);
    lifeEventIds = v52->_lifeEventIds;
    v52->_lifeEventIds = (NSArray *)v145;

    v149 = objc_msgSend_copy(v49, v147, v148);
    ktsSegmentIds = v52->_ktsSegmentIds;
    v52->_ktsSegmentIds = (NSArray *)v149;

  }
  return v52;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startTime;
  id v5;
  void *v6;
  const char *v7;
  NSDate *endTime;
  void *v9;
  const char *v10;
  NSMeasurement *distanceInMeters;
  void *v12;
  const char *v13;
  NSMeasurement *elevationGainInMeters;
  void *v15;
  const char *v16;
  NSArray *distanceBuckets;
  void *v18;
  const char *v19;
  NSMeasurement *durationInSeconds;
  void *v21;
  const char *v22;
  NSMeasurement *expectedDurationInSecondsNoTraffic;
  void *v24;
  const char *v25;
  NSArray *distanceSpentInTrafficBuckets;
  void *v27;
  const char *v28;
  NSArray *timeSpentInTrafficBuckets;
  void *v30;
  const char *v31;
  NSArray *distanceSpentAtSpeedBuckets;
  void *v33;
  const char *v34;
  NSArray *timeSpentAtSpeedBuckets;
  void *v36;
  const char *v37;
  NSArray *distanceSpentAtRelativeSpeeds;
  void *v39;
  const char *v40;
  NSArray *timeSpentAtRelativeSpeeds;
  void *v42;
  const char *v43;
  NSMeasurement *averageSpeedInMetersPerSecond;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  NSMeasurement *usageKwh;
  void *v53;
  const char *v54;
  NSMeasurement *optimalUsageKwh;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  const char *v72;
  NSDictionary *roadDistancesInMeters;
  void *v74;
  const char *v75;
  NSDictionary *roadSpeedBuckets;
  void *v77;
  const char *v78;
  NSDictionary *roadRelativeSpeedBuckets;
  void *v80;
  const char *v81;
  NSDictionary *roadTimes;
  void *v83;
  const char *v84;
  NSArray *distancePerRoadType;
  void *v86;
  const char *v87;
  NSArray *distancePerWeatherType;
  void *v89;
  const char *v90;
  NSArray *distancePerTerrainType;
  void *v92;
  const char *v93;
  NSArray *timePerRoadType;
  void *v95;
  const char *v96;
  NSArray *timePerWeatherType;
  void *v98;
  const char *v99;
  NSArray *timePerTerrainType;
  void *v101;
  const char *v102;
  NSArray *route;
  void *v104;
  const char *v105;
  NSArray *lifeEventIds;
  void *v107;
  const char *v108;
  NSArray *ktsSegmentIds;
  const char *v110;
  id v111;

  startTime = self->_startTime;
  v5 = a3;
  NSStringFromSelector(sel_startTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)startTime, v6);

  endTime = self->_endTime;
  NSStringFromSelector(sel_endTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)endTime, v9);

  distanceInMeters = self->_distanceInMeters;
  NSStringFromSelector(sel_distanceInMeters);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)distanceInMeters, v12);

  elevationGainInMeters = self->_elevationGainInMeters;
  NSStringFromSelector(sel_elevationGainInMeters);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)elevationGainInMeters, v15);

  distanceBuckets = self->_distanceBuckets;
  NSStringFromSelector(sel_distanceBuckets);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)distanceBuckets, v18);

  durationInSeconds = self->_durationInSeconds;
  NSStringFromSelector(sel_durationInSeconds);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v22, (uint64_t)durationInSeconds, v21);

  expectedDurationInSecondsNoTraffic = self->_expectedDurationInSecondsNoTraffic;
  NSStringFromSelector(sel_expectedDurationInSecondsNoTraffic);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v25, (uint64_t)expectedDurationInSecondsNoTraffic, v24);

  distanceSpentInTrafficBuckets = self->_distanceSpentInTrafficBuckets;
  NSStringFromSelector(sel_distanceSpentInTrafficBuckets);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v28, (uint64_t)distanceSpentInTrafficBuckets, v27);

  timeSpentInTrafficBuckets = self->_timeSpentInTrafficBuckets;
  NSStringFromSelector(sel_timeSpentInTrafficBuckets);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v31, (uint64_t)timeSpentInTrafficBuckets, v30);

  distanceSpentAtSpeedBuckets = self->_distanceSpentAtSpeedBuckets;
  NSStringFromSelector(sel_distanceSpentAtSpeedBuckets);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v34, (uint64_t)distanceSpentAtSpeedBuckets, v33);

  timeSpentAtSpeedBuckets = self->_timeSpentAtSpeedBuckets;
  NSStringFromSelector(sel_timeSpentAtSpeedBuckets);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v37, (uint64_t)timeSpentAtSpeedBuckets, v36);

  distanceSpentAtRelativeSpeeds = self->_distanceSpentAtRelativeSpeeds;
  NSStringFromSelector(sel_distanceSpentAtRelativeSpeeds);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v40, (uint64_t)distanceSpentAtRelativeSpeeds, v39);

  timeSpentAtRelativeSpeeds = self->_timeSpentAtRelativeSpeeds;
  NSStringFromSelector(sel_timeSpentAtRelativeSpeeds);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v43, (uint64_t)timeSpentAtRelativeSpeeds, v42);

  averageSpeedInMetersPerSecond = self->_averageSpeedInMetersPerSecond;
  NSStringFromSelector(sel_averageSpeedInMetersPerSecond);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v46, (uint64_t)averageSpeedInMetersPerSecond, v45);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v47, v48, self->_score);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_score);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v51, (uint64_t)v49, v50);

  usageKwh = self->_usageKwh;
  NSStringFromSelector(sel_usageKwh);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v54, (uint64_t)usageKwh, v53);

  optimalUsageKwh = self->_optimalUsageKwh;
  NSStringFromSelector(sel_optimalUsageKwh);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v57, (uint64_t)optimalUsageKwh, v56);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v58, v59, (double)self->_numBrakingEvents);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_numBrakingEvents);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v62, (uint64_t)v60, v61);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v63, v64, (double)self->_numAccelEvents);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_numAccelEvents);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v67, (uint64_t)v65, v66);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v68, v69, (double)self->_numHighSpeedEvents);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_numHighSpeedEvents);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v72, (uint64_t)v70, v71);

  roadDistancesInMeters = self->_roadDistancesInMeters;
  NSStringFromSelector(sel_roadDistancesInMeters);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v75, (uint64_t)roadDistancesInMeters, v74);

  roadSpeedBuckets = self->_roadSpeedBuckets;
  NSStringFromSelector(sel_roadSpeedBuckets);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v78, (uint64_t)roadSpeedBuckets, v77);

  roadRelativeSpeedBuckets = self->_roadRelativeSpeedBuckets;
  NSStringFromSelector(sel_roadRelativeSpeedBuckets);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v81, (uint64_t)roadRelativeSpeedBuckets, v80);

  roadTimes = self->_roadTimes;
  NSStringFromSelector(sel_roadTimes);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v84, (uint64_t)roadTimes, v83);

  distancePerRoadType = self->_distancePerRoadType;
  NSStringFromSelector(sel_distancePerRoadType);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v87, (uint64_t)distancePerRoadType, v86);

  distancePerWeatherType = self->_distancePerWeatherType;
  NSStringFromSelector(sel_distancePerWeatherType);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v90, (uint64_t)distancePerWeatherType, v89);

  distancePerTerrainType = self->_distancePerTerrainType;
  NSStringFromSelector(sel_distancePerTerrainType);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v93, (uint64_t)distancePerTerrainType, v92);

  timePerRoadType = self->_timePerRoadType;
  NSStringFromSelector(sel_timePerRoadType);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v96, (uint64_t)timePerRoadType, v95);

  timePerWeatherType = self->_timePerWeatherType;
  NSStringFromSelector(sel_timePerWeatherType);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v99, (uint64_t)timePerWeatherType, v98);

  timePerTerrainType = self->_timePerTerrainType;
  NSStringFromSelector(sel_timePerTerrainType);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v102, (uint64_t)timePerTerrainType, v101);

  route = self->_route;
  NSStringFromSelector(sel_route);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v105, (uint64_t)route, v104);

  lifeEventIds = self->_lifeEventIds;
  NSStringFromSelector(sel_lifeEventIds);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v108, (uint64_t)lifeEventIds, v107);

  ktsSegmentIds = self->_ktsSegmentIds;
  NSStringFromSelector(sel_ktsSegmentIds);
  v111 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v110, (uint64_t)ktsSegmentIds, v111);

}

- (GDKTSDataRepresentation)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  void *v45;
  const char *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  void *v54;
  const char *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  void *v62;
  void *v63;
  const char *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  void *v71;
  void *v72;
  const char *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  void *v80;
  void *v81;
  const char *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  void *v89;
  void *v90;
  const char *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  void *v98;
  void *v99;
  const char *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  void *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  double v114;
  double v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  void *v120;
  void *v121;
  const char *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  void *v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  void *v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  void *v167;
  void *v168;
  const char *v169;
  void *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  void *v176;
  void *v177;
  const char *v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  void *v185;
  void *v186;
  const char *v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  void *v194;
  void *v195;
  const char *v196;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  void *v203;
  void *v204;
  const char *v205;
  void *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  void *v212;
  void *v213;
  const char *v214;
  void *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  void *v221;
  void *v222;
  const char *v223;
  void *v224;
  const char *v225;
  void *v226;
  const char *v227;
  void *v228;
  void *v229;
  const char *v230;
  void *v231;
  void *v232;
  const char *v233;
  void *v234;
  const char *v235;
  void *v236;
  void *v237;
  const char *v238;
  void *v239;
  void *v240;
  const char *v241;
  void *v242;
  const char *v243;
  void *v244;
  void *v245;
  const char *v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  const char *v258;
  void *v259;
  void *v260;
  const char *v261;
  void *v262;
  const char *v263;
  void *v264;
  void *v265;
  const char *v266;
  void *v267;
  const char *v268;
  int v270;
  unsigned int v271;
  unsigned int v272;
  GDKTSDataRepresentation *v273;
  void *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v301;
  uint64_t v302;
  const __CFString *v303;
  uint64_t v304;
  const __CFString *v305;
  _QWORD v306[2];
  _QWORD v307[2];
  _QWORD v308[4];

  v308[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_opt_class();
  NSStringFromSelector(sel_startTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v6, v4, v5);
  v301 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  NSStringFromSelector(sel_endTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v9, v7, v8);
  v299 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend_setWithObjects_(v10, v13, v11, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_distanceInMeters);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v16, (uint64_t)v14, v15);
  v298 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend_setWithObjects_(v17, v20, v18, v19, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_elevationGainInMeters);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v23, (uint64_t)v21, v22);
  v297 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  objc_msgSend_setWithObjects_(v24, v29, v25, v26, v27, v28, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_distanceBuckets);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v32, (uint64_t)v30, v31);
  v296 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x1E0C99E60];
  v34 = objc_opt_class();
  v35 = objc_opt_class();
  objc_msgSend_setWithObjects_(v33, v36, v34, v35, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_durationInSeconds);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v39, (uint64_t)v37, v38);
  v295 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)MEMORY[0x1E0C99E60];
  v41 = objc_opt_class();
  v42 = objc_opt_class();
  objc_msgSend_setWithObjects_(v40, v43, v41, v42, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_expectedDurationInSecondsNoTraffic);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v46, (uint64_t)v44, v45);
  v294 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = (void *)MEMORY[0x1E0C99E60];
  v48 = objc_opt_class();
  v49 = objc_opt_class();
  v50 = objc_opt_class();
  v51 = objc_opt_class();
  objc_msgSend_setWithObjects_(v47, v52, v48, v49, v50, v51, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_timeSpentInTrafficBuckets);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v55, (uint64_t)v53, v54);
  v293 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = (void *)MEMORY[0x1E0C99E60];
  v57 = objc_opt_class();
  v58 = objc_opt_class();
  v59 = objc_opt_class();
  v60 = objc_opt_class();
  objc_msgSend_setWithObjects_(v56, v61, v57, v58, v59, v60, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_distanceSpentInTrafficBuckets);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v64, (uint64_t)v62, v63);
  v292 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = (void *)MEMORY[0x1E0C99E60];
  v66 = objc_opt_class();
  v67 = objc_opt_class();
  v68 = objc_opt_class();
  v69 = objc_opt_class();
  objc_msgSend_setWithObjects_(v65, v70, v66, v67, v68, v69, 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_timeSpentAtSpeedBuckets);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v73, (uint64_t)v71, v72);
  v291 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = (void *)MEMORY[0x1E0C99E60];
  v75 = objc_opt_class();
  v76 = objc_opt_class();
  v77 = objc_opt_class();
  v78 = objc_opt_class();
  objc_msgSend_setWithObjects_(v74, v79, v75, v76, v77, v78, 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_distanceSpentAtSpeedBuckets);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v82, (uint64_t)v80, v81);
  v290 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = (void *)MEMORY[0x1E0C99E60];
  v84 = objc_opt_class();
  v85 = objc_opt_class();
  v86 = objc_opt_class();
  v87 = objc_opt_class();
  objc_msgSend_setWithObjects_(v83, v88, v84, v85, v86, v87, 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_timeSpentAtRelativeSpeeds);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v91, (uint64_t)v89, v90);
  v289 = (void *)objc_claimAutoreleasedReturnValue();

  v92 = (void *)MEMORY[0x1E0C99E60];
  v93 = objc_opt_class();
  v94 = objc_opt_class();
  v95 = objc_opt_class();
  v96 = objc_opt_class();
  objc_msgSend_setWithObjects_(v92, v97, v93, v94, v95, v96, 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_distanceSpentAtRelativeSpeeds);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v100, (uint64_t)v98, v99);
  v288 = (void *)objc_claimAutoreleasedReturnValue();

  v101 = (void *)MEMORY[0x1E0C99E60];
  v102 = objc_opt_class();
  v103 = objc_opt_class();
  objc_msgSend_setWithObjects_(v101, v104, v102, v103, 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_averageSpeedInMetersPerSecond);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v107, (uint64_t)v105, v106);
  v287 = (void *)objc_claimAutoreleasedReturnValue();

  v108 = objc_opt_class();
  NSStringFromSelector(sel_score);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v110, v108, v109);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v111, v112, v113);
  v115 = v114;

  v116 = (void *)MEMORY[0x1E0C99E60];
  v117 = objc_opt_class();
  v118 = objc_opt_class();
  objc_msgSend_setWithObjects_(v116, v119, v117, v118, 0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_usageKwh);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v122, (uint64_t)v120, v121);
  v286 = (void *)objc_claimAutoreleasedReturnValue();

  v123 = (void *)MEMORY[0x1E0C99E60];
  v124 = objc_opt_class();
  v125 = objc_opt_class();
  objc_msgSend_setWithObjects_(v123, v126, v124, v125, 0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_optimalUsageKwh);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v129, (uint64_t)v127, v128);
  v285 = (void *)objc_claimAutoreleasedReturnValue();

  v130 = objc_opt_class();
  NSStringFromSelector(sel_numBrakingEvents);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v132, v130, v131);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v272 = objc_msgSend_intValue(v133, v134, v135);

  v136 = objc_opt_class();
  NSStringFromSelector(sel_numAccelEvents);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v138, v136, v137);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v271 = objc_msgSend_intValue(v139, v140, v141);

  v142 = objc_opt_class();
  NSStringFromSelector(sel_numHighSpeedEvents);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v144, v142, v143);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v270 = objc_msgSend_intValue(v145, v146, v147);

  v148 = (void *)MEMORY[0x1E0C99E60];
  v149 = objc_opt_class();
  v150 = objc_opt_class();
  v151 = objc_opt_class();
  objc_msgSend_setWithObjects_(v148, v152, v149, v150, v151, 0);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_roadDistancesInMeters);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v155, (uint64_t)v153, v154);
  v284 = (void *)objc_claimAutoreleasedReturnValue();

  v156 = objc_opt_class();
  NSStringFromSelector(sel_roadSpeedBuckets);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v158, v156, v157);
  v283 = (void *)objc_claimAutoreleasedReturnValue();

  v159 = objc_opt_class();
  NSStringFromSelector(sel_roadRelativeSpeedBuckets);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v161, v159, v160);
  v282 = (void *)objc_claimAutoreleasedReturnValue();

  v162 = (void *)MEMORY[0x1E0C99E60];
  v163 = objc_opt_class();
  v164 = objc_opt_class();
  v165 = objc_opt_class();
  objc_msgSend_setWithObjects_(v162, v166, v163, v164, v165, 0);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_roadTimes);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v169, (uint64_t)v167, v168);
  v281 = objc_claimAutoreleasedReturnValue();

  v170 = (void *)MEMORY[0x1E0C99E60];
  v171 = objc_opt_class();
  v172 = objc_opt_class();
  v173 = objc_opt_class();
  v174 = objc_opt_class();
  objc_msgSend_setWithObjects_(v170, v175, v171, v172, v173, v174, 0);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_distancePerRoadType);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v178, (uint64_t)v176, v177);
  v280 = objc_claimAutoreleasedReturnValue();

  v179 = (void *)MEMORY[0x1E0C99E60];
  v180 = objc_opt_class();
  v181 = objc_opt_class();
  v182 = objc_opt_class();
  v183 = objc_opt_class();
  objc_msgSend_setWithObjects_(v179, v184, v180, v181, v182, v183, 0);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_distancePerWeatherType);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v187, (uint64_t)v185, v186);
  v279 = objc_claimAutoreleasedReturnValue();

  v188 = (void *)MEMORY[0x1E0C99E60];
  v189 = objc_opt_class();
  v190 = objc_opt_class();
  v191 = objc_opt_class();
  v192 = objc_opt_class();
  objc_msgSend_setWithObjects_(v188, v193, v189, v190, v191, v192, 0);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_distancePerTerrainType);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v196, (uint64_t)v194, v195);
  v278 = objc_claimAutoreleasedReturnValue();

  v197 = (void *)MEMORY[0x1E0C99E60];
  v198 = objc_opt_class();
  v199 = objc_opt_class();
  v200 = objc_opt_class();
  v201 = objc_opt_class();
  objc_msgSend_setWithObjects_(v197, v202, v198, v199, v200, v201, 0);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_timePerRoadType);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v205, (uint64_t)v203, v204);
  v277 = objc_claimAutoreleasedReturnValue();

  v206 = (void *)MEMORY[0x1E0C99E60];
  v207 = objc_opt_class();
  v208 = objc_opt_class();
  v209 = objc_opt_class();
  v210 = objc_opt_class();
  objc_msgSend_setWithObjects_(v206, v211, v207, v208, v209, v210, 0);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_timePerWeatherType);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v214, (uint64_t)v212, v213);
  v276 = objc_claimAutoreleasedReturnValue();

  v215 = (void *)MEMORY[0x1E0C99E60];
  v216 = objc_opt_class();
  v217 = objc_opt_class();
  v218 = objc_opt_class();
  v219 = objc_opt_class();
  objc_msgSend_setWithObjects_(v215, v220, v216, v217, v218, v219, 0);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_timePerTerrainType);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v223, (uint64_t)v221, v222);
  v275 = objc_claimAutoreleasedReturnValue();

  v224 = (void *)MEMORY[0x1E0C99E60];
  v308[0] = objc_opt_class();
  v308[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v225, (uint64_t)v308, 2);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v224, v227, (uint64_t)v226);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_route);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v230, (uint64_t)v228, v229);
  v231 = (void *)objc_claimAutoreleasedReturnValue();

  v232 = (void *)MEMORY[0x1E0C99E60];
  v307[0] = objc_opt_class();
  v307[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v233, (uint64_t)v307, 2);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v232, v235, (uint64_t)v234);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_lifeEventIds);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v238, (uint64_t)v236, v237);
  v239 = (void *)objc_claimAutoreleasedReturnValue();

  v240 = (void *)MEMORY[0x1E0C99E60];
  v306[0] = objc_opt_class();
  v306[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v241, (uint64_t)v306, 2);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v240, v243, (uint64_t)v242);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ktsSegmentIds);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v246, (uint64_t)v244, v245);
  v247 = (void *)objc_claimAutoreleasedReturnValue();

  v274 = v3;
  if (v301)
  {
    if (v299)
    {
      v250 = (void *)v281;
      v252 = (void *)v275;
      v251 = (void *)v276;
      v254 = (void *)v278;
      v253 = (void *)v279;
      v255 = (void *)v277;
      v256 = (void *)v280;
      self = (GDKTSDataRepresentation *)objc_retain((id)objc_msgSend_initWithStartTime_endTime_distanceInMeters_elevationGainInMeters_distanceBuckets_durationInSeconds_expectedDurationInSecondsNoTraffic_distanceSpentInTrafficBuckets_timeSpentInTrafficBuckets_distanceSpentAtSpeedBuckets_timeSpentAtSpeedBuckets_distanceSpentAtRelativeSpeeds_timeSpentAtRelativeSpeeds_distancePerRoadType_timePerRoadType_distancePerWeatherType_timePerWeatherType_distancePerTerrainType_timePerTerrainType_averageSpeedInMetersPerSecond_score_usageKwh_optimalUsageKwh_numBrakingEvents_numAccelEvents_numHighSpeedEvents_roadDistancesInMeters_roadSpeedBuckets_roadRelativeSpeedBuckets_roadTimes_route_lifeEventIds_ktsSegmentIds_(self, v248, (uint64_t)v301, v299, v298, v297, v296, v295, v115, v294, v292, v293, v290, v291, v288, v289, v280, v277, v279,
                                                          v276,
                                                          v278,
                                                          v275,
                                                          v287,
                                                          v286,
                                                          v285,
                                                          __PAIR64__(v271, v272),
                                                          v270,
                                                          v284,
                                                          v283,
                                                          v282,
                                                          v281,
                                                          v231,
                                                          v239,
                                                          v247));
      v273 = self;
    }
    else
    {
      v264 = (void *)MEMORY[0x1E0CB35C8];
      v302 = *MEMORY[0x1E0CB2D50];
      v303 = CFSTR("Required parameter endTime is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v248, (uint64_t)&v303, &v302, 1);
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v264, v266, (uint64_t)CFSTR("GDErrorDomain"), 9, v265);
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v3, v268, (uint64_t)v267);

      v273 = 0;
      v256 = (void *)v280;
      v250 = (void *)v281;
      v254 = (void *)v278;
      v253 = (void *)v279;
      v251 = (void *)v276;
      v255 = (void *)v277;
      v252 = (void *)v275;
    }
  }
  else
  {
    objc_msgSend_error(v3, v248, v249);
    v257 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v257)
    {
      v259 = (void *)MEMORY[0x1E0CB35C8];
      v304 = *MEMORY[0x1E0CB2D50];
      v305 = CFSTR("Required parameter startTime is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v258, (uint64_t)&v305, &v304, 1);
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v259, v261, (uint64_t)CFSTR("GDErrorDomain"), 9, v260);
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v3, v263, (uint64_t)v262);

    }
    v273 = 0;
    v256 = (void *)v280;
    v250 = (void *)v281;
    v254 = (void *)v278;
    v253 = (void *)v279;
    v251 = (void *)v276;
    v255 = (void *)v277;
    v252 = (void *)v275;
  }

  return v273;
}

- (id)description
{
  return objc_autoreleaseReturnValue((id)objc_msgSend_initWithFormat_(objc_alloc(MEMORY[0x1E0CB3940]), (const char *)self->_averageSpeedInMetersPerSecond, (uint64_t)CFSTR("GDKTSDataRepresentation<startTime: %@, endTime: %@, totalDistance: %@, elevationGain: %@, distanceBuckets: %@, totalDuration: %@, expectedDuration: %@, distanceInTrafficBuckets: %@, distanceAtSpeedBuckets: %@, distanceAtRelativeSpeeds: %@, timeInTrafficBuckets: %@, timeAtSpeedBuckets: %@, timeAtRelativeSpeeds: %@, averageSpeed: %@, distancePerRoadType: %@, timePerRoadType: %@, distancePerWeatherType: %@, timePerWeatherType: %@, distancePerTerrainType: %@, timePerTerrainType: %@, score: %f, usageKwh: %@, optimalUsageKwh: %@, numBrakingEvents: %d, numAccelEvents: %d, numHighSpeedEvents: %d, roadDistancesInMeters: %@ roadSpeedBuckets: %@ roadRelativeSpeeds: %@, roadTimes: %@, route: %@, lifeEventIds: %@, ktsSegmentIds: %@>"), self->_startTime, self->_endTime, self->_distanceInMeters, self->_elevationGainInMeters, self->_distanceBuckets, self->_durationInSeconds, self->_expectedDurationInSecondsNoTraffic, self->_distanceSpentInTrafficBuckets, self->_distanceSpentAtSpeedBuckets, self->_distanceSpentAtRelativeSpeeds, self->_timeSpentInTrafficBuckets, self->_timeSpentAtSpeedBuckets, self->_timeSpentAtRelativeSpeeds, self->_averageSpeedInMetersPerSecond, self->_distancePerRoadType, self->_timePerRoadType,
                                           self->_distancePerWeatherType,
                                           self->_timePerWeatherType,
                                           self->_distancePerTerrainType,
                                           self->_timePerTerrainType,
                                           *(_QWORD *)&self->_score,
                                           self->_usageKwh,
                                           self->_optimalUsageKwh,
                                           self->_numBrakingEvents,
                                           self->_numAccelEvents,
                                           self->_numHighSpeedEvents,
                                           *(_OWORD *)&self->_roadDistancesInMeters,
                                           *(_OWORD *)&self->_roadRelativeSpeedBuckets,
                                           *(_OWORD *)&self->_route,
                                           self->_ktsSegmentIds));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  return (id)objc_msgSend_initWithStartTime_endTime_distanceInMeters_elevationGainInMeters_distanceBuckets_durationInSeconds_expectedDurationInSecondsNoTraffic_distanceSpentInTrafficBuckets_timeSpentInTrafficBuckets_distanceSpentAtSpeedBuckets_timeSpentAtSpeedBuckets_distanceSpentAtRelativeSpeeds_timeSpentAtRelativeSpeeds_distancePerRoadType_timePerRoadType_distancePerWeatherType_timePerWeatherType_distancePerTerrainType_timePerTerrainType_averageSpeedInMetersPerSecond_score_usageKwh_optimalUsageKwh_numBrakingEvents_numAccelEvents_numHighSpeedEvents_roadDistancesInMeters_roadSpeedBuckets_roadRelativeSpeedBuckets_roadTimes_route_lifeEventIds_ktsSegmentIds_(v7, v8, (uint64_t)self->_startTime, self->_endTime, self->_distanceInMeters, self->_elevationGainInMeters, self->_distanceBuckets, self->_durationInSeconds, self->_score, self->_expectedDurationInSecondsNoTraffic, self->_distanceSpentInTrafficBuckets, self->_timeSpentInTrafficBuckets, self->_distanceSpentAtSpeedBuckets, self->_timeSpentAtSpeedBuckets, self->_distanceSpentAtRelativeSpeeds, self->_timeSpentAtRelativeSpeeds, self->_distancePerRoadType, self->_timePerRoadType, self->_distancePerWeatherType,
               self->_timePerWeatherType,
               self->_distancePerTerrainType,
               self->_timePerTerrainType,
               self->_averageSpeedInMetersPerSecond,
               self->_usageKwh,
               self->_optimalUsageKwh,
               *(_QWORD *)&self->_numBrakingEvents,
               self->_numHighSpeedEvents,
               self->_roadDistancesInMeters,
               self->_roadSpeedBuckets,
               *(_OWORD *)&self->_roadRelativeSpeedBuckets,
               self->_route,
               self->_lifeEventIds,
               self->_ktsSegmentIds);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (NSMeasurement)distanceInMeters
{
  return self->_distanceInMeters;
}

- (NSMeasurement)elevationGainInMeters
{
  return self->_elevationGainInMeters;
}

- (NSArray)distanceBuckets
{
  return self->_distanceBuckets;
}

- (NSMeasurement)durationInSeconds
{
  return self->_durationInSeconds;
}

- (NSMeasurement)expectedDurationInSecondsNoTraffic
{
  return self->_expectedDurationInSecondsNoTraffic;
}

- (NSArray)distanceSpentInTrafficBuckets
{
  return self->_distanceSpentInTrafficBuckets;
}

- (NSArray)timeSpentInTrafficBuckets
{
  return self->_timeSpentInTrafficBuckets;
}

- (NSArray)distanceSpentAtSpeedBuckets
{
  return self->_distanceSpentAtSpeedBuckets;
}

- (NSArray)timeSpentAtSpeedBuckets
{
  return self->_timeSpentAtSpeedBuckets;
}

- (NSArray)distanceSpentAtRelativeSpeeds
{
  return self->_distanceSpentAtRelativeSpeeds;
}

- (NSArray)timeSpentAtRelativeSpeeds
{
  return self->_timeSpentAtRelativeSpeeds;
}

- (NSArray)distancePerRoadType
{
  return self->_distancePerRoadType;
}

- (NSArray)timePerRoadType
{
  return self->_timePerRoadType;
}

- (NSArray)distancePerWeatherType
{
  return self->_distancePerWeatherType;
}

- (NSArray)timePerWeatherType
{
  return self->_timePerWeatherType;
}

- (NSArray)distancePerTerrainType
{
  return self->_distancePerTerrainType;
}

- (NSArray)timePerTerrainType
{
  return self->_timePerTerrainType;
}

- (NSMeasurement)averageSpeedInMetersPerSecond
{
  return self->_averageSpeedInMetersPerSecond;
}

- (double)score
{
  return self->_score;
}

- (NSMeasurement)usageKwh
{
  return self->_usageKwh;
}

- (NSMeasurement)optimalUsageKwh
{
  return self->_optimalUsageKwh;
}

- (int)numBrakingEvents
{
  return self->_numBrakingEvents;
}

- (int)numAccelEvents
{
  return self->_numAccelEvents;
}

- (int)numHighSpeedEvents
{
  return self->_numHighSpeedEvents;
}

- (NSDictionary)roadDistancesInMeters
{
  return self->_roadDistancesInMeters;
}

- (NSDictionary)roadSpeedBuckets
{
  return self->_roadSpeedBuckets;
}

- (NSDictionary)roadRelativeSpeedBuckets
{
  return self->_roadRelativeSpeedBuckets;
}

- (NSDictionary)roadTimes
{
  return self->_roadTimes;
}

- (NSArray)route
{
  return self->_route;
}

- (NSArray)lifeEventIds
{
  return self->_lifeEventIds;
}

- (NSArray)ktsSegmentIds
{
  return self->_ktsSegmentIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktsSegmentIds, 0);
  objc_storeStrong((id *)&self->_lifeEventIds, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_roadTimes, 0);
  objc_storeStrong((id *)&self->_roadRelativeSpeedBuckets, 0);
  objc_storeStrong((id *)&self->_roadSpeedBuckets, 0);
  objc_storeStrong((id *)&self->_roadDistancesInMeters, 0);
  objc_storeStrong((id *)&self->_optimalUsageKwh, 0);
  objc_storeStrong((id *)&self->_usageKwh, 0);
  objc_storeStrong((id *)&self->_averageSpeedInMetersPerSecond, 0);
  objc_storeStrong((id *)&self->_timePerTerrainType, 0);
  objc_storeStrong((id *)&self->_distancePerTerrainType, 0);
  objc_storeStrong((id *)&self->_timePerWeatherType, 0);
  objc_storeStrong((id *)&self->_distancePerWeatherType, 0);
  objc_storeStrong((id *)&self->_timePerRoadType, 0);
  objc_storeStrong((id *)&self->_distancePerRoadType, 0);
  objc_storeStrong((id *)&self->_timeSpentAtRelativeSpeeds, 0);
  objc_storeStrong((id *)&self->_distanceSpentAtRelativeSpeeds, 0);
  objc_storeStrong((id *)&self->_timeSpentAtSpeedBuckets, 0);
  objc_storeStrong((id *)&self->_distanceSpentAtSpeedBuckets, 0);
  objc_storeStrong((id *)&self->_timeSpentInTrafficBuckets, 0);
  objc_storeStrong((id *)&self->_distanceSpentInTrafficBuckets, 0);
  objc_storeStrong((id *)&self->_expectedDurationInSecondsNoTraffic, 0);
  objc_storeStrong((id *)&self->_durationInSeconds, 0);
  objc_storeStrong((id *)&self->_distanceBuckets, 0);
  objc_storeStrong((id *)&self->_elevationGainInMeters, 0);
  objc_storeStrong((id *)&self->_distanceInMeters, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
