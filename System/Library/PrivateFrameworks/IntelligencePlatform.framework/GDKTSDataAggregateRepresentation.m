@implementation GDKTSDataAggregateRepresentation

- (GDKTSDataAggregateRepresentation)initWithStartTime:(id)a3 endTime:(id)a4 distanceInMeters:(id)a5 elevationGainInMeters:(id)a6 distanceBuckets:(id)a7 durationInSeconds:(id)a8 expectedDurationInSecondsNoTraffic:(id)a9 distanceSpentInTrafficBuckets:(id)a10 timeSpentInTrafficBuckets:(id)a11 distanceSpentAtSpeedBuckets:(id)a12 timeSpentAtSpeedBuckets:(id)a13 distanceSpentAtRelativeSpeeds:(id)a14 timeSpentAtRelativeSpeeds:(id)a15 distancePerRoadType:(id)a16 timePerRoadType:(id)a17 distancePerWeatherType:(id)a18 timePerWeatherType:(id)a19 distancePerTerrainType:(id)a20 timePerTerrainType:(id)a21 averageSpeedInMetersPerSecond:(id)a22 score:(double)a23 usageKwh:(id)a24 optimalUsageKwh:(id)a25 numBrakingEvents:(int)a26 numAccelEvents:(int)a27 numHighSpeedEvents:(int)a28 roadDistancesInMeters:(id)a29 roadSpeedBuckets:(id)a30 roadRelativeSpeedBuckets:(id)a31 roadTimes:(id)a32 route:(id)a33 lifeEventIds:(id)a34 ktsSegmentIds:(id)a35 maxTripDistanceInMeters:(id)a36 avgTripDistanceInMeters:(id)a37 maxElevationGainInMeters:(id)a38 avgElevationGainInMeters:(id)a39 percentTimeSpentAtSpeedBuckets:(id)a40 percentTimeSpentAtTrafficBuckets:(id)a41 percentTimeSpentAtRelativeSpeeds:(id)a42 percentTimeSpentAtRoadTypes:(id)a43 percentTimeSpentInWeatherTypes:(id)a44 percentTimeSpentInTerrainTypes:(id)a45 percentDistanceTraveledAtSpeedBuckets:(id)a46 percentDistanceTraveledAtTrafficBuckets:(id)a47 percentDistanceTraveledAtRelativeSpeeds:(id)a48 percentDistanceTraveledForRoadTypes:(id)a49 percentDistanceTraveledInWeatherTypes:(id)a50 percentDistanceTraveledInTerrainTypes:(id)a51 scorePerSpeedBucket:(id)a52 scorePerTrafficBucket:(id)a53 scorePerRelativeSpeed:(id)a54 scorePerRoadType:(id)a55 scorePerWeatherType:(id)a56 scorePerTerrainType:(id)a57 avgNumBrakingEvents:(double)a58 avgNumAccelEvents:(double)a59 avgNumHighSpeedEvents:(double)a60 mostEfficientDriveScore:(double)a61 routeHeatMap:(id)a62
{
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  const char *v76;
  uint64_t v77;
  GDKTSDataAggregateRepresentation *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  NSArray *percentTimeSpentAtSpeedBuckets;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  NSArray *percentTimeSpentAtTrafficBuckets;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  NSArray *percentTimeSpentAtRelativeSpeeds;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  NSArray *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  NSArray *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  NSArray *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  NSArray *percentTimeSpentAtRoadTypes;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  NSArray *percentTimeSpentInWeatherTypes;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  NSArray *percentTimeSpentInTerrainTypes;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  NSArray *percentDistanceTraveledAtSpeedBuckets;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  NSArray *percentDistanceTraveledAtTrafficBuckets;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  NSArray *percentDistanceTraveledAtRelativeSpeeds;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  NSArray *percentDistanceTraveledForRoadTypes;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  NSArray *percentDistanceTraveledInWeatherTypes;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  NSArray *percentDistanceTraveledInTerrainTypes;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  NSArray *scorePerSpeedBucket;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  NSArray *scorePerTrafficBucket;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  NSArray *scorePerRelativeSpeed;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  NSArray *scorePerRoadType;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  NSArray *scorePerWeatherType;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  NSArray *scorePerTerrainType;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  NSDictionary *routeHeatMap;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v189;
  id v190;
  objc_super v191;

  v67 = a34;
  v178 = a36;
  v177 = a37;
  v176 = a38;
  v175 = a39;
  v68 = a40;
  v69 = a41;
  v70 = a42;
  v71 = a43;
  v189 = a44;
  v190 = a45;
  v72 = a46;
  v73 = a47;
  v74 = a48;
  v75 = a49;
  v187 = a50;
  v186 = a51;
  v185 = a52;
  v184 = a53;
  v183 = a54;
  v182 = a55;
  v181 = a56;
  v180 = a57;
  v179 = a62;
  v191.receiver = self;
  v191.super_class = (Class)GDKTSDataAggregateRepresentation;
  v78 = -[GDKTSDataRepresentation initWithStartTime:endTime:distanceInMeters:elevationGainInMeters:distanceBuckets:durationInSeconds:expectedDurationInSecondsNoTraffic:distanceSpentInTrafficBuckets:timeSpentInTrafficBuckets:distanceSpentAtSpeedBuckets:timeSpentAtSpeedBuckets:distanceSpentAtRelativeSpeeds:timeSpentAtRelativeSpeeds:distancePerRoadType:timePerRoadType:distancePerWeatherType:timePerWeatherType:distancePerTerrainType:timePerTerrainType:averageSpeedInMetersPerSecond:score:usageKwh:optimalUsageKwh:numBrakingEvents:numAccelEvents:numHighSpeedEvents:roadDistancesInMeters:roadSpeedBuckets:roadRelativeSpeedBuckets:roadTimes:route:lifeEventIds:ktsSegmentIds:](&v191, sel_initWithStartTime_endTime_distanceInMeters_elevationGainInMeters_distanceBuckets_durationInSeconds_expectedDurationInSecondsNoTraffic_distanceSpentInTrafficBuckets_timeSpentInTrafficBuckets_distanceSpentAtSpeedBuckets_timeSpentAtSpeedBuckets_distanceSpentAtRelativeSpeeds_timeSpentAtRelativeSpeeds_distancePerRoadType_timePerRoadType_distancePerWeatherType_timePerWeatherType_distancePerTerrainType_timePerTerrainType_averageSpeedInMetersPerSecond_score_usageKwh_optimalUsageKwh_numBrakingEvents_numAccelEvents_numHighSpeedEvents_roadDistancesInMeters_roadSpeedBuckets_roadRelativeSpeedBuckets_roadTimes_route_lifeEventIds_ktsSegmentIds_, a3, a4, a5, a6, a7, a8, a23, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18,
          a19,
          a20,
          a21,
          a22,
          a24,
          a25,
          *(_QWORD *)&a26,
          a28,
          a29,
          a30,
          a31,
          a32,
          a33,
          v67,
          a35);
  if (v78)
  {
    v78->_numTrips = objc_msgSend_count(v67, v76, v77);
    objc_storeStrong((id *)&v78->_maxTripDistanceInMeters, a36);
    objc_storeStrong((id *)&v78->_avgTripDistanceInMeters, a37);
    objc_storeStrong((id *)&v78->_maxElevationGainInMeters, a38);
    objc_storeStrong((id *)&v78->_avgElevationGainInMeters, a39);
    v81 = objc_msgSend_copy(v68, v79, v80);
    percentTimeSpentAtSpeedBuckets = v78->_percentTimeSpentAtSpeedBuckets;
    v78->_percentTimeSpentAtSpeedBuckets = (NSArray *)v81;

    v85 = objc_msgSend_copy(v69, v83, v84);
    percentTimeSpentAtTrafficBuckets = v78->_percentTimeSpentAtTrafficBuckets;
    v78->_percentTimeSpentAtTrafficBuckets = (NSArray *)v85;

    v89 = objc_msgSend_copy(v70, v87, v88);
    percentTimeSpentAtRelativeSpeeds = v78->_percentTimeSpentAtRelativeSpeeds;
    v78->_percentTimeSpentAtRelativeSpeeds = (NSArray *)v89;

    v93 = objc_msgSend_copy(v68, v91, v92);
    v94 = v78->_percentTimeSpentAtSpeedBuckets;
    v78->_percentTimeSpentAtSpeedBuckets = (NSArray *)v93;

    v97 = objc_msgSend_copy(v69, v95, v96);
    v98 = v78->_percentTimeSpentAtTrafficBuckets;
    v78->_percentTimeSpentAtTrafficBuckets = (NSArray *)v97;

    v101 = objc_msgSend_copy(v70, v99, v100);
    v102 = v78->_percentTimeSpentAtRelativeSpeeds;
    v78->_percentTimeSpentAtRelativeSpeeds = (NSArray *)v101;

    v105 = objc_msgSend_copy(v71, v103, v104);
    percentTimeSpentAtRoadTypes = v78->_percentTimeSpentAtRoadTypes;
    v78->_percentTimeSpentAtRoadTypes = (NSArray *)v105;

    v109 = objc_msgSend_copy(v189, v107, v108);
    percentTimeSpentInWeatherTypes = v78->_percentTimeSpentInWeatherTypes;
    v78->_percentTimeSpentInWeatherTypes = (NSArray *)v109;

    v113 = objc_msgSend_copy(v190, v111, v112);
    percentTimeSpentInTerrainTypes = v78->_percentTimeSpentInTerrainTypes;
    v78->_percentTimeSpentInTerrainTypes = (NSArray *)v113;

    v117 = objc_msgSend_copy(v72, v115, v116);
    percentDistanceTraveledAtSpeedBuckets = v78->_percentDistanceTraveledAtSpeedBuckets;
    v78->_percentDistanceTraveledAtSpeedBuckets = (NSArray *)v117;

    v121 = objc_msgSend_copy(v73, v119, v120);
    percentDistanceTraveledAtTrafficBuckets = v78->_percentDistanceTraveledAtTrafficBuckets;
    v78->_percentDistanceTraveledAtTrafficBuckets = (NSArray *)v121;

    v125 = objc_msgSend_copy(v74, v123, v124);
    percentDistanceTraveledAtRelativeSpeeds = v78->_percentDistanceTraveledAtRelativeSpeeds;
    v78->_percentDistanceTraveledAtRelativeSpeeds = (NSArray *)v125;

    v129 = objc_msgSend_copy(v75, v127, v128);
    percentDistanceTraveledForRoadTypes = v78->_percentDistanceTraveledForRoadTypes;
    v78->_percentDistanceTraveledForRoadTypes = (NSArray *)v129;

    v133 = objc_msgSend_copy(v187, v131, v132);
    percentDistanceTraveledInWeatherTypes = v78->_percentDistanceTraveledInWeatherTypes;
    v78->_percentDistanceTraveledInWeatherTypes = (NSArray *)v133;

    v137 = objc_msgSend_copy(v186, v135, v136);
    percentDistanceTraveledInTerrainTypes = v78->_percentDistanceTraveledInTerrainTypes;
    v78->_percentDistanceTraveledInTerrainTypes = (NSArray *)v137;

    v141 = objc_msgSend_copy(v185, v139, v140);
    scorePerSpeedBucket = v78->_scorePerSpeedBucket;
    v78->_scorePerSpeedBucket = (NSArray *)v141;

    v145 = objc_msgSend_copy(v184, v143, v144);
    scorePerTrafficBucket = v78->_scorePerTrafficBucket;
    v78->_scorePerTrafficBucket = (NSArray *)v145;

    v149 = objc_msgSend_copy(v183, v147, v148);
    scorePerRelativeSpeed = v78->_scorePerRelativeSpeed;
    v78->_scorePerRelativeSpeed = (NSArray *)v149;

    v153 = objc_msgSend_copy(v182, v151, v152);
    scorePerRoadType = v78->_scorePerRoadType;
    v78->_scorePerRoadType = (NSArray *)v153;

    v157 = objc_msgSend_copy(v181, v155, v156);
    scorePerWeatherType = v78->_scorePerWeatherType;
    v78->_scorePerWeatherType = (NSArray *)v157;

    v161 = objc_msgSend_copy(v180, v159, v160);
    scorePerTerrainType = v78->_scorePerTerrainType;
    v78->_scorePerTerrainType = (NSArray *)v161;

    v78->_avgNumBrakingEvents = a58;
    v78->_avgNumAccelEvents = a59;
    v78->_avgNumHighSpeedEvents = a60;
    v78->_mostEfficientDriveScore = a61;
    v165 = objc_msgSend_copy(v179, v163, v164);
    routeHeatMap = v78->_routeHeatMap;
    v78->_routeHeatMap = (NSDictionary *)v165;

  }
  return v78;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *percentTimeSpentAtSpeedBuckets;
  id v5;
  void *v6;
  const char *v7;
  NSArray *percentTimeSpentAtRelativeSpeeds;
  void *v9;
  const char *v10;
  NSDictionary *routeHeatMap;
  void *v12;
  const char *v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  NSMeasurement *maxTripDistanceInMeters;
  void *v19;
  const char *v20;
  NSMeasurement *avgTripDistanceInMeters;
  void *v22;
  const char *v23;
  NSMeasurement *maxElevationGainInMeters;
  void *v25;
  const char *v26;
  NSMeasurement *avgElevationGainInMeters;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  objc_super v50;

  percentTimeSpentAtSpeedBuckets = self->_percentTimeSpentAtSpeedBuckets;
  v5 = a3;
  NSStringFromSelector(sel_percentTimeSpentAtSpeedBuckets);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)percentTimeSpentAtSpeedBuckets, v6);

  percentTimeSpentAtRelativeSpeeds = self->_percentTimeSpentAtRelativeSpeeds;
  NSStringFromSelector(sel_percentTimeSpentAtRelativeSpeeds);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)percentTimeSpentAtRelativeSpeeds, v9);

  routeHeatMap = self->_routeHeatMap;
  NSStringFromSelector(sel_routeHeatMap);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)routeHeatMap, v12);

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v14, self->_numTrips);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_numTrips);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v17, (uint64_t)v15, v16);

  maxTripDistanceInMeters = self->_maxTripDistanceInMeters;
  NSStringFromSelector(sel_maxTripDistanceInMeters);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v20, (uint64_t)maxTripDistanceInMeters, v19);

  avgTripDistanceInMeters = self->_avgTripDistanceInMeters;
  NSStringFromSelector(sel_avgTripDistanceInMeters);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v23, (uint64_t)avgTripDistanceInMeters, v22);

  maxElevationGainInMeters = self->_maxElevationGainInMeters;
  NSStringFromSelector(sel_maxElevationGainInMeters);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v26, (uint64_t)maxElevationGainInMeters, v25);

  avgElevationGainInMeters = self->_avgElevationGainInMeters;
  NSStringFromSelector(sel_avgElevationGainInMeters);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v29, (uint64_t)avgElevationGainInMeters, v28);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v30, v31, self->_avgNumBrakingEvents);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_avgNumBrakingEvents);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v34, (uint64_t)v32, v33);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v35, v36, self->_avgNumAccelEvents);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_avgNumAccelEvents);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v39, (uint64_t)v37, v38);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v40, v41, self->_avgNumHighSpeedEvents);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_avgNumHighSpeedEvents);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v44, (uint64_t)v42, v43);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v45, v46, self->_mostEfficientDriveScore);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_mostEfficientDriveScore);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v49, (uint64_t)v47, v48);

  v50.receiver = self;
  v50.super_class = (Class)GDKTSDataAggregateRepresentation;
  -[GDKTSDataRepresentation encodeWithCoder:](&v50, sel_encodeWithCoder_, v5);

}

- (GDKTSDataAggregateRepresentation)initWithCoder:(id)a3
{
  id v4;
  GDKTSDataAggregateRepresentation *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSMeasurement *maxTripDistanceInMeters;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  NSMeasurement *avgTripDistanceInMeters;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  NSMeasurement *maxElevationGainInMeters;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  NSMeasurement *avgElevationGainInMeters;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  NSArray *percentTimeSpentAtSpeedBuckets;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  void *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  NSArray *percentTimeSpentAtRelativeSpeeds;
  uint64_t v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  double v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  double v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  double v97;
  void *v98;
  const char *v99;
  void *v100;
  const char *v101;
  void *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  NSDictionary *routeHeatMap;
  objc_super v108;
  _QWORD v109[4];

  v109[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)GDKTSDataAggregateRepresentation;
  v5 = -[GDKTSDataRepresentation initWithCoder:](&v108, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_numTrips);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_numTrips = objc_msgSend_intValue(v9, v10, v11);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend_setWithObjects_(v12, v15, v13, v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_maxTripDistanceInMeters);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v16, v17);
    v19 = objc_claimAutoreleasedReturnValue();
    maxTripDistanceInMeters = v5->_maxTripDistanceInMeters;
    v5->_maxTripDistanceInMeters = (NSMeasurement *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend_setWithObjects_(v21, v24, v22, v23, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_avgTripDistanceInMeters);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v27, (uint64_t)v25, v26);
    v28 = objc_claimAutoreleasedReturnValue();
    avgTripDistanceInMeters = v5->_avgTripDistanceInMeters;
    v5->_avgTripDistanceInMeters = (NSMeasurement *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    objc_msgSend_setWithObjects_(v30, v33, v31, v32, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_maxElevationGainInMeters);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v36, (uint64_t)v34, v35);
    v37 = objc_claimAutoreleasedReturnValue();
    maxElevationGainInMeters = v5->_maxElevationGainInMeters;
    v5->_maxElevationGainInMeters = (NSMeasurement *)v37;

    v39 = (void *)MEMORY[0x1E0C99E60];
    v40 = objc_opt_class();
    v41 = objc_opt_class();
    objc_msgSend_setWithObjects_(v39, v42, v40, v41, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_avgElevationGainInMeters);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v45, (uint64_t)v43, v44);
    v46 = objc_claimAutoreleasedReturnValue();
    avgElevationGainInMeters = v5->_avgElevationGainInMeters;
    v5->_avgElevationGainInMeters = (NSMeasurement *)v46;

    v48 = (void *)MEMORY[0x1E0C99E60];
    v49 = objc_opt_class();
    v50 = objc_opt_class();
    v51 = objc_opt_class();
    v52 = objc_opt_class();
    objc_msgSend_setWithObjects_(v48, v53, v49, v50, v51, v52, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_percentTimeSpentAtSpeedBuckets);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v56, (uint64_t)v54, v55);
    v57 = objc_claimAutoreleasedReturnValue();
    percentTimeSpentAtSpeedBuckets = v5->_percentTimeSpentAtSpeedBuckets;
    v5->_percentTimeSpentAtSpeedBuckets = (NSArray *)v57;

    v59 = (void *)MEMORY[0x1E0C99E60];
    v60 = objc_opt_class();
    v61 = objc_opt_class();
    v62 = objc_opt_class();
    v63 = objc_opt_class();
    objc_msgSend_setWithObjects_(v59, v64, v60, v61, v62, v63, 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_percentTimeSpentAtRelativeSpeeds);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v67, (uint64_t)v65, v66);
    v68 = objc_claimAutoreleasedReturnValue();
    percentTimeSpentAtRelativeSpeeds = v5->_percentTimeSpentAtRelativeSpeeds;
    v5->_percentTimeSpentAtRelativeSpeeds = (NSArray *)v68;

    v70 = objc_opt_class();
    NSStringFromSelector(sel_avgNumBrakingEvents);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v72, v70, v71);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v73, v74, v75);
    v5->_avgNumBrakingEvents = v76;

    v77 = objc_opt_class();
    NSStringFromSelector(sel_avgNumAccelEvents);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v79, v77, v78);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v80, v81, v82);
    v5->_avgNumAccelEvents = v83;

    v84 = objc_opt_class();
    NSStringFromSelector(sel_avgNumHighSpeedEvents);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v86, v84, v85);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v87, v88, v89);
    v5->_avgNumHighSpeedEvents = v90;

    v91 = objc_opt_class();
    NSStringFromSelector(sel_mostEfficientDriveScore);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v93, v91, v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v94, v95, v96);
    v5->_mostEfficientDriveScore = v97;

    v98 = (void *)MEMORY[0x1E0C99E60];
    v109[0] = objc_opt_class();
    v109[1] = objc_opt_class();
    v109[2] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v99, (uint64_t)v109, 3);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v98, v101, (uint64_t)v100);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_routeHeatMap);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v104, (uint64_t)v102, v103);
    v105 = objc_claimAutoreleasedReturnValue();
    routeHeatMap = v5->_routeHeatMap;
    v5->_routeHeatMap = (NSDictionary *)v105;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  objc_super v85;

  v85.receiver = self;
  v85.super_class = (Class)GDKTSDataAggregateRepresentation;
  v5 = -[GDKTSDataRepresentation copyWithZone:](&v85, sel_copyWithZone_);
  v7 = objc_msgSend_copyWithZone_(self->_maxTripDistanceInMeters, v6, (uint64_t)a3);
  v8 = (void *)v5[34];
  v5[34] = v7;

  v10 = objc_msgSend_copyWithZone_(self->_avgTripDistanceInMeters, v9, (uint64_t)a3);
  v11 = (void *)v5[35];
  v5[35] = v10;

  v13 = objc_msgSend_copyWithZone_(self->_maxElevationGainInMeters, v12, (uint64_t)a3);
  v14 = (void *)v5[36];
  v5[36] = v13;

  v16 = objc_msgSend_copyWithZone_(self->_avgElevationGainInMeters, v15, (uint64_t)a3);
  v17 = (void *)v5[37];
  v5[37] = v16;

  v19 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtSpeedBuckets, v18, (uint64_t)a3);
  v20 = (void *)v5[38];
  v5[38] = v19;

  v22 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtTrafficBuckets, v21, (uint64_t)a3);
  v23 = (void *)v5[39];
  v5[39] = v22;

  v25 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtRelativeSpeeds, v24, (uint64_t)a3);
  v26 = (void *)v5[40];
  v5[40] = v25;

  v28 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtSpeedBuckets, v27, (uint64_t)a3);
  v29 = (void *)v5[38];
  v5[38] = v28;

  v31 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtTrafficBuckets, v30, (uint64_t)a3);
  v32 = (void *)v5[39];
  v5[39] = v31;

  v34 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtRelativeSpeeds, v33, (uint64_t)a3);
  v35 = (void *)v5[40];
  v5[40] = v34;

  v37 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtRoadTypes, v36, (uint64_t)a3);
  v38 = (void *)v5[41];
  v5[41] = v37;

  v40 = objc_msgSend_copyWithZone_(self->_percentTimeSpentInWeatherTypes, v39, (uint64_t)a3);
  v41 = (void *)v5[42];
  v5[42] = v40;

  v43 = objc_msgSend_copyWithZone_(self->_percentTimeSpentInTerrainTypes, v42, (uint64_t)a3);
  v44 = (void *)v5[43];
  v5[43] = v43;

  v46 = objc_msgSend_copyWithZone_(self->_percentDistanceTraveledAtSpeedBuckets, v45, (uint64_t)a3);
  v47 = (void *)v5[44];
  v5[44] = v46;

  v49 = objc_msgSend_copyWithZone_(self->_percentDistanceTraveledAtTrafficBuckets, v48, (uint64_t)a3);
  v50 = (void *)v5[45];
  v5[45] = v49;

  v52 = objc_msgSend_copyWithZone_(self->_percentDistanceTraveledAtRelativeSpeeds, v51, (uint64_t)a3);
  v53 = (void *)v5[46];
  v5[46] = v52;

  v55 = objc_msgSend_copyWithZone_(self->_percentDistanceTraveledForRoadTypes, v54, (uint64_t)a3);
  v56 = (void *)v5[47];
  v5[47] = v55;

  v58 = objc_msgSend_copyWithZone_(self->_percentDistanceTraveledInWeatherTypes, v57, (uint64_t)a3);
  v59 = (void *)v5[48];
  v5[48] = v58;

  v61 = objc_msgSend_copyWithZone_(self->_percentDistanceTraveledInTerrainTypes, v60, (uint64_t)a3);
  v62 = (void *)v5[49];
  v5[49] = v61;

  v64 = objc_msgSend_copyWithZone_(self->_scorePerSpeedBucket, v63, (uint64_t)a3);
  v65 = (void *)v5[50];
  v5[50] = v64;

  v67 = objc_msgSend_copyWithZone_(self->_scorePerTrafficBucket, v66, (uint64_t)a3);
  v68 = (void *)v5[51];
  v5[51] = v67;

  v70 = objc_msgSend_copyWithZone_(self->_scorePerRelativeSpeed, v69, (uint64_t)a3);
  v71 = (void *)v5[52];
  v5[52] = v70;

  v73 = objc_msgSend_copyWithZone_(self->_scorePerRoadType, v72, (uint64_t)a3);
  v74 = (void *)v5[53];
  v5[53] = v73;

  v76 = objc_msgSend_copyWithZone_(self->_scorePerWeatherType, v75, (uint64_t)a3);
  v77 = (void *)v5[54];
  v5[54] = v76;

  v79 = objc_msgSend_copyWithZone_(self->_scorePerTerrainType, v78, (uint64_t)a3);
  v80 = (void *)v5[55];
  v5[55] = v79;

  v5[56] = *(_QWORD *)&self->_avgNumBrakingEvents;
  v5[57] = *(_QWORD *)&self->_avgNumAccelEvents;
  v5[58] = *(_QWORD *)&self->_avgNumHighSpeedEvents;
  v5[59] = *(_QWORD *)&self->_mostEfficientDriveScore;
  v82 = objc_msgSend_copyWithZone_(self->_routeHeatMap, v81, (uint64_t)a3);
  v83 = (void *)v5[60];
  v5[60] = v82;

  return v5;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GDKTSDataAggregateRepresentation;
  -[GDKTSDataRepresentation description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_length(v3, v4, v5);
  objc_msgSend_substringToIndex_(v3, v7, v6 - 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v8, (const char *)self->_percentDistanceTraveledAtSpeedBuckets, (uint64_t)CFSTR(", \nnumTrips: %d, \nmaxDistance: %@, \navgDistance: %@, \nmaxElevationGain: %@, \navgElevationGain: %@, \npercentTimeAtSpeedBuckets: %@, \npercentTimeAtTrafficBuckets: %@, \npercentTimeAtRelativeSpeeds: %@, \npercentTimeSpentAtRoadTypes: %@, \npercentTimeSpentInWeatherTypes: %@, \npercentTimeSpentInTerrainTypes: %@, \npercentDistanceTraveledAtSpeedBuckets: %@, \npercentDistanceTraveledAtTrafficBuckets: %@, \npercentDistanceTraveledAtRelativeSpeeds: %@, \npercentDistanceTraveledForRoadTypes: %@, \npercentDistanceTraveledInWeatherTypes: %@, \npercentDistanceTraveledInTerrainTypes: %@, \nscorePerSpeedBucket: %@, \nscorePerTrafficBucket: %@, \nscorePerRelativeSpeed: %@, \nscorePerRoadType: %@, \nscorePerWeatherType: %@, \nscorePerTerrainType: %@, \navgNumBrakingEvents: %lf, \navgNumHighSpeedEvents: %lf, \navgNumAccelEvents: %lf, \nmostEfficientDriveScore: %lf>"), self->_numTrips, self->_maxTripDistanceInMeters, self->_avgTripDistanceInMeters, self->_maxElevationGainInMeters, self->_avgElevationGainInMeters, self->_percentTimeSpentAtSpeedBuckets, self->_percentTimeSpentAtTrafficBuckets, self->_percentTimeSpentAtRelativeSpeeds, self->_percentTimeSpentAtRoadTypes, self->_percentTimeSpentInWeatherTypes, self->_percentTimeSpentInTerrainTypes, self->_percentDistanceTraveledAtSpeedBuckets, self->_percentDistanceTraveledAtTrafficBuckets, self->_percentDistanceTraveledAtRelativeSpeeds, self->_percentDistanceTraveledForRoadTypes, self->_percentDistanceTraveledInWeatherTypes,
    self->_percentDistanceTraveledInTerrainTypes,
    self->_scorePerSpeedBucket,
    self->_scorePerTrafficBucket,
    self->_scorePerRelativeSpeed,
    self->_scorePerRoadType,
    self->_scorePerWeatherType,
    self->_scorePerTerrainType,
    *(_QWORD *)&self->_avgNumBrakingEvents,
    *(_QWORD *)&self->_avgNumAccelEvents,
    *(_QWORD *)&self->_avgNumHighSpeedEvents,
    *(_QWORD *)&self->_mostEfficientDriveScore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int)numTrips
{
  return self->_numTrips;
}

- (NSMeasurement)maxTripDistanceInMeters
{
  return self->_maxTripDistanceInMeters;
}

- (NSMeasurement)avgTripDistanceInMeters
{
  return self->_avgTripDistanceInMeters;
}

- (NSMeasurement)maxElevationGainInMeters
{
  return self->_maxElevationGainInMeters;
}

- (NSMeasurement)avgElevationGainInMeters
{
  return self->_avgElevationGainInMeters;
}

- (NSArray)percentTimeSpentAtSpeedBuckets
{
  return self->_percentTimeSpentAtSpeedBuckets;
}

- (NSArray)percentTimeSpentAtTrafficBuckets
{
  return self->_percentTimeSpentAtTrafficBuckets;
}

- (NSArray)percentTimeSpentAtRelativeSpeeds
{
  return self->_percentTimeSpentAtRelativeSpeeds;
}

- (NSArray)percentTimeSpentAtRoadTypes
{
  return self->_percentTimeSpentAtRoadTypes;
}

- (NSArray)percentTimeSpentInWeatherTypes
{
  return self->_percentTimeSpentInWeatherTypes;
}

- (NSArray)percentTimeSpentInTerrainTypes
{
  return self->_percentTimeSpentInTerrainTypes;
}

- (NSArray)percentDistanceTraveledAtSpeedBuckets
{
  return self->_percentDistanceTraveledAtSpeedBuckets;
}

- (NSArray)percentDistanceTraveledAtTrafficBuckets
{
  return self->_percentDistanceTraveledAtTrafficBuckets;
}

- (NSArray)percentDistanceTraveledAtRelativeSpeeds
{
  return self->_percentDistanceTraveledAtRelativeSpeeds;
}

- (NSArray)percentDistanceTraveledForRoadTypes
{
  return self->_percentDistanceTraveledForRoadTypes;
}

- (NSArray)percentDistanceTraveledInWeatherTypes
{
  return self->_percentDistanceTraveledInWeatherTypes;
}

- (NSArray)percentDistanceTraveledInTerrainTypes
{
  return self->_percentDistanceTraveledInTerrainTypes;
}

- (NSArray)scorePerSpeedBucket
{
  return self->_scorePerSpeedBucket;
}

- (NSArray)scorePerTrafficBucket
{
  return self->_scorePerTrafficBucket;
}

- (NSArray)scorePerRelativeSpeed
{
  return self->_scorePerRelativeSpeed;
}

- (NSArray)scorePerRoadType
{
  return self->_scorePerRoadType;
}

- (NSArray)scorePerWeatherType
{
  return self->_scorePerWeatherType;
}

- (NSArray)scorePerTerrainType
{
  return self->_scorePerTerrainType;
}

- (double)avgNumBrakingEvents
{
  return self->_avgNumBrakingEvents;
}

- (double)avgNumAccelEvents
{
  return self->_avgNumAccelEvents;
}

- (double)avgNumHighSpeedEvents
{
  return self->_avgNumHighSpeedEvents;
}

- (double)mostEfficientDriveScore
{
  return self->_mostEfficientDriveScore;
}

- (NSDictionary)routeHeatMap
{
  return self->_routeHeatMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeHeatMap, 0);
  objc_storeStrong((id *)&self->_scorePerTerrainType, 0);
  objc_storeStrong((id *)&self->_scorePerWeatherType, 0);
  objc_storeStrong((id *)&self->_scorePerRoadType, 0);
  objc_storeStrong((id *)&self->_scorePerRelativeSpeed, 0);
  objc_storeStrong((id *)&self->_scorePerTrafficBucket, 0);
  objc_storeStrong((id *)&self->_scorePerSpeedBucket, 0);
  objc_storeStrong((id *)&self->_percentDistanceTraveledInTerrainTypes, 0);
  objc_storeStrong((id *)&self->_percentDistanceTraveledInWeatherTypes, 0);
  objc_storeStrong((id *)&self->_percentDistanceTraveledForRoadTypes, 0);
  objc_storeStrong((id *)&self->_percentDistanceTraveledAtRelativeSpeeds, 0);
  objc_storeStrong((id *)&self->_percentDistanceTraveledAtTrafficBuckets, 0);
  objc_storeStrong((id *)&self->_percentDistanceTraveledAtSpeedBuckets, 0);
  objc_storeStrong((id *)&self->_percentTimeSpentInTerrainTypes, 0);
  objc_storeStrong((id *)&self->_percentTimeSpentInWeatherTypes, 0);
  objc_storeStrong((id *)&self->_percentTimeSpentAtRoadTypes, 0);
  objc_storeStrong((id *)&self->_percentTimeSpentAtRelativeSpeeds, 0);
  objc_storeStrong((id *)&self->_percentTimeSpentAtTrafficBuckets, 0);
  objc_storeStrong((id *)&self->_percentTimeSpentAtSpeedBuckets, 0);
  objc_storeStrong((id *)&self->_avgElevationGainInMeters, 0);
  objc_storeStrong((id *)&self->_maxElevationGainInMeters, 0);
  objc_storeStrong((id *)&self->_avgTripDistanceInMeters, 0);
  objc_storeStrong((id *)&self->_maxTripDistanceInMeters, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
