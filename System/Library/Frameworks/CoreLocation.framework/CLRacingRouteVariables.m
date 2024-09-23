@implementation CLRacingRouteVariables

- (CLRacingRouteVariables)initWithRaceStartPointDetected:(BOOL)a3 raceEndPointDetected:(BOOL)a4 userIsOffRoute:(BOOL)a5 projectedOnNearestPoint:(BOOL)a6 raceSessionExpired:(BOOL)a7 rollingBufferReachedEndOfReferenceRoute:(BOOL)a8 routeConfigurationSuccessful:(BOOL)a9 racingRouteAnalyticsSent:(BOOL)a10 prematureRaceEndDetected:(BOOL)a11 referenceRouteTotalLengthDetermined:(BOOL)a12 locationPointIsOutsideOfAcceptedRange:(BOOL)a13 locationPointNotMatched:(BOOL)a14 routePointsBufferSize:(int)a15 numberOfRoutePointsToAdd:(int)a16 offRouteGraceDuration:(int)a17 matchedPointCounter:(int)a18 referenceRouteDataPointCounter:(int)a19 currentRouteDataPointCounter:(int)a20 offRouteDataPointCounter:(int)a21 inutileDataPointCounter:(int)a22 rollingBufferUpdateCounter:(int)a23 lastMatchedPointIndex:(int)a24 lastMatchedPointIndexOnReferenceRoute:(int)a25 rollingBufferStartIndexOnReferenceRoute:(int)a26 matrixCellIndexForLastMatchedPoint:(int)a27 referenceRouteTotalLength:(double)a28 timestampOfLastMatchedPointOnReferenceRoute:(double)a29 registeredTimeAtThresholdDistance:(double)a30 endOfRaceTimeThreshold:(double)a31 nearestNeighborMaximumAcceptedDistance:(double)a32
{
  CLRacingRouteVariables *result;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)CLRacingRouteVariables;
  result = -[CLRacingRouteVariables init](&v44, sel_init);
  if (result)
  {
    result->_raceStartPointDetected = a3;
    result->_raceEndPointDetected = a4;
    result->_userIsOffRoute = a5;
    result->_projectedOnNearestPoint = a6;
    result->_raceSessionExpired = a7;
    result->_rollingBufferReachedEndOfReferenceRoute = a8;
    result->_routeConfigurationSuccessful = a9;
    result->_racingRouteAnalyticsSent = a10;
    result->_prematureRaceEndDetected = a11;
    result->_referenceRouteTotalLengthDetermined = a12;
    result->_locationPointIsOutsideOfAcceptedRange = a13;
    result->_locationPointNotMatched = a14;
    result->_routePointsBufferSize = a15;
    result->_numberOfRoutePointsToAdd = a16;
    result->_offRouteGraceDuration = a17;
    result->_matchedPointCounter = a18;
    result->_referenceRouteDataPointCounter = a19;
    result->_currentRouteDataPointCounter = a20;
    result->_offRouteDataPointCounter = a21;
    result->_inutileDataPointCounter = a22;
    result->_rollingBufferUpdateCounter = a23;
    result->_lastMatchedPointIndex = a24;
    result->_lastMatchedPointIndexOnReferenceRoute = a25;
    result->_rollingBufferStartIndexOnReferenceRoute = a26;
    result->_matrixCellIndexForLastMatchedPoint = a27;
    result->_referenceRouteTotalLength = a28;
    result->_timestampOfLastMatchedPointOnReferenceRoute = a29;
    result->_registeredTimeAtThresholdDistance = a30;
    result->_endOfRaceTimeThreshold = a31;
    result->_nearestNeighborMaximumAcceptedDistance = a32;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLRacingRouteVariables *v4;
  const char *v5;
  uint64_t v7;
  int matrixCellIndexForLastMatchedPoint;

  v4 = [CLRacingRouteVariables alloc];
  matrixCellIndexForLastMatchedPoint = self->_matrixCellIndexForLastMatchedPoint;
  *(_DWORD *)((char *)&v7 + 2) = *(_DWORD *)&self->_prematureRaceEndDetected;
  LOWORD(v7) = *(_WORD *)&self->_routeConfigurationSuccessful;
  return (id)objc_msgSend_initWithRaceStartPointDetected_raceEndPointDetected_userIsOffRoute_projectedOnNearestPoint_raceSessionExpired_rollingBufferReachedEndOfReferenceRoute_routeConfigurationSuccessful_racingRouteAnalyticsSent_prematureRaceEndDetected_referenceRouteTotalLengthDetermined_locationPointIsOutsideOfAcceptedRange_locationPointNotMatched_routePointsBufferSize_numberOfRoutePointsToAdd_offRouteGraceDuration_matchedPointCounter_referenceRouteDataPointCounter_currentRouteDataPointCounter_offRouteDataPointCounter_inutileDataPointCounter_rollingBufferUpdateCounter_lastMatchedPointIndex_lastMatchedPointIndexOnReferenceRoute_rollingBufferStartIndexOnReferenceRoute_matrixCellIndexForLastMatchedPoint_referenceRouteTotalLength_timestampOfLastMatchedPointOnReferenceRoute_registeredTimeAtThresholdDistance_endOfRaceTimeThreshold_nearestNeighborMaximumAcceptedDistance_(v4, v5, self->_raceStartPointDetected, self->_raceEndPointDetected, self->_userIsOffRoute, self->_projectedOnNearestPoint, self->_raceSessionExpired, self->_rollingBufferReachedEndOfReferenceRoute, self->_referenceRouteTotalLength, self->_timestampOfLastMatchedPointOnReferenceRoute, self->_registeredTimeAtThresholdDistance, self->_endOfRaceTimeThreshold, self->_nearestNeighborMaximumAcceptedDistance, v7, *(_QWORD *)&self->_routePointsBufferSize, *(_QWORD *)&self->_offRouteGraceDuration, *(_QWORD *)&self->_referenceRouteDataPointCounter, *(_QWORD *)&self->_offRouteDataPointCounter, *(_QWORD *)&self->_rollingBufferUpdateCounter,
               *(_QWORD *)&self->_lastMatchedPointIndexOnReferenceRoute,
               matrixCellIndexForLastMatchedPoint);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t started;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t IsOffRoute;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t IsOutsideOfAcceptedRange;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t updated;
  const char *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t MatchedPointIndex;
  const char *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t MatchedPointIndexOnReferenceRoute;
  const char *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t MatchedPoint;
  const char *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;

  started = objc_msgSend_raceStartPointDetected(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeBool_forKey_(a3, v7, started, (uint64_t)CFSTR("raceStartPointDetected"));
  v11 = objc_msgSend_raceEndPointDetected(self, v8, v9, v10);
  objc_msgSend_encodeBool_forKey_(a3, v12, v11, (uint64_t)CFSTR("raceEndPointDetected"));
  IsOffRoute = objc_msgSend_userIsOffRoute(self, v13, v14, v15);
  objc_msgSend_encodeBool_forKey_(a3, v17, IsOffRoute, (uint64_t)CFSTR("userIsOffRoute"));
  v21 = objc_msgSend_projectedOnNearestPoint(self, v18, v19, v20);
  objc_msgSend_encodeBool_forKey_(a3, v22, v21, (uint64_t)CFSTR("projectedOnNearestPoint"));
  v26 = objc_msgSend_raceSessionExpired(self, v23, v24, v25);
  objc_msgSend_encodeBool_forKey_(a3, v27, v26, (uint64_t)CFSTR("raceSessionExpired"));
  v31 = objc_msgSend_rollingBufferReachedEndOfReferenceRoute(self, v28, v29, v30);
  objc_msgSend_encodeBool_forKey_(a3, v32, v31, (uint64_t)CFSTR("rollingBufferReachedEndOfReferenceRoute"));
  v36 = objc_msgSend_routeConfigurationSuccessful(self, v33, v34, v35);
  objc_msgSend_encodeBool_forKey_(a3, v37, v36, (uint64_t)CFSTR("routeConfigurationSuccessful"));
  v41 = objc_msgSend_racingRouteAnalyticsSent(self, v38, v39, v40);
  objc_msgSend_encodeBool_forKey_(a3, v42, v41, (uint64_t)CFSTR("racingRouteAnalyticsSent"));
  v46 = objc_msgSend_prematureRaceEndDetected(self, v43, v44, v45);
  objc_msgSend_encodeBool_forKey_(a3, v47, v46, (uint64_t)CFSTR("prematureRaceEndDetected"));
  v51 = objc_msgSend_referenceRouteTotalLengthDetermined(self, v48, v49, v50);
  objc_msgSend_encodeBool_forKey_(a3, v52, v51, (uint64_t)CFSTR("referenceRouteTotalLengthDetermined"));
  IsOutsideOfAcceptedRange = objc_msgSend_locationPointIsOutsideOfAcceptedRange(self, v53, v54, v55);
  objc_msgSend_encodeBool_forKey_(a3, v57, IsOutsideOfAcceptedRange, (uint64_t)CFSTR("locationPointIsOutsideOfAcceptedRange"));
  v61 = objc_msgSend_locationPointNotMatched(self, v58, v59, v60);
  objc_msgSend_encodeBool_forKey_(a3, v62, v61, (uint64_t)CFSTR("locationPointNotMatched"));
  v66 = objc_msgSend_routePointsBufferSize(self, v63, v64, v65);
  objc_msgSend_encodeInt_forKey_(a3, v67, v66, (uint64_t)CFSTR("routePointsBufferSize"));
  v71 = objc_msgSend_numberOfRoutePointsToAdd(self, v68, v69, v70);
  objc_msgSend_encodeInt_forKey_(a3, v72, v71, (uint64_t)CFSTR("numberOfRoutePointsToAdd"));
  v76 = objc_msgSend_offRouteGraceDuration(self, v73, v74, v75);
  objc_msgSend_encodeInt_forKey_(a3, v77, v76, (uint64_t)CFSTR("offRouteGraceDuration"));
  v81 = objc_msgSend_matchedPointCounter(self, v78, v79, v80);
  objc_msgSend_encodeInt_forKey_(a3, v82, v81, (uint64_t)CFSTR("matchedPointCounter"));
  v86 = objc_msgSend_referenceRouteDataPointCounter(self, v83, v84, v85);
  objc_msgSend_encodeInt_forKey_(a3, v87, v86, (uint64_t)CFSTR("referenceRouteDataPointCounter"));
  v91 = objc_msgSend_currentRouteDataPointCounter(self, v88, v89, v90);
  objc_msgSend_encodeInt_forKey_(a3, v92, v91, (uint64_t)CFSTR("currentRouteDataPointCounter"));
  v96 = objc_msgSend_offRouteDataPointCounter(self, v93, v94, v95);
  objc_msgSend_encodeInt_forKey_(a3, v97, v96, (uint64_t)CFSTR("offRouteDataPointCounter"));
  v101 = objc_msgSend_inutileDataPointCounter(self, v98, v99, v100);
  objc_msgSend_encodeInt_forKey_(a3, v102, v101, (uint64_t)CFSTR("inutileDataPointCounter"));
  updated = objc_msgSend_rollingBufferUpdateCounter(self, v103, v104, v105);
  objc_msgSend_encodeInt_forKey_(a3, v107, updated, (uint64_t)CFSTR("rollingBufferUpdateCounter"));
  MatchedPointIndex = objc_msgSend_lastMatchedPointIndex(self, v108, v109, v110);
  objc_msgSend_encodeInt_forKey_(a3, v112, MatchedPointIndex, (uint64_t)CFSTR("lastMatchedPointIndex"));
  MatchedPointIndexOnReferenceRoute = objc_msgSend_lastMatchedPointIndexOnReferenceRoute(self, v113, v114, v115);
  objc_msgSend_encodeInt_forKey_(a3, v117, MatchedPointIndexOnReferenceRoute, (uint64_t)CFSTR("lastMatchedPointIndexOnReferenceRoute"));
  v121 = objc_msgSend_rollingBufferStartIndexOnReferenceRoute(self, v118, v119, v120);
  objc_msgSend_encodeInt_forKey_(a3, v122, v121, (uint64_t)CFSTR("rollingBufferStartIndexOnReferenceRoute"));
  MatchedPoint = objc_msgSend_matrixCellIndexForLastMatchedPoint(self, v123, v124, v125);
  objc_msgSend_encodeInt_forKey_(a3, v127, MatchedPoint, (uint64_t)CFSTR("matrixCellIndexForLastMatchedPoint"));
  objc_msgSend_referenceRouteTotalLength(self, v128, v129, v130);
  objc_msgSend_encodeDouble_forKey_(a3, v131, (uint64_t)CFSTR("referenceRouteTotalLength"), v132);
  objc_msgSend_timestampOfLastMatchedPointOnReferenceRoute(self, v133, v134, v135);
  objc_msgSend_encodeDouble_forKey_(a3, v136, (uint64_t)CFSTR("timestampOfLastMatchedPointOnReferenceRoute"), v137);
  objc_msgSend_registeredTimeAtThresholdDistance(self, v138, v139, v140);
  objc_msgSend_encodeDouble_forKey_(a3, v141, (uint64_t)CFSTR("registeredTimeAtThresholdDistance"), v142);
  objc_msgSend_endOfRaceTimeThreshold(self, v143, v144, v145);
  objc_msgSend_encodeDouble_forKey_(a3, v146, (uint64_t)CFSTR("endOfRaceTimeThreshold"), v147);
  objc_msgSend_nearestNeighborMaximumAcceptedDistance(self, v148, v149, v150);
  objc_msgSend_encodeDouble_forKey_(a3, v151, (uint64_t)CFSTR("nearestNeighborMaximumAcceptedDistance"), v152);
}

- (CLRacingRouteVariables)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  unsigned int v38;
  const char *v39;
  uint64_t v40;
  unsigned int v41;
  const char *v42;
  uint64_t v43;
  unsigned int v44;
  const char *v45;
  uint64_t v46;
  unsigned int v47;
  const char *v48;
  uint64_t v49;
  unsigned int v50;
  const char *v51;
  uint64_t v52;
  unsigned int v53;
  const char *v54;
  uint64_t v55;
  unsigned int v56;
  const char *v57;
  uint64_t v58;
  unsigned int v59;
  const char *v60;
  uint64_t v61;
  int v62;
  const char *v63;
  uint64_t v64;
  double v65;
  double v66;
  const char *v67;
  uint64_t v68;
  double v69;
  double v70;
  const char *v71;
  uint64_t v72;
  double v73;
  double v74;
  const char *v75;
  uint64_t v76;
  double v77;
  double v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  double v82;
  uint64_t v84;
  int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  char v90;
  char v91;
  char v92;
  char v93;
  char v94;
  char v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  CLRacingRouteVariables *v102;

  v102 = [CLRacingRouteVariables alloc];
  v101 = objc_msgSend_decodeBoolForKey_(a3, v4, (uint64_t)CFSTR("raceStartPointDetected"), v5);
  v100 = objc_msgSend_decodeBoolForKey_(a3, v6, (uint64_t)CFSTR("raceEndPointDetected"), v7);
  v99 = objc_msgSend_decodeBoolForKey_(a3, v8, (uint64_t)CFSTR("userIsOffRoute"), v9);
  v98 = objc_msgSend_decodeBoolForKey_(a3, v10, (uint64_t)CFSTR("projectedOnNearestPoint"), v11);
  v97 = objc_msgSend_decodeBoolForKey_(a3, v12, (uint64_t)CFSTR("raceSessionExpired"), v13);
  v96 = objc_msgSend_decodeBoolForKey_(a3, v14, (uint64_t)CFSTR("rollingBufferReachedEndOfReferenceRoute"), v15);
  v95 = objc_msgSend_decodeBoolForKey_(a3, v16, (uint64_t)CFSTR("routeConfigurationSuccessful"), v17);
  v94 = objc_msgSend_decodeBoolForKey_(a3, v18, (uint64_t)CFSTR("racingRouteAnalyticsSent"), v19);
  v93 = objc_msgSend_decodeBoolForKey_(a3, v20, (uint64_t)CFSTR("prematureRaceEndDetected"), v21);
  v92 = objc_msgSend_decodeBoolForKey_(a3, v22, (uint64_t)CFSTR("referenceRouteTotalLengthDetermined"), v23);
  v91 = objc_msgSend_decodeBoolForKey_(a3, v24, (uint64_t)CFSTR("locationPointIsOutsideOfAcceptedRange"), v25);
  v90 = objc_msgSend_decodeBoolForKey_(a3, v26, (uint64_t)CFSTR("locationPointNotMatched"), v27);
  v89 = objc_msgSend_decodeIntForKey_(a3, v28, (uint64_t)CFSTR("routePointsBufferSize"), v29);
  v88 = objc_msgSend_decodeIntForKey_(a3, v30, (uint64_t)CFSTR("numberOfRoutePointsToAdd"), v31);
  v87 = objc_msgSend_decodeIntForKey_(a3, v32, (uint64_t)CFSTR("offRouteGraceDuration"), v33);
  v86 = objc_msgSend_decodeIntForKey_(a3, v34, (uint64_t)CFSTR("matchedPointCounter"), v35);
  v38 = objc_msgSend_decodeIntForKey_(a3, v36, (uint64_t)CFSTR("referenceRouteDataPointCounter"), v37);
  v41 = objc_msgSend_decodeIntForKey_(a3, v39, (uint64_t)CFSTR("currentRouteDataPointCounter"), v40);
  v44 = objc_msgSend_decodeIntForKey_(a3, v42, (uint64_t)CFSTR("offRouteDataPointCounter"), v43);
  v47 = objc_msgSend_decodeIntForKey_(a3, v45, (uint64_t)CFSTR("inutileDataPointCounter"), v46);
  v50 = objc_msgSend_decodeIntForKey_(a3, v48, (uint64_t)CFSTR("rollingBufferUpdateCounter"), v49);
  v53 = objc_msgSend_decodeIntForKey_(a3, v51, (uint64_t)CFSTR("lastMatchedPointIndex"), v52);
  v56 = objc_msgSend_decodeIntForKey_(a3, v54, (uint64_t)CFSTR("lastMatchedPointIndexOnReferenceRoute"), v55);
  v59 = objc_msgSend_decodeIntForKey_(a3, v57, (uint64_t)CFSTR("rollingBufferStartIndexOnReferenceRoute"), v58);
  v62 = objc_msgSend_decodeIntForKey_(a3, v60, (uint64_t)CFSTR("matrixCellIndexForLastMatchedPoint"), v61);
  objc_msgSend_decodeDoubleForKey_(a3, v63, (uint64_t)CFSTR("referenceRouteTotalLength"), v64);
  v66 = v65;
  objc_msgSend_decodeDoubleForKey_(a3, v67, (uint64_t)CFSTR("timestampOfLastMatchedPointOnReferenceRoute"), v68);
  v70 = v69;
  objc_msgSend_decodeDoubleForKey_(a3, v71, (uint64_t)CFSTR("registeredTimeAtThresholdDistance"), v72);
  v74 = v73;
  objc_msgSend_decodeDoubleForKey_(a3, v75, (uint64_t)CFSTR("endOfRaceTimeThreshold"), v76);
  v78 = v77;
  objc_msgSend_decodeDoubleForKey_(a3, v79, (uint64_t)CFSTR("nearestNeighborMaximumAcceptedDistance"), v80);
  v85 = v62;
  BYTE5(v84) = v90;
  BYTE4(v84) = v91;
  BYTE3(v84) = v92;
  BYTE2(v84) = v93;
  BYTE1(v84) = v94;
  LOBYTE(v84) = v95;
  return (CLRacingRouteVariables *)objc_msgSend_initWithRaceStartPointDetected_raceEndPointDetected_userIsOffRoute_projectedOnNearestPoint_raceSessionExpired_rollingBufferReachedEndOfReferenceRoute_routeConfigurationSuccessful_racingRouteAnalyticsSent_prematureRaceEndDetected_referenceRouteTotalLengthDetermined_locationPointIsOutsideOfAcceptedRange_locationPointNotMatched_routePointsBufferSize_numberOfRoutePointsToAdd_offRouteGraceDuration_matchedPointCounter_referenceRouteDataPointCounter_currentRouteDataPointCounter_offRouteDataPointCounter_inutileDataPointCounter_rollingBufferUpdateCounter_lastMatchedPointIndex_lastMatchedPointIndexOnReferenceRoute_rollingBufferStartIndexOnReferenceRoute_matrixCellIndexForLastMatchedPoint_referenceRouteTotalLength_timestampOfLastMatchedPointOnReferenceRoute_registeredTimeAtThresholdDistance_endOfRaceTimeThreshold_nearestNeighborMaximumAcceptedDistance_(v102, v81, v101, v100, v99, v98, v97, v96, v66, v70, v74, v78, v82, v84, __PAIR64__(v88, v89), __PAIR64__(v86, v87), __PAIR64__(v41, v38), __PAIR64__(v47, v44), __PAIR64__(v53, v50),
                                     __PAIR64__(v59, v56),
                                     v85);
}

- (BOOL)raceStartPointDetected
{
  return self->_raceStartPointDetected;
}

- (BOOL)raceEndPointDetected
{
  return self->_raceEndPointDetected;
}

- (BOOL)userIsOffRoute
{
  return self->_userIsOffRoute;
}

- (BOOL)projectedOnNearestPoint
{
  return self->_projectedOnNearestPoint;
}

- (BOOL)raceSessionExpired
{
  return self->_raceSessionExpired;
}

- (BOOL)rollingBufferReachedEndOfReferenceRoute
{
  return self->_rollingBufferReachedEndOfReferenceRoute;
}

- (BOOL)routeConfigurationSuccessful
{
  return self->_routeConfigurationSuccessful;
}

- (BOOL)racingRouteAnalyticsSent
{
  return self->_racingRouteAnalyticsSent;
}

- (BOOL)prematureRaceEndDetected
{
  return self->_prematureRaceEndDetected;
}

- (BOOL)referenceRouteTotalLengthDetermined
{
  return self->_referenceRouteTotalLengthDetermined;
}

- (BOOL)locationPointIsOutsideOfAcceptedRange
{
  return self->_locationPointIsOutsideOfAcceptedRange;
}

- (BOOL)locationPointNotMatched
{
  return self->_locationPointNotMatched;
}

- (int)routePointsBufferSize
{
  return self->_routePointsBufferSize;
}

- (int)numberOfRoutePointsToAdd
{
  return self->_numberOfRoutePointsToAdd;
}

- (int)offRouteGraceDuration
{
  return self->_offRouteGraceDuration;
}

- (int)matchedPointCounter
{
  return self->_matchedPointCounter;
}

- (int)referenceRouteDataPointCounter
{
  return self->_referenceRouteDataPointCounter;
}

- (int)currentRouteDataPointCounter
{
  return self->_currentRouteDataPointCounter;
}

- (int)offRouteDataPointCounter
{
  return self->_offRouteDataPointCounter;
}

- (int)inutileDataPointCounter
{
  return self->_inutileDataPointCounter;
}

- (int)rollingBufferUpdateCounter
{
  return self->_rollingBufferUpdateCounter;
}

- (int)lastMatchedPointIndex
{
  return self->_lastMatchedPointIndex;
}

- (int)lastMatchedPointIndexOnReferenceRoute
{
  return self->_lastMatchedPointIndexOnReferenceRoute;
}

- (int)rollingBufferStartIndexOnReferenceRoute
{
  return self->_rollingBufferStartIndexOnReferenceRoute;
}

- (int)matrixCellIndexForLastMatchedPoint
{
  return self->_matrixCellIndexForLastMatchedPoint;
}

- (double)referenceRouteTotalLength
{
  return self->_referenceRouteTotalLength;
}

- (double)timestampOfLastMatchedPointOnReferenceRoute
{
  return self->_timestampOfLastMatchedPointOnReferenceRoute;
}

- (double)registeredTimeAtThresholdDistance
{
  return self->_registeredTimeAtThresholdDistance;
}

- (double)endOfRaceTimeThreshold
{
  return self->_endOfRaceTimeThreshold;
}

- (double)nearestNeighborMaximumAcceptedDistance
{
  return self->_nearestNeighborMaximumAcceptedDistance;
}

@end
